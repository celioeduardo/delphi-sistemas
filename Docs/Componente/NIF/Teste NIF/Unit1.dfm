object Form1: TForm1
  Left = 225
  Top = 124
  Width = 544
  Height = 375
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object txt: TEdit
    Left = 48
    Top = 8
    Width = 97
    Height = 21
    TabOrder = 0
  end
  object txtDNI: TEdit
    Left = 48
    Top = 32
    Width = 97
    Height = 21
    TabOrder = 1
    OnChange = txtDNIChange
  end
  object nif: TNif
    DNI = 1
    Left = 8
    Top = 8
  end
end
