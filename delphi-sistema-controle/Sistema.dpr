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
  UCAD_CIDADE in 'FONTE\UCAD_CIDADE.pas' {frmCAD_CIDADE},
  UCAD_EMPRESA in 'FONTE\UCAD_EMPRESA.pas' {frmCAD_EMPRESA},
  UCAD_FILIAL in 'FONTE\UCAD_FILIAL.pas' {frmCAD_FILIAL},
  UCAD_P_ATIVO in 'FONTE\UCAD_P_ATIVO.pas' {frmCAD_P_ATIVO},
  UCAD_APRESENTACAO in 'FONTE\UCAD_APRESENTACAO.pas' {frmCAD_APRESENTACAO},
  UCAD_PRODUTO in 'FONTE\UCAD_PRODUTO.pas' {frmCAD_PRODUTO},
  UCAD_FORNECEDOR in 'FONTE\UCAD_FORNECEDOR.pas' {frmCAD_FORNECEDOR},
  URateio in 'FONTE\Units\URateio.pas',
  UClasses in 'FONTE\Units\UClasses.pas',
  UEstoque in 'FONTE\Units\UEstoque.pas',
  UFIS_ENTRADA in 'FONTE\UFIS_ENTRADA.pas' {frmFIS_ENTRADA},
  UFIS_SAIDA in 'FONTE\UFIS_SAIDA.pas' {frmFIS_SAIDA},
  UPesqMovProduto in 'FONTE\UPesqMovProduto.pas' {frmPesqMovProduto},
  UVEN_PEDIDO in 'FONTE\UVEN_PEDIDO.pas' {frmVEN_PEDIDO},
  UCAD_CLIENTE in 'FONTE\UCAD_CLIENTE.pas' {frmCAD_CLIENTE},
  UAcertoEstoque in 'FONTE\UAcertoEstoque.pas' {frmAcertoEstoque},
  USenha in 'FONTE\USenha.pas' {frmSenha},
  UdmRelatorio in 'FONTE\UdmRelatorio.pas' {dmRelatorio: TDataModule},
  UCAD_PRECO_COMPRA in 'FONTE\UCAD_PRECO_COMPRA.pas' {frmCAD_PRECO_COMPRA};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmSenha, frmSenha);
  Application.Run;
end.
