inherited frmCAD_PARTE_CENA: TfrmCAD_PARTE_CENA
  Left = 39
  Top = 84
  Caption = 'Cadastro de Cenas por Parte'
  ClientHeight = 367
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl3: TPanel
    Top = 311
  end
  inherited tab: TPageControl
    Height = 311
    inherited tabCadastro: TTabSheet
      inherited pnl1: TPanel
        Height = 33
        object edtCOD_PARTE: TEditLabel
          Left = 104
          Top = 8
          Width = 121
          Height = 21
          _LabelCaption = 'Parte'
          _Campo = 'COD_TP_PARTE'
          _Edit = edtNOM_PARTE
          LabelComponent.Width = 30
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Parte'
          _NotNull = True
          _Chave = True
          _Tipo = Pesquisa
          _FormatoNumerico = 4.000000000000000000
          CharCase = ecUpperCase
          TabOrder = 0
          OnChange = edtCOD_PARTEChange
          OnClickButton = edtCOD_PARTEClickButton
          OnExit = edtCOD_PARTEExit
        end
        object edtNOM_PARTE: TEditTag
          Left = 224
          Top = 8
          Width = 497
          Height = 21
          Enabled = False
          TabOrder = 2
          _Tipo = tpChar
          _Default = False
        end
      end
      inherited pnl2: TPanel
        Top = 33
        Height = 250
        inherited btnIncluiTodos: TSpeedButton
          OnClick = btnIncluiTodosClick
        end
        inherited btnExcluiTodos: TSpeedButton
          OnClick = btnExcluiTodosClick
        end
      end
    end
  end
end
