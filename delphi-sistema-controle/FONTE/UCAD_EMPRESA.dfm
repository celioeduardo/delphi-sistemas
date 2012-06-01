inherited frmCAD_EMPRESA: TfrmCAD_EMPRESA
  Left = 54
  Top = 249
  Caption = 'Cadastro de Empresa'
  ClientHeight = 153
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl3: TPanel
    Top = 97
  end
  inherited tab: TPageControl
    Height = 97
    inherited tabCadastro: TTabSheet
      inherited pnl1: TPanel
        Height = 33
        object edtCOD_EMPRESA: TEditLabel
          Left = 112
          Top = 8
          Width = 121
          Height = 21
          _LabelCaption = 'C'#243'digo'
          _Campo = 'COD_EMPRESA'
          LabelComponent.Width = 40
          LabelComponent.Height = 13
          LabelComponent.Caption = 'C'#243'digo'
          _NotNull = True
          _Chave = True
          _Tipo = Pesquisa
          CharCase = ecUpperCase
          TabOrder = 0
          OnChange = edtCOD_EMPRESAChange
          OnClickButton = edtCOD_EMPRESAClickButton
          OnEnter = edtCOD_EMPRESAEnter
        end
      end
      inherited pnl2: TPanel
        Top = 33
        Height = 36
        object edtNOM_EMPRESA: TEditLabel
          Left = 112
          Top = 8
          Width = 473
          Height = 21
          _LabelCaption = 'Nome'
          _Campo = 'NOM_EMPRESA'
          LabelComponent.Width = 33
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Nome'
          _NotNull = True
          CharCase = ecUpperCase
          TabOrder = 0
        end
      end
    end
  end
end
