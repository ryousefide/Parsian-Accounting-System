object FMakeBill: TFMakeBill
  Tag = 1
  Left = 224
  Top = 129
  BiDiMode = bdRightToLeft
  BorderStyle = bsNone
  Caption = ' ‘òÌ· ”‰œ'
  ClientHeight = 492
  ClientWidth = 810
  Color = clBtnFace
  Font.Charset = ARABIC_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Tag = 10
    Left = 543
    Top = 11
    Width = 38
    Height = 19
    Anchors = [akTop, akRight]
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = ' «—ÌŒ'
    Enabled = False
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object Label1: TLabel
    Tag = 10
    Left = 337
    Top = 11
    Width = 50
    Height = 19
    Hint = '‰«„ ›—Ê‘‰œÂ —« œ—«Ì‰ ﬁ”„  Ê«—œ ﬂ‰Ìœ'
    Anchors = [akTop, akRight]
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '‰Ê⁄ „œ—ò'
    Enabled = False
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object Label2: TLabel
    Tag = 11
    Left = 544
    Top = 44
    Width = 38
    Height = 19
    Hint = '‰«„ ›—Ê‘‰œÂ —« œ—«Ì‰ ﬁ”„  Ê«—œ ﬂ‰Ìœ'
    Anchors = [akTop, akRight]
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = ' «—ÌŒ'
    Enabled = False
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object Label4: TLabel
    Tag = 12
    Left = 542
    Top = 83
    Width = 39
    Height = 18
    Anchors = [akTop, akRight]
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '«“  «—ÌŒ'
    Enabled = False
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object Label5: TLabel
    Tag = 12
    Left = 421
    Top = 83
    Width = 30
    Height = 18
    Anchors = [akTop, akRight]
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '«·Ì'
    Enabled = False
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object Label6: TLabel
    Left = 725
    Top = 449
    Width = 71
    Height = 19
    Anchors = [akRight, akBottom]
    AutoSize = False
    Caption = '»œÂò«—'
  end
  object Label7: TLabel
    Left = 458
    Top = 449
    Width = 71
    Height = 19
    Anchors = [akRight, akBottom]
    AutoSize = False
    Caption = '»” «‰ò«—'
  end
  object DBGrid2: TDBGrid
    Left = 3
    Top = 316
    Width = 803
    Height = 49
    DataSource = Ds
    TabOrder = 4
    TitleFont.Charset = ARABIC_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Visible = False
  end
  object cbDat: TComboBox
    Tag = 10
    Left = 392
    Top = 11
    Width = 145
    Height = 21
    Style = csDropDownList
    Anchors = [akTop, akRight]
    Enabled = False
    ItemHeight = 13
    Sorted = True
    TabOrder = 0
    OnChange = cbDatChange
    OnKeyPress = NextTab
  end
  object dbg: TDBGrid
    Left = 1
    Top = 114
    Width = 809
    Height = 326
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = FroDM.AcBillDs
    TabOrder = 3
    TitleFont.Charset = ARABIC_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnEditButtonClick = dbgEditButtonClick
    Columns = <
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'Dat'
        Title.Caption = ' «—ÌŒ'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Accnam'
        Title.Caption = '‰«„ Õ”«»'
        Width = 174
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Bed'
        Title.Caption = '»œÂò«—'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Bes'
        Title.Caption = '»” «‰ò«—'
        Width = 107
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cost'
        Title.Caption = 'Å—ÊéÂ'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Ckod'
        Title.Caption = 'òœ„—ò“'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Btip'
        Title.Caption = '‰Ê⁄ ”‰œ'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Facno'
        Title.Caption = '—›—«‰”'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'No'
        Title.Caption = '‘„«—Â'
        Width = 75
        Visible = True
      end>
  end
  object cbTip: TComboBox
    Tag = 10
    Left = 188
    Top = 11
    Width = 145
    Height = 19
    Style = csOwnerDrawFixed
    Anchors = [akTop, akRight]
    Enabled = False
    ItemHeight = 13
    TabOrder = 1
    OnChange = cbDatChange
    OnKeyPress = NextTab
    Items.Strings = (
      '›—Ê‘'
      '„—ÃÊ⁄Ì ›—Ê‘'
      'Œ—Ìœ'
      '„—ÃÊ⁄Ì Œ—Ìœ'
      'ﬁ»÷ œ—Ì«› '
      'ﬁ»÷ Å—œ«Œ '
      'œ—Ì«›  çò'
      'Ê«ê–«—Ì çò'
      '’œÊ— çò'
      '”‰œ —Ê“‰«„Â'
      'ò«—„“œ »«‰òÌ'
      '»—œ«‘  »«‰òÌ'
      'Ê«—Ì“ »«‰òÌ'
      'Å«” çò'
      'Ê’Ê· çò'
      '⁄Êœ  çò'
      '«—”«· »Â ò·—'
      '«⁄·«„ »—ê‘ Ì ò·—'
      '⁄Êœ  «“ ò·—'
      '—„Ì «‰”'
      ' »œÌ· «—“Ì '
      '’Ê—  Â“Ì‰Â  ‰ŒÊ«Â'
      'ÕÊ«·Â «‰»«—'
      '—”Ìœ „” ﬁÌ„'
      '»—ê‘  »Â «‰»«—'
      '»—ê‘  «“ «‰»«—')
  end
  object BitBtn1: TBitBtn
    Tag = -1
    Left = 62
    Top = 10
    Width = 99
    Height = 25
    Anchors = [akTop, akRight]
    Caption = ' ‘òÌ· ”‰œ'
    ModalResult = 1
    TabOrder = 2
    OnClick = BitBtn1Click
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 473
    Width = 810
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object RG: TRadioGroup
    Tag = -1
    Left = 594
    Top = 1
    Width = 213
    Height = 111
    Anchors = [akTop, akRight]
    Caption = '—Ê‘ ’œÊ— ”‰œ'
    Items.Strings = (
      '»« ò‰ —· „Ê—œ »Â „Ê—œ Â— —Ê“'
      '’œÊ— ò· «”‰«œ Ìò —Ê“'
      '«“ Ìò  «—ÌŒ  «  «—ÌŒ')
    TabOrder = 6
    OnClick = RGClick
  end
  object NDat: TMaskEdit
    Tag = 11
    Left = 461
    Top = 42
    Width = 75
    Height = 21
    Anchors = [akTop, akRight]
    AutoSize = False
    BiDiMode = bdRightToLeft
    Constraints.MaxHeight = 26
    Enabled = False
    EditMask = '1300/00/00;1;_'
    MaxLength = 10
    ParentBiDiMode = False
    TabOrder = 7
    Text = '13  /  /  '
    OnEnter = NDatEnter
    OnExit = NDatExit
    OnKeyPress = NextTab
  end
  object SDat: TMaskEdit
    Tag = 12
    Left = 459
    Top = 82
    Width = 75
    Height = 21
    Anchors = [akTop, akRight]
    AutoSize = False
    BiDiMode = bdRightToLeft
    Constraints.MaxHeight = 26
    Enabled = False
    EditMask = '1300/00/00;1;_'
    MaxLength = 10
    ParentBiDiMode = False
    TabOrder = 8
    Text = '13  /  /  '
    OnEnter = SDatEnter
    OnExit = SDatExit
    OnKeyPress = NextTab
  end
  object EDat: TMaskEdit
    Tag = 12
    Left = 341
    Top = 82
    Width = 75
    Height = 21
    Anchors = [akTop, akRight]
    AutoSize = False
    BiDiMode = bdRightToLeft
    Constraints.MaxHeight = 26
    Enabled = False
    EditMask = '1300/00/00;1;_'
    MaxLength = 10
    ParentBiDiMode = False
    TabOrder = 9
    Text = '13  /  /  '
    OnEnter = EDatEnter
    OnExit = EDatExit
    OnKeyPress = NextTab
  end
  object FBed: TEdit
    Left = 550
    Top = 448
    Width = 169
    Height = 21
    TabStop = False
    Anchors = [akRight, akBottom]
    ReadOnly = True
    TabOrder = 10
  end
  object FBes: TEdit
    Left = 282
    Top = 448
    Width = 169
    Height = 21
    TabStop = False
    Anchors = [akRight, akBottom]
    ReadOnly = True
    TabOrder = 11
  end
  object Ds: TDataSource
    AutoEdit = False
    DataSet = T1
    Left = 158
    Top = 234
  end
  object T1: TTable
    DatabaseName = 'ParFro'
    TableName = 'RMon'
    Left = 124
    Top = 232
  end
end
