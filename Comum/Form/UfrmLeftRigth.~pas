unit UfrmLeftRigth;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ufrm, Grids, DBGrids, StdCtrls, Buttons, ComCtrls, ExtCtrls,
  Mask, EditLabel;

type
  TfrmLeftRigth = class(Tfrm)
    btnIncluiTodos: TSpeedButton;
    btnIncluiLinha: TSpeedButton;
    btnExcluiLinha: TSpeedButton;
    btnExcluiTodos: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    grdLeft: TDBGrid;
    grdRight: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure txtHabilitaEdicaoEnter(Sender: TObject);
    procedure btnIncluiLinhaClick(Sender: TObject);
    procedure btnExcluiLinhaClick(Sender: TObject);

  private

    FTitleCodigo: string;
    FTitleNome: string;
    FSqlDireita: string;
    FSqlEsquerda: string;
    FCampoGrid: string;
    FCampoChar: boolean;

    procedure HabilitaEdicao(Editar: boolean; blnGrid: boolean); overload;
    procedure GravaBanco(Tipo: TMontaSql; strComando: string; blnGrid: boolean = true); overload;
    function MontaSql(Tipo: TMontaSql; blnGrid: boolean): String; overload;

  public

    property CampoGrid: string read FCampoGrid write FCampoGrid;
    property TitleCodigo: string read FTitleCodigo write FTitleCodigo;
    property TitleNome: string read FTitleNome write FTitleNome;
    property SqlDireita: string read FSqlDireita write FSqlDireita;
    property SqlEsquerda: string read FSqlEsquerda write FSqlEsquerda;
    property CampoChar: boolean read FcampoChar write FCampoChar default false;

  end;

var
  frmLeftRigth: TfrmLeftRigth;

implementation

uses Functions, StrUtils;

{$R *.dfm}

procedure TfrmLeftRigth.FormCreate(Sender: TObject);
begin
  inherited;
  if not pnl3.Visible then
  begin
    grdLeft.Height := grdLeft.Height + pnl3.Height;
    grdRight.Height := grdRight.Height + pnl3.Height;
  end;
end;

procedure TfrmLeftRigth.HabilitaEdicao(Editar: boolean; blnGrid: boolean);

var str: string;
    strChave: string;

begin
  if Editar then
  begin
    if VerificaNotNull(Editar) then
    begin
      strChave := MontaWhereChave(pnl1);
      str := SqlDireita + strChave + ')';
      if Trim(str) <> '' then
      begin
        DisablePanel(False);
        cnn.ExecuteQuery(str,grdRight);
        str := SqlEsquerda + strChave + ')';
        cnn.ExecuteQuery(str,grdLeft);
      end;
      txtHabilitaEdicao.Enabled := false;
      keybd_event(VK_TAB,0,0,0);
      grdLeft.Columns[0].Title.Caption := TitleCodigo;
      grdLeft.Columns[1].Title.Caption := TitleNome;
      grdRight.Columns[0].Title.Caption := TitleCodigo;
      grdRight.Columns[1].Title.Caption := TitleNome;
    end
    else
      txtHabilitaEdicao.Enabled := true;
  end
  else
    LimpaCampos;
end;

procedure TfrmLeftRigth.txtHabilitaEdicaoEnter(Sender: TObject);
begin
  HabilitaEdicao(True,true);
end;

function TfrmLeftRigth.MontaSql(Tipo: TMontaSql; blnGrid: boolean): String;

var str     : string;
    arrCampo: TStringList;
    arrValor: TStringList;
    i       : integer;
    strWhere: string;
begin
  if not(VerificaNotNull(false)) then
    exit;

  Result := '';
  VarreTela(arrCampo,arrValor,false);

  if arrCampo.Count = 0 then
    exit;

  case Tipo of

    tpInsert:
    begin

      if Trim(grdLeft.Fields[0].text) = EmptyStr then
        exit;

      arrCampo.Add(FCampoGrid);
      arrVAlor.Add(IfThen(FCampoChar,aspas(grdLeft.Fields[0].Text),grdLeft.Fields[0].Text));

      str := 'Insert into ' + Tabela+ '(' +
              arrCampo.CommaText +
              ') Values (';
              for i := 0 to arrCampo.Count-1 do
              begin
                if arrValor.Strings[i] = '' then
                  arrValor.Strings[i] := 'Null';
                str := str+arrValor.Strings[i]+',';
              end;
              str := Copy(str,1,Length(str)-1) + ')';
    end;

    tpDelete:
    begin

      if Trim(grdRight.Fields[0].text) = EmptyStr then
        exit;

      str := 'Delete From '+Tabela;
      strWhere := MontaWhereChave(pnl1);
      str := str + strWhere + ' And ' + FCampoGrid + '='+ IfThen(FCampoChar,aspas(grdRight.Fields[0].Text),grdRight.Fields[0].Text);
    end;
  end;
  result := str;
end;

procedure TfrmLeftRigth.btnIncluiLinhaClick(Sender: TObject);

var str: string;

begin
  inherited;
  str := MontaSql(tpInsert,true);
  GravaBanco(tpInsert,str,true);
end;

procedure TfrmLeftRigth.btnExcluiLinhaClick(Sender: TObject);

var str: string;

begin
  inherited;
  str := MontaSql(tpDelete,true);
  GravaBanco(tpDelete,str,true);
end;

procedure TfrmLeftRigth.GravaBanco(Tipo: TMontaSql; strComando: string; blnGrid: boolean = true);

var msg: string;

begin
  if strComando = '' then
    exit;
  case Tipo of
    tpInsert: msg := 'Inclusão';
    tpUpdate: msg := 'Alteracão';
    tpDelete: msg := 'Exclusão';
  end;

  if cnn.Execute(strComando) > 0 then
    HabilitaEdicao(true,blnGrid);
end;


end.
