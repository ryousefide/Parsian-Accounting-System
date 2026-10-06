object FComb: TFComb
  Tag = 1
  Left = 309
  Top = 230
  BiDiMode = bdRightToLeft
  BorderStyle = bsNone
  BorderWidth = 3
  Caption = 'ê“«—‘  —òÌ»Ì'
  ClientHeight = 467
  ClientWidth = 771
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
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 771
    Height = 58
    Align = alTop
    Anchors = [akTop, akRight]
  end
  object Bevel2: TBevel
    Left = 0
    Top = 440
    Width = 771
    Height = 27
    Align = alBottom
  end
  object Splitter1: TSplitter
    Left = 157
    Top = 58
    Width = 3
    Height = 382
    Cursor = crHSplit
  end
  object Label2: TLabel
    Left = 699
    Top = 3
    Width = 70
    Height = 19
    Alignment = taRightJustify
    Anchors = [akTop, akRight]
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = ' Ì — ê“«—‘'
    Constraints.MaxHeight = 20
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
  end
  object Label1: TLabel
    Left = 699
    Top = 33
    Width = 46
    Height = 18
    Alignment = taRightJustify
    Anchors = [akTop, akRight]
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '«“ «—ÌŒ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object Label3: TLabel
    Left = 496
    Top = 33
    Width = 43
    Height = 18
    Anchors = [akTop, akRight]
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
    Left = 350
    Top = 32
    Width = 59
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
  object Sp: TSpeedButton
    Left = 144
    Top = 31
    Width = 21
    Height = 21
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
    OnClick = SpClick
  end
  object Label5: TLabel
    Left = 350
    Top = 3
    Width = 58
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
  object SpCen: TSpeedButton
    Left = 143
    Top = 2
    Width = 21
    Height = 21
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
  object Splitter2: TSplitter
    Left = 281
    Top = 58
    Width = 3
    Height = 382
    Cursor = crHSplit
  end
  object spIns: TSpeedButton
    Left = 389
    Top = 443
    Width = 23
    Height = 22
    Hint = 'À»  ê“«—‘ ÃœÌœ'
    Anchors = [akLeft, akBottom]
    Flat = True
    ParentShowHint = False
    ShowHint = True
    OnClick = spInsClick
  end
  object spDel: TSpeedButton
    Left = 343
    Top = 443
    Width = 23
    Height = 22
    Hint = 'Õ–› ê“«—‘ '
    Anchors = [akLeft, akBottom]
    Flat = True
    ParentShowHint = False
    ShowHint = True
    OnClick = spDelClick
  end
  object spEdit: TSpeedButton
    Left = 366
    Top = 443
    Width = 23
    Height = 22
    Hint = ' ’ÕÌÕ ê“«—‘'
    Anchors = [akLeft, akBottom]
    Flat = True
    ParentShowHint = False
    ShowHint = True
    OnClick = spEditClick
  end
  object Label6: TLabel
    Left = 82
    Top = 5
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
  object tvAckod: TTreeView
    Tag = -1
    Left = 0
    Top = 58
    Width = 157
    Height = 382
    Hint = 'Enter=«‰ ﬁ«· »Â ·Ì”   ÂÌÂ ê“«—‘'
    Align = alLeft
    Indent = 19
    ParentColor = True
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 6
    TabStop = False
    OnKeyPress = tvAckodKeyPress
    Items.Data = {
      030000001D000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000
      04C8CFE5ED1F000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000
      0006D3D1E3C7EDE51F000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000
      0000000006CFC7D1C7EDED}
  end
  object FCap: TEdit
    Left = 414
    Top = 1
    Width = 279
    Height = 23
    Anchors = [akTop, akRight]
    AutoSize = False
    BiDiMode = bdRightToLeft
    ParentBiDiMode = False
    TabOrder = 2
  end
  object SDat: TMaskEdit
    Left = 617
    Top = 32
    Width = 75
    Height = 21
    Anchors = [akTop, akRight]
    AutoSize = False
    BiDiMode = bdRightToLeft
    Constraints.MaxHeight = 26
    EditMask = '1300/00/00;1;_'
    MaxLength = 10
    ParentBiDiMode = False
    TabOrder = 0
    Text = '13  /  /  '
    OnEnter = SDatEnter
    OnExit = SDatExit
    OnKeyPress = NextTab
  end
  object EDat: TMaskEdit
    Left = 415
    Top = 32
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
    OnEnter = EDatEnter
    OnExit = EDatExit
    OnKeyPress = NextTab
  end
  object FCostN: TComboBox
    Left = 169
    Top = 31
    Width = 176
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    BiDiMode = bdRightToLeft
    ItemHeight = 13
    ParentBiDiMode = False
    Sorted = True
    TabOrder = 4
  end
  object FCentN: TComboBox
    Left = 169
    Top = 2
    Width = 176
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    BiDiMode = bdRightToLeft
    ItemHeight = 13
    ParentBiDiMode = False
    TabOrder = 3
  end
  object Panel1: TPanel
    Left = 160
    Top = 58
    Width = 121
    Height = 382
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 7
    object Bevel3: TBevel
      Left = 0
      Top = 66
      Width = 121
      Height = 25
      Align = alTop
      Shape = bsTopLine
    end
    object cDel: TSpeedButton
      Left = 2
      Top = 69
      Width = 23
      Height = 22
      Flat = True
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
      OnClick = cDelClick
    end
    object cUp: TSpeedButton
      Left = 49
      Top = 69
      Width = 23
      Height = 22
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
        333333777777777F33333330B00000003333337F7777777F3333333000000000
        333333777777777F333333330EEEEEE033333337FFFFFF7F3333333300000000
        333333377777777F3333333330BFBFB03333333373333373F33333330BFBFBFB
        03333337F33333F7F33333330FBFBF0F03333337F33337F7F33333330BFBFB0B
        03333337F3F3F7F7333333330F0F0F0033333337F7F7F773333333330B0B0B03
        3333333737F7F7F333333333300F0F03333333337737F7F33333333333300B03
        333333333377F7F33333333333330F03333333333337F7F33333333333330B03
        3333333333373733333333333333303333333333333373333333}
      NumGlyphs = 2
      OnClick = cUpClick
    end
    object cDown: TSpeedButton
      Left = 72
      Top = 69
      Width = 23
      Height = 22
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333033333
        33333333373F33333333333330B03333333333337F7F33333333333330F03333
        333333337F7FF3333333333330B00333333333337F773FF33333333330F0F003
        333333337F7F773F3333333330B0B0B0333333337F7F7F7F3333333300F0F0F0
        333333377F73737F33333330B0BFBFB03333337F7F33337F33333330F0FBFBF0
        3333337F7333337F33333330BFBFBFB033333373F3333373333333330BFBFB03
        33333337FFFFF7FF3333333300000000333333377777777F333333330EEEEEE0
        33333337FFFFFF7FF3333333000000000333333777777777F33333330000000B
        03333337777777F7F33333330000000003333337777777773333}
      NumGlyphs = 2
      OnClick = cDownClick
    end
    object KodList: TListBox
      Left = 0
      Top = 91
      Width = 121
      Height = 233
      Align = alClient
      ItemHeight = 13
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = KodListClick
    end
    object rgTip: TRadioGroup
      Left = 0
      Top = 0
      Width = 121
      Height = 66
      Align = alTop
      Caption = '‰Ê⁄ ê“«—‘'
      ItemIndex = 0
      Items.Strings = (
        ' —«“Ì'
        ' ·›ÌﬁÌ')
      TabOrder = 1
      OnClick = BShowClick
    end
    object rgPrint: TRadioGroup
      Left = 0
      Top = 324
      Width = 121
      Height = 58
      Align = alBottom
      Caption = '‰Ê⁄ ç«Å'
      ItemIndex = 1
      Items.Strings = (
        '”Â ” Ê‰Ì'
        'çÂ«— ” Ê‰Ì')
      TabOrder = 2
    end
  end
  object Gdbg: TDBGrid
    Left = 284
    Top = 58
    Width = 487
    Height = 382
    Hint = 'œ»· ﬂ·Ìﬂ = ‰„«Ì‘ Ã“∆Ì« '
    TabStop = False
    Align = alClient
    BiDiMode = bdRightToLeft
    DataSource = GQuDs
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentBiDiMode = False
    ParentFont = False
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 8
    TitleFont.Charset = ARABIC_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Mitra'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'No'
        Title.Alignment = taCenter
        Title.Caption = '”‰œ'
        Width = 47
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
        Width = 181
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Bedeh'
        Title.Alignment = taCenter
        Title.Caption = '»œÂﬂ«—'
        Width = 118
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Bestan'
        Title.Alignment = taCenter
        Title.Caption = '»” «‰ﬂ«—'
        Width = 112
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BedRem'
        Title.Alignment = taCenter
        Title.Caption = '„«‰œÂ »œÂﬂ«—'
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BesRem'
        Title.Alignment = taCenter
        Title.Caption = '„«‰œÂ »” «‰ﬂ«—'
        Width = 104
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Baghi'
        Title.Alignment = taCenter
        Title.Caption = '„«‰œÂ'
        Width = 124
        Visible = True
      end>
  end
  object BShow: TButton
    Left = 2
    Top = 441
    Width = 156
    Height = 25
    Anchors = [akLeft, akBottom]
    BiDiMode = bdRightToLeft
    Caption = '& ÂÌÂ ê“«—‘'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 9
    OnClick = BShowClick
  end
  object BPrint: TButton
    Left = 158
    Top = 441
    Width = 156
    Height = 25
    Anchors = [akLeft, akBottom]
    BiDiMode = bdRightToLeft
    Caption = '&ç«Å ê“«—‘'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 10
    OnClick = BPrintClick
  end
  object Bexit: TButton
    Left = 663
    Top = 441
    Width = 106
    Height = 25
    Anchors = [akRight, akBottom]
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
    TabOrder = 11
    OnClick = BexitClick
  end
  object cbReps: TComboBox
    Left = 418
    Top = 443
    Width = 240
    Height = 21
    Anchors = [akLeft, akRight, akBottom]
    ItemHeight = 13
    TabOrder = 12
    OnChange = cbRepsChange
  end
  object cbCurr: TComboBox
    Left = 1
    Top = 3
    Width = 75
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
      'Select * From Gardesh')
    Left = 312
    Top = 160
    object GQuDat: TIntegerField
      FieldName = 'Dat'
      Origin = 'PARFRO.GarDesh.Dat'
      DisplayFormat = '####/##/##'
    end
    object GQuBedeh: TCurrencyField
      FieldName = 'Bedeh'
      Origin = 'PARFRO.GarDesh.Bedeh'
    end
    object GQuBestan: TCurrencyField
      FieldName = 'Bestan'
      Origin = 'PARFRO.GarDesh.Bestan'
    end
    object GQuBedRem: TCurrencyField
      FieldName = 'BedRem'
      Origin = 'PARFRO.GarDesh.BedRem'
    end
    object GQuBesRem: TCurrencyField
      FieldName = 'BesRem'
      Origin = 'PARFRO.GarDesh.BesRem'
    end
    object GQuBaghi: TCurrencyField
      FieldName = 'Baghi'
      Origin = 'PARFRO.GarDesh.Baghi'
    end
    object GQuDes: TStringField
      FieldName = 'Des'
      Origin = 'PARFRO.GarDesh.Des'
      FixedChar = True
      Size = 140
    end
    object GQuNo: TIntegerField
      FieldName = 'No'
      Origin = 'PARFRO.GarDesh.No'
    end
    object GQuDiag: TCurrencyField
      FieldName = 'Diag'
      Origin = 'PARFRO.GarDesh.Diag'
    end
  end
  object GQuDs: TDataSource
    DataSet = GQu
    Left = 312
    Top = 128
  end
end
