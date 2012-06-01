unit UPesquisa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, EditLabel, Grids, DBGrids, UConexao, DB,
  Functions, UGlobal;

const
  key_DOWN = 40;

type
  TPObject = ^TObject;
  TPesquisa = class
  private
    FCampo : String;
    FTabela : String;
    FWhere  : String;
    FCampoCodigo : TObject;
    FCampoNome  : TObject;
    FCampoCodigoIsChar : Boolean;
    function QueryFiltro(Query, Filtro: string): string;
    function MontaQuery: string;
    function CamposList: TStringList;
    function Where_OU_And(str: string): string;
    procedure AddFiltro(Filtro: string);

  public
    property Campos: string read FCampo write FCampo;
    property Tabela: string read FTabela write FTabela;
    property Where: string read FWhere write FWhere;
    property CampoCodigo: TObject read FCampoCodigo write FCampoCodigo;
    property CampoNome: TObject read FCampoNome write FCampoNome;

    function ExecutaPesquisa(blnValida : boolean; blnMsg: boolean = true): boolean; overload;
    function ExecutaPesquisa(blnValida : boolean; strCampos,strTabela: string; ctlCodigo, ctlNome: TObject; strWhere: string = ''; blnMsg: boolean = true): boolean; overload;
  end;


  TfrmPesquisa = class(TForm)
    GroupBox1: TGroupBox;
    ctl: TEditLabel;
    grpFiltro: TRadioGroup;
    grd: TDBGrid;
    btnLocalizar: TButton;
    btnFechar: TButton;
    lblStatus: TLabel;
    procedure btnFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure ctlEnter(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grdDblClick(Sender: TObject);
    procedure ctlKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grpFiltroClick(Sender: TObject);
  private
    FPesquisa: TPesquisa;
  public
    property Pesquisa: TPesquisa read FPesquisa write FPesquisa;
  end;


var
  frmPesquisa: TfrmPesquisa;

implementation

uses StrUtils;

{$R *.dfm}

procedure TfrmPesquisa.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPesquisa.FormCreate(Sender: TObject);

begin
  lblStatus.Visible := False;
end;

function TPesquisa.CamposList: TStringList;
begin
  if Trim(FCampo) = '' then
    Result := TStringList.Create
  else
    Result := Split(Campos);
end;

function TPesquisa.QueryFiltro(Query, Filtro: string) : string;
begin
  if Trim(FWhere) <> '' then
      Result := Query + Where_OU_And(Query) + Filtro
  else
    Result := Query + Where_OU_And(FWhere) + Filtro;
end;

procedure TPesquisa.AddFiltro(Filtro: string);
begin
  FWhere := FWhere + Where_OU_And(FWhere) + Filtro;
end;

function TPesquisa.Where_OU_And(str: string): string;
begin
  if Pos('WHERE',Trim(UpperCase(str))) = 0 then
    Result := ' Where '
  else
    Result := ' And ';
end;

function TPesquisa.MontaQuery: string;
var
  Campo, Tabela : TStringList;
  str : string;
  i : integer;
begin
  if Trim(FCampo) = '' then
  begin
    Exception.Create('Nenhum campo foi informado!');
    //MessageDlg( ,mtWarning,[mbOK],0);
    Exit;
  end
  else if Trim(FTabela) = '' then
  begin
    Exception.Create('Nenhuma tabela foi informada!');
    //MessageDlg( 'Nenhuma tabela foi informada!',mtWarning,[mbOK],0);
    Exit;
  end;

  Campo := Split(FCampo,',');
  Tabela := Split(FTabela,',');

  str := 'Select ';

  for i := 0 to Campo.Count - 1 do
    str := str + Campo.Strings[i]+',';

  str := MidStr(str,1,Length(str)-1);
  
  str := str + ' From ';

  for i := 0 to Tabela.Count - 1 do
    str := str + Tabela.Strings[i]+' '+Chr(i + 65)+',';

  str := MidStr(str,1,Length(str)-1);

  if Trim(FWhere) <> '' then
    str := str+' Where '+FWhere;

  Result := str;
end;

function TPesquisa.ExecutaPesquisa(blnValida : Boolean; blnMsg: boolean = true): Boolean;
var
  str: string;
  cnn : TConexao;
  ds : TDataSource;
  frmPesq: TfrmPesquisa;
begin
  cnn := TConexao.Create(GloStrUser,GloStrPassword, GloStrDatabase, GloStrServer, GloblnEmbedded);
  if blnValida then
  begin
    if Assigned(FCampoNome) then
    begin
      if Trim(TEdit(FCampoNome).Text) <> '' then
      begin
        Result := True;
        Exit;
      end;
    end;

    if Assigned(FCampoCodigo) then
    begin
      if FCampoCodigo is TEditLabel then
      begin
        if Trim(TEditLabel(FCampoCodigo).Text) <> '' then
        begin
          FCampoCodigoIsChar := TEditLabel(FCampoCodigo)._IsChar;
          str := MontaQuery;
          if FCampoCodigoIsChar = True then
            str := QueryFiltro(str,CamposList[0] +'='+ Aspas(TEditLabel(FCampoCodigo).Text))
          else
            str := QueryFiltro(str,CamposList[0] +'='+ TEditLabel(FCampoCodigo).Text);


          cnn.Open;
          if cnn.ExecuteQuery(str,ds) then
          begin
            TEditLabel(FCampoCodigo).Text := ds.DataSet.Fields[0].AsString;
            if Assigned(FCampoNome) then
              TEdit(FCampoNome).Text := ds.DataSet.Fields[1].AsString;
            Result := true;
          end
          else
          begin
            Result := false;
            if blnMsg then MessageDlg( 'Registro inexistente.',mtInformation,[mbOK],0);
          end;
          ds.Free;
        end
        else
          Result := True;
      end
      else
        Result := false;
    end
    else
      Result := false;
  end
  else
  begin
    frmPesq := TfrmPesquisa.Create(Screen);
    frmPesq.Pesquisa := Self;
    frmPesq.ShowModal;
    frmPesq.Free;
    Result := true;
  end;
  cnn.Destroy;
end;

procedure TfrmPesquisa.btnLocalizarClick(Sender: TObject);
var
  str: string;
  Campo: TStringList;
  cnn: TConexao;

begin
  if not Assigned(FPesquisa) then
  begin
    Exception.Create('Classe Pesquisa não setada para o form.');
    exit;
  end;
  cnn := TConexao.Create(GloStrUser,GloStrPassword, GloStrDatabase, GloStrServer, GloBlnEmbedded);
  Campo := Split(FPesquisa.Campos);
  str := FPesquisa.MontaQuery;
  // FOI PREENCHIDO O CAMPO DE FILTRO
  if Trim(ctl.Text) <> '' then
  begin
    if grpFiltro.ItemIndex = 0 then
      str := FPesquisa.QueryFiltro(str,'Upper('+Campo.Strings[1]+')') + ' LIKE '+Aspas('%'+UpperCase(ctl.Text)+'%')
    else if grpFiltro.ItemIndex = 1 then
      str := FPesquisa.QueryFiltro(str,'Upper('+Campo.Strings[1] + ') LIKE '+Aspas(ctl.Text+'%'))
    else if grpFiltro.ItemIndex = 2 then
      str := FPesquisa.QueryFiltro(str,'Upper('+Campo.Strings[1] + ') LIKE '+Aspas('%'+ctl.Text))
    else if grpFiltro.ItemIndex = 3 then
      str := FPesquisa.QueryFiltro(str,'Upper('+Campo.Strings[1] + ') = '+Aspas(ctl.Text));
  end;
  // ORDENAÇÃO
  str := str + ' Order By ' + Campo[1];
  cnn.Open;
  if cnn.ExecuteQuery(str,grd) then
    grd.SetFocus
  else
  begin
    ctl.SetFocus;
    ctl.SelectAll;
  end;
  cnn.Destroy;
  grd.Columns[0].Field.DisplayLabel := 'Código';
  grd.Columns[1].Field.DisplayLabel := 'Nome';
end;

procedure TfrmPesquisa.ctlEnter(Sender: TObject);
begin
  ctl.SelectAll;
end;

procedure TfrmPesquisa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = key_F2 then
  begin
    ctl.SetFocus;
    ctl.SelectAll;
  end
  else if Key = VK_ESCAPE then
    Close;

end;

procedure TfrmPesquisa.grdDblClick(Sender: TObject);
begin
  if Assigned(grd.DataSource) then
  begin
    if grd.DataSource.DataSet.RecordCount > 0 then
    begin
      TEditLabel(FPesquisa.CampoCodigo).Text := grd.DataSource.DataSet.Fields[0].AsString;
      if Assigned(FPesquisa.CampoNome) then
        TEdit(FPesquisa.CampoNome).Text := grd.DataSource.DataSet.Fields[1].AsString;
      Close;
    end;
  end;  
end;

procedure TfrmPesquisa.ctlKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = key_ENTER then
    btnLocalizarClick(Sender)
  else if Key = key_DOWN then
    grd.SetFocus;
end;

procedure TfrmPesquisa.grdKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = key_ENTER then
    grdDblClick(Sender);
end;

function TPesquisa.ExecutaPesquisa(blnValida: boolean; strCampos,
  strTabela: string; ctlCodigo, ctlNome: TObject;
  strWhere: string = ''; blnMsg: boolean = true): boolean;
var
  str: string;
  cnn : TConexao;
  ds : TDataSource;
  frmPesq: TfrmPesquisa;
begin
  FCampo := strCampos;
  FTabela := strTabela;
  FCampoCodigo := ctlCodigo;
  FCampoNome := ctlNome;
  FWhere := strWhere;
  cnn := TConexao.Create(GloStrUser,GloStrPassword, GloStrDatabase, GloStrServer, GloBlnEmbedded);
  if blnValida then
  begin
    if Assigned(FCampoNome) then
    begin
      if Trim(TEdit(FCampoNome).Text) <> '' then
      begin
        Result := True;
        Exit;
      end;
    end;

    if Assigned(FCampoCodigo) then
    begin
      if FCampoCodigo is TEditLabel then
      begin
        if Trim(TEditLabel(FCampoCodigo).Text) <> '' then
        begin
          FCampoCodigoIsChar := TEditLabel(FCampoCodigo)._IsChar;
          str := MontaQuery;
          if FCampoCodigoIsChar = True then
            str := QueryFiltro(str,CamposList[0] +'='+ Aspas(TEditLabel(FCampoCodigo).Text))
          else
            str := QueryFiltro(str,CamposList[0] +'='+ TEditLabel(FCampoCodigo).Text);


          cnn.Open;
          if cnn.ExecuteQuery(str,ds) then
          begin
            TEditLabel(FCampoCodigo).Text := ds.DataSet.Fields[0].AsString;
            if Assigned(FCampoNome) then
              TEdit(FCampoNome).Text := ds.DataSet.Fields[1].AsString;
            Result := true;
          end
          else
          begin
            Result := false;
            if blnMsg then MessageDlg( 'Registro inexistente.',mtInformation,[mbOK],0);
          end;
          ds.Free;
        end
        else
          Result := True;
      end
      else
        Result := false;
    end
    else
      Result := false;
  end
  else
  begin
    frmPesq := TfrmPesquisa.Create(Screen);
    frmPesq.Pesquisa := Self;
    frmPesq.ShowModal;
    frmPesq.Free;
    Result := true;
  end;
  cnn.Destroy;
end;

procedure TfrmPesquisa.grpFiltroClick(Sender: TObject);
begin
  ctl.SetFocus;
end;

end.
