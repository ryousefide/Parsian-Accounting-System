object FSafList: TFSafList
  Left = 118
  Top = 128
  AutoSize = True
  BiDiMode = bdRightToLeft
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'œ› — ”› Â Â«Ì œ—Ì«› Ì'
  ClientHeight = 334
  ClientWidth = 625
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
  object Bevel2: TBevel
    Left = 0
    Top = 307
    Width = 625
    Height = 27
  end
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 625
    Height = 303
  end
  object Label1: TLabel
    Left = 574
    Top = 6
    Width = 46
    Height = 18
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '’œÊ— «“'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    Layout = tlCenter
  end
  object Label2: TLabel
    Left = 461
    Top = 5
    Width = 18
    Height = 18
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
    Layout = tlCenter
  end
  object Label3: TLabel
    Left = 567
    Top = 311
    Width = 42
    Height = 18
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = 'Ã„⁄'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    Visible = False
  end
  object Label5: TLabel
    Left = 333
    Top = 5
    Width = 33
    Height = 18
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '«“ „»·€'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    Layout = tlCenter
  end
  object Label6: TLabel
    Left = 156
    Top = 6
    Width = 33
    Height = 18
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = ' « „»·€'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    Layout = tlCenter
  end
  object Label8: TLabel
    Left = 575
    Top = 31
    Width = 47
    Height = 18
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '‰«„ „ ⁄Âœ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    Layout = tlCenter
  end
  object Label4: TLabel
    Left = 331
    Top = 30
    Width = 39
    Height = 18
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = 'Ê÷⁄Ì '
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    Layout = tlCenter
  end
  object Dat1: TMaskEdit
    Left = 484
    Top = 4
    Width = 86
    Height = 21
    Hint = ' «—ÌŒ ”——”Ìœ çﬂ'
    BiDiMode = bdRightToLeft
    Constraints.MaxHeight = 21
    EditMask = '1300/00/00;1;_'
    MaxLength = 10
    ParentBiDiMode = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    Text = '13  /  /  '
    OnEnter = Dat1Enter
    OnExit = Dat1Exit
    OnKeyPress = NextTab
  end
  object Dat2: TMaskEdit
    Left = 372
    Top = 4
    Width = 84
    Height = 21
    BiDiMode = bdRightToLeft
    Constraints.MaxHeight = 21
    EditMask = '1300/00/00;1;_'
    MaxLength = 10
    ParentBiDiMode = False
    TabOrder = 1
    Text = '13  /  /  '
    OnEnter = Dat2Enter
    OnExit = Dat2Exit
    OnKeyPress = NextTab
  end
  object DGrid: TDBGrid
    Left = 1
    Top = 58
    Width = 622
    Height = 244
    TabStop = False
    BiDiMode = bdRightToLeft
    DataSource = Ds
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
    TabOrder = 6
    TitleFont.Charset = ARABIC_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Mitra'
    TitleFont.Style = [fsBold]
    OnKeyPress = DGridKeyPress
    Columns = <
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'Daf'
        Title.Alignment = taCenter
        Title.Caption = '#'
        Width = 45
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'Dat'
        Title.Alignment = taCenter
        Title.Caption = ' «—ÌŒ ’œÊ—'
        Width = 62
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Bno'
        Title.Alignment = taCenter
        Title.Caption = '”—Ì«·'
        Width = 58
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'Pbill'
        Title.Alignment = taCenter
        Title.Caption = '„»·€ ”› Â'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Statue'
        Title.Alignment = taCenter
        Title.Caption = 'Ê÷⁄Ì '
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nam'
        Title.Alignment = taCenter
        Title.Caption = '‰«„ „ ⁄Âœ'
        Width = 92
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'Sprice'
        Title.Alignment = taCenter
        Title.Caption = '„»·€  ⁄ÂœÌ'
        Width = 81
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Qt'
        Title.Alignment = taCenter
        Title.Caption = '«ﬁ”«ÿ'
        Width = 35
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'Pprice'
        Title.Alignment = taCenter
        Title.Caption = '„»·€ Â— ﬁ”ÿ'
        Width = 77
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FNo'
        Title.Alignment = taCenter
        Title.Caption = '›«ﬂ Ê—'
        Width = 43
        Visible = True
      end>
  end
  object Fpayed: TEdit
    Left = 353
    Top = 311
    Width = 196
    Height = 18
    TabStop = False
    AutoSize = False
    BiDiMode = bdRightToLeft
    BorderStyle = bsNone
    ParentBiDiMode = False
    ParentColor = True
    TabOrder = 7
  end
  object Bshow: TBitBtn
    Left = 1
    Top = 308
    Width = 75
    Height = 25
    Caption = '&‰„«Ì‘'
    Constraints.MaxHeight = 25
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
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
  object Bexit: TButton
    Left = 151
    Top = 308
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Œ—ÊÃ'
    Constraints.MaxHeight = 25
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 10
    OnClick = BexitClick
  end
  object Bprint: TButton
    Left = 76
    Top = 308
    Width = 75
    Height = 25
    Caption = '&ç«Å'
    Constraints.MaxHeight = 25
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 9
  end
  object SPrice: TEdit
    Left = 196
    Top = 4
    Width = 131
    Height = 21
    Constraints.MaxHeight = 21
    TabOrder = 2
    OnExit = SPriceExit
    OnKeyDown = SPriceKeyDown
    OnKeyPress = SPriceKeyPress
  end
  object EPrice: TEdit
    Left = 7
    Top = 3
    Width = 142
    Height = 21
    Constraints.MaxHeight = 21
    TabOrder = 3
    OnExit = EPriceExit
    OnKeyDown = EPriceKeyDown
    OnKeyPress = SPriceKeyPress
  end
  object FNam: TComboBox
    Left = 373
    Top = 29
    Width = 197
    Height = 21
    Hint = 'Õ”«»Ì ﬂÂ çﬂ «“ ¬‰ œ—Ì«›  ‘œÂ «” '
    ItemHeight = 13
    ParentShowHint = False
    ShowHint = True
    Sorted = True
    TabOrder = 4
    OnKeyPress = NextTab
  end
  object FStatue: TComboBox
    Left = 197
    Top = 29
    Width = 130
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    Sorted = True
    TabOrder = 5
    OnKeyPress = NextTab
    Items.Strings = (
      '»«ÿ·Â'
      'œ—Ã—Ì«‰'
      'Ê«ŒÊ«” Ì')
  end
  object DQu: TQuery
    DatabaseName = 'ParFro'
    SQL.Strings = (
      'SELECT * FROM Rsaf')
    Left = 250
    Top = 308
    object DQuBno: TStringField
      FieldName = 'Bno'
      Origin = 'PARFRO."Rsaf.DB".Bno'
    end
    object DQuDat: TIntegerField
      FieldName = 'Dat'
      Origin = 'PARFRO."Rsaf.DB".Dat'
      DisplayFormat = '####/##/##'
    end
    object DQuNam: TStringField
      FieldName = 'Nam'
      Origin = 'PARFRO."Rsaf.DB".Nam'
      Size = 45
    end
    object DQuAdd: TStringField
      FieldName = 'Adr'
      Origin = 'PARFRO."Rsaf.DB".Add'
      Size = 100
    end
    object DQuPbill: TCurrencyField
      FieldName = 'Pbill'
      Origin = 'PARFRO."Rsaf.DB".Pbill'
    end
    object DQuStatue: TStringField
      FieldName = 'Statue'
      Origin = 'PARFRO."Rsaf.DB".Statue'
    end
    object DQuFNo: TIntegerField
      FieldName = 'FNo'
      Origin = 'PARFRO."Rsaf.DB".FNo'
    end
    object DQuSprice: TCurrencyField
      FieldName = 'Sprice'
      Origin = 'PARFRO."Rsaf.DB".Sprice'
    end
    object DQuQt: TSmallintField
      FieldName = 'Qt'
      Origin = 'PARFRO."Rsaf.DB".Qt'
    end
    object DQuPprice: TCurrencyField
      FieldName = 'Pprice'
      Origin = 'PARFRO."Rsaf.DB".Pprice'
    end
    object DQuDaf: TIntegerField
      FieldName = 'Daf'
      Origin = 'PARFRO."RSaf.DB".Daf'
    end
  end
  object Ds: TDataSource
    AutoEdit = False
    DataSet = DQu
    Left = 297
    Top = 307
  end
end
