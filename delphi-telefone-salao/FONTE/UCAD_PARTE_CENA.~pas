unit UCAD_PARTE_CENA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmLeftRigth, StdCtrls, Grids, DBGrids, Buttons, ComCtrls,
  ExtCtrls, UComponentTag, Mask, EditLabel;

type
  TfrmCAD_PARTE_CENA = class(TfrmLeftRigth)
    edtCOD_PARTE: TEditLabel;
    edtNOM_PARTE: TEditTag;
    procedure FormCreate(Sender: TObject);
    procedure edtCOD_PARTEClickButton(Sender: TObject);
    procedure edtCOD_PARTEExit(Sender: TObject);
    procedure btnIncluiTodosClick(Sender: TObject);
    procedure btnExcluiTodosClick(Sender: TObject);
    procedure edtCOD_PARTEChange(Sender: TObject);
  private
    function PesquisaNova(Sender: TObject;
      blnValida: boolean; Msg: boolean = true): boolean;
  public
    { Public declarations }
  end;

var
  frmCAD_PARTE_CENA: TfrmCAD_PARTE_CENA;

implementation

uses UPesquisa, Ufrm;

{$R *.dfm}
function TfrmCAD_PARTE_CENA.PesquisaNova(Sender: TObject;
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


procedure TfrmCAD_PARTE_CENA.FormCreate(Sender: TObject);
begin
  inherited;
  TitleCodigo := 'Código';
  TitleNome := 'Cena';
  CampoGrid := 'COD_CENA';
  Tabela := 'CAD_PARTE_CENA';
  SqlEsquerda := 'Select '+
                 '  A.COD_CENA,'+
                 '  A.NOM_CENA'+
                 ' From '+
                 '  CAD_CENA A'+
                 ' Where '+
                 '  A.COD_CENA Not In('+
                 '    Select COD_CENA From CAD_PARTE_CENA ';
  SqlDireita := 'Select '+
                 '  A.COD_CENA,'+
                 '  A.NOM_CENA'+
                 ' From '+
                 '  CAD_CENA A'+
                 ' Where '+
                 '  A.COD_CENA In('+
                 '    Select COD_CENA From CAD_PARTE_CENA '

end;

procedure TfrmCAD_PARTE_CENA.edtCOD_PARTEClickButton(Sender: TObject);
begin
  inherited;
  PesquisaNova(Sender,false);
end;

procedure TfrmCAD_PARTE_CENA.edtCOD_PARTEExit(Sender: TObject);
begin
  inherited;
  if not PesquisaNova(Sender,true) then
    edtCOD_PARTE.SetFocus;
end;

procedure TfrmCAD_PARTE_CENA.btnIncluiTodosClick(Sender: TObject);
var str: string;
begin
  inherited;
  str := 'Insert Into CAD_PARTE_CENA'+
         '  Select '+edtCOD_PARTE.Text+', COD_CENA'+
         '    From '+
         '      CAD_CENA '+
         '    Where '+
         '      COD_CENA Not In ('+
         '      Select COD_CENA From CAD_PARTE_CENA'+
         '        Where COD_TP_PARTE = '+edtCOD_PARTE.Text+')';
  if cnn.Execute(str) > 0 then
    txtHabilitaEdicaoEnter(Sender);
end;

procedure TfrmCAD_PARTE_CENA.btnExcluiTodosClick(Sender: TObject);
var str: string;
begin
  inherited;
  str := 'Delete From CAD_PARTE_CENA'+
         '  Where '+
         '    COD_TP_PARTE = '+edtCOD_PARTE.Text;
  if cnn.Execute(str) > 0 then
    txtHabilitaEdicaoEnter(Sender);
end;

procedure TfrmCAD_PARTE_CENA.edtCOD_PARTEChange(Sender: TObject);
begin
  inherited;
  grdLeft.DataSource := nil;
  grdRight.DataSource := nil;
end;

end.
