unit UdmRelatorio;

interface

uses
  SysUtils, Classes, RpBase, RpSystem, RpDefine, RpRave, DBXpress, DB,
  SqlExpr, DBClient, SimpleDS, RpCon, RpConDS;

type
  TTipoRelatorio = (
  MEDICOS,
  MEDICOS_HOSPITAL
  );

  TdmRelatorio = class(TDataModule)
    rvProject: TRvProject;
    rvSystem: TRvSystem;
    conn: TSQLConnection;
    dsMedico: TSimpleDataSet;
    rvDs: TRvDataSetConnection;
    dsMedConv: TSimpleDataSet;
    rvMedConv: TRvDataSetConnection;
    rvMedHosp: TRvDataSetConnection;
    dsMedHosp: TSimpleDataSet;
    dsMedHist: TSimpleDataSet;
    rvMedHist: TRvDataSetConnection;
    procedure rvSystemPrint(Sender: TObject);
  private
    FTipoRelatorio: TTipoRelatorio;
  public
    procedure ExecutaRelatorio(strSql: string; TipoRelatorio: TTipoRelatorio);
    //property TipoRelatorio:TTipoRelatorio read FTipoRelatorio write FTipoRelatorio;

  end;

var
  dmRelatorio: TdmRelatorio;

implementation

{$R *.dfm}

{ TdmRelatorio }

procedure TdmRelatorio.ExecutaRelatorio(strSql: string; TipoRelatorio: TTipoRelatorio);
begin
  with dmRelatorio.rvSystem do
  begin

    //SystemPreview.FormState := wsMaximized;
    DefaultDest := rdPreview;
    SystemPrinter.Units := unMM;
    FTipoRelatorio := TipoRelatorio;
    dsMedico.DataSet.CommandText := strSql;

    if TipoRelatorio = MEDICOS then
      rvProject.ExecuteReport('rptMedicos')
    else if TipoRelatorio = MEDICOS_HOSPITAL then
      rvProject.ExecuteReport('rptMedicosHospital');

  end;
end;

procedure TdmRelatorio.rvSystemPrint(Sender: TObject);
begin
  {case FTipoRelatorio of
    MEDICOS:
      rvProject.ClearParams;
      //rvProject.SetParam('NomeSistema',GloStrNomeSistema);
      rvProject.ExecuteReport('rptMedicos');
  end;}

end;

end.
