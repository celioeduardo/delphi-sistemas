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
    mnuSair: TMenuItem;
    appExcept: TApplicationEvents;
    mnuNF: TMenuItem;
    mnuEmissaoNF: TMenuItem;
    mnuCAD_LAYOUT_NF: TMenuItem;
    mnuCAD_LAY_NF_CAMPO: TMenuItem;
    Pblicos1: TMenuItem;
    Empresa1: TMenuItem;
    LayoutdeNFparaEmpresa1: TMenuItem;
    SequnciaNF1: TMenuItem;
    tlbLeft: TToolBar;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mnuSairClick(Sender: TObject);
    procedure appExceptException(Sender: TObject; E: Exception);
    procedure mnuCAD_LAYOUT_NFClick(Sender: TObject);
    procedure mnuCAD_LAY_NF_CAMPOClick(Sender: TObject);
    procedure Pblicos1Click(Sender: TObject);
    procedure Empresa1Click(Sender: TObject);
    procedure LayoutdeNFparaEmpresa1Click(Sender: TObject);
    procedure SequnciaNF1Click(Sender: TObject);
    procedure mnuEmissaoNFClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;
  Excep       : TException;

implementation

uses UCAD_LAYOUT_NF, UCAD_LAY_NF_CAMPO, UCadPublico, UCadEmpresa, Functions,
     UCadLayEmpNf, UNOTA_FISCAL_SEQ, UNotaFiscal;


{$R *.dfm}



procedure TfrmPrincipal.FormCreate(Sender: TObject);

begin
  GloStrUser := 'sysdba';
  GloStrPassword := 'masterkey';
  GloStrDatabase := 'IMPNF';
  GloStrServer := InputBox('Servidor','Insira o nome do Servidor','Localhost');
  if IsEmptyStr(GloStrServer) then
    GloStrServer := 'localhost';
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


procedure TfrmPrincipal.mnuCAD_LAYOUT_NFClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCAD_LAYOUT_NF,frmCAD_LAYOUT_NF);
end;

procedure TfrmPrincipal.mnuCAD_LAY_NF_CAMPOClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCAD_LAY_NF_CAMPO,frmCAD_LAY_NF_CAMPO);
end;

procedure TfrmPrincipal.Pblicos1Click(Sender: TObject);
begin
  application.CreateForm(TfrmCadPublico,frmCadPublico);
end;

procedure TfrmPrincipal.Empresa1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmCadEmpresa,frmCadEmpresa);
end;

procedure TfrmPrincipal.LayoutdeNFparaEmpresa1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmCadEmpLayNF,frmCadEmpLayNF);
end;

procedure TfrmPrincipal.SequnciaNF1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmNOTA_FISCAL_SEQ,frmNOTA_FISCAL_SEQ);
end;

procedure TfrmPrincipal.mnuEmissaoNFClick(Sender: TObject);
begin
  Application.CreateForm(TfrmNotaFiscal,frmNotaFiscal);
end;

end.

