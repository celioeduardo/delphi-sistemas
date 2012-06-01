inherited frmCAD_PUBLICO: TfrmCAD_PUBLICO
  Left = 27
  Top = 50
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
          object tab1: TTabSheet
            Caption = 'Dados Pessoais'
            object edtNOM_CIDADE: TEditLabel
              Left = 104
              Top = 3
              Width = 402
              Height = 21
              _LabelCaption = 'Cidade'
              _Campo = 'NOM_CIDADE'
              LabelComponent.Width = 40
              LabelComponent.Height = 13
              LabelComponent.Caption = 'Cidade'
              _NotNull = True
              MaxLength = 60
              TabOrder = 0
            end
            object edtNOM_UF: TEditLabel
              Left = 584
              Top = 3
              Width = 34
              Height = 21
              _LabelCaption = 'UF'
              _Campo = 'NOM_UF'
              LabelComponent.Width = 14
              LabelComponent.Height = 13
              LabelComponent.Caption = 'UF'
              _NotNull = True
              MaxLength = 2
              TabOrder = 1
            end
            object txtNomRua: TEditLabel
              Left = 104
              Top = 27
              Width = 401
              Height = 21
              _LabelCaption = 'Endere'#231'o'
              _Campo = 'NOM_RUA'
              LabelComponent.Width = 53
              LabelComponent.Height = 13
              LabelComponent.Caption = 'Endere'#231'o'
              MaxLength = 60
              TabOrder = 2
            end
            object edtNOM_BAIRRO: TEditLabel
              Left = 104
              Top = 51
              Width = 401
              Height = 21
              _LabelCaption = 'Bairro'
              _Campo = 'NOM_BAIRRO'
              LabelComponent.Width = 35
              LabelComponent.Height = 13
              LabelComponent.Caption = 'Bairro'
              MaxLength = 60
              TabOrder = 3
            end
            object txtCelular: TEditLabel
              Left = 392
              Top = 75
              Width = 114
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
            object txtTelResidencial: TEditLabel
              Left = 104
              Top = 75
              Width = 116
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
              Top = 99
              Width = 118
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
            object edtNOM_BANCO: TEditLabel
              Left = 103
              Top = 126
              Width = 304
              Height = 21
              _LabelCaption = 'Banco'
              _Campo = 'NOM_BANCO'
              LabelComponent.Width = 35
              LabelComponent.Height = 13
              LabelComponent.Caption = 'Banco'
              MaxLength = 60
              TabOrder = 9
            end
            object edtNUM_AGENCIA: TEditLabel
              Left = 103
              Top = 150
              Width = 118
              Height = 21
              _LabelCaption = 'Ag'#234'ncia'
              _Campo = 'NUM_AGENCIA'
              LabelComponent.Width = 45
              LabelComponent.Height = 13
              LabelComponent.Caption = 'Ag'#234'ncia'
              _Chave = True
              _IsChar = True
              _FormatoNumerico = 5.000000000000000000
              CharCase = ecUpperCase
              MaxLength = 10
              TabOrder = 10
            end
            object edtNUM_RAMAL: TEditLabel
              Left = 288
              Top = 99
              Width = 48
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
            object edtNUM_CONTA: TEditLabel
              Left = 103
              Top = 174
              Width = 118
              Height = 21
              _LabelCaption = 'C/C'
              _Campo = 'NUM_CONTA'
              LabelComponent.Width = 23
              LabelComponent.Height = 13
              LabelComponent.Caption = 'C/C'
              _Chave = True
              _IsChar = True
              _FormatoNumerico = 5.000000000000000000
              CharCase = ecUpperCase
              MaxLength = 15
              TabOrder = 11
            end
            object optCEP: TEditLabel
              Left = 584
              Top = 51
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
