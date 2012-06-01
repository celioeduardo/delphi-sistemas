unit USenha;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, Dialogs;

type
  TfrmSenha = class(TForm)
    Label1: TLabel;
    edtSenha: TEdit;
    OKBtn: TButton;
    CancelBtn: TButton;
    procedure OKBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FSenhaCorreta: boolean;
  public
    { Public declarations }
  end;

var
  frmSenha: TfrmSenha;

implementation

{$R *.dfm}

procedure TfrmSenha.OKBtnClick(Sender: TObject);
var
  str: string;
begin
  if trim(UpperCase(edtSenha.Text)) <> 'MORFEDO' then
  begin
    MessageDlg('Senha inválida.',mtWarning,[mbOK],0);
    Close;
  end
  else
    FSenhaCorreta := true;
end;

procedure TfrmSenha.CancelBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmSenha.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  if not FSenhaCorreta then
    Application.Terminate;
end;

end.
 
