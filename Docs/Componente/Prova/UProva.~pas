unit UProva;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DesignIntf,
  DesignEditors,
  DB, DBTables,
  PasswordForm;

type

  TArqProperty = class(TStringProperty)
  public
    function GetAttributes : TPropertyAttributes; override;
    procedure Edit; override;
  end;

  TAliasProperty = class (TStringProperty)
  public
    function GetAttributes : TPropertyAttributes; override;
    procedure GetValues(Proc : TGetStrProc); override;
  end;

  TPasswordProperty = class(TPropertyEditor)
  public
    function GetAttributes : TPropertyAttributes; override;
    function GetValue :string; override;
    procedure Edit; override;
  end;

  TDateTimeProperty = class(TFloatProperty)
  public
    function GetValue :string; override;
    procedure SetValue(const Value: string); override;
  end;

  TProva = class(TComponent)
  private
    FArquivo : string;
    FAlias : string;
    FData : TDateTime;
    FPassword : string;
    //FComponent : TComponent;
  protected
  public
    constructor Create(AOwner : TComponent); override;
  published
    property Arquivo : string read FArquivo write FArquivo;
    property Alias : string read FAlias write FAlias;
    property Data : TDateTime read FData write FData;
    property Password : string read FPassword write FPassword;
    //property Component : TComponent read FComponent write FComponent;
  end;

procedure Register;

implementation

function TArqProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paDialog];
end;

procedure TArqProperty.Edit;
var
  OpenDialog : TOpenDialog;   {TOpenDialog está na unidade Dialogs, que esta na clausula uses}
begin
  OpenDialog:=TOpenDialog.Create(Application);   {Criamos a caixa de diálogo}
  try
    OpenDialog.Filter:='All files|*.*';    {Colocamos suas propriedades iniciais}
    if OpenDialog.Execute then   {Se o usuário clica OK...}
      SetStrValue(OpenDialog.FileName);   {Colocamos o novo valor na propriedade}
  finally
    OpenDialog.Free;   {Liberamos a caixa de diálogo}
  end;
end;

function TAliasProperty.GetAttributes : TPropertyAttributes;
begin
    Result:=[paValueList, paSortList];
end;

procedure TAliasProperty.GetValues(Proc : TGetStrProc);
var
  AliasList :TStringList; {lista com os Alias existentes}
  i :integer;
begin
  AliasList := TStringList.Create;
  try
    Session.GetAliasNames(AliasList);
    for i := 0 to AliasList.Count-1 do
      Proc(AliasList[i]);
{    for i := 0 to Screen.ActiveForm.ControlCount -1 do
      Proc(String(Screen.ActiveForm.Controls[i].Name));
 }
  finally
    AliasList.Free;
  end;
end;

function TPasswordProperty.GetAttributes : TPropertyAttributes;
begin
  Result:=[paDialog];
end;

function TPasswordProperty.GetValue : string;
begin
  Result:=Format('(%s)',[GetPropType^.Name]);
end;

procedure TPasswordProperty.Edit;
begin
  frmPassword := TfrmPassword.Create(Application);
  try
{    frmPassword.Caption:=GetComponent(0).GetOwner.Name+'.'+
      GetComponent(0).Name+'.'+GetName+' - '+
      frmPassword.Caption;}
    frmPassword.PW1.Text:=GetStrValue;
    frmPassword.PW2.Text:=frmPassword.PW1.Text;
    if frmPassword.ShowModal = mrOK then
      SetStrValue(frmPassword.PW1.Text)
  finally
    frmPassword.Free;
  end;
end;

procedure TDateTimeProperty.SetValue(const Value : string);
begin
  SetFloatValue(StrToDate(Value));
end;

function TDateTimeProperty.GetValue: string;
begin
  Result := DateToStr(GetFloatValue);
end;

constructor TProva.Create(AOwner : TComponent);
begin
  inherited Create(AOwner);
  FDAta:=Now;
end;

procedure Register;
begin
  RegisterComponents('Componentes',[TProva]);
  RegisterPropertyEditor(TypeInfo(string),TProva,'Arquivo',TArqProperty);
  RegisterPropertyEditor(TypeInfo(String),TProva,'Alias',TAliasProperty);
  RegisterPropertyEditor(TypeInfo(String),TProva,'Password',TPasswordProperty);
  RegisterPropertyEditor(TypeInfo(TDateTime),TProva,'Data',TDateTimeProperty);
//  RegisterPropertyEditor(TypeInfo(TComponent),TProva,'Component',TComponentProperty );
end;

end.
