object frmPesqLanc: TfrmPesqLanc
  Left = 22
  Top = 96
  Width = 749
  Height = 469
  Caption = 'Pesquisa de Lan'#231'amentos'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object tab: TPageControl
    Left = 0
    Top = 0
    Width = 741
    Height = 379
    ActivePage = tabCadastro
    Align = alClient
    TabOrder = 0
    TabStop = False
    object tabCadastro: TTabSheet
      Caption = 'B'#225'sico'
      object pnl1: TPanel
        Left = 0
        Top = 0
        Width = 733
        Height = 351
        Align = alClient
        BevelInner = bvSpace
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          733
          351)
        object grd: TDBGrid
          Left = 3
          Top = 8
          Width = 726
          Height = 337
          Anchors = [akLeft, akTop, akRight, akBottom]
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'DAT_LANCAMENTO'
              Title.Alignment = taCenter
              Title.Caption = 'Data'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DSC_LANCAMENTO'
              Title.Caption = 'Descri'#231#227'o'
              Width = 250
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'VAL_LANCAMENTO'
              Title.Alignment = taRightJustify
              Title.Caption = 'Valor'
              Width = 100
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'COD_CONTA_DEB'
              Title.Alignment = taRightJustify
              Title.Caption = 'Conta'
              Width = 75
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOM_CONTA_DEB'
              Title.Caption = 'Conta D'#233'bito'
              Width = 100
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'COD_CONTA_CRE'
              Title.Alignment = taRightJustify
              Title.Caption = 'Conta'
              Width = 75
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOM_CONTA_CRE'
              Title.Caption = 'Conta Cr'#233'dito'
              Width = 100
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'COD_CT'
              Title.Alignment = taCenter
              Title.Caption = 'CT'
              Width = 30
              Visible = True
            end>
        end
      end
      object txtHabilitaEdicao: TEdit
        Left = -568
        Top = 154
        Width = 121
        Height = 21
        TabOrder = 1
        Text = 'txtHabilitaEdicao'
      end
    end
  end
  object pnl3: TPanel
    Left = 0
    Top = 379
    Width = 741
    Height = 56
    Align = alBottom
    BevelInner = bvRaised
    TabOrder = 1
    object btnLocaliza: TBitBtn
      Left = 30
      Top = 13
      Width = 97
      Height = 33
      Caption = '  &Localizar'
      TabOrder = 0
      Glyph.Data = {
        AA030000424DAA03000000000000360000002800000011000000110000000100
        18000000000074030000C40E0000C40E00000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000F1600000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000001E2F006FAB006B9D0000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000002B43006DA70083B600A4D70078A80000000000000000000000000000
        0000000000000000000000000000000000060000003556006EA80087BA009ECF
        009ECF008AC200466D000000000000000000000000000001041C232721272C07
        0A0E000102A2A8A65882970085BE009FD0009DCD0080B6006094000B11000000
        00000000020407798284C9A98AE0B289E2B78CCFB08B8A857D5D6C72CFCCC87B
        A7B80094CB007CB300598A0001020000000000000012161AC7BAAAFCBC91FFC5
        A7FBC096FDD3A8FFE7B9FFE9ADC19F776D757CE1D9D454849B004E7D00000000
        000000000000000000C2B8ADFFCDADFBD6C6F9D2BDF7C6A1F8CFA4FAE0B3FDF2
        C3FFFFCEC09D7565737997999701000000000000000000000000474D51FCCFAC
        FEE7DEF9D8C9F9D6C3F9D8C1F8CBA0FADCAFFCE9BAFEF5C5FFEFB188847D0000
        000000000000000000000000000097928DFFE0C9FCE9E2FADFD3FADBCAF9DBC7
        F9D3B4F9D1A5FADEB1FBE5B6FFEFBFCDAF8B070B0E0000000000000000000000
        0000BBA898FFF8F1FCEEE8FBE6DCFAE0D3FADCCCFADDC9F7C59AF8D0A5F9D5A9
        FEDAADE0BA9020262B00000000000000000000000000B2A295FFF4EAFDF5F2FC
        EDE6FBE6DCFAE0D3FBDFD0F7C4A3F6C097F7C59CFDC99FDDB48B1D2226000000
        000000000000000000007C7D7FFFE1C6FFFDFEFDF3EEFCECE5FBE5DBFAE1D5F7
        C8AEF5B18AF5B791FFBA91C5AA8D00020600000000000000000000000000191C
        1FFCD9BEFFFFFFFDF9F7FDF3EEFCECE5FBE7DEF8CAB6F3A47FF7AD8AF6A26A7A
        868A00000000000000000000000000000000000000808589FFD7B3FFFFFFFFFC
        FCFDF4F0FCEEE8FADBCEF69F7BF99B66C6BFB207090B00000000000000000000
        00000000000000000000000081868AFCD8BCFFE3C9FFF4E9FFF5EDFFE0C9F5AD
        7DBFBDB6171B1E00000000000000000000000000000000000000000000000000
        000000191C1E7C7E7FAFA196BBAA9B97938F4951560000000000000000000000
        0000000000000000000000000000}
    end
    object btnSair: TBitBtn
      Left = 606
      Top = 13
      Width = 97
      Height = 33
      Caption = '  &Sair'
      TabOrder = 1
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
