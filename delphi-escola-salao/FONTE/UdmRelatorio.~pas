unit UdmRelatorio;

interface

uses
  SysUtils, Classes, RpCon, RpConDS, RpBase, RpSystem, RpDefine, RpRave,
  DB, DBClient, SimpleDS, DBXpress, FMTBcd, SqlExpr;

type
  TdmRelatorio = class(TDataModule)
    rvSys: TRvSystem;
    rvDS: TRvDataSetConnection;
    sdsDesReuniao: TSimpleDataSet;
    Connection: TSQLConnection;
    rvProject: TRvProject;
    sdsDesignacao: TSimpleDataSet;
    rvDesignacaoIndividual: TRvDataSetConnection;
    rvProjectTestemunhoTelefone: TRvProject;
    RvDataSetTestemunhoTelefone: TRvDataSetConnection;
    sdsTestemunhoTelefone: TSimpleDataSet;
    sdsTestFoneTerritorio: TSimpleDataSet;
    rvTestFoneTerritorio: TRvDataSetConnection;
  private
    function RelDesignacaoReuniao (strData: string): string;
    function RelReuniaoMes (strData: string): string;
    function RelFolhaRostoTestFone: string;
  public
    procedure ExecutaRelDesignacaoReuniao(strData: string; strSalaDefault: string);
    procedure ExecutaRelReuniaoMes(strData: string);
    procedure ExecutaRelFolhaRostoTestFone;
  end;

var
  dmRelatorio: TdmRelatorio;

implementation

uses UConexao, UGlobal, Forms;

{$R *.dfm}

{ TdmRelatorio }

procedure TdmRelatorio.ExecutaRelDesignacaoReuniao(strData: string;
  strSalaDefault: string);
var str: string;
begin
  str := RelDesignacaoReuniao(strData);
  sdsDesReuniao.DataSet.CommandText := str;
  sdsDesReuniao.Active := false;
  sdsDesReuniao.Active := true;
  sdsDesReuniao.DataSet.Active := true;
  rvSys.SystemPreview.FormState := wsMaximized;
  dmRelatorio.rvProject.ClearParams;
  dmRelatorio.rvProject.SetParam('Sala',UpperCase(strSalaDefault));
  rvProject.ExecuteReport('rptDesignacaoReuniao');
  sdsDesReuniao.DataSet.Active := false;
end;

procedure TdmRelatorio.ExecutaRelReuniaoMes(strData: string);
var str: string;
begin
  str := RelReuniaoMes(strData);
  sdsDesReuniao.DataSet.CommandText := str;
  sdsDesReuniao.Active := false;
  sdsDesReuniao.Active := true;
  sdsDesReuniao.DataSet.Active := true;
  rvSys.SystemPreview.FormState := wsMaximized;
  dmRelatorio.rvProject.ClearParams;
  rvProject.ExecuteReport('rptImpressaoMes');
  sdsDesReuniao.DataSet.Active := false;
end;

procedure TdmRelatorio.ExecutaRelFolhaRostoTestFone();
var str: string;
begin
  str := RelFolhaRostoTestFone;
  sdsTestemunhoTelefone.DataSet.CommandText := str;
  sdsTestemunhoTelefone.Active := false;
  sdsTestemunhoTelefone.Active := true;
  sdsTestemunhoTelefone.DataSet.Active := true;
  rvSys.SystemPreview.FormState := wsMaximized;
  dmRelatorio.rvProjectTestemunhoTelefone.ClearParams;
  rvProjectTestemunhoTelefone.ExecuteReport('rptFolhaRosto');
  sdsTestemunhoTelefone.DataSet.Active := false;
end;


function TdmRelatorio.RelReuniaoMes (strData: string): string;
var
  str: string;
  cnn: TConexao;
begin
  cnn := TConexao.Create(GloStrUser,GloStrPassword,GloStrDatabase,GlostrServer, GloblnEmbedded);
  str := ' Select ';
  str := str + ' A.DAT_SEMANA,';
  str := str + ' A.DAT_REUNIAO,';
  str := str + ' E.NUM_CANTICO,';
  str := str + ' A.COD_TP_REUNIAO,';
  str := str + ' A.COD_TP_PARTE,';
  str := str + ' F.NOM_PARTE,';
  str := str + ' F.NOM_MATERIA,';
  str := str + ' A.COD_SALA,';
  str := str + ' A.COD_PUBLICO,';
  str := str + ' B.NOM_PUBLICO,';
  str := str + ' A.COD_PUB_AJU,';
  str := str + ' C.NOM_PUBLICO NOM_PUB_AJU,';
  str := str + ' A.COD_PONTO,';
  str := str + ' D.NOM_PONTO,';
  str := str + ' A.DSC_OBS_DESIGNACAO,';
  str := str + ' A.DSC_OBSERVACAO,';
  str := str + ' H.NOM_TP_PARTE,';
  str := str + ' G.NOM_SALA,';
  str := str + ' B.FLG_SEXO, ';
  str := str + ' F.NUM_ORDEM ';
  str := str + ' From ';
  str := str + ' MOV_REUNIAO A ';
  str := str + '  Left Outer Join CAD_PUBLICO C On ';
  str := str + '    A.COD_PUB_AJU = C.COD_PUBLICO ';
  str := str + '  Left Outer Join CAD_PONTO D On ';
  str := str + '    A.COD_PONTO = D.COD_PONTO, ';
  str := str + ' CAD_PUBLICO B, ';
  str := str + ' CAD_REUNIAO E, ';
  str := str + ' CAD_PROGRAMA F, ';
  str := str + ' CAD_SALA G, ';
  str := str + ' CAD_TP_PARTE H ';
  str := str + ' Where  ';
  str := str + ' A.COD_PUBLICO = B.COD_PUBLICO And ';
  str := str + ' A.DAT_SEMANA = E.DAT_SEMANA And ';
  str := str + ' A.DAT_SEMANA = F.DAT_SEMANA And ';
  str := str + ' A.COD_TP_PARTE = F.COD_TP_PARTE And ';
  str := str + ' A.COD_SALA = G.COD_SALA And ';
  str := str + ' A.COD_TP_PARTE = H.COD_TP_PARTE And ';
  str := str + ' A.DAT_SEMANA Containing ' + cnn.Aspas(strData);
  str := str + ' Order By A.DAT_SEMANA, A.COD_SALA, F.NUM_ORDEM, A.COD_PONTO, A.COD_PUB_AJU ';

  cnn.Free;

  Result := str;

end;

function TdmRelatorio.RelDesignacaoReuniao (strData: string): string;
var
  str: string;
  cnn: TConexao;
begin
  cnn := TConexao.Create(GloStrUser,GloStrPassword,GloStrDatabase,GlostrServer,GloBlnEmbedded);
  str := ' Select ';
  str := str + ' A.DAT_SEMANA,';
  str := str + ' A.DAT_REUNIAO,';
  str := str + ' E.NUM_CANTICO,';
  str := str + ' A.COD_TP_REUNIAO,';
  str := str + ' A.COD_TP_PARTE,';
  str := str + ' F.NOM_PARTE,';
  str := str + ' F.NOM_MATERIA,';
  str := str + ' A.COD_SALA,';
  str := str + ' A.COD_PUBLICO,';
  str := str + ' B.NOM_PUBLICO,';
  str := str + ' A.COD_PUB_AJU,';
  str := str + ' C.NOM_PUBLICO NOM_PUB_AJU,';
  str := str + ' A.COD_PONTO,';
  str := str + ' D.NOM_PONTO,';
  str := str + ' A.DSC_OBS_DESIGNACAO,';
  str := str + ' A.DSC_OBSERVACAO,';
  str := str + ' H.NOM_TP_PARTE,';
  str := str + ' G.NOM_SALA,';
  str := str + ' B.FLG_SEXO, ';
  str := str + ' F.NUM_ORDEM ';
  str := str + ' From ';
  str := str + ' MOV_REUNIAO A ';
  str := str + '  Left Outer Join CAD_PUBLICO C On ';
  str := str + '    A.COD_PUB_AJU = C.COD_PUBLICO ';
  str := str + '  Left Outer Join CAD_PONTO D On ';
  str := str + '    A.COD_PONTO = D.COD_PONTO, ';
  str := str + ' CAD_PUBLICO B, ';
  str := str + ' CAD_REUNIAO E, ';
  str := str + ' CAD_PROGRAMA F, ';
  str := str + ' CAD_SALA G, ';
  str := str + ' CAD_TP_PARTE H ';
  str := str + ' Where  ';
  str := str + ' A.COD_PUBLICO = B.COD_PUBLICO And ';
  str := str + ' A.DAT_SEMANA = E.DAT_SEMANA And ';
  str := str + ' A.DAT_SEMANA = F.DAT_SEMANA And ';
  str := str + ' A.COD_TP_PARTE = F.COD_TP_PARTE And ';
  str := str + ' A.COD_SALA = G.COD_SALA And ';
  str := str + ' A.COD_TP_PARTE = H.COD_TP_PARTE And ';
  str := str + ' A.DAT_SEMANA = ' + cnn.To_Date(strData);
  str := str + ' Order By A.DAT_SEMANA, A.COD_SALA, F.NUM_ORDEM, A.COD_PONTO, A.COD_PUB_AJU ';

  cnn.Free;

  Result := str;

end;

function TdmRelatorio.RelFolhaRostoTestFone: string;
var
  str: string;
  cnn: TConexao;
begin
  cnn := TConexao.Create(GloStrUser,GloStrPassword,GloStrDatabase,GlostrServer,GloBlnEmbedded);

  str := 'Select ';
  str := str + ' A.COD_TERRITORIO, ';
  str := str + '  A.NOM_RUA,  ';
  str := str + '  A.NOM_BAIRRO,  ';
  str := str + '  Substring(A.NUM_CEP From 1 For 5)||'+cnn.Aspas('-')+'||Substring(A.NUM_CEP From 6 For 3) NUM_CEP,  ';
  str := str + '  A.NOM_CONDOMINIO,  ';
  str := str + '  B.NUM_APTO,  ';
  str := str + '  B.NUM_TELEFONE,  ';
  str := str + '  B.NUM_TELEFONE2, ';
  str := str + '  B.NUM_TELEFONE3, ';
  str := str + '  B.NUM_CONT,';
  str := str + 'case ';
  str := str + '  when Substring(B.NUM_APTO From 2 For 1)  = '+cnn.Aspas('')+' then '+cnn.Aspas('0000')+'||B.NUM_APTO ';
  str := str + '  when Substring(B.NUM_APTO From 3 For 1)  = '+cnn.Aspas('')+' then '+cnn.Aspas('000')+'||B.NUM_APTO ';
  str := str + '  when Substring(B.NUM_APTO From 4 For 1)  = '+cnn.Aspas('')+' then '+cnn.Aspas('00')+'||B.NUM_APTO ';
  str := str + '  when Substring(B.NUM_APTO From 5 For 1)  = '+cnn.Aspas('')+' then '+cnn.Aspas('0')+'||B.NUM_APTO ';
  str := str + '  else B.NUM_APTO ';
  str := str + 'end ';
  str := str + 'From  ';
  str := str + '  CAD_TER_APTO A,  ';
  str := str + '  CAD_APTO B  ';
  str := str + 'Where  ';
  str := str + '  A.COD_TERRITORIO = B.COD_TERRITORIO ';
  str := str + 'Order By 1,11';

  cnn.Free;

  Result := str;

end;

end.
