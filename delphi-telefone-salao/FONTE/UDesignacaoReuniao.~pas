unit UDesignacaoReuniao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, ExtCtrls, Mask, EditLabel,
  UComponentTag, UConexao, ImgList, Menus;

type
  TTipoNo = (tpDATA_REUNIAO,tpPARTE,tpSALA,tpPUBLICO,tpPONTO,tpAJUDANTE);

  TIdNo = record
    Nivel: Byte;
    TipoNo: TTipoNo;
    Codigo: string;
    CodTpReuniao: string;
    ObsDes: string;
    Obs: string;
  end;

  PTIdNo = ^TIdNo;

  TIdDesignacao = record
    CodPublico: string;
    NomPublico: string;
    CodPonto: string;
    NomPonto: string;
    CodAjudante: string;
    NomAjudante: string;
  end;

  TfrmDesignacaoReuniao = class(TForm)
    pnl3: TPanel;
    btnInclui: TBitBtn;
    btnaltera: TBitBtn;
    btnExclui: TBitBtn;
    btnLocaliza: TBitBtn;
    tab: TPageControl;
    tabCadastro: TTabSheet;
    pnl1: TPanel;
    pnl2: TPanel;
    txtHabilitaEdicao: TEdit;
    edtDAT_SEMANA: TEditLabel;
    edtDAT_REUNIAO: TEditLabel;
    GroupBox1: TGroupBox;
    trv: TTreeView;
    cboMes: TComboBoxTag;
    edtAno: TEditLabel;
    UpDownAno: TUpDown;
    chkExibirTodas: TCheckBox;
    lblDiaSemana: TLabel;
    imgList: TImageList;
    tabDesignacao: TPageControl;
    tabPublico: TTabSheet;
    tabPonto: TTabSheet;
    tabAjudante: TTabSheet;
    lvw: TListView;
    cboSexo: TComboBox;
    lvwPonto: TListView;
    TabSheet1: TTabSheet;
    tabResumo: TTabSheet;
    lvwAjudante: TListView;
    lblPublicoSel: TLabel;
    memObsDesignacao: TMemo;
    Label1: TLabel;
    memObs: TMemo;
    Label2: TLabel;
    lvwResumo: TListView;
    btnConfirmar: TBitBtn;
    chkParteSelecionada: TCheckBox;
    optAjudante: TRadioGroup;
    popMenu: TPopupMenu;
    mnuImprimirSemana: TMenuItem;
    popMenuImpDes: TPopupMenu;
    mnuImpDesignacao: TMenuItem;
    btnImprimeMes: TButton;
    btnSair: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure trvChange(Sender: TObject; Node: TTreeNode);
    procedure txtCodTpReuniaoClickButton(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure chkExibirTodasClick(Sender: TObject);
    procedure cboMesChange(Sender: TObject);
    procedure edtAnoChange(Sender: TObject);
    procedure edtDAT_SEMANAExit(Sender: TObject);
    procedure edtDAT_REUNIAOChange(Sender: TObject);
    procedure cboSexoChange(Sender: TObject);
    procedure lvwChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure tabDesignacaoChange(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure trvKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure chkParteSelecionadaClick(Sender: TObject);
    procedure optAjudanteClick(Sender: TObject);
    procedure trvMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure mnuImprimirSemanaClick(Sender: TObject);
    procedure mnuImpDesignacaoClick(Sender: TObject);
    procedure btnImprimeMesClick(Sender: TObject);
  private
    procedure WMMove(var msg: TWMMove); message WM_MOVE;
    function PesquisaNova(Sender: TObject;
        blnValida: boolean): boolean;
    procedure CarregaTreeView;
    procedure SugereDiaReuniao;
    procedure CarregaPublico;
    procedure SelecionaValores;
    procedure CarregaPonto;
    procedure CarregaAjudante;
    function MostraPonto: boolean;
    function MostraAjudante: boolean;
    procedure InsereNoDesignacao(IdDes: TIdDesignacao);
    procedure ExcluiNoDesignacao;
  public
    { Public declarations }
  end;

var
  frmDesignacaoReuniao: TfrmDesignacaoReuniao;
  cnn: TConexao;

implementation

uses UGlobal, DB, UPesquisa, Functions, StrUtils, UdmRelatorio, Printers;
{$R *.dfm}

procedure TfrmDesignacaoReuniao.FormCreate(Sender: TObject);
var Ano,Mes,Dia: Word;
begin
  Left:=0;
  Top:=0;
  cnn := TConexao.Create(GloStrUser,GloStrPassword,GloStrDatabase,GloStrServer,GloBlnEmbedded);

  cboMes.Items.Add('Janeiro');
  cboMes.Items.Add('Fevereiro');
  cboMes.Items.Add('Março');
  cboMes.Items.Add('Abril');
  cboMes.Items.Add('Maio');
  cboMes.Items.Add('Junho');
  cboMes.Items.Add('Julho');
  cboMes.Items.Add('Agosto');
  cboMes.Items.Add('Setembro');
  cboMes.Items.Add('Outubro');
  cboMes.Items.Add('Novembro');
  cboMes.Items.Add('Dezembro');
  DecodeDate(Date,Ano,Mes,Dia);
  cboMes.ItemIndex := Mes-1;
  UpDownAno.Position := Ano;
  tabPonto.TabVisible := false;
  tabAjudante.TabVisible := false;
  tabDesignacao.ActivePageIndex := 0;
  popMenu.AutoPopup := false;
end;

procedure TfrmDesignacaoReuniao.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmDesignacaoReuniao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmDesignacaoReuniao.WMMove(var msg: TWMMove);
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

procedure TfrmDesignacaoReuniao.trvChange(Sender: TObject;
  Node: TTreeNode);
var no: TTreeNode;
    str: string;
    ds: TDataSource;
begin
  no := Node;
  while Assigned(no.Parent) do
    no := no.Parent;
  if Assigned(no) then
  begin
    edtDAT_SEMANA.Text := no.Text;
    SugereDiaReuniao;
  end;
  tabDesignacao.ActivePage := tabPublico;
  cboSexo.Items.Clear;
  lvw.Items.Clear;
  lvwPonto.Items.Clear;
  lvwAjudante.Items.Clear;
  lvwResumo.Items.Clear;
  if not Assigned(Node.Data) then
  begin
    tabPonto.TabVisible := false;
    tabAjudante.TabVisible := false;
    Exit;
  end;  
  if PTIdNo(Node.Data).TipoNo = tpPUBLICO then
  begin
    str :=  'Select '+
            '  A.FLG_SEXO FLG_SEXO_PARTE,'+
            '  B.FLG_SEXO FLG_SEXO_PROGRAMA'+
            ' From '+
            '  CAD_TP_PARTE A,'+
            '  CAD_PROGRAMA B'+
            ' Where '+
            '  A.COD_TP_PARTE = B.COD_TP_PARTE And '+
            '  B.DAT_SEMANA = '+ cnn.To_Date(Node.Parent.Parent.Parent.Text)+' And '+
            '  A.COD_TP_PARTE = '+ PTIdNo(Node.Parent.Parent.Data).Codigo;

    cnn.Open;
    if cnn.ExecuteQuery(str,ds) then
    begin
      if (ds.DataSet.Fields[0].AsString = 'M') or
         (ds.DataSet.Fields[1].AsString = 'M') then
      begin
        cboSexo.Items.Add('Masculino');
        cboSexo.ItemIndex := 0;
      end
      else if (ds.DataSet.Fields[0].AsString = 'F') or
              (ds.DataSet.Fields[1].AsString = 'F') then
      begin
        cboSexo.Items.Add('Feminino');
        cboSexo.ItemIndex := 0;
      end
      else
      begin
        cboSexo.Items.Add('Masculino');
        cboSexo.Items.Add('Feminino');
        cboSexo.ItemIndex := 0;
      end;
    end;
    cnn.Close;
    CarregaPublico;
  end;

  MostraPonto;
  MostraAjudante;
  SelecionaValores;
end;

function TfrmDesignacaoReuniao.PesquisaNova(Sender: TObject;
  blnValida: boolean): boolean;
var Edt      : TEditlabel;
    EdtN     : TEdit;
    Pesquisa : TPesquisa;
    str      : array[0..2] of string;

begin
  Edt := Sender as TEditLabel;
  EdtN:= Edt._Edit;

  if (Edt._Campo = 'COD_TP_REUNIAO') then
  begin
    str[0] := 'COD_TP_REUNIAO,NOM_TP_REUNIAO';
    str[1] := 'CAD_TP_REUNIAO';
    str[2] := EmptyStr;
  end
  else
    Exit;

  Pesquisa := TPesquisa.Create;
  Result := Pesquisa.ExecutaPesquisa(blnValida,str[0],str[1],Edt,EdtN,str[2]);
  Pesquisa.Free;
end;

procedure TfrmDesignacaoReuniao.txtCodTpReuniaoClickButton(
  Sender: TObject);
begin
  PesquisaNova(Sender,false);
end;

procedure TfrmDesignacaoReuniao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case key of
    VK_RETURN: keybd_event(VK_TAB,0,0,0);

    VK_ESCAPE: btnSairClick(Sender);
  end;
end;

procedure TfrmDesignacaoReuniao.CarregaTreeView;
var str, str1: string;
    data: TDateTime;
    ds,dsSala, dsDes: TDataSource;
    node, node1, noSala, noPublico: TTreeNode;
    PIdNo: PTIdNo;
    blnAchou: boolean;

begin
  trv.Items.Clear;
  PIdNo := nil;
  cnn.Open;
  str :=  'Select '+
          '  A.DAT_SEMANA, '+
          '  B.COD_TP_PARTE, '+
          '  B.NOM_TP_PARTE, '+
          '  A.NOM_PARTE, '+
          '  A.NOM_MATERIA,'+
          '  A.COD_TP_REUNIAO,'+
          '  C.NOM_TP_REUNIAO'+
          ' From '+
          '  CAD_PROGRAMA A,'+
          '  CAD_TP_PARTE B, '+
          '  CAD_TP_REUNIAO C'+
          ' Where '+
          '  A.COD_TP_PARTE = B.COD_TP_PARTE And '+
          '  A.COD_TP_REUNIAO = C.COD_TP_REUNIAO ';
  if not chkExibirTodas.Checked then
  begin
    if (cboMes.ItemIndex > -1) and (Trim(edtAno.Text) <> EmptyStr) then
    begin
      str := str + ' And DAT_SEMANA Containing ' +
      cnn.Aspas(RPad(edtAno.Text,4,'0')+'-'+LPad(IntToStr(cboMes.ItemIndex+1),2,'0'));
    end;
  end;

  str := str + '  Order By A.DAT_SEMANA, A.COD_TP_REUNIAO, A.NUM_ORDEM';

  if cnn.ExecuteQuery(str,ds) then
  begin
    str :=  'Select '+
            '  A.COD_TP_PARTE,'+
            '  A.COD_SALA,'+
            '  B.NOM_SALA,'+
            '  B.FLG_ATIVO' +
            ' From '+
            '  CAD_PARTE_SALA A,'+
            '  CAD_SALA B'+
            ' Where '+
            '  A.COD_SALA = B.COD_SALA '+
            //'  B.FLG_ATIVO = '+cnn.Aspas('S')+
            ' Order By A.COD_SALA';

    cnn.ExecuteQuery(str,dsSala);
    // SELECIONAR AS DESIGNACOES FEITAS
    str :=  'Select '+
            '  A.DAT_SEMANA,'+
            '  A.COD_TP_REUNIAO,'+
            '  A.COD_TP_PARTE,'+
            '  A.COD_SALA,'+
            '  A.COD_PUBLICO,'+
            '  B.NOM_PUBLICO,'+
            '  A.COD_PUB_AJU,'+
            '  C.NOM_PUBLICO NOM_PUB_AJU,'+
            '  A.COD_PONTO,'+
            '  D.NOM_PONTO,'+
            '  A.DSC_OBS_DESIGNACAO,'+
            '  A.DSC_OBSERVACAO '+
            ' From '+
            ' MOV_REUNIAO A'+
            '   Left Outer Join CAD_PUBLICO C On'+
            '     A.COD_PUB_AJU = C.COD_PUBLICO'+
            '   Left Outer Join CAD_PONTO D On'+
            '     A.COD_PONTO = D.COD_PONTO,'+
            '    CAD_PUBLICO B'+
            ' Where '+
            '  A.COD_PUBLICO = B.COD_PUBLICO';

    if not chkExibirTodas.Checked then
    begin
      if (cboMes.ItemIndex > -1) and (Trim(edtAno.Text) <> EmptyStr) then
      begin
        str := str + ' And A.DAT_SEMANA Containing ' +
        cnn.Aspas(RPad(edtAno.Text,4,'0')+'-'+LPad(IntToStr(cboMes.ItemIndex+1),2,'0'));
      end;
    end;

    cnn.ExecuteQuery(str,dsDes);

    while not ds.DataSet.Eof do
    begin
      if str <> ds.DataSet.FieldByName('DAT_SEMANA').AsString+'-'+
                ds.DataSet.FieldByName('COD_TP_REUNIAO').AsString then
      begin
        // PONTEIRO PARA A IDENTIFICACAO DO NO
        New(PIdNo);
        PIdNo.Nivel := 1;
        PIdNo.TipoNo := tpDATA_REUNIAO;
        PIdNo.CodTpReuniao := ds.DataSet.FieldByName('COD_TP_REUNIAO').AsString;
        PIdNo.Codigo := ds.DataSet.FieldByName('DAT_SEMANA').AsString;


        node := trv.Items.AddObject(nil,
          ds.DataSet.FieldByName('DAT_SEMANA').AsString+' - '+
          ds.DataSet.FieldByName('NOM_TP_REUNIAO').AsString,PIdNo);
        node.StateIndex := 1;
      end;
      // ADICIONANDO PARTES
      // PONTEIRO PARA A IDENTIFICACAO DO NO
      New(PIdNo);
      PIdNo.Nivel := 2;
      PIdNo.TipoNo := tpPARTE;
      PIdNo.Codigo := ds.DataSet.FieldByName('COD_TP_PARTE').AsString;
      node1 := trv.Items.AddChildObject(node,ds.DataSet.FieldByName('NOM_TP_PARTE').AsString,PIdNo);
      node1.StateIndex := 3;
      if not ds.DataSet.FieldByName('NOM_PARTE').IsNull then
        trv.Items.AddChild(node1,'Tema: '+ds.DataSet.FieldByName('NOM_PARTE').AsString);
      if not ds.DataSet.FieldByName('NOM_MATERIA').IsNull then
        trv.Items.AddChild(node1,'Matéria: '+ds.DataSet.FieldByName('NOM_MATERIA').AsString);
      str := ds.DataSet.FieldByName('DAT_SEMANA').AsString+'-'+
             ds.DataSet.FieldByName('COD_TP_REUNIAO').AsString;
      //ADICIONANDO SALAS
      dsSala.DataSet.First;
      while not dsSala.DataSet.Eof do
      begin
        if dsSala.DataSet.FieldByName('COD_TP_PARTE').Text =
           ds.DataSet.FieldByName('COD_TP_PARTE').Text then
        begin
          new(PIdNo);
          PIdNo^.Nivel := 3;
          PIdNo^.TipoNo := tpSALA;
          PIdNo^.Codigo := dsSala.DataSet.FieldByName('COD_SALA').AsString;
          noSala := trv.Items.AddChildObject(node1,dsSala.DataSet.FieldByName('NOM_SALA').AsString,PIdNo);
          //ADICIONANDO DESIGNACAO
          blnAchou := false;
          dsDes.DataSet.First;
          while not dsDes.DataSet.Eof do
          begin
            if (dsDes.DataSet.FieldByName('DAT_SEMANA').AsString = ds.DataSet.FieldByName('DAT_SEMANA').AsString) and
               (dsDes.DataSet.FieldByName('COD_TP_REUNIAO').AsString = ds.DataSet.FieldByName('COD_TP_REUNIAO').AsString) and
               (dsDes.DataSet.FieldByName('COD_TP_PARTE').AsString = dsSala.DataSet.FieldByName('COD_TP_PARTE').AsString) and
               (dsDes.DataSet.FieldByName('COD_SALA').AsString = dsSala.DataSet.FieldByName('COD_SALA').AsString) then
            begin
              blnAchou := true;
              // PUBLICO
              new(PIdNo);
              PIdNo^.Nivel := 4;
              PIdNo^.TipoNo := tpPUBLICO;
              PIdNo^.ObsDes := dsDes.DataSet.FieldByName('DSC_OBS_DESIGNACAO').AsString;
              PIdNo^.Obs := dsDes.DataSet.FieldByName('DSC_OBSERVACAO').AsString;

              PIdNo^.Codigo := dsDes.DataSet.FieldByName('COD_PUBLICO').AsString;
              noPublico := trv.Items.AddChildObject(noSala,'Designado(a): '+dsDes.DataSet.FieldByName('NOM_PUBLICO').AsString,PIdNo);
              noPublico.StateIndex := 2;
              //PONTO
              if not dsDes.DataSet.FieldByName('COD_PONTO').IsNull then
              begin
                new(PIdNo);
                PIdNo^.Nivel := 4;
                PIdNo^.TipoNo := tpPONTO;
                PIdNo^.Codigo := dsDes.DataSet.FieldByName('COD_PONTO').AsString;
                trv.Items.AddChildObject(noSala,'Ponto: '+
                   dsDes.DataSet.FieldByName('COD_PONTO').AsString+' - '+
                   dsDes.DataSet.FieldByName('NOM_PONTO').AsString,PIdNo);
              end;
              //AJUDANTE
              if not dsDes.DataSet.FieldByName('COD_PUB_AJU').IsNull then
              begin
                new(PIdNo);
                PIdNo^.Nivel := 4;
                PIdNo^.TipoNo := tpAJUDANTE;
                PIdNo^.Codigo := dsDes.DataSet.FieldByName('COD_PUB_AJU').AsString;
                trv.Items.AddChildObject(noSala,'Ajudante: '+dsDes.DataSet.FieldByName('NOM_PUB_AJU').AsString,PIdNo);
              end;
            end;
            dsDes.DataSet.Next;
          end; //--fim while
          // SE NAO FOI ACHADO NENHUMA DESIGNACAO, ENTAO INSERE NO VAZIO
          if not blnAchou then
          begin
            if dsSala.DataSet.FieldByName('FLG_ATIVO').AsString = 'S' then
            begin
              new(PIdNo);
              PIdNo^.Nivel := 4;
              PIdNo^.TipoNo := tpPUBLICO;
              PIdNo^.Codigo := EmptyStr;
              noPublico := trv.Items.AddChildObject(noSala,'[...adicionar participante...]',PIdNo);
              noPublico.StateIndex := 2;
            end
            else
            begin
              noSala.Delete;
            end;
          end;
        end;
        dsSala.DataSet.Next;
      end;
      ds.DataSet.Next;
    end;
  end;
  cnn.Close;
end;

procedure TfrmDesignacaoReuniao.chkExibirTodasClick(Sender: TObject);
var Dia,Mes,Ano: Word;
begin
  if chkExibirTodas.Checked then
  begin
    cboMes.Enabled := false;
    edtAno.Enabled := false;
    cboMes.ItemIndex := -1;
    edtAno.Text := EmptyStr;
  end
  else
  begin
    cboMes.Enabled := true;
    edtAno.Enabled := true;
    DecodeDate(Date,Ano,Mes,Dia);
    cboMes.ItemIndex := Mes-1;
    edtAno.Text := IntToStr(Ano);
  end;
  CarregaTreeView;
end;

procedure TfrmDesignacaoReuniao.cboMesChange(Sender: TObject);
begin
  CarregaTreeView;
end;

procedure TfrmDesignacaoReuniao.edtAnoChange(Sender: TObject);
begin
  if (Length(edtAno.Text) = 4) then
    CarregaTreeView;
end;

procedure TfrmDesignacaoReuniao.SugereDiaReuniao;
var str, dia: string;
    ds: TDataSource;
    soma: Byte;
    no: TTreeNode;
begin
  if (not IsEmptyStr(StringReplace(edtDAT_SEMANA.Text,'/',EmptyStr,[rfReplaceAll]))) and
     (trv.Items.Count > 0 ) and
     Assigned(trv.Selected) then
  begin
    //RECEBENDO O NO SELECIONADO
    no := trv.Selected;
    //ENCONTRANDO O NO PAI (NO DA DATA DA SEMANA)
    while Assigned(no.Parent) do
      no := no.Parent;

    str := 'Select '+
           '  FLG_DIA_SEMANA '+
           ' From '+
           '  CAD_TP_REUNIAO '+
           ' Where '+
           '  COD_TP_REUNIAO = '+PTIdNo(no.Data).CodTpReuniao;
    cnn.Open;
    if cnn.ExecuteQuery(str,ds) then
    begin
      if ds.DataSet.Fields[0].AsString = 'SEG' then
      begin
        soma := 0;
        dia := 'Segunda-Feira';
      end
      else if ds.DataSet.Fields[0].AsString = 'TER' then
      begin
        soma := 1;
        dia := 'Terça-Feira';
      end
      else if ds.DataSet.Fields[0].AsString = 'QUA' then
      begin
        soma := 2;
        dia := 'Quarta-Feira';
      end
      else if ds.DataSet.Fields[0].AsString = 'QUI' then
      begin
        soma := 3;
        dia := 'Quinta-Feira';
      end
      else if ds.DataSet.Fields[0].AsString = 'SEX' then
      begin
        soma := 4;
        dia := 'Sexta-Feira';
      end
      else if ds.DataSet.Fields[0].AsString = 'SAB' then
      begin
        soma := 5;
        dia := 'Sábado';
      end
      else if ds.DataSet.Fields[0].AsString = 'DOM' then
      begin
        soma := 6;
        dia := 'Domingo';
      end;

      edtDAT_REUNIAO.Text := DateToStr(StrToDate(edtDAT_SEMANA.Text)+soma);
      lblDiaSemana.Caption := dia;
    end;
    cnn.Close;

  end;
end;

procedure TfrmDesignacaoReuniao.edtDAT_SEMANAExit(Sender: TObject);
begin
  SugereDiaReuniao;
end;

procedure TfrmDesignacaoReuniao.edtDAT_REUNIAOChange(Sender: TObject);
begin
  lblDiaSemana.Caption := EmptyStr;
end;

procedure TfrmDesignacaoReuniao.CarregaPublico;
var str, straux, straux2, strAju, strTipo: string;
    ds: TDataSource;
    item: TListItem;

begin
  lvw.Items.Clear;
  if Assigned(trv.Selected) then
  begin
    if (PTIdNo(trv.Selected.Data).TipoNo = tpPUBLICO) and
       (cboSexo.ItemIndex >= 0) then
    begin
      cnn.Open;
      straux := ' Select FLG_TIPO '+
                '   From CAD_TP_PARTE '+
                '   Where COD_TP_PARTE = '+ PTIdNo(trv.Selected.Parent.Parent.Data).Codigo;

      if cnn.ExecuteQuery(straux,ds) then
      begin
        strTipo := ds.DataSet.FieldByName('FLG_TIPO').AsString
      end;


      straux := '  (Select Max(X.DAT_REUNIAO) '+
                '     From MOV_REUNIAO X,'+
                '          CAD_TP_PARTE Y '+
                '     Where X.COD_PUBLICO = A.COD_PUBLICO And '+
                '           X.COD_TP_PARTE = Y.COD_TP_PARTE And '+
                '           Y.FLG_TIPO = ' + cnn.Aspas(strTipo);
                //'           Y.FLG_TIPO = ' + cnn.Aspas('I');

      if chkParteSelecionada.Checked then
      begin
        straux := straux + ' And X.COD_TP_PARTE = '+
                  PTIdNo(trv.Selected.Parent.Parent.Data).Codigo;
      end;
      straux := straux + ')';


      straux2:= '  (Select Max(Z.NOM_TP_PARTE||'+cnn.Aspas(' - Sala: ')+'||Y.COD_SALA) ' +
                '     From MOV_REUNIAO Y, ' +
                '          CAD_TP_PARTE Z ' +
                '     Where Y.COD_TP_PARTE = Z.COD_TP_PARTE And ' +
                '           Y.COD_PUBLICO = A.COD_PUBLICO And ' +
                '           Z.FLG_TIPO = '+ cnn.Aspas(strTipo) + ' And ' +
                '           Y.DAT_REUNIAO = (Select Max(X.DAT_REUNIAO) '+
                '                              From MOV_REUNIAO X, '+
                '                                   CAD_TP_PARTE Y '+
                '                              Where X.COD_PUBLICO = A.COD_PUBLICO And '+
                '                                    X.COD_TP_PARTE = Y.COD_TP_PARTE And '+
                '                                    Y.FLG_TIPO = '+ cnn.Aspas(strTipo);
                //'                                    Y.FLG_TIPO = '+ cnn.Aspas('I');

      if chkParteSelecionada.Checked then
      begin
        straux2 := straux2 + ' And X.COD_TP_PARTE = '+
                  PTIdNo(trv.Selected.Parent.Parent.Data).Codigo + ')';
        straux2 := straux2 + ' And Y.COD_TP_PARTE = '+
                  PTIdNo(trv.Selected.Parent.Parent.Data).Codigo + ')';

      end
      else
      begin
        straux2 := straux2 + '))';
      end;

      //DATA DA ÚLTIMA PARTE COMO AJUDANTE
      strAju := '  (Select Max(X.DAT_REUNIAO) From MOV_REUNIAO X'+
                '     Where X.COD_PUB_AJU = A.COD_PUBLICO)';

      str :=  'Select Distinct'+
              '  A.COD_PUBLICO,'+
              '  A.NOM_PUBLICO,'+
              straux + ' DAT_ULT_PARTE, '+
              straux2 + ' NOM_ULT_PARTE, '+
              strAju + ' DAT_ULT_AJU '+
              ' From '+
              '  CAD_PUBLICO A,'+
              '  CAD_PUBLICO_PARTE B'+
              ' Where '+
              '  A.COD_PUBLICO = B.COD_PUBLICO And '+
              '  A.FLG_ATIVO = '+cnn.Aspas('S');
        str := str + ' And B.COD_TP_PARTE = '+PTIdNo(trv.Selected.Parent.Parent.Data).Codigo;

      if UpperCase(cboSexo.Text) = 'MASCULINO' then
        str := str + ' And A.FLG_SEXO ='+cnn.Aspas('M')
      else if UpperCase(cboSexo.Text) = 'FEMININO' then
      begin
        str := str + ' And A.FLG_SEXO ='+cnn.Aspas('F');
        str := str + ' And A.FLG_MORADORA ='+cnn.Aspas('N');
      end;
      str := str +' Order By 3,2 ';

      if cnn.ExecuteQuery(str,ds) then
      begin
        while not ds.DataSet.Eof do
        begin
          item := lvw.Items.Add;
          item.Caption := ds.DataSet.FieldByName('NOM_PUBLICO').AsString;
          item.SubItems.Add(ds.DataSet.FieldByName('COD_PUBLICO').AsString);
          item.SubItems.Add(ds.DataSet.FieldByName('DAT_ULT_PARTE').AsString);
          item.SubItems.Add(trim(ds.DataSet.FieldByName('NOM_ULT_PARTE').AsString));
          item.SubItems.Add(ds.DataSet.FieldByName('DAT_ULT_AJU').AsString);
          ds.DataSet.Next;
        end;
      end;
      cnn.Close;
    end;

  end;
end;

procedure TfrmDesignacaoReuniao.cboSexoChange(Sender: TObject);
begin
  if cboSexo.ItemIndex >= 0 then
  begin
    CarregaPublico;
    if MostraPonto then
      CarregaPonto
    else
      tabPonto.TabVisible := false;

    if MostraAjudante then
      CarregaAjudante
    else
      tabAjudante.TabVisible := false;    
  end;
end;

procedure TfrmDesignacaoReuniao.CarregaPonto;
var str: string;
    ds: TDataSource;
    item: TListItem;
begin
  lvwPonto.Items.Clear;
  if not Assigned(lvw.Selected) then
  begin
    Exit;
  end;

  str :=  'Select '+
          '  Max(DAT_SEMANA) DAT_SEMANA'+
          ' From '+
          '  MOV_REUNIAO '+
          ' Where '+
         // '  COD_TP_PARTE = '+PTIdNo(trv.Selected.Parent.Parent.Data).Codigo+' And '+
          '  COD_PUBLICO = '+lvw.Selected.SubItems[0];
  cnn.Open;

  if cnn.ExecuteQuery(str,ds) and (not ds.DataSet.Fields[0].IsNull) then
  begin
    str :=  'Select '+
            '  A.DAT_SEMANA, '+
            '  A.DAT_REUNIAO,'+
            '  A.COD_PONTO,  '+
            '  B.NOM_PONTO,  '+
            '  A.FLG_CONCLUIU_PONTO,'+
            '  C.NOM_TP_PARTE' +
            ' From '+
            '  MOV_REUNIAO A,'+
            '  CAD_PONTO B,'+
            '  CAD_TP_PARTE C'+
            ' Where '+
            '  A.COD_PONTO = B.COD_PONTO And '+
            '  A.COD_TP_PARTE = C.COD_TP_PARTE And '+
            '  A.DAT_SEMANA = '+ cnn.To_Date(ds.DataSet.Fields[0].AsString)+' And '+
            '  A.COD_PUBLICO = '+lvw.Selected.SubItems[0];

    if cnn.ExecuteQuery(str,ds) then
    begin
      if ds.DataSet.FieldByName('FLG_CONCLUIU_PONTO').AsString = 'N' then
      begin
        item := lvwPonto.Items.Add;
        item.Caption := ds.DataSet.FieldByName('COD_PONTO').AsString;
        item.SubItems.Add(ds.DataSet.FieldByName('NOM_PONTO').AsString);
        item.SubItems.Add(EmptyStr);
        item.SubItems.Add(EmptyStr);
        item.SubItems.Add('Ponto não concluído na reunião da semana '+
                          ds.DataSet.FieldByName('DAT_SEMANA').AsString+
                          ' feita no dia '+ds.DataSet.FieldByName('DAT_REUNIAO').AsString);
        item.SubItems.Add(ds.DataSet.FieldByName('NOM_TP_PARTE').AsString);
        cnn.Close;
        Exit;
      end;
    end;
  end;

  str :=  'Select '+
          '  A.COD_PONTO,'+
          '  A.NOM_PONTO,'+
          '  (Select Max(X.DAT_REUNIAO)'+
          '     From MOV_REUNIAO X '+
          '     Where '+
          '       X.COD_PUBLICO = '+lvw.Selected.SubItems[0]+' And '+
          '       X.COD_PONTO = A.COD_PONTO)  DAT_ULT_DESIGNACAO,'+
          '  (Select Max(X.DAT_CONCLUSAO)'+
          '     From VW_PONTOS_CONCLUIDOS X '+
          '     Where '+
          '       X.COD_PUBLICO = '+lvw.Selected.SubItems[0]+' And '+
          '       X.COD_PONTO = A.COD_PONTO ) DAT_CONCLUSAO '+
          '  From '+
          '   CAD_PONTO A, '+
          '   CAD_PARTE_PONTO B '+
          '  Where '+
          '   A.COD_PONTO = B.COD_PONTO And '+
          '   B.COD_TP_PARTE = '+PTIdNo(trv.Selected.Parent.Parent.Data).Codigo;

  if UpperCase(cboSexo.Text) = 'MASCULINO' then
    str := str + ' And FLG_SEXO = '+ cnn.Aspas('M')
  else if UpperCase(cboSexo.Text) = 'FEMININO' then
    str := str + ' And FLG_SEXO = '+ cnn.Aspas('F');

  str := str + '  Order By 3 Asc ,4,1';

  if cnn.ExecuteQuery(str,ds) then
  begin
    lvwPonto.Columns[4].Width := 0;
    while not ds.DataSet.Eof do
    begin
      item := lvwPonto.Items.Add;
      item.Caption := ds.DataSet.FieldByName('COD_PONTO').AsString;
      item.SubItems.Add(ds.DataSet.FieldByName('NOM_PONTO').AsString);
      item.SubItems.Add(ds.DataSet.FieldByName('DAT_ULT_DESIGNACAO').AsString);
      item.SubItems.Add(ds.DataSet.FieldByName('DAT_CONCLUSAO').AsString);
      item.SubItems.Add(EmptyStr);
      ds.DataSet.Next;
    end;
  end;
end;

procedure TfrmDesignacaoReuniao.lvwChange(Sender: TObject; Item: TListItem;
  Change: TItemChange);
begin
  if lvw.ItemIndex >= 0 then
  begin
    lblPublicoSel.Caption := lvw.Selected.Caption;
    if MostraPonto then
      CarregaPonto;
    if MostraAjudante then
      CarregaAjudante;
  end
  else
    lblPublicoSel.Caption := EmptyStr;
end;

procedure TfrmDesignacaoReuniao.CarregaAjudante;
var str: string;
    ds: TDataSource;
    item: TListItem;
    strAju, strDatDes, strNomDes: string;
begin
  lvwAjudante.Items.Clear;
  if Assigned(lvw.Selected) then
  begin
    if UpperCase(cboSexo.Text) = 'FEMININO'  then
    begin
      //DATA DA ÚLTIMA PARTE COMO AJUDANTE
      strAju := '  (Select Max(X.DAT_REUNIAO) From MOV_REUNIAO X'+
                '     Where X.COD_PUB_AJU = A.COD_PUBLICO ';
                
      if optAjudante.ItemIndex = 1 then
      begin
        strAju := strAju + ' And X.COD_PUBLICO = '+lvw.Selected.SubItems[0];
      end;
      strAju := strAju + ')';

      strDatDes := '  (Select Max(X.DAT_REUNIAO) '+
                   '     From MOV_REUNIAO X,'+
                   '          CAD_TP_PARTE Y '+
                   '     Where X.COD_PUBLICO = A.COD_PUBLICO And '+
                   '           X.COD_TP_PARTE = Y.COD_TP_PARTE And '+
                   '           Y.FLG_TIPO = ' + cnn.Aspas('I')+')';



      strNomDes := '  (Select Max(Z.NOM_TP_PARTE) ' +
                   '     From MOV_REUNIAO Y, ' +
                   '          CAD_TP_PARTE Z ' +
                   '     Where Y.COD_TP_PARTE = Z.COD_TP_PARTE And ' +
                   '           Y.COD_PUBLICO = A.COD_PUBLICO And ' +
                   '           Y.DAT_REUNIAO = (Select Max(X.DAT_REUNIAO) '+
                   '                              From MOV_REUNIAO X, '+
                   '                                   CAD_TP_PARTE Y '+
                   '                              Where X.COD_PUBLICO = A.COD_PUBLICO And '+
                   '                                    X.COD_TP_PARTE = Y.COD_TP_PARTE And '+
                   '                                    Y.FLG_TIPO = '+ cnn.Aspas('I')+'))';

      str :=  'Select '+
              '  A.COD_PUBLICO,'+
              '  A.NOM_PUBLICO,';
      str := str +
             strAju + ' DAT_ULT_PARTE_AJU, ' +
             strDatDes + ' DAT_ULT_DES, ' +
             strNomDes + ' NOM_ULT_DES ' +
              ' From '+
              '  CAD_PUBLICO A,'+
              '  CAD_PUBLICO_PARTE B'+
              ' Where '+
              '  A.COD_PUBLICO = B.COD_PUBLICO And '+
              '  B.COD_TP_PARTE = '+PTIdNo(trv.Selected.Parent.Parent.Data).Codigo+' And '+
              '  A.FLG_ATIVO = '+cnn.Aspas('S')+' And '+
              '  A.FLG_SEXO ='+cnn.Aspas('F')+ ' And '+
              '  A.COD_PUBLICO <> '+lvw.Selected.SubItems[0]+
              ' Order By 3,4 ';
      cnn.Open;
      if cnn.ExecuteQuery(str,ds) then
      begin
        while not ds.DataSet.Eof do
        begin
          item := lvwAjudante.Items.Add;
          item.Caption := ds.DataSet.FieldByName('NOM_PUBLICO').AsString;
          item.SubItems.Add(ds.DataSet.FieldByName('COD_PUBLICO').AsString);
          item.SubItems.Add(ds.DataSet.FieldByName('DAT_ULT_PARTE_AJU').AsString);
          item.SubItems.Add(ds.DataSet.FieldByName('DAT_ULT_DES').AsString);
          item.SubItems.Add(ds.DataSet.FieldByName('NOM_ULT_DES').AsString);
          ds.DataSet.Next;
        end;
      end;
      cnn.Close;
    end;
  end;
end;

function TfrmDesignacaoReuniao.MostraAjudante: boolean;
begin
  lvwAjudante.Items.Clear;
  if not (UpperCase(cboSexo.Text) = 'FEMININO') then
  begin
    tabAjudante.TabVisible := false;
    result := false;
  end
  else
  begin
    tabAjudante.TabVisible := true;
    result := true;
  end;

end;

function TfrmDesignacaoReuniao.MostraPonto: boolean;
var str: string;
    ds: TDataSource;
begin
  lvwPonto.Items.Clear;
  if (PTIdNo(trv.Selected.Data).TipoNo = tpPUBLICO) and
     (not IsEmptyStr(cboSexo.Text)) then
  begin
    str :=  'Select Count(*) '+
            ' From '+
            '  CAD_PARTE_PONTO '+
            ' Where '+
            '  COD_TP_PARTE = '+PTIdNo(trv.Selected.Parent.Parent.Data).Codigo;

    if UpperCase(cboSexo.Text) = 'MASCULINO' then
      str := str + ' And FLG_SEXO = '+ cnn.Aspas('M')
    else if UpperCase(cboSexo.Text) = 'FEMININO' then
      str := str + ' And FLG_SEXO = '+ cnn.Aspas('F');
    cnn.Open;
    if cnn.ExecuteQuery(str,ds) then
      if ds.DataSet.Fields[0].AsInteger = 0 then
        result := false
      else
        result := true
    else
      result := false;
  end
  else
    result := false;
  cnn.Close;
  tabPonto.TabVisible := result;
end;

procedure TfrmDesignacaoReuniao.tabDesignacaoChange(Sender: TObject);
var item: TListItem;
begin
  lvwResumo.Items.Clear;

  if Assigned(trv.Selected) then
  begin
    if not Assigned(trv.Selected.Data) then
      Exit;
  end
  else
    Exit;

  if tabDesignacao.ActivePage = tabResumo then
  begin
    if PTIdNo(trv.Selected.Data).TipoNo = tpPUBLICO then
    begin
      with lvwResumo do
      begin

        item := Items.Add;
        item.Caption  := 'Semana';
        item.SubItems.Add (trv.Selected.Parent.Parent.Parent.Text);
        item := Items.Add;
        item.Caption := 'Reunião';
        item.SubItems.Add (edtDAT_REUNIAO.Text);

        item := Items.Add;
        item.Caption := 'Parte';
        item.SubItems.Add (trv.Selected.Parent.Parent.Text); //parte
        item := Items.Add;
        item.Caption := 'Sala';
        item.SubItems.Add (trv.Selected.Parent.Text); //Sala
        if Assigned(lvw.Selected) then
        begin
          item := Items.Add;
          item.Caption := 'Designado(a)';
          item.SubItems.Add (lvw.Selected.Caption);
        end;
        if Assigned(lvwPonto.Selected) then
        begin
          item := Items.Add;
          item.Caption := 'Ponto';
          item.SubItems.Add (lvwPonto.Selected.Caption+' - '+lvwPonto.Selected.SubItems[0]);
        end;
        if Assigned(lvwAjudante.Selected) then
        begin
          item := Items.Add;
          item.Caption := 'Moradora: ';
          item.SubItems.Add (lvwAjudante.Selected.Caption);
        end;
      end;
    end;
  end;
end;

procedure TfrmDesignacaoReuniao.btnConfirmarClick(Sender: TObject);
var str, strPublico, strPonto, strAjudante: string;
    IdDes: TIdDesignacao;
begin
  if not Assigned(lvw.Selected) then
  begin
    MessageDlg('É necessário informar um irmão(ã)',mtWarning,[mbOk],0);
    tabDesignacao.ActivePage := tabPublico;
    Exit;
  end
  else
    strPublico := lvw.Selected.SubItems[0];

  if tabPonto.TabVisible then
  begin
    if (not Assigned(lvwPonto.Selected)) then
    begin
      MessageDlg('É necessário informar um Ponto!',mtWarning,[mbOk],0);
      tabDesignacao.ActivePage := tabPonto;
      Exit;
    end
    else
      strPonto := lvwPonto.Selected.Caption;
  end
  else
    strPonto := EmptyStr;

  if tabAjudante.TabVisible then
  begin
    if (not Assigned(lvwAjudante.Selected)) then
    begin
      MessageDlg('É necessário informar uma Moradora!',mtWarning,[mbOk],0);
      tabDesignacao.ActivePage := tabAjudante;
      Exit;
    end
    else
      strAjudante := lvwAjudante.Selected.SubItems[0];
  end
  else
    strAjudante := EmptyStr;

  if MessageDlg('Confirma a designação?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    Exit;

  // INSERINDO NA MOV_REUNIAO

  if trim(strPonto) = EmptyStr then
    strPonto := 'NULL';
  if trim(strAjudante) = EmptyStr then
    strAjudante := 'NULL';

  try
    cnn.BeginTrans;
    str :=  'Delete From MOV_REUNIAO'+
            ' Where '+
            '  DAT_SEMANA = '+cnn.To_Date(PTIdNo(trv.Selected.Parent.Parent.Parent.Data).Codigo)+' And '+
            '  COD_TP_REUNIAO = '+PTIdNo(trv.Selected.Parent.Parent.Parent.Data).CodTpReuniao+' And '+
            '  COD_TP_PARTE = '+PTIdNo(trv.Selected.Parent.Parent.Data).Codigo+' And '+
            '  COD_SALA = '+cnn.Aspas(PTIdNo(trv.Selected.Parent.Data).Codigo);
    cnn.Execute(str);
    str :=  'Insert Into MOV_REUNIAO('+
            '  DAT_SEMANA,'+
            '  COD_TP_REUNIAO,'+
            '  COD_TP_PARTE,'+
            '  COD_SALA,'+
            '  DAT_REUNIAO,'+
            '  COD_PUBLICO,'+
            '  COD_PUB_AJU,'+
            '  COD_PONTO,'+
            '  FLG_SEXO,'+
            '  DSC_OBS_DESIGNACAO,'+
            '  DSC_OBSERVACAO,'+
            '  FLG_CONCLUIU_PONTO'+
            ') Values ('+
            cnn.To_Date(PTIdNo(trv.Selected.Parent.Parent.Parent.Data).Codigo)+','+
            PTIdNo(trv.Selected.Parent.Parent.Parent.Data).CodTpReuniao+','+
            PTIdNo(trv.Selected.Parent.Parent.Data).Codigo+','+
            cnn.Aspas(PTIdNo(trv.Selected.Parent.Data).Codigo)+','+
            cnn.To_Date(edtDAT_REUNIAO.Text)+','+
            strPublico+','+
            strAjudante+','+
            strPonto+','+
            cnn.Aspas(IfThen(UpperCase(cboSexo.Text)='MASCULINO','M','F'))+','+
            cnn.Aspas(memObsDesignacao.Text)+','+
            cnn.Aspas(memObs.Text)+','+
            cnn.aspas('A')+')';
    cnn.Execute(str);
    cnn.Commit;
    MessageDlg('Designação efetuada com sucesso!',mtInformation,[mbOk],0);
  except
    cnn.Rollback;
  end;
  strPonto := StringReplace(trim(UpperCase(strPonto)),'NULL',EmptyStr,[rfReplaceAll]);
  strAjudante := StringReplace(trim(UpperCase(strAjudante)),'NULL',EmptyStr,[rfReplaceAll]);
  //ATRIBUINDO AS INFORMACOES DO NO
  IdDes.CodPublico := strPublico;
  IdDes.NomPublico := lvw.Selected.Caption;
  IdDes.CodPonto := strPonto;
  if not IsEmptyStr(strPonto) then
    IdDes.NomPonto := lvwPonto.Selected.SubItems[0];
  IdDes.CodAjudante := strAjudante;
  if not IsEmptyStr(strAjudante) then
    IdDes.NomAjudante := lvwAjudante.Selected.Caption;
  //INSERINDO NO
  InsereNoDesignacao(IdDes);

end;

procedure TfrmDesignacaoReuniao.InsereNoDesignacao(IdDes: TIdDesignacao);
var i: integer;
    noPai, noAux: TTreeNode;
    PIdNo: PTIdNo;
begin
  if Assigned(trv.Selected.Parent) then
  begin
    if Assigned(trv.Selected.Parent.Data) then
    begin
      if PTIdNo(trv.Selected.Parent.Data).TipoNo = tpSALA then
      begin
        noPai := trv.Selected.Parent;
        noAux := trv.Selected.Parent.Item[0];
        //DELETANDO TODOS OS NOS FILHOS
        noPai.DeleteChildren;

        New(PIdNo);
        PIdNo.Nivel := 4;
        PIdNo.TipoNo := tpPUBLICO;
        PIdNo.Codigo := IdDes.CodPublico;
        PIdNo.ObsDes := memObsDesignacao.Text;
        PIdNo.Obs := memObs.Text;
        noAux := trv.Items.AddChildObject(noPai,'Designado(a): '+IdDes.NomPublico,PIdNo);
        noAux.StateIndex := 2;
        //ADICIONANDO NO DO PONTO
        if not IsEmptyStr(IdDes.CodPonto) then
        begin
          New(PIdNo);
          PIdNo.Nivel := 4;
          PIdNo.TipoNo := tpPONTO;
          PIdNo.Codigo := Trim(IdDes.CodPonto);
          trv.Items.AddChildObject(noPai,'Ponto: '+IdDes.CodPonto+' - '+
                     IdDes.NomPonto,PIdNo);
        end;

        //ADICIONANDO AJUDANTE
        if not IsEmptyStr(IdDes.CodAjudante) then
        begin
          New(PIdNo);
          PIdNo.Nivel := 4;
          PIdNo.TipoNo := tpAJUDANTE;
          PIdNo.Codigo := IdDes.CodAjudante;
          trv.Items.AddChildObject(noPai,'Moradora: '+IdDes.NomAjudante,PIdNo);
        end;
        noPai.Expand(false);
      end;
    end;
  end;
end;

procedure TfrmDesignacaoReuniao.ExcluiNoDesignacao;
var  str: string;
     IdNo: PTIdNo;
     noPai,no: TTreeNode;
begin
  IdNo := nil;
  if not Assigned(trv.Selected) then
    Exit;
  if not Assigned(trv.Selected.Data) then
    Exit;
  if PTIdNo(trv.Selected.Data).TipoNo = tpPUBLICO then
  begin
    if MessageDlg('Deseja exluir o item selecionado?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
      Exit;

    str :=  'Delete From MOV_REUNIAO'+
            ' Where '+
            '  DAT_SEMANA = '+cnn.To_Date(trv.Selected.Parent.Parent.Parent.Text)+' And '+
            '  COD_TP_REUNIAO = '+PTIdNo(trv.Selected.Parent.Parent.Parent.Data).CodTpReuniao+' And '+
            '  COD_TP_PARTE = '+PTIdNo(trv.Selected.Parent.Parent.Data).Codigo+' And '+
            '  COD_SALA = '+cnn.Aspas(PTIdNo(trv.Selected.Parent.Data).Codigo);
    cnn.Open;
    cnn.Execute(str);
    cnn.Close;
    New(IdNo);
    IdNo.Nivel := 4;
    IdNo.TipoNo := tpPUBLICO;
    IdNo.Codigo := EmptyStr;
    noPai := trv.Selected.Parent;
    noPai.DeleteChildren;
    no := trv.Items.AddChildObject(noPai,'[...adicionar participante...]',IdNo);
    no.StateIndex := 2;
    noPai.Expand(false);
    no.Selected := true;
  end;
end;

procedure TfrmDesignacaoReuniao.trvKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_DELETE then
    ExcluiNoDesignacao;
end;

procedure TfrmDesignacaoReuniao.chkParteSelecionadaClick(Sender: TObject);
begin
  CarregaPublico;
end;

procedure TfrmDesignacaoReuniao.optAjudanteClick(Sender: TObject);
begin
  CarregaAjudante;
end;

procedure TfrmDesignacaoReuniao.SelecionaValores;
var i: integer;
begin
  if not Assigned(trv.Selected) then
    Exit;

  if PTIdNo(trv.Selected.Data).TipoNo = tpPUBLICO then
  begin
    for i := 0 to lvw.Items.Count-1 do
    begin
      if lvw.Items[i].SubItems[0] = PTIdNo(trv.Selected.Data).Codigo then
      begin
        lvw.ItemIndex := i;
        break;
      end;
    end;

    memObsDesignacao.Text :=  PTIdNo(trv.Selected.Data).ObsDes;
    memObs.Text := PTIdNo(trv.Selected.Data).Obs;

  end;

end;

procedure TfrmDesignacaoReuniao.trvMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Assigned(trv.Selected) and Assigned(trv.Selected.Data) then
  begin
    if PTIdNo(trv.Selected.Data).TipoNo = tpDATA_REUNIAO then
    begin
      if Button = mbRight then
        popMenu.Popup(X+50,Y+180);
    end
    else if PTIdNo(trv.Selected.Data).TipoNo = tpPUBLICO then
    begin
      if Button = mbRight then
        popMenuImpDes.Popup(X+50,Y+180);
    end;
  end;
end;

procedure TfrmDesignacaoReuniao.mnuImprimirSemanaClick(Sender: TObject);
var
  str: string;

begin
  str := InputBox('Escolha de sala','Escolha a sala que deseja imprimir','A');
  if trim(str) = EmptyStr  then
  begin
    MessageDlg('Não foi informada sala!',mtWarning,[mbOK],0);
    exit;
  end;

  dmRelatorio.ExecutaRelDesignacaoReuniao(PTIdNo(trv.Selected.Data).Codigo, str);

end;

procedure TfrmDesignacaoReuniao.mnuImpDesignacaoClick(Sender: TObject);
var str: string;
begin
  str := 'Select '+
         ' A.DAT_REUNIAO,'+
         ' A.COD_SALA,'+
         ' B.NOM_PUBLICO,'+
         ' C.NOM_PUBLICO NOM_PUB_AJU,'+
         ' A.COD_PONTO,'+
         ' A.DSC_OBS_DESIGNACAO,'+
         ' E.NOM_PARTE TEMA,'+
         ' F.NOM_TP_PARTE_RESUMIDO,'+
         ' E.NOM_MATERIA'+
         ' From '+
         '   MOV_REUNIAO A '+
         '   Left Outer Join CAD_PUBLICO C On '+
         '     A.COD_PUB_AJU = C.COD_PUBLICO '+
         '   Left Outer Join CAD_PONTO D On '+
         '     A.COD_PONTO = D.COD_PONTO, '+
         '   CAD_PUBLICO B,'+
         '   CAD_PROGRAMA E,'+
         '   CAD_TP_PARTE F '+
         ' Where '+
         '   A.COD_PUBLICO = B.COD_PUBLICO And '+
         '   A.DAT_SEMANA = E.DAT_SEMANA And '+
         '   A.COD_TP_REUNIAO = E.COD_TP_REUNIAO And '+
         '   A.COD_TP_PARTE = E.COD_TP_PARTE And '+
         '   A.COD_TP_PARTE = F.COD_TP_PARTE ';

  str := str + ' And A.DAT_SEMANA = ' + cnn.To_Date(PTIdNo(trv.Selected.Parent.Parent.Parent.Data).Codigo);
  str := str + ' And A.COD_TP_REUNIAO = ' + PTIdNo(trv.Selected.Parent.Parent.Parent.Data).CodTpReuniao;
  str := str + ' And A.COD_PUBLICO = ' + PTIdNo(trv.Selected.Data).Codigo;
  str := str + ' And A.COD_SALA = ' + cnn.Aspas(PTIdNo(trv.Selected.Parent.Data).Codigo);
  str := str + ' And A.COD_TP_PARTE = ' + PTIdNo(trv.Selected.Parent.Parent.Data).Codigo;
  with dmRelatorio do
  begin
    sdsDesignacao.DataSet.CommandText := str;
    sdsDesignacao.Active := false;
    sdsDesignacao.Active := true;
    sdsDesignacao.DataSet.Active := true;
    rvSys.SystemPreview.FormState := wsMaximized;
    rvProject.ExecuteReport('rptImpressaoDesignacao');
    sdsDesignacao.DataSet.Active := false;
  end;
end;

procedure TfrmDesignacaoReuniao.btnImprimeMesClick(Sender: TObject);
var
  strMesAno: string;
begin

  if not chkExibirTodas.Checked then
  begin
    if (trim(cboMes.Text) = EmptyStr) then
    begin
      MessageDlg( 'É necessário informar um mês.',mtWarning,[mbOK],0);
      Exit;
    end  
    else if (trim(edtAno.Text) = EmptyStr) then
    begin
      MessageDlg( 'É necessário informar o ano.',mtWarning,[mbOK],0);
      Exit;
    end
    else
    begin
      strMesAno := edtAno.Text+'-'+LPAD(IntToStr(cboMes.ItemIndex+1),2,'0');
      dmRelatorio.ExecutaRelReuniaoMes(strMesAno);
    end;
  end;


end;

end.
