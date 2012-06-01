unit UCAD_MOD_REUNIAO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, StdCtrls, ExtCtrls, Mask, EditLabel,
  Functions, UConexao, UComponentTag, UPesquisa, DB, Buttons,UGlobal,ULocalizar;

type

  TMontaSql = (tpInsert,tpUpdate,tpDelete);

  TfrmCAD_MOD_REUNIAO = class(TForm)
    pnl3: TPanel;
    btnSair: TBitBtn;
    tab: TPageControl;
    tabCadastro: TTabSheet;
    pnl1: TPanel;
    pnl2: TPanel;
    txtHabilitaEdicao: TEdit;
    txtCodTpReuniao: TEditLabel;
    txtNomTpReuniao: TEditTag;
    txtCodTpParte: TEditLabel;
    txtNomTpParte: TEditTag;
    txtDuracao: TEditLabel;
    lvw: TListViewTag;
    btnUp: TSpeedButton;
    btnDown: TSpeedButton;
    btnIncluir: TSpeedButton;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure txtHabilitaEdicaoEnter(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure txtCodTpReuniaoClickButton(Sender: TObject);
    procedure txtCodTpReuniaoExit(Sender: TObject);
    procedure txtCodTpParteClickButton(Sender: TObject);
    procedure txtCodTpParteExit(Sender: TObject);
    procedure lvwKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnUpClick(Sender: TObject);
    procedure btnDownClick(Sender: TObject);
    procedure txtCodTpParteChange(Sender: TObject);

  private
    FTabela: String;

    // Impedir que o Form seja Arrastado para fora da Tela //
    procedure WMMove(var msg: TWMMove); message WM_MOVE;
    procedure IncluirNaLista;
    procedure IncluirNoBanco;
    procedure AtualizaLista;
  public

    property Tabela: String read FTabela write FTabela;

    function FormataBD(strValor: String; Tipo: String): STring;
    function MontaWhereChave(Container: TWinControl): string;
    function VerificaNotNull(Chave: boolean): boolean;
    function MontaSqlTela: string;

    procedure MsgCampoNulo(strCampo: string; objCampo: TCustomControl);
    procedure HabilitaEdicao(Editar: boolean);
    procedure DisablePanel(bln: Boolean);
    procedure LimpaCampos;
    procedure PrencheEmpresa;
    procedure VarreTela(var arrCampo, arrValor: TStringList);
    procedure ValorCampoContainer(Container: TWinControl; var arrCampo, arrValor: TStringList);
    procedure PreencheLista(DataSource: TDataSource);
    procedure ValidaCamposPesquisa;

  end;

var
  frmCAD_MOD_REUNIAO: TfrmCAD_MOD_REUNIAO;
  Pesqu   : TPesquisa;
  cnn     : TConexao;

implementation

uses Math;

{$R *.dfm}

// Impedir que o Form seja Arrastado para fora da Tela //
procedure TfrmCAD_MOD_REUNIAO.WMMove(var msg: TWMMove);

begin
  if WindowState <> wsMaximized then
  begin
    if Left < 0 then
      Left := 0;
    if Top < 0 then
      Top := 0;
    if Screen.Width - (Left + Width) < 0 then
      Left := Screen.Width - Width;
    if Screen.Height - (Top + Height) < 0 then
      Top := Screen.Height - Height;
  end;
end;

procedure TfrmCAD_MOD_REUNIAO.MsgCampoNulo(strCampo: string; objCampo: TCustomControl);

begin
  MessageDlg('O campo '+ UpperCase(trim(strCampo)) +' deve ser preenchido',mtWarning,[mbok],0);
  if objCampo.Enabled then
    objCampo.SetFocus;
end;

procedure TfrmCAD_MOD_REUNIAO.HabilitaEdicao(Editar: boolean);

var str: string;
    dts: TDataSource;

begin
  if Editar then
  begin
    if VerificaNotNull(Editar) then
    begin
      str := 'Select ' +
             '  A.COD_TP_PARTE, '+
             '  B.NOM_TP_PARTE, '+
             '  A.NUM_DURACAO, '+
             '  A.NUM_ORDEM' +
             ' From ' +
             '  CAD_MOD_REUNIAO A, ' +
             '  CAD_TP_PARTE B ' +
             ' Where ' +
             '  A.COD_TP_PARTE = B.COD_TP_PARTE And ' +
             '  A.COD_TP_REUNIAO = ' + txtCodTpReuniao.Text +
             ' Order By NUM_ORDEM ';
      if Trim(str) <> '' then
      begin
          DisablePanel(False);
        if cnn.ExecuteQuery(str,dts) then  // CASO TENHA REGISTRO MONTAR A TELA //
        begin
          PreencheLista(dts);
        end;
      end;
      txtHabilitaEdicao.Enabled := false;
      keybd_event(VK_TAB,0,0,0);
    end
    else
      txtHabilitaEdicao.Enabled := true;
  end
  else
    LimpaCampos;
end;

function TfrmCAD_MOD_REUNIAO.MontaSqlTela: string;

var str: string;

begin
  str := MontaWhereChave(pnl1);
  Result := 'Select * From ' + Tabela + str;
end;

function TfrmCAD_MOD_REUNIAO.VerificaNotNull(Chave: boolean): boolean;

var i,j: integer;

begin
  result := false;

  if Chave then
  begin
    for i := 0 to pnl1.ControlCount - 1 do
    begin
      if pnl1.Controls[i] is TComboBoxTag then
      begin
        if (TComboBoxTag(pnl1.Controls[i])._NotNull) and (TComboBoxTag(pnl1.Controls[i]).Text = '') then
        begin
          MsgCampoNulo(TComboBoxTag(pnl1.Controls[i])._Label.Caption,TCustomControl(pnl1.Controls[i]));
          exit;
        end;
      end

      else if pnl1.Controls[i] is TEditLabel then
      begin
        if (TEditLabel(pnl1.Controls[i])._NotNull) and (trim(TEditLabel(pnl1.Controls[i]).Text) = '') then
        begin
          MsgCampoNulo(TEditLabel(pnl1.Controls[i])._LabelCaption,TCustomControl(pnl1.Controls[i]));
          exit;
        end;
      end;
    end;
  end
  else
  begin
    for j := 0 to ComponentCount - 1 do
    begin
      if Components[j] is TPanel then
      begin
        if TPanel(Components[j]).Name <> 'pnl1' then
        begin
          for i := 0 to TPanel(Components[j]).ControlCount - 1 do
          begin
            if TPanel(Components[j]).Controls[i] is TComboBoxTag then
            begin
              if (TComboBoxTag(TPanel(Components[j]).Controls[i])._NotNull) and (TComboBoxTag(TPanel(Components[j]).Controls[i]).Text = '') then
              begin
                MsgCampoNulo(TComboBoxTag(TPanel(Components[j]).Controls[i])._Label.Caption,TCustomControl(TPanel(Components[j]).Controls[i]));
                exit;
              end;
            end
            else if TPanel(Components[j]).Controls[i] is TEditLabel then
            begin
              if (TEditLabel(TPanel(Components[j]).Controls[i])._NotNull) and (trim(TEditLabel(TPanel(Components[j]).Controls[i]).Text) = '') then
              begin
                MsgCampoNulo(TEditLabel(TPanel(Components[j]).Controls[i])._LabelCaption,TCustomControl(TPanel(Components[j]).Controls[i]));
                exit;
              end;
            end
            else if TPanel(Components[j]).Controls[i] is TMemoTag then
            begin
              if (TMemoTag(TPanel(Components[j]).Controls[i])._NotNull) and (trim(TMemoTag(TPanel(Components[j]).Controls[i]).Text) = '') then
              begin
                MsgCampoNulo(TMemoTag(TPanel(Components[j]).Controls[i])._Label.Caption,TCustomControl(TPanel(Components[j]).Controls[i]));
                exit;
              end;
            end;
          end;
        end;
      end;
    end;
  end;
  result := true;
end;

function TfrmCAD_MOD_REUNIAO.FormataBD(strValor: String; Tipo: String): String;

var strAux: string;

begin
  if tipo = 'N' then
  begin
    strAux := StringReplace(strValor,'.','',[rfReplaceAll]);
    strAux := StringReplace(strAux,',','.',[rfReplaceAll]);
    strAux := StringReplace(strAux,'(','',[rfReplaceAll]);
    strAux := StringReplace(strAux,'-','',[rfReplaceAll]);
    strAux := StringReplace(strAux,')','',[rfReplaceAll]);
    strAux := StringReplace(strAux,'/','',[rfReplaceAll]);
    Result := strAux;
  end;

  if tipo = 'C' then
    Result := Aspas(Trim(strValor));

  if tipo = 'D' then
  begin
    if Trim(StringReplace(strValor,'/','',[rfReplaceAll])) = '' then
      Result := 'Null'
    else
      Result := cnn.To_Date(strValor);
  end;
end;

// Limpar Campos da Tela //
procedure TfrmCAD_MOD_REUNIAO.LimpaCampos;

var i: integer;

begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TEdit then
      TEdit(Components[i]).Text := ''
    else if Components[i] is TComboBoxTag then
      TComboBoxTag(Components[i]).ItemIndex := -1
    else if Components[i] is TMemoTag then
      TMemoTag(Components[i]).Text := ''
    else if Components[i] is TEditLabel then
      TEditLabel(Components[i]).text := ''
    else if Components[i] is TCheckBoxTag then
      TCheckBoxTag(Components[i]).Checked := false
    else if (Components[i] is TListView) or  (Components[i] is TListViewTag) then
      TListView(Components[i]).Items.Clear
    else if Components[i] is TRadioButtonTag then
      TRadioButtonTag(Components[i]).Checked := TRadioButtonTag(Components[i])._Default;
  end;
  txtHabilitaEdicao.Enabled := true;
  DisablePanel(True);

  Tab.TabIndex := 0;
  pnl1.SetFocus;
  keybd_event(VK_TAB,0,0,0);
end;

procedure TfrmCAD_MOD_REUNIAO.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_RETURN: keybd_event(VK_TAB,0,0,0);

    VK_ESCAPE: btnSairClick(Sender);

    VK_F5:
    begin
      if pnl2.Enabled then btnIncluirClick(Sender);
    end;
  end;
end;

procedure TfrmCAD_MOD_REUNIAO.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Messagedlg('Deseja Sair?',mtConfirmation,[mbYes,mbNo],0) = MRYes then
  begin
    //cnn.Close;
    //cnn.Free;
    Action := CaFree
  end
  else
    Action := caNone;
end;

procedure TfrmCAD_MOD_REUNIAO.FormCreate(Sender: TObject);

begin
  Left:=0;
  tOP:=0;
  GloStrUser := 'sysdba';
  GloStrPassword := 'masterkey';
//GloStrDatabase := 'FAG';
//  GloStrServer := 'localhost';
  cnn := TConexao.Create(GloStrUser,GloStrPassword,GloStrDatabase, GloStrServer, GloBlnEmbedded);
  DisablePanel(True);
  cnn.Open;
  pnl1.BevelInner := bvNone;
  pnl2.BevelInner := bvNone;
  tab.TabIndex := 0;
  SetaConfiguracaoDoSistema;
  PrencheEmpresa;
{  lvw.ViewStyle := vsReport;
  lvw.Enabled := True;
  lvw.ReadOnly := False;}
end;

procedure TfrmCAD_MOD_REUNIAO.txtHabilitaEdicaoEnter(Sender: TObject);
begin
  HabilitaEdicao(true);
end;

procedure TfrmCAD_MOD_REUNIAO.btnSairClick(Sender: TObject);
begin
  if not pnl1.Enabled then
  begin
    if Messagedlg('Cancelar?',mtConfirmation,[mbYes,mbNo],0) = MRYes then
      LimpaCampos;
  end
  else
    Close;
end;

procedure TfrmCAD_MOD_REUNIAO.ValidaCamposPesquisa;

var i: integer;

begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TEditLabel then
    begin
      if TEditLabel(Components[i])._Tipo = Pesquisa then
        TEditLabel(Components[i]).OnExit(TEditLabel(Components[i]));
    end;
  end;
end;

procedure TfrmCAD_MOD_REUNIAO.DisablePanel(bln: Boolean);

var i: integer;

begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TPanel then
    begin
      if TPanel(Components[i]).Name = 'pnl1' then
        TPanel(Components[i]).Enabled := bln
      else if TPanel(Components[i]).Name <> 'pnl3' then
        TPanel(Components[i]).Enabled := Not(bln);
    end;
  end;
end;

procedure TfrmCAD_MOD_REUNIAO.PrencheEmpresa;

var i: integer;

begin
  for i := 0 to pnl1.ControlCount - 1 do
  begin
    if pnl1.Controls[i] is TEditLabel then
    begin
      if (TEditLabel(pnl1.Controls[i])._Campo = 'COD_EMPRESA') And (Tabela <> 'CAD_EMPRESA') then
        TEditLabel(pnl1.Controls[i]).Text := IntToStr(GLOintCodEmpresa);
      if (TEditLabel(pnl1.Controls[i])._Campo = 'COD_FILIAL') And (Tabela <> 'CAD_FILIAL') then
        TEditLabel(pnl1.Controls[i]).Text := IntToStr(GLOintCodFilial);
    end;
  end;
end;

procedure TfrmCAD_MOD_REUNIAO.IncluirNaLista;
var
  i: integer;
  item: TListItem;
begin
  if (Trim(txtCodTpParte.Text) = '') then
    MessageDlg( 'É necessário preencher o campo '+txtCodTpParte._LabelCaption,mtWarning,[mbOK],0)
  else if (Trim(txtDuracao.Text) = '') then
    MessageDlg( 'É necessário preencher o campo '+txtDuracao._LabelCaption,mtWarning,[mbOK],0)
  else
  begin
    for i := 0 to lvw.Items.Count - 1 do
    begin
      if Trim(lvw.Items[i].Caption) = Trim(txtCodTpParte.Text) then
      begin
        MessageDlg('Registro já existe.',mtWarning,[mbOK],0);
        txtCodTpParte.SetFocus;
        txtCodTpParte.SelectAll;
        exit;
      end;
    end;

    item := lvw.Items.Add;

    item.Caption := txtCodTpParte.Text;
    item.SubItems.Add(txtNomTpParte.Text);
    item.SubItems.Add(txtDuracao.Text);
    item.SubItems.Add('');
    AtualizaLista;
    IncluirNoBanco;
  end;

end;

procedure TfrmCAD_MOD_REUNIAO.AtualizaLista;
var i: integer;
begin
  for i := 0 to lvw.Items.Count -1 do
    lvw.Items[i].SubItems[2] := IntToStr(i+1);
end;

procedure TfrmCAD_MOD_REUNIAO.btnIncluirClick(Sender: TObject);
begin
  IncluirNaLista;
  txtCodTpParte.SetFocus;
end;

procedure TfrmCAD_MOD_REUNIAO.txtCodTpReuniaoClickButton(Sender: TObject);
var Pesquisa: TPesquisa;
begin
  inherited;
  Pesquisa := TPesquisa.Create;
  Pesquisa.Campos  := 'A.COD_TP_REUNIAO,A.NOM_TP_REUNIAO';
  Pesquisa.Tabela := 'CAD_TP_REUNIAO';
  Pesquisa.CampoCodigo := txtCodTpReuniao;
  Pesquisa.CampoNome := txtNomTpReuniao;
  Pesquisa.ExecutaPesquisa(false);
  Pesquisa.Free;
end;

procedure TfrmCAD_MOD_REUNIAO.txtCodTpReuniaoExit(Sender: TObject);
var Pesquisa: TPesquisa;

begin
  inherited;
  Pesquisa := TPesquisa.Create;
  Pesquisa.Campos  := 'A.COD_TP_REUNIAO,A.NOM_TP_REUNIAO';
  Pesquisa.Tabela := 'CAD_TP_REUNIAO';
  Pesquisa.CampoCodigo := txtCodTpReuniao;
  Pesquisa.CampoNome := txtNomTpReuniao;
  if not Pesquisa.ExecutaPesquisa(true) then
    txtCodTpReuniao.SetFocus;
  Pesquisa.Free;
end;

procedure TfrmCAD_MOD_REUNIAO.txtCodTpParteClickButton(Sender: TObject);
var Pesquisa: TPesquisa;
begin
  inherited;
  Pesquisa := TPesquisa.Create;
  Pesquisa.Campos  := 'A.COD_TP_PARTE,A.NOM_TP_PARTE';
  Pesquisa.Tabela := 'CAD_TP_PARTE';
  Pesquisa.CampoCodigo := txtCodTpParte;
  Pesquisa.CampoNome := txtNomTpParte;
  Pesquisa.ExecutaPesquisa(false);
  Pesquisa.Free;
end;

procedure TfrmCAD_MOD_REUNIAO.txtCodTpParteExit(Sender: TObject);
var
  Pesquisa: TPesquisa;
  str: string;
  ds: TDataSource;
begin
  inherited;
  Pesquisa := TPesquisa.Create;
  Pesquisa.Campos  := 'A.COD_TP_PARTE,A.NOM_TP_PARTE';
  Pesquisa.Tabela := 'CAD_TP_PARTE';
  Pesquisa.CampoCodigo := txtCodTpParte;
  Pesquisa.CampoNome := txtNomTpParte;
  if not Pesquisa.ExecutaPesquisa(true) then
    txtCodTpParte.SetFocus
  else
  begin
    if Trim(txtCodTpParte.Text) <> '' then
    begin
      str := 'Select NUM_DURACAO From CAD_TP_PARTE '+
             '  Where COD_TP_PARTE = ' + txtCodTpParte.Text;

      if cnn.ExecuteQuery(str,ds) = true then
        txtDuracao.Text := ds.DataSet.FieldByName('NUM_DURACAO').AsString;
      ds.Free;
    end;
  end;
  Pesquisa.Free;
end;

function TfrmCAD_MOD_REUNIAO.MontaWhereChave(
  Container: TWinControl): string;
begin

end;

procedure TfrmCAD_MOD_REUNIAO.PreencheLista(DataSource: TDataSource);
var i: integer;
    item: TListItem;
begin
  for i := 1 to DataSource.DataSet.RecordCount do
  begin
    with DataSource.DataSet do
    begin
      item := lvw.Items.Add;
      item.Caption := FieldByName('COD_TP_PARTE').AsString;
      item.SubItems.Add(FieldByName('NOM_TP_PARTE').AsString);
      item.SubItems.Add(FieldByName('NUM_DURACAO').AsString);
      item.SubItems.Add(FieldByName('NUM_ORDEM').AsString);
      Next;
    end;
  end;

end;

procedure TfrmCAD_MOD_REUNIAO.ValorCampoContainer(Container: TWinControl;
  var arrCampo, arrValor: TStringList);
begin

end;

procedure TfrmCAD_MOD_REUNIAO.VarreTela(var arrCampo,
  arrValor: TStringList);
begin

end;

procedure TfrmCAD_MOD_REUNIAO.IncluirNoBanco;
var
  str: string;
  i: integer;
begin
if (Trim(txtCodTpReuniao.Text) <> EmptyStr) then
  begin
    try
      str := 'Delete From CAD_MOD_REUNIAO '+
             '  Where COD_TP_REUNIAO = ' + txtCodTpReuniao.Text;
      cnn.Execute(str);
    except
      on ex: Exception do
        str := EmptyStr;
    end;
    for i := 0 to lvw.Items.Count - 1 do
    begin
      str := 'Insert Into CAD_MOD_REUNIAO( '+
             '  COD_TP_REUNIAO,'+
             '  COD_TP_PARTE,'+
             '  NUM_ORDEM,'+
             '  NUM_DURACAO'+
             ') Values ('+
             txtCodTpReuniao.Text + ',' +
             lvw.Items[i].Caption + ',' +
             lvw.Items[i].SubItems[2] + ',' +
             lvw.Items[i].SubItems[1] + ')';
      cnn.Execute(str);
    end;
    txtCodTpParte.Text := EmptyStr;
    txtDuracao.Text := EmptyStr;
    txtCodTpParte.Text := EmptyStr;
  end;
end;

procedure TfrmCAD_MOD_REUNIAO.lvwKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_DELETE then
  begin
    AtualizaLista;
    IncluirNoBanco;
  end;
end;

procedure TfrmCAD_MOD_REUNIAO.btnUpClick(Sender: TObject);
var item1,item2: TListItem;
    i: integer;
begin
  if (lvw.Items.Count >= 2) and (lvw.ItemIndex > 0) then
  begin
    item1 := lvw.Items[lvw.ItemIndex-1];
    item2 := lvw.Items.Insert(lvw.ItemIndex+1);
    item2.Caption := item1.Caption;
    for i := 0 to lvw.Columns.Count -2 do
      item2.SubItems.Add(item1.SubItems[i]);
    item1.Delete;

    AtualizaLista;
    IncluirNoBanco;
  end;
end;


procedure TfrmCAD_MOD_REUNIAO.btnDownClick(Sender: TObject);
var item1,item2: TListItem;
    i: integer;
begin
  if (lvw.Items.Count >= 2) and (lvw.ItemIndex >= 0) and (lvw.ItemIndex <> lvw.Items.Count-1) then
  begin
    item1 := lvw.Items[lvw.ItemIndex+1];
    item2 := lvw.Items.Insert(lvw.ItemIndex);
    item2.Caption := item1.Caption;
    for i := 0 to lvw.Columns.Count -2 do
      item2.SubItems.Add(item1.SubItems[i]);
    item1.Delete;

    AtualizaLista;
    IncluirNoBanco;
  end;
end;

procedure TfrmCAD_MOD_REUNIAO.txtCodTpParteChange(Sender: TObject);
begin
  txtDuracao.Text := EmptyStr;
end;

end.
