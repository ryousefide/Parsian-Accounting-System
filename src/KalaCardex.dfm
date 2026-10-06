object FKCardex: TFKCardex
  Tag = 1
  Left = 262
  Top = 157
  ActiveControl = GNam
  BiDiMode = bdLeftToRight
  BorderStyle = bsSingle
  Caption = ' ﬂ«—œﬂ” ﬂ«·«'
  ClientHeight = 333
  ClientWidth = 790
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
  Position = poDefaultSizeOnly
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = BexitClick
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 607
    Height = 299
  end
  object Panel1: TPanel
    Tag = 1
    Left = 0
    Top = 0
    Width = 790
    Height = 80
    Align = alTop
    BevelInner = bvLowered
    BiDiMode = bdRightToLeft
    BorderWidth = 2
    ParentBiDiMode = False
    TabOrder = 0
    TabStop = True
    object Label4: TLabel
      Left = 740
      Top = 6
      Width = 44
      Height = 18
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = '‰«„ ﬂ«·«'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 338
      Top = 6
      Width = 24
      Height = 18
      AutoSize = False
      Caption = '„œ·'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 192
      Top = 5
      Width = 40
      Height = 18
      AutoSize = False
      Caption = '‰«„ «‰»«—'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 742
      Top = 31
      Width = 41
      Height = 20
      Anchors = [akTop, akRight]
      AutoSize = False
      BiDiMode = bdRightToLeft
      Caption = '«“  «—ÌŒ'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
    end
    object Label3: TLabel
      Left = 585
      Top = 33
      Width = 28
      Height = 19
      Anchors = [akTop, akRight]
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
    object Label6: TLabel
      Left = 67
      Top = 56
      Width = 30
      Height = 18
      AutoSize = False
      Caption = 'ﬁ›”Â'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label7: TLabel
      Left = 696
      Top = 33
      Width = 16
      Height = 18
      Alignment = taCenter
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = '-'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 656
      Top = 33
      Width = 16
      Height = 19
      Alignment = taCenter
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = '-'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 540
      Top = 33
      Width = 16
      Height = 18
      Alignment = taCenter
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = '-'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 499
      Top = 33
      Width = 16
      Height = 18
      Alignment = taCenter
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = '-'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 192
      Top = 32
      Width = 39
      Height = 19
      AutoSize = False
      BiDiMode = bdRightToLeft
      Caption = '»‰«„'
      Constraints.MaxHeight = 21
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      Transparent = True
      Layout = tlCenter
    end
    object GNam: TComboBox
      Tag = 1
      Left = 367
      Top = 4
      Width = 372
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      BiDiMode = bdRightToLeft
      ItemHeight = 13
      ParentBiDiMode = False
      Sorted = True
      TabOrder = 0
      OnDragDrop = GNamDragDrop
      OnDragOver = GNamDragOver
      OnDropDown = GNamDropDown
      OnKeyDown = GNamKeyDown
      OnKeyPress = NexTab
    end
    object FColor: TComboBox
      Left = 235
      Top = 4
      Width = 97
      Height = 21
      BiDiMode = bdRightToLeft
      ItemHeight = 13
      ParentBiDiMode = False
      Sorted = True
      TabOrder = 1
      OnKeyPress = NexTab
      Items.Strings = (
        '')
    end
    object FAnb: TComboBox
      Left = 16
      Top = 4
      Width = 170
      Height = 21
      BiDiMode = bdRightToLeft
      ItemHeight = 13
      ParentBiDiMode = False
      Sorted = True
      TabOrder = 2
      OnKeyPress = NexTab
      Items.Strings = (
        '')
    end
    object FAnbKod: TEdit
      Left = 24
      Top = 55
      Width = 38
      Height = 21
      AutoSize = False
      Constraints.MaxHeight = 21
      TabOrder = 3
      Visible = False
      OnKeyPress = FAnbKodKeyPress
    end
    object FM1: TEdit
      Left = 673
      Top = 31
      Width = 23
      Height = 21
      Anchors = [akTop, akRight]
      MaxLength = 2
      TabOrder = 5
      OnChange = FM1Change
      OnKeyPress = FAnbKodKeyPress
    end
    object FD1: TEdit
      Left = 714
      Top = 31
      Width = 23
      Height = 21
      Anchors = [akTop, akRight]
      MaxLength = 2
      TabOrder = 4
      OnChange = FD1Change
      OnKeyPress = FAnbKodKeyPress
    end
    object FY1: TEdit
      Left = 615
      Top = 31
      Width = 41
      Height = 21
      Anchors = [akTop, akRight]
      MaxLength = 4
      TabOrder = 6
      OnChange = FY1Change
      OnKeyPress = FAnbKodKeyPress
    end
    object FM2: TEdit
      Left = 517
      Top = 31
      Width = 23
      Height = 21
      Anchors = [akTop, akRight]
      MaxLength = 2
      TabOrder = 8
      OnChange = FM2Change
      OnKeyPress = FAnbKodKeyPress
    end
    object FY2: TEdit
      Left = 457
      Top = 31
      Width = 41
      Height = 21
      Anchors = [akTop, akRight]
      MaxLength = 4
      TabOrder = 9
      OnChange = FY2Change
      OnKeyPress = FAnbKodKeyPress
    end
    object FD2: TEdit
      Left = 558
      Top = 31
      Width = 23
      Height = 21
      Anchors = [akTop, akRight]
      MaxLength = 2
      TabOrder = 7
      OnChange = FD2Change
      OnKeyPress = FAnbKodKeyPress
    end
    object cbB: TCheckBox
      Left = 717
      Top = 58
      Width = 66
      Height = 17
      Anchors = [akTop, akRight]
      Caption = 'Œ—Ìœ'
      TabOrder = 11
      OnKeyPress = NexTab
    end
    object cbRB: TCheckBox
      Left = 546
      Top = 58
      Width = 103
      Height = 17
      Anchors = [akTop, akRight]
      Caption = '„—ÃÊ⁄Ì Œ—Ìœ'
      TabOrder = 13
      OnKeyPress = NexTab
    end
    object cbI: TCheckBox
      Left = 652
      Top = 58
      Width = 62
      Height = 17
      Anchors = [akTop, akRight]
      Caption = '›—Ê‘'
      TabOrder = 12
      OnKeyPress = NexTab
    end
    object cbRI: TCheckBox
      Left = 436
      Top = 58
      Width = 109
      Height = 17
      Anchors = [akTop, akRight]
      Caption = '„—ÃÊ⁄Ì ›—Ê‘'
      TabOrder = 14
      OnKeyPress = NexTab
    end
    object FNam: TComboBox
      Left = 16
      Top = 31
      Width = 170
      Height = 21
      BiDiMode = bdRightToLeft
      ItemHeight = 13
      ParentBiDiMode = False
      Sorted = True
      TabOrder = 10
      OnKeyPress = NexTab
    end
    object cbIn: TCheckBox
      Left = 353
      Top = 58
      Width = 80
      Height = 17
      Anchors = [akTop, akRight]
      Caption = 'Ê—Êœ ﬂ«·«'
      TabOrder = 15
      OnKeyPress = NexTab
    end
    object cbOut: TCheckBox
      Left = 272
      Top = 58
      Width = 78
      Height = 17
      Anchors = [akTop, akRight]
      Caption = 'Œ—ÊÃ ﬂ«·«'
      TabOrder = 16
      OnKeyPress = NexTab
    end
  end
  object KCardex: TDBGrid
    Left = 0
    Top = 80
    Width = 790
    Height = 220
    TabStop = False
    Align = alClient
    BiDiMode = bdRightToLeft
    DataSource = FroDM.CardexDs
    FixedColor = clTeal
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Serif'
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentBiDiMode = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = ARABIC_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Mitra'
    TitleFont.Style = [fsBold]
    OnDrawColumnCell = KCardexDrawColumnCell
    OnKeyDown = KCardexKeyDown
    OnKeyPress = KCardexKeyPress
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Dat'
        Title.Alignment = taCenter
        Title.Caption = ' «—ÌŒ'
        Width = 77
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'Nam'
        Title.Alignment = taCenter
        Title.Caption = 'ﬂ«·«'
        Width = 157
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'Color'
        Title.Alignment = taCenter
        Title.Caption = '„œ·'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Anb'
        Title.Alignment = taCenter
        Title.Caption = '«‰»«—'
        Width = 87
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'AnbKod'
        Title.Alignment = taCenter
        Title.Caption = 'ﬁ›”Â'
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IIn'
        Title.Alignment = taCenter
        Title.Caption = 'Ê—Êœ'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Out'
        Title.Alignment = taCenter
        Title.Caption = 'Œ—ÊÃ'
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Rem'
        Title.Alignment = taCenter
        Title.Caption = '„«‰œÂ'
        Width = 49
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'No'
        Title.Alignment = taCenter
        Title.Caption = '‘„«—Â'
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Des'
        Title.Alignment = taCenter
        Title.Caption = '›«ﬂ Ê—'
        Width = 83
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'FacNam'
        Title.Alignment = taCenter
        Title.Caption = '»‰«„'
        Width = 125
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 300
    Width = 790
    Height = 33
    Align = alBottom
    BevelInner = bvLowered
    BorderWidth = 2
    TabOrder = 2
    object Bexit: TButton
      Left = 199
      Top = 4
      Width = 65
      Height = 25
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
      TabOrder = 3
      OnClick = BexitClick
    end
    object Bprint: TButton
      Left = 69
      Top = 4
      Width = 65
      Height = 25
      BiDiMode = bdRightToLeft
      Caption = '&ç«Å'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Mitra'
      Font.Style = [fsBold, fsItalic]
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 1
      OnClick = BprintClick
    end
    object Bshow: TBitBtn
      Left = 4
      Top = 4
      Width = 65
      Height = 25
      Caption = '&‰„«Ì‘'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = BshowClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFF000000F
        FFFFFFF00BBBBBB00FFFFF0BBBBBBBBBB0FFF0BBBBBBBBBBBB0FF00B00BBBB00
        BB0F0BBB0BBBB0BB0BB00BBB0BBBBBBB0BB00BBB0B0BBBBB0BB00BBB000BBB00
        BBB00BBB0B0BBBBB0BB00BBB0BBBBBBB0BB0F0BB0BB0B0BB0B0FF00B0000BB00
        BB0FFF0BBBBBBBBBB0FFFFF00BBBBBB00FFFFFFFF000000FFFFF}
    end
    object Cb1: TCheckBox
      Left = 723
      Top = 8
      Width = 61
      Height = 17
      TabStop = False
      Anchors = [akTop, akRight]
      BiDiMode = bdRightToLeft
      Caption = '‘—Õ ﬂ«·«'
      Checked = True
      Constraints.MaxHeight = 17
      ParentBiDiMode = False
      State = cbChecked
      TabOrder = 9
      OnClick = cbCheck
    end
    object Cb2: TCheckBox
      Left = 672
      Top = 9
      Width = 47
      Height = 17
      TabStop = False
      Anchors = [akTop, akRight]
      BiDiMode = bdRightToLeft
      Caption = '„œ·'
      Constraints.MaxHeight = 17
      ParentBiDiMode = False
      TabOrder = 8
      OnClick = cbCheck
    end
    object Cb3: TCheckBox
      Left = 620
      Top = 9
      Width = 47
      Height = 17
      TabStop = False
      Anchors = [akTop, akRight]
      BiDiMode = bdRightToLeft
      Caption = '«‰»«—'
      Checked = True
      Constraints.MaxHeight = 17
      ParentBiDiMode = False
      State = cbChecked
      TabOrder = 7
      OnClick = cbCheck
    end
    object Cb4: TCheckBox
      Left = 572
      Top = 8
      Width = 46
      Height = 17
      TabStop = False
      Anchors = [akTop, akRight]
      BiDiMode = bdRightToLeft
      Caption = 'ﬁ›”Â'
      Constraints.MaxHeight = 17
      ParentBiDiMode = False
      TabOrder = 6
      OnClick = cbCheck
    end
    object cb5: TCheckBox
      Left = 516
      Top = 8
      Width = 48
      Height = 17
      TabStop = False
      Anchors = [akTop, akRight]
      BiDiMode = bdRightToLeft
      Caption = '›«ﬂ Ê—'
      Checked = True
      Constraints.MaxHeight = 17
      ParentBiDiMode = False
      State = cbChecked
      TabOrder = 5
      OnClick = cbCheck
    end
    object cb6: TCheckBox
      Left = 466
      Top = 8
      Width = 44
      Height = 17
      TabStop = False
      Anchors = [akTop, akRight]
      BiDiMode = bdRightToLeft
      Caption = '»‰«„'
      Checked = True
      Constraints.MaxHeight = 17
      ParentBiDiMode = False
      State = cbChecked
      TabOrder = 4
      OnClick = cbCheck
    end
    object Bdiag: TButton
      Left = 134
      Top = 4
      Width = 65
      Height = 25
      Caption = '‰„Êœ«—'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Mitra'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      TabOrder = 2
      OnClick = BdiagClick
    end
  end
end
