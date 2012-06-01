unit UCAD_CENA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ufrm, StdCtrls, ComCtrls, Buttons, ExtCtrls, Mask, EditLabel,
  UComponentTag;

type
  TfrmCAD_CENA = class(Tfrm)
    edtCOD_CENA: TEditLabel;
    memNOM_CENA: TMemoTag;
    procedure FormCreate(Sender: TObject);
    procedure edtCOD_CENAClickButton(Sender: TObject);
    procedure edtCOD_CENAExit(Sender: TObject);
    procedure edtCOD_CENAChange(Sender: TObject);
    procedure edtCOD_CENAEnter(Sender: TObject);
  private
    function PesquisaNova(Sender: TObject;
                blnValida: boolean; Msg: boolean = true): boolean;
  public
    { Public declarations }
  end;

var
  frmCAD_CENA: TfrmCAD_CENA;

implementation

uses UPesquisa;

{$R *.dfm}

procedure TfrmCAD_CENA.FormCreate(Sender: TObject);
begin
  inherited;
  Tabela := 'CAD_CENA';
end;

function TfrmCAD_CENA.PesquisaNova(Sender: TObject;
    blnValida: boolean; Msg: boolean = true): boolean;
var Edt      : TEditlabel;
    EdtN     : TEdit;
    Pesquisa : TPesquisa;
    str      : array[0..2] of string;

begin
  Edt := Sender as TEditLabel;
  EdtN:= Edt._Edit;

  if (Edt._Campo = 'COD_CENA') then
  begin
    str[0] := 'COD_CENA,NOM_CENA';
    str[1] := 'CAD_CENA';
    str[2] := EmptyStr;
  end
  else
    Exit;

  Pesquisa := TPesquisa.Create;
  Result := Pesquisa.ExecutaPesquisa(blnValida,str[0],str[1],Edt,EdtN,str[2],Msg);

  {if (not Result) and (blnValida) and (Edt.Visible) and (Edt.Enabled) then
    Edt.SetFocus;}

  Pesquisa.Free;
end;


procedure TfrmCAD_CENA.edtCOD_CENAClickButton(Sender: TObject);
begin
  inherited;
  PesquisaNova(Sender,false,false);
end;

procedure TfrmCAD_CENA.edtCOD_CENAExit(Sender: TObject);
begin
  inherited;
  PesquisaNova(Sender,true,false);
end;

procedure TfrmCAD_CENA.edtCOD_CENAChange(Sender: TObject);
begin
  inherited;
  ProximoNumero(edtCOD_CENA);
end;

procedure TfrmCAD_CENA.edtCOD_CENAEnter(Sender: TObject);
begin
  inherited;
  ProximoNumero(edtCOD_CENA);
end;

end.
