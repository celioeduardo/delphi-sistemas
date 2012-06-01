object frmPesquisa: TfrmPesquisa
  Left = 84
  Top = 106
  Width = 610
  Height = 358
  Caption = 'Pesquisa'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  DesignSize = (
    602
    324)
  PixelsPerInch = 96
  TextHeight = 13
  object lblStatus: TLabel
    Left = 4
    Top = 306
    Width = 41
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'lblStatus'
  end
  object GroupBox1: TGroupBox
    Left = 3
    Top = 0
    Width = 378
    Height = 49
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    DesignSize = (
      378
      49)
    object ctl: TEditLabel
      Left = 8
      Top = 16
      Width = 364
      Height = 21
      _LabelCaption = 'ctl '
      LabelComponent.Width = 14
      LabelComponent.Height = 13
      LabelComponent.Caption = 'ctl '
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      OnEnter = ctlEnter
      OnKeyDown = ctlKeyDown
    end
  end
  object grpFiltro: TRadioGroup
    Left = 383
    Top = 0
    Width = 217
    Height = 49
    Anchors = [akTop, akRight]
    Caption = 'Op'#231#245'es'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Contenha...'
      'Come'#231'a com...'
      'Termina com...'
      'Exatamente...')
    TabOrder = 1
    OnClick = grpFiltroClick
  end
  object grd: TDBGrid
    Left = 3
    Top = 51
    Width = 596
    Height = 231
    Anchors = [akLeft, akTop, akRight, akBottom]
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = grdDblClick
    OnKeyDown = grdKeyDown
  end
  object btnLocalizar: TButton
    Left = 400
    Top = 287
    Width = 89
    Height = 33
    Anchors = [akRight, akBottom]
    Caption = '&Localizar'
    TabOrder = 3
    OnClick = btnLocalizarClick
  end
  object btnFechar: TButton
    Left = 504
    Top = 287
    Width = 89
    Height = 33
    Anchors = [akRight, akBottom]
    Caption = '&Fechar'
    TabOrder = 4
    OnClick = btnFecharClick
  end
end
