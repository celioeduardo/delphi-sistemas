unit UCAD_TER_APTO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ufrm, StdCtrls, ComCtrls, Buttons, ExtCtrls, Mask, EditLabel;

type
  TfrmCAD_TER_APTO = class(Tfrm)
    txtNOM_RUA: TEditLabel;
    txtNOM_BAIRRO: TEditLabel;
    txtCOD_TERRITORIO: TEditLabel;
    txtNUM_CEP: TEditLabel;
    txtNOM_CONDOMINIO: TEditLabel;
    procedure FormCreate(Sender: TObject);
    procedure txtCOD_TERRITORIOChange(Sender: TObject);
    procedure txtCOD_TERRITORIOEnter(Sender: TObject);
    procedure txtCOD_TERRITORIOClickButton(Sender: TObject);
    procedure txtCOD_TERRITORIOExit(Sender: TObject);
  private
    function PesquisaNova(Sender: TObject;
    blnValida: boolean; Msg: boolean = true): boolean;
  public
    { Public declarations }
  end;



var
  frmCAD_TER_APTO: TfrmCAD_TER_APTO;

implementation

uses UPESQUISA;

{$R *.dfm}

procedure TfrmCAD_TER_APTO.FormCreate(Sender: TObject);
begin
  inherited;
  Tabela := 'CAD_TER_APTO';
end;

procedure TfrmCAD_TER_APTO.txtCOD_TERRITORIOChange(Sender: TObject);
begin
  inherited;
  ProximoNumero(txtCOD_TERRITORIO);
end;

procedure TfrmCAD_TER_APTO.txtCOD_TERRITORIOEnter(Sender: TObject);
begin
  inherited;
  ProximoNumero(txtCOD_TERRITORIO);
end;

function TfrmCAD_TER_APTO.PesquisaNova(Sender: TObject;
    blnValida: boolean; Msg: boolean = true): boolean;
var Edt      : TEditlabel;
    EdtN     : TEdit;
    Pesquisa : TPesquisa;
    str      : array[0..2] of string;

begin
  Edt := Sender as TEditLabel;
  EdtN:= Edt._Edit;

  if (Edt._Campo = 'COD_TERRITORIO') then
  begin
    str[0] := 'COD_TERRITORIO,NOM_RUA';
    str[1] := 'CAD_TER_APTO';
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


procedure TfrmCAD_TER_APTO.txtCOD_TERRITORIOClickButton(Sender: TObject);
begin
  inherited;
  PesquisaNova(Sender,false,false);
end;

procedure TfrmCAD_TER_APTO.txtCOD_TERRITORIOExit(Sender: TObject);
begin
  inherited;
  PesquisaNova(Sender, true, false);
end;

end.
