object FABillList: TFABillList
  Tag = 1
  Left = 366
  Top = 178
  ActiveControl = SDat
  BiDiMode = bdRightToLeft
  BorderStyle = bsNone
  BorderWidth = 2
  Caption = ' œ› — —Ê“‰«„Â'
  ClientHeight = 404
  ClientWidth = 610
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
  ShowHint = True
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel3: TBevel
    Left = -1
    Top = 369
    Width = 610
    Height = 35
    Anchors = [akLeft, akRight, akBottom]
  end
  object Bevel1: TBevel
    Left = 1
    Top = 27
    Width = 608
    Height = 339
    Anchors = [akLeft, akTop, akRight, akBottom]
    Style = bsRaised
  end
  object Label1: TLabel
    Left = 583
    Top = 2
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
    Left = 473
    Top = 2
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
    Left = 341
    Top = 2
    Width = 38
    Height = 18
    Alignment = taCenter
    Anchors = [akTop, akRight]
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '»Â „»·€'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object Label4: TLabel
    Left = 158
    Top = 1
    Width = 49
    Height = 18
    Alignment = taCenter
    Anchors = [akTop, akRight]
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = 'œ— Õ”«»'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object Label5: TLabel
    Left = 375
    Top = 377
    Width = 37
    Height = 18
    Alignment = taCenter
    Anchors = [akRight, akBottom]
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '„«‰œÂ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object SDat: TMaskEdit
    Left = 502
    Top = 0
    Width = 75
    Height = 21
    Anchors = [akTop, akRight]
    AutoSize = False
    BiDiMode = bdRightToLeft
    Constraints.MaxHeight = 21
    EditMask = '1300/00/00;1;_'
    MaxLength = 10
    ParentBiDiMode = False
    TabOrder = 0
    Text = '13  /  /  '
    OnEnter = SDatEnter
    OnExit = SDatExit
    OnKeyPress = NextTab
  end
  object EDat: TMaskEdit
    Left = 387
    Top = 0
    Width = 75
    Height = 21
    Anchors = [akTop, akRight]
    AutoSize = False
    BiDiMode = bdRightToLeft
    Constraints.MaxHeight = 21
    EditMask = '1300/00/00;1;_'
    MaxLength = 10
    ParentBiDiMode = False
    TabOrder = 1
    Text = '13  /  /  '
    OnEnter = EDatEnter
    OnExit = EDatExit
    OnKeyPress = NextTab
  end
  object ABillDbg: TDBGrid
    Left = 5
    Top = 32
    Width = 600
    Height = 330
    Anchors = [akLeft, akTop, akRight, akBottom]
    BiDiMode = bdRightToLeft
    DataSource = FroDM.AcBListDs
    FixedColor = clTeal
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Serif'
    Font.Style = []
    Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentBiDiMode = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 4
    TitleFont.Charset = ARABIC_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Mitra'
    TitleFont.Style = [fsBold]
    OnKeyDown = ABillDbgKeyDown
    OnKeyPress = ABillDbgKeyPress
    Columns = <
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'No'
        Title.Alignment = taCenter
        Title.Caption = '”‰œ'
        Width = 43
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Dat'
        Title.Alignment = taCenter
        Title.Caption = ' «—ÌŒ'
        Width = 75
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Ackod'
        Title.Alignment = taCenter
        Title.Caption = 'ﬂœÕ”«»'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Accnam'
        Title.Alignment = taCenter
        Title.Caption = '‰«„ Õ”«»'
        Width = 142
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'Bedeh'
        Title.Alignment = taCenter
        Title.Caption = '»œÂﬂ«—'
        Width = 98
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'Bestan'
        Title.Alignment = taCenter
        Title.Caption = '»” «‰ﬂ«—'
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Desc'
        Title.Alignment = taCenter
        Title.Caption = '‘—Õ'
        Width = 198
        Visible = True
      end>
  end
  object Chb1: TCheckBox
    Left = 542
    Top = 377
    Width = 65
    Height = 17
    Hint = 'ÃÂ  ‰„«Ì‘ ‰«„ Õ”«»'
    Anchors = [akRight, akBottom]
    BiDiMode = bdRightToLeft
    Caption = '‰«„ Õ”«»'
    Checked = True
    ParentBiDiMode = False
    State = cbChecked
    TabOrder = 5
    OnClick = Chb1Click
  end
  object Chb3: TCheckBox
    Left = 488
    Top = 377
    Width = 47
    Height = 17
    Hint = 'ÃÂ  ‰„«Ì‘ ‰«„ Õ”«»'
    Anchors = [akRight, akBottom]
    BiDiMode = bdRightToLeft
    Caption = '‘—Õ'
    Checked = True
    ParentBiDiMode = False
    State = cbChecked
    TabOrder = 6
    OnClick = Chb3Click
  end
  object Chb4: TCheckBox
    Left = 419
    Top = 377
    Width = 61
    Height = 17
    Hint = 'ÃÂ  ‰„«Ì‘ ‰«„ Õ”«»'
    Anchors = [akRight, akBottom]
    BiDiMode = bdRightToLeft
    Caption = 'ﬂœ Õ”«»'
    ParentBiDiMode = False
    TabOrder = 7
    OnClick = Chb4Click
  end
  object FAccNam: TComboBox
    Left = 12
    Top = 1
    Width = 136
    Height = 21
    Anchors = [akTop, akRight]
    BiDiMode = bdRightToLeft
    ItemHeight = 13
    ParentBiDiMode = False
    Sorted = True
    TabOrder = 3
    OnKeyPress = NextTab
  end
  object SPrice: TEdit
    Left = 212
    Top = 1
    Width = 121
    Height = 21
    Anchors = [akTop, akRight]
    AutoSize = False
    Constraints.MaxHeight = 21
    TabOrder = 2
    OnExit = SPriceExit
    OnKeyDown = SPriceKeyDown
    OnKeyPress = SPriceKeyPress
  end
  object Rem: TEdit
    Left = 236
    Top = 375
    Width = 130
    Height = 21
    TabStop = False
    Anchors = [akRight, akBottom]
    AutoSize = False
    Constraints.MaxHeight = 21
    ReadOnly = True
    TabOrder = 8
    OnExit = SPriceExit
    OnKeyDown = SPriceKeyDown
  end
  object Panel1: TPanel
    Left = 0
    Top = 370
    Width = 233
    Height = 33
    Anchors = [akLeft, akBottom]
    AutoSize = True
    BevelInner = bvLowered
    BorderWidth = 2
    TabOrder = 9
    object BExit: TButton
      Left = 154
      Top = 4
      Width = 75
      Height = 25
      Cancel = True
      Caption = 'Œ—ÊÃ'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Mitra'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      TabOrder = 2
      OnClick = BExitClick
    end
    object Bprint: TButton
      Left = 79
      Top = 4
      Width = 75
      Height = 25
      BiDiMode = bdRightToLeft
      Caption = '&ç«Å'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Mitra'
      Font.Style = [fsBold, fsItalic]
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 1
      OnClick = BprintClick
    end
    object Bshow: TBitBtn
      Left = 4
      Top = 4
      Width = 75
      Height = 25
      Caption = '&‰„«Ì‘'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
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
  end
end
