unit UPesqFech;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, UComponentTag, Mask, EditLabel, ExtCtrls,
  ComCtrls, Grids, DBGrids, UConexao, UGlobal;

type
  TfrmPesqFech = class(TForm)
    tab: TPageControl;
    tabCadastro: TTabSheet;
    pnl1: TPanel;
    txtHabilitaEdicao: TEdit;
    pnl3: TPanel;
    btnLocaliza: TBitBtn;
    btnSair: TBitBtn;
    grd: TDBGrid;
    tabLancFechamento: TTabSheet;
    grdLanc: TDBGrid;
    lblMesAnoFechamento: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSairClick(Sender: TObject);
    procedure btnLocalizaClick(Sender: TObject);
    procedure tabLancFechamentoShow(Sender: TObject);
    procedure grdDblClick(Sender: TObject);
  private
    arrMes: array [1..12] of string;
  public
    procedure PesquisaFechamentos;
    procedure CarregaLancFechamento;
  end;

var
  frmPesqFech: TfrmPesqFech;
  cnn: TConexao;

implementation

{$R *.dfm}

uses UPrincipal, Functions, DB;

procedure TfrmPesqFech.PesquisaFechamentos;
var str: string;
begin
  str := 'Select '+
  'A.NUM_MES,'+
  'A.NUM_ANO,'+
  'A.DAT_FECHAMENTO,'+  
  'A.VAL_OMTJ_RES,'+
  'A.VAL_OMTJ,'+
  'A.VAL_OMTJ_RES +'+
  'A.VAL_OMTJ VAL_OMTJ_TOTAL,'+
  'Case A.VAL_FUNDO_SR '+
  '  When 0 Then NULL Else A.VAL_FUNDO_SR End VAL_FUNDO_SR,'+ 
  'Case A.VAL_SALAO_ASSEMB'+
  '  When 0 Then NULL Else A.VAL_SALAO_ASSEMB End VAL_SALAO_ASSEMB,'+
  'A.NOM_SALAO_ASSEMB,'+
  'Case A.VAL_AJU_FIN'+
  '  When 0 Then NULL Else A.VAL_AJU_FIN End VAL_AJU_FIN,'+
  'Case A.VAL_AUX_CAL'+
  '  When 0 Then NULL Else A.VAL_AUX_CAL End VAL_AUX_CAL,'+
  'Case A.VAL_CONTA_CONG'+
  '  When 0 Then NULL Else A.VAL_CONTA_CONG End VAL_CONTA_CONG,'+
  'Case A.VAL_OUTROS_DONAT '+
  '  When 0 Then NULL Else A.VAL_OUTROS_DONAT End VAL_OUTROS_DONAT,'+
  'A.NOM_OUTROS_DONAT,'+
  'Case A.VAL_DEP_CONG '+
  '  When 0 Then NULL Else A.VAL_DEP_CONG End VAL_DEP_CONG'+
  ' From '+
  'CAD_FECHAMENTO A '+
  ' Order By A.NUM_ANO Desc, A.NUM_MES Desc';

  if not cnn.ExecuteQuery(str,grd) then
  begin
    grd.DataSource.DataSet := nil;
    exit;
  end;

  with grd.DataSource.DataSet do
  begin
    TFloatField(FieldByName('VAL_OMTJ_RES')).DisplayFormat:='#,##0.00';
    TFloatField(FieldByName('VAL_OMTJ')).DisplayFormat:='#,##0.00';
    TFloatField(FieldByName('VAL_OMTJ_TOTAL')).DisplayFormat:='#,##0.00';    
    TFloatField(FieldByName('VAL_FUNDO_SR')).DisplayFormat:='#,##0.00';
    TFloatField(FieldByName('VAL_SALAO_ASSEMB')).DisplayFormat:='#,##0.00';
    TFloatField(FieldByName('VAL_AJU_FIN')).DisplayFormat:='#,##0.00';
    TFloatField(FieldByName('VAL_AUX_CAL')).DisplayFormat:='#,##0.00';
    TFloatField(FieldByName('VAL_CONTA_CONG')).DisplayFormat:='#,##0.00';
    TFloatField(FieldByName('VAL_OUTROS_DONAT')).DisplayFormat:='#,##0.00';
    TFloatField(FieldByName('VAL_DEP_CONG')).DisplayFormat:='#,##0.00';    
  end;

end;

procedure TfrmPesqFech.FormCreate(Sender: TObject);
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

  lblMesAnoFechamento.Caption := EmptyStr;

  Left:=0;
  tOP:=0;
  tab.ActivePageIndex := 0;
  cnn := TConexao.Create(GloStrUser,GloStrPassword,GloStrDatabase, GloStrServer, GloBlnEmbedded);
  cnn.Open;
end;

procedure TfrmPesqFech.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := CaFree
end;

procedure TfrmPesqFech.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPesqFech.btnLocalizaClick(Sender: TObject);
begin
  PesquisaFechamentos;
end;

procedure TfrmPesqFech.CarregaLancFechamento;
var
  str,strMes,strAno: string;
begin
  if not Assigned(grd.DataSource) then
    Exit
  else if grd.DataSource.DataSet.Eof then
    Exit;

  with grd.DataSource.DataSet do
  begin
    strMes := FieldByName('NUM_MES').AsString;
    strAno := FieldByName('NUM_ANO').AsString;
  end;

  lblMesAnoFechamento.Caption := arrMes[StrToInt(strMes)]+' / '+strAno;

  str := 'Select '+
  'D.NUM_MES,'+
  'D.NUM_ANO,'+
  'A.NUM_LANCAMENTO,'+
  'A.DAT_LANCAMENTO,'+
  'A.DSC_LANCAMENTO,'+
  'A.VAL_LANCAMENTO,'+
  'A.COD_CONTA_DEB,'+
  'B.NOM_CONTA NOM_CONTA_DEB,'+
  'A.COD_CONTA_CRE,'+
  'C.NOM_CONTA NOM_CONTA_CRE,'+
  'A.COD_CT,'+
  'A.COD_TP_LANC,'+
  'A.NUM_LANCAMENTO '+
  ' From '+
  'MOV_LANCAMENTO A,'+
  'VW_CAD_CONTA B,'+
  'VW_CAD_CONTA C,'+
  'INT_FECH_LANC D'+
  ' Where '+
  'A.COD_CONTA_DEB = B.COD_CONTA And '+
  'A.COD_CONTA_CRE = C.COD_CONTA And '+
  'A.NUM_LANCAMENTO = D.NUM_LANCAMENTO And '+
  'D.NUM_MES = '+strMes+' And '+
  'D.NUM_ANO = '+strAno+
  ' Order By A.DSC_LANCAMENTO';

  if not cnn.ExecuteQuery(str,grdLanc) then
  begin
    grdLanc.DataSource.DataSet := nil;
    exit;
  end;

  with grdLanc.DataSource.DataSet do
  begin
    TFloatField(FieldByName('VAL_LANCAMENTO')).DisplayFormat:='#,##0.00';
  end;

end;

procedure TfrmPesqFech.tabLancFechamentoShow(Sender: TObject);
begin
  CarregaLancFechamento;
end;

procedure TfrmPesqFech.grdDblClick(Sender: TObject);
begin
  if not Assigned(grd.DataSource) then
    Exit
  else if grd.DataSource.DataSet.Eof then
    Exit;

  tab.ActivePageIndex := 1;
end;

end.
