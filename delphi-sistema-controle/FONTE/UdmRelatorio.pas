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
    dsProduto: TSimpleDataSet;
    rvDs: TRvDataSetConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmRelatorio: TdmRelatorio;

implementation

{$R *.dfm}

end.
