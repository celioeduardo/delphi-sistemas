unit UMOV_LANCAMENTO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ufrm, Mask, EditLabel, StdCtrls, ComCtrls, Buttons, ExtCtrls,
  UComponentTag;

type
  TfrmMOV_LANCAMENTO = class(Tfrm)
    edtNUM_LANCAMENTO: TEditLabel;
    edtCOD_TP_LANC: TEditLabel;
    edtNOM_TP_LANC: TEditTag;
    edtDAT_LANCAMENTO: TEditLabel;
    edtVAL_LANCAMENTO: TEditLabel;
    edtDSC_LANCAMENTO: TEditLabel;
    edtCOD_CT: TEditLabel;
    GroupBox1: TGroupBox;
    optEntrada: TRadioButtonTag;
    optSaida: TRadioButtonTag;
    optAmbos: TRadioButtonTag;
    edtOBS_LANCAMENTO: TEditLabel;
    edtCOD_CONTA_DEB: TEditLabel;
    edtCOD_CONTA_CRE: TEditLabel;
    edtNOM_CONTA_DEB: TEditTag;
    edtNOM_CONTA_CRE: TEditTag;
    lblDiaSemana: TLabel;
    edtDia: TEditLabel;
    procedure FormCreate(Sender: TObject);
    procedure edtCOD_TP_LANCExit(Sender: TObject);
    procedure edtNUM_LANCAMENTOEnter(Sender: TObject);
    procedure edtNUM_LANCAMENTOChange(Sender: TObject);
    procedure edtNUM_LANCAMENTOClickButton(Sender: TObject);
    procedure edtCOD_CONTA_DEBClickButton(Sender: TObject);
    procedure edtCOD_CONTA_CREClickButton(Sender: TObject);
    procedure edtCOD_CONTA_DEBExit(Sender: TObject);
    procedure edtCOD_CONTA_CREExit(Sender: TObject);
    procedure edtDAT_LANCAMENTOChange(Sender: TObject);
    procedure edtDAT_LANCAMENTOExit(Sender: TObject);
    procedure edtCOD_TP_LANCClickButton(Sender: TObject);
    procedure edtDiaExit(Sender: TObject);
    procedure edtDiaChange(Sender: TObject);
    procedure edtCOD_TP_LANCChange(Sender: TObject);
  private
    function PesquisaNova(Sender: TObject; blnValida,
      Msg: boolean): boolean;

    procedure SugereCamposTipoLancamento(const strCodTpLanc: string);
  public
    { Public declarations }
  end;

var
  frmMOV_LANCAMENTO: TfrmMOV_LANCAMENTO;

implementation

{$R *.dfm}

uses UPesquisa, DB, Functions, UPrincipal;

procedure TfrmMOV_LANCAMENTO.FormCreate(Sender: TObject);
begin
  inherited;
  Tabela := 'MOV_LANCAMENTO';
  lblDiaSemana.Caption := EmptyStr;
end;

function TfrmMOV_LANCAMENTO.PesquisaNova(Sender: TObject; blnValida,
  Msg: boolean): boolean;
var Edt      : TEditlabel;
    EdtN     : TEdit;
    Pesquisa : TPesquisa;
    str      : array[0..2] of string;

begin
  Edt := Sender as TEditLabel;
  EdtN:= Edt._Edit;

  if (Edt._Campo = 'NUM_LANCAMENTO') then
  begin
    str[0] := 'NUM_LANCAMENTO,NOM_DESCRICAO';
    str[1] := 'VW_MOV_LANCAMENTO';
    str[2] := EmptyStr;
  end
  else if ((Edt._Campo = 'COD_CONTA_DEB') or (Edt._Campo = 'COD_CONTA_CRE')) then
  begin
    str[0] := 'COD_CONTA,NOM_CONTA';
    str[1] := 'VW_CAD_CONTA';
    str[2] := EmptyStr;
  end
  else if (Edt._Campo = 'COD_TP_LANC')  then
  begin
    str[0] := 'COD_TP_LANC,NOM_TP_LANC';
    str[1] := 'CAD_TP_LANC';
    str[2] := EmptyStr;
  end
  else
    Exit;

  Pesquisa := TPesquisa.Create;

  Result := Pesquisa.ExecutaPesquisa(blnValida,str[0],str[1],Edt,EdtN,str[2],Msg);

  if Result and (Edt._Campo = 'COD_TP_LANC') then
    SugereCamposTipoLancamento(edtCOD_TP_LANC.Text);


  Pesquisa.Free;
end;

procedure TfrmMOV_LANCAMENTO.SugereCamposTipoLancamento(const strCodTpLanc: string);
var
 str: string;
 ds: TDataSource;
begin
  if trim(strCodTpLanc) = EmptyStr then
    exit;

  str := 'Select ';
  str := str + 'COD_CONTA_DEB,';
  str := str + 'COD_CONTA_CRE,';
  str := str + 'DSC_LANCAMENTO,';
  str := str + 'COD_CT,';
  str := str + 'FLG_ES';
  str := str + ' From ';
  str := str + 'CAD_TP_LANC';
  str := str + ' Where ';
  str := str + 'COD_TP_LANC = '+cnn.Aspas(strCodTpLanc);

  if cnn.ExecuteQuery(str,ds) then
  begin
    if trim(edtCOD_CONTA_DEB.Text) = EmptyStr then
    begin
      edtCOD_CONTA_DEB.Text := ds.DataSet.FieldByName('COD_CONTA_DEB').AsString;
      edtCOD_CONTA_DEBExit(edtCOD_CONTA_DEB);
    end;

    if trim(edtCOD_CONTA_CRE.Text) = EmptyStr then
    begin
      edtCOD_CONTA_CRE.Text := ds.DataSet.FieldByName('COD_CONTA_CRE').AsString;
      edtCOD_CONTA_CREExit(edtCOD_CONTA_CRE);
    end;

    if trim(edtDSC_LANCAMENTO.Text) = EmptyStr then
      edtDSC_LANCAMENTO.Text := ds.DataSet.FieldByName('DSC_LANCAMENTO').AsString;
    if trim(edtCOD_CT.Text) = EmptyStr then
    begin
      edtCOD_CT.Text := ds.DataSet.FieldByName('COD_CT').AsString;
      optEntrada.Checked := (ds.DataSet.FieldByName('FLG_ES').AsString = 'E');
      optSaida.Checked := (ds.DataSet.FieldByName('FLG_ES').AsString = 'S');
      optAmbos.Checked := (ds.DataSet.FieldByName('FLG_ES').AsString = 'A');
    end;
  end;

end;

procedure TfrmMOV_LANCAMENTO.edtCOD_TP_LANCExit(Sender: TObject);
begin
  inherited;
  if not PesquisaNova(Sender,true,true) then
    edtCOD_TP_LANC.SetFocus;
end;

procedure TfrmMOV_LANCAMENTO.edtNUM_LANCAMENTOEnter(Sender: TObject);
begin
  inherited;
  ProximoNumero(edtNUM_LANCAMENTO);
end;

procedure TfrmMOV_LANCAMENTO.edtNUM_LANCAMENTOChange(Sender: TObject);
begin
  inherited;
  ProximoNumero(edtNUM_LANCAMENTO);
end;

procedure TfrmMOV_LANCAMENTO.edtNUM_LANCAMENTOClickButton(Sender: TObject);
begin
  inherited;
  PesquisaNova(Sender,false,false);
end;

procedure TfrmMOV_LANCAMENTO.edtCOD_CONTA_DEBClickButton(Sender: TObject);
begin
  inherited;
  PesquisaNova(Sender,false,true);
end;

procedure TfrmMOV_LANCAMENTO.edtCOD_CONTA_CREClickButton(Sender: TObject);
begin
  inherited;
  PesquisaNova(Sender,false,true);
end;

procedure TfrmMOV_LANCAMENTO.edtCOD_CONTA_DEBExit(Sender: TObject);
begin
  inherited;
  if not PesquisaNova(Sender,true,true) then
    edtCOD_CONTA_DEB.SetFocus;
end;

procedure TfrmMOV_LANCAMENTO.edtCOD_CONTA_CREExit(Sender: TObject);
begin
  inherited;
  if not PesquisaNova(Sender,true,true) then
    edtCOD_CONTA_CRE.SetFocus;
end;

procedure TfrmMOV_LANCAMENTO.edtDAT_LANCAMENTOChange(Sender: TObject);
begin
  inherited;
  lblDiaSemana.Caption := EmptyStr;
end;

procedure TfrmMOV_LANCAMENTO.edtDAT_LANCAMENTOExit(Sender: TObject);
var
  dia: integer;
  strDia: string;

begin
  inherited;

  try
    dia := DayOfWeek(StrToDate(edtDAT_LANCAMENTO.Text));
  except
    exit;
  end;

  case dia of
    1: strDia := 'DOMINGO';
    2: strDia := 'SEGUNDA-FEIRA';
    3: strDia := 'TERCA-FEIRA';
    4: strDia := 'QUARTA-FEIRA';
    5: strDia := 'QUINTA-FEIRA';
    6: strDia := 'SEXTA-FEIRA';
    7: strDia := 'SÁBADO';
  end;

  lblDiaSemana.Caption := strDia;

end;

procedure TfrmMOV_LANCAMENTO.edtCOD_TP_LANCClickButton(Sender: TObject);
begin
  inherited;
  PesquisaNova(Sender,false,true);
end;

procedure TfrmMOV_LANCAMENTO.edtDiaExit(Sender: TObject);
var
  strData: string;
  datData: TDate;
begin
  inherited;
  if trim(edtDia.Text) = EmptyStr then
    exit;

  strData := LPAD(edtDia.Text,2,'0')+'/'+
             LPAD(IntToStr(frmPrincipal.cboMes.ItemIndex+1),2,'0')+'/'+
             frmPrincipal.edtAno.Text;
  try
    datData := StrToDate(strData);
  except
    MessageDlg('Data Inválida',mtWarning,[mbOK],0);
    edtDia.SetFocus;
    exit;
  end;

  edtDAT_LANCAMENTO.Text := strData;
  edtDAT_LANCAMENTOExit(Sender);

end;

procedure TfrmMOV_LANCAMENTO.edtDiaChange(Sender: TObject);
begin
  inherited;
  edtDAT_LANCAMENTO.Text := EmptyStr;
end;

procedure TfrmMOV_LANCAMENTO.edtCOD_TP_LANCChange(Sender: TObject);
begin
  inherited;
  edtCOD_CONTA_DEB.Text := EmptyStr;
  edtCOD_CONTA_CRE.Text := EmptyStr;
  edtDSC_LANCAMENTO.Text := EmptyStr;
  edtCOD_CT.Text := EmptyStr;
end;

end.
