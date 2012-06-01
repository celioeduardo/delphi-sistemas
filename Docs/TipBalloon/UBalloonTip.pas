unit UBalloonTip;

interface
uses
   Controls, Graphics, Commctrl,Messages, Types, Windows;

procedure ShowBalloonTip(Control: TWinControl; Icon: integer; Title: pchar; Text: PWideChar;
BackCL, TextCL: TColor);

implementation

procedure ShowBalloonTip(Control: TWinControl; Icon: integer; Title: pchar; Text: PWideChar;
BackCL, TextCL: TColor);
const
  TOOLTIPS_CLASS = 'tooltips_class32';
  TTS_ALWAYSTIP = $01;
  TTS_NOPREFIX = $02;
  TTS_BALLOON = $40;
  TTF_SUBCLASS = $0010;
  TTF_TRANSPARENT = $0100;
  TTF_CENTERTIP = $0002;
  TTM_ADDTOOL = $0400 + 50;
  TTM_SETTITLE = (WM_USER + 32);
  ICC_WIN95_CLASSES = $000000FF;
type
  TOOLINFO = packed record
    cbSize: Integer;
    uFlags: Integer;
    hwnd: THandle;
    uId: Integer;
    rect: TRect;
    hinst: THandle;
    lpszText: PWideChar;
    lParam: Integer;
  end;
var
  hWndTip: THandle;
  ti: TOOLINFO;
  hWnd: THandle;
begin
  hWnd    := Control.Handle;
  hWndTip := CreateWindow(TOOLTIPS_CLASS, nil,
    WS_POPUP or TTS_NOPREFIX or TTS_BALLOON or TTS_ALWAYSTIP,
    0, 0, 0, 0, hWnd, 0, HInstance, nil);
  if hWndTip <> 0 then
  begin
    SetWindowPos(hWndTip, HWND_TOPMOST, 0, 0, 0, 0,
      SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);
    ti.cbSize := SizeOf(ti);
    ti.uFlags := TTF_CENTERTIP or TTF_TRANSPARENT or TTF_SUBCLASS;
    ti.hwnd := hWnd;
    ti.lpszText := Text;
    Windows.GetClientRect(hWnd, ti.rect);
    SendMessage(hWndTip, TTM_SETTIPBKCOLOR, BackCL, 0);
    SendMessage(hWndTip, TTM_SETTIPTEXTCOLOR, TextCL, 0);
    SendMessage(hWndTip, TTM_ADDTOOL, 1, Integer(@ti));
    SendMessage(hWndTip, TTM_SETTITLE, Icon mod 4, Integer(Title));
  end;
end;

{ CHAMADA
ShowBalloonTip(Button1, 1, 'Title',
  'Balloon tooltip,http://kingron.myetang.com; updated by Calin', clYellow, clNavy);
}
end.
