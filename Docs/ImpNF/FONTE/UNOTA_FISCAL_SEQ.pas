unit UNOTA_FISCAL_SEQ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ufrm, StdCtrls, ComCtrls, Buttons, ExtCtrls, Mask, EditLabel,
  UComponentTag;

type
  TfrmNOTA_FISCAL_SEQ = class(Tfrm)
    edtNomEmpresa: TEditTag;
    edtNumSeq: TEditLabel;
    edtCodEmpresa: TEditLabel;
    edtNomSerie: TEditLabel;
    procedure FormCreate(Sender: TObject);
    procedure edtCodEmpresaClickButton(Sender: TObject);
    procedure edtCodEmpresaExit(Sender: TObject);
  private
    function PesquisaNova(Sender: TObject;
      blnValida: boolean = false; blnMsg: boolean = true): boolean;
  public
    { Public declarations }
  end;

var
  frmNOTA_FISCAL_SEQ: TfrmNOTA_FISCAL_SEQ;

implementation

uses UPesquisa;

{$R *.dfm}

procedure TfrmNOTA_FISCAL_SEQ.FormCreate(Sender: TObject);
begin
  inherited;
  Tabela := 'NOTA_FISCAL_SEQ';
end;

function TfrmNOTA_FISCAL_SEQ.PesquisaNova(Sender: TObject;
  blnValida: boolean = false; blnMsg: boolean = true): boolean;
var Edt      : TEditlabel;
    EdtN     : TEdit;
    Pesquisa : TPesquisa;
    str      : array[0..2] of string;

begin
  Edt := Sender as TEditLabel;
  EdtN:= Edt._Edit;

  if (UpperCase(Edt._Campo) = 'COD_EMPRESA') then
  begin
    str[0] := 'COD_EMPRESA,NOM_EMPRESA';
    str[1] := 'CAD_EMPRESA';
    str[2] := EmptyStr;
  end
  else
  begin
    Result := true;
    Exit;
  end;

  Pesquisa := TPesquisa.Create;
  Result := Pesquisa.ExecutaPesquisa(blnValida,str[0],str[1],Edt,EdtN,str[2],blnMsg);

  if (not Result) and (blnValida) and (Edt.Visible) and (Edt.Enabled) then
    Edt.SetFocus;
    
  Pesquisa.Free;
end;


procedure TfrmNOTA_FISCAL_SEQ.edtCodEmpresaClickButton(Sender: TObject);
begin
  inherited;
  PesquisaNova(edtCodEmpresa);
end;

procedure TfrmNOTA_FISCAL_SEQ.edtCodEmpresaExit(Sender: TObject);
begin
  inherited;
  PesquisaNova(edtCodEmpresa,true);
end;

end.
