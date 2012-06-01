unit UCAD_MED_HIST;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ufrm, Mask, EditLabel, StdCtrls, ComCtrls, Buttons, ExtCtrls,
  UComponentTag;

type
  TfrmCAD_MED_HIST = class(Tfrm)
    txtNUM_CONT: TEditLabel;
    txtCOD_MEDICO: TEditLabel;
    txtNOM_MEDICO: TEditTag;
    optCEP: TEditLabel;
    txtNOM_HISTORICO: TMemoTag;
    procedure FormCreate(Sender: TObject);
    procedure txtNUM_CONTChange(Sender: TObject);
    procedure txtNUM_CONTEnter(Sender: TObject);
    procedure txtCOD_MEDICOClickButton(Sender: TObject);
    procedure txtCOD_MEDICOExit(Sender: TObject);
    procedure txtCOD_MEDICOChange(Sender: TObject);
  private
    function PesquisaNova(Sender: TObject;
      blnValida: boolean; Msg: boolean = true): boolean;
    procedure ProximoNumero;
  public
    { Public declarations }
  end;

var
  frmCAD_MED_HIST: TfrmCAD_MED_HIST;

implementation

{$R *.dfm}

Uses UPesquisa, DB;

procedure TfrmCAD_MED_HIST.FormCreate(Sender: TObject);
begin
  inherited;
  Tabela := 'CAD_MED_HIST';
end;

function TfrmCAD_MED_HIST.PesquisaNova(Sender: TObject;
    blnValida: boolean; Msg: boolean = true): boolean;
var Edt      : TEditlabel;
    EdtN     : TEdit;
    Pesquisa : TPesquisa;
    str      : array[0..2] of string;

begin
  Edt := Sender as TEditLabel;
  EdtN:= Edt._Edit;

  if (Edt._Campo = 'COD_MEDICO') then
  begin
    str[0] := 'COD_MEDICO,NOM_MEDICO';
    str[1] := 'CAD_MEDICO';
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


procedure TfrmCAD_MED_HIST.ProximoNumero;
var
  str: string;
  ds: TDataSource;
begin
  if trim(txtCOD_MEDICO.Text) = EmptyStr then
  begin
    txtNUM_CONT.Text := EmptyStr;
    Exit;
  end;

  if (Trim(txtNUM_CONT.Text) = EmptyStr) and (not btnInclui.Enabled) then
  begin
    str :=
      'Select Max(NUM_CONT) + 1 NUM_CONT From CAD_MED_HIST'+
      '  Where COD_MEDICO = '+txtCOD_MEDICO.Text;
    if cnn.ExecuteQuery(str,ds) then
    begin
      if trim(ds.DataSet.Fields[0].AsString) = EmptyStr then
        txtNUM_CONT.Text := '1'
      else
        txtNUM_CONT.Text := ds.DataSet.Fields[0].AsString;

      txtNUM_CONT.SelectAll;
    end
    else
      txtNUM_CONT.Text := '1'
  end;
end;


procedure TfrmCAD_MED_HIST.txtNUM_CONTChange(Sender: TObject);
begin
  inherited;
  ProximoNumero;
end;

procedure TfrmCAD_MED_HIST.txtNUM_CONTEnter(Sender: TObject);
begin
  inherited;
  ProximoNumero;
end;

procedure TfrmCAD_MED_HIST.txtCOD_MEDICOClickButton(Sender: TObject);
begin
  inherited;
  PesquisaNova(txtCOD_MEDICO,false);
end;

procedure TfrmCAD_MED_HIST.txtCOD_MEDICOExit(Sender: TObject);
begin
  inherited;
  if not PesquisaNova(txtCOD_MEDICO,true,true) then
    txtCOD_MEDICO.SetFocus;
end;

procedure TfrmCAD_MED_HIST.txtCOD_MEDICOChange(Sender: TObject);
begin
  inherited;
  txtNUM_CONT.Text := EmptyStr; 
end;

end.
