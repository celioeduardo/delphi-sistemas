unit UAcertoEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, UComponentTag, Mask, EditLabel, Grids, DBGrids,
  ComCtrls, Buttons,UConexao, UPesquisa, UGlobal, ExtCtrls;

type
  TfrmAcertoEstoque = class(TForm)
    tab: TPageControl;
    tabAcerto: TTabSheet;
    edtDAT_ACERTO: TEditLabel;
    edtCOD_PRODUTO: TEditLabel;
    edtSaldoFisico: TEditLabel;
    lvw: TListViewTag;
    btnInserirProduto: TButton;
    btnExcluirProduto: TButton;
    edtNOM_PRODUTO: TEditTag;
    edtSaldoFisicoApurado: TEditLabel;
    pnl3: TPanel;
    btnInclui: TBitBtn;
    btnSair: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSairClick(Sender: TObject);
    procedure edtCOD_PRODUTOClickButton(Sender: TObject);
    procedure edtCOD_PRODUTOExit(Sender: TObject);
    procedure edtDAT_ACERTOChange(Sender: TObject);
    procedure edtCOD_PRODUTOChange(Sender: TObject);
    procedure btnInserirProdutoClick(Sender: TObject);
    procedure btnExcluirProdutoClick(Sender: TObject);
    procedure btnIncluiClick(Sender: TObject);
    procedure edtDAT_ACERTOExit(Sender: TObject);


  private
    procedure LimpaProduto;
    function PesquisaNova(Sender: TObject; blnValida, Msg: boolean): boolean;
    procedure InsereProdutoNaLista;
    procedure DefineSaldoFisicoApurado;
    procedure GravaAcerto;
    function VerificaFornecedorAjuste: boolean;
    function SugereNumeroEntrada: integer;
    function SugereNumeroSaida: integer;
    procedure AcertaListaQtdAjuste;    
  public

  end;

var
  frmAcertoEstoque: TfrmAcertoEstoque;
  Pesquisa   :TPesquisa;
  cnn        :TConexao;


implementation

{$R *.dfm}

uses DB, Functions, Math, UEstoque;

procedure TfrmAcertoEstoque.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    if Messagedlg('Deseja Sair?',mtConfirmation,[mbYes,mbNo],0) = MRYes then
  begin
    Action := CaFree
  end
  else
    Action := caNone;
end;

procedure TfrmAcertoEstoque.FormCreate(Sender: TObject);
begin
  Left:=0;
  Top:=0;
  cnn := TConexao.Create(GloStrUser,GloStrPassword,GloStrDatabase, GloStrServer, GloBlnEmbedded);
  cnn.Open;
end;

procedure TfrmAcertoEstoque.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_RETURN: keybd_event(VK_TAB,0,0,0);

    VK_ESCAPE: btnSairClick(Sender);
  end;
end;


procedure TfrmAcertoEstoque.btnSairClick(Sender: TObject);
begin
  Close;
end;

function TfrmAcertoEstoque.PesquisaNova(Sender: TObject; blnValida,
  Msg: boolean): boolean;
var Edt      : TEditlabel;
    EdtN     : TEdit;
    Pesquisa : TPesquisa;
    str      : array[0..2] of string;

begin
  Edt := Sender as TEditLabel;
  EdtN:= Edt._Edit;

  if (Edt._Campo = 'COD_PRODUTO') then
  begin
    str[0] := 'COD_PRODUTO,NOM_PRODUTO';
    str[1] := 'VW_PRODUTO';
    str[2] := EmptyStr;
  end
  else
    Exit;

  Pesquisa := TPesquisa.Create;
  Result := Pesquisa.ExecutaPesquisa(blnValida,str[0],str[1],Edt,EdtN,str[2],Msg);

  Pesquisa.Free;
end;


procedure TfrmAcertoEstoque.edtCOD_PRODUTOClickButton(Sender: TObject);
begin
  PesquisaNova(edtCOD_PRODUTO,false,true);
end;

procedure TfrmAcertoEstoque.edtCOD_PRODUTOExit(Sender: TObject);

begin
  if not PesquisaNova(edtCOD_PRODUTO,true,true) then
  begin
    if edtCOD_PRODUTO.Enabled then
      edtCOD_PRODUTO.SetFocus;
    Exit;
  end;

  DefineSaldoFisicoApurado;
  
end;


procedure TfrmAcertoEstoque.LimpaProduto;
begin
  edtCOD_PRODUTO.Text := '';
  edtSaldoFisico.Text := '';
  edtSaldoFisicoApurado.Text := '';
end;

procedure TfrmAcertoEstoque.edtDAT_ACERTOChange(Sender: TObject);
begin
  edtCOD_PRODUTO.Text := '';
  edtCOD_PRODUTO.Enabled := trim(edtDAT_ACERTO.Text) <> '';

end;

procedure TfrmAcertoEstoque.edtCOD_PRODUTOChange(Sender: TObject);
begin
  edtSaldoFisico.Text := '';
  edtSaldoFisico.Enabled := trim(edtCOD_PRODUTO.Text) <> '';
end;

procedure TfrmAcertoEstoque.btnInserirProdutoClick(Sender: TObject);
begin
  InsereProdutoNaLista;
end;

procedure TfrmAcertoEstoque.InsereProdutoNaLista;
var item: TListItem;
    i,index: integer;
    curQtdAjuste: currency;
begin
  if trim(edtCOD_PRODUTO.Text) = '' then
  begin
    MessageDlg( 'O campo Código Produto deve ser preenchido.',mtWarning,[mbOK],0);
    if edtCOD_PRODUTO.Enabled then
      edtCOD_PRODUTO.SetFocus;
    Exit;
  end;

  if trim(edtSaldoFisico.Text) = '' then
  begin
    MessageDlg('O campo Saldo Físico deve ser preenchido.',mtWarning,[mbOK],0);
    Exit;
  end;

  index := -1;

  for i := 1 to lvw.Items.Count do
  begin
    if trim(lvw.Items.Item[i-1].Caption) = trim(edtCOD_PRODUTO.Text) then
    begin
      index := i-1;
      Break;
    end;
  end;

  if (trim(edtSaldoFisicoApurado.Text) <> '') then
    curQtdAjuste := StrToCur(edtSaldoFisico.Text) - StrToCur(edtSaldoFisicoApurado.Text); 

  if index >= 0 then
  begin
    if MessageDlg('Esse produto já existe na lista. Deseja atualizar?',
         mtConfirmation,[mbYes,mbNo],0) = mrNo then
      Exit;
    lvw.Items.Item[index].Caption := edtCOD_PRODUTO.Text;
    lvw.Items.Item[index].SubItems[0] := edtNOM_PRODUTO.Text;
    lvw.Items.Item[index].SubItems[1] := edtSaldoFisico.Text;
    lvw.Items.Item[index].SubItems[2] := FormatCurr('#,##0.000',curQtdAjuste);
  end
  else
  begin
    item := lvw.Items.Add;
    item.Caption := edtCOD_PRODUTO.Text;
    item.SubItems.Add(edtNOM_PRODUTO.Text);
    item.SubItems.Add(edtSaldoFisico.Text);
    item.SubItems.Add(FormatCurr('#,##0.000',curQtdAjuste));
  end;

  edtCOD_PRODUTO.Text := '';
  edtSaldoFisico.Text := '';
  edtSaldoFisicoApurado.Text := '';
  edtCOD_PRODUTO.SetFocus;
end;

procedure TfrmAcertoEstoque.btnExcluirProdutoClick(Sender: TObject);
begin
  lvw.DeletaItemSelecionado;
end;

procedure TfrmAcertoEstoque.DefineSaldoFisicoApurado;
var
  est: TEstoque;
begin
  if trim(edtCOD_PRODUTO.Text) <> '' then
  begin
    est := TEstoque.Create;
    edtSaldoFisicoApurado.Text := FormatCurr('#,##0.000',
      est.SaldoFisico(1,1,StrToInt(edtCOD_PRODUTO.Text),StrToDate(edtDAT_ACERTO.Text)));
  end;
end;

procedure TfrmAcertoEstoque.GravaAcerto;
var
  ent: TEntradaNF;
  sai: TSaidaNF;
  i: integer;
  str: string;
begin
  ent := TEntradaNF.Create;
  sai := TSaidaNF.Create;

  for i := 0 to lvw.Items.Count-1 do
  begin
    if StrToCur(lvw.Items.Item[i].SubItems[2]) > 0 then
      ent.Produtos.Add(
        StrToInt(lvw.Items.Item[i].Caption),
        lvw.Items.Item[i].SubItems[0],
        StrToCur(lvw.Items.Item[i].SubItems[2]),
        0)
    else if StrToCur(lvw.Items.Item[i].SubItems[2]) < 0 then
      sai.Produtos.Add(
        StrToInt(lvw.Items.Item[i].Caption),
        lvw.Items.Item[i].SubItems[0],
        StrToCur(lvw.Items.Item[i].SubItems[2]) * -1,
        0);
  end;

  //ENTRADA
  if ent.Produtos.Count > 0 then
  begin
    if not VerificaFornecedorAjuste then
      Exit;
    ent.CodEmpresa := 1;
    ent.CodFilial := 1;
    ent.CodFornecedor := 0;
    ent.NumDocumento := SugereNumeroEntrada;
    ent.NomSerie := 'ACE';
    ent.DatEmissao := Date;
    ent.DatEntrada := StrToDate(edtDAT_ACERTO.Text);
    ent.Tipo := 'A'; //ACERTO
    ent.ValTotal := 0;
    ent.ValCustosNF := 0;
    ent.ValCustos := 0;
    if not ent.GravaNota then
    begin
      MessageDlg(ent.MsgErro,mtWarning,[mbOK],0);
      Exit;
    end;
  end;

  //SAÍDA
  if sai.Produtos.Count > 0 then
  begin
    sai.CodEmpresa := 1;
    sai.CodFilial := 1;
    sai.NumDocumento := SugereNumeroSaida;
    sai.NomSerie := 'ACE';
    sai.DatEmissao := Date;
    sai.DatSaida := StrToDate(edtDAT_ACERTO.Text);
    sai.Tipo := 'A'; //ACERTO
    sai.ValTotal := 0;
    if not sai.GravaNota then
    begin
      MessageDlg(sai.MsgErro,mtWarning,[mbOK],0);
      Exit;
    end;
  end;

  MessageDlg('Operação efetuada com sucesso.',mtInformation,[mbOK],0);

  edtDAT_ACERTO.Text := '';
  lvw.Items.Clear;
  edtDAT_ACERTO.SetFocus;

end;

function TfrmAcertoEstoque.VerificaFornecedorAjuste: boolean;
var
  str : string;
  ds: TDataSource;
  strNomeEmpresa: string;
begin
  str := 'Select NOM_EMPRESA ';
  str := str + ' From CAD_EMPRESA ';
  str := str + ' Where COD_EMPRESA = 1';

  if not cnn.ExecuteQuery(str,ds) then
  begin
    MessageDlg('Não foi encontrado o nome da Empresa 1',mtWarning,[mbOK],0);
    Result := false;
    Exit
  end
  else
    strNomeEmpresa := ds.DataSet.FieldByName('NOM_EMPRESA').AsString;

  str := 'Select COD_FORNECEDOR ';
  str := str + ' From CAD_FORNECEDOR ';
  str := str + ' Where COD_FORNECEDOR = 0';

  if not cnn.ExecuteQuery(str,ds) then
  begin
    str := 'Insert Into CAD_FORNECEDOR( ';
    str := str + ' COD_FORNECEDOR, ';
    str := str + ' NOM_FORNECEDOR ';
    str := str + ' ) Values (';
    str := str + ' 0, ';
    str := str + cnn.Aspas(strNomeEmpresa)+')';

    cnn.Execute(str);

    Result := true;

  end
  else
    Result := true;

end;

function TfrmAcertoEstoque.SugereNumeroEntrada: integer;
var
  str: string;
  ds: TDataSource;
begin
  str := 'Select Max(NUM_DOCUMENTO) + 1 NUM_DOCUMENTO From FIS_ENTRADA ';
  str := str + ' Where COD_EMPRESA = 1 And ';
  str := str + ' COD_FORNECEDOR = 0 And ';
  str := str + ' NOM_SERIE = '+cnn.Aspas('ACE');  

  if cnn.ExecuteQuery(str,ds) then
  begin
    if trim(ds.DataSet.Fields[0].AsString) = EmptyStr then
      Result := 1
    else
      Result := ds.DataSet.Fields[0].AsInteger;
  end
  else
    Result := 1;

end;

function TfrmAcertoEstoque.SugereNumeroSaida: integer;
var
  str: string;
  ds: TDataSource;
begin
  str := 'Select Max(NUM_DOCUMENTO) + 1 NUM_DOCUMENTO From FIS_SAIDA ';
  str := str + ' Where COD_EMPRESA = 1 And ';
  str := str + ' NOM_SERIE = '+cnn.Aspas('ACE');

  if cnn.ExecuteQuery(str,ds) then
  begin
    if trim(ds.DataSet.Fields[0].AsString) = EmptyStr then
      Result := 1
    else
      Result := ds.DataSet.Fields[0].AsInteger;
  end
  else
    Result := 1;

end;

procedure TfrmAcertoEstoque.btnIncluiClick(Sender: TObject);
begin
  if MessageDlg('Deseja acertar o Saldo Físico dos Produtos informados?',
   mtConfirmation,[mbYes,mbNo],0) = mrYes then
    GravaAcerto;
end;

procedure TfrmAcertoEstoque.AcertaListaQtdAjuste;
var
  est: TEstoque;
  i: integer;
  aux: currency;
begin
  if trim(edtDAT_ACERTO.Text) <> '' then
  begin
    est := TEstoque.Create;

    for i := 0 to lvw.Items.Count-1 do
    begin
      aux := est.SaldoFisico(1,1,StrToInt(lvw.Items.Item[i].Caption),
        StrToDate(edtDAT_ACERTO.Text));
      aux := StrToCur(lvw.Items.Item[i].SubItems[1]) - aux;
      lvw.Items.Item[i].SubItems[2] := FormatCurr('#,##0.000',aux);
    end;
  end;

end;

procedure TfrmAcertoEstoque.edtDAT_ACERTOExit(Sender: TObject);
begin
  AcertaListaQtdAjuste;
end;

end.

