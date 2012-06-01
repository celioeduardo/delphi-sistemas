unit UCAD_PONTO_CONCLUIDO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ufrm, StdCtrls, ComCtrls, Buttons, ExtCtrls, UComponentTag,
  Mask, EditLabel;

type
  TfrmCAD_PONTO_CONCLUIDO = class(Tfrm)
    edtCOD_PUBLICO: TEditLabel;
    edtNOM_PUBLICO: TEditTag;
    edtCOD_PONTO: TEditLabel;
    edtNOM_PONTO: TEditTag;
    edtDAT_CONCLUSAO: TEditLabel;
    procedure FormCreate(Sender: TObject);
    procedure edtCOD_PUBLICOClickButton(Sender: TObject);
    procedure edtCOD_PUBLICOExit(Sender: TObject);
    procedure edtCOD_PONTOExit(Sender: TObject);
    procedure edtCOD_PONTOClickButton(Sender: TObject);
  private
    function PesquisaNova(Sender: TObject;
    blnValida: boolean; Msg: boolean = true): boolean;
  public
    { Public declarations }
  end;

var
  frmCAD_PONTO_CONCLUIDO: TfrmCAD_PONTO_CONCLUIDO;

implementation

{$R *.dfm}

uses UPesquisa;

procedure TfrmCAD_PONTO_CONCLUIDO.FormCreate(Sender: TObject);
begin
  Tabela := 'CAD_PONTO_CONCLUIDO';
  inherited;

end;

function TfrmCAD_PONTO_CONCLUIDO.PesquisaNova(Sender: TObject;
    blnValida: boolean; Msg: boolean = true): boolean;
var Edt      : TEditlabel;
    EdtN     : TEdit;
    Pesquisa : TPesquisa;
    str      : array[0..2] of string;

begin
  Edt := Sender as TEditLabel;
  EdtN:= Edt._Edit;


  if (Edt._Campo = 'COD_PUBLICO') then
  begin
    str[0] := 'COD_PUBLICO,NOM_PUBLICO';
    str[1] := 'CAD_PUBLICO';
    str[2] := EmptyStr;
  end
  else if (Edt._Campo = 'COD_PONTO') then
  begin
    str[0] := 'COD_PONTO,NOM_PONTO';
    str[1] := 'CAD_PONTO';
    str[2] := EmptyStr;
  end
  else
    Exit;

  Pesquisa := TPesquisa.Create;
  Result := Pesquisa.ExecutaPesquisa(blnValida,str[0],str[1],Edt,EdtN,str[2],Msg);
  Pesquisa.Free;
end;

procedure TfrmCAD_PONTO_CONCLUIDO.edtCOD_PUBLICOClickButton(
  Sender: TObject);
begin
  inherited;
  PesquisaNova(Sender,false);
end;

procedure TfrmCAD_PONTO_CONCLUIDO.edtCOD_PUBLICOExit(Sender: TObject);
begin
  inherited;
  if not PesquisaNova(Sender,true) then
    edtCOD_PUBLICO.SetFocus;
end;

procedure TfrmCAD_PONTO_CONCLUIDO.edtCOD_PONTOExit(Sender: TObject);
begin
  inherited;
  if not PesquisaNova(Sender,true) then
    edtCOD_PONTO.SetFocus;
end;

procedure TfrmCAD_PONTO_CONCLUIDO.edtCOD_PONTOClickButton(Sender: TObject);
begin
  inherited;
  PesquisaNova(Sender,false);
end;

end.
