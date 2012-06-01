inherited frmCAD_TP_PARTE: TfrmCAD_TP_PARTE
  Left = 152
  Top = 201
  Caption = 'Cadastro de Tipo de Partes (Designa'#231#245'es)'
  ClientHeight = 316
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl3: TPanel
    Top = 260
  end
  inherited tab: TPageControl
    Height = 260
    inherited tabCadastro: TTabSheet
      inherited pnl1: TPanel
        Height = 31
        object txtCOD_TP_PARTE: TEditLabel
          Left = 112
          Top = 8
          Width = 121
          Height = 21
          _LabelCaption = 'C'#243'digo'
          _Campo = 'COD_TP_PARTE'
          LabelComponent.Width = 40
          LabelComponent.Height = 13
          LabelComponent.Caption = 'C'#243'digo'
          _NotNull = True
          _Chave = True
          _Tipo = Numero
          _FormatoNumerico = 3.000000000000000000
          TabOrder = 0
          OnChange = txtCOD_TP_PARTEChange
          OnEnter = txtCOD_TP_PARTEEnter
        end
      end
      inherited pnl2: TPanel
        Top = 31
        Height = 201
        object EditLabel2: TEditLabel
          Left = 112
          Top = 9
          Width = 321
          Height = 21
          _LabelCaption = 'Nome'
          _Campo = 'NOM_TP_PARTE'
          LabelComponent.Width = 33
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Nome'
          _NotNull = True
          MaxLength = 30
          TabOrder = 0
        end
        object EditLabel3: TEditLabel
          Left = 112
          Top = 57
          Width = 121
          Height = 21
          _LabelCaption = 'Dura'#231#227'o Padr'#227'o'
          _Campo = 'NUM_DURACAO'
          LabelComponent.Width = 92
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Dura'#231#227'o Padr'#227'o'
          _Tipo = Numero
          _FormatoNumerico = 2.000000000000000000
          TabOrder = 2
        end
        object grpDesignacao: TGroupBox
          Left = 112
          Top = 78
          Width = 545
          Height = 57
          Caption = 'Designar somente para: '
          TabOrder = 3
          object optAmbos: TRadioButtonTag
            Left = 16
            Top = 25
            Width = 169
            Height = 17
            Caption = '&Ambos'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            _Campo = 'FLG_SEXO'
            _Tipo = tpChar
            _Valor = 'A'
            _Default = False
          end
          object optIrmaos: TRadioButtonTag
            Left = 216
            Top = 25
            Width = 113
            Height = 17
            Caption = 'Irm'#227'&os'
            Checked = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            TabStop = True
            _Campo = 'FLG_SEXO'
            _Tipo = tpChar
            _Valor = 'M'
            _Default = True
          end
          object optIrmas: TRadioButtonTag
            Left = 408
            Top = 25
            Width = 113
            Height = 17
            Caption = 'Ir&m'#227's'
            TabOrder = 2
            _Campo = 'FLG_SEXO'
            _Tipo = tpChar
            _Valor = 'F'
            _Default = False
          end
        end
        object grpCaracteristica: TGroupBox
          Left = 112
          Top = 142
          Width = 545
          Height = 57
          Caption = 'Escolha a caracter'#237'stica da designa'#231#227'o'
          TabOrder = 4
          object optInstrucao: TRadioButtonTag
            Left = 16
            Top = 25
            Width = 305
            Height = 17
            Caption = '&Instru'#231#227'o (Designa'#231#245'es que exigem prepara'#231#227'o)'
            Checked = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            TabStop = True
            _Campo = 'FLG_TIPO'
            _Tipo = tpChar
            _Valor = 'I'
            _Default = True
          end
          object optPrivilegio: TRadioButtonTag
            Left = 408
            Top = 25
            Width = 113
            Height = 17
            Caption = 'Privil'#233'gio'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            _Campo = 'FLG_TIPO'
            _Tipo = tpChar
            _Valor = 'P'
            _Default = False
          end
        end
        object edtNomParteResumido: TEditLabel
          Left = 112
          Top = 33
          Width = 121
          Height = 21
          _LabelCaption = 'Nome Resumido'
          _Campo = 'NOM_TP_PARTE_RESUMIDO'
          LabelComponent.Width = 93
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Nome Resumido'
          MaxLength = 10
          TabOrder = 1
        end
      end
    end
  end
end
