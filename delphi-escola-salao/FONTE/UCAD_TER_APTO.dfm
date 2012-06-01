inherited frmCAD_TER_APTO: TfrmCAD_TER_APTO
  Left = 39
  Top = 215
  Caption = 'Cadastro de Territ'#243'rio'
  ClientHeight = 224
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl3: TPanel
    Top = 168
  end
  inherited tab: TPageControl
    Height = 168
    inherited tabCadastro: TTabSheet
      inherited pnl1: TPanel
        Height = 33
        object txtCOD_TERRITORIO: TEditLabel
          Left = 112
          Top = 6
          Width = 121
          Height = 21
          _LabelCaption = 'C'#243'digo'
          _Campo = 'COD_TERRITORIO'
          LabelComponent.Width = 40
          LabelComponent.Height = 13
          LabelComponent.Caption = 'C'#243'digo'
          _NotNull = True
          _Chave = True
          _Tipo = Pesquisa
          _FormatoNumerico = 5.000000000000000000
          CharCase = ecUpperCase
          TabOrder = 0
          OnChange = txtCOD_TERRITORIOChange
          OnClickButton = txtCOD_TERRITORIOClickButton
          OnEnter = txtCOD_TERRITORIOEnter
          OnExit = txtCOD_TERRITORIOExit
        end
      end
      inherited pnl2: TPanel
        Top = 33
        Height = 107
        object txtNOM_RUA: TEditLabel
          Left = 112
          Top = 8
          Width = 401
          Height = 21
          _LabelCaption = 'Rua'
          _Campo = 'NOM_RUA'
          LabelComponent.Width = 22
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Rua'
          _NotNull = True
          _IsChar = True
          MaxLength = 60
          TabOrder = 0
        end
        object txtNOM_BAIRRO: TEditLabel
          Left = 112
          Top = 32
          Width = 209
          Height = 21
          _LabelCaption = 'Bairro'
          _Campo = 'NOM_BAIRRO'
          LabelComponent.Width = 35
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Bairro'
          _IsChar = True
          MaxLength = 40
          TabOrder = 1
        end
        object txtNUM_CEP: TEditLabel
          Left = 112
          Top = 56
          Width = 104
          Height = 21
          _LabelCaption = 'CEP'
          _Campo = 'NUM_CEP'
          LabelComponent.Width = 23
          LabelComponent.Height = 13
          LabelComponent.Caption = 'CEP'
          _Tipo = CEP
          _FormatoNumerico = 8.000000000000000000
          EditMask = '99999\-999;0; '
          MaxLength = 9
          TabOrder = 2
        end
        object txtNOM_CONDOMINIO: TEditLabel
          Left = 112
          Top = 80
          Width = 209
          Height = 21
          _LabelCaption = 'Condom'#237'nio'
          _Campo = 'NOM_CONDOMINIO'
          LabelComponent.Width = 68
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Condom'#237'nio'
          _IsChar = True
          MaxLength = 40
          TabOrder = 3
        end
      end
    end
  end
end
