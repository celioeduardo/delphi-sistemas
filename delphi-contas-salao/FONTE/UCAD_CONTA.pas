unit UCAD_CONTA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ufrm, StdCtrls, ComCtrls, Buttons, ExtCtrls, Mask, EditLabel,
  UComponentTag;

type
  TfrmCAD_CONTA = class(Tfrm)
    edtCOD_CONTA: TEditLabel;
    edtNOM_CONTA: TEditLabel;
    edtVAL_SALDO_INI: TEditLabel;
    GroupBox1: TGroupBox;
    optDevedora: TRadioButtonTag;
    optCredora: TRadioButtonTag;
    GroupBox2: TGroupBox;
    optAtivoCurtoPrazo: TRadioButtonTag;
    edtAtivoLongoPrazo: TRadioButtonTag;
    edtPassivoCurtoPrazo: TRadioButtonTag;
    edtPassivoLongoPrazo: TRadioButtonTag;
    edtReceita: TRadioButtonTag;
    edtDespesa: TRadioButtonTag;
    procedure FormCreate(Sender: TObject);
    procedure edtCOD_CONTAClickButton(Sender: TObject);
  private
    function PesquisaNova(Sender: TObject; blnValida,
       Msg: boolean): boolean;
  public
    { Public declarations }
  end;

var
  frmCAD_CONTA: TfrmCAD_CONTA;

implementation

{$R *.dfm}

Uses UPesquisa;

procedure TfrmCAD_CONTA.FormCreate(Sender: TObject);
begin
  inherited;
  Tabela := 'CAD_CONTA';
end;

function TfrmCAD_CONTA.PesquisaNova(Sender: TObject; blnValida,
  Msg: boolean): boolean;
var Edt      : TEditlabel;
    EdtN     : TEdit;
    Pesquisa : TPesquisa;
    str      : array[0..2] of string;

begin
  Edt := Sender as TEditLabel;
  EdtN:= Edt._Edit;

  if (Edt._Campo = 'COD_CONTA') then
  begin
    str[0] := 'COD_CONTA,NOM_CONTA';
    str[1] := 'VW_CAD_CONTA';
    str[2] := EmptyStr;
  end
  else
    Exit;

  Pesquisa := TPesquisa.Create;
  Result := Pesquisa.ExecutaPesquisa(blnValida,str[0],str[1],Edt,EdtN,str[2],Msg);

  Pesquisa.Free;
end;

procedure TfrmCAD_CONTA.edtCOD_CONTAClickButton(Sender: TObject);
begin
  inherited;
  PesquisaNova(Sender,false,false);
end;

end.
