unit UCAD_PARTE_PONTO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmLeftRigth, StdCtrls, Grids, DBGrids, Buttons, ComCtrls,
  ExtCtrls, UComponentTag, Mask, EditLabel;

type
  TfrmCAD_PARTE_PONTO = class(TfrmLeftRigth)
    edtCOD_PARTE: TEditLabel;
    edtNOM_PARTE: TEditTag;
    GroupBox1: TGroupBox;
    optMasculino: TRadioButtonTag;
    optFeminino: TRadioButtonTag;
    procedure FormCreate(Sender: TObject);
    procedure edtCOD_PARTEClickButton(Sender: TObject);
    procedure edtCOD_PARTEExit(Sender: TObject);
    procedure btnIncluiTodosClick(Sender: TObject);
    procedure btnExcluiTodosClick(Sender: TObject);
    procedure edtCOD_PARTEChange(Sender: TObject);
  private
    function PesquisaNova(Sender: TObject;
        blnValida: boolean; Msg: boolean = true): boolean;
    function RetornaSexo: string;    
  public
    { Public declarations }
  end;

var
  frmCAD_PARTE_PONTO: TfrmCAD_PARTE_PONTO;

implementation

uses UPesquisa, Ufrm;

{$R *.dfm}

function TfrmCAD_PARTE_PONTO.PesquisaNova(Sender: TObject;
    blnValida: boolean; Msg: boolean = true): boolean;
var Edt      : TEditlabel;
    EdtN     : TEdit;
    Pesquisa : TPesquisa;
    str      : array[0..2] of string;

begin
  Edt := Sender as TEditLabel;
  EdtN:= Edt._Edit;

  if (Edt._Campo = 'COD_TP_PARTE') then
  begin
    str[0] := 'COD_TP_PARTE,NOM_TP_PARTE';
    str[1] := 'CAD_TP_PARTE';
    str[2] := EmptyStr;
  end
  else
    Exit;

  Pesquisa := TPesquisa.Create;
  Result := Pesquisa.ExecutaPesquisa(blnValida,str[0],str[1],Edt,EdtN,str[2],Msg);
  Pesquisa.Free;
end;

procedure TfrmCAD_PARTE_PONTO.FormCreate(Sender: TObject);
begin
  inherited;
  TitleCodigo := 'Código';
  TitleNome := 'Ponto';
  CampoGrid := 'COD_PONTO';
  Tabela := 'CAD_PARTE_PONTO';
  SqlEsquerda := 'Select '+
                 '  A.COD_PONTO,'+
                 '  A.NOM_PONTO'+
                 ' From '+
                 '  CAD_PONTO A'+
                 ' Where '+
                 '  A.COD_PONTO Not In('+
                 '    Select COD_PONTO From CAD_PARTE_PONTO '{+
                 '      Where COD_TP_PARTE = '+edtCOD_PARTE.Text+')'};
  SqlDireita := 'Select '+
                 '  A.COD_PONTO,'+
                 '  A.NOM_PONTO'+
                 ' From '+
                 '  CAD_PONTO A'+
                 ' Where '+
                 '  A.COD_PONTO In('+
                 '    Select COD_PONTO From CAD_PARTE_PONTO '{+
                 '      Where COD_TP_PARTE = '+edtCOD_PARTE.Text+')'};

end;

procedure TfrmCAD_PARTE_PONTO.edtCOD_PARTEClickButton(Sender: TObject);
begin
  inherited;
  PesquisaNova(Sender,false);
end;

procedure TfrmCAD_PARTE_PONTO.edtCOD_PARTEExit(Sender: TObject);
begin
  inherited;
  if not PesquisaNova(Sender,true) then
    edtCOD_PARTE.SetFocus;
end;

procedure TfrmCAD_PARTE_PONTO.btnIncluiTodosClick(Sender: TObject);
var str: string;
begin
  inherited;
  str := 'Insert Into CAD_PARTE_PONTO'+
         '  Select '+edtCOD_PARTE.Text+', COD_PONTO,'+ cnn.Aspas(RetornaSexo)+
         '    From '+
         '      CAD_PONTO '+
         '    Where '+
         '      COD_PONTO Not In ('+
         '      Select COD_PONTO From CAD_PARTE_PONTO'+
         '        Where COD_TP_PARTE = '+edtCOD_PARTE.Text+' And '+
         '              FLG_SEXO = ' + cnn.Aspas(RetornaSexo) +  ')';
  if cnn.Execute(str) > 0 then
    txtHabilitaEdicaoEnter(Sender);
end;

procedure TfrmCAD_PARTE_PONTO.btnExcluiTodosClick(Sender: TObject);
var str: string;
begin
  inherited;
  str := 'Delete From CAD_PARTE_PONTO'+
         '  Where '+
         '    COD_TP_PARTE = '+edtCOD_PARTE.Text+' And '+
         '    FLG_SEXO = '+cnn.Aspas(RetornaSexo);
  if cnn.Execute(str) > 0 then
    txtHabilitaEdicaoEnter(Sender);
end;

procedure TfrmCAD_PARTE_PONTO.edtCOD_PARTEChange(Sender: TObject);
begin
  inherited;
  grdLeft.DataSource := nil;
  grdRight.DataSource := nil;
end;

function TfrmCAD_PARTE_PONTO.RetornaSexo: string;
begin
  if optMasculino.Checked then
    result := 'M'
  else
    result := 'F';
end;

end.
