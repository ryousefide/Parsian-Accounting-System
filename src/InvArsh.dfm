object FInvArsh: TFInvArsh
  Tag = 1
  Left = 202
  Top = 228
  ActiveControl = FNo
  BiDiMode = bdRightToLeft
  BorderStyle = bsSingle
  Caption = '»«Ìê«‰Ì ›«ﬂ Ê— Â«Ì ›—Ê‘'
  ClientHeight = 520
  ClientWidth = 991
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
    Top = 67
    Width = 3
    Height = 394
    Cursor = crHSplit
  end
  object Splitter2: TSplitter
    Left = 986
    Top = 67
    Width = 3
    Height = 394
    Cursor = crHSplit
    Align = alRight
  end
  object tvDay: TTreeView
    Left = 0
    Top = 67
    Width = 118
    Height = 394
    Align = alLeft
    HideSelection = False
    Indent = 19
    ReadOnly = True
    TabOrder = 0
    OnClick = tvDayClick
    OnKeyPress = tvDayKeyPress
    Items.Data = {
      01000000280000000000000000000000FFFFFFFFFFFFFFFF000000000C000000
      0F20DDC7DFCAE6D1E5C7ED20DDD1E6D4200000000000000000000000FFFFFFFF
      FFFFFFFF000000000000000007DDD1E6D1CFEDE4210000000000000000000000
      FFFFFFFFFFFFFFFF000000000000000008C7D1CFEDC8E5D4CA1E000000000000
      0000000000FFFFFFFFFFFFFFFF000000000000000005CED1CFC7CF1C00000000
      00000000000000FFFFFFFFFFFFFFFF000000000000000003CAEDD11E00000000
      00000000000000FFFFFFFFFFFFFFFF000000000000000005E3D1CFC7CF1F0000
      000000000000000000FFFFFFFFFFFFFFFF000000000000000006D4E5D1EDE6D1
      1C0000000000000000000000FFFFFFFFFFFFFFFF000000000000000003E3E5D1
      1D0000000000000000000000FFFFFFFFFFFFFFFF000000000000000004C2C8C7
      E41C0000000000000000000000FFFFFFFFFFFFFFFF000000000000000003C2D0
      D11B0000000000000000000000FFFFFFFFFFFFFFFF000000000000000002CFED
      1D0000000000000000000000FFFFFFFFFFFFFFFF000000000000000004C8E5E3
      E41E0000000000000000000000FFFFFFFFFFFFFFFF000000000000000005C7D3
      DDE4CF}
  end
  object BGrid: TDBGrid
    Left = 121
    Top = 67
    Width = 865
    Height = 394
    Hint = 'Enter-‰„«Ì‘ ”‰œ'
    Align = alClient
    DataSource = FroDM.InvoDs
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 1
    TitleFont.Charset = ARABIC_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
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
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'Nam'
        Title.Alignment = taCenter
        Title.Caption = '»Õ”‹‹‹‹‹‹‹«»'
        Width = 162
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Ckod'
        Title.Alignment = taCenter
        Title.Caption = '„—ò‹‹‹‹‹‹‹‹‹‹“'
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Pkol'
        Title.Caption = '„»·€ ò·'
        Width = 137
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Pdis'
        Title.Caption = ' Œ›Ì›'
        Width = 97
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Pnet'
        Title.Alignment = taCenter
        Title.Caption = '„»·€ Œ«·’ '
        Width = 128
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Prem'
        Title.Caption = '„⁄«œ· —Ì«·Ì'
        Width = 148
        Visible = True
      end>
  end
  object Panel1: TPanel
    Tag = 1
    Left = 0
    Top = 0
    Width = 991
    Height = 67
    Align = alTop
    BevelInner = bvLowered
    BorderWidth = 2
    ParentColor = True
    TabOrder = 2
    object Sp1: TSpeedButton
      Left = 368
      Top = 9
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
      Left = 322
      Top = 9
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
      Left = 345
      Top = 9
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
      Top = 11
      Width = 28
      Height = 18
      AutoSize = False
      Caption = '«“—Ê“'
      Layout = tlCenter
    end
    object Label2: TLabel
      Left = 54
      Top = 11
      Width = 24
      Height = 18
      AutoSize = False
      Caption = '«·Ì'
      Layout = tlCenter
    end
    object Label3: TLabel
      Left = 949
      Top = 12
      Width = 35
      Height = 15
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = '‘„«—Â'
    end
    object sp3: TSpeedButton
      Left = 266
      Top = 9
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
    object Label7: TLabel
      Left = 809
      Top = 11
      Width = 41
      Height = 16
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
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
    object sp4: TSpeedButton
      Left = 420
      Top = 9
      Width = 23
      Height = 22
      Anchors = [akTop, akRight]
      Flat = True
      OnClick = tvDayClick
    end
    object Label5: TLabel
      Left = 812
      Top = 39
      Width = 47
      Height = 16
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      AutoSize = False
      BiDiMode = bdRightToLeft
      Caption = 'Õ”«»'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
    end
    object r: TLabel
      Left = 579
      Top = 10
      Width = 52
      Height = 19
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      AutoSize = False
      BiDiMode = bdRightToLeft
      Caption = 'ÊÌ“Ì Ê—'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Transparent = True
      Layout = tlCenter
    end
    object Sd: TEdit
      Left = 82
      Top = 10
      Width = 27
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 5
      Text = '1'
    end
    object Ed: TEdit
      Left = 7
      Top = 10
      Width = 27
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 7
      Text = '31'
    end
    object ud1: TUpDown
      Left = 109
      Top = 10
      Width = 15
      Height = 21
      Associate = Sd
      Min = 1
      Max = 31
      Position = 1
      TabOrder = 4
      Wrap = False
    end
    object Ud2: TUpDown
      Left = 34
      Top = 10
      Width = 15
      Height = 21
      Associate = Ed
      Min = 1
      Max = 31
      Position = 31
      TabOrder = 6
      Wrap = False
    end
    object Cb1: TCheckBox
      Left = 172
      Top = 11
      Width = 65
      Height = 17
      TabStop = False
      Caption = '—Ê“ Ã«—Ì'
      TabOrder = 8
      OnClick = Cb1Click
    end
    object FNo: TEdit
      Left = 861
      Top = 10
      Width = 83
      Height = 19
      Anchors = [akTop, akRight]
      AutoSize = False
      TabOrder = 0
      OnChange = FNoChange
      OnKeyPress = FNoKeyPress
    end
    object FCKod: TDBLookupComboBox
      Left = 642
      Top = 9
      Width = 164
      Height = 21
      Anchors = [akTop, akRight]
      KeyField = 'Kod'
      ListField = 'Nam'
      ListSource = FroDM.CentDs
      TabOrder = 1
      OnCloseUp = tvDayClick
      OnDropDown = FCKodDropDown
      OnKeyDown = FCKodKeyDown
    end
    object FAcNam: TComboBox
      Left = 642
      Top = 36
      Width = 164
      Height = 21
      Anchors = [akTop, akRight]
      BiDiMode = bdRightToLeft
      ItemHeight = 13
      ParentBiDiMode = False
      Sorted = True
      TabOrder = 2
    end
    object FVName: TDBLookupComboBox
      Left = 450
      Top = 9
      Width = 125
      Height = 21
      Anchors = [akTop, akRight]
      BiDiMode = bdRightToLeft
      KeyField = 'Code'
      ListField = 'Nam'
      ListSource = FroDM.VisitDs
      ParentBiDiMode = False
      TabOrder = 3
      OnCloseUp = tvDayClick
      OnDropDown = FVNameDropDown
    end
  end
  object lbFacNo: TXPListBox
    Left = 989
    Top = 67
    Width = 2
    Height = 394
    Hint = '·Ì”  ›«ò Ê—Â«Ì À»  ‰‘œÂ'
    Align = alRight
    ItemHeight = 13
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
  end
  object Panel2: TPanel
    Left = 0
    Top = 461
    Width = 991
    Height = 59
    Align = alBottom
    BevelInner = bvLowered
    BorderWidth = 2
    TabOrder = 4
    Visible = False
    object Label4: TLabel
      Left = 246
      Top = 16
      Width = 57
      Height = 18
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = 'Ã„⁄ ò·'
    end
    object Fsum: TEdit
      Left = 47
      Top = 15
      Width = 193
      Height = 21
      Anchors = [akTop, akRight]
      ReadOnly = True
      TabOrder = 0
      Text = 'Fsum'
    end
    object Dbg: TDBGrid
      Left = 4
      Top = 6
      Width = 984
      Height = 47
      Anchors = [akLeft, akTop, akRight]
      DataSource = DS
      TabOrder = 1
      TitleFont.Charset = ARABIC_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object SQu: TQuery
    Left = 14
    Top = 424
  end
  object DS: TDataSource
    DataSet = SQu
    Left = 56
    Top = 430
  end
end
