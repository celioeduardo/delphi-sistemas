unit UCAD_CIDADE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ufrm, Mask, EditLabel, StdCtrls, ComCtrls, Buttons, ExtCtrls;

type
  TfrmCAD_CIDADE = class(Tfrm)
    txtCOD_CIDADE: TEditLabel;
    txtNOM_CIDADE: TEditLabel;
    EditLabel1: TEditLabel;
    procedure FormCreate(Sender: TObject);
    procedure txtCOD_CIDADEClickButton(Sender: TObject);
    procedure txtCOD_CIDADEExit(Sender: TObject);
    procedure txtCOD_CIDADEChange(Sender: TObject);
    procedure txtCOD_CIDADEEnter(Sender: TObject);
  private
    function PesquisaNova(Sender: TObject; blnValida,
      Msg: boolean): boolean;
  public
    { Public declarations }
  end;

var
  frmCAD_CIDADE: TfrmCAD_CIDADE;

implementation

{$R *.dfm}

Uses UPesquisa;

procedure TfrmCAD_CIDADE.FormCreate(Sender: TObject);
begin
  inherited;
  Tabela := 'CAD_CIDADE';
end;

function TfrmCAD_CIDADE.PesquisaNova(Sender: TObject; blnValida,
  Msg: boolean): boolean;
var Edt      : TEditlabel;
    EdtN     : TEdit;
    Pesquisa : TPesquisa;
    str      : array[0..2] of string;

begin
  Edt := Sender as TEditLabel;
  EdtN:= Edt._Edit;

  if (Edt._Campo = 'COD_CIDADE') then
  begin
    str[0] := 'COD_CIDADE,NOM_CIDADE||'+cnn.Aspas('-')+'||NOM_UF';
    str[1] := 'CAD_CIDADE';
    str[2] := EmptyStr;
  end  
  else
    Exit;

  Pesquisa := TPesquisa.Create;
  Result := Pesquisa.ExecutaPesquisa(blnValida,str[0],str[1],Edt,EdtN,str[2],Msg);

  Pesquisa.Free;
end;


procedure TfrmCAD_CIDADE.txtCOD_CIDADEClickButton(Sender: TObject);
begin
  inherited;
  PesquisaNova(Sender,false,false);
end;

procedure TfrmCAD_CIDADE.txtCOD_CIDADEExit(Sender: TObject);
begin
  inherited;
  PesquisaNova(Sender,true,false);
end;

procedure TfrmCAD_CIDADE.txtCOD_CIDADEChange(Sender: TObject);
begin
  inherited;
  ProximoNumero(txtCOD_CIDADE);
end;

procedure TfrmCAD_CIDADE.txtCOD_CIDADEEnter(Sender: TObject);
begin
  inherited;
  ProximoNumero(txtCOD_CIDADE);
end;

end.
