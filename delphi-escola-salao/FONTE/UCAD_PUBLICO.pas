unit UCAD_PUBLICO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ufrm, StdCtrls, ComCtrls, Buttons, ExtCtrls, Mask, EditLabel,
  UComponentTag, DB;

type
  TfrmCAD_PUBLICO = class(Tfrm)
    txtCodPublico: TEditLabel;
    txtNomPublico: TEditLabel;
    txtObs: TMemoTag;
    tabPrinc: TPageControl;
    tab1: TTabSheet;
    tab2: TTabSheet;
    grpSexo: TGroupBox;
    optMaculino: TRadioButtonTag;
    optFeminino: TRadioButtonTag;
    grpDadosAdicionais: TGroupBox;
    txtDatNasc: TEditLabel;
    grpEndereco: TGroupBox;
    txtNomRua: TEditLabel;
    optCEP: TEditLabel;
    txtTelResidencial: TEditLabel;
    txtTelComercial: TEditLabel;
    txtCelular: TEditLabel;
    grpSituacao: TGroupBox;
    optVisitante: TRadioButtonTag;
    optPublicador: TRadioButtonTag;
    optServoMinisterial: TRadioButtonTag;
    optBatizado: TRadioButtonTag;
    optSupCircuito: TRadioButtonTag;
    optAnciao: TRadioButtonTag;
    grpPioneiro: TGroupBox;
    optPioneiroNao: TRadioButtonTag;
    optPioneiroAuxiliar: TRadioButtonTag;
    optPioneiroEspecial: TRadioButtonTag;
    optPioneiroRegular: TRadioButtonTag;
    tab3: TTabSheet;
    grpBatismo: TGroupBox;
    txtDatBatismo: TEditLabel;
    grpRestricao: TGroupBox;
    chkMoradora: TCheckBoxTag;
    edtCOD_CIDADE: TEditLabel;
    edtNOM_CIDADE: TEditTag;
    edtNOM_BAIRRO: TEditLabel;
    optSupDistrito: TRadioButtonTag;
    optDesassociado: TRadioButtonTag;
    chkAtivo: TCheckBoxTag;
    edtNUM_RAMAL: TEditLabel;
    lvwParte: TListViewTag;
    lblParte: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure txtCodPublicoEnter(Sender: TObject);
    procedure txtCodPublicoChange(Sender: TObject);
    procedure txtCodPublicoClickButton(Sender: TObject);
    procedure txtCodPublicoExit(Sender: TObject);
    procedure optFemininoClick(Sender: TObject);
    procedure edtCOD_CIDADEClickButton(Sender: TObject);
    procedure edtCOD_CIDADEExit(Sender: TObject);
    procedure chkAtivoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tabPrincChange(Sender: TObject);
    procedure txtHabilitaEdicaoEnter(Sender: TObject);
    procedure btnIncluiClick(Sender: TObject);
    procedure btnAlteraClick(Sender: TObject);
  private
    function PesquisaNova(Sender: TObject; blnValida: boolean; Msg: boolean = true): boolean;
    procedure CarregaPartesEscola;
    procedure GravarPartesEscola;
  public
    
  end;

var
  frmCAD_PUBLICO: TfrmCAD_PUBLICO;

implementation

uses UPesquisa;

{$R *.dfm}

procedure TfrmCAD_PUBLICO.FormCreate(Sender: TObject);
begin
  Tabela := 'CAD_PUBLICO';
  inherited;
end;

procedure TfrmCAD_PUBLICO.txtCodPublicoEnter(Sender: TObject);
begin
  inherited;
  ProximoNumero(txtCodPublico);
  lvwParte.Items.Clear;
end;

procedure TfrmCAD_PUBLICO.txtCodPublicoChange(Sender: TObject);
begin
  inherited;
  ProximoNumero(txtCodPublico);
end;

function TfrmCAD_PUBLICO.PesquisaNova(Sender: TObject;
    blnValida: boolean; Msg: boolean = true): boolean;
var Edt      : TEditlabel;
    EdtN     : TEdit;
    Pesquisa : TPesquisa;
    str      : array[0..2] of string;

begin
  Edt := Sender as TEditLabel;
  EdtN:= Edt._Edit;

  if (Edt._Campo = 'COD_PUBLICO') then
  begin
    str[0] := 'COD_PUBLICO,NOM_PUBLICO';
    str[1] := 'CAD_PUBLICO';
    str[2] := EmptyStr;
  end
  else if (Edt._Campo = 'COD_CIDADE') then
  begin
    str[0] := 'COD_CIDADE,NOM_CIDADE';
    str[1] := 'CAD_CIDADE';
    str[2] := EmptyStr;
  end
  else
    Exit;

  Pesquisa := TPesquisa.Create;
  Result := Pesquisa.ExecutaPesquisa(blnValida,str[0],str[1],Edt,EdtN,str[2],Msg);

  {if (not Result) and (blnValida) and (Edt.Visible) and (Edt.Enabled) then
    Edt.SetFocus;}

  Pesquisa.Free;
end;


procedure TfrmCAD_PUBLICO.txtCodPublicoClickButton(Sender: TObject);
begin
  inherited;
  PesquisaNova(Sender,false,false);
end;

procedure TfrmCAD_PUBLICO.txtCodPublicoExit(Sender: TObject);
begin
  inherited;
  PesquisaNova(Sender,true,false); 
end;

procedure TfrmCAD_PUBLICO.optFemininoClick(Sender: TObject);
begin
  inherited;

  if optMaculino.Checked then
  begin
    chkMoradora.Checked := false;
    chkMoradora.Enabled := false;
  end
  else
    chkMoradora.Enabled := True;

end;

procedure TfrmCAD_PUBLICO.edtCOD_CIDADEClickButton(Sender: TObject);
begin
  inherited;
  PesquisaNova(Sender,false);
end;

procedure TfrmCAD_PUBLICO.edtCOD_CIDADEExit(Sender: TObject);
begin
  inherited;
  if not PesquisaNova(Sender,true) then
    edtCOD_CIDADE.SetFocus;
end;

procedure TfrmCAD_PUBLICO.chkAtivoClick(Sender: TObject);
begin
  inherited;
  if chkAtivo.Checked = true then
    chkAtivo.Font.Color := clWindowText
  else
    chkAtivo.Font.Color := clRed;
end;

procedure TfrmCAD_PUBLICO.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
   case key of
    VK_F4:
    begin
      if tabPrinc.ActivePage = tab1 then
      begin
        tabPrinc.ActivePage := tab2;
      end
      else if tabPrinc.ActivePage = tab2 then
      begin
        tabPrinc.ActivePage := tab3;
        CarregaPartesEscola;
      end
      else if tabPrinc.ActivePage = tab3 then
      begin
        tabPrinc.ActivePage := tab1;
      end;
    end;

  end;
end;

procedure TfrmCAD_PUBLICO.CarregaPartesEscola;
var
  str : string;
  ds  : TDataSource;
  item: TListItem;
  i   : integer;
begin
  str :=  'Select '+
          '  COD_TP_PARTE,'+
          '  NOM_TP_PARTE '+
          ' From '+
          '  CAD_TP_PARTE '+
          ' Where ';

  if optMaculino.Checked then
    str := str +' FLG_SEXO In ('+cnn.Aspas('M')+','+cnn.Aspas('A')+')'
  else
    str := str +' FLG_SEXO In ('+cnn.Aspas('F')+','+cnn.Aspas('A')+')';

  if cnn.ExecuteQuery(str,ds) then
  begin
    lvwParte.Items.Clear;
    while not ds.DataSet.Eof do
    begin
      item := lvwParte.Items.Add;
      item.Caption := ds.DataSet.FieldByName('NOM_TP_PARTE').AsString;
      item.SubItems.Add(ds.DataSet.FieldByName('COD_TP_PARTE').AsString);
      ds.DataSet.Next;
    end;
  end;
  // MARCAR AS DESIGNACOES
  if trim(txtCodPublico.Text) <> EmptyStr then
  begin
    str :=  'Select '+
            '  COD_TP_PARTE '+
            ' From '+
            '  CAD_PUBLICO_PARTE '+
            ' Where '+
            '  COD_PUBLICO = '+txtCodPublico.Text;
    if cnn.ExecuteQuery(str,ds) then
    begin
      while not ds.DataSet.Eof do
      begin
        for i := 0 to lvwParte.Items.Count -1 do
        begin
          if lvwParte.Items[i].SubItems[0] = ds.DataSet.Fields[0].AsString then
          begin
            lvwParte.Items[i].Checked := true;
            break;
          end;
        end; //end for
        ds.DataSet.Next;
      end; //end while
    end; //end if
  end;
end;

procedure TfrmCAD_PUBLICO.tabPrincChange(Sender: TObject);
begin
  inherited;
  if tabPrinc.ActivePage = tab3 then
  begin
    CarregaPartesEscola;
  end;
end;

procedure TfrmCAD_PUBLICO.txtHabilitaEdicaoEnter(Sender: TObject);
begin
  inherited;
  CarregaPartesEscola;
end;

procedure TfrmCAD_PUBLICO.GravarPartesEscola;
var str: string;
    i  : integer;
begin
  if trim(txtCodPublico.Text) <> EmptyStr then
  begin
    str :=  'Delete From CAD_PUBLICO_PARTE '+
            '  Where '+
            '  COD_PUBLICO = '+txtCodPublico.Text;
    cnn.Execute(str);
    for i := 0 to lvwParte.Items.Count - 1 do
    begin
      if lvwParte.Items[i].Checked then
      begin
        str :=  'Insert Into CAD_PUBLICO_PARTE('+
                '  COD_PUBLICO,'+
                '  COD_TP_PARTE'+
                ') Values ( '+
                txtCodPublico.Text+','+
                lvwParte.Items[i].SubItems[0]+')';
        cnn.Execute(str);                
      end;// end if                
    end;// end for
  end;// end if
end;

procedure TfrmCAD_PUBLICO.btnIncluiClick(Sender: TObject);
var str: String;
begin
  if btnInclui.Enabled then
  begin
    if MessageDlg('Confirma Inclusão?', mtConfirmation,[mbYes,mbNo],0) = mrYes then
    begin
      str := MontaSql(tpInsert);
      GravaBanco(tpInsert,str,false,false);
      GravarPartesEscola;
      LimpaCampos;
    end;   
  end;
end;

procedure TfrmCAD_PUBLICO.btnAlteraClick(Sender: TObject);

var str: string;

begin
  if btnAltera.Enabled then
  begin
    if MessageDlg('Confirma Alteração?', mtConfirmation,[mbYes,mbNo],0) = mrYes then
    begin
      str := MontaSql(tpUpdate);
      GravaBanco(tpUpdate,str,false,false);
      GravarPartesEscola;
      LimpaCampos;
    end;  
  end;
end;

end.
