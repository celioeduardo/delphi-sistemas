unit UCAD_PRECO_COMPRA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ufrm, UComponentTag, Mask, EditLabel, StdCtrls, ComCtrls,
  Buttons, ExtCtrls;

type
  TfrmCAD_PRECO_COMPRA = class(Tfrm)
    edtCOD_PRODUTO: TEditLabel;
    edtNOM_PRODUTO: TEditTag;
    edtDAT_PRECO: TEditLabel;
    edtVAL_PRECO: TEditLabel;
    procedure FormCreate(Sender: TObject);
    procedure edtCOD_PRODUTOExit(Sender: TObject);
    procedure edtCOD_PRODUTOClickButton(Sender: TObject);
    procedure edtDAT_PRECOEnter(Sender: TObject);
  private
    function PesquisaNova(Sender: TObject; blnValida,
      Msg: boolean): boolean;
  public
    { Public declarations }
  end;

var
  frmCAD_PRECO_COMPRA: TfrmCAD_PRECO_COMPRA;

implementation

{$R *.dfm}

uses UPesquisa;

procedure TfrmCAD_PRECO_COMPRA.FormCreate(Sender: TObject);
begin
  inherited;
  Tabela := 'CAD_PRECO_COMPRA';
end;

function TfrmCAD_PRECO_COMPRA.PesquisaNova(Sender: TObject; blnValida,
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
  else
    Exit;

  Pesquisa := TPesquisa.Create;
  Result := Pesquisa.ExecutaPesquisa(blnValida,str[0],str[1],Edt,EdtN,str[2],Msg);

  Pesquisa.Free;
end;


procedure TfrmCAD_PRECO_COMPRA.edtCOD_PRODUTOExit(Sender: TObject);
begin
  inherited;
  if not PesquisaNova(Sender,true,true) then
    if edtCOD_PRODUTO.Enabled then
      edtCOD_PRODUTO.SetFocus;
end;

procedure TfrmCAD_PRECO_COMPRA.edtCOD_PRODUTOClickButton(Sender: TObject);
begin
  inherited;
  PesquisaNova(Sender,false,false);
end;

procedure TfrmCAD_PRECO_COMPRA.edtDAT_PRECOEnter(Sender: TObject);
begin
  inherited;
  if trim(edtDAT_PRECO.FormattedText) = '' then
  begin
    edtDAT_PRECO.Text := DateToStr(Date);
    edtDAT_PRECO.SelectAll;
  end;
end;

end.
