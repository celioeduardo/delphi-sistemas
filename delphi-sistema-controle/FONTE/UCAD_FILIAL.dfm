inherited frmCAD_FILIAL: TfrmCAD_FILIAL
  Left = 32
  Top = 111
  Caption = 'Cadastro de Filial'
  ClientHeight = 176
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl3: TPanel
    Top = 120
  end
  inherited tab: TPageControl
    Height = 120
    inherited tabCadastro: TTabSheet
      inherited pnl1: TPanel
        Height = 57
        object edtCOD_EMPRESA: TEditLabel
          Left = 112
          Top = 8
          Width = 129
          Height = 21
          _LabelCaption = 'Empresa'
          _Campo = 'COD_EMPRESA'
          _Edit = edtNOM_EMPRESA
          LabelComponent.Width = 50
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Empresa'
          _NotNull = True
          _Chave = True
          _Tipo = Pesquisa
          _FormatoNumerico = 4.000000000000000000
          CharCase = ecUpperCase
          MaxLength = 4
          TabOrder = 0
          OnChange = edtCOD_EMPRESAChange
          OnClickButton = edtCOD_EMPRESAClickButton
          OnExit = edtCOD_EMPRESAExit
        end
        object edtNOM_EMPRESA: TEditTag
          Left = 240
          Top = 8
          Width = 481
          Height = 21
          CharCase = ecUpperCase
          Enabled = False
          TabOrder = 2
          _Tipo = tpChar
          _Default = False
        end
        object edtCOD_FILIAL: TEditLabel
          Left = 112
          Top = 32
          Width = 129
          Height = 21
          _LabelCaption = 'C'#243'digo'
          _Campo = 'COD_FILIAL'
          LabelComponent.Width = 40
          LabelComponent.Height = 13
          LabelComponent.Caption = 'C'#243'digo'
          _NotNull = True
          _Chave = True
          _Tipo = Numero
          _FormatoNumerico = 4.000000000000000000
          CharCase = ecUpperCase
          Enabled = False
          MaxLength = 4
          TabOrder = 3
        end
      end
      inherited pnl2: TPanel
        Top = 57
        Height = 35
        object edtNOM_FILIAL: TEditLabel
          Left = 112
          Top = 8
          Width = 505
          Height = 21
          _LabelCaption = 'Nome'
          _Campo = 'NOM_FILIAL'
          LabelComponent.Width = 33
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Nome'
          _NotNull = True
          CharCase = ecUpperCase
          MaxLength = 60
          TabOrder = 0
        end
      end
    end
  end
end
