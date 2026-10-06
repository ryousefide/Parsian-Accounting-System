object FDIRej: TFDIRej
  Tag = 1
  Left = 206
  Top = 161
  Width = 844
  Height = 461
  BiDiMode = bdLeftToRight
  Caption = '»—ê‘  »Â «‰»«— '
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
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 626
    Top = 5
    Width = 53
    Height = 23
    Alignment = taRightJustify
    Anchors = [akTop, akRight]
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '»Õ”«»'
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
  object Label3: TLabel
    Left = 777
    Top = 33
    Width = 56
    Height = 19
    Alignment = taRightJustify
    Anchors = [akTop, akRight]
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
  object Label4: TLabel
    Left = 776
    Top = 5
    Width = 56
    Height = 20
    Alignment = taRightJustify
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
  object Label6: TLabel
    Left = 169
    Top = 358
    Width = 51
    Height = 20
    Alignment = taRightJustify
    Anchors = [akLeft, akBottom]
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '&Ã„⁄ ﬂ·'
    Color = clBtnFace
    FocusControl = FPkol
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentColor = False
    ParentFont = False
    Transparent = True
    Layout = tlCenter
  end
  object Label10: TLabel
    Left = 776
    Top = 60
    Width = 56
    Height = 24
    Hint = '‘„«—Â ÕÊ«·Â „—»ÊÿÂ'
    Alignment = taRightJustify
    Anchors = [akTop, akRight]
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '‘ .ÕÊ«·Â'
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
  object Label15: TLabel
    Left = 626
    Top = 33
    Width = 53
    Height = 19
    Alignment = taRightJustify
    Anchors = [akTop, akRight]
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = 'Å—ÊéÂ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    Transparent = True
  end
  object Label16: TLabel
    Left = 626
    Top = 60
    Width = 53
    Height = 19
    Alignment = taRightJustify
    Anchors = [akTop, akRight]
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '„—ò“'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    Transparent = True
  end
  object Label2: TLabel
    Left = 775
    Top = 87
    Width = 56
    Height = 24
    Hint = '‘„«—Â ›«ﬂ Ê— ’«œ— ‘œÂ'
    Alignment = taRightJustify
    Anchors = [akTop, akRight]
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = ' Ê÷ÌÕ« '
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
  object FPkol: TDBEdit
    Left = 35
    Top = 358
    Width = 127
    Height = 20
    Anchors = [akLeft, akBottom]
    AutoSize = False
    BiDiMode = bdRightToLeftNoAlign
    DataField = 'Pkol'
    DataSource = FroDM.IRejDs
    ParentBiDiMode = False
    ReadOnly = True
    TabOrder = 8
    OnEnter = FPkolEnter
    OnKeyPress = NexTab
  end
  object Goods: TDBGrid
    Left = 1
    Top = 116
    Width = 835
    Height = 236
    Anchors = [akLeft, akTop, akRight, akBottom]
    BiDiMode = bdRightToLeft
    DataSource = FroDM.IRejGDs
    FixedColor = clTeal
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Serif'
    Font.Style = []
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 7
    TitleFont.Charset = ARABIC_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Mitra'
    TitleFont.Style = [fsBold]
    OnColEnter = GoodsColEnter
    OnColExit = GoodsColExit
    OnDblClick = GoodsDblClick
    OnDragDrop = GoodsDragDrop
    OnDragOver = GoodsDragOver
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
        Title.Caption = '—œÌ›'
        Width = 29
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Kod'
        Title.Alignment = taCenter
        Title.Caption = 'ﬂœ ﬂ«·«'
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nam'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = '‘—Õ ﬂ«·«/Œœ„« '
        Width = 172
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
        Width = 108
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Quant'
        Title.Alignment = taCenter
        Title.Caption = '„ﬁœ«—'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Unit'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'Ê«Õœ'
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Pfee'
        Title.Alignment = taCenter
        Title.Caption = '»Â«Ì Ê«Õœ'
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Ptotal'
        Title.Alignment = taCenter
        Title.Caption = 'Ã„⁄'
        Width = 111
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'AnbKod'
        Title.Alignment = taCenter
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Reject'
        Title.Alignment = taCenter
        Title.Caption = '„⁄«œ· —Ì«·Ì'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Serial'
        Title.Alignment = taCenter
        Title.Caption = '‘—Õ'
        Width = 155
        Visible = True
      end>
    object GList: TPopupListBox
      Left = 645
      Top = 20
      Width = 35
      Height = 236
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
      OnDblClick = GListDblClick
      OnKeyDown = GListKeyDown
      OnKeyPress = GListKeyPress
    end
    object AList: TPopupListBox
      Left = 341
      Top = 19
      Width = 35
      Height = 236
      TabStop = False
      BiDiMode = bdRightToLeft
      Color = clSilver
      ItemHeight = 16
      Parent = Goods
      ParentBiDiMode = False
      Sorted = True
      TabOrder = 1
      Visible = False
      OnKeyDown = AListKeyDown
      OnKeyPress = AListKeyPress
    end
    object CList: TPopupListBox
      Left = 265
      Top = 17
      Width = 35
      Height = 236
      TabStop = False
      BiDiMode = bdRightToLeft
      Color = clSilver
      ItemHeight = 16
      Parent = Goods
      ParentBiDiMode = False
      ParentShowHint = False
      ShowHint = True
      Sorted = True
      TabOrder = 2
      Visible = False
      OnKeyDown = CListKeyDown
      OnKeyPress = CListKeyPress
    end
  end
  object FNam: TDBComboBox
    Left = 399
    Top = 5
    Width = 220
    Height = 21
    Anchors = [akTop, akRight]
    BiDiMode = bdRightToLeft
    DataField = 'Nam'
    DataSource = FroDM.IRejDs
    ItemHeight = 13
    ParentBiDiMode = False
    Sorted = True
    TabOrder = 3
    OnDragDrop = FNamDragDrop
    OnDragOver = FNamDragOver
    OnKeyDown = FNamKeyDown
    OnKeyPress = NexTab
  end
  object FNo: TEdit
    Left = 685
    Top = 5
    Width = 83
    Height = 21
    Anchors = [akTop, akRight]
    AutoSize = False
    BiDiMode = bdRightToLeft
    Constraints.MaxHeight = 26
    ParentBiDiMode = False
    TabOrder = 0
    OnKeyPress = FNoKeyPress
  end
  object FPINo: TDBEdit
    Left = 685
    Top = 60
    Width = 83
    Height = 21
    Anchors = [akTop, akRight]
    AutoSize = False
    BiDiMode = bdRightToLeft
    DataField = 'RefNo'
    DataSource = FroDM.IRejDs
    ParentBiDiMode = False
    TabOrder = 2
    OnKeyPress = FPINoKeyPress
  end
  object Panel1: TPanel
    Tag = 1
    Left = 583
    Top = 355
    Width = 253
    Height = 58
    Anchors = [akRight, akBottom]
    AutoSize = True
    BevelInner = bvLowered
    BorderWidth = 2
    ParentColor = True
    TabOrder = 9
    object Bdel: TBitBtn
      Tag = 2
      Left = 67
      Top = 29
      Width = 52
      Height = 25
      BiDiMode = bdRightToLeft
      Caption = '&Õ–›'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 5
      TabStop = False
      OnClick = BdelClick
    end
    object Bprev: TBitBtn
      Left = 4
      Top = 4
      Width = 63
      Height = 25
      BiDiMode = bdRightToLeft
      Caption = '&ﬁ»·Ì'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 0
      OnClick = BprevClick
    end
    object Bsave: TBitBtn
      Left = 119
      Top = 4
      Width = 58
      Height = 50
      BiDiMode = bdRightToLeft
      Caption = 'À» '
      Enabled = False
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 4
      OnClick = BsaveClick
    end
    object Bnext: TBitBtn
      Left = 67
      Top = 4
      Width = 52
      Height = 25
      BiDiMode = bdRightToLeft
      Caption = '&»⁄œÌ'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 1
      OnClick = BnextClick
    end
    object Bexit: TBitBtn
      Left = 177
      Top = 29
      Width = 72
      Height = 25
      BiDiMode = bdRightToLeft
      Cancel = True
      Caption = 'Œ—ÊÃ'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 6
      OnClick = BexitClick
      Spacing = 2
    end
    object Bprint: TBitBtn
      Left = 177
      Top = 4
      Width = 72
      Height = 25
      BiDiMode = bdRightToLeft
      Caption = '&ç«Å'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 2
      OnClick = BprintClick
    end
    object Bedit: TBitBtn
      Left = 4
      Top = 29
      Width = 63
      Height = 25
      BiDiMode = bdRightToLeft
      Caption = '&ÊÌ—«Ì‘'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 3
      OnClick = BeditClick
    end
  end
  object Dat1: TMaskEdit
    Left = 685
    Top = 33
    Width = 82
    Height = 21
    Anchors = [akTop, akRight]
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
  object Sb1: TStatusBar
    Left = 0
    Top = 413
    Width = 836
    Height = 21
    BiDiMode = bdRightToLeft
    Constraints.MaxHeight = 21
    Panels = <
      item
        BiDiMode = bdRightToLeftNoAlign
        ParentBiDiMode = False
        Width = 200
      end
      item
        Width = 290
      end
      item
        BiDiMode = bdRightToLeft
        ParentBiDiMode = False
        Width = 100
      end>
    ParentBiDiMode = False
    ParentColor = True
    ParentFont = True
    SimplePanel = False
    SimpleText = 
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9 +
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9 +
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9 +
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9 +
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9 +
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9 +
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9 +
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9 +
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9 +
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9 +
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9 +
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9 +
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9 +
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9 +
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9
    SizeGrip = False
    UseSystemFont = False
  end
  object FCost: TDBComboBox
    Left = 399
    Top = 33
    Width = 220
    Height = 21
    Anchors = [akTop, akRight]
    BiDiMode = bdRightToLeft
    DataField = 'Cost'
    DataSource = FroDM.IRejDs
    ItemHeight = 13
    ParentBiDiMode = False
    ParentShowHint = False
    ShowHint = True
    Sorted = True
    TabOrder = 4
    OnKeyPress = NexTab
  end
  object FCKod: TDBLookupComboBox
    Left = 400
    Top = 60
    Width = 220
    Height = 21
    Anchors = [akTop, akRight]
    BiDiMode = bdRightToLeft
    DataField = 'Ckod'
    DataSource = FroDM.IRejDs
    KeyField = 'Kod'
    ListField = 'Nam'
    ListSource = FroDM.CentDs
    ParentBiDiMode = False
    TabOrder = 5
    OnKeyDown = FCKodKeyDown
    OnKeyPress = NexTab
  end
  object cbPrint: TCheckBox
    Left = 478
    Top = 390
    Width = 97
    Height = 17
    TabStop = False
    Anchors = [akRight, akBottom]
    BiDiMode = bdRightToLeft
    Caption = 'ç«Å « Ê„« Ìﬂ'
    ParentBiDiMode = False
    TabOrder = 11
  end
  object FDes: TDBEdit
    Left = 50
    Top = 91
    Width = 718
    Height = 19
    Anchors = [akTop, akRight]
    AutoSize = False
    BiDiMode = bdRightToLeft
    DataField = 'Des'
    DataSource = FroDM.IRejDs
    ParentBiDiMode = False
    TabOrder = 6
    OnKeyPress = NexTab
  end
  object EdQu: TQuery
    SQL.Strings = (
      'SELECT *  FROM DHavG I'
      'WHERE')
    Left = 49
    Top = 159
  end
end
