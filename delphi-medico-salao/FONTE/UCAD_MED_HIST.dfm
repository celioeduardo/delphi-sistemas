inherited frmCAD_MED_HIST: TfrmCAD_MED_HIST
  Left = 113
  Top = 104
  Caption = 'Cadastro de Hist'#243'rico'
  ClientHeight = 291
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl3: TPanel
    Top = 235
  end
  inherited tab: TPageControl
    Height = 235
    inherited tabCadastro: TTabSheet
      inherited pnl1: TPanel
        Height = 56
        object txtNUM_CONT: TEditLabel
          Left = 112
          Top = 31
          Width = 121
          Height = 21
          _LabelCaption = 'Hist'#243'rico'
          _Campo = 'NUM_CONT'
          LabelComponent.Width = 49
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Hist'#243'rico'
          _NotNull = True
          _Chave = True
          _Tipo = Numero
          _FormatoNumerico = 5.000000000000000000
          CharCase = ecUpperCase
          TabOrder = 2
          OnChange = txtNUM_CONTChange
          OnEnter = txtNUM_CONTEnter
        end
        object txtCOD_MEDICO: TEditLabel
          Left = 112
          Top = 7
          Width = 121
          Height = 21
          _LabelCaption = 'M'#233'dico'
          _Campo = 'COD_MEDICO'
          _Edit = txtNOM_MEDICO
          LabelComponent.Width = 39
          LabelComponent.Height = 13
          LabelComponent.Caption = 'M'#233'dico'
          _NotNull = True
          _Chave = True
          _Tipo = Pesquisa
          CharCase = ecUpperCase
          MaxLength = 9
          TabOrder = 0
          OnChange = txtCOD_MEDICOChange
          OnClickButton = txtCOD_MEDICOClickButton
          OnExit = txtCOD_MEDICOExit
        end
        object txtNOM_MEDICO: TEditTag
          Left = 232
          Top = 7
          Width = 450
          Height = 21
          CharCase = ecUpperCase
          Enabled = False
          TabOrder = 3
          _Tipo = tpChar
          _Default = False
        end
      end
      inherited pnl2: TPanel
        Top = 56
        Height = 151
        object optCEP: TEditLabel
          Left = 112
          Top = 4
          Width = 120
          Height = 21
          _LabelCaption = 'Data Hist'#243'rico'
          _Campo = 'DAT_HISTORICO'
          LabelComponent.Width = 80
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Data Hist'#243'rico'
          _Tipo = Data
          CharCase = ecUpperCase
          EditMask = '99/99/0000;1; '
          MaxLength = 10
          TabOrder = 0
          Text = '  /  /    '
        end
        object txtNOM_HISTORICO: TMemoTag
          Left = 112
          Top = 29
          Width = 617
          Height = 117
          MaxLength = 500
          TabOrder = 1
          WantReturns = False
          LabelPosition = lpLeft
          _Campo = 'NOM_HISTORICO'
          _NotNull = False
          _Label.Width = 49
          _Label.Height = 13
          _Label.Caption = 'Hist'#243'rico'
        end
      end
    end
  end
end
