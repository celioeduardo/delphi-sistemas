program Sistema;

uses
  Forms,
  UPrincipal in 'FONTE\UPrincipal.pas' {frmPrincipal},
  UGlobal in '..\Comum\Generico\UGlobal.pas',
  UConexao in '..\Comum\Generico\UConexao.pas',
  UFirebird in '..\Comum\Generico\UFirebird.pas',
  UComponentTag in '..\Comum\Componente\UComponentTag.pas',
  EditLabel in '..\Comum\Componente\EditLabel.pas',
  Functions in '..\Comum\Generico\Functions.pas',
  UException in '..\Comum\Generico\UException.pas',
  ULocalizar in '..\Comum\Form\ULocalizar.pas' {frmLocalizar},
  Ufrm in '..\Comum\Form\Ufrm.pas' {frm},
  UfrmLeftRigth in '..\Comum\Form\UfrmLeftRigth.pas' {frmLeftRigth},
  UPesquisa in '..\Comum\Pesquisa\UPesquisa.pas' {frmPesquisa},
  UdmRelatorio in 'FONTE\UdmRelatorio.pas' {dmRelatorio: TDataModule},
  UCAD_CONTA in 'FONTE\UCAD_CONTA.pas' {frmCAD_CONTA},
  UCAD_TP_LANC in 'FONTE\UCAD_TP_LANC.pas' {frmCAD_TP_LANC},
  UMOV_LANCAMENTO in 'FONTE\UMOV_LANCAMENTO.pas' {frmMOV_LANCAMENTO},
  UCAD_CONFIG in 'FONTE\UCAD_CONFIG.pas' {frmCAD_CONFIG},
  UPesqLanc in 'FONTE\UPesqLanc.pas' {frmPesqLanc},
  UCAD_FECHAMENTO in 'FONTE\UCAD_FECHAMENTO.pas' {frmCAD_FECHAMENTO},
  UConta in 'FONTE\UConta.pas',
  UGerenciamento in 'FONTE\UGerenciamento.pas' {frmGerencial},
  UCalcDinheiro in 'FONTE\UCalcDinheiro.pas' {frmCalcDinheiro},
  UCAD_PUBLICO in 'FONTE\UCAD_PUBLICO.pas' {frmCAD_PUBLICO},
  UPesqFech in 'FONTE\UPesqFech.pas' {frmPesqFech};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
