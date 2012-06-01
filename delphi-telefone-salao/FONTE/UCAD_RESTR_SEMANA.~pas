unit UCAD_RESTR_SEMANA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ufrm, UComponentTag, Mask, EditLabel, StdCtrls, ComCtrls,
  Buttons, ExtCtrls;

type
  TfrmCAD_RESTR_SEMANA = class(Tfrm)
    txtCodPublico: TEditLabel;
    txtNomPublico: TEditTag;
    GroupBox1: TGroupBox;
    txtSegunda: TCheckBoxTag;
    txtTerca: TCheckBoxTag;
    txtQuarta: TCheckBoxTag;
    txtQuinta: TCheckBoxTag;
    txtSexta: TCheckBoxTag;
    txtSabado: TCheckBoxTag;
    txtDomingo: TCheckBoxTag;
    memObs: TMemoTag;
  private
    function PesquisaNova(Sender: TObject;blnValida: boolean;
                          Msg: boolean = true): boolean;
  public
    { Public declarations }
  end;

var
  frmCAD_RESTR_SEMANA: TfrmCAD_RESTR_SEMANA;

implementation

uses UPesquisa;

{$R *.dfm}


function TfrmCAD_RESTR_SEMANA.PesquisaNova(Sender: TObject;
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
  else
    Exit;

  Pesquisa := TPesquisa.Create;
  Result := Pesquisa.ExecutaPesquisa(blnValida,str[0],str[1],Edt,EdtN,str[2],Msg);

  {if (not Result) and (blnValida) and (Edt.Visible) and (Edt.Enabled) then
    Edt.SetFocus;}

  Pesquisa.Free;
end;


end.
