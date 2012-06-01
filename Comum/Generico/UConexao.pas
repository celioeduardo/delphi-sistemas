unit UConexao;

interface

uses SysUtils, UFirebird, SimpleDS, DB, DbGrids, StdCtrls, UComponentTag;

type

  TConexao = class
  private
    FConexao : TFirebird;
    FUser: string;
    FPassword: string;
    FDatabase: string;
    FServer: string;
    FEmbedded: boolean;
    procedure SetDatabase(Database :string);
    procedure SetServer(Server :string);
    procedure SetEmbedded(embedded :boolean);
  public
    constructor Create(user, password, database: string; server : string; embedded :boolean);
    destructor Destroy; override;

    procedure Open;
    procedure Close;
    procedure BeginTrans;
    procedure Commit;
    procedure Rollback;

    function  Execute(Comando: string; blnTrataErro:boolean = true): integer;
    function  ExecuteQuery(Comando: string; var SimpleDataSet: TSimpleDataSet): boolean; overload;
    function  ExecuteQuery(Comando: string; var DataSource: TDataSource): boolean; overload;
    function  ExecuteQuery(Comando: string; var DBGrid: TDBGrid): boolean; overload;
    function  ExecuteQuery(Comando: string; var ComboBox: TComboBoxTag; Style: TComboBoxStyle = csDropDownList): boolean; overload;
    function  ExecuteQuery(Comando: string; var ListBox: TListBox): boolean; overload;
    function  Aspas(const Valor: string): string;
    function  To_Date(str: string): string;

    function NumberToBD(val: variant; Default: string = ''): string;
    function DateToBD(val: Variant): string;
    function StrToBD(val: Variant): string;

    property  Database : string read FDatabase write SetDatabase;
    property  Server : string read FServer write SetServer;
    property  Embedded : boolean read FEmbedded write SetEmbedded;
  end;

implementation

const conDatabaseFirebird = 'teste';

constructor TConexao.Create(user, password, database: string; server : string; embedded :boolean);
begin
  FUser := user;
  FPassword := password;
  FConexao := TFirebird.Create;
  FConexao.User := user;
  FConexao.Password := password;
  FConexao.Database := database;
  FConexao.Server := server;
  FConexao.Embedded := embedded;
  FUser := user;
  FPassword := password;
  FDatabase := database;
  FServer := server;
  FEmbedded := embedded;
end;

destructor TConexao.Destroy;
begin
  if Assigned(FConexao) then
    FConexao.Close;
end;

procedure TConexao.SetDatabase(Database :string);
begin
  FDatabase := Database;
  FConexao.Database := Database;
end;

procedure TConexao.SetServer(Server :string);
begin
  FServer := Server;
  FConexao.Server := Server;
end;

procedure TConexao.Open;
begin
  if Assigned(FConexao) then
  begin
    if FDatabase = '' then
      SetDatabase(conDatabaseFirebird);
    FConexao.Open;
  end;
end;
                                           
procedure TConexao.Close;
begin
  if Assigned(FConexao) then
  begin
    //FConexao.Destroy;
    FConexao.Close;
  end;
end;

function TConexao.Execute(Comando: string; blnTrataErro:boolean = true): integer;
begin
  if Assigned(FConexao) then
    Result := FConexao.Execute(Comando, blnTrataErro)
  else
    Result := 0;
end;

function TConexao.ExecuteQuery(Comando: string; var SimpleDataSet: TSimpleDataSet): boolean;
begin
  if Assigned(FConexao) then
    Result := FConexao.ExecuteQuery(Comando,SimpleDataSet)
  else
    Result := False;
end;

function TConexao.ExecuteQuery(Comando: string; var DataSource: TDataSource): boolean;
//var ds: TDataSource;
begin
  if Assigned(FConexao) then
  begin
    Result := FConexao.ExecuteQuery(Comando, DataSource);
  //  DataSource := ds;
  end
  else
    Result := False;
end;

function TConexao.ExecuteQuery(Comando: string; var DBGrid: TDBGrid): boolean;
begin
  if Assigned(FConexao) then
    Result := FConexao.ExecuteQuery(Comando, DBGrid)
  else
    Result := False;
end;

function TConexao.ExecuteQuery(Comando: string; var ComboBox: TComboBoxTag; Style : TComboBoxStyle): boolean;
begin
  if Assigned(FConexao) then
    Result := FConexao.ExecuteQuery(Comando, ComboBox, Style)
  else
    Result := False;
end;

function TConexao.ExecuteQuery(Comando: string; var ListBox: TListBox): boolean;
begin
  if Assigned(FConexao) then
    Result := FConexao.ExecuteQuery(Comando, ListBox)
  else
    Result := False;
end;

function TConexao.Aspas(const Valor: string): string;
begin
  Result := '''' + StringReplace(Valor,'''','',[rfReplaceAll,rfIgnoreCase]) + '''';
end;

function TConexao.To_Date(str: string): string;
begin
  Result := FConexao.To_Date(str);
end;

procedure TConexao.BeginTrans;
begin
  FConexao.BeginTrans;
end;

procedure TConexao.Commit;
begin
  FConexao.Commit;
end;

procedure TConexao.Rollback;
begin
  FConexao.Rollback;
end;

function TConexao.DateToBD(val: Variant): string;
begin
  Result := FConexao.DateToBD(val);
end;

function TConexao.NumberToBD(val: variant; Default: string = ''): string;
begin
  Result := FConexao.NumberToBD(val,Default);
end;

function TConexao.StrToBD(val: Variant): string;
begin
  Result := FConexao.StrToBD(val);
end;

procedure TConexao.SetEmbedded(embedded :boolean);
begin
  FEmbedded := embedded;
  FConexao.Embedded := embedded;
end;

end.
