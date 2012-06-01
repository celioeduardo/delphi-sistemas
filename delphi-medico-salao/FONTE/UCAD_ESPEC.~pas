unit UCAD_ESPEC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ufrm, StdCtrls, ComCtrls, Buttons, ExtCtrls, Mask, EditLabel;

type
  TfrmCAD_ESPEC = class(Tfrm)
    txtCodEspec: TEditLabel;
    txtNOM_ESPEC: TEditLabel;
    procedure FormCreate(Sender: TObject);
    procedure txtCodEspecClickButton(Sender: TObject);
    procedure txtCodEspecExit(Sender: TObject);
    procedure txtCodEspecEnter(Sender: TObject);
    procedure txtCodEspecChange(Sender: TObject);
  private
    function PesquisaNova(Sender: TObject; blnValida,
      Msg: boolean): boolean;
  public
    { Public declarations }
  end;

var
  frmCAD_ESPEC: TfrmCAD_ESPEC;

implementation

{$R *.dfm}

uses UPesquisa;

procedure TfrmCAD_ESPEC.FormCreate(Sender: TObject);
begin
  inherited;
  Tabela := 'CAD_ESPEC';
end;

function TfrmCAD_ESPEC.PesquisaNova(Sender: TObject; blnValida,
  Msg: boolean): boolean;
var Edt      : TEditlabel;
    EdtN     : TEdit;
    Pesquisa : TPesquisa;
    str      : array[0..2] of string;

begin
  Edt := Sender as TEditLabel;
  EdtN:= Edt._Edit;

  if (Edt._Campo = 'COD_ESPEC') then
  begin
    str[0] := 'COD_ESPEC,NOM_ESPEC';
    str[1] := 'CAD_ESPEC';
    str[2] := EmptyStr;
  end  
  else
    Exit;

  Pesquisa := TPesquisa.Create;
  Result := Pesquisa.ExecutaPesquisa(blnValida,str[0],str[1],Edt,EdtN,str[2],Msg);

  Pesquisa.Free;
end;


procedure TfrmCAD_ESPEC.txtCodEspecClickButton(Sender: TObject);
begin
  inherited;
  PesquisaNova(sender,false,false);
end;

procedure TfrmCAD_ESPEC.txtCodEspecExit(Sender: TObject);
begin
  inherited;
  PesquisaNova(Sender,true,false);
end;

procedure TfrmCAD_ESPEC.txtCodEspecEnter(Sender: TObject);
begin
  inherited;
  ProximoNumero(txtCodEspec);
end;

procedure TfrmCAD_ESPEC.txtCodEspecChange(Sender: TObject);
begin
  inherited;
  ProximoNumero(txtCodEspec);
end;

end.
