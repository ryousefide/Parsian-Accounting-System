object FTolid: TFTolid
  Tag = 1
  Left = 169
  Top = 109
  BiDiMode = bdRightToLeft
  BorderStyle = bsNone
  BorderWidth = 5
  Caption = '»—ê  Ê·Ìœ ﬂ«·«'
  ClientHeight = 472
  ClientWidth = 714
  Color = clBtnFace
  Font.Charset = ARABIC_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 713
    Height = 472
    Anchors = [akLeft, akTop, akRight, akBottom]
  end
  object Label4: TLabel
    Left = 665
    Top = 5
    Width = 35
    Height = 19
    Anchors = [akTop, akRight]
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '‘„«—Â'
    Color = clBtnFace
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    Transparent = True
    Layout = tlCenter
  end
  object Label3: TLabel
    Left = 94
    Top = 7
    Width = 36
    Height = 16
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = ' «—ÌŒ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    Transparent = True
    Layout = tlCenter
  end
  object lbSum: TDBText
    Left = 517
    Top = 413
    Width = 134
    Height = 19
    Alignment = taRightJustify
    Anchors = [akRight, akBottom]
    BiDiMode = bdRightToLeftNoAlign
    DataField = 'Outp'
    DataSource = FroDM.TolDs
    ParentBiDiMode = False
  end
  object Label1: TLabel
    Left = 659
    Top = 413
    Width = 41
    Height = 19
    Anchors = [akRight, akBottom]
    AutoSize = False
    Caption = '„»·€ „Ê«œ'
    Layout = tlCenter
  end
  object Label2: TLabel
    Left = 173
    Top = 412
    Width = 57
    Height = 19
    Anchors = [akLeft, akBottom]
    AutoSize = False
    Caption = '„»·€ „Õ’Ê·'
    Layout = tlCenter
  end
  object lbIn: TDBText
    Left = 27
    Top = 413
    Width = 136
    Height = 19
    Alignment = taRightJustify
    Anchors = [akLeft, akBottom]
    BiDiMode = bdRightToLeftNoAlign
    DataField = 'Inp'
    DataSource = FroDM.TolDs
    ParentBiDiMode = False
  end
  object Goods: TDBGrid
    Left = 5
    Top = 29
    Width = 704
    Height = 231
    Anchors = [akLeft, akTop, akRight, akBottom]
    BiDiMode = bdRightToLeft
    DataSource = FroDM.RejBinvoGoodDs
    FixedColor = clTeal
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Serif'
    Font.Style = []
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = ARABIC_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Mitra'
    TitleFont.Style = [fsBold]
    OnColEnter = GoodsColEnter
    OnColExit = GoodsColExit
    OnEditButtonClick = GoodsEditButtonClick
    OnEnter = GoodsEnter
    OnKeyDown = GoodsKeyDown
    OnKeyPress = GoodsKeyPress
    Columns = <
      item
        Alignment = taCenter
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'Radif'
        Title.Alignment = taCenter
        Title.Caption = '#'
        Width = 27
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Kod'
        Title.Alignment = taCenter
        Title.Caption = 'ﬂœ ﬂ«·«'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nam'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = '‘—Õ ﬂ«·«'
        Width = 159
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Color'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = '„œ·'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'AnbNam'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = '«‰»«—'
        Width = 61
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'AnbKod'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'ﬁ›”Â'
        Visible = False
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Quant'
        Title.Alignment = taCenter
        Title.Caption = '„ﬁœ«—'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Unit'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'Ê«Õœ'
        Width = 55
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'Pfee'
        Title.Alignment = taCenter
        Title.Caption = '»Â«Ì Ê«Õœ'
        Width = 67
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Perc'
        Title.Caption = 'œ—’œ'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Ptotal'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'Ã„⁄'
        Width = 94
        Visible = True
      end>
    object GList: TPopupListBox
      Left = 442
      Top = 20
      Width = 35
      Height = 231
      Hint = 'ﬂ«·«-„œ·-«‰»«—-ﬁ›”Â- ⁄œ«œ'
      TabStop = False
      Anchors = [akTop, akRight]
      BiDiMode = bdRightToLeft
      Color = clSilver
      ExtendedSelect = False
      ItemHeight = 16
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
  object FNo: TEdit
    Left = 579
    Top = 4
    Width = 84
    Height = 21
    Anchors = [akTop, akRight]
    AutoSize = False
    BiDiMode = bdRightToLeftNoAlign
    Constraints.MaxHeight = 26
    ParentBiDiMode = False
    TabOrder = 0
    OnKeyPress = FNoKeyPress
  end
  object Goods_In: TDBGrid
    Left = 5
    Top = 265
    Width = 705
    Height = 137
    Anchors = [akLeft, akRight, akBottom]
    BiDiMode = bdRightToLeft
    DataSource = FroDM.BinvoGoodDs
    FixedColor = clTeal
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Serif'
    Font.Style = []
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 3
    TitleFont.Charset = ARABIC_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Mitra'
    TitleFont.Style = [fsBold]
    OnColEnter = Goods_InColEnter
    OnColExit = Goods_InColExit
    OnEditButtonClick = Goods_InEditButtonClick
    OnEnter = Goods_InEnter
    OnKeyDown = Goods_InKeyDown
    OnKeyPress = Goods_InKeyPress
    Columns = <
      item
        Alignment = taCenter
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'Radif'
        Title.Alignment = taCenter
        Title.Caption = '—œÌ›'
        Width = 31
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Kod'
        Title.Alignment = taCenter
        Title.Caption = 'ﬂœ ﬂ«·«'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nam'
        Title.Alignment = taCenter
        Title.Caption = '‘—Õ ﬂ«·«'
        Width = 127
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Color'
        Title.Alignment = taCenter
        Title.Caption = '„œ·'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'AnbNam'
        Title.Alignment = taCenter
        Title.Caption = '«‰»«—'
        Width = 84
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Anbkod'
        Title.Alignment = taCenter
        Title.Caption = 'ﬁ›”Â'
        Visible = False
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Quant'
        Title.Alignment = taCenter
        Title.Caption = '„ﬁœ«—'
        Width = 73
        Visible = True
      end
      item
        ButtonStyle = cbsNone
        Expanded = False
        FieldName = 'Unit'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'Ê«Õœ'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Pfee'
        Title.Alignment = taCenter
        Title.Caption = 'ﬁÌ„   „«„ ‘œÂ'
        Width = 77
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Perc'
        Title.Alignment = taCenter
        Title.Caption = 'œ—’œ'
        Visible = False
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'Ptotal'
        Title.Alignment = taCenter
        Title.Caption = 'Ã„⁄'
        Width = 95
        Visible = True
      end>
    object GList_In: TPopupListBox
      Left = 275
      Top = 19
      Width = 35
      Height = 137
      TabStop = False
      BiDiMode = bdRightToLeft
      Color = clSilver
      ItemHeight = 13
      Parent = Goods_In
      ParentBiDiMode = False
      ParentShowHint = False
      ShowHint = True
      Sorted = True
      TabOrder = 0
      Visible = False
      OnKeyDown = GList_InKeyDown
      OnKeyPress = GList_InKeyPress
    end
    object CList: TPopupListBox
      Left = 329
      Top = 25
      Width = 35
      Height = 137
      TabStop = False
      BiDiMode = bdRightToLeft
      Color = clSilver
      ItemHeight = 13
      Parent = Goods_In
      ParentBiDiMode = False
      ParentShowHint = False
      ShowHint = True
      Sorted = True
      TabOrder = 1
      Visible = False
      OnKeyDown = CListKeyDown
      OnKeyPress = CListKeyPress
    end
    object AList: TPopupListBox
      Left = 375
      Top = 17
      Width = 35
      Height = 137
      TabStop = False
      BiDiMode = bdRightToLeft
      Color = clSilver
      ItemHeight = 13
      Parent = Goods_In
      ParentBiDiMode = False
      Sorted = True
      TabOrder = 2
      Visible = False
      OnKeyDown = AListKeyDown
      OnKeyPress = AListKeyPress
    end
  end
  object Dat1: TMaskEdit
    Left = 6
    Top = 3
    Width = 79
    Height = 21
    AutoSize = False
    BiDiMode = bdRightToLeft
    Constraints.MaxHeight = 21
    EditMask = '1300/00/00;1;_'
    MaxLength = 10
    ParentBiDiMode = False
    TabOrder = 1
    Text = '13  /  /  '
    OnEnter = Dat1Enter
    OnExit = Dat1Exit
    OnKeyPress = NexTab
  end
  object Panel1: TPanel
    Left = 89
    Top = 438
    Width = 536
    Height = 33
    Anchors = [akBottom]
    AutoSize = True
    BevelInner = bvLowered
    BorderWidth = 2
    TabOrder = 4
    object BPrev: TBitBtn
      Left = 4
      Top = 4
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'ﬁ»·Ì'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = BPrevClick
    end
    object Bnext: TBitBtn
      Left = 79
      Top = 4
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '»⁄œÌ'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BnextClick
    end
    object Bedit: TBitBtn
      Left = 154
      Top = 4
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&ÊÌ—«Ì‘'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = BeditClick
    end
    object Bsave: TBitBtn
      Left = 307
      Top = 4
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'À» (F3)'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = BsaveClick
    end
    object Bdel: TBitBtn
      Left = 382
      Top = 4
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Õ–›'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = BdelClick
    end
    object BCalc: TBitBtn
      Left = 229
      Top = 4
      Width = 78
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '„Õ«”»Â ﬁÌ„ '
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = BCalcClick
    end
    object Bexit: TBitBtn
      Left = 457
      Top = 4
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Cancel = True
      Caption = 'Œ—ÊÃ'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnClick = BexitClick
    end
  end
  object BQu: TQuery
    SQL.Strings = (
      'SELECT  Sum(B."Quant") , D."Quant"'
      'FROM BinvoGood  B, Depot  D'
      'WHERE '
      'Group By D."Quant"')
    Left = 264
    Top = 1
  end
  object EdQu: TQuery
    SQL.Strings = (
      'SELECT *  FROM BinvoGood I'
      'WHERE')
    Left = 190
    Top = 289
  end
  object EdQu2: TQuery
    SQL.Strings = (
      'SELECT *  FROM RejBinvoGood I'
      'WHERE')
    Left = 226
    Top = 288
  end
end
