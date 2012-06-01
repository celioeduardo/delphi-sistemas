inherited frmCAD_CIDADE: TfrmCAD_CIDADE
  Left = 49
  Top = 92
  Caption = 'Cadastro de Cidade'
  ClientHeight = 174
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl3: TPanel
    Top = 118
  end
  inherited tab: TPageControl
    Height = 118
    inherited tabCadastro: TTabSheet
      inherited pnl1: TPanel
        Height = 33
        object edtCOD_CIDADE: TEditLabel
          Left = 112
          Top = 8
          Width = 129
          Height = 21
          _LabelCaption = 'C'#243'digo'
          _Campo = 'COD_CIDADE'
          LabelComponent.Width = 40
          LabelComponent.Height = 13
          LabelComponent.Caption = 'C'#243'digo'
          _NotNull = True
          _Chave = True
          _Tipo = Pesquisa
          _FormatoNumerico = 4.000000000000000000
          CharCase = ecUpperCase
          MaxLength = 4
          TabOrder = 0
          OnChange = edtCOD_CIDADEChange
          OnClickButton = edtCOD_CIDADEClickButton
          OnEnter = edtCOD_CIDADEEnter
          OnExit = edtCOD_CIDADEExit
        end
      end
      inherited pnl2: TPanel
        Top = 33
        Height = 57
        object edtNOM_CIDADE: TEditLabel
          Left = 112
          Top = 8
          Width = 377
          Height = 21
          _LabelCaption = 'Nome'
          _Campo = 'NOM_CIDADE'
          LabelComponent.Width = 33
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Nome'
          _NotNull = True
          CharCase = ecUpperCase
          TabOrder = 0
        end
        object edtNOM_UF: TEditLabel
          Left = 112
          Top = 32
          Width = 33
          Height = 21
          _LabelCaption = 'UF'
          _Campo = 'NOM_UF'
          LabelComponent.Width = 14
          LabelComponent.Height = 13
          LabelComponent.Caption = 'UF'
          _NotNull = True
          CharCase = ecUpperCase
          MaxLength = 2
          TabOrder = 1
        end
      end
    end
  end
end
