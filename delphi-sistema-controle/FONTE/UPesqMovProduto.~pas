unit UPesqMovProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ufrm, StdCtrls, ComCtrls, Buttons, ExtCtrls, UComponentTag,
  Mask, EditLabel, Grids, DBGrids;

type
  TfrmPesqMovProduto = class(Tfrm)
    edtCOD_EMPRESA: TEditLabel;
    edtNOM_EMPRESA: TEditTag;
    edtCOD_FILIAL: TEditLabel;
    edtNOM_FILIAL: TEditTag;
    edtCOD_PRODUTO: TEditLabel;
    edtNOM_PRODUTO: TEditTag;
    edtDAT_INICIAL: TEditLabel;
    edtDAT_FINAL: TEditLabel;
    grd: TDBGrid;
    Button1: TButton;
    procedure btnLocalizaClick(Sender: TObject);
    procedure edtCOD_EMPRESAChange(Sender: TObject);
    procedure edtCOD_EMPRESAClickButton(Sender: TObject);
    procedure edtCOD_FILIALClickButton(Sender: TObject);
    procedure edtCOD_PRODUTOClickButton(Sender: TObject);
    procedure edtCOD_PRODUTOExit(Sender: TObject);
    procedure edtCOD_FILIALExit(Sender: TObject);
    procedure edtCOD_EMPRESAExit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure grdDblClick(Sender: TObject);
  private
    function PesquisaNova(Sender: TObject; blnValida,
      Msg: boolean): boolean;
  public
    { Public declarations }
  end;

var
  frmPesqMovProduto: TfrmPesqMovProduto;

implementation

{$R *.dfm}

uses UEstoque, UPesquisa,UConexao, DB, UFIS_ENTRADA, UFIS_SAIDA;

procedure TfrmPesqMovProduto.btnLocalizaClick(Sender: TObject);
var
 str: string;
 int: integer;
 ds: TDataSource;
begin

  if not VerificaNotNull(true) then Exit;

  str := 'Select ';
  str := str+' DAT_MOV, ';
  str := str+' FLG_ES, ';
  str := str+' NUM_DOCUMENTO, ';
  str := str+' NOM_SERIE, ';
  str := str+' COD_FORNECEDOR, ';
  str := str+' Case QTD_FISICO ';
  str := str+'   When 0.00 then 0.00 ';
  str := str+'   Else ';
  str := str+'     VAL_FINAN / QTD_FISICO ';
  str := str+' End As VAL_CUSTO, ';
  str := str+' QTD_MOV, ';
  str := str+' VAL_MOV, ';
  str := str+' QTD_FISICO, ';
  str := str+' VAL_FINAN, ';
  str := str+' Case FLG_ES ';
  str := str+'   When '+cnn.Aspas('E')+' then '+cnn.Aspas('+');
  str := str+'   Else '+cnn.Aspas('-');
  str := str+' End as FLG_MAIS_MENOS,';
  str := str+' Case FLG_TIPO ';
  str := str+'   When '+cnn.Aspas('N')+' then '+cnn.Aspas('NORMAL');
  str := str+'   When '+cnn.Aspas('D')+' then '+cnn.Aspas('DEVOLUÇÃO');
  str := str+'   When '+cnn.Aspas('A')+' then '+cnn.Aspas('AJUSTE');
  str := str+' End as FLG_TIPO, ';
  str := str+' COD_EMPRESA, ';
  str := str+' COD_FILIAL ';
  str := str+' From ';
  str := str+' VW_EST_MOV ';
  str := str+' Where ';
  str := str+' COD_EMPRESA = '+edtCOD_EMPRESA.Text+' And ';
  str := str+' COD_FILIAL = '+edtCOD_FILIAL.Text+' And ';
  str := str+' COD_PRODUTO = '+edtCOD_PRODUTO.Text;

  if trim(edtDAT_INICIAL.FormattedText) <> '' then
    str := str+' And DAT_MOV >= '+cnn.DateToBD(edtDAT_INICIAL.Text);

  if trim(edtDAT_FINAL.FormattedText) <> '' then
    str := str+' And DAT_MOV <= '+cnn.DateToBD(edtDAT_FINAL.Text);

  str := str+' Order By ';
  str := str+' DAT_MOV,';
  str := str+' FLG_ES,';
  str := str+' NUM_DOCUMENTO,';
  str := str+' NOM_SERIE,';
  str := str+' COD_FORNECEDOR';

  cnn.ExecuteQuery(str,grd);
  with grd.DataSource.DataSet do
  begin
    TFloatField(FieldByName('QTD_MOV')).DisplayFormat:='#,##0.000';
    TFloatField(FieldByName('VAL_CUSTO')).DisplayFormat:='#,##0.00';
    TFloatField(FieldByName('VAL_MOV')).DisplayFormat:='#,##0.00';
    TFloatField(FieldByName('QTD_FISICO')).DisplayFormat:='#,##0.000';
    TFloatField(FieldByName('VAL_FINAN')).DisplayFormat:='#,##0.00';    
  end;

end;

function TfrmPesqMovProduto.PesquisaNova(Sender: TObject; blnValida,
  Msg: boolean): boolean;
var Edt      : TEditlabel;
    EdtN     : TEdit;
    Pesquisa : TPesquisa;
    str      : array[0..2] of string;

begin
  Edt := Sender as TEditLabel;
  EdtN:= Edt._Edit;

  if (Edt._Campo = 'COD_EMPRESA') then
  begin
    str[0] := 'COD_EMPRESA,NOM_EMPRESA';
    str[1] := 'CAD_EMPRESA';
    str[2] := EmptyStr;
  end
  else if (Edt._Campo = 'COD_FILIAL') then
  begin
    str[0] := 'COD_FILIAL,NOM_FILIAL';
    str[1] := 'CAD_FILIAL';
    str[2] := 'COD_EMPRESA = '+edtCOD_EMPRESA.Text;
  end
  else if (Edt.Name = 'edtCOD_PRODUTO') then
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


procedure TfrmPesqMovProduto.edtCOD_EMPRESAChange(Sender: TObject);
begin
  inherited;
  edtCOD_FILIAL.Text := '';
  edtCOD_FILIAL.Enabled := trim(edtCOD_EMPRESA.Text) <> '';
end;

procedure TfrmPesqMovProduto.edtCOD_EMPRESAClickButton(Sender: TObject);
begin
  inherited;
  PesquisaNova(edtCOD_EMPRESA,false,true);
end;

procedure TfrmPesqMovProduto.edtCOD_FILIALClickButton(Sender: TObject);
begin
  inherited;
  PesquisaNova(edtCOD_FILIAL,false,true);
end;

procedure TfrmPesqMovProduto.edtCOD_PRODUTOClickButton(Sender: TObject);
begin
  inherited;
  PesquisaNova(edtCOD_PRODUTO,false,true);
end;

procedure TfrmPesqMovProduto.edtCOD_PRODUTOExit(Sender: TObject);
begin
  inherited;
  if not PesquisaNova(edtCOD_PRODUTO,true,true) then
    edtCOD_PRODUTO.SetFocus;
end;

procedure TfrmPesqMovProduto.edtCOD_FILIALExit(Sender: TObject);
begin
  inherited;
  if not PesquisaNova(edtCOD_FILIAL,true,true) then
    edtCOD_FILIAL.SetFocus;
end;

procedure TfrmPesqMovProduto.edtCOD_EMPRESAExit(Sender: TObject);
begin
  inherited;
  if not PesquisaNova(edtCOD_EMPRESA,true,true) then
    edtCOD_EMPRESA.SetFocus;
end;

procedure TfrmPesqMovProduto.Button1Click(Sender: TObject);
var est: TEstoque;
begin
  est := TEstoque.Create;

  try
    Screen.Cursor := crHourGlass;

    est.ProcessaMovimentacao(
      StrToInt(edtCOD_EMPRESA.TEXT),
      StrToInt(edtCOD_FILIAL.TEXT),
      StrToInt(edtCOD_PRODUTO.TEXT));
  finally
    Screen.Cursor := crDefault;
    Application.ProcessMessages;
  end;
end;

procedure TfrmPesqMovProduto.grdDblClick(Sender: TObject);
begin
  inherited;
  if not Assigned(grd.DataSource) then
    Exit
  else if grd.DataSource.DataSet.Eof then
    Exit;  

  with grd.DataSource.DataSet do
  begin
    if FieldByName('FLG_ES').AsString = 'E' then
    begin
      //if not Assigned(frmFIS_ENTRADA) then
      Application.CreateForm(TfrmFIS_ENTRADA,frmFIS_ENTRADA);
      frmFIS_ENTRADA.HabilitaEdicao(False);
      frmFIS_ENTRADA.edtCOD_EMPRESA.Text := FieldByName('COD_EMPRESA').AsString;
      frmFIS_ENTRADA.edtCOD_FILIAL.Text := FieldByName('COD_FILIAL').AsString;
      frmFIS_ENTRADA.edtCOD_FORNECEDOR.Text := FieldByName('COD_FORNECEDOR').AsString;
      frmFIS_ENTRADA.edtNUM_DOCUMENTO.Text := FieldByName('NUM_DOCUMENTO').AsString;
      frmFIS_ENTRADA.edtNOM_SERIE.Text := FieldByName('NOM_SERIE').AsString;
      frmFIS_ENTRADA.HabilitaEdicao(true);
      frmFIS_ENTRADA.CarregaProdutos;
      frmFIS_ENTRADA.Show;
    end
    else
    begin
      //if not Assigned(frmFIS_SAIDA) then
      Application.CreateForm(TfrmFIS_SAIDA,frmFIS_SAIDA);
      frmFIS_SAIDA.HabilitaEdicao(False);
      frmFIS_SAIDA.edtCOD_EMPRESA.Text := FieldByName('COD_EMPRESA').AsString;
      frmFIS_SAIDA.edtCOD_FILIAL.Text := FieldByName('COD_FILIAL').AsString;
      frmFIS_SAIDA.edtNUM_DOCUMENTO.Text := FieldByName('NUM_DOCUMENTO').AsString;
      frmFIS_SAIDA.edtNOM_SERIE.Text := FieldByName('NOM_SERIE').AsString;
      frmFIS_SAIDA.HabilitaEdicao(true);
      frmFIS_SAIDA.CarregaProdutos;
      frmFIS_SAIDA.Show;
    end;



  end;


  //ShowMessage('selecionado: '+grd.DataSource.DataSet.FieldByName('COD_FORNECEDOR').AsString);
end;

end.
