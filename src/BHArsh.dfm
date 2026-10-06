object FBHArsh: TFBHArsh
  Tag = 1
  Left = 258
  Top = 157
  BiDiMode = bdRightToLeft
  BorderStyle = bsSingle
  Caption = '»«Ìê«‰Ì »—œ«‘  Â«Ì »«‰òÌ'
  ClientHeight = 443
  ClientWidth = 719
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
    Top = 58
    Width = 3
    Height = 385
    Cursor = crHSplit
  end
  object tvDay: TTreeView
    Left = 0
    Top = 58
    Width = 118
    Height = 385
    Align = alLeft
    AutoExpand = True
    HideSelection = False
    Indent = 19
    ReadOnly = True
    TabOrder = 0
    OnClick = tvDayClick
    OnKeyPress = tvDayKeyPress
    Items.Data = {
      01000000290000000000000000000000FFFFFFFFFFFFFFFF000000000C000000
      10C8D1CFC7D4CA20E5C7ED20C8C7E498ED200000000000000000000000FFFFFF
      FFFFFFFFFF000000000000000007DDD1E6D1CFEDE42100000000000000000000
      00FFFFFFFFFFFFFFFF000000000000000008C7D1CFEDC8E5D4CA1E0000000000
      000000000000FFFFFFFFFFFFFFFF000000000000000005CED1CFC7CF1C000000
      0000000000000000FFFFFFFFFFFFFFFF000000000000000003CAEDD11E000000
      0000000000000000FFFFFFFFFFFFFFFF000000000000000005E3D1CFC7CF1F00
      00000000000000000000FFFFFFFFFFFFFFFF000000000000000006D4E5D1EDE6
      D11C0000000000000000000000FFFFFFFFFFFFFFFF000000000000000003E3E5
      D11D0000000000000000000000FFFFFFFFFFFFFFFF000000000000000004C2C8
      C7E41C0000000000000000000000FFFFFFFFFFFFFFFF000000000000000003C2
      D0D11B0000000000000000000000FFFFFFFFFFFFFFFF000000000000000002CF
      ED1D0000000000000000000000FFFFFFFFFFFFFFFF000000000000000004C8E5
      E3E41E0000000000000000000000FFFFFFFFFFFFFFFF000000000000000005C7
      D3DDE4CF}
  end
  object BGrid: TDBGrid
    Left = 121
    Top = 58
    Width = 598
    Height = 385
    Hint = 'Enter-‰„«Ì‘ ”‰œ'
    Align = alClient
    DataSource = FroDM.BHavDs
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
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Inv'
        Title.Alignment = taCenter
        Title.Caption = '—›—«‰”'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AccNam'
        Title.Alignment = taCenter
        Title.Caption = '»Õ”«»'
        Width = 115
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Ckod'
        Title.Alignment = taCenter
        Title.Caption = '„—ò“'
        Width = 116
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Price'
        Title.Alignment = taCenter
        Title.Caption = '„»·€'
        Width = 110
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'Des'
        Title.Caption = '‘—Õ'
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 719
    Height = 58
    Align = alTop
    AutoSize = True
    BevelInner = bvLowered
    BorderWidth = 2
    ParentColor = True
    TabOrder = 2
    object Sp1: TSpeedButton
      Left = 240
      Top = 4
      Width = 23
      Height = 22
      Hint = 'ﬁÿ⁄Ì ‘œ‰ ”‰œ'
      Flat = True
      ParentShowHint = False
      ShowHint = True
      Spacing = 0
      OnClick = Sp1Click
    end
    object Sp2: TSpeedButton
      Left = 194
      Top = 4
      Width = 23
      Height = 22
      Hint = '„Êﬁ  ‘œ‰ «”‰«œ'
      Flat = True
      ParentShowHint = False
      ShowHint = True
      OnClick = Sp2Click
    end
    object spBill: TSpeedButton
      Left = 217
      Top = 4
      Width = 23
      Height = 22
      Hint = '‰„«Ì‘ ”‰œ '
      Flat = True
      ParentShowHint = False
      ShowHint = True
      OnClick = spBillClick
    end
    object Label1: TLabel
      Left = 134
      Top = 6
      Width = 29
      Height = 19
      AutoSize = False
      Caption = '«“—Ê“'
      Layout = tlCenter
    end
    object Label2: TLabel
      Left = 56
      Top = 6
      Width = 22
      Height = 16
      AutoSize = False
      Caption = '«·Ì'
    end
    object Label7: TLabel
      Left = 537
      Top = 7
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
    object Label3: TLabel
      Left = 673
      Top = 7
      Width = 37
      Height = 16
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = '‘„«—Â'
    end
    object sp3: TSpeedButton
      Left = 316
      Top = 4
      Width = 23
      Height = 22
      Anchors = [akTop, akRight]
      Flat = True
      OnClick = tvDayClick
    end
    object Label4: TLabel
      Left = 675
      Top = 31
      Width = 37
      Height = 16
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = '—›—«‰”'
    end
    object Label5: TLabel
      Left = 536
      Top = 35
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
    object Sd: TEdit
      Left = 82
      Top = 4
      Width = 27
      Height = 21
      TabStop = False
      TabOrder = 5
      Text = '1'
    end
    object Ed: TEdit
      Left = 7
      Top = 4
      Width = 27
      Height = 21
      TabStop = False
      TabOrder = 7
      Text = '31'
    end
    object ud1: TUpDown
      Left = 109
      Top = 4
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
      Top = 4
      Width = 15
      Height = 21
      Associate = Ed
      Min = 1
      Max = 31
      Position = 31
      TabOrder = 6
      Wrap = False
    end
    object FCKod: TDBLookupComboBox
      Left = 349
      Top = 5
      Width = 182
      Height = 21
      Anchors = [akTop, akRight]
      KeyField = 'Kod'
      ListField = 'Nam'
      ListSource = FroDM.CentDs
      TabOrder = 2
      OnCloseUp = tvDayClick
      OnDropDown = FCKodDropDown
      OnKeyDown = FCKodKeyDown
    end
    object FNo: TEdit
      Left = 584
      Top = 6
      Width = 83
      Height = 19
      Anchors = [akTop, akRight]
      AutoSize = False
      TabOrder = 0
      OnChange = FNoChange
      OnKeyPress = FNoKeyPress
    end
    object FInv: TEdit
      Left = 585
      Top = 30
      Width = 83
      Height = 19
      Anchors = [akTop, akRight]
      AutoSize = False
      TabOrder = 1
      OnChange = FInvChange
      OnKeyPress = FNoKeyPress
    end
    object FAcNam: TComboBox
      Left = 348
      Top = 33
      Width = 184
      Height = 21
      Anchors = [akTop, akRight]
      BiDiMode = bdRightToLeft
      ItemHeight = 13
      ParentBiDiMode = False
      Sorted = True
      TabOrder = 3
    end
  end
end
