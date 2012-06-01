inherited frmCAD_PUBLICO: TfrmCAD_PUBLICO
  Left = 244
  Top = 150
  Caption = 'Cadastro de P'#250'blico'
  ClientHeight = 429
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl3: TPanel
    Top = 373
  end
  inherited tab: TPageControl
    Height = 373
    inherited tabCadastro: TTabSheet
      inherited pnl1: TPanel
        Height = 26
        object txtCodPublico: TEditLabel
          Left = 112
          Top = 3
          Width = 121
          Height = 21
          _LabelCaption = 'C'#243'digo'
          _Campo = 'COD_PUBLICO'
          LabelComponent.Width = 40
          LabelComponent.Height = 13
          LabelComponent.Caption = 'C'#243'digo'
          _NotNull = True
          _Chave = True
          _Tipo = Pesquisa
          _FormatoNumerico = 4.000000000000000000
          CharCase = ecUpperCase
          TabOrder = 0
          OnChange = txtCodPublicoChange
          OnClickButton = txtCodPublicoClickButton
          OnEnter = txtCodPublicoEnter
          OnExit = txtCodPublicoExit
        end
      end
      inherited pnl2: TPanel
        Top = 26
        Height = 319
        object txtNomPublico: TEditLabel
          Left = 112
          Top = 1
          Width = 505
          Height = 21
          _LabelCaption = 'Nome'
          _Campo = 'NOM_PUBLICO'
          LabelComponent.Width = 33
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Nome'
          _NotNull = True
          MaxLength = 60
          TabOrder = 0
        end
        object txtObs: TMemoTag
          Left = 4
          Top = 266
          Width = 725
          Height = 49
          MaxLength = 100
          TabOrder = 3
          WantReturns = False
          _Campo = 'DSC_OBS'
          _NotNull = False
          _Label.Width = 68
          _Label.Height = 13
          _Label.Caption = 'Observa'#231#227'o'
        end
        object tabPrinc: TPageControl
          Left = 4
          Top = 24
          Width = 726
          Height = 225
          ActivePage = tab1
          ParentShowHint = False
          ShowHint = False
          TabOrder = 2
          TabStop = False
          OnChange = tabPrincChange
          object tab1: TTabSheet
            Caption = 'Dados Pessoais'
            object grpSexo: TGroupBox
              Left = 4
              Top = 6
              Width = 349
              Height = 49
              Caption = 'Sexo'
              TabOrder = 0
              object optMaculino: TRadioButtonTag
                Left = 56
                Top = 16
                Width = 113
                Height = 17
                Caption = '&Maculino'
                Checked = True
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 0
                TabStop = True
                OnClick = optFemininoClick
                _Campo = 'FLG_SEXO'
                _Tipo = tpChar
                _Valor = 'M'
                _Default = True
              end
              object optFeminino: TRadioButtonTag
                Left = 184
                Top = 19
                Width = 113
                Height = 17
                Caption = '&Feminino'
                TabOrder = 1
                OnClick = optFemininoClick
                _Campo = 'FLG_SEXO'
                _Tipo = tpChar
                _Valor = 'F'
                _Default = False
              end
            end
            object grpDadosAdicionais: TGroupBox
              Left = 356
              Top = 6
              Width = 357
              Height = 49
              Caption = 'Dados Adicionais'
              TabOrder = 1
              object txtDatNasc: TEditLabel
                Left = 161
                Top = 18
                Width = 119
                Height = 21
                _LabelCaption = 'Nascimento'
                _Campo = 'DAT_NASC'
                LabelComponent.Width = 66
                LabelComponent.Height = 13
                LabelComponent.Caption = 'Nascimento'
                _Tipo = Data
                CharCase = ecUpperCase
                EditMask = '99/99/0000;1; '
                MaxLength = 10
                TabOrder = 0
                Text = '  /  /    '
              end
            end
            object grpEndereco: TGroupBox
              Left = 4
              Top = 57
              Width = 711
              Height = 136
              Caption = 'Endere'#231'o/Contato'
              TabOrder = 2
              object txtNomRua: TEditLabel
                Left = 104
                Top = 40
                Width = 408
                Height = 21
                _LabelCaption = 'Endere'#231'o'
                _Campo = 'NOM_RUA'
                LabelComponent.Width = 53
                LabelComponent.Height = 13
                LabelComponent.Caption = 'Endere'#231'o'
                MaxLength = 60
                TabOrder = 2
              end
              object optCEP: TEditLabel
                Left = 584
                Top = 64
                Width = 120
                Height = 21
                _LabelCaption = 'CEP'
                _Campo = 'NUM_CEP'
                LabelComponent.Width = 23
                LabelComponent.Height = 13
                LabelComponent.Caption = 'CEP'
                _Tipo = CEP
                CharCase = ecUpperCase
                EditMask = '99999\-999;0; '
                MaxLength = 9
                TabOrder = 4
              end
              object txtTelResidencial: TEditLabel
                Left = 104
                Top = 88
                Width = 119
                Height = 21
                _LabelCaption = 'Fone Res.'
                _Campo = 'NUM_TEL_RES'
                LabelComponent.Width = 56
                LabelComponent.Height = 13
                LabelComponent.Caption = 'Fone Res.'
                _Tipo = Fone
                CharCase = ecUpperCase
                EditMask = '\(99\)9999\-9999;0; '
                MaxLength = 13
                TabOrder = 5
              end
              object txtTelComercial: TEditLabel
                Left = 103
                Top = 112
                Width = 119
                Height = 21
                _LabelCaption = 'Fone Comercial'
                _Campo = 'NUM_TEL_COM'
                LabelComponent.Width = 89
                LabelComponent.Height = 13
                LabelComponent.Caption = 'Fone Comercial'
                _Tipo = Fone
                CharCase = ecUpperCase
                EditMask = '\(99\)9999\-9999;0; '
                MaxLength = 13
                TabOrder = 7
              end
              object txtCelular: TEditLabel
                Left = 392
                Top = 88
                Width = 119
                Height = 21
                _LabelCaption = 'Celular'
                _Campo = 'NUM_CELULAR'
                LabelComponent.Width = 41
                LabelComponent.Height = 13
                LabelComponent.Caption = 'Celular'
                _Tipo = Fone
                CharCase = ecUpperCase
                EditMask = '\(99\)9999\-9999;0; '
                MaxLength = 13
                TabOrder = 6
              end
              object edtCOD_CIDADE: TEditLabel
                Left = 104
                Top = 16
                Width = 121
                Height = 21
                _LabelCaption = 'Cidade'
                _Campo = 'COD_CIDADE'
                _Edit = edtNOM_CIDADE
                LabelComponent.Width = 40
                LabelComponent.Height = 13
                LabelComponent.Caption = 'Cidade'
                _Tipo = Pesquisa
                TabOrder = 0
                OnClickButton = edtCOD_CIDADEClickButton
                OnExit = edtCOD_CIDADEExit
              end
              object edtNOM_CIDADE: TEditTag
                Left = 224
                Top = 16
                Width = 481
                Height = 21
                Enabled = False
                TabOrder = 1
                _Tipo = tpChar
                _Default = False
              end
              object edtNOM_BAIRRO: TEditLabel
                Left = 104
                Top = 64
                Width = 408
                Height = 21
                _LabelCaption = 'Bairro'
                _Campo = 'NOM_BAIRRO'
                LabelComponent.Width = 35
                LabelComponent.Height = 13
                LabelComponent.Caption = 'Bairro'
                MaxLength = 60
                TabOrder = 3
              end
              object edtNUM_RAMAL: TEditLabel
                Left = 288
                Top = 112
                Width = 49
                Height = 21
                _LabelCaption = 'Ramal'
                _Campo = 'NOM_RAMAL'
                LabelComponent.Width = 36
                LabelComponent.Height = 13
                LabelComponent.Caption = 'Ramal'
                _FormatoNumerico = 5.000000000000000000
                MaxLength = 5
                TabOrder = 8
              end
            end
          end
          object tab2: TTabSheet
            Caption = 'Dados Teocr'#225'ticos'
            ImageIndex = 1
            object grpSituacao: TGroupBox
              Left = 4
              Top = 7
              Width = 709
              Height = 73
              Caption = 'Privil'#233'gio'
              TabOrder = 0
              object optVisitante: TRadioButtonTag
                Left = 72
                Top = 16
                Width = 113
                Height = 17
                Caption = '&Visitante'
                TabOrder = 0
                _Campo = 'FLG_SITUACAO'
                _Tipo = tpChar
                _Valor = 'V'
                _Default = False
              end
              object optPublicador: TRadioButtonTag
                Left = 72
                Top = 48
                Width = 169
                Height = 17
                Caption = '&Publicador n'#227'o Batizado'
                Checked = True
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 1
                TabStop = True
                _Campo = 'FLG_SITUACAO'
                _Tipo = tpChar
                _Valor = 'P'
                _Default = True
              end
              object optServoMinisterial: TRadioButtonTag
                Left = 248
                Top = 48
                Width = 161
                Height = 17
                Caption = 'Ser&vo Ministerial'
                TabOrder = 3
                _Campo = 'FLG_SITUACAO'
                _Tipo = tpChar
                _Valor = 'S'
                _Default = False
              end
              object optBatizado: TRadioButtonTag
                Left = 248
                Top = 16
                Width = 113
                Height = 17
                Caption = '&Batizado'
                TabOrder = 2
                _Campo = 'FLG_SITUACAO'
                _Tipo = tpChar
                _Valor = 'B'
                _Default = False
              end
              object optSupCircuito: TRadioButtonTag
                Left = 400
                Top = 48
                Width = 110
                Height = 17
                Caption = 'Sup. Circuito'
                TabOrder = 5
                _Campo = 'FLG_SITUACAO'
                _Tipo = tpChar
                _Valor = 'C'
                _Default = False
              end
              object optAnciao: TRadioButtonTag
                Left = 400
                Top = 16
                Width = 110
                Height = 17
                Caption = '&Anci'#227'o'
                TabOrder = 4
                _Campo = 'FLG_SITUACAO'
                _Tipo = tpChar
                _Valor = 'A'
                _Default = False
              end
              object optSupDistrito: TRadioButtonTag
                Left = 552
                Top = 16
                Width = 110
                Height = 17
                Caption = 'Sup. Distri&to'
                TabOrder = 6
                _Campo = 'FLG_SITUACAO'
                _Tipo = tpChar
                _Valor = 'T'
                _Default = False
              end
              object optDesassociado: TRadioButtonTag
                Left = 552
                Top = 48
                Width = 110
                Height = 17
                Caption = 'Desassociado'
                TabOrder = 7
                _Campo = 'FLG_SITUACAO'
                _Tipo = tpChar
                _Valor = 'D'
                _Default = False
              end
            end
            object grpPioneiro: TGroupBox
              Left = 4
              Top = 82
              Width = 709
              Height = 44
              Caption = 'Pioneiro'
              TabOrder = 1
              object optPioneiroNao: TRadioButtonTag
                Left = 72
                Top = 18
                Width = 105
                Height = 17
                Caption = '&N'#227'o'
                Checked = True
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 0
                TabStop = True
                _Campo = 'FLG_PIONEIRO'
                _Tipo = tpChar
                _Valor = 'N'
                _Default = True
              end
              object optPioneiroAuxiliar: TRadioButtonTag
                Left = 239
                Top = 18
                Width = 105
                Height = 17
                Caption = 'Au&xiliar'
                TabOrder = 1
                _Campo = 'FLG_PIONEIRO'
                _Tipo = tpChar
                _Valor = 'A'
                _Default = False
              end
              object optPioneiroEspecial: TRadioButtonTag
                Left = 573
                Top = 18
                Width = 105
                Height = 17
                Caption = '&Especial'
                TabOrder = 3
                _Campo = 'FLG_PIONEIRO'
                _Tipo = tpChar
                _Valor = 'E'
                _Default = False
              end
              object optPioneiroRegular: TRadioButtonTag
                Left = 406
                Top = 18
                Width = 105
                Height = 17
                Caption = '&Regular'
                TabOrder = 2
                _Campo = 'FLG_PIONEIRO'
                _Tipo = tpChar
                _Valor = 'R'
                _Default = False
              end
            end
            object grpBatismo: TGroupBox
              Left = 4
              Top = 130
              Width = 241
              Height = 49
              Caption = 'Data do Bastismo'
              TabOrder = 2
              object txtDatBatismo: TEditLabel
                Left = 89
                Top = 18
                Width = 120
                Height = 21
                _LabelCaption = 'Batismo'
                _Campo = 'DAT_BATISMO'
                LabelComponent.Width = 46
                LabelComponent.Height = 13
                LabelComponent.Caption = 'Batismo'
                _Tipo = Data
                CharCase = ecUpperCase
                EditMask = '99/99/0000;1; '
                MaxLength = 10
                TabOrder = 0
                Text = '  /  /    '
              end
            end
          end
          object tab3: TTabSheet
            Caption = 'Escola do Minist'#233'rio Teocr'#225'tico'
            ImageIndex = 2
            object lblParte: TLabel
              Left = 8
              Top = 56
              Width = 350
              Height = 13
              Caption = 'Selecione as designa'#231#245'es em que essa pessoa poder'#225' atuar:'
            end
            object grpRestricao: TGroupBox
              Left = 4
              Top = 6
              Width = 389
              Height = 43
              Caption = 'Restri'#231#227'o'
              TabOrder = 1
              object chkMoradora: TCheckBoxTag
                Left = 8
                Top = 20
                Width = 281
                Height = 17
                Caption = 'Designar somente como moradora'
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                _Campo = 'FLG_MORADORA'
                _Tipo = tpChar
                _Valor = 'S'
              end
            end
            object lvwParte: TListViewTag
              Left = 4
              Top = 72
              Width = 389
              Height = 121
              Checkboxes = True
              Columns = <
                item
                  Caption = 'Designa'#231#227'o'
                  Width = 360
                end
                item
                  Caption = 'C'#243'digo'
                  Width = 0
                end>
              HideSelection = False
              ReadOnly = True
              TabOrder = 0
              ViewStyle = vsReport
            end
          end
        end
        object chkAtivo: TCheckBoxTag
          Left = 416
          Top = 27
          Width = 97
          Height = 17
          Caption = 'Ati&vo'
          Checked = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          State = cbChecked
          TabOrder = 1
          OnClick = chkAtivoClick
          _Campo = 'FLG_ATIVO'
          _Tipo = tpChar
          _Valor = 'S'
        end
      end
    end
  end
end
