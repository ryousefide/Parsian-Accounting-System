object FGFormula: TFGFormula
  Tag = 1
  Left = 303
  Top = 185
  BiDiMode = bdRightToLeft
  BorderStyle = bsSingle
  Caption = ' ⁄—Ì› ›—„Ê· ò«·«'
  ClientHeight = 421
  ClientWidth = 479
  Color = clBtnFace
  Font.Charset = ARABIC_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poMainFormCenter
  Visible = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 432
    Top = 6
    Width = 42
    Height = 18
    Anchors = [akTop, akRight]
    AutoSize = False
    Caption = ' ﬂ«·«'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Sp1: TSpeedButton
    Left = 126
    Top = 4
    Width = 23
    Height = 22
    Anchors = [akTop, akRight]
    OnClick = Sp1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 102
    Top = 4
    Width = 23
    Height = 22
    Anchors = [akTop, akRight]
    Visible = False
  end
  object GNam: TComboBox
    Left = 157
    Top = 4
    Width = 272
    Height = 21
    Anchors = [akTop, akRight]
    ItemHeight = 13
    Sorted = True
    TabOrder = 0
    OnChange = Sp1Click
    OnDropDown = GNamDropDown
    OnKeyDown = GNamKeyDown
    OnKeyPress = NextTab
  end
  object Bexit: TButton
    Left = 216
    Top = 395
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Œ—ÊÃ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 1
    OnClick = BexitClick
  end
  object Goods: TDBGrid
    Left = 3
    Top = 35
    Width = 474
    Height = 352
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    TitleFont.Charset = ARABIC_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Serif'
    TitleFont.Style = []
    OnColEnter = GoodsColEnter
    OnColExit = GoodsColExit
    OnEditButtonClick = GoodsEditButtonClick
    OnKeyPress = GoodsKeyPress
    Columns = <
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'Kod'
        Title.Caption = 'òœ ò«·«'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nam'
        Title.Caption = '‘—Õ ò«·«'
        Width = 285
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Quant'
        Title.Caption = ' ⁄œ«œ'
        Width = 62
        Visible = True
      end>
    object GList: TPopupListBox
      Left = 304
      Top = 21
      Width = 35
      Height = 352
      TabStop = False
      BiDiMode = bdRightToLeft
      Color = clSilver
      ItemHeight = 13
      Parent = Goods
      ParentBiDiMode = False
      ParentShowHint = False
      ShowHint = True
      Sorted = True
      TabOrder = 0
      Visible = False
      OnKeyDown = GListKeyDown
      OnKeyPress = GListKeyPress
    end
  end
end
