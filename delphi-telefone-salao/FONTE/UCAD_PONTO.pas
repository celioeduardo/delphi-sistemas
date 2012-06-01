unit UCAD_PONTO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ufrm, StdCtrls, ComCtrls, Buttons, ExtCtrls, Mask, EditLabel;

type
  TfrmCAD_PONTO = class(Tfrm)
    edtCOD_PONTO: TEditLabel;
    edtNOM_PONTO: TEditLabel;
    procedure FormCreate(Sender: TObject);
    procedure edtCOD_PONTOClickButton(Sender: TObject);
    procedure edtCOD_PONTOExit(Sender: TObject);
    procedure edtCOD_PONTOEnter(Sender: TObject);
    procedure edtCOD_PONTOChange(Sender: TObject);
  private
    function PesquisaNova(Sender: TObject;
                blnValida: boolean; Msg: boolean = true): boolean;
  public
    { Public declarations }
  end;

var
  frmCAD_PONTO: TfrmCAD_PONTO;

implementation

uses UPesquisa;

{$R *.dfm}

procedure TfrmCAD_PONTO.FormCreate(Sender: TObject);
begin
  inherited;
  Tabela := 'CAD_PONTO';
end;

function TfrmCAD_PONTO.PesquisaNova(Sender: TObject;
    blnValida: boolean; Msg: boolean = true): boolean;
var Edt      : TEditlabel;
    EdtN     : TEdit;
    Pesquisa : TPesquisa;
    str      : array[0..2] of string;

begin
  Edt := Sender as TEditLabel;
  EdtN:= Edt._Edit;

  if (Edt._Campo = 'COD_PONTO') then
  begin
    str[0] := 'COD_PONTO,NOM_PONTO';
    str[1] := 'CAD_PONTO';
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


procedure TfrmCAD_PONTO.edtCOD_PONTOClickButton(Sender: TObject);
begin
  inherited;
  PesquisaNova(Sender,false,false);
end;

procedure TfrmCAD_PONTO.edtCOD_PONTOExit(Sender: TObject);
begin
  inherited;
  PesquisaNova(Sender,true,false);
end;

procedure TfrmCAD_PONTO.edtCOD_PONTOEnter(Sender: TObject);
begin
  inherited;
  ProximoNumero(edtCOD_PONTO);
end;

procedure TfrmCAD_PONTO.edtCOD_PONTOChange(Sender: TObject);
begin
  inherited;
  ProximoNumero(edtCOD_PONTO);
end;

end.
