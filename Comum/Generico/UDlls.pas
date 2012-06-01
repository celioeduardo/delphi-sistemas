unit UDlls;

interface

Uses Windows, Classes, Sysutils, Forms,Dialogs;

function ExtractSystemDir : string;
procedure ExtrairDLLs;

implementation

//O ARQUIVO *.RES TEM QUE ESTAR NO \LIB DO DELPHI

{$R DLLS.RES}


procedure ExtrairDLL(Dir, Nome: string; Tipo: string = 'DLLFILE');
var Res: TResourceStream;
begin
  if not FileExists(Dir) then
  begin
     Res := TResourceStream.Create(Hinstance, Nome, PChar(Tipo));
     try
       Res.SavetoFile(Dir);
     finally
       Res.Free;
     end;
  end;
end;

procedure ExtrairDLLs;
begin
  {ExtrairDLL('C:\MIDAS.DLL','MIDASDLL');
  ExtrairDLL('C:\GDS32.DLL','GDSDLL');
  ExtrairDLL('C:\DBEXPINT.DLL','DBEXDLL');}
  ExtrairDLL(ExtractSystemdir+'\MIDAS.DLL','MIDASDLL');
  ExtrairDLL(ExtractSystemdir+'\GDS32.DLL','GDSDLL');
  ExtrairDLL(ExtractSystemdir+'\DBEXPINT.DLL','DBEXDLL');
end;

function ExtractSystemDir : string;
var Buffer : array[0..255] of Char;
begin
  GetSystemDirectory(Buffer,144);
  Result := StrPas(Buffer);
end;

initialization
begin
   ExtrairDLLs;
end;

end.









