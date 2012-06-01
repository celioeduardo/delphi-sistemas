unit UGlobal;

interface

uses SysUtils, Windows, Functions, UConexao;

var
  GloIntCodEmpresa, GloIntCodFilial: integer;
  GloStrUser, GloStrPassword, GloStrDatabase, GloStrServer: string;
  GloStrNomeSistema: string;
  GloBlnEmbedded: boolean;
  FormatSettings: TFormatSettings;
//  cnn: TConexao;

procedure SetaConfiguracaoDoSistema;

implementation

procedure SetaConfiguracaoDoSistema;
begin
  GetLocaleFormatSettings(LOCALE_SYSTEM_DEFAULT, FormatSettings);
  with FormatSettings do
  begin
    CurrencyFormat := 0;
    NegCurrFormat := 0;
    ThousandSeparator := '.';
    DecimalSeparator := ',';
    CurrencyDecimals := 2;
    DateSeparator := '/';
    TimeSeparator := ':';
    ListSeparator := ';';
    CurrencyString := 'R$';
    ShortDateFormat := 'dd/MM/yyyy';
    LongDateFormat := Aspas('dddd, d')+' de ' + Aspas('MMMM')+' de '+Aspas('yyyy');
    TimeAMString := '';
    TimePMString := '';
    ShortTimeFormat := 'hh:mm';
    LongTimeFormat := 'hh:mm:ss';
    {ShortMonthNames := '';
    LongMonthNames := '';
    ShortDayNames := '';
    LongDayNames := '';    }
    TwoDigitYearCenturyWindow := 0;
  end;
end;


end.
