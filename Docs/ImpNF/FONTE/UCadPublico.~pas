unit UCadPublico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ufrm, StdCtrls, UComponentTag, Mask, EditLabel, ComCtrls,
  Buttons, ExtCtrls;

type
  TfrmCadPublico = class(Tfrm)
    edtCodigo: TEditLabel;
    edtNome: TEditLabel;
    edtCNPJ: TEditLabel;
    edtIE: TEditLabel;
    edtEndereco: TEditLabel;
    edtCIDADE: TEditLabel;
    edtBairro: TEditLabel;
    edtCEP: TEditLabel;
    edtFONE: TEditLabel;
    cboUF: TComboBoxTag;
    edtPraca: TEditLabel;
    procedure edtCodigoEnter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    function PesquisaNova(Sender: TObject; blnValida: boolean; blnMsg: boolean = true): boolean;
    procedure edtCodigoClickButton(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadPublico: TfrmCadPublico;

implementation

uses UGlobal, UFuncBD, UConexao, UPesquisa;

{$R *.dfm}

procedure TfrmCadPublico.edtCodigoEnter(Sender: TObject);

var str: string;

begin
  inherited;
  if trim(edtCodigo.text) = '' then
  begin
    str := 'Select Max(COD_PUBLICO) + 1 COD_PUBLICO'
           +' From CAD_PUBLICO';
    edtCodigo.Text := SFN_RETORNA_PROX(cnn,str,'COD_PUBLICO');
    edtCodigo.SelectAll;
  end;
end;

procedure TfrmCadPublico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if Action = caFree then
    cnn.Destroy;
end;

procedure TfrmCadPublico.FormCreate(Sender: TObject);

const Estados = 'SPMGRJRSSCPRESDFMTMSGOTOBASEALPBPEMARNCEPIPAAMAPACRRRO';

var strList: TStringList;
    str    : string;
    i      : integer;

begin
  Left:=0;
  tOP:=0;
  DisablePanel(True);
  cnn := TConexao.Create(GloStrUser,GloStrPassword,GloStrDatabase, GloStrServer);
  cnn.Open;
  pnl1.BevelInner := bvNone;
  pnl2.BevelInner := bvNone;
  tab.TabIndex := 0;
  PrencheEmpresa;
  Tabela := 'CAD_PUBLICO';
  for i := 0 to Length(Estados) - 1 Do
  begin
    if (i mod 2 = 0) then
    begin
      str := copy(Estados,i+1,2);
      strList := TStringList.Create;
      strList.Add(str);
      cboUF.AddItem(str,strList);
    end;
  end;
end;

function TfrmCadPublico.PesquisaNova(Sender: TObject; blnValida: boolean; blnMsg: boolean = true): boolean;

var Edt      : TEditlabel;
    EdtN     : TEdit;
    Pesquisa : TPesquisa;
    str      : array[0..2] of string;

begin
  Edt := Sender as TEditLabel;
  EdtN:= Edt._Edit;
  if blnValida then
    str[2] := edt._Campo + ' = ' + edt.Text;

  if Edt._Campo = 'COD_PUBLICO' then
  begin
    str[0] := 'COD_PUBLICO,NOM_PUBLICO';
    str[1] := 'CAD_PUBLICO';
  end;

  Pesquisa := TPesquisa.Create;
  Result := Pesquisa.ExecutaPesquisa(blnValida,str[0],str[1],Edt,EdtN,str[2],blnMsg);
  Pesquisa.Free;
end;


procedure TfrmCadPublico.edtCodigoClickButton(Sender: TObject);

begin
  inherited;
  PesquisaNova(Sender,false,false);
end;

procedure TfrmCadPublico.edtCodigoExit(Sender: TObject);

begin
  inherited;
  PesquisaNova(Sender,true,false);
end;

end.
