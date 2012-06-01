unit UTeste;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, EditLabel, UConexao, UPesquisa, Functions,
  UComponentTag;

type
  TfrmTeste = class(TForm)
    Tipo: TLabel;
    ctl: TEditLabel;
    ctlN: TEdit;
    Button1: TButton;
    cboTipo: TComboBoxTag;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ctlExit(Sender: TObject);
    procedure ctlClickButton(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTeste: TfrmTeste;
  Pesquisa : TPesquisa;

implementation

{$R *.dfm}

procedure TfrmTeste.FormCreate(Sender: TObject);
var
  cnn : TConexao;
  str : string;
begin
  GloStrUser := 'sysdba';
  GloStrPassword := 'masterkey';
  cnn := TConexao.Create(GloStrUser,GloStrPassword);
  cnn.Open;
  str := 'Select '+
         '  NOM_CADASTRO,'+
         '  FLG_CADASTRO'+
         ' From '+
         '  CAD_TP_CADASTRO';

  cnn.ExecuteQuery(str,cboTipo);
  Pesquisa := TPesquisa.Create;
end;

procedure TfrmTeste.Button1Click(Sender: TObject);
begin
  cboTipo.ItemIndex
//  frmPesquisa.Show;
end;

procedure TfrmTeste.ctlExit(Sender: TObject);
begin
  Pesquisa.Campos  := 'A.COD_CADASTRO,A.NOM_CADASTRO,A.FLG_CADASTRO';
  Pesquisa.Tabela := 'CAD_PUBLICO';
  Pesquisa.Where := 'A.FLG_CADASTRO = '+ Aspas(cboTipo.BoundText);
  Pesquisa.CampoCodigo := ctl;
  Pesquisa.CampoNome := ctlN;
  Pesquisa.ExecutaPesquisa(True);
end;

procedure TfrmTeste.ctlClickButton(Sender: TObject);
begin
  Pesquisa.Campos  := 'A.COD_CADASTRO,A.NOM_CADASTRO,A.FLG_CADASTRO';
  Pesquisa.Tabela := 'CAD_PUBLICO';
  Pesquisa.Where := 'A.FLG_CADASTRO = '+ Aspas(cboTipo.BoundText);
  Pesquisa.CampoCodigo := ctl;
  Pesquisa.CampoNome := ctlN;
  Pesquisa.ExecutaPesquisa(False);
end;

End.
