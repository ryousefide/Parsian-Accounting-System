object FExpArsh: TFExpArsh
  Tag = 1
  Left = 353
  Top = 60
  BiDiMode = bdRightToLeft
  BorderStyle = bsSingle
  Caption = '»«Ìê«‰Ì ’Ê—  Â“Ì‰Â Â«'
  ClientHeight = 536
  ClientWidth = 724
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
    Left = 92
    Top = 51
    Width = 3
    Height = 485
    Cursor = crHSplit
  end
  object tvDay: TTreeView
    Left = 0
    Top = 51
    Width = 92
    Height = 485
    Align = alLeft
    AutoExpand = True
    HideSelection = False
    Indent = 19
    ReadOnly = True
    TabOrder = 1
    OnClick = tvDayClick
    OnKeyPress = tvDayKeyPress
    Items.Data = {
      01000000270000000000000000000000FFFFFFFFFFFFFFFF000000000C000000
      0EDEC8D620E5C7ED20CFD1EDC7DDCA200000000000000000000000FFFFFFFFFF
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
    Left = 95
    Top = 51
    Width = 629
    Height = 485
    Hint = 'Enter-‰„«Ì‘ ”‰œ'
    Align = alClient
    DataSource = FroDM.ExpDs
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 2
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
        FieldName = 'Accnam'
        Title.Alignment = taCenter
        Title.Caption = '«“ Õ”«»'
        Width = 129
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Psum'
        Title.Alignment = taCenter
        Title.Caption = '„»·€'
        Width = 115
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'Des'
        Title.Caption = '‘—Õ'
        Width = 371
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 724
    Height = 51
    Align = alTop
    AutoSize = True
    BevelInner = bvLowered
    BorderWidth = 2
    ParentColor = True
    TabOrder = 0
    object Sp1: TSpeedButton
      Left = 306
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
      Left = 260
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
      Left = 283
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
      Left = 525
      Top = 6
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
      Left = 680
      Top = 6
      Width = 37
      Height = 16
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = '‘„«—Â'
    end
    object sp3: TSpeedButton
      Left = 366
      Top = 4
      Width = 23
      Height = 22
      Anchors = [akTop, akRight]
      Flat = True
      OnClick = tvDayClick
    end
    object Label4: TLabel
      Left = 681
      Top = 29
      Width = 37
      Height = 16
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = '—›—«‰”'
    end
    object Sd: TEdit
      Left = 82
      Top = 4
      Width = 27
      Height = 21
      TabStop = False
      TabOrder = 3
      Text = '1'
    end
    object Ed: TEdit
      Left = 7
      Top = 4
      Width = 27
      Height = 21
      TabStop = False
      TabOrder = 5
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
      TabOrder = 4
      Wrap = False
    end
    object FCKod: TDBLookupComboBox
      Left = 391
      Top = 4
      Width = 131
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
    object FNo: TEdit
      Left = 591
      Top = 5
      Width = 83
      Height = 19
      Anchors = [akTop, akRight]
      AutoSize = False
      TabOrder = 0
      OnChange = FNoChange
      OnKeyPress = FNoKeyPress
    end
    object FInv: TEdit
      Left = 591
      Top = 28
      Width = 83
      Height = 19
      Anchors = [akTop, akRight]
      AutoSize = False
      TabOrder = 6
      OnChange = FInvChange
      OnKeyPress = FNoKeyPress
    end
  end
end
