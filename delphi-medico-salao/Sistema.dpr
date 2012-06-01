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
  UConta in 'FONTE\UConta.pas',
  UCAD_MEDICO in 'FONTE\UCAD_MEDICO.pas' {frmCAD_MEDICO},
  UCAD_ESPEC in 'FONTE\UCAD_ESPEC.pas' {frmCAD_ESPEC},
  UCAD_CONVENIO in 'FONTE\UCAD_CONVENIO.pas' {frmCAD_CONVENIO},
  UCAD_HOSPITAL in 'FONTE\UCAD_HOSPITAL.pas' {frmCAD_HOSPITAL},
  UCAD_CIDADE in 'FONTE\UCAD_CIDADE.pas' {frmCAD_CIDADE},
  UPesqMedico in 'FONTE\UPesqMedico.pas' {frmPesqMedico},
  UCAD_MED_HIST in 'FONTE\UCAD_MED_HIST.pas' {frmCAD_MED_HIST};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
