unit UComponentTag;

interface

uses
  SysUtils, Classes, Controls, StdCtrls, ComCtrls, messages, EditLabel, ExtCtrls,
  Types, Graphics,DB,DBTables;

const
  ctNotNull = $00AEAEFF;
  ctNull = $00B9FFFF;
  key_F2 = 113;
  key_ENTER = 13;
  key_ESCAPE = 27;
  key_BACKSPACE = 8;
type

  TTipo = (tpChar,tpNumero);

  TMemoTag = class(TMemo)
  private
    FCampo  : String;
    FNotNull: boolean;
    FLabel : TBoundLabel;
    FLabelPosition : TLabelPosition;
    FLabelSpacing : Integer;
    FAParent : TWinControl;

    function  GetAtualizaLabel: TBoundLabel;
    procedure SetLabelPosition(const Value: TLabelPosition);
    procedure SetLabelSpacing(const Value: Integer);
    procedure SetAtualizaLabel(newLabel: TBoundLabel);

  protected
    procedure SetName(const Value: TComponentName); override;
    procedure SetParent(AParent: TWinControl); override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure CMEnter(var Message: TCMEnter);
      message CM_ENTER;
    procedure CMExit(var Message: TCMExit);
      message CM_EXIT;
    procedure CMEnabledchanged(var Message: TMessage);
      message CM_ENABLEDCHANGED;
    procedure CMVisiblechanged(var Message: TMessage);
      message CM_VISIBLECHANGED;
    procedure CMBidimodechanged(var Message: TMessage);

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure SetBounds(ALeft: Integer; ATop: Integer; AWidth: Integer; AHeight: Integer); override;
    procedure SetupInternalLabel;
    property LabelSpacing: Integer read FLabelSpacing write SetLabelSpacing default 3;

  published
    property LabelPosition: TLabelPosition read FLabelPosition write SetLabelPosition default lpAbove;
    property _Campo : String read FCampo write FCampo;
    property _NotNull: boolean read FNotNull write FNotNull;
    property _Label: TBoundLabel read GetAtualizaLabel write SetAtualizaLabel;
  end;

  TEditTag = class(TEdit)

  private
    FCampo  : String;
    FTipo   : TTipo;
    FValor  : String;
    FDefault: Boolean;

  published
    property _Campo : String read FCampo write FCampo;
    property _Tipo : TTipo read FTipo write FTipo;
    property _Valor : String read FValor write FValor;
    property _Default : boolean read FDefault write FDefault;
  end;

  TRadioButtonTag = class(TRadioButton)
  private
    FCampo  : String;
    FTipo   : TTipo;
    FValor  : String;
    FDefault: Boolean;
  protected
    procedure SetChecked(Value: Boolean); override;


  published
    property _Campo : String read FCampo write FCampo;
    property _Tipo : TTipo read FTipo write FTipo;
    property _Valor : String read FValor write FValor;
    property _Default : boolean read FDefault write FDefault;
  end;


  TComboBoxTag = class(TComboBox)
  private
    FCampo : String;
    FTipo : TTipo;
    FEditLabel : TEditLabel;
    FChave : Boolean;
    FLabel : TBoundLabel;
    FLabelPosition : TLabelPosition;
    FLabelSpacing : Integer;
    FNotNull : boolean;
    FAParent : TWinControl;

    function  GetAtualizaLabel: TBoundLabel;
    procedure SetLabelPosition(const Value: TLabelPosition);
    procedure SetLabelSpacing(const Value: Integer);
    procedure SetAtualizaLabel(newLabel: TBoundLabel);
    procedure SetEditLabel(AEditLabel: TEditLabel);

  protected

    procedure SetParent(AParent: TWinControl); override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure SetName(const Value: TComponentName); override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure CMChanged(var Message: TMessage); message CM_CHANGED;
    procedure CMBidimodechanged(var Message: TMessage);
      message CM_BIDIMODECHANGED;
    procedure CMEnter(var Message: TCMEnter);
      message CM_ENTER;
    procedure CMExit(var Message: TCMExit);
      message CM_EXIT;
    procedure CMEnabledchanged(var Message: TMessage);
      message CM_ENABLEDCHANGED;
    procedure CMVisiblechanged(var Message: TMessage);
      message CM_VISIBLECHANGED;

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function BoundText(index: integer = 0): string;
    function BoundIndex(str: string): integer;
    procedure SetBounds(ALeft: Integer; ATop: Integer; AWidth: Integer; AHeight: Integer); override;
    procedure SetupInternalLabel;
    property LabelPosition: TLabelPosition read FLabelPosition write SetLabelPosition default lpLeft;


  published
    property _Campo : String read FCampo write FCampo;
    property _Tipo : TTipo read FTipo write FTipo;
    property _EditLabel: TEditLabel read FEditLabel write SetEditLabel;
    property _Chave : boolean read FChave write FChave default False;
    property _NotNull: boolean read FNotNull write FNotNull default false;
    property _Label: TBoundLabel read GetAtualizaLabel write SetAtualizaLabel;
    property LabelSpacing: Integer read FLabelSpacing write SetLabelSpacing default 3;
  end;

  TCheckBoxTag = class(TCheckBox)
  private
    FCampo : String;
    FTipo  : TTipo;
    FValor : String;
  protected
    procedure SetChecked(Value: Boolean); override;
    procedure CMChanged(var Message: TMessage); message CM_CHANGED;
  published
    property _Campo : String read FCampo write FCampo;
    property _Tipo : TTipo read FTipo write FTipo;
    property _Valor : String read FValor write FValor;

  end;

  //****************************************************************************//
  //***** TListViewTag               *******************************************//
  //****************************************************************************//

  TListViewTag = class(TListView)
  private
  protected
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure DeletaItemSelecionado;
  published
    function MontaWhere(Campo: string; IsChar: boolean = false; WHEREouAND: boolean = false): string;
    {property ViewStyle default vsReport;
    property HideSelection default false;
    property RowSelect default true;
    property ReadOnly default true; }
  end;

procedure Register;

implementation

procedure TComboBoxTag.SetLabelPosition(const Value: TLabelPosition);
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

procedure TComboBoxTag.SetName(const Value: TComponentName);
begin
  if (csDesigning in ComponentState) and
     ((FLabel.GetTextLen = 0) or(CompareText(FLabel.Caption, Name) = 0)) then
    FLabel.Caption := Value;
  inherited SetName(Value);
  if csDesigning in ComponentState then
    Text := '';
end;

procedure TComboBoxTag.SetupInternalLabel;
begin
  if not(Assigned(FLabel)) then
  begin
    FLabel := TBoundLabel.Create(Self);
    FLabel.FreeNotification(Self);
  end;
end;

procedure TComboBoxTag.SetParent(AParent: TWinControl);
begin
  inherited SetParent(AParent);

  FAParent := AParent;

  if not (FLabel = nil) then
  begin
    FLabel.Parent := FAParent;
    FLabel.Visible := True;
  end;
end;

procedure TComboBoxTag.SetLabelSpacing(const Value: Integer);
begin
  FLabelSpacing := Value;
  SetLabelPosition(FLabelPosition);
end;

procedure TComboBoxTag.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
begin
  inherited SetBounds(ALeft, ATop, AWidth, AHeight);
  SetLabelPosition(FLabelPosition);
end;

procedure TComboBoxTag.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (AComponent = FLabel) and (Operation = opRemove) then
    FLabel := nil;
end;

procedure TComboBoxTag.CMEnabledchanged(var Message: TMessage);
begin
  inherited;
  FLabel.Enabled := Enabled;
end;

procedure TComboBoxTag.CMVisiblechanged(var Message: TMessage);
begin
  inherited;
  FLabel.Visible := Visible;
end;

procedure TComboBoxTag.CMEnter(var Message: TCMEnter);
begin
  if FNotNull then
    Color := ctNotNull
  else
    Color := ctNull;
  FLabel.Font.Style := [fsBold];
  SetLabelPosition(FLabelPosition);
  Repaint;
  inherited;
end;

procedure TComboBoxTag.CMExit(var Message: TCMExit);

begin
  Color := clWindow;
  FLabel.Font.Style := [];
  SetLabelPosition(FLabelPosition);
  Repaint;
  inherited;
end;

function TComboBoxTag.GetAtualizaLabel;
begin
  Result := FLabel;
  SetLabelPosition(FLabelPosition);
end;

procedure TComboBoxTag.CMChanged(var Message: TMessage);
begin
  if Assigned(FEditLabel) then
  begin
    FEditLabel.Text := '';
    FEditLabel.Enabled := Trim(Text) <> '';
  end;
  inherited;
end;

procedure TComboBoxTag.SetAtualizaLabel(newLabel: TBoundLabel);
begin
  FLabel := newLabel;
  SetLabelPosition(FLabelPosition);
end;

procedure TComboBoxTag.CMBidimodechanged(var Message: TMessage);
begin
  inherited;
  FLabel.BiDiMode := BiDiMode;
end;


procedure TComboBoxTag.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited KeyDown(key,Shift);
  if (key = key_BACKSPACE) or (key = key_DELETE) then
  begin
    ItemIndex := -1;
    Change;
    if Assigned(_EditLabel) then
      if Assigned(_EditLabel._ListView) then
        _EditLabel._ListView.Items.Clear;
  end;
end;

function TComboBoxTag.BoundText(index: integer = 0): string;

begin
  if Self.ItemIndex >= 0 then
  begin
    if index <= TStringList(Self.Items.Objects[ItemIndex]).count - 1 then
      result := TStringList(Self.Items.Objects[ItemIndex])[index];
  end
  else
    result := EmptyStr;
end;

function TComboBoxTag.BoundIndex(str: string): integer;

var i,j: integer;
    Aux: integer;

begin
  Aux := -1;
  for i := 0 to ItemCount - 1 do
  begin
    for j := 0 to TStringList(Items.Objects[i]).Count - 1 do
    begin
      if str = TStringList(items.Objects[i])[j] then
        Aux := i;
    end;
  end;
  result := Aux;
end;

procedure TComboBoxTag.SetEditLabel(AEditLabel: TEditLabel);

begin
  FEditLabel := AEditLabel;
  FEditLabel.Enabled := false;
end;

constructor TComboBoxTag.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FLabelPosition := lpLeft;
  FLabelSpacing := 3;
  FNotNull := false;
  FChave := false;
  SetupInternalLabel;
end;

destructor TComboboxTag.Destroy;

begin
  inherited Destroy;
end;

{ TListViewTag }

constructor TListViewTag.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

procedure TListViewTag.DeletaItemSelecionado;
begin
  if Items.IndexOf(Selected) > -1 then
    Items.Delete(Items.IndexOf(Selected));
end;

destructor TListViewTag.Destroy;
begin
  inherited Destroy;
end;

procedure TListViewTag.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited KeyDown(key,Shift);
  if key = key_DELETE then
  begin
    if Items.IndexOf(Selected) > -1 then
      Items.Delete(Items.IndexOf(Selected));
     key := key_DELETE; 
  end;
end;

function TListViewTag.MontaWhere(Campo: string; IsChar: boolean = false; WHEREouAND: boolean = false): string;
var
  i: integer;
  str: string;
begin
  if (Items.Count > 0) then
  begin
    if WHEREouAND then
      str := ' Where ('
    else
      str := ' And (';

    for i := 0 to Items.Count-1 do
    begin
      if IsChar then
        str := str + Campo+' = '+''''+Items.Item[i].Caption+''''
      else
        str := str + Campo+' = '+Items.Item[i].Caption;
      if i = Items.Count -1 then
        str := str + ')'
      else
        str := str + ' or ';
    end;
  end;
  Result := str;

end;

procedure Register;
begin
  RegisterComponents('Componentes', [TEditTag]);
  RegisterComponents('Componentes', [TMemoTag]);
  RegisterComponents('Componentes', [TRadioButtonTag]);
  RegisterComponents('Componentes', [TComboBoxTag]);
  RegisterComponents('Componentes', [TCheckBoxTag]);
  RegisterComponents('Componentes', [TListViewTag]);
end;

{ TRadioButtonTag }

procedure TRadioButtonTag.SetChecked(Value: Boolean);
begin
  inherited;
  if Value then
    Font.Style := [fsBold]
  else
    Font.Style := [];
  Click;  
end;

{ TCheckBoxTag }

procedure TCheckBoxTag.CMChanged(var Message: TMessage);
begin
  SetChecked(Self.Checked);
end;

procedure TCheckBoxTag.SetChecked(Value: Boolean);
begin
  inherited;
  if Value then State := cbChecked else State := cbUnchecked;
  if value then
    Font.Style := [fsBold]
  else
    Font.Style := [];
end;

{ TMemoTag }

procedure TMemoTag.CMEnabledchanged(var Message: TMessage);
begin
  inherited;
  FLabel.Enabled := Enabled;
end;

procedure TMemoTag.CMEnter(var Message: TCMEnter);
begin
  if FNotNull then
    Color := ctNotNull
  else
    Color := ctNull;
  FLabel.Font.Style := [fsBold];
  SetLabelPosition(FLabelPosition);
  Repaint;
  inherited;
end;

procedure TMemoTag.CMExit(var Message: TCMExit);
begin
  Color := clWindow;
  FLabel.Font.Style := [];
  SetLabelPosition(FLabelPosition);
  Repaint;
  inherited;
end;

procedure TMemoTag.CMVisiblechanged(var Message: TMessage);
begin
  inherited;
  FLabel.Visible := Visible;
end;

constructor TMemoTag.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FLabelPosition := lpAbove;
  FLabelSpacing := 3;
  FNotNull := false;
  
  SetupInternalLabel;
end;

destructor TMemoTag.Destroy;
begin
  inherited Destroy;
end;

function TMemoTag.GetAtualizaLabel: TBoundLabel;
begin
  Result := FLabel;
  SetLabelPosition(FLabelPosition);
end;

procedure TMemoTag.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (AComponent = FLabel) and (Operation = opRemove) then
    FLabel := nil;
end;

procedure TMemoTag.SetAtualizaLabel(newLabel: TBoundLabel);
begin
  FLabel := newLabel;
  SetLabelPosition(FLabelPosition);
end;

procedure TMemoTag.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
begin
  inherited SetBounds(ALeft, ATop, AWidth, AHeight);
  SetLabelPosition(FLabelPosition);
end;

procedure TMemoTag.SetLabelPosition(const Value: TLabelPosition);
var
  P: TPoint;
begin
  if not(FLabel = nil) then
  begin
    FLabelPosition := Value;
    case Value of
      lpAbove: P := Point(Left, Top - FLabel.Height - FLabelSpacing);
      lpBelow: P := Point(Left, Top + Height + FLabelSpacing);
{      lpLeft : P := Point(Left - FLabel.Width - FLabelSpacing,
                      Top + ((Height - FLabel.Height) div 2));}
      lpLeft : P := Point(Left - FLabel.Width - FLabelSpacing, Top);
      lpRight: P := Point(Left + Width + FLabelSpacing,
                      Top + ((Height - FLabel.Height) div 2));
    end;
    FLabel.SetBounds(P.x, P.y, FLabel.Width, FLabel.Height);
  end;
end;

procedure TMemoTag.SetLabelSpacing(const Value: Integer);
begin
  FLabelSpacing := Value;
  SetLabelPosition(FLabelPosition);
end;

procedure TMemoTag.SetName(const Value: TComponentName);
begin
  if (csDesigning in ComponentState) and
     ((FLabel.GetTextLen = 0) or(CompareText(FLabel.Caption, Name) = 0)) then
    FLabel.Caption := Value;
  inherited SetName(Value);
  if csDesigning in ComponentState then
    Text := '';
end;

procedure TMemoTag.SetParent(AParent: TWinControl);
begin
  inherited SetParent(AParent);
  FAParent := AParent;
  if not (FLabel = nil) then
  begin
    FLabel.Parent := FAParent;
    FLabel.Visible := True;
  end;
end;

procedure TMemoTag.SetupInternalLabel;
begin
  if not(Assigned(FLabel)) then
  begin
    FLabel := TBoundLabel.Create(Self);
    FLabel.FreeNotification(Self);
  end;
end;

procedure TMemoTag.CMBidimodechanged(var Message: TMessage);
begin
  inherited;
  FLabel.BiDiMode := BiDiMode;
end;


end.
