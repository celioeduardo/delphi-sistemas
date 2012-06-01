unit Ufrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, StdCtrls, ExtCtrls, Mask, EditLabel,
  Functions, UConexao, UComponentTag, UPesquisa, DB, Buttons,UGlobal,ULocalizar;

type

  TMontaSql = (tpInsert,tpUpdate,tpDelete);

  Tfrm = class(TForm)
    pnl3: TPanel;
    btnInclui: TBitBtn;
    btnaltera: TBitBtn;
    btnExclui: TBitBtn;
    btnLocaliza: TBitBtn;
    btnSair: TBitBtn;
    tab: TPageControl;
    tabCadastro: TTabSheet;
    pnl1: TPanel;
    pnl2: TPanel;
    txtHabilitaEdicao: TEdit;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnIncluiClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure txtHabilitaEdicaoEnter(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnalteraClick(Sender: TObject);
    procedure btnExcluiClick(Sender: TObject);
    procedure btnLocalizaClick(Sender: TObject);

  private
    FTabela: String;

    // Impedir que o Form seja Arrastado para fora da Tela //
    procedure WMMove(var msg: TWMMove); message WM_MOVE;

  public

    property Tabela: String read FTabela write FTabela;

    function MontaSql(Tipo: TMontaSql): String;
    function FormataBD(strValor: String; Tipo: String): STring;
    function MontaWhereChave(Container: TWinControl): string;
    function VerificaNotNull(Chave: boolean): boolean;
    function MontaSqlTela: string;
    function ProximoNumero(var controle: TEditLabel): string;

    procedure MsgCampoNulo(strCampo: string; objCampo: TCustomControl);
    procedure HabilitaEdicao(Editar: boolean; LimpaTela: boolean = true); overload;
    procedure DisablePanel(bln: Boolean);
    procedure LimpaCampos; overload;
    procedure PrencheEmpresa;
    procedure VarreTela(var arrCampo, arrValor: TStringList; Update: boolean);
    procedure ValorCampoContainer(Container: TWinControl; var arrCampo, arrValor: TStringList);
    procedure PreencheCampos(Container: TWinControl; DataSource: TDataSource);
    procedure Botao(Habilita: Boolean);
    procedure GravaBanco(Tipo: TMontaSql; strComando: string;
                 LimpaTela: boolean = true; Pergunta: boolean = true);
    procedure ValidaCamposPesquisa;


  end;

var
  frm: Tfrm;
  Pesqu   : TPesquisa;
  cnn     : TConexao;

implementation

uses Math;

{$R *.dfm}

// Impedir que o Form seja Arrastado para fora da Tela //
procedure Tfrm.WMMove(var msg: TWMMove);

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

procedure Tfrm.MsgCampoNulo(strCampo: string; objCampo: TCustomControl);

begin
  MessageDlg('O campo '+ UpperCase(trim(strCampo)) +' deve ser preenchido',mtWarning,[mbok],0);
  if objCampo.Enabled then
    objCampo.SetFocus;
end;

procedure Tfrm.Botao(Habilita: boolean);

begin
  btnInclui.Enabled := Habilita;
  btnAltera.Enabled := not Habilita;
  btnExclui.Enabled := not Habilita;
  btnLocaliza.Enabled := false;
end;

procedure Tfrm.GravaBanco(Tipo: TMontaSql; strComando: string;
   LimpaTela: boolean = true; Pergunta: boolean = true);

var msg: string;

begin
  if strComando = '' then
    exit;
  case Tipo of
    tpInsert: msg := 'Inclusão';
    tpUpdate: msg := 'Alteracão';
    tpDelete: msg := 'Exclusão';
  end;

  if Pergunta then
  begin
    if MessageDlg('Confirma '+msg+'?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
      exit;
  end;

  if cnn.Execute(strComando) > 0 then
    HabilitaEdicao(False,LimpaTela);
end;

procedure Tfrm.HabilitaEdicao(Editar: boolean; LimpaTela: boolean = true);

var str: string;
    dts: TDataSource;

begin
  if Editar then
  begin
    if VerificaNotNull(Editar) then
    begin
      str := MontaWhereChave(pnl1);
      str := 'Select * From ' + Tabela + str;
      if Trim(str) <> '' then
      begin
        DisablePanel(False);
        if cnn.ExecuteQuery(str,dts) then
        begin
          if dts.DataSet.RecordCount > 1 then
          begin
            ShowMessage('Retornou mais de 1 registro');
            exit;
          end;
          Botao(false);
          PreencheCampos(pnl2,dts);
        end
        else
          Botao(True);
      end;
      txtHabilitaEdicao.Enabled := false;
        keybd_event(VK_TAB,0,0,0);
    end
    else
      txtHabilitaEdicao.Enabled := true;
  end
  else
  begin
    if LimpaTela then
      if not pnl1.Enabled then
        LimpaCampos;
  end;
    end;

procedure Tfrm.PreencheCampos(Container: TWinControl; DataSource: TDataSource);

var i,j,k: integer;

begin
  for i := 0 to Container.ControlCount -1 do
  begin
      if (Container.Controls[i] is TGroupBox) or
       (Container.Controls[i] is TPageControl) or
       (Container.Controls[i] is TTabSheet) then
    begin
        PreencheCampos(TWinControl(Container.Controls[i]), DataSource);
    end
    else
    begin
      if TWinControl(Container.Controls[i]) is TComboBoxTag then
        TComboBoxTag(TWinControl(Container.Controls[i])).ItemIndex := TComboBoxTag(TWinControl(Container.Controls[i])).BoundIndex(DataSource.DataSet.FieldByName(TComboBoxTag(TWinControl(Container.Controls[i]))._Campo).Text)
      else if TWinControl(Container.Controls[i]) is TCheckBoxTag then
        TCheckBoxTag(TWinControl(Container.Controls[i])).Checked := (TCheckBoxTag(TWinControl(Container.Controls[i]))._Valor = DataSource.DataSet.FieldByName(TCheckBoxTag(TWinControl(Container.Controls[i]))._Campo).AsString)
      else if TWinControl(Container.Controls[i]) is TMemoTag then
        TMemoTag(TWinControl(Container.Controls[i])).Text := DataSource.DataSet.FieldByName(TMemoTag(TWinControl(Container.Controls[i]))._Campo).AsString
      else if TWinControl(Container.Controls[i]) is TRadioButtonTag then
        TRadioButtonTag(TWinControl(Container.Controls[i])).Checked := DataSource.DataSet.FieldByName(TRadioButtonTag(TWinControl(Container.Controls[i]))._Campo).Text = TRadioButtonTag(TWinControl(Container.Controls[i]))._Valor
      else if TWinControl(Container.Controls[i]) is TEditLabel then
      begin
        if Trim(TEditLabel(TWinControl(Container.Controls[i]))._Campo) <> '' then
        begin
          case TEditLabel(TWinControl(Container.Controls[i]))._Tipo of

            Data:
            begin
              if DataSource.DataSet.FieldByName(TEditLabel(TWinControl(Container.Controls[i]))._Campo).Asstring <> '' then
                TEditLabel(TWinControl(Container.Controls[i])).Text := DateTostr(DataSource.DataSet.FieldByName(TEditLabel(TWinControl(Container.Controls[i]))._Campo).AsDateTime,FormatSettings);
            end;
            Data_Hora:
            begin
              if DataSource.DataSet.FieldByName(TEditLabel(TWinControl(Container.Controls[i]))._Campo).Asstring <> '' then
                TEditLabel(TWinControl(Container.Controls[i])).Text := DateTimeToStr(DataSource.DataSet.FieldByName(TEditLabel(TWinControl(Container.Controls[i]))._Campo).AsDateTime,FormatSettings);
            end;

            CPF: TEditLabel(TWinControl(Container.Controls[i])).Text := LPAD(DataSource.DataSet.FieldByName(TEditLabel(TWinControl(Container.Controls[i]))._Campo).Text,11,'0');

            CNPJ: TEditLabel(TWinControl(Container.Controls[i])).Text := LPAD(DataSource.DataSet.FieldByName(TEditLabel(TWinControl(Container.Controls[i]))._Campo).Text,14,'0');

          else
            TEditLabel(TWinControl(Container.Controls[i])).Text := DataSource.DataSet.FieldByName(TEditLabel(TWinControl(Container.Controls[i]))._Campo).Text
          end;
        end;
      end;
    end;
  end;

  {for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TPanel then
    begin
      if TPanel(Components[i]).Name <> 'pnl1' then
      begin
        for k := 0 to TPanel(Components[i]).ControlCount - 1 do
        begin

          if TPanel(Components[i]).Controls[k] is TComboBoxTag then
            TComboBoxTag(TPanel(Components[i]).Controls[k]).ItemIndex := TComboBoxTag(TPanel(Components[i]).Controls[k]).BoundIndex(DataSource.DataSet.FieldByName(TComboBoxTag(TPanel(Components[i]).Controls[k])._Campo).Text)
          else if TPanel(Components[i]).Controls[k] is TCheckBoxTag then
            TCheckBoxTag(TPanel(Components[i]).Controls[k]).Checked := (TCheckBoxTag(TPanel(Components[i]).Controls[k])._Valor = DataSource.DataSet.FieldByName(TCheckBoxTag(TPanel(Components[i]).Controls[k])._Campo).AsString)
          else if TPanel(Components[i]).Controls[k] is TMemoTag then
            TMemoTag(TPanel(Components[i]).Controls[k]).Text := DataSource.DataSet.FieldByName(TMemoTag(TPanel(Components[i]).Controls[k])._Campo).AsString
          else if TPanel(Components[i]).Controls[k] is TEditLabel then
          begin
            if Trim(TEditLabel(TPanel(Components[i]).Controls[k])._Campo) <> '' then
            begin
              case TEditLabel(TPanel(Components[i]).Controls[k])._Tipo of

                Data:
                begin
                  if DataSource.DataSet.FieldByName(TEditLabel(TPanel(Components[i]).Controls[k])._Campo).Asstring <> '' then
                    TEditLabel(TPanel(Components[i]).Controls[k]).Text := DateTostr(DataSource.DataSet.FieldByName(TEditLabel(TPanel(Components[i]).Controls[k])._Campo).AsDateTime,FormatSettings);
                end;
                Data_Hora:
                begin
                  if DataSource.DataSet.FieldByName(TEditLabel(TPanel(Components[i]).Controls[k])._Campo).Asstring <> '' then
                    TEditLabel(TPanel(Components[i]).Controls[k]).Text := DateTimeToStr(DataSource.DataSet.FieldByName(TEditLabel(TPanel(Components[i]).Controls[k])._Campo).AsDateTime,FormatSettings);
                end;

                CPF: TEditLabel(TPanel(Components[i]).Controls[k]).Text := LPAD(DataSource.DataSet.FieldByName(TEditLabel(TPanel(Components[i]).Controls[k])._Campo).Text,11,'0');

                CNPJ: TEditLabel(TPanel(Components[i]).Controls[k]).Text := LPAD(DataSource.DataSet.FieldByName(TEditLabel(TPanel(Components[i]).Controls[k])._Campo).Text,14,'0');

              else
                TEditLabel(TPanel(Components[i]).Controls[k]).Text := DataSource.DataSet.FieldByName(TEditLabel(TPanel(Components[i]).Controls[k])._Campo).Text
              end;
            end;
          end

          else if TPanel(Components[i]).Controls[k] is TGroupBox then
          begin
            for j := 0 to TGroupBox(TPanel(Components[i]).Controls[k]).ControlCount - 1 do
            begin
              if TGroupBox(TPanel(Components[i]).Controls[k]).Controls[j] is TComboBoxTag then
                TComboBoxTag(TGroupBox(TPanel(Components[i]).Controls[k]).Controls[j]).ItemIndex := TComboBoxTag(TGroupBox(TPanel(Components[i]).Controls[k]).Controls[j]).BoundIndex(DataSource.DataSet.FieldByName(TComboBoxTag(TGroupBox(TPanel(Components[i]).Controls[k]).Controls[j])._Campo).Text)
              else if TGroupBox(TPanel(Components[i]).Controls[k]).Controls[j] is TCheckBoxTag then
                TCheckBoxTag(TGroupBox(TPanel(Components[i]).Controls[k]).Controls[j]).Checked := (TCheckBoxTag(TGroupBox(TPanel(Components[i]).Controls[k]).Controls[j])._Valor = DataSource.DataSet.FieldByName(TCheckBoxTag(TGroupBox(TPanel(Components[i]).Controls[k]).Controls[j])._Campo).AsString)
              else if TMemoTag(TPanel(Components[i]).Controls[k]).Controls[j] is TMemoTag then
                TMemoTag(TGroupBox(TPanel(Components[i]).Controls[k]).Controls[j]).Text := DataSource.DataSet.FieldByName(TMemoTag(TGroupBox(TPanel(Components[i]).Controls[k]).Controls[j])._Campo).AsString
              else if TGroupBox(TPanel(Components[i]).Controls[k]).Controls[j] is TEditLabel then
              begin
                if Trim(TEditLabel(TGroupBox(TPanel(Components[i]).Controls[k]).Controls[j])._Campo) <> '' then
                begin
                  case TEditLabel(TGroupBox(TPanel(Components[i]).Controls[k]).Controls[j])._Tipo of

                    Data:
                    begin
                      if DataSource.DataSet.FieldByName(TEditLabel(TGroupBox(TPanel(Components[i]).Controls[k]).Controls[j])._Campo).Asstring <> '' then
                        TEditLabel(TGroupBox(TPanel(Components[i]).Controls[k]).Controls[j]).Text := DateToStr(DataSource.DataSet.FieldByName(TEditLabel(TGroupBox(TPanel(Components[i]).Controls[k]).Controls[j])._Campo).AsDateTime,FormatSettings);
                    end;

                    Data_Hora:
                    begin
                      if DataSource.DataSet.FieldByName(TEditLabel(TPanel(Components[i]).Controls[k])._Campo).Asstring <> '' then
                        TEditLabel(TGroupBox(TPanel(Components[i]).Controls[k]).Controls[j]).Text := DateTimeToStr(DataSource.DataSet.FieldByName(TEditLabel(TGroupBox(TPanel(Components[i]).Controls[k]).Controls[j])._Campo).AsDateTime,FormatSettings);
                    end;

                    CPF: TEditLabel(TPanel(Components[i]).Controls[k]).Text := LPAD(DataSource.DataSet.FieldByName(TEditLabel(TPanel(Components[i]).Controls[k])._Campo).Text,11,'0');

                    CNPJ: TEditLabel(TPanel(Components[i]).Controls[k]).Text := LPAD(DataSource.DataSet.FieldByName(TEditLabel(TPanel(Components[i]).Controls[k])._Campo).Text,14,'0');

                  else
                    TEditLabel(TGroupBox(TPanel(Components[i]).Controls[k]).Controls[j]).Text := DataSource.DataSet.FieldByName(TEditLabel(TGroupBox(TPanel(Components[i]).Controls[k]).Controls[j])._Campo).Text
                  end;
                end;
              end
              else if TGroupBox(TPanel(Components[i]).Controls[k]).Controls[j] is TRadioButtonTag then
                TRadioButtonTag(TGroupBox(TPanel(Components[i]).Controls[k]).Controls[j]).Checked := DataSource.DataSet.FieldByName(TRadioButtonTag(TGroupBox(TPanel(Components[i]).Controls[k]).Controls[j])._Campo).Text = TRadioButtonTag(TGroupBox(TPanel(Components[i]).Controls[k]).Controls[j])._Valor;
            end;
          end
          else if TPanel(Components[i]).Controls[k] is TCheckBoxTag then
            TCheckBoxTag(TPanel(Components[i]).Controls[k]).Checked := DataSource.DataSet.FieldByName(TCheckBoxTag(TPanel(Components[i]).Controls[k])._Campo).Text = 'S'
        end;
      end;
    end;
  end;}
  ValidaCamposPesquisa;
end;

function Tfrm.MontaSqlTela: string;

var str: string;

begin
  str := MontaWhereChave(pnl1);
  Result := 'Select * From ' + Tabela + str;
end;

function Tfrm.VerificaNotNull(Chave: boolean): boolean;

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
        if (TEditLabel(pnl1.Controls[i])._NotNull) and (trim(TEditLabel(pnl1.Controls[i]).FormattedText) = '') then
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
              if (TEditLabel(TPanel(Components[j]).Controls[i])._NotNull) and (trim(TEditLabel(TPanel(Components[j]).Controls[i]).FormattedText) = '') then
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

function Tfrm.MontaWhereChave(Container: TWinControl): string;

var i       : integer;
    str     : string;
    arrAux  : TStringList;
    arrCampo: TStringList;
    arrValor: TStringList;
    cFlg    : Char;

begin
  arrCampo := TStringList.Create;
  arrValor := TStringList.Create;
  for i := 0 to Container.ControlCount - 1 do
  begin
    str := Container.Controls[i].Name;
    if Container.Controls[i] is TEdit then
    begin
      arrAux := Split(TEdit(Container.Controls[i]).HelpKeyword,';');
      if Trim(TEdit(Container.Controls[i]).HelpKeyword) <> '' then
      begin
        arrCampo.Add(ArrAux.Strings[0]);
        arrValor.Add(FormataBD(TEdit(Container.Controls[i]).text,arrAux.Strings[1]));
      end;
    end

    else if Container.Controls[i] is TComboBoxTag then
    begin
      arrCampo.Add(TComboBoxTag(Container.Controls[i])._Campo);
      case TComboBoxTag(Container.Controls[i])._Tipo of
        tpChar: arrValor.Add(FormataBD(TStringList(TComboBoxTag(Container.Controls[i]).Items.Objects[TComboBoxTag(Container.Controls[i]).ItemIndex])[0],'C'));
        tpNumero: arrValor.Add(FormataBD(TStringList(TComboBoxTag(Container.Controls[i]).Items.Objects[TComboBoxTag(Container.Controls[i]).ItemIndex])[0],'N'));
      end;
    end

    else if Container.Controls[i] is TEditLabel then
    begin
      if Trim(TEditLabel(Container.Controls[i])._Campo) <> EmptyStr then
      begin
        arrCampo.Add(TEditLabel(Container.Controls[i])._Campo);

        case TEditLabel(Container.Controls[i])._Tipo of

          Numero,CPF,CNPJ: arrValor.Add(FormataBD(TEdit(Container.Controls[i]).text,'N'));

          Data  : arrValor.Add(FormataBD(TEdit(Container.Controls[i]).text,'D'));

          Texto : arrValor.Add(FormataBD(TEdit(Container.Controls[i]).text,'C'));

          Pesquisa:
          begin
            if TEditLabel(Container.Controls[i])._IsChar then
              arrValor.Add(FormataBD(TEdit(Container.Controls[i]).text,'C'))
            else
              arrValor.Add(FormataBD(TEdit(Container.Controls[i]).text,'N'));
          end;
        end;
      end;
    end

    else if Container.Controls[i] is TCheckBoxTag then
    begin

      arrCampo.Add(TCheckBoxTag(Container.Controls[i])._Campo);

      if TCheckBoxTag(Container.Controls[i]).Checked then
        cFlg := 'S'
      else
        cFlg := 'N';

      case TCheckBoxTag(Container.Controls[i])._Tipo of
        tpChar: arrValor.Add(FormataBD(cFlg,'C'));
        tpNumero: arrValor.Add(FormataBD(cFlg,'N'));
      end;
    end
    
    else if Container.Controls[i] is TGroupBox then
      ValorCampoContainer(TGroupBox(Container.Controls[i]),arrCampo,arrValor)
  end;

  if arrCampo.Count > 0 then
    str := ' Where ';

  for i := 0 to arrCampo.Count - 1 do
    str := str + arrCampo.Strings[i]+'='+arrValor.Strings[i]+' And ' ;

  str := Copy(str,1,Length(str)-5);

  result := str;
end;

procedure Tfrm.ValorCampoContainer(Container: TWinControl; var arrCampo, arrValor: TStringList);

var i     : integer;

begin
  for i := 0 to Container.ControlCount - 1 do
  begin
    if Container.Controls[i] is TRadioButtonTag then
    begin
      if (TRadioButtonTag(Container.Controls[i]).Checked) and
         (TRadioButtonTag(Container.Controls[i])._Campo <> EmptyStr) then
      begin
        arrCampo.Add(TRadioButtonTag(Container.Controls[i])._Campo);
        case TRadioButtonTag(Container.Controls[i])._Tipo of
          tpChar: arrValor.Add(FormataBD(TRadioButtonTag(Container.Controls[i])._Valor,'C'));
          tpNumero: arrValor.Add(FormataBD(TRadioButtonTag(Container.Controls[i])._Valor,'N'));
        end;
      end;
    end;
  end;
end;

procedure Tfrm.VarreTela(var arrCampo, arrValor: TStringList; Update: boolean);

var i     : integer;
    arrAux: TStringList;
    cFlag : String;

begin
  arrCampo := TStringList.Create;
  arrValor := TStringList.Create;
  for i := 0 to ComponentCount - 1 do
  begin

    if Components[i] is TEdit then
    begin
      arrAux := Split(TEdit(Components[i]).HelpKeyword,';');
      if Trim(TEdit(Components[i]).HelpKeyword) <> '' then
      begin
        arrCampo.Add(ArrAux.Strings[0]);
        arrValor.Add(FormataBD(TEdit(Components[i]).text,arrAux.Strings[1]));
      end;
    end

    else if Components[i] is TComboBoxTag then
    begin
      if TComboBoxTag(Components[i])._Campo <> '' then
      begin
        arrCampo.Add(TComboBoxTag(Components[i])._Campo);
        case TComboBoxTag(Components[i])._Tipo of
          tpChar: arrValor.Add(FormataBD(TComboBoxTag(Components[i]).BoundText,'C'));
          tpNumero: arrValor.Add(FormataBD(TComboBoxTag(Components[i]).BoundText,'N'));
        end;
      end;
    end

    else if Components[i] is TMemoTag then
    begin
      if TMemoTag(Components[i])._Campo <> '' then
      begin
        if TMemoTag(Components[i]).Text <> '' then
        begin
          arrCampo.Add(TMemoTag(Components[i])._Campo);
          arrValor.Add(FormataBD(TMemoTag(Components[i]).Text,'C'));
        end
        else if Update then
        begin
          arrCampo.Add(TMemoTag(Components[i])._Campo);
          arrValor.Add('NULL');
        end;
      end;
    end

    else if Components[i] is TEditLabel then
    begin
      if Trim(TEditLabel(Components[i])._Campo) <> '' then
      begin
        if TEditLabel(Components[i]).Text <> '' then
        begin
          arrCampo.Add(TEditLabel(Components[i])._Campo);

          case TEditLabel(Components[i])._Tipo of

            Numero,CPF,CNPJ,CNPJ_CPF,CEP,FONE,FoneSemDDD,Num_Decimal: arrValor.Add(FormataBD(TEditLabel(Components[i]).text,'N'));

            Data,Data_Hora : arrValor.Add(FormataBD(TEditLabel(Components[i]).text,'D'));

            Texto : arrValor.Add(FormataBD(TEditLabel(Components[i]).text,'C'));

            Pesquisa:
            begin
              if TEditLabel(Components[i])._IsChar then
                arrValor.Add(FormataBD(TEditLabel(Components[i]).text,'C'))
              else
                arrValor.Add(FormataBD(TEditLabel(Components[i]).text,'N'));
            end;
          end;
        end
        else if Update then
        begin
          arrCampo.Add(TEditLabel(Components[i])._Campo);
          arrValor.Add('NULL');
        end;
      end;
    end

    else if Components[i] is TGroupBox then
      ValorCampoContainer(TGroupBox(Components[i]),arrCampo,arrValor)

    else if (Components[i] is TCheckBoxTag) and
            (Trim(TCheckBoxTag(Components[i])._Campo) <> EmptyStr) then
    begin
      arrCampo.Add(TCheckBoxTag(Components[i])._Campo);
      if TCheckBoxTag(Components[i]).Checked then
        cFlag := 'S'
      else
        cFlag := 'N';

      case TCheckBoxTag(Components[i])._Tipo of
        tpChar: arrValor.Add(FormataBD(cFlag,'C'));
        tpNumero: arrValor.Add(FormataBD(cFlag,'N'));
      end;
    end
  end;
end;

function Tfrm.FormataBD(strValor: String; Tipo: String): String;

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
procedure Tfrm.LimpaCampos;

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
    else if Components[i] is TRadioButtonTag then
        TRadioButtonTag(Components[i]).Checked := TRadioButtonTag(Components[i])._Default;
  end;
  txtHabilitaEdicao.Enabled := true;
  DisablePanel(True);

  Tab.TabIndex := 0;
  pnl1.SetFocus;
  btnInclui.Enabled := false;
  btnaltera.Enabled := false;
  btnExclui.Enabled := false;
  btnLocaliza.Enabled := true;
  PrencheEmpresa;
  keybd_event(VK_TAB,0,0,0);
end;

function Tfrm.MontaSql(Tipo: TMontaSql): String;

var str     : string;
    arrCampo: TStringList;
    arrValor: TStringList;
    i       : integer;
    strWhere: string;
begin
  if not(VerificaNotNull(false)) then
    exit;
  Result := '';

  VarreTela(arrCampo,arrValor,Tipo = tpUpdate);

  if arrCampo.Count = 0 then
    exit;

  case Tipo of

    tpInsert:
    begin
      str := 'Insert into ' + Tabela+ '(' +
              arrCampo.CommaText +
              ') Values (';
              //arrValor.CommaText +')';
              for i := 0 to arrCampo.Count-1 do
              begin
                if arrValor.Strings[i] = '' then
                  arrValor.Strings[i] := 'Null';
                str := str+arrValor.Strings[i]+',';
              end;
              str := Copy(str,1,Length(str)-1) + ')';
    end;

    tpUpdate:
    begin
      str := 'Update '+Tabela+' Set ';
      strWhere := MontaWhereChave(pnl1);
      for i := 0 to arrCampo.Count-1 do
      begin
        if arrValor.Strings[i] = '' then
          arrValor.Strings[i] := 'Null';
        str := str+arrCampo.Strings[i]+'='+arrValor.Strings[i]+',';
      end;
      str := Copy(str,1,Length(str)-1);
      str := str + strWhere;
    end;

    tpDelete:
    begin
      str := 'Delete From '+Tabela;
      strWhere := MontaWhereChave(pnl1);
      str := str + strWhere;
    end;
  end;
  result := str;
end;

procedure Tfrm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);

 begin
  case key of
    VK_RETURN: keybd_event(VK_TAB,0,0,0);

    VK_ESCAPE: btnSairClick(Sender);

    VK_F5: btnIncluiClick(Sender);

    VK_F6: btnAlteraClick(Sender);

    VK_F7: btnExcluiClick(Sender);

    VK_F8: btnLocalizaClick(Sender);

  end;
end;

procedure Tfrm.FormClose(Sender: TObject; var Action: TCloseAction);
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

procedure Tfrm.btnIncluiClick(Sender: TObject);
var str: String;
begin
  if btnInclui.Enabled then
  begin
    str := MontaSql(tpInsert);
    GravaBanco(tpInsert,str);
  end;
end;

procedure Tfrm.FormCreate(Sender: TObject);

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
end;

procedure Tfrm.txtHabilitaEdicaoEnter(Sender: TObject);
begin
  HabilitaEdicao(true);
end;

procedure Tfrm.btnSairClick(Sender: TObject);
begin
  if not pnl1.Enabled then
  begin
    if Messagedlg('Cancelar?',mtConfirmation,[mbYes,mbNo],0) = MRYes then
      LimpaCampos;
  end
  else
    Close;
end;

procedure Tfrm.btnalteraClick(Sender: TObject);

var str: string;

begin
  if btnAltera.Enabled then
  begin
    str := MontaSql(tpUpdate);
    GravaBanco(tpUpdate,str)
  end;
end;

procedure Tfrm.btnExcluiClick(Sender: TObject);
var str:string;

begin
  if btnExclui.Enabled then
  begin
    str := MontaSql(tpDelete);
    GravaBanco(tpDelete,str);
  end;
end;

procedure Tfrm.ValidaCamposPesquisa;

var i: integer;

begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TEditLabel then
    begin
      if (TEditLabel(Components[i])._Tipo = Pesquisa) and (Assigned(TEditLabel(Components[i])._Edit)) then
      begin
        try
          TEditLabel(Components[i]).OnExit(TEditLabel(Components[i]));
        finally

        end;
      end;
    end;
  end;
end;

procedure Tfrm.DisablePanel(bln: Boolean);

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

procedure Tfrm.PrencheEmpresa;

var i: integer;

begin
  for i := 0 to pnl1.ControlCount - 1 do
  begin
    if pnl1.Controls[i] is TEditLabel then
    begin
      if (TEditLabel(pnl1.Controls[i])._Campo = 'COD_EMPRESA') And (FTabela <> 'CAD_EMPRESA') And
         (GLOintCodEmpresa > 0) then
        TEditLabel(pnl1.Controls[i]).Text := IntToStr(GLOintCodEmpresa);
      if (TEditLabel(pnl1.Controls[i])._Campo = 'COD_FILIAL') And (FTabela <> 'CAD_FILIAL')And
         (GLOintCodFilial > 0) then
        TEditLabel(pnl1.Controls[i]).Text := IntToStr(GLOintCodFilial);
    end;
  end;
end;

procedure Tfrm.btnLocalizaClick(Sender: TObject);

var Localizar: TLocalizar;

begin
  if btnLocaliza.Enabled then
  begin
    Localizar := TLocalizar.Create;
    Localizar.Formulario := Self;
    Localizar.Execute;
    Localizar.Free;
  end;
end;

function Tfrm.ProximoNumero(var controle: TEditLabel): string;
var
  str: string;
  ds: TDataSource;
begin
  if Trim(controle.Text) = EmptyStr then
  begin
    str := 'Select Max('+ controle._Campo +') + 1 '+controle._Campo+' From '+Tabela;
    if cnn.ExecuteQuery(str,ds) then
    begin
      if trim(ds.DataSet.Fields[0].AsString) = EmptyStr then
        controle.Text := '1'
      else
        controle.Text := ds.DataSet.Fields[0].AsString;

      controle.SelectAll;
    end
    else
      controle.Text := '1'
  end;
end;

end.
