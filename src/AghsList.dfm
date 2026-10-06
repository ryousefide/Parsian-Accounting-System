object FAghsList: TFAghsList
  Tag = 1
  Left = 210
  Top = 153
  BiDiMode = bdRightToLeft
  BorderStyle = bsNone
  BorderWidth = 5
  Caption = 'œ› — «ﬁ”«ÿ'
  ClientHeight = 358
  ClientWidth = 530
  Color = clBtnFace
  Font.Charset = ARABIC_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  HelpFile = 'ParFro'
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
  object Label1: TLabel
    Left = 477
    Top = 12
    Width = 46
    Height = 18
    Anchors = [akTop, akRight]
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '”——”Ìœ'
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
    Left = 364
    Top = 11
    Width = 18
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
    Layout = tlCenter
  end
  object Label3: TLabel
    Left = 492
    Top = 335
    Width = 33
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
    Left = 475
    Top = 36
    Width = 49
    Height = 18
    Anchors = [akTop, akRight]
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
  object Label7: TLabel
    Left = 362
    Top = 36
    Width = 21
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
    Layout = tlCenter
  end
  object Label8: TLabel
    Left = 134
    Top = 7
    Width = 31
    Height = 18
    Anchors = [akTop, akRight]
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '„ ⁄Âœ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    Layout = tlCenter
  end
  object Bevel3: TBevel
    Left = 271
    Top = 6
    Width = 257
    Height = 58
    Anchors = [akTop, akRight]
    Shape = bsFrame
    Style = bsRaised
  end
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 530
    Height = 358
    Align = alClient
  end
  object rgCheq: TRadioGroup
    Left = 169
    Top = 3
    Width = 100
    Height = 63
    Anchors = [akTop, akRight]
    BiDiMode = bdRightToLeft
    ItemIndex = 2
    Items.Strings = (
      'Ê’Ê· ‘œÂ'
      'Ê’Ê· ‰‘œÂ'
      'ﬂ·ÌÂ')
    ParentBiDiMode = False
    TabOrder = 4
  end
  object Dat1: TMaskEdit
    Left = 387
    Top = 10
    Width = 86
    Height = 21
    Hint = ' «—ÌŒ ”——”Ìœ çﬂ'
    Anchors = [akTop, akRight]
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
    Left = 275
    Top = 10
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
  object DGrid: TDBGrid
    Left = 4
    Top = 66
    Width = 524
    Height = 263
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
    TabOrder = 6
    TitleFont.Charset = ARABIC_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Mitra'
    TitleFont.Style = [fsBold]
    OnDrawColumnCell = DGridDrawColumnCell
    OnKeyDown = DGridKeyDown
    OnKeyPress = DGridKeyPress
    Columns = <
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'Dat'
        Title.Alignment = taCenter
        Title.Caption = '”——”Ìœ'
        Width = 69
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'No'
        Title.Alignment = taCenter
        Title.Caption = '‘„«—Â'
        Width = 57
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'RDat'
        Title.Alignment = taCenter
        Title.Caption = ' «—ÌŒ ’œÊ—'
        Width = 79
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'Gprice'
        Title.Alignment = taCenter
        Title.Caption = '„»·€'
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nam'
        Title.Alignment = taCenter
        Title.Caption = '„ ⁄Âœ'
        Width = 113
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'RNo'
        Title.Alignment = taCenter
        Title.Caption = 'ﬁ»÷'
        Width = 58
        Visible = True
      end>
  end
  object Fpayed: TEdit
    Left = 296
    Top = 335
    Width = 179
    Height = 18
    TabStop = False
    Anchors = [akRight, akBottom]
    AutoSize = False
    BiDiMode = bdRightToLeft
    BorderStyle = bsNone
    ParentBiDiMode = False
    ParentColor = True
    TabOrder = 7
  end
  object Bshow: TBitBtn
    Left = 2
    Top = 332
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
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
    Left = 152
    Top = 332
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
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
    Left = 77
    Top = 332
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&ç«Å'
    Constraints.MaxHeight = 25
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 9
    OnClick = BprintClick
  end
  object AcNam: TComboBox
    Left = 0
    Top = 6
    Width = 131
    Height = 21
    Hint = 'Õ”«»Ì ﬂÂ çﬂ «“ ¬‰ œ—Ì«›  ‘œÂ «” '
    Anchors = [akTop, akRight]
    ItemHeight = 13
    ParentShowHint = False
    ShowHint = True
    Sorted = True
    TabOrder = 5
    OnKeyPress = NextTab
  end
  object RDat1: TMaskEdit
    Left = 387
    Top = 34
    Width = 86
    Height = 21
    Hint = ' «—ÌŒ ”——”Ìœ çﬂ'
    Anchors = [akTop, akRight]
    BiDiMode = bdRightToLeft
    Constraints.MaxHeight = 21
    EditMask = '1300/00/00;1;_'
    MaxLength = 10
    ParentBiDiMode = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    Text = '13  /  /  '
    OnEnter = RDat1Enter
    OnExit = RDat1Exit
    OnKeyPress = NextTab
  end
  object RDat2: TMaskEdit
    Left = 275
    Top = 33
    Width = 84
    Height = 21
    Anchors = [akTop, akRight]
    BiDiMode = bdRightToLeft
    Constraints.MaxHeight = 21
    EditMask = '1300/00/00;1;_'
    MaxLength = 10
    ParentBiDiMode = False
    TabOrder = 3
    Text = '13  /  /  '
    OnEnter = RDat2Enter
    OnExit = RDat2Exit
    OnKeyPress = NextTab
  end
  object DQu: TQuery
    DatabaseName = 'ParFro'
    SQL.Strings = (
      'SELECT * FROM Aghs.Db')
    Left = 118
    Top = 133
    object DQuNo: TIntegerField
      FieldName = 'No'
    end
    object DQuDat: TIntegerField
      FieldName = 'Dat'
      DisplayFormat = '####/##/##'
    end
    object DQuNam: TStringField
      FieldName = 'Nam'
      Size = 45
    end
    object DQuGprice: TCurrencyField
      FieldName = 'Gprice'
    end
    object DQuRNo: TIntegerField
      FieldName = 'RNo'
    end
    object DQuPayed: TBooleanField
      FieldName = 'Payed'
    end
    object DQuRDat: TIntegerField
      FieldName = 'RDat'
      DisplayFormat = '####/##/##'
    end
  end
  object Ds: TDataSource
    AutoEdit = False
    DataSet = DQu
    Left = 164
    Top = 134
  end
end
