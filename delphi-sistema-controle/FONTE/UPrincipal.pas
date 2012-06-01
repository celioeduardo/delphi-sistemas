unit UPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, ToolWin, UConexao,DB,UGlobal, UException,
  AppEvnts,UdmRelatorio;

type
  TfrmPrincipal = class(TForm)
    mnu: TMainMenu;
    mnuCadastro: TMenuItem;
    tlbTop: TToolBar;
    stb: TStatusBar;
    tlbLeft: TToolBar;
    mnuSair: TMenuItem;
    appExcept: TApplicationEvents;
    mnuCAD_CIDADE: TMenuItem;
    N1: TMenuItem;
    mnuRelatorio: TMenuItem;
    mnuMovimentacao: TMenuItem;
    mnuCAD_EMPRESA: TMenuItem;
    mnuCAD_FILIAL: TMenuItem;
    mnuCAD_FORNECEDOR: TMenuItem;
    mnuCAD_CLIENTE: TMenuItem;
    mnuCAD_P_ATIVO: TMenuItem;
    mnuCAD_APRES: TMenuItem;
    mnuCAD_PRODUTO: TMenuItem;
    frmNotasFiscais: TMenuItem;
    mnuFIS_ENTRADA: TMenuItem;
    mnuFIS_SAIDA: TMenuItem;
    mnuPesquisa: TMenuItem;
    mnuPesqMovProduto: TMenuItem;
    mnuVenda: TMenuItem;
    mnuVEN_PEDIDO: TMenuItem;
    mnuAcertoEstoque: TMenuItem;
    mnuRelProduto: TMenuItem;
    mnuContagem: TMenuItem;
    mnuInventario: TMenuItem;
    mnuCAD_PRECO: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mnuSairClick(Sender: TObject);
    procedure appExceptException(Sender: TObject; E: Exception);
    procedure FormActivate(Sender: TObject);
    procedure mnuCAD_CIDADEClick(Sender: TObject);
    procedure mnuCAD_EMPRESAClick(Sender: TObject);
    procedure mnuCAD_FILIALClick(Sender: TObject);
    procedure mnuCAD_P_ATIVOClick(Sender: TObject);
    procedure mnuCAD_APRESClick(Sender: TObject);
    procedure mnuCAD_PRODUTOClick(Sender: TObject);
    procedure mnuCAD_FORNECEDORClick(Sender: TObject);
    procedure mnuCAD_CLIENTEClick(Sender: TObject);
    procedure mnuFIS_ENTRADAClick(Sender: TObject);
    procedure mnuFIS_SAIDAClick(Sender: TObject);
    procedure mnuPesqMovProdutoClick(Sender: TObject);
    procedure mnuVEN_PEDIDOClick(Sender: TObject);
    procedure mnuAcertoEstoqueClick(Sender: TObject);
    procedure mnuRelProdutoClick(Sender: TObject);
    procedure mnuContagemClick(Sender: TObject);
    procedure mnuInventarioClick(Sender: TObject);
    procedure mnuCAD_PRECOClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;
  Excep       : TException;

implementation

uses USenha, Printers, UCAD_CIDADE, UCAD_EMPRESA, UCAD_FILIAL, UCAD_P_ATIVO,
  UCAD_APRESENTACAO, UCAD_PRODUTO, UCAD_FORNECEDOR, UCAD_CLIENTE,
  UFIS_ENTRADA, UFIS_SAIDA, UPesqMovProduto, UVEN_PEDIDO, UAcertoEstoque,
  UCAD_PRECO_COMPRA;

{$R *.dfm}

procedure TfrmPrincipal.FormCreate(Sender: TObject);
var
  strDatabase: string;
  i, index: integer;
begin
  GloStrNomeSistema := 'SISTEMA DE CONTROLE';

  frmSenha := TfrmSenha.Create(Application);
  frmSenha.ShowModal;

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

procedure TfrmPrincipal.mnuCAD_CIDADEClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCAD_CIDADE,frmCAD_CIDADE);
end;

procedure TfrmPrincipal.mnuCAD_EMPRESAClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCAD_EMPRESA,frmCAD_EMPRESA);
end;

procedure TfrmPrincipal.mnuCAD_FILIALClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCAD_FILIAL,frmCAD_FILIAL);
end;

procedure TfrmPrincipal.mnuCAD_P_ATIVOClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCAD_P_ATIVO,frmCAD_P_ATIVO);
end;

procedure TfrmPrincipal.mnuCAD_APRESClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCAD_APRESENTACAO,frmCAD_APRESENTACAO);
end;

procedure TfrmPrincipal.mnuCAD_PRODUTOClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCAD_PRODUTO,frmCAD_PRODUTO);
end;

procedure TfrmPrincipal.mnuCAD_FORNECEDORClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCAD_FORNECEDOR,frmCAD_FORNECEDOR);
end;

procedure TfrmPrincipal.mnuCAD_CLIENTEClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCAD_CLIENTE,frmCAD_CLIENTE);
end;

procedure TfrmPrincipal.mnuFIS_ENTRADAClick(Sender: TObject);
begin
  Application.CreateForm(TfrmFIS_ENTRADA,frmFIS_ENTRADA);
end;

procedure TfrmPrincipal.mnuFIS_SAIDAClick(Sender: TObject);
begin
  Application.CreateForm(TfrmFIS_SAIDA,frmFIS_SAIDA);
end;

procedure TfrmPrincipal.mnuPesqMovProdutoClick(Sender: TObject);
begin
  Application.CreateForm(TfrmPesqMovProduto,frmPesqMovProduto);
end;

procedure TfrmPrincipal.mnuVEN_PEDIDOClick(Sender: TObject);
begin
  Application.CreateForm(TfrmVEN_PEDIDO,frmVEN_PEDIDO);
end;

procedure TfrmPrincipal.mnuAcertoEstoqueClick(Sender: TObject);
begin
  Application.CreateForm(TfrmAcertoEstoque,frmAcertoEstoque);
end;

procedure TfrmPrincipal.mnuRelProdutoClick(Sender: TObject);
begin
  dmRelatorio.rvProject.ClearParams;
  dmRelatorio.rvProject.SetParam('NomeSistema',GloStrNomeSistema);
  dmRelatorio.rvProject.ExecuteReport('rptProdutos');
end;

procedure TfrmPrincipal.mnuContagemClick(Sender: TObject);
begin
  dmRelatorio.rvProject.ClearParams;
  dmRelatorio.rvProject.SetParam('NomeSistema',GloStrNomeSistema);
  dmRelatorio.rvProject.SetParam('Tipo','CONTAGEM');
  dmRelatorio.rvProject.ExecuteReport('rptProdutos');
end;

procedure TfrmPrincipal.mnuInventarioClick(Sender: TObject);
begin
  dmRelatorio.rvProject.ClearParams;
  dmRelatorio.rvProject.SetParam('NomeSistema',GloStrNomeSistema);
  dmRelatorio.rvProject.SetParam('Tipo','INVENTARIO');
  dmRelatorio.rvProject.ExecuteReport('rptProdutos');
end;

procedure TfrmPrincipal.mnuCAD_PRECOClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCAD_PRECO_COMPRA,frmCAD_PRECO_COMPRA);
end;

end.

