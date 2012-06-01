unit UCAD_PROGRAMA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ufrm, Mask, EditLabel, StdCtrls, ComCtrls, Buttons, ExtCtrls,
  UComponentTag, UPesquisa, DB, Functions;

type
  TfrmCAD_PROGRAMA = class(Tfrm)
    txtDatSemana: TEditLabel;
    txtCodTpParte: TEditLabel;
    txtNomTpParte: TEditTag;
    Label2: TLabel;
    Calendario: TMonthCalendar;
    txtNomParte: TEditLabel;
    txtMateria: TEditLabel;
    grpDesignacao: TGroupBox;
    optAmbos: TRadioButtonTag;
    optIrmaos: TRadioButtonTag;
    optIrmas: TRadioButtonTag;
    lvw: TListViewTag;
    txtCodTpReuniao: TEditLabel;
    txtNomTpReuniao: TEditTag;
    lblCantico: TLabel;
    edtNUM_ORDEM: TEditLabel;
    lblDesignacao: TLabel;
    procedure CalendarioClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure txtCodTpParteClickButton(Sender: TObject);
    procedure txtCodTpParteExit(Sender: TObject);
    procedure txtDatSemanaChange(Sender: TObject);
    procedure txtCodTpReuniaoClickButton(Sender: TObject);
    procedure txtCodTpReuniaoExit(Sender: TObject);
    procedure txtCodTpReuniaoChange(Sender: TObject);
    procedure lvwDblClick(Sender: TObject);
    procedure btnIncluiClick(Sender: TObject);
    procedure btnAlteraClick(Sender: TObject);
    procedure txtDatSemanaExit(Sender: TObject);
    procedure txtNomTpParteChange(Sender: TObject);
  private
    function PesquisaNova(Sender: TObject;
      blnValida: boolean): boolean;
    procedure AtualizaLista;
    procedure ProximaParte;
    procedure InsereNovaReuniao;
    procedure AtualizaCantico;
    procedure DefineOrdem;
  public
  end;

var
  frmCAD_PROGRAMA: TfrmCAD_PROGRAMA;

implementation

uses DateUtils, StrUtils;

{$R *.dfm}

procedure TfrmCAD_PROGRAMA.CalendarioClick(Sender: TObject);
begin
{ ********** CONSTANTES DA FUNÇÃO DayOfTheWeek ****************
  DayMonday     => 1 - Segunda
  DayTuesday    => 2 - Terça
  DayWednesday  => 3 - Quarta
  DayThursday   => 4 - Quinta
  DayFriday     => 5 - Sexta
  DaySaturday   => 6 - Sabado
  DaySunday     => 7 - Domingo
  --------------------------------------------}
  inherited;
  txtDatSemana.Text := DateToStr(IncDay(Calendario.Date,DayMonday-DayOfTheWeek(Calendario.Date)));
  Calendario.Date := StrToDate(txtDatSemana.Text);
  txtDatSemana.SelectAll;
end;

procedure TfrmCAD_PROGRAMA.FormCreate(Sender: TObject);
begin
  inherited;
  Calendario.Date := Date;
  Tabela := 'CAD_PROGRAMA';
  lblCantico.Caption := EmptyStr;
end;

function TfrmCAD_PROGRAMA.PesquisaNova(Sender: TObject;
  blnValida: boolean): boolean;
var Edt      : TEditlabel;
    EdtN     : TEdit;
    Pesquisa : TPesquisa;
    str      : array[0..2] of string;

begin
  Edt := Sender as TEditLabel;
  EdtN:= Edt._Edit;

  if (Edt._Campo = 'COD_TP_PARTE') then
  begin
    str[0] := 'A.COD_TP_PARTE,A.NOM_TP_PARTE';
    str[1] := 'CAD_TP_PARTE,CAD_MOD_REUNIAO';
    str[2] := 'A.COD_TP_PARTE = B.COD_TP_PARTE And ';
    str[2] := str[2] + 'B.COD_TP_REUNIAO = '+txtCodTpReuniao.Text;
  end
  else if (Trim(UpperCase(Edt.Name)) = UpperCase('txtCodTpReuniao')) then
  begin
    str[0] := 'A.COD_TP_REUNIAO,A.NOM_TP_REUNIAO';
    str[1] := 'CAD_TP_REUNIAO';
    str[2] := 'A.COD_TP_REUNIAO In (Select COD_TP_REUNIAO From CAD_MOD_REUNIAO)';
  end
  else
    Exit;

  Pesquisa := TPesquisa.Create;
  Result := Pesquisa.ExecutaPesquisa(blnValida,str[0],str[1],Edt,EdtN,str[2]);

  if (not Result) and (blnValida) and (Edt.Visible) and (Edt.Enabled) then
    Edt.SetFocus;

  Pesquisa.Free;
end;


procedure TfrmCAD_PROGRAMA.txtCodTpParteClickButton(Sender: TObject);
begin
  inherited;
  PesquisaNova(Sender,False);
end;

procedure TfrmCAD_PROGRAMA.txtCodTpParteExit(Sender: TObject);
begin
  inherited;
  PesquisaNova(Sender,True);
end;

procedure TfrmCAD_PROGRAMA.txtDatSemanaChange(Sender: TObject);
begin
  inherited;
  
  lblCantico.Caption := EmptyStr;  
end;

procedure TfrmCAD_PROGRAMA.txtCodTpReuniaoClickButton(Sender: TObject);
begin
  inherited;
  PesquisaNova(Sender,False);
end;
procedure TfrmCAD_PROGRAMA.AtualizaLista;
var
  str: string;
  ds: TDataSource;
  item: TListItem;
begin
  if Trim(txtCodTpReuniao.Text) <> EmptyStr then
  begin
    lvw.Clear;
    str := 'Select '+
           '  A.COD_TP_PARTE, '+
           '  B.NOM_TP_PARTE, '+
           '  A.NUM_ORDEM '+
           ' From '+
           '  CAD_MOD_REUNIAO A, '+
           '  CAD_TP_PARTE B '+
           ' Where '+
           '  A.COD_TP_PARTE = B.COD_TP_PARTE And '+
           '  A.COD_TP_REUNIAO = '+txtCodTpReuniao.Text+
           ' Order By A.NUM_ORDEM';
    cnn.ExecuteQuery(str,ds);

    while not ds.DataSet.Eof do
    begin
      item := lvw.Items.Add;
      item.Caption := ds.DataSet.FieldByName('COD_TP_PARTE').AsString;
      item.SubItems.Add (ds.DataSet.FieldByName('NOM_TP_PARTE').AsString);
      item.SubItems.Add (ds.DataSet.FieldByName('NUM_ORDEM').AsString);
//      item.ImageIndex;
      ds.DataSet.Next;
    end;
  end;
end;

procedure TfrmCAD_PROGRAMA.txtCodTpReuniaoExit(Sender: TObject);
begin
  inherited;
  if PesquisaNova(Sender,True) then
  begin
    AtualizaLista;
  end;
end;

procedure TfrmCAD_PROGRAMA.txtCodTpReuniaoChange(Sender: TObject);
begin
  inherited;
  lvw.Items.Clear;
  txtCodTpParte.Text := EmptyStr;
  txtCodTpParte.Enabled := not IsEmptyStr(txtCodTpReuniao.Text);
end;

procedure TfrmCAD_PROGRAMA.lvwDblClick(Sender: TObject);
var i: integer;
begin
  inherited;
  if (lvw.ItemIndex >= 0) and
     (Trim(StringReplace(txtDatSemana.Text,'/',EmptyStr,[rfReplaceAll]) ) <> EmptyStr) then
  begin
    txtCodTpParte.Text := lvw.Selected.Caption;
    txtNomParte.Text := EmptyStr;
    txtMateria.Text := EmptyStr;
    optIrmaos.Checked := true;
    i := lvw.ItemIndex;
    HabilitaEdicao(True);
    DefineOrdem;
    PesquisaNova(txtCodTpParte,true);
    lvw.ItemIndex := i;
  end;
end;

procedure TfrmCAD_PROGRAMA.btnIncluiClick(Sender: TObject);
var str: String;
begin
  if btnInclui.Enabled then
  begin
    if MessageDlg('Confirma Inclusão?', mtConfirmation,[mbYes,mbNo],0) = mrYes then
    begin
      DefineOrdem;
      str := MontaSql(tpInsert);
      InsereNovaReuniao;
      GravaBanco(tpInsert,str,false,false);
      ProximaParte;
{      if lvw.ItemIndex < lvw.Items.Count -1 then
      begin
        lvw.ItemIndex := lvw.ItemIndex + 1;
        txtCodTpParte.Text := lvw.Selected.Caption;
        HabilitaEdicao(True);
        PesquisaNova(txtCodTpParte,true);
      end;
      lvw.SetFocus;}
    end;
  end;

end;

procedure TfrmCAD_PROGRAMA.btnAlteraClick(Sender: TObject);
var str: String;
begin
  if btnAltera.Enabled then
  begin
    if MessageDlg('Confirma Alteração?', mtConfirmation,[mbYes,mbNo],0) = mrYes then
    begin
      DefineOrdem;
      str := MontaSql(tpUpdate);
      AtualizaCantico;
      GravaBanco(tpUpdate,str,false,false);
      ProximaParte;
    end;
  end;

end;

procedure TfrmCAD_PROGRAMA.ProximaParte;
var i: integer;

begin
  txtNomParte.Text := EmptyStr;
  txtMateria.Text := EmptyStr;
  optIrmaos.Checked := true;
  if lvw.ItemIndex < lvw.Items.Count -1 then
  begin
    lvw.ItemIndex := lvw.ItemIndex + 1;
    txtCodTpParte.Text := lvw.Selected.Caption;
    i := lvw.ItemIndex;
    HabilitaEdicao(True);
    DefineOrdem;
    PesquisaNova(txtCodTpParte,true);
    lvw.ItemIndex := i;
  end
  else
  begin
    if MessageDlg('Deseja passar para a próxima semana?', mtConfirmation, [mbYes,mbNo],0) = mrYes then
    begin
      Calendario.Date := Calendario.Date + 7;
      txtDatSemana.Text := DateToStr(Calendario.Date);
      lvw.ItemIndex := 0;
      txtCodTpParte.Text := lvw.Selected.Caption;
      i := lvw.ItemIndex;
      HabilitaEdicao(True);
      DefineOrdem;
      PesquisaNova(txtCodTpParte,true);
      lvw.ItemIndex := i;
      AtualizaCantico;
    end
    else
    begin
      i := StrToInt(txtCodTpReuniao.Text);
      LimpaCampos;
      txtCodTpReuniao.Text := IntToStr(i);
      txtCodTpReuniaoExit(txtCodTpReuniao);
    end;
  end;
  lvw.SetFocus;
end;

procedure TfrmCAD_PROGRAMA.InsereNovaReuniao;
var str,cantico: string;
    ds: TDataSource;
    existe: boolean;
begin
  str := 'Select NUM_CANTICO'+
         '  From CAD_REUNIAO '+
         '  Where DAT_SEMANA = '+cnn.DateToBD(txtDatSemana.Text);
  existe := cnn.ExecuteQuery(str,ds);

  if (not existe) then
  begin
    cantico := InputBox('Cântico', 'Insira o número do cântico','');
    cantico := IntToStr(StrToIntDef(cantico,0));
    if cantico = '0' then
      cantico := 'NULL';
    str :=  'Insert Into CAD_REUNIAO(DAT_SEMANA,NUM_CANTICO)'+
            '  Values('+
            cnn.DateToBD(txtDatSemana.Text)+','+
            cantico+')';
    cnn.Execute(str);
    if cantico <> 'NULL' then
      lblCantico.Caption := 'Cântico: '+cantico;
  end
  else
    AtualizaCantico;
end;

procedure TfrmCAD_PROGRAMA.AtualizaCantico;
var str,cantico: string;
    ds: TDataSource;
begin
  str := 'Select NUM_CANTICO'+
         '  From CAD_REUNIAO '+
         '  Where DAT_SEMANA = '+cnn.DateToBD(txtDatSemana.Text);
  if cnn.ExecuteQuery(str,ds) then
  begin
    if ds.DataSet.Fields[0].IsNull then
    begin
      cantico := InputBox('Cântico', 'Insira o número do cântico','');
      cantico := IntToStr(StrToIntDef(cantico,0));
      if cantico = '0' then
        cantico := 'NULL';
      str :=  'Update CAD_REUNIAO '+
              '  Set NUM_CANTICO = '+cantico+
              '  Where DAT_SEMANA = '+cnn.DateToBD(txtDatSemana.Text);
      cnn.Execute(str);
      if cantico <> 'NULL' then
        lblCantico.Caption := 'Cântico: '+cantico;
    end
    else
      lblCantico.Caption := 'Cântico: '+ds.DataSet.Fields[0].AsString;
  end;
end;

procedure TfrmCAD_PROGRAMA.txtDatSemanaExit(Sender: TObject);
begin
  inherited;
  if Trim(StringReplace(txtDatSemana.Text,'/',EmptyStr,[rfReplaceAll])) <> '' then
  begin
    Calendario.Date := StrToDate(txtDatSemana.Text);
    CalendarioClick(Sender);
  end;
  AtualizaCantico;
end;

procedure TfrmCAD_PROGRAMA.DefineOrdem;
var i: integer;
begin
  inherited;
  for i := 0 to lvw.Items.Count -1 do
  begin
    if trim(lvw.Items[i].Caption) = trim(txtCodTpParte.Text) then
    begin
      edtNUM_ORDEM.Text := lvw.Items[i].SubItems[1];
      break;
    end;
  end;
end;

procedure TfrmCAD_PROGRAMA.txtNomTpParteChange(Sender: TObject);
begin
  inherited;
  lblDesignacao.Caption := txtNomTpParte.Text;
end;

end.
