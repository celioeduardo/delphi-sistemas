unit UGerenciamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, UComponentTag, UConexao, UGlobal, SimpleDS, StdCtrls,
  RpDefine, RpBase, RpSystem, Mask, EditLabel;

type
  TTipoRelatorio = (FOLHA_CONTAS,FOLHA_CONTAS_VERSO,RELATORIO_MENSAL,
    FORMULARIO_REMESSA_DONATIVO,CAPA_MENSAL,GUIA_DEPOSITO,CAPA_DONATIVO);

  TfrmGerencial = class(TForm)
    tab: TPageControl;
    tabFolhaContas: TTabSheet;
    lvwFolhaContas: TListViewTag;
    tabConfrontoObrigacoes: TTabSheet;
    GroupBox1: TGroupBox;
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
    Label6: TLabel;
    lblSaldoFinalTotal: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    GroupBox2: TGroupBox;
    lvwObrigacoes: TListViewTag;
    Label9: TLabel;
    Label12: TLabel;
    lvwObrigacoesLongoPrazo: TListViewTag;
    lblTotalObrigacoes: TLabel;
    Label17: TLabel;
    tabResumoMensal: TTabSheet;
    Label16: TLabel;
    lblSaldoInicioMes: TLabel;
    lvwReceita: TListViewTag;
    Label21: TLabel;
    lblTotalReceita: TLabel;
    Label23: TLabel;
    lvwDespesa: TListViewTag;
    lblTotalDespesa: TLabel;
    Label25: TLabel;
    lblSuperavitDeficit: TLabel;
    Label28: TLabel;
    lblSaldoFimMes: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    GroupBox3: TGroupBox;
    Label32: TLabel;
    lblDescEnvioOMTJ: TLabel;
    Label34: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    lblConfDonativosOMTJ: TLabel;
    lblConfDonativosCong: TLabel;
    lblConfTotalRecebido: TLabel;
    Label43: TLabel;
    lblConfSaldoInicioMes: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    lblConfDespesasCong: TLabel;
    lblConfEnvioOMTJ: TLabel;
    lblConfTotalGasto: TLabel;
    Label52: TLabel;
    lblConfSaldoFimMes: TLabel;
    lblTotalOMTJ: TLabel;
    tabImpressao: TTabSheet;
    RvSys: TRvSystem;
    btnImprimirFolhaContas: TButton;
    GroupBox4: TGroupBox;
    edtNOM_SECRETARIO: TEditLabel;
    edtNOM_CONGREGACAO: TEditLabel;
    edtNUM_CONGREGACAO: TEditLabel;
    edtNOM_CIDADE: TEditLabel;
    edtNOM_ESTADO: TEditLabel;
    edtNOM_UF: TEditLabel;
    edtNOM_SERVO_CONTAS: TEditLabel;
    btnFolhaContasVerso: TButton;
    btnRelatorioMensal: TButton;
    btnRemessaDonativo: TButton;
    edtDatRemessaDonativo: TEditLabel;
    btnCapaMensal: TButton;
    btnCalculaDinheiro: TButton;
    tabImpressaoComplementar: TPageControl;
    tabGuiaDeposito: TTabSheet;
    GroupBox5: TGroupBox;
    edtNOM_BANCO: TEditLabel;
    edtNUM_AGENCIA: TEditLabel;
    edtNOM_FAVORECIDO: TEditLabel;
    edtNUM_CONTA_DEPOSITO: TEditLabel;
    edtVAL_DEPOSITO: TEditLabel;
    btnDadosAssociacao: TButton;
    btnDadosCongregacao: TButton;
    btnLimparDadosDeposito: TButton;
    btnImprimirGuiaDeposito: TButton;
    lvwDeposito: TListViewTag;
    btnIncluir: TButton;
    btnLimpaListaDeposito: TButton;
    edtCOD_PUBLICO: TEditLabel;
    edtNOM_PUBLICO: TEditTag;
    tabCapaRecibo: TTabSheet;
    chkSalaoReino: TCheckBoxTag;
    chkOMTJ: TCheckBoxTag;
    chkAssembleiaEspecial: TCheckBoxTag;
    chkAssembleiaCircuito: TCheckBoxTag;
    chkCongresso: TCheckBoxTag;
    btnImpCapaRecibo: TButton;
    tabCritica: TTabSheet;
    lvwCritica: TListViewTag;
    chkConstrucaoSR: TCheckBoxTag;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnImprimirFolhaContasClick(Sender: TObject);
    procedure RvSysPrint(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnRelatorioMensalClick(Sender: TObject);
    procedure btnFolhaContasVersoClick(Sender: TObject);
    procedure btnRemessaDonativoClick(Sender: TObject);
    procedure btnCapaMensalClick(Sender: TObject);
    procedure btnCalculaDinheiroClick(Sender: TObject);
    procedure btnLimparDadosDepositoClick(Sender: TObject);
    procedure btnDadosAssociacaoClick(Sender: TObject);
    procedure btnDadosCongregacaoClick(Sender: TObject);
    procedure btnImprimirGuiaDepositoClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnLimpaListaDepositoClick(Sender: TObject);
    procedure edtCOD_PUBLICOClickButton(Sender: TObject);
    procedure edtCOD_PUBLICOExit(Sender: TObject);
    procedure btnImpCapaReciboClick(Sender: TObject);
  private
    arrMes: array [1..12] of string;
      
    ContaCaixa: integer;
    ContaCC: integer;
    ContaOutra: integer;
    ContaOMTJ_PCP: integer;
    ContaOMTJ_DES: integer;

    TipoLancFec: string;
    ContaDespFundoSR: integer;
    ContaDespSalaoAssemb: integer;
    ContaDespAjudaFin: integer;
    ContaDespAuxilioCal: integer;
    ContaDespContaCong: integer;
    ContaDespOutros: integer;

    intMaxLinhasFolhaContas: integer;
    intMaxLinhasFolhaContasVerso:integer;

    procedure CarregaConfiguracao;
    procedure MontaFolhaContas;
    procedure CalculaVerificacao;
    procedure ObrigacoesAberto;
    procedure ResumoMensal;
    procedure VerificaValores;
    procedure ImprimirFolhaContas;
    procedure ImprimirFolhaContasVerso;
    procedure ImprimirRelatorioMensal;
    procedure ImprimirRemessaDonativo;

    procedure ImprimirCapaMensal;
    procedure ImprimirGuiaDeposito;
    procedure ImprimirCapaRecibo;

    procedure SugereDadosDeposito(strTipo: string);
    procedure CarregaDadosPublicoDeposito(intCodPublico: integer);
    //TESTE
    procedure PopulaFolhaContasTeste(intLinhas: integer = 74);
    function PesquisaNova(Sender: TObject; blnValida,
      Msg: boolean): boolean;
  public

  end;

var
  frmGerencial: TfrmGerencial;
  cnn: TConexao;
  intMes,intAno:integer;
  TipoRelatorio: TTipoRelatorio;
implementation

{$R *.dfm}

uses UPrincipal, Functions, DB, UConta, UCalcDinheiro, UPesquisa;

procedure TfrmGerencial.FormCreate(Sender: TObject);
begin
  arrMes[1] := 'JANEIRO';
  arrMes[2] := 'FEVEREIRO';
  arrMes[3] := 'MARÇO';
  arrMes[4] := 'ABRIL';
  arrMes[5] := 'MAIO';
  arrMes[6] := 'JUNHO';
  arrMes[7] := 'JULHO';
  arrMes[8] := 'AGOSTO';
  arrMes[9] := 'SETEMBRO';
  arrMes[10] := 'OUTUBRO';
  arrMes[11] := 'NOVEMBRO';
  arrMes[12] := 'DEZEMBRO';

  //CONFIGURAÇÃO DA FOLHA DE CONTAS
  intMaxLinhasFolhaContas := 52;
  intMaxLinhasFolhaContasVerso := 23;

  edtDatRemessaDonativo.Text := DateToStr(Date);

  cnn := TConexao.Create(GloStrUser,GloStrPassword,GloStrDatabase, GloStrServer, GloBlnEmbedded);
  cnn.Open;
  tab.ActivePageIndex := 0;
  Caption := 'Gerenciamento '+frmPrincipal.cboMes.Text+'/'+frmPrincipal.edtAno.Text;
  CarregaConfiguracao;
  MontaFolhaContas;
  CalculaVerificacao;
  ObrigacoesAberto;
  ResumoMensal;
  VerificaValores;
  Show;
end;

procedure TfrmGerencial.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  cnn.Close;
  Action := caFree;
end;

procedure TfrmGerencial.CarregaConfiguracao;
var
  str: string;
  ds: TSimpleDataSet;
begin
  intMes := frmPrincipal.cboMes.ItemIndex+1;
  intAno := strToInt(frmPrincipal.edtAno.Text);

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

  edtNOM_SERVO_CONTAS.Text := ds.FieldByName('NOM_SERVO_CONTAS').AsString;
  edtNOM_SECRETARIO.Text := ds.FieldByName('NOM_SECRETARIO').AsString;
  edtNOM_CONGREGACAO.Text := ds.FieldByName('NOM_CONGREGACAO').AsString;
  edtNUM_CONGREGACAO.Text := ds.FieldByName('NUM_CONGREGACAO').AsString;
  edtNOM_CIDADE.Text := ds.FieldByName('NOM_CIDADE').AsString;
  edtNOM_ESTADO.Text := ds.FieldByName('NOM_ESTADO').AsString;
  edtNOM_UF.Text := ds.FieldByName('NOM_UF').AsString;

end;


procedure TfrmGerencial.MontaFolhaContas;
var
  ds:TSimpleDataSet;
  d: TDataSource;
  str: string;
  item: TListItem;
  strDesc: string;
  curValor: Currency;
  i: integer;
  curSomaEntMaos, curSomaEntCC, curSomaEntOutra: Currency;
  curSomaSaiMaos, curSomaSaiCC, curSomaSaiOutra: Currency;
begin

  //PopulaFolhaContasTeste();
  //Exit;

  lvwFolhaContas.Items.Clear;

  str :=
  'Select '+
  'DAT_LANCAMENTO,'+
  'DSC_LANCAMENTO,'+
  'COD_CT,'+
  'Case COD_CONTA_DEB '+
  '  When '+IntToStr(ContaCaixa)+' Then VAL_LANCAMENTO '+
  '  Else NULL '+
  'End ENTRADA_MAOS,'+
  'Case COD_CONTA_CRE '+
  '  When '+IntToStr(ContaCaixa)+' Then VAL_LANCAMENTO '+
  '  Else NULL '+
  'End SAIDA_MAOS, '+
  'Case COD_CONTA_DEB '+
  '  When '+IntToStr(ContaCC)+' Then VAL_LANCAMENTO '+
  '  Else NULL '+
  'End ENTRADA_CC,'+
  'Case COD_CONTA_CRE '+
  '  When '+IntToStr(ContaCC)+' Then VAL_LANCAMENTO '+
  '  Else NULL '+
  'End SAIDA_CC, '+
  'Case COD_CONTA_DEB '+
  '  When '+IntToStr(ContaOutra)+' Then VAL_LANCAMENTO '+
  '  Else NULL '+
  'End ENTRADA_OUTRA,'+
  'Case COD_CONTA_CRE '+
  '  When '+IntToStr(ContaOutra)+' Then VAL_LANCAMENTO '+
  '  Else NULL '+
  'End SAIDA_OUTRA, '+
  'Case '+
  '  When COD_CONTA_DEB In ('+IntToStr(ContaCaixa)+','+IntToStr(ContaCC)+','+IntToStr(ContaOutra)+')'+
  '  Then 1 '+
  '  Else 2 '+
  'End ORDEM'+
  ' From MOV_LANCAMENTO '+
  ' Where '+
  'DAT_LANCAMENTO >= '+ cnn.DateToBD(PrimeiroDiaMes(intMes,intAno)) +' And '+
  'DAT_LANCAMENTO <= '+ cnn.DateToBD(UltimoDiaMes(intMes,intAno)) +' And '+
  'COD_CT Is Not Null'+
  ' Order By DAT_LANCAMENTO,10,6,8';

  cnn.ExecuteQuery(str,ds);

  lvwFolhaContas.Items.Clear;

  while not ds.Eof do
  begin
    item := lvwFolhaContas.Items.Add;
    item.Caption := Copy(ds.FieldByName('DAT_LANCAMENTO').AsString,1,2);
    item.SubItems.Add(ds.FieldByName('DSC_LANCAMENTO').AsString);
    item.SubItems.Add(ds.FieldByName('COD_CT').AsString);

    if trim(ds.FieldByName('ENTRADA_MAOS').AsString) <> EmptyStr then
      item.SubItems.Add(FormatCurr('#,##0.00',ds.FieldByName('ENTRADA_MAOS').AsCurrency))
    else
      item.SubItems.Add(EmptyStr);

    if trim(ds.FieldByName('SAIDA_MAOS').AsString) <> EmptyStr then
      item.SubItems.Add(FormatCurr('#,##0.00',ds.FieldByName('SAIDA_MAOS').AsCurrency))
    else
      item.SubItems.Add(EmptyStr);

    if trim(ds.FieldByName('ENTRADA_CC').AsString) <> EmptyStr then
      item.SubItems.Add(FormatCurr('#,##0.00',ds.FieldByName('ENTRADA_CC').AsCurrency))
    else
      item.SubItems.Add(EmptyStr);

    if trim(ds.FieldByName('SAIDA_CC').AsString) <> EmptyStr then
      item.SubItems.Add(FormatCurr('#,##0.00',ds.FieldByName('SAIDA_CC').AsCurrency))
    else
      item.SubItems.Add(EmptyStr);

    if trim(ds.FieldByName('ENTRADA_OUTRA').AsString) <> EmptyStr then
      item.SubItems.Add(FormatCurr('#,##0.00',ds.FieldByName('ENTRADA_OUTRA').AsCurrency))
    else
      item.SubItems.Add(EmptyStr);

    if trim(ds.FieldByName('SAIDA_OUTRA').AsString) <> EmptyStr then
      item.SubItems.Add(FormatCurr('#,##0.00',ds.FieldByName('SAIDA_OUTRA').AsCurrency))
    else
      item.SubItems.Add(EmptyStr);

    ds.Next;
  end;

  // VALOR TOTAL ENVIADO PARA A ASSOCIAÇÃO
  str :=
  'Select '+
  'Sum(A.VAL_LANCAMENTO) VAL_LANCAMENTO, '+
  'Min(A.COD_CONTA_CRE) COD_CONTA_CRE, '+
  'Min(A.DAT_LANCAMENTO) DAT_LANCAMENTO '+
  'From '+
  'MOV_LANCAMENTO A,'+
  'INT_FECH_LANC B'+
  ' Where '+
  'A.NUM_LANCAMENTO = B.NUM_LANCAMENTO And '+
  'B.NUM_ANO = '+IntToStr(intAno)+' And '+
  'B.NUM_MES = '+IntToStr(intMes)+' And '+
  'A.COD_CONTA_DEB In ('+IntToStr(ContaOMTJ_PCP)+','+
                         IntToStr(ContaOMTJ_DES)+','+
                         IntToStr(ContaDespFundoSR)+','+
                         IntToStr(ContaDespSalaoAssemb)+','+
                         IntToStr(ContaDespAjudaFin)+','+
                         IntToStr(ContaDespAuxilioCal)+','+
                         IntToStr(ContaDespContaCong)+','+
                         IntToStr(ContaDespOutros)+')';

  if cnn.ExecuteQuery(str,d) then
  begin
    if d.DataSet.FieldByName('DAT_LANCAMENTO').AsString <> EmptyStr then
    begin
      strDesc := 'Para Associação S-(d)-20-T:';
      item := lvwFolhaContas.Items.Add;
      item.Caption := Copy(d.DataSet.FieldByName('DAT_LANCAMENTO').AsString,1,2);
      item.SubItems.Add(strDesc);
      item.SubItems.Add('D');
      item.SubItems.Add(EmptyStr); //ENTRADA MÃOS
      if (d.DataSet.FieldByName('COD_CONTA_CRE').AsInteger = ContaCaixa) then
        item.SubItems.Add(FormatCurr('#,##0.00',d.DataSet.FieldByName('VAL_LANCAMENTO').AsCurrency)) //ENTRADA MÃOS
      else
        item.SubItems.Add(EmptyStr);

      item.SubItems.Add(EmptyStr); //SAÍDA MÃOS

      if (d.DataSet.FieldByName('COD_CONTA_CRE').AsInteger = ContaCC) then
        item.SubItems.Add(FormatCurr('#,##0.00',d.DataSet.FieldByName('VAL_LANCAMENTO').AsCurrency)) //ENTRADA CC
      else
        item.SubItems.Add(EmptyStr);

      item.SubItems.Add(EmptyStr); //SAÍDA CC

      if (d.DataSet.FieldByName('COD_CONTA_CRE').AsInteger = ContaOutra) then
        item.SubItems.Add(FormatCurr('#,##0.00',d.DataSet.FieldByName('VAL_LANCAMENTO').AsCurrency)) //ENTRADA OUTRA
      else
        item.SubItems.Add(EmptyStr);

      item.SubItems.Add(EmptyStr); //SAÍDA OUTRA

    end;        
  end;

  // RESOLUÇÃO DA CONGREGAÇÃO PARA OBRA MUNDIAL
  str :=
  'Select '+
  'Sum(A.VAL_LANCAMENTO) VAL_LANCAMENTO '+
  'From '+
  'MOV_LANCAMENTO A,'+
  'INT_FECH_LANC B'+
  ' Where '+
  'A.NUM_LANCAMENTO = B.NUM_LANCAMENTO And '+
  'B.NUM_ANO = '+IntToStr(intAno)+' And '+
  'B.NUM_MES = '+IntToStr(intMes)+' And '+
  'A.COD_CONTA_DEB = '+IntToStr(ContaOMTJ_DES);

  if cnn.ExecuteQuery(str,d) then
    curValor := d.DataSet.FieldByName('VAL_LANCAMENTO').AsCurrency
  else
    curValor := 0;

  // DONATIVO ENVIADO DA OBRA MUNDIAL
  str :=
  'Select '+
  'Sum(A.VAL_LANCAMENTO) VAL_LANCAMENTO '+
  'From '+
  'MOV_LANCAMENTO A,'+
  'INT_FECH_LANC B'+
  ' Where '+
  'A.NUM_LANCAMENTO = B.NUM_LANCAMENTO And '+
  'B.NUM_ANO = '+IntToStr(intAno)+' And '+
  'B.NUM_MES = '+IntToStr(intMes)+' And '+
  'A.COD_CONTA_DEB = '+IntToStr(ContaOMTJ_PCP);

  if cnn.ExecuteQuery(str,d) then
  begin
    if d.DataSet.FieldByName('VAL_LANCAMENTO').AsString <> EmptyStr then
    begin
      if curValor > 0 then
        strDesc := '  OMTJ (Incluso R$ '+FormatCurr('#,##0.00',curValor)+
                   '): R$ '+FormatCurr('#,##0.00',d.DataSet.FieldByName('VAL_LANCAMENTO').AsCurrency+curValor)
      else
        strDesc := '  OMTJ: R$ '+FormatCurr('#,##0.00',d.DataSet.FieldByName('VAL_LANCAMENTO').AsCurrency);

      item := lvwFolhaContas.Items.Add;
      item.SubItems.Add(strDesc);
      item.SubItems.Add(EmptyStr);
      item.SubItems.Add(EmptyStr);
      item.SubItems.Add(EmptyStr);
      item.SubItems.Add(EmptyStr);
      item.SubItems.Add(EmptyStr);
      item.SubItems.Add(EmptyStr);
      item.SubItems.Add(EmptyStr);
    end;
  end;

  // OUTROS DONATIVOS ENVIADOS PARA A ASSOCIAÇÃO
  str :=
  'Select '+
  'DSC_LANCAMENTO,'+
  'VAL_LANCAMENTO'+
  ' From '+
  'MOV_LANCAMENTO A,'+
  'INT_FECH_LANC B'+
  ' Where '+
  'A.NUM_LANCAMENTO = B.NUM_LANCAMENTO And '+
  'B.NUM_ANO = '+IntToStr(intAno)+' And '+
  'B.NUM_MES = '+IntToStr(intMes)+' And '+
  'A.COD_CONTA_DEB In ('+IntToStr(ContaDespFundoSR)+','+
                         IntToStr(ContaDespSalaoAssemb)+','+
                         IntToStr(ContaDespAjudaFin)+','+
                         IntToStr(ContaDespAuxilioCal)+','+
                         IntToStr(ContaDespContaCong)+','+
                         IntToStr(ContaDespOutros)+')';


  cnn.ExecuteQuery(str,d);

  while not d.DataSet.Eof do
  begin
    strDesc := '  '+Trim(d.DataSet.FieldByName('DSC_LANCAMENTO').AsString);
    strDesc := strDesc + ': R$ '+
      FormatCurr('#,##0.00',d.DataSet.FieldByName('VAL_LANCAMENTO').AsCurrency);
    item := lvwFolhaContas.Items.Add;
    item.SubItems.Add(strDesc);
    item.SubItems.Add(EmptyStr);
    item.SubItems.Add(EmptyStr);
    item.SubItems.Add(EmptyStr);
    item.SubItems.Add(EmptyStr);
    item.SubItems.Add(EmptyStr);
    item.SubItems.Add(EmptyStr);
    item.SubItems.Add(EmptyStr);
    d.DataSet.Next;
  end;

  //SOMA VALORES
  curSomaEntMaos := 0;
  curSomaEntCC := 0;
  curSomaEntOutra := 0;
  curSomaSaiMaos := 0;
  curSomaSaiCC := 0;
  curSomaSaiOutra := 0;

  for i := 0 to lvwFolhaContas.Items.Count-1 do
  begin
    try
      if trim(lvwFolhaContas.Items[i].SubItems[2]) <> EmptyStr then
        curSomaEntMaos := curSomaEntMaos + StrToCur(lvwFolhaContas.Items[i].SubItems[2]);
    except end;

    try
      if trim(lvwFolhaContas.Items[i].SubItems[3]) <> EmptyStr then
        curSomaSaiMaos := curSomaSaiMaos + StrToCur(lvwFolhaContas.Items[i].SubItems[3]);
    except end;

    try
      if trim(lvwFolhaContas.Items[i].SubItems[4]) <> EmptyStr then
        curSomaEntCC := curSomaEntCC + StrToCur(lvwFolhaContas.Items[i].SubItems[4]);
    except end;

    try
      if trim(lvwFolhaContas.Items[i].SubItems[5]) <> EmptyStr then
        curSomaSaiCC := curSomaSaiCC + StrToCur(lvwFolhaContas.Items[i].SubItems[5]);
    except end;

    try
      if trim(lvwFolhaContas.Items[i].SubItems[6]) <> EmptyStr then
        curSomaEntOutra := curSomaEntOutra + StrToCur(lvwFolhaContas.Items[i].SubItems[6]);
    except end;

    try
      if trim(lvwFolhaContas.Items[i].SubItems[7]) <> EmptyStr then
        curSomaSaiOutra := curSomaSaiOutra + StrToCur(lvwFolhaContas.Items[i].SubItems[7]);
    except end;

  end;

  if curSomaEntMaos + curSomaSaiMaos + curSomaEntCC + curSomaSaiCC +
     curSomaEntOutra + curSomaSaiOutra > 0 then
  begin
    item := lvwFolhaContas.Items.Add;
    item.SubItems.Add('TOTAIS COLUNAS');
    item.SubItems.Add(EmptyStr);
    item.SubItems.Add(FormatCurr('#,##0.00',curSomaEntMaos));
    item.SubItems.Add(FormatCurr('#,##0.00',curSomaSaiMaos));
    item.SubItems.Add(FormatCurr('#,##0.00',curSomaEntCC));
    item.SubItems.Add(FormatCurr('#,##0.00',curSomaSaiCC));
    item.SubItems.Add(FormatCurr('#,##0.00',curSomaEntOutra));
    item.SubItems.Add(FormatCurr('#,##0.00',curSomaSaiOutra));
  end;
end;

procedure TfrmGerencial.CalculaVerificacao;
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

  if ContaCaixa <> -1 then
  begin
    Conta := TConta.Create(ContaCaixa);
    curSaldoAnt := Conta.SaldoAnterior(IntToStr(intMes),IntToStr(intAno));
    curEntrada := Conta.MovimentacaoDebito(IntToStr(intMes),IntToStr(intAno),IntToStr(intMes),IntToStr(intAno));
    curSaida := Conta.MovimentacaoCredito(IntToStr(intMes),IntToStr(intAno)
                                          ,IntToStr(intMes),IntToStr(intAno));
    curSaldoFinal := Conta.Saldo(IntToStr(intMes),IntToStr(intAno));
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
    curSaldoAnt := Conta.SaldoAnterior(IntToStr(intMes),IntToStr(intAno));
    curEntrada := Conta.MovimentacaoDebito(IntToStr(intMes),IntToStr(intAno),IntToStr(intMes),IntToStr(intAno));
    curSaida := Conta.MovimentacaoCredito(IntToStr(intMes),IntToStr(intAno)
                                          ,IntToStr(intMes),IntToStr(intAno));
    curSaldoFinal := Conta.Saldo(IntToStr(intMes),IntToStr(intAno));
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
    curSaldoAnt := Conta.SaldoAnterior(IntToStr(intMes),IntToStr(intAno));
    curEntrada := Conta.MovimentacaoDebito(IntToStr(intMes),IntToStr(intAno),IntToStr(intMes),IntToStr(intAno));
    curSaida := Conta.MovimentacaoCredito(IntToStr(intMes),IntToStr(intAno)
                                          ,IntToStr(intMes),IntToStr(intAno));
    curSaldoFinal := Conta.Saldo(IntToStr(intMes),IntToStr(intAno));
    Conta.Free;
  end;
  curSaldoFinalTotal := curSaldoFinalTotal + curSaldoFinal;
  lblValSaldoAntOutra.Caption := FormatCurr('#,##0.00',curSaldoAnt);
  lblValEntradaOutra.Caption := FormatCurr('#,##0.00',curEntrada);
  lblValSaidaOutra.Caption := FormatCurr('#,##0.00',curSaida);
  lblValSaldoFinalOutra.Caption := FormatCurr('#,##0.00',curSaldoFinal);
  lblSaldoFinalTotal.Caption := FormatCurr('#,##0.00',curSaldoFinalTotal);
end;

procedure TfrmGerencial.ObrigacoesAberto;
var
  str: string;
  d: TDataSource;
  item: TListItem;
  curSaldo, curValor: Currency;
  Conta: TConta;
begin
  lvwObrigacoes.Items.Clear;
  lvwObrigacoesLongoPrazo.Items.Clear;

  str :=
  'Select '+
  'A.COD_CONTA,'+
  'A.NOM_CONTA'+
  ' From '+
  'CAD_CONTA A'+
  ' Where '+
  'A.FLG_TP_CONTA = '+cnn.Aspas('PCP')+' And '+
  'A.COD_CONTA <> '+IntToStr(ContaOMTJ_PCP);

  d := TDataSource.Create(Self);
  
  if not cnn.ExecuteQuery(str,d) then
    Exit;

  curValor := 0;
  Conta := TConta.Create(0);

  while not d.DataSet.Eof do
  begin
    Conta.Conta := d.DataSet.FieldByName('COD_CONTA').AsInteger;
    curSaldo := Conta.Saldo(IntToStr(intMes),IntToStr(intAno));
    if curSaldo > 0 then
    begin
      item := lvwObrigacoes.Items.Add;
      item.Caption := d.DataSet.FieldByName('COD_CONTA').AsString;
      item.SubItems.Add(d.DataSet.FieldByName('NOM_CONTA').AsString);
      item.SubItems.Add(FormatCurr('#,##0.00',curSaldo));
      curValor := curValor + curSaldo;
    end;
    d.DataSet.Next;
  end;

  //OBRIGAÇÕES LONGO PRAZO
  str :=
  'Select '+
  'A.COD_CONTA,'+
  'A.NOM_CONTA'+
  ' From '+
  'CAD_CONTA A'+
  ' Where '+
  'A.FLG_TP_CONTA = '+cnn.Aspas('PLP')+' And '+
  'A.COD_CONTA <> '+IntToStr(ContaOMTJ_PCP);

  d := TDataSource.Create(Self);
  
  if not cnn.ExecuteQuery(str,d) then
    Exit;

  while not d.DataSet.Eof do
  begin
    Conta.Conta := d.DataSet.FieldByName('COD_CONTA').AsInteger;
    curSaldo := Conta.Saldo(IntToStr(intMes),IntToStr(intAno));
    if curSaldo > 0 then
    begin
      item := lvwObrigacoesLongoPrazo.Items.Add;
      item.Caption := d.DataSet.FieldByName('COD_CONTA').AsString;
      item.SubItems.Add(d.DataSet.FieldByName('NOM_CONTA').AsString);
      item.SubItems.Add(FormatCurr('#,##0.00',curSaldo));
      curValor := curValor + curSaldo;
    end;
    d.DataSet.Next;
  end;

  lblTotalObrigacoes.Caption := FormatCurr('#,##0.00',curValor);
end;


procedure TfrmGerencial.ResumoMensal;
var
  str: string;
  d: TDataSource;
  item: TListItem;
  curReceita,curDespesa: Currency;
  curOMTJ,curOMTJ_DES: Currency;
begin
  curReceita := 0;
  curDespesa := 0;
  lvwReceita.Items.Clear;
  lvwDespesa.Items.Clear;

  lblSaldoInicioMes.Caption := FormatCurr('#,##0.00',StrToCur(lblValSaldoAntMaos.Caption) +
    StrToCur(lblValSaldoAntCC.Caption) + StrToCur(lblValSaldoAntOutra.Caption));

  //VALOR OMTJ
  str :=
  'Select '+
  'Sum(A.VAL_LANCAMENTO) VAL_LANCAMENTO'+
  ' From '+
  'MOV_LANCAMENTO A '+
  ' Where '+
  'A.COD_CONTA_DEB = '+IntToStr(ContaOMTJ_PCP)+ ' And '+
  'A.DAT_LANCAMENTO >= '+cnn.DateToBD(PrimeiroDiaMes(intMes,intAno)) + ' And '+
  'A.DAT_LANCAMENTO <= '+cnn.DateToBD(UltimoDiaMes(intMes,intAno));

  if cnn.ExecuteQuery(str,d) then
    curOMTJ := d.DataSet.FieldByName('VAL_LANCAMENTO').AsCurrency
  else
    curOMTJ := 0;

  //VALOR OMTJ RESOLUÇÃO
  str :=
  'Select '+
  'Sum(A.VAL_LANCAMENTO) VAL_LANCAMENTO'+
  ' From '+
  'MOV_LANCAMENTO A '+
  ' Where '+
  'A.COD_CONTA_DEB = '+IntToStr(ContaOMTJ_DES)+ ' And '+
  'A.DAT_LANCAMENTO >= '+cnn.DateToBD(PrimeiroDiaMes(intMes,intAno)) + ' And '+
  'A.DAT_LANCAMENTO <= '+cnn.DateToBD(UltimoDiaMes(intMes,intAno));

  if cnn.ExecuteQuery(str,d) then
    curOMTJ_DES := d.DataSet.FieldByName('VAL_LANCAMENTO').AsCurrency
  else
    curOMTJ_DES := 0;


  // RECEITAS //
  str :=
  'Select '+
  'B.NOM_CONTA,'+
  'Sum(A.VAL_LANCAMENTO) VAL_LANCAMENTO'+
  ' From '+
  'MOV_LANCAMENTO A,'+
  'CAD_CONTA B'+
  ' Where '+
  'A.COD_CONTA_CRE = B.COD_CONTA And '+
  // TIRAS AS CONTAS DE ATIVO (TRANSFERÊNCIAS. POR EXEMPLO: DEPÓSITOS. CAIXA PARA C/C)
  'B.FLG_TP_CONTA Not In ('+cnn.Aspas('ACP')+','+cnn.Aspas('ACP')+') And '+
  // TIRA AS RECEITAS RELACIONADAS COM OMTJ
  'A.COD_CONTA_CRE <> '+IntToStr(ContaOMTJ_PCP)+' And '+
  // AUMENTOU AS CONTAS DE ENTRADA DE DINHEIRO
  'A.COD_CONTA_DEB In ('+IntToStr(ContaCaixa)+','+IntToStr(ContaCC)+','+IntToStr(ContaOutra)+') And '+
  'A.DAT_LANCAMENTO >= '+cnn.DateToBD(PrimeiroDiaMes(intMes,intAno)) + ' And '+
  'A.DAT_LANCAMENTO <= '+cnn.DateToBD(UltimoDiaMes(intMes,intAno)) +
  'Group By B.NOM_CONTA '+
  'Order By Sum(A.VAL_LANCAMENTO) Desc ';

  cnn.ExecuteQuery(str,d);

  while not d.DataSet.Eof do
  begin
    item := lvwReceita.Items.Add;
    item.Caption := d.DataSet.FieldByName('NOM_CONTA').AsString;
    item.SubItems.Add(FormatCurr('#,##0.00',d.DataSet.FieldByName('VAL_LANCAMENTO').AsCurrency));
    curReceita := curReceita + d.DataSet.FieldByName('VAL_LANCAMENTO').AsCurrency;
    d.DataSet.Next;
  end;
  lblTotalReceita.Caption := FormatCurr('#,##0.00',curReceita);

  // DESPESAS //

  item := lvwDespesa.Items.Add;
  item.Caption := 'Donativos OMTJ conforme resolução da congregação';
  item.SubItems.Add(FormatCurr('#,##0.00',curOMTJ_DES));
  curDespesa := curDespesa + curOMTJ_DES;

  str :=
  'Select '+
  'B.NOM_CONTA,'+
  'Sum(A.VAL_LANCAMENTO) VAL_LANCAMENTO'+
  ' From '+
  'MOV_LANCAMENTO A,'+
  'CAD_CONTA B'+
  ' Where '+
  'A.COD_CONTA_DEB = B.COD_CONTA And '+
  // CONTAS DE DESPESA E PASSIVO
  'B.FLG_TP_CONTA In ('+cnn.Aspas('DES')+','+cnn.Aspas('PCP')+','+
              cnn.Aspas('PLP')+') And '+
  // TIRA AS DESPESAS RELACIONADAS COM OMTJ
  'A.COD_CONTA_DEB <> '+IntToStr(ContaOMTJ_PCP)+' And '+
  'A.COD_CONTA_DEB <> '+IntToStr(ContaOMTJ_DES)+' And '+
  // DIMINUIU AS CONTAS DE ENTRADA DE DINHEIRO
  'A.COD_CONTA_CRE In ('+IntToStr(ContaCaixa)+','+IntToStr(ContaCC)+','+IntToStr(ContaOutra)+') And '+
  'A.DAT_LANCAMENTO >= '+cnn.DateToBD(PrimeiroDiaMes(intMes,intAno)) + ' And '+
  'A.DAT_LANCAMENTO <= '+cnn.DateToBD(UltimoDiaMes(intMes,intAno)) +   
  'Group By B.NOM_CONTA '+
  'Order By 1';

  cnn.ExecuteQuery(str,d);

  while not d.DataSet.Eof do
  begin
    item := lvwDespesa.Items.Add;
    item.Caption := d.DataSet.FieldByName('NOM_CONTA').AsString;
    item.SubItems.Add(FormatCurr('#,##0.00',d.DataSet.FieldByName('VAL_LANCAMENTO').AsCurrency));
    curDespesa := curDespesa + d.DataSet.FieldByName('VAL_LANCAMENTO').AsCurrency;
    d.DataSet.Next;
  end;
  lblTotalDespesa.Caption := FormatCurr('#,##0.00',curDespesa);

  lblSuperavitDeficit.Caption := FormatCurr('#,##0.00',curReceita - curDespesa);

  lblSaldoFimMes.Caption := FormatCurr('#,##0.00',
    StrToCur(lblSaldoInicioMes.Caption) + curReceita - curDespesa);

  lblTotalOMTJ.Caption := FormatCurr('#,##0.00',curOMTJ + curOMTJ_DES);
  lblDescEnvioOMTJ.Caption := 'R$ '+FormatCurr('#,##0.00',curOMTJ + curOMTJ_DES)+
    '. "';

  // ATRIBUINDO VALORES AO CONFRONTO

  lblConfSaldoInicioMes.Caption := lblSaldoInicioMes.Caption;

  lblConfDonativosCong.Caption := FormatCurr('#,##0.00',curReceita);

  //VALOR OMTJ RECEBIDO DA CONTRIBUIÇÃO
  str :=
  'Select '+
  'Sum(A.VAL_LANCAMENTO) VAL_LANCAMENTO'+
  ' From '+
  'MOV_LANCAMENTO A '+
  ' Where '+
  'A.COD_CONTA_CRE = '+IntToStr(ContaOMTJ_PCP)+ ' And '+
  'A.DAT_LANCAMENTO >= '+cnn.DateToBD(PrimeiroDiaMes(intMes,intAno)) + ' And '+
  'A.DAT_LANCAMENTO <= '+cnn.DateToBD(UltimoDiaMes(intMes,intAno));

  if cnn.ExecuteQuery(str,d) then
    lblConfDonativosOMTJ.Caption := FormatCurr('#,##0.00',
      d.DataSet.FieldByName('VAL_LANCAMENTO').AsCurrency)
  else
    lblConfDonativosOMTJ.Caption := '0,00';

  lblConfTotalRecebido.Caption := FormatCurr('#,##0.00', curReceita +
    StrToCur(lblConfDonativosOMTJ.Caption));

  lblConfDespesasCong.Caption := FormatCurr('#,##0.00',curDespesa);
  lblConfEnvioOMTJ.Caption := FormatCurr('#,##0.00',curOMTJ);
  lblConfTotalGasto.Caption := FormatCurr('#,##0.00',curDespesa + curOMTJ);

  lblConfSaldoFimMes.Caption := FormatCurr('#,##0.00',
     StrToCur(lblConfSaldoInicioMes.Caption)+
     StrToCur(lblConfTotalRecebido.Caption)-
     StrToCur(lblConfTotalGasto.Caption));
end;

procedure TfrmGerencial.VerificaValores;
var
  str: string;
  i: integer;
  item: TListItem;
begin

  lvwCritica.Items.Clear;

  if StrToCur(lblSaldoFinalTotal.Caption) <> StrToCur(lblSaldoFimMes.Caption) then
  begin
    item := lvwCritica.Items.Add;
    item.Caption := 'O Saldo Final da Folha de Contas não bate com o do Resumo Mensal';
  end;

  if StrToCur(lblSaldoFinalTotal.Caption) <> StrToCur(lblConfSaldoFimMes.Caption) then
  begin
    item := lvwCritica.Items.Add;
    item.Caption := 'O Saldo Final da Folha de Contas não bate com o do Resumo Mensal - Confronto';
  end;

  if StrToCur(lblSaldoFimMes.Caption) <> StrToCur(lblConfSaldoFimMes.Caption) then
  begin
    item := lvwCritica.Items.Add;
    item.Caption := 'O Saldo Final do Resumo Mensal não bate com o do Resumo Mensal - Confronto';
  end;

  // VERIFICANDO SE OS TOTAIS REGISTRADAS NA FOLHA DE CONTAS
  // SÃO IGUAIS AOS TOTAIS DO CONFRONTO
  if lvwFolhaContas.Items.Count > 0 then
  begin
    i := lvwFolhaContas.Items.Count-1;
    //TOTAL ENTRADA MÃOS
    str := lvwFolhaContas.Items[i].SubItems[2];
    if StrToCur(lblValEntradaMaos.Caption) <> StrToCur(str) then
    begin
      item := lvwCritica.Items.Add;
      item.Caption := 'O Total de Entradas (Mãos) da Folha de Contas não bate com o '+
        'Confronto da Folha de Contas';
    end;
    //TOTAL SAÍDA MÃOS
    str := lvwFolhaContas.Items[i].SubItems[3];
    if StrToCur(lblValSaidaMaos.Caption) <> StrToCur(str) then
    begin
      item := lvwCritica.Items.Add;
      item.Caption := 'O Total de Saídas (Mãos) da Folha de Contas não bate com o '+
        'Confronto da Folha de Contas';
    end;

    //TOTAL ENTRADA C/C
    str := lvwFolhaContas.Items[i].SubItems[4];
    if StrToCur(lblValEntradaCC.Caption) <> StrToCur(str) then
    begin
      item := lvwCritica.Items.Add;
      item.Caption := 'O Total de Entradas (C/C) da Folha de Contas não bate com o '+
        'Confronto da Folha de Contas';
    end;
    //TOTAL SAÍDA C/C
    str := lvwFolhaContas.Items[i].SubItems[5];
    if StrToCur(lblValSaidaCC.Caption) <> StrToCur(str) then
    begin
      item := lvwCritica.Items.Add;
      item.Caption := 'O Total de Saídas (C/C) da Folha de Contas não bate com o '+
        'Confronto da Folha de Contas';
    end;

    //TOTAL ENTRADA OUTRA
    str := lvwFolhaContas.Items[i].SubItems[6];
    if StrToCur(lblValEntradaOutra.Caption) <> StrToCur(str) then
    begin
      item := lvwCritica.Items.Add;
      item.Caption := 'O Total de Entradas (Outra) da Folha de Contas não bate com o '+
        'Confronto da Folha de Contas';
    end;
    //TOTAL SAÍDA OUTRA
    str := lvwFolhaContas.Items[i].SubItems[7];
    if StrToCur(lblValSaidaOutra.Caption) <> StrToCur(str) then
    begin
      item := lvwCritica.Items.Add;
      item.Caption := 'O Total de Saídas (Outra) da Folha de Contas não bate com o '+
        'Confronto da Folha de Contas';
    end;

  end;

  if lvwCritica.Items.Count > 0 then
  begin
    MessageDlg('Existe(m) crítica(s). Verifique.',
        mtWarning,[mbOK],0);
    tabCritica.Visible := true;
    tab.ActivePage := tabCritica;
  end
  else
  begin
    tab.ActivePageIndex := 0;
    tabCritica.Visible := false;
   end;
end;

procedure TfrmGerencial.btnImprimirFolhaContasClick(Sender: TObject);
begin
  with RvSys do
  begin
    SystemPreview.FormState := wsMaximized;
    DefaultDest := rdPreview;
    SystemPrinter.Units := unMM;
    TipoRelatorio := FOLHA_CONTAS;
    Execute;
  end;
end;

procedure TfrmGerencial.RvSysPrint(Sender: TObject);
begin
  case TipoRelatorio of
    FOLHA_CONTAS:ImprimirFolhaContas;
    FOLHA_CONTAS_VERSO:ImprimirFolhaContasVerso;
    RELATORIO_MENSAL:ImprimirRelatorioMensal;
    FORMULARIO_REMESSA_DONATIVO:ImprimirRemessaDonativo;
    CAPA_MENSAL:ImprimirCapaMensal;
    GUIA_DEPOSITO:ImprimirGuiaDeposito;
    CAPA_DONATIVO:ImprimirCapaRecibo;
  end;
end;

procedure TfrmGerencial.ImprimirFolhaContas;
var
  x,y,w: Double;
  linha: Double;
  i,intMaxLoop: integer;
  curSomaEntMaos,curSomaEntCC,curSomaEntOutro: Currency;
  curSomaSaiMaos,curSomaSaiCC,curSomaSaiOutro: Currency; 
  strAux: string;
begin
  curSomaEntMaos := 0;
  curSomaEntCC := 0;
  curSomaEntOutro := 0;
  curSomaSaiMaos := 0;
  curSomaSaiCC := 0;
  curSomaSaiOutro := 0;



  with RvSys.BaseReport do
  begin

    linha := 4.2;

    FontName := 'Arial';

    // CONGREGAÇÃO
    FontSize := 10;
    Bold := true;

    w := 80;
    x := 30;
    y := 18.2;
    GotoXY(x,y);
    strAux := edtNOM_CONGREGACAO.Text;
    Print(strAux);

    //CIDADE E ESTADO
    w := 65;
    x := 100;
    y := 18.2;
    GotoXY(x,y);
    strAux := edtNOM_CIDADE.Text+', '+edtNOM_UF.Text;
    Print(strAux);

    //CIDADE E ESTADO
    w := 65;
    x := 167;
    y := 18.2;
    GotoXY(x,y);
    strAux := arrMes[intMes]+' DE '+IntToStr(intAno);
    Print(strAux);

    //LINHAS
    FontSize := 8;
    Bold := false;

    if lvwFolhaContas.Items.Count-1 > intMaxLinhasFolhaContas then
      intMaxLoop := intMaxLinhasFolhaContas
    else
      intMaxLoop := lvwFolhaContas.Items.Count-1;

    y := 40;
    w := 18;

    for i := 0 to intMaxLoop -1 do
    begin
      //DATA
      x := 7; GotoXY(x,y);
      strAux := lvwFolhaContas.Items[i].Caption;
      Print(strAux);

      //DESCRIÇÃO TRANSAÇÃO
      x := 15; GotoXY(x,y);
      strAux := lvwFolhaContas.Items[i].SubItems[0];
      Print(strAux);

      //CT
      x := 89; GotoXY(x,y);
      strAux := lvwFolhaContas.Items[i].SubItems[1];
      Print(strAux);
      
      //ENTRADA MÃOS
      x := 92; GotoXY(x,y);
      strAux := lvwFolhaContas.Items[i].SubItems[2];
      PrintRight(strAux,x+w);

      //SAÍDA MÃOS
      x := 110; GotoXY(x,y);
      strAux := lvwFolhaContas.Items[i].SubItems[3];
      PrintRight(strAux,x+w);

      //ENTRADA C/C
      x := 130; GotoXY(x,y);
      strAux := lvwFolhaContas.Items[i].SubItems[4];
      PrintRight(strAux,x+w);

      //SAÍDA C/C
      x := 149; GotoXY(x,y);
      strAux := lvwFolhaContas.Items[i].SubItems[5];
      PrintRight(strAux,x+w);

      //ENTRADA OUTRO
      x := 168; GotoXY(x,y);
      strAux := lvwFolhaContas.Items[i].SubItems[6];
      PrintRight(strAux,x+w);

      //SAÍDA OUTRO
      x := 187; GotoXY(x,y);
      strAux := lvwFolhaContas.Items[i].SubItems[7];
      PrintRight(strAux,x+w);

      y := y + linha;

      if trim(lvwFolhaContas.Items[i].SubItems[2]) <> EmptyStr then
        curSomaEntMaos := curSomaEntMaos + StrToCur(lvwFolhaContas.Items[i].SubItems[2]);

      if trim(lvwFolhaContas.Items[i].SubItems[3]) <> EmptyStr then
        curSomaSaiMaos := curSomaSaiMaos + StrToCur(lvwFolhaContas.Items[i].SubItems[3]);

      if trim(lvwFolhaContas.Items[i].SubItems[4]) <> EmptyStr then
        curSomaEntCC := curSomaEntCC + StrToCur(lvwFolhaContas.Items[i].SubItems[4]);

      if trim(lvwFolhaContas.Items[i].SubItems[5]) <> EmptyStr then
        curSomaSaiCC := curSomaSaiCC + StrToCur(lvwFolhaContas.Items[i].SubItems[5]);

      if trim(lvwFolhaContas.Items[i].SubItems[6]) <> EmptyStr then
        curSomaEntOutro := curSomaEntOutro + StrToCur(lvwFolhaContas.Items[i].SubItems[6]);

      if trim(lvwFolhaContas.Items[i].SubItems[7]) <> EmptyStr then
        curSomaSaiOutro := curSomaSaiOutro + StrToCur(lvwFolhaContas.Items[i].SubItems[7]);

    end;

    //SUBTOTAIS

    y := 258;
    w := 18;

    //ENTRADA MÃOS
    x := 92; GotoXY(x,y);
    strAux := FormatCurr('#,##0.00',curSomaEntMaos);
    PrintRight(strAux,x+w);

    //SAÍDA MÃOS
    x := 110; GotoXY(x,y);
    strAux := FormatCurr('#,##0.00',curSomaSaiMaos);
    PrintRight(strAux,x+w);

    //ENTRADA C/C
    x := 130; GotoXY(x,y);
    strAux := FormatCurr('#,##0.00',curSomaEntCC);
    PrintRight(strAux,x+w);

    //SAÍDA C/C
    x := 149; GotoXY(x,y);
    strAux := FormatCurr('#,##0.00',curSomaSaiCC);
    PrintRight(strAux,x+w);

    //ENTRADA OUTRO
    x := 168; GotoXY(x,y);
    strAux := FormatCurr('#,##0.00',curSomaEntOutro);
    PrintRight(strAux,x+w);

    //SAÍDA OUTRO
    x := 187; GotoXY(x,y);
    strAux := FormatCurr('#,##0.00',curSomaSaiOutro);
    PrintRight(strAux,x+w);

  end;
end;

procedure TfrmGerencial.ImprimirRelatorioMensal;
var
  x,y,w,y_aux: Double;
  linha: Double;
  i: integer;
  strAux: string;
begin
  with RvSys.BaseReport do
  begin

    linha := 4.5;

    FontName := 'Arial';

    // CONGREGAÇÃO,CIDADE E ESTADO
    FontSize := 8;
    Bold := true;

    x := 40;
    y := 13;
    GotoXY(x,y);
    strAux := edtNOM_CONGREGACAO.Text+', '+edtNOM_CIDADE.Text+', '+edtNOM_UF.Text;
    Print(strAux);

    // MÊS E ANO
    x := 150;
    GotoXY(x,y);
    strAux := arrMes[intMes]+' DE '+IntToStr(intAno);
    Print(strAux);

    //SALDO DA CONGREGAÇÃO NO INÍCIO DO MÊS
    x := 177;
    y := 32;
    w := 20;
    GotoXY(x,y);
    strAux := lblSaldoInicioMes.Caption;
    PrintRight(strAux,x+w);

  //RECEITAS DA CONGREGAÇÃO
    Bold := false;
    FontSize := 8;
    //DESCRIÇÃO
    x := 15;
    y := 45;
    GotoXY(x,y);
    for i := 0 to lvwReceita.Items.Count - 1 do
    begin
      strAux := lvwReceita.Items[i].Caption;
      Print(strAux);
      y := y + linha; //ESPAÇO ENTRE OS ITENS
      GotoXY(x,y);
    end;
    //VALORES
    x := 115;
    y := 45;
    GotoXY(x,y);
    for i := 0 to lvwReceita.Items.Count - 1 do
    begin
      strAux := lvwReceita.Items[i].SubItems[0];
      PrintRight(strAux,x+w);
      y := y + linha; //ESPAÇO ENTRE OS ITENS
      GotoXY(x,y);
    end;

    //TOTAL RECEITAS
    Bold := True;
    x := 146;
    y := 58;
    GotoXY(x,y);
    strAux := lblTotalReceita.Caption;
    PrintRight(strAux,x+w);


  //DESPESAS DA CONGREGAÇÃO
    Bold := False;
    //RESOLUÇÃO - OBRA MUNDIAL
    x := 115;
    y := 76;
    GotoXY(x,y);
    if lvwDespesa.Items.Count > 0 then
    begin
      strAux := lvwDespesa.Items[0].SubItems[0];
      PrintRight(strAux,x+w);
    end;

    //DEMAIS DESPESAS

    linha := 4.2;
    //DESCRIÇÃO
    x := 15;
    y := y + linha; //ESPAÇO ENTRE OS ITENS
    y_aux := y; //GARDA ALTURA PARA POSICIONAR OS VALORES
    GotoXY(x,y);
    for i := 1 to lvwDespesa.Items.Count - 1 do
    begin
      strAux := lvwDespesa.Items[i].Caption;
      Print(strAux);
      y := y + linha; //ESPAÇO ENTRE OS ITENS
      GotoXY(x,y);
    end;

    //VALORES
    x := 115;
    y := y_aux;
    GotoXY(x,y);
    for i := 1 to lvwDespesa.Items.Count - 1 do
    begin
      strAux := lvwDespesa.Items[i].SubItems[0];
      PrintRight(strAux,x+w);
      y := y + linha; //ESPAÇO ENTRE OS ITENS
      GotoXY(x,y);
    end;

    //TOTAL DESPESAS

    Bold := True;
    x := 146;
    y := 96;
    GotoXY(x,y);
    strAux := lblTotalDespesa.Caption;
    PrintRight(strAux,x+w);

    //SUPERÁVIT, DÉFICIT
    Bold := True;
    x := 177;
    y := 105;
    GotoXY(x,y);
    strAux := lblSuperavitDeficit.Caption;
    PrintRight(strAux,x+w);

    //SALDO DA CONGREGAÇÃO NO FIM DO MÊS
    Bold := True;
    x := 177;
    y := 113;
    GotoXY(x,y);
    strAux := lblSaldoFimMes.Caption;
    PrintRight(strAux,x+w);

   {********* DONATIVO OMTJ *************}
    Bold := True;
    x := 132;
    y := 129;
    GotoXY(x,y);
    strAux := lblTotalOMTJ.Caption;
    Print(strAux);

   {********* CONFRONTO *************}
    //CONFRONTO - SADO INICIAL MÊS
    Bold := True;
    x := 146;
    y := 153;
    GotoXY(x,y);
    strAux := lblConfSaldoInicioMes.Caption;
    PrintRight(strAux,x+w);

    //CONFRONTO - DONATIVOS CONGREGAÇÃO
    Bold := False;
    x := 116;
    y := 166;
    GotoXY(x,y);
    strAux := lblConfDonativosCong.Caption;
    PrintRight(strAux,x+w);

    //CONFRONTO - DONATIVOS OMTJ
    Bold := False;
    x := 116;
    y := 174;
    GotoXY(x,y);
    strAux := lblConfDonativosOMTJ.Caption;
    PrintRight(strAux,x+w);

    //CONFRONTO - TOTAL RECEITAS
    Bold := True;
    x := 146;
    y := 187;
    GotoXY(x,y);
    strAux := lblConfTotalRecebido.Caption;
    PrintRight(strAux,x+w);

    //CONFRONTO - DESPESAS CONGREGAÇÃO
    Bold := False;
    x := 116;
    y := 199;
    GotoXY(x,y);
    strAux := lblConfDespesasCong.Caption;
    PrintRight(strAux,x+w);

    //CONFRONTO - ENVIO OMTJ
    Bold := False;
    x := 116;
    y := 207;
    GotoXY(x,y);
    strAux := lblConfEnvioOMTJ.Caption;
    PrintRight(strAux,x+w);

    //CONFRONTO - TOTAL DESPESAS
    Bold := True;
    x := 146;
    y := 219;
    GotoXY(x,y);
    strAux := lblConfTotalGasto.Caption;
    PrintRight(strAux,x+w);

    //CONFRONTO - SALDO FIM DO MÊS
    Bold := True;
    x := 146;
    y := 228;
    GotoXY(x,y);
    strAux := lblConfSaldoFimMes.Caption;
    PrintRight(strAux,x+w);

   {********* FUNDOS DA CONGREGAÇÃO.... ***********}

    //SERVO DE CONTAS
    Bold := True;
    x := 157;
    y := 262;
    GotoXY(x,y);
    strAux := edtNOM_SERVO_CONTAS.Text;
    Print(strAux);

  end;
end;

procedure TfrmGerencial.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_RETURN: keybd_event(VK_TAB,0,0,0);
  end;
end;

procedure TfrmGerencial.btnRelatorioMensalClick(Sender: TObject);
begin
  with RvSys do
  begin
    SystemPreview.FormState := wsMaximized;
    DefaultDest := rdPreview;
    SystemPrinter.Units := unMM;
    TipoRelatorio := RELATORIO_MENSAL;
    Execute;
  end;

end;

procedure TfrmGerencial.ImprimirFolhaContasVerso;
var
  x,y,w,Y_AUX: Double;
  linha: Double;
  i,intIniLoop,intMaxLoop: integer;
  curSomaEntMaos,curSomaEntCC,curSomaEntOutro: Currency;
  curSomaSaiMaos,curSomaSaiCC,curSomaSaiOutro: Currency;
  strAux: string;
  curAux: Currency;
begin
  curSomaEntMaos := 0;
  curSomaEntCC := 0;
  curSomaEntOutro := 0;
  curSomaSaiMaos := 0;
  curSomaSaiCC := 0;
  curSomaSaiOutro := 0;

  with RvSys.BaseReport do
  begin

    linha := 4.2;

    FontName := 'Arial';

    //LINHAS
    FontSize := 8;
    Bold := false;


    if lvwFolhaContas.Items.Count-1 > intMaxLinhasFolhaContas then
      intMaxLoop := intMaxLinhasFolhaContas
    else
      intMaxLoop := lvwFolhaContas.Items.Count-1;

    //SOMATÓRIA DAS COLUNAS
    for i := 0 to intMaxLoop -1 do
    begin
      if trim(lvwFolhaContas.Items[i].SubItems[2]) <> EmptyStr then
        curSomaEntMaos := curSomaEntMaos + StrToCur(lvwFolhaContas.Items[i].SubItems[2]);

      if trim(lvwFolhaContas.Items[i].SubItems[3]) <> EmptyStr then
        curSomaSaiMaos := curSomaSaiMaos + StrToCur(lvwFolhaContas.Items[i].SubItems[3]);

      if trim(lvwFolhaContas.Items[i].SubItems[4]) <> EmptyStr then
        curSomaEntCC := curSomaEntCC + StrToCur(lvwFolhaContas.Items[i].SubItems[4]);

      if trim(lvwFolhaContas.Items[i].SubItems[5]) <> EmptyStr then
        curSomaSaiCC := curSomaSaiCC + StrToCur(lvwFolhaContas.Items[i].SubItems[5]);

      if trim(lvwFolhaContas.Items[i].SubItems[6]) <> EmptyStr then
        curSomaEntOutro := curSomaEntOutro + StrToCur(lvwFolhaContas.Items[i].SubItems[6]);

      if trim(lvwFolhaContas.Items[i].SubItems[7]) <> EmptyStr then
        curSomaSaiOutro := curSomaSaiOutro + StrToCur(lvwFolhaContas.Items[i].SubItems[7]);

    end;


    //DEFININDO PONTO DE PARTIDA PARA IMPRESSÃO DOS ITENS DA FOLHA
    if lvwFolhaContas.Items.Count-1 > intMaxLinhasFolhaContas then
    begin
      intIniLoop := intMaxLinhasFolhaContas;
      intMaxLoop := lvwFolhaContas.Items.Count-2;
    end
    else
    begin
      intIniLoop := 0;
      intMaxLoop := -1;
    end;


    //SALDO TRANSPORTADO

    y := 27;
    w := 18;

    //ENTRADA MÃOS
    x := 94; GotoXY(x,y);
    strAux := FormatCurr('#,##0.00',curSomaEntMaos);
    PrintRight(strAux,x+w);

    //SAÍDA MÃOS
    x := 112; GotoXY(x,y);
    strAux := FormatCurr('#,##0.00',curSomaSaiMaos);
    PrintRight(strAux,x+w);

    //ENTRADA C/C
    x := 132; GotoXY(x,y);
    strAux := FormatCurr('#,##0.00',curSomaEntCC);
    PrintRight(strAux,x+w);

    //SAÍDA C/C
    x := 151; GotoXY(x,y);
    strAux := FormatCurr('#,##0.00',curSomaSaiCC);
    PrintRight(strAux,x+w);

    //ENTRADA OUTRO
    x := 170; GotoXY(x,y);
    strAux := FormatCurr('#,##0.00',curSomaEntOutro);
    PrintRight(strAux,x+w);

    //SAÍDA OUTRO
    x := 189; GotoXY(x,y);
    strAux := FormatCurr('#,##0.00',curSomaSaiOutro);
    PrintRight(strAux,x+w);

    // **** LINHAS **** //
    y := 31;
    w := 18;

    for i := intIniLoop to intMaxLoop do
    begin
      //DATA
      x := 9; GotoXY(x,y);
      strAux := lvwFolhaContas.Items[i].Caption;
      Print(strAux);

      //DESCRIÇÃO TRANSAÇÃO
      x := 17; GotoXY(x,y);
      strAux := lvwFolhaContas.Items[i].SubItems[0];
      Print(strAux);

      //CT
      x := 91; GotoXY(x,y);
      strAux := lvwFolhaContas.Items[i].SubItems[1];
      Print(strAux);

      //ENTRADA MÃOS
      x := 94; GotoXY(x,y);
      strAux := lvwFolhaContas.Items[i].SubItems[2];
      PrintRight(strAux,x+w);

      //SAÍDA MÃOS
      x := 112; GotoXY(x,y);
      strAux := lvwFolhaContas.Items[i].SubItems[3];
      PrintRight(strAux,x+w);

      //ENTRADA C/C
      x := 132; GotoXY(x,y);
      strAux := lvwFolhaContas.Items[i].SubItems[4];
      PrintRight(strAux,x+w);

      //SAÍDA C/C
      x := 151; GotoXY(x,y);
      strAux := lvwFolhaContas.Items[i].SubItems[5];
      PrintRight(strAux,x+w);

      //ENTRADA OUTRO
      x := 170; GotoXY(x,y);
      strAux := lvwFolhaContas.Items[i].SubItems[6];
      PrintRight(strAux,x+w);

      //SAÍDA OUTRO
      x := 189; GotoXY(x,y);
      strAux := lvwFolhaContas.Items[i].SubItems[7];
      PrintRight(strAux,x+w);

      y := y + linha;

      if trim(lvwFolhaContas.Items[i].SubItems[2]) <> EmptyStr then
        curSomaEntMaos := curSomaEntMaos + StrToCur(lvwFolhaContas.Items[i].SubItems[2]);

      if trim(lvwFolhaContas.Items[i].SubItems[3]) <> EmptyStr then
        curSomaSaiMaos := curSomaSaiMaos + StrToCur(lvwFolhaContas.Items[i].SubItems[3]);

      if trim(lvwFolhaContas.Items[i].SubItems[4]) <> EmptyStr then
        curSomaEntCC := curSomaEntCC + StrToCur(lvwFolhaContas.Items[i].SubItems[4]);

      if trim(lvwFolhaContas.Items[i].SubItems[5]) <> EmptyStr then
        curSomaSaiCC := curSomaSaiCC + StrToCur(lvwFolhaContas.Items[i].SubItems[5]);

      if trim(lvwFolhaContas.Items[i].SubItems[6]) <> EmptyStr then
        curSomaEntOutro := curSomaEntOutro + StrToCur(lvwFolhaContas.Items[i].SubItems[6]);

      if trim(lvwFolhaContas.Items[i].SubItems[7]) <> EmptyStr then
        curSomaSaiOutro := curSomaSaiOutro + StrToCur(lvwFolhaContas.Items[i].SubItems[7]);

    end;

    //TOTAIS DAS COLUNAS

    y := 127;
    w := 18;

    //ENTRADA MÃOS
    x := 94; GotoXY(x,y);
    strAux := FormatCurr('#,##0.00',curSomaEntMaos);
    PrintRight(strAux,x+w);

    //SAÍDA MÃOS
    x := 112; GotoXY(x,y);
    strAux := FormatCurr('#,##0.00',curSomaSaiMaos);
    PrintRight(strAux,x+w);

    //ENTRADA C/C
    x := 132; GotoXY(x,y);
    strAux := FormatCurr('#,##0.00',curSomaEntCC);
    PrintRight(strAux,x+w);

    //SAÍDA C/C
    x := 151; GotoXY(x,y);
    strAux := FormatCurr('#,##0.00',curSomaSaiCC);
    PrintRight(strAux,x+w);

    //ENTRADA OUTRO
    x := 170; GotoXY(x,y);
    strAux := FormatCurr('#,##0.00',curSomaEntOutro);
    PrintRight(strAux,x+w);

    //SAÍDA OUTRO
    x := 189; GotoXY(x,y);
    strAux := FormatCurr('#,##0.00',curSomaSaiOutro);
    PrintRight(strAux,x+w);

    // **** CONFRONTO DA FOLHA DE CONTAS **** //

    //DO MÊS QUE TERMINA EM
    Bold := true;
    x := 58;
    y := 147;
    GotoXY(x,y);
    strAux := Copy(DateToStr(UltimoDiaMes(intMes,intAno)),1,2) + ' DE ' +
      arrMes[intMes] + ' DE '+IntToStr(intAno);
    Print(strAux);

    //DINHEIRO EM MÃOS - SALDO TRANSPORTADO
    Bold := true;
    x := 50;
    y := 160;
    w := 18;
    GotoXY(x,y);
    strAux := lblValSaldoAntMaos.Caption;
    PrintRight(strAux,x+w);

    //DINHEIRO EM MÃOS - ENTRADA
    Bold := false;
    x := 50;
    y := 164;
    w := 18;
    GotoXY(x,y);
    strAux := lblValEntradaMaos.Caption;
    PrintRight(strAux,x+w);

    //DINHEIRO EM MÃOS - SAÍDA
    Bold := false;
    x := 50;
    y := 168;
    w := 18;
    GotoXY(x,y);
    strAux := lblValSaidaMaos.Caption;
    PrintRight(strAux,x+w);

    //DINHEIRO EM MÃOS - SALDO FINAL
    Bold := true;
    x := 84;
    y := 171;
    w := 18;
    GotoXY(x,y);
    strAux := lblValSaldoFinalMaos.Caption;
    PrintRight(strAux,x+w);

    //DINHEIRO CONTA CORRENTE - SALDO TRANSPORTADO
    Bold := true;
    x := 50;
    y := 190;
    w := 18;
    GotoXY(x,y);
    strAux := lblValSaldoAntCC.Caption;
    PrintRight(strAux,x+w);

    //DINHEIRO CONTA CORRENTE - ENTRADA
    Bold := false;
    x := 50;
    y := 194;
    w := 18;
    GotoXY(x,y);
    strAux := lblValEntradaCC.Caption;
    PrintRight(strAux,x+w);

    //DINHEIRO CONTA CORRENTE - SAÍDA
    Bold := false;
    x := 50;
    y := 198;
    w := 18;
    GotoXY(x,y);
    strAux := lblValSaidaCC.Caption;
    PrintRight(strAux,x+w);

    //DINHEIRO CONTA CORRENTE - SALDO FINAL
    Bold := true;
    x := 84;
    y := 201;
    w := 18;
    GotoXY(x,y);
    strAux := lblValSaldoFinalCC.Caption;
    PrintRight(strAux,x+w);


    //DINHEIRO CONTA OUTRO - SALDO TRANSPORTADO
    Bold := true;
    x := 50;
    y := 227;
    w := 18;
    GotoXY(x,y);
    strAux := lblValSaldoAntOutra.Caption;
    PrintRight(strAux,x+w);

    //DINHEIRO CONTA OUTRO - ENTRADA
    Bold := false;
    x := 50;
    y := 231;
    w := 18;
    GotoXY(x,y);
    strAux := lblValEntradaOutra.Caption;
    PrintRight(strAux,x+w);

    //DINHEIRO CONTA OUTRO - SAÍDA
    Bold := false;
    x := 50;
    y := 235;
    w := 18;
    GotoXY(x,y);
    strAux := lblValSaidaOutra.Caption;
    PrintRight(strAux,x+w);

    //DINHEIRO CONTA OUTRO - SALDO FINAL
    Bold := true;
    x := 84;
    y := 238;
    w := 18;
    GotoXY(x,y);
    strAux := lblValSaldoFinalOutra.Caption;
    PrintRight(strAux,x+w);

    //SALDO NO FIM DO MÊS
    Bold := true;
    x := 86;
    y := 247;
    w := 18;
    GotoXY(x,y);
    strAux := lblSaldoFinalTotal.Caption;
    PrintRight(strAux,x+w);


    // **** OBRIGAÇÕES DA CONGREGAÇÃO NO FIM DO MÊS **** /

    //CORRENTES

    Bold := false;

    //DESCRIÇÃO
    x := 116;
    y := 162; //ESPAÇO ENTRE OS ITENS
    y_aux := y; //GARDA ALTURA PARA POSICIONAR OS VALORES
    GotoXY(x,y);
    for i := 0 to lvwObrigacoes.Items.Count - 1 do
    begin
      strAux := lvwObrigacoes.Items[i].SubItems[0];
      Print(strAux);
      y := y + linha; //ESPAÇO ENTRE OS ITENS
      GotoXY(x,y);
    end;

    //VALORES
    curAux := 0;
    x := 166;
    y := y_aux;
    w := 18;
    GotoXY(x,y);
    for i := 0 to lvwObrigacoes.Items.Count - 1 do
    begin
      strAux := lvwObrigacoes.Items[i].SubItems[1];
      PrintRight(strAux,x+w);
      y := y + linha; //ESPAÇO ENTRE OS ITENS
      GotoXY(x,y);
      curAux := curAux + StrToCur(lvwObrigacoes.Items[i].SubItems[1]);
    end;

    //TOTAL OBRIGAÇÕES - CORRENTES
    Bold := True;
    x := 185;
    y := 208;
    w := 18;
    GotoXY(x,y);
    strAux := FormatCurr('#,##0.00',curAux);
    PrintRight(strAux,x+w);


    //A LONGO PRAZO

    Bold := false;

    //DESCRIÇÃO
    x := 116;
    y := 226; //ESPAÇO ENTRE OS ITENS
    y_aux := y; //GARDA ALTURA PARA POSICIONAR OS VALORES
    GotoXY(x,y);
    for i := 0 to lvwObrigacoesLongoPrazo.Items.Count - 1 do
    begin
      strAux := lvwObrigacoesLongoPrazo.Items[i].SubItems[0];
      Print(strAux);
      y := y + linha; //ESPAÇO ENTRE OS ITENS
      GotoXY(x,y);
    end;

    //VALORES
    curAux := 0;
    x := 166;
    y := y_aux;
    w := 18;
    GotoXY(x,y);
    for i := 0 to lvwObrigacoesLongoPrazo.Items.Count - 1 do
    begin
      strAux := lvwObrigacoesLongoPrazo.Items[i].SubItems[1];
      PrintRight(strAux,x+w);
      y := y + linha; //ESPAÇO ENTRE OS ITENS
      GotoXY(x,y);
      curAux := curAux + StrToCur(lvwObrigacoesLongoPrazo.Items[i].SubItems[1]);
    end;

    //TOTAL OBRIGAÇÕES - A LONGO PRAZO
    Bold := True;
    x := 185;
    y := 260;
    w := 18;
    GotoXY(x,y);
    strAux := FormatCurr('#,##0.00',curAux);
    PrintRight(strAux,x+w);

  end;

end;

procedure TfrmGerencial.btnFolhaContasVersoClick(Sender: TObject);
begin
  with RvSys do
  begin
    SystemPreview.FormState := wsMaximized;
    DefaultDest := rdPreview;
    SystemPrinter.Units := unMM;
    TipoRelatorio := FOLHA_CONTAS_VERSO;
    Execute;
  end;
end;

procedure TfrmGerencial.PopulaFolhaContasTeste(intLinhas: integer = 74);
var
  i: integer;
  item: TListItem;
begin
  //*****************************************
  // TESTE
  //****************************************
  lvwFolhaContas.Items.Clear;

  for i := 1 to intLinhas do
  begin
    item := lvwFolhaContas.Items.Add;
    item.Caption := '99';
    item.SubItems.Add('TESTE '+inttostr(i));
    item.SubItems.Add('X');
    //ENTRADA MÃOS
    item.SubItems.Add('1,00');

    //SAIDA_MAOS
    item.SubItems.Add('2,00');

    //ENTRADA_CC
    item.SubItems.Add('3,00');

    //SAIDA_CC
    item.SubItems.Add('4,00');

    //ENTRADA_OUTRA
    item.SubItems.Add('5,00');


    //SAIDA_OUTRA
    item.SubItems.Add('10,00');

  end;
  exit;
  //*****************************************
  // FIM TESTE
  //****************************************
end;

procedure TfrmGerencial.btnRemessaDonativoClick(Sender: TObject);
begin
  with RvSys do
  begin
    SystemPreview.FormState := wsMaximized;
    DefaultDest := rdPreview;
    SystemPrinter.Units := unMM;
    TipoRelatorio := FORMULARIO_REMESSA_DONATIVO;
    Execute;
  end;
end;

procedure TfrmGerencial.ImprimirRemessaDonativo;
var
  x,y,w,y_aux: Double;
  i: integer;
  strAux: string;
  d: TDataSource;
  str: string;
  curValor: Currency;
begin

  curValor := 0;

  str :=
  'Select * '+
  ' From '+
  'CAD_FECHAMENTO '+
  ' Where '+
  'NUM_ANO = '+IntToStr(intAno)+' And '+
  'NUM_MES = '+IntToStr(intMes);

  if not cnn.ExecuteQuery(str,d) then
  begin
    MessageDlg(arrMes[intMes]+'/'+IntToStr(intAno)+' NÃO ESTÁ FECHADO.',
      mtWarning,[mbOK],0);
    Exit;
  end;

  with RvSys.BaseReport do
  begin
    FontName := 'Arial';

    //NOME CONGREGAÇÃO
    FontSize := 8;
    Bold := true;

    x := 37;
    y := 24;
    GotoXY(x,y);
    strAux := edtNOM_CONGREGACAO.Text;
    Print(strAux);

    //NÚMERO CONGREGAÇÃO
    x := 120;
    y := 24;
    GotoXY(x,y);
    strAux := edtNUM_CONGREGACAO.Text;
    Print(strAux);

    //DATA REMESSA DONATIVO
    x := 153;
    y := 24;
    GotoXY(x,y);
    strAux := edtDatRemessaDonativo.Text;
    Print(strAux);

    //CIDADE
    x := 37;
    y := 36;
    GotoXY(x,y);
    strAux := edtNOM_CIDADE.Text;
    Print(strAux);

    //ESTADO
    x := 120;
    y := 36;
    GotoXY(x,y);
    strAux := edtNOM_ESTADO.Text;
    Print(strAux);

    //RESOLUÇÃO OMTJ
    Bold := false;
    FontSize := 6;
    x := 104;
    y := 56;
    GotoXY(x,y);
    if lvwDespesa.Items.Count > 0 then
    begin
      strAux := lvwDespesa.Items[0].SubItems[0];
      curValor := StrToCur(strAux);
      Print(strAux);
    end;

    //VALOR OMTJ
    FontSize := 8;
    x := 150;
    y := 56;
    w := 27;
    GotoXY(x,y);
    strAux := FormatCurr('#,##0.00',StrToCur(lblConfEnvioOMTJ.Caption)+curValor);
    curValor := StrToCur(strAux);
    if StrToCur(strAux) > 0 then
      PrintRight(strAux,x+w);

    //VALOR FUNDO SALÕES DO REINO
    FontSize := 8;
    x := 150;
    y := 64;
    w := 27;
    GotoXY(x,y);
    strAux := FormatCurr('#,##0.00',d.DataSet.FieldByName('VAL_FUNDO_SR').AsCurrency);
    curValor := curValor + StrToCur(strAux);
    if StrToCur(strAux) > 0 then
      PrintRight(strAux,x+w);

    //NOME SALÃO DE ASSEMBLÉIAS
    FontSize := 8;
    x := 75;
    y := 73;
    w := 27;
    GotoXY(x,y);
    strAux := d.DataSet.FieldByName('NOM_SALAO_ASSEMB').AsString;
    if strAux <> EmptyStr then
      Print(strAux);

    //VALOR SALÃO DE ASSEMBLÉIAS
    FontSize := 8;
    x := 150;
    y := 73;
    w := 27;
    GotoXY(x,y);
    strAux := FormatCurr('#,##0.00',d.DataSet.FieldByName('VAL_SALAO_ASSEMB').AsCurrency);
    curValor := curValor + StrToCur(strAux);
    if StrToCur(strAux) > 0 then
      PrintRight(strAux,x+w);

    //REMESSA AJUDA FINANCEIRA
    FontSize := 8;
    x := 150;
    y := 84;
    w := 27;
    GotoXY(x,y);
    strAux := FormatCurr('#,##0.00',d.DataSet.FieldByName('VAL_AJU_FIN').AsCurrency);
    curValor := curValor + StrToCur(strAux);
    if StrToCur(strAux) > 0 then
      PrintRight(strAux,x+w);

    //AUXÍLIO CALAMIDADES
    FontSize := 8;
    x := 150;
    y := 93;
    w := 27;
    GotoXY(x,y);
    strAux := FormatCurr('#,##0.00',d.DataSet.FieldByName('VAL_AUX_CAL').AsCurrency);
    curValor := curValor + StrToCur(strAux);
    if StrToCur(strAux) > 0 then
      PrintRight(strAux,x+w);

    //REMESSA PARA CONTA DA CONGREGAÇÃO
    FontSize := 8;
    x := 150;
    y := 102;
    w := 27;
    GotoXY(x,y);
    strAux := FormatCurr('#,##0.00',d.DataSet.FieldByName('VAL_CONTA_CONG').AsCurrency);
    curValor := curValor + StrToCur(strAux);
    if StrToCur(strAux) > 0 then
      PrintRight(strAux,x+w);

    //OUTROS DONATIVOS
    FontSize := 8;
    x := 37;
    y := 111;
    w := 27;
    GotoXY(x,y);
    strAux := d.DataSet.FieldByName('NOM_OUTROS_DONAT').AsString;
    if strAux <> EmptyStr then
      Print(strAux);

    //VALOR OUTROS DONATIVOS
    FontSize := 8;
    x := 150;
    y := 111;
    w := 27;
    GotoXY(x,y);
    strAux := FormatCurr('#,##0.00',d.DataSet.FieldByName('VAL_OUTROS_DONAT').AsCurrency);
    curValor := curValor + StrToCur(strAux);
    if StrToCur(strAux) > 0 then
      PrintRight(strAux,x+w);

    //VALOR TOTAL
    Bold := true;
    FontSize := 8;
    x := 150;
    y := 118;
    w := 27;
    GotoXY(x,y);
    strAux := FormatCurr('#,##0.00',curValor);
    PrintRight(strAux,x+w);

    //SERVO CONTAS
    Bold := false;
    FontSize := 6;
    x := 62;
    y := 151;
    GotoXY(x,y);
    strAux := edtNOM_SERVO_CONTAS.Text;
    Print(strAux);

    //SECRETÁRIO
    Bold := false;
    FontSize := 6;
    x := 132;
    y := 151;
    GotoXY(x,y);
    strAux := edtNOM_SECRETARIO.Text;
    Print(strAux);
  end;

end;

procedure TfrmGerencial.btnCapaMensalClick(Sender: TObject);
begin
  with RvSys do
  begin
    SystemPreview.FormState := wsMaximized;
    DefaultDest := rdPreview;
    SystemPrinter.Units := unMM;
    TipoRelatorio := CAPA_MENSAL;
    Execute;
  end;
end;

procedure TfrmGerencial.ImprimirCapaMensal;
var
  x,y,w,y_aux: Double;
  i: integer;
  strAux: string;
  dblLarguraPagina,dblAlturaPagina: Double;
  dblCentro: Double;
  Color :TColor;
  Width :integer;
  PenStyle :TPenStyle;
  PendMode :TPenMode;
begin

  with RvSys.BaseReport do
  begin
    dblLarguraPagina := PageWidth;
    dblCentro := dblLarguraPagina  / 2;

    FontName := 'Arial';

    //NOME CONGREGAÇÃO
    FontSize := 34;
    Bold := false;

    x := 0;
    y := 80;
    GotoXY(x,y);
    PrintCenter('PASTA',dblCentro);

    y := 110;
    GotoXY(x,y);
    PrintCenter('DAS CONTAS',dblCentro);

    y := 135;
    GotoXY(x,y);
    PrintCenter('MÊS',dblCentro);

    Bold := true;
    y := 160;
    GotoXY(x,y);
    strAux := arrMes[intMes]+' / '+IntToStr(intAno);
    PrintCenter(strAux,dblCentro);

    Bold := false;
    FontSize := 10;
    y := 195;
    GotoXY(x,y);
    PrintCenter('SERVO DE CONTAS - '+edtNOM_SERVO_CONTAS.Text,dblCentro);

    Color := clBlack;
    PenStyle := psSolid;
    Width := 10;
    PendMode := pmBlack;
    SetPen(Color,PenStyle,Width,PendMode);

    Rectangle(dblCentro-67,65,dblCentro+67,200);

  end;
end;

procedure TfrmGerencial.btnCalculaDinheiroClick(Sender: TObject);
begin
  frmCalcDinheiro := TfrmCalcDinheiro.Create(Application);
  frmCalcDinheiro.ShowModal;
end;

procedure TfrmGerencial.btnLimparDadosDepositoClick(Sender: TObject);
begin
  edtCOD_PUBLICO.Text := EmptyStr;
  edtNOM_BANCO.Text := EmptyStr;
  edtNUM_AGENCIA.Text := EmptyStr;
  edtNUM_CONTA_DEPOSITO.Text := EmptyStr;
  edtNOM_FAVORECIDO.Text := EmptyStr;
  edtVAL_DEPOSITO.Text := EmptyStr;
  edtNOM_BANCO.SetFocus;
end;

procedure TfrmGerencial.SugereDadosDeposito(strTipo: string);
var
  str: string;
  ds: TSimpleDataSet;
  curValor: Currency;
begin
  str :=
  'Select * From CAD_FECHAMENTO '+
  ' Where NUM_ANO = '+IntToStr(intAno)+ ' And '+
  '       NUM_MES = '+IntToStr(intMes);

  if cnn.ExecuteQuery(str,ds) then
  begin
    if strTipo = 'ASSOCIACAO' then
      curValor := ds.FieldByName('VAL_OMTJ_RES').AsCurrency +
                  ds.FieldByName('VAL_OMTJ').AsCurrency +
                  ds.FieldByName('VAL_AJU_FIN').AsCurrency +
                  ds.FieldByName('VAL_AUX_CAL').AsCurrency +
                  ds.FieldByName('VAL_FUNDO_SR').AsCurrency +
                  ds.FieldByName('VAL_CONTA_CONG').AsCurrency +
                  ds.FieldByName('VAL_OUTROS_DONAT').AsCurrency
    else if strTipo = 'CONGREGACAO' then
      curValor := ds.FieldByName('VAL_DEP_CONG').AsCurrency;
  end;


  str := 'Select * From CAD_CONFIG';

  if not cnn.ExecuteQuery(str,ds) then
    exit;

  if strTipo = 'ASSOCIACAO' then
  begin
    edtNOM_BANCO.Text := ds.FieldByName('NOM_BANCO_ASS').AsString;
    edtNUM_AGENCIA.Text := ds.FieldByName('NUM_AGENCIA_ASS').AsString;
    edtNUM_CONTA_DEPOSITO.Text := ds.FieldByName('NUM_CONTA_DEPOSITO_ASS').AsString;
    edtNOM_FAVORECIDO.Text := ds.FieldByName('NOM_FAVORECIDO_ASS').AsString;
    if curValor > 0 then
      edtVAL_DEPOSITO.Text := FormatCurr('#,##0.00',curValor)
    else
      edtVAL_DEPOSITO.Text := EmptyStr;
  end;

  if strTipo = 'CONGREGACAO' then
  begin
    edtNOM_BANCO.Text := ds.FieldByName('NOM_BANCO_CONG').AsString;
    edtNUM_AGENCIA.Text := ds.FieldByName('NUM_AGENCIA_CONG').AsString;
    edtNUM_CONTA_DEPOSITO.Text := ds.FieldByName('NUM_CONTA_CORRENTE_CONG').AsString;
    edtNOM_FAVORECIDO.Text := ds.FieldByName('NOM_FAVORECIDO_CONG').AsString;
    edtVAL_DEPOSITO.Text := EmptyStr;
    if curValor > 0 then
      edtVAL_DEPOSITO.Text := FormatCurr('#,##0.00',curValor)
    else
      edtVAL_DEPOSITO.Text := EmptyStr;
  end;
end;

procedure TfrmGerencial.btnDadosAssociacaoClick(Sender: TObject);
begin
  SugereDadosDeposito('ASSOCIACAO');
end;

procedure TfrmGerencial.btnDadosCongregacaoClick(Sender: TObject);
begin
  SugereDadosDeposito('CONGREGACAO');
end;

procedure TfrmGerencial.ImprimirGuiaDeposito;
var
  x,y,w,linha,x2,espacamento: Double;
  x_inicial,y_inicial: Double;
  i: integer;
  strAux: string;
  dblLarguraPagina,dblAlturaPagina: Double;
  dblCentro: Double;
  Color :TColor;
  Width :integer;
  PenStyle :TPenStyle;
  PendMode :TPenMode;
begin

  with RvSys.BaseReport do
  begin
    dblLarguraPagina := PageWidth;
    dblCentro := dblLarguraPagina  / 2;

    FontName := 'Arial';

    x_inicial := 30;
    y_inicial := 20;

    y := y_inicial;
    x := x_inicial;
    x2 := 70;
    linha := 8;
    espacamento := 40;

    for i := 0 to lvwDeposito.Items.Count-1 do
    begin
      FontSize := 12;

      //BANCO
      Bold := true;
      strAux := 'BANCO:  ';
      PrintXY(x,y,strAux);
      Bold := false;
      PrintXY(x2,y,lvwDeposito.Items[i].Caption);

      //AGÊNCIA
      y := y + linha;
      Bold := true;
      strAux := 'AGÊNCIA:  ';
      PrintXY(x,y,strAux);
      Bold := false;
      PrintXY(x2,y,lvwDeposito.Items[i].SubItems[0]);

      //CONTA
      y := y + linha;
      Bold := true;
      strAux := 'CONTA:  ';
      PrintXY(x,y,strAux);
      Bold := false;
      PrintXY(x2,y,lvwDeposito.Items[i].SubItems[1]);

      //FAVORECIDO
      y := y + linha;
      Bold := true;
      strAux := 'FAVORECIDO:  ';
      PrintXY(x,y,strAux);
      Bold := false;
      PrintXY(x2,y,lvwDeposito.Items[i].SubItems[2]);

      //VALOR
      FontSize := 15;
      y := y + linha;
      Bold := true;
      strAux := 'VALOR:  R$ ';
      PrintXY(x,y,strAux);
      Bold := true;
      PrintXY(x2,y,FormatCurr('#,##0.00',
        StrToCur(lvwDeposito.Items[i].SubItems[3])));

      //SETANDO PROPRIEDADES DE LINHA PARA DESENHAR O RETÂNGULO
      Color := clBlack;
      PenStyle := psSolid;
      Width := 10;
      PendMode := pmBlack;
      SetPen(Color,PenStyle,Width,PendMode);

      TabRectangle(20,y -(5*linha),PageWidth-20, y+5 );

      //DESENHAR TRACEJADO
      PenStyle := psDash;
      Width := 2;      
      SetPen(Color,PenStyle,Width,PendMode);
      TabRectangle(0,y + 18,PageWidth, y + 300);

      //ESPAÇAMENTO
      y := y + espacamento;

      if y + (5 * linha) > PageHeight then
      begin
        NewPage;
        y := y_inicial;
      end;

    end;
  end;
end;

procedure TfrmGerencial.btnImprimirGuiaDepositoClick(Sender: TObject);
begin
  with RvSys do
  begin
    SystemPreview.FormState := wsMaximized;
    DefaultDest := rdPreview;
    SystemPrinter.Units := unMM;
    TipoRelatorio := GUIA_DEPOSITO;
    Execute;
  end;
end;

procedure TfrmGerencial.btnIncluirClick(Sender: TObject);
var
  item: TListItem;
begin
  item := lvwDeposito.Items.Add;
  item.Caption := edtNOM_BANCO.Text;
  item.SubItems.Add(edtNUM_AGENCIA.Text);
  item.SubItems.Add(edtNUM_CONTA_DEPOSITO.Text);
  item.SubItems.Add(edtNOM_FAVORECIDO.Text);
  item.SubItems.Add(edtVAL_DEPOSITO.Text);
  btnLimparDadosDepositoClick(Sender);    
end;

procedure TfrmGerencial.btnLimpaListaDepositoClick(Sender: TObject);
begin
  if lvwDeposito.Items.Count > 0 then
   if MessageDlg('Deseja limpar a lista de depósito?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
     lvwDeposito.Items.Clear;
end;

function TfrmGerencial.PesquisaNova(Sender: TObject; blnValida,
  Msg: boolean): boolean;
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
  else
    Exit;

  Pesquisa := TPesquisa.Create;

  Result := Pesquisa.ExecutaPesquisa(blnValida,str[0],str[1],Edt,EdtN,str[2],Msg);

  Pesquisa.Free;
end;


procedure TfrmGerencial.edtCOD_PUBLICOClickButton(Sender: TObject);
begin
  PesquisaNova(Sender,false,true);
end;

procedure TfrmGerencial.edtCOD_PUBLICOExit(Sender: TObject);
begin
  if not PesquisaNova(Sender,true,true) then
    Exit
  else
    if trim(edtCOD_PUBLICO.Text) <> EmptyStr then
      CarregaDadosPublicoDeposito(StrToInt(edtCOD_PUBLICO.Text));
end;

procedure TfrmGerencial.CarregaDadosPublicoDeposito(
  intCodPublico: integer);
var
  str: string;
  d: TDataSource;  
begin
  str :=
  'Select * From CAD_PUBLICO '+
  '  Where '+
  '  COD_PUBLICO = '+IntToStr(intCodPublico);

  if not cnn.ExecuteQuery(str,d) then
    Exit;

  edtNOM_BANCO.Text := d.DataSet.FieldByName('NOM_BANCO').AsString;
  edtNUM_AGENCIA.Text := d.DataSet.FieldByName('NUM_AGENCIA').AsString;
  edtNUM_CONTA_DEPOSITO.Text := d.DataSet.FieldByName('NUM_CONTA').AsString;
  edtNOM_FAVORECIDO.Text := d.DataSet.FieldByName('NOM_PUBLICO').AsString;
end;

procedure TfrmGerencial.ImprimirCapaRecibo;
var
  x,y,w,linha,x2,espacamento: Double;
  x_inicial,y_inicial: Double;
  i: integer;
  strAux: string;
  dblLarguraPagina,dblAlturaPagina: Double;
  dblCentro: Double;
  dblLargura,dblAltura: Double;
  dblAlturaLinha: Double;
  Color :TColor;
  Width :integer;
  PenStyle :TPenStyle;
  PendMode :TPenMode;
begin
  y_inicial := 20;
  y := y_inicial;
  dblLargura := 140;
  dblAltura := 77;
  dblAlturaLinha := 10;
  espacamento := 5;

  for i := 1 to 6 do
  begin
    strAux := EmptyStr;

    if (i = 1) and chkSalaoReino.Checked then
      strAux := 'SALÃO DO REINO'
    else if (i = 2) and chkOMTJ.Checked then
      strAux := 'OBRA MUNDIAL'
    else if (i = 3) and chkAssembleiaEspecial.Checked then
      strAux := 'ASSEMBLÉIA ESPECIAL'
    else if (i = 4) and chkAssembleiaCircuito.Checked then
      strAux := 'ASSEMBLÉIA CIRCUITO'
    else if (i = 5) and chkCongresso.Checked then
      strAux := 'CONGRESSO DISTRITO'
    else if (i = 6) and chkConstrucaoSR.Checked then
      strAux := 'CONSTRUÇÃO S.R.';

    if trim(strAux) = EmptyStr then
      Continue;

    with RvSys.BaseReport do
    begin
      dblAlturaPagina := PageHeight;
      dblLarguraPagina := PageWidth;
      dblCentro := dblLarguraPagina  / 2;

      //PRÓXIMA PÁGINA
      if y > dblAlturaPagina - espacamento - dblAltura then
      begin
        y := y_inicial;
        NewPage;
      end;


      FontName := 'Arial';

      //SETANDO PROPRIEDADES DE LINHA PARA DESENHAR O RETÂNGULO

      //TRACEJADO
      Color := clBlack;
      PenStyle := psDash;
      Width := 2;
      PendMode := pmBlack;
      SetPen(Color,PenStyle,Width,PendMode);

      TabRectangle(dblCentro - (dblLargura/2),y,
                   dblCentro + (dblLargura/2),y + dblAltura);

      //SÓLIDO
      PenStyle := psSolid;
      Width := 10;
      SetPen(Color,PenStyle,Width,PendMode);
      TabRectangle(dblCentro - (dblLargura/2) + 2.5 ,y + 2.5,
                   dblCentro + (dblLargura/2) - 2.5, y + dblAltura - 2.5);

      FontSize := 30;
      Bold := false;
      GotoXY(dblCentro,y + 26);
      PrintCenter('DONATIVOS',dblCentro);
      GotoXY(dblCentro,y + 42);
      PrintCenter(strAux,dblCentro);
      GotoXY(dblCentro,y + 58);
      PrintCenter(arrMes[intMes]+' / '+IntToStr(intAno),dblCentro);

      y := y + dblAltura + espacamento;

    end;
  end;
end;

procedure TfrmGerencial.btnImpCapaReciboClick(Sender: TObject);
begin
  with RvSys do
  begin
    SystemPreview.FormState := wsMaximized;
    DefaultDest := rdPreview;
    SystemPrinter.Units := unMM;
    TipoRelatorio := CAPA_DONATIVO;
    Execute;
  end;
end;

end.
