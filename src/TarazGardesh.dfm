object FTGardesh: TFTGardesh
  Tag = 1
  Left = 322
  Top = 128
  BiDiMode = bdLeftToRight
  BorderStyle = bsSingle
  Caption = ' —«“ ¬“„«Ì‘Ì'
  ClientHeight = 364
  ClientWidth = 600
  Color = clBtnFace
  Font.Charset = ARABIC_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poDefaultSizeOnly
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 600
    Height = 75
    Align = alTop
  end
  object Label2: TLabel
    Left = 544
    Top = 47
    Width = 41
    Height = 18
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
    Left = 431
    Top = 47
    Width = 30
    Height = 18
    Anchors = [akTop, akRight]
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '«·Ì'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object Label4: TLabel
    Left = 232
    Top = 49
    Width = 55
    Height = 18
    Alignment = taRightJustify
    Anchors = [akTop, akRight]
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
    Top = 10
    Width = 22
    Height = 22
    Anchors = [akTop, akRight]
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
    Left = 232
    Top = 10
    Width = 55
    Height = 18
    Alignment = taRightJustify
    Anchors = [akTop, akRight]
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
    Left = 3
    Top = 48
    Width = 22
    Height = 22
    Anchors = [akTop, akRight]
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
  object Gdbg: TDBGrid
    Left = 0
    Top = 75
    Width = 600
    Height = 237
    TabStop = False
    Align = alClient
    BiDiMode = bdRightToLeft
    DataSource = GQuDs
    FixedColor = clTeal
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentBiDiMode = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 5
    TitleFont.Charset = ARABIC_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Mitra'
    TitleFont.Style = [fsBold]
    OnDrawColumnCell = GdbgDrawColumnCell
    OnKeyDown = GdbgKeyDown
    OnKeyPress = GdbgKeyPress
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'No'
        Title.Alignment = taCenter
        Title.Caption = '#'
        Width = 38
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Dat'
        Title.Alignment = taCenter
        Title.Caption = ' «—ÌŒ'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Des'
        Title.Alignment = taCenter
        Title.Caption = '‘—Õ'
        Width = 234
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Bedeh'
        Title.Alignment = taCenter
        Title.Caption = '»œÂﬂ«—'
        Width = 111
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Bestan'
        Title.Alignment = taCenter
        Title.Caption = '»” «‰ﬂ«—'
        Width = 113
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BedRem'
        Title.Caption = '„«‰œÂ »œÂò«— '
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BesRem'
        Title.Caption = '„«‰œÂ »” «‰ò«—'
        Width = 101
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'Baghi'
        Title.Alignment = taCenter
        Title.Caption = '»«ﬁÌ„«‰œÂ'
        Width = 98
        Visible = True
      end>
  end
  object Sb1: TStatusBar
    Left = 0
    Top = 345
    Width = 600
    Height = 19
    BiDiMode = bdRightToLeft
    Panels = <
      item
        Width = 100
      end
      item
        Width = 100
      end
      item
        Width = 500
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
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9
    UseSystemFont = False
  end
  object SDat: TMaskEdit
    Left = 465
    Top = 46
    Width = 75
    Height = 21
    Anchors = [akTop, akRight]
    AutoSize = False
    BiDiMode = bdRightToLeft
    Constraints.MaxHeight = 26
    EditMask = '1300/00/00;1;_'
    MaxLength = 10
    ParentBiDiMode = False
    TabOrder = 1
    Text = '13  /  /  '
    OnEnter = SDatEnter
    OnExit = SDatExit
    OnKeyPress = NextTab
  end
  object EDat: TMaskEdit
    Left = 347
    Top = 46
    Width = 75
    Height = 21
    Anchors = [akTop, akRight]
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
  object Panel1: TPanel
    Tag = 1
    Left = 0
    Top = 312
    Width = 600
    Height = 33
    Align = alBottom
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 7
    object RG: TRadioGroup
      Left = 0
      Top = -4
      Width = 295
      Height = 36
      Anchors = [akLeft, akBottom]
      BiDiMode = bdRightToLeft
      Columns = 2
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        '„ÕœÊœÂ'
        'ﬂ· œÊ—Â')
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 0
      OnClick = BShowClick
    end
    object Panel2: TPanel
      Left = 296
      Top = 0
      Width = 304
      Height = 33
      Align = alRight
      AutoSize = True
      BevelInner = bvLowered
      BorderWidth = 1
      ParentColor = True
      TabOrder = 1
      object BShow: TBitBtn
        Left = 3
        Top = 3
        Width = 75
        Height = 26
        BiDiMode = bdRightToLeft
        Caption = '&‰„«Ì‘'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        TabOrder = 0
        OnClick = BShowClick
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
      object Bprint: TButton
        Left = 78
        Top = 3
        Width = 75
        Height = 26
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
      object Bexit: TButton
        Left = 226
        Top = 3
        Width = 75
        Height = 26
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
        TabOrder = 2
        OnClick = BexitClick
      end
    end
  end
  object FCostN: TComboBox
    Left = 27
    Top = 10
    Width = 200
    Height = 21
    Anchors = [akTop, akRight]
    BiDiMode = bdRightToLeft
    ItemHeight = 13
    ParentBiDiMode = False
    Sorted = True
    TabOrder = 3
    OnKeyPress = NextTab
  end
  object FCentN: TComboBox
    Left = 27
    Top = 48
    Width = 200
    Height = 21
    Anchors = [akTop, akRight]
    BiDiMode = bdRightToLeft
    ItemHeight = 13
    ParentBiDiMode = False
    TabOrder = 4
    OnKeyDown = FCentNKeyDown
    OnKeyPress = NextTab
  end
  object RGT: TRadioGroup
    Left = 292
    Top = 1
    Width = 306
    Height = 38
    Anchors = [akTop, akRight]
    BiDiMode = bdRightToLeft
    Caption = '‰Ê⁄  —«“'
    Columns = 5
    Items.Strings = (
      '¬“„«Ì‘Ì'
      'ò·'
      '„⁄Ì‰'
      ' ›’Ì·Ì'
      'Ã“¡')
    ParentBiDiMode = False
    TabOrder = 0
    OnClick = BShowClick
  end
  object GQu: TQuery
    DatabaseName = 'ParFro'
    SQL.Strings = (
      'Select * From Gardesh')
    Left = 372
    Top = 114
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
    Left = 344
    Top = 112
  end
end
