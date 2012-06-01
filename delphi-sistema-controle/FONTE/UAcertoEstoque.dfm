object frmAcertoEstoque: TfrmAcertoEstoque
  Left = 36
  Top = 40
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Acerto do Saldo F'#237'sico do Estoque'
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
    Height = 408
    ActivePage = tabAcerto
    Align = alClient
    TabOrder = 0
    TabStop = False
    object tabAcerto: TTabSheet
      Caption = 'Acerto'
      ImageIndex = 1
      object edtDAT_ACERTO: TEditLabel
        Left = 112
        Top = 15
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
        MaxLength = 10
        TabOrder = 0
        Text = '  /  /    '
        OnChange = edtDAT_ACERTOChange
        OnExit = edtDAT_ACERTOExit
      end
      object edtCOD_PRODUTO: TEditLabel
        Left = 112
        Top = 40
        Width = 129
        Height = 21
        _LabelCaption = 'Produto'
        _Campo = 'COD_PRODUTO'
        _Edit = edtNOM_PRODUTO
        LabelComponent.Width = 37
        LabelComponent.Height = 13
        LabelComponent.Caption = 'Produto'
        _NotNull = True
        _Chave = True
        _Tipo = Pesquisa
        _FormatoNumerico = 4.000000000000000000
        CharCase = ecUpperCase
        Enabled = False
        TabOrder = 1
        OnChange = edtCOD_PRODUTOChange
        OnClickButton = edtCOD_PRODUTOClickButton
        OnExit = edtCOD_PRODUTOExit
      end
      object edtSaldoFisico: TEditLabel
        Left = 112
        Top = 64
        Width = 121
        Height = 21
        _LabelCaption = 'Saldo F'#237'sico'
        LabelComponent.Width = 59
        LabelComponent.Height = 13
        LabelComponent.Caption = 'Saldo F'#237'sico'
        _NotNull = True
        _Tipo = Num_Decimal
        _FormatoNumerico = 12.300000000000000000
        CharCase = ecUpperCase
        Enabled = False
        MaxLength = 10
        TabOrder = 4
      end
      object lvw: TListViewTag
        Left = 112
        Top = 120
        Width = 569
        Height = 257
        Columns = <
          item
            Caption = 'C'#243'digo'
            Width = 60
          end
          item
            Caption = 'Produto'
            Width = 300
          end
          item
            Alignment = taRightJustify
            Caption = 'Saldo F'#237'sico'
            Width = 100
          end
          item
            Alignment = taRightJustify
            Caption = 'Qtd. Ajuste'
            Width = 100
          end>
        RowSelect = True
        TabOrder = 7
        ViewStyle = vsReport
      end
      object btnInserirProduto: TButton
        Left = 112
        Top = 96
        Width = 75
        Height = 23
        Caption = 'Inserir'
        TabOrder = 6
        OnClick = btnInserirProdutoClick
      end
      object btnExcluirProduto: TButton
        Left = 192
        Top = 96
        Width = 75
        Height = 23
        Caption = 'Excluir'
        TabOrder = 8
        OnClick = btnExcluirProdutoClick
      end
      object edtNOM_PRODUTO: TEditTag
        Left = 240
        Top = 40
        Width = 441
        Height = 21
        CharCase = ecUpperCase
        Enabled = False
        TabOrder = 3
        _Tipo = tpChar
        _Default = False
      end
      object edtSaldoFisicoApurado: TEditLabel
        Left = 376
        Top = 64
        Width = 121
        Height = 21
        _LabelCaption = 'Saldo F'#237'sico Apurado'
        LabelComponent.Width = 102
        LabelComponent.Height = 13
        LabelComponent.Caption = 'Saldo F'#237'sico Apurado'
        _Tipo = Num_Decimal
        _FormatoNumerico = 12.300000000000000000
        CharCase = ecUpperCase
        Enabled = False
        MaxLength = 10
        TabOrder = 5
      end
    end
  end
  object pnl3: TPanel
    Left = 0
    Top = 408
    Width = 741
    Height = 56
    Align = alBottom
    BevelInner = bvRaised
    TabOrder = 1
    object btnInclui: TBitBtn
      Left = 14
      Top = 13
      Width = 97
      Height = 33
      Caption = '  &Incluir'
      TabOrder = 0
      OnClick = btnIncluiClick
      Glyph.Data = {
        AA030000424DAA03000000000000360000002800000011000000110000000100
        18000000000074030000C40E0000C40E000000000000000000000000000F0000
        8736089970669F766D9E756C9D6F619A6B5D9A6B5D9A6B5D9A6B5D9D70648243
        267B34087C360D823A0D42190700150200EA7622DD7A24A7A8A8C08C5FBC885A
        C7C9CAECEFF1E9EBECE9EBECE9EBECEDF5FBBB8E66F08021EB8228F28728AC53
        1F00B05119EE8830D3782C99877AEE7C1EEB7818A6A3A1CECDCECBC9C9CBC9C9
        CBC9C9CDD0D4B28A69EC8F43E38436E8842DA24F2000A54F1CED8C39D67E358F
        8175EC8530EB832B969494B5B5B6B3B2B2B3B2B2B3B2B2B2B5B9B08F75F5AA6E
        E7914AEA8936A3522400A55121EF9243D8843F887A6EF58F3BF58D378786849D
        9D9E9C9B9B9C9B9B9C9B9B999B9EAE9481FEC397EB9C5EEC8F3FA4542700A654
        26F19950DC8B4A6B6D6EB57E52B47D5074797D82888E81878C81878C81878C7C
        858BA7978CFFDBBEEEA972EE954BA5572C00A7582CF1A05CFA994FC07E4FB87D
        55B97D55BF7E50BE7C4EBE7C4EBE7C4EBE7C4EB9794CED9B61FEAA6FF29853F1
        9F5BA65A3100A95C32FEA56187B2A981CCCB84CAC784CAC784CAC784CAC784CA
        C784CAC784CAC784CAC77FC6C578C8CA9EA994FCA663A75D3600A95F38FFAA69
        6ADEEEA1FFFFA0FFFF9FFFFFA0FFFFA0FFFF9FFFFFA0FFFF9FFFFF9FFFFFA0FF
        FF9EFFFF7BCBCFFFAC6CA8603B00AA633DFFB3776EDDE991EDF57CCCE18CE6F0
        7CCDE181D4E58BE4EE7ACADF84DAE989E1ED77C4DC9DFFFF80CBCCFFB57AA863
        4000AC6643FFBB8571E0EC82D5E5538CC25C99C466AAD0558FC3609EC664A7CF
        538CC263A4C85D9CCA80D5E882D1D2FFBC87AA664500AD6A49FFC39372E2ED77
        C3DB5087C063A5CA538BBE5793C562A1C75188BE5B99C9609EC44B7FB98CE9F3
        83D1D5FFC595AA694A00AE6E4FFFCFA56EDDEAA0FFFF88E1EB8FEBF398FAFA89
        E2ED92F0F696F7F888DFEB95F5F992F0F595F8FD82D1D6FFD0A7AB6C4F00AD6A
        49FFA76374E8F56DB3D02C4D9F4675AE3A63A73459A54776AE365EA5375FA847
        75AC2D4F9E7DD1E486DBE2FFA560AB6C4E00AC6C4FF8A06B67E4FAA1FFFF9BFF
        FF9CFFFFA0FFFF9CFFFF9DFFFF9FFFFF9BFFFF9FFFFF9EFFFF9CFFFF7BDAE8F5
        9D68AB6D5300B36A43FFCF9ECAB292A5AE99A9AF99A8AF99A8AE98A9AF99A8AF
        98A8AF98A9AF99A8AF98A8AF98A3AE99DCB590FFCF9FB26A4500632204AB4A10
        AA470DAE470CAE470CAE470CAE470CAE470CAE470CAE470CAE470CAE470CAE47
        0CAE470CA9470DAD4B10541D0400}
    end
    object btnSair: TBitBtn
      Left = 606
      Top = 13
      Width = 97
      Height = 33
      Caption = '  &Sair'
      TabOrder = 1
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
  end
end
