unit UCAD_TP_LANC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ufrm, Mask, EditLabel, StdCtrls, ComCtrls, Buttons, ExtCtrls,
  UComponentTag;

type
  TfrmCAD_TP_LANC = class(Tfrm)
    edtCOD_TP_LANC: TEditLabel;
    edtNOM_TP_LANC: TEditLabel;
    edtCOD_CONTA_DEB: TEditLabel;
    edtNOM_CONTA_DEB: TEditTag;
    edtCOD_CONTA_CRE: TEditLabel;
    edtNOM_CONTA_CRE: TEditTag;
    edtDSC_LANCAMENTO: TEditLabel;
    edtCOD_CT: TEditLabel;
    GroupBox1: TGroupBox;
    optEntrada: TRadioButtonTag;
    optSaida: TRadioButtonTag;
    optAmbos: TRadioButtonTag;
    procedure FormCreate(Sender: TObject);
    procedure edtCOD_TP_LANCClickButton(Sender: TObject);
    procedure edtCOD_CONTA_DEBClickButton(Sender: TObject);
    procedure edtCOD_CONTA_DEBExit(Sender: TObject);
    procedure edtCOD_CONTA_CREExit(Sender: TObject);
    procedure edtCOD_CONTA_CREClickButton(Sender: TObject);
  private
    function PesquisaNova(Sender: TObject; blnValida,
      Msg: boolean): boolean;

  public
    { Public declarations }
  end;

var
  frmCAD_TP_LANC: TfrmCAD_TP_LANC;

implementation

{$R *.dfm}

uses UPesquisa;

procedure TfrmCAD_TP_LANC.FormCreate(Sender: TObject);
begin
  inherited;
  Tabela := 'CAD_TP_LANC';
end;

function TfrmCAD_TP_LANC.PesquisaNova(Sender: TObject; blnValida,
  Msg: boolean): boolean;
var Edt      : TEditlabel;
    EdtN     : TEdit;
    Pesquisa : TPesquisa;
    str      : array[0..2] of string;

begin
  Edt := Sender as TEditLabel;
  EdtN:= Edt._Edit;

  if (Edt._Campo = 'COD_TP_LANC') then
  begin
    str[0] := 'COD_TP_LANC,NOM_TP_LANC';
    str[1] := 'CAD_TP_LANC';
    str[2] := EmptyStr;
  end
  else if ((Edt._Campo = 'COD_CONTA_DEB') or (Edt._Campo = 'COD_CONTA_CRE')) then
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

procedure TfrmCAD_TP_LANC.edtCOD_TP_LANCClickButton(Sender: TObject);
begin
  inherited;
  PesquisaNova(Sender,false,false);
end;

procedure TfrmCAD_TP_LANC.edtCOD_CONTA_DEBClickButton(Sender: TObject);
begin
  inherited;
  PesquisaNova(Sender,false,true);
end;

procedure TfrmCAD_TP_LANC.edtCOD_CONTA_DEBExit(Sender: TObject);
begin
  inherited;
  if not PesquisaNova(Sender,true,true) then
    edtCOD_CONTA_DEB.SetFocus;
end;

procedure TfrmCAD_TP_LANC.edtCOD_CONTA_CREExit(Sender: TObject);
begin
  inherited;
  if not PesquisaNova(Sender,true,true) then
    edtCOD_CONTA_CRE.SetFocus;
end;

procedure TfrmCAD_TP_LANC.edtCOD_CONTA_CREClickButton(Sender: TObject);
begin
  inherited;
  PesquisaNova(Sender,false,true);
end;

end.
