object frmCalcDinheiro: TfrmCalcDinheiro
  Left = 142
  Top = 6
  BorderStyle = bsDialog
  Caption = 'C'#225'lculo Dinheiro e Cheque'
  ClientHeight = 530
  ClientWidth = 439
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object grpNotas: TGroupBox
    Left = 8
    Top = 8
    Width = 425
    Height = 217
    Caption = 'Notas'
    TabOrder = 0
    object lbl100: TLabel
      Left = 256
      Top = 22
      Width = 82
      Height = 18
      Alignment = taRightJustify
      AutoSize = False
      Caption = '0,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    object lbl50: TLabel
      Left = 256
      Top = 46
      Width = 82
      Height = 18
      Alignment = taRightJustify
      AutoSize = False
      Caption = '0,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    object lbl20: TLabel
      Left = 256
      Top = 70
      Width = 82
      Height = 18
      Alignment = taRightJustify
      AutoSize = False
      Caption = '0,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    object lbl10: TLabel
      Left = 256
      Top = 94
      Width = 82
      Height = 18
      Alignment = taRightJustify
      AutoSize = False
      Caption = '0,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    object lbl5: TLabel
      Left = 256
      Top = 118
      Width = 82
      Height = 18
      Alignment = taRightJustify
      AutoSize = False
      Caption = '0,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    object lbl2: TLabel
      Left = 256
      Top = 142
      Width = 82
      Height = 18
      Alignment = taRightJustify
      AutoSize = False
      Caption = '0,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    object lbl1: TLabel
      Left = 256
      Top = 166
      Width = 82
      Height = 18
      Alignment = taRightJustify
      AutoSize = False
      Caption = '0,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    object lblTotalNota: TLabel
      Left = 256
      Top = 190
      Width = 82
      Height = 18
      Alignment = taRightJustify
      AutoSize = False
      Caption = '0,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
      Layout = tlCenter
    end
    object edtNota100: TEditLabel
      Left = 128
      Top = 20
      Width = 128
      Height = 21
      _LabelCaption = 'R$ 100,00'
      LabelComponent.Width = 58
      LabelComponent.Height = 16
      LabelComponent.Caption = 'R$ 100,00'
      LabelComponent.Font.Charset = DEFAULT_CHARSET
      LabelComponent.Font.Color = clWindowText
      LabelComponent.Font.Height = -13
      LabelComponent.Font.Name = 'MS Sans Serif'
      LabelComponent.Font.Style = []
      LabelComponent.ParentFont = False
      _Tipo = Numero
      _IsChar = True
      _FormatoNumerico = 5.000000000000000000
      CharCase = ecUpperCase
      ParentShowHint = False
      ShowHint = False
      TabOrder = 0
      OnChange = edtNota100Change
    end
    object edtNota50: TEditLabel
      Left = 128
      Top = 44
      Width = 128
      Height = 21
      _LabelCaption = 'R$ 50,00'
      LabelComponent.Width = 51
      LabelComponent.Height = 16
      LabelComponent.Caption = 'R$ 50,00'
      LabelComponent.Font.Charset = DEFAULT_CHARSET
      LabelComponent.Font.Color = clWindowText
      LabelComponent.Font.Height = -13
      LabelComponent.Font.Name = 'MS Sans Serif'
      LabelComponent.Font.Style = []
      LabelComponent.ParentFont = False
      _Tipo = Numero
      _IsChar = True
      _FormatoNumerico = 5.000000000000000000
      CharCase = ecUpperCase
      ParentShowHint = False
      ShowHint = False
      TabOrder = 1
      OnChange = edtNota50Change
    end
    object edtNota20: TEditLabel
      Left = 128
      Top = 68
      Width = 128
      Height = 21
      _LabelCaption = 'R$ 20,00'
      LabelComponent.Width = 51
      LabelComponent.Height = 16
      LabelComponent.Caption = 'R$ 20,00'
      LabelComponent.Font.Charset = DEFAULT_CHARSET
      LabelComponent.Font.Color = clWindowText
      LabelComponent.Font.Height = -13
      LabelComponent.Font.Name = 'MS Sans Serif'
      LabelComponent.Font.Style = []
      LabelComponent.ParentFont = False
      _Tipo = Numero
      _IsChar = True
      _FormatoNumerico = 5.000000000000000000
      CharCase = ecUpperCase
      ParentShowHint = False
      ShowHint = False
      TabOrder = 2
      OnChange = edtNota20Change
    end
    object edtNota10: TEditLabel
      Left = 128
      Top = 92
      Width = 128
      Height = 21
      _LabelCaption = 'R$ 10,00'
      LabelComponent.Width = 51
      LabelComponent.Height = 16
      LabelComponent.Caption = 'R$ 10,00'
      LabelComponent.Font.Charset = DEFAULT_CHARSET
      LabelComponent.Font.Color = clWindowText
      LabelComponent.Font.Height = -13
      LabelComponent.Font.Name = 'MS Sans Serif'
      LabelComponent.Font.Style = []
      LabelComponent.ParentFont = False
      _Tipo = Numero
      _IsChar = True
      _FormatoNumerico = 5.000000000000000000
      CharCase = ecUpperCase
      ParentShowHint = False
      ShowHint = False
      TabOrder = 3
      OnChange = edtNota10Change
    end
    object edtNota5: TEditLabel
      Left = 128
      Top = 116
      Width = 128
      Height = 21
      _LabelCaption = 'R$ 5,00'
      LabelComponent.Width = 44
      LabelComponent.Height = 16
      LabelComponent.Caption = 'R$ 5,00'
      LabelComponent.Font.Charset = DEFAULT_CHARSET
      LabelComponent.Font.Color = clWindowText
      LabelComponent.Font.Height = -13
      LabelComponent.Font.Name = 'MS Sans Serif'
      LabelComponent.Font.Style = []
      LabelComponent.ParentFont = False
      _Tipo = Numero
      _IsChar = True
      _FormatoNumerico = 5.000000000000000000
      CharCase = ecUpperCase
      ParentShowHint = False
      ShowHint = False
      TabOrder = 4
      OnChange = edtNota5Change
    end
    object edtNota2: TEditLabel
      Left = 128
      Top = 140
      Width = 128
      Height = 21
      _LabelCaption = 'R$ 2,00'
      LabelComponent.Width = 44
      LabelComponent.Height = 16
      LabelComponent.Caption = 'R$ 2,00'
      LabelComponent.Font.Charset = DEFAULT_CHARSET
      LabelComponent.Font.Color = clWindowText
      LabelComponent.Font.Height = -13
      LabelComponent.Font.Name = 'MS Sans Serif'
      LabelComponent.Font.Style = []
      LabelComponent.ParentFont = False
      _Tipo = Numero
      _IsChar = True
      _FormatoNumerico = 5.000000000000000000
      CharCase = ecUpperCase
      ParentShowHint = False
      ShowHint = False
      TabOrder = 5
      OnChange = edtNota2Change
    end
    object edtNota1: TEditLabel
      Left = 128
      Top = 164
      Width = 128
      Height = 21
      _LabelCaption = 'R$ 1,00'
      LabelComponent.Width = 44
      LabelComponent.Height = 16
      LabelComponent.Caption = 'R$ 1,00'
      LabelComponent.Font.Charset = DEFAULT_CHARSET
      LabelComponent.Font.Color = clWindowText
      LabelComponent.Font.Height = -13
      LabelComponent.Font.Name = 'MS Sans Serif'
      LabelComponent.Font.Style = []
      LabelComponent.ParentFont = False
      _Tipo = Numero
      _IsChar = True
      _FormatoNumerico = 5.000000000000000000
      CharCase = ecUpperCase
      ParentShowHint = False
      ShowHint = False
      TabOrder = 6
      OnChange = edtNota1Change
    end
  end
  object grpMoeda: TGroupBox
    Left = 6
    Top = 232
    Width = 425
    Height = 193
    Caption = 'Moedas'
    TabOrder = 1
    object lbl1m: TLabel
      Left = 256
      Top = 22
      Width = 82
      Height = 18
      Alignment = taRightJustify
      AutoSize = False
      Caption = '0,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    object lbl50c: TLabel
      Left = 256
      Top = 46
      Width = 82
      Height = 18
      Alignment = taRightJustify
      AutoSize = False
      Caption = '0,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    object lbl25c: TLabel
      Left = 256
      Top = 70
      Width = 82
      Height = 18
      Alignment = taRightJustify
      AutoSize = False
      Caption = '0,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    object lbl10c: TLabel
      Left = 256
      Top = 94
      Width = 82
      Height = 18
      Alignment = taRightJustify
      AutoSize = False
      Caption = '0,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    object lbl5c: TLabel
      Left = 256
      Top = 118
      Width = 82
      Height = 18
      Alignment = taRightJustify
      AutoSize = False
      Caption = '0,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    object lbl1c: TLabel
      Left = 256
      Top = 142
      Width = 82
      Height = 18
      Alignment = taRightJustify
      AutoSize = False
      Caption = '0,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    object lblTotalMoeda: TLabel
      Left = 256
      Top = 166
      Width = 82
      Height = 18
      Alignment = taRightJustify
      AutoSize = False
      Caption = '0,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
      Layout = tlCenter
    end
    object edt1: TEditLabel
      Left = 128
      Top = 20
      Width = 128
      Height = 21
      _LabelCaption = 'R$ 1,00'
      LabelComponent.Width = 44
      LabelComponent.Height = 16
      LabelComponent.Caption = 'R$ 1,00'
      LabelComponent.Font.Charset = DEFAULT_CHARSET
      LabelComponent.Font.Color = clWindowText
      LabelComponent.Font.Height = -13
      LabelComponent.Font.Name = 'MS Sans Serif'
      LabelComponent.Font.Style = []
      LabelComponent.ParentFont = False
      _Tipo = Numero
      _IsChar = True
      _FormatoNumerico = 5.000000000000000000
      CharCase = ecUpperCase
      ParentShowHint = False
      ShowHint = False
      TabOrder = 0
      OnChange = edt1Change
    end
    object edt50c: TEditLabel
      Left = 128
      Top = 44
      Width = 128
      Height = 21
      _LabelCaption = 'R$ 0,50'
      LabelComponent.Width = 44
      LabelComponent.Height = 16
      LabelComponent.Caption = 'R$ 0,50'
      LabelComponent.Font.Charset = DEFAULT_CHARSET
      LabelComponent.Font.Color = clWindowText
      LabelComponent.Font.Height = -13
      LabelComponent.Font.Name = 'MS Sans Serif'
      LabelComponent.Font.Style = []
      LabelComponent.ParentFont = False
      _Tipo = Numero
      _IsChar = True
      _FormatoNumerico = 5.000000000000000000
      CharCase = ecUpperCase
      ParentShowHint = False
      ShowHint = False
      TabOrder = 1
      OnChange = edt50cChange
    end
    object edt25c: TEditLabel
      Left = 128
      Top = 68
      Width = 128
      Height = 21
      _LabelCaption = 'R$ 0,25'
      LabelComponent.Width = 44
      LabelComponent.Height = 16
      LabelComponent.Caption = 'R$ 0,25'
      LabelComponent.Font.Charset = DEFAULT_CHARSET
      LabelComponent.Font.Color = clWindowText
      LabelComponent.Font.Height = -13
      LabelComponent.Font.Name = 'MS Sans Serif'
      LabelComponent.Font.Style = []
      LabelComponent.ParentFont = False
      _Tipo = Numero
      _IsChar = True
      _FormatoNumerico = 5.000000000000000000
      CharCase = ecUpperCase
      ParentShowHint = False
      ShowHint = False
      TabOrder = 2
      OnChange = edt25cChange
    end
    object edt10c: TEditLabel
      Left = 128
      Top = 92
      Width = 128
      Height = 21
      _LabelCaption = 'R$ 0,10'
      LabelComponent.Width = 44
      LabelComponent.Height = 16
      LabelComponent.Caption = 'R$ 0,10'
      LabelComponent.Font.Charset = DEFAULT_CHARSET
      LabelComponent.Font.Color = clWindowText
      LabelComponent.Font.Height = -13
      LabelComponent.Font.Name = 'MS Sans Serif'
      LabelComponent.Font.Style = []
      LabelComponent.ParentFont = False
      _Tipo = Numero
      _IsChar = True
      _FormatoNumerico = 5.000000000000000000
      CharCase = ecUpperCase
      ParentShowHint = False
      ShowHint = False
      TabOrder = 3
      OnChange = edt10cChange
    end
    object edt5c: TEditLabel
      Left = 128
      Top = 116
      Width = 128
      Height = 21
      _LabelCaption = 'R$ 0,05'
      LabelComponent.Width = 44
      LabelComponent.Height = 16
      LabelComponent.Caption = 'R$ 0,05'
      LabelComponent.Font.Charset = DEFAULT_CHARSET
      LabelComponent.Font.Color = clWindowText
      LabelComponent.Font.Height = -13
      LabelComponent.Font.Name = 'MS Sans Serif'
      LabelComponent.Font.Style = []
      LabelComponent.ParentFont = False
      _Tipo = Numero
      _IsChar = True
      _FormatoNumerico = 5.000000000000000000
      CharCase = ecUpperCase
      ParentShowHint = False
      ShowHint = False
      TabOrder = 4
      OnChange = edt5cChange
    end
    object edt1c: TEditLabel
      Left = 128
      Top = 140
      Width = 128
      Height = 21
      _LabelCaption = 'R$ 0,01'
      LabelComponent.Width = 44
      LabelComponent.Height = 16
      LabelComponent.Caption = 'R$ 0,01'
      LabelComponent.Font.Charset = DEFAULT_CHARSET
      LabelComponent.Font.Color = clWindowText
      LabelComponent.Font.Height = -13
      LabelComponent.Font.Name = 'MS Sans Serif'
      LabelComponent.Font.Style = []
      LabelComponent.ParentFont = False
      _Tipo = Numero
      _IsChar = True
      _FormatoNumerico = 5.000000000000000000
      CharCase = ecUpperCase
      ParentShowHint = False
      ShowHint = False
      TabOrder = 5
      OnChange = edt1cChange
    end
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 432
    Width = 425
    Height = 41
    Caption = 'Cheque'
    TabOrder = 2
    object edtCheque: TEditLabel
      Left = 128
      Top = 12
      Width = 128
      Height = 21
      _LabelCaption = 'Cheque R$'
      LabelComponent.Width = 67
      LabelComponent.Height = 16
      LabelComponent.Caption = 'Cheque R$'
      LabelComponent.Font.Charset = DEFAULT_CHARSET
      LabelComponent.Font.Color = clWindowText
      LabelComponent.Font.Height = -13
      LabelComponent.Font.Name = 'MS Sans Serif'
      LabelComponent.Font.Style = []
      LabelComponent.ParentFont = False
      _Tipo = Num_Decimal
      _IsChar = True
      _FormatoNumerico = 14.200000000000000000
      CharCase = ecUpperCase
      ParentShowHint = False
      ShowHint = False
      TabOrder = 0
      OnChange = edtChequeChange
    end
  end
  object grpTotal: TGroupBox
    Left = 6
    Top = 480
    Width = 347
    Height = 41
    Caption = 'Total'
    TabOrder = 3
    object lblTotal: TLabel
      Left = 168
      Top = 14
      Width = 169
      Height = 25
      Alignment = taRightJustify
      AutoSize = False
      BiDiMode = bdLeftToRight
      Caption = '0,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      Layout = tlCenter
    end
  end
  object btnOK: TButton
    Left = 366
    Top = 482
    Width = 66
    Height = 42
    Caption = '&Salvar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = btnOKClick
  end
end
