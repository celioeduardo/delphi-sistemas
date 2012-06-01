object frmVEN_PEDIDO: TfrmVEN_PEDIDO
  Left = 28
  Top = 27
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Preenchimento de Pedido/Licita'#231#227'o'
  ClientHeight = 464
  ClientWidth = 741
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object tab: TPageControl
    Left = 0
    Top = 0
    Width = 741
    Height = 465
    ActivePage = tabProduto
    Align = alTop
    TabOrder = 0
    TabStop = False
    object tabPreenchimento: TTabSheet
      Caption = 'Preenchimento'
      ImageIndex = 1
      DesignSize = (
        733
        437)
      object lblValorTotal: TLabel
        Left = 248
        Top = 414
        Width = 353
        Height = 19
        Alignment = taCenter
        AutoSize = False
        Caption = 'Valor Fechado: 0,00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 8
        Top = 387
        Width = 105
        Height = 16
        Caption = 'Qtd. Pedida Total:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 8
        Top = 404
        Width = 116
        Height = 16
        Caption = 'Qtd. Atendida Total:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 248
        Top = 388
        Width = 75
        Height = 16
        Caption = '% Atendido:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblQtdPedidaTotal: TLabel
        Left = 136
        Top = 387
        Width = 91
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0,000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object lblQtdAtendidaTotal: TLabel
        Left = 136
        Top = 404
        Width = 91
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0,000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object lblPerAtendimento: TLabel
        Left = 328
        Top = 388
        Width = 83
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0,00%'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 440
        Top = 388
        Width = 73
        Height = 16
        Caption = '% Fechado:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblPerFechado: TLabel
        Left = 512
        Top = 388
        Width = 91
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0,00%'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 8
        Top = 420
        Width = 115
        Height = 16
        Caption = 'Qtd. Fechada Total:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object lblQtdFechadaTotal: TLabel
        Left = 136
        Top = 420
        Width = 91
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0,000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object grdPed: TDBGrid
        Left = 0
        Top = 88
        Width = 730
        Height = 297
        Anchors = [akLeft, akTop, akRight, akBottom]
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 7
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = grdPedDblClick
        OnKeyDown = grdPedKeyDown
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'COD_PRODUTO'
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'd.'
            Width = 35
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOM_PRODUTO'
            Title.Caption = 'Produto'
            Width = 270
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOM_FORNECEDOR'
            Title.Caption = 'Fornecedor'
            Width = 130
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'QTD_PEDIDA'
            Title.Alignment = taRightJustify
            Title.Caption = 'Qtd. Pedido'
            Width = 70
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'QTD_ATENDIDA'
            Title.Alignment = taRightJustify
            Title.Caption = 'Qtd. Atend.'
            Width = 70
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'QTD_FECHADA'
            Title.Caption = 'Qtd. Fechada'
            Width = 70
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'VAL_UNITARIO'
            Title.Alignment = taRightJustify
            Title.Caption = 'Pre'#231'o'
            Width = 70
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'VAL_TOTAL'
            Title.Alignment = taRightJustify
            Title.Caption = 'Pre'#231'o Total'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VAL_FATOR'
            Title.Caption = 'Pre'#231'o Un.'
            Width = 70
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'PER_MARGEM'
            Title.Alignment = taRightJustify
            Title.Caption = '% Margem'
            Visible = True
          end>
      end
      object btnSair: TBitBtn
        Left = 614
        Top = 401
        Width = 97
        Height = 33
        Caption = '  &Sair'
        TabOrder = 9
        OnClick = btnSairClick
        Glyph.Data = {
          AA030000424DAA03000000000000360000002800000011000000110000000100
          18000000000074030000C40E0000C40E00000000000000000000000000000000
          00000000000000000000000000000000000000000000090E003856001A280004
          070000000000000000000000000000000000000000000000070A00162300091D
          00101F00131F00111B0021340073AF006EA8006FA900659B004F79003553000F
          1700000000000000000000000E1C000006046402000400000000000000000E16
          0071AB00699E00609200679B006BA20072AC0B527800002F0102320301310201
          370B00290315981F1DB42C044306000000000C180075AE006DA2005782005B89
          006597005E8E0A4F720021A93333CC4E31C94B31C84A31C84B2FBE482FBD4732
          CB4D1F9B2B001F180075B20071A6005A86005F8D00689B0061920A5174002FB1
          4748DB6D45D76945D76945D76942D46541D26345D7694AE46C18963F006EAF00
          75A9005C8800618F006C9E0064940A53760024A73738CC5536C85236C85133C5
          4D4FE5795FF6903FD661078D05002519005B8E005D8900618E0064920070A100
          67970A557800006600016D02016C01016E0600550048D76E24B8360071000000
          00000A1A0087BB0079A800628E0068950074A5006A9A0A577A00000000000000
          00000000071B000008038302015A01000000000000000C17199BC51787AF0063
          90006A980078A9006E9D0A597C0000000000000000000000131B000009002800
          0000006C49344C301A1C2322008AC30085B9006692006D9B007CAD0071A00A5B
          7E00000000000000000000000B140700030000000000005D43789D74AD6C6398
          008FC2008DC000699400719E0080B10075A30A5D80000000000000000000005F
          2829FFAD30C26D25000000000010000BE500062E009BCD0091C4006B960073A0
          0084B40077A60A5F820000001F00006000004B271AA6230A33B24C0CD9671660
          1A000015D7000C6E00A0CD0095C8006D980076A30087B70079A70A628400B285
          B8E1A8BAA58FD76964CE000000A24F12EA9641A4A177FF95217B472A009ED700
          99CB006D970075A2008DBD0089B90A6284000100000000004F321B6E5F4E0000
          0000001E1942FF00A6CB00002B00070E00A7DD0099CB008BBA009CCD009FD200
          AAE00B6B9000000000000000000000000000001C2B001727000C22000A120015
          1E00284000B2E900A9DD00A4D9008EC1006C96004664000E1700000000000000
          00000000000000000000000000000000000000000000090F004967001D2D0002
          0700000000000000000000000000}
      end
      object edtNUM_PEDIDO: TEditLabel
        Left = 112
        Top = 8
        Width = 129
        Height = 21
        _LabelCaption = 'N'#250'mero'
        LabelComponent.Width = 37
        LabelComponent.Height = 13
        LabelComponent.Caption = 'N'#250'mero'
        _NotNull = True
        _Chave = True
        _Tipo = Numero
        _FormatoNumerico = 9.000000000000000000
        CharCase = ecUpperCase
        TabOrder = 0
        OnEnter = edtNUM_PEDIDOEnter
      end
      object edtDAT_PEDIDO: TEditLabel
        Left = 112
        Top = 56
        Width = 128
        Height = 21
        _LabelCaption = 'Data'
        LabelComponent.Width = 23
        LabelComponent.Height = 13
        LabelComponent.Caption = 'Data'
        _NotNull = True
        _Chave = True
        _Tipo = Data
        _FormatoNumerico = 9.000000000000000000
        CharCase = ecUpperCase
        EditMask = '99/99/0000;1; '
        Enabled = False
        MaxLength = 10
        TabOrder = 4
        Text = '  /  /    '
        OnEnter = edtDAT_PEDIDOEnter
      end
      object edtCOD_CLIENTE: TEditLabel
        Left = 112
        Top = 32
        Width = 129
        Height = 21
        _LabelCaption = 'Cliente'
        _Campo = 'COD_CLIENTE'
        _Edit = edtNOM_CLIENTE
        LabelComponent.Width = 32
        LabelComponent.Height = 13
        LabelComponent.Caption = 'Cliente'
        _NotNull = True
        _Chave = True
        _Tipo = Pesquisa
        _FormatoNumerico = 4.000000000000000000
        CharCase = ecUpperCase
        Enabled = False
        TabOrder = 2
        OnClickButton = edtCOD_CLIENTEClickButton
        OnExit = edtCOD_CLIENTEExit
      end
      object edtNOM_CLIENTE: TEditTag
        Left = 239
        Top = 32
        Width = 441
        Height = 21
        CharCase = ecUpperCase
        Enabled = False
        TabOrder = 3
        _Tipo = tpChar
        _Default = False
      end
      object btnGravar: TButton
        Left = 248
        Top = 56
        Width = 79
        Height = 22
        Caption = '&Gravar'
        Enabled = False
        TabOrder = 5
        OnClick = btnGravarClick
      end
      object txtHabilitaEdicao: TEdit
        Left = -568
        Top = 154
        Width = 121
        Height = 21
        TabOrder = 1
        Text = 'txtHabilitaEdicao'
        OnEnter = txtHabilitaEdicaoEnter
      end
      object btnAlterar: TButton
        Left = 336
        Top = 56
        Width = 79
        Height = 22
        Caption = '&Alterar'
        Enabled = False
        TabOrder = 6
        OnClick = btnAlterarClick
      end
      object btnExcluir: TButton
        Left = 424
        Top = 56
        Width = 79
        Height = 22
        Caption = '&Excluir'
        Enabled = False
        TabOrder = 10
        OnClick = btnExcluirClick
      end
    end
    object tabProduto: TTabSheet
      Caption = 'Produto'
      DesignSize = (
        733
        437)
      object grdProd: TDBGrid
        Left = 0
        Top = 104
        Width = 730
        Height = 145
        Anchors = [akLeft, akTop, akRight, akBottom]
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 13
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = grdProdCellClick
        OnDblClick = grdProdDblClick
        OnKeyUp = grdProdKeyUp
        Columns = <
          item
            Alignment = taRightJustify
            ButtonStyle = cbsEllipsis
            Expanded = False
            FieldName = 'COD_PRODUTO'
            Title.Alignment = taRightJustify
            Title.Caption = 'C'#243'd.'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOM_PRODUTO'
            Title.Caption = 'Produto'
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOM_FORNECEDOR'
            Title.Caption = 'Fornecedor'
            Width = 150
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'QTD_FISICO'
            Title.Alignment = taRightJustify
            Title.Caption = 'Estoque'
            Width = 60
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'VAL_CUSTO'
            Title.Alignment = taRightJustify
            Title.Caption = 'Custo'
            Width = 60
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'VAL_CUSTO_FATOR'
            Title.Alignment = taRightJustify
            Title.Caption = 'Custo Un.'
            Width = 60
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'VAL_ULT_ENTR'
            Title.Alignment = taRightJustify
            Title.Caption = 'Val. Ult. Entr.'
            Width = 80
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'VAL_PRECO_COMPRA'
            Title.Alignment = taRightJustify
            Title.Caption = 'Compra'
            Width = 80
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'VAL_COMPRA_FATOR'
            Title.Alignment = taRightJustify
            Title.Caption = 'Compra Un.'
            Width = 60
            Visible = True
          end>
      end
      object edtCOD_FORNECEDOR: TEditLabel
        Left = 112
        Top = 80
        Width = 129
        Height = 21
        _LabelCaption = 'Fornecedor'
        _Campo = 'COD_FORNECEDOR'
        _Edit = edtNOM_FORNECEDOR
        LabelComponent.Width = 54
        LabelComponent.Height = 13
        LabelComponent.Caption = 'Fornecedor'
        _Chave = True
        _Tipo = Pesquisa
        _FormatoNumerico = 4.000000000000000000
        CharCase = ecUpperCase
        TabOrder = 6
        OnClickButton = edtCOD_FORNECEDORClickButton
        OnExit = edtCOD_FORNECEDORExit
      end
      object edtCOD_APRESENTACAO: TEditLabel
        Left = 112
        Top = 56
        Width = 129
        Height = 21
        _LabelCaption = 'Apresenta'#231#227'o'
        _Campo = 'COD_APRESENTACAO'
        _Edit = edtNOM_APRESENTACAO
        LabelComponent.Width = 66
        LabelComponent.Height = 13
        LabelComponent.Caption = 'Apresenta'#231#227'o'
        _Chave = True
        _Tipo = Pesquisa
        _FormatoNumerico = 4.000000000000000000
        CharCase = ecUpperCase
        TabOrder = 4
        OnClickButton = edtCOD_APRESENTACAOClickButton
        OnExit = edtCOD_APRESENTACAOExit
      end
      object edtCOD_P_ATIVO_PESQ: TEditLabel
        Left = 112
        Top = 32
        Width = 129
        Height = 21
        _LabelCaption = 'Princ'#237'pio Ativo'
        _Campo = 'COD_P_ATIVO'
        _Edit = edtNOM_P_ATIVO_PESQ
        LabelComponent.Width = 69
        LabelComponent.Height = 13
        LabelComponent.Caption = 'Princ'#237'pio Ativo'
        _Chave = True
        _Tipo = Pesquisa
        _FormatoNumerico = 4.000000000000000000
        CharCase = ecUpperCase
        TabOrder = 2
        OnClickButton = edtCOD_P_ATIVO_PESQClickButton
        OnExit = edtCOD_P_ATIVO_PESQExit
      end
      object edtCOD_PRODUTO_PESQ: TEditLabel
        Left = 112
        Top = 8
        Width = 129
        Height = 21
        _LabelCaption = 'Produto'
        _Campo = 'COD_PRODUTO'
        _Edit = edtNOM_PRODUTO_PESQ
        LabelComponent.Width = 37
        LabelComponent.Height = 13
        LabelComponent.Caption = 'Produto'
        _Chave = True
        _Tipo = Pesquisa
        _FormatoNumerico = 4.000000000000000000
        CharCase = ecUpperCase
        TabOrder = 0
        OnClickButton = edtCOD_PRODUTO_PESQClickButton
        OnExit = edtCOD_PRODUTO_PESQExit
      end
      object edtNOM_PRODUTO_PESQ: TEditTag
        Left = 239
        Top = 8
        Width = 441
        Height = 21
        CharCase = ecUpperCase
        Enabled = False
        TabOrder = 1
        _Tipo = tpChar
        _Default = False
      end
      object edtNOM_P_ATIVO_PESQ: TEditTag
        Left = 239
        Top = 32
        Width = 442
        Height = 21
        CharCase = ecUpperCase
        Enabled = False
        TabOrder = 3
        _Tipo = tpChar
        _Default = False
      end
      object edtNOM_APRESENTACAO: TEditTag
        Left = 239
        Top = 56
        Width = 441
        Height = 21
        CharCase = ecUpperCase
        Enabled = False
        TabOrder = 5
        _Tipo = tpChar
        _Default = False
      end
      object edtNOM_FORNECEDOR: TEditTag
        Left = 239
        Top = 80
        Width = 298
        Height = 21
        CharCase = ecUpperCase
        Enabled = False
        TabOrder = 7
        _Tipo = tpChar
        _Default = False
      end
      object btnPesquisaProdutos: TButton
        Left = 541
        Top = 79
        Width = 140
        Height = 25
        Caption = '&Pesquisa Produtos'
        TabOrder = 8
        OnClick = btnPesquisaProdutosClick
      end
      object edtCOD_PRODUTO: TEditLabel
        Left = 112
        Top = 256
        Width = 129
        Height = 21
        _LabelCaption = 'Produto'
        _Campo = 'COD_PRODUTO'
        _Edit = edtNOM_PRODUTO
        LabelComponent.Width = 37
        LabelComponent.Height = 13
        LabelComponent.Caption = 'Produto'
        _Chave = True
        _Tipo = Pesquisa
        _FormatoNumerico = 4.000000000000000000
        CharCase = ecUpperCase
        Enabled = False
        TabOrder = 14
        OnClickButton = edtCOD_PRODUTOClickButton
        OnExit = edtCOD_PRODUTOExit
      end
      object edtNOM_PRODUTO: TEditTag
        Left = 239
        Top = 256
        Width = 441
        Height = 21
        CharCase = ecUpperCase
        Enabled = False
        TabOrder = 16
        _Tipo = tpChar
        _Default = False
      end
      object edtQTD_PEDIDA: TEditLabel
        Left = 112
        Top = 328
        Width = 128
        Height = 21
        _LabelCaption = 'Qtd. Pedida'
        LabelComponent.Width = 56
        LabelComponent.Height = 13
        LabelComponent.Caption = 'Qtd. Pedida'
        _NotNull = True
        _Chave = True
        _Tipo = Num_Decimal
        _FormatoNumerico = 12.300000000000000000
        CharCase = ecUpperCase
        TabOrder = 21
      end
      object edtQTD_ATENDIDA: TEditLabel
        Left = 336
        Top = 328
        Width = 128
        Height = 21
        _LabelCaption = 'Qtd. Atendida'
        LabelComponent.Width = 65
        LabelComponent.Height = 13
        LabelComponent.Caption = 'Qtd. Atendida'
        _NotNull = True
        _Chave = True
        _Tipo = Num_Decimal
        _FormatoNumerico = 12.300000000000000000
        CharCase = ecUpperCase
        TabOrder = 22
        OnChange = edtQTD_ATENDIDAChange
        OnEnter = edtQTD_ATENDIDAEnter
      end
      object edtQTD_ESTOQUE: TEditLabel
        Left = 112
        Top = 280
        Width = 128
        Height = 21
        _LabelCaption = 'Qtd. Estoque'
        LabelComponent.Width = 62
        LabelComponent.Height = 13
        LabelComponent.Caption = 'Qtd. Estoque'
        _NotNull = True
        _Chave = True
        _Tipo = Num_Decimal
        _FormatoNumerico = 12.300000000000000000
        CharCase = ecUpperCase
        Enabled = False
        TabOrder = 17
      end
      object edtVAL_CUSTO: TEditLabel
        Left = 112
        Top = 304
        Width = 128
        Height = 21
        _LabelCaption = 'Custo M'#233'dio'
        LabelComponent.Width = 59
        LabelComponent.Height = 13
        LabelComponent.Caption = 'Custo M'#233'dio'
        _NotNull = True
        _Chave = True
        _Tipo = Num_Decimal
        _FormatoNumerico = 14.200000000000000000
        CharCase = ecUpperCase
        Enabled = False
        TabOrder = 18
      end
      object edtVAL_ULT_ENTRADA: TEditLabel
        Left = 552
        Top = 304
        Width = 128
        Height = 21
        _LabelCaption = 'Val. Ult. Entrada'
        LabelComponent.Width = 77
        LabelComponent.Height = 13
        LabelComponent.Caption = 'Val. Ult. Entrada'
        _NotNull = True
        _Chave = True
        _Tipo = Num_Decimal
        _FormatoNumerico = 14.200000000000000000
        CharCase = ecUpperCase
        Enabled = False
        TabOrder = 20
      end
      object edtVAL_CUSTO_UN: TEditLabel
        Left = 336
        Top = 304
        Width = 128
        Height = 21
        _LabelCaption = 'Custo Un.(Fator)'
        LabelComponent.Width = 77
        LabelComponent.Height = 13
        LabelComponent.Caption = 'Custo Un.(Fator)'
        _NotNull = True
        _Chave = True
        _Tipo = Num_Decimal
        _FormatoNumerico = 14.400000000000000000
        CharCase = ecUpperCase
        Enabled = False
        TabOrder = 19
      end
      object edtPER_MARGEM: TEditLabel
        Left = 112
        Top = 352
        Width = 128
        Height = 21
        _LabelCaption = '% Margem'
        LabelComponent.Width = 49
        LabelComponent.Height = 13
        LabelComponent.Caption = '% Margem'
        _NotNull = True
        _Chave = True
        _Tipo = Num_Decimal
        _FormatoNumerico = 5.200000000000000000
        CharCase = ecUpperCase
        Enabled = False
        TabOrder = 24
        OnExit = edtPER_MARGEMExit
      end
      object edtVAL_UNITARIO: TEditLabel
        Left = 336
        Top = 352
        Width = 128
        Height = 21
        _LabelCaption = 'Pre'#231'o'
        LabelComponent.Width = 28
        LabelComponent.Height = 13
        LabelComponent.Caption = 'Pre'#231'o'
        _NotNull = True
        _Chave = True
        _Tipo = Num_Decimal
        _FormatoNumerico = 14.200000000000000000
        CharCase = ecUpperCase
        Enabled = False
        TabOrder = 25
        OnExit = edtVAL_UNITARIOExit
      end
      object edtVAL_TOTAL: TEditLabel
        Left = 552
        Top = 352
        Width = 128
        Height = 21
        _LabelCaption = 'Pre'#231'o Total'
        LabelComponent.Width = 55
        LabelComponent.Height = 13
        LabelComponent.Caption = 'Pre'#231'o Total'
        _NotNull = True
        _Chave = True
        _Tipo = Num_Decimal
        _FormatoNumerico = 14.200000000000000000
        CharCase = ecUpperCase
        Enabled = False
        TabOrder = 26
      end
      object edtVAL_PRECO_FATOR: TEditLabel
        Left = 336
        Top = 376
        Width = 128
        Height = 21
        _LabelCaption = 'Pre'#231'o Un.(Fator)'
        LabelComponent.Width = 78
        LabelComponent.Height = 13
        LabelComponent.Caption = 'Pre'#231'o Un.(Fator)'
        _NotNull = True
        _Chave = True
        _Tipo = Num_Decimal
        _FormatoNumerico = 14.400000000000000000
        CharCase = ecUpperCase
        Enabled = False
        TabOrder = 27
      end
      object btnIncluirProduto: TButton
        Left = 109
        Top = 399
        Width = 140
        Height = 25
        Caption = '&Gravar Produto'
        TabOrder = 28
        OnClick = btnIncluirProdutoClick
      end
      object edtNUM_FATOR_CONV: TEditLabel
        Left = 112
        Top = 376
        Width = 128
        Height = 21
        _LabelCaption = 'Fator Convers'#227'o'
        LabelComponent.Width = 78
        LabelComponent.Height = 13
        LabelComponent.Caption = 'Fator Convers'#227'o'
        _NotNull = True
        _Chave = True
        _Tipo = Num_Decimal
        _FormatoNumerico = 14.200000000000000000
        CharCase = ecUpperCase
        Enabled = False
        TabOrder = 29
      end
      object edtQTD_FECHADA: TEditLabel
        Left = 552
        Top = 328
        Width = 128
        Height = 21
        _LabelCaption = 'Qtd. Fechada'
        LabelComponent.Width = 65
        LabelComponent.Height = 13
        LabelComponent.Caption = 'Qtd. Fechada'
        _NotNull = True
        _Chave = True
        _Tipo = Num_Decimal
        _FormatoNumerico = 12.300000000000000000
        CharCase = ecUpperCase
        TabOrder = 23
        OnEnter = edtQTD_FECHADAEnter
      end
      object Button1: TButton
        Left = 472
        Top = 280
        Width = 75
        Height = 25
        Caption = 'Button1'
        TabOrder = 30
        Visible = False
        OnClick = Button1Click
      end
    end
    object tabPrincipioAtivo: TTabSheet
      Caption = 'Princ'#237'pio Ativo (N'#227'o Atendido)'
      ImageIndex = 2
      object edtCOD_P_ATIVO: TEditLabel
        Left = 112
        Top = 8
        Width = 129
        Height = 21
        _LabelCaption = 'Princ'#237'pio Ativo'
        _Campo = 'COD_P_ATIVO'
        _Edit = edtNOM_P_ATIVO
        LabelComponent.Width = 69
        LabelComponent.Height = 13
        LabelComponent.Caption = 'Princ'#237'pio Ativo'
        _Chave = True
        _Tipo = Pesquisa
        _FormatoNumerico = 4.000000000000000000
        CharCase = ecUpperCase
        TabOrder = 0
        OnClickButton = edtCOD_P_ATIVOClickButton
        OnExit = edtCOD_P_ATIVOExit
      end
      object edtNOM_P_ATIVO: TEditTag
        Left = 239
        Top = 8
        Width = 442
        Height = 21
        CharCase = ecUpperCase
        Enabled = False
        TabOrder = 2
        _Tipo = tpChar
        _Default = False
      end
      object edtQTD_PEDIDA_P_ATIVO: TEditLabel
        Left = 112
        Top = 32
        Width = 128
        Height = 21
        _LabelCaption = 'Qtd. Pedida'
        LabelComponent.Width = 56
        LabelComponent.Height = 13
        LabelComponent.Caption = 'Qtd. Pedida'
        _NotNull = True
        _Chave = True
        _Tipo = Num_Decimal
        _FormatoNumerico = 12.300000000000000000
        CharCase = ecUpperCase
        TabOrder = 3
      end
      object btnIncluirPrincipioAtivo: TButton
        Left = 109
        Top = 55
        Width = 140
        Height = 25
        Caption = 'Gravar &Princ'#237'pio Ativo'
        TabOrder = 4
        OnClick = btnIncluirPrincipioAtivoClick
      end
    end
  end
end
