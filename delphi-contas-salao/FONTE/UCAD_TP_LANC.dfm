inherited frmCAD_TP_LANC: TfrmCAD_TP_LANC
  Left = 48
  Top = 119
  Caption = 'Cadastro de Tipo de Lan'#231'amento'
  ClientHeight = 349
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl3: TPanel
    Top = 293
  end
  inherited tab: TPageControl
    Height = 293
    inherited tabCadastro: TTabSheet
      inherited pnl1: TPanel
        Height = 33
        object edtCOD_TP_LANC: TEditLabel
          Left = 112
          Top = 8
          Width = 129
          Height = 21
          _LabelCaption = 'C'#243'digo'
          _Campo = 'COD_TP_LANC'
          LabelComponent.Width = 40
          LabelComponent.Height = 13
          LabelComponent.Caption = 'C'#243'digo'
          _NotNull = True
          _Chave = True
          _Tipo = Pesquisa
          _IsChar = True
          CharCase = ecUpperCase
          MaxLength = 9
          TabOrder = 0
          OnClickButton = edtCOD_TP_LANCClickButton
        end
      end
      inherited pnl2: TPanel
        Top = 33
        Height = 232
        object edtNOM_TP_LANC: TEditLabel
          Left = 112
          Top = 8
          Width = 569
          Height = 21
          _LabelCaption = 'Nome'
          _Campo = 'NOM_TP_LANC'
          LabelComponent.Width = 33
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Nome'
          _NotNull = True
          _IsChar = True
          MaxLength = 60
          TabOrder = 0
        end
        object edtCOD_CONTA_DEB: TEditLabel
          Left = 112
          Top = 32
          Width = 129
          Height = 21
          _LabelCaption = 'Conta D'#233'bito'
          _Campo = 'COD_CONTA_DEB'
          _Edit = edtNOM_CONTA_DEB
          LabelComponent.Width = 75
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Conta D'#233'bito'
          _Tipo = Pesquisa
          CharCase = ecUpperCase
          MaxLength = 9
          TabOrder = 1
          OnClickButton = edtCOD_CONTA_DEBClickButton
          OnExit = edtCOD_CONTA_DEBExit
        end
        object edtNOM_CONTA_DEB: TEditTag
          Left = 240
          Top = 32
          Width = 441
          Height = 21
          CharCase = ecUpperCase
          Enabled = False
          TabOrder = 3
          _Tipo = tpChar
          _Default = False
        end
        object edtCOD_CONTA_CRE: TEditLabel
          Left = 112
          Top = 56
          Width = 129
          Height = 21
          _LabelCaption = 'Conta Cr'#233'dito'
          _Campo = 'COD_CONTA_CRE'
          _Edit = edtNOM_CONTA_CRE
          LabelComponent.Width = 80
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Conta Cr'#233'dito'
          _Tipo = Pesquisa
          CharCase = ecUpperCase
          MaxLength = 9
          TabOrder = 4
          OnClickButton = edtCOD_CONTA_CREClickButton
          OnExit = edtCOD_CONTA_CREExit
        end
        object edtNOM_CONTA_CRE: TEditTag
          Left = 240
          Top = 56
          Width = 441
          Height = 21
          CharCase = ecUpperCase
          Enabled = False
          TabOrder = 6
          _Tipo = tpChar
          _Default = False
        end
        object edtDSC_LANCAMENTO: TEditLabel
          Left = 112
          Top = 80
          Width = 569
          Height = 21
          _LabelCaption = 'Desc. Lan'#231'.'
          _Campo = 'DSC_LANCAMENTO'
          LabelComponent.Width = 66
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Desc. Lan'#231'.'
          MaxLength = 60
          TabOrder = 7
        end
        object edtCOD_CT: TEditLabel
          Left = 112
          Top = 104
          Width = 25
          Height = 21
          _LabelCaption = 'C'#243'd. Trans. (CT)'
          _Campo = 'COD_CT'
          LabelComponent.Width = 97
          LabelComponent.Height = 13
          LabelComponent.Caption = 'C'#243'd. Trans. (CT)'
          CharCase = ecUpperCase
          MaxLength = 1
          TabOrder = 8
        end
        object GroupBox1: TGroupBox
          Left = 112
          Top = 128
          Width = 345
          Height = 97
          Caption = 'Entrada e Sa'#237'da de Dinheiro'
          TabOrder = 9
          object optEntrada: TRadioButtonTag
            Left = 8
            Top = 21
            Width = 237
            Height = 17
            Caption = 'Entrada'
            Checked = True
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            TabStop = True
            _Campo = 'FLG_ES'
            _Tipo = tpChar
            _Valor = 'E'
            _Default = True
          end
          object optSaida: TRadioButtonTag
            Left = 8
            Top = 45
            Width = 237
            Height = 17
            Caption = 'Sa'#237'da'
            TabOrder = 1
            _Campo = 'FLG_ES'
            _Tipo = tpChar
            _Valor = 'S'
            _Default = False
          end
          object optAmbos: TRadioButtonTag
            Left = 8
            Top = 69
            Width = 237
            Height = 17
            Caption = 'Ambos - Entrada e Sa'#237'da'
            TabOrder = 2
            _Campo = 'FLG_ES'
            _Tipo = tpChar
            _Valor = 'A'
            _Default = False
          end
        end
      end
    end
  end
end
