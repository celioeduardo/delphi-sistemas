program BinPropEd;

uses
  Forms,
  Proxies in 'C:\Program Files\Borland\Delphi7\Source\ToolsAPI\Proxies.pas',
  DesignConst in 'C:\Program Files\Borland\Delphi7\Source\ToolsAPI\DesignConst.pas',
  DesignEditors in 'C:\Program Files\Borland\Delphi7\Source\ToolsAPI\DesignEditors.pas',
  DesignIntf in 'C:\Program Files\Borland\Delphi7\Source\ToolsAPI\DesignIntf.pas',
  DesignMenus in 'C:\Program Files\Borland\Delphi7\Source\ToolsAPI\DesignMenus.pas',
  BinaryPropEd in 'BinaryPropEd.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Run;
end.
