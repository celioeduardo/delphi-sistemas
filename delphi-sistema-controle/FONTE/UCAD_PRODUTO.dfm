inherited frmCAD_PRODUTO: TfrmCAD_PRODUTO
  Left = 97
  Top = 253
  Caption = 'Cadastro de Produto'
  ClientHeight = 339
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl3: TPanel
    Top = 283
  end
  inherited tab: TPageControl
    Height = 283
    inherited tabCadastro: TTabSheet
      inherited pnl1: TPanel
        Height = 33
        object edtCOD_PRODUTO: TEditLabel
          Left = 112
          Top = 8
          Width = 129
          Height = 21
          _LabelCaption = 'C'#243'digo'
          _Campo = 'COD_PRODUTO'
          LabelComponent.Width = 40
          LabelComponent.Height = 13
          LabelComponent.Caption = 'C'#243'digo'
          _NotNull = True
          _Chave = True
          _Tipo = Pesquisa
          CharCase = ecUpperCase
          MaxLength = 9
          TabOrder = 0
          OnChange = edtCOD_PRODUTOChange
          OnClickButton = edtCOD_PRODUTOClickButton
          OnEnter = edtCOD_PRODUTOEnter
        end
      end
      inherited pnl2: TPanel
        Top = 33
        Height = 222
        object edtNOM_PRODUTO: TEditLabel
          Left = 112
          Top = 8
          Width = 569
          Height = 21
          _LabelCaption = 'Nome'
          _Campo = 'NOM_PRODUTO'
          LabelComponent.Width = 33
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Nome'
          _NotNull = True
          CharCase = ecUpperCase
          MaxLength = 80
          TabOrder = 0
        end
        object edtCOD_APRESENTACAO: TEditLabel
          Left = 112
          Top = 32
          Width = 129
          Height = 21
          _LabelCaption = 'Apresenta'#231#227'o'
          _Campo = 'COD_APRESENTACAO'
          _Edit = edtNOM_APRESENTACAO
          LabelComponent.Width = 78
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Apresenta'#231#227'o'
          _NotNull = True
          _Tipo = Pesquisa
          _FormatoNumerico = 4.000000000000000000
          CharCase = ecUpperCase
          TabOrder = 1
          OnClickButton = edtCOD_APRESENTACAOClickButton
          OnExit = edtCOD_APRESENTACAOExit
        end
        object edtNOM_APRESENTACAO: TEditTag
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
        object edtCOD_P_ATIVO: TEditLabel
          Left = 112
          Top = 56
          Width = 129
          Height = 21
          _LabelCaption = 'Princ. Ativo'
          _Campo = 'COD_P_ATIVO'
          _Edit = edtNOM_P_ATIVO
          LabelComponent.Width = 65
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Princ. Ativo'
          _NotNull = True
          _Tipo = Pesquisa
          _FormatoNumerico = 4.000000000000000000
          CharCase = ecUpperCase
          TabOrder = 4
          OnClickButton = edtCOD_P_ATIVOClickButton
          OnExit = edtCOD_P_ATIVOExit
        end
        object edtNOM_P_ATIVO: TEditTag
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
        object edtCOD_FORNECEDOR: TEditLabel
          Left = 112
          Top = 80
          Width = 129
          Height = 21
          _LabelCaption = 'Fornecedor'
          _Campo = 'COD_FORNECEDOR'
          _Edit = edtNOM_FORNECEDOR
          LabelComponent.Width = 64
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Fornecedor'
          _NotNull = True
          _Tipo = Pesquisa
          _FormatoNumerico = 4.000000000000000000
          CharCase = ecUpperCase
          TabOrder = 7
          OnClickButton = edtCOD_FORNECEDORClickButton
          OnExit = edtCOD_FORNECEDORExit
        end
        object edtNOM_FORNECEDOR: TEditTag
          Left = 240
          Top = 80
          Width = 441
          Height = 21
          CharCase = ecUpperCase
          Enabled = False
          TabOrder = 9
          _Tipo = tpChar
          _Default = False
        end
        object edtQTD_MAXIMO: TEditLabel
          Left = 112
          Top = 104
          Width = 129
          Height = 21
          _LabelCaption = 'Estoque M'#225'ximo'
          _Campo = 'QTD_MAXIMO'
          LabelComponent.Width = 93
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Estoque M'#225'ximo'
          _NotNull = True
          _Tipo = Num_Decimal
          _FormatoNumerico = 12.300000000000000000
          CharCase = ecUpperCase
          TabOrder = 10
        end
        object edtQTD_MINIMO: TEditLabel
          Left = 376
          Top = 104
          Width = 129
          Height = 21
          _LabelCaption = 'Estoque M'#237'nimo'
          _Campo = 'QTD_MINIMO'
          LabelComponent.Width = 89
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Estoque M'#237'nimo'
          _NotNull = True
          _Tipo = Num_Decimal
          _FormatoNumerico = 12.300000000000000000
          CharCase = ecUpperCase
          TabOrder = 11
        end
        object edtQTD_FISICO_ANT: TEditLabel
          Left = 112
          Top = 152
          Width = 129
          Height = 21
          _LabelCaption = 'Qtd. Anterior'
          _Campo = 'QTD_FISICO_ANT'
          LabelComponent.Width = 74
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Qtd. Anterior'
          _NotNull = True
          _Tipo = Num_Decimal
          _FormatoNumerico = 12.300000000000000000
          CharCase = ecUpperCase
          TabOrder = 13
        end
        object edtVAL_FISICO_ANT: TEditLabel
          Left = 112
          Top = 176
          Width = 129
          Height = 21
          _LabelCaption = 'Valor Anterior'
          _Campo = 'VAL_FISICO_ANT'
          LabelComponent.Width = 80
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Valor Anterior'
          _NotNull = True
          _Tipo = Num_Decimal
          _FormatoNumerico = 14.200000000000000000
          CharCase = ecUpperCase
          TabOrder = 14
        end
        object chkFLG_ATIVO: TCheckBoxTag
          Left = 112
          Top = 200
          Width = 137
          Height = 17
          Caption = 'Ativo'
          Checked = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          State = cbChecked
          TabOrder = 15
          _Campo = 'FLG_ATIVO'
          _Tipo = tpChar
          _Valor = 'S'
        end
        object edtDAT_IMPLANTACAO: TEditLabel
          Left = 112
          Top = 128
          Width = 128
          Height = 21
          _LabelCaption = 'Implanta'#231#227'o'
          _Campo = 'DAT_IMPLANTACAO'
          LabelComponent.Width = 71
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Implanta'#231#227'o'
          _NotNull = True
          _Tipo = Data
          CharCase = ecUpperCase
          EditMask = '99/99/0000;1; '
          MaxLength = 10
          TabOrder = 12
          Text = '  /  /    '
        end
        object edtQTD_FISICO: TEditLabel
          Left = 376
          Top = 152
          Width = 129
          Height = 21
          _LabelCaption = 'Saldo F'#237'sico'
          _Campo = 'QTD_FISICO'
          LabelComponent.Width = 67
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Saldo F'#237'sico'
          _Tipo = Num_Decimal
          _FormatoNumerico = 12.300000000000000000
          CharCase = ecUpperCase
          Enabled = False
          TabOrder = 16
        end
        object edtVAL_FINAN: TEditLabel
          Left = 376
          Top = 176
          Width = 129
          Height = 21
          _LabelCaption = 'Saldo Financeiro'
          _Campo = 'VAL_FINAN'
          LabelComponent.Width = 94
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Saldo Financeiro'
          _Tipo = Num_Decimal
          _FormatoNumerico = 14.200000000000000000
          CharCase = ecUpperCase
          Enabled = False
          TabOrder = 17
        end
      end
    end
  end
end
