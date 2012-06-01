inherited frmCAD_SALA: TfrmCAD_SALA
  Left = 48
  Top = 133
  Caption = 'Cadastro de Salas'
  ClientHeight = 176
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl3: TPanel
    Top = 120
  end
  inherited tab: TPageControl
    Height = 120
    inherited tabCadastro: TTabSheet
      inherited pnl1: TPanel
        Height = 33
        object txtCOD_SALA: TEditLabel
          Left = 112
          Top = 8
          Width = 49
          Height = 21
          _LabelCaption = 'Sala'
          _Campo = 'COD_SALA'
          LabelComponent.Width = 25
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Sala'
          _NotNull = True
          _Chave = True
          CharCase = ecUpperCase
          MaxLength = 1
          TabOrder = 0
        end
      end
      inherited pnl2: TPanel
        Top = 33
        Height = 59
        object EditLabel1: TEditLabel
          Left = 112
          Top = 8
          Width = 297
          Height = 21
          _LabelCaption = 'Descri'#231#227'o'
          _Campo = 'NOM_SALA'
          LabelComponent.Width = 56
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Descri'#231#227'o'
          _NotNull = True
          TabOrder = 0
        end
        object chkAtivo: TCheckBoxTag
          Left = 112
          Top = 35
          Width = 97
          Height = 17
          Caption = 'A&tivo'
          TabOrder = 1
          _Campo = 'FLG_ATIVO'
          _Tipo = tpChar
          _Valor = 'S'
        end
      end
    end
  end
end
