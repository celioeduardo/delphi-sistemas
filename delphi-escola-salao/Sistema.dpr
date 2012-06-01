program Sistema;

uses
  Forms,
  UPrincipal in 'FONTE\UPrincipal.pas' {frmPrincipal},
  Ufrm in '..\Comum\Form\Ufrm.pas' {frm},
  UCAD_TP_REUNIAO in 'FONTE\UCAD_TP_REUNIAO.pas' {frmCAD_TP_REUNIAO},
  UConexao in '..\Comum\Generico\UConexao.pas',
  UException in '..\Comum\Generico\UException.pas',
  UFirebird in '..\Comum\Generico\UFirebird.pas',
  UPesquisa in '..\Comum\Pesquisa\UPesquisa.pas' {frmPesquisa},
  ULocalizar in '..\Comum\Form\ULocalizar.pas' {frmLocalizar},
  UCAD_TP_PARTE in 'FONTE\UCAD_TP_PARTE.pas' {frmCAD_TP_PARTE},
  UCAD_SALA in 'FONTE\UCAD_SALA.pas' {frmCAD_SALA},
  UCAD_PUBLICO in 'FONTE\UCAD_PUBLICO.pas' {frmCAD_PUBLICO},
  EditLabel in '..\Comum\Componente\EditLabel.pas',
  UComponentTag in '..\Comum\Componente\UComponentTag.pas',
  Functions in '..\Comum\Generico\Functions.pas',
  UGlobal in '..\Comum\Generico\UGlobal.pas',
  UCAD_MOD_REUNIAO in 'FONTE\UCAD_MOD_REUNIAO.pas' {frmCAD_MOD_REUNIAO},
  UCAD_PROGRAMA in 'FONTE\UCAD_PROGRAMA.pas' {frmCAD_PROGRAMA},
  UCAD_RESTR_SEMANA in 'FONTE\UCAD_RESTR_SEMANA.pas' {frmCAD_RESTR_SEMANA},
  UCAD_CIDADE in 'FONTE\UCAD_CIDADE.pas' {frmCAD_CIDADE},
  UCAD_PONTO in 'FONTE\UCAD_PONTO.pas' {frmCAD_PONTO},
  UCAD_CENA in 'FONTE\UCAD_CENA.pas' {frmCAD_CENA},
  UfrmLeftRigth in '..\Comum\Form\UfrmLeftRigth.pas' {frmLeftRigth},
  UCAD_PARTE_PONTO in 'FONTE\UCAD_PARTE_PONTO.pas' {frmCAD_PARTE_PONTO},
  UCAD_PARTE_CENA in 'FONTE\UCAD_PARTE_CENA.pas' {frmCAD_PARTE_CENA},
  UCAD_REUNIAO in 'FONTE\UCAD_REUNIAO.pas' {frmCAD_REUNIAO},
  UDesignacaoReuniao in 'FONTE\UDesignacaoReuniao.pas' {frmDesignacaoReuniao},
  UCAD_PARTE_SALA in 'FONTE\UCAD_PARTE_SALA.pas' {frmCAD_PARTE_SALA},
  UdmRelatorio in 'FONTE\UdmRelatorio.pas' {dmRelatorio: TDataModule},
  UCAD_PONTO_CONCLUIDO in 'FONTE\UCAD_PONTO_CONCLUIDO.pas' {frmCAD_PONTO_CONCLUIDO},
  UCAD_TER_APTO in 'FONTE\UCAD_TER_APTO.pas' {frmCAD_TER_APTO},
  UCAD_APTO in 'FONTE\UCAD_APTO.pas' {frmCAD_APTO};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
