unit UEstoque;

interface

uses Math, Dialogs, SysUtils;

type
  // -- PRODUTO NF -- //
  TProdutoNF = class (TObject)
  private
    FCodProduto: integer;
    FNomProduto: string;
    FQtdMov: currency;
    FValMov: currency;
    FValProduto: currency;
  public
    property CodProduto: integer read FCodProduto write FCodProduto;
    property NomProduto: string read FNomProduto write FNomProduto;
    property QtdMov: currency read FQtdMov write FQtdMov;
    property ValMov: currency read FValMov write FValMov;
    property ValProduto: currency read FValProduto write FValProduto;

    function ValMovUnitario: currency;
    function ValProdutoUnitario: currency;

  end;


  // -- COLEÇÃO DE PRODUTOS -- //
  TListProdutoNF = class (TObject)
  private
    FProduto: array of TProdutoNF;
    procedure setProduto(index: integer; Produto: TProdutoNF);
    function getProduto(index: integer): TProdutoNF;
  public
    property Produto[index: integer]: TProdutoNF read getProduto write setProduto;

    procedure Add(CodProduto: integer; NomProduto: string;
      QtdMov: currency; ValProduto: currency); overload;
    procedure Add(const ProdutoNF: TProdutoNF); overload;
    procedure Delete(const intCodProduto: integer);

    function SomaValMov: currency;
    function SomaValProduto: currency;
    function SomaQtdMov: currency;

    function Count: integer;
  end;

  // -- ENTRADA NF -- //

  TEntradaNF = class (TObject)

  private
    FCodEmpresa: integer;
    FCodFilial: integer;
    FCodFornecedor: integer;
    FNumDocumento: integer;
    FNomSerie: string;
    FDatEmissao: TDateTime;
    FDatEntrada: TDateTime;
    FValTotal: currency;
    FValCustosNF: currency;
    FValCustos: currency;
    FTipo: string;
    FMsgErro: string;
    FProdutos: TListProdutoNF;
    function getNomSerie: string;
  public
    constructor Create;
    property CodEmpresa: integer read FCodEmpresa write FCodEmpresa;
    property CodFilial: integer read FCodFilial write FCodFilial;
    property CodFornecedor: integer read FCodFornecedor write FCodFornecedor;
    property NumDocumento: integer read FNumDocumento write FNumDocumento;
    property NomSerie: string read getNomSerie write FNomSerie;
    property DatEmissao: TDateTime read FDatEmissao write FDatEmissao;
    property DatEntrada: TDateTime read FDatEntrada write FDatEntrada;
    property ValTotal: currency read FValTotal write FValTotal;
    property ValCustosNF: currency read FValCustosNF write FValCustosNF;
    property ValCustos: currency read FValCustos write FValCustos;
    property Tipo: string read FTipo write FTipo;
    property Produtos: TListProdutoNF read FProdutos write FProdutos;
    property MsgErro: string read FMsgErro;

    function GravaNota: boolean;
    function ExcluiNota(CodEmpresa, CodFilial, CodFornecedor,
      NumDocumento: integer; NomSerie: string;
      ProcessaMovimentacao: boolean = true): boolean;

  end;


  // -- SAIDA NF -- //

  TSaidaNF = class (TObject)

  private
    FCodEmpresa: integer;
    FCodFilial: integer;
    FNumDocumento: integer;
    FNomSerie: string;
    FCodCliente: integer;
    FDatEmissao: TDateTime;
    FDatSaida: TDateTime;
    FValTotal: currency;
    FTipo: string;
    FMsgErro: string;
    FProdutos: TListProdutoNF;
    function getNomSerie: string;
  public
    constructor Create;
    property CodEmpresa: integer read FCodEmpresa write FCodEmpresa;
    property CodFilial: integer read FCodFilial write FCodFilial;
    property NumDocumento: integer read FNumDocumento write FNumDocumento;
    property NomSerie: string read getNomSerie write FNomSerie;
    property CodCliente: integer read FCodCliente write FCodCliente;
    property DatEmissao: TDateTime read FDatEmissao write FDatEmissao;
    property DatSaida: TDateTime read FDatSaida write FDatSaida;
    property ValTotal: currency read FValTotal write FValTotal;
    property Tipo: string read FTipo write FTipo;
    property Produtos: TListProdutoNF read FProdutos write FProdutos;
    property MsgErro: string read FMsgErro;

    function GravaNota: boolean;
    function ExcluiNota(CodEmpresa, CodFilial, NumDocumento: integer;
      NomSerie: string; ProcessaMovimentacao: boolean = true): boolean;

  end;

  // -- ESTOQUE -- //
  TEstoque = class (TObject)
  private
    FQtdFisico: currency;
    FValFinan: currency;
    FValCusto: currency;
    FMsgErro: string;
  public
    property QtdFisico: currency read FQtdFisico;
    property ValFinan: currency read FValFinan;
    property ValCusto: currency read FValCusto;
    property MsgErro: string read FMsgErro;

    function CustoAnt(CodProduto: integer): currency; overload;
    function CustoAnt(CodProduto: integer;
      var curQtdFisico: currency; var curValFinan: currency): currency; overload;

    function SaldoFisico(CodEmpresa: integer; CodFilial: integer;
      CodProduto: integer; Data: TDateTime): currency;

    function Custo(CodEmpresa: integer; CodFilial: integer; CodProduto: integer;
      Data: TDateTime): currency;

    function CustoEntrada(CodEmpresa: integer;CodFilial: integer;
      CodFornecedor: integer;NumDocumento: integer; NomSerie: string;
      CodProduto: integer; Data: TDateTime = 0;
      Anterior: boolean = false): currency;

    function CustoSaida(CodEmpresa, CodFilial, NumDocumento: integer;
      NomSerie: string; CodProduto: integer; Data: TDateTime =0;
      Anterior: boolean = false): currency;

    function ProcessaMovimentacao(CodEmpresa: integer; CodFilial: integer;
      CodProduto: integer; Data: TDateTime = 0): boolean;

end;

implementation

uses URateio, UConexao, UGlobal, DB, Classes;

{ TProdutoNF }

function TProdutoNF.ValMovUnitario: currency;
begin
  if FQtdMov = 0 then
    Result := 0
  else
    Result := RoundTo(FValMov / FQtdMov, -2);
end;

function TProdutoNF.ValProdutoUnitario: currency;
begin
  if FQtdMov = 0 then
    Result := 0
  else
    Result := RoundTo(FValProduto / FQtdMov, -2);
end;

{ TListProdutoNF }

procedure TListProdutoNF.Add(CodProduto: integer; NomProduto: string;
  QtdMov, ValProduto: currency);
var P: TProdutoNF;
begin
  P := TProdutoNF.Create;
  P.CodProduto := CodProduto;
  P.NomProduto := NomProduto;
  P.QtdMov := QtdMov;
  P.ValProduto := ValProduto;
  P.ValMov := ValProduto;
  Add(P);
end;

procedure TListProdutoNF.Add(const ProdutoNF: TProdutoNF);
begin
  SetLength(FProduto,Length(FProduto)+1);
  FProduto[Length(FProduto)-1] := ProdutoNF;
end;

function TListProdutoNF.Count: integer;
begin
  Result := Length(FProduto);
end;

procedure TListProdutoNF.Delete(const intCodProduto: integer);
var P: array of TProdutoNF;
    i: integer;
begin
  for i := 0 to Count -1 do
    if intCodProduto <> Produto[i].CodProduto then
    begin
      SetLength(P,Length(P)+1);
      P[Length(P)-1] := Produto[i];
    end;
   for i := 0 to Length(P) -1 do
   begin
     FProduto[i] := P[i];
   end;
   SetLength(FProduto,Length(P));
end;

function TListProdutoNF.getProduto(index: integer): TProdutoNF;
begin
  Result := FProduto[index];
end;

procedure TListProdutoNF.setProduto(index: integer; Produto: TProdutoNF);
begin
  FProduto[index] := Produto;
end;

function TListProdutoNF.SomaQtdMov: currency;
var i: integer;
    cur: currency;
begin
  cur := 0;
  for i := 0 to Count -1 do
    cur := cur + Produto[i].ValMov;
  Result := cur;
end;

function TListProdutoNF.SomaValProduto: currency;
var i: integer;
    cur: currency;
begin
  cur := 0;
  for i := 0 to Count -1 do
    cur := cur + Produto[i].ValProduto;
  Result := cur;
end;

function TListProdutoNF.SomaValMov: currency;
var i: integer;
    cur: currency;
begin
  cur := 0;
  for i := 0 to Count -1 do
    cur := cur + Produto[i].ValMov;
  Result := cur;
end;

constructor TEntradaNF.Create;
begin
  inherited;
  FProdutos := TListProdutoNF.Create;
end;

function TEntradaNF.ExcluiNota(CodEmpresa, CodFilial, CodFornecedor,
  NumDocumento: integer; NomSerie: string;
  ProcessaMovimentacao: boolean = true): boolean;
var
  cnn: TConexao;
  str: string;
  ds: TDataSource;
  est: TEstoque;
begin

  Result := false;

  cnn := TConexao.Create(GloStrUser,GloStrPassword,GloStrDatabase,GloStrServer,GloBlnEmbedded);
  cnn.Open;

  cnn.BeginTrans;

  str := 'Select COD_PRODUTO, DAT_MOV ';
  str := str+' From EST_ENTRADA ';
  str := str+' Where ';
  str := str+'COD_EMPRESA = '+IntToStr(CodEmpresa)+' And ';
  str := str+'COD_FILIAL = '+IntToStr(CodFilial)+' And ';
  str := str+'COD_FORNECEDOR = '+IntToStr(CodFornecedor)+' And ';
  str := str+'NUM_DOCUMENTO = '+IntToStr(NumDocumento)+' And ';
  if trim(NomSerie) = '' then
    str := str+'NOM_SERIE = '+cnn.Aspas(' ')
  else
    str := str+'NOM_SERIE = '+cnn.Aspas(NomSerie);

  cnn.ExecuteQuery(str,ds);

  str := 'Delete From EST_ENTRADA ';
  str := str+' Where ';
  str := str+'COD_EMPRESA = '+IntToStr(CodEmpresa)+' And ';
  str := str+'COD_FILIAL = '+IntToStr(CodFilial)+' And ';
  str := str+'COD_FORNECEDOR = '+IntToStr(CodFornecedor)+' And ';
  str := str+'NUM_DOCUMENTO = '+IntToStr(NumDocumento)+' And ';
  if trim(NomSerie) = '' then
    str := str+'NOM_SERIE = '+cnn.Aspas(' ')
  else
    str := str+'NOM_SERIE = '+cnn.Aspas(NomSerie);

  try
    cnn.Execute(str);
  except
    on Ex: Exception do
    begin
      cnn.Rollback;
      Exit;
    end;
  end;

  str := 'Delete From FIS_ENTRADA ';
  str := str+' Where ';
  str := str+'COD_EMPRESA = '+IntToStr(CodEmpresa)+' And ';
  str := str+'COD_FILIAL = '+IntToStr(CodFilial)+' And ';
  str := str+'COD_FORNECEDOR = '+IntToStr(CodFornecedor)+' And ';
  str := str+'NUM_DOCUMENTO = '+IntToStr(NumDocumento)+' And ';
  if trim(NomSerie) = '' then
    str := str+'NOM_SERIE = '+cnn.Aspas(' ')
  else
    str := str+'NOM_SERIE = '+cnn.Aspas(NomSerie);

  try
    cnn.Execute(str);
  except
    on Ex: Exception do
    begin
      cnn.Rollback;
      Exit;
    end;
  end;

  cnn.Commit;

  //PROCESSAMENTO DA MOVIMENTAÇÃO
  if ProcessaMovimentacao then
  begin
    est := TEstoque.Create;
    while not ds.DataSet.Eof do
    begin
      est.ProcessaMovimentacao(CodEmpresa,CodFilial,
        ds.DataSet.FieldByName('COD_PRODUTO').AsInteger,
        ds.DataSet.FieldByName('DAT_MOV').AsDateTime);
      ds.DataSet.Next;
    end;
  end;

  Result := true;
end;

function TEntradaNF.getNomSerie: string;
begin
  if trim(FNomSerie) = '' then
    Result := ' '
  else
    Result := FNomSerie;
end;

function TEntradaNF.GravaNota: boolean;
var
  cnn: TConexao;
  ds: TDataSource;
  str: string;
  i: integer;
  rateio: TRateio;
  cur: currency;
  est: TEstoque;
begin
  Result := false;

  cnn := TConexao.Create(GloStrUser,GloStrPassword,GloStrDatabase,GloStrServer,GloBlnEmbedded);
  cnn.Open;

  //VERIFICAÇÃO DO VALOR
  cur := Produtos.SomaValProduto;
  if ValTotal <> cur + ValCustosNF then
  begin
    FMsgErro := 'O valor total dos produtos mais os custos da nota '+
      'não é igual ao valor total da nota!';
    Result := false;
    Exit;
  end;

  if (DatEntrada < DatEmissao) and (Tipo <> 'A') then
  begin
    FMsgErro := 'A Data de Entrada não pode ser menor que a Data de Emissão';
    Result := false;
    Exit;
  end;
 
  for i := 0 to Produtos.Count-1 do
  begin
    str := 'Select ';
    str := str + ' DAT_IMPLANTACAO ';
    str := str + ' From ';
    str := str + ' CAD_PRODUTO ';
    str := str + ' Where ';
    str := str + ' COD_PRODUTO = '+cnn.NumberToBD(Produtos.Produto[0].CodProduto);

    cnn.ExecuteQuery(str,ds);
    if FDatEntrada < ds.DataSet.FieldByName('DAT_IMPLANTACAO').AsDateTime then
    begin
      FMsgErro := 'A Data de Entrada da Nota não pode ser menor que a '+
                  'Data de Implantação do Produto';
      Result := false;
      Exit;
    end;
  end;

  //RATEANDO VALORES DA NOTA
  rateio := TRateio.Create;
  rateio.ValorRatear := ValCustosNF + ValCustos;
  for i := 0 to Produtos.Count -1 do
    rateio.Itens.Add(
      IntToStr(Produtos.Produto[i].CodProduto),
      Produtos.Produto[i].ValProduto);

  rateio.Ratear;

  str := 'Insert Into FIS_ENTRADA(';
  str := str + 'COD_EMPRESA,';
  str := str + 'COD_FILIAL,';
  str := str + 'COD_FORNECEDOR,';
  str := str + 'NUM_DOCUMENTO,';
  str := str + 'NOM_SERIE,';
  str := str + 'VAL_TOTAL,';
  str := str + 'VAL_CUSTOS_NF,';
  str := str + 'VAL_CUSTOS,';
  str := str + 'DAT_EMISSAO,';
  str := str + 'DAT_ENTRADA,';
  str := str + 'FLG_TIPO';
  str := str + ') Values (';
  str := str + IntToStr(CodEmpresa)+',';
  str := str + IntToStr(CodFilial)+',';
  str := str + IntToStr(CodFornecedor)+',';
  str := str + IntToStr(NumDocumento)+',';
  str := str + cnn.StrToBD(NomSerie)+',';
  str := str + cnn.NumberToBD(ValTotal)+',';
  str := str + cnn.NumberToBD(ValCustosNF)+',';
  str := str + cnn.NumberToBD(ValCustos)+',';
  str := str + cnn.DateToBD(DatEmissao)+',';
  str := str + cnn.DateToBD(DatEntrada)+',';
  str := str + cnn.StrToBD(Tipo)+')';

  cnn.BeginTrans;

  try
    cnn.Execute(str)
  except
    on ex: Exception do
    begin
      cnn.Rollback;
      Exit;
    end;
  end;

  for i := 0 to Produtos.Count-1 do
  begin
    str := 'Insert Into EST_ENTRADA(';
    str := str + 'COD_EMPRESA,';
    str := str + 'COD_FILIAL,';
    str := str + 'COD_FORNECEDOR,';
    str := str + 'NUM_DOCUMENTO,';
    str := str + 'NOM_SERIE,';
    str := str + 'COD_PRODUTO,';
    str := str + 'DAT_MOV,';
    str := str + 'QTD_MOV,';
    str := str + 'VAL_MOV,';
    str := str + 'VAL_CUSTO,';
    str := str + 'VAL_PRODUTO,';
    str := str + 'QTD_FISICO,';
    str := str + 'VAL_FINAN,';
    str := str + 'FLG_TIPO';
    str := str + ') Values (';
    str := str + IntToStr(CodEmpresa)+',';
    str := str + IntToStr(CodFilial)+',';
    str := str + IntToStr(CodFornecedor)+',';
    str := str + IntToStr(NumDocumento)+',';
    str := str + cnn.StrToBD(NomSerie)+',';
    str := str + IntToStr(Produtos.Produto[i].CodProduto)+',';
    str := str + cnn.DateToBD(DatEntrada)+',';
    str := str + cnn.NumberToBD(Produtos.Produto[i].QtdMov)+',';
    str := str + cnn.NumberToBD(rateio.Itens.Item[i].ValorRateado)+',';
    str := str + '0,'; //VAL_CUSTO
    str := str + cnn.NumberToBD(Produtos.Produto[i].ValProduto)+',';
    str := str + '0,'; //QTD_FISICO
    str := str + '0,'; //VAL_FINAN
    str := str + cnn.StrToBD(Tipo)+')';

    try
      cnn.Execute(str)
    except
      on ex: Exception do
      begin
        cnn.Rollback;
        Exit;
      end;
    end;

  end;

  cnn.Commit;

  est := TEstoque.Create;

  for i := 0 to Produtos.Count-1 do
    est.ProcessaMovimentacao(CodEmpresa, CodFilial,
    Produtos.Produto[i].CodProduto, DatEntrada);

  Result := true;

end;

{ TSaidaNF }

constructor TSaidaNF.Create;
begin
  FProdutos := TListProdutoNF.Create;
  CodCliente := -1;
end;

function TSaidaNF.ExcluiNota(CodEmpresa, CodFilial, NumDocumento: integer;
  NomSerie: string; ProcessaMovimentacao: boolean = true): boolean;
var
  cnn: TConexao;
  str: string;
  ds: TDataSource;
  est: TEstoque;
begin

  Result := false;

  cnn := TConexao.Create(GloStrUser,GloStrPassword,GloStrDatabase,GloStrServer,GloBlnEmbedded);
  cnn.Open;

  cnn.BeginTrans;

  str := 'Select COD_PRODUTO, DAT_MOV ';
  str := str+' From EST_SAIDA ';
  str := str+' Where ';
  str := str+'COD_EMPRESA = '+IntToStr(CodEmpresa)+' And ';
  str := str+'COD_FILIAL = '+IntToStr(CodFilial)+' And ';
  str := str+'NUM_DOCUMENTO = '+IntToStr(NumDocumento)+' And ';
  if trim(NomSerie) = '' then
    str := str+'NOM_SERIE = '+cnn.Aspas(' ')
  else
    str := str+'NOM_SERIE = '+cnn.Aspas(NomSerie);

  cnn.ExecuteQuery(str,ds);

  str := 'Delete From EST_SAIDA ';
  str := str+' Where ';
  str := str+'COD_EMPRESA = '+IntToStr(CodEmpresa)+' And ';
  str := str+'COD_FILIAL = '+IntToStr(CodFilial)+' And ';
  str := str+'NUM_DOCUMENTO = '+IntToStr(NumDocumento)+' And ';
  if trim(NomSerie) = '' then
    str := str+'NOM_SERIE = '+cnn.Aspas(' ')
  else
    str := str+'NOM_SERIE = '+cnn.Aspas(NomSerie);

  try
    cnn.Execute(str);
  except
    on Ex: Exception do
    begin
      cnn.Rollback;
      Exit;
    end;
  end;

  str := 'Delete From FIS_SAIDA ';
  str := str+' Where ';
  str := str+'COD_EMPRESA = '+IntToStr(CodEmpresa)+' And ';
  str := str+'COD_FILIAL = '+IntToStr(CodFilial)+' And ';
  str := str+'NUM_DOCUMENTO = '+IntToStr(NumDocumento)+' And ';
  if trim(NomSerie) = '' then
    str := str+'NOM_SERIE = '+cnn.Aspas(' ')
  else
    str := str+'NOM_SERIE = '+cnn.Aspas(NomSerie);

  try
    cnn.Execute(str);
  except
    on Ex: Exception do
    begin
      cnn.Rollback;
      Exit;
    end;
  end;

  cnn.Commit;

    //PROCESSAMENTO DA MOVIMENTAÇÃO
  if ProcessaMovimentacao then
  begin
    est := TEstoque.Create;
    while not ds.DataSet.Eof do
    begin
      est.ProcessaMovimentacao(CodEmpresa,CodFilial,
        ds.DataSet.FieldByName('COD_PRODUTO').AsInteger,
        ds.DataSet.FieldByName('DAT_MOV').AsDateTime);
      ds.DataSet.Next;
    end;
  end;

  Result := true;
end;

function TSaidaNF.getNomSerie: string;
begin
  if trim(FNomSerie) = '' then
    Result := ' '
  else
    Result := FNomSerie;
end;

function TSaidaNF.GravaNota: boolean;
var
  cnn: TConexao;
  ds: TDataSource;
  str: string;
  i: integer;
  cur: currency;
  est: TEstoque;
begin
  Result := false;

  cnn := TConexao.Create(GloStrUser,GloStrPassword,GloStrDatabase,GloStrServer,GloBlnEmbedded);
  cnn.Open;

  //VERIFICAÇÃO DO VALOR
  cur := Produtos.SomaValProduto;
  if ValTotal <> cur then
  begin
    FMsgErro := 'O valor total dos produtos mais os custos da nota '+
      'não é igual ao valor total da nota!';
    Result := false;
    Exit;
  end;

  if (DatSaida < DatEmissao) and (Tipo <> 'A') then
  begin
    FMsgErro := 'A Data de Saída não pode ser menor que a Data de Emissão';
    Result := false;
    Exit;
  end;

  for i := 0 to Produtos.Count-1 do
  begin
    str := 'Select ';
    str := str + ' DAT_IMPLANTACAO ';
    str := str + ' From ';
    str := str + ' CAD_PRODUTO ';
    str := str + ' Where ';
    str := str + ' COD_PRODUTO = '+cnn.NumberToBD(Produtos.Produto[0].CodProduto);

    cnn.ExecuteQuery(str,ds);
    if FDatSaida < ds.DataSet.FieldByName('DAT_IMPLANTACAO').AsDateTime then
    begin
      FMsgErro := 'A Data d Saida da Nota não pode ser menor que a '+
                  'Data de Implantação do Produto';
      Result := false;
      Exit;
    end;
  end;

  str := 'Insert Into FIS_SAIDA(';
  str := str + 'COD_EMPRESA,';
  str := str + 'COD_FILIAL,';
  str := str + 'NUM_DOCUMENTO,';
  str := str + 'NOM_SERIE,';
  str := str + 'COD_CLIENTE,';
  str := str + 'VAL_TOTAL,';
  str := str + 'DAT_EMISSAO,';
  str := str + 'DAT_SAIDA,';
  str := str + 'FLG_TIPO';
  str := str + ') Values (';
  str := str + IntToStr(CodEmpresa)+',';
  str := str + IntToStr(CodFilial)+',';
  str := str + IntToStr(NumDocumento)+',';
  str := str + cnn.StrToBD(NomSerie)+',';
  if CodCliente = -1 then
    str := str + 'NULL,'
  else
    str := str + IntToStr(CodCliente)+',';
  str := str + cnn.NumberToBD(ValTotal)+',';
  str := str + cnn.DateToBD(DatEmissao)+',';
  str := str + cnn.DateToBD(DatSaida)+',';
  str := str + cnn.StrToBD(Tipo)+')';

  cnn.BeginTrans;

  try
    cnn.Execute(str)
  except
    on ex: Exception do
    begin
      cnn.Rollback;
      Exit;
    end;
  end;

  for i := 0 to Produtos.Count-1 do
  begin
    str := 'Insert Into EST_SAIDA(';
    str := str + 'COD_EMPRESA,';
    str := str + 'COD_FILIAL,';
    str := str + 'NUM_DOCUMENTO,';
    str := str + 'NOM_SERIE,';
    str := str + 'COD_PRODUTO,';
    str := str + 'DAT_MOV,';
    str := str + 'QTD_MOV,';
    str := str + 'VAL_MOV,';
    str := str + 'VAL_CUSTO,';
    str := str + 'VAL_PRODUTO,';
    str := str + 'QTD_FISICO,';
    str := str + 'VAL_FINAN,';
    str := str + 'FLG_TIPO';
    str := str + ') Values (';    
    str := str + IntToStr(CodEmpresa)+',';
    str := str + IntToStr(CodFilial)+',';
    str := str + IntToStr(NumDocumento)+',';
    str := str + cnn.StrToBD(NomSerie)+',';
    str := str + IntToStr(Produtos.Produto[i].CodProduto)+',';
    str := str + cnn.DateToBD(DatSaida)+',';
    str := str + cnn.NumberToBD(Produtos.Produto[i].QtdMov)+',';
    str := str + cnn.NumberToBD(Produtos.Produto[i].ValProduto)+',';
    str := str + '0,'; //VAL_CUSTO
    str := str + cnn.NumberToBD(Produtos.Produto[i].ValProduto)+',';
    str := str + '0,'; //QTD_FISICO
    str := str + '0,'; //VAL_FINAN
    str := str + cnn.StrToBD(Tipo)+')';

    try
      cnn.Execute(str)
    except
      on ex: Exception do
      begin
        cnn.Rollback;
        Exit;
      end;
    end;

  end;

  cnn.Commit;

  est := TEstoque.Create;

  for i := 0 to Produtos.Count-1 do
    est.ProcessaMovimentacao(CodEmpresa, CodFilial,
    Produtos.Produto[i].CodProduto, DatSaida);

  Result := true;

end;

{ TEstoque }
function TEstoque.CustoAnt(CodProduto: integer): currency;
var aux: currency;
begin
  Result := CustoAnt(CodProduto,aux,aux);
end;

function TEstoque.CustoAnt(CodProduto: integer;
  var curQtdFisico: currency; var curValFinan: currency): currency;
var
  str: string;
  ds: TDataSource;
  cnn: TConexao;
begin

  cnn := TConexao.Create(GloStrUser,GloStrPassword,GloStrDatabase,GloStrServer,GloBlnEmbedded);
  cnn.Open;

  str := 'Select ';
  str := str+' QTD_FISICO_ANT, ';
  str := str+' VAL_FISICO_ANT ';
  str := str+' From ';
  str := str+' CAD_PRODUTO ';
  str := str+' Where ';
  str := str+' COD_PRODUTO = '+cnn.NumberToBD(CodProduto);

  if cnn.ExecuteQuery(str,ds) then
  begin
    if ds.DataSet.FieldByName('QTD_FISICO_ANT').AsCurrency = 0 then
    begin
      curQtdFisico := 0;
      curValFinan := 0;
      Result := 0
    end
    else
    begin
      curQtdFisico := ds.DataSet.FieldByName('QTD_FISICO_ANT').AsCurrency;
      curValFinan := ds.DataSet.FieldByName('VAL_FISICO_ANT').AsCurrency;
      Result := RoundTo(ds.DataSet.FieldByName('VAL_FISICO_ANT').AsCurrency /
                ds.DataSet.FieldByName('QTD_FISICO_ANT').AsCurrency,-2);
    end;
    Exit;
  end
  else
  begin
    curQtdFisico := 0;
    curValFinan := 0;
    Result := 0;
  end;

end;

function TEstoque.SaldoFisico(CodEmpresa: integer; CodFilial: integer;
  CodProduto: integer; Data: TDateTime): currency;
var
  str: string;
  ds: TDataSource;
  cnn: TConexao;
  curSaldoFisico, aux: currency;
begin
  cnn := TConexao.Create(GloStrUser,GloStrPassword,GloStrDatabase,GloStrServer,GloBlnEmbedded);
  cnn.Open;

  str := 'Select First 1 ';
  str := str+' FLG_ES,';
  str := str+' NUM_DOCUMENTO,';
  str := str+' NOM_SERIE,';
  str := str+' COD_FORNECEDOR,';
  str := str+' QTD_FISICO ';
  str := str+' From ';
  str := str+' VW_EST_MOV ';
  str := str+' Where ';
  str := str+' COD_EMPRESA = '+cnn.NumberToBD(CodEmpresa)+' And ';
  str := str+' COD_FILIAL = '+cnn.NumberToBD(CodFilial)+' And ';
  str := str+' COD_PRODUTO = '+cnn.NumberToBD(CodProduto)+' And ';
  str := str+' DAT_MOV <= '+cnn.DateToBD(Data);
  str := str+' Order By ';
  str := str+' DAT_MOV Desc,';
  str := str+' FLG_ES Desc,';
  str := str+' NUM_DOCUMENTO Desc,';
  str := str+' NOM_SERIE Desc,';
  str := str+' COD_FORNECEDOR Desc';

  if cnn.ExecuteQuery(str,ds) then
  begin
    Result := ds.DataSet.FieldByName('QTD_FISICO').AsCurrency;
  end
  else
  begin
    CustoAnt(CodProduto,curSaldoFisico,aux);
    Result := curSaldoFisico;
  end;
end;


function TEstoque.Custo(CodEmpresa: integer; CodFilial: integer;
  CodProduto: integer; Data: TDateTime): currency;
var
  str: string;
  ds: TDataSource;
  cnn: TConexao;
begin
  cnn := TConexao.Create(GloStrUser,GloStrPassword,GloStrDatabase,GloStrServer,GloBlnEmbedded);
  cnn.Open;

  str := 'Select First 1 ';
  str := str+' DAT_MOV,';
  str := str+' FLG_ES,';
  str := str+' NUM_DOCUMENTO,';
  str := str+' NOM_SERIE,';
  str := str+' COD_FORNECEDOR,';
  str := str+' QTD_FISICO,';
  str := str+' VAL_FINAN,';
  str := str+' Case QTD_FISICO ';
  str := str+'   When 0.00 then 0.00 ';
  str := str+'   Else ';
  str := str+'     VAL_FINAN / QTD_FISICO ';
  str := str+' End As VAL_CUSTO ';
  str := str+' From ';
  str := str+' VW_EST_MOV ';
  str := str+' Where ';
  str := str+' COD_EMPRESA = '+cnn.NumberToBD(CodEmpresa)+' And ';
  str := str+' COD_FILIAL = '+cnn.NumberToBD(CodFilial)+' And ';
  str := str+' COD_PRODUTO = '+cnn.NumberToBD(CodProduto)+' And ';
  str := str+' DAT_MOV <= '+cnn.DateToBD(Data);
  str := str+' Order By ';
  str := str+' DAT_MOV Desc,';
  str := str+' FLG_ES Desc,';
  str := str+' NUM_DOCUMENTO Desc,';
  str := str+' NOM_SERIE Desc,';
  str := str+' COD_FORNECEDOR Desc';

  if cnn.ExecuteQuery(str,ds) then
  begin
    FQtdFisico := ds.DataSet.FieldByName('QTD_FISICO').AsCurrency;
    FValFinan := ds.DataSet.FieldByName('VAL_FINAN').AsCurrency;
    Result := RoundTo(ds.DataSet.FieldByName('VAL_CUSTO').AsCurrency,-2);
  end
  else
    Result := CustoAnt(CodProduto,FQtdFisico,FValFinan);
end;

function TEstoque.CustoEntrada(CodEmpresa, CodFilial, CodFornecedor,
  NumDocumento: integer; NomSerie: string; CodProduto: integer;
  Data: TDateTime = 0; Anterior: boolean = false): currency;
var
  str: string;
  ds: TDataSource;
  cnn: TConexao;
  aux: currency;

  Data1,Data2: TDateTime;
begin
  cnn := TConexao.Create(GloStrUser,GloStrPassword,GloStrDatabase,GloStrServer,GloBlnEmbedded);
  cnn.Open;

  if Anterior then
  begin
    // SE A DATA DA NOTA NÃO FOI PASSADA
    // ENTÃO A RESGATA
    if Data = 0 then
    begin
      str := 'Select ';
      str := str+' DAT_MOV ';
      str := str+' From ';
      str := str+' EST_ENTRADA ';
      str := str+' Where ';
      str := str+' COD_EMPRESA = '+cnn.NumberToBD(CodEmpresa)+' And ';
      str := str+' COD_FILIAL = '+cnn.NumberToBD(CodFilial)+' And ';
      str := str+' COD_FORNECEDOR = '+cnn.NumberToBD(CodFornecedor)+' And ';
      str := str+' NUM_DOCUMENTO = '+cnn.NumberToBD(NumDocumento)+' And ';
      str := str+' NOM_SERIE = '+cnn.StrToBD(NomSerie)+' And ';
      str := str+' COD_PRODUTO = '+cnn.NumberToBD(CodProduto);

      if cnn.ExecuteQuery(str,ds) then
        Data := ds.DataSet.FieldByName('DAT_MOV').AsDateTime
      else
      begin
        FQtdFisico := 0;
        FValFinan := 0;
        Result := 0;
        Exit;
      end;

    end;

    // MAIOR DATA QUE HOUVE MOVIMENTAÇÃO CORTANDO PELA DATA DA NOTA
    str := 'Select Max(DAT_MOV) DAT_MOV';
    str := str+' From ';
    str := str+' VW_EST_MOV ';
    str := str+' Where ';
    str := str+' COD_EMPRESA = '+cnn.NumberToBD(CodEmpresa)+' And ';
    str := str+' COD_FILIAL = '+cnn.NumberToBD(CodFilial)+' And ';
    str := str+' COD_PRODUTO = '+cnn.NumberToBD(CodProduto)+' And ';
    str := str+' DAT_MOV <= '+cnn.DateToBD(Data);

    if cnn.ExecuteQuery(str,ds) then
      Data1 := ds.DataSet.FieldByName('DAT_MOV').AsDateTime
    else
    begin
      Result := CustoAnt(CodProduto,FQtdFisico,FValFinan); //SE NÃO HOUVE MOVIMENTAÇÃO ANTERIOR, PEGA DO CADASTRADO NO PRODUTO
      Exit;
    end;

    str := 'Select Max(DAT_MOV) DAT_MOV';
    str := str+' From ';
    str := str+' VW_EST_MOV ';
    str := str+' Where ';
    str := str+' COD_EMPRESA = '+cnn.NumberToBD(CodEmpresa)+' And ';
    str := str+' COD_FILIAL = '+cnn.NumberToBD(CodFilial)+' And ';
    str := str+' Not (COD_FORNECEDOR = '+cnn.NumberToBD(CodFornecedor)+' And ';
    str := str+'      NUM_DOCUMENTO = '+cnn.NumberToBD(NumDocumento)+' And ';
    str := str+'      NOM_SERIE = '+cnn.StrToBD(NomSerie);
    str := str+'      ) And ';
    str := str+' COD_PRODUTO = '+cnn.NumberToBD(CodProduto)+' And ';
    str := str+' DAT_MOV < '+cnn.DateToBD(Data);

    if cnn.ExecuteQuery(str,ds) then
      Data2 := ds.DataSet.FieldByName('DAT_MOV').AsDateTime
    else
      Data2 := Data;

    //PEGA AS MOVIMENTAÇÕES DA DATA
    //ATENÇÃO: EMBORA SOMENTE ALGUNS CAMPOS SÃO USADOS
    //         TEM QUE TRAZER TODOS POR CAUSA DA ORDENAÇÃO
    str := 'Select ';
    str := str+' DAT_MOV, ';
    str := str+' FLG_ES, ';
    str := str+' NUM_DOCUMENTO, ';
    str := str+' NOM_SERIE, ';
    str := str+' COD_FORNECEDOR, ';
    str := str+' QTD_FISICO, ';
    str := str+' VAL_FINAN, ';
    str := str+' Case QTD_FISICO ';
    str := str+'   When 0.00 then 0.00 ';
    str := str+'   Else ';
    str := str+'     VAL_FINAN / QTD_FISICO ';
    str := str+' End As VAL_CUSTO ';
    str := str+' From ';
    str := str+' VW_EST_MOV ';
    str := str+' Where ';
    str := str+' COD_EMPRESA = '+cnn.NumberToBD(CodEmpresa)+' And ';
    str := str+' COD_FILIAL = '+cnn.NumberToBD(CodFilial)+' And ';
    str := str+' COD_PRODUTO = '+cnn.NumberToBD(CodProduto)+' And ';
    str := str+' DAT_MOV >= '+cnn.DateToBD(Data2)+' And ';
    str := str+' DAT_MOV <= '+cnn.DateToBD(Data1);
    str := str+' Order By ';
    str := str+' DAT_MOV,';
    str := str+' FLG_ES,';
    str := str+' NUM_DOCUMENTO,';
    str := str+' NOM_SERIE,';
    str := str+' COD_FORNECEDOR';

    ds := TDataSource.Create(ds);

    if not cnn.ExecuteQuery(str,ds) then
    begin
      FQtdFisico := 0;
      FValFinan := 0;
      Result := 0;
      Exit;
    end
    else
    begin
      aux := -1;
      while (not(
             (ds.DataSet.FieldByName('NUM_DOCUMENTO').AsInteger = NumDocumento) and
             (ds.DataSet.FieldByName('NOM_SERIE').AsString = NomSerie) and
             (ds.DataSet.FieldByName('COD_FORNECEDOR').AsInteger = CodFornecedor)
            ))and (not ds.DataSet.Eof)  do
      begin
         aux := RoundTo(ds.DataSet.FieldByName('VAL_CUSTO').AsCurrency,-2);
         FQtdFisico := ds.DataSet.FieldByName('QTD_FISICO').AsCurrency;
         FValFinan := ds.DataSet.FieldByName('VAL_FINAN').AsCurrency;
         ds.DataSet.Next;
      end;

      if aux = -1 then
        Result := CustoAnt(CodProduto, FQtdFisico, FValFinan)
      else
        Result := aux;
        
    end;
  end
  else
  begin //PEGAR O VAL_CUSTO DA NOTA
    str := 'Select ';
    str := str+' QTD_FISICO, ';
    str := str+' VAL_FINAN, ';
    str := str+' Case QTD_FISICO ';
    str := str+'   When 0.00 then 0.00 ';
    str := str+'   Else ';
    str := str+'     VAL_FINAN / QTD_FISICO ';
    str := str+' End As VAL_CUSTO ';
    str := str+' From ';
    str := str+' EST_ENTRADA ';
    str := str+' Where ';
    str := str+' COD_EMPRESA = '+cnn.NumberToBD(CodEmpresa)+' And ';
    str := str+' COD_FILIAL = '+cnn.NumberToBD(CodFilial)+' And ';
    str := str+' COD_FORNECEDOR = '+cnn.NumberToBD(CodFornecedor)+' And ';
    str := str+' NUM_DOCUMENTO = '+cnn.NumberToBD(NumDocumento)+' And ';
    str := str+' NOM_SERIE = '+cnn.StrToBD(NomSerie)+' And ';
    str := str+' COD_PRODUTO = '+cnn.NumberToBD(CodProduto);

    if cnn.ExecuteQuery(str,ds) then
    begin
      FQtdFisico := ds.DataSet.FieldByName('QTD_FISICO').AsCurrency;
      FValFinan := ds.DataSet.FieldByName('VAL_FINAN').AsCurrency;
      Result := RoundTo(ds.DataSet.FieldByName('VAL_CUSTO').AsCurrency,-2)
    end
    else
    begin
      FQtdFisico := 0;
      FValFinan := 0;
      Result := 0;
    end;
  end;

end;

function TEstoque.CustoSaida(CodEmpresa, CodFilial, NumDocumento: integer;
  NomSerie: string; CodProduto: integer; Data: TDateTime = 0;
  Anterior: boolean = false): currency;
var
  str: string;
  ds: TDataSource;
  cnn: TConexao;
  aux: currency;
  Data1,Data2: TDateTime;
begin
  cnn := TConexao.Create(GloStrUser,GloStrPassword,GloStrDatabase,GloStrServer,GloBlnEmbedded);
  cnn.Open;

  if Anterior then
  begin
    // SE A DATA DA NOTA NÃO FOI PASSADA
    // ENTÃO A RESGATA
    if Data = 0 then
    begin
      str := 'Select ';
      str := str+' DAT_MOV ';
      str := str+' From ';
      str := str+' EST_SAIDA ';
      str := str+' Where ';
      str := str+' COD_EMPRESA = '+cnn.NumberToBD(CodEmpresa)+' And ';
      str := str+' COD_FILIAL = '+cnn.NumberToBD(CodFilial)+' And ';
      str := str+' NUM_DOCUMENTO = '+cnn.NumberToBD(NumDocumento)+' And ';
      str := str+' NOM_SERIE = '+cnn.StrToBD(NomSerie)+' And ';
      str := str+' COD_PRODUTO = '+cnn.NumberToBD(CodProduto);

      if cnn.ExecuteQuery(str,ds) then
        Data := ds.DataSet.FieldByName('DAT_MOV').AsDateTime
      else
      begin
        FQtdFisico := 0;
        FValFinan := 0;
        Result := 0;
        Exit;
      end;
    end;

    // MAIOR DATA QUE HOUVE MOVIMENTAÇÃO CORTANDO PELA DATA DA NOTA
    str := 'Select Max(DAT_MOV) DAT_MOV';
    str := str+' From ';
    str := str+' VW_EST_MOV ';
    str := str+' Where ';
    str := str+' COD_EMPRESA = '+cnn.NumberToBD(CodEmpresa)+' And ';
    str := str+' COD_FILIAL = '+cnn.NumberToBD(CodFilial)+' And ';
    str := str+' COD_PRODUTO = '+cnn.NumberToBD(CodProduto)+' And ';
    str := str+' DAT_MOV <= '+cnn.DateToBD(Data);

    if cnn.ExecuteQuery(str,ds) then
      Data1 := ds.DataSet.FieldByName('DAT_MOV').AsDateTime
    else
    begin
      Result := CustoAnt(CodProduto,FQtdFisico, FValFinan); //SE NÃO HOUVE MOVIMENTAÇÃO ANTERIOR, PEGA DO CADASTRADO NO PRODUTO
      Exit;
    end;

    str := 'Select Max(DAT_MOV) DAT_MOV';
    str := str+' From ';
    str := str+' VW_EST_MOV ';
    str := str+' Where ';
    str := str+' COD_EMPRESA = '+cnn.NumberToBD(CodEmpresa)+' And ';
    str := str+' COD_FILIAL = '+cnn.NumberToBD(CodFilial)+' And ';
    str := str+' Not (COD_FORNECEDOR Is Null And ';
    str := str+'      NUM_DOCUMENTO = '+cnn.NumberToBD(NumDocumento)+' And ';
    str := str+'      NOM_SERIE = '+cnn.StrToBD(NomSerie);
    str := str+'      ) And ';
    str := str+' COD_PRODUTO = '+cnn.NumberToBD(CodProduto)+' And ';
    str := str+' DAT_MOV < '+cnn.DateToBD(Data);

    if cnn.ExecuteQuery(str,ds) then
      Data2 := ds.DataSet.FieldByName('DAT_MOV').AsDateTime
    else
      Data2 := Data;

    //PEGA AS MOVIMENTAÇÕES DA DATA
    //ATENÇÃO: EMBORA SOMENTE ALGUNS CAMPOS SÃO USADOS
    //         TEM QUE TRAZER TODOS POR CAUSA DA ORDENAÇÃO
    str := 'Select ';
    str := str+' DAT_MOV, ';
    str := str+' FLG_ES, ';
    str := str+' NUM_DOCUMENTO, ';
    str := str+' NOM_SERIE, ';
    str := str+' COD_FORNECEDOR, ';
    str := str+' QTD_FISICO, ';
    str := str+' VAL_FINAN, ';
    str := str+' Case QTD_FISICO ';
    str := str+'   When 0.00 then 0.00 ';
    str := str+'   Else ';
    str := str+'     VAL_FINAN / QTD_FISICO ';
    str := str+' End As VAL_CUSTO ';
    str := str+' From ';
    str := str+' VW_EST_MOV ';
    str := str+' Where ';
    str := str+' COD_EMPRESA = '+cnn.NumberToBD(CodEmpresa)+' And ';
    str := str+' COD_FILIAL = '+cnn.NumberToBD(CodFilial)+' And ';
    str := str+' COD_PRODUTO = '+cnn.NumberToBD(CodProduto)+' And ';
    str := str+' DAT_MOV >= '+cnn.DateToBD(Data2)+' And ';
    str := str+' DAT_MOV <= '+cnn.DateToBD(Data1);
    str := str+' Order By ';
    str := str+' DAT_MOV,';
    str := str+' FLG_ES,';
    str := str+' NUM_DOCUMENTO,';
    str := str+' NOM_SERIE,';
    str := str+' COD_FORNECEDOR';

    ds := TDataSource.Create(ds);

    if not cnn.ExecuteQuery(str,ds) then
    begin
      FQtdFisico := 0;
      FValFinan := 0;
      Result := 0;
      Exit;
    end
    else
    begin
      aux := -1;
      while (not(
             (ds.DataSet.FieldByName('NUM_DOCUMENTO').AsInteger = NumDocumento) and
             (ds.DataSet.FieldByName('NOM_SERIE').AsString = NomSerie) and
             (ds.DataSet.FieldByName('COD_FORNECEDOR').IsNull)
            ))and (not ds.DataSet.Eof)  do
      begin
         FQtdFisico := ds.DataSet.FieldByName('QTD_FISICO').AsCurrency;
         FValFinan := ds.DataSet.FieldByName('VAL_FINAN').AsCurrency;
         aux := RoundTo(ds.DataSet.FieldByName('VAL_CUSTO').AsCurrency,-2);
         ds.DataSet.Next;
      end;

      if aux = -1 then
        Result := CustoAnt(CodProduto,FQtdFisico,FValFinan)
      else
        Result := aux;
    end;
  end
  else
  begin //PEGAR O VAL_CUSTO DA NOTA
    str := 'Select ';
    str := str+' QTD_FISICO, ';
    str := str+' VAL_FINAN, ';
    str := str+' Case QTD_FISICO ';
    str := str+'   When 0.00 then 0.00 ';
    str := str+'   Else ';
    str := str+'     VAL_FINAN / QTD_FISICO ';
    str := str+' End As VAL_CUSTO ';
    str := str+' From ';
    str := str+' EST_SAIDA ';
    str := str+' Where ';
    str := str+' COD_EMPRESA = '+cnn.NumberToBD(CodEmpresa)+' And ';
    str := str+' COD_FILIAL = '+cnn.NumberToBD(CodFilial)+' And ';
    str := str+' NUM_DOCUMENTO = '+cnn.NumberToBD(NumDocumento)+' And ';
    str := str+' NOM_SERIE = '+cnn.StrToBD(NomSerie)+' And ';
    str := str+' COD_PRODUTO = '+cnn.NumberToBD(CodProduto);

    if cnn.ExecuteQuery(str,ds) then
    begin
      FQtdFisico := ds.DataSet.FieldByName('QTD_FISICO').AsCurrency;
      FValFinan := ds.DataSet.FieldByName('VAL_FINAN').AsCurrency;
      Result := RoundTo(ds.DataSet.FieldByName('VAL_CUSTO').AsCurrency,-2)
    end
    else
    begin
      FQtdFisico := 0;
      FValFinan := 0;
      Result := 0;
    end;
  end;

end;


function TEstoque.ProcessaMovimentacao(CodEmpresa: integer; CodFilial: integer;
  CodProduto: integer; Data: TDateTime = 0): boolean;
var
  str: string;
  ds: TDataSource;
  cnn: TConexao;
  curValMov: currency;
  curValFinan, curQtdFisico: currency;
  //curQtdFisicoCadProduto, curValFinanCadProduto: currency;
  curValFinanAnt,curQtdFisicoAnt: currency;
begin
  cnn := TConexao.Create(GloStrUser,GloStrPassword,GloStrDatabase,GloStrServer,GloBlnEmbedded);
  cnn.Open;

  try
    cnn.BeginTrans;

    //****** ATENÇÃO ********//
    //QUERY QUE BLOQUEIA O REGISTRO DO PRODUTO ATÉ O
    //TÉRMINO DO CÁLCULO PARA GARANTIR ACESSO EXCLUSIVO
    //OBSERVE A CLÁUSULA For Update With Lock
    str := 'Select ';
    str := str + ' DAT_IMPLANTACAO ';
    str := str + ' From ';
    str := str + ' CAD_PRODUTO ';
    str := str + ' Where ';
    str := str + ' COD_PRODUTO = '+cnn.NumberToBD(CodProduto);
    str := str + ' For Update With Lock ';

    //SE A DATA FOR 0(ZERO) PREPARA
    //O SALDO FÍSICO E FINANCEIRO DO
    //CADASTRO DO PRODUTO
    if cnn.ExecuteQuery(str,ds) then
    begin
      if (Data = ds.DataSet.FieldByName('DAT_IMPLANTACAO').AsDateTime) or
         (Data = 0) then
      begin
        str := 'Update CAD_PRODUTO ';
        str := str+' Set ';
        str := str+' QTD_FISICO = QTD_FISICO_ANT, ';
        str := str+' VAL_FINAN = VAL_FISICO_ANT ';
        str := str+' Where ';
        str := str+' COD_PRODUTO = '+cnn.NumberToBD(CodProduto);

        cnn.Execute(str);
      end;
    end;

    str := 'Select ';
    str := str+' DAT_MOV, ';
    str := str+' FLG_ES, ';
    str := str+' NUM_DOCUMENTO, ';
    str := str+' NOM_SERIE, ';
    str := str+' COD_FORNECEDOR, ';
    str := str+' QTD_MOV, ';
    str := str+' VAL_MOV, ';
    str := str+' QTD_FISICO, ';
    str := str+' VAL_FINAN, ';
    str := str+' Case QTD_FISICO ';
    str := str+'   When 0.00 then 0.00 ';
    str := str+'   Else ';
    str := str+'     VAL_FINAN / QTD_FISICO ';
    str := str+' End As VAL_CUSTO, ';
    str := str+' FLG_TIPO, ';
    str := str+' VAL_PRODUTO ';
    str := str+' From ';
    str := str+' VW_EST_MOV ';
    str := str+' Where ';
    str := str+' COD_EMPRESA = '+cnn.NumberToBD(CodEmpresa)+' And ';
    str := str+' COD_FILIAL = '+cnn.NumberToBD(CodFilial)+' And ';
    str := str+' COD_PRODUTO = '+cnn.NumberToBD(CodProduto);
    if Data > 0 then
      str := str+' And DAT_MOV >= '+cnn.DateToBD(Data);
    str := str+' Order By ';
    str := str+' DAT_MOV,';
    str := str+' FLG_ES,';
    str := str+' NUM_DOCUMENTO,';
    str := str+' NOM_SERIE,';
    str := str+' COD_FORNECEDOR';

    if not cnn.ExecuteQuery(str,ds) then
    begin
      Custo(CodEmpresa,CodFilial,CodProduto,Data);

      str := 'Update CAD_PRODUTO ';
      str := str+' Set ';
      str := str+' QTD_FISICO = '+ cnn.NumberToBD(FQtdFisico) +', ';
      str := str+' VAL_FINAN = '+ cnn.NumberToBD(FValFinan);
      str := str+' Where ';
      str := str+' COD_PRODUTO = '+cnn.NumberToBD(CodProduto);

      cnn.Execute(str);

      cnn.Commit;
      Exit;
    end;

    //INICIALIZANDO CUSTO ANTERIOR
    if (ds.DataSet.FieldByName('FLG_ES').AsString = 'E') then
      CustoEntrada(
        CodEmpresa,
        CodFilial,
        ds.DataSet.FieldByName('COD_FORNECEDOR').AsInteger,
        ds.DataSet.FieldByName('NUM_DOCUMENTO').AsInteger,
        ds.DataSet.FieldByName('NOM_SERIE').AsString,
        CodProduto,
        Data,
        true)
    else
      CustoSaida(
        CodEmpresa,
        CodFilial,
        ds.DataSet.FieldByName('NUM_DOCUMENTO').AsInteger,
        ds.DataSet.FieldByName('NOM_SERIE').AsString,
        CodProduto,
        Data,
        true);

    //DEPOIS QUE OS MÉTODOS CustoEntrada e CustoSaida SÃO CHAMADOS
    //O QTD_FISICO E VAL_FINAN SÃO COLOCADOS NOS ATRIBUTOS DA CLASSE
    //PARA ACESSOS POSTERIORES

    curQtdFisicoAnt := FQtdFisico;
    curValFinanAnt := FValFinan;
    curQtdFisico := 0;
    curValFinan := 0;

    while not ds.DataSet.Eof do
    begin
      //QUANTIDADE
      if ds.DataSet.FieldByName('FLG_ES').AsString = 'E' then
        curQtdFisico := curQtdFisicoAnt + ds.DataSet.FieldByName('QTD_MOV').AsCurrency
      else
        curQtdFisico := curQtdFisicoAnt - ds.DataSet.FieldByName('QTD_MOV').AsCurrency;

      //DEFININDO O VAL_MOV LEVANDO EM CONTA O CUSTO ANTERIOR
      if curQtdFisicoAnt = 0 then
        curValMov := 0
      else
      begin
        curValMov := RoundTo((curValFinanAnt / curQtdFisicoAnt) *
                       ds.DataSet.FieldByName('QTD_MOV').AsCurrency,-2);
      end;

     //curValMov := curValFinanAnt;

      //VALOR FINANCEIRO
      //SE FOR ENTRADA NORMAL, ENTÃO O CUSTO É DEFINIDO PELA MOVIMENTAÇÃO
      if ds.DataSet.FieldByName('FLG_ES').AsString = 'E' then
      begin
        if ds.DataSet.FieldByName('FLG_TIPO').AsString = 'N' then
          curValMov := ds.DataSet.FieldByName('VAL_MOV').AsCurrency
        else if (ds.DataSet.FieldByName('FLG_TIPO').AsString = 'D') and
          (curValMov = 0) then
        begin
          curValMov := ds.DataSet.FieldByName('VAL_PRODUTO').AsCurrency; 
        end;

      end;

      if ds.DataSet.FieldByName('FLG_ES').AsString = 'E' then
        curValFinan := curValFinanAnt + curValMov
      else
        curValFinan := curValFinanAnt - curValMov;

      //ATUALIZANDO AS VARIÁVEIS DE VALOR ANTERIOR
      curValFinanAnt := curValFinan;
      curQtdFisicoAnt := curQtdFisico;

      if ds.DataSet.FieldByName('FLG_ES').AsString = 'E' then
        str := 'Update EST_ENTRADA'
      else
        str := 'Update EST_SAIDA';

      str := str+' Set ';
      str := str+' VAL_MOV = '+cnn.NumberToBD(curValMov)+',';
      str := str+' QTD_FISICO = '+cnn.NumberToBD(curQtdFisico)+',';
      str := str+' VAL_FINAN = '+cnn.NumberToBD(curValFinan);
      str := str+' Where ';
      str := str+' COD_EMPRESA = '+cnn.NumberToBD(CodEmpresa)+' And ';
      str := str+' COD_FILIAL = '+cnn.NumberToBD(CodFilial)+' And ';

      if ds.DataSet.FieldByName('FLG_ES').AsString = 'E' then
        str := str+' COD_FORNECEDOR = '+cnn.NumberToBD(ds.DataSet.FieldByName('COD_FORNECEDOR').AsInteger)+' And ';

      str := str+' NUM_DOCUMENTO = '+cnn.NumberToBD(ds.DataSet.FieldByName('NUM_DOCUMENTO').AsInteger)+' And ';
      str := str+' NOM_SERIE = '+cnn.StrToBD(ds.DataSet.FieldByName('NOM_SERIE').AsString)+' And ';
      str := str+' COD_PRODUTO = '+cnn.NumberToBD(CodProduto);

      cnn.Execute(str);

      ds.DataSet.Next;

    end; //FIM WHILE

    str := 'Update CAD_PRODUTO ';
    str := str+' Set ';
    str := str+' QTD_FISICO = '+cnn.NumberToBD(curQtdFisico)+',';
    str := str+' VAL_FINAN =  '+cnn.NumberToBD(curValFinan);
    str := str+' Where ';
    str := str+' COD_PRODUTO = '+cnn.NumberToBD(CodProduto);

    cnn.Execute(str);

  except
    on ex: Exception do
    begin
      cnn.Rollback;
      FMsgErro := ex.Message;
      Result := false;
      Exit;
    end;
  end;

  cnn.Commit;
  cnn.Close;
  
  Result := true;

end;

end.
