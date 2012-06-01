unit BinaryPropEd;

interface

uses DesignEditors, DesignIntf, SysUtils, Classes;

type
  TBinIntegerProperty = class(TIntegerProperty)
  public
    function GetValue : string; override;
    procedure SetValue(const Value : String); override;
  end;

  TMiComponente = class(TComponent)
  private
    FPropBin: Integer;
  published
    property PropriedadeBinaria : integer read FPropBin write FPropBin;
  end;

procedure Register;

implementation

uses TypInfo;

Const
  Bits16 : Array [1..16] of Integer = (32768,16384,8192,4096,2048,1024,512,256,128,64,32,16,8,4,2,1);

function TBinIntegerProperty.GetValue : string;
Var
  Num, i : integer;
begin
  Num:=GetOrdValue;
  Result := '0000000000000000';
  for i := 1 to 16 Do
    if ( Num >= Bits16[i] ) Then
    begin
      Num := Num - Bits16[i];
      Result[i] := '1';
    end;
  if ( Num > 0 ) Then
  begin
    Result := 'B0000000000000000';
    raise EPropertyError.Create('Error converting '+IntToStr(GetOrdValue) + ' to binary');
  end;
  Insert('B',Result,1);
end;

procedure TBinIntegerProperty.SetValue(const Value : String);
Var
  i, Total: integer;
  NumText : string;
begin
  if UpperCase(Value[1])='B' then
  begin
    NumText:=Copy(Trim(Value),2,Length(Trim(Value))-1);
    NumText:=Copy('0000000000000000',1,16-Length(NumText)) + NumText;
    Total:=0;
    for i:=1 to Length(NumText) do
    begin
      if not (NumText[i] in ['0','1']) then
        raise EPropertyError.Create(NumText[i] + ' is not a valid binary digit')
      else if NumText[i]='1' then
        Total:=Total+Bits16[i];
    end;
    SetOrdValue(Total);
  end
  else
    SetOrdValue(StrToInt(Value));
end;

procedure Register;
begin
  RegisterComponents('Componentes',[TMiComponente]);
  RegisterPropertyEditor(TypeInfo(Integer),TMiComponente,'PropriedadeBinaria',TBinIntegerProperty);
end;

end.
