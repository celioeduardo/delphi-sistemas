unit UVEN_PEDIDO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, UComponentTag, Mask, EditLabel, Grids, DBGrids,
  ComCtrls, Buttons,UConexao, UPesquisa, UGlobal;

type
  TfrmVEN_PEDIDO = class(TForm)
    tab: TPageControl;
    tabProduto: TTabSheet;
    grdProd: TDBGrid;
    edtCOD_FORNECEDOR: TEditLabel;
    edtCOD_APRESENTACAO: TEditLabel;
    edtCOD_P_ATIVO_PESQ: TEditLabel;
    edtCOD_PRODUTO_PESQ: TEditLabel;
    edtNOM_PRODUTO_PESQ: TEditTag;
    edtNOM_P_ATIVO_PESQ: TEditTag;
    edtNOM_APRESENTACAO: TEditTag;
    edtNOM_FORNECEDOR: TEditTag;
    tabPreenchimento: TTabSheet;
    grdPed: TDBGrid;
    btnSair: TBitBtn;
    edtNUM_PEDIDO: TEditLabel;
    edtDAT_PEDIDO: TEditLabel;
    edtCOD_CLIENTE: TEditLabel;
    edtNOM_CLIENTE: TEditTag;
    btnGravar: TButton;
    btnPesquisaProdutos: TButton;
    txtHabilitaEdicao: TEdit;
    edtCOD_PRODUTO: TEditLabel;
    edtNOM_PRODUTO: TEditTag;
    edtQTD_PEDIDA: TEditLabel;
    edtQTD_ATENDIDA: TEditLabel;
    edtQTD_ESTOQUE: TEditLabel;
    edtVAL_CUSTO: TEditLabel;
    edtVAL_ULT_ENTRADA: TEditLabel;
    edtVAL_CUSTO_UN: TEditLabel;
    edtPER_MARGEM: TEditLabel;
    edtVAL_UNITARIO: TEditLabel;
    edtVAL_TOTAL: TEditLabel;
    edtVAL_PRECO_FATOR: TEditLabel;
    btnIncluirProduto: TButton;
    tabPrincipioAtivo: TTabSheet;
    edtCOD_P_ATIVO: TEditLabel;
    edtNOM_P_ATIVO: TEditTag;
    edtQTD_PEDIDA_P_ATIVO: TEditLabel;
    btnIncluirPrincipioAtivo: TButton;
    btnAlterar: TButton;
    edtNUM_FATOR_CONV: TEditLabel;
    lblValorTotal: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lblQtdPedidaTotal: TLabel;
    lblQtdAtendidaTotal: TLabel;
    lblPerAtendimento: TLabel;
    edtQTD_FECHADA: TEditLabel;
    Label4: TLabel;
    lblPerFechado: TLabel;
    Label6: TLabel;
    lblQtdFechadaTotal: TLabel;
    btnExcluir: TButton;
    Button1: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNUM_PEDIDOEnter(Sender: TObject);
    procedure txtHabilitaEdicaoEnter(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure edtCOD_CLIENTEClickButton(Sender: TObject);
    procedure edtCOD_PRODUTO_PESQClickButton(Sender: TObject);
    procedure edtCOD_P_ATIVO_PESQClickButton(Sender: TObject);
    procedure edtCOD_APRESENTACAOClickButton(Sender: TObject);
    procedure edtCOD_FORNECEDORClickButton(Sender: TObject);
    procedure edtCOD_P_ATIVOClickButton(Sender: TObject);
    procedure edtCOD_PRODUTOClickButton(Sender: TObject);
    procedure edtCOD_CLIENTEExit(Sender: TObject);
    procedure edtCOD_PRODUTO_PESQExit(Sender: TObject);
    procedure edtCOD_P_ATIVO_PESQExit(Sender: TObject);
    procedure edtCOD_APRESENTACAOExit(Sender: TObject);
    procedure edtCOD_FORNECEDORExit(Sender: TObject);
    procedure edtCOD_PRODUTOExit(Sender: TObject);
    procedure edtCOD_P_ATIVOExit(Sender: TObject);
    procedure edtDAT_PEDIDOEnter(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure edtQTD_ATENDIDAChange(Sender: TObject);
    procedure btnPesquisaProdutosClick(Sender: TObject);
    procedure grdProdDblClick(Sender: TObject);
    procedure grdProdCellClick(Column: TColumn);
    procedure grdProdKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtQTD_ATENDIDAEnter(Sender: TObject);
    procedure btnIncluirProdutoClick(Sender: TObject);
    procedure btnIncluirPrincipioAtivoClick(Sender: TObject);
    procedure grdPedDblClick(Sender: TObject);
    procedure grdPedKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPER_MARGEMExit(Sender: TObject);
    procedure edtVAL_UNITARIOExit(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure edtQTD_FECHADAEnter(Sender: TObject);
    procedure Button1Click(Sender: TObject);

  private
    procedure SugereNumero;
    procedure PesquisaProdutos;
    function PreparaPedido: boolean;
    procedure LimpaPrincipoAtivo;
    procedure LimpaProduto;
    procedure LimpaProdutoPesq;
    procedure LimpaPedido;
    procedure LimpaCampos;
    procedure LimpaLabels;
    function GravaPedido: boolean;
    function AlteraPedido: boolean;
    function PesquisaNova(Sender: TObject; blnValida, Msg: boolean): boolean;
    procedure PreencheCamposProduto;
    procedure GravaProduto;
    procedure GravaPrincipioAtivo;
    procedure ExcluiPedido(NumPedido: integer);    
    procedure ExcluiProduto(NumPedido: integer; CodProduto: integer);
    procedure ExcluiPrincioAtivo(NumPedido: integer; CodPrincipioAtivo: integer);
    procedure CarregaItemPedido;
    procedure CalculaMargem;
    procedure CalculaPrecoUnitario;
    procedure CalculaPrecoTotal;
    procedure CalculaPrecoFator;

  public
    { Public declarations }
  end;

var
  frmVEN_PEDIDO: TfrmVEN_PEDIDO;
  Pesquisa   :TPesquisa;
  cnn        :TConexao;


implementation

{$R *.dfm}

uses DB, Functions, Math;

procedure TfrmVEN_PEDIDO.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    if Messagedlg('Deseja Sair?',mtConfirmation,[mbYes,mbNo],0) = MRYes then
  begin
    Action := CaFree
  end
  else
    Action := caNone;
end;

procedure TfrmVEN_PEDIDO.FormCreate(Sender: TObject);
begin
  Left:=0;
  Top:=0;
  tabProduto.TabVisible := false;
  tabPrincipioAtivo.TabVisible := false;
  cnn := TConexao.Create(GloStrUser,GloStrPassword,GloStrDatabase, GloStrServer, GloBlnEmbedded);
  cnn.Open;
end;

procedure TfrmVEN_PEDIDO.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_RETURN: keybd_event(VK_TAB,0,0,0);

    VK_ESCAPE: btnSairClick(Sender);
  end;
end;

procedure TfrmVEN_PEDIDO.SugereNumero;
var
  str: string;
  ds: TDataSource;
begin
  if Trim(edtNUM_PEDIDO.Text) = EmptyStr then
  begin
    str := 'Select Max(NUM_PEDIDO) + 1 NUM_PEDIDO From VEN_PEDIDO';
    if cnn.ExecuteQuery(str,ds) then
    begin
      if trim(ds.DataSet.Fields[0].AsString) = EmptyStr then
        edtNUM_PEDIDO.Text := '1'
      else
        edtNUM_PEDIDO.Text := ds.DataSet.Fields[0].AsString;

      edtNUM_PEDIDO.SelectAll;
    end
    else
      edtNUM_PEDIDO.Text := '1'
  end;
end;

procedure TfrmVEN_PEDIDO.edtNUM_PEDIDOEnter(Sender: TObject);
begin
  SugereNumero;
end;

function TfrmVEN_PEDIDO.PreparaPedido: boolean;
var
  str: string;
  ds: TDataSource;
begin
  Result := true;

  if trim(edtNUM_PEDIDO.Text) = '' then
  begin
    MessageDlg('É obrigatório informar um número.',mtWarning,[mbOK],0);
    Result := false;
    edtNUM_PEDIDO.SetFocus;
    Exit;
  end;

  str := 'Select ';
  str := str + ' A.COD_CLIENTE,';
  str := str + ' B.NOM_CLIENTE, ';
  str := str + ' A.DAT_PEDIDO ';
  str := str + ' From ';
  str := str + ' VEN_PEDIDO A,';
  str := str + ' CAD_CLIENTE B ';
  str := str + ' Where ';
  str := str + ' A.COD_CLIENTE = B.COD_CLIENTE And ';
  str := str + ' A.NUM_PEDIDO = '+edtNUM_PEDIDO.Text;

  if cnn.ExecuteQuery(str,ds) then
  begin
    edtCOD_CLIENTE.Text := ds.DataSet.FieldByName('COD_CLIENTE').AsString;
    edtNOM_CLIENTE.Text := ds.DataSet.FieldByName('NOM_CLIENTE').AsString;
    edtDAT_PEDIDO.Text := ds.DataSet.FieldByName('DAT_PEDIDO').AsString;
    btnGravar.Enabled := false;
    btnAlterar.Enabled := true;
    btnExcluir.Enabled := true;
    tabProduto.TabVisible := true;
    tabPrincipioAtivo.TabVisible := true;
    CarregaItemPedido;
  end
  else
  begin
    btnGravar.Enabled := true;
    btnAlterar.Enabled := false;
    btnExcluir.Enabled := false;
  end;

  edtNUM_PEDIDO.Enabled := false;
  edtCOD_CLIENTE.Enabled := true;
  edtDAT_PEDIDO.Enabled := true;
  edtCOD_CLIENTE.SetFocus;

end;

procedure TfrmVEN_PEDIDO.LimpaPrincipoAtivo;
begin
  edtCOD_P_ATIVO.Text := '';
  edtQTD_PEDIDA_P_ATIVO.Text := '';
end;

procedure TfrmVEN_PEDIDO.LimpaProduto;
begin
  edtCOD_PRODUTO.Text := '';
  edtQTD_ESTOQUE.Text := '';
  edtVAL_CUSTO.Text := '';
  edtVAL_CUSTO_UN.Text := '';
  edtVAL_ULT_ENTRADA.Text := '';
  edtQTD_PEDIDA.Text := '';
  edtQTD_ATENDIDA.Text := '';
  edtQTD_FECHADA.Text := '';  
  edtPER_MARGEM.Text := '';
  edtVAL_UNITARIO.Text := '';
  edtVAL_TOTAL.Text := '';
  edtVAL_PRECO_FATOR.Text := '';
  edtNUM_FATOR_CONV.Text := '';
end;

procedure TfrmVEN_PEDIDO.LimpaProdutoPesq;
begin
  edtCOD_PRODUTO_PESQ.Text := '';
  edtCOD_P_ATIVO_PESQ.Text := '';
  edtCOD_APRESENTACAO.Text := '';
  edtCOD_FORNECEDOR.Text := '';
  grdProd.DataSource := nil;
end;

procedure TfrmVEN_PEDIDO.LimpaPedido;
begin
  edtNUM_PEDIDO.Text := '';
  edtCOD_CLIENTE.Text := '';
  edtDAT_PEDIDO.Text := '';
  grdPed.DataSource := nil;
end;

procedure TfrmVEN_PEDIDO.LimpaCampos;
begin
  LimpaPedido;
  LimpaProduto;
  LimpaProdutoPesq;
  LimpaPrincipoAtivo;
  txtHabilitaEdicao.Enabled := true;
  edtNUM_PEDIDO.Enabled := true;
  edtCOD_CLIENTE.Enabled := false;
  edtDAT_PEDIDO.Enabled := false;
  btnGravar.Enabled := false;
  btnAlterar.Enabled := false;
  btnExcluir.Enabled := false;
  tab.ActivePage := tabPreenchimento;
  edtNUM_PEDIDO.SetFocus;
  tabProduto.TabVisible := false;
  tabPrincipioAtivo.TabVisible := false;
  LimpaLabels;
end;

procedure TfrmVEN_PEDIDO.txtHabilitaEdicaoEnter(Sender: TObject);
begin
  if PreparaPedido then
    txtHabilitaEdicao.Enabled := false;
end;

procedure TfrmVEN_PEDIDO.btnSairClick(Sender: TObject);
begin
  if not edtNUM_PEDIDO.Enabled then
  begin
    if Messagedlg('Cancelar?',mtConfirmation,[mbYes,mbNo],0) = MRYes then
      LimpaCampos;
  end
  else
    Close;
end;

function TfrmVEN_PEDIDO.GravaPedido: boolean;
var
  str: string;
begin
  Result := false;
  if trim(edtNUM_PEDIDO.Text) = '' then
  begin
    MessageDlg('É necessário informar o Número',mtWarning,[mbOK],0);
    Exit;
  end;

  if trim(edtCOD_CLIENTE.Text) = '' then
  begin
    MessageDlg('É necessário informar o Cliente',mtWarning,[mbOK],0);
    if edtCOD_CLIENTE.Enabled then
      edtCOD_CLIENTE.SetFocus;
    Exit;
  end;

  if trim(edtDAT_PEDIDO.FormattedText) = '' then
  begin
    MessageDlg('É necessário informar a Data',mtWarning,[mbOK],0);
    if edtDAT_PEDIDO.Enabled then
      edtDAT_PEDIDO.SetFocus;
    Exit;
  end;

  str := 'Insert Into VEN_PEDIDO(';
  str := str + 'NUM_PEDIDO,';
  str := str + 'COD_CLIENTE,';
  str := str + 'DAT_PEDIDO';
  str := str + ') Values (';
  str := str + cnn.NumberToBD(edtNUM_PEDIDO.Text)+',';
  str := str + cnn.NumberToBD(edtCOD_CLIENTE.Text)+',';
  str := str + cnn.DateToBD(edtDAT_PEDIDO.Text)+')';

  cnn.Execute(str);

  Result := true;

end;


procedure TfrmVEN_PEDIDO.btnGravarClick(Sender: TObject);
begin
  if GravaPedido then
  begin
    btnGravar.Enabled := false;
    tabProduto.TabVisible := true;
    tabPrincipioAtivo.TabVisible := true;
    tab.ActivePage := tabProduto;
    if edtCOD_PRODUTO_PESQ.Enabled then
      edtCOD_PRODUTO_PESQ.SetFocus;
  end;
end;

function TfrmVEN_PEDIDO.PesquisaNova(Sender: TObject; blnValida,
  Msg: boolean): boolean;
var Edt      : TEditlabel;
    EdtN     : TEdit;
    Pesquisa : TPesquisa;
    str      : array[0..2] of string;

begin
  Edt := Sender as TEditLabel;
  EdtN:= Edt._Edit;

  if (Edt._Campo = 'COD_CLIENTE') then
  begin
    str[0] := 'COD_CLIENTE,NOM_CLIENTE';
    str[1] := 'CAD_CLIENTE';
    str[2] := EmptyStr;
  end
  else if (Edt._Campo = 'COD_PRODUTO') then
  begin
    str[0] := 'COD_PRODUTO,NOM_PRODUTO';
    str[1] := 'VW_PRODUTO';
    str[2] := EmptyStr;
  end
  else if (Edt._Campo = 'COD_APRESENTACAO') then
  begin
    str[0] := 'COD_APRESENTACAO,NOM_APRESENTACAO';
    str[1] := 'CAD_APRESENTACAO';
    str[2] := EmptyStr;
  end
  else if (Edt._Campo = 'COD_P_ATIVO') then
  begin
    str[0] := 'COD_P_ATIVO,NOM_P_ATIVO';
    str[1] := 'CAD_P_ATIVO';
    str[2] := EmptyStr;
  end
  else if (Edt._Campo = 'COD_FORNECEDOR') then
  begin
    str[0] := 'COD_FORNECEDOR,NOM_FORNECEDOR';
    str[1] := 'CAD_FORNECEDOR';
    str[2] := EmptyStr;
  end
  else
    Exit;

  Pesquisa := TPesquisa.Create;
  Result := Pesquisa.ExecutaPesquisa(blnValida,str[0],str[1],Edt,EdtN,str[2],Msg);

  Pesquisa.Free;
end;


procedure TfrmVEN_PEDIDO.edtCOD_CLIENTEClickButton(Sender: TObject);
begin
  PesquisaNova(edtCOD_CLIENTE,false,true);
end;

procedure TfrmVEN_PEDIDO.edtCOD_PRODUTO_PESQClickButton(Sender: TObject);
begin
  PesquisaNova(edtCOD_PRODUTO_PESQ,false,true);
end;

procedure TfrmVEN_PEDIDO.edtCOD_P_ATIVO_PESQClickButton(Sender: TObject);
begin
    PesquisaNova(edtCOD_P_ATIVO_PESQ,false,true);
end;

procedure TfrmVEN_PEDIDO.edtCOD_APRESENTACAOClickButton(Sender: TObject);
begin
    PesquisaNova(edtCOD_APRESENTACAO,false,true);
end;

procedure TfrmVEN_PEDIDO.edtCOD_FORNECEDORClickButton(Sender: TObject);
begin
    PesquisaNova(edtCOD_FORNECEDOR,false,true);
end;

procedure TfrmVEN_PEDIDO.edtCOD_P_ATIVOClickButton(Sender: TObject);
begin
  PesquisaNova(edtCOD_P_ATIVO,false,true);
end;

procedure TfrmVEN_PEDIDO.edtCOD_PRODUTOClickButton(Sender: TObject);
begin
  PesquisaNova(edtCOD_PRODUTO,false,true);
end;

procedure TfrmVEN_PEDIDO.edtCOD_CLIENTEExit(Sender: TObject);
begin
  if not PesquisaNova(edtCOD_CLIENTE,true,true) then
    if edtCOD_CLIENTE.Enabled then
      edtCOD_CLIENTE.SetFocus;
end;

procedure TfrmVEN_PEDIDO.edtCOD_PRODUTO_PESQExit(Sender: TObject);
begin
  if not PesquisaNova(edtCOD_PRODUTO_PESQ,true,true) then
    if edtCOD_PRODUTO_PESQ.Enabled then
      edtCOD_PRODUTO_PESQ.SetFocus;

end;

procedure TfrmVEN_PEDIDO.edtCOD_P_ATIVO_PESQExit(Sender: TObject);
begin
  if not PesquisaNova(edtCOD_P_ATIVO_PESQ,true,true) then
    if edtCOD_P_ATIVO_PESQ.Enabled then
      edtCOD_P_ATIVO_PESQ.SetFocus;
end;

procedure TfrmVEN_PEDIDO.edtCOD_APRESENTACAOExit(Sender: TObject);
begin
  if not PesquisaNova(edtCOD_APRESENTACAO,true,true) then
    if edtCOD_APRESENTACAO.Enabled then
      edtCOD_APRESENTACAO.SetFocus;
end;

procedure TfrmVEN_PEDIDO.edtCOD_FORNECEDORExit(Sender: TObject);
begin
  if not PesquisaNova(edtCOD_FORNECEDOR,true,true) then
    if edtCOD_FORNECEDOR.Enabled then
      edtCOD_FORNECEDOR.SetFocus;
end;

procedure TfrmVEN_PEDIDO.edtCOD_PRODUTOExit(Sender: TObject);
begin
  if not PesquisaNova(edtCOD_PRODUTO,true,true) then
    if edtCOD_PRODUTO.Enabled then
      edtCOD_PRODUTO.SetFocus;
end;

procedure TfrmVEN_PEDIDO.edtCOD_P_ATIVOExit(Sender: TObject);
begin
  if not PesquisaNova(edtCOD_P_ATIVO,true,true) then
    if edtCOD_P_ATIVO.Enabled then
      edtCOD_P_ATIVO.SetFocus;
end;

procedure TfrmVEN_PEDIDO.edtDAT_PEDIDOEnter(Sender: TObject);
begin
  if trim(edtDAT_PEDIDO.FormattedText) = '' then
    edtDAT_PEDIDO.Text := DateToStr(Date);
end;

procedure TfrmVEN_PEDIDO.btnAlterarClick(Sender: TObject);
begin
  if AlteraPedido then
  begin
    MessageDlg('Pedido alterado com sucesso.',mtInformation,[mbOK],0);
    if edtCOD_CLIENTE.Enabled then
      edtCOD_CLIENTE.SetFocus;
  end;
end;

function TfrmVEN_PEDIDO.AlteraPedido: boolean;
var
  str: string;
begin
  Result := false;
  if trim(edtNUM_PEDIDO.Text) = '' then
  begin
    MessageDlg('É necessário informar o Número',mtWarning,[mbOK],0);
    Exit;
  end;

  if trim(edtCOD_CLIENTE.Text) = '' then
  begin
    MessageDlg('É necessário informar o Cliente',mtWarning,[mbOK],0);
    if edtCOD_CLIENTE.Enabled then
      edtCOD_CLIENTE.SetFocus;
    Exit;
  end;

  if trim(edtDAT_PEDIDO.FormattedText) = '' then
  begin
    MessageDlg('É necessário informar a Data',mtWarning,[mbOK],0);
    if edtDAT_PEDIDO.Enabled then
      edtDAT_PEDIDO.SetFocus;
    Exit;
  end;

  str := 'Update VEN_PEDIDO ';
  str := str + ' Set ';
  str := str + ' COD_CLIENTE = '+cnn.NumberToBD(edtCOD_CLIENTE.Text)+',';
  str := str + ' DAT_PEDIDO = '+cnn.DateToBD(edtDAT_PEDIDO.Text);
  str := str + ' Where';
  str := str + ' NUM_PEDIDO = '+cnn.NumberToBD(edtNUM_PEDIDO.Text);

  cnn.Execute(str);

  Result := true;

end;

procedure TfrmVEN_PEDIDO.edtQTD_ATENDIDAChange(Sender: TObject);
begin
  edtPER_MARGEM.Enabled := trim(edtQTD_ATENDIDA.Text) <> '';
  edtVAL_UNITARIO.Enabled := trim(edtQTD_ATENDIDA.Text) <> '';
  //edtVAL_TOTAL.Enabled := trim(edtQTD_ATENDIDA.Text) <> '';
end;

procedure TfrmVEN_PEDIDO.PesquisaProdutos;
var
  str: string;
begin

  if trim(edtCOD_CLIENTE.Text) = '' then
  begin
    MessageDlg('É necessário informar o Cliente.',mtWarning,[mbOK],0);
    tab.ActivePage := tabPreenchimento;
    if edtCOD_CLIENTE.Enabled then
      edtCOD_CLIENTE.SetFocus;
    Exit;
  end;
  
  str := 'Select ';
  str := str +' A.COD_PRODUTO, ';
  str := str +' A.NOM_PRODUTO, ';
  str := str +' A.NOM_FORNECEDOR, ';
  str := str +' A.QTD_FISICO, ';
  str := str +' Case A.QTD_FISICO ';
  str := str +'   when 0.00 then 0.00 ';
  str := str +'   else Cast (A.VAL_FINAN / A.QTD_FISICO as Decimal(14,2)) ';
  str := str +' End as VAL_CUSTO, ';
  str := str +' Case ';
  str := str +'   when (A.QTD_FISICO = 0) or (B.NUM_FATOR_CONV = 0) then 0.00 ';
  str := str +'   else Cast (A.VAL_FINAN / A.QTD_FISICO / B.NUM_FATOR_CONV as Decimal(14,4)) ';
  str := str +' End as VAL_CUSTO_FATOR, ';
  str := str +' (Select First 1 ';
  str := str +'   Case X.QTD_MOV ';
  str := str +'     when 0.00 then 0.00 ';
  str := str +'     else Cast (X.VAL_PRODUTO / X.QTD_MOV as Decimal(14,2)) ';
  str := str +'   End ';
  str := str +'   From EST_ENTRADA X ';
  str := str +'   Where ';
  str := str +'     X.COD_EMPRESA = 1 And ';
  str := str +'     X.COD_FILIAL = 1 And ';
  str := str +'     X.COD_PRODUTO = A.COD_PRODUTO ';
  str := str +'   Order By ';
  str := str +'     DAT_MOV Desc, ';
  str := str +'     NUM_DOCUMENTO Desc, ';
  str := str +'     NOM_SERIE Desc, ';
  str := str +'     COD_FORNECEDOR Desc) VAL_ULT_ENTR, ';
  str := str +' (Select PER_MARGEM ';
  str := str +'   From CAD_CLIENTE ';
  str := str +'   Where COD_CLIENTE = '+edtCOD_CLIENTE.Text+') PER_MARGEM, ';
  str := str +' B.NUM_FATOR_CONV, ';
  str := str +' C.VAL_PRECO VAL_PRECO_COMPRA, ';
  str := str +' Case ';
  str := str +'   when (B.NUM_FATOR_CONV = 0) then 0.00 ';
  str := str +'   else Cast (C.VAL_PRECO / B.NUM_FATOR_CONV as Decimal(14,4)) ';
  str := str +' End as VAL_COMPRA_FATOR ';
  str := str +'   From ';
  str := str +' VW_PRODUTO A, ';
  str := str +' CAD_APRESENTACAO B, ';
  str := str +' VW_ULT_PRECO_COMPRA_PROD C ';
  str := str +' Where ';
  str := str +' A.COD_APRESENTACAO = B.COD_APRESENTACAO And ';
  str := str +' A.COD_PRODUTO = C.COD_PRODUTO ';

  if trim(edtCOD_PRODUTO_PESQ.Text) <> '' then
    str := str + ' And A.COD_PRODUTO = '+edtCOD_PRODUTO_PESQ.Text;

  if trim(edtCOD_P_ATIVO_PESQ.Text) <> '' then
    str := str + ' And A.COD_P_ATIVO = '+edtCOD_P_ATIVO_PESQ.Text;

  if trim(edtCOD_APRESENTACAO.Text) <> '' then
    str := str + ' And A.COD_APRESENTACAO = '+edtCOD_APRESENTACAO.Text;

  if trim(edtCOD_FORNECEDOR.Text) <> '' then
    str := str + ' And A.COD_FORNECEDOR = '+edtCOD_FORNECEDOR.Text;

  LimpaProduto;

  if cnn.ExecuteQuery(str,grdProd) then
  begin
    with grdProd do
    begin
      TFloatField(DataSource.DataSet.FieldByName('QTD_FISICO')).DisplayFormat := '#,##0.000';
      TFloatField(DataSource.DataSet.FieldByName('VAL_CUSTO')).DisplayFormat := '#,##0.00';
      TFloatField(DataSource.DataSet.FieldByName('VAL_PRECO_COMPRA')).DisplayFormat := '#,##0.00';
      TFloatField(DataSource.DataSet.FieldByName('VAL_ULT_ENTR')).DisplayFormat := '#,##0.00';
      TFloatField(DataSource.DataSet.FieldByName('VAL_CUSTO_FATOR')).DisplayFormat := '#,##0.0000';
      TFloatField(DataSource.DataSet.FieldByName('VAL_COMPRA_FATOR')).DisplayFormat := '#,##0.0000';
    end;
  end;

end;

procedure TfrmVEN_PEDIDO.btnPesquisaProdutosClick(Sender: TObject);
begin
  PesquisaProdutos;
end;

procedure TfrmVEN_PEDIDO.PreencheCamposProduto;
begin
  if Assigned(grdProd.DataSource) then
  begin
    with grdProd.DataSource.DataSet do
    begin
      edtCOD_PRODUTO.Text := FieldByName('COD_PRODUTO').AsString;
      edtNOM_PRODUTO.Text := FieldByName('NOM_PRODUTO').AsString;
      edtQTD_ESTOQUE.Text := FieldByName('QTD_FISICO').AsString;
      edtVAL_CUSTO.Text := FieldByName('VAL_CUSTO').AsString;
      edtVAL_CUSTO_UN.Text := FieldByName('VAL_CUSTO_FATOR').AsString;
      edtVAL_ULT_ENTRADA.Text := FieldByName('VAL_ULT_ENTR').AsString;
      edtPER_MARGEM.Text := FieldByName('PER_MARGEM').AsString;
      edtNUM_FATOR_CONV.Text := FieldByName('NUM_FATOR_CONV').AsString;
    end;
  end
  else
    LimpaProduto;

end;

procedure TfrmVEN_PEDIDO.grdProdDblClick(Sender: TObject);
begin
  PreencheCamposProduto;
  edtQTD_PEDIDA.SetFocus;
end;

procedure TfrmVEN_PEDIDO.grdProdCellClick(Column: TColumn);
begin
  PreencheCamposProduto;
end;

procedure TfrmVEN_PEDIDO.grdProdKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  PreencheCamposProduto;
end;

procedure TfrmVEN_PEDIDO.edtQTD_ATENDIDAEnter(Sender: TObject);
begin
    if (trim(edtQTD_ESTOQUE.Text) <> '') and
     (trim(edtQTD_PEDIDA.Text) <> '') and
     (trim(edtQTD_ATENDIDA.Text) = '') then
  begin
    if StrToCur(edtQTD_PEDIDA.Text) <= StrToCur(edtQTD_ESTOQUE.Text) then
      edtQTD_ATENDIDA.Text := edtQTD_PEDIDA.Text
    else
      edtQTD_ATENDIDA.Text := edtQTD_ESTOQUE.Text;
  end;
  
end;

procedure TfrmVEN_PEDIDO.GravaProduto;
var
  str: string;
  ds: TDataSource;
begin

  if trim(edtNUM_PEDIDO.Text) = '' then
  begin
    MessageDlg('É necessário preencher o campo Pedido.',mtWarning,[mbOK],0);
    Exit;
  end;

  if trim(edtCOD_PRODUTO.Text) = '' then
  begin
    MessageDlg('É necessário preencher o campo Produto.',mtWarning,[mbOK],0);
    Exit;
  end;

  if trim(edtQTD_PEDIDA.Text) = '' then
  begin
    MessageDlg('É necessário preencher o campo Qtd. Pedida.',mtWarning,[mbOK],0);
    Exit;
  end;

  if trim(edtQTD_ATENDIDA.Text) = '' then
  begin
    MessageDlg('É necessário preencher o campo Qtd. Atendida.',mtWarning,[mbOK],0);
    Exit;
  end;

  if trim(edtQTD_FECHADA.Text) = '' then
  begin
    MessageDlg('É necessário preencher o campo Qtd. Fechada.',mtWarning,[mbOK],0);
    Exit;
  end;

  if trim(edtVAL_UNITARIO.Text) = '' then
  begin
    MessageDlg('É necessário preencher o campo Valor Unitário.',mtWarning,[mbOK],0);
    Exit;
  end;

  if trim(edtPER_MARGEM.Text) = '' then
  begin
    MessageDlg('É necessário preencher o campo % Margem.',mtWarning,[mbOK],0);
    Exit;
  end;

  str := 'Select COD_PRODUTO ';
  str := str + ' From VEN_PED_ITEM ';
  str := str + ' Where ';
  str := str + ' NUM_PEDIDO ='+cnn.NumberToBD(edtNUM_PEDIDO.Text)+' And ';
  str := str + ' COD_PRODUTO ='+cnn.NumberToBD(edtCOD_PRODUTO.Text);

  if cnn.ExecuteQuery(str,ds) then
  begin
    str := 'Update VEN_PED_ITEM ';
    str := str + ' Set ';
    str := str + ' QTD_PEDIDA = '+cnn.NumberToBD(edtQTD_PEDIDA.Text)+',';
    str := str + ' QTD_ATENDIDA = '+cnn.NumberToBD(edtQTD_ATENDIDA.Text)+',';
    str := str + ' QTD_FECHADA = '+cnn.NumberToBD(edtQTD_FECHADA.Text)+',';
    str := str + ' VAL_UNITARIO = '+cnn.NumberToBD(edtVAL_UNITARIO.Text)+',';
    str := str + ' PER_MARGEM = '+cnn.NumberToBD(edtPER_MARGEM.Text);
    str := str + ' Where ';
    str := str + ' NUM_PEDIDO ='+cnn.NumberToBD(edtNUM_PEDIDO.Text)+' And ';
    str := str + ' COD_PRODUTO ='+cnn.NumberToBD(edtCOD_PRODUTO.Text);
  end
  else
  begin
    str := 'Insert Into VEN_PED_ITEM( ';
    str := str + ' NUM_PEDIDO, ';
    str := str + ' COD_PRODUTO, ';
    str := str + ' QTD_PEDIDA, ';
    str := str + ' QTD_ATENDIDA, ';
    str := str + ' QTD_FECHADA, ';
    str := str + ' VAL_UNITARIO, ';
    str := str + ' PER_MARGEM ';
    str := str + ' ) Values ( ';
    str := str + cnn.NumberToBD(edtNUM_PEDIDO.Text)+',';
    str := str + cnn.NumberToBD(edtCOD_PRODUTO.Text)+',';
    str := str + cnn.NumberToBD(edtQTD_PEDIDA.Text)+',';
    str := str + cnn.NumberToBD(edtQTD_ATENDIDA.Text)+',';
    str := str + cnn.NumberToBD(edtQTD_FECHADA.Text)+',';
    str := str + cnn.NumberToBD(edtVAL_UNITARIO.Text)+',';
    str := str + cnn.NumberToBD(edtPER_MARGEM.Text)+')';
  end;

  cnn.Execute(str);

  LimpaProduto;

  CarregaItemPedido;

end;

procedure TfrmVEN_PEDIDO.CarregaItemPedido;
var
  str: string;
  cur, curPerFechado: currency;
  curQtdPedida, curQtdAtendida, curQtdFechada: currency;
begin
  if trim(edtNUM_PEDIDO.Text) = '' then
  begin
    MessageDlg('É necessário informar o número do Pedido.',mtWarning,[mbOK],0);
    Exit;
  end;

  str := 'Select ';
  str := str + cnn.Aspas('P')+' TIPO, '; //PRODUTO
  str := str +' A.COD_PRODUTO, ';
  str := str +' Cast(A.NOM_PRODUTO as Varchar(120)) NOM_PRODUTO, ';
  str := str +' Cast(A.NOM_FORNECEDOR as Varchar(80)) NOM_FORNECEDOR, ';
  str := str +' B.QTD_PEDIDA, ';
  str := str +' B.QTD_ATENDIDA, ';
  str := str +' B.QTD_FECHADA, ';
  str := str +' B.VAL_UNITARIO, ';
  str := str +' B.QTD_ATENDIDA * B.VAL_UNITARIO VAL_TOTAL,';
  str := str +' Cast(B.VAL_UNITARIO / C.NUM_FATOR_CONV as Decimal(14,4)) VAL_FATOR,';
  str := str +' Cast (B.PER_MARGEM as Decimal(5,2)) PER_MARGEM ';
  str := str +' From ';
  str := str +' VW_PRODUTO A, ';
  str := str +' VEN_PED_ITEM B, ';
  str := str +' CAD_APRESENTACAO C ';
  str := str +' Where ';
  str := str +' A.COD_PRODUTO = B.COD_PRODUTO And ';
  str := str +' A.COD_APRESENTACAO = C.COD_APRESENTACAO And ';
  str := str +' B.NUM_PEDIDO = '+cnn.NumberToBD(edtNUM_PEDIDO.Text) ;
  str := str +' Union All ';
  str := str +' Select ';
  str := str + cnn.Aspas('A')+' TIPO, '; //PRINCÍPIO ATIVO
  str := str +' B.COD_P_ATIVO COD_PRODUTO, ';
  str := str +' Cast(B.NOM_P_ATIVO ||'+cnn.Aspas(' - PRINCÍPIO ATIVO')+'as Varchar(120)) NOM_PRODUTO, ';
  str := str +' Cast(Null as Varchar(80)) NOM_FORNECEDOR, ';
  str := str +' A.QTD_PEDIDA, ';
  str := str +' 0.00 QTD_ATENDIDA, ';
  str := str +' 0.00 QTD_FECHADA, ';
  str := str +' 0.00 VAL_UNITARIO, ';
  str := str +' 0.00 VAL_TOTAL,';
  str := str +' Cast (0 as Decimal(14,4)) VAL_FATOR,';
  str := str +' Cast (0 as Decimal(5,2)) PER_MARGEM ';
  str := str +'   From ';
  str := str +' VEN_PED_P_ATIVO A, ';
  str := str +' CAD_P_ATIVO B ';
  str := str +' Where ';
  str := str +' A.COD_P_ATIVO = B.COD_P_ATIVO And ';
  str := str +' A.NUM_PEDIDO = '+cnn.NumberToBD(edtNUM_PEDIDO.Text) ;
  str := str +' Order By 3';

  if cnn.ExecuteQuery(str,grdPed) then
  begin
    with grdPed do
    begin
      TFloatField(DataSource.DataSet.FieldByName('QTD_PEDIDA')).DisplayFormat := '#,##0.000';
      TFloatField(DataSource.DataSet.FieldByName('QTD_ATENDIDA')).DisplayFormat := '#,##0.000';
      TFloatField(DataSource.DataSet.FieldByName('QTD_FECHADA')).DisplayFormat := '#,##0.000';
      TFloatField(DataSource.DataSet.FieldByName('VAL_UNITARIO')).DisplayFormat := '#,##0.00';
      TFloatField(DataSource.DataSet.FieldByName('VAL_TOTAL')).DisplayFormat := '#,##0.00';
      TFloatField(DataSource.DataSet.FieldByName('VAL_FATOR')).DisplayFormat := '#,##0.0000';
      TFloatField(DataSource.DataSet.FieldByName('PER_MARGEM')).DisplayFormat := '#,##0.00';
      cur := 0;
      DataSource.DataSet.Prior;
      while not DataSource.DataSet.Eof do
      begin
        cur := cur + RoundTo(DataSource.DataSet.FieldByName('VAL_TOTAL').AsCurrency,-2);
        curQtdPedida := curQtdPedida + RoundTo(DataSource.DataSet.FieldByName('QTD_PEDIDA').AsCurrency,-3);
        curQtdAtendida := curQtdAtendida + RoundTo(DataSource.DataSet.FieldByName('QTD_ATENDIDA').AsCurrency,-3);
        curQtdFechada := curQtdFechada + RoundTo(DataSource.DataSet.FieldByName('QTD_FECHADA').AsCurrency,-3);
        DataSource.DataSet.Next;
      end;
      lblValorTotal.Caption := 'Valor Total: '+FormatCurr('#,##0.00',cur);
      lblQtdPedidaTotal.Caption :=FormatCurr('#,##0.000',curQtdPedida);
      lblQtdAtendidaTotal.Caption :=FormatCurr('#,##0.000',curQtdAtendida);
      lblQtdFechadaTotal.Caption :=FormatCurr('#,##0.000',curQtdFechada);

      //CALCULANDO O PERCENTUAL DE ATENDIMENTO
      if curQtdPedida = 0 then
        cur := 0
      else
        cur := curQtdAtendida / curQtdPedida * 100;

      //CALCULANDO O PERCENTUAL FECHADO
      if curQtdPedida = 0 then
        curPerFechado := 0
      else
        curPerFechado := curQtdFechada / curQtdPedida * 100;

      lblPerAtendimento.Caption := FormatCurr('#,##0.00',cur)+'%';
      lblPerFechado.Caption := FormatCurr('#,##0.00',curPerFechado)+'%';
    end;
  end
  else
    LimpaLabels;
end;

procedure TfrmVEN_PEDIDO.btnIncluirProdutoClick(Sender: TObject);
begin
  GravaProduto;
  CarregaItemPedido;
end;

procedure TfrmVEN_PEDIDO.GravaPrincipioAtivo;
var
  str: string;
  ds: TDataSource;
begin
  if trim(edtNUM_PEDIDO.Text) = '' then
  begin
    MessageDlg('É necessário preencher o campo Pedido.',mtWarning,[mbOK],0);
    Exit;
  end;

  if trim(edtCOD_P_ATIVO.Text) = '' then
  begin
    MessageDlg('É necessário preencher o campo Princípio Ativo.',mtWarning,[mbOK],0);
    Exit;
  end;

  if trim(edtQTD_PEDIDA_P_ATIVO.Text) = '' then
  begin
    MessageDlg('É necessário preencher o campo % Margem.',mtWarning,[mbOK],0);
    Exit;
  end;

  str := 'Select COD_P_ATIVO ';
  str := str + ' From VEN_PED_P_ATIVO ';
  str := str + ' Where ';
  str := str + ' NUM_PEDIDO = '+cnn.NumberToBD(edtNUM_PEDIDO.Text)+' And ';
  str := str + ' COD_P_ATIVO = '+cnn.NumberToBD(edtCOD_P_ATIVO.Text);

  if cnn.ExecuteQuery(str,ds) then
  begin
    str := 'Update VEN_PED_P_ATIVO ';
    str := str + ' Set ';
    str := str + ' QTD_PEDIDA = '+cnn.NumberToBD(edtQTD_PEDIDA_P_ATIVO.Text);
    str := str + ' Where ';
    str := str + ' NUM_PEDIDO = '+cnn.NumberToBD(edtNUM_PEDIDO.Text)+' And ';
    str := str + ' COD_P_ATIVO = '+cnn.NumberToBD(edtCOD_P_ATIVO.Text);
  end
  else
  begin
    str := 'Insert Into VEN_PED_P_ATIVO( ';
    str := str + ' NUM_PEDIDO, ';
    str := str + ' COD_P_ATIVO, ';
    str := str + ' QTD_PEDIDA ';
    str := str + ' ) Values (';
    str := str + cnn.NumberToBD(edtNUM_PEDIDO.Text)+',';
    str := str + cnn.NumberToBD(edtCOD_P_ATIVO.Text)+',';
    str := str + cnn.NumberToBD(edtQTD_PEDIDA_P_ATIVO.Text)+')';
  end;

  cnn.Execute(str);

  LimpaPrincipoAtivo;

end;

procedure TfrmVEN_PEDIDO.btnIncluirPrincipioAtivoClick(Sender: TObject);
begin
  GravaPrincipioAtivo;
  CarregaItemPedido;
end;

procedure TfrmVEN_PEDIDO.LimpaLabels;
begin
  lblValorTotal.Caption := 'Valor Total: 0,00';
  lblQtdPedidaTotal.Caption := '0,000';
  lblQtdAtendidaTotal.Caption := '0,000';
  lblQtdFechadaTotal.Caption := '0,000';
  lblPerAtendimento.Caption := '0,00%';
  lblPerFechado.Caption := '0,00%';
end;

procedure TfrmVEN_PEDIDO.grdPedDblClick(Sender: TObject);
begin
  if Assigned(grdPed.DataSource) then
  begin
    with grdPed.DataSource.DataSet do
    begin
      if FieldByName('TIPO').AsString = 'A' then //PRINCÍPIO ATIVO
      begin
        tab.ActivePage := tabPrincipioAtivo;
        edtCOD_P_ATIVO.Text := FieldByName('COD_PRODUTO').AsString;
        edtQTD_PEDIDA_P_ATIVO.Text := FieldByName('QTD_PEDIDA').AsString;
        if edtQTD_PEDIDA_P_ATIVO.Enabled then
          edtQTD_PEDIDA_P_ATIVO.SetFocus;
      end
      else //PRODUTO
      begin
        tab.ActivePage := tabProduto;
        edtCOD_PRODUTO_PESQ.Text := FieldByName('COD_PRODUTO').AsString;
        edtCOD_P_ATIVO_PESQ.Text := '';
        edtCOD_APRESENTACAO.Text := '';
        edtCOD_FORNECEDOR.Text := '';
        btnPesquisaProdutosClick(btnPesquisaProdutos);
        grdProdDblClick(grdProd);
        edtQTD_PEDIDA.Text := FieldByName('QTD_PEDIDA').AsString;
        edtQTD_ATENDIDA.Text := FieldByName('QTD_ATENDIDA').AsString;
        edtQTD_FECHADA.Text := FieldByName('QTD_FECHADA').AsString;        
        edtPER_MARGEM.Text := FieldByName('PER_MARGEM').AsString;
        edtVAL_UNITARIO.Text := FieldByName('VAL_UNITARIO').AsString;
        edtVAL_TOTAL.Text := FieldByName('VAL_TOTAL').AsString;
      end;
    end;
  end;
end;

procedure TfrmVEN_PEDIDO.ExcluiPrincioAtivo(NumPedido,
  CodPrincipioAtivo: integer);
var
  str: string;
begin

  str := 'Delete From VEN_PED_P_ATIVO ';
  str := str + ' Where ';
  str := str + ' NUM_PEDIDO = '+cnn.NumberToBD(NumPedido)+' And ';
  str := str + ' COD_P_ATIVO = '+cnn.NumberToBD(CodPrincipioAtivo);

  cnn.Execute(str);

end;

procedure TfrmVEN_PEDIDO.ExcluiProduto(NumPedido,
  CodProduto: integer);
var
  str: string;
begin

  str := 'Delete From VEN_PED_ITEM ';
  str := str + ' Where ';
  str := str + ' NUM_PEDIDO = '+cnn.NumberToBD(NumPedido)+' And ';
  str := str + ' COD_PRODUTO = '+cnn.NumberToBD(CodProduto);

  cnn.Execute(str);

end;

procedure TfrmVEN_PEDIDO.ExcluiPedido(NumPedido: integer);
var
  str: string;
begin

  str := 'Delete From VEN_PEDIDO ';
  str := str + ' Where ';
  str := str + ' NUM_PEDIDO = '+cnn.NumberToBD(NumPedido);

  cnn.Execute(str);

end;

procedure TfrmVEN_PEDIDO.grdPedKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case key of
    VK_DELETE:
    begin
      if Assigned(grdPed.DataSource) then
      begin
        if MessageDlg('Deseja excluir o item '+
         grdPed.DataSource.DataSet.FieldByName('COD_PRODUTO').AsString+' - '+
         grdPed.DataSource.DataSet.FieldByName('NOM_PRODUTO').AsString+' ?',
         mtConfirmation,[mbNo,mbYes],0) = mrNo then
          Exit;

        if grdPed.DataSource.DataSet.FieldByName('TIPO').AsString = 'P' then
        begin
          ExcluiProduto(
            StrToInt(edtNUM_PEDIDO.Text),
            grdPed.DataSource.DataSet.FieldByName('COD_PRODUTO').AsInteger);
        end
        else
        begin
          ExcluiPrincioAtivo(
            StrToInt(edtNUM_PEDIDO.Text),
            grdPed.DataSource.DataSet.FieldByName('COD_PRODUTO').AsInteger);
        end;
        CarregaItemPedido;
      end;

    end
  end;
end;

procedure TfrmVEN_PEDIDO.CalculaMargem;
begin
  if (trim(edtVAL_UNITARIO.Text) <> '') and
     (trim(edtVAL_CUSTO.Text) <> '') then
  begin
    if  StrToCur(edtVAL_CUSTO.Text) > 0 then
    begin
      edtPER_MARGEM.Text := FormatCurr('#,##0.00',((StrToCur(edtVAL_UNITARIO.Text) /
        StrToCur(edtVAL_CUSTO.Text))-1) * 100);
    end;        
  end;
end;

procedure TfrmVEN_PEDIDO.CalculaPrecoTotal;
begin
  if (trim(edtVAL_UNITARIO.Text) <> '') and
     (trim(edtQTD_ATENDIDA.Text) <> '') then
  begin

    edtVAL_TOTAL.Text := FormatCurr('#,##0.00',StrToCur(edtVAL_UNITARIO.Text) *
       StrToCur(edtQTD_ATENDIDA.Text));
  end;

end;

procedure TfrmVEN_PEDIDO.CalculaPrecoUnitario;
begin
  if (trim(edtVAL_CUSTO.Text) <> '') and
     (trim(edtPER_MARGEM.Text) <> '') then
  begin
    edtVAL_UNITARIO.Text := FormatCurr('#,##0.00',RoundTo(
      (StrToCur(edtPER_MARGEM.Text) / 100 + 1) * StrToCur(edtVAL_CUSTO.Text), -2));
  end;
end;

procedure TfrmVEN_PEDIDO.CalculaPrecoFator;
begin
  if (trim(edtNUM_FATOR_CONV.Text) <> '') and
     (trim(edtVAL_UNITARIO.Text) <> '') then
  begin

    if (trim(edtNUM_FATOR_CONV.Text) <> '') and
       (StrToCur(edtNUM_FATOR_CONV.Text) > 0) then
    edtVAL_PRECO_FATOR.Text := FormatCurr('#,##0.0000',StrToCur(edtVAL_UNITARIO.Text) /
       StrToCur(edtNUM_FATOR_CONV.Text));

  end;

end;

procedure TfrmVEN_PEDIDO.edtPER_MARGEMExit(Sender: TObject);
begin
  CalculaPrecoUnitario;
  CalculaPrecoFator;
  CalculaPrecoTotal;
end;

procedure TfrmVEN_PEDIDO.edtVAL_UNITARIOExit(Sender: TObject);
begin
  CalculaMargem;
  CalculaPrecoFator;
  CalculaPrecoTotal;
end;

procedure TfrmVEN_PEDIDO.btnExcluirClick(Sender: TObject);
begin
  if trim(edtNUM_PEDIDO.Text) = '' then
    Exit;

  if MessageDlg('Deseja excluir o Pedido/Licitação Nº: '+edtNUM_PEDIDO.Text+
    ' e todos seus itens?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin
    ExcluiPedido(StrToInt(edtNUM_PEDIDO.Text));
    LimpaCampos;
  end;
end;

procedure TfrmVEN_PEDIDO.edtQTD_FECHADAEnter(Sender: TObject);
begin
  if Trim(edtQTD_FECHADA.Text) = '' then
  begin
    edtQTD_FECHADA.Text := '0,000';
    edtQTD_FECHADA.SelectAll;
  end;
end;

procedure TfrmVEN_PEDIDO.Button1Click(Sender: TObject);
begin
  //grdProd.DataSource.DataSet.
end;

end.

