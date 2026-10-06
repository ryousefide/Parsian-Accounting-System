object FAccPri: TFAccPri
  Left = 475
  Top = 129
  ActiveControl = FCap
  AutoSize = True
  BiDiMode = bdLeftToRight
  BorderIcons = [biSystemMenu, biMinimize, biHelp]
  BorderStyle = bsSingle
  Caption = 'ê“«—‘ «‰ Œ«»Ì «“ Õ”«» Â«'
  ClientHeight = 518
  ClientWidth = 293
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
  ShowHint = True
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel2: TBevel
    Left = 0
    Top = 472
    Width = 293
    Height = 27
  end
  object Bevel1: TBevel
    Left = 1
    Top = 0
    Width = 290
    Height = 469
  end
  object Label2: TLabel
    Left = 234
    Top = 4
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
    Left = 234
    Top = 32
    Width = 59
    Height = 18
    Alignment = taRightJustify
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
    Left = 234
    Top = 87
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
    Left = 3
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
    Left = 234
    Top = 59
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
    Left = 4
    Top = 84
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
    Left = 235
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
    Top = 137
    Width = 287
    Height = 38
    BiDiMode = bdRightToLeft
    Columns = 4
    ItemIndex = 0
    Items.Strings = (
      'ﬂ·'
      '„⁄Ì‰'
      ' ›’Ì·Ì'
      'Ã“¡')
    ParentBiDiMode = False
    TabOrder = 5
    OnClick = FormActivate
  end
  object FAccList: TXPCheckListBox
    Left = 1
    Top = 178
    Width = 288
    Height = 267
    BiDiMode = bdRightToLeft
    Flat = False
    ItemHeight = 13
    ParentBiDiMode = False
    Sorted = True
    TabOrder = 6
    OnClick = FAccListClick
    OnKeyPress = NextTab
  end
  object Bexit: TButton
    Left = 203
    Top = 473
    Width = 88
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
  object Btaraz: TButton
    Left = 2
    Top = 473
    Width = 122
    Height = 25
    BiDiMode = bdRightToLeft
    Caption = '&ç«Å ’Ê—  „«‰œÂ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 8
    OnClick = BtarazClick
  end
  object Sb1: TStatusBar
    Left = 0
    Top = 499
    Width = 293
    Height = 19
    Align = alNone
    BiDiMode = bdRightToLeft
    Constraints.MaxHeight = 19
    Panels = <
      item
        Text = '„”Ì—'
        Width = 500
      end>
    ParentBiDiMode = False
    ParentColor = True
    ParentFont = True
    SimplePanel = False
    SimpleText = 
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9 +
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9 +
      #9#9#9#9#9#9#9#9#9#9
    UseSystemFont = False
  end
  object BTalf: TButton
    Left = 124
    Top = 473
    Width = 79
    Height = 25
    BiDiMode = bdRightToLeft
    Caption = '& ·›ÌﬁÌ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 9
    OnClick = BTalfClick
  end
  object FCap: TEdit
    Left = 2
    Top = 2
    Width = 224
    Height = 23
    AutoSize = False
    BiDiMode = bdRightToLeft
    ParentBiDiMode = False
    TabOrder = 0
    OnKeyPress = NextTab
  end
  object EDat: TMaskEdit
    Left = 146
    Top = 31
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
    OnEnter = EDatEnter
    OnExit = EDatExit
    OnKeyPress = NextTab
  end
  object cbPrint: TCheckBox
    Left = 5
    Top = 447
    Width = 97
    Height = 17
    TabStop = False
    BiDiMode = bdRightToLeft
    Caption = 'ç«Å « Ê„« Ìﬂ'
    ParentBiDiMode = False
    TabOrder = 7
    OnKeyPress = NextTab
  end
  object FCostN: TComboBox
    Left = 26
    Top = 58
    Width = 200
    Height = 21
    BiDiMode = bdRightToLeft
    ItemHeight = 13
    ParentBiDiMode = False
    Sorted = True
    TabOrder = 2
    OnKeyPress = NextTab
  end
  object FCentN: TComboBox
    Left = 26
    Top = 85
    Width = 200
    Height = 21
    BiDiMode = bdRightToLeft
    ItemHeight = 13
    ParentBiDiMode = False
    TabOrder = 3
    OnKeyPress = NextTab
  end
  object cbCurr: TComboBox
    Left = 136
    Top = 113
    Width = 90
    Height = 21
    BiDiMode = bdRightToLeft
    ItemHeight = 13
    ParentBiDiMode = False
    Sorted = True
    TabOrder = 4
    OnKeyPress = NextTab
  end
  object GQu: TQuery
    DatabaseName = 'ParFro'
    SQL.Strings = (
      'Select * From Gardesh'
      'order by Id')
    Left = 28
    Top = 219
    object GQuDat: TIntegerField
      FieldName = 'Dat'
      Origin = 'PARFRO."Gardesh.DB".Dat'
      DisplayFormat = '####/##/##'
    end
    object GQuBedeh: TCurrencyField
      FieldName = 'Bedeh'
      Origin = 'PARFRO."Gardesh.DB".Bedeh'
    end
    object GQuBestan: TCurrencyField
      FieldName = 'Bestan'
      Origin = 'PARFRO."Gardesh.DB".Bestan'
    end
    object GQuBedRem: TCurrencyField
      FieldName = 'BedRem'
      Origin = 'PARFRO."Gardesh.DB".BedRem'
    end
    object GQuBesRem: TCurrencyField
      FieldName = 'BesRem'
      Origin = 'PARFRO."Gardesh.DB".BesRem'
    end
    object GQuBaghi: TCurrencyField
      FieldName = 'Baghi'
      Origin = 'PARFRO."Gardesh.DB".Baghi'
    end
    object GQuDesc: TStringField
      FieldName = 'Des'
      Origin = 'PARFRO."Gardesh.DB".Desc'
      Size = 140
    end
    object GQuNo: TIntegerField
      FieldName = 'No'
      Origin = 'PARFRO."Gardesh.DB".No'
    end
    object GQuDiag: TCurrencyField
      FieldName = 'Diag'
      Origin = 'PARFRO."Gardesh.DB".Diag'
    end
  end
  object GQuDs: TDataSource
    DataSet = GQu
    Left = 57
    Top = 221
  end
end
