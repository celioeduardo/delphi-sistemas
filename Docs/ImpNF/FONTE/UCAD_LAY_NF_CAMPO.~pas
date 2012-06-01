unit UCAD_LAY_NF_CAMPO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ufrm, StdCtrls, ComCtrls, Buttons, ExtCtrls, UComponentTag,
  Mask, EditLabel, UPesquisa;

type
  TfrmCAD_LAY_NF_CAMPO = class(Tfrm)
    edtCodLayout: TEditLabel;
    edtNomCampo: TEditLabel;
    edtNomCodLayout: TEditTag;
    edtNomDescricao: TEditLabel;
    edtNumLinha: TEditLabel;
    edtNumColuna: TEditLabel;
    edtNumTamanho: TEditLabel;
    grpAlinhamento: TGroupBox;
    edtEsquerda: TRadioButtonTag;
    edtCentro: TRadioButtonTag;
    edtDireita: TRadioButtonTag;
    procedure FormCreate(Sender: TObject);
    procedure edtCodLayoutExit(Sender: TObject);
    procedure edtCodLayoutClickButton(Sender: TObject);
    procedure edtCodLayoutChange(Sender: TObject);
    procedure edtNomCampoClickButton(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    function PesquisaNova(Sender: TObject; blnValida: boolean = false; blnMsg: boolean = true): boolean;
  public
    { Public declarations }
  end;

var
  frmCAD_LAY_NF_CAMPO: TfrmCAD_LAY_NF_CAMPO;

implementation

{$R *.dfm}

procedure TfrmCAD_LAY_NF_CAMPO.FormCreate(Sender: TObject);
begin
  inherited;
  Tabela := 'CAD_LAY_NF_CAMPO';
end;

function TfrmCAD_LAY_NF_CAMPO.PesquisaNova(Sender: TObject;
  blnValida: boolean = false; blnMsg: boolean = true): boolean;
var Edt      : TEditlabel;
    EdtN     : TEdit;
    Pesquisa : TPesquisa;
    str      : array[0..2] of string;

begin
  Edt := Sender as TEditLabel;
  EdtN:= Edt._Edit;

  if (UpperCase(Edt._Campo) = 'COD_LAYOUT') then
  begin
    str[0] := 'COD_LAYOUT,NOM_LAYOUT';
    str[1] := 'CAD_LAYOUT_NF';
    str[2] := EmptyStr;
  end
  else if (UpperCase(Edt._Campo) = 'NOM_CAMPO') then
  begin
    str[0] := 'NOM_CAMPO,NOM_DESCRICAO';
    str[1] := 'CAD_LAY_NF_CAMPO';
    str[2] := 'COD_LAYOUT = ' + edtCodLayout.Text ;
  end;

  Pesquisa := TPesquisa.Create;
  Result := Pesquisa.ExecutaPesquisa(blnValida,str[0],str[1],Edt,EdtN,str[2],blnMsg);

  if (not Result) and (blnValida) and (Edt.Visible) and (Edt.Enabled) then
    Edt.SetFocus;
    
  Pesquisa.Free;
end;


procedure TfrmCAD_LAY_NF_CAMPO.edtCodLayoutExit(Sender: TObject);

var edt: TEditLabel;

begin
  inherited;

  edt := Sender as TEditLabel;

  if not PesquisaNova(Sender,true) then
    edt.SetFocus;
end;

procedure TfrmCAD_LAY_NF_CAMPO.edtCodLayoutClickButton(Sender: TObject);
begin
  inherited;
  PesquisaNova(Sender,false);
end;

procedure TfrmCAD_LAY_NF_CAMPO.edtCodLayoutChange(Sender: TObject);
begin
  inherited;
  edtNomCampo.Text := EmptyStr;
  edtNomCampo.Enabled := edtCodLayout.Text <> EmptyStr;
end;

procedure TfrmCAD_LAY_NF_CAMPO.edtNomCampoClickButton(Sender: TObject);
begin
  inherited;
  PesquisaNova(Sender,false,false);
end;


procedure TfrmCAD_LAY_NF_CAMPO.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if Action = caFree then
    cnn.Destroy;
end;

end.
