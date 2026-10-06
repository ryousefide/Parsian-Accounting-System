object FMArsh: TFMArsh
  Tag = 1
  Left = 248
  Top = 176
  ActiveControl = FNo
  BiDiMode = bdRightToLeft
  BorderStyle = bsSingle
  Caption = '»«Ìê«‰Ì ‰ﬁ· Ê «‰ ﬁ«·« '
  ClientHeight = 307
  ClientWidth = 543
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
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 118
    Top = 30
    Width = 3
    Height = 277
    Cursor = crHSplit
  end
  object Splitter2: TSplitter
    Left = 538
    Top = 30
    Width = 3
    Height = 277
    Cursor = crHSplit
    Align = alRight
  end
  object tvDay: TTreeView
    Left = 0
    Top = 30
    Width = 118
    Height = 277
    Align = alLeft
    HideSelection = False
    Indent = 19
    ReadOnly = True
    TabOrder = 0
    OnClick = tvDayClick
    OnKeyPress = tvDayKeyPress
    Items.Data = {
      01000000270000000000000000000000FFFFFFFFFFFFFFFF000000000C000000
      0EE4DEE120E620C7E4CADEC7E1C7CA200000000000000000000000FFFFFFFFFF
      FFFFFF000000000000000007DDD1E6D1CFEDE4210000000000000000000000FF
      FFFFFFFFFFFFFF000000000000000008C7D1CFEDC8E5D4CA1E00000000000000
      00000000FFFFFFFFFFFFFFFF000000000000000005CED1CFC7CF1C0000000000
      000000000000FFFFFFFFFFFFFFFF000000000000000003CAEDD11E0000000000
      000000000000FFFFFFFFFFFFFFFF000000000000000005E3D1CFC7CF1F000000
      0000000000000000FFFFFFFFFFFFFFFF000000000000000006D4E5D1EDE6D11C
      0000000000000000000000FFFFFFFFFFFFFFFF000000000000000003E3E5D11D
      0000000000000000000000FFFFFFFFFFFFFFFF000000000000000004C2C8C7E4
      1C0000000000000000000000FFFFFFFFFFFFFFFF000000000000000003C2D0D1
      1B0000000000000000000000FFFFFFFFFFFFFFFF000000000000000002CFED1D
      0000000000000000000000FFFFFFFFFFFFFFFF000000000000000004C8E5E3E4
      1E0000000000000000000000FFFFFFFFFFFFFFFF000000000000000005C7D3DD
      E4CF}
  end
  object BGrid: TDBGrid
    Left = 121
    Top = 30
    Width = 417
    Height = 277
    Hint = 'Enter-‰„«Ì‘ ”‰œ'
    Align = alClient
    DataSource = FroDM.MoveDs
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 1
    TitleFont.Charset = ARABIC_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Serif'
    TitleFont.Style = []
    OnDrawColumnCell = BGridDrawColumnCell
    OnKeyPress = BGridKeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'No'
        Title.Alignment = taCenter
        Title.Caption = '‘„«—Â '
        Width = 55
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Dat'
        Title.Alignment = taCenter
        Title.Caption = ' «—ÌŒ'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Des'
        Title.Alignment = taCenter
        Title.Caption = '‘—Õ'
        Width = 162
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Pnet'
        Title.Alignment = taCenter
        Title.Caption = '„»·€ Œ«·’ '
        Width = 94
        Visible = True
      end>
  end
  object Panel1: TPanel
    Tag = 1
    Left = 0
    Top = 0
    Width = 543
    Height = 30
    Align = alTop
    AutoSize = True
    BevelInner = bvLowered
    BorderWidth = 2
    ParentColor = True
    TabOrder = 2
    object Sp1: TSpeedButton
      Left = 376
      Top = 4
      Width = 23
      Height = 22
      Hint = 'ﬁÿ⁄Ì ‘œ‰ ”‰œ'
      Anchors = [akTop, akRight]
      Flat = True
      ParentShowHint = False
      ShowHint = True
      Spacing = 0
      OnClick = Sp1Click
    end
    object Sp2: TSpeedButton
      Left = 330
      Top = 4
      Width = 23
      Height = 22
      Hint = '„Êﬁ  ‘œ‰ «”‰«œ'
      Anchors = [akTop, akRight]
      Flat = True
      ParentShowHint = False
      ShowHint = True
      OnClick = Sp2Click
    end
    object spBill: TSpeedButton
      Left = 353
      Top = 4
      Width = 23
      Height = 22
      Hint = '‰„«Ì‘ ”‰œ '
      Anchors = [akTop, akRight]
      Flat = True
      ParentShowHint = False
      ShowHint = True
      OnClick = spBillClick
    end
    object Label1: TLabel
      Left = 130
      Top = 6
      Width = 28
      Height = 18
      AutoSize = False
      Caption = '«“—Ê“'
      Layout = tlCenter
    end
    object Label2: TLabel
      Left = 54
      Top = 6
      Width = 24
      Height = 18
      AutoSize = False
      Caption = '«·Ì'
      Layout = tlCenter
    end
    object Label3: TLabel
      Left = 505
      Top = 7
      Width = 31
      Height = 15
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = '‘„«—Â'
    end
    object sp3: TSpeedButton
      Left = 275
      Top = 4
      Width = 23
      Height = 22
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300033300000
        00003777FF377777777707070330FFFFFFF077777F37F3FF3FF707370330F00F
        00F077F77F37F773773707370330FFFFFFF077F77F37F3FFFF3707070330F000
        0FF077777337F777733730003330FFFFFFF037773337F3FF3FF733033330F00F
        0000337FFF37F773777733000330FFFF0FF033777FF7F3FF7F3733007030F08F
        0F03337777F7F7737F7330703700FFFF003337773777FFFF7733307333700000
        0333377FF37777777FFF33073070333000033377F777FF37777F333077000307
        7770333777777F7777773333003300003300333377337777FF77333333333307
        7770333333333377777733333333333000033333333333377773}
      NumGlyphs = 2
      OnClick = sp3Click
    end
    object Sd: TEdit
      Left = 82
      Top = 5
      Width = 27
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 0
      Text = '1'
    end
    object Ed: TEdit
      Left = 7
      Top = 5
      Width = 27
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 1
      Text = '31'
    end
    object ud1: TUpDown
      Left = 109
      Top = 5
      Width = 15
      Height = 21
      Associate = Sd
      Min = 1
      Max = 31
      Position = 1
      TabOrder = 2
      Wrap = False
    end
    object Ud2: TUpDown
      Left = 34
      Top = 5
      Width = 15
      Height = 21
      Associate = Ed
      Min = 1
      Max = 31
      Position = 31
      TabOrder = 3
      Wrap = False
    end
    object Cb1: TCheckBox
      Left = 172
      Top = 6
      Width = 65
      Height = 17
      TabStop = False
      Caption = '—Ê“ Ã«—Ì'
      TabOrder = 4
      OnClick = Cb1Click
    end
    object FNo: TEdit
      Left = 413
      Top = 4
      Width = 83
      Height = 19
      Anchors = [akTop, akRight]
      AutoSize = False
      TabOrder = 5
      OnChange = FNoChange
      OnKeyPress = FNoKeyPress
    end
  end
  object lbFacNo: TXPListBox
    Left = 541
    Top = 30
    Width = 2
    Height = 277
    Hint = '·Ì”  ›«ò Ê—Â«Ì À»  ‰‘œÂ'
    Align = alRight
    ItemHeight = 13
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
  end
end
