unit UCAD_FECHAMENTO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ufrm, StdCtrls, ComCtrls, Buttons, ExtCtrls, Mask, EditLabel,
  UComponentTag;

type
  TfrmCAD_FECHAMENTO = class(Tfrm)
    edtNUM_MES: TEditLabel;
    edtNUM_ANO: TEditLabel;
    edtDAT_FECHAMENTO: TEditLabel;
    grpOMTJ: TGroupBox;
    edtVAL_OMTJ: TEditLabel;
    edtVAL_OMTJ_RES: TEditLabel;
    grpSalaoAssembleia: TGroupBox;
    edtVAL_SALAO_ASSEMB: TEditLabel;
    edtNOM_SALAO_ASSEMB: TEditLabel;
    grpValoresAdicionais: TGroupBox;
    edtVAL_AJU_FIN: TEditLabel;
    edtVAL_AUX_CAL: TEditLabel;
    edtVAL_FUNDO_SR: TEditLabel;
    edtVAL_CONTA_CONG: TEditLabel;
    grdOutrosDonativos: TGroupBox;
    edtVAL_OUTROS_DONAT: TEditLabel;
    edtNOM_OUTROS_DONAT: TEditLabel;
    edtTotalEnviarOMTJ: TEditLabel;
    tabResumo: TTabSheet;
    grpRemessaAssociacao: TGroupBox;
    lvwRemessaAssociacao: TListViewTag;
    GroupBox1: TGroupBox;
    lblTotalEnviar: TLabel;
    lbl: TLabel;
    lblValorTotalEnviar: TLabel;
    lblValor: TLabel;
    lblDiferenca: TLabel;
    lblValorDiferenca: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lblValSaldoAntMaos: TLabel;
    lblValEntradaMaos: TLabel;
    lblValSaidaMaos: TLabel;
    lblValSaldoFinalMaos: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    lblValSaldoAntOutra: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    lblValSaldoFinalOutra: TLabel;
    lblValSaidaOutra: TLabel;
    lblValEntradaOutra: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    lblValSaldoAntCC: TLabel;
    Label22: TLabel;
    lblValEntradaCC: TLabel;
    Label24: TLabel;
    lblValSaidaCC: TLabel;
    Label26: TLabel;
    lblValSaldoFinalCC: TLabel;
    GroupBox2: TGroupBox;
    lvwObrigacoes: TListViewTag;
    Label6: TLabel;
    lblSaldoFinalTotal: TLabel;
    grpLancamentos: TGroupBox;
    lvwLancamento: TListViewTag;
    chkDepContaCong: TCheckBoxTag;
    cboSaidaDinheiro: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure edtVAL_OMTJExit(Sender: TObject);
    procedure edtVAL_OMTJ_RESExit(Sender: TObject);
    procedure edtVAL_AJU_FINExit(Sender: TObject);
    procedure edtVAL_AUX_CALExit(Sender: TObject);
    procedure edtVAL_FUNDO_SRExit(Sender: TObject);
    procedure edtVAL_CONTA_CONGExit(Sender: TObject);
    procedure edtVAL_SALAO_ASSEMBExit(Sender: TObject);
    procedure edtVAL_OUTROS_DONATExit(Sender: TObject);
    procedure txtHabilitaEdicaoEnter(Sender: TObject);
    procedure tabResumoShow(Sender: TObject);
    procedure optDinheiroMaosClick(Sender: TObject);
    procedure optContaCorrenteClick(Sender: TObject);
    procedure optOutraClick(Sender: TObject);
    procedure btnIncluiClick(Sender: TObject);
    procedure btnExcluiClick(Sender: TObject);
    procedure cboSaidaDinheiroChange(Sender: TObject);
    procedure chkDepContaCongClick(Sender: TObject);
  private
    ContaCaixa: integer;
    ContaCC: integer;
    ContaOutra: integer;
    ContaOMTJ_PCP: integer;
    ContaOMTJ_DES: integer;

    TipoLancFec: string;
    TipoLancDep: string;
    ContaDespFundoSR: integer;
    ContaDespSalaoAssemb: integer;
    ContaDespAjudaFin: integer;
    ContaDespAuxilioCal: integer;
    ContaDespContaCong: integer;
    ContaDespOutros: integer;

    procedure CarregaConfiguracao;
    procedure ValorCampos;
    procedure TotalizaOMTJ;
    procedure SugereValores;
    procedure CalculaRemessaAssociacao;
    procedure CalculaDiferenca;
    procedure CalculaVerificacao;
    procedure ObrigacoesAberto;
    procedure LancamentosFechamento;
  public
    { Public declarations }
  end;

var
  frmCAD_FECHAMENTO: TfrmCAD_FECHAMENTO;

implementation

{$R *.dfm}

uses UPrincipal,SimpleDS,UConta,Functions, DB, UConexao;

procedure TfrmCAD_FECHAMENTO.FormCreate(Sender: TObject);

begin
  inherited;
  Tabela := 'CAD_FECHAMENTO';
  edtNUM_MES.Text := IntTostr(frmPrincipal.cboMes.ItemIndex+1);
  edtNUM_ANO.Text := frmPrincipal.edtAno.Text;
  CarregaConfiguracao;
end;

procedure TfrmCAD_FECHAMENTO.edtVAL_OMTJExit(Sender: TObject);
begin
  inherited;
  if trim(edtVAL_OMTJ.Text) = EmptyStr then
    edtVAL_OMTJ.Text := '0,00';

  TotalizaOMTJ;

end;

procedure TfrmCAD_FECHAMENTO.edtVAL_OMTJ_RESExit(Sender: TObject);
begin
  inherited;
  if trim(edtVAL_OMTJ_RES.Text) = EmptyStr then
    edtVAL_OMTJ_RES.Text := '0,00';

  TotalizaOMTJ;
end;

procedure TfrmCAD_FECHAMENTO.edtVAL_AJU_FINExit(Sender: TObject);
begin
  inherited;
  if trim(edtVAL_AJU_FIN.Text) = EmptyStr then
    edtVAL_AJU_FIN.Text := '0,00';
end;

procedure TfrmCAD_FECHAMENTO.edtVAL_AUX_CALExit(Sender: TObject);
begin
  inherited;
  if trim(edtVAL_AUX_CAL.Text) = EmptyStr then
    edtVAL_AUX_CAL.Text := '0,00';
end;

procedure TfrmCAD_FECHAMENTO.edtVAL_FUNDO_SRExit(Sender: TObject);
begin
  inherited;
  if trim(edtVAL_FUNDO_SR.Text) = EmptyStr then
    edtVAL_FUNDO_SR.Text := '0,00';
end;

procedure TfrmCAD_FECHAMENTO.edtVAL_CONTA_CONGExit(Sender: TObject);
begin
  inherited;
  if trim(edtVAL_CONTA_CONG.Text) = EmptyStr then
    edtVAL_CONTA_CONG.Text := '0,00';
end;

procedure TfrmCAD_FECHAMENTO.edtVAL_SALAO_ASSEMBExit(Sender: TObject);
begin
  inherited;
  if trim(edtVAL_SALAO_ASSEMB.Text) = EmptyStr then
    edtVAL_SALAO_ASSEMB.Text := '0,00';
end;

procedure TfrmCAD_FECHAMENTO.edtVAL_OUTROS_DONATExit(Sender: TObject);
begin
  inherited;
  if trim(edtVAL_OUTROS_DONAT.Text) = EmptyStr then
    edtVAL_OUTROS_DONAT.Text := '0,00';
end;

procedure TfrmCAD_FECHAMENTO.TotalizaOMTJ;
begin
  try
    edtTotalEnviarOMTJ.Text := FormatCurr('#,##0.00',
       StrToCur(edtVAL_OMTJ.Text) + StrToCur(edtVAL_OMTJ_RES.Text));
  except
    edtTotalEnviarOMTJ.Text := '0,00';
  end;

end;

procedure TfrmCAD_FECHAMENTO.SugereValores;
var
  ds: TSimpleDataset;
  str: string;
  curSaldoContaOMTJ: Currency;
  curResolucaoOMTJ: Currency;
  curSaldoContaConstrucaoSR: Currency;
  Conta: TConta;
begin
  curSaldoContaOMTJ := 0;

  edtDAT_FECHAMENTO.Text := FormatDateTime('DD/MM/YYYY',Date);

  str := 'Select * From CAD_CONFIG';

  if not cnn.ExecuteQuery(str,ds) then
    exit;

  //AJUDA FINANCEIRA
  if ds.FieldByName('VAL_AJU_FIN').AsString <> EmptyStr then
  begin
    edtVAL_AJU_FIN.Text := FormatCurr( '#,##0.00',
      ds.FieldByName('VAL_AJU_FIN').AsCurrency);
  end;

  //OMTJ
  if ds.FieldByName('COD_CONTA_OM_PCP').AsString <> EmptyStr then
  begin
    Conta := TConta.Create(ds.FieldByName('COD_CONTA_OM_PCP').AsInteger);
    curSaldoContaOMTJ := Conta.Saldo(edtNUM_MES.Text,edtNUM_ANO.Text);
    edtVAL_OMTJ.Text := FormatCurr('#,##0.00',curSaldoContaOMTJ);
  end;

  //RESOLUÇÃO OMTJ
  if ds.FieldByName('VAL_RES_OMTJ').AsString <> EmptyStr then
    curResolucaoOMTJ := ds.FieldByName('VAL_RES_OMTJ').AsCurrency
  else
    curResolucaoOMTJ := 0;

  if curSaldoContaOMTJ < curResolucaoOMTJ then
    edtVAL_OMTJ_RES.Text := FormatCurr('#,##0.00',curResolucaoOMTJ - curSaldoContaOMTJ)
  else
    edtVAL_OMTJ_RES.Text := '0,00';

  TotalizaOMTJ;

  //CONSTRUÇÃO DE SALÕES DO REINO
  if ds.FieldByName('COD_CONTA_FUNDOSR').AsString <> EmptyStr then
  begin
    Conta := TConta.Create(ds.FieldByName('COD_CONTA_FUNDOSR').AsInteger);
    curSaldoContaConstrucaoSR := Conta.Saldo(edtNUM_MES.Text,edtNUM_ANO.Text);
    edtVAL_FUNDO_SR.Text := FormatCurr('#,##0.00',curSaldoContaConstrucaoSR);
  end;


end;

procedure TfrmCAD_FECHAMENTO.txtHabilitaEdicaoEnter(Sender: TObject);
begin
  inherited;

  if not btnInclui.Enabled then
    Exit;

  SugereValores;
  ValorCampos;
end;

procedure TfrmCAD_FECHAMENTO.ValorCampos;
begin
  if trim(edtVAL_OMTJ.Text) = EmptyStr then
    edtVAL_OMTJ.Text := '0,00';
  if trim(edtVAL_OMTJ_RES.Text) = EmptyStr then
    edtVAL_OMTJ_RES.Text := '0,00';
  if trim(edtVAL_AJU_FIN.Text) = EmptyStr then
    edtVAL_AJU_FIN.Text := '0,00';
  if trim(edtVAL_AUX_CAL.Text) = EmptyStr then
    edtVAL_AUX_CAL.Text := '0,00';
  if trim(edtVAL_FUNDO_SR.Text) = EmptyStr then
    edtVAL_FUNDO_SR.Text := '0,00';
  if trim(edtVAL_CONTA_CONG.Text) = EmptyStr then
    edtVAL_CONTA_CONG.Text := '0,00';
  if trim(edtVAL_SALAO_ASSEMB.Text) = EmptyStr then
    edtVAL_SALAO_ASSEMB.Text := '0,00';
  if trim(edtVAL_OUTROS_DONAT.Text) = EmptyStr then
    edtVAL_OUTROS_DONAT.Text := '0,00';
end;

procedure TfrmCAD_FECHAMENTO.CalculaRemessaAssociacao;
var
  item: TListItem;
  curTotal,curValor,curSaldoCaixa: Currency;
  strDesc: string;
  Conta: TConta;
begin
  curTotal := 0;
  curValor := 0;

  //OMTJ
  strDesc := 'OMTJ';
  if trim(edtVAL_OMTJ_RES.Text) <> EmptyStr then
  begin
    strDesc := strDesc + ' (Resolução: '+ edtVAL_OMTJ_RES.Text+')';
    curValor := StrToCur(edtVAL_OMTJ_RES.Text);
  end;

  if trim(edtVAL_OMTJ.Text) <> EmptyStr then
    curValor := curValor + StrToCur(edtVAL_OMTJ.Text);

  lvwRemessaAssociacao.Items.Clear;

  item := lvwRemessaAssociacao.Items.Add;
  item.Caption := strDesc;
  item.SubItems.Add(FormatCurr('#,##0.00',curValor));
  curTotal := curTotal + curValor;
  curValor :=0;

  //VALORES ADICIONAIS
  if trim(edtVAL_AJU_FIN.Text) <> EmptyStr then
  begin
    strDesc := 'Remessa de Ajuda Financeira';
    curValor := StrToCur(edtVAL_AJU_FIN.Text);
    if curValor > 0 then
    begin
      item := lvwRemessaAssociacao.Items.Add;
      item.Caption := strDesc;
      item.SubItems.Add(FormatCurr('#,##0.00',curValor));
      curTotal := curTotal + curValor;
      curValor :=0;
    end;
  end;

  if trim(edtVAL_AUX_CAL.Text) <> EmptyStr then
  begin
    strDesc := 'Auxílio para Calamidades';
    curValor := StrToCur(edtVAL_AUX_CAL.Text);
    if curValor > 0 then
    begin
      item := lvwRemessaAssociacao.Items.Add;
      item.Caption := strDesc;
      item.SubItems.Add(FormatCurr('#,##0.00',curValor));
      curTotal := curTotal + curValor;
      curValor :=0;
    end;
  end;

  if trim(edtVAL_FUNDO_SR.Text) <> EmptyStr then
  begin
    strDesc := 'Construção Mundial de Salões do Reino';
    curValor := StrToCur(edtVAL_FUNDO_SR.Text);
    if curValor > 0 then
    begin
      item := lvwRemessaAssociacao.Items.Add;
      item.Caption := strDesc;
      item.SubItems.Add(FormatCurr('#,##0.00',curValor));
      curTotal := curTotal + curValor;
      curValor :=0;
    end;
  end;

  if trim(edtVAL_CONTA_CONG.Text) <> EmptyStr then
  begin
    strDesc := 'Remessa para Conta da Congregação';
    curValor := StrToCur(edtVAL_CONTA_CONG.Text);
    if curValor > 0 then
    begin
      item := lvwRemessaAssociacao.Items.Add;
      item.Caption := strDesc;
      item.SubItems.Add(FormatCurr('#,##0.00',curValor));
      curTotal := curTotal + curValor;
      curValor :=0;
    end;
  end;

  if trim(edtVAL_SALAO_ASSEMB.Text) <> EmptyStr then
  begin
    strDesc := 'Salão de Assembléias';
    if trim(edtNOM_SALAO_ASSEMB.Text) <> EmptyStr then
      strDesc := strDesc + ' de ' + edtNOM_SALAO_ASSEMB.Text;
    curValor := StrToCur(edtVAL_SALAO_ASSEMB.Text);
    if curValor > 0 then
    begin
      item := lvwRemessaAssociacao.Items.Add;
      item.Caption := strDesc;
      item.SubItems.Add(FormatCurr('#,##0.00',curValor));
      curTotal := curTotal + curValor;
      curValor :=0;
    end;
  end;

  if trim(edtVAL_OUTROS_DONAT.Text) <> EmptyStr then
  begin
    strDesc := 'Outros Donativos';
    if trim(edtNOM_OUTROS_DONAT.Text) <> EmptyStr then
      strDesc := strDesc + ' - ' + edtNOM_OUTROS_DONAT.Text;
    curValor := StrToCur(edtVAL_OUTROS_DONAT.Text);
    if curValor > 0 then
    begin
      item := lvwRemessaAssociacao.Items.Add;
      item.Caption := strDesc;
      item.SubItems.Add(FormatCurr('#,##0.00',curValor));
      curTotal := curTotal + curValor;
      curValor :=0;
    end;
  end;

  lblValorTotalEnviar.Caption := FormatCurr('#,##0.00',curTotal);
 
end;

procedure TfrmCAD_FECHAMENTO.CarregaConfiguracao;
var
  str: string;
  ds: TSimpleDataSet;
begin
  str := 'Select * From CAD_CONFIG';

  if not cnn.ExecuteQuery(str,ds) then
    exit;

  if trim(ds.FieldByName('COD_CONTA_CAIXA').AsString) <> EmptyStr Then
    ContaCaixa := ds.FieldByName('COD_CONTA_CAIXA').AsInteger
  else
    ContaCaixa := -1;

  if trim(ds.FieldByName('COD_CONTA_CC').AsString) <> EmptyStr Then
    ContaCC := ds.FieldByName('COD_CONTA_CC').AsInteger
  else
    ContaCC := -1;

  if trim(ds.FieldByName('COD_CONTA_OUTR').AsString) <> EmptyStr Then
    ContaOutra := ds.FieldByName('COD_CONTA_OUTR').AsInteger
  else
    ContaOutra := -1;

  if trim(ds.FieldByName('COD_CONTA_OM_DES').AsString) <> EmptyStr Then
    ContaOMTJ_DES := ds.FieldByName('COD_CONTA_OM_DES').AsInteger
  else
    ContaOMTJ_DES := -1;

  if trim(ds.FieldByName('COD_CONTA_OM_PCP').AsString) <> EmptyStr Then
    ContaOMTJ_PCP := ds.FieldByName('COD_CONTA_OM_PCP').AsInteger
  else
    ContaOMTJ_PCP := -1;

  if trim(ds.FieldByName('COD_TPLANCFEC').AsString) <> EmptyStr Then
    TipoLancFec := ds.FieldByName('COD_TPLANCFEC').AsString
  else
    TipoLancFec := EmptyStr;

  if trim(ds.FieldByName('COD_TPLANCDEP').AsString) <> EmptyStr Then
    TipoLancDep := ds.FieldByName('COD_TPLANCDEP').AsString
  else
    TipoLancDep := EmptyStr;

  if trim(ds.FieldByName('COD_CONTA_FUNDOSR').AsString) <> EmptyStr Then
    ContaDespFundoSR := ds.FieldByName('COD_CONTA_FUNDOSR').AsInteger
  else
    ContaDespFundoSR := -1;

  if trim(ds.FieldByName('COD_CONTA_SALASSEMB').AsString) <> EmptyStr Then
    ContaDespSalaoAssemb := ds.FieldByName('COD_CONTA_SALASSEMB').AsInteger
  else
    ContaDespSalaoAssemb := -1;

  if trim(ds.FieldByName('COD_CONTA_AJUFIN').AsString) <> EmptyStr Then
    ContaDespAjudaFin := ds.FieldByName('COD_CONTA_AJUFIN').AsInteger
  else
    ContaDespAjudaFin := -1;

  if trim(ds.FieldByName('COD_CONTA_AUXCAL').AsString) <> EmptyStr Then
    ContaDespAuxilioCal := ds.FieldByName('COD_CONTA_AUXCAL').AsInteger
  else
    ContaDespAuxilioCal := -1;

  if trim(ds.FieldByName('COD_CONTA_CONG').AsString) <> EmptyStr Then
    ContaDespContaCong := ds.FieldByName('COD_CONTA_CONG').AsInteger
  else
    ContaDespContaCong := -1;

  if trim(ds.FieldByName('COD_CONTA_OUTROS').AsString) <> EmptyStr Then
    ContaDespOutros := ds.FieldByName('COD_CONTA_OUTROS').AsInteger
  else
    ContaDespOutros := -1;

end;

procedure TfrmCAD_FECHAMENTO.tabResumoShow(Sender: TObject);
begin
  inherited;
  CalculaRemessaAssociacao;
  CalculaVerificacao;
  CalculaDiferenca;
  ObrigacoesAberto;
  cboSaidaDinheiroChange(chkDepContaCong);
  LancamentosFechamento;
end;

procedure TfrmCAD_FECHAMENTO.CalculaVerificacao;
var
  curSaldoAnt: Currency;
  curEntrada: Currency;
  curSaida: Currency;
  curSaldoFinal,curSaldoFinalTotal: Currency;
  Conta: TConta;
begin
  // CONTA CAIXA
  curSaldoAnt := 0;
  curEntrada := 0;
  curSaida := 0;
  curSaldoFinal := 0;
  curSaldoFinalTotal := 0;

  if (trim(edtNUM_MES.Text) = EmptyStr) or
     (trim(edtNUM_ANO.Text) = EmptyStr)
  then
    Exit;     



  if ContaCaixa <> -1 then
  begin
    Conta := TConta.Create(ContaCaixa);
    curSaldoAnt := Conta.SaldoAnterior(edtNUM_MES.Text,edtNUM_ANO.Text);
    curEntrada := Conta.MovimentacaoDebito(edtNUM_MES.Text,edtNUM_ANO.Text,edtNUM_MES.Text,edtNUM_ANO.Text);
    curSaida := Conta.MovimentacaoCredito(edtNUM_MES.Text,edtNUM_ANO.Text
                                          ,edtNUM_MES.Text,edtNUM_ANO.Text);
    curSaldoFinal := Conta.Saldo(edtNUM_MES.Text,edtNUM_ANO.Text);
    Conta.Free;
  end;
  curSaldoFinalTotal := curSaldoFinalTotal + curSaldoFinal;
  lblValSaldoAntMaos.Caption := FormatCurr('#,##0.00',curSaldoAnt);
  lblValEntradaMaos.Caption := FormatCurr('#,##0.00',curEntrada);
  lblValSaidaMaos.Caption := FormatCurr('#,##0.00',curSaida);
  lblValSaldoFinalMaos.Caption := FormatCurr('#,##0.00',curSaldoFinal);

  // CONTA CONTA CORRENTE
  curSaldoAnt := 0;
  curEntrada := 0;
  curSaida := 0;
  curSaldoFinal := 0;

  if ContaCC <> -1 then
  begin
    Conta := TConta.Create(ContaCC);
    curSaldoAnt := Conta.SaldoAnterior(edtNUM_MES.Text,edtNUM_ANO.Text);
    curEntrada := Conta.MovimentacaoDebito(edtNUM_MES.Text,edtNUM_ANO.Text,edtNUM_MES.Text,edtNUM_ANO.Text);
    curSaida := Conta.MovimentacaoCredito(edtNUM_MES.Text,edtNUM_ANO.Text
                                          ,edtNUM_MES.Text,edtNUM_ANO.Text);
    curSaldoFinal := Conta.Saldo(edtNUM_MES.Text,edtNUM_ANO.Text);
    Conta.Free;
  end;
  curSaldoFinalTotal := curSaldoFinalTotal + curSaldoFinal;
  lblValSaldoAntCC.Caption := FormatCurr('#,##0.00',curSaldoAnt);
  lblValEntradaCC.Caption := FormatCurr('#,##0.00',curEntrada);
  lblValSaidaCC.Caption := FormatCurr('#,##0.00',curSaida);
  lblValSaldoFinalCC.Caption := FormatCurr('#,##0.00',curSaldoFinal);

  // CONTA OUTRA
  curSaldoAnt := 0;
  curEntrada := 0;
  curSaida := 0;
  curSaldoFinal := 0;

  if ContaOutra <> -1 then
  begin
    Conta := TConta.Create(ContaOutra);
    curSaldoAnt := Conta.SaldoAnterior(edtNUM_MES.Text,edtNUM_ANO.Text);
    curEntrada := Conta.MovimentacaoDebito(edtNUM_MES.Text,edtNUM_ANO.Text,edtNUM_MES.Text,edtNUM_ANO.Text);
    curSaida := Conta.MovimentacaoCredito(edtNUM_MES.Text,edtNUM_ANO.Text
                                          ,edtNUM_MES.Text,edtNUM_ANO.Text);
    curSaldoFinal := Conta.Saldo(edtNUM_MES.Text,edtNUM_ANO.Text);
    Conta.Free;
  end;
  curSaldoFinalTotal := curSaldoFinalTotal + curSaldoFinal;
  lblValSaldoAntOutra.Caption := FormatCurr('#,##0.00',curSaldoAnt);
  lblValEntradaOutra.Caption := FormatCurr('#,##0.00',curEntrada);
  lblValSaidaOutra.Caption := FormatCurr('#,##0.00',curSaida);
  lblValSaldoFinalOutra.Caption := FormatCurr('#,##0.00',curSaldoFinal);
  lblSaldoFinalTotal.Caption := FormatCurr('#,##0.00',curSaldoFinalTotal);
end;

procedure TfrmCAD_FECHAMENTO.ObrigacoesAberto;
var
  str: string;
  d: TDataSource;
  item: TListItem;
  curSaldo: Currency;
  Conta: TConta;
begin
  lvwObrigacoes.Items.Clear;

  str :=
  'Select '+
  'A.COD_CONTA,'+
  'A.NOM_CONTA'+
  ' From '+
  'VW_CAD_CONTA A'+
  ' Where '+
  '(A.FLG_TP_CONTA = '+cnn.Aspas('PCP')+' or '+
  ' A.FLG_TP_CONTA = '+cnn.Aspas('PLP')+') And '+
  'A.COD_CONTA <> '+IntToStr(ContaOMTJ_PCP);

  d := TDataSource.Create(Self);
  
  if not cnn.ExecuteQuery(str,d) then
    Exit;

  Conta := TConta.Create(0);

  while not d.DataSet.Eof do
  begin
    Conta.Conta := d.DataSet.FieldByName('COD_CONTA').AsInteger;
    curSaldo := Conta.Saldo(edtNUM_MES.Text,edtNUM_ANO.Text);
    if curSaldo > 0 then
    begin
      item := lvwObrigacoes.Items.Add;
      item.Caption := d.DataSet.FieldByName('COD_CONTA').AsString;
      item.SubItems.Add(d.DataSet.FieldByName('NOM_CONTA').AsString);
      item.SubItems.Add(FormatCurr('#,##0.00',curSaldo));
    end;
    d.DataSet.Next;
  end;
  
end;

procedure TfrmCAD_FECHAMENTO.LancamentosFechamento;
var
  item: TListItem;
  curValor: Currency;
  intContaDeb, intContaCre: integer;
  strContaDeb, strContaCre: string;
  strDesc: string;
  Conta: TConta;
begin
  curValor := 0;
  Conta := TConta.Create(0);

  if cboSaidaDinheiro.ItemIndex = 0 then
    intContaCre := ContaCaixa
  else if cboSaidaDinheiro.ItemIndex = 1 then
    intContaCre := ContaCC
  else if cboSaidaDinheiro.ItemIndex = 2 then
    intContaCre := ContaOutra;

  Conta.Conta := intContaCre;
  strContaCre := Conta.Nome;

  lvwLancamento.Items.Clear;

  //OMTJ - RESOLUÇÃO CONGREGAÇÃO (DESPESA)
  if trim(edtVAL_OMTJ_RES.Text) <> EmptyStr then
    curValor := StrToCur(edtVAL_OMTJ_RES.Text)
  else
    curValor := 0;

  if curValor > 0 then
  begin
    strDesc := 'OMTJ - Resolução Congregação';
    intContaDeb := ContaOMTJ_DES;
    Conta.Conta := intContaDeb;
    strContaDeb := Conta.Nome;
    item := lvwLancamento.Items.Add;
    item.Caption := strDesc;
    item.SubItems.Add(FormatCurr('#,##0.00',curValor));
    item.SubItems.Add(IntToStr(intContaDeb));
    item.SubItems.Add(strContaDeb);
    item.SubItems.Add(IntToStr(intContaCre));
    item.SubItems.Add(strContaCre);
    item.SubItems.Add(EmptyStr); //VALOR DE CONTROLE
  end;

  //OMTJ - OBRIGAÇÕES (RECEBIDO DONATIVOS)
  if trim(edtVAL_OMTJ.Text) <> EmptyStr then
    curValor := StrToCur(edtVAL_OMTJ.Text)
  else
    curValor := 0;

  if curValor > 0 then
  begin
    strDesc := 'OMTJ - Envio Donativos Recebidos';
    intContaDeb := ContaOMTJ_PCP;
    Conta.Conta := intContaDeb;
    strContaDeb := Conta.Nome;
    item := lvwLancamento.Items.Add;
    item.Caption := strDesc;
    item.SubItems.Add(FormatCurr('#,##0.00',curValor));
    item.SubItems.Add(IntToStr(intContaDeb));
    item.SubItems.Add(strContaDeb);
    item.SubItems.Add(IntToStr(intContaCre));
    item.SubItems.Add(strContaCre);
    item.SubItems.Add(EmptyStr); //VALOR DE CONTROLE
  end;

  //REMESSA DA AJUDA FINANCEIRA
  if trim(edtVAL_AJU_FIN.Text) <> EmptyStr then
    curValor := StrToCur(edtVAL_AJU_FIN.Text)
  else
    curValor := 0;

  if curValor > 0 then
  begin
    strDesc := 'Remessa Ajuda Financeira';
    intContaDeb := ContaDespAjudaFin;
    Conta.Conta := intContaDeb;
    strContaDeb := Conta.Nome;
    item := lvwLancamento.Items.Add;
    item.Caption := strDesc;
    item.SubItems.Add(FormatCurr('#,##0.00',curValor));
    item.SubItems.Add(IntToStr(intContaDeb));
    item.SubItems.Add(strContaDeb);
    item.SubItems.Add(IntToStr(intContaCre));
    item.SubItems.Add(strContaCre);
    item.SubItems.Add(EmptyStr); //VALOR DE CONTROLE
  end;

  //AUXÍLIO CALAMIDADE
  if trim(edtVAL_AUX_CAL.Text) <> EmptyStr then
    curValor := StrToCur(edtVAL_AUX_CAL.Text)
  else
    curValor := 0;

  if curValor > 0 then
  begin
    strDesc := 'Auxílio Calamidade';
    intContaDeb := ContaDespAuxilioCal;
    Conta.Conta := intContaDeb;
    strContaDeb := Conta.Nome;
    item := lvwLancamento.Items.Add;
    item.Caption := strDesc;
    item.SubItems.Add(FormatCurr('#,##0.00',curValor));
    item.SubItems.Add(IntToStr(intContaDeb));
    item.SubItems.Add(strContaDeb);
    item.SubItems.Add(IntToStr(intContaCre));
    item.SubItems.Add(strContaCre);
    item.SubItems.Add(EmptyStr); //VALOR DE CONTROLE
  end;

  //FUNDO PARA SALÕES DO REINO
  if trim(edtVAL_FUNDO_SR.Text) <> EmptyStr then
    curValor := StrToCur(edtVAL_FUNDO_SR.Text)
  else
    curValor := 0;

  if curValor > 0 then
  begin
    strDesc := 'Construção Mundial de Salões do Reino';
    intContaDeb := ContaDespFundoSR;
    Conta.Conta := intContaDeb;
    strContaDeb := Conta.Nome;
    item := lvwLancamento.Items.Add;
    item.Caption := strDesc;
    item.SubItems.Add(FormatCurr('#,##0.00',curValor));
    item.SubItems.Add(IntToStr(intContaDeb));
    item.SubItems.Add(strContaDeb);
    item.SubItems.Add(IntToStr(intContaCre));
    item.SubItems.Add(strContaCre);
    item.SubItems.Add(EmptyStr); //VALOR DE CONTROLE
  end;

  //CONTA CONGREGAÇÃO
  if trim(edtVAL_CONTA_CONG.Text) <> EmptyStr then
    curValor := StrToCur(edtVAL_CONTA_CONG.Text)
  else
    curValor := 0;

  if curValor > 0 then
  begin
    strDesc := 'Remessa Conta da Congregação';
    intContaDeb := ContaDespContaCong;
    Conta.Conta := intContaDeb;
    strContaDeb := Conta.Nome;
    item := lvwLancamento.Items.Add;
    item.Caption := strDesc;
    item.SubItems.Add(FormatCurr('#,##0.00',curValor));
    item.SubItems.Add(IntToStr(intContaDeb));
    item.SubItems.Add(strContaDeb);
    item.SubItems.Add(IntToStr(intContaCre));
    item.SubItems.Add(strContaCre);
    item.SubItems.Add(EmptyStr); //VALOR DE CONTROLE
  end;

  //DONATIVO PARA SALÃO DE ASSEMBLÉIAS
  if trim(edtVAL_SALAO_ASSEMB.Text) <> EmptyStr then
    curValor := StrToCur(edtVAL_SALAO_ASSEMB.Text)
  else
    curValor := 0;

  if curValor > 0 then
  begin
    strDesc := 'Salão de Assembléias';
    if trim(edtNOM_SALAO_ASSEMB.Text) <> EmptyStr then
      strDesc := strDesc+' de '+edtNOM_SALAO_ASSEMB.Text;
    intContaDeb := ContaDespSalaoAssemb;
    Conta.Conta := intContaDeb;
    strContaDeb := Conta.Nome;
    item := lvwLancamento.Items.Add;
    item.Caption := strDesc;
    item.SubItems.Add(FormatCurr('#,##0.00',curValor));
    item.SubItems.Add(IntToStr(intContaDeb));
    item.SubItems.Add(strContaDeb);
    item.SubItems.Add(IntToStr(intContaCre));
    item.SubItems.Add(strContaCre);
    item.SubItems.Add(EmptyStr); //VALOR DE CONTROLE
  end;

  //OUTROS DONATIVOS
  if trim(edtVAL_OUTROS_DONAT.Text) <> EmptyStr then
    curValor := StrToCur(edtVAL_OUTROS_DONAT.Text)
  else
    curValor := 0;

  if curValor > 0 then
  begin
    strDesc := 'Outros Donativos';
    if trim(edtNOM_OUTROS_DONAT.Text) <> EmptyStr then
      strDesc := strDesc+' ('+edtNOM_OUTROS_DONAT.Text+')';
    intContaDeb := ContaDespOutros;
    Conta.Conta := intContaDeb;
    strContaDeb := Conta.Nome;
    item := lvwLancamento.Items.Add;
    item.Caption := strDesc;
    item.SubItems.Add(FormatCurr('#,##0.00',curValor));
    item.SubItems.Add(IntToStr(intContaDeb));
    item.SubItems.Add(strContaDeb);
    item.SubItems.Add(IntToStr(intContaCre));
    item.SubItems.Add(strContaCre);
    item.SubItems.Add(EmptyStr); //VALOR DE CONTROLE
  end;


  //DEPÓSITO DO RESTANTE DO DINHEIRO NA C/C
  if chkDepContaCong.Checked then
    curValor := StrToCur(lblValorDiferenca.Caption)
  else
    curValor := 0;

  if curValor > 0 then
  begin
    strDesc := 'Depósito na Conta Corrente da Congregação';
    intContaDeb := ContaCC;
    Conta.Conta := intContaDeb;
    strContaDeb := Conta.Nome;
    item := lvwLancamento.Items.Add;
    item.Caption := strDesc;
    item.SubItems.Add(FormatCurr('#,##0.00',curValor));
    item.SubItems.Add(IntToStr(intContaDeb));
    item.SubItems.Add(strContaDeb);
    item.SubItems.Add(IntToStr(intContaCre));
    item.SubItems.Add(strContaCre);
    item.SubItems.Add('DEP_CC'); //VALOR DE CONTROLE
  end;


end;

procedure TfrmCAD_FECHAMENTO.optDinheiroMaosClick(Sender: TObject);
begin
  inherited;
  CalculaDiferenca;
  LancamentosFechamento;
end;



procedure TfrmCAD_FECHAMENTO.CalculaDiferenca;
var
  curValor, curValorTotal: Currency;
begin

  curValorTotal := StrToCur(lblValorTotalEnviar.Caption);

  if cboSaidaDinheiro.ItemIndex = 0 then
  begin
    lbl.Caption := cboSaidaDinheiro.Text;
    lblValor.Caption := lblValSaldoFinalMaos.Caption;
    lblDiferenca.Caption := 'Dif. (Mãos - Enviar):';
  end
  else if cboSaidaDinheiro.ItemIndex = 1 then
  begin
    lbl.Caption := cboSaidaDinheiro.Text;
    lblValor.Caption := lblValSaldoFinalCC.Caption;
    lblDiferenca.Caption := 'Dif. (C/C - Enviar):';
  end
  else if cboSaidaDinheiro.ItemIndex = 2 then
  begin
    lbl.Caption := cboSaidaDinheiro.Text;
    lblValor.Caption := lblValSaldoFinalOutra.Caption;
    lblDiferenca.Caption := 'Dif. (Outra - Enviar):';
  end;

  curValor := StrToCur(lblValor.Caption);
  curValor := curValor - curValorTotal;
  lblValorDiferenca.Caption := FormatCurr('#,##0.00',curValor);

  if curValor >= 0 then
  begin
    lblDiferenca.Font.Color := clBlue;
    lblValorDiferenca.Font.Color := clBlue;
  end
  else
  begin
    lblDiferenca.Font.Color := clRed;
    lblValorDiferenca.Font.Color := clRed;
  end;
end;

procedure TfrmCAD_FECHAMENTO.optContaCorrenteClick(Sender: TObject);
begin
  inherited;
  CalculaDiferenca;
  LancamentosFechamento;
end;

procedure TfrmCAD_FECHAMENTO.optOutraClick(Sender: TObject);
begin
  inherited;
  CalculaDiferenca;
  LancamentosFechamento;
end;

procedure TfrmCAD_FECHAMENTO.btnIncluiClick(Sender: TObject);
var
  str,strSqlNumLanc: string;
  i: integer;
  ds: TSimpleDataSet;
  strData: string;
  strTpLanc: string;
  strCodCT: string;
begin

  if tab.TabIndex = 0 then
    tab.TabIndex := 1;

  if MessageDlg('Confirma Fechamento?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  str := MontaSql(tpInsert);

  strSqlNumLanc := 'Select Max(NUM_LANCAMENTO) + 1 NUM_LANCAMENTO From MOV_LANCAMENTO';

  cnn.BeginTrans;

  try
    cnn.Execute(str);

    if chkDepContaCong.Checked then
    begin
      str :=
      'Update CAD_FECHAMENTO '+
      '  Set VAL_DEP_CONG = ' + cnn.NumberToBD(lblValorDiferenca.Caption)+
      '  Where '+
      '  NUM_ANO = '+edtNUM_ANO.Text + ' And '+
      '  NUM_MES = '+edtNUM_MES.Text;

      cnn.Execute(str);
    end;

    for i := 0 to lvwLancamento.Items.Count-1 do
    begin
    
      if lvwLancamento.Items[i].SubItems[5] = 'DEP_CC' then
      begin
        strData := edtDAT_FECHAMENTO.Text;
        strTpLanc := TipoLancDep;
        strCodCT := cnn.Aspas('-');
      end
      else
      begin
        strData := DateToStr(UltimoDiaMes(StrToInt(edtNUM_MES.Text),StrToInt(edtNUM_ANO.Text)));
        strTpLanc := TipoLancFec;
        strCodCT := 'NULL';
      end;

      cnn.ExecuteQuery(strSqlNumLanc,ds);

      str :=
      'Insert Into MOV_LANCAMENTO('+
      'NUM_LANCAMENTO,'+
      'COD_TP_LANC,'+
      'DAT_LANCAMENTO,'+
      'VAL_LANCAMENTO,'+
      'DSC_LANCAMENTO,'+
      'OBS_LANCAMENTO,'+
      'COD_CONTA_DEB,'+
      'COD_CONTA_CRE,'+
      'COD_CT,'+
      'FLG_ES'+
      ') Values ('+
      ds.FieldByName('NUM_LANCAMENTO').AsString+','+
      cnn.Aspas(strTpLanc)+','+
      cnn.To_Date(strData)+','+
      cnn.NumberToBD(lvwLancamento.Items[i].SubItems[0])+','+
      cnn.Aspas(lvwLancamento.Items[i].Caption)+','+
      cnn.Aspas('FECHAMENTO: '+LPAD(edtNUM_MES.Text,2,'0')+'/'+edtNUM_ANO.Text)+','+
      lvwLancamento.Items[i].SubItems[1]+','+
      lvwLancamento.Items[i].SubItems[3]+','+
      strCodCT+','+
      cnn.Aspas('S')+')';

      cnn.Execute(str);

      str :=
      'Insert Into INT_FECH_LANC('+
      'NUM_ANO,'+
      'NUM_MES,'+
      'NUM_LANCAMENTO'+
      ') Values ('+
      edtNUM_ANO.Text+','+
      edtNUM_MES.Text+','+
      ds.FieldByName('NUM_LANCAMENTO').AsString+')';

      cnn.Execute(str);

    end;
  except
    cnn.Rollback;
    exit;
  end;

  cnn.Commit;

  MessageDlg('Fechamento realizado com sucesso.',mtInformation,[mbOK],0);

  HabilitaEdicao(False);

  cboSaidaDinheiro.ItemIndex := 0;

end;

procedure TfrmCAD_FECHAMENTO.btnExcluiClick(Sender: TObject);
var
  str: string;
  ds: TSimpleDataSet;
begin
  if MessageDlg('Confirma Exclusão do Fechamento?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  cnn.BeginTrans;

  try
    str := 'Select * From INT_FECH_LANC'+
           '  Where '+
           'NUM_ANO = '+edtNUM_ANO.Text+' And '+
           'NUM_MES = '+edtNUM_MES.Text;

    cnn.ExecuteQuery(str,ds);

    str := 'Delete From INT_FECH_LANC '+
           '  Where '+
           'NUM_ANO = '+edtNUM_ANO.Text+' And '+
           'NUM_MES = '+edtNUM_MES.Text;

    cnn.Execute(str);

    while not ds.Eof do
    begin
      str := 'Delete From MOV_LANCAMENTO '+
             '  Where '+
             'NUM_LANCAMENTO = '+ds.FieldByName('NUM_LANCAMENTO').AsString;
      cnn.Execute(str);             
      ds.Next;
    end;

    str := 'Delete From CAD_FECHAMENTO '+
           '  Where '+
           'NUM_ANO = '+edtNUM_ANO.Text+' And '+
           'NUM_MES = '+edtNUM_MES.Text;

    cnn.Execute(str);

  except
    cnn.Rollback;
    exit;
  end;

  cnn.Commit;

  MessageDlg('Exclusão do Fechamento realizado com sucesso.',mtInformation,[mbOK],0);

  HabilitaEdicao(False);

  cboSaidaDinheiro.ItemIndex := 0;

end;

procedure TfrmCAD_FECHAMENTO.cboSaidaDinheiroChange(Sender: TObject);
begin
  inherited;

  CalculaRemessaAssociacao;
  CalculaVerificacao;
  CalculaDiferenca;

  //SUGESTÃO DE DEPOSITAR O DINHEIRO RESTANTE NA
  //CONTA DA CONGREGAÇÃO
  if (cboSaidaDinheiro.ItemIndex = 0) then
  begin
    if (StrToCur(lblValorDiferenca.Caption) > 0) then
    begin
      chkDepContaCong.Checked := true;
      chkDepContaCong.Enabled := true;
    end
    else
    begin
      chkDepContaCong.Checked := false;
      chkDepContaCong.Enabled := false;
    end;
  end
  else
  begin
    chkDepContaCong.Checked := false;
    chkDepContaCong.Enabled := false;
  end;

  LancamentosFechamento;

end;

procedure TfrmCAD_FECHAMENTO.chkDepContaCongClick(Sender: TObject);
begin
  inherited;
  CalculaRemessaAssociacao;
  CalculaVerificacao;
  CalculaDiferenca;
  LancamentosFechamento;
end;



end.
