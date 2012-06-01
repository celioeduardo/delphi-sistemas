unit UCAD_CONVENIO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ufrm, Mask, EditLabel, StdCtrls, ComCtrls, Buttons, ExtCtrls;

type
  TfrmCAD_CONVENIO = class(Tfrm)
    txtCOD_CONVENIO: TEditLabel;
    txtNOM_CONVENIO: TEditLabel;
    procedure FormCreate(Sender: TObject);
    procedure txtCOD_CONVENIOClickButton(Sender: TObject);
    procedure txtCOD_CONVENIOExit(Sender: TObject);
    procedure txtCOD_CONVENIOEnter(Sender: TObject);
    procedure txtCOD_CONVENIOChange(Sender: TObject);
  private
    function PesquisaNova(Sender: TObject; blnValida,
      Msg: boolean): boolean;

  public
    { Public declarations }
  end;

var
  frmCAD_CONVENIO: TfrmCAD_CONVENIO;

implementation

{$R *.dfm}

uses UPesquisa;



procedure TfrmCAD_CONVENIO.FormCreate(Sender: TObject);
begin
  inherited;
  Tabela := 'CAD_CONVENIO';
end;

function TfrmCAD_CONVENIO.PesquisaNova(Sender: TObject; blnValida,
  Msg: boolean): boolean;
var Edt      : TEditlabel;
    EdtN     : TEdit;
    Pesquisa : TPesquisa;
    str      : array[0..2] of string;

begin
  Edt := Sender as TEditLabel;
  EdtN:= Edt._Edit;

  if (Edt._Campo = 'COD_CONVENIO') then
  begin
    str[0] := 'COD_CONVENIO,NOM_CONVENIO';
    str[1] := 'CAD_CONVENIO';
    str[2] := EmptyStr;
  end  
  else
    Exit;

  Pesquisa := TPesquisa.Create;
  Result := Pesquisa.ExecutaPesquisa(blnValida,str[0],str[1],Edt,EdtN,str[2],Msg);

  Pesquisa.Free;
end;


procedure TfrmCAD_CONVENIO.txtCOD_CONVENIOClickButton(Sender: TObject);
begin
  inherited;
  PesquisaNova(Sender,false,false);
end;

procedure TfrmCAD_CONVENIO.txtCOD_CONVENIOExit(Sender: TObject);
begin
  inherited;
  PesquisaNova(Sender,true,false);
end;

procedure TfrmCAD_CONVENIO.txtCOD_CONVENIOEnter(Sender: TObject);
begin
  inherited;
  ProximoNumero(txtCOD_CONVENIO);
end;

procedure TfrmCAD_CONVENIO.txtCOD_CONVENIOChange(Sender: TObject);
begin
  inherited;
  ProximoNumero(txtCOD_CONVENIO);
end;

end.
