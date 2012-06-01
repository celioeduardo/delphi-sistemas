unit UCAD_EMPRESA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ufrm, Mask, EditLabel, StdCtrls, ComCtrls, Buttons, ExtCtrls;

type
  TfrmCAD_EMPRESA = class(Tfrm)
    edtNOM_EMPRESA: TEditLabel;
    edtCOD_EMPRESA: TEditLabel;
    procedure FormCreate(Sender: TObject);
    procedure edtCOD_EMPRESAEnter(Sender: TObject);
    procedure edtCOD_EMPRESAChange(Sender: TObject);
    procedure edtCOD_EMPRESAClickButton(Sender: TObject);
  private
    function PesquisaNova(Sender: TObject; blnValida,
  Msg: boolean): boolean;
  public
    { Public declarations }
  end;

var
  frmCAD_EMPRESA: TfrmCAD_EMPRESA;

implementation

uses UPESQUISA;

{$R *.dfm}

procedure TfrmCAD_EMPRESA.FormCreate(Sender: TObject);
begin
  inherited;
  Tabela := 'CAD_EMPRESA';
end;

procedure TfrmCAD_EMPRESA.edtCOD_EMPRESAEnter(Sender: TObject);
begin
  inherited;
  ProximoNumero(edtCOD_EMPRESA);
end;

procedure TfrmCAD_EMPRESA.edtCOD_EMPRESAChange(Sender: TObject);
begin
  inherited;
  ProximoNumero(edtCOD_EMPRESA);
end;

function TfrmCAD_EMPRESA.PesquisaNova(Sender: TObject; blnValida,
  Msg: boolean): boolean;
var Edt      : TEditlabel;
    EdtN     : TEdit;
    Pesquisa : TPesquisa;
    str      : array[0..2] of string;

begin
  Edt := Sender as TEditLabel;
  EdtN:= Edt._Edit;

  if (Edt._Campo = 'COD_EMPRESA') then
  begin
    str[0] := 'COD_EMPRESA,NOM_EMPRESA';
    str[1] := 'CAD_EMPRESA';
    str[2] := EmptyStr;
  end
  else
    Exit;

  Pesquisa := TPesquisa.Create;
  Result := Pesquisa.ExecutaPesquisa(blnValida,str[0],str[1],Edt,EdtN,str[2],Msg);

  Pesquisa.Free;
end;

procedure TfrmCAD_EMPRESA.edtCOD_EMPRESAClickButton(Sender: TObject);
begin
  inherited;
  PesquisaNova(Sender,false,false);
end;

end.
