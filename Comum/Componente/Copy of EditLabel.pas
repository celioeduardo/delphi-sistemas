unit EditLabel;

interface
// Teste
uses
  SysUtils, Classes, Controls, ComCtrls, StdCtrls, Mask, ExtCtrls, Messages,
  Types, Graphics, Dialogs,Functions;

const
  ctNotNull = $00AEAEFF;
  ctNull = $00B9FFFF;
  mskData = '99/99/0000;1; ';
  mskCPF = '999\.999\.999\-99;0; ';
  mskCNPJ = '99\.999\.999\/9999\-99;0; ';
  mskCEP = '99999\-999;0; ';
  mskFONE = '\(99\)9999\-9999;0; ';
  mskHORA = '99:99:99;0; ';
  mskDATAHORA = '99/99/0000 99:99:99;1; ';
  ButtonWidth = 17;
  ButtonHeigth = 17;
  key_F2 = 113;
  key_ENTER = 13;
  key_ESCAPE = 27;
  key_BACKSPACE = 8;
  key_DELETE = 46;
type

  TTipo = (Numero,Num_Decimal,Data,Texto,Pesquisa,CPF,CNPJ,Fone,CEP,Hora,Data_Hora,CNPJ_CPF);

  TPesquisaEditLabel = class(TPersistent)
    private
      FControl :TControl;
      FCodigo  :string;
      FNome    :string;
      FCampos  :TStringList;
      FTabelas :TStringList;
      FWhere   :string;
      FEmpresa :string;
      FFilial  :string;
      FOnChange:TNotifyEvent;
    protected
      procedure Change; virtual;
      procedure AssignTo(Dest: TPersistent); override;
    public
      constructor Create(Control: TControl); virtual;
      property OnChange: TNotifyEvent read FOnChange write FOnChange;
    published
      property Codigo: string index 0 read FCodigo write FCodigo;
      property Nome  : string index 1 read FNome write FNome;
      property Campos: TStringList index 2 read FCampos write FCampos;
      property Tabelas  : TStringList index 3 read FTabelas write FTabelas;
      property Where  : string index 4 read FWhere write FWhere;
      property Empresa  : string index 5 read FEmpresa write FEmpresa;
      property Filial  : string index 6 read FFilial write FFilial;
  end;

  TCustomEditLabel = class(TCustomMaskEdit)
  private
    FLabel: TBoundLabel;
    FLabelCaption: string;
    FButton: TButton;
    FLabelPosition: TLabelPosition;
    FLabelSpacing: Integer;
    FNotNull: boolean;
    FTipo: TTipo;
    FAParent: TWinControl;
    FOnClickButton: TNotifyEvent;
    FPesquisa: TPesquisaEditLabel;
    FControle: TList;
    FValidaEdit: Boolean;
    FChave: Boolean;
    FCampo : string;
    FIsChar : Boolean;
    FEdit: TEdit;
    FFormato: Double;
    FListView: TListView;
    procedure SetLabelPosition(const Value: TLabelPosition);
    procedure SetLabelSpacing(const Value: Integer);
    procedure SetAtualizaLabel(newLabel: TBoundLabel);
    procedure SetLabelCaption(LabelCaption: string);
    function GetLabelCaption: string;
    procedure SetEdit(EditObject: TEdit);
    procedure SetListView(ListViewObject: TListView);
    function GetEdit: TEdit;
    function GetListView: TListView;
    procedure SetButtonPosition;
    function  GetTipo: TTipo;
    procedure SetTipo(Tipo: TTipo);
    function  GetAtualizaLabel: TBoundLabel;
    procedure SetaControle;
    function VerCNPJ (snrcgc: string): boolean;
    function VerCPF (snrcpf: string): boolean;
    function MontaFormatoNumerico(dblFormato: Currency): string;
    function VerificaFormatoNumerico: boolean;

  protected
    procedure ClickButton(Sender: TObject);
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key: Char); override;

    function IndexLista(const str: string): integer;

    procedure SetParent(AParent: TWinControl); override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure SetName(const Value: TComponentName); override;
    procedure CMVisiblechanged(var Message: TMessage);
      message CM_VISIBLECHANGED;
    procedure CMEnabledchanged(var Message: TMessage);
      message CM_ENABLEDCHANGED;
    procedure CMBidimodechanged(var Message: TMessage);
      message CM_BIDIMODECHANGED;
    procedure CMEnter(var Message: TCMEnter);
      message CM_ENTER;
    procedure CMExit(var Message: TCMExit);
      message CM_EXIT;
    procedure CMChanged(var Message: TMessage);
      message CM_CHANGED;

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure SetBounds(ALeft: Integer; ATop: Integer; AWidth: Integer; AHeight: Integer); override;
    procedure SetupInternalLabel;
    procedure SetupInternalButton;
    property LabelComponent: TBoundLabel read GetAtualizaLabel write SetAtualizaLabel;
    property LabelPosition: TLabelPosition read FLabelPosition write SetLabelPosition;
    property LabelSpacing: Integer read FLabelSpacing write SetLabelSpacing;
    property _NotNull: boolean read FNotNull write FNotNull default false;
    property _Tipo: TTipo read GetTipo write SetTipo;
    property OnClickButton: TNotifyEvent read FOnClickButton write FOnClickButton;
    property DefPesquisa: TPesquisaEditLabel read FPesquisa write FPesquisa;
    property Controle: TList read FControle write FControle;
    property _Validate: Boolean read FValidaEdit write FValidaEdit;
    property _Campo: string read FCampo write FCampo;
    property _IsChar: Boolean read FIsChar write FIsChar;
    property _Edit: TEdit read GetEdit write SetEdit;
    property _Chave: Boolean read FChave write FChave;
    property _FormatoNumerico: Double read FFormato write FFormato;
    property _LabelCaption: string read GetLabelCaption write SetLabelCaption;
    property _ListView: TListView read GetListView write SetListView;
  end;

  TEditLabel = class(TCustomEditLabel)
  published
    property _Validate default true;
    property _LabelCaption;
    property _Campo;
    property _Edit;
    property _ListView;
    property LabelComponent;
    property _NotNull;
    property _Chave default False;
    property _Tipo default Texto;
    property _IsChar default False;
    property _FormatoNumerico;
    property Anchors;
    property AutoSelect;
    property AutoSize;
    property BevelEdges;
    property BevelInner;
    property BevelKind;
    property BevelOuter;
    property BiDiMode;
    property BorderStyle;
    property CharCase;
    property Color;
    property Constraints;
    property Controle;
    property Ctl3D;
    property DefPesquisa;
    property DragCursor;
    property DragKind;
    property DragMode;
    property EditMask;
    property Enabled;
    property Font;
    property HideSelection;
    property ImeMode;
    property ImeName;
    property LabelPosition default lpLeft;
    property LabelSpacing default 3;
    property MaxLength;
    property OEMConvert;
    property ParentBiDiMode;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PasswordChar;
    property PopupMenu;
    property ReadOnly;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Text;
    property Visible;
    property OnChange;
    property OnClick;
    property OnClickButton;
    property OnContextPopup;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDock;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDock;
    property OnStartDrag;
  end;

procedure Register;

implementation

//uses UComponentTag;

constructor TPesquisaEditLabel.Create(Control: TControl);
begin
  inherited Create;
  FControl := Control;
  FCampos := TStringList.Create;
  FTabelas := TStringList.Create;
end;

procedure TPesquisaEditLabel.AssignTo(Dest: TPersistent);
begin
  if Dest is TPesquisaEditLabel then
  begin
    with TPesquisaEditLabel(Dest) do
    begin
      FCodigo := Self.FCodigo;
      FNome := Self.FNome;
      FCampos := Self.FCampos;
      FTabelas := Self.FTabelas;
      FWhere := Self.FWhere;
      FEmpresa := Self.FEmpresa;
      FFilial := Self.FFilial;
      Change;
    end;
  end
  else inherited AssignTo(Dest);
end;

procedure TPesquisaEditLabel.Change;
begin
  if Assigned(FOnChange) then FOnChange(Self);
end;

constructor TCustomEditLabel.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FLabelPosition := lpLeft;
  FLabelSpacing := 3;
  FNotNull := false;
  FChave := false;
  FValidaEdit := true;
  FTipo := Texto;
  SetupInternalLabel;
  FPesquisa := TPesquisaEditLabel.Create(Self);
  FControle := TList.Create;
end;

destructor TCustomEditLabel.Destroy;
begin
  inherited Destroy;
end;

procedure TCustomEditLabel.ClickButton(Sender: TObject);
begin
  if Assigned(FOnClickButton) then
    FOnClickButton(Self);
  SetFocus;
end;

procedure TCustomEditLabel.KeyPress(var Key: Char);
begin
inherited;
  case FTipo of
    Numero,Data:
      begin
        if Not (Key in ['0'..'9',#08]) then
          Key := #0;
      end;

    Num_Decimal:
      begin
        if Not (Key in ['0'..'9',#08,'.',',']) then
          Key := #0
        else
        begin
          if (key in [',','.']) then
          begin
            if (Pos(DecimalSeparator,Text) = 0) then
              Key := DecimalSeparator
            else
              Key := #0;
          end;
        end;
      end;
  end;
end;

procedure TCustomEditLabel.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited KeyDown(key,Shift);
  if (key = key_F2) and (FTipo = Pesquisa) then
    if Assigned(FOnClickButton) then
      FOnClickButton(Self);
  if (key = Key_ENTER) and (not (FTipo in ([Texto,Numero,Data]))) then
    Text := Trim(StringReplace(Text,' ','0',[rfReplaceAll]));
  if (key = Key_ENTER) and (FTipo = Data) then
  begin
    EditMask := '';
    EditMask := mskData;
  end;

end;

procedure TCustomEditLabel.SetaControle;
begin
  if Assigned(FButton) then
    FButton.Destroy;
  case FTipo of
    Num_Decimal, Numero, Texto, CNPJ_CPF: EditMask := '';
    Data: EditMask := mskData;
    Pesquisa:
      begin
        EditMask := '';
        Text := '';
        SetupInternalButton;
      end;
    CPF: EditMask := mskCPF;
    CNPJ: EditMask := mskCNPJ;
    Fone: EditMask := mskFONE;
    Hora: EditMask := mskHORA;
    Data_Hora: EditMask := mskDATAHORA;
    CEP : EditMask := mskCEP; 
  end;
end;

function TCustomEditLabel.GetTipo: TTipo;
begin
  Result := FTipo;
end;

procedure TCustomEditLabel.SetTipo(Tipo: TTipo);
begin
  FTipo := Tipo;
  SetaControle;
end;

function TCustomEditLabel.GetAtualizaLabel;
begin
  Result := FLabel;
  SetLabelPosition(FLabelPosition);
end;

procedure TCustomEditLabel.SetAtualizaLabel(newLabel: TBoundLabel);
begin
  FLabel := newLabel;
  FLabelCaption := FLabel.Caption;
  SetLabelPosition(FLabelPosition);
end;

procedure TCustomEditLabel.CMBidimodechanged(var Message: TMessage);
begin
  inherited;
  FLabel.BiDiMode := BiDiMode;
end;

procedure TCustomEditLabel.CMEnter(var Message: TCMEnter);

var s: string;

begin
  if FNotNull then
    Color := ctNotNull
  else
    Color := ctNull;
  FLabel.Font.Style := [fsBold];
  SetLabelPosition(FLabelPosition);
  if Text <> '' then
  begin
    Case FTipo of
      Num_Decimal:
        begin
          S := Replace(Text,ThousandSeparator,'');
          Text := Trim(S);
        end;
    end;
  end;
  Repaint;
  inherited;
end;

procedure TCustomEditLabel.CMChanged(var Message: TMessage);
begin
  if Assigned(FEdit) then
    FEdit.Text := '';
  if (FTipo = CNPJ_CPF) and (Trim(text) = '') then
    EditMask := '';
  inherited;
end;

function TCustomEditLabel.MontaFormatoNumerico(dblFormato: Currency): string;

var i          : integer;
    PartInteiro: integer;
    PartDecimal: integer;
    str : string;
begin
  PartInteiro := Trunc(dblFormato);
  PartDecimal := Trunc((dblFormato - PartInteiro) * 10);
  str := '###,###,###,##0';

  if PartDecimal > 0 then
    str := str + '.';
  for i := 1 to PartDecimal do
    str := str + '0';

  result := str;
end;

procedure TCustomEditLabel.CMExit(var Message: TCMExit);
var
  dtData   : TDateTime;
  blnValida: boolean;
  dblNumero: Double;
  strformat: string;
  Item: TListItem;
  i : integer; 
begin
  Color := clWindow;
  FLabel.Font.Style := [];
  SetLabelPosition(FLabelPosition);
  Repaint;

  if FTipo = CNPJ_CPF then
  begin
    if (Length(Trim(Text)) <= 11) and (Trim(Text) <> '') then
    begin
      EditMask := mskCPF;
      if FValidaEdit then
      begin
        blnValida := VerCPF(text);
        if not(blnValida) then
        begin
          MessageDlg('C.P.F. inválido!',mtWarning,[mbOK],0);
          SetFocus;
        end;
      end;
    end
    else if (Trim(Text) <> '') then
    begin
      EditMask := mskCNPJ;
      if FValidaEdit then
      begin
        blnValida := VerCNPJ(text);
        if not(blnValida) then
        begin
          MessageDlg('C.N.P.J. inválido!',mtWarning,[mbOK],0);
          SetFocus;
        end;
      end;
    end;
  end;

  if not FValidaEdit then
  begin
    inherited;
    exit;
  end;

  if trim(Text) = '' then
  begin
    inherited;
    exit;
  end;

{  if FTipo in ([CPF,CNPJ]) then
    Text := Trim(StringReplace(Text,' ','0',[rfReplaceAll]));}

  if Trim(StringReplace(Text,'/','',[rfReplaceAll])) = '' then exit;

  case FTipo of

    Numero,Num_Decimal:
      begin
        try
          dblNumero := StrToFloat(text);
          if FTipo = Num_Decimal then
          begin
            strFormat:= MontaFormatoNumerico(FFormato);
            Text := FormatFloat(strFormat,dblNumero);
            if not (VerificaFormatoNumerico) then
            begin
              MessageDlg('Formato Inválido!. Esperado número no formato: ' + FloatToStr(FFormato),mtWarning,[mbOK],0);
              SetFocus;
            end;
          end
          else
            text := FloatToStr(dblNumero);

        except
          on ex: Exception do
          begin
            MessageDlg('Número Inválido!',mtWarning,[mbOK],0);
            SetFocus;
          end;
        end;
      end;

    Data :
      begin
        try
          dtData := StrToDate(Text);
          Text := FormatDateTime('dd/mm/yyyy',dtData);
        except
          on ex: Exception do
          begin
            MessageDlg('Data inválida!',mtWarning,[mbOK],0);
            SetFocus;
          end;
        end;
      end;

    CNPJ :
      begin
        blnValida := VerCNPJ(text);
        if not(blnValida) then
        begin
          MessageDlg('C.N.P.J. inválido!',mtWarning,[mbOK],0);
          SetFocus;
        end;
      end;

    CPF :
      begin
        blnValida := VerCPF(text);
        if not(blnValida) then
        begin
          MessageDlg('C.P.F. inválido!',mtWarning,[mbOK],0);
          SetFocus;
        end;
      end;
  end;
  inherited;

  if FTipo = Pesquisa then
  begin
    if Assigned(FListView) and Assigned(FEdit) then
      if Trim(FEdit.Text) <> '' then
      begin
        i := IndexLista(FEdit.text);
        if i < 0 then
        begin
          Item := FListView.Items.Add;
          Item.Caption := Text;
          Item.SubItems.Add(FEdit.Text);
          Text := EmptyStr;
          SetFocus;
        end
        else
        begin
          MessageDlg('Item já existe na Lista',mtWarning,[mbOK],0);
          SetFocus;
        end;
      end;
  end;

end;

procedure TCustomEditLabel.CMEnabledchanged(var Message: TMessage);
begin
  inherited;
  FLabel.Enabled := Enabled;
  if FTipo = Pesquisa then
    FButton.Enabled := Enabled;
end;

procedure TCustomEditLabel.CMVisiblechanged(var Message: TMessage);
begin
  inherited;
  FLabel.Visible := Visible;
  if FTipo = Pesquisa then
    FButton.Visible := Visible;
end;

procedure TCustomEditLabel.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (AComponent = FLabel) and (Operation = opRemove) then
    FLabel := nil;
  if (AComponent = FButton) and (Operation = opRemove) then
    FButton := nil;
end;

procedure TCustomEditLabel.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
begin
  inherited SetBounds(ALeft, ATop, AWidth, AHeight);
  SetLabelPosition(FLabelPosition);
  SetButtonPosition;
end;

procedure TCustomEditLabel.SetLabelPosition(const Value: TLabelPosition);
var
  P: TPoint;
begin
  if not(FLabel = nil) then
  begin
    FLabelPosition := Value;
    case Value of
      lpAbove: P := Point(Left, Top - FLabel.Height - FLabelSpacing);
      lpBelow: P := Point(Left, Top + Height + FLabelSpacing);
      lpLeft : P := Point(Left - FLabel.Width - FLabelSpacing,
                      Top + ((Height - FLabel.Height) div 2));
      lpRight: P := Point(Left + Width + FLabelSpacing,
                      Top + ((Height - FLabel.Height) div 2));
    end;
    FLabel.SetBounds(P.x, P.y, FLabel.Width, FLabel.Height);
  end;
end;

procedure TCustomEditLabel.SetLabelSpacing(const Value: Integer);
begin
  FLabelSpacing := Value;
  SetLabelPosition(FLabelPosition);
end;

procedure TCustomEditLabel.SetName(const Value: TComponentName);
begin
  if (csDesigning in ComponentState) and
     ((FLabel.GetTextLen = 0) or(CompareText(FLabel.Caption, Name) = 0)) then
    FLabel.Caption := Value;
  inherited SetName(Value);
  if csDesigning in ComponentState then
    Text := '';
end;

procedure TCustomEditLabel.SetParent(AParent: TWinControl);
begin
  inherited SetParent(AParent);

  FAParent := AParent;

  if not (FLabel = nil) then
  begin
    FLabel.Parent := FAParent;
    FLabel.Visible := True;
  end;
end;

procedure TCustomEditLabel.SetButtonPosition;
begin
  if FTipo = Pesquisa Then
  begin
    if FButton = nil then exit;
    FButton.SetBounds(Left+Width-2-ButtonWidth, Top + 2, ButtonWidth, ButtonHeigth);
  end;
end;

procedure TCustomEditLabel.SetupInternalButton;
begin
  if Assigned(FButton) then
    SetButtonPosition
  else
  begin
    FButton := TButton.Create(Self);
    FButton.FreeNotification(Self);
    FButton.Caption := '...';
    FButton.Font.Name := 'Garamond';
    FButton.TabStop := False;
    FButton.Font.Style := [fsBold];
    FButton.Parent := FAParent;
    FButton.Cursor := crHandPoint;
    { Associando o Evento OnClick a procedure ClickButton }
    FButton.OnClick := ClickButton;
    SetButtonPosition;
  end;
end;

procedure TCustomEditLabel.SetupInternalLabel;
begin
  if not(Assigned(FLabel)) then
  begin
    FLabel := TBoundLabel.Create(Self);
    FLabel.FreeNotification(Self);
  end;
end;

// Verifica CPF //
function TCustomEditLabel.VerCPF (snrcpf: string): boolean;
var
 CPF_Calculo : STRING;
 CPF_Soma    : INTEGER;
 Aux         : SHORTINT;
 CPF_Digito  : INTEGER;
begin
  try
    CPF_Calculo := copy(snrCpf, 1, 9);
    CPF_Soma := 0;
    for Aux:= 1 to 9 do
      CPF_Soma := CPF_Soma + strtoint(copy(CPF_Calculo, Aux, 1)) * (11 - Aux);
    CPF_Digito := 11 - CPF_Soma mod 11;
    if CPF_Digito in [10,11] then
      CPF_Calculo:= CPF_Calculo + '0'
    else
      CPF_Calculo := CPF_Calculo + inttoStr(CPF_Digito);
    CPF_Soma:= 0;
    for Aux:= 1 to 10 DO
      CPF_Soma := CPF_Soma + strtoint(copy(CPF_Calculo, Aux, 1)) * (12 - Aux);
    CPF_Digito:= 11 - CPF_Soma mod 11;
    if CPF_Digito in [10,11] then
      CPF_Calculo:= CPF_Calculo + '0'
    else
      CPF_Calculo := CPF_Calculo + inttoStr(CPF_Digito);
    if snrcpf <> CPF_Calculo then
      result := false
    else
     result := true;
  except
    result := false;
  end;
end;

// Verifica CGC //
function TCustomEditLabel.VerCNPJ (snrcgc: string): boolean;
var
  CGC_Calculo : STRING;
  CGC_Soma    : INTEGER;
  Aux     : SHORTINT;
  CGC_Digito : INTEGER;
begin
  try
    CGC_Calculo := Copy(snrcgc,1,12);
    CGC_Soma := 0;
    for Aux:= 1 to 4 do
      CGC_Soma:= CGC_Soma + strtoint(copy(CGC_Calculo, Aux, 1)) * (6 - Aux);
    for Aux:= 1 to 8 do
      CGC_Soma:= CGC_Soma + strtoint(copy(CGC_Calculo, Aux + 4, 1)) * (10 - Aux);
    CGC_Digito:= 11 - CGC_Soma mod 11;
    if CGC_Digito in [10,11] then
      CGC_Calculo:= CGC_Calculo + '0'
    else
      CGC_Calculo := CGC_Calculo + inttoStr(CGC_Digito);
    CGC_Soma:= 0;
    for Aux:= 1 to 5 do
      CGC_Soma:= CGC_Soma + strtoint(copy(CGC_Calculo, Aux, 1)) * (7 - Aux);
    for Aux:= 1 to 8 do
      CGC_Soma:= CGC_Soma + strtoint(copy(CGC_Calculo, Aux + 5, 1)) * (10 - Aux);
    CGC_Digito:= 11 - CGC_Soma mod 11;
    if CGC_Digito in [10,11] then
      CGC_Calculo:= CGC_Calculo + '0'
    else
      CGC_Calculo := CGC_Calculo + inttoStr(CGC_Digito);
    if snrcgc <> CGC_Calculo then
      result := false
    else
      result := true;
  except
    result := false;
  end;
end;


procedure Register;
begin
  RegisterComponents('Componentes', [TEditLabel]);
end;


function TCustomEditLabel.VerificaFormatoNumerico: boolean;

var intInteiro: integer;
    bln: boolean;
begin
  intInteiro := Trunc(FFormato);

  if Length(Replace(text,',','')) <= intInteiro then
    bln := true
  else
    bln := false;

  result := bln;
end;

function TCustomEditLabel.GetLabelCaption: string;
begin
  if Assigned(FLabel) then
    result := FLabel.Caption;
end;

procedure TCustomEditLabel.SetLabelCaption(LabelCaption: string);
begin
  if Assigned(FLabel) then
    FLabel.Caption := LabelCaption;
  FLabelCaption := LabelCaption;
  SetAtualizaLabel(FLabel);
end;

procedure TCustomEditLabel.SetEdit(EditObject: TEdit);
begin
  if Assigned(EditObject) then
  begin
    FEdit := EditObject;
    FEdit.Enabled := false;
    FEdit.Text := '';
  end
  else
    FEdit := nil;
end;

procedure TCustomEditLabel.SetListView(ListViewObject: TListView);
var
  coluna: TListColumn;
begin
  if Assigned(ListViewObject) then
  begin
    FListView := ListViewObject;
    FListView.Columns.Clear;
    FListView.Items.Clear;
    FListView.RowSelect := true;
    FListView.ViewStyle := vsReport;
    coluna := FListView.Columns.Add;
    coluna.Caption := 'Código';
    coluna.Alignment := taRightJustify;
    coluna.Width := Trunc(FListView.Width * (1/3));
    coluna := FListView.Columns.Add;
    coluna.Caption := 'Descrição';
    coluna.Width := FListView.Width - Trunc(FListView.Width * (1/3)) - 5;
  end
  else
    FListView := nil;
end;

function TCustomEditLabel.GetEdit: TEdit;
begin
  if Assigned(FEdit) then
    Result := FEdit
  else
    Result := nil;

end;

function TCustomEditLabel.GetListView: TListView;
begin
  if Assigned(FListView) then
  begin
//    TListViewTag(FListView).EditLabel := TEditLabel(Self);
    Result := FListView;
  end
  else
  begin
    //TListViewTag(FListView).EditLabel := nil;
    Result := nil;
  end;
end;

function TCustomEditLabel.IndexLista(const str: string): integer;

var i,Aux: integer;

begin
  Aux := -1;
  if Assigned(FListView) then
  begin
    for i := 0 to FListView.Items.Count - 1 do
    begin
      if str = FListView.Items[i].SubItems[0] then
      begin
        Aux := i;
        break;
      end;
    end;
  end;
  Result := Aux;
end;

end.
