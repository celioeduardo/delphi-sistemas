unit UCadEmpresa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ufrm, StdCtrls, ComCtrls, Buttons, ExtCtrls, Mask, EditLabel;

type
  TfrmCadEmpresa = class(Tfrm)
    edtCodigo: TEditLabel;
    edtNome: TEditLabel;
    procedure FormCreate(Sender: TObject);
    procedure edtCodigoClickButton(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
    procedure edtCodigoEnter(Sender: TObject);
  private
    function PesquisaNova(Sender: TObject; blnValida: boolean; blnMsg: boolean = true): boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadEmpresa: TfrmCadEmpresa;

implementation

uses UPesquisa;

{$R *.dfm}

function TfrmCadEmpresa.PesquisaNova(Sender: TObject; blnValida: boolean; blnMsg: boolean = true): boolean;

var Edt      : TEditlabel;
    EdtN     : TEdit;
    Pesquisa : TPesquisa;
    str      : array[0..2] of string;

begin
  Edt := Sender as TEditLabel;
  EdtN:= Edt._Edit;
  if blnValida then
    str[2] := edt._Campo + ' = ' + edt.Text;

  if Edt._Campo = 'COD_EMPRESA' then
  begin
    str[0] := 'COD_EMPRESA,NOM_EMPRESA';
    str[1] := 'CAD_EMPRESA';
  end;

  Pesquisa := TPesquisa.Create;
  Result := Pesquisa.ExecutaPesquisa(blnValida,str[0],str[1],Edt,EdtN,str[2],blnMsg);
  Pesquisa.Free;
end;


procedure TfrmCadEmpresa.FormCreate(Sender: TObject);
begin
  inherited;
  Tabela := 'CAD_EMPRESA';
end;

procedure TfrmCadEmpresa.edtCodigoClickButton(Sender: TObject);
begin
  inherited;
  PesquisaNova(Sender,false,false);
end;

procedure TfrmCadEmpresa.edtCodigoExit(Sender: TObject);
begin
  inherited;
  PesquisaNova(Sender,true,false);
end;

procedure TfrmCadEmpresa.edtCodigoEnter(Sender: TObject);
begin
  inherited;
  ProximoNumero(edtCodigo);
end;

end.
