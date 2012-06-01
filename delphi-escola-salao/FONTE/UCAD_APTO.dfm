inherited frmCAD_APTO: TfrmCAD_APTO
  Left = 51
  Top = 89
  Caption = 'Cadastro de Apartamento/Casa'
  ClientHeight = 203
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl3: TPanel
    Top = 147
  end
  inherited tab: TPageControl
    Height = 147
    inherited tabCadastro: TTabSheet
      inherited pnl1: TPanel
        Height = 57
        object edtCOD_TERRITORIO: TEditLabel
          Left = 112
          Top = 8
          Width = 121
          Height = 21
          _LabelCaption = 'Territ'#243'rio'
          _Campo = 'COD_TERRITORIO'
          _Edit = txtNomTerritorio
          LabelComponent.Width = 53
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Territ'#243'rio'
          _NotNull = True
          _Chave = True
          _Tipo = Pesquisa
          TabOrder = 0
          OnChange = edtCOD_TERRITORIOChange
          OnClickButton = edtCOD_TERRITORIOClickButton
          OnExit = edtCOD_TERRITORIOExit
        end
        object txtNomTerritorio: TEditTag
          Left = 232
          Top = 8
          Width = 481
          Height = 21
          Enabled = False
          TabOrder = 2
          _Tipo = tpChar
          _Default = False
        end
        object edtNUM_APTO: TEditLabel
          Left = 112
          Top = 32
          Width = 121
          Height = 21
          _LabelCaption = 'Apto/Casa'
          _Campo = 'NUM_APTO'
          LabelComponent.Width = 60
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Apto/Casa'
          _NotNull = True
          _Chave = True
          _Tipo = Pesquisa
          _IsChar = True
          Enabled = False
          MaxLength = 8
          TabOrder = 3
          OnClickButton = edtNUM_APTOClickButton
        end
      end
      inherited pnl2: TPanel
        Top = 57
        Height = 62
        object edtNUM_TELEFONE: TEditLabel
          Left = 112
          Top = 8
          Width = 120
          Height = 21
          _LabelCaption = 'Telefone'
          _Campo = 'NUM_TELEFONE'
          LabelComponent.Width = 49
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Telefone'
          _NotNull = True
          _Tipo = FoneSemDDD
          EditMask = '9999\-9999;0; '
          MaxLength = 9
          TabOrder = 0
          OnChange = edtNUM_TELEFONEChange
        end
        object edtNUM_CONT: TEditLabel
          Left = 112
          Top = 32
          Width = 41
          Height = 21
          _LabelCaption = 'Sequ'#234'ncia'
          _Campo = 'NUM_CONT'
          LabelComponent.Width = 59
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Sequ'#234'ncia'
          _NotNull = True
          _Chave = True
          _Tipo = Numero
          MaxLength = 4
          TabOrder = 1
        end
        object edtNUM_TELEFONE2: TEditLabel
          Left = 320
          Top = 8
          Width = 120
          Height = 21
          _LabelCaption = 'Telefone 2'
          _Campo = 'NUM_TELEFONE2'
          LabelComponent.Width = 60
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Telefone 2'
          _Tipo = FoneSemDDD
          EditMask = '9999\-9999;0; '
          Enabled = False
          MaxLength = 9
          TabOrder = 2
          OnChange = edtNUM_TELEFONE2Change
        end
        object edtNUM_TELEFONE3: TEditLabel
          Left = 536
          Top = 8
          Width = 120
          Height = 21
          _LabelCaption = 'Telefone 3'
          _Campo = 'NUM_TELEFONE3'
          LabelComponent.Width = 60
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Telefone 3'
          _Tipo = FoneSemDDD
          EditMask = '9999\-9999;0; '
          Enabled = False
          MaxLength = 9
          TabOrder = 3
        end
      end
    end
  end
end
