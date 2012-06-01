unit UCAD_P_ATIVO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ufrm, StdCtrls, ComCtrls, Buttons, ExtCtrls, Mask, EditLabel;

type
  TfrmCAD_P_ATIVO = class(Tfrm)
    edtCOD_P_ATIVO: TEditLabel;
    edtNOM_P_ATIVO: TEditLabel;
    procedure FormCreate(Sender: TObject);
    procedure edtCOD_P_ATIVOChange(Sender: TObject);
    procedure edtCOD_P_ATIVOEnter(Sender: TObject);
    procedure edtCOD_P_ATIVOClickButton(Sender: TObject);
  private
   function PesquisaNova(Sender: TObject; blnValida,
     Msg: boolean): boolean;
  public
    { Public declarations }
  end;

var
  frmCAD_P_ATIVO: TfrmCAD_P_ATIVO;

implementation

{$R *.dfm}

uses UPESQUISA;

procedure TfrmCAD_P_ATIVO.FormCreate(Sender: TObject);
begin
  inherited;
  Tabela := 'CAD_P_ATIVO';
end;

function TfrmCAD_P_ATIVO.PesquisaNova(Sender: TObject; blnValida,
  Msg: boolean): boolean;
var Edt      : TEditlabel;
    EdtN     : TEdit;
    Pesquisa : TPesquisa;
    str      : array[0..2] of string;

begin
  Edt := Sender as TEditLabel;
  EdtN:= Edt._Edit;

  if (Edt._Campo = 'COD_P_ATIVO') then
  begin
    str[0] := 'COD_P_ATIVO,NOM_P_ATIVO';
    str[1] := 'CAD_P_ATIVO';
    str[2] := EmptyStr;
  end
  else
    Exit;

  Pesquisa := TPesquisa.Create;
  Result := Pesquisa.ExecutaPesquisa(blnValida,str[0],str[1],Edt,EdtN,str[2],Msg);

  Pesquisa.Free;
end;

procedure TfrmCAD_P_ATIVO.edtCOD_P_ATIVOChange(Sender: TObject);
begin
  inherited;
  ProximoNumero(edtCOD_P_ATIVO);
end;

procedure TfrmCAD_P_ATIVO.edtCOD_P_ATIVOEnter(Sender: TObject);
begin
  inherited;
  ProximoNumero(edtCOD_P_ATIVO);
end;

procedure TfrmCAD_P_ATIVO.edtCOD_P_ATIVOClickButton(Sender: TObject);
begin
  inherited;
  PesquisaNova(Sender,false,false);
end;

end.
