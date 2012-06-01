inherited frmCAD_TP_REUNIAO: TfrmCAD_TP_REUNIAO
  Left = 45
  Top = 97
  Caption = 'Cadastro de Tipo de Reuni'#227'o'
  ClientHeight = 225
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl3: TPanel
    Top = 169
  end
  inherited tab: TPageControl
    Height = 169
    inherited tabCadastro: TTabSheet
      inherited pnl1: TPanel
        Height = 34
        object txtCOD_TP_REUNIAO: TEditLabel
          Left = 112
          Top = 10
          Width = 121
          Height = 21
          _LabelCaption = 'C'#243'digo'
          _Campo = 'COD_TP_REUNIAO'
          LabelComponent.Width = 40
          LabelComponent.Height = 13
          LabelComponent.Caption = 'C'#243'digo'
          _NotNull = True
          _Chave = True
          _Tipo = Numero
          _FormatoNumerico = 3.000000000000000000
          TabOrder = 0
          OnChange = txtCOD_TP_REUNIAOChange
          OnEnter = txtCOD_TP_REUNIAOEnter
        end
      end
      inherited pnl2: TPanel
        Top = 34
        Height = 107
        object edtNOM_TP_REUNIAO: TEditLabel
          Left = 112
          Top = 6
          Width = 505
          Height = 21
          _LabelCaption = 'Nome'
          _Campo = 'NOM_TP_REUNIAO'
          LabelComponent.Width = 33
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Nome'
          _NotNull = True
          MaxLength = 80
          TabOrder = 0
        end
        object GroupBox1: TGroupBox
          Left = 112
          Top = 38
          Width = 449
          Height = 64
          Caption = 'Dia da Semana'
          TabOrder = 1
          object RadioButtonTag1: TRadioButtonTag
            Left = 8
            Top = 16
            Width = 113
            Height = 17
            Caption = 'Segunda'
            TabOrder = 0
            _Campo = 'FLG_DIA_SEMANA'
            _Tipo = tpChar
            _Valor = 'SEG'
            _Default = False
          end
          object RadioButtonTag2: TRadioButtonTag
            Left = 8
            Top = 40
            Width = 113
            Height = 17
            Caption = 'Ter'#231'a'
            TabOrder = 1
            _Campo = 'FLG_DIA_SEMANA'
            _Tipo = tpChar
            _Valor = 'TER'
            _Default = False
          end
          object RadioButtonTag3: TRadioButtonTag
            Left = 120
            Top = 16
            Width = 113
            Height = 17
            Caption = 'Quarta'
            TabOrder = 2
            _Campo = 'FLG_DIA_SEMANA'
            _Tipo = tpChar
            _Valor = 'QUA'
            _Default = False
          end
          object RadioButtonTag4: TRadioButtonTag
            Left = 120
            Top = 40
            Width = 113
            Height = 17
            Caption = 'Quinta'
            TabOrder = 3
            _Campo = 'FLG_DIA_SEMANA'
            _Tipo = tpChar
            _Valor = 'QUI'
            _Default = False
          end
          object RadioButtonTag5: TRadioButtonTag
            Left = 240
            Top = 16
            Width = 113
            Height = 17
            Caption = 'Sexta'
            Checked = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 4
            TabStop = True
            _Campo = 'FLG_DIA_SEMANA'
            _Tipo = tpChar
            _Valor = 'SEX'
            _Default = True
          end
          object RadioButtonTag6: TRadioButtonTag
            Left = 240
            Top = 40
            Width = 113
            Height = 17
            Caption = 'S'#225'bado'
            TabOrder = 5
            _Campo = 'FLG_DIA_SEMANA'
            _Tipo = tpChar
            _Valor = 'SAB'
            _Default = False
          end
          object RadioButtonTag7: TRadioButtonTag
            Left = 359
            Top = 16
            Width = 86
            Height = 17
            Caption = 'Domingo'
            TabOrder = 6
            _Campo = 'FLG_DIA_SEMANA'
            _Tipo = tpChar
            _Valor = 'DOM'
            _Default = False
          end
        end
      end
    end
  end
end
