inherited frmCAD_FECHAMENTO: TfrmCAD_FECHAMENTO
  Left = 37
  Top = 66
  Caption = 'Fechamento Mensal'
  ClientHeight = 427
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl3: TPanel
    Top = 371
    inherited btnaltera: TBitBtn
      Left = 438
      Visible = False
    end
    inherited btnExclui: TBitBtn
      Left = 118
    end
    inherited btnLocaliza: TBitBtn
      Visible = False
    end
  end
  inherited tab: TPageControl
    Height = 371
    inherited tabCadastro: TTabSheet
      inherited pnl1: TPanel
        Height = 57
        object edtNUM_MES: TEditLabel
          Left = 112
          Top = 8
          Width = 33
          Height = 21
          _LabelCaption = 'M'#234's'
          _Campo = 'NUM_MES'
          LabelComponent.Width = 22
          LabelComponent.Height = 13
          LabelComponent.Caption = 'M'#234's'
          _NotNull = True
          _Chave = True
          _Tipo = Numero
          _FormatoNumerico = 2.000000000000000000
          CharCase = ecUpperCase
          MaxLength = 2
          TabOrder = 0
        end
        object edtNUM_ANO: TEditLabel
          Left = 112
          Top = 32
          Width = 73
          Height = 21
          _LabelCaption = 'Ano'
          _Campo = 'NUM_ANO'
          LabelComponent.Width = 22
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Ano'
          _NotNull = True
          _Chave = True
          _Tipo = Numero
          _FormatoNumerico = 4.000000000000000000
          CharCase = ecUpperCase
          MaxLength = 4
          TabOrder = 1
        end
      end
      inherited pnl2: TPanel
        Top = 57
        Height = 286
        object edtDAT_FECHAMENTO: TEditLabel
          Left = 113
          Top = 8
          Width = 104
          Height = 21
          _LabelCaption = 'Fechamento'
          _Campo = 'DAT_FECHAMENTO'
          LabelComponent.Width = 69
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Fechamento'
          _NotNull = True
          _Tipo = Data
          _IsChar = True
          CharCase = ecUpperCase
          EditMask = '99/99/0000;1; '
          MaxLength = 10
          TabOrder = 0
          Text = '  /  /    '
        end
        object grpOMTJ: TGroupBox
          Left = 8
          Top = 32
          Width = 329
          Height = 108
          Caption = 'Obra Mundial'
          TabOrder = 1
          object edtVAL_OMTJ: TEditLabel
            Left = 104
            Top = 20
            Width = 128
            Height = 21
            Hint = 'Donativo recebido das caixas de contribui'#231#227'o'
            _LabelCaption = 'Recebido'
            _Campo = 'VAL_OMTJ'
            LabelComponent.Width = 52
            LabelComponent.Height = 13
            LabelComponent.Caption = 'Recebido'
            _NotNull = True
            _Tipo = Num_Decimal
            _IsChar = True
            _FormatoNumerico = 14.200000000000000000
            CharCase = ecUpperCase
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            Text = '0,00'
            OnExit = edtVAL_OMTJExit
          end
          object edtVAL_OMTJ_RES: TEditLabel
            Left = 104
            Top = 44
            Width = 128
            Height = 21
            Hint = 'Resolu'#231#227'o da Congrega'#231#227'o para OMTJ'
            _LabelCaption = 'Resolu'#231#227'o'
            _Campo = 'VAL_OMTJ_RES'
            LabelComponent.Width = 58
            LabelComponent.Height = 13
            LabelComponent.Caption = 'Resolu'#231#227'o'
            _NotNull = True
            _Tipo = Num_Decimal
            _IsChar = True
            _FormatoNumerico = 14.200000000000000000
            CharCase = ecUpperCase
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            Text = '0,00'
            OnExit = edtVAL_OMTJ_RESExit
          end
          object edtTotalEnviarOMTJ: TEditLabel
            Left = 104
            Top = 68
            Width = 128
            Height = 21
            _LabelCaption = 'Total a Enviar'
            LabelComponent.Width = 79
            LabelComponent.Height = 13
            LabelComponent.Caption = 'Total a Enviar'
            _NotNull = True
            _Tipo = Num_Decimal
            _IsChar = True
            _FormatoNumerico = 14.200000000000000000
            CharCase = ecUpperCase
            Enabled = False
            TabOrder = 2
            Text = '0,00'
            OnExit = edtVAL_AJU_FINExit
          end
        end
        object grpSalaoAssembleia: TGroupBox
          Left = 344
          Top = 32
          Width = 377
          Height = 73
          Caption = 'Sal'#227'o de Assembl'#233'ias'
          TabOrder = 3
          object edtVAL_SALAO_ASSEMB: TEditLabel
            Left = 104
            Top = 20
            Width = 128
            Height = 21
            _LabelCaption = 'Donativo'
            _Campo = 'VAL_SALAO_ASSEMB'
            LabelComponent.Width = 51
            LabelComponent.Height = 13
            LabelComponent.Caption = 'Donativo'
            _NotNull = True
            _Tipo = Num_Decimal
            _IsChar = True
            _FormatoNumerico = 14.200000000000000000
            CharCase = ecUpperCase
            TabOrder = 0
            Text = '0,00'
            OnExit = edtVAL_SALAO_ASSEMBExit
          end
          object edtNOM_SALAO_ASSEMB: TEditLabel
            Left = 104
            Top = 44
            Width = 265
            Height = 21
            _LabelCaption = 'Nome'
            _Campo = 'NOM_SALAO_ASSEMB'
            LabelComponent.Width = 33
            LabelComponent.Height = 13
            LabelComponent.Caption = 'Nome'
            _IsChar = True
            _FormatoNumerico = 14.200000000000000000
            CharCase = ecUpperCase
            MaxLength = 60
            TabOrder = 1
          end
        end
        object grpValoresAdicionais: TGroupBox
          Left = 8
          Top = 145
          Width = 329
          Height = 121
          Caption = 'Valores Adicionais'
          TabOrder = 2
          object edtVAL_AJU_FIN: TEditLabel
            Left = 104
            Top = 20
            Width = 128
            Height = 21
            _LabelCaption = 'Rem. Ajuda Fin.'
            _Campo = 'VAL_AJU_FIN'
            LabelComponent.Width = 91
            LabelComponent.Height = 13
            LabelComponent.Caption = 'Rem. Ajuda Fin.'
            _NotNull = True
            _Tipo = Num_Decimal
            _IsChar = True
            _FormatoNumerico = 14.200000000000000000
            CharCase = ecUpperCase
            TabOrder = 0
            Text = '0,00'
            OnExit = edtVAL_AJU_FINExit
          end
          object edtVAL_AUX_CAL: TEditLabel
            Left = 104
            Top = 44
            Width = 128
            Height = 21
            _LabelCaption = 'Aux. Calam.'
            _Campo = 'VAL_AUX_CAL'
            LabelComponent.Width = 71
            LabelComponent.Height = 13
            LabelComponent.Caption = 'Aux. Calam.'
            _NotNull = True
            _Tipo = Num_Decimal
            _IsChar = True
            _FormatoNumerico = 14.200000000000000000
            CharCase = ecUpperCase
            TabOrder = 1
            Text = '0,00'
            OnExit = edtVAL_AUX_CALExit
          end
          object edtVAL_FUNDO_SR: TEditLabel
            Left = 104
            Top = 68
            Width = 128
            Height = 21
            _LabelCaption = 'Constru'#231#245'es SR'
            _Campo = 'VAL_FUNDO_SR'
            LabelComponent.Width = 91
            LabelComponent.Height = 13
            LabelComponent.Caption = 'Constru'#231#245'es SR'
            _NotNull = True
            _Tipo = Num_Decimal
            _IsChar = True
            _FormatoNumerico = 14.200000000000000000
            CharCase = ecUpperCase
            TabOrder = 2
            Text = '0,00'
            OnExit = edtVAL_FUNDO_SRExit
          end
          object edtVAL_CONTA_CONG: TEditLabel
            Left = 104
            Top = 92
            Width = 128
            Height = 21
            _LabelCaption = 'Conta Cong.'
            _Campo = 'VAL_CONTA_CONG'
            LabelComponent.Width = 72
            LabelComponent.Height = 13
            LabelComponent.Caption = 'Conta Cong.'
            _NotNull = True
            _Tipo = Num_Decimal
            _IsChar = True
            _FormatoNumerico = 14.200000000000000000
            CharCase = ecUpperCase
            TabOrder = 3
            Text = '0,00'
            OnExit = edtVAL_CONTA_CONGExit
          end
        end
        object grdOutrosDonativos: TGroupBox
          Left = 344
          Top = 112
          Width = 377
          Height = 73
          Caption = 'Outros Donativos'
          TabOrder = 4
          object edtVAL_OUTROS_DONAT: TEditLabel
            Left = 104
            Top = 20
            Width = 128
            Height = 21
            _LabelCaption = 'Donativo'
            _Campo = 'VAL_OUTROS_DONAT'
            LabelComponent.Width = 51
            LabelComponent.Height = 13
            LabelComponent.Caption = 'Donativo'
            _NotNull = True
            _Tipo = Num_Decimal
            _IsChar = True
            _FormatoNumerico = 14.200000000000000000
            CharCase = ecUpperCase
            TabOrder = 0
            Text = '0,00'
            OnExit = edtVAL_OUTROS_DONATExit
          end
          object edtNOM_OUTROS_DONAT: TEditLabel
            Left = 104
            Top = 44
            Width = 265
            Height = 21
            _LabelCaption = 'Descri'#231#227'o'
            _Campo = 'NOM_OUTROS_DONAT'
            LabelComponent.Width = 56
            LabelComponent.Height = 13
            LabelComponent.Caption = 'Descri'#231#227'o'
            _IsChar = True
            _FormatoNumerico = 14.200000000000000000
            CharCase = ecUpperCase
            MaxLength = 80
            TabOrder = 1
          end
        end
      end
      inherited txtHabilitaEdicao: TEdit
        Height = 21
      end
    end
    object tabResumo: TTabSheet
      Caption = 'Resumo'
      ImageIndex = 1
      OnShow = tabResumoShow
      object grpRemessaAssociacao: TGroupBox
        Left = 0
        Top = 0
        Width = 361
        Height = 208
        Caption = 'Remessa para Associa'#231#227'o'
        TabOrder = 0
        object lblTotalEnviar: TLabel
          Left = 8
          Top = 141
          Width = 129
          Height = 13
          AutoSize = False
          Caption = 'Total a Enviar:'
        end
        object lbl: TLabel
          Left = 8
          Top = 158
          Width = 129
          Height = 13
          AutoSize = False
          Caption = 'Dinheiro m'#227'os:'
        end
        object lblValorTotalEnviar: TLabel
          Left = 128
          Top = 141
          Width = 89
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0,00'
        end
        object lblValor: TLabel
          Left = 128
          Top = 158
          Width = 89
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0,00'
        end
        object lblDiferenca: TLabel
          Left = 8
          Top = 176
          Width = 129
          Height = 13
          AutoSize = False
          Caption = 'Dif. (M'#227'os - Enviar):'
        end
        object lblValorDiferenca: TLabel
          Left = 128
          Top = 176
          Width = 89
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0,00'
        end
        object lvwRemessaAssociacao: TListViewTag
          Left = 8
          Top = 16
          Width = 345
          Height = 121
          Columns = <
            item
              Caption = 'Descri'#231#227'o'
              Width = 230
            end
            item
              Alignment = taRightJustify
              Caption = 'Valor'
              Width = 90
            end>
          TabOrder = 0
          ViewStyle = vsReport
        end
        object chkDepContaCong: TCheckBoxTag
          Left = 224
          Top = 165
          Width = 126
          Height = 37
          Caption = 'Depositar conta da congrega'#231#227'o'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          WordWrap = True
          OnClick = chkDepContaCongClick
          _Tipo = tpChar
        end
        object cboSaidaDinheiro: TComboBox
          Left = 224
          Top = 138
          Width = 129
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 2
          Text = 'Dinheiro m'#227'os'
          OnChange = cboSaidaDinheiroChange
          Items.Strings = (
            'Dinheiro m'#227'os'
            'Conta Corrente'
            'Outra Conta')
        end
      end
      object GroupBox1: TGroupBox
        Left = 368
        Top = 0
        Width = 361
        Height = 208
        Caption = 'Verifica'#231#227'o'
        TabOrder = 1
        object Label1: TLabel
          Left = 3
          Top = 14
          Width = 129
          Height = 13
          AutoSize = False
          Caption = 'Dinheiro em m'#227'os'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 8
          Top = 32
          Width = 104
          Height = 13
          AutoSize = False
          Caption = 'Saldo Ant.:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 32
          Top = 48
          Width = 93
          Height = 13
          AutoSize = False
          Caption = 'Entrada:'
        end
        object Label4: TLabel
          Left = 32
          Top = 64
          Width = 93
          Height = 13
          AutoSize = False
          Caption = 'Sa'#237'da:'
        end
        object Label5: TLabel
          Left = 8
          Top = 80
          Width = 93
          Height = 13
          AutoSize = False
          Caption = 'Saldo Final:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblValSaldoAntMaos: TLabel
          Left = 84
          Top = 32
          Width = 77
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '999.999,99'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblValEntradaMaos: TLabel
          Left = 84
          Top = 48
          Width = 77
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '999.999,99'
        end
        object lblValSaidaMaos: TLabel
          Left = 84
          Top = 64
          Width = 77
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '999.999,99'
        end
        object lblValSaldoFinalMaos: TLabel
          Left = 84
          Top = 80
          Width = 77
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '999.999,99'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label10: TLabel
          Left = 187
          Top = 14
          Width = 129
          Height = 13
          AutoSize = False
          Caption = 'Outra Conta:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 192
          Top = 32
          Width = 104
          Height = 13
          AutoSize = False
          Caption = 'Saldo Ant.:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblValSaldoAntOutra: TLabel
          Left = 268
          Top = 32
          Width = 77
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '999.999,99'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label13: TLabel
          Left = 216
          Top = 48
          Width = 93
          Height = 13
          AutoSize = False
          Caption = 'Entrada:'
        end
        object Label14: TLabel
          Left = 216
          Top = 64
          Width = 93
          Height = 13
          AutoSize = False
          Caption = 'Sa'#237'da:'
        end
        object Label15: TLabel
          Left = 192
          Top = 80
          Width = 93
          Height = 13
          AutoSize = False
          Caption = 'Saldo Final:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblValSaldoFinalOutra: TLabel
          Left = 268
          Top = 80
          Width = 77
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '999.999,99'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblValSaidaOutra: TLabel
          Left = 268
          Top = 64
          Width = 77
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '999.999,99'
        end
        object lblValEntradaOutra: TLabel
          Left = 268
          Top = 48
          Width = 77
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '999.999,99'
        end
        object Label19: TLabel
          Left = 3
          Top = 110
          Width = 129
          Height = 13
          AutoSize = False
          Caption = 'Conta Corrente'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
        object Label20: TLabel
          Left = 8
          Top = 128
          Width = 104
          Height = 13
          AutoSize = False
          Caption = 'Saldo Ant.:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblValSaldoAntCC: TLabel
          Left = 84
          Top = 128
          Width = 77
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '999.999,99'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label22: TLabel
          Left = 32
          Top = 144
          Width = 93
          Height = 13
          AutoSize = False
          Caption = 'Entrada:'
        end
        object lblValEntradaCC: TLabel
          Left = 84
          Top = 144
          Width = 77
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '999.999,99'
        end
        object Label24: TLabel
          Left = 32
          Top = 160
          Width = 93
          Height = 13
          AutoSize = False
          Caption = 'Sa'#237'da:'
        end
        object lblValSaidaCC: TLabel
          Left = 84
          Top = 160
          Width = 77
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '999.999,99'
        end
        object Label26: TLabel
          Left = 8
          Top = 176
          Width = 93
          Height = 13
          AutoSize = False
          Caption = 'Saldo Final:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblValSaldoFinalCC: TLabel
          Left = 84
          Top = 176
          Width = 77
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '999.999,99'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 187
          Top = 110
          Width = 158
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Saldo Final Total'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
        object lblSaldoFinalTotal: TLabel
          Left = 192
          Top = 128
          Width = 153
          Height = 25
          Alignment = taRightJustify
          AutoSize = False
          Caption = '999.999,99'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object GroupBox2: TGroupBox
        Left = 368
        Top = 208
        Width = 361
        Height = 135
        Caption = 'Obriga'#231#245'es em Aberto'
        TabOrder = 2
        object lvwObrigacoes: TListViewTag
          Left = 8
          Top = 16
          Width = 345
          Height = 113
          Columns = <
            item
              Caption = 'Conta'
            end
            item
              Caption = 'Descri'#231#227'o'
              Width = 190
            end
            item
              Alignment = taRightJustify
              Caption = 'Valor'
              Width = 90
            end>
          TabOrder = 0
          ViewStyle = vsReport
        end
      end
      object grpLancamentos: TGroupBox
        Left = 0
        Top = 208
        Width = 361
        Height = 135
        Caption = 'Lan'#231'amentos do Fechamento'
        TabOrder = 3
        object lvwLancamento: TListViewTag
          Left = 8
          Top = 16
          Width = 345
          Height = 113
          Columns = <
            item
              Caption = 'Descri'#231#227'o'
              Width = 190
            end
            item
              Alignment = taRightJustify
              Caption = 'Valor'
              Width = 90
            end
            item
              Alignment = taRightJustify
              Caption = 'D'#233'bito'
            end
            item
              Caption = 'Conta D'#233'bito'
              Width = 100
            end
            item
              Alignment = taRightJustify
              Caption = 'Cr'#233'dito'
              Width = 60
            end
            item
              Caption = 'Conta Cr'#233'dito'
              Width = 100
            end>
          TabOrder = 0
          ViewStyle = vsReport
        end
      end
    end
  end
end
