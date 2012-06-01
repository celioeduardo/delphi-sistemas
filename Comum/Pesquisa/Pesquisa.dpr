program Pesquisa;

uses
  Forms,
  UPesquisa in 'UPesquisa.pas' {frmPesquisa},
  UTeste in 'UTeste.pas' {frmTeste},
  Functions in '..\Generico\Functions.pas',
  UConexao in '..\Generico\UConexao.pas',
  UFirebird in '..\Generico\UFirebird.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmTeste, frmTeste);
  Application.CreateForm(TfrmPesquisa, frmPesquisa);
  Application.Run;
end.
