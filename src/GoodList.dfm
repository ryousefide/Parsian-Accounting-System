object FGoodList: TFGoodList
  Tag = 1
  Left = 243
  Top = 112
  BiDiMode = bdRightToLeft
  BorderStyle = bsSingle
  BorderWidth = 2
  Caption = '·Ì”  ﬂ«·« Â«'
  ClientHeight = 499
  ClientWidth = 823
  Color = clBtnFace
  Font.Charset = ARABIC_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poDefaultSizeOnly
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = BexitClick
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 29
    Width = 823
    Height = 5
    Align = alTop
    Shape = bsBottomLine
  end
  object Bevel2: TBevel
    Left = 0
    Top = 431
    Width = 823
    Height = 5
    Align = alBottom
    Shape = bsTopLine
  end
  object Goods: TDBGrid
    Left = 0
    Top = 34
    Width = 823
    Height = 397
    Align = alClient
    BiDiMode = bdRightToLeft
    DataSource = FroDM.GoodDs
    FixedColor = clTeal
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentBiDiMode = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = ARABIC_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Mitra'
    TitleFont.Style = [fsBold]
    OnColEnter = GoodsColEnter
    OnColExit = GoodsColExit
    OnColumnMoved = GoodsColumnMoved
    OnDrawColumnCell = GoodsDrawColumnCell
    OnKeyDown = GoodsKeyDown
    OnKeyPress = GoodsKeyPress
    OnTitleClick = GoodsTitleClick
    Columns = <
      item
        Alignment = taCenter
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'Kod'
        Title.Alignment = taCenter
        Title.Caption = 'ﬂœ ﬂ«·«'
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Gene'
        Title.Alignment = taCenter
        Title.Caption = 'ﬂœ ⁄„Ê„Ì'
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nam'
        Title.Alignment = taCenter
        Title.Caption = '‘—Õ ﬂ«·«'
        Width = 208
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Unit'
        Title.Alignment = taCenter
        Title.Caption = 'Ê«Õœ ﬂ«·«'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Pkh'
        Title.Alignment = taCenter
        Title.Caption = 'ﬁÌ„  Œ—Ìœ'
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Pfro'
        Title.Alignment = taCenter
        Title.Caption = 'ﬁÌ„  ›—Ê‘'
        Width = 95
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Rquant'
        Title.Alignment = taCenter
        Title.Caption = 'Õœ«ﬁ·'
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Kol'
        Title.Alignment = taCenter
        Title.Caption = 'ﬂœﬂ·'
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Mo'
        Title.Alignment = taCenter
        Title.Caption = '„⁄Ì‰'
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Taf'
        Title.Alignment = taCenter
        Title.Caption = ' ›’Ì·Ì'
        Width = 42
        Visible = True
      end>
  end
  object Panel1: TPanel
    Tag = 1
    Left = 0
    Top = 436
    Width = 823
    Height = 63
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    Visible = False
    object Label10: TLabel
      Left = 773
      Top = 7
      Width = 49
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      BiDiMode = bdRightToLeft
      Caption = '‘—Õ ﬂ«·«'
      ParentBiDiMode = False
    end
    object Bevel3: TBevel
      Left = 144
      Top = 2
      Width = 199
      Height = 57
      Hint = 'Ã” ÃÊ »— «”«” ﬂœ Â«Ì ›—⁄Ì'
      ParentShowHint = False
      Shape = bsFrame
      ShowHint = True
      Style = bsRaised
    end
    object Bevel5: TBevel
      Left = 343
      Top = 2
      Width = 213
      Height = 57
      Hint = 'Ã” ÃÊ »— «”«” ﬂœ ﬂ«·« Ê ﬂœ ⁄„Ê„Ì'
      ParentShowHint = False
      Shape = bsFrame
      ShowHint = True
      Style = bsRaised
    end
    object Label2: TLabel
      Left = 271
      Top = 8
      Width = 32
      Height = 21
      Alignment = taCenter
      AutoSize = False
      BiDiMode = bdRightToLeft
      Caption = 'ﬂœﬂ·'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
    end
    object Label3: TLabel
      Left = 194
      Top = 8
      Width = 32
      Height = 21
      Alignment = taCenter
      AutoSize = False
      BiDiMode = bdRightToLeft
      Caption = '„⁄Ì‰'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
    end
    object Label4: TLabel
      Left = 271
      Top = 32
      Width = 65
      Height = 21
      Alignment = taCenter
      AutoSize = False
      BiDiMode = bdRightToLeft
      Caption = ' ›’Ì·Ì «“'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
    end
    object Label1: TLabel
      Left = 195
      Top = 32
      Width = 30
      Height = 21
      Alignment = taCenter
      AutoSize = False
      BiDiMode = bdRightToLeft
      Caption = '«·‹‹Ì'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
    end
    object Label7: TLabel
      Left = 496
      Top = 9
      Width = 52
      Height = 18
      Alignment = taCenter
      AutoSize = False
      BiDiMode = bdRightToLeft
      Caption = 'ﬂœ ﬂ«·« «“ '
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
    end
    object Label8: TLabel
      Left = 403
      Top = 9
      Width = 30
      Height = 18
      Alignment = taCenter
      AutoSize = False
      BiDiMode = bdRightToLeft
      Caption = '«·‹Ì'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
    end
    object Label9: TLabel
      Left = 497
      Top = 33
      Width = 54
      Height = 18
      Alignment = taCenter
      AutoSize = False
      BiDiMode = bdRightToLeft
      Caption = 'ﬂœ ⁄„Ê„Ì'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
    end
    object Label5: TLabel
      Left = 402
      Top = 33
      Width = 30
      Height = 18
      Alignment = taCenter
      AutoSize = False
      BiDiMode = bdRightToLeft
      Caption = '«·‹Ì'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
    end
    object FGood: TEdit
      Left = 563
      Top = 4
      Width = 203
      Height = 21
      AutoSize = False
      BiDiMode = bdRightToLeft
      Constraints.MaxHeight = 26
      ParentBiDiMode = False
      TabOrder = 0
      OnChange = FGoodChange
      OnKeyDown = FGoodKeyDown
      OnKeyPress = FGoodKeyPress
    end
    object BNext: TBitBtn
      Left = 3
      Top = 22
      Width = 67
      Height = 19
      Caption = '»⁄œÌ'
      Default = True
      TabOrder = 11
      OnClick = BNextClick
    end
    object BPrev: TBitBtn
      Left = 70
      Top = 22
      Width = 67
      Height = 19
      Caption = 'ﬁ»·Ì'
      TabOrder = 12
      OnClick = BPrevClick
    end
    object BRet: TBitBtn
      Left = 3
      Top = 41
      Width = 134
      Height = 19
      Cancel = True
      Caption = '»«“ê‘ '
      TabOrder = 13
      OnClick = BRetClick
    end
    object BFirst: TBitBtn
      Left = 3
      Top = 3
      Width = 67
      Height = 19
      Caption = '«Ê·Ì‰'
      TabOrder = 9
      OnClick = BFirstClick
    end
    object BLast: TBitBtn
      Left = 70
      Top = 3
      Width = 67
      Height = 19
      Caption = '¬Œ—Ì‰'
      TabOrder = 10
      OnClick = BLastClick
    end
    object FKod1: TEdit
      Left = 227
      Top = 8
      Width = 40
      Height = 21
      AutoSize = False
      BiDiMode = bdRightToLeft
      MaxLength = 3
      ParentBiDiMode = False
      TabOrder = 5
      OnChange = FGoodChange
      OnKeyPress = FMquantKeyPress
    end
    object FKod2: TEdit
      Left = 150
      Top = 8
      Width = 40
      Height = 21
      AutoSize = False
      BiDiMode = bdRightToLeft
      MaxLength = 3
      ParentBiDiMode = False
      TabOrder = 6
      OnChange = FGoodChange
      OnKeyPress = FMquantKeyPress
    end
    object FKod3: TEdit
      Left = 227
      Top = 32
      Width = 40
      Height = 21
      AutoSize = False
      BiDiMode = bdRightToLeft
      MaxLength = 4
      ParentBiDiMode = False
      TabOrder = 7
      OnChange = FGoodChange
      OnKeyPress = FMquantKeyPress
    end
    object FKod31: TEdit
      Left = 150
      Top = 32
      Width = 40
      Height = 21
      AutoSize = False
      BiDiMode = bdRightToLeft
      MaxLength = 4
      ParentBiDiMode = False
      TabOrder = 8
      OnChange = FGoodChange
      OnKeyPress = FMquantKeyPress
    end
    object SKod: TEdit
      Left = 436
      Top = 8
      Width = 55
      Height = 21
      AutoSize = False
      BiDiMode = bdRightToLeft
      Constraints.MaxHeight = 21
      ParentBiDiMode = False
      TabOrder = 1
      OnChange = FGoodChange
      OnKeyPress = FMquantKeyPress
    end
    object Ekod: TEdit
      Left = 348
      Top = 8
      Width = 50
      Height = 21
      AutoSize = False
      BiDiMode = bdRightToLeft
      Constraints.MaxHeight = 21
      ParentBiDiMode = False
      TabOrder = 2
      OnChange = FGoodChange
      OnKeyPress = FMquantKeyPress
    end
    object Gene: TEdit
      Left = 436
      Top = 32
      Width = 55
      Height = 21
      AutoSize = False
      BiDiMode = bdRightToLeft
      Constraints.MaxHeight = 21
      MaxLength = 2
      ParentBiDiMode = False
      TabOrder = 3
      OnChange = FGoodChange
      OnKeyPress = FMquantKeyPress
    end
    object Gene1: TEdit
      Left = 348
      Top = 32
      Width = 50
      Height = 21
      AutoSize = False
      BiDiMode = bdRightToLeft
      Constraints.MaxHeight = 21
      ParentBiDiMode = False
      TabOrder = 4
      OnChange = FGoodChange
      OnKeyPress = FMquantKeyPress
    end
    object Cb: TCheckBox
      Left = 571
      Top = 36
      Width = 129
      Height = 17
      TabStop = False
      Anchors = [akLeft, akBottom]
      BiDiMode = bdRightToLeft
      Caption = 'œ— ›—„Â« «⁄„«· ‘Êœ'
      ParentBiDiMode = False
      TabOrder = 14
      Visible = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 823
    Height = 29
    Align = alTop
    TabOrder = 2
    object Sp2: TSpeedButton
      Left = 493
      Top = 3
      Width = 23
      Height = 22
      Hint = '¬“«œ ‘œ‰ ò«·«'
      Anchors = [akTop, akRight]
      Flat = True
      ParentShowHint = False
      ShowHint = True
      OnClick = Sp2Click
    end
    object Sp1: TSpeedButton
      Left = 516
      Top = 3
      Width = 23
      Height = 22
      Hint = '»·Êò ‘œ‰ ò«·«'
      Anchors = [akTop, akRight]
      Flat = True
      ParentShowHint = False
      ShowHint = True
      Spacing = 0
      OnClick = Sp1Click
    end
    object bFilter: TBitBtn
      Left = 276
      Top = 2
      Width = 66
      Height = 25
      Anchors = [akRight, akBottom]
      BiDiMode = bdRightToLeft
      Caption = '&›Ì· —'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Mitra'
      Font.Style = [fsBold, fsItalic]
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 2
      OnClick = bFilterClick
    end
    object Bprint: TBitBtn
      Left = 144
      Top = 2
      Width = 66
      Height = 25
      Anchors = [akRight, akBottom]
      BiDiMode = bdRightToLeft
      Caption = '&ç«Å '
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Mitra'
      Font.Style = [fsBold, fsItalic]
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 4
      OnClick = BprintClick
    end
    object BSearch: TBitBtn
      Left = 210
      Top = 2
      Width = 66
      Height = 25
      Anchors = [akRight, akBottom]
      BiDiMode = bdRightToLeft
      Caption = '&Ã” ÃÊ'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Mitra'
      Font.Style = [fsBold, fsItalic]
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 3
      OnClick = BSearchClick
    end
    object BNew: TBitBtn
      Left = 755
      Top = 2
      Width = 66
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&ÃœÌœ'
      ModalResult = 5
      TabOrder = 0
      OnClick = BNewClick
    end
    object BEdit: TBitBtn
      Left = 689
      Top = 2
      Width = 66
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '«’·«Õ'
      TabOrder = 1
      OnClick = BEditClick
    end
    object BDel: TBitBtn
      Left = 622
      Top = 2
      Width = 66
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Õ–›'
      TabOrder = 5
      OnClick = BDelClick
    end
    object Bexit: TBitBtn
      Left = 3
      Top = 2
      Width = 57
      Height = 25
      Anchors = [akLeft, akBottom]
      BiDiMode = bdRightToLeft
      Cancel = True
      Caption = 'Œ—ÊÃ'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Mitra'
      Font.Style = [fsBold, fsItalic]
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 6
      OnClick = BexitClick
    end
  end
end
