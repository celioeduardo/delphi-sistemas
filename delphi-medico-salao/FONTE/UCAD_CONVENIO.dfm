inherited frmCAD_CONVENIO: TfrmCAD_CONVENIO
  Left = 181
  Top = 255
  Caption = 'Conv'#234'nio'
  ClientHeight = 185
  PixelsPerInch = 120
  TextHeight = 17
  inherited pnl3: TPanel
    Top = 112
  end
  inherited tab: TPageControl
    Height = 112
    inherited tabCadastro: TTabSheet
      inherited pnl1: TPanel
        Height = 33
        object txtCOD_CONVENIO: TEditLabel
          Left = 146
          Top = 4
          Width = 159
          Height = 25
          _LabelCaption = 'C'#243'digo'
          _Campo = 'COD_CONVENIO'
          LabelComponent.Width = 49
          LabelComponent.Height = 17
          LabelComponent.Caption = 'C'#243'digo'
          _NotNull = True
          _Chave = True
          _Tipo = Pesquisa
          _FormatoNumerico = 4.000000000000000000
          CharCase = ecUpperCase
          TabOrder = 0
          OnChange = txtCOD_CONVENIOChange
          OnClickButton = txtCOD_CONVENIOClickButton
          OnEnter = txtCOD_CONVENIOEnter
          OnExit = txtCOD_CONVENIOExit
        end
      end
      inherited pnl2: TPanel
        Top = 33
        Height = 47
        object txtNOM_CONVENIO: TEditLabel
          Left = 146
          Top = 10
          Width = 745
          Height = 25
          _LabelCaption = 'Nome'
          _Campo = 'NOM_CONVENIO'
          LabelComponent.Width = 40
          LabelComponent.Height = 17
          LabelComponent.Caption = 'Nome'
          _NotNull = True
          _IsChar = True
          MaxLength = 60
          TabOrder = 0
        end
      end
      inherited txtHabilitaEdicao: TEdit
        Height = 25
      end
    end
  end
end
