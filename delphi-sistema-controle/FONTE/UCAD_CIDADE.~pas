unit UCAD_CIDADE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ufrm, StdCtrls, ComCtrls, Buttons, ExtCtrls, Mask, EditLabel;

type
  TfrmCAD_CIDADE = class(Tfrm)
    edtCOD_CIDADE: TEditLabel;
    edtNOM_CIDADE: TEditLabel;
    edtNOM_UF: TEditLabel;
    procedure FormCreate(Sender: TObject);
    procedure edtCOD_CIDADEChange(Sender: TObject);
    procedure edtCOD_CIDADEEnter(Sender: TObject);
    procedure edtCOD_CIDADEClickButton(Sender: TObject);
    procedure edtCOD_CIDADEExit(Sender: TObject);
  private
    function PesquisaNova(Sender: TObject; blnValida: boolean; Msg: boolean = true): boolean;
  public
    { Public declarations }
  end;

var
  frmCAD_CIDADE: TfrmCAD_CIDADE;

implementation

uses UPesquisa;
{$R *.dfm}

procedure TfrmCAD_CIDADE.FormCreate(Sender: TObject);
begin
  inherited;
  Tabela := 'CAD_CIDADE';
end;

procedure TfrmCAD_CIDADE.edtCOD_CIDADEChange(Sender: TObject);
begin
  inherited;
  ProximoNumero(edtCOD_CIDADE);
end;

procedure TfrmCAD_CIDADE.edtCOD_CIDADEEnter(Sender: TObject);
begin
  inherited;
  ProximoNumero(edtCOD_CIDADE);
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
    str[0] := 'COD_CIDADE,NOM_CIDADE';
    str[1] := 'CAD_CIDADE';
    str[2] := EmptyStr;
  end
  else
    Exit;

  Pesquisa := TPesquisa.Create;
  Result := Pesquisa.ExecutaPesquisa(blnValida,str[0],str[1],Edt,EdtN,str[2],Msg);

  Pesquisa.Free;
end;

procedure TfrmCAD_CIDADE.edtCOD_CIDADEClickButton(Sender: TObject);
begin
  inherited;
  PesquisaNova(Sender,false,false); 
end;

procedure TfrmCAD_CIDADE.edtCOD_CIDADEExit(Sender: TObject);
begin
  inherited;
  PesquisaNova(Sender,true,false); 
end;

end.
