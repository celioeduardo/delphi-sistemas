unit UCAD_FORNECEDOR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ufrm, StdCtrls, ComCtrls, Buttons, ExtCtrls, Mask, EditLabel,
  UComponentTag;

type
  TfrmCAD_FORNECEDOR = class(Tfrm)
    edtCOD_FORNECEDOR: TEditLabel;
    edtNOM_FORNECEDOR: TEditLabel;
    edtNOM_RUA: TEditLabel;
    edtNOM_BAIRRO: TEditLabel;
    edtNUM_CEP: TEditLabel;
    edtCOD_CIDADE: TEditLabel;
    edtNOM_CIDADE: TEditTag;
    edtNUM_FONE: TEditLabel;
    edtNUM_FAX: TEditLabel;
    edtNOM_EMAIL: TEditLabel;
    edtNOM_CONTATO: TEditLabel;
    edtNOM_GERENTE: TEditLabel;
    edtNOM_FORN_RESUMIDO: TEditLabel;
    procedure FormCreate(Sender: TObject);
    procedure edtCOD_FORNECEDORChange(Sender: TObject);
    procedure edtCOD_FORNECEDOREnter(Sender: TObject);
    procedure edtCOD_FORNECEDORClickButton(Sender: TObject);
    procedure edtCOD_CIDADEClickButton(Sender: TObject);
    procedure edtCOD_CIDADEExit(Sender: TObject);
  private
    function PesquisaNova(Sender: TObject; blnValida,
      Msg: boolean): boolean;
  public
    { Public declarations }
  end;

var
  frmCAD_FORNECEDOR: TfrmCAD_FORNECEDOR;

implementation

{$R *.dfm}

uses UPESQUISA;

procedure TfrmCAD_FORNECEDOR.FormCreate(Sender: TObject);
begin
  inherited;
  Tabela := 'CAD_FORNECEDOR';
end;

procedure TfrmCAD_FORNECEDOR.edtCOD_FORNECEDORChange(Sender: TObject);
begin
  inherited;
  ProximoNumero(edtCOD_FORNECEDOR);
end;

procedure TfrmCAD_FORNECEDOR.edtCOD_FORNECEDOREnter(Sender: TObject);
begin
  inherited;
  ProximoNumero(edtCOD_FORNECEDOR);
end;

function TfrmCAD_FORNECEDOR.PesquisaNova(Sender: TObject; blnValida,
  Msg: boolean): boolean;
var Edt      : TEditlabel;
    EdtN     : TEdit;
    Pesquisa : TPesquisa;
    str      : array[0..2] of string;

begin
  Edt := Sender as TEditLabel;
  EdtN:= Edt._Edit;

  if (Edt._Campo = 'COD_FORNECEDOR') then
  begin
    str[0] := 'COD_FORNECEDOR,NOM_FORNECEDOR';
    str[1] := 'CAD_FORNECEDOR';
    str[2] := EmptyStr;
  end
  else if (Edt._Campo = 'COD_CIDADE') then
  begin
    str[0] := 'COD_CIDADE,NOM_CIDADE';
    str[1] := 'CAD_CIDADE';
    str[2] := EmptyStr;
  end

  else
    Exit;

  Pesquisa := TPesquisa.Create;
  Result := Pesquisa.ExecutaPesquisa(blnValida,str[0],str[1],Edt,EdtN,str[2],Msg);

  Pesquisa.Free;
end;

procedure TfrmCAD_FORNECEDOR.edtCOD_FORNECEDORClickButton(Sender: TObject);
begin
  inherited;
  PesquisaNova(Sender,false,false);
end;

procedure TfrmCAD_FORNECEDOR.edtCOD_CIDADEClickButton(Sender: TObject);
begin
  inherited;
  PesquisaNova(Sender,false,true);
end;

procedure TfrmCAD_FORNECEDOR.edtCOD_CIDADEExit(Sender: TObject);
begin
  inherited;
  PesquisaNova(Sender,true,true);
end;

end.
