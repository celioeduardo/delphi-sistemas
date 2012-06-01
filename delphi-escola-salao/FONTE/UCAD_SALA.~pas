unit UCAD_SALA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ufrm, StdCtrls, ComCtrls, Buttons, ExtCtrls, Mask, EditLabel,
  UComponentTag;

type
  TfrmCAD_SALA = class(Tfrm)
    txtCOD_SALA: TEditLabel;
    EditLabel1: TEditLabel;
    chkAtivo: TCheckBoxTag;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCAD_SALA: TfrmCAD_SALA;

implementation

{$R *.dfm}

procedure TfrmCAD_SALA.FormCreate(Sender: TObject);
begin
  Tabela := 'CAD_SALA';
  inherited;
end;

procedure TfrmCAD_SALA.Button1Click(Sender: TObject);
var
  str: string;
  arr: TStringList;
  i: integer;
begin
  inherited;

  arr := TStringList.Create;
  arr.LoadFromFile('C:\teste.sql');
  for i:= 0 to arr.Count-1 do
  begin
    str := str + arr[i];
    if Pos(';',arr[i]) > 0 then
    begin
      cnn.Execute(str);
      str := EmptyStr;
    end;
  end;

  arr.LoadFromFile('C:\TG_B_I_EST_PROD_LOJA.sql');

  cnn.Execute(arr.GetText);
end;

end.
