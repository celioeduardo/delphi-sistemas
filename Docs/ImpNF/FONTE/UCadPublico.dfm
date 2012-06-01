inherited frmCadPublico: TfrmCadPublico
  Left = 198
  Top = 132
  Caption = 'Cadastro de P'#250'blico'
  ClientHeight = 292
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl3: TPanel
    Top = 236
    inherited btnLocaliza: TBitBtn
      Visible = False
    end
  end
  inherited tab: TPageControl
    Height = 236
    inherited tabCadastro: TTabSheet
      inherited pnl1: TPanel
        Height = 56
        object edtCodigo: TEditLabel
          Left = 96
          Top = 32
          Width = 121
          Height = 21
          _LabelCaption = 'C'#243'digo '
          _Campo = 'COD_PUBLICO'
          LabelComponent.Width = 44
          LabelComponent.Height = 13
          LabelComponent.Caption = 'C'#243'digo '
          _NotNull = True
          _Tipo = Pesquisa
          TabOrder = 0
          OnClickButton = edtCodigoClickButton
          OnEnter = edtCodigoEnter
          OnExit = edtCodigoExit
        end
      end
      inherited pnl2: TPanel
        Top = 56
        Height = 152
        object edtNome: TEditLabel
          Left = 96
          Top = 0
          Width = 609
          Height = 21
          _LabelCaption = 'Nome '
          _Campo = 'NOM_PUBLICO'
          LabelComponent.Width = 37
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Nome '
          _NotNull = True
          CharCase = ecUpperCase
          MaxLength = 80
          TabOrder = 0
        end
        object edtCNPJ: TEditLabel
          Left = 96
          Top = 47
          Width = 121
          Height = 21
          _LabelCaption = 'CNPJ '
          _Campo = 'NUM_CNPJ'
          LabelComponent.Width = 33
          LabelComponent.Height = 13
          LabelComponent.Caption = 'CNPJ '
          _Tipo = CNPJ
          EditMask = '99\.999\.999\/9999\-99;0; '
          MaxLength = 18
          TabOrder = 2
        end
        object edtIE: TEditLabel
          Left = 280
          Top = 48
          Width = 121
          Height = 21
          _LabelCaption = 'I.E. '
          _Campo = 'NUM_INSC_EST'
          LabelComponent.Width = 24
          LabelComponent.Height = 13
          LabelComponent.Caption = 'I.E. '
          CharCase = ecUpperCase
          MaxLength = 20
          TabOrder = 3
        end
        object edtEndereco: TEditLabel
          Left = 96
          Top = 72
          Width = 609
          Height = 21
          _LabelCaption = 'Endere'#231'o '
          _Campo = 'NOM_ENDERECO'
          LabelComponent.Width = 57
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Endere'#231'o '
          CharCase = ecUpperCase
          MaxLength = 80
          TabOrder = 4
        end
        object edtCIDADE: TEditLabel
          Left = 96
          Top = 96
          Width = 305
          Height = 21
          _LabelCaption = 'Cidade '
          _Campo = 'NOM_CIDADE'
          LabelComponent.Width = 44
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Cidade '
          CharCase = ecUpperCase
          MaxLength = 60
          TabOrder = 5
        end
        object edtBairro: TEditLabel
          Left = 512
          Top = 96
          Width = 193
          Height = 21
          _LabelCaption = 'Bairro '
          _Campo = 'NOM_BAIRRO'
          LabelComponent.Width = 39
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Bairro '
          CharCase = ecUpperCase
          MaxLength = 40
          TabOrder = 6
        end
        object edtCEP: TEditLabel
          Left = 96
          Top = 120
          Width = 121
          Height = 21
          _LabelCaption = 'CEP '
          _Campo = 'NUM_CEP'
          LabelComponent.Width = 27
          LabelComponent.Height = 13
          LabelComponent.Caption = 'CEP '
          _Tipo = CEP
          EditMask = '99999\-999;0; '
          MaxLength = 9
          TabOrder = 7
        end
        object edtFONE: TEditLabel
          Left = 282
          Top = 120
          Width = 119
          Height = 21
          _LabelCaption = 'Fone '
          _Campo = 'NUM_FONE'
          LabelComponent.Width = 31
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Fone '
          _Tipo = Fone
          EditMask = '\(99\)9999\-9999;0; '
          MaxLength = 13
          TabOrder = 8
        end
        object cboUF: TComboBoxTag
          Left = 512
          Top = 120
          Width = 81
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          Sorted = True
          TabOrder = 9
          _Campo = 'NOM_UF'
          _Tipo = tpChar
          _Label.Width = 26
          _Label.Height = 13
          _Label.Caption = 'U.F. '
        end
        object edtPraca: TEditLabel
          Left = 96
          Top = 23
          Width = 609
          Height = 21
          _LabelCaption = 'Pra'#231'a Pagto '
          _Campo = 'NOM_PRACA_PAGTO'
          LabelComponent.Width = 72
          LabelComponent.Height = 13
          LabelComponent.Caption = 'Pra'#231'a Pagto '
          CharCase = ecUpperCase
          MaxLength = 80
          TabOrder = 1
        end
      end
    end
  end
end
