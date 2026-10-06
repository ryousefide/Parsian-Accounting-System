object FRBinvArsh: TFRBinvArsh
  Tag = 1
  Left = 259
  Top = 175
  ActiveControl = FNo
  BiDiMode = bdRightToLeft
  BorderStyle = bsSingle
  Caption = '»«Ìê«‰Ì ›«ﬂ Ê—Â«Ì „—ÃÊ⁄Ì Œ—Ìœ'
  ClientHeight = 307
  ClientWidth = 744
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
    Left = 100
    Top = 30
    Width = 3
    Height = 277
    Cursor = crHSplit
  end
  object tvDay: TTreeView
    Left = 0
    Top = 30
    Width = 100
    Height = 277
    Align = alLeft
    HideSelection = False
    Indent = 19
    ReadOnly = True
    TabOrder = 0
    OnClick = tvDayClick
    OnKeyPress = tvDayKeyPress
    Items.Data = {
      01000000240000000000000000000000FFFFFFFFFFFFFFFF000000000C000000
      0BE3D1CCE6DAED20CED1EDCF200000000000000000000000FFFFFFFFFFFFFFFF
      000000000000000007DDD1E6D1CFEDE4210000000000000000000000FFFFFFFF
      FFFFFFFF000000000000000008C7D1CFEDC8E5D4CA1E00000000000000000000
      00FFFFFFFFFFFFFFFF000000000000000005CED1CFC7CF1C0000000000000000
      000000FFFFFFFFFFFFFFFF000000000000000003CAEDD11E0000000000000000
      000000FFFFFFFFFFFFFFFF000000000000000005E3D1CFC7CF1F000000000000
      0000000000FFFFFFFFFFFFFFFF000000000000000006D4E5D1EDE6D11C000000
      0000000000000000FFFFFFFFFFFFFFFF000000000000000003E3E5D11D000000
      0000000000000000FFFFFFFFFFFFFFFF000000000000000004C2C8C7E41C0000
      000000000000000000FFFFFFFFFFFFFFFF000000000000000003C2D0D11B0000
      000000000000000000FFFFFFFFFFFFFFFF000000000000000002CFED1D000000
      0000000000000000FFFFFFFFFFFFFFFF000000000000000004C8E5E3E41E0000
      000000000000000000FFFFFFFFFFFFFFFF000000000000000005C7D3DDE4CF}
  end
  object BGrid: TDBGrid
    Left = 103
    Top = 30
    Width = 641
    Height = 277
    Hint = 'Enter-‰„«Ì‘ ”‰œ'
    Align = alClient
    DataSource = FroDM.RejBInvoDs
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
        Width = 63
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
        Title.Caption = '»Õ”‹‹‹‹«»'
        Width = 159
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Ckod'
        Title.Alignment = taCenter
        Title.Caption = '„—ò‹‹‹‹‹‹“'
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
    Width = 744
    Height = 30
    Align = alTop
    AutoSize = True
    BevelInner = bvLowered
    BorderWidth = 2
    ParentColor = True
    TabOrder = 2
    object Sp1: TSpeedButton
      Left = 539
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
      Left = 493
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
      Left = 516
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
      Left = 120
      Top = 7
      Width = 28
      Height = 17
      AutoSize = False
      Caption = '«“—Ê“'
    end
    object Label2: TLabel
      Left = 50
      Top = 7
      Width = 20
      Height = 17
      AutoSize = False
      Caption = '«·Ì'
    end
    object Label3: TLabel
      Left = 706
      Top = 8
      Width = 31
      Height = 15
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = '‘„«—Â'
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
      Left = 4
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
      Left = 31
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
      Left = 161
      Top = 6
      Width = 97
      Height = 17
      TabStop = False
      Caption = '—Ê“ Ã«—Ì'
      TabOrder = 4
      OnClick = Cb1Click
    end
    object FNo: TEdit
      Left = 615
      Top = 5
      Width = 83
      Height = 19
      Anchors = [akTop, akRight]
      AutoSize = False
      TabOrder = 5
      OnChange = FNoChange
      OnKeyPress = FNoKeyPress
    end
  end
end
