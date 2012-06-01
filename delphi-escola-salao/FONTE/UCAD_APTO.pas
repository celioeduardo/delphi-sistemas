unit UCAD_APTO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ufrm, StdCtrls, ComCtrls, Buttons, ExtCtrls, UComponentTag,
  Mask, EditLabel, DB;

type
  TfrmCAD_APTO = class(Tfrm)
    edtCOD_TERRITORIO: TEditLabel;
    txtNomTerritorio: TEditTag;
    edtNUM_APTO: TEditLabel;
    edtNUM_TELEFONE: TEditLabel;
    edtNUM_CONT: TEditLabel;
    edtNUM_TELEFONE2: TEditLabel;
    edtNUM_TELEFONE3: TEditLabel;
    procedure FormCreate(Sender: TObject);
    procedure edtCOD_TERRITORIOClickButton(Sender: TObject);
    procedure edtCOD_TERRITORIOExit(Sender: TObject);
    procedure edtNUM_APTOClickButton(Sender: TObject);
    procedure edtCOD_TERRITORIOChange(Sender: TObject);
    procedure txtHabilitaEdicaoEnter(Sender: TObject);
    procedure edtNUM_TELEFONEChange(Sender: TObject);
    procedure edtNUM_TELEFONE2Change(Sender: TObject);
    procedure btnIncluiClick(Sender: TObject);
  private
    function PesquisaNova(Sender: TObject;
        blnValida: boolean; Msg: boolean = true): boolean;
    function SugereSequencia: integer;
    function SugereTerritorio: integer;
  public
    { Public declarations }
  end;

var
  frmCAD_APTO: TfrmCAD_APTO;

implementation

uses UPESQUISA;

{$R *.dfm}

procedure TfrmCAD_APTO.FormCreate(Sender: TObject);
begin
  inherited;
  Tabela := 'CAD_APTO';
end;


function TfrmCAD_APTO.PesquisaNova(Sender: TObject;
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
  else if (Edt._Campo = 'NUM_APTO') then
  begin
    str[0] := 'NUM_APTO,NUM_TELEFONE';
    str[1] := 'CAD_APTO';
    str[2] := 'COD_TERRITORIO = '+edtCOD_TERRITORIO.Text;
  end
  else
    Exit;

  Pesquisa := TPesquisa.Create;
  Result := Pesquisa.ExecutaPesquisa(blnValida,str[0],str[1],Edt,EdtN,str[2],Msg);

  {if (not Result) and (blnValida) and (Edt.Visible) and (Edt.Enabled) then
    Edt.SetFocus;}

  Pesquisa.Free;
end;

procedure TfrmCAD_APTO.edtCOD_TERRITORIOClickButton(Sender: TObject);
begin
  inherited;
  PesquisaNova(Sender,false);
end;

procedure TfrmCAD_APTO.edtCOD_TERRITORIOExit(Sender: TObject);
begin
  inherited;

  if not PesquisaNova(Sender,true) then
    edtCOD_TERRITORIO.SetFocus;

end;

procedure TfrmCAD_APTO.edtNUM_APTOClickButton(Sender: TObject);
begin
  inherited;
  PesquisaNova(Sender,false,false);
end;

procedure TfrmCAD_APTO.edtCOD_TERRITORIOChange(Sender: TObject);
begin
  inherited;
  edtNUM_APTO.Text := '';
  edtNUM_APTO.Enabled := trim(edtCOD_TERRITORIO.Text) <> '';
  if trim(edtCOD_TERRITORIO.Text) = '' then
  begin
    edtCOD_TERRITORIO.Text := IntToStr(SugereTerritorio);
    edtCOD_TERRITORIO.SelectAll;
  end;

end;

function TfrmCAD_APTO.SugereSequencia: integer;
var str: string;
    ds: TDataSource;

begin
  if trim(edtCOD_TERRITORIO.Text) = '' then
  begin
    Result := 0;
    Exit;
  end;

  str := 'Select Max(NUM_CONT) + 1 SEQUENCIA';
  str := str + ' From CAD_APTO ';
  str := str + ' Where COD_TERRITORIO = '+edtCOD_TERRITORIO.Text;

  if not cnn.ExecuteQuery(str,ds) then
    Result := 1
  else
  begin
    if ds.DataSet.FieldByName('SEQUENCIA').Value = Null then
      Result := 1
    else
      Result := ds.DataSet.FieldByName('SEQUENCIA').AsInteger;
  end;

end;

procedure TfrmCAD_APTO.txtHabilitaEdicaoEnter(Sender: TObject);
begin
  inherited;

  if trim(edtNUM_CONT.Text)  = '' then
  begin
    edtNUM_CONT.Text := IntToStr(SugereSequencia);
  end;
end;

procedure TfrmCAD_APTO.edtNUM_TELEFONEChange(Sender: TObject);
begin
  inherited;
  edtNUM_TELEFONE2.Text := '';
  edtNUM_TELEFONE2.Enabled := trim(edtNUM_TELEFONE.Text) <> '';
end;

procedure TfrmCAD_APTO.edtNUM_TELEFONE2Change(Sender: TObject);
begin
  inherited;
  edtNUM_TELEFONE3.Text := '';
  edtNUM_TELEFONE3.Enabled := trim(edtNUM_TELEFONE2.Text) <> '';
end;

function TfrmCAD_APTO.SugereTerritorio: integer;
var str: string;
    ds: TDataSource;

begin

  str := 'Select Max(COD_TERRITORIO) TERRITORIO';
  str := str + ' From CAD_TER_APTO ';

  if cnn.ExecuteQuery(str,ds) then
  begin
    if ds.DataSet.FieldByName('TERRITORIO').Value <> Null then
      Result := ds.DataSet.FieldByName('TERRITORIO').AsInteger;
  end;

end;


procedure TfrmCAD_APTO.btnIncluiClick(Sender: TObject);
var
  str: string;
begin
  inherited;
end;

end.
