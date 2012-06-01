unit UCAD_APRESENTACAO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ufrm, StdCtrls, ComCtrls, Buttons, ExtCtrls, Mask, EditLabel;

type
  TfrmCAD_APRESENTACAO = class(Tfrm)
    edtCOD_APRESENTACAO: TEditLabel;
    edtNOM_APRESENTACAO: TEditLabel;
    edtNUM_FATOR_CONV: TEditLabel;
    procedure FormCreate(Sender: TObject);
    procedure edtCOD_APRESENTACAOChange(Sender: TObject);
    procedure edtCOD_APRESENTACAOEnter(Sender: TObject);
    procedure edtCOD_APRESENTACAOClickButton(Sender: TObject);
  private
    function PesquisaNova(Sender: TObject; blnValida,
      Msg: boolean): boolean;
  public
    { Public declarations }
  end;

var
  frmCAD_APRESENTACAO: TfrmCAD_APRESENTACAO;

implementation

{$R *.dfm}

uses UPESQUISA;

procedure TfrmCAD_APRESENTACAO.FormCreate(Sender: TObject);
begin
  inherited;
  Tabela := 'CAD_APRESENTACAO';
end;

function TfrmCAD_APRESENTACAO.PesquisaNova(Sender: TObject; blnValida,
  Msg: boolean): boolean;
var Edt      : TEditlabel;
    EdtN     : TEdit;
    Pesquisa : TPesquisa;
    str      : array[0..2] of string;

begin
  Edt := Sender as TEditLabel;
  EdtN:= Edt._Edit;

  if (Edt._Campo = 'COD_APRESENTACAO') then
  begin
    str[0] := 'COD_APRESENTACAO,NOM_APRESENTACAO';
    str[1] := 'CAD_APRESENTACAO';
    str[2] := EmptyStr;
  end
  else
    Exit;

  Pesquisa := TPesquisa.Create;
  Result := Pesquisa.ExecutaPesquisa(blnValida,str[0],str[1],Edt,EdtN,str[2],Msg);

  Pesquisa.Free;
end;

procedure TfrmCAD_APRESENTACAO.edtCOD_APRESENTACAOChange(Sender: TObject);
begin
  inherited;
  ProximoNumero(edtCOD_APRESENTACAO);
end;

procedure TfrmCAD_APRESENTACAO.edtCOD_APRESENTACAOEnter(Sender: TObject);
begin
  inherited;
  ProximoNumero(edtCOD_APRESENTACAO);
end;

procedure TfrmCAD_APRESENTACAO.edtCOD_APRESENTACAOClickButton(
  Sender: TObject);
begin
  inherited;
  PesquisaNova(Sender,false,false);
end;

end.
