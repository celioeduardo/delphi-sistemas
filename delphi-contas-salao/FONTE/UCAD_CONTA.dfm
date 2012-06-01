inherited frmCAD_CONTA: TfrmCAD_CONTA
  Left = 47
  Top = 116
  Caption = 'Cadastro de Conta'
  ClientHeight = 334
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl3: TPanel
    Top = 278
  end
  inherited tab: TPageControl
    Height = 278
    inherited tabCadastro: TTabSheet
      inherited pnl1: TPanel
        Height = 33
        object edtCOD_CONTA: TEditLabel
          Left = 112
          Top = 8
          Width = 129
          Height = 21
          _LabelCaption = 'C'#243'digo'
          _Campo = 'COD_CONTA'
          LabelComponent.Width = 40
          LabelComponent.Height = 13
          LabelComponent.Caption = 'C'#243'digo'
          _NotNull = True
          _Chave = True
          _Tipo = Pesquisa
          CharCase = ecUpperCase
          MaxLength = 9
          TabOrder = 0
          OnClickButton = edtCOD_CONTAClickButton
        end
      end
      inherited pnl2: TPanel
        Top = 33
        Height = 217
        object edtNOM_CONTA: TEditLabel
          Left = 112
          Top = 8
          Width = 481
          Height = 21
          _LabelCaption = 'Nome'
          _Campo = 'NOM_CONTA'
          LabelComponent.Width = 33
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Nome'
          _NotNull = True
          MaxLength = 60
          TabOrder = 0
        end
        object edtVAL_SALDO_INI: TEditLabel
          Left = 112
          Top = 32
          Width = 129
          Height = 21
          _LabelCaption = 'Saldo Inicial'
          _Campo = 'VAL_SALDO_INI'
          LabelComponent.Width = 70
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Saldo Inicial'
          _NotNull = True
          _Chave = True
          _Tipo = Num_Decimal
          _FormatoNumerico = 14.200000000000000000
          CharCase = ecUpperCase
          MaxLength = 9
          TabOrder = 1
        end
        object GroupBox1: TGroupBox
          Left = 112
          Top = 136
          Width = 225
          Height = 73
          Caption = 'Natureza'
          TabOrder = 3
          object optDevedora: TRadioButtonTag
            Left = 8
            Top = 21
            Width = 113
            Height = 17
            Caption = 'Devedora'
            Checked = True
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            TabStop = True
            _Campo = 'FLG_NATUREZA'
            _Tipo = tpChar
            _Valor = 'D'
            _Default = True
          end
          object optCredora: TRadioButtonTag
            Left = 8
            Top = 45
            Width = 113
            Height = 17
            Caption = 'Credora'
            TabOrder = 1
            _Campo = 'FLG_NATUREZA'
            _Tipo = tpChar
            _Valor = 'C'
            _Default = False
          end
        end
        object GroupBox2: TGroupBox
          Left = 112
          Top = 56
          Width = 553
          Height = 73
          Caption = 'Tipo Conta'
          TabOrder = 2
          object optAtivoCurtoPrazo: TRadioButtonTag
            Left = 8
            Top = 21
            Width = 159
            Height = 17
            Caption = 'Ativo (Curto Prazo)'
            Checked = True
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            TabStop = True
            _Campo = 'FLG_TP_CONTA'
            _Tipo = tpChar
            _Valor = 'ACP'
            _Default = True
          end
          object edtAtivoLongoPrazo: TRadioButtonTag
            Left = 8
            Top = 43
            Width = 159
            Height = 17
            Caption = 'Ativo (Longo Prazo)'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            _Campo = 'FLG_TP_CONTA'
            _Tipo = tpChar
            _Valor = 'ALP'
            _Default = True
          end
          object edtPassivoCurtoPrazo: TRadioButtonTag
            Left = 176
            Top = 21
            Width = 159
            Height = 17
            Caption = 'Passivo (Curto Prazo)'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            _Campo = 'FLG_TP_CONTA'
            _Tipo = tpChar
            _Valor = 'PCP'
            _Default = True
          end
          object edtPassivoLongoPrazo: TRadioButtonTag
            Left = 176
            Top = 43
            Width = 159
            Height = 17
            Caption = 'Passivo (Longo Prazo)'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            _Campo = 'FLG_TP_CONTA'
            _Tipo = tpChar
            _Valor = 'PLP'
            _Default = True
          end
          object edtReceita: TRadioButtonTag
            Left = 368
            Top = 21
            Width = 159
            Height = 17
            Caption = 'Receita'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            _Campo = 'FLG_TP_CONTA'
            _Tipo = tpChar
            _Valor = 'REC'
            _Default = True
          end
          object edtDespesa: TRadioButtonTag
            Left = 368
            Top = 43
            Width = 159
            Height = 17
            Caption = 'Despesa'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
            _Campo = 'FLG_TP_CONTA'
            _Tipo = tpChar
            _Valor = 'DES'
            _Default = True
          end
        end
      end
    end
  end
end
