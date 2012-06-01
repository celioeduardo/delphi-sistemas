unit UCAD_PRODUTO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ufrm, StdCtrls, ComCtrls, Buttons, ExtCtrls, Mask, EditLabel,
  UComponentTag;

type
  TfrmCAD_PRODUTO = class(Tfrm)
    edtCOD_PRODUTO: TEditLabel;
    edtNOM_PRODUTO: TEditLabel;
    edtCOD_APRESENTACAO: TEditLabel;
    edtNOM_APRESENTACAO: TEditTag;
    edtCOD_P_ATIVO: TEditLabel;
    edtNOM_P_ATIVO: TEditTag;
    edtCOD_FORNECEDOR: TEditLabel;
    edtNOM_FORNECEDOR: TEditTag;
    edtQTD_MAXIMO: TEditLabel;
    edtQTD_MINIMO: TEditLabel;
    edtQTD_FISICO_ANT: TEditLabel;
    edtVAL_FISICO_ANT: TEditLabel;
    chkFLG_ATIVO: TCheckBoxTag;
    edtDAT_IMPLANTACAO: TEditLabel;
    edtQTD_FISICO: TEditLabel;
    edtVAL_FINAN: TEditLabel;
    procedure FormCreate(Sender: TObject);
    procedure edtCOD_PRODUTOChange(Sender: TObject);
    procedure edtCOD_PRODUTOEnter(Sender: TObject);
    procedure edtCOD_APRESENTACAOClickButton(Sender: TObject);
    procedure edtCOD_P_ATIVOClickButton(Sender: TObject);
    procedure edtCOD_FORNECEDORClickButton(Sender: TObject);
    procedure edtCOD_APRESENTACAOExit(Sender: TObject);
    procedure edtCOD_P_ATIVOExit(Sender: TObject);
    procedure edtCOD_FORNECEDORExit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnAlteraClick(Sender: TObject);
    procedure btnIncluiClick(Sender: TObject);
    procedure edtCOD_PRODUTOClickButton(Sender: TObject);
  private
    function PesquisaNova(Sender: TObject; blnValida,
      Msg: boolean): boolean;
  public
    { Public declarations }
  end;

var
  frmCAD_PRODUTO: TfrmCAD_PRODUTO;

implementation

{$R *.dfm}

uses UPESQUISA, UCAD_APRESENTACAO, UEstoque;

var frmCAD_APRESENTACAO: TfrmCAD_APRESENTACAO;

procedure TfrmCAD_PRODUTO.FormCreate(Sender: TObject);
begin
  inherited;
  Tabela := 'CAD_PRODUTO';
end;

procedure TfrmCAD_PRODUTO.edtCOD_PRODUTOChange(Sender: TObject);
begin
  inherited;
  ProximoNumero(edtCOD_PRODUTO);
end;

procedure TfrmCAD_PRODUTO.edtCOD_PRODUTOEnter(Sender: TObject);
begin
  inherited;
  ProximoNumero(edtCOD_PRODUTO);
end;

function TfrmCAD_PRODUTO.PesquisaNova(Sender: TObject; blnValida,
  Msg: boolean): boolean;
var Edt      : TEditlabel;
    EdtN     : TEdit;
    Pesquisa : TPesquisa;
    str      : array[0..2] of string;

begin
  Edt := Sender as TEditLabel;
  EdtN:= Edt._Edit;

  if (Edt._Campo = 'COD_PRODUTO') then
  begin
    str[0] := 'COD_PRODUTO,NOM_PRODUTO';
    str[1] := 'VW_PRODUTO';
    str[2] := EmptyStr;
  end
  else if (Edt._Campo = 'COD_APRESENTACAO') then
  begin
    str[0] := 'COD_APRESENTACAO,NOM_APRESENTACAO';
    str[1] := 'CAD_APRESENTACAO';
    str[2] := EmptyStr;
  end
  else if (Edt._Campo = 'COD_P_ATIVO') then
  begin
    str[0] := 'COD_P_ATIVO,NOM_P_ATIVO';
    str[1] := 'CAD_P_ATIVO';
    str[2] := EmptyStr;
  end
  else if (Edt._Campo = 'COD_FORNECEDOR') then
  begin
    str[0] := 'COD_FORNECEDOR,NOM_FORNECEDOR';
    str[1] := 'CAD_FORNECEDOR';
    str[2] := EmptyStr;
  end
  else
    Exit;

  Pesquisa := TPesquisa.Create;
  Result := Pesquisa.ExecutaPesquisa(blnValida,str[0],str[1],Edt,EdtN,str[2],Msg);

  Pesquisa.Free;
end;

procedure TfrmCAD_PRODUTO.edtCOD_APRESENTACAOClickButton(Sender: TObject);
begin
  inherited;
  PesquisaNova(Sender,false,true);
end;

procedure TfrmCAD_PRODUTO.edtCOD_P_ATIVOClickButton(Sender: TObject);
begin
  inherited;
  PesquisaNova(Sender,false,true);
end;

procedure TfrmCAD_PRODUTO.edtCOD_FORNECEDORClickButton(Sender: TObject);
begin
  inherited;
    PesquisaNova(Sender,false,true);
end;

procedure TfrmCAD_PRODUTO.edtCOD_APRESENTACAOExit(Sender: TObject);
begin
  inherited;
  if not PesquisaNova(Sender,true,true) then
    edtCOD_APRESENTACAO.SetFocus;

end;

procedure TfrmCAD_PRODUTO.edtCOD_P_ATIVOExit(Sender: TObject);
begin
  inherited;
  if not PesquisaNova(Sender,true,true) then
    edtCOD_P_ATIVO.SetFocus;
end;

procedure TfrmCAD_PRODUTO.edtCOD_FORNECEDORExit(Sender: TObject);
begin
  inherited;
  if not PesquisaNova(Sender,true,true) then
    edtCOD_FORNECEDOR.SetFocus;
end;

procedure TfrmCAD_PRODUTO.Button1Click(Sender: TObject);
begin
  inherited;
  frmCAD_APRESENTACAO := TfrmCAD_APRESENTACAO.Create(Self);
  frmCAD_APRESENTACAO.FormStyle := fsNormal;
  frmCAD_APRESENTACAO.Show;
end;

procedure TfrmCAD_PRODUTO.btnAlteraClick(Sender: TObject);
var
  str: String;
  est: TEstoque;
begin
  if btnaltera.Enabled then
  begin
    try
      str := MontaSql(tpUpdate);
      GravaBanco(tpUpdate,str,false);
      Screen.Cursor := crHourGlass;
      est := TEstoque.Create;
      est.ProcessaMovimentacao(1,1,StrToInt(edtCOD_PRODUTO.Text));
      HabilitaEdicao(false);
    finally
        Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TfrmCAD_PRODUTO.btnIncluiClick(Sender: TObject);
var
  str: String;
  est: TEstoque;
begin
  if btnInclui.Enabled then
  begin
    try
      str := MontaSql(tpInsert);
      GravaBanco(tpInsert,str,false);
      Screen.Cursor := crHourGlass;
      est := TEstoque.Create;
      est.ProcessaMovimentacao(1,1,StrToInt(edtCOD_PRODUTO.Text));
      HabilitaEdicao(false);
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TfrmCAD_PRODUTO.edtCOD_PRODUTOClickButton(Sender: TObject);
begin
  inherited;
  PesquisaNova(Sender,false,false);
end;

end.
