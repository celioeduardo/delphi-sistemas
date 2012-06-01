object frmPrincipal: TfrmPrincipal
  Left = 86
  Top = 69
  Width = 655
  Height = 472
  Caption = 'Sistema'
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
    Top = 396
    Width = 639
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
    Height = 396
    Align = alLeft
    Caption = 'tlb'
    TabOrder = 1
  end
  object mnu: TMainMenu
    Left = 48
    Top = 40
    object mnuCadastro: TMenuItem
      Caption = '&Cadastros'
      object CadastrodeReuniao: TMenuItem
        Caption = 'Cadastro de &Reuni'#227'o'
        OnClick = CadastrodeReuniaoClick
      end
      object mnuCAD_PUBLICO: TMenuItem
        Caption = '&P'#250'blico'
        OnClick = mnuCAD_PUBLICOClick
      end
      object mnuCAD_TP_REUNIAO: TMenuItem
        Caption = '&Tipo de Reuni'#227'o'
        OnClick = mnuCAD_TP_REUNIAOClick
      end
      object mnuCAD_TP_PARTE: TMenuItem
        Caption = '&Tipo de Parte'
        OnClick = mnuCAD_TP_PARTEClick
      end
      object mnuCAD_MOD_REUNIAO: TMenuItem
        Caption = '&Modelo de Reuni'#227'o'
        OnClick = mnuCAD_MOD_REUNIAOClick
      end
      object mnuCAD_PROGRAMA: TMenuItem
        Caption = 'Programa'#231#227'o da &Escola'
        OnClick = mnuCAD_PROGRAMAClick
      end
      object mnuCAD_CIDADE: TMenuItem
        Caption = '&Cidade'
        OnClick = mnuCAD_CIDADEClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object mnuCAD_PONTO: TMenuItem
        Caption = 'Caracter'#237'stica Orat'#243'ria (&Ponto)'
        OnClick = mnuCAD_PONTOClick
      end
      object mnuCAD_PARTE_PONTO: TMenuItem
        Caption = 'Ponto por Parte'
        OnClick = mnuCAD_PARTE_PONTOClick
      end
      object mnuCAD_PONTO_CONCLUIDO: TMenuItem
        Caption = 'Pontos Conclu'#237'dos Anteriormente'
        OnClick = mnuCAD_PONTO_CONCLUIDOClick
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object mnuCAD_CENA: TMenuItem
        Caption = 'Ce&na'
        OnClick = mnuCAD_CENAClick
      end
      object mnuCAD_PARTE_CENA: TMenuItem
        Caption = 'Cena por Parte'
        OnClick = mnuCAD_PARTE_CENAClick
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object mnuCAD_SALA: TMenuItem
        Caption = '&Salas'
        OnClick = mnuCAD_SALAClick
      end
      object mnuSalasPorParte: TMenuItem
        Caption = 'Salas por Pa&rte'
        OnClick = mnuSalasPorParteClick
      end
      object estemunhoporTelefone1: TMenuItem
        Caption = 'Testemunho por Telefone/Carta'
        object mnuCAD_TER_APTO: TMenuItem
          Caption = 'Territ'#243'rio'
          OnClick = mnuCAD_TER_APTOClick
        end
        object mnuCAD_APTO: TMenuItem
          Caption = 'Apartamento/Casa'
          OnClick = mnuCAD_APTOClick
        end
      end
    end
    object mnuReuniao: TMenuItem
      Caption = '&Reuni'#227'o'
      object mnuMOV_REUNIAO: TMenuItem
        Caption = '&Nova Reuni'#227'o da Escola'
        OnClick = mnuMOV_REUNIAOClick
      end
    end
    object Relatrio1: TMenuItem
      Caption = '&Relat'#243'rio'
      object DesignaodaReunio1: TMenuItem
        Caption = '&Designa'#231#227'o da Reuni'#227'o'
        OnClick = DesignaodaReunio1Click
      end
      object estemunhoTelefone1: TMenuItem
        Caption = 'Testemunho Telefone'
        object mnuFolhaRosto: TMenuItem
          Caption = 'Folha de Rosto'
          OnClick = mnuFolhaRostoClick
        end
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
