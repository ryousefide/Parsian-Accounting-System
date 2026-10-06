object FTaraz: TFTaraz
  Left = 437
  Top = 106
  AutoSize = True
  BiDiMode = bdLeftToRight
  BorderIcons = [biSystemMenu, biMinimize, biHelp]
  BorderStyle = bsSingle
  Caption = 'ê“«—‘«   —«“'
  ClientHeight = 479
  ClientWidth = 294
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
  ShowHint = True
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 294
    Height = 448
  end
  object Bevel2: TBevel
    Left = 0
    Top = 452
    Width = 293
    Height = 27
  end
  object Label2: TLabel
    Left = 230
    Top = 6
    Width = 55
    Height = 19
    Alignment = taRightJustify
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '⁄‰Ê«‰'
    Constraints.MaxHeight = 20
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
  end
  object Label3: TLabel
    Left = 230
    Top = 31
    Width = 55
    Height = 18
    Alignment = taRightJustify
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
  object Label1: TLabel
    Left = 86
    Top = 32
    Width = 40
    Height = 18
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = ' «  «—ÌŒ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object Label4: TLabel
    Left = 230
    Top = 88
    Width = 55
    Height = 18
    Alignment = taRightJustify
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '„—ﬂ“ Â“Ì‰Â'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object Sp: TSpeedButton
    Left = 2
    Top = 58
    Width = 22
    Height = 22
    Flat = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      5555555555FFFFFFFFFF5555500000000005555557777777777F55550BFBFBFB
      FB0555557F555555557F55500FBFBFBFBF0555577F555555557F550B0BFBFBFB
      FB05557F7F555555557F500F0FBFBFBFBF05577F7F555555557F0B0B0BFBFBFB
      FB057F7F7F555555557F0F0F0FBFBFBFBF057F7F7FFFFFFFFF750B0B00000000
      00557F7F7777777777550F0FB0FBFB0F05557F7FF75FFF7575550B0007000070
      55557F777577775755550FB0FBFB0F0555557FF75FFF75755555000700007055
      5555777577775755555550FBFB0555555555575FFF7555555555570000755555
      5555557777555555555555555555555555555555555555555555}
    NumGlyphs = 2
    Spacing = 2
    OnClick = SpClick
  end
  object Label6: TLabel
    Left = 229
    Top = 62
    Width = 55
    Height = 18
    Alignment = taRightJustify
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = 'Å—ÊéÂ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object SpCen: TSpeedButton
    Left = 2
    Top = 85
    Width = 22
    Height = 22
    Flat = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      5555555555FFFFFFFFFF5555500000000005555557777777777F55550BFBFBFB
      FB0555557F555555557F55500FBFBFBFBF0555577F555555557F550B0BFBFBFB
      FB05557F7F555555557F500F0FBFBFBFBF05577F7F555555557F0B0B0BFBFBFB
      FB057F7F7F555555557F0F0F0FBFBFBFBF057F7F7FFFFFFFFF750B0B00000000
      00557F7F7777777777550F0FB0FBFB0F05557F7FF75FFF7575550B0007000070
      55557F777577775755550FB0FBFB0F0555557FF75FFF75755555000700007055
      5555777577775755555550FBFB0555555555575FFF7555555555570000755555
      5555557777555555555555555555555555555555555555555555}
    NumGlyphs = 2
    OnClick = SpCenClick
  end
  object Label5: TLabel
    Left = 232
    Top = 114
    Width = 54
    Height = 18
    Alignment = taRightJustify
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '‰Ê⁄ «—“'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object AcType: TRadioGroup
    Left = 1
    Top = 139
    Width = 292
    Height = 32
    BiDiMode = bdRightToLeft
    Columns = 4
    ItemIndex = 0
    Items.Strings = (
      'ê—ÊÂ'
      'ﬂ·'
      '„⁄Ì‰'
      ' ›’Ì·Ì')
    ParentBiDiMode = False
    TabOrder = 6
    OnClick = FormActivate
  end
  object FAccList: TXPCheckListBox
    Left = 2
    Top = 174
    Width = 292
    Height = 252
    Hint = '·Ì”  ”—›’· Â«Ì Õ”«»œ«—Ì '
    BiDiMode = bdRightToLeft
    Flat = False
    ItemHeight = 13
    ParentBiDiMode = False
    ParentShowHint = False
    ShowHint = True
    Sorted = True
    TabOrder = 7
    OnKeyPress = NextTab
  end
  object Bexit: TButton
    Left = 156
    Top = 453
    Width = 136
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
    TabOrder = 10
    OnClick = BexitClick
  end
  object Btaraz: TBitBtn
    Left = 0
    Top = 453
    Width = 156
    Height = 25
    BiDiMode = bdRightToLeft
    Caption = '& —«“'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 9
    OnClick = BtarazClick
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
  object FCap: TEdit
    Left = 0
    Top = 5
    Width = 227
    Height = 21
    BiDiMode = bdRightToLeft
    Constraints.MaxHeight = 21
    ParentBiDiMode = False
    TabOrder = 0
    OnKeyPress = NextTab
  end
  object EDat: TMaskEdit
    Left = 1
    Top = 30
    Width = 80
    Height = 21
    AutoSize = False
    BiDiMode = bdRightToLeft
    Constraints.MaxHeight = 26
    EditMask = '1300/00/00;1;_'
    MaxLength = 10
    ParentBiDiMode = False
    TabOrder = 2
    Text = '13  /  /  '
    OnEnter = EDatEnter
    OnExit = EDatExit
    OnKeyPress = NextTab
  end
  object cbPrint: TCheckBox
    Left = 4
    Top = 429
    Width = 97
    Height = 17
    TabStop = False
    BiDiMode = bdRightToLeft
    Caption = 'ç«Å « Ê„« Ìﬂ'
    ParentBiDiMode = False
    TabOrder = 8
    OnKeyPress = NextTab
  end
  object Sdat: TMaskEdit
    Left = 147
    Top = 30
    Width = 80
    Height = 21
    AutoSize = False
    BiDiMode = bdRightToLeft
    Constraints.MaxHeight = 26
    EditMask = '1300/00/00;1;_'
    MaxLength = 10
    ParentBiDiMode = False
    TabOrder = 1
    Text = '13  /  /  '
    OnEnter = SdatEnter
    OnExit = SdatExit
    OnKeyPress = NextTab
  end
  object FCostN: TComboBox
    Left = 26
    Top = 59
    Width = 200
    Height = 21
    BiDiMode = bdRightToLeft
    ItemHeight = 13
    ParentBiDiMode = False
    Sorted = True
    TabOrder = 3
  end
  object FCentN: TComboBox
    Left = 26
    Top = 85
    Width = 199
    Height = 21
    BiDiMode = bdRightToLeft
    ItemHeight = 13
    ParentBiDiMode = False
    TabOrder = 4
  end
  object cbCurr: TComboBox
    Left = 135
    Top = 112
    Width = 90
    Height = 21
    BiDiMode = bdRightToLeft
    ItemHeight = 13
    ParentBiDiMode = False
    Sorted = True
    TabOrder = 5
    OnKeyPress = NextTab
  end
  object GQu: TQuery
    DatabaseName = 'ParFro'
    SQL.Strings = (
      'Select * From Gardesh'
      'Order by Id')
    Left = 34
    Top = 221
    object GQuDat: TIntegerField
      FieldName = 'Dat'
      DisplayFormat = '####/##/##'
    end
    object GQuBedeh: TCurrencyField
      FieldName = 'Bedeh'
    end
    object GQuBestan: TCurrencyField
      FieldName = 'Bestan'
    end
    object GQuBedRem: TCurrencyField
      FieldName = 'BedRem'
    end
    object GQuBesRem: TCurrencyField
      FieldName = 'BesRem'
    end
    object GQuBaghi: TCurrencyField
      FieldName = 'Baghi'
    end
    object GQuDesc: TStringField
      FieldName = 'Des'
      Size = 140
    end
    object GQuNo: TIntegerField
      FieldName = 'No'
    end
    object GQuDiag: TCurrencyField
      FieldName = 'Diag'
    end
  end
  object GQuDs: TDataSource
    DataSet = GQu
    Left = 83
    Top = 221
  end
end
