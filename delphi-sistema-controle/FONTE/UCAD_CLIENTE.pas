unit UCAD_CLIENTE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ufrm, StdCtrls, ComCtrls, Buttons, ExtCtrls, Mask, EditLabel,
  UComponentTag;

type
  TfrmCAD_CLIENTE = class(Tfrm)
    edtCOD_CLIENTE: TEditLabel;
    edtNOM_CLIENTE: TEditLabel;
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
    edtPER_MARGEM: TEditLabel;
    procedure FormCreate(Sender: TObject);
    procedure edtCOD_CLIENTEClickButton(Sender: TObject);
    procedure edtCOD_CLIENTEChange(Sender: TObject);
    procedure edtCOD_CLIENTEEnter(Sender: TObject);
    procedure edtCOD_CIDADEClickButton(Sender: TObject);
    procedure edtCOD_CIDADEExit(Sender: TObject);
  private
    function PesquisaNova(Sender: TObject; blnValida,
      Msg: boolean): boolean;
  public
    { Public declarations }
  end;

var
  frmCAD_CLIENTE: TfrmCAD_CLIENTE;

implementation

{$R *.dfm}

uses UPESQUISA;

procedure TfrmCAD_CLIENTE.FormCreate(Sender: TObject);
begin
  inherited;
  Tabela := 'CAD_CLIENTE';
end;

function TfrmCAD_CLIENTE.PesquisaNova(Sender: TObject; blnValida,
  Msg: boolean): boolean;
var Edt      : TEditlabel;
    EdtN     : TEdit;
    Pesquisa : TPesquisa;
    str      : array[0..2] of string;

begin
  Edt := Sender as TEditLabel;
  EdtN:= Edt._Edit;

  if (Edt._Campo = 'COD_CLIENTE') then
  begin
    str[0] := 'COD_CLIENTE,NOM_CLIENTE';
    str[1] := 'CAD_CLIENTE';
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

procedure TfrmCAD_CLIENTE.edtCOD_CLIENTEClickButton(Sender: TObject);
begin
  inherited;
  PesquisaNova(Sender,false,false);
end;

procedure TfrmCAD_CLIENTE.edtCOD_CLIENTEChange(Sender: TObject);
begin
  inherited;
  ProximoNumero(edtCOD_CLIENTE);
end;

procedure TfrmCAD_CLIENTE.edtCOD_CLIENTEEnter(Sender: TObject);
begin
  inherited;
  ProximoNumero(edtCOD_CLIENTE);
end;

procedure TfrmCAD_CLIENTE.edtCOD_CIDADEClickButton(Sender: TObject);
begin
  inherited;
  PesquisaNova(Sender,false,true);
  
end;

procedure TfrmCAD_CLIENTE.edtCOD_CIDADEExit(Sender: TObject);
begin
  inherited;
  if not PesquisaNova(Sender,true,true) then
    edtCOD_CIDADE.SetFocus;
end;

end.
