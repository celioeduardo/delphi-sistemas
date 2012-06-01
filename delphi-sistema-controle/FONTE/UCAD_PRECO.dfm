inherited frmCAD_PRECO_COMPRA: TfrmCAD_PRECO_COMPRA
  Left = 54
  Top = 161
  Caption = 'Cadastro de Pre'#231'o de Compra do Produto'
  ClientHeight = 187
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl3: TPanel
    Top = 131
  end
  inherited tab: TPageControl
    Height = 131
    inherited tabCadastro: TTabSheet
      inherited pnl1: TPanel
        Height = 65
        object edtCOD_PRODUTO: TEditLabel
          Left = 112
          Top = 12
          Width = 129
          Height = 21
          _LabelCaption = 'Produto'
          _Campo = 'COD_PRODUTO'
          _Edit = edtNOM_PRODUTO
          LabelComponent.Width = 44
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Produto'
          _NotNull = True
          _Chave = True
          _Tipo = Pesquisa
          _IsChar = True
          _FormatoNumerico = 4.000000000000000000
          CharCase = ecUpperCase
          TabOrder = 0
          OnClickButton = edtCOD_PRODUTOClickButton
          OnExit = edtCOD_PRODUTOExit
        end
        object edtNOM_PRODUTO: TEditTag
          Left = 240
          Top = 12
          Width = 441
          Height = 21
          CharCase = ecUpperCase
          Enabled = False
          TabOrder = 2
          _Tipo = tpChar
          _Default = False
        end
        object edtDAT_PRECO: TEditLabel
          Left = 112
          Top = 36
          Width = 120
          Height = 21
          _LabelCaption = 'Data Pre'#231'o'
          _Campo = 'DAT_PRECO'
          LabelComponent.Width = 63
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Data Pre'#231'o'
          _NotNull = True
          _Chave = True
          _Tipo = Data
          CharCase = ecUpperCase
          EditMask = '99/99/0000;1; '
          MaxLength = 10
          TabOrder = 3
          Text = '  /  /    '
        end
      end
      inherited pnl2: TPanel
        Top = 65
        Height = 38
        object edtVAL_PRECO: TEditLabel
          Left = 112
          Top = 8
          Width = 121
          Height = 21
          _LabelCaption = 'Pre'#231'o'
          _Campo = 'VAL_PRECO'
          LabelComponent.Width = 32
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Pre'#231'o'
          _NotNull = True
          _Tipo = Num_Decimal
          _FormatoNumerico = 14.200000000000000000
          CharCase = ecUpperCase
          MaxLength = 10
          TabOrder = 0
        end
      end
    end
  end
end
