unit UException;

interface

uses AppEvnts,SysUtils,Forms,Classes,Controls;

type

  TException = class

  private

  protected

  public
    procedure NotifyException(Sender: TObject; E: Exception);

end;

implementation

{ TException }

procedure TException.NotifyException(Sender: TObject; E: Exception);

var
  NomeDoLog: string;
  Arquivo  : TextFile;
  str      : string;

begin

  NomeDoLog := ChangeFileExt(Application.Exename, '.log');

  AssignFile(Arquivo, NomeDoLog);
  if FileExists(NomeDoLog) then
    Append(Arquivo)
  else
    ReWrite(Arquivo);
  try
    str := E.ClassName + ' ' + DateTimeToStr(Now) + ' : ' + E.Message;
	  str := str + chr(13) + 'Tela: ' + TForm(GetParentForm(TControl(Sender).Parent)).Name + ' - ' +TForm(GetParentForm(TControl(Sender).Parent)).Caption;
    str := str + chr(13);

	//TBasicAction(TForm(GetParentForm(TControl(Sender).Parent)).ActiveControl).ClassName;

    WriteLn(Arquivo, str);
    Application.ShowException(E);
  finally
     CloseFile (Arquivo);
  end;
end;

end.

