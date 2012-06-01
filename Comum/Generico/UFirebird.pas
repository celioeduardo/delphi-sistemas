unit UFirebird;

interface

uses
  Types, Dialogs, SysUtils, SqlExpr, DB, SimpleDS, DBGrids, StdCtrls, Classes,
  UComponentTag, DBXpress, Variants, Math;

//constantes
const
  conServerDefault = 'localhost';
  conConnectionName = 'IBConnection';
  conDriverName = 'Interbase';
  conSQLDialect = 3;
  conLoginPrompt = False;
  conGetDriverFunc = 'getSQLDriverINTERBASE';
  conLibaryName = 'dbexpint.dll';
  conVendorLib = 'gds32.dll';

type

  TFirebird = class
  private

    FConnection: TSQLConnection; // conexão ao banco de dados
    FDatabase: string;
    FServer: string;
    FSQLDialect: integer;
    FLoginPrompt: boolean;
    FDriverName: string;
    FConnectionName: string;
    FUser: string;
    FPassword: string;
    FGetDriverFunc: string;
    FLibaryName: string;
    FVendorLib: string;
    FTransacao: TTransactionDesc;
    FTransacaoAtiva: boolean;
    FEmbedded: boolean;
    // funções de property
    function SFNConnected: boolean;

  public
    constructor Create;
    destructor Destroy;

    procedure Open;
    procedure Close;
    procedure BeginTrans;
    procedure Commit;
    procedure Rollback;
    function  Execute(Comando: string; blnTrataErro:boolean = true): integer;
    //Simple DataSet
    function  ExecuteQuery(Comando: string; var SimpleDataSet: TSimpleDataSet): boolean; overload;
    //DataSource
    function  ExecuteQuery(Comando: string; var DataSource: TDataSource): boolean; overload;
    //DBGrid
    function  ExecuteQuery(Comando: string; var DBGrid: TDBGrid): boolean; overload;
    //TComboBox
    function  ExecuteQuery(Comando: string; var ComboBox: TComboBoxTag; Style: TComboBoxStyle = csDropDownList): boolean; overload;
    //TListBox
    function  ExecuteQuery(Comando: string; var ListBox: TListBox): boolean; overload;

    function Aspas(Valor: string): string;
    function To_Date(str: string): string;

    function NumberToBD(val: variant; Default: string = ''): string;
    function DateToBD(val: Variant): string;
    function StrToBD(val: Variant): string;

    property Database: string read FDatabase write FDatabase;
    property Server: string read FServer write FServer;
    property Connected: boolean read SFNConnected;
    property SQLDialect: integer read FSQLDialect write FSQLDialect;
    property User: string read FUser write FUser;
    property Password: string read FPassword write FPassword;
    property Embedded: boolean read FEmbedded write FEmbedded;

  end;

implementation

constructor TFirebird.Create;
begin
  FConnection := TSQLConnection.Create(FConnection);
  FSQLDialect := conSQLDialect;
  FLoginPrompt := conLoginPrompt;
  FDriverName := conDriverName;
  FConnectionName := conConnectionName;
  Server := conServerDefault;
  Database := '';
  FGetDriverFunc := conGetDriverFunc;
  FLibaryName := conLibaryName;
  FVendorLib := conVendorLib;
  FTransacao.IsolationLevel := xilREADCOMMITTED;
  FTransacao.TransactionID := 1;
  FTransacaoAtiva := false;
  FEmbedded := false;
end;

destructor TFirebird.Destroy;
begin
  FConnection.Close;
  inherited Destroy;
end;

procedure TFirebird.Open;
begin
  try
    if Trim(FServer) = '' then
      FServer := conServerDefault;
    if Trim(FDatabase) = '' then
      raise Exception.Create('É necessário informar o Banco de Dados (Database)')
    else
    begin
      FConnection.ConnectionName := FConnectionName;
      FConnection.DriverName := FDriverName;
      FConnection.LoginPrompt := FLoginPrompt;
      FConnection.GetDriverFunc := FGetDriverFunc;
      FConnection.LibraryName := FLibaryName;
      FConnection.VendorLib := FVendorLib;
      FConnection.Params.Clear;
      FConnection.Params.Add('SqlDialect='+intToStr(FSQLDialect));
      FConnection.Params.Add('User_Name='+FUser);
      FConnection.Params.Add('Password='+FPassword);

      if FEmbedded then
        FConnection.Params.Add('Database='+FDatabase)
      else
        FConnection.Params.Add('Database='+FServer+':'+FDatabase);
        
      FConnection.Open;
    end;
  except
    on Ex: Exception do
      raise Exception.Create(Ex.Message);
  end;
end; //End procedure


function TFirebird.ExecuteQuery(Comando: string; var SimpleDataSet: TSimpleDataSet): boolean;
begin
  if not(FConnection.Connected) then
    raise Exception.Create('A conexão não está aberta');

  if not Assigned(SimpleDataSet) then
    SimpleDataSet := TSimpleDataSet.Create(nil);

  if SimpleDataSet.Active then
    SimpleDataSet.Close;
    
  SimpleDataSet.DataSet.CommandType := ctQuery;
  SimpleDataSet.Connection := FConnection;
  SimpleDataSet.DataSet.CommandText := Comando;
  try
    SimpleDataSet.Active := True;
    try
      Result := SimpleDataSet.DataSet.RecordCount > 0;
    except
      Result := false;
    end;
    SimpleDataSet.Connection := nil;
  except
    on ex: Exception do
      raise Exception.Create(ex.Message);
  end;
end;

function TFirebird.ExecuteQuery(Comando: string; var DataSource: TDataSource): boolean;
var
  SimpleDataSet: TSimpleDataSet;
begin
  if not(FConnection.Connected) then
    raise Exception.Create('A conexão não está aberta');
  DataSource := TDataSource.Create(nil);
  SimpleDataSet := nil;
  SimpleDataSet := TSimpleDataSet.Create(SimpleDataSet);
  SimpleDataSet.DataSet.CommandType := ctQuery;
  SimpleDataSet.Connection := FConnection;
  SimpleDataSet.DataSet.CommandText := Comando;

  try
    SimpleDataSet.Active := True;
    DataSource.DataSet := SimpleDataSet;
    Result := DataSource.DataSet.RecordCount > 0;
  except
    on ex: Exception do
      raise Exception.Create(ex.Message);
  end;
end;

function TFirebird.ExecuteQuery(Comando: string; var DBGrid: TDBGrid): boolean;
var
  SimpleDataSet: TSimpleDataSet;
  DataSource : TDataSource;
begin
  if not(FConnection.Connected) then
    raise Exception.Create('A conexão não está aberta');

  //**********************************************//
  if Assigned(DBgrid.DataSource) then
  begin
    if Assigned(DBgrid.DataSource.DataSet) then
      DBgrid.DataSource.DataSet.Free;
    DBgrid.DataSource.Free;
  end;

  DBgrid.DataSource := TDataSource.Create(nil);
  DBgrid.DataSource.DataSet := TSimpleDataSet.Create(nil);
  //**********************************************//

  TSimpleDataSet(DBGrid.DataSource.DataSet).DataSet.CommandType := ctQuery;
  TSimpleDataSet(DBGrid.DataSource.DataSet).Connection := FConnection;

  try
    TSimpleDataSet(DBGrid.DataSource.DataSet).DataSet.CommandText := Comando;
    TSimpleDataSet(DBGrid.DataSource.DataSet).Active := True;
    TSimpleDataSet(DBGrid.DataSource.DataSet).Connection := nil;
    Result := DBGrid.DataSource.DataSet.RecordCount > 0;

    //ShowMessage(IntToStr(FConnection.DataSetCount));
  except
    on ex: Exception do
      raise Exception.Create(ex.Message);
  end;
end;

function TFirebird.ExecuteQuery(Comando: string; var ComboBox: TComboBoxTag; Style: TComboBoxStyle = csDropDownList): boolean;
var
  DataSet :TSQLDataSet;
  str :TStringList;
  i :integer;
  blnEntrou : boolean;
begin
  if not(FConnection.Connected) then
    raise Exception.Create('A conexão não está aberta');
  DataSet := nil;
  DataSet := TSQLDataSet.Create(DataSet);
  DataSet.CommandType := ctQuery;
  DataSet.SQLConnection := FConnection;
  DataSet.CommandText := Comando;
  blnEntrou := False;
  try
    DataSet.Active := True;
    ComboBox.Style := Style;
    ComboBox.Items.Clear;
    DataSet.Open;
    DataSet.Prior;
    while not(DataSet.Eof) do
    begin
      str := TStringList.Create;
      { Carrega uma StringList para servir como "Bound" do Controle}
      for i := 1 to DataSet.Fields.Count -1 do
        str.Add(DataSet.Fields[i].AsString);
      ComboBox.Items.AddObject(DataSet.Fields[0].AsString, str);
      DataSet.Next;
      blnEntrou := True;
    end;
    Result := blnEntrou;
  except
    on ex: Exception do
      raise Exception.Create(ex.Message);
  end;
end;

function TFirebird.ExecuteQuery(Comando: string; var ListBox: TListBox): boolean;
var
  DataSet: TSQLDataSet;
  str :TStringList;
  i :integer;
  blnEntrou : boolean;
begin
  if not(FConnection.Connected) then
    raise Exception.Create('A conexão não está aberta');
  DataSet := nil;
  DataSet := TSQLDataSet.Create(DataSet);
  DataSet.CommandType := ctQuery;
  DataSet.SQLConnection := FConnection;
  DataSet.CommandText := Comando;
  blnEntrou := False;
  try
    DataSet.Active := True;
    ListBox.Items.Clear;
    DataSet.Open;
    DataSet.Prior;
    while not(DataSet.Eof) do
    begin
      str := TStringList.Create;
      { Carrega uma StringList para servir como "Bound" do Controle}
      for i := 1 to DataSet.Fields.Count -1 do
        str.Add(DataSet.Fields[i].AsString);
      ListBox.Items.AddObject(DataSet.Fields[0].AsString,str);
      DataSet.Next;
      blnEntrou := True;
    end;
    DataSet.Close;
    Result := blnEntrou;
  except
    on ex: Exception do
      raise Exception.Create(ex.Message);
  end;
end;

function TFirebird.Execute(Comando: string; blnTrataErro:boolean = true): integer;
begin
  if not(FConnection.Connected) then
    raise Exception.Create('A conexão não está aberta');
  try
    result := FConnection.ExecuteDirect(Comando);
  except
    on ex: Exception do
      if (blnTrataErro) then
        raise Exception.Create(ex.Message);

  end;
end;


function TFirebird.SFNConnected;
begin
  result := FConnection.Connected;
end;

function TFirebird.Aspas(Valor: string): string;
begin
  Result := '''' + StringReplace(Valor,'''','',[rfReplaceAll,rfIgnoreCase]) + '''';
end;

procedure TFirebird.Close;
begin
  if FConnection.Connected then
  begin
    FConnection.Close;
  end;
end;

function TFirebird.To_Date(str: string): string;

var strAux: string;

begin
  strAux := StringReplace(str,'/','',[rfReplaceAll]);
  Result := ''''+Copy(strAux,3,2)+'-'+ Copy(strAux,1,2)  +'-'+Copy(strAux,5,4)+'''';
end;

procedure TFirebird.BeginTrans;
begin
  If not FTransacaoAtiva then
  begin
    FConnection.StartTransaction(FTransacao);
    FTransacaoAtiva := true;
  end;
end;

procedure TFirebird.Commit;
begin
  If FTransacaoAtiva then
  begin
    FConnection.Commit(FTransacao);
    FTransacaoAtiva := false;
  end;
end;

procedure TFirebird.Rollback;
begin
  If FTransacaoAtiva then
  begin
    FConnection.Rollback(FTransacao);
    FTransacaoAtiva := false;
  end;
end;

function TFirebird.DateToBD(val: variant): string;

var str: string;

begin
  case VarType(val) of
    varDate: str := DateToStr(TDateTime(val));
    varInteger: str := DateToStr(val);
    varDouble: str := FormatDateTime('dd/mm/yyyy',val);
    varString: str := String(val);
  end;

  if trim(str) = EmptyStr then
    Result := 'null'
  else
    Result := To_Date(str);
end;
 
function TFirebird.NumberToBD(val: variant; Default: string = ''): string;
var str: string;
begin
  case VarType(val) of
    // INTEIROS
    varSmallint, varInteger,
    varShortInt, varByte, varWord, varLongWord,
    varInt64: str := IntToStr(val);
    // PONTO FLUTUANTE
    varSingle, varDouble: str := FloatToStr(val);
    varCurrency: str := CurrToStr(val);
    // STRING
    varString: str := String(val)
  else
    str := '0';
  end;
  str := StringReplace(StringReplace(str,ThousandSeparator,EmptyStr,[rfReplaceAll]),DecimalSeparator,'.',[rfReplaceAll]);

  if (trim(Default) <> EmptyStr) and (trim(str) = EmptyStr) then
    str := Default;

  Result := str;
end;
 
function TFirebird.StrToBD(val: variant): string;
var str: string;
begin
  case VarType(val) of
    // INTEIROS
    varSmallint, varInteger,
    varShortInt, varByte, varWord, varLongWord,
    varInt64: str := IntToStr(val);
    // PONTO FLUTUANTE
    varSingle, varDouble, varCurrency: FloatToStr(val);
    // STRING
    varString: str := String(val)
  else
    str := EmptyStr;
  end;

  if str = EmptyStr then
    str := 'null'
  else
    str := QuotedStr(StringReplace(str,'''',EmptyStr,[rfReplaceAll]));

  Result := str
end;

end.
