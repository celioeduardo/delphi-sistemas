unit UNotaFiscal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, EditLabel, UComponentTag, UConexao, Grids,
  DBGrids, ComCtrls;

type
  TfrmNotaFiscal = class(TForm)
    edtNota: TEditLabel;
    edtPublico: TEditLabel;
    edtPublicoN: TEditTag;
    edtEndereco: TEditLabel;
    edtCIDADE: TEditLabel;
    edtCNPJ: TEditLabel;
    edtIE: TEditLabel;
    edtCEP: TEditLabel;
    edtBairro: TEditLabel;
    edtDatEmissao: TEditLabel;
    grpPublico: TGroupBox;
    tab: TPageControl;
    tabItem: TTabSheet;
    tabItens: TTabSheet;
    memDescricao: TMemoTag;
    edtValor: TEditLabel;
    btnInserir: TButton;
    grd: TStringGrid;
    btnEmitirNF: TButton;
    edtCodLayout: TEditLabel;
    edtNomLayout: TEditTag;
    edtCodEmpresa: TEditLabel;
    edtNomEmpresa: TEditTag;
    edtPracaPagto: TEditLabel;
    edtLimparItem: TButton;
    edtLimparTodosItens: TButton;
    edtUF: TEditLabel;
    edtValTotal: TEditLabel;
    tabFatura: TTabSheet;
    grpFatura: TGroupBox;
    edtValFatura: TEditLabel;
    edtNumFatura: TEditLabel;
    grpDuplicata: TGroupBox;
    edtValorDup: TEditLabel;
    edtNumDuplicata: TEditLabel;
    GroupBox1: TGroupBox;
    edtValDup1: TEditLabel;
    edtDup1: TEditLabel;
    EditLabel4: TEditLabel;
    edtDatVencDup1: TEditLabel;
    edtDup2: TEditLabel;
    edtValDup2: TEditLabel;
    edtDatVencDup2: TEditLabel;
    edtDup3: TEditLabel;
    edtValDup3: TEditLabel;
    edtDatVencDup3: TEditLabel;
    edtDup4: TEditLabel;
    edtValDup4: TEditLabel;
    edtDatVencDup4: TEditLabel;
    edtDup5: TEditLabel;
    edtValDup5: TEditLabel;
    edtDatVencDup5: TEditLabel;
    edtSerieNF: TEditLabel;
    procedure edtPublicoClickButton(Sender: TObject);
    procedure edtPublicoExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure edtCodEmpresaChange(Sender: TObject);
    procedure edtCodEmpresaExit(Sender: TObject);
    procedure edtPublicoChange(Sender: TObject);
    procedure edtCodLayoutExit(Sender: TObject);
    procedure btnEmitirNFClick(Sender: TObject);
    procedure edtNotaChange(Sender: TObject);
    procedure edtValTotalChange(Sender: TObject);
    procedure edtValorDupExit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure edtLimparTodosItensClick(Sender: TObject);
    procedure edtLimparItemClick(Sender: TObject);
  private
    procedure InserirItemNoGrid;
    procedure LimpaCampos;
    procedure LimpaGrid;


    function PesquisaNova(Sender: TObject; blnValida: boolean): boolean;
    function DefineUltimoItem: integer;
    function GravaNota: boolean;
    function MontaInsert(Objeto: TWinControl): TStringList;

  public
    { Public declarations }
  end;

var
  frmNotaFiscal: TfrmNotaFiscal;
  cnn          : TConexao;

implementation

uses UPEsquisa, UGlobal, Functions, DB, UEspecifico;

{$R *.dfm}

function TfrmNotaFiscal.PesquisaNova(Sender: TObject; blnValida: boolean): boolean;

var Edt      : TEditlabel;
    EdtN     : TEdit;
    Pesquisa : TPesquisa;
    str      : array[0..2] of string;

begin
  Edt := Sender as TEditLabel;
  EdtN:= Edt._Edit;
  if blnValida then
    str[2] := 'A.'+edt._Campo + ' = ' + edt.Text;

  if Edt._Campo = 'COD_PUBLICO' then
  begin
    str[0] := 'COD_PUBLICO,NOM_PUBLICO';
    str[1] := 'CAD_PUBLICO';
  end
  else if Edt._Campo = 'COD_EMPRESA' then
  begin
    str[0] := 'COD_EMPRESA,NOM_EMPRESA';
    str[1] := 'CAD_EMPRESA';
  end
  else if Edt._Campo = 'COD_LAYOUT' then
  begin
    str[0] := 'A.COD_LAYOUT,A.NOM_LAYOUT';
    str[1] := 'CAD_LAYOUT_NF,CAD_EMP_LAY_NF';
    if blnValida then
      str[2] := str[2] + ' And ';
    str[2] := str[2] + ' A.COD_LAYOUT = B.COD_LAYOUT ';
    str[2] := str[2] + ' And B.COD_EMPRESA = '+edtCodEmpresa.Text;
  end
  else
  begin
    Result := true;
    Exit;
  end;

  Pesquisa := TPesquisa.Create;
  Result := Pesquisa.ExecutaPesquisa(blnValida,str[0],str[1],Edt,EdtN,str[2]);
  Pesquisa.Free;
end;


procedure TfrmNotaFiscal.edtPublicoClickButton(Sender: TObject);

begin
  inherited;
  PesquisaNova(Sender,false);
end;

procedure TfrmNotaFiscal.edtPublicoExit(Sender: TObject);

var edt: TEditLabel;
    str: string;
    ds : TDataSource;
begin
  inherited;
  edt := Sender as TEditLabel;
  if not PesquisaNova(Sender,true) then
    edt.SetFocus;
  if (not IsEmptyStr(edtPublico.Text)) and (Sender = edtPublico) then
  begin
    str :=  'Select '+
            '  NUM_CNPJ,'+
            '  NUM_INSC_EST,'+
            '  NOM_CIDADE,'+
            '  NOM_ENDERECO,'+
            '  NOM_BAIRRO,'+
            '  NUM_CEP,'+
            '  NUM_FONE,'+
            '  NOM_UF,'+
            '  NOM_PRACA_PAGTO '+
            ' From '+
            '  CAD_PUBLICO'+
            ' Where '+
            '  COD_PUBLICO = '+edtPublico.Text;
    if cnn.ExecuteQuery(str,ds) then
    begin
      edtCNPJ.Text := ds.DataSet.FieldByName('NUM_CNPJ').AsString;
      edtIE.Text := ds.DataSet.FieldByName('NUM_INSC_EST').AsString;
      edtCIDADE.Text := ds.DataSet.FieldByName('NOM_CIDADE').AsString;
      edtEndereco.Text := ds.DataSet.FieldByName('NOM_ENDERECO').AsString;
      edtBairro.Text := ds.DataSet.FieldByName('NOM_BAIRRO').AsString;
      edtCEP.Text := ds.DataSet.FieldByName('NUM_CEP').AsString;
      edtUF.Text := ds.DataSet.FieldByName('NOM_UF').AsString;
      edtPracaPagto.Text := ds.DataSet.FieldByName('NOM_PRACA_PAGTO').AsString;
    end;
    ds.Free;
  end;
end;

procedure TfrmNotaFiscal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  cnn.Destroy;
end;

procedure TfrmNotaFiscal.FormCreate(Sender: TObject);
begin

  cnn := TConexao.Create(GloStrUser,GloStrPassword,GloStrDatabase, GloStrServer);
  cnn.Open;
  grd.ColWidths[0] := trunc(grd.Width * 0.8);
  grd.ColWidths[1] := grd.Width - grd.ColWidths[0] - 20;
  grd.RowCount := 1;
  grd.Cells[0,0] := 'DESCRIÇÃO';
  grd.Cells[1,0] := 'VALOR';
  tab.ActivePage := tabItem;

//  grd.FixedRows := 1;
end;

procedure TfrmNotaFiscal.btnInserirClick(Sender: TObject);
begin
  InserirItemNoGrid;
end;

procedure TfrmNotaFiscal.InserirItemNoGrid;
var strList :TStrings;
    i,aux   :integer;

begin
  strList := memDescricao.Lines;
  //aux := grd.RowCount;
  aux := DefineUltimoItem;

  if aux + memDescricao.Lines.Count <= grd.RowCount then
  begin
    grd.RowCount := grd.RowCount + strList.Count;
    for i := aux to grd.RowCount -1 do
      grd.Cells[0,i] := strList[i - aux];
    grd.Cells[1,DefineUltimoItem-1] := edtValor.Text;
    memDescricao.Text := EmptyStr;
    edtValor.Text := EmptyStr;
    memDescricao.SetFocus;
  end
  else
    MessageDlg('A quantidade de itens informado excedeu o limite.',mtWarning,[mbOK],0);
end;

procedure TfrmNotaFiscal.edtCodEmpresaChange(Sender: TObject);
begin
  edtCodLayout.Text := EmptyStr;
  edtCodLayout.Enabled := Trim(edtCodEmpresa.Text) <> EmptyStr;
  edtNota.Text := EmptyStr;
  edtSerieNF.Text := EmptyStr;
end;

procedure TfrmNotaFiscal.edtCodEmpresaExit(Sender: TObject);
var str: string;
    ds: TDataSource;
begin
  PesquisaNova(edtCodEmpresa,true);
  if (not IsEmptyStr(edtCodEmpresa.Text)) and
     (IsEmptyStr(edtNota.Text)) then
  begin
    str :=  'Select '+
            '  NUM_SEQ,'+
            '  NOM_SERIE'+
            ' From '+
            '  NOTA_FISCAL_SEQ'+
            ' Where '+
            '  COD_EMPRESA = '+edtCodEmpresa.Text;
    if cnn.ExecuteQuery(str,ds) then
    begin
      edtNota.Text := ds.DataSet.Fields[0].AsString;
      edtSerieNF.Text := ds.DataSet.Fields[1].AsString;
    end;
    ds.Free;
  end;
end;

procedure TfrmNotaFiscal.edtPublicoChange(Sender: TObject);
var i: integer;
begin
  for i:= 0 to grpPublico.ControlCount -1 do
  begin
    if grpPublico.Controls[i] is TEditLabel then
       TEditLabel(grpPublico.Controls[i]).Text := EmptyStr
    else if grpPublico.Controls[i] is TComboBoxTag then
       TComboBoxTag(grpPublico.Controls[i]).Text := EmptyStr;
  end;
end;

procedure TfrmNotaFiscal.edtCodLayoutExit(Sender: TObject);
var str: string;
    ds: TDataSource;
begin
  PesquisaNova(edtCodLayout,true);
  if not IsEmptyStr(edtCodLayout.Text) then
  begin
    str :=  'Select '+
            '  A.QTD_ITEM_NF,'+
            '  A.QTD_OBS_NF,'+
            '  A.QTD_LIN_PROX_NF,'+
            '  B.NUM_TAMANHO '+
            ' From '+
            '  CAD_LAYOUT_NF A,'+
            '  CAD_LAY_NF_CAMPO B '+
            ' Where '+
            '  A.COD_LAYOUT = B.COD_LAYOUT And '+
            '  B.NOM_CAMPO = '+ Aspas('ITEM_1')+ ' And '+
            '  A.COD_LAYOUT = '+edtCodLayout.Text;
    if cnn.ExecuteQuery(str,ds) then
    begin
      grd.RowCount := ds.DataSet.FieldByName('QTD_ITEM_NF').AsInteger;
      memDescricao.Tag := ds.DataSet.FieldByName('NUM_TAMANHO').AsInteger;
    end;
    ds.Free;
  end;

end;

function TfrmNotaFiscal.DefineUltimoItem: integer;
var i: integer;
begin
  for i := grd.RowCount downto 1 do
  begin
    if not IsEmptyStr(grd.Cells[0,i]) then
    begin
      Result := i+1;
      Exit;
    end;
  end;
  Result := 1;
end;

function TfrmNotaFiscal.GravaNota: boolean;
var strList: TStringList;
    i: integer;
    str: string;
begin

  str :=  'Insert Into NOTA_FISCAL('+
          'COD_EMPRESA,'+
          'NUM_DOCUMENTO,'+
          'NOM_SERIE,'+
          'COD_PUBLICO,'+
          'DAT_EMISSAO,'+
          'DAT_SAIDA,'+
          'VAL_IRRF,'+
          'VAL_ISS,'+
          'VAL_TOTAL,'+
          'FLG_RF_IRRF,'+
          'FLG_RF_ISS'+
          ' ) Values ( '+
          edtCodEmpresa.Text+','+
          edtNota.Text+','+
          Aspas(edtSerieNF.Text)+','+
          edtPublico.Text+','+
          cnn.DateToBD(edtDatEmissao.Text)+','+
          cnn.DateToBD(edtDatEmissao.Text)+','+
          '0'+','+
          '0'+','+
          cnn.NumberToBD(edtValTotal.Text,'0')+','+
          Aspas('N')+','+
          Aspas('N')+')';

  strList := MontaInsert(Self);
  cnn.BeginTrans;
  try
    try
      cnn.Execute(str);
      for i := 0 to strList.Count -1 do
        cnn.Execute(strList[i]);
      str :=  'Update NOTA_FISCAL_SEQ'+
              '  Set '+
              '    NUM_SEQ = NUM_SEQ + 1'+
              '  Where '+
              '    COD_EMPRESA = '+edtCodEmpresa.Text;
      cnn.Execute(str);        
    except
      on ex: Exception do
      begin
        cnn.Rollback;
        MessageDlg(ex.Message,mtError,[mbOK],0);
        Result := false;
        Exit;
      end;
    end;
  finally
    cnn.Commit;
  end;
  Result := true;
end;

function TfrmNotaFiscal.MontaInsert(Objeto: TWinControl): TStringList;
var i,j     : integer;
    strList : TStringList;
    str     : string;
begin
  strList := TStringList.Create;
  for i := 0 to ComponentCount - 1 do
  begin
   if Components[i] is TEditLabel then
   begin
     if (not IsEmptyStr(TEditLabel(Components[i])._Campo)) and
        (TEditLabel(Components[i]).Tag = 1) and
        (not IsEmptyStr(TEditLabel(Components[i]).Text)) then
     begin
       str := 'Insert Into MOV_IMP_NF('+
              '  COD_EMPRESA,'+
              '  COD_LAYOUT,'+
              '  NOM_CAMPO,'+
              '  NUM_DOCUMENTO,'+
              '  NOM_SERIE,'+
              '  NOM_VALOR'+
              ' ) Values ( '+
              edtCodEmpresa.Text+','+
              edtCodLayout.Text+','+
              Aspas(TEditLabel(Components[i])._Campo)+','+
              edtNota.Text+','+
              Aspas(edtSerieNF.Text)+','+
              Aspas(TEditLabel(Components[i]).Text)+')';
            strList.Add(str)
     end;
   end
   else if Components[i] is TStringGrid then
   begin
     for j := 1 to grd.RowCount do
     begin
       if not IsEmptyStr(grd.Cells[0,j]) then
       begin
         str := 'Insert Into MOV_IMP_NF('+
                '  COD_EMPRESA,'+
                '  COD_LAYOUT,'+
                '  NOM_CAMPO,'+
                '  NUM_DOCUMENTO,'+
                '  NOM_SERIE,'+
                '  NOM_VALOR'+
                ' ) Values ( '+
                edtCodEmpresa.Text+','+
                edtCodLayout.Text+','+
                Aspas('ITEM_'+IntToStr(j))+','+
                edtNota.Text+','+
                Aspas(edtSerieNF.Text)+','+
                Aspas(grd.Cells[0,j])+')';
                strList.Add(str);
       end;
       if not IsEmptyStr(grd.Cells[1,j]) then
       begin
         str := 'Insert Into MOV_IMP_NF('+
                '  COD_EMPRESA,'+
                '  COD_LAYOUT,'+
                '  NOM_CAMPO,'+
                '  NUM_DOCUMENTO,'+
                '  NOM_SERIE,'+
                '  NOM_VALOR'+
                ' ) Values ( '+
                edtCodEmpresa.Text+','+
                edtCodLayout.Text+','+
                Aspas('VALOR_ITEM_'+IntToStr(j))+','+
                edtNota.Text+','+
                Aspas(edtSerieNF.Text)+','+
                Aspas(grd.Cells[1,j])+')';
                strList.Add(str);
       end;
     end;
   end;
  end;
  Result := strList;
end;

procedure TfrmNotaFiscal.btnEmitirNFClick(Sender: TObject);
begin
  if GravaNota then
  begin
    MessageDlg('Nota fiscal gravada com sucesso!',mtInformation,[mbOK],0);
    LimpaCampos;
  end;
end;

procedure TfrmNotaFiscal.edtNotaChange(Sender: TObject);
begin
  edtNumFatura.Text := edtNota.Text;
end;

procedure TfrmNotaFiscal.edtValTotalChange(Sender: TObject);
begin
  edtValFatura.Text := edtValTotal.Text;
end;

procedure TfrmNotaFiscal.LimpaCampos;

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
  LimpaGrid;
  tab.ActivePage := tabItem;
  edtCodEmpresa.SetFocus;
end;


procedure TfrmNotaFiscal.edtValorDupExit(Sender: TObject);
begin
  if not IsEmptyStr(edtValorDup.Text) then
    edtNumDuplicata.Text := edtNota.Text
  else
    edtNumDuplicata.Text := EmptyStr;
end;

procedure TfrmNotaFiscal.Button1Click(Sender: TObject);
var Imp: TImpressao;
begin
  Imp := TImpressao.Create;
  Imp.ImprimeNF(1,15001,'A');
end;

procedure TfrmNotaFiscal.Button2Click(Sender: TObject);
var 
  F: TextFile;
  S: string;
begin
  AssignFile(F, 'c:\teste.txt'); { File selected in dialog }
  Reset(F);
  Readln(F, S);
  Writeln(F,'teste');                 { Read first line of file }
  //Edit1.Text := S;                     { Put string in a TEdit control }
  CloseFile(F);

end;

procedure TfrmNotaFiscal.LimpaGrid;
var i: integer;
begin
  for i := 1 to grd.RowCount do
  begin
    grd.Cells[0,i] := EmptyStr;
    grd.Cells[1,i] := EmptyStr;
  end;
end;

procedure TfrmNotaFiscal.edtLimparTodosItensClick(Sender: TObject);
begin
  if MessageDlg('Deseja limpar todos os itens?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
    LimpaGrid;
end;

procedure TfrmNotaFiscal.edtLimparItemClick(Sender: TObject);
begin
  memDescricao.Text := EmptyStr;
end;



end.
