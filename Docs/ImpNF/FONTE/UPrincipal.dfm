object frmPrincipal: TfrmPrincipal
  Left = 110
  Top = 39
  Width = 655
  Height = 480
  Caption = 'Sistema de Controle'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Microsoft Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = mnu
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object stb: TStatusBar
    Left = 0
    Top = 406
    Width = 647
    Height = 20
    Panels = <
      item
        Style = psOwnerDraw
        Text = 'Mensagem'
        Width = 450
      end
      item
        Text = 'Impressora:'
        Width = 250
      end
      item
        Alignment = taCenter
        Text = '29/05/2004'
        Width = 20
      end>
  end
  object tlbLeft: TToolBar
    Left = 0
    Top = 0
    Width = 41
    Height = 406
    Align = alLeft
    Caption = 'tlb'
    TabOrder = 1
  end
  object mnu: TMainMenu
    Left = 48
    Top = 40
    object mnuCadastro: TMenuItem
      Caption = '&Cadastros'
      object Pblicos1: TMenuItem
        Caption = '&P'#250'blicos'
        OnClick = Pblicos1Click
      end
      object mnuCAD_LAYOUT_NF: TMenuItem
        Caption = '&Layout da N.F.'
        OnClick = mnuCAD_LAYOUT_NFClick
      end
      object mnuCAD_LAY_NF_CAMPO: TMenuItem
        Caption = '&Campos do Layout da N.F.'
        OnClick = mnuCAD_LAY_NF_CAMPOClick
      end
      object Empresa1: TMenuItem
        Caption = '&Empresa'
        OnClick = Empresa1Click
      end
      object LayoutdeNFparaEmpresa1: TMenuItem
        Caption = 'Layout de N.F. para Empresa'
        OnClick = LayoutdeNFparaEmpresa1Click
      end
    end
    object mnuNF: TMenuItem
      Caption = '&Nota Fiscal'
      object SequnciaNF1: TMenuItem
        Caption = '&Sequ'#234'ncia N.F.'
        OnClick = SequnciaNF1Click
      end
      object mnuEmissaoNF: TMenuItem
        Caption = '&Emiss'#227'o de N.F.'
        OnClick = mnuEmissaoNFClick
      end
    end
    object mnuSair: TMenuItem
      Caption = 'Sai&r'
      OnClick = mnuSairClick
    end
  end
  object appExcept: TApplicationEvents
    OnException = appExceptException
    Left = 80
    Top = 40
  end
end
