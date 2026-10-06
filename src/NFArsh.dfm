object FNFArsh: TFNFArsh
  Tag = 1
  Left = 285
  Top = 171
  BiDiMode = bdRightToLeft
  BorderStyle = bsSingle
  Caption = '»«Ìê«‰Ì Ê«—Ì“Â«Ì »«‰òÌ'
  ClientHeight = 425
  ClientWidth = 746
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
    Left = 90
    Top = 57
    Width = 3
    Height = 368
    Cursor = crHSplit
  end
  object tvDay: TTreeView
    Left = 0
    Top = 57
    Width = 90
    Height = 368
    Align = alLeft
    AutoExpand = True
    HideSelection = False
    Indent = 19
    ReadOnly = True
    TabOrder = 0
    OnClick = tvDayClick
    OnKeyPress = tvDayKeyPress
    Items.Data = {
      01000000260000000000000000000000FFFFFFFFFFFFFFFF000000000C000000
      0DDDEDD420E5C7ED20C8C7E498ED200000000000000000000000FFFFFFFFFFFF
      FFFF000000000000000007DDD1E6D1CFEDE4210000000000000000000000FFFF
      FFFFFFFFFFFF000000000000000008C7D1CFEDC8E5D4CA1E0000000000000000
      000000FFFFFFFFFFFFFFFF000000000000000005CED1CFC7CF1C000000000000
      0000000000FFFFFFFFFFFFFFFF000000000000000003CAEDD11E000000000000
      0000000000FFFFFFFFFFFFFFFF000000000000000005E3D1CFC7CF1F00000000
      00000000000000FFFFFFFFFFFFFFFF000000000000000006D4E5D1EDE6D11C00
      00000000000000000000FFFFFFFFFFFFFFFF000000000000000003E3E5D11D00
      00000000000000000000FFFFFFFFFFFFFFFF000000000000000004C2C8C7E41C
      0000000000000000000000FFFFFFFFFFFFFFFF000000000000000003C2D0D11B
      0000000000000000000000FFFFFFFFFFFFFFFF000000000000000002CFED1D00
      00000000000000000000FFFFFFFFFFFFFFFF000000000000000004C8E5E3E41E
      0000000000000000000000FFFFFFFFFFFFFFFF000000000000000005C7D3DDE4
      CF}
  end
  object BGrid: TDBGrid
    Left = 93
    Top = 57
    Width = 653
    Height = 368
    Hint = 'Enter-‰„«Ì‘ ”‰œ'
    Align = alClient
    DataSource = FroDM.NFishDs
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
        FieldName = 'Inv'
        Title.Alignment = taCenter
        Title.Caption = '—›—«‰”'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AccNam'
        Title.Alignment = taCenter
        Title.Caption = '«“ Õ”«»'
        Width = 128
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Ckod'
        Title.Alignment = taCenter
        Title.Caption = '‰«„ „—ò“'
        Width = 132
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Price'
        Title.Alignment = taCenter
        Title.Caption = '„»·€'
        Width = 103
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
    Width = 746
    Height = 57
    Align = alTop
    AutoSize = True
    BevelInner = bvLowered
    BorderWidth = 2
    ParentColor = True
    TabOrder = 2
    object Sp1: TSpeedButton
      Left = 232
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
      Left = 186
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
      Left = 209
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
      Left = 575
      Top = 7
      Width = 37
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
      Left = 701
      Top = 7
      Width = 37
      Height = 16
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = '‘„«—Â'
    end
    object sp3: TSpeedButton
      Left = 361
      Top = 4
      Width = 23
      Height = 22
      Anchors = [akTop, akRight]
      Flat = True
      OnClick = tvDayClick
    end
    object Label4: TLabel
      Left = 703
      Top = 27
      Width = 37
      Height = 16
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = '—›—«‰”'
    end
    object Label5: TLabel
      Left = 574
      Top = 34
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
      TabOrder = 0
      Text = '1'
    end
    object Ed: TEdit
      Left = 7
      Top = 4
      Width = 27
      Height = 21
      TabStop = False
      TabOrder = 1
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
      TabOrder = 2
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
      TabOrder = 3
      Wrap = False
    end
    object FCKod: TDBLookupComboBox
      Left = 385
      Top = 5
      Width = 185
      Height = 21
      Anchors = [akTop, akRight]
      KeyField = 'Kod'
      ListField = 'Nam'
      ListSource = FroDM.CentDs
      TabOrder = 6
      OnCloseUp = tvDayClick
      OnDropDown = FCKodDropDown
      OnKeyDown = FCKodKeyDown
    end
    object FNo: TEdit
      Left = 621
      Top = 6
      Width = 77
      Height = 19
      Anchors = [akTop, akRight]
      AutoSize = False
      TabOrder = 4
      OnChange = FNoChange
      OnKeyPress = FNoKeyPress
    end
    object FInv: TEdit
      Left = 621
      Top = 28
      Width = 77
      Height = 19
      Anchors = [akTop, akRight]
      AutoSize = False
      TabOrder = 5
      OnChange = FInvChange
      OnKeyPress = FNoKeyPress
    end
    object FAcNam: TComboBox
      Left = 384
      Top = 32
      Width = 186
      Height = 21
      Anchors = [akTop, akRight]
      BiDiMode = bdRightToLeft
      ItemHeight = 13
      ParentBiDiMode = False
      Sorted = True
      TabOrder = 7
    end
  end
end
