inherited frmCAD_PROGRAMA: TfrmCAD_PROGRAMA
  Left = 51
  Top = 103
  Caption = 'Cadastro da Programa'#231#227'o da Escola'
  ClientHeight = 395
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl3: TPanel
    Top = 339
  end
  inherited tab: TPageControl
    Height = 339
    inherited tabCadastro: TTabSheet
      inherited pnl1: TPanel
        Height = 169
        object Label2: TLabel
          Left = 56
          Top = 55
          Width = 173
          Height = 48
          Caption = 
            'DICA: use o calend'#225'rio ao lado para ajud'#225'-lo a escolher o dia de' +
            ' refer'#234'ncia. '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          WordWrap = True
        end
        object lblCantico: TLabel
          Left = 112
          Top = 120
          Width = 121
          Height = 17
          AutoSize = False
          Caption = 'C'#226'ntico: 000'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Calendario: TMonthCalendar
          Left = 518
          Top = 1
          Width = 214
          Height = 167
          Align = alRight
          Date = 38225.990237627320000000
          TabOrder = 7
          OnClick = CalendarioClick
        end
        object txtDatSemana: TEditLabel
          Left = 112
          Top = 33
          Width = 120
          Height = 21
          _LabelCaption = 'Semana de'
          _Campo = 'DAT_SEMANA'
          LabelComponent.Width = 65
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Semana de'
          _NotNull = True
          _Chave = True
          _Tipo = Data
          EditMask = '99/99/0000;1; '
          MaxLength = 10
          TabOrder = 2
          Text = '  /  /    '
          OnChange = txtDatSemanaChange
          OnExit = txtDatSemanaExit
        end
        object txtCodTpParte: TEditLabel
          Left = 112
          Top = 144
          Width = 121
          Height = 21
          _LabelCaption = 'Designa'#231#227'o'
          _Campo = 'COD_TP_PARTE'
          _Edit = txtNomTpParte
          LabelComponent.Width = 66
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Designa'#231#227'o'
          _NotNull = True
          _Chave = True
          _Tipo = Pesquisa
          Enabled = False
          TabOrder = 3
          OnClickButton = txtCodTpParteClickButton
          OnExit = txtCodTpParteExit
        end
        object txtNomTpParte: TEditTag
          Left = 232
          Top = 144
          Width = 296
          Height = 22
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
          OnChange = txtNomTpParteChange
          _Tipo = tpChar
          _Default = False
        end
        object txtCodTpReuniao: TEditLabel
          Left = 112
          Top = 8
          Width = 121
          Height = 21
          _LabelCaption = 'Tipo Reuni'#227'o'
          _Campo = 'COD_TP_REUNIAO'
          _Edit = txtNomTpReuniao
          LabelComponent.Width = 74
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Tipo Reuni'#227'o'
          _NotNull = True
          _Chave = True
          _Tipo = Pesquisa
          TabOrder = 0
          OnChange = txtCodTpReuniaoChange
          OnClickButton = txtCodTpReuniaoClickButton
          OnExit = txtCodTpReuniaoExit
        end
        object txtNomTpReuniao: TEditTag
          Left = 232
          Top = 8
          Width = 294
          Height = 21
          Enabled = False
          TabOrder = 1
          _Tipo = tpChar
          _Default = False
        end
      end
      inherited pnl2: TPanel
        Top = 169
        Height = 142
        object lblDesignacao: TLabel
          Left = 112
          Top = 3
          Width = 609
          Height = 17
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object txtNomParte: TEditLabel
          Left = 112
          Top = 24
          Width = 609
          Height = 21
          _LabelCaption = 'Tema'
          _Campo = 'NOM_PARTE'
          LabelComponent.Width = 32
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Tema'
          MaxLength = 150
          TabOrder = 0
        end
        object txtMateria: TEditLabel
          Left = 112
          Top = 52
          Width = 377
          Height = 21
          _LabelCaption = 'Mat'#233'ria'
          _Campo = 'NOM_MATERIA'
          LabelComponent.Width = 42
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Mat'#233'ria'
          MaxLength = 60
          TabOrder = 1
        end
        object grpDesignacao: TGroupBox
          Left = 112
          Top = 80
          Width = 545
          Height = 57
          Caption = 'Designar somente para: '
          TabOrder = 2
          object optAmbos: TRadioButtonTag
            Left = 16
            Top = 25
            Width = 169
            Height = 17
            Caption = '&Ambos'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            _Campo = 'FLG_SEXO'
            _Tipo = tpChar
            _Valor = 'A'
            _Default = False
          end
          object optIrmaos: TRadioButtonTag
            Left = 216
            Top = 25
            Width = 113
            Height = 17
            Caption = 'Irm'#227'&os'
            Checked = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            TabStop = True
            _Campo = 'FLG_SEXO'
            _Tipo = tpChar
            _Valor = 'M'
            _Default = True
          end
          object optIrmas: TRadioButtonTag
            Left = 408
            Top = 25
            Width = 113
            Height = 17
            Caption = 'Ir&m'#227's'
            TabOrder = 2
            _Campo = 'FLG_SEXO'
            _Tipo = tpChar
            _Valor = 'F'
            _Default = False
          end
        end
        object edtNUM_ORDEM: TEditLabel
          Left = 576
          Top = 52
          Width = 81
          Height = 21
          _LabelCaption = 'Ordem'
          _Campo = 'NUM_ORDEM'
          LabelComponent.Width = 39
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Ordem'
          _Tipo = Numero
          Enabled = False
          MaxLength = 60
          TabOrder = 3
        end
      end
    end
  end
  object lvw: TListViewTag
    Left = 236
    Top = 56
    Width = 295
    Height = 105
    Columns = <
      item
        Caption = 'Codigo'
        Width = 0
      end
      item
        Caption = 'Parte'
        Width = 300
      end>
    HideSelection = False
    ReadOnly = True
    RowSelect = True
    TabOrder = 2
    ViewStyle = vsReport
    OnDblClick = lvwDblClick
  end
end
