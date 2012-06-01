inherited frmLeftRigth: TfrmLeftRigth
  Left = 222
  Top = 135
  Caption = 'frmLeftRigth'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl3: TPanel
    inherited btnInclui: TBitBtn
      Visible = False
    end
    inherited btnaltera: TBitBtn
      Visible = False
    end
    inherited btnExclui: TBitBtn
      Visible = False
    end
    inherited btnLocaliza: TBitBtn
      Visible = False
    end
  end
  inherited tab: TPageControl
    inherited tabCadastro: TTabSheet
      inherited pnl2: TPanel
        object btnIncluiTodos: TSpeedButton
          Left = 352
          Top = 76
          Width = 29
          Height = 25
          Hint = 'Inclui Todos Registros Localizados'
          Caption = '->>'
          ParentShowHint = False
          ShowHint = True
        end
        object btnIncluiLinha: TSpeedButton
          Left = 352
          Top = 106
          Width = 29
          Height = 25
          Hint = 'Inclui Linha Registro Localizado'
          Caption = '->'
          ParentShowHint = False
          ShowHint = True
          OnClick = btnIncluiLinhaClick
        end
        object btnExcluiLinha: TSpeedButton
          Left = 352
          Top = 138
          Width = 29
          Height = 25
          Hint = 'Exclui Linha Registro Selecionado'
          Caption = '<-'
          ParentShowHint = False
          ShowHint = True
          OnClick = btnExcluiLinhaClick
        end
        object btnExcluiTodos: TSpeedButton
          Left = 352
          Top = 170
          Width = 29
          Height = 25
          Hint = 'Exclui Todos Registros Selecionados'
          Caption = '<<-'
          ParentShowHint = False
          ShowHint = True
        end
        object Label1: TLabel
          Left = 9
          Top = 1
          Width = 329
          Height = 17
          AutoSize = False
          Caption = 'Registros Localizados'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 395
          Top = 1
          Width = 329
          Height = 17
          AutoSize = False
          Caption = 'Registros Selecionados'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object grdLeft: TDBGrid
          Left = 9
          Top = 18
          Width = 329
          Height = 226
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = btnIncluiLinhaClick
        end
        object grdRight: TDBGrid
          Left = 395
          Top = 18
          Width = 329
          Height = 226
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = btnExcluiLinhaClick
        end
      end
    end
  end
end
