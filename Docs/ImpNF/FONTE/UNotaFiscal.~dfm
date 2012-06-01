object frmNotaFiscal: TfrmNotaFiscal
  Left = 14
  Top = 41
  Width = 749
  Height = 510
  Caption = 'Emiss'#227'o de Notas Fiscais'
  Color = clBtnFace
  Constraints.MaxWidth = 749
  Constraints.MinWidth = 749
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object edtNota: TEditLabel
    Tag = 1
    Left = 424
    Top = 8
    Width = 121
    Height = 28
    TabStop = False
    _LabelCaption = 'Nota Fiscal: '
    _Campo = 'NUMERO_NOTA'
    LabelComponent.Width = 101
    LabelComponent.Height = 20
    LabelComponent.Caption = 'Nota Fiscal: '
    LabelComponent.Font.Charset = DEFAULT_CHARSET
    LabelComponent.Font.Color = clWindowText
    LabelComponent.Font.Height = -16
    LabelComponent.Font.Name = 'MS Sans Serif'
    LabelComponent.Font.Style = [fsBold]
    LabelComponent.ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnChange = edtNotaChange
  end
  object edtPublico: TEditLabel
    Left = 90
    Top = 87
    Width = 121
    Height = 21
    _LabelCaption = 'P'#250'blico '
    _Campo = 'COD_PUBLICO'
    _Edit = edtPublicoN
    LabelComponent.Width = 38
    LabelComponent.Height = 13
    LabelComponent.Caption = 'P'#250'blico '
    _NotNull = True
    _Tipo = Pesquisa
    TabOrder = 5
    OnChange = edtPublicoChange
    OnClickButton = edtPublicoClickButton
    OnExit = edtPublicoExit
  end
  object edtPublicoN: TEditTag
    Tag = 1
    Left = 211
    Top = 87
    Width = 456
    Height = 21
    Enabled = False
    TabOrder = 6
    _Campo = 'SACADO'
    _Tipo = tpChar
    _Default = False
  end
  object grpPublico: TGroupBox
    Left = 20
    Top = 110
    Width = 651
    Height = 84
    Enabled = False
    TabOrder = 7
    object edtEndereco: TEditLabel
      Tag = 1
      Left = 71
      Top = 10
      Width = 298
      Height = 21
      _LabelCaption = 'Endere'#231'o '
      _Campo = 'ENDERECO'
      LabelComponent.Width = 49
      LabelComponent.Height = 13
      LabelComponent.Caption = 'Endere'#231'o '
      MaxLength = 80
      TabOrder = 0
    end
    object edtCIDADE: TEditLabel
      Tag = 1
      Left = 71
      Top = 34
      Width = 298
      Height = 21
      _LabelCaption = 'Cidade '
      _Campo = 'CIDADE'
      LabelComponent.Width = 36
      LabelComponent.Height = 13
      LabelComponent.Caption = 'Cidade '
      MaxLength = 60
      TabOrder = 1
    end
    object edtCNPJ: TEditLabel
      Tag = 1
      Left = 71
      Top = 58
      Width = 116
      Height = 21
      _LabelCaption = 'CNPJ '
      _Campo = 'CNPJ'
      LabelComponent.Width = 30
      LabelComponent.Height = 13
      LabelComponent.Caption = 'CNPJ '
      _Tipo = CNPJ
      EditMask = '99\.999\.999\/9999\-99;0; '
      MaxLength = 18
      TabOrder = 2
    end
    object edtIE: TEditLabel
      Tag = 1
      Left = 254
      Top = 58
      Width = 115
      Height = 21
      _LabelCaption = 'I.E. '
      _Campo = 'INSCR_ESTADUAL'
      LabelComponent.Width = 19
      LabelComponent.Height = 13
      LabelComponent.Caption = 'I.E. '
      MaxLength = 20
      TabOrder = 3
    end
    object edtCEP: TEditLabel
      Tag = 1
      Left = 440
      Top = 58
      Width = 107
      Height = 21
      _LabelCaption = 'CEP '
      _Campo = 'CEP'
      LabelComponent.Width = 24
      LabelComponent.Height = 13
      LabelComponent.Caption = 'CEP '
      _Tipo = CEP
      EditMask = '99999\-999;0; '
      MaxLength = 9
      TabOrder = 4
    end
    object edtBairro: TEditLabel
      Left = 440
      Top = 34
      Width = 201
      Height = 21
      _LabelCaption = 'Bairro '
      LabelComponent.Width = 30
      LabelComponent.Height = 13
      LabelComponent.Caption = 'Bairro '
      MaxLength = 40
      TabOrder = 5
    end
    object edtPracaPagto: TEditLabel
      Tag = 1
      Left = 440
      Top = 10
      Width = 201
      Height = 21
      _LabelCaption = 'Pra'#231'a Pag.'
      _Campo = 'PRACA_PAGTO'
      LabelComponent.Width = 53
      LabelComponent.Height = 13
      LabelComponent.Caption = 'Pra'#231'a Pag.'
      MaxLength = 40
      TabOrder = 6
    end
    object edtUF: TEditLabel
      Tag = 1
      Left = 608
      Top = 56
      Width = 33
      Height = 21
      _LabelCaption = 'UF'
      _Campo = 'UF'
      LabelComponent.Width = 14
      LabelComponent.Height = 13
      LabelComponent.Caption = 'UF'
      TabOrder = 7
    end
  end
  object edtDatEmissao: TEditLabel
    Tag = 1
    Left = 91
    Top = 197
    Width = 118
    Height = 21
    _LabelCaption = 'Data Emiss'#227'o '
    _Campo = 'DATA_EMISSAO'
    LabelComponent.Width = 68
    LabelComponent.Height = 13
    LabelComponent.Caption = 'Data Emiss'#227'o '
    _NotNull = True
    _Tipo = Data
    EditMask = '99/99/0000;1; '
    MaxLength = 10
    TabOrder = 9
    Text = '  /  /    '
  end
  object tab: TPageControl
    Left = 8
    Top = 224
    Width = 729
    Height = 205
    ActivePage = tabItem
    TabOrder = 11
    object tabItem: TTabSheet
      Caption = 'Item'
      DesignSize = (
        721
        177)
      object memDescricao: TMemoTag
        Left = 0
        Top = 0
        Width = 721
        Height = 145
        Anchors = [akLeft, akTop, akBottom]
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        LabelPosition = lpLeft
        _NotNull = False
        _Label.Width = 39
        _Label.Height = 13
        _Label.Caption = 'Servi'#231'o '
      end
      object edtValor: TEditLabel
        Left = 600
        Top = 153
        Width = 121
        Height = 21
        _LabelCaption = 'Valor'
        LabelComponent.Width = 24
        LabelComponent.Height = 13
        LabelComponent.Caption = 'Valor'
        _Tipo = Num_Decimal
        _FormatoNumerico = 14.200000000000000000
        TabOrder = 1
      end
      object btnInserir: TButton
        Left = 1
        Top = 150
        Width = 160
        Height = 25
        Caption = '&Inserir Item = (F5)'
        TabOrder = 2
        OnClick = btnInserirClick
      end
      object edtLimparItem: TButton
        Left = 165
        Top = 150
        Width = 160
        Height = 25
        Caption = 'Limpar &Item'
        TabOrder = 3
        OnClick = edtLimparItemClick
      end
      object edtLimparTodosItens: TButton
        Left = 329
        Top = 150
        Width = 160
        Height = 25
        Caption = 'Limpar &Todos Itens'
        TabOrder = 4
        OnClick = edtLimparTodosItensClick
      end
    end
    object tabItens: TTabSheet
      Caption = 'Itens'
      ImageIndex = 1
      object grd: TStringGrid
        Tag = 1
        Left = 0
        Top = 0
        Width = 721
        Height = 176
        ColCount = 2
        DefaultColWidth = 500
        DefaultRowHeight = 15
        FixedCols = 0
        RowCount = 2
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Options = [goFixedHorzLine, goRangeSelect]
        ParentFont = False
        TabOrder = 0
      end
    end
    object tabFatura: TTabSheet
      Caption = 'Fatura/Duplicata'
      ImageIndex = 2
      object grpFatura: TGroupBox
        Left = 0
        Top = 0
        Width = 281
        Height = 65
        Caption = 'Fatura'
        Enabled = False
        TabOrder = 0
        object edtValFatura: TEditLabel
          Tag = 1
          Left = 8
          Top = 36
          Width = 113
          Height = 21
          _LabelCaption = 'Valor'
          _Campo = 'VALOR_FATURA'
          LabelComponent.Width = 24
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Valor'
          _NotNull = True
          _Tipo = Num_Decimal
          _FormatoNumerico = 14.200000000000000000
          LabelPosition = lpAbove
          TabOrder = 0
        end
        object edtNumFatura: TEditLabel
          Tag = 1
          Left = 144
          Top = 36
          Width = 113
          Height = 21
          _LabelCaption = 'N'#250'mero'
          _Campo = 'NUMERO_FATURA'
          LabelComponent.Width = 37
          LabelComponent.Height = 13
          LabelComponent.Caption = 'N'#250'mero'
          _NotNull = True
          _Tipo = Numero
          _FormatoNumerico = 6.000000000000000000
          LabelPosition = lpAbove
          TabOrder = 1
        end
      end
      object grpDuplicata: TGroupBox
        Left = 2
        Top = 72
        Width = 281
        Height = 105
        Caption = 'Duplicata'
        TabOrder = 1
        object edtValorDup: TEditLabel
          Tag = 1
          Left = 8
          Top = 36
          Width = 113
          Height = 21
          _LabelCaption = 'Valor'
          _Campo = 'VALOR_DUPLICATA'
          LabelComponent.Width = 24
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Valor'
          _Tipo = Num_Decimal
          _FormatoNumerico = 14.200000000000000000
          LabelPosition = lpAbove
          TabOrder = 0
          OnExit = edtValorDupExit
        end
        object edtNumDuplicata: TEditLabel
          Tag = 1
          Left = 144
          Top = 36
          Width = 113
          Height = 21
          _LabelCaption = 'N'#250'mero'
          _Campo = 'NUMERO_DUPLICATA'
          LabelComponent.Width = 37
          LabelComponent.Height = 13
          LabelComponent.Caption = 'N'#250'mero'
          _NotNull = True
          _Tipo = Numero
          _FormatoNumerico = 6.000000000000000000
          Enabled = False
          LabelPosition = lpAbove
          TabOrder = 1
        end
        object EditLabel4: TEditLabel
          Tag = 1
          Left = 8
          Top = 76
          Width = 112
          Height = 21
          _LabelCaption = 'Vencimento'
          _Campo = 'VENCTO_DUPLI'
          LabelComponent.Width = 56
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Vencimento'
          _Tipo = Data
          EditMask = '99/99/0000;1; '
          LabelPosition = lpAbove
          MaxLength = 10
          TabOrder = 2
          Text = '  /  /    '
        end
      end
      object GroupBox1: TGroupBox
        Left = 298
        Top = 0
        Width = 415
        Height = 177
        Caption = 'Duplicata'
        TabOrder = 2
        object edtValDup1: TEditLabel
          Tag = 1
          Left = 152
          Top = 44
          Width = 113
          Height = 21
          _LabelCaption = 'Valor'
          _Campo = 'VALOR_DUPLICATA_1'
          LabelComponent.Width = 24
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Valor'
          _Tipo = Num_Decimal
          _FormatoNumerico = 14.200000000000000000
          LabelPosition = lpAbove
          TabOrder = 1
        end
        object edtDup1: TEditLabel
          Tag = 1
          Left = 16
          Top = 44
          Width = 113
          Height = 21
          _LabelCaption = 'N'#250'mero'
          _Campo = 'DUPLICATA_1'
          LabelComponent.Width = 37
          LabelComponent.Height = 13
          LabelComponent.Caption = 'N'#250'mero'
          _Tipo = Numero
          _FormatoNumerico = 6.000000000000000000
          LabelPosition = lpAbove
          TabOrder = 0
        end
        object edtDatVencDup1: TEditLabel
          Tag = 1
          Left = 288
          Top = 44
          Width = 112
          Height = 21
          _LabelCaption = 'Vencimento'
          _Campo = 'VENCTO_DUPLI_1'
          LabelComponent.Width = 56
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Vencimento'
          _Tipo = Data
          EditMask = '99/99/0000;1; '
          LabelPosition = lpAbove
          MaxLength = 10
          TabOrder = 2
          Text = '  /  /    '
        end
        object edtDup2: TEditLabel
          Tag = 1
          Left = 16
          Top = 67
          Width = 113
          Height = 21
          _LabelCaption = 'N'#250'mero'
          _Campo = 'DUPLICATA_2'
          LabelComponent.Width = 37
          LabelComponent.Height = 13
          LabelComponent.Caption = 'N'#250'mero'
          _Tipo = Numero
          _FormatoNumerico = 6.000000000000000000
          LabelPosition = lpAbove
          TabOrder = 3
        end
        object edtValDup2: TEditLabel
          Tag = 1
          Left = 152
          Top = 67
          Width = 113
          Height = 21
          _LabelCaption = 'Valor'
          _Campo = 'VALOR_DUPLICATA_2'
          LabelComponent.Width = 24
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Valor'
          _Tipo = Num_Decimal
          _FormatoNumerico = 14.200000000000000000
          LabelPosition = lpAbove
          TabOrder = 4
        end
        object edtDatVencDup2: TEditLabel
          Tag = 1
          Left = 288
          Top = 67
          Width = 112
          Height = 21
          _LabelCaption = 'Vencimento'
          _Campo = 'VENCTO_DUPLI_2'
          LabelComponent.Width = 56
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Vencimento'
          _Tipo = Data
          EditMask = '99/99/0000;1; '
          LabelPosition = lpAbove
          MaxLength = 10
          TabOrder = 5
          Text = '  /  /    '
        end
        object edtDup3: TEditLabel
          Tag = 1
          Left = 16
          Top = 91
          Width = 113
          Height = 21
          _LabelCaption = 'N'#250'mero'
          _Campo = 'DUPLICATA_3'
          LabelComponent.Width = 37
          LabelComponent.Height = 13
          LabelComponent.Caption = 'N'#250'mero'
          _Tipo = Numero
          _FormatoNumerico = 6.000000000000000000
          LabelPosition = lpAbove
          TabOrder = 6
        end
        object edtValDup3: TEditLabel
          Tag = 1
          Left = 152
          Top = 91
          Width = 113
          Height = 21
          _LabelCaption = 'Valor'
          _Campo = 'VALOR_DUPLICATA_3'
          LabelComponent.Width = 24
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Valor'
          _Tipo = Num_Decimal
          _FormatoNumerico = 14.200000000000000000
          LabelPosition = lpAbove
          TabOrder = 7
        end
        object edtDatVencDup3: TEditLabel
          Tag = 1
          Left = 288
          Top = 91
          Width = 112
          Height = 21
          _LabelCaption = 'Vencimento'
          _Campo = 'VENCTO_DUPLI_3'
          LabelComponent.Width = 56
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Vencimento'
          _Tipo = Data
          EditMask = '99/99/0000;1; '
          LabelPosition = lpAbove
          MaxLength = 10
          TabOrder = 8
          Text = '  /  /    '
        end
        object edtDup4: TEditLabel
          Tag = 1
          Left = 16
          Top = 115
          Width = 113
          Height = 21
          _LabelCaption = 'N'#250'mero'
          _Campo = 'DUPLICATA_4'
          LabelComponent.Width = 37
          LabelComponent.Height = 13
          LabelComponent.Caption = 'N'#250'mero'
          _Tipo = Numero
          _FormatoNumerico = 6.000000000000000000
          LabelPosition = lpAbove
          TabOrder = 9
        end
        object edtValDup4: TEditLabel
          Tag = 1
          Left = 152
          Top = 115
          Width = 113
          Height = 21
          _LabelCaption = 'Valor'
          _Campo = 'VALOR_DUPLICATA_4'
          LabelComponent.Width = 24
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Valor'
          _Tipo = Num_Decimal
          _FormatoNumerico = 14.200000000000000000
          LabelPosition = lpAbove
          TabOrder = 10
        end
        object edtDatVencDup4: TEditLabel
          Tag = 1
          Left = 288
          Top = 115
          Width = 112
          Height = 21
          _LabelCaption = 'Vencimento'
          _Campo = 'VENCTO_DUPLI_4'
          LabelComponent.Width = 56
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Vencimento'
          _Tipo = Data
          EditMask = '99/99/0000;1; '
          LabelPosition = lpAbove
          MaxLength = 10
          TabOrder = 11
          Text = '  /  /    '
        end
        object edtDup5: TEditLabel
          Tag = 1
          Left = 16
          Top = 139
          Width = 113
          Height = 21
          _LabelCaption = 'N'#250'mero'
          _Campo = 'DUPLICATA_5'
          LabelComponent.Width = 37
          LabelComponent.Height = 13
          LabelComponent.Caption = 'N'#250'mero'
          _Tipo = Numero
          _FormatoNumerico = 6.000000000000000000
          LabelPosition = lpAbove
          TabOrder = 12
        end
        object edtValDup5: TEditLabel
          Tag = 1
          Left = 152
          Top = 139
          Width = 113
          Height = 21
          _LabelCaption = 'Valor'
          _Campo = 'VALOR_DUPLICATA_5'
          LabelComponent.Width = 24
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Valor'
          _Tipo = Num_Decimal
          _FormatoNumerico = 14.200000000000000000
          LabelPosition = lpAbove
          TabOrder = 13
        end
        object edtDatVencDup5: TEditLabel
          Tag = 1
          Left = 288
          Top = 139
          Width = 112
          Height = 21
          _LabelCaption = 'Vencimento'
          _Campo = 'VENCTO_DUPLI_5'
          LabelComponent.Width = 56
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Vencimento'
          _Tipo = Data
          EditMask = '99/99/0000;1; '
          LabelPosition = lpAbove
          MaxLength = 10
          TabOrder = 14
          Text = '  /  /    '
        end
      end
    end
  end
  object btnEmitirNF: TButton
    Left = 552
    Top = 432
    Width = 185
    Height = 41
    Caption = '&Emitir N.F.'
    TabOrder = 12
    OnClick = btnEmitirNFClick
  end
  object edtCodLayout: TEditLabel
    Left = 90
    Top = 63
    Width = 121
    Height = 21
    _LabelCaption = 'Layout'
    _Campo = 'COD_LAYOUT'
    _Edit = edtNomLayout
    LabelComponent.Width = 32
    LabelComponent.Height = 13
    LabelComponent.Caption = 'Layout'
    _NotNull = True
    _Tipo = Pesquisa
    Enabled = False
    TabOrder = 3
    OnClickButton = edtPublicoClickButton
    OnExit = edtCodLayoutExit
  end
  object edtNomLayout: TEditTag
    Left = 211
    Top = 63
    Width = 456
    Height = 21
    Enabled = False
    TabOrder = 4
    _Tipo = tpChar
    _Default = False
  end
  object edtCodEmpresa: TEditLabel
    Left = 90
    Top = 39
    Width = 121
    Height = 21
    _LabelCaption = 'Empresa'
    _Campo = 'COD_EMPRESA'
    _Edit = edtNomEmpresa
    LabelComponent.Width = 41
    LabelComponent.Height = 13
    LabelComponent.Caption = 'Empresa'
    _NotNull = True
    _Tipo = Pesquisa
    TabOrder = 1
    OnChange = edtCodEmpresaChange
    OnClickButton = edtPublicoClickButton
    OnExit = edtCodEmpresaExit
  end
  object edtNomEmpresa: TEditTag
    Left = 211
    Top = 39
    Width = 456
    Height = 21
    Enabled = False
    TabOrder = 2
    _Tipo = tpChar
    _Default = False
  end
  object edtValTotal: TEditLabel
    Tag = 1
    Left = 549
    Top = 197
    Width = 118
    Height = 21
    _LabelCaption = 'Valor Total'
    _Campo = 'VALOR_TOTAL_NOTA'
    LabelComponent.Width = 51
    LabelComponent.Height = 13
    LabelComponent.Caption = 'Valor Total'
    _NotNull = True
    _Tipo = Num_Decimal
    _FormatoNumerico = 14.200000000000000000
    TabOrder = 10
    OnChange = edtValTotalChange
  end
  object edtSerieNF: TEditLabel
    Tag = 1
    Left = 632
    Top = 8
    Width = 33
    Height = 28
    TabStop = False
    _LabelCaption = 'S'#233'rie'
    LabelComponent.Width = 43
    LabelComponent.Height = 20
    LabelComponent.Caption = 'S'#233'rie'
    LabelComponent.Font.Charset = DEFAULT_CHARSET
    LabelComponent.Font.Color = clWindowText
    LabelComponent.Font.Height = -16
    LabelComponent.Font.Name = 'MS Sans Serif'
    LabelComponent.Font.Style = [fsBold]
    LabelComponent.ParentFont = False
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 15
    OnChange = edtNotaChange
  end
end
