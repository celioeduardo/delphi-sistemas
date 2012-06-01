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
    tlbTop: TToolBar;
    stb: TStatusBar;
    tlbLeft: TToolBar;
    mnuSair: TMenuItem;
    appExcept: TApplicationEvents;
    mnuRelatorio: TMenuItem;
    mnuMovimentacao: TMenuItem;
    mnuPesquisa: TMenuItem;
    mnuCAD_CONTA: TMenuItem;
    mnuCAD_TP_LANC: TMenuItem;
    mnuMOV_LANCAMENTOS: TMenuItem;
    cboMes: TComboBox;
    Label1: TLabel;
    edtAno: TEdit;
    btnAtual: TButton;
    mnuCAD_CONFIG: TMenuItem;
    mnuPesqLanc: TMenuItem;
    mnuCAD_FECHAMENTO: TMenuItem;
    mnuGerenciamento: TMenuItem;
    UpDown: TUpDown;
    mnuCAD_PUBLICO: TMenuItem;
    mnuPesqFech: TMenuItem;
    btnProximoMes: TButton;
    btnMesAnterior: TButton;
    N1: TMenuItem;
    mnuContagemDinheiro: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mnuSairClick(Sender: TObject);
    procedure appExceptException(Sender: TObject; E: Exception);
    procedure FormActivate(Sender: TObject);
    procedure mnuCAD_CONTAClick(Sender: TObject);
    procedure mnuCAD_TP_LANCClick(Sender: TObject);
    procedure mnuMOV_LANCAMENTOSClick(Sender: TObject);
    procedure btnAtualClick(Sender: TObject);
    procedure mnuCAD_CONFIGClick(Sender: TObject);
    procedure mnuPesqLancClick(Sender: TObject);
    procedure mnuCAD_FECHAMENTOClick(Sender: TObject);
    procedure mnuGerenciamentoClick(Sender: TObject);
    procedure mnuCAD_PUBLICOClick(Sender: TObject);
    procedure mnuPesqFechClick(Sender: TObject);
    procedure btnMesAnteriorClick(Sender: TObject);
    procedure btnProximoMesClick(Sender: TObject);
    procedure mnuContagemDinheiroClick(Sender: TObject);
  private
    procedure ConfiguraMesAnoTrabalho;
  public
    procedure SugereMesAnoTrabalho;
  end;

var
  frmPrincipal: TfrmPrincipal;
  Excep       : TException;

implementation

uses Functions, Printers, UCAD_CONTA, UCAD_TP_LANC, UMOV_LANCAMENTO, UCAD_CONFIG,
DateUtils,UPesqLanc,UCAD_FECHAMENTO, UGerenciamento, UCAD_PUBLICO, UCalcDinheiro,
UPesqFech;

{$R *.dfm}

procedure TfrmPrincipal.FormCreate(Sender: TObject);
var
  strDatabase: string;
  i, index: integer;
begin
  GloStrNomeSistema := 'SISTEMA DE CONTAS';

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

  ConfiguraMesAnoTrabalho;

end;
procedure TfrmPrincipal.SugereMesAnoTrabalho;
var
  mes: integer;
  ano: integer;
begin
  mes := MonthOf(Date);
  ano := YearOf(Date);

  cboMes.ItemIndex := mes - 1;
  edtAno.Text := IntToStr(ano);
  UpDown.Position := ano;
end;

procedure TfrmPrincipal.ConfiguraMesAnoTrabalho;
begin

  cboMes.Items.Add('JANEIRO');
  cboMes.Items.Add('FEVEREIRO');
  cboMes.Items.Add('MARÇO');
  cboMes.Items.Add('ABRIL');
  cboMes.Items.Add('MAIO');
  cboMes.Items.Add('JUNHO');
  cboMes.Items.Add('JULHO');
  cboMes.Items.Add('AGOSTO');
  cboMes.Items.Add('SETEMBRO');
  cboMes.Items.Add('OUTUBRO');
  cboMes.Items.Add('NOVEMBRO');
  cboMes.Items.Add('DEZEMBRO');

  SugereMesAnoTrabalho;
  
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


procedure TfrmPrincipal.mnuCAD_CONTAClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCAD_CONTA,frmCAD_CONTA);
end;

procedure TfrmPrincipal.mnuCAD_TP_LANCClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCAD_TP_LANC,frmCAD_TP_LANC);
end;

procedure TfrmPrincipal.mnuMOV_LANCAMENTOSClick(Sender: TObject);
begin
  Application.CreateForm(TfrmMOV_LANCAMENTO,frmMOV_LANCAMENTO);
end;


procedure TfrmPrincipal.btnAtualClick(Sender: TObject);
begin
  SugereMesAnoTrabalho;
end;

procedure TfrmPrincipal.mnuCAD_CONFIGClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCAD_CONFIG,frmCAD_CONFIG);
end;

procedure TfrmPrincipal.mnuPesqLancClick(Sender: TObject);
begin
  Application.CreateForm(TfrmPesqLanc,frmPesqLanc);
end;

procedure TfrmPrincipal.mnuCAD_FECHAMENTOClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCAD_FECHAMENTO,frmCAD_FECHAMENTO);
end;

procedure TfrmPrincipal.mnuGerenciamentoClick(Sender: TObject);
begin
  Application.CreateForm(TfrmGerencial,frmGerencial);
end;

procedure TfrmPrincipal.mnuCAD_PUBLICOClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCAD_PUBLICO,frmCAD_PUBLICO);
end;

procedure TfrmPrincipal.mnuPesqFechClick(Sender: TObject);
begin
  Application.CreateForm(TfrmPesqFech,frmPesqFech);
end;

procedure TfrmPrincipal.btnMesAnteriorClick(Sender: TObject);
var
  Data: TDate;
begin
  Data := StrToDate('01/'+IntToStr(cboMes.ItemIndex+1)+'/'+edtAno.Text);
  Data := Data - 1;
  cboMes.ItemIndex := StrToInt(Copy(DateToStr(Data),4,2))-1;
  edtAno.Text := Copy(DateToStr(Data),7,4);
end;

procedure TfrmPrincipal.btnProximoMesClick(Sender: TObject);
var
  Data: TDate;
begin
  Data :=  UltimoDiaMes(cboMes.ItemIndex+1,StrToInt(edtAno.Text));
  Data := Data + 1;
  cboMes.ItemIndex := StrToInt(Copy(DateToStr(Data),4,2))-1;
  edtAno.Text := Copy(DateToStr(Data),7,4);
end;

procedure TfrmPrincipal.mnuContagemDinheiroClick(Sender: TObject);
begin
  frmCalcDinheiro := TfrmCalcDinheiro.Create(Application);
  frmCalcDinheiro.ShowModal;
end;

end.

