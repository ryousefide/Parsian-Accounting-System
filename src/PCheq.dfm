object FPcheq: TFPcheq
  Left = 228
  Top = 129
  ActiveControl = Fno
  AutoSize = True
  BiDiMode = bdRightToLeft
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  BorderWidth = 2
  Caption = 'Å—œ«Œ  çﬂ'
  ClientHeight = 273
  ClientWidth = 657
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
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 74
    Width = 655
    Height = 165
    Cursor = crCross
  end
  object Label1: TLabel
    Left = 595
    Top = 11
    Width = 40
    Height = 18
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '”—Ì«·'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object Label2: TLabel
    Left = 591
    Top = 81
    Width = 51
    Height = 18
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = ' «—ÌŒ çﬂ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object Label3: TLabel
    Left = 99
    Top = 10
    Width = 55
    Height = 21
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = ' «—ÌŒ ’œÊ—'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object DBText1: TDBText
    Left = 202
    Top = 0
    Width = 76
    Height = 21
    BiDiMode = bdRightToLeftNoAlign
    DataField = 'Paydat'
    DataSource = FroDM.PcheqDs
    ParentBiDiMode = False
    Visible = False
  end
  object Label4: TLabel
    Left = 592
    Top = 112
    Width = 51
    Height = 18
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '„»·€ çﬂ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    Layout = tlCenter
  end
  object Label5: TLabel
    Left = 374
    Top = 47
    Width = 30
    Height = 19
    Alignment = taCenter
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '»«‰ﬂ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object Label6: TLabel
    Left = 533
    Top = 206
    Width = 51
    Height = 21
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = 'Ã«—Ì'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object DBText2: TDBText
    Left = 257
    Top = 46
    Width = 113
    Height = 22
    BiDiMode = bdRightToLeft
    DataField = 'Bank'
    DataSource = FroDM.PcheqDs
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    Transparent = True
  end
  object DBText3: TDBText
    Left = 352
    Top = 210
    Width = 176
    Height = 17
    BiDiMode = bdRightToLeft
    DataField = 'Jari'
    DataSource = FroDM.PcheqDs
    Font.Charset = ARABIC_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    Transparent = True
  end
  object Label7: TLabel
    Left = 592
    Top = 147
    Width = 49
    Height = 18
    Hint = '·ÿ›«¯ ﬂœ Õ”«» „—»ÊÿÂ —« Ê«—œﬂ‰Ìœ'
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '»Â Õ”«»'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object Bevel2: TBevel
    Left = 0
    Top = 246
    Width = 657
    Height = 27
  end
  object DBText5: TDBText
    Left = 25
    Top = 81
    Width = 124
    Height = 17
    Alignment = taCenter
    BiDiMode = bdRightToLeft
    DataField = 'Bno'
    DataSource = FroDM.PcheqDs
    Font.Charset = ARABIC_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    Transparent = True
  end
  object Label8: TLabel
    Left = 589
    Top = 179
    Width = 51
    Height = 18
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = 'œ— ÊÃÂ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object Label9: TLabel
    Left = 369
    Top = 147
    Width = 51
    Height = 19
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
  end
  object Label10: TLabel
    Left = 161
    Top = 147
    Width = 62
    Height = 19
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
  end
  object Label12: TLabel
    Left = 325
    Top = 112
    Width = 41
    Height = 21
    Alignment = taRightJustify
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '«—“ „⁄«œ·'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object Label13: TLabel
    Left = 159
    Top = 113
    Width = 65
    Height = 19
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '»—«»— «—“Ì'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object FPBill: TDBEdit
    Left = 439
    Top = 111
    Width = 147
    Height = 21
    AutoSize = False
    BiDiMode = bdRightToLeftReadingOnly
    DataField = 'Pbill'
    DataSource = FroDM.PcheqDs
    ParentBiDiMode = False
    TabOrder = 3
    OnKeyPress = NextTab
  end
  object Bprev: TButton
    Left = 1
    Top = 247
    Width = 50
    Height = 25
    Cursor = crHandPoint
    BiDiMode = bdRightToLeft
    Caption = '&ﬁ»·Ì'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 11
    OnClick = BprevClick
  end
  object Bsave: TBitBtn
    Left = 324
    Top = 247
    Width = 57
    Height = 25
    Cursor = crHandPoint
    BiDiMode = bdRightToLeft
    Caption = 'À» '
    Enabled = False
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 15
    OnClick = BsaveClick
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
  object Bnext: TButton
    Left = 51
    Top = 247
    Width = 50
    Height = 25
    Cursor = crHandPoint
    BiDiMode = bdRightToLeft
    Caption = '&»⁄œÌ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 12
    OnClick = BnextClick
  end
  object Bedit: TButton
    Left = 274
    Top = 247
    Width = 50
    Height = 25
    Cursor = crHandPoint
    BiDiMode = bdRightToLeft
    Caption = '&ÊÌ—«Ì‘'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 14
    OnClick = BeditClick
  end
  object Bexit: TButton
    Left = 597
    Top = 247
    Width = 60
    Height = 25
    Cursor = crHandPoint
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
    TabOrder = 17
    OnClick = BexitClick
  end
  object Fno: TEdit
    Left = 468
    Top = 10
    Width = 121
    Height = 21
    AutoSelect = False
    AutoSize = False
    BiDiMode = bdRightToLeft
    Constraints.MaxHeight = 21
    MaxLength = 9
    ParentBiDiMode = False
    TabOrder = 0
    OnKeyPress = FnoKeyPress
  end
  object FDesc: TDBEdit
    Left = 21
    Top = 178
    Width = 565
    Height = 21
    AutoSize = False
    BiDiMode = bdRightToLeft
    DataField = 'Des'
    DataSource = FroDM.PcheqDs
    ParentBiDiMode = False
    TabOrder = 9
    OnKeyPress = NextTab
  end
  object Fpaykod: TDBCheckBox
    Left = 23
    Top = 211
    Width = 103
    Height = 17
    TabStop = False
    BiDiMode = bdRightToLeft
    Caption = 'Å—œ«Œ  ‘œÂ «” '
    Constraints.MaxHeight = 17
    DataField = 'Paykod'
    DataSource = FroDM.PcheqDs
    ParentBiDiMode = False
    ReadOnly = True
    TabOrder = 10
    ValueChecked = 'True'
    ValueUnchecked = 'False'
    OnKeyPress = NextTab
    OnMouseDown = FpaykodMouseDown
  end
  object Bdel: TButton
    Tag = 2
    Left = 224
    Top = 247
    Width = 50
    Height = 25
    Cursor = crHandPoint
    BiDiMode = bdRightToLeft
    Caption = '&«»ÿ«·'
    Enabled = False
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 13
    OnClick = BdelClick
  end
  object Dat1: TMaskEdit
    Left = 496
    Top = 79
    Width = 90
    Height = 21
    AutoSize = False
    BiDiMode = bdRightToLeft
    Constraints.MaxHeight = 21
    EditMask = '1300/00/00;1;_'
    MaxLength = 10
    ParentBiDiMode = False
    TabOrder = 2
    Text = '13  /  /  '
    OnEnter = Dat1Enter
    OnExit = Dat1Exit
    OnKeyPress = NextTab
  end
  object Bprint: TButton
    Left = 381
    Top = 247
    Width = 50
    Height = 25
    Cursor = crHandPoint
    BiDiMode = bdRightToLeft
    Caption = '&—”Ìœ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 16
    Visible = False
    OnClick = BprintClick
  end
  object SDat: TMaskEdit
    Left = 5
    Top = 10
    Width = 85
    Height = 21
    Hint = ' €ÌÌ—  «—ÌŒ œ— œ› — „⁄Ì‰  «ÀÌ— ŒÊ«Âœ ê–«‘ '
    AutoSize = False
    BiDiMode = bdRightToLeft
    Constraints.MaxHeight = 21
    EditMask = '1300/00/00;1;_'
    MaxLength = 10
    ParentBiDiMode = False
    TabOrder = 1
    Text = '13  /  /  '
    OnEnter = SDatEnter
    OnExit = SDatExit
    OnKeyPress = NextTab
  end
  object FCost: TDBComboBox
    Left = 230
    Top = 146
    Width = 130
    Height = 21
    BiDiMode = bdRightToLeft
    DataField = 'Cost'
    DataSource = FroDM.PcheqDs
    ItemHeight = 13
    ParentBiDiMode = False
    ParentShowHint = False
    ShowHint = True
    Sorted = True
    TabOrder = 7
    OnKeyPress = NextTab
  end
  object FCKod: TDBLookupComboBox
    Left = 21
    Top = 146
    Width = 136
    Height = 21
    DataField = 'Ckod'
    DataSource = FroDM.PcheqDs
    KeyField = 'Kod'
    ListField = 'Nam'
    ListSource = FroDM.CentDs
    TabOrder = 8
    OnKeyPress = NextTab
  end
  object lCurr: TStaticText
    Left = 375
    Top = 112
    Width = 58
    Height = 18
    Alignment = taRightJustify
    AutoSize = False
    Caption = '—Ì«·'
    TabOrder = 18
  end
  object FCtip: TDBComboBox
    Left = 230
    Top = 113
    Width = 90
    Height = 21
    Style = csDropDownList
    BiDiMode = bdRightToLeft
    DataField = 'Ctip'
    DataSource = FroDM.PcheqDs
    ItemHeight = 13
    ParentBiDiMode = False
    TabOrder = 4
    OnKeyPress = NextTab
  end
  object FCPric: TDBEdit
    Left = 21
    Top = 112
    Width = 135
    Height = 21
    AutoSize = False
    BiDiMode = bdRightToLeftNoAlign
    DataField = 'Cprice'
    DataSource = FroDM.PcheqDs
    ParentBiDiMode = False
    TabOrder = 5
    OnEnter = FCPricEnter
    OnKeyPress = NextTab
  end
  object FAccNam: TDBComboBox
    Left = 436
    Top = 146
    Width = 149
    Height = 21
    BiDiMode = bdRightToLeft
    Color = clRed
    DataField = 'Acnam'
    DataSource = FroDM.PcheqDs
    ItemHeight = 13
    ParentBiDiMode = False
    ParentShowHint = False
    ShowHint = True
    Sorted = True
    TabOrder = 6
    OnKeyPress = NextTab
  end
end
