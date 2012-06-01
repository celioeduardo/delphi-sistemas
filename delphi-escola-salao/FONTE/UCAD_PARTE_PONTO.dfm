inherited frmCAD_PARTE_PONTO: TfrmCAD_PARTE_PONTO
  Left = 25
  Top = 99
  Caption = 'Cadastro de Pontos por Parte'
  ClientHeight = 397
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl3: TPanel
    Top = 341
  end
  inherited tab: TPageControl
    Height = 341
    inherited tabCadastro: TTabSheet
      inherited pnl1: TPanel
        Height = 65
        object edtCOD_PARTE: TEditLabel
          Left = 104
          Top = 8
          Width = 121
          Height = 21
          _LabelCaption = 'Parte'
          _Campo = 'COD_TP_PARTE'
          _Edit = edtNOM_PARTE
          LabelComponent.Width = 30
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Parte'
          _NotNull = True
          _Chave = True
          _Tipo = Pesquisa
          _FormatoNumerico = 4.000000000000000000
          CharCase = ecUpperCase
          TabOrder = 0
          OnChange = edtCOD_PARTEChange
          OnClickButton = edtCOD_PARTEClickButton
          OnExit = edtCOD_PARTEExit
        end
        object edtNOM_PARTE: TEditTag
          Left = 224
          Top = 8
          Width = 497
          Height = 21
          Enabled = False
          TabOrder = 2
          _Tipo = tpChar
          _Default = False
        end
        object GroupBox1: TGroupBox
          Left = 104
          Top = 30
          Width = 321
          Height = 33
          Caption = 'Sexo'
          TabOrder = 3
          object optMasculino: TRadioButtonTag
            Left = 24
            Top = 14
            Width = 113
            Height = 17
            Caption = '&Masculino'
            Checked = True
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            TabStop = True
            _Campo = 'FLG_SEXO'
            _Tipo = tpChar
            _Valor = 'M'
            _Default = True
          end
          object optFeminino: TRadioButtonTag
            Left = 184
            Top = 14
            Width = 113
            Height = 17
            Caption = '&Feminino'
            TabOrder = 1
            _Campo = 'FLG_SEXO'
            _Tipo = tpChar
            _Valor = 'F'
            _Default = False
          end
        end
      end
      inherited pnl2: TPanel
        Top = 65
        Height = 248
        inherited btnIncluiTodos: TSpeedButton
          OnClick = btnIncluiTodosClick
        end
        inherited btnExcluiTodos: TSpeedButton
          OnClick = btnExcluiTodosClick
        end
      end
    end
  end
end
