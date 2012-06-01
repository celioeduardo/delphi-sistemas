unit UEspecifico;

interface

uses Forms;

type

  TImpressao = class

    private

      procedure InsereNaTabela(Empresa,CodLayout: smallint;NomCampo: string;
         Documento: integer; Serie, strValor: string);

      function FormataValor(str: string; intTamanho: integer; flgAlinha: string): string;

    public

      procedure GravaImpressao(Form: TForm; Empresa,CodLayout: smallint;
            Documento: integer; Serie: string);

      procedure ImprimeNF(CodLayout: smallint;Documento: integer;Serie: string; blnPedeImpressa: boolean = true);
      
  end;

implementation

uses SysUtils, EditLabel, UComponentTag, Functions, UConexao, UGlobal, DB, CharPrinter, Dialogs;

{ TImpressao }

function TImpressao.FormataValor(str: string; intTamanho: integer;
  flgAlinha: string): string;

var strAux: string;

begin
  if flgAlinha = 'E' then
    strAux := LPAD(str,IntTamanho,' ')
  else if flgAlinha = 'R' then
    strAux := RPAD(str,IntTamanho,' ')
  else
    strAux := CPAD(str,IntTamanho,' ');

  Result := strAux;
end;

procedure TImpressao.GravaImpressao(Form: TForm; Empresa,CodLayout: smallint;
            Documento: integer; Serie: string);
var i: integer;
begin
  for i := 0 to Form.ControlCount -1 do
  begin
    if Form.Controls[i] is TEditLabel then
    begin
      InsereNaTabela(Empresa,
                     CodLayout,
                     TEditLabel(Form.Controls[i])._Campo,
                     Documento,
                     Serie,
                     TEditLabel(Form.Controls[i]).Text);
    end;

  end;
end;

procedure TImpressao.ImprimeNF(CodLayout: smallint; Documento: integer;Serie: string;blnPedeImpressa: boolean = true);
var
  ds      : TDataSource;
  str     : string;
  cnn     : TConexao;

  prn     : TAdvancedPrinter;
  intLinha: integer;
  strAux  : string;

  dlg     : TPrintDialog;
  blnImpr : boolean;

begin
  ds := TDataSource.Create(Application);
  str :=  'Select '+
          '  A.NOM_CAMPO,'+
          '  A.NOM_VALOR,'+
          '  B.NUM_LINHA,'+
          '  B.NUM_COLUNA,'+
          '  B.NUM_TAMANHO,'+
          '  B.FLG_ALINHAME'+
          ' From '+
          '  MOV_IMP_NF A,'+
          '  CAD_LAY_NF_CAMPO B'+
          ' Where '+
          '  A.COD_LAYOUT = B.COD_LAYOUT And '+
          '  A.NOM_CAMPO = B.NOM_CAMPO And '+
          '  A.COD_LAYOUT = '+IntToStr(CodLayout)+' And '+
          '  A.NUM_DOCUMENTO = '+IntToStr(Documento)+' And '+
          '  A.NOM_SERIE = '+Aspas(Serie)+
          ' Order By B.NUM_LINHA, B.NUM_COLUNA';

  try
    cnn := TConexao.Create(GloStrUser ,GloStrPassword,GloStrDatabase,GloStrServer);
    cnn.Open;
    if cnn.ExecuteQuery(str,ds) then
    begin

      blnImpr := true;

      if blnPedeImpressa then
      begin
        dlg := TPrintDialog.Create(Application);
        blnImpr := dlg.Execute;
        dlg.Free;
      end;

      // SE O USUÁRIO NÃO CANCELOU A IMPRESSORA, ENTÃO IMPRIME //
      if blnImpr then
      begin

        intLinha := 1;
        str := EmptyStr;

        prn := TAdvancedPrinter.Create;

        prn.OpenDoc('Nota Fiscal ' + IntToStr(Documento));

        try

          while not (ds.DataSet.Eof) do
          begin
            // ENVIA PARA IMPRESSORA
            if ds.DataSet.FieldByName('NUM_LINHA').AsInteger = intLinha then
            begin
              if not IsEmptyStr(ds.DataSet.FieldByName('NUM_LINHA').AsString) then
              begin
                strAux := FormataValor(ds.DataSet.FieldByName('NOM_VALOR').AsString,
                                       ds.DataSet.FieldByName('NUM_TAMANHO').AsInteger,
                                       ds.DataSet.FieldByName('FLG_ALINHAME').AsString);
                str := RPAD(str,ds.DataSet.FieldByName('NUM_COLUNA').Asinteger,' ') + strAux;
              end;
            end
            else
            begin
              prn.Write(str);
              str := EmptyStr;
              // Ir Para Próxima Linha //
              While ds.DataSet.FieldByName('NUM_LINHA').AsInteger <> IntLinha do
              begin
                Inc(intLinha);
                prn.CRLF;
                //prn.SendData(#13#10);
              end;
              if not IsEmptyStr(ds.DataSet.FieldByName('NUM_LINHA').AsString) then
              begin
                strAux := FormataValor(ds.DataSet.FieldByName('NOM_VALOR').AsString,
                                       ds.DataSet.FieldByName('NUM_TAMANHO').AsInteger,
                                       ds.DataSet.FieldByName('FLG_ALINHAME').AsString);

                str := RPAD(str,ds.DataSet.FieldByName('NUM_COLUNA').Asinteger,' ') + strAux;
              end;
            end;
            ds.DataSet.Next;
          end;

          prn.CloseDoc;

        finally
          prn.Free;
        end;
      end;
    end;
  finally
    ds.Free;
    cnn.Destroy;
  end;
end;

procedure TImpressao.InsereNaTabela(Empresa,CodLayout: smallint;NomCampo: string;
            Documento: integer; Serie, strValor: string) ;
var str: string;
    cnn: TConexao;
begin
  if not (IsEmptyStr(NomCampo)) and
     not (IsEmptyStr(strValor)) then
  begin
    cnn := TConexao.Create(GloStrUser ,GloStrPassword,GloStrDatabase,GloStrServer);
    str :=  'Insert Into MOV_IMP_NF(' +
            'COD_EMPRESA,'+
            'COD_LAYOUT,'+
            'NOM_CAMPO'+
            'NUM_DOCUMENTO'+
            'NOM_SERIE'+
            'NOM_VALOR'+
            ') Values ('+
            IntToStr(Empresa) + ',' +
            IntToStr(CodLayout) + ',' +
            Aspas(NomCampo) + ',' +
            IntToStr(Documento) + ',' +
            Aspas(Serie) + ',' +
            Aspas(strValor) + ')';
    cnn.Open;
    try
      try
        cnn.Execute(str);
      except on ex: Exception do
        raise Exception.Create(ex.Message);
      end;
    finally
      cnn.Close;
      cnn.Free;
    end;
  end;
end;
end.
