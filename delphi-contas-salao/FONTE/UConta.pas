unit UConta;

interface

uses Controls,UConexao,UGlobal, SimpleDS, SysUtils;

type
  TConta = class (TObject)
  private
    FConta: integer;
    cnn: TConexao;
  public
    constructor Create(Conta: integer);
    property Conta: integer read FConta write FConta;
    function Nome: string;
    function Saldo(Data: TDate): Currency; overload;
    function Saldo(Mes: integer; Ano:integer): Currency; overload;
    function Saldo(Mes: string; Ano:string): Currency; overload;
    function SaldoAnterior(Data: TDate): Currency; overload;
    function SaldoAnterior(Mes: integer; Ano:integer): Currency; overload;
    function SaldoAnterior(Mes: string; Ano:string): Currency; overload;
    function MovimentacaoDebito(datInicial, datFinal: TDate):Currency; overload;
    function MovimentacaoDebito(MesIni,AnoIni,MesFinal,AnoFinal: integer):Currency; overload;
    function MovimentacaoDebito(MesIni,AnoIni,MesFinal,AnoFinal: string):Currency; overload;
    function MovimentacaoCredito(datInicial, datFinal: TDate):Currency; overload;
    function MovimentacaoCredito(MesIni,AnoIni,MesFinal,AnoFinal: integer):Currency; overload;
    function MovimentacaoCredito(MesIni,AnoIni,MesFinal,AnoFinal: string):Currency; overload;
    function Movimentacao(datInicial, datFinal: TDate):Currency; overload;
    function Movimentacao(MesIni,AnoIni,MesFinal,AnoFinal: integer):Currency; overload;
    function Movimentacao(MesIni,AnoIni,MesFinal,AnoFinal: string):Currency; overload;

  end;

implementation

uses DB,Functions;

{ TConta }

constructor TConta.Create(Conta: integer);
begin
  FConta := Conta;
end;

function TConta.Saldo(Data: TDate): Currency;
var
  str,strFlgNatureza:string;
  ds: TSimpleDataSet;

  curSaldoInicial, curDebito, curCredito, curSaldoFinal: Currency;
begin
  cnn := TConexao.Create(GloStrUser,GloStrPassword,GloStrDatabase, GloStrServer, GloBlnEmbedded);
  cnn.Open;

  // SALDO INICIAL
  str :=
    'Select '+
    'VAL_SALDO_INI,'+
    'FLG_NATUREZA'+
    ' From CAD_CONTA'+
    ' Where COD_CONTA ='+IntToStr(FConta);

  if not cnn.ExecuteQuery(str,ds) then
  begin
    cnn.Close;
    cnn.Free;
    Exception.Create('CONTA NÃO ENCONTRADA.');
  end;
  curSaldoInicial := ds.FieldByName('VAL_SALDO_INI').AsCurrency;
  strFlgNatureza := ds.FieldByName('FLG_NATUREZA').AsString;

  // LANÇAMENTOS DE DÉBITO
  str :=
    'Select '+
    'Sum(VAL_LANCAMENTO) VALOR'+
    ' From MOV_LANCAMENTO'+
    ' Where '+
    'COD_CONTA_DEB ='+IntToStr(FConta)+' And '+
    'DAT_LANCAMENTO <= '+cnn.DateToBD(Data);

  if not cnn.ExecuteQuery(str,ds) then
    curDebito := 0
  else
    curDebito := ds.FieldByName('VALOR').AsCurrency;

  // LANÇAMENTOS DE CRÉDITO
  str :=
    'Select '+
    'Sum(VAL_LANCAMENTO) VALOR'+
    ' From MOV_LANCAMENTO'+
    ' Where '+
    'COD_CONTA_CRE ='+IntToStr(FConta)+' And '+
    'DAT_LANCAMENTO <= '+cnn.DateToBD(Data);

  if not cnn.ExecuteQuery(str,ds) then
    curCredito := 0
  else
    curCredito := ds.FieldByName('VALOR').AsCurrency;

  if strFlgNatureza = 'D' then
    curSaldoFinal := curSaldoInicial + curDebito - curCredito
  else
    curSaldoFinal := curSaldoInicial + curCredito - curDebito;

  Result := curSaldoFinal;

  cnn.Close;
  cnn.Free;

end;

function TConta.Saldo(Mes, Ano: integer): Currency;
var Data: TDate;
begin
  Result := Saldo(UltimoDiaMes(Mes,Ano));
end;

function TConta.MovimentacaoDebito(datInicial,
  datFinal: TDate): Currency;
var
  str: string;
  ds: TSimpleDataSet;
  curValor: Currency;
begin

  cnn := TConexao.Create(GloStrUser,GloStrPassword,GloStrDatabase, GloStrServer, GloBlnEmbedded);
  cnn.Open;

  // LANÇAMENTOS DE DÉBITO
  str :=
    'Select '+
    'Sum(VAL_LANCAMENTO) VALOR'+
    ' From MOV_LANCAMENTO'+
    ' Where '+
    'COD_CONTA_DEB ='+IntToStr(FConta)+' And '+
    'DAT_LANCAMENTO >= '+cnn.DateToBD(datInicial)+' And '+
    'DAT_LANCAMENTO <= '+cnn.DateToBD(datFinal);

  if not cnn.ExecuteQuery(str,ds) then
    curValor := 0
  else
    curValor := ds.FieldByName('VALOR').AsCurrency;

  Result := curValor;

  cnn.Close;
  cnn.Free;
end;

function TConta.Saldo(Mes, Ano: string): Currency;
begin
  Result := Saldo(UltimoDiaMes(StrToInt(Mes),StrToInt(Ano)));
end;

function TConta.SaldoAnterior(Data: TDate): Currency;
begin
  Result := Saldo(Data-1);
end;

function TConta.SaldoAnterior(Mes, Ano: integer): Currency;
begin
  Result := Saldo(PrimeiroDiaMes(Mes,Ano)-1);
end;

function TConta.SaldoAnterior(Mes, Ano: string): Currency;
begin
  Result := Saldo(PrimeiroDiaMes(StrToInt(Mes),StrToInt(Ano))-1);
end;

function TConta.MovimentacaoDebito(MesIni, AnoIni, MesFinal,
  AnoFinal: integer): Currency;
var
  datIni,datFinal: TDate;
begin
  datIni := PrimeiroDiaMes(MesIni,AnoIni);
  datFinal := UltimoDiaMes(MesFinal,AnoFinal);
  Result := MovimentacaoDebito(datIni,datFinal);
end;

function TConta.MovimentacaoDebito(MesIni, AnoIni,
  MesFinal, AnoFinal: string): Currency;
var
  datIni,datFinal: TDate;
begin
  datIni := PrimeiroDiaMes(StrToInt(MesIni),StrToInt(AnoIni));
  datFinal := UltimoDiaMes(StrToInt(MesFinal),StrToInt(AnoFinal));
  Result := MovimentacaoDebito(datIni,datFinal);
end;


function TConta.MovimentacaoCredito(datInicial,
  datFinal: TDate): Currency;
var
  str: string;
  ds: TSimpleDataSet;
  curValor: Currency;
begin
  cnn := TConexao.Create(GloStrUser,GloStrPassword,GloStrDatabase, GloStrServer, GloBlnEmbedded);
  cnn.Open;
  // LANÇAMENTOS DE CRÉDITO
  str :=
    'Select '+
    'Sum(VAL_LANCAMENTO) VALOR'+
    ' From MOV_LANCAMENTO'+
    ' Where '+
    'COD_CONTA_CRE ='+IntToStr(FConta)+' And '+
    'DAT_LANCAMENTO >= '+cnn.DateToBD(datInicial)+' And '+
    'DAT_LANCAMENTO <= '+cnn.DateToBD(datFinal);

  if not cnn.ExecuteQuery(str,ds) then
    curValor := 0
  else
    curValor := ds.FieldByName('VALOR').AsCurrency;

  Result := curValor;

  cnn.Close;
  cnn.Free;

end;

function TConta.MovimentacaoCredito(MesIni, AnoIni, MesFinal,
  AnoFinal: integer): Currency;
var
  datIni,datFinal: TDate;
begin
  datIni := PrimeiroDiaMes(MesIni,AnoIni);
  datFinal := UltimoDiaMes(MesFinal,AnoFinal);
  Result := MovimentacaoCredito(datIni,datFinal);
end;

function TConta.MovimentacaoCredito(MesIni, AnoIni,
  MesFinal, AnoFinal: string): Currency;
var
  datIni,datFinal: TDate;
begin
  datIni := PrimeiroDiaMes(StrToInt(MesIni),StrToInt(AnoIni));
  datFinal := UltimoDiaMes(StrToInt(MesFinal),StrToInt(AnoFinal));
  Result := MovimentacaoCredito(datIni,datFinal);
end;

function TConta.Movimentacao(datInicial,
  datFinal: TDate): Currency;
var
  str,strFlgNatureza:string;
  ds: TSimpleDataSet;

  curSaldoInicial, curDebito, curCredito, curSaldoFinal: Currency;
begin
  cnn := TConexao.Create(GloStrUser,GloStrPassword,GloStrDatabase, GloStrServer, GloBlnEmbedded);
  cnn.Open;

  // SALDO INICIAL
  str :=
    'Select '+
    'FLG_NATUREZA'+
    ' From CAD_CONTA'+
    ' Where COD_CONTA ='+IntToStr(FConta);

  if not cnn.ExecuteQuery(str,ds) then
    Exception.Create('CONTA NÃO ENCONTRADA.');

  strFlgNatureza := ds.FieldByName('FLG_NATUREZA').AsString;

  // LANÇAMENTOS DE DÉBITO
  str :=
    'Select '+
    'Sum(VAL_LANCAMENTO) VALOR'+
    ' From MOV_LANCAMENTO'+
    ' Where '+
    'COD_CONTA_DEB ='+IntToStr(FConta)+' And '+
    'DAT_LANCAMENTO >= '+cnn.DateToBD(datInicial)+' And '+
    'DAT_LANCAMENTO <= '+cnn.DateToBD(datFinal);

  if not cnn.ExecuteQuery(str,ds) then
    curDebito := 0
  else
    curDebito := ds.FieldByName('VALOR').AsCurrency;

  // LANÇAMENTOS DE CRÉDITO
  str :=
    'Select '+
    'Sum(VAL_LANCAMENTO) VALOR'+
    ' From MOV_LANCAMENTO'+
    ' Where '+
    'COD_CONTA_CRE ='+IntToStr(FConta)+' And '+
    'DAT_LANCAMENTO >= '+cnn.DateToBD(datInicial)+' And '+
    'DAT_LANCAMENTO <= '+cnn.DateToBD(datFinal);

  if not cnn.ExecuteQuery(str,ds) then
    curCredito := 0
  else
    curCredito := ds.FieldByName('VALOR').AsCurrency;

  if strFlgNatureza = 'D' then
    curSaldoFinal := curDebito - curCredito
  else
    curSaldoFinal := curCredito - curDebito;

  Result := curSaldoFinal;

  cnn.Close;
  cnn.Free;

end;

function TConta.Movimentacao(MesIni, AnoIni, MesFinal,
  AnoFinal: integer): Currency;
var
  datIni,datFinal: TDate;
begin
  datIni := PrimeiroDiaMes(MesIni,AnoIni);
  datFinal := UltimoDiaMes(MesFinal,AnoFinal);
  Result := Movimentacao(datIni,datFinal);
end;

function TConta.Movimentacao(MesIni, AnoIni, MesFinal,
  AnoFinal: string): Currency;
var
  datIni,datFinal: TDate;
begin
  datIni := PrimeiroDiaMes(StrToInt(MesIni),StrToInt(AnoIni));
  datFinal := UltimoDiaMes(StrToInt(MesFinal),StrToInt(AnoFinal));
  Result := Movimentacao(datIni,datFinal);
end;

function TConta.Nome: string;
var
  str: string;
  ds: TSimpleDataSet;
begin
  cnn := TConexao.Create(GloStrUser,GloStrPassword,GloStrDatabase, GloStrServer, GloBlnEmbedded);
  cnn.Open;

  // SALDO INICIAL
  str :=
    'Select '+
    'NOM_CONTA'+
    ' From CAD_CONTA'+
    ' Where COD_CONTA ='+IntToStr(FConta);

  if not cnn.ExecuteQuery(str,ds) then
  begin
    cnn.Close;
    cnn.Free;
    Exception.Create('CONTA NÃO ENCONTRADA.');
  end;

  Result := ds.FieldByName('NOM_CONTA').AsString;

end;

end.
