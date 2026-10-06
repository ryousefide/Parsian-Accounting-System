object FBInvArsh: TFBInvArsh
  Tag = 1
  Left = 418
  Top = 246
  ActiveControl = FNo
  BiDiMode = bdRightToLeft
  BorderStyle = bsSingle
  Caption = '»«Ìê«‰Ì ›«ﬂ Ê—Â«Ì Œ—Ìœ'
  ClientHeight = 343
  ClientWidth = 633
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
    Left = 89
    Top = 30
    Width = 3
    Height = 313
    Cursor = crHSplit
  end
  object tvDay: TTreeView
    Left = 0
    Top = 30
    Width = 89
    Height = 313
    Align = alLeft
    HideSelection = False
    Indent = 19
    ReadOnly = True
    TabOrder = 0
    OnClick = tvDayClick
    OnKeyPress = tvDayKeyPress
    Items.Data = {
      01000000280000000000000000000000FFFFFFFFFFFFFFFF000000000C000000
      0F20DDC7DFCAE6D1E5C7ED20CED1EDCF200000000000000000000000FFFFFFFF
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
    Left = 92
    Top = 30
    Width = 541
    Height = 313
    Hint = 'Enter-‰„«Ì‘ ›«ﬂ Ê—'
    Align = alClient
    DataSource = FroDM.BinvoDs
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
        Title.Caption = '—œÌ›'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Tel'
        Title.Caption = '‘„«—Â ›«ò Ê—'
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
        Title.Caption = '»Õ”‹‹‹‹‹‹«»'
        Width = 162
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Ckod'
        Title.Caption = '„—ò‹‹‹‹‹‹‹‹“'
        Width = 130
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
    Width = 633
    Height = 30
    Align = alTop
    AutoSize = True
    BevelInner = bvLowered
    BorderWidth = 2
    ParentColor = True
    TabOrder = 2
    object Sp1: TSpeedButton
      Left = 399
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
      Left = 353
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
      Left = 376
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
      Left = 121
      Top = 7
      Width = 28
      Height = 17
      AutoSize = False
      Caption = '«“—Ê“'
      Layout = tlCenter
    end
    object Label2: TLabel
      Left = 52
      Top = 6
      Width = 19
      Height = 18
      AutoSize = False
      Caption = '«·Ì'
      Layout = tlCenter
    end
    object Label3: TLabel
      Left = 555
      Top = 7
      Width = 66
      Height = 15
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = '‘„«—Â ›«ò Ê—'
    end
    object sp3: TSpeedButton
      Left = 448
      Top = 4
      Width = 23
      Height = 22
      Anchors = [akTop, akRight]
      Flat = True
      OnClick = sp3Click
    end
    object Sd: TEdit
      Left = 73
      Top = 5
      Width = 27
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 0
      Text = '1'
    end
    object Ed: TEdit
      Left = 8
      Top = 5
      Width = 27
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 1
      Text = '31'
    end
    object ud1: TUpDown
      Left = 100
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
      Left = 35
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
      Left = 175
      Top = 6
      Width = 107
      Height = 17
      TabStop = False
      Caption = '—Ê“ Ã«—Ì'
      TabOrder = 4
      OnClick = Cb1Click
    end
    object FNo: TEdit
      Left = 472
      Top = 4
      Width = 84
      Height = 22
      Anchors = [akTop, akRight]
      AutoSize = False
      TabOrder = 5
      OnChange = FNoChange
      OnKeyPress = FNoKeyPress
    end
  end
end
