unit UCAD_FILIAL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ufrm, UComponentTag, Mask, EditLabel, StdCtrls, ComCtrls,
  Buttons, ExtCtrls;

type
  TfrmCAD_FILIAL = class(Tfrm)
    edtCOD_EMPRESA: TEditLabel;
    edtNOM_FILIAL: TEditLabel;
    edtNOM_EMPRESA: TEditTag;
    edtCOD_FILIAL: TEditLabel;
    procedure edtCOD_EMPRESAChange(Sender: TObject);
    procedure edtCOD_EMPRESAClickButton(Sender: TObject);
    procedure edtCOD_EMPRESAExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    function PesquisaNova(Sender: TObject; blnValida,
      Msg: boolean): boolean;
  public
    { Public declarations }
  end;

var
  frmCAD_FILIAL: TfrmCAD_FILIAL;

implementation

{$R *.dfm}

uses UPESQUISA;

function TfrmCAD_FILIAL.PesquisaNova(Sender: TObject; blnValida,
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


procedure TfrmCAD_FILIAL.edtCOD_EMPRESAChange(Sender: TObject);
begin
  inherited;
  edtCOD_FILIAL.Text := '';
  edtCOD_FILIAL.Enabled := trim(edtCOD_EMPRESA.Text) <> '';
end;

procedure TfrmCAD_FILIAL.edtCOD_EMPRESAClickButton(Sender: TObject);
begin
  inherited;
  PesquisaNova(edtCOD_EMPRESA,false,true);
end;

procedure TfrmCAD_FILIAL.edtCOD_EMPRESAExit(Sender: TObject);
begin
  inherited;
  PesquisaNova(edtCOD_EMPRESA,true,true);
end;

procedure TfrmCAD_FILIAL.FormCreate(Sender: TObject);
begin
  inherited;
  Tabela := 'CAD_FILIAL';
end;

end.
