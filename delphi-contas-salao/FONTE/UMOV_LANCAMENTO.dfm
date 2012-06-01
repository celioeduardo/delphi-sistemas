inherited frmMOV_LANCAMENTO: TfrmMOV_LANCAMENTO
  Left = 48
  Top = 91
  Caption = 'Lan'#231'amentos'
  ClientHeight = 417
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl3: TPanel
    Top = 361
  end
  inherited tab: TPageControl
    Height = 361
    inherited tabCadastro: TTabSheet
      inherited pnl1: TPanel
        Height = 33
        object edtNUM_LANCAMENTO: TEditLabel
          Left = 112
          Top = 8
          Width = 129
          Height = 21
          _LabelCaption = 'Lan'#231'amento n'#186
          _Campo = 'NUM_LANCAMENTO'
          LabelComponent.Width = 86
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Lan'#231'amento n'#186
          _NotNull = True
          _Chave = True
          _Tipo = Pesquisa
          CharCase = ecUpperCase
          MaxLength = 9
          TabOrder = 0
          OnChange = edtNUM_LANCAMENTOChange
          OnClickButton = edtNUM_LANCAMENTOClickButton
          OnEnter = edtNUM_LANCAMENTOEnter
        end
      end
      inherited pnl2: TPanel
        Top = 33
        Height = 300
        object lblDiaSemana: TLabel
          Left = 377
          Top = 37
          Width = 103
          Height = 13
          Caption = 'DIA DA SEMANA'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edtCOD_TP_LANC: TEditLabel
          Left = 112
          Top = 8
          Width = 129
          Height = 21
          _LabelCaption = 'Tipo Lanc.'
          _Campo = 'COD_TP_LANC'
          _Edit = edtNOM_TP_LANC
          LabelComponent.Width = 58
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Tipo Lanc.'
          _NotNull = True
          _Chave = True
          _Tipo = Pesquisa
          _IsChar = True
          CharCase = ecUpperCase
          MaxLength = 9
          TabOrder = 0
          OnChange = edtCOD_TP_LANCChange
          OnClickButton = edtCOD_TP_LANCClickButton
          OnExit = edtCOD_TP_LANCExit
        end
        object edtNOM_TP_LANC: TEditTag
          Left = 240
          Top = 8
          Width = 441
          Height = 21
          CharCase = ecUpperCase
          Enabled = False
          TabOrder = 3
          _Tipo = tpChar
          _Default = False
        end
        object edtDAT_LANCAMENTO: TEditLabel
          Left = 241
          Top = 32
          Width = 128
          Height = 21
          _LabelCaption = 'Data'
          _Campo = 'DAT_LANCAMENTO'
          LabelComponent.Width = 27
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Data'
          _NotNull = True
          _Chave = True
          _Tipo = Data
          _IsChar = True
          CharCase = ecUpperCase
          EditMask = '99/99/0000;1; '
          Enabled = False
          MaxLength = 10
          TabOrder = 4
          Text = '  /  /    '
          OnChange = edtDAT_LANCAMENTOChange
          OnExit = edtDAT_LANCAMENTOExit
        end
        object edtVAL_LANCAMENTO: TEditLabel
          Left = 112
          Top = 56
          Width = 128
          Height = 21
          _LabelCaption = 'Valor'
          _Campo = 'VAL_LANCAMENTO'
          LabelComponent.Width = 30
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Valor'
          _NotNull = True
          _Chave = True
          _Tipo = Num_Decimal
          _IsChar = True
          _FormatoNumerico = 14.200000000000000000
          CharCase = ecUpperCase
          TabOrder = 5
        end
        object edtDSC_LANCAMENTO: TEditLabel
          Left = 112
          Top = 128
          Width = 569
          Height = 21
          _LabelCaption = 'Desc. Lan'#231'.'
          _Campo = 'DSC_LANCAMENTO'
          LabelComponent.Width = 66
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Desc. Lan'#231'.'
          _NotNull = True
          MaxLength = 60
          TabOrder = 8
        end
        object edtCOD_CT: TEditLabel
          Left = 112
          Top = 175
          Width = 25
          Height = 21
          _LabelCaption = 'C'#243'd. Trans. (CT)'
          _Campo = 'COD_CT'
          LabelComponent.Width = 97
          LabelComponent.Height = 13
          LabelComponent.Caption = 'C'#243'd. Trans. (CT)'
          CharCase = ecUpperCase
          MaxLength = 1
          TabOrder = 10
        end
        object GroupBox1: TGroupBox
          Left = 112
          Top = 199
          Width = 345
          Height = 97
          Caption = 'Entrada e Sa'#237'da de Dinheiro'
          TabOrder = 13
          object optEntrada: TRadioButtonTag
            Left = 8
            Top = 21
            Width = 251
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
            Width = 251
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
            Width = 251
            Height = 17
            Caption = 'Ambos - Entrada e Sa'#237'da'
            TabOrder = 2
            _Campo = 'FLG_ES'
            _Tipo = tpChar
            _Valor = 'A'
            _Default = False
          end
        end
        object edtOBS_LANCAMENTO: TEditLabel
          Left = 112
          Top = 152
          Width = 569
          Height = 21
          _LabelCaption = 'Obs. Lan'#231'.'
          _Campo = 'OBS_LANCAMENTO'
          LabelComponent.Width = 60
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Obs. Lan'#231'.'
          MaxLength = 200
          TabOrder = 9
        end
        object edtCOD_CONTA_DEB: TEditLabel
          Left = 112
          Top = 80
          Width = 129
          Height = 21
          _LabelCaption = 'Conta D'#233'bito'
          _Campo = 'COD_CONTA_DEB'
          _Edit = edtNOM_CONTA_DEB
          LabelComponent.Width = 75
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Conta D'#233'bito'
          _NotNull = True
          _Tipo = Pesquisa
          CharCase = ecUpperCase
          MaxLength = 9
          TabOrder = 6
          OnClickButton = edtCOD_CONTA_DEBClickButton
          OnExit = edtCOD_CONTA_DEBExit
        end
        object edtCOD_CONTA_CRE: TEditLabel
          Left = 112
          Top = 104
          Width = 129
          Height = 21
          _LabelCaption = 'Conta Cr'#233'dito'
          _Campo = 'COD_CONTA_CRE'
          _Edit = edtNOM_CONTA_CRE
          LabelComponent.Width = 80
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Conta Cr'#233'dito'
          _NotNull = True
          _Tipo = Pesquisa
          CharCase = ecUpperCase
          MaxLength = 9
          TabOrder = 7
          OnClickButton = edtCOD_CONTA_CREClickButton
          OnExit = edtCOD_CONTA_CREExit
        end
        object edtNOM_CONTA_DEB: TEditTag
          Left = 240
          Top = 80
          Width = 441
          Height = 21
          CharCase = ecUpperCase
          Enabled = False
          TabOrder = 14
          _Tipo = tpChar
          _Default = False
        end
        object edtNOM_CONTA_CRE: TEditTag
          Left = 240
          Top = 104
          Width = 441
          Height = 21
          CharCase = ecUpperCase
          Enabled = False
          TabOrder = 15
          _Tipo = tpChar
          _Default = False
        end
        object edtDia: TEditLabel
          Left = 112
          Top = 32
          Width = 49
          Height = 21
          _LabelCaption = 'Dia'
          LabelComponent.Width = 19
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Dia'
          _Tipo = Numero
          _FormatoNumerico = 2.000000000000000000
          MaxLength = 2
          TabOrder = 2
          OnChange = edtDiaChange
          OnExit = edtDiaExit
        end
      end
    end
  end
end
