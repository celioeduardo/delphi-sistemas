inherited frmPesqMovProduto: TfrmPesqMovProduto
  Left = 20
  Top = 57
  Caption = 'Pesquisa Movimenta'#231#227'o do Produto'
  ClientHeight = 462
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl3: TPanel
    Top = 406
    inherited btnInclui: TBitBtn
      Left = 286
      Visible = False
    end
    inherited btnaltera: TBitBtn
      Left = 390
      Visible = False
    end
    inherited btnExclui: TBitBtn
      Left = 494
      Visible = False
    end
    inherited btnLocaliza: TBitBtn
      Left = 14
    end
  end
  inherited tab: TPageControl
    Height = 406
    inherited tabCadastro: TTabSheet
      inherited pnl1: TPanel
        Height = 377
        object edtCOD_EMPRESA: TEditLabel
          Left = 112
          Top = 8
          Width = 129
          Height = 21
          _LabelCaption = 'Empresa'
          _Campo = 'COD_EMPRESA'
          _Edit = edtNOM_EMPRESA
          LabelComponent.Width = 50
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Empresa'
          _NotNull = True
          _Chave = True
          _Tipo = Pesquisa
          _FormatoNumerico = 4.000000000000000000
          CharCase = ecUpperCase
          TabOrder = 0
          OnChange = edtCOD_EMPRESAChange
          OnClickButton = edtCOD_EMPRESAClickButton
          OnExit = edtCOD_EMPRESAExit
        end
        object edtNOM_EMPRESA: TEditTag
          Left = 240
          Top = 8
          Width = 441
          Height = 21
          CharCase = ecUpperCase
          Enabled = False
          TabOrder = 2
          _Tipo = tpChar
          _Default = False
        end
        object edtCOD_FILIAL: TEditLabel
          Left = 112
          Top = 32
          Width = 129
          Height = 21
          _LabelCaption = 'Filial'
          _Campo = 'COD_FILIAL'
          _Edit = edtNOM_FILIAL
          LabelComponent.Width = 25
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Filial'
          _NotNull = True
          _Chave = True
          _Tipo = Pesquisa
          _FormatoNumerico = 4.000000000000000000
          CharCase = ecUpperCase
          Enabled = False
          TabOrder = 3
          OnClickButton = edtCOD_FILIALClickButton
          OnExit = edtCOD_FILIALExit
        end
        object edtNOM_FILIAL: TEditTag
          Left = 240
          Top = 32
          Width = 441
          Height = 21
          CharCase = ecUpperCase
          Enabled = False
          TabOrder = 5
          _Tipo = tpChar
          _Default = False
        end
        object edtCOD_PRODUTO: TEditLabel
          Left = 112
          Top = 56
          Width = 129
          Height = 21
          _LabelCaption = 'Produto'
          _Edit = edtNOM_PRODUTO
          LabelComponent.Width = 44
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Produto'
          _NotNull = True
          _Chave = True
          _Tipo = Pesquisa
          _FormatoNumerico = 4.000000000000000000
          CharCase = ecUpperCase
          TabOrder = 6
          OnClickButton = edtCOD_PRODUTOClickButton
          OnExit = edtCOD_PRODUTOExit
        end
        object edtNOM_PRODUTO: TEditTag
          Left = 240
          Top = 56
          Width = 441
          Height = 21
          CharCase = ecUpperCase
          Enabled = False
          TabOrder = 8
          _Tipo = tpChar
          _Default = False
        end
        object edtDAT_INICIAL: TEditLabel
          Left = 112
          Top = 80
          Width = 119
          Height = 21
          _LabelCaption = 'Inicial'
          _Campo = 'DAT_EMISSAO'
          LabelComponent.Width = 34
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Inicial'
          _Tipo = Data
          CharCase = ecUpperCase
          EditMask = '99/99/0000;1; '
          MaxLength = 10
          TabOrder = 9
          Text = '  /  /    '
        end
        object edtDAT_FINAL: TEditLabel
          Left = 304
          Top = 80
          Width = 120
          Height = 21
          _LabelCaption = 'Final'
          _Campo = 'DAT_ENTRADA'
          LabelComponent.Width = 26
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Final'
          _Tipo = Data
          CharCase = ecUpperCase
          EditMask = '99/99/0000;1; '
          MaxLength = 10
          TabOrder = 10
          Text = '  /  /    '
        end
        object grd: TDBGrid
          Left = 3
          Top = 104
          Width = 726
          Height = 272
          Anchors = [akLeft, akTop, akRight, akBottom]
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 11
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Verdana'
          TitleFont.Style = []
          OnDblClick = grdDblClick
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'DAT_MOV'
              Title.Alignment = taCenter
              Title.Caption = 'Data'
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'FLG_MAIS_MENOS'
              Title.Alignment = taCenter
              Title.Caption = '+/-'
              Width = 25
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'FLG_TIPO'
              Title.Alignment = taCenter
              Title.Caption = 'Tipo'
              Width = 80
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'NUM_DOCUMENTO'
              Title.Alignment = taRightJustify
              Title.Caption = 'Documento'
              Width = 75
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'NOM_SERIE'
              Title.Alignment = taCenter
              Title.Caption = 'S'#233'rie'
              Width = 35
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'QTD_MOV'
              Title.Alignment = taRightJustify
              Title.Caption = 'Quantidade'
              Width = 75
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'VAL_CUSTO'
              Title.Alignment = taRightJustify
              Title.Caption = 'Custo'
              Width = 80
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'VAL_MOV'
              Title.Alignment = taRightJustify
              Title.Caption = 'Valor'
              Width = 80
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'QTD_FISICO'
              Title.Alignment = taRightJustify
              Title.Caption = 'Qtd. F'#237'sico'
              Width = 75
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'VAL_FINAN'
              Title.Alignment = taRightJustify
              Title.Caption = 'Saldo Financ.'
              Width = 90
              Visible = True
            end>
        end
        object Button1: TButton
          Left = 456
          Top = 80
          Width = 75
          Height = 25
          Caption = 'Button1'
          TabOrder = 12
          OnClick = Button1Click
        end
      end
      inherited pnl2: TPanel
        Top = 377
        Height = 1
      end
      inherited txtHabilitaEdicao: TEdit
        Enabled = False
      end
    end
  end
end
