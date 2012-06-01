unit UCadLayEmpNF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmLeftRigth, StdCtrls, Grids, DBGrids, Buttons, ComCtrls,
  ExtCtrls, Mask, EditLabel, UComponentTag;

type
  TfrmCadEmpLayNF = class(TfrmLeftRigth)
    edtCodigo: TEditLabel;
    edtCodEmpresaN: TEditTag;
    procedure FormCreate(Sender: TObject);
    procedure edtCodigoClickButton(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
  private
    function PesquisaNova(Sender: TObject; blnValida: boolean = false; blnMsg: boolean = true): boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadEmpLayNF: TfrmCadEmpLayNF;

implementation

uses UPesquisa;

{$R *.dfm}

function TfrmCadEmpLayNF.PesquisaNova(Sender: TObject;
  blnValida: boolean = false; blnMsg: boolean = true): boolean;
var Edt      : TEditlabel;
    EdtN     : TEdit;
    Pesquisa : TPesquisa;
    str      : array[0..2] of string;

begin
  Edt := Sender as TEditLabel;
  EdtN:= Edt._Edit;

  if (UpperCase(Edt._Campo) = 'COD_EMPRESA') then
  begin
    str[0] := 'COD_EMPRESA,NOM_EMPRESA';
    str[1] := 'CAD_EMPRESA';
    str[2] := EmptyStr;
  end;

  Pesquisa := TPesquisa.Create;
  Result := Pesquisa.ExecutaPesquisa(blnValida,str[0],str[1],Edt,EdtN,str[2],blnMsg);

  if (not Result) and (blnValida) and (Edt.Visible) and (Edt.Enabled) then
    Edt.SetFocus;
    
  Pesquisa.Free;
end;

procedure TfrmCadEmpLayNF.FormCreate(Sender: TObject);
begin
  inherited;

  Tabela := 'CAD_EMP_LAY_NF';
  CampoGrid := 'COD_LAYOUT';

  TitleCodigo := 'TIPO';
  TitleNome := 'DESCRIÇÃO';

  CampoChar := false;

  SqlEsquerda := 'Select            '+
                 'COD_LAYOUT,       '+
                 'NOM_LAYOUT        '+
                 'From              '+
                 'CAD_LAYOUT_NF     '+
                 'Where             '+
                 'COD_LAYOUT Not In '+
                 '(Select COD_LAYOUT'+
                 '   From '+Tabela;

  SqlDireita  := 'Select            '+
                 'COD_LAYOUT,       '+
                 'NOM_LAYOUT        '+
                 'From              '+
                 'CAD_LAYOUT_NF     '+
                 'Where             '+
                 'COD_LAYOUT In     '+
                 '(Select COD_LAYOUT'+
                 '   From '+Tabela;

end;

procedure TfrmCadEmpLayNF.edtCodigoClickButton(Sender: TObject);
begin
  inherited;
  PesquisaNova(Sender);
end;

procedure TfrmCadEmpLayNF.edtCodigoExit(Sender: TObject);
begin
  inherited;
  PesquisaNova(Sender,true);
end;

end.
