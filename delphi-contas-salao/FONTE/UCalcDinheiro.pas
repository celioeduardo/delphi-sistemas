unit UCalcDinheiro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, EditLabel, UConexao, UGlobal, SimpleDS;

type
  TfrmCalcDinheiro = class(TForm)
    grpNotas: TGroupBox;
    edtNota100: TEditLabel;
    edtNota50: TEditLabel;
    edtNota20: TEditLabel;
    edtNota10: TEditLabel;
    edtNota5: TEditLabel;
    edtNota2: TEditLabel;
    edtNota1: TEditLabel;
    lbl100: TLabel;
    lbl50: TLabel;
    lbl20: TLabel;
    lbl10: TLabel;
    lbl5: TLabel;
    lbl2: TLabel;
    lbl1: TLabel;
    lblTotalNota: TLabel;
    grpMoeda: TGroupBox;
    lbl1m: TLabel;
    lbl50c: TLabel;
    lbl25c: TLabel;
    lbl10c: TLabel;
    lbl5c: TLabel;
    lbl1c: TLabel;
    lblTotalMoeda: TLabel;
    edt1: TEditLabel;
    edt50c: TEditLabel;
    edt25c: TEditLabel;
    edt10c: TEditLabel;
    edt5c: TEditLabel;
    edt1c: TEditLabel;
    GroupBox1: TGroupBox;
    edtCheque: TEditLabel;
    grpTotal: TGroupBox;
    lblTotal: TLabel;
    btnOK: TButton;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNota100Change(Sender: TObject);
    procedure edtNota50Change(Sender: TObject);
    procedure edtNota20Change(Sender: TObject);
    procedure edtNota10Change(Sender: TObject);
    procedure edtNota5Change(Sender: TObject);
    procedure edtNota2Change(Sender: TObject);
    procedure edtNota1Change(Sender: TObject);
    procedure edt1Change(Sender: TObject);
    procedure edt50cChange(Sender: TObject);
    procedure edt25cChange(Sender: TObject);
    procedure edt10cChange(Sender: TObject);
    procedure edt5cChange(Sender: TObject);
    procedure edt1cChange(Sender: TObject);
    procedure edtChequeChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    procedure CalculaTotal;
    procedure InsereRegisto;
    procedure AlteraRegisto;
    function CarregaRegisto: boolean;
    procedure LimpaCampos;
  public
    { Public declarations }
  end;

var
  frmCalcDinheiro: TfrmCalcDinheiro;
  cnn: TConexao;

implementation

{$R *.dfm}

uses Functions,DB;

procedure TfrmCalcDinheiro.FormCreate(Sender: TObject);
begin
  cnn := TConexao.Create(GloStrUser,GloStrPassword,GloStrDatabase, GloStrServer, GloBlnEmbedded);
  cnn.Open;
  CarregaRegisto;
end;

procedure TfrmCalcDinheiro.CalculaTotal;
var
  curValor: Currency;
begin
  curValor := 0;

  //NOTA
  lbl100.Caption := FormatCurr('#,##0.00',100 * StrToCur(edtNota100.Text));
  curValor := curValor + StrToCur(lbl100.Caption);

  lbl50.Caption := FormatCurr('#,##0.00',50 * StrToCur(edtNota50.Text));
  curValor := curValor + StrToCur(lbl50.Caption);

  lbl20.Caption := FormatCurr('#,##0.00',20 * StrToCur(edtNota20.Text));
  curValor := curValor + StrToCur(lbl20.Caption);

  lbl10.Caption := FormatCurr('#,##0.00',10 * StrToCur(edtNota10.Text));
  curValor := curValor + StrToCur(lbl10.Caption);

  lbl5.Caption := FormatCurr('#,##0.00',5 * StrToCur(edtNota5.Text));
  curValor := curValor + StrToCur(lbl5.Caption);

  lbl2.Caption := FormatCurr('#,##0.00',2 * StrToCur(edtNota2.Text));
  curValor := curValor + StrToCur(lbl2.Caption);

  lbl1.Caption := FormatCurr('#,##0.00',StrToCur(edtNota1.Text));
  curValor := curValor + StrToCur(lbl1.Caption);

  lblTotalNota.Caption := FormatCurr('#,##0.00',curValor);

  //MOEDA
  curValor := 0;

  lbl1m.Caption := FormatCurr('#,##0.00',StrToCur(edt1.Text));
  curValor := curValor + StrToCur(lbl1m.Caption);

  lbl50c.Caption := FormatCurr('#,##0.00',0.5 * StrToCur(edt50c.Text));
  curValor := curValor + StrToCur(lbl50c.Caption);

  lbl25c.Caption := FormatCurr('#,##0.00',0.25 * StrToCur(edt25c.Text));
  curValor := curValor + StrToCur(lbl25c.Caption);

  lbl10c.Caption := FormatCurr('#,##0.00',0.1 * StrToCur(edt10c.Text));
  curValor := curValor + StrToCur(lbl10c.Caption);

  lbl5c.Caption := FormatCurr('#,##0.00#',0.05 * StrToCur(edt5c.Text));
  curValor := curValor + StrToCur(lbl5c.Caption);

  lbl1c.Caption := FormatCurr('#,##0.00#',0.01 * StrToCur(edt1c.Text));
  curValor := curValor + StrToCur(lbl1c.Caption);

  lblTotalMoeda.Caption := FormatCurr('#,##0.00#',curValor);

  //CHEQUE
  curValor := curValor + StrToCur(edtCheque.Text);

  lblTotal.Caption := FormatCurr('#,##0.00#',
    StrToCur(lblTotalNota.Caption)+StrToCur(lblTotalMoeda.Caption)+
    StrToCur(edtCheque.Text));

end;

procedure TfrmCalcDinheiro.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_RETURN: keybd_event(VK_TAB,0,0,0);
  end;

end;

procedure TfrmCalcDinheiro.edtNota100Change(Sender: TObject);
begin
  CalculaTotal;
end;

procedure TfrmCalcDinheiro.edtNota50Change(Sender: TObject);
begin
  CalculaTotal;
end;

procedure TfrmCalcDinheiro.edtNota20Change(Sender: TObject);
begin
  CalculaTotal;
end;

procedure TfrmCalcDinheiro.edtNota10Change(Sender: TObject);
begin
  CalculaTotal;
end;

procedure TfrmCalcDinheiro.edtNota5Change(Sender: TObject);
begin
  CalculaTotal;
end;

procedure TfrmCalcDinheiro.edtNota2Change(Sender: TObject);
begin
  CalculaTotal;
end;

procedure TfrmCalcDinheiro.edtNota1Change(Sender: TObject);
begin
  CalculaTotal;
end;

procedure TfrmCalcDinheiro.edt1Change(Sender: TObject);
begin
  CalculaTotal;
end;

procedure TfrmCalcDinheiro.edt50cChange(Sender: TObject);
begin
  CalculaTotal;
end;

procedure TfrmCalcDinheiro.edt25cChange(Sender: TObject);
begin
  CalculaTotal;
end;

procedure TfrmCalcDinheiro.edt10cChange(Sender: TObject);
begin
  CalculaTotal;
end;

procedure TfrmCalcDinheiro.edt5cChange(Sender: TObject);
begin
  CalculaTotal;
end;

procedure TfrmCalcDinheiro.edt1cChange(Sender: TObject);
begin
  CalculaTotal;
end;

procedure TfrmCalcDinheiro.edtChequeChange(Sender: TObject);
begin
  CalculaTotal;

end;

procedure TfrmCalcDinheiro.AlteraRegisto;
var str: string;
begin

  str :=
  'Update CAD_DINHEIRO Set '+
  'VAL_NOTA_100 = '+ cnn.NumberToBD(edtNota100.Text,'0')+','+
  'VAL_NOTA_50 = '+	cnn.NumberToBD(edtNota50.Text,'0')+','+
  'VAL_NOTA_20 = '+	cnn.NumberToBD(edtNota20.Text,'0')+','+
  'VAL_NOTA_10 = '+	cnn.NumberToBD(edtNota10.Text,'0')+','+
  'VAL_NOTA_5 = '+ cnn.NumberToBD(edtNota5.Text,'0')+','+
  'VAL_NOTA_2 = '+ cnn.NumberToBD(edtNota2.Text,'0')+','+
  'VAL_NOTA_1 = '+ cnn.NumberToBD(edtNota1.Text,'0')+','+
  'VAL_MOEDA_1 = '+ cnn.NumberToBD(edt1.Text,'0')+','+
  'VAL_MOEDA_50C = '+ cnn.NumberToBD(edt50c.Text,'0')+','+
  'VAL_MOEDA_25C = '+ cnn.NumberToBD(edt25c.Text,'0')+','+
  'VAL_MOEDA_10C = '+ cnn.NumberToBD(edt10c.Text,'0')+','+
  'VAL_MOEDA_5C = '+ cnn.NumberToBD(edt5c.Text,'0')+','+
  'VAL_MOEDA_1C = '+ cnn.NumberToBD(edt1c.Text,'0')+','+
  'VAL_CHEQUE  = '+ cnn.NumberToBD(edtCheque.Text,'0');

  cnn.Execute(str);

end;

procedure TfrmCalcDinheiro.InsereRegisto;
var str: string;
begin

  str :=
  'Insert Into CAD_DINHEIRO ('+
  'VAL_NOTA_100,'+
  'VAL_NOTA_50,'+
  'VAL_NOTA_20,'+
  'VAL_NOTA_10,'+
  'VAL_NOTA_5,'+
  'VAL_NOTA_2,'+
  'VAL_NOTA_1,'+
  'VAL_MOEDA_1,'+
  'VAL_MOEDA_50C,'+
  'VAL_MOEDA_25C,'+
  'VAL_MOEDA_10C,'+
  'VAL_MOEDA_5C,'+
  'VAL_MOEDA_1C,'+
  'VAL_CHEQUE'+
  ' ) Values ('+
  cnn.NumberToBD(edtNota100.Text,'0')+','+
  cnn.NumberToBD(edtNota50.Text,'0')+','+
  cnn.NumberToBD(edtNota20.Text,'0')+','+
  cnn.NumberToBD(edtNota10.Text,'0')+','+
  cnn.NumberToBD(edtNota5.Text,'0')+','+
  cnn.NumberToBD(edtNota2.Text,'0')+','+
  cnn.NumberToBD(edtNota1.Text,'0')+','+
  cnn.NumberToBD(edt1.Text,'0')+','+
  cnn.NumberToBD(edt50c.Text,'0')+','+
  cnn.NumberToBD(edt25c.Text,'0')+','+
  cnn.NumberToBD(edt10c.Text,'0')+','+
  cnn.NumberToBD(edt5c.Text,'0')+','+
  cnn.NumberToBD(edt1c.Text,'0')+','+
  cnn.NumberToBD(edtCheque.Text,'0')+')';

  cnn.Execute(str);
end;

procedure TfrmCalcDinheiro.btnOKClick(Sender: TObject);
var
  str: string;
  d: TDataSource;
begin
  str := 'Select Count(*) QTD From CAD_DINHEIRO';

  cnn.ExecuteQuery(str,d);

  if d.DataSet.FieldByName('QTD').AsInteger = 0 then
    InsereRegisto
  else
    AlteraRegisto;

  MessageDlg('Registro gravado com sucesso.',mtInformation,[mbOK],0);

end;

function TfrmCalcDinheiro.CarregaRegisto: boolean;
var
  str: string;
  ds: TSimpleDataSet;
begin
  str := 'Select * From CAD_DINHEIRO';

  LimpaCampos;

  if cnn.ExecuteQuery(str,ds) then
  begin
    if ds.FieldByName('VAL_NOTA_100').AsCurrency > 0 then
      edtNota100.Text := FormatCurr('#,##0.00',ds.FieldByName('VAL_NOTA_100').AsCurrency);
    if ds.FieldByName('VAL_NOTA_50').AsCurrency > 0 then
      edtNota50.Text := FormatCurr('#,##0.00',ds.FieldByName('VAL_NOTA_50').AsCurrency);
    if ds.FieldByName('VAL_NOTA_20').AsCurrency > 0 then
      edtNota20.Text := FormatCurr('#,##0.00',ds.FieldByName('VAL_NOTA_20').AsCurrency);
    if ds.FieldByName('VAL_NOTA_10').AsCurrency > 0 then
      edtNota10.Text := FormatCurr('#,##0.00',ds.FieldByName('VAL_NOTA_10').AsCurrency);
    if ds.FieldByName('VAL_NOTA_5').AsCurrency > 0 then
      edtNota5.Text := FormatCurr('#,##0.00',ds.FieldByName('VAL_NOTA_5').AsCurrency);
    if ds.FieldByName('VAL_NOTA_2').AsCurrency > 0 then
      edtNota2.Text := FormatCurr('#,##0.00',ds.FieldByName('VAL_NOTA_2').AsCurrency);
    if ds.FieldByName('VAL_NOTA_1').AsCurrency > 0 then
      edtNota1.Text := FormatCurr('#,##0.00',ds.FieldByName('VAL_NOTA_1').AsCurrency);
    if ds.FieldByName('VAL_MOEDA_1').AsCurrency > 0 then
      edt1.Text := FormatCurr('#,##0.00',ds.FieldByName('VAL_MOEDA_1').AsCurrency);
    if ds.FieldByName('VAL_MOEDA_50C').AsCurrency > 0 then
      edt50c.Text := FormatCurr('#,##0.00',ds.FieldByName('VAL_MOEDA_50C').AsCurrency);
    if ds.FieldByName('VAL_MOEDA_25C').AsCurrency > 0 then
      edt25c.Text := FormatCurr('#,##0.00',ds.FieldByName('VAL_MOEDA_25C').AsCurrency);
    if ds.FieldByName('VAL_MOEDA_10C').AsCurrency > 0 then
      edt10c.Text := FormatCurr('#,##0.00',ds.FieldByName('VAL_MOEDA_10C').AsCurrency);
    if ds.FieldByName('VAL_MOEDA_5C').AsCurrency > 0 then
      edt5c.Text := FormatCurr('#,##0.00',ds.FieldByName('VAL_MOEDA_5C').AsCurrency);
    if ds.FieldByName('VAL_MOEDA_1C').AsCurrency > 0 then
      edt1c.Text := FormatCurr('#,##0.00',ds.FieldByName('VAL_MOEDA_1C').AsCurrency);
    if ds.FieldByName('VAL_CHEQUE').AsCurrency > 0 then
      edtCheque.Text := FormatCurr('#,##0.00',ds.FieldByName('VAL_CHEQUE').AsCurrency);
  end;
end;

procedure TfrmCalcDinheiro.LimpaCampos;
begin
  edtNota100.Text := EmptyStr;
  edtNota50.Text := EmptyStr;
  edtNota20.Text := EmptyStr;
  edtNota10.Text := EmptyStr;
  edtNota5.Text := EmptyStr;
  edtNota2.Text := EmptyStr;
  edtNota1.Text := EmptyStr;
  edt1.Text := EmptyStr;
  edt50c.Text := EmptyStr;
  edt25c.Text := EmptyStr;
  edt10c.Text := EmptyStr;
  edt5c.Text := EmptyStr;
  edt1c.Text := EmptyStr;
  edtCheque.Text := EmptyStr;
end;

end.
