program Sistema;

uses
  Forms,
  UPrincipal in 'UPrincipal.pas' {frmPrincipal},
  Ufrm in '..\..\Comum\Form\Ufrm.pas' {frm},
  UConexao in '..\..\Comum\Generico\UConexao.pas',
  UException in '..\..\Comum\Generico\UException.pas',
  UFirebird in '..\..\Comum\Generico\UFirebird.pas',
  UPesquisa in '..\..\Comum\Pesquisa\UPesquisa.pas' {frmPesquisa},
  ULocalizar in '..\..\Comum\Form\ULocalizar.pas' {frmLocalizar},
  EditLabel in '..\..\Comum\Componente\EditLabel.pas',
  UComponentTag in '..\..\Comum\Componente\UComponentTag.pas',
  Functions in '..\..\Comum\Generico\Functions.pas',
  UGlobal in '..\..\Comum\Generico\UGlobal.pas',
  UCAD_LAYOUT_NF in 'UCAD_LAYOUT_NF.pas' {frmCAD_LAYOUT_NF},
  UCAD_LAY_NF_CAMPO in 'UCAD_LAY_NF_CAMPO.pas' {frmCAD_LAY_NF_CAMPO},
  UEspecifico in 'Units\UEspecifico.pas',
  UCadPublico in 'UCadPublico.pas' {frmCadPublico},
  UCadEmpresa in 'UCadEmpresa.pas' {frmCadEmpresa},
  UNotaFiscal in 'UNotaFiscal.pas' {frmNotaFiscal},
  UFuncBD in '..\..\Comum\Generico\UFuncBD.pas',
  UfrmLeftRigth in '..\..\Comum\Form\UfrmLeftRigth.pas' {frmLeftRigth},
  UCadLayEmpNF in 'UCadLayEmpNF.pas' {frmCadEmpLayNF},
  CharPrinter in '..\..\Comum\Generico\CharPrinter.pas',
  UNOTA_FISCAL_SEQ in 'UNOTA_FISCAL_SEQ.pas' {frmNOTA_FISCAL_SEQ};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
