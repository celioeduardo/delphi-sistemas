unit UCAD_HOSPITAL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ufrm, Mask, EditLabel, StdCtrls, ComCtrls, Buttons, ExtCtrls,
  UComponentTag;

type
  TfrmCAD_HOSPITAL = class(Tfrm)
    txtCOD_HOSPITAL: TEditLabel;
    txtNOM_HOSPITAL: TEditLabel;
    txtCOD_CIDADE: TEditLabel;
    txtNOM_CIDADE: TEditTag;
    procedure FormCreate(Sender: TObject);
    procedure txtCOD_HOSPITALClickButton(Sender: TObject);
    procedure txtCOD_HOSPITALExit(Sender: TObject);
    procedure txtCOD_HOSPITALEnter(Sender: TObject);
    procedure txtCOD_HOSPITALChange(Sender: TObject);
    procedure txtCOD_CIDADEClickButton(Sender: TObject);
    procedure txtCOD_CIDADEExit(Sender: TObject);
  private
    function PesquisaNova(Sender: TObject; blnValida,
      Msg: boolean): boolean;
  public
    { Public declarations }
  end;

var
  frmCAD_HOSPITAL: TfrmCAD_HOSPITAL;

implementation

{$R *.dfm}

Uses UPesquisa;

procedure TfrmCAD_HOSPITAL.FormCreate(Sender: TObject);
begin
  inherited;
  Tabela := 'CAD_HOSPITAL';
end;

function TfrmCAD_HOSPITAL.PesquisaNova(Sender: TObject; blnValida,
  Msg: boolean): boolean;
var Edt      : TEditlabel;
    EdtN     : TEdit;
    Pesquisa : TPesquisa;
    str      : array[0..2] of string;

begin
  Edt := Sender as TEditLabel;
  EdtN:= Edt._Edit;

  if (Edt._Campo = 'COD_HOSPITAL') then
  begin
    str[0] := 'COD_HOSPITAL,NOM_HOSPITAL';
    str[1] := 'CAD_HOSPITAL';
    str[2] := EmptyStr;
  end
  else if (Edt._Campo = 'COD_CIDADE') then
  begin
    str[0] := 'COD_CIDADE,NOM_CIDADE||'+cnn.Aspas('-')+'||NOM_UF';
    str[1] := 'CAD_CIDADE';
    str[2] := EmptyStr;
  end
  else
    Exit;

  Pesquisa := TPesquisa.Create;
  Result := Pesquisa.ExecutaPesquisa(blnValida,str[0],str[1],Edt,EdtN,str[2],Msg);

  Pesquisa.Free;
end;


procedure TfrmCAD_HOSPITAL.txtCOD_HOSPITALClickButton(Sender: TObject);
begin
  inherited;
  PesquisaNova(Sender,false,false);
end;

procedure TfrmCAD_HOSPITAL.txtCOD_HOSPITALExit(Sender: TObject);
begin
  inherited;
  PesquisaNova(Sender,true,false);
end;

procedure TfrmCAD_HOSPITAL.txtCOD_HOSPITALEnter(Sender: TObject);
begin
  inherited;
  ProximoNumero(txtCOD_HOSPITAL);
end;

procedure TfrmCAD_HOSPITAL.txtCOD_HOSPITALChange(Sender: TObject);
begin
  inherited;
  ProximoNumero(txtCOD_HOSPITAL);
end;

procedure TfrmCAD_HOSPITAL.txtCOD_CIDADEClickButton(Sender: TObject);
begin
  inherited;
  PesquisaNova(Sender,false,true);
end;

procedure TfrmCAD_HOSPITAL.txtCOD_CIDADEExit(Sender: TObject);
begin
  inherited;
  if not PesquisaNova(Sender,true,true) then
    txtCOD_CIDADE.SetFocus;
end;

end.
