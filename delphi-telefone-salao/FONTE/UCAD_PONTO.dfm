inherited frmCAD_PONTO: TfrmCAD_PONTO
  Left = 25
  Top = 77
  Caption = 'Cadastro de Caracter'#237'stica Orat'#243'ria (Ponto)'
  ClientHeight = 138
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl3: TPanel
    Top = 82
  end
  inherited tab: TPageControl
    Height = 82
    inherited tabCadastro: TTabSheet
      inherited pnl1: TPanel
        Height = 25
        object edtCOD_PONTO: TEditLabel
          Left = 112
          Top = 3
          Width = 121
          Height = 21
          _LabelCaption = 'C'#243'digo'
          _Campo = 'COD_PONTO'
          LabelComponent.Width = 40
          LabelComponent.Height = 13
          LabelComponent.Caption = 'C'#243'digo'
          _NotNull = True
          _Chave = True
          _Tipo = Pesquisa
          _FormatoNumerico = 4.000000000000000000
          CharCase = ecUpperCase
          TabOrder = 0
          OnChange = edtCOD_PONTOChange
          OnClickButton = edtCOD_PONTOClickButton
          OnEnter = edtCOD_PONTOEnter
          OnExit = edtCOD_PONTOExit
        end
      end
      inherited pnl2: TPanel
        Top = 25
        Height = 29
        object edtNOM_PONTO: TEditLabel
          Left = 112
          Top = 1
          Width = 505
          Height = 21
          _LabelCaption = 'Descri'#231#227'o'
          _Campo = 'NOM_PONTO'
          LabelComponent.Width = 56
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Descri'#231#227'o'
          _NotNull = True
          MaxLength = 80
          TabOrder = 0
        end
      end
    end
  end
end
