unit UPesqMedico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, UComponentTag, Mask, EditLabel, ExtCtrls,
  ComCtrls, Grids, DBGrids, UConexao, UGlobal, RpBase, RpSystem, RpDefine, RpRave;

type
  TfrmPesqMedico = class(TForm)
    tab: TPageControl;
    tabCadastro: TTabSheet;
    pnl1: TPanel;
    txtHabilitaEdicao: TEdit;
    pnl3: TPanel;
    btnLocaliza: TBitBtn;
    btnSair: TBitBtn;
    tabResultadoPesquisa: TTabSheet;
    grd: TDBGrid;
    GroupBox5: TGroupBox;
    optINSSsim: TCheckBox;
    optINSSnao: TCheckBox;
    optINSSdepende: TCheckBox;
    GroupBox6: TGroupBox;
    chkRecNascSim: TCheckBox;
    chkRecNascNao: TCheckBox;
    chkRecNascDepende: TCheckBox;
    GroupBox7: TGroupBox;
    optColaborador: TCheckBox;
    optMuitoColaborador: TCheckBox;
    optConsultor: TCheckBox;
    GroupBox8: TGroupBox;
    optEmergCriAdAmbos: TCheckBox;
    optEmergCriAdCrianca: TCheckBox;
    optEmergCriAdAdulto: TCheckBox;
    optEmergCriAdDepende: TCheckBox;
    GroupBox1: TGroupBox;
    lvwEspec: TListViewTag;
    txtCOD_ESPEC: TEditLabel;
    txtNOM_ESPEC: TEditTag;
    GroupBox2: TGroupBox;
    lvwCidade: TListViewTag;
    txtCOD_CIDADE: TEditLabel;
    txtNOM_CIDADE: TEditTag;
    GroupBox3: TGroupBox;
    lvwConvenio: TListViewTag;
    txtCOD_CONVENIO: TEditLabel;
    txtNOM_CONVENIO: TEditTag;
    GroupBox4: TGroupBox;
    lvwHospital: TListViewTag;
    txtCOD_HOSPITAL: TEditLabel;
    txtNOM_HOSPITAL: TEditTag;
    GroupBox9: TGroupBox;
    chkCriancaSim: TCheckBox;
    chkCriancaNao: TCheckBox;
    chkCriancaDepende: TCheckBox;
    tabHistorico: TTabSheet;
    grdHistorico: TDBGrid;
    btnRelatorio: TBitBtn;
    tabMaisFiltros: TTabSheet;
    txtNomeMedico: TEditLabel;
    txtObservacao: TEditLabel;
    txtHistorico: TEditLabel;
    btnLimparFiltros: TButton;
    tabRelatorio: TTabSheet;
    GroupBox10: TGroupBox;
    optAgruparEspecialidade: TRadioButton;
    optAgruparHospital: TRadioButton;
    optOrdemAlfabetica: TRadioButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSairClick(Sender: TObject);
    procedure btnLocalizaClick(Sender: TObject);
    procedure grdDblClick(Sender: TObject);
    procedure txtCOD_ESPECClickButton(Sender: TObject);
    procedure txtCOD_ESPECExit(Sender: TObject);
    procedure txtCOD_CIDADEExit(Sender: TObject);
    procedure txtCOD_CIDADEClickButton(Sender: TObject);
    procedure txtCOD_CONVENIOClickButton(Sender: TObject);
    procedure txtCOD_CONVENIOExit(Sender: TObject);
    procedure txtCOD_HOSPITALExit(Sender: TObject);
    procedure txtCOD_HOSPITALClickButton(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grdCellClick(Column: TColumn);
    procedure tabChange(Sender: TObject);
    procedure grdKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnRelatorioClick(Sender: TObject);
    procedure btnLimparFiltrosClick(Sender: TObject);
  private
    function PesquisaNova(Sender: TObject;
        blnValida: boolean; Msg: boolean = true): boolean;
    procedure CarregaHistorico;    
  public
    procedure PesquisaMedicos;
    procedure RelatorioMedicos;
    procedure RelatorioMedicosHospital;    
    function MontaWhere: string;
  end;

var
  frmPesqMedico: TfrmPesqMedico;
  cnn: TConexao;

implementation

{$R *.dfm}

uses UPrincipal, Functions, DB, UPesquisa, UdmRelatorio;


function Implode(str: string; arr: array of string): string;
var
  i, i_max: Longint;
  strAux: string;
begin

  i_max := Length(arr) - 1;

  for i := 0 to i_max do
  begin
    if trim(arr[i]) <> EmptyStr then
    begin
      strAux := strAux + arr[i] + str;
    end;
  end;

  Result := Left(strAux,Length(strAux)-Length(str));

end;

procedure TfrmPesqMedico.PesquisaMedicos;
var
  str: string;

begin
  str :=
  'Select '+
  'A.COD_MEDICO,'+
  'Case A.FLG_SEXO '+
  '  When '+cnn.Aspas('M')+' Then '+cnn.Aspas('DR. ')+'||A.NOM_MEDICO'+
  '  Else '+cnn.Aspas('DRA. ')+'||A.NOM_MEDICO '+
  '  End NOM_MEDICO,'+
  'Case '+
  '  When A.NOM_COMPL_ESPEC Is Not Null Then B.NOM_ESPEC||'+cnn.Aspas(' (')+'||A.NOM_COMPL_ESPEC||'+cnn.Aspas(')')+
  '  Else B.NOM_ESPEC '+
  '  End NOM_ESPEC,'+
  'C.NOM_CIDADE||'+cnn.Aspas('-')+'||C.NOM_UF NOM_CIDADE,'+
  'A.NOM_ENDERECO,'+
  'A.NOM_BAIRRO,'+
  'A.NUM_CEP,'+
  'A.NUM_FONE1,'+
  'A.NUM_FONE2,'+
  'A.NUM_FONE3,'+
  'A.NUM_FONE_EMERG,'+
  'A.NUM_FONE_RESID,'+
  'Case A.FLG_INSS '+
  '  When '+cnn.Aspas('S')+' Then '+cnn.Aspas('SIM')+
  '  When '+cnn.Aspas('N')+' Then '+cnn.Aspas('NÃO')+
  '  When '+cnn.Aspas('D')+' Then '+cnn.Aspas('DEPENDE')+
  '  End FLG_INSS,'+
  'Case A.FLG_CRIANCA '+
  '  When '+cnn.Aspas('S')+' Then '+cnn.Aspas('SIM')+
  '  When '+cnn.Aspas('N')+' Then '+cnn.Aspas('NÃO')+
  '  When '+cnn.Aspas('D')+' Then '+cnn.Aspas('DEPENDE')+
  '  End FLG_CRIANCA,'+
  'Case A.FLG_RECEM_NASC '+
  '  When '+cnn.Aspas('S')+' Then '+cnn.Aspas('SIM')+
  '  When '+cnn.Aspas('N')+' Then '+cnn.Aspas('NÃO')+
  '  When '+cnn.Aspas('D')+' Then '+cnn.Aspas('DEPENDE')+
  '  End FLG_RECEM_NASC,'+
  'Case A.FLG_EMERG_CR_AD '+
  '  When '+cnn.Aspas('S')+' Then '+cnn.Aspas('AMBOS')+
  '  When '+cnn.Aspas('C')+' Then '+cnn.Aspas('CRIANÇA')+
  '  When '+cnn.Aspas('A')+' Then '+cnn.Aspas('ADULTO')+
  '  When '+cnn.Aspas('D')+' Then '+cnn.Aspas('DEPENDE')+
  '  End FLG_EMERG_CR_AD,'+
  'Case A.FLG_COLABORA '+
  '  When '+cnn.Aspas('C')+' Then '+cnn.Aspas('COLABORADOR')+
  '  When '+cnn.Aspas('M')+' Then '+cnn.Aspas('MUITO COLABORADOR')+
  '  When '+cnn.Aspas('S')+' Then '+cnn.Aspas('CONSULTOR')+
  '  End FLG_COLABORA, '+
  'A.DSC_OBS '+
  ' From '+
  'CAD_MEDICO A, '+
  'CAD_ESPEC B,'+
  'CAD_CIDADE C'+
  ' Where '+
  'A.COD_ESPEC = B.COD_ESPEC And '+
  'A.COD_CIDADE = C.COD_CIDADE';

  // FILTROS

  str := str + MontaWhere;

  str := str + ' Order By A.NOM_MEDICO Desc';

  if not cnn.ExecuteQuery(str,grd) then
  begin
    grd.DataSource.DataSet := nil;
    exit;
  end;

  tab.ActivePage := tabResultadoPesquisa;

  with grd.DataSource.DataSet do
  begin
    TFloatField(FieldByName('NUM_FONE1')).DisplayFormat:='(##) ####-####';
    TFloatField(FieldByName('NUM_FONE2')).DisplayFormat:='(##) ####-####';
    TFloatField(FieldByName('NUM_FONE3')).DisplayFormat:='(##) ####-####';
    TFloatField(FieldByName('NUM_FONE_EMERG')).DisplayFormat:='(##) ####-####';
    TFloatField(FieldByName('NUM_FONE_RESID')).DisplayFormat:='(##) ####-####';
    TFloatField(FieldByName('NUM_CEP')).DisplayFormat:='#####-###';
  end;
end;

procedure TfrmPesqMedico.RelatorioMedicos;
var
  str: string;

begin
  str :=
  'Select '+
  'A.COD_MEDICO,'+
  'Case A.FLG_SEXO '+
  '  When '+cnn.Aspas('M')+' Then '+cnn.Aspas('DR. ')+'||A.NOM_MEDICO'+
  '  Else '+cnn.Aspas('DRA. ')+'||A.NOM_MEDICO '+
  '  End NOM_MEDICO,'+
  'A.NOM_MEDICO_RES,'+
  'A.COD_ESPEC,'+
  'A.NOM_COMPL_ESPEC,'+
  'A.FLG_SEXO,'+
  'C.COD_CIDADE,'+
  'A.NOM_ENDERECO,'+
  'A.NOM_BAIRRO,'+
  'A.NUM_CEP,'+
  'A.NUM_FONE1,'+
  'A.NUM_FONE2,'+
  'A.NUM_FONE3,'+
  'A.NUM_FONE_EMERG,'+
  'A.NUM_FONE_RESID,'+
  'Case A.FLG_INSS '+
  '  When '+cnn.Aspas('S')+' Then '+cnn.Aspas('SIM')+
  '  When '+cnn.Aspas('N')+' Then '+cnn.Aspas('NÃO')+
  '  When '+cnn.Aspas('D')+' Then '+cnn.Aspas('DEPENDE')+
  '  End FLG_INSS,'+
  'Case A.FLG_CRIANCA '+
  '  When '+cnn.Aspas('S')+' Then '+cnn.Aspas('SIM')+
  '  When '+cnn.Aspas('N')+' Then '+cnn.Aspas('NÃO')+
  '  When '+cnn.Aspas('D')+' Then '+cnn.Aspas('DEPENDE')+
  '  End FLG_CRIANCA,'+
  'Case A.FLG_RECEM_NASC '+
  '  When '+cnn.Aspas('S')+' Then '+cnn.Aspas('SIM')+
  '  When '+cnn.Aspas('N')+' Then '+cnn.Aspas('NÃO')+
  '  When '+cnn.Aspas('D')+' Then '+cnn.Aspas('DEPENDE')+
  '  End FLG_RECEM_NASC,'+
  'Case A.FLG_EMERG_CR_AD '+
  '  When '+cnn.Aspas('S')+' Then '+cnn.Aspas('AMBOS')+
  '  When '+cnn.Aspas('C')+' Then '+cnn.Aspas('CRIANÇA')+
  '  When '+cnn.Aspas('A')+' Then '+cnn.Aspas('ADULTO')+
  '  When '+cnn.Aspas('D')+' Then '+cnn.Aspas('DEPENDE')+
  '  End FLG_EMERG_CR_AD,'+
  'Case A.FLG_COLABORA '+
  '  When '+cnn.Aspas('C')+' Then '+cnn.Aspas('COLABORADOR')+
  '  When '+cnn.Aspas('M')+' Then '+cnn.Aspas('MUITO COLABORADOR')+
  '  When '+cnn.Aspas('S')+' Then '+cnn.Aspas('CONSULTOR')+
  '  End FLG_COLABORA, '+
  'A.DSC_OBS,'+
  'B.NOM_ESPEC,'+
  'C.NOM_CIDADE,'+
  'C.NOM_UF'+
  ' From '+
  'CAD_MEDICO A, '+
  'CAD_ESPEC B,'+
  'CAD_CIDADE C'+
  ' Where '+
  'A.COD_ESPEC = B.COD_ESPEC And '+
  'A.COD_CIDADE = C.COD_CIDADE';

  // FILTROS

  str := str + MontaWhere;

  str := str + ' Order By A.COD_ESPEC,A.NOM_MEDICO Desc';

  dmRelatorio.ExecutaRelatorio(str,MEDICOS);

end;

procedure TfrmPesqMedico.RelatorioMedicosHospital;
var
  str: string;

begin
  str :=
  'Select '+
  'A.COD_MEDICO,'+
  'Case A.FLG_SEXO '+
  '  When '+cnn.Aspas('M')+' Then '+cnn.Aspas('DR. ')+'||A.NOM_MEDICO'+
  '  Else '+cnn.Aspas('DRA. ')+'||A.NOM_MEDICO '+
  '  End NOM_MEDICO,'+
  'A.NOM_MEDICO_RES,'+
  'A.COD_ESPEC,'+
  'A.NOM_COMPL_ESPEC,'+
  'A.FLG_SEXO,'+
  'C.COD_CIDADE,'+
  'A.NOM_ENDERECO,'+
  'A.NOM_BAIRRO,'+
  'A.NUM_CEP,'+
  'A.NUM_FONE1,'+
  'A.NUM_FONE2,'+
  'A.NUM_FONE3,'+
  'A.NUM_FONE_EMERG,'+
  'A.NUM_FONE_RESID,'+
  'Case A.FLG_INSS '+
  '  When '+cnn.Aspas('S')+' Then '+cnn.Aspas('SIM')+
  '  When '+cnn.Aspas('N')+' Then '+cnn.Aspas('NÃO')+
  '  When '+cnn.Aspas('D')+' Then '+cnn.Aspas('DEPENDE')+
  '  End FLG_INSS,'+
  'Case A.FLG_CRIANCA '+
  '  When '+cnn.Aspas('S')+' Then '+cnn.Aspas('SIM')+
  '  When '+cnn.Aspas('N')+' Then '+cnn.Aspas('NÃO')+
  '  When '+cnn.Aspas('D')+' Then '+cnn.Aspas('DEPENDE')+
  '  End FLG_CRIANCA,'+
  'Case A.FLG_RECEM_NASC '+
  '  When '+cnn.Aspas('S')+' Then '+cnn.Aspas('SIM')+
  '  When '+cnn.Aspas('N')+' Then '+cnn.Aspas('NÃO')+
  '  When '+cnn.Aspas('D')+' Then '+cnn.Aspas('DEPENDE')+
  '  End FLG_RECEM_NASC,'+
  'Case A.FLG_EMERG_CR_AD '+
  '  When '+cnn.Aspas('S')+' Then '+cnn.Aspas('AMBOS')+
  '  When '+cnn.Aspas('C')+' Then '+cnn.Aspas('CRIANÇA')+
  '  When '+cnn.Aspas('A')+' Then '+cnn.Aspas('ADULTO')+
  '  When '+cnn.Aspas('D')+' Then '+cnn.Aspas('DEPENDE')+
  '  End FLG_EMERG_CR_AD,'+
  'Case A.FLG_COLABORA '+
  '  When '+cnn.Aspas('C')+' Then '+cnn.Aspas('COLABORADOR')+
  '  When '+cnn.Aspas('M')+' Then '+cnn.Aspas('MUITO COLABORADOR')+
  '  When '+cnn.Aspas('S')+' Then '+cnn.Aspas('CONSULTOR')+
  '  End FLG_COLABORA, '+
  'A.DSC_OBS,'+
  'B.NOM_ESPEC,'+
  'C.NOM_CIDADE,'+
  'C.NOM_UF,'+
  'D.NOM_HOSPITAL,'+
  'D.COD_HOSPITAL '+
  ' From '+
  'CAD_MEDICO A, '+
  'CAD_ESPEC B,'+
  'CAD_CIDADE C,'+
  'CAD_HOSPITAL D'+
  ' Where '+
  'A.COD_ESPEC = B.COD_ESPEC And '+
  'A.COD_CIDADE = C.COD_CIDADE And '+
  'A.COD_MEDICO = D.COD_HOSPITAL ';

  // FILTROS

  str := str + MontaWhere;

  str := str + ' Order By D.NOM_HOSPITAL,D.COD_HOSPITAL Desc';

  dmRelatorio.ExecutaRelatorio(str,MEDICOS_HOSPITAL);

end;


function TfrmPesqMedico.MontaWhere(): string;
var
  str,strFiltro: string;
  arrFiltro: array [0..3] of string;
begin
  //INSS
  arrFiltro[0] := EmptyStr;
  arrFiltro[1] := EmptyStr;
  arrFiltro[2] := EmptyStr;
  arrFiltro[3] := EmptyStr;
  if optINSSsim.Checked then
    arrFiltro[0] := 'A.FLG_INSS = '+cnn.Aspas('S');
  if optINSSnao.Checked then
    arrFiltro[1] := 'A.FLG_INSS = '+cnn.Aspas('N');
  if optINSSdepende.Checked then
    arrFiltro[2] := 'A.FLG_INSS = '+cnn.Aspas('D');

  strFiltro := Implode(' Or ',arrFiltro);
  if trim(strFiltro) <> EmptyStr then
    str := str + ' And ('+strFiltro+') '; 


  //CRIANÇA
  arrFiltro[0] := EmptyStr;
  arrFiltro[1] := EmptyStr;
  arrFiltro[2] := EmptyStr;
  arrFiltro[3] := EmptyStr;
  if chkCriancaSim.Checked then
    arrFiltro[0] := 'A.FLG_CRIANCA = '+cnn.Aspas('S');
  if chkCriancaNao.Checked then
    arrFiltro[1] := 'A.FLG_CRIANCA = '+cnn.Aspas('N');
  if chkCriancaDepende.Checked then
    arrFiltro[2] := 'A.FLG_CRIANCA = '+cnn.Aspas('D');

  strFiltro := Implode(' Or ',arrFiltro);
  if trim(strFiltro) <> EmptyStr then
    str := str + ' And ('+strFiltro+') '; 


  //RECÉM-NASCIDO
  arrFiltro[0] := EmptyStr;
  arrFiltro[1] := EmptyStr;
  arrFiltro[2] := EmptyStr;
  arrFiltro[3] := EmptyStr;
  if chkRecNascSim.Checked then
    arrFiltro[0] := 'A.FLG_RECEM_NASC = '+cnn.Aspas('S');
  if chkRecNascNao.Checked then
    arrFiltro[1] := 'A.FLG_RECEM_NASC = '+cnn.Aspas('N');
  if chkRecNascDepende.Checked then
    arrFiltro[2] := 'A.FLG_RECEM_NASC = '+cnn.Aspas('D');

  strFiltro := Implode(' Or ',arrFiltro);
  if trim(strFiltro) <> EmptyStr then
    str := str + ' And ('+strFiltro+') '; 


  //EMERGÊNCIA CRIANÇA, ADULTO
  arrFiltro[0] := EmptyStr;
  arrFiltro[1] := EmptyStr;
  arrFiltro[2] := EmptyStr;
  arrFiltro[3] := EmptyStr;
  if optEmergCriAdAmbos.Checked then
    arrFiltro[0] := 'A.FLG_EMERG_CR_AD = '+cnn.Aspas('S');
  if optEmergCriAdCrianca.Checked then
    arrFiltro[1] := 'A.FLG_EMERG_CR_AD = '+cnn.Aspas('C');
  if optEmergCriAdAdulto.Checked then
    arrFiltro[2] := 'A.FLG_EMERG_CR_AD = '+cnn.Aspas('A');
  if optEmergCriAdDepende.Checked then
    arrFiltro[2] := 'A.FLG_EMERG_CR_AD = '+cnn.Aspas('D');

  strFiltro := Implode(' Or ',arrFiltro);
  if trim(strFiltro) <> EmptyStr then
    str := str + ' And ('+strFiltro+') '; 

  //COLABORADOR
  arrFiltro[0] := EmptyStr;
  arrFiltro[1] := EmptyStr;
  arrFiltro[2] := EmptyStr;
  arrFiltro[3] := EmptyStr;
  if optColaborador.Checked then
    arrFiltro[0] := 'A.FLG_COLABORA = '+cnn.Aspas('C');
  if optMuitoColaborador.Checked then
    arrFiltro[1] := 'A.FLG_COLABORA = '+cnn.Aspas('M');
  if optConsultor.Checked then
    arrFiltro[2] := 'A.FLG_COLABORA = '+cnn.Aspas('S');

  strFiltro := Implode(' Or ',arrFiltro);
  if trim(strFiltro) <> EmptyStr then
    str := str + ' And ('+strFiltro+') ';

  //ESPECIALIDADE
  str := str + lvwEspec.MontaWhere('A.COD_ESPEC');
  //CIDADE
  str := str + lvwCidade.MontaWhere('A.COD_CIDADE');

  //CONVÊNIO
  if lvwConvenio.Items.Count > 0 then
  begin
    str := str +
    ' And ('+
    'Select Count(*)'+
    '  From CAD_MED_CONV X '+
    '  Where X.COD_MEDICO = A.COD_MEDICO '+
    lvwConvenio.MontaWhere('X.COD_CONVENIO')+') > 0 ';
  end;

  //HOSPITAL
  if lvwHospital.Items.Count > 0 then
  begin
    str := str +
    ' And ('+
    'Select Count(*)'+
    '  From CAD_MED_HOSP X '+
    '  Where X.COD_MEDICO = A.COD_MEDICO '+
    lvwHospital.MontaWhere('X.COD_HOSPITAL')+') > 0 ';
  end;

  if trim(txtNomeMedico.Text) <> EmptyStr Then
    str := str + ' And Upper(A.NOM_MEDICO) LIKE '+cnn.Aspas('%'+UpperCase(trim(txtNomeMedico.Text))+'%');

  if trim(txtObservacao.Text) <> EmptyStr Then
    str := str + ' And Upper(A.DSC_OBS) LIKE '+cnn.Aspas('%'+UpperCase(trim(txtObservacao.Text))+'%');

  if trim(txtHistorico.Text) <> EmptyStr Then
  begin
    str := str +
    ' And ('+
    'Select Count(*)'+
    '  From CAD_MED_HIST X '+
    '  Where X.COD_MEDICO = A.COD_MEDICO And'+
    '        Upper(X.NOM_HISTORICO) LIKE '+cnn.Aspas('%'+UpperCase(trim(txtHistorico.Text))+'%') +') > 0 ';
  end;

  Result := str;
end;

procedure TfrmPesqMedico.FormCreate(Sender: TObject);
begin

  Left:=0;
  tOP:=0;
  tab.ActivePageIndex := 0;
  cnn := TConexao.Create(GloStrUser,GloStrPassword,GloStrDatabase, GloStrServer, GloBlnEmbedded);
  cnn.Open;
end;

procedure TfrmPesqMedico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := CaFree
end;

procedure TfrmPesqMedico.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPesqMedico.btnLocalizaClick(Sender: TObject);
begin
  PesquisaMedicos;
end;

procedure TfrmPesqMedico.grdDblClick(Sender: TObject);
begin
  if not Assigned(grd.DataSource) then
    Exit
  else if grd.DataSource.DataSet.Eof then
    Exit;

  tab.ActivePageIndex := 1;
end;

function TfrmPesqMedico.PesquisaNova(Sender: TObject;
    blnValida: boolean; Msg: boolean = true): boolean;
var Edt      : TEditlabel;
    EdtN     : TEdit;
    Pesquisa : TPesquisa;
    str      : array[0..2] of string;

begin
  Edt := Sender as TEditLabel;
  EdtN:= Edt._Edit;

  if (Edt._Campo = 'COD_CIDADE') then
  begin
    str[0] := 'COD_CIDADE,NOM_CIDADE||'+cnn.Aspas('-')+'||NOM_UF';
    str[1] := 'CAD_CIDADE';
    str[2] := EmptyStr;
  end
  else if (Edt._Campo = 'COD_ESPEC') then
  begin
    str[0] := 'COD_ESPEC,NOM_ESPEC';
    str[1] := 'CAD_ESPEC';
    str[2] := EmptyStr;
  end
  else if (Edt._Campo = 'COD_CONVENIO') then
  begin
    str[0] := 'COD_CONVENIO,NOM_CONVENIO';
    str[1] := 'CAD_CONVENIO';
    str[2] := EmptyStr;
  end
  else if (Edt._Campo = 'COD_HOSPITAL') then
  begin
    str[0] := 'COD_HOSPITAL,NOM_HOSPITAL';
    str[1] := 'CAD_HOSPITAL';
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


procedure TfrmPesqMedico.txtCOD_ESPECClickButton(Sender: TObject);
begin
  PesquisaNova(Sender,false,true);
end;

procedure TfrmPesqMedico.txtCOD_ESPECExit(Sender: TObject);
begin
  if not PesquisaNova(Sender,true,true) then
    txtCOD_ESPEC.SetFocus; 
end;

procedure TfrmPesqMedico.txtCOD_CIDADEExit(Sender: TObject);
begin
  if not PesquisaNova(Sender,true,true) then
    txtCOD_CIDADE.SetFocus;
end;

procedure TfrmPesqMedico.txtCOD_CIDADEClickButton(Sender: TObject);
begin
  PesquisaNova(Sender,false,true);
end;

procedure TfrmPesqMedico.txtCOD_CONVENIOClickButton(Sender: TObject);
begin
  PesquisaNova(Sender,false,true);
end;

procedure TfrmPesqMedico.txtCOD_CONVENIOExit(Sender: TObject);
begin
  if not PesquisaNova(Sender,true,true) then
    txtCOD_CONVENIO.SetFocus;
end;

procedure TfrmPesqMedico.txtCOD_HOSPITALExit(Sender: TObject);
begin
  if not PesquisaNova(Sender,true,true) then
    txtCOD_HOSPITAL.SetFocus;
end;

procedure TfrmPesqMedico.txtCOD_HOSPITALClickButton(Sender: TObject);
begin
  PesquisaNova(Sender,false,true);
end;

procedure TfrmPesqMedico.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case key of
    VK_RETURN: keybd_event(VK_TAB,0,0,0);
 end;

end;

procedure TfrmPesqMedico.grdCellClick(Column: TColumn);
begin
  CarregaHistorico;
end;

procedure TfrmPesqMedico.CarregaHistorico;
var
  str: string;
begin

  try
    if trim(grd.DataSource.DataSet.FieldByName('COD_MEDICO').AsString) = EmptyStr then
      Exit;

    tabHistorico.Caption := 'Histórico: '+trim(grd.DataSource.DataSet.FieldByName('NOM_MEDICO').AsString);

  except
    Exit;
  end;

  str :=
  'Select '+
  'A.DAT_HISTORICO,'+
  'A.NOM_HISTORICO '+
  ' From '+
  'CAD_MED_HIST A '+
  ' Where '+
  'A.COD_MEDICO = '+grd.DataSource.DataSet.FieldByName('COD_MEDICO').AsString+
  ' Order By A.DAT_HISTORICO ';

  if not cnn.ExecuteQuery(str,grdHistorico) then
  begin
    grdHistorico.DataSource.DataSet := nil;
    exit;
  end;

  with grdHistorico.DataSource.DataSet do
  begin
  end;
end;

procedure TfrmPesqMedico.tabChange(Sender: TObject);
begin
  CarregaHistorico;
end;

procedure TfrmPesqMedico.grdKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  CarregaHistorico;
end;

procedure TfrmPesqMedico.btnRelatorioClick(Sender: TObject);
begin
  if optAgruparEspecialidade.Checked then
    RelatorioMedicos
  else if optAgruparHospital.Checked then
    RelatorioMedicosHospital
  else if optOrdemAlfabetica.Checked then
    RelatorioMedicos;

end;

procedure TfrmPesqMedico.btnLimparFiltrosClick(Sender: TObject);
begin
  optINSSsim.Checked := false;
  optINSSnao.Checked := false;
  optINSSdepende.Checked := false;
  optColaborador.Checked := false;
  optMuitoColaborador.Checked := false;
  optConsultor.Checked := false;
  optEmergCriAdAmbos.Checked := false;
  optEmergCriAdCrianca.Checked := false;
  optEmergCriAdAdulto.Checked := false;
  optEmergCriAdDepende.Checked := false;
  chkRecNascSim.Checked := false;
  chkRecNascNao.Checked := false;
  chkRecNascDepende.Checked := false;
  chkCriancaSim.Checked := false;
  chkCriancaNao.Checked := false;
  chkCriancaDepende.Checked := false;
  lvwEspec.Items.Clear;
  lvwCidade.Items.Clear;
  lvwConvenio.Items.Clear;
  lvwHospital.Items.Clear;
  txtNomeMedico.Text := EmptyStr;
  txtObservacao.Text := EmptyStr;
  txtHistorico.Text := EmptyStr;
end;

end.
