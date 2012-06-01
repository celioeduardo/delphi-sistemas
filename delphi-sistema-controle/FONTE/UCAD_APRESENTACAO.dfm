inherited frmCAD_APRESENTACAO: TfrmCAD_APRESENTACAO
  Left = 49
  Top = 216
  Caption = 'Cadastro de Apresenta'#231#227'o'
  ClientHeight = 175
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl3: TPanel
    Top = 119
  end
  inherited tab: TPageControl
    Height = 119
    inherited tabCadastro: TTabSheet
      inherited pnl1: TPanel
        Height = 33
        object edtCOD_APRESENTACAO: TEditLabel
          Left = 112
          Top = 8
          Width = 121
          Height = 21
          _LabelCaption = 'C'#243'digo'
          _Campo = 'COD_APRESENTACAO'
          LabelComponent.Width = 40
          LabelComponent.Height = 13
          LabelComponent.Caption = 'C'#243'digo'
          _NotNull = True
          _Chave = True
          _Tipo = Pesquisa
          CharCase = ecUpperCase
          MaxLength = 6
          TabOrder = 0
          OnChange = edtCOD_APRESENTACAOChange
          OnClickButton = edtCOD_APRESENTACAOClickButton
          OnEnter = edtCOD_APRESENTACAOEnter
        end
      end
      inherited pnl2: TPanel
        Top = 33
        Height = 58
        object edtNOM_APRESENTACAO: TEditLabel
          Left = 112
          Top = 8
          Width = 473
          Height = 21
          _LabelCaption = 'Nome'
          _Campo = 'NOM_APRESENTACAO'
          LabelComponent.Width = 33
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Nome'
          _NotNull = True
          CharCase = ecUpperCase
          MaxLength = 60
          TabOrder = 0
        end
        object edtNUM_FATOR_CONV: TEditLabel
          Left = 112
          Top = 32
          Width = 121
          Height = 21
          _LabelCaption = 'Fator Conv.'
          _Campo = 'NUM_FATOR_CONV'
          LabelComponent.Width = 67
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Fator Conv.'
          _NotNull = True
          _Tipo = Num_Decimal
          _FormatoNumerico = 14.200000000000000000
          CharCase = ecUpperCase
          MaxLength = 80
          TabOrder = 1
        end
      end
    end
  end
end
