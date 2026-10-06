object FGardesh: TFGardesh
  Tag = 1
  Left = 196
  Top = 115
  ActiveControl = FAccNam
  BiDiMode = bdRightToLeft
  BorderStyle = bsSingle
  Caption = ' ê—œ‘ ⁄„·Ì« '
  ClientHeight = 517
  ClientWidth = 957
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
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 957
    Height = 69
    Align = alTop
  end
  object Label1: TLabel
    Left = 902
    Top = 7
    Width = 51
    Height = 18
    Anchors = [akTop, akRight]
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '‰«„ Õ”«»'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object Label2: TLabel
    Left = 901
    Top = 39
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
    Left = 788
    Top = 39
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
    Left = 604
    Top = 38
    Width = 60
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
    Left = 372
    Top = 7
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
    Left = 604
    Top = 7
    Width = 60
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
    Left = 372
    Top = 37
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
  object spUp: TSpeedButton
    Left = 681
    Top = 8
    Width = 23
    Height = 22
    Anchors = [akTop, akRight]
    Glyph.Data = {
      0E060000424D0E06000000000000360000002800000016000000160000000100
      180000000000D8050000C40E0000C40E00000000000000000000EBF0F0EDF1F0
      EEF1F0EEF2F0F0F3F0F0F1F0EFF1F0EDF1F0ECF0F0EAF0F0EAEFEFEAF1F1EAF1
      F1EAF1F1EAEFEFEAF0EFEAF0F1EAF0F1EAF0F1EAF0F1EAF0EFEAF0F00000EFF1
      F0D1E5EC0085C41FA5D183CAE1B8DDE7DAE9ECE1ECEEE7EEEFEFF2F1F0F2F0ED
      F2F1ECF1F1EAF1F1EAEFEFEAF0EFEAF0F1EAF0F1EAF0F1EAF0F1EAF0EFEAF0F0
      0000EFF1F0D1E5EB17A2D0BAE6F425AEDF009DD314A3D44CB7DA73C4DEA8D7E9
      C4E1E9D5E8EDE0EDEFEFF3F2F1F2F0EBF0F0EAF0F1EAF0F1EAF0F1EAF0F1EAF0
      EFEAF0F00000EFF1F0D4E6EC0094CA81D0EBADEDFF79DEFF6BD5FA4BC4EE2FB6
      E6049ABF25AEDD51BAE169C1DF92CEE3BCDEE8E8EFF0EBF0F1EAF0F1EAF0F1EA
      F0F1EAF0EFEAF0F00000EFF1F0D5E7EC0091CA73C9EAC3F3FF77E3FF80E5FF83
      E6FF8DEFFF45A67B349E814BC4E13FC4EF25B3DF35B1DCA1D5E5F4F3F2EAF0F1
      EAF0F1EAF0F1EAF0EFEAF0F00000EFF1F0D5E7EB0096CF7DCDF0B4EBF78FF1FF
      88EFFF89EFFF91F7FF41A6790B7B083FA86C78D8D798F9FF43C1ED44AFD4F1F3
      F2EBF0F1EAF0F1EAF0F1EAF0EFEAF0F00000EFF1F0D5E7EC059DD36BC9F28AD5
      EAB4FEFF8DF7FF91F7FF93F9FF8BEFF41282194DDE702B934A80E3E57BE1FF6D
      CEE4BFE0EAF0F2F1EAF0F1EAF0F1EAF0EFEAF0F00000EFF1F0D5E7EC10A1D75F
      C6F673C8E8C5FFFF8DFEFF93FDFF94FDFFA1FFFF3CA0713CC75B45CE6433965F
      A8F7FF75D8EB6FC0DDF4F4F3EAF0F1E9EFF1E9EFEFE9EFF00000F1F3F1D7E9EC
      1AA6DA76D3FF5BC0E9C2EBF3E7FFFFD2FFFFCAFFFFA9FFFFABFCFF1798295EF9
      9030A64F85CBC2C5FCFF4CBEDF9BD3E3F5F4F2EBF0F1ECF0EFECF0F00000F1F3
      F1D9EAED24ABDC8FE5FF67D3F643BBE335B4DD34B4DE25B0DCECF9FBBDFFFF15
      992961FE9647D66F599D63FFFFFF59C3E280C8DFFCF7F2ECF1F1EDF1EFEDF1F0
      0000F1F3F1D9E9ED2EB0DD9EF1FF83EAFF82EAFF81E9FE84EAFF72DFF815A9DA
      FFFFFF119A2857F28D45DD7259A960FFFFFFE9F9FB36AFD99ED4E5F4F4F2EDF1
      EFEDF1F00000F0F3F1DAEAEE34B6E29EFFFF98FEFF98FEFF98FEFF98FEFF9DFF
      FFA1FFFF1CAEF01D9A2452ED883FD26845A15EBFE7FFF0F9FC5CBFE09BD2E4F4
      F4F2EDF1EFEDF1F00000F0F3F1DAEAEE3EB8E2AFFFFF95FFFF96FFFF99FFFFAA
      FDFE91F7FB8AF6FDAEFFFF169A2947E27D40D2681E925839B1EB2AAADA7DC8E2
      E3EDEEEEF1F1EDF1EFEDF1F00000F0F3F1D7E9EE39B2E0D2FFFFABFFFFA9FFFF
      BEFFFFB3E5F962BCE756B8EF43A7821FA63941DC7732C85E5CA95FFFFFFFFFF9
      F1F9F6F1EEF1F1EBF1F1EDF1EFEDF1F00000EFF3F1DFECEF55BADF86D0E9B2E4
      F3AAE8FA95D1C75DAD9EB2CEB9E3E2D000670A2DC15936D06C2EC35A59A861FF
      FEFFF8F8FBF6F7F9EEF2F3EBF1F1EDF1EFEDF1F00000EDF2F1F1F3F1DAEBEF70
      C4E375C5E37DCBF1338D5B006E001A8F21228D2A14962631CD6134CD682BC15A
      40A5519FC9A68CBC9097BE98D9E6DEEEF2F3EDF1EFEDF1F00000ECF2F1EDF2F1
      F0F3F1FBF5F2FBF5F2FFFAF7CADBC8298A2C08A21815B02C1FB83D27BF4E2EC6
      5C35CD6825B951008514016F0766A166D8E5DCEEF2F4EDF0EFECF0EF0000EEF2
      F1EEF2F1EEF2F1EDF1F1EDF1F0EEF2F1FBF9FE96BB970E86130DA81E1AB23120
      B83F28C15028C053159C333C9847A0C7A4E8EEEBF2F4F6EDF1F1EDF1F0EDF1F0
      0000EFF2F1EFF2F1EFF2F1EDF2F1EDF2F0EFF2F2F1F3F4F4F4F750945005910E
      10AA211CB83411A42A14841F79B07DD0DED1F3F4F7F1F4F5EEF2F0EEF2F1EEF2
      F1EEF2F10000EFF2F1EFF2F1EFF2F1EDF2F1EDF2F0EFF2F2EFF2F2F5F5F8E1E7
      E30F731003A10C007A00328935BED5C0EAEEECF5F6F8EEF2F3EEF2F2EEF2F0EE
      F2F1EEF2F1EEF2F10000EFF2F1EFF2F1EFF2F1EDF2F1EDF2F0EFF2F2EFF2F2EF
      F2F2FBF9FEA5C6A700590089B68BEAEEECF3F5F6F0F3F3EEF2F0EEF2F2EEF2F2
      EEF2F0EEF2F1EEF2F1EEF2F10000EFF2F1EFF2F1EFF2F1EDF2F1EDF2F0EFF2F2
      EFF2F2EFF2F2EFF2F2F3F5F7F2F3F6F4F5F6F2F4F5EEF2F1EEF2F1EEF2F0EEF2
      F2EEF2F2EEF2F0EEF2F1EEF2F1EEF2F10000}
    OnClick = btUpClick
  end
  object Splitter1: TSplitter
    Left = 194
    Top = 69
    Width = 3
    Height = 396
    Cursor = crHSplit
  end
  object Gdbg: TDBGrid
    Left = 197
    Top = 69
    Width = 760
    Height = 396
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
    OnDblClick = GdbgDblClick
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
  object FAccNam: TComboBox
    Left = 705
    Top = 7
    Width = 193
    Height = 21
    Anchors = [akTop, akRight]
    BiDiMode = bdRightToLeft
    ItemHeight = 13
    ParentBiDiMode = False
    Sorted = True
    TabOrder = 0
    OnDragDrop = FAccNamDragDrop
    OnDragOver = FAccNamDragOver
    OnKeyDown = FAccNamKeyDown
    OnKeyPress = NextTab
  end
  object Sb1: TStatusBar
    Left = 0
    Top = 498
    Width = 957
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
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9
    UseSystemFont = False
  end
  object SDat: TMaskEdit
    Left = 822
    Top = 38
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
    Left = 704
    Top = 38
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
    Top = 465
    Width = 957
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
      Columns = 5
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        '„ÕœÊœÂ'
        'ﬂ· œÊ—Â'
        '„«ÂÌ«‰Â'
        '„—ò“'
        'œ› —ò·')
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 0
      OnClick = BShowClick
    end
    object Panel2: TPanel
      Left = 653
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
      object Bdiag: TButton
        Left = 153
        Top = 3
        Width = 73
        Height = 26
        BiDiMode = bdRightToLeft
        Caption = '&‰„Êœ«—'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Mitra'
        Font.Style = [fsBold, fsItalic]
        ParentBiDiMode = False
        ParentFont = False
        TabOrder = 2
        OnClick = BdiagClick
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
        TabOrder = 3
        OnClick = BexitClick
      end
    end
  end
  object FCostN: TComboBox
    Left = 396
    Top = 7
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
    Left = 396
    Top = 37
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
  object tvAckod: TTreeView
    Tag = -1
    Left = 0
    Top = 69
    Width = 194
    Height = 396
    Hint = 'Enter= ÂÌÂ ê“«—‘'
    Align = alLeft
    Indent = 19
    ParentColor = True
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 8
    TabStop = False
    OnDblClick = tvAckodDblClick
    OnKeyUp = tvAckodKeyUp
    Items.Data = {
      030000001D000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000
      04C8CFE5ED1F000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000
      0006D3D1E3C7EDE51F000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000
      0000000006CFC7D1C7EDED}
  end
  object GQu: TQuery
    DatabaseName = 'ParFro'
    SQL.Strings = (
      'Select * From Gardesh')
    Left = 372
    Top = 116
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
    object GQuId: TAutoIncField
      FieldName = 'Id'
      Origin = 'PARFRO.Gardesh.Id'
      Visible = False
    end
  end
  object GQuDs: TDataSource
    DataSet = GQu
    Left = 346
    Top = 118
  end
end
