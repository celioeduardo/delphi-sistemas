unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Nif;

type
  TForm1 = class(TForm)
    nif: TNif;
    txt: TEdit;
    txtDNI: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure txtDNIChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
begin
  txt.Text := nif.NIF;
end;

procedure TForm1.txtDNIChange(Sender: TObject);
begin
  if Trim(txtDNI.Text) <> '' Then
  begin
    try
      if (StrToInt(txtDNI.Text) >= 1)  and
         (StrToInt(txtDNI.Text) <= 23) then
      begin
        nif.DNI  := StrToInt(txtDNI.Text);
        txt.Text := nif.NIF;
      end;
    Except
      on EConvertError do
      begin
        ShowMessage('O valor informado é inválido');
      end;
    finally
      txtDNI.controls
    end;
  end;
end;

end.
