unit UCAD_PUBLICO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ufrm, StdCtrls, ComCtrls, Buttons, ExtCtrls, Mask, EditLabel,
  UComponentTag, DB;

type
  TfrmCAD_PUBLICO = class(Tfrm)
    txtCodPublico: TEditLabel;
    txtNomPublico: TEditLabel;
    txtObs: TMemoTag;
    tabPrinc: TPageControl;
    tab1: TTabSheet;
    chkAtivo: TCheckBoxTag;
    edtNOM_CIDADE: TEditLabel;
    edtNOM_UF: TEditLabel;
    txtNomRua: TEditLabel;
    edtNOM_BAIRRO: TEditLabel;
    txtCelular: TEditLabel;
    txtTelResidencial: TEditLabel;
    txtTelComercial: TEditLabel;
    edtNOM_BANCO: TEditLabel;
    edtNUM_AGENCIA: TEditLabel;
    edtNUM_RAMAL: TEditLabel;
    edtNUM_CONTA: TEditLabel;
    optCEP: TEditLabel;
    procedure FormCreate(Sender: TObject);
    procedure txtCodPublicoEnter(Sender: TObject);
    procedure txtCodPublicoChange(Sender: TObject);
    procedure txtCodPublicoClickButton(Sender: TObject);
    procedure txtCodPublicoExit(Sender: TObject);
    procedure edtCOD_CIDADEClickButton(Sender: TObject);
    procedure chkAtivoClick(Sender: TObject);
  private
    function PesquisaNova(Sender: TObject; blnValida: boolean; Msg: boolean = true): boolean;
  public
    
  end;

var
  frmCAD_PUBLICO: TfrmCAD_PUBLICO;

implementation

uses UPesquisa;

{$R *.dfm}

procedure TfrmCAD_PUBLICO.FormCreate(Sender: TObject);
begin
  Tabela := 'CAD_PUBLICO';
  inherited;
end;

procedure TfrmCAD_PUBLICO.txtCodPublicoEnter(Sender: TObject);
begin
  inherited;
  ProximoNumero(txtCodPublico);
end;

procedure TfrmCAD_PUBLICO.txtCodPublicoChange(Sender: TObject);
begin
  inherited;
  ProximoNumero(txtCodPublico);
end;

function TfrmCAD_PUBLICO.PesquisaNova(Sender: TObject;
    blnValida: boolean; Msg: boolean = true): boolean;
var Edt      : TEditlabel;
    EdtN     : TEdit;
    Pesquisa : TPesquisa;
    str      : array[0..2] of string;

begin
  Edt := Sender as TEditLabel;
  EdtN:= Edt._Edit;

  if (Edt._Campo = 'COD_PUBLICO') then
  begin
    str[0] := 'COD_PUBLICO,NOM_PUBLICO';
    str[1] := 'CAD_PUBLICO';
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

  {if (not Result) and (blnValida) and (Edt.Visible) and (Edt.Enabled) then
    Edt.SetFocus;}

  Pesquisa.Free;
end;


procedure TfrmCAD_PUBLICO.txtCodPublicoClickButton(Sender: TObject);
begin
  inherited;
  PesquisaNova(Sender,false,false);
end;

procedure TfrmCAD_PUBLICO.txtCodPublicoExit(Sender: TObject);
begin
  inherited;
  PesquisaNova(Sender,true,false); 
end;

procedure TfrmCAD_PUBLICO.edtCOD_CIDADEClickButton(Sender: TObject);
begin
  inherited;
  PesquisaNova(Sender,false);
end;

procedure TfrmCAD_PUBLICO.chkAtivoClick(Sender: TObject);
begin
  inherited;
  if chkAtivo.Checked = true then
    chkAtivo.Font.Color := clWindowText
  else
    chkAtivo.Font.Color := clRed;
end;


end.
