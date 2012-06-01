unit UdmRelatorio;

interface

uses
  SysUtils, Classes, RpBase, RpSystem, RpDefine, RpRave, DBXpress, DB,
  SqlExpr, DBClient, SimpleDS, RpCon, RpConDS;

type
  TdmRelatorio = class(TDataModule)
    rvProject: TRvProject;
    rvSystem: TRvSystem;
    conn: TSQLConnection;
    dsLancamento: TSimpleDataSet;
    rvDs: TRvDataSetConnection;
  private
    { Private declarations }
  public
    procedure ExecutaRelatorio(strSql, strRelatorio: string);
  end;

var
  dmRelatorio: TdmRelatorio;

implementation

{$R *.dfm}

{ TdmRelatorio }

procedure TdmRelatorio.ExecutaRelatorio(strSql, strRelatorio: string);
begin

end;

end.
