unit UCAD_PARTE_SALA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmLeftRigth, StdCtrls, Grids, DBGrids, Buttons, ComCtrls,
  ExtCtrls, UComponentTag, Mask, EditLabel;

type
  TfrmCAD_PARTE_SALA = class(TfrmLeftRigth)
    edtCOD_SALA: TEditLabel;
    edtNOM_PARTE: TEditTag;
    procedure FormCreate(Sender: TObject);
    procedure edtCOD_SALAClickButton(Sender: TObject);
    procedure edtCOD_SALAExit(Sender: TObject);
    procedure btnIncluiTodosClick(Sender: TObject);
    procedure btnExcluiTodosClick(Sender: TObject);
    procedure edtCOD_SALAChange(Sender: TObject);
  private
    function PesquisaNova(Sender: TObject;
      blnValida: boolean; Msg: boolean = true): boolean;
  public
    { Public declarations }
  end;

var
  frmCAD_PARTE_SALA: TfrmCAD_PARTE_SALA;

implementation

uses UPesquisa, Ufrm;

{$R *.dfm}

function TfrmCAD_PARTE_SALA.PesquisaNova(Sender: TObject;
    blnValida: boolean; Msg: boolean = true): boolean;
var Edt      : TEditlabel;
    EdtN     : TEdit;
    Pesquisa : TPesquisa;
    str      : array[0..2] of string;

begin
  Edt := Sender as TEditLabel;
  EdtN:= Edt._Edit;

  if (Edt._Campo = 'COD_SALA') then
  begin
    str[0] := 'COD_SALA,NOM_SALA';
    str[1] := 'CAD_SALA';
    str[2] := EmptyStr;
  end
  else
    Exit;

  Pesquisa := TPesquisa.Create;
  Result := Pesquisa.ExecutaPesquisa(blnValida,str[0],str[1],Edt,EdtN,str[2],Msg);
  Pesquisa.Free;
end;


procedure TfrmCAD_PARTE_SALA.FormCreate(Sender: TObject);
begin
  inherited;
  TitleCodigo := 'Código';
  TitleNome := 'Parte';
  CampoGrid := 'COD_TP_PARTE';
  Tabela := 'CAD_PARTE_SALA';
  SqlEsquerda := 'Select '+
                 '  A.COD_TP_PARTE,'+
                 '  A.NOM_TP_PARTE'+
                 ' From '+
                 '  CAD_TP_PARTE A'+
                 ' Where '+
                 '  A.COD_TP_PARTE Not In('+
                 '    Select COD_TP_PARTE From CAD_PARTE_SALA ';
  SqlDireita := 'Select '+
                 '  A.COD_TP_PARTE,'+
                 '  A.NOM_TP_PARTE'+
                 ' From '+
                 '  CAD_TP_PARTE A'+
                 ' Where '+
                 '  A.COD_TP_PARTE In('+
                 '    Select COD_TP_PARTE From CAD_PARTE_SALA ';

end;

procedure TfrmCAD_PARTE_SALA.edtCOD_SALAClickButton(Sender: TObject);
begin
  inherited;
  PesquisaNova(edtCOD_SALA,false);
end;

procedure TfrmCAD_PARTE_SALA.edtCOD_SALAExit(Sender: TObject);
begin
  inherited;
  if not PesquisaNova(edtCOD_SALA,true) then
    edtCOD_SALA.SetFocus;
end;

procedure TfrmCAD_PARTE_SALA.btnIncluiTodosClick(Sender: TObject);
var str: string;
begin
  inherited;
  str := 'Insert Into CAD_PARTE_SALA'+
         '  Select COD_TP_PARTE,'+cnn.Aspas(edtCOD_SALA.Text)+
         '    From '+
         '      CAD_TP_PARTE '+
         '    Where '+
         '      COD_TP_PARTE Not In ('+
         '      Select COD_TP_PARTE From CAD_PARTE_SALA'+
         '        Where COD_SALA = '+cnn.Aspas(edtCOD_SALA.Text)+')';
  if cnn.Execute(str) > 0 then
    txtHabilitaEdicaoEnter(Sender);
end;

procedure TfrmCAD_PARTE_SALA.btnExcluiTodosClick(Sender: TObject);
var str: string;
begin
  inherited;
  str := 'Delete From CAD_PARTE_SALA'+
         '  Where '+
         '    COD_SALA = '+cnn.Aspas(edtCOD_SALA.Text);
  if cnn.Execute(str) > 0 then
    txtHabilitaEdicaoEnter(Sender);
end;

procedure TfrmCAD_PARTE_SALA.edtCOD_SALAChange(Sender: TObject);
begin
  inherited;
  grdLeft.DataSource := nil;
  grdRight.DataSource := nil;
end;

end.
