object frmPrincipal: TfrmPrincipal
  Left = 256
  Top = 170
  Width = 638
  Height = 433
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
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object stb: TStatusBar
    Left = 0
    Top = 357
    Width = 622
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
    Height = 357
    Align = alLeft
    Caption = 'tlb'
    TabOrder = 1
  end
  object mnu: TMainMenu
    Left = 48
    Top = 40
    object mnuCadastro: TMenuItem
      Caption = '&Cadastros'
      object mnuCAD_MEDICO: TMenuItem
        Caption = '&M'#233'dico'
        OnClick = mnuCAD_MEDICOClick
      end
      object mnuMedicoHistorico: TMenuItem
        Caption = 'M'#233'dico/Hist'#243'&rico'
        OnClick = mnuMedicoHistoricoClick
      end
      object mnuCAD_ESPEC: TMenuItem
        Caption = '&Especialidade'
        OnClick = mnuCAD_ESPECClick
      end
      object mnuCAD_CONVENIO: TMenuItem
        Caption = '&Conv'#234'nio'
        OnClick = mnuCAD_CONVENIOClick
      end
      object mnuCAD_HOSPITAL: TMenuItem
        Caption = '&Hospital'
        OnClick = mnuCAD_HOSPITALClick
      end
      object mnuCAD_CIDADE: TMenuItem
        Caption = 'Ci&dade'
        OnClick = mnuCAD_CIDADEClick
      end
    end
    object mnuPesquisa: TMenuItem
      Caption = '&Pesquisa'
      object mnuPesqMedico: TMenuItem
        Caption = '&M'#233'dicos'
        OnClick = mnuPesqMedicoClick
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
