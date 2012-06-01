unit PasswordForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfrmPassword = class(TForm)
    PW1: TEdit;
    PW2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    btnOK: TBitBtn;
    btnCancelar: TBitBtn;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPassword: TfrmPassword;

implementation

{$R *.dfm}

procedure TfrmPassword.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (ModalResult=mrOK) then
    if (PW1.Text = '') then
    begin
      ShowMessage('Deve se inserir a contra-senha');
      CanClose:=False;
     end
  else if (ModalResult=mrOK) and (PW1.Text <> PW2.Text) then
   begin
    ShowMessage('Verificação inválida. Por favor retente');
    CanClose:=False;
   end;

end;

end.
