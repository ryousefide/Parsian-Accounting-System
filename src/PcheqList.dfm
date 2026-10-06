object FPCheqList: TFPCheqList
  Tag = 1
  Left = 169
  Top = 187
  BiDiMode = bdRightToLeft
  BorderStyle = bsSingle
  Caption = 'œ› — çﬂ Â«Ì ’«œ—Â'
  ClientHeight = 330
  ClientWidth = 618
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
  object Bevel2: TBevel
    Left = 0
    Top = 303
    Width = 618
    Height = 27
    Anchors = [akLeft, akRight, akBottom]
  end
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 618
    Height = 301
    Anchors = [akLeft, akTop, akRight, akBottom]
  end
  object Label1: TLabel
    Left = 586
    Top = 7
    Width = 20
    Height = 18
    Alignment = taCenter
    Anchors = [akTop, akRight]
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '«“'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object Label2: TLabel
    Left = 464
    Top = 7
    Width = 24
    Height = 18
    Alignment = taCenter
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
  object Label3: TLabel
    Left = 559
    Top = 307
    Width = 36
    Height = 18
    Anchors = [akRight, akBottom]
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
  end
  object Label4: TLabel
    Left = 321
    Top = 33
    Width = 42
    Height = 18
    Alignment = taCenter
    Anchors = [akTop, akRight]
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '«“ Ã«—Ì'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object Label5: TLabel
    Left = 324
    Top = 7
    Width = 42
    Height = 18
    Alignment = taCenter
    Anchors = [akTop, akRight]
    AutoSize = False
    Caption = '«“ „»·€'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 143
    Top = 8
    Width = 42
    Height = 18
    Alignment = taCenter
    Anchors = [akTop, akRight]
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
  end
  object Label7: TLabel
    Left = 571
    Top = 32
    Width = 42
    Height = 18
    Alignment = taCenter
    Anchors = [akTop, akRight]
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '«“ ”—Ì«·'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object Label8: TLabel
    Left = 444
    Top = 33
    Width = 42
    Height = 18
    Alignment = taCenter
    Anchors = [akTop, akRight]
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = ' « ”—Ì«·'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object Label9: TLabel
    Left = 144
    Top = 34
    Width = 52
    Height = 18
    Alignment = taCenter
    Anchors = [akTop, akRight]
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
  object rgCheq: TRadioGroup
    Left = 409
    Top = 50
    Width = 202
    Height = 31
    Anchors = [akTop, akRight]
    Columns = 3
    ItemIndex = 1
    Items.Strings = (
      'Å«” ‘œÂ'
      'Å«” ‰‘œÂ'
      'ﬂ·ÌÂ')
    Constraints.MaxHeight = 40
    TabOrder = 8
  end
  object Dat1: TMaskEdit
    Left = 491
    Top = 6
    Width = 86
    Height = 21
    Anchors = [akTop, akRight]
    BiDiMode = bdRightToLeft
    Constraints.MaxHeight = 21
    EditMask = '1300/00/00;1;_'
    MaxLength = 10
    ParentBiDiMode = False
    TabOrder = 0
    Text = '13  /  /  '
    OnEnter = Dat1Enter
    OnExit = Dat1Exit
    OnKeyPress = NextTab
  end
  object Dat2: TMaskEdit
    Left = 368
    Top = 6
    Width = 84
    Height = 21
    Anchors = [akTop, akRight]
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
  object PGrid: TDBGrid
    Left = 1
    Top = 82
    Width = 617
    Height = 219
    TabStop = False
    Anchors = [akLeft, akTop, akRight, akBottom]
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
    TabOrder = 9
    TitleFont.Charset = ARABIC_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Mitra'
    TitleFont.Style = [fsBold]
    OnDrawColumnCell = PGridDrawColumnCell
    OnKeyDown = PGridKeyDown
    OnKeyPress = PGridKeyPress
    Columns = <
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'Bdat'
        Title.Alignment = taCenter
        Title.Caption = '”— —”Ìœ'
        Width = 69
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Paydat'
        Title.Alignment = taCenter
        Title.Caption = ' «—ÌŒ ’œÊ—'
        Width = 94
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Bno'
        Title.Alignment = taCenter
        Title.Caption = '”—Ì«·'
        Width = 77
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Jari'
        Title.Alignment = taCenter
        Title.Caption = 'Ã«—Ì'
        Width = 62
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'Pbill'
        Title.Alignment = taCenter
        Title.Caption = '„»·€'
        Width = 127
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Acnam'
        Title.Alignment = taCenter
        Title.Caption = 'Å—œ«Œ Ì »Â'
        Width = 111
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Des'
        Title.Alignment = taCenter
        Title.Caption = '‘—Õ'
        Width = 185
        Visible = True
      end>
  end
  object Fpayed: TEdit
    Left = 386
    Top = 307
    Width = 158
    Height = 18
    TabStop = False
    Anchors = [akRight, akBottom]
    AutoSize = False
    BiDiMode = bdRightToLeft
    BorderStyle = bsNone
    ParentBiDiMode = False
    ParentColor = True
    TabOrder = 10
  end
  object Jari: TComboBox
    Left = 198
    Top = 32
    Width = 118
    Height = 21
    Anchors = [akTop, akRight]
    ItemHeight = 13
    Sorted = True
    TabOrder = 6
    OnKeyPress = NextTab
  end
  object Bshow: TBitBtn
    Left = 1
    Top = 304
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&‰„«Ì‘'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 11
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
    Top = 304
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = 'Œ—ÊÃ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 13
    OnClick = BexitClick
  end
  object Bprint: TButton
    Left = 76
    Top = 304
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&ç«Å'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 12
    OnClick = BprintClick
  end
  object SPrice: TEdit
    Left = 197
    Top = 5
    Width = 121
    Height = 21
    Anchors = [akTop, akRight]
    Constraints.MaxHeight = 21
    TabOrder = 2
    OnExit = SPriceExit
    OnKeyDown = SPriceKeyDown
    OnKeyPress = NextTab
  end
  object EPrice: TEdit
    Left = 4
    Top = 6
    Width = 133
    Height = 21
    Anchors = [akTop, akRight]
    Constraints.MaxHeight = 21
    TabOrder = 3
    OnExit = EPriceExit
    OnKeyDown = EPriceKeyDown
    OnKeyPress = NextTab
  end
  object Sserial: TEdit
    Left = 491
    Top = 31
    Width = 69
    Height = 21
    Anchors = [akTop, akRight]
    Constraints.MaxHeight = 21
    TabOrder = 4
    OnKeyPress = NextTab
  end
  object Eserial: TEdit
    Left = 369
    Top = 31
    Width = 69
    Height = 21
    Anchors = [akTop, akRight]
    Constraints.MaxHeight = 21
    TabOrder = 5
    OnKeyPress = NextTab
  end
  object AcNam: TComboBox
    Left = 4
    Top = 32
    Width = 135
    Height = 21
    Anchors = [akTop, akRight]
    ItemHeight = 13
    Sorted = True
    TabOrder = 7
    OnKeyDown = AcNamKeyDown
    OnKeyPress = NextTab
  end
  object PQu: TQuery
    DatabaseName = 'ParFro'
    SQL.Strings = (
      'SELECT * FROM Pcheq')
    Left = 226
    Top = 193
    object PQuBno: TStringField
      FieldName = 'Bno'
      Origin = 'PARFRO."Pcheq.DB".Bno'
    end
    object PQuBdat: TIntegerField
      FieldName = 'Bdat'
      Origin = 'PARFRO."Pcheq.DB".Bdat'
      DisplayFormat = '####/##/##'
    end
    object PQuPaydat: TIntegerField
      FieldName = 'Paydat'
      Origin = 'PARFRO."Pcheq.DB".Paydat'
      DisplayFormat = '####/##/##'
      EditFormat = '####/##/##'
    end
    object PQuBank: TStringField
      FieldName = 'Bank'
      Origin = 'PARFRO."Pcheq.DB".Bank'
      Size = 45
    end
    object PQuBkod: TStringField
      FieldName = 'Bkod'
      Origin = 'PARFRO."Pcheq.DB".Bkod'
    end
    object PQuJari: TStringField
      FieldName = 'Jari'
      Origin = 'PARFRO."Pcheq.DB".Jari'
    end
    object PQuPbill: TCurrencyField
      FieldName = 'Pbill'
      Origin = 'PARFRO."Pcheq.DB".Pbill'
    end
    object PQuPaykod: TBooleanField
      FieldName = 'Paykod'
      Origin = 'PARFRO."Pcheq.DB".Paykod'
    end
    object PQuDesc: TStringField
      FieldName = 'Des'
      Origin = 'PARFRO."Pcheq.DB".Desc'
      Size = 140
    end
    object PQuAcckod: TFloatField
      FieldName = 'Acckod'
      Origin = 'PARFRO."Pcheq.DB".Acckod'
    end
    object PQuAcnam: TStringField
      FieldKind = fkLookup
      FieldName = 'Acnam'
      LookupDataSet = FroDM.AcKod
      LookupKeyFields = 'Acckod'
      LookupResultField = 'Nam'
      KeyFields = 'Acckod'
      Origin = 'PARFRO."Pcheq.DB".Acnam'
      Size = 45
      Lookup = True
    end
    object PQuPkod: TFloatField
      FieldName = 'Pkod'
      Origin = 'PARFRO."Pcheq.DB".Pkod'
    end
  end
  object Ds: TDataSource
    AutoEdit = False
    DataSet = PQu
    Left = 281
    Top = 192
  end
end
