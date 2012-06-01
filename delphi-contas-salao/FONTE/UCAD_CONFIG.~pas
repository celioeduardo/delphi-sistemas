unit UCAD_CONFIG;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ufrm, StdCtrls, ComCtrls, Buttons, ExtCtrls, UComponentTag,
  Mask, EditLabel;

type
  TfrmCAD_CONFIG = class(Tfrm)
    tabConfiguracao: TPageControl;
    tabConfigContas: TTabSheet;
    edtCOD_CONTA_CAIXA: TEditLabel;
    edtNOM_CONTA_CAIXA: TEditTag;
    edtCOD_CONTA_CC: TEditLabel;
    edtNOM_CONTA_CC: TEditTag;
    edtCOD_CONTA_OUTR: TEditLabel;
    edtNOM_CONTA_OUTR: TEditTag;
    edtCOD_CONTA_OM_DES: TEditLabel;
    edtNOM_CONTA_OM_DES: TEditTag;
    edtCOD_CONTA_OM_PCP: TEditLabel;
    edtNOM_CONTA_OM_PCP: TEditTag;
    GroupBox1: TGroupBox;
    edtCOD_CONTA_FUNDOSR: TEditLabel;
    edtNOM_CONTA_FUNDOSR: TEditTag;
    edtCOD_CONTA_SALASSEMB: TEditLabel;
    edtNOM_CONTA_SALASSEMB: TEditTag;
    edtCOD_CONTA_AJUFIN: TEditLabel;
    edtNOM_CONTA_AJUFIN: TEditTag;
    edtCOD_CONTA_AUXCAL: TEditLabel;
    edtNOM_CONTA_AUXCAL: TEditTag;
    edtCOD_CONTA_CONG: TEditLabel;
    edtNOM_CONTA_CONG: TEditTag;
    edtCOD_CONTA_OUTROS: TEditLabel;
    edtNOM_CONTA_OUTROS: TEditTag;
    TabSheet2: TTabSheet;
    edtNOM_SERVO_CONTAS: TEditLabel;
    edtNOM_SECRETARIO: TEditLabel;
    edtNOM_CONGREGACAO: TEditLabel;
    edtNOM_CIDADE: TEditLabel;
    edtNOM_ESTADO: TEditLabel;
    edtNOM_UF: TEditLabel;
    edtNUM_CONGREGACAO: TEditLabel;
    edtNOM_BANCO_CONG: TEditLabel;
    edtNUM_AGENCIA_CONG: TEditLabel;
    edtNUM_CONTA_CORRENTE_CONG: TEditLabel;
    edtNOM_FAVORECIDO_CONG: TEditLabel;
    tabAssociacao: TTabSheet;
    tabFechamento: TTabSheet;
    edtVAL_RES_OMTJ: TEditLabel;
    edtVAL_AJU_FIN: TEditLabel;
    edtCOD_TPLANCFEC: TEditLabel;
    edtNOM_TPLANCFEC: TEditTag;
    edtNOM_ENDERECO: TEditLabel;
    edtNOM_BAIRRO: TEditLabel;
    edtNUM_CEP: TEditLabel;
    edtNOM_BANCO_ASS: TEditLabel;
    edtNUM_AGENCIA_ASS: TEditLabel;
    edtNUM_CONTA_DEPOSITO_ASS: TEditLabel;
    edtNOM_FAVORECIDO_ASS: TEditLabel;
    edtCOD_TPLANCDEP: TEditLabel;
    edtNOM_TPLANCDEP: TEditTag;
    procedure FormCreate(Sender: TObject);
    procedure edtCOD_CONTA_CAIXAClickButton(Sender: TObject);
    procedure edtCOD_CONTA_CCClickButton(Sender: TObject);
    procedure edtCOD_CONTA_OUTRClickButton(Sender: TObject);
    procedure edtCOD_CONTA_OM_DESClickButton(Sender: TObject);
    procedure edtCOD_CONTA_OM_PCPClickButton(Sender: TObject);
    procedure edtCOD_CONTA_CAIXAExit(Sender: TObject);
    procedure edtCOD_CONTA_CCExit(Sender: TObject);
    procedure edtCOD_CONTA_OUTRExit(Sender: TObject);
    procedure edtCOD_CONTA_OM_DESExit(Sender: TObject);
    procedure edtCOD_CONTA_OM_PCPExit(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure edtCOD_CONTA_FUNDOSRClickButton(Sender: TObject);
    procedure edtCOD_CONTA_SALASSEMBClickButton(Sender: TObject);
    procedure edtCOD_CONTA_AJUFINClickButton(Sender: TObject);
    procedure edtCOD_CONTA_AUXCALClickButton(Sender: TObject);
    procedure edtCOD_CONTA_CONGClickButton(Sender: TObject);
    procedure edtCOD_CONTA_OUTROSClickButton(Sender: TObject);
    procedure edtCOD_CONTA_FUNDOSRExit(Sender: TObject);
    procedure edtCOD_CONTA_SALASSEMBExit(Sender: TObject);
    procedure edtCOD_CONTA_AJUFINExit(Sender: TObject);
    procedure edtCOD_CONTA_AUXCALExit(Sender: TObject);
    procedure edtCOD_CONTA_CONGExit(Sender: TObject);
    procedure edtCOD_CONTA_OUTROSExit(Sender: TObject);
    procedure edtCOD_TPLANCFECExit(Sender: TObject);
    procedure edtCOD_TPLANCFECClickButton(Sender: TObject);
    procedure edtCOD_TPLANCDEPClickButton(Sender: TObject);
    procedure edtCOD_TPLANCDEPExit(Sender: TObject);
  private
    function PesquisaNova(Sender: TObject; blnValida,
      Msg: boolean): boolean;

  public
    { Public declarations }
  end;

var
  frmCAD_CONFIG: TfrmCAD_CONFIG;

implementation

{$R *.dfm}

uses UPesquisa;

procedure TfrmCAD_CONFIG.FormCreate(Sender: TObject);
begin
  inherited;
  Tabela := 'CAD_CONFIG';
  tabConfiguracao.ActivePageIndex := 0;
end;

function TfrmCAD_CONFIG.PesquisaNova(Sender: TObject; blnValida,
  Msg: boolean): boolean;
var Edt      : TEditlabel;
    EdtN     : TEdit;
    Pesquisa : TPesquisa;
    str      : array[0..2] of string;

begin
  Edt := Sender as TEditLabel;
  EdtN:= Edt._Edit;

  if (
     (Edt._Campo = 'COD_CONTA_CAIXA') or
     (Edt._Campo = 'COD_CONTA_CC') or
     (Edt._Campo = 'COD_CONTA_OUTR')
     )   then
  begin
    str[0] := 'COD_CONTA,NOM_CONTA';
    str[1] := 'VW_CAD_CONTA';
    str[2] := 'FLG_TP_CONTA = '+cnn.Aspas('ACP');
  end
  else if (Edt._Campo = 'COD_CONTA_OM_DES') then
  begin
    str[0] := 'COD_CONTA,NOM_CONTA';
    str[1] := 'VW_CAD_CONTA';
    str[2] := 'FLG_TP_CONTA = '+cnn.Aspas('DES');
  end
  else if (Edt._Campo = 'COD_CONTA_OM_PCP')  then
  begin
    str[0] := 'COD_CONTA,NOM_CONTA';
    str[1] := 'VW_CAD_CONTA';
    str[2] := 'FLG_TP_CONTA = '+cnn.Aspas('PCP');
  end
  else if (
     (Edt._Campo = 'COD_CONTA_FUNDOSR') or
     (Edt._Campo = 'COD_CONTA_SALASSEMB') or
     (Edt._Campo = 'COD_CONTA_AJUFIN') or
     (Edt._Campo = 'COD_CONTA_AUXCAL') or
     (Edt._Campo = 'COD_CONTA_CONG') or
     (Edt._Campo = 'COD_CONTA_OUTROS')               
     )   then
  begin
    str[0] := 'COD_CONTA,NOM_CONTA';
    str[1] := 'VW_CAD_CONTA';
    str[2] := 'FLG_TP_CONTA In ('+cnn.Aspas('DES')+','+cnn.Aspas('PCP')+','+
              cnn.Aspas('PLP')+')';
  end
  else if (Edt._Campo = 'COD_TPLANCFEC') or
          (Edt._Campo = 'COD_TPLANCDEP') then
  begin
    str[0] := 'COD_TP_LANC,NOM_TP_LANC';
    str[1] := 'CAD_TP_LANC';
    str[2] := EmptyStr;
  end
  else
    Exit;

  Pesquisa := TPesquisa.Create;

  Result := Pesquisa.ExecutaPesquisa(blnValida,str[0],str[1],Edt,EdtN,str[2],Msg);

  Pesquisa.Free;
end;


procedure TfrmCAD_CONFIG.edtCOD_CONTA_CAIXAClickButton(Sender: TObject);
begin
  inherited;
  PesquisaNova(Sender,false,true);
end;

procedure TfrmCAD_CONFIG.edtCOD_CONTA_CCClickButton(Sender: TObject);
begin
  inherited;
    PesquisaNova(Sender,false,true);
end;

procedure TfrmCAD_CONFIG.edtCOD_CONTA_OUTRClickButton(Sender: TObject);
begin
  inherited;
    PesquisaNova(Sender,false,true);
end;

procedure TfrmCAD_CONFIG.edtCOD_CONTA_OM_DESClickButton(Sender: TObject);
begin
  inherited;
    PesquisaNova(Sender,false,true);
end;

procedure TfrmCAD_CONFIG.edtCOD_CONTA_OM_PCPClickButton(Sender: TObject);
begin
  inherited;
  PesquisaNova(Sender,false,true);
end;

procedure TfrmCAD_CONFIG.edtCOD_CONTA_CAIXAExit(Sender: TObject);
begin
  inherited;
  if not PesquisaNova(Sender,true,true) then
    edtCOD_CONTA_CAIXA.SetFocus;
end;

procedure TfrmCAD_CONFIG.edtCOD_CONTA_CCExit(Sender: TObject);
begin
  inherited;
  if not PesquisaNova(Sender,true,true) then
    edtCOD_CONTA_CC.SetFocus;
end;

procedure TfrmCAD_CONFIG.edtCOD_CONTA_OUTRExit(Sender: TObject);
begin
  inherited;
  if not PesquisaNova(Sender,true,true) then
    edtCOD_CONTA_OUTR.SetFocus;
end;

procedure TfrmCAD_CONFIG.edtCOD_CONTA_OM_DESExit(Sender: TObject);
begin
  inherited;
  if not PesquisaNova(Sender,true,true) then
    edtCOD_CONTA_OM_DES.SetFocus;
end;

procedure TfrmCAD_CONFIG.edtCOD_CONTA_OM_PCPExit(Sender: TObject);
begin
  inherited;
  if not PesquisaNova(Sender,true,true) then
    edtCOD_CONTA_OM_PCP.SetFocus;
end;

procedure TfrmCAD_CONFIG.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCAD_CONFIG.edtCOD_CONTA_FUNDOSRClickButton(Sender: TObject);
begin
  inherited;
  PesquisaNova(Sender,false,true);
end;

procedure TfrmCAD_CONFIG.edtCOD_CONTA_SALASSEMBClickButton(
  Sender: TObject);
begin
  inherited;
  PesquisaNova(Sender,false,true);
end;

procedure TfrmCAD_CONFIG.edtCOD_CONTA_AJUFINClickButton(Sender: TObject);
begin
  inherited;
  PesquisaNova(Sender,false,true);
end;

procedure TfrmCAD_CONFIG.edtCOD_CONTA_AUXCALClickButton(Sender: TObject);
begin
  inherited;
  PesquisaNova(Sender,false,true);
end;

procedure TfrmCAD_CONFIG.edtCOD_CONTA_CONGClickButton(Sender: TObject);
begin
  inherited;
  PesquisaNova(Sender,false,true);
end;

procedure TfrmCAD_CONFIG.edtCOD_CONTA_OUTROSClickButton(Sender: TObject);
begin
  inherited;
  PesquisaNova(Sender,false,true);
end;

procedure TfrmCAD_CONFIG.edtCOD_CONTA_FUNDOSRExit(Sender: TObject);
begin
  inherited;
  if not PesquisaNova(Sender,true,true) then
    TEditLabel(Sender).SetFocus;
end;

procedure TfrmCAD_CONFIG.edtCOD_CONTA_SALASSEMBExit(Sender: TObject);
begin
  inherited;
  if not PesquisaNova(Sender,true,true) then
    TEditLabel(Sender).SetFocus;
end;

procedure TfrmCAD_CONFIG.edtCOD_CONTA_AJUFINExit(Sender: TObject);
begin
  inherited;
  if not PesquisaNova(Sender,true,true) then
    TEditLabel(Sender).SetFocus;
end;

procedure TfrmCAD_CONFIG.edtCOD_CONTA_AUXCALExit(Sender: TObject);
begin
  inherited;
  if not PesquisaNova(Sender,true,true) then
    TEditLabel(Sender).SetFocus;
end;

procedure TfrmCAD_CONFIG.edtCOD_CONTA_CONGExit(Sender: TObject);
begin
  inherited;
  if not PesquisaNova(Sender,true,true) then
    TEditLabel(Sender).SetFocus;
end;

procedure TfrmCAD_CONFIG.edtCOD_CONTA_OUTROSExit(Sender: TObject);
begin
  inherited;
  if not PesquisaNova(Sender,true,true) then
    TEditLabel(Sender).SetFocus;
end;

procedure TfrmCAD_CONFIG.edtCOD_TPLANCFECExit(Sender: TObject);
begin
  inherited;
  if not PesquisaNova(Sender,true,true) then
    TEditLabel(Sender).SetFocus;
end;

procedure TfrmCAD_CONFIG.edtCOD_TPLANCFECClickButton(Sender: TObject);
begin
  inherited;
  PesquisaNova(Sender,false,true);
end;

procedure TfrmCAD_CONFIG.edtCOD_TPLANCDEPClickButton(Sender: TObject);
begin
  inherited;
  PesquisaNova(edtCOD_TPLANCDEP,False,true);
end;

procedure TfrmCAD_CONFIG.edtCOD_TPLANCDEPExit(Sender: TObject);
begin
  inherited;
  if not PesquisaNova(edtCOD_TPLANCDEP,true,true) then
    edtCOD_TPLANCDEP.SetFocus;
end;

end.
