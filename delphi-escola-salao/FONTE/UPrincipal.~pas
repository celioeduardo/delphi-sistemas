unit UPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, ToolWin, UConexao,DB,UGlobal, UException,
  AppEvnts;

type
  TfrmPrincipal = class(TForm)
    mnu: TMainMenu;
    mnuCadastro: TMenuItem;
    stb: TStatusBar;
    tlbLeft: TToolBar;
    mnuSair: TMenuItem;
    appExcept: TApplicationEvents;
    mnuCAD_PUBLICO: TMenuItem;
    mnuCAD_TP_REUNIAO: TMenuItem;
    mnuCAD_SALA: TMenuItem;
    mnuCAD_MOD_REUNIAO: TMenuItem;
    mnuCAD_TP_PARTE: TMenuItem;
    mnuCAD_PROGRAMA: TMenuItem;
    mnuReuniao: TMenuItem;
    mnuMOV_REUNIAO: TMenuItem;
    mnuCAD_CIDADE: TMenuItem;
    mnuCAD_PONTO: TMenuItem;
    mnuCAD_CENA: TMenuItem;
    mnuCAD_PARTE_PONTO: TMenuItem;
    N1: TMenuItem;
    mnuCAD_PARTE_CENA: TMenuItem;
    N2: TMenuItem;
    CadastrodeReuniao: TMenuItem;
    mnuSalasPorParte: TMenuItem;
    N3: TMenuItem;
    Relatrio1: TMenuItem;
    DesignaodaReunio1: TMenuItem;
    mnuCAD_PONTO_CONCLUIDO: TMenuItem;
    estemunhoporTelefone1: TMenuItem;
    mnuCAD_TER_APTO: TMenuItem;
    mnuCAD_APTO: TMenuItem;
    estemunhoTelefone1: TMenuItem;
    mnuFolhaRosto: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mnuSairClick(Sender: TObject);
    procedure appExceptException(Sender: TObject; E: Exception);
    procedure mnuCAD_TP_REUNIAOClick(Sender: TObject);
    procedure mnuCAD_TP_PARTEClick(Sender: TObject);
    procedure mnuCAD_SALAClick(Sender: TObject);
    procedure mnuCAD_PUBLICOClick(Sender: TObject);
    procedure mnuCAD_MOD_REUNIAOClick(Sender: TObject);
    procedure mnuCAD_PROGRAMAClick(Sender: TObject);
    procedure mnuCAD_CIDADEClick(Sender: TObject);
    procedure mnuCAD_PONTOClick(Sender: TObject);
    procedure mnuCAD_CENAClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure mnuCAD_PARTE_PONTOClick(Sender: TObject);
    procedure mnuCAD_PARTE_CENAClick(Sender: TObject);
    procedure CadastrodeReuniaoClick(Sender: TObject);
    procedure mnuMOV_REUNIAOClick(Sender: TObject);
    procedure mnuSalasPorParteClick(Sender: TObject);
    procedure DesignaodaReunio1Click(Sender: TObject);
    procedure mnuCAD_PONTO_CONCLUIDOClick(Sender: TObject);
    procedure mnuCAD_TER_APTOClick(Sender: TObject);
    procedure mnuCAD_APTOClick(Sender: TObject);
    procedure mnuFolhaRostoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;
  Excep       : TException;

implementation

uses Printers,
     UdmRelatorio,
     UCAD_TP_REUNIAO, UCAD_TP_PARTE, UCAD_SALA, UCAD_PUBLICO, UCAD_MOD_REUNIAO,
     UCAD_PROGRAMA,UCAD_CIDADE, UCAD_PONTO, UCAD_CENA, UCAD_PARTE_PONTO,
     UCAD_PARTE_CENA, UCAD_REUNIAO, UDesignacaoReuniao, UCAD_PARTE_SALA,
     UCAD_PONTO_CONCLUIDO, UCAD_TER_APTO, UCAD_APTO;


{$R *.dfm}



procedure TfrmPrincipal.FormCreate(Sender: TObject);
var strDatabase: string;
    i, index: integer;
begin
  GloStrNomeSistema := 'SISTEMA EMT';

  strDatabase := 'salao.FDB';

  GloStrUser := 'sysdba';
  GloStrPassword := 'masterkey';
  GloStrDatabase := strDatabase;
  GloBlnEmbedded := True;


  //***********************************************
  // AJUSTANDO PARÂMETROS DO OBJETO DE CONEXÃO DO
  // RELATORIO
  //***********************************************

  dmRelatorio := TdmRelatorio.Create(Application);

  index := -1;

  for i := 0 to dmRelatorio.Connection.Params.Count -1 do
  begin
    if UpperCase(dmRelatorio.Connection.Params.Names[i]) = 'DATABASE' then
    begin
      index := i;
      break;
    end;
  end;
  if index > -1 then
    dmRelatorio.Connection.Params.Delete(index);
  dmRelatorio.Connection.Params.Add('Database='+strDatabase);
  //dmrelatorio.conn.Params.SaveToFile('c:\parametros2.txt');
  //dmRelatorio.Connection.Connected := true;
  
end;

procedure TfrmPrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  application.Terminate;
end;

procedure TfrmPrincipal.mnuSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrincipal.appExceptException(Sender: TObject; E: Exception);
begin
  Excep.NotifyException(Sender,E);
end;

procedure TfrmPrincipal.mnuCAD_TP_REUNIAOClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCAD_TP_REUNIAO,frmCAD_TP_REUNIAO);
end;

procedure TfrmPrincipal.mnuCAD_TP_PARTEClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCAD_TP_PARTE,frmCAD_TP_PARTE);
end;

procedure TfrmPrincipal.mnuCAD_SALAClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCAD_SALA,frmCAD_SALA);
end;

procedure TfrmPrincipal.mnuCAD_PUBLICOClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCAD_PUBLICO,frmCAD_PUBLICO);
end;

procedure TfrmPrincipal.mnuCAD_MOD_REUNIAOClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCAD_MOD_REUNIAO,frmCAD_MOD_REUNIAO);
end;

procedure TfrmPrincipal.mnuCAD_PROGRAMAClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCAD_PROGRAMA,frmCAD_PROGRAMA);
end;

procedure TfrmPrincipal.mnuCAD_CIDADEClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCAD_CIDADE,frmCAD_CIDADE);
end;

procedure TfrmPrincipal.mnuCAD_PONTOClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCAD_PONTO,frmCAD_PONTO);
end;

procedure TfrmPrincipal.mnuCAD_CENAClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCAD_CENA,frmCAD_CENA);
end;

procedure TfrmPrincipal.FormActivate(Sender: TObject);
begin
  if Printer.Printers.Count > 0 Then
    stb.Panels[1].Text := 'Impressora: '+ Printer.Printers[Printer.PrinterIndex];
  stb.Panels[2].Text := DateToStr(Now);
end;

procedure TfrmPrincipal.mnuCAD_PARTE_PONTOClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCAD_PARTE_PONTO,frmCAD_PARTE_PONTO);
end;

procedure TfrmPrincipal.mnuCAD_PARTE_CENAClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCAD_PARTE_CENA,frmCAD_PARTE_CENA);
end;

procedure TfrmPrincipal.CadastrodeReuniaoClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCAD_REUNIAO,frmCAD_REUNIAO);
end;

procedure TfrmPrincipal.mnuMOV_REUNIAOClick(Sender: TObject);
begin
  Application.CreateForm(TfrmDesignacaoReuniao,frmDesignacaoReuniao);
end;

procedure TfrmPrincipal.mnuSalasPorParteClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCAD_PARTE_SALA,frmCAD_PARTE_SALA);
end;

procedure TfrmPrincipal.DesignaodaReunio1Click(Sender: TObject);
var
  str: string;
  bln: boolean;
  data: TDateTime;
begin
  try
    {dmRelatorio.rvProject.ProjectFile := ExtractFilePath(Application.ExeName)+'DesignacaoReuniao.rav';
    dmRelatorio.sdsDesReuniao.Active := false;
    dmRelatorio.sdsDesReuniao.Active := true;
    dmRelatorio.sdsDesReuniao.DataSet.Active := true;
    dmRelatorio.sdsDesReuniao.DataSet.Refresh;
    dmRelatorio.rvSys.SystemPreview.FormState := wsMaximized;
    dmRelatorio.rvProject.ClearParams;
    dmRelatorio.rvProject.SetParam()
    dmRelatorio.rvProject.ExecuteReport('rptDesignacaoReuniao');

    dmRelatorio.sdsDesReuniao.DataSet.Active := false;}
    str := InputBox('Insira a data da semana do relatório','Semana de:','');

    if trim(str) = '' then
      Exit;

    try
      data := StrToDate(str);
      bln := true;
    except
      bln := false;
    end;

    if bln then
      dmRelatorio.ExecutaRelDesignacaoReuniao(str, 'A')
    else
      MessageDlg('Data inválida',mtWarning,[mbOK],0);

  finally
  end;
end;

procedure TfrmPrincipal.mnuCAD_PONTO_CONCLUIDOClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCAD_PONTO_CONCLUIDO,frmCAD_PONTO_CONCLUIDO);
end;

procedure TfrmPrincipal.mnuCAD_TER_APTOClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCAD_TER_APTO,frmCAD_TER_APTO);
end;

procedure TfrmPrincipal.mnuCAD_APTOClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCAD_APTO,frmCAD_APTO);
end;

procedure TfrmPrincipal.mnuFolhaRostoClick(Sender: TObject);
begin
  dmRelatorio.ExecutaRelFolhaRostoTestFone;
end;

end.

