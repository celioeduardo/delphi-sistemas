unit ULocalizar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, UComponentTag, EditLabel, StdCtrls, Mask, ExtCtrls,
  Buttons, Functions, UPesquisa;

type

  tpControleULocalizar = (clEditLabel,clComboBoxTag,clCheckBoxTag,clRadioButtonTag,clListViewTag);

  //==================  CLASSE AUXILIAR PARA OS TIPOS DOS CAMPOS =====
  TLocalizarCampo = class
  private
    FTipo: TTipo;
    FFieldName: string;
    FFieldDisplay: string;
    FFormatoNumerico: double;
    FMaxLength: integer;
    FChave: boolean;
    FIsChar: boolean;
    FTipoControle: tpControleULocalizar;
    FFilho: string;
    FControle: TObject;
  public
    property Tipo: TTipo read FTipo write FTipo;
    property FieldName: string read FFieldName write FFieldName;
    property FieldDisplay: string read FFieldDisplay write FFieldDisplay;
    property FormatoNumerico: double read FFormatoNumerico write FFormatoNumerico;
    property MaxLength: integer read FMaxLength write FMaxLength;
    property Chave: boolean read FChave write FChave;
    property IsChar: boolean read FIsChar write FIsChar;
    property TipoControle: tpControleULocalizar read FTipoControle write FTipoControle;
    property Filho: string read FFilho write FFilho;
    property Controle: TObject read FControle write FControle;
  end;

  // =================  CLASSE ASSOCIADA AO FORM ====================
  TfrmLocalizar = class(TForm)
    lvw: TListView;
    lvwP: TListView;
    Label1: TLabel;
    Label2: TLabel;
    pnlFiltro: TPanel;
    ctl1: TEditLabel;
    ctl2: TEditLabel;
    Label3: TLabel;
    btnLocaliza: TBitBtn;
    btnSair: TBitBtn;
    opts: TRadioGroup;
    Edit: TEdit;
    lvwFiltro: TListViewTag;
    btnAdicionar: TButton;
    cbo: TComboBoxTag;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure btnLocalizaClick(Sender: TObject);
    procedure lvwSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure ctl1Exit(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure AddListParametro(Coluna, Condicao, Valor, FIELD_NAME,
      COMPARACAO, WHERE, AUXILIAR, AUXILIAR2: string);
    procedure DelListParametro(FIELD_NAME, COMPARACAO: string);
    procedure lvwPSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure lvwPKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lvwPClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure cboChange(Sender: TObject);
  private
    FCampos: array of TLocalizarCampo;
    FPesquisa: array of TPesquisa;
    procedure FormataLista;
    procedure AjustaColunas;
    procedure DefineFiltro;
    procedure AddField(var Campo: TLocalizarCampo);

    procedure MontaCamposFiltro;
    procedure DefineVisualizacao(bln_ctl1, bln_ctl2, bln_opts,
      bln_lvwFiltro, bln_cbo: boolean);
    procedure CarregaFiltro(FieldName: String);
  public
   procedure AddPesquisa(Pesquisa: TPesquisa);  
  end;

  // =================  CLASSE DE CONTROLE  ==========================
  TLocalizar = class(TObject)
  private
    FForm : TForm;
    procedure MontaLocalizar;
  public
    destructor Destroy; override;
    property Formulario: TForm read FForm write FForm;
    procedure Execute;
  end;

var
  frmLocalizar: TfrmLocalizar;

implementation

{$R *.dfm}
procedure TfrmLocalizar.FormCreate(Sender: TObject);
begin
  FormataLista;
end;

{ TLocalizar }
destructor TLocalizar.Destroy;
begin
  inherited Destroy;
end;

procedure TLocalizar.Execute;
begin
  MontaLocalizar;
end;

procedure TLocalizar.MontaLocalizar;
var
  i: integer;
  campo: TLocalizarCampo;
  obj: TObject;

begin
  if Assigned(FForm) then
  begin
    frmLocalizar := TfrmLocalizar.Create(Application);
    for i := 0 to FForm.ComponentCount-1 do
    begin
      if FForm.Components[i] is TEditLabel then
      begin
        obj := FForm.Components[i] as TEditLabel;
        if Trim(TEditLabel(obj)._Campo) <> '' then
        begin
          campo := TLocalizarCampo.Create;
          campo.FieldName := TEditLabel(obj)._Campo;
          campo.Tipo := TEditLabel(obj)._Tipo;
          campo.FieldDisplay := TEditLabel(obj)._LabelCaption;
          campo.MaxLength := TEditLabel(obj).MaxLength;
          campo.FormatoNumerico := TEditLabel(obj)._FormatoNumerico;
          campo.Chave := TEditLabel(obj)._Chave;
          campo.TipoControle := clEditLabel;
          frmLocalizar.AddField(campo);
        end;
      end
      else if FForm.Components[i] is TComboBoxTag then
      begin
        obj := FForm.Components[i] as TComboBoxTag;
        if Trim(TComboBoxTag(obj)._Campo) <> '' then
        begin
          campo := TLocalizarCampo.Create;
          campo.FieldName := TComboBoxTag(obj)._Campo;
          campo.FieldDisplay := TComboBoxTag(obj)._Label.Caption;
          campo.Chave := TComboBoxTag(obj)._Chave;
          campo.TipoControle := clComboBoxTag;
          if Assigned(TComboBoxTag(obj)._EditLabel) then
          begin
            campo.Filho := TComboBoxTag(obj)._EditLabel._Campo;
            campo.Controle := TComboBoxTag(obj);
          end;
          frmLocalizar.AddField(campo);
        end;
      end;
    end;
    if frmLocalizar.lvw.Items.Count > 0 then
     frmLocalizar.ShowModal;
  end;
end;

procedure TfrmLocalizar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmLocalizar.FormataLista;
var
  coluna: TListColumn;
begin
  // LISTA DOS CAMPOS
  coluna := lvw.Columns.Add;
  coluna.Caption := 'Campos';
  lvw.Checkboxes := true;

  // LISTA DOS PARÂMETROS
  coluna := lvwP.Columns.Add;
  coluna.Caption := 'Campo';
  coluna := lvwP.Columns.Add;
  coluna.Caption := 'Condição';
  coluna := lvwP.Columns.Add;
  coluna.Caption := 'Valor';
  coluna := lvwP.Columns.Add;
  coluna.Caption := 'FIELD_NAME';
  coluna := lvwP.Columns.Add;
  coluna.Caption := 'COMPARACAO';
  coluna := lvwP.Columns.Add;
  coluna.Caption := 'WHERE';
  coluna := lvwP.Columns.Add;
  coluna.Caption := 'AUXILIAR';
  coluna := lvwP.Columns.Add;
  coluna.Caption := 'AUXILIAR2';

  AjustaColunas;

end;

procedure TFrmLocalizar.AjustaColunas;
begin
  // LISTA DOS CAMPOS
  lvw.Columns[0].Width := lvw.Width - 10;
  // LISTA DOS PARÂMETROS
  lvwP.Columns[0].Width := 100;
  lvwP.Columns[1].Width := 200;
  lvwP.Columns[2].Width := lvwP.Width -
                          (lvwP.Columns[0].Width+
                           lvwP.Columns[1].Width) - 5;
  lvwP.Columns[3].Width := 0;
  lvwP.Columns[4].Width := 0;
  lvwP.Columns[5].Width := 0;
  lvwP.Columns[6].Width := 0;
  lvwP.Columns[7].Width := 0;
end;

procedure TfrmLocalizar.FormResize(Sender: TObject);
begin
  AjustaColunas;
end;

procedure TfrmLocalizar.DefineFiltro;
begin
end;

procedure TfrmLocalizar.btnLocalizaClick(Sender: TObject);
begin
   DefineFiltro;
end;

procedure TfrmLocalizar.AddField(var Campo: TLocalizarCampo);
var i: integer;
    item: TListItem;
begin
  i := High(FCampos);
  if i = -1 then
  begin
    SetLength(FCampos,1);
    i := 0;
  end
  else
  begin
    SetLength(FCampos,i+2);
    i := High(FCampos);
  end;

  FCampos[i] := TLocalizarCampo.Create;
  FCampos[i] := Campo;
  item := frmlocalizar.lvw.Items.Add;
  item.Caption :=  campo.FieldDisplay;
  item.Checked := true;
end;

procedure TfrmLocalizar.lvwSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
  if (lvw.Items.IndexOf(Item) <> -1) and (Selected) then
  begin
    MontaCamposFiltro;
    CarregaFiltro(FCampos[lvw.Items.IndexOf(Item)].FieldName);
  end;
end;

procedure TfrmLocalizar.FormActivate(Sender: TObject);
begin
  if lvw.Items.Count > 1 then
    lvw.Items.Item[0].Selected := true;
end;

procedure TfrmLocalizar.MontaCamposFiltro;
const
  conLeftClt2Comum = 265;
  conWidthINICIAL_FINAL = 145;
  conWidthTexto = 361;
  conWidthPesquisa = 105;
  conWidthNomPesquisa = 257;
var
  index, i: integer;
begin
  if lvw.Items.IndexOf(lvw.Selected) > -1 then
  begin
    pnlFiltro.Visible := true;
    index := lvw.Selected.Index;
    ctl1.Text := '';
    ctl2.Text := '';
    lvwFiltro.Items.Clear;
    opts.ItemIndex := 0;
    ctl1._Edit := nil;
    ctl1._ListView := nil;
    if FCampos[index].TipoControle = clEditLabel then
    begin
      case FCampos[lvw.Selected.Index].Tipo of
        Numero, Num_Decimal,Data,Data_Hora,Hora,CEP,Fone :
        begin
          DefineVisualizacao(true,true,false,false,false);
          ctl1._Tipo := FCampos[Index].Tipo;
          ctl1._FormatoNumerico := FCampos[Index].FormatoNumerico;
          ctl1.Width := conWidthINICIAL_FINAL;
          ctl1._Campo := FCampos[Index].FieldName;
          ctl1.MaxLength := FCampos[Index].MaxLength;
          ctl2._Tipo := FCampos[Index].Tipo;
          ctl2._FormatoNumerico := FCampos[Index].FormatoNumerico;
          ctl2.Width := conWidthINICIAL_FINAL;
          ctl2._Campo := FCampos[Index].FieldName;
          ctl2.MaxLength := FCampos[Index].MaxLength;
          ctl2.Left := conLeftClt2Comum;
          Edit.Visible := false;
        end;

        Texto:
        begin
          DefineVisualizacao(true,false,true,false,false);
          ctl1._Tipo := FCampos[Index].Tipo;
          ctl1._FormatoNumerico := FCampos[Index].FormatoNumerico;
          ctl1.Width := conWidthTexto;
          ctl1._Campo := FCampos[Index].FieldName;
          ctl1.MaxLength := FCampos[Index].MaxLength;
          Edit.Visible := false;
        end;

        Pesquisa:
        begin
          DefineVisualizacao(true,true,false,true,false);
          lvwFiltro.Items.Clear;
          ctl1._Tipo := FCampos[Index].Tipo;
          ctl1._FormatoNumerico := FCampos[Index].FormatoNumerico;
          ctl1.Width := conWidthPesquisa;
          ctl1._Campo := FCampos[Index].FieldName;
          ctl1.MaxLength := FCampos[Index].MaxLength;
          ctl1._IsChar := FCampos[Index].IsChar;
          Edit.Visible := True;
          Edit.Top := ctl1.Top;
          Edit.Width := conWidthNomPesquisa;
          Edit.Left := ctl1.Left + ctl1.Width -1;
          ctl1._Edit := Edit;
          ctl1._ListView := lvwFiltro;
          lvwFiltro.RowSelect := true;
          lvwFiltro.ViewStyle := vsReport;
          lvwFiltro.Columns[0].Width := Trunc(lvwFiltro.Width * (1/3));


          //VERIFICAR SE O TEXTLABEL É DEPENDENTE DE ALGUM CONTROLE
          for i := 0 to lvw.Items.Count-1 do
            if FCampos[index].FieldName = FCampos[i].Filho then
            begin
              cbo.Items := TComboBoxTag(FCampos[i].Controle).Items;
              cbo._EditLabel := ctl1;
              cbo._Campo := TComboBoxTag(FCampos[i].Controle)._Campo;
              DefineVisualizacao(true,true,false,true,true);
              break;
            end;
        end
        else
          DefineVisualizacao(false,false,false,false,false);
      end; //END CASE
      
    // Controle ComboBoxTag
    end
    else if FCampos[index].TipoControle = clComboBoxTag then
      DefineVisualizacao(false,false,false,false,false);
      //CODIFICAR...
      //...

  end;
end;

procedure TfrmLocalizar.DefineVisualizacao(bln_ctl1, bln_ctl2, bln_opts,
  bln_lvwFiltro, bln_cbo: boolean);
begin
  pnlFiltro.Visible := true;
  ctl1.Visible := bln_ctl1;
  Edit.Visible := bln_ctl1;
  ctl2.Visible := bln_ctl2;
  opts.Visible := bln_opts;
  lvwFiltro.Visible := bln_lvwFiltro;
  cbo.Visible := bln_cbo;
end;

procedure TfrmLocalizar.ctl1Exit(Sender: TObject);
//var
//  i: integer;
begin
  if (FCampos[lvw.Selected.Index].Tipo = Pesquisa) then
    Edit.Text := 'TESTE';

  {if (FCampos[lvw.Selected.Index].TipoControle = clEditLabel) and
     (FCampos[lvw.Selected.Index].Tipo = Pesquisa) then
  begin
    if cbo.Visible then
    begin
      for i := 0 to High(FPesquisa) do
        if FCampos[lvw.Selected.Index].FFieldName = TEditLabel(FPesquisa[i].CampoCodigo)._Campo then
        begin
          FPesquisa[i].CampoCodigo := ctl1;
          FPesquisa[i].CampoNome := Edit;
          FPesquisa[i].AddFiltro(cbo._Campo+'='+Aspas(cbo.BoundText));
        end;
       if not FPesquisa[i].ExecutaPesquisa(true) then
         (Sender as TEditLabel).SetFocus;
    end;
  end;}
end;

procedure TfrmLocalizar.btnAdicionarClick(Sender: TObject);
var
  index, i: integer;
  str, strAux, strAux2: string;
begin
  index := lvw.Items.IndexOf(lvw.Selected);
  if index = -1 then
    exit;

  case FCampos[index].Tipo of
      Numero, Num_Decimal,Data,Data_Hora,Hora,CEP,Fone :
        begin
          if Trim(ctl1.Text) <> '' then
          begin
            AddListParametro( FCampos[index].FieldDisplay,'Maior ou Igual',
                              ctl1.Text,FCampos[index].FieldName,'>=',
                              FCampos[index].FieldName+' >= '+
                              StringReplace(ctl1.Text,',','.',[rfReplaceAll]),'','');
          end
          else
            DelListParametro(FCampos[index].FieldName,'>=');
          if Trim(ctl2.Text) <> '' then
          begin
            AddListParametro( FCampos[index].FieldDisplay,'Menor ou Igual',
                              ctl2.Text,
                              FCampos[index].FieldName,'<=',
                              FCampos[index].FieldName+' <= '+
                              StringReplace(ctl2.Text,',','.',[rfReplaceAll]),'','');
          end
          else
            DelListParametro(FCampos[index].FieldName,'<=');
        end;
      Texto:
        begin
          if Trim(ctl1.Text) <> '' then
          begin
            if opts.ItemIndex = 0 then
              AddListParametro( FCampos[index].FieldDisplay,
                                'Contenha...',
                                ctl1.Text,
                                FCampos[index].FieldName,
                                'CONTENHA',
                                FCampos[index].FieldName+' LIKE %'+
                                Aspas(ctl1.text)+'%','','')
            else if opts.ItemIndex = 1 then
              AddListParametro( FCampos[index].FieldDisplay,'Começa com...',
                                ctl1.Text,FCampos[index].FieldName,'COMECA',
                                FCampos[index].FieldName+' LIKE '+
                                Aspas(ctl1.text)+'%','','')
            else if opts.ItemIndex = 2 then
              AddListParametro( FCampos[index].FieldDisplay,'Termina com...',
                                ctl1.Text,FCampos[index].FieldName,'TERMINA',
                                FCampos[index].FieldName+' LIKE %'+
                                Aspas(ctl1.text),'','')
            else if opts.ItemIndex = 3 then
              AddListParametro( FCampos[index].FieldDisplay,'Exatamente',
                                ctl1.Text,FCampos[index].FieldName,'EXATAMENTE',
                                FCampos[index].FieldName+' = '+
                                Aspas(ctl1.text),'','');

          end
          else
          begin
            DelListParametro(FCampos[index].FieldName,'CONTENHA');
            DelListParametro(FCampos[index].FieldName,'COMECA');
            DelListParametro(FCampos[index].FieldName,'TERMINA');
            DelListParametro(FCampos[index].FieldName,'EXTAMENTE');
          end;

        end;
      Pesquisa:
        begin
          if lvwFiltro.Items.Count > 0 then
          begin
            for i := 0 to lvwFiltro.Items.Count -1 do
            begin
              str := str + lvwFiltro.Items[i].Caption;
              strAux := strAux + lvwFiltro.Items[i].Caption+'#'+lvwFiltro.Items[i].SubItems[0];
              if i <> lvwFiltro.Items.Count -1 then
              begin
                str := str + ',';
                strAux := strAux + ',';
              end;
            end;

            // VERIFICANDO SE DEPENDE DE ALGUM VALOR
            if (cbo.Visible) and (Trim(cbo.Text) <> '') then
            begin
              strAux2 := TStringList(cbo.Items.Objects[cbo.ItemIndex])[0]+'-'+
                         cbo.Text;

              AddListParametro( FCampos[index].FieldDisplay,'Igual a',
                                cbo.Text+'('+str+')',FCampos[index].FieldName,'IN',
                                lvwFiltro.MontaWhere(FCampos[index].FieldName),strAux,strAux2);
            end
            else
              AddListParametro( FCampos[index].FieldDisplay,'Igual a',
                                str,FCampos[index].FieldName,'IN',
                                lvwFiltro.MontaWhere(FCampos[index].FieldName),strAux,strAux2);

          end
          else
            DelListParametro(FCampos[index].FieldName,'IN');
        end;
  end;

end;

procedure TfrmLocalizar.AddListParametro(Coluna, Condicao, Valor,
  FIELD_NAME, COMPARACAO, WHERE, AUXILIAR, AUXILIAR2: string);
var
  item: TListItem;
  index, i: integer;

begin
  index := -1;

  for i := 0 to lvwP.Items.Count-1 do
  begin
    if (lvwP.Items[i].SubItems[2] = FIELD_NAME) and
       (lvwP.Items[i].SubItems[3] = COMPARACAO) then
    begin
      index := i;
      break;
    end;
  end;

  if index > -1 then
  begin
    lvwP.Items[index].SubItems[1] := Valor;
    lvwP.Items[index].SubItems[4] := WHERE;
  end
  else
  begin
    item := lvwP.Items.Add;
    item.Caption := Coluna;
    item.SubItems.Add(Condicao);
    item.SubItems.Add(Valor);
    item.SubItems.Add(FIELD_NAME);
    item.SubItems.Add(COMPARACAO);
    item.SubItems.Add(WHERE);
    item.SubItems.Add(AUXILIAR);
    item.SubItems.Add(AUXILIAR2);
  end;
end;

procedure TfrmLocalizar.DelListParametro(FIELD_NAME, COMPARACAO: string);
var
 i: integer;
begin
  for i := 0 to lvwP.Items.Count -1 do
  begin
    if (lvwP.Items[i].SubItems[2] = FIELD_NAME) and
       (lvwP.Items[i].SubItems[3] = COMPARACAO) then
    begin
      lvwP.Items.Delete(i);
    end;
  end;

end;

procedure TfrmLocalizar.lvwPSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
  if lvwP.Items.IndexOf(lvwP.Selected) = -1 then
    exit;
  CarregaFiltro(lvwP.Selected.SubItems[2]);
end;

procedure TfrmLocalizar.lvwPKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = key_DELETE) and (lvwP.Items.Count > 0) then
  begin
    lvwP.Items.Delete(lvwP.ItemIndex);
    keybd_event(VK_SPACE, 1, 0, 0);
  end;
end;

procedure TfrmLocalizar.CarregaFiltro(FieldName: String);
var
  i,j : integer;
  arrCOD: TStringList;
  item: TListItem;
begin

  if lvw.Items.IndexOf(lvw.Selected) = -1 then exit;

  if FCampos[lvw.ItemIndex].FieldName <> FieldName then
  begin
    for i := 0 to lvw.Items.Count-1 do
    begin
      if FCampos[i].FieldName = FieldName then
      begin
        lvw.ItemIndex := i;
        break;
      end;
    end;
  end;

  case FCampos[lvw.ItemIndex].Tipo of
    Numero, Num_Decimal,Data,Data_Hora,Hora,CEP,Fone :
    begin
      ctl1.Text := '';
      ctl2.Text := '';
      for i := 0 to lvwP.Items.Count -1 do
      begin
        if FieldName = lvwP.Items[i].SubItems[2] then
          if lvwP.Items[i].SubItems[3] = '>=' then
            ctl1.Text := lvwP.Items[i].SubItems[1]
          else
            ctl2.Text := lvwP.Items[i].SubItems[1];
      end;
    end;

    Texto:
    begin
      ctl1.Text := '';
      ctl2.Text := '';
      for i := 0 to lvwP.Items.Count -1 do
      begin
        if FieldName = lvwP.Items[i].SubItems[2] then
        begin
          ctl1.Text := lvwP.Items[i].SubItems[1];
          if lvwP.Items[i].SubItems[3] = 'CONTENHA' then
            opts.ItemIndex := 0
          else if lvwP.Items[i].SubItems[3] = 'COMECA' then
            opts.ItemIndex := 1
          else if lvwP.Items[i].SubItems[3] = 'TERMINA' then
            opts.ItemIndex := 2
          else if lvwP.Items[i].SubItems[3] = 'EXTAMENTE' then
            opts.ItemIndex := 3;
        end;
      end;

    end;
    Pesquisa:
    begin
      lvwFiltro.Items.Clear;
      for i := 0 to lvwP.Items.Count -1 do
      begin
        if FieldName = lvwP.Items[i].SubItems[2] then
        begin
          arrCOD := Split(lvwP.Items[i].SubItems[5]);
          for j := 0 to arrCOD.Count-1 do
          begin
            item := lvwFiltro.Items.Add;
            item.Caption := TStringList(Split(arrCOD.Strings[j],'#'))[0];
            item.SubItems.Add((Split(arrCOD.Strings[j],'#'))[1]);
          end;
          if Trim(lvwP.Items[i].SubItems[6]) <> '' then
            cbo.ItemIndex := cbo.Items.IndexOf(TStringList(Split(lvwP.Items[i].SubItems[6],'-'))[1]);

        end;
      end;
    end;
  end;

end;

procedure TfrmLocalizar.lvwPClick(Sender: TObject);
begin
  if lvwP.Items.IndexOf(lvwP.Selected) <> -1 then
    lvwPSelectItem(Sender,lvwP.Selected,True);
end;

procedure TfrmLocalizar.btnSairClick(Sender: TObject);
begin
  if MessageDlg('Cancelar?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
    close;
end;

procedure TfrmLocalizar.cboChange(Sender: TObject);
begin
  lvwFiltro.Items.Clear;
end;

procedure TfrmLocalizar.AddPesquisa(Pesquisa: TPesquisa);
var i: integer;
begin
  i := High(FPesquisa);
  if i = -1 then
  begin
    SetLength(FCampos,1);
    i := 0;
  end
  else
  begin
    SetLength(FCampos,i+2);
    i := High(FCampos);
  end;

  FPesquisa[i] := Pesquisa;
end;

end.

