unit UPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, ToolWin, UConexao,DB,UGlobal, UException,
  AppEvnts,UdmRelatorio, StdCtrls, Mask, EditLabel;

type
  TfrmPrincipal = class(TForm)
    mnu: TMainMenu;
    mnuCadastro: TMenuItem;
    stb: TStatusBar;
    tlbLeft: TToolBar;
    mnuSair: TMenuItem;
    appExcept: TApplicationEvents;
    mnuPesquisa: TMenuItem;
    mnuCAD_ESPEC: TMenuItem;
    mnuCAD_CONVENIO: TMenuItem;
    mnuCAD_HOSPITAL: TMenuItem;
    mnuPesqMedico: TMenuItem;
    mnuCAD_MEDICO: TMenuItem;
    mnuCAD_CIDADE: TMenuItem;
    mnuMedicoHistorico: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mnuSairClick(Sender: TObject);
    procedure appExceptException(Sender: TObject; E: Exception);
    procedure FormActivate(Sender: TObject);
    procedure mnuCAD_ESPECClick(Sender: TObject);
    procedure mnuCAD_CONVENIOClick(Sender: TObject);
    procedure mnuCAD_HOSPITALClick(Sender: TObject);
    procedure mnuCAD_CIDADEClick(Sender: TObject);
    procedure mnuCAD_MEDICOClick(Sender: TObject);
    procedure mnuPesqMedicoClick(Sender: TObject);
    procedure mnuMedicoHistoricoClick(Sender: TObject);
  private
  public
  end;

var
  frmPrincipal: TfrmPrincipal;
  Excep       : TException;

implementation

uses Functions, Printers,UCAD_ESPEC,UCAD_CONVENIO,UCAD_HOSPITAL,UCAD_CIDADE,
UCAD_MEDICO,UCAD_MED_HIST,UPesqMedico,DateUtils;

{$R *.dfm}

procedure TfrmPrincipal.FormCreate(Sender: TObject);
var
  strDatabase: string;
  i, index: integer;
begin
  GloStrNomeSistema := 'SISTEMA COLIH';

  strDatabase := 'SISTEMA.FDB';

  GloStrUser := 'sysdba';
  GloStrPassword := 'masterkey';
  GloStrDatabase := strDatabase;
  GloBlnEmbedded := true;

  //***********************************************
  // AJUSTANDO PARÂMETROS DO OBJETO DE CONEXÃO DO
  // RELATORIO
  //***********************************************

  dmRelatorio := TdmRelatorio.Create(Application);

  index := -1;

  for i := 0 to dmRelatorio.conn.Params.Count -1 do
  begin
    if UpperCase(dmRelatorio.conn.Params.Names[i]) = 'DATABASE' then
    begin
      index := i;
      break;
    end;
  end;
  if index > -1 then
    dmRelatorio.conn.Params.Delete(index);
  dmRelatorio.conn.Params.Add('Database='+strDatabase);
  //dmrelatorio.conn.Params.SaveToFile('c:\parametros2.txt');
  dmRelatorio.conn.Connected := true;
  //dmRelatorio.conn.Close;

end;

procedure TfrmPrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  Application.Terminate;
end;

procedure TfrmPrincipal.mnuSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrincipal.appExceptException(Sender: TObject; E: Exception);
begin
  Excep.NotifyException(Sender,E);
end;

procedure TfrmPrincipal.FormActivate(Sender: TObject);
begin
  if Printer.Printers.Count > 0 Then
    stb.Panels[1].Text := 'Impressora: '+ Printer.Printers[Printer.PrinterIndex];
  stb.Panels[2].Text := DateToStr(Now);
end;


procedure TfrmPrincipal.mnuCAD_ESPECClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCAD_ESPEC,frmCAD_ESPEC);
end;

procedure TfrmPrincipal.mnuCAD_CONVENIOClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCAD_CONVENIO,frmCAD_CONVENIO);
end;

procedure TfrmPrincipal.mnuCAD_HOSPITALClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCAD_HOSPITAL,frmCAD_HOSPITAL);
end;

procedure TfrmPrincipal.mnuCAD_CIDADEClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCAD_CIDADE,frmCAD_CIDADE);
end;

procedure TfrmPrincipal.mnuCAD_MEDICOClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCAD_MEDICO,frmCAD_MEDICO);
end;

procedure TfrmPrincipal.mnuPesqMedicoClick(Sender: TObject);
begin
  Application.CreateForm(TfrmPesqMedico,frmPesqMedico);
end;

procedure TfrmPrincipal.mnuMedicoHistoricoClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCAD_MED_HIST,frmCAD_MED_HIST);
end;

end.

