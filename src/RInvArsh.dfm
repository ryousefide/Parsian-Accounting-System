object FRInvArsh: TFRInvArsh
  Tag = 1
  Left = 245
  Top = 259
  ActiveControl = FNo
  BiDiMode = bdRightToLeft
  BorderStyle = bsSingle
  Caption = '»«Ìê«‰Ì ›«ﬂ Ê—Â«Ì „—ÃÊ⁄Ì ›—Ê‘'
  ClientHeight = 507
  ClientWidth = 870
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
    Top = 72
    Width = 3
    Height = 376
    Cursor = crHSplit
  end
  object tvDay: TTreeView
    Left = 0
    Top = 72
    Width = 118
    Height = 376
    Align = alLeft
    HideSelection = False
    Indent = 19
    ReadOnly = True
    TabOrder = 0
    OnClick = tvDayClick
    OnKeyPress = tvDayKeyPress
    Items.Data = {
      01000000250000000000000000000000FFFFFFFFFFFFFFFF000000000C000000
      0C20E3D1CCE6DAED20DDD1E6D4200000000000000000000000FFFFFFFFFFFFFF
      FF000000000000000007DDD1E6D1CFEDE4210000000000000000000000FFFFFF
      FFFFFFFFFF000000000000000008C7D1CFEDC8E5D4CA1E000000000000000000
      0000FFFFFFFFFFFFFFFF000000000000000005CED1CFC7CF1C00000000000000
      00000000FFFFFFFFFFFFFFFF000000000000000003CAEDD11E00000000000000
      00000000FFFFFFFFFFFFFFFF000000000000000005E3D1CFC7CF1F0000000000
      000000000000FFFFFFFFFFFFFFFF000000000000000006D4E5D1EDE6D11C0000
      000000000000000000FFFFFFFFFFFFFFFF000000000000000003E3E5D11D0000
      000000000000000000FFFFFFFFFFFFFFFF000000000000000004C2C8C7E41C00
      00000000000000000000FFFFFFFFFFFFFFFF000000000000000003C2D0D11B00
      00000000000000000000FFFFFFFFFFFFFFFF000000000000000002CFED1D0000
      000000000000000000FFFFFFFFFFFFFFFF000000000000000004C8E5E3E41E00
      00000000000000000000FFFFFFFFFFFFFFFF000000000000000005C7D3DDE4CF}
  end
  object BGrid: TDBGrid
    Left = 121
    Top = 72
    Width = 749
    Height = 376
    Hint = 'Enter-‰„«Ì‘ ›«ﬂ Ê—'
    Align = alClient
    DataSource = FroDM.RejInvoDs
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
        Width = 73
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'Nam'
        Title.Alignment = taCenter
        Title.Caption = '»Õ”‹‹‹‹‹‹‹‹«»'
        Width = 154
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Ckod'
        Title.Alignment = taCenter
        Title.Caption = '„—ò‹‹‹‹‹‹‹‹“'
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Pnet'
        Title.Alignment = taCenter
        Title.Caption = '„»·€ Œ«·’ '
        Width = 118
        Visible = True
      end>
  end
  object Panel1: TPanel
    Tag = 1
    Left = 0
    Top = 0
    Width = 870
    Height = 72
    Align = alTop
    BevelInner = bvLowered
    BorderWidth = 2
    ParentColor = True
    TabOrder = 2
    object Sp1: TSpeedButton
      Left = 224
      Top = 11
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
      Left = 178
      Top = 11
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
      Left = 201
      Top = 11
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
      Left = 125
      Top = 15
      Width = 32
      Height = 18
      AutoSize = False
      Caption = '«“—Ê“'
      Layout = tlCenter
    end
    object Label2: TLabel
      Left = 50
      Top = 16
      Width = 24
      Height = 17
      AutoSize = False
      Caption = '«·Ì'
      Layout = tlCenter
    end
    object Label3: TLabel
      Left = 827
      Top = 17
      Width = 34
      Height = 15
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = '‘„«—Â'
    end
    object Label7: TLabel
      Left = 677
      Top = 15
      Width = 47
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
      Left = 281
      Top = 11
      Width = 23
      Height = 22
      Anchors = [akTop, akRight]
      Flat = True
      OnClick = tvDayClick
    end
    object Label5: TLabel
      Left = 678
      Top = 43
      Width = 49
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
      Left = 445
      Top = 12
      Width = 54
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
      Left = 76
      Top = 14
      Width = 27
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 0
      Text = '1'
    end
    object Ed: TEdit
      Left = 4
      Top = 14
      Width = 27
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 1
      Text = '31'
    end
    object ud1: TUpDown
      Left = 103
      Top = 14
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
      Left = 31
      Top = 14
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
      Left = 16
      Top = 43
      Width = 83
      Height = 17
      TabStop = False
      Caption = '—Ê“ Ã«—Ì'
      TabOrder = 4
      OnClick = Cb1Click
    end
    object FNo: TEdit
      Left = 737
      Top = 14
      Width = 83
      Height = 19
      Anchors = [akTop, akRight]
      AutoSize = False
      TabOrder = 5
      OnChange = FNoChange
      OnKeyPress = FNoKeyPress
    end
    object FCKod: TDBLookupComboBox
      Left = 506
      Top = 11
      Width = 164
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
    object FAcNam: TComboBox
      Left = 506
      Top = 39
      Width = 164
      Height = 21
      Anchors = [akTop, akRight]
      BiDiMode = bdRightToLeft
      ItemHeight = 13
      ParentBiDiMode = False
      Sorted = True
      TabOrder = 7
    end
    object FVName: TDBLookupComboBox
      Left = 311
      Top = 11
      Width = 127
      Height = 21
      Anchors = [akTop, akRight]
      BiDiMode = bdRightToLeft
      KeyField = 'Code'
      ListField = 'Nam'
      ListSource = FroDM.VisitDs
      ParentBiDiMode = False
      TabOrder = 8
      OnCloseUp = tvDayClick
      OnDropDown = FVNameDropDown
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 448
    Width = 870
    Height = 59
    Align = alBottom
    BevelInner = bvLowered
    BorderWidth = 2
    TabOrder = 3
    Visible = False
    object Label4: TLabel
      Left = 125
      Top = 16
      Width = 57
      Height = 18
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = 'Ã„⁄ ò·'
    end
    object Fsum: TEdit
      Left = -74
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
      Width = 863
      Height = 47
      Anchors = [akLeft, akTop, akRight]
      DataSource = DS
      TabOrder = 1
      TitleFont.Charset = ARABIC_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Serif'
      TitleFont.Style = []
    end
  end
  object SQu: TQuery
    Left = 54
    Top = 406
  end
  object DS: TDataSource
    DataSet = SQu
    Left = 86
    Top = 406
  end
end
