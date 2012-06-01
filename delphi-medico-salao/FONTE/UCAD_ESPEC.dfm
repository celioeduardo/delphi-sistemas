inherited frmCAD_ESPEC: TfrmCAD_ESPEC
  Left = 177
  Top = 195
  Caption = 'Especialidade'
  ClientHeight = 145
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl3: TPanel
    Top = 89
  end
  inherited tab: TPageControl
    Height = 89
    inherited tabCadastro: TTabSheet
      inherited pnl1: TPanel
        Height = 25
        object txtCodEspec: TEditLabel
          Left = 112
          Top = 3
          Width = 121
          Height = 21
          _LabelCaption = 'C'#243'digo'
          _Campo = 'COD_ESPEC'
          LabelComponent.Width = 40
          LabelComponent.Height = 13
          LabelComponent.Caption = 'C'#243'digo'
          _NotNull = True
          _Chave = True
          _Tipo = Pesquisa
          _FormatoNumerico = 4.000000000000000000
          CharCase = ecUpperCase
          TabOrder = 0
          OnChange = txtCodEspecChange
          OnClickButton = txtCodEspecClickButton
          OnEnter = txtCodEspecEnter
          OnExit = txtCodEspecExit
        end
      end
      inherited pnl2: TPanel
        Top = 25
        Height = 36
        object txtNOM_ESPEC: TEditLabel
          Left = 112
          Top = 8
          Width = 569
          Height = 21
          _LabelCaption = 'Nome'
          _Campo = 'NOM_ESPEC'
          LabelComponent.Width = 33
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Nome'
          _NotNull = True
          _IsChar = True
          MaxLength = 60
          TabOrder = 0
        end
      end
    end
  end
end
