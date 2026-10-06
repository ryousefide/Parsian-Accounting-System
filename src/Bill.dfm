object FBill: TFBill
  Tag = 1
  Left = 249
  Top = 151
  BiDiMode = bdRightToLeft
  BorderStyle = bsNone
  BorderWidth = 5
  Caption = '”‰œ Õ”«»œ«—Ì'
  ClientHeight = 400
  ClientWidth = 780
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
  Visible = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 780
    Height = 367
    Anchors = [akLeft, akTop, akRight, akBottom]
  end
  object Label4: TLabel
    Left = 730
    Top = 7
    Width = 43
    Height = 17
    Anchors = [akTop, akRight]
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '⁄ÿ›'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object Label3: TLabel
    Left = 111
    Top = 7
    Width = 38
    Height = 19
    Hint = '‰«„ ›—Ê‘‰œÂ —« œ—«Ì‰ ﬁ”„  Ê«—œ ﬂ‰Ìœ'
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = ' «—ÌŒ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object Label1: TLabel
    Left = 583
    Top = 6
    Width = 55
    Height = 20
    Anchors = [akTop, akRight]
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '‘„«—Â ”‰œ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    Layout = tlCenter
  end
  object Label2: TLabel
    Left = 710
    Top = 338
    Width = 64
    Height = 21
    Hint = '‰«„ ›—Ê‘‰œÂ —« œ—«Ì‰ ﬁ”„  Ê«—œ ﬂ‰Ìœ'
    Anchors = [akRight, akBottom]
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = 'Ã„⁄ »œÂﬂ«—'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    Layout = tlCenter
  end
  object Label5: TLabel
    Left = 137
    Top = 338
    Width = 68
    Height = 20
    Hint = '‰«„ ›—Ê‘‰œÂ —« œ—«Ì‰ ﬁ”„  Ê«—œ ﬂ‰Ìœ'
    Anchors = [akLeft, akBottom]
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = 'Ã„⁄ »” «‰ﬂ«—'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    Layout = tlCenter
  end
  object Bevel2: TBevel
    Left = 0
    Top = 372
    Width = 782
    Height = 27
    Anchors = [akLeft, akRight, akBottom]
  end
  object Dif: TLabel
    Left = 224
    Top = 337
    Width = 332
    Height = 23
    Alignment = taCenter
    Anchors = [akLeft, akRight, akBottom]
    AutoSize = False
    BiDiMode = bdRightToLeftNoAlign
    ParentBiDiMode = False
  end
  object Label7: TLabel
    Left = 423
    Top = 8
    Width = 57
    Height = 17
    Anchors = [akTop, akRight]
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '‰Ê⁄ ”‰œ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object Label8: TLabel
    Left = 727
    Top = 31
    Width = 46
    Height = 19
    Anchors = [akTop, akRight]
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '‘—Õ '
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    Layout = tlCenter
  end
  object FTaf: TDBEdit
    Left = 501
    Top = 5
    Width = 76
    Height = 21
    Anchors = [akTop, akRight]
    Color = clBtnFace
    DataField = 'Atf'
    DataSource = FroDM.BillDs
    ReadOnly = True
    TabOrder = 15
  end
  object FNo: TEdit
    Left = 641
    Top = 5
    Width = 76
    Height = 21
    Anchors = [akTop, akRight]
    AutoSize = False
    BiDiMode = bdRightToLeft
    ParentBiDiMode = False
    TabOrder = 0
    OnKeyPress = FNoKeyPress
  end
  object Bprev: TButton
    Tag = 2
    Left = 1
    Top = 373
    Width = 49
    Height = 25
    Hint = '‰„«Ì‘ ”‰œ ﬁ»·Ì'
    Anchors = [akLeft, akBottom]
    BiDiMode = bdRightToLeft
    Caption = '&ﬁ»·Ì'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    OnClick = BprevClick
  end
  object Bsave: TButton
    Left = 489
    Top = 373
    Width = 51
    Height = 25
    Hint = 'À»  ”‰œ ÃœÌœ/ €ÌÌ— Ì«› Â<F3>'
    Anchors = [akRight, akBottom]
    BiDiMode = bdRightToLeft
    Caption = 'À» '
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 11
    OnClick = BsaveClick
  end
  object Bnext: TButton
    Tag = 2
    Left = 50
    Top = 373
    Width = 49
    Height = 25
    Hint = '‰„«Ì‘ ”‰œ »⁄œÌ'
    Anchors = [akLeft, akBottom]
    BiDiMode = bdRightToLeft
    Caption = '&»⁄œÌ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    OnClick = BnextClick
  end
  object Bexit: TButton
    Left = 694
    Top = 373
    Width = 85
    Height = 25
    Anchors = [akRight, akBottom]
    BiDiMode = bdRightToLeft
    Cancel = True
    Caption = 'Œ—ÊÃ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 14
    OnClick = BexitClick
  end
  object Bprint: TButton
    Left = 99
    Top = 373
    Width = 49
    Height = 25
    Anchors = [akLeft, akBottom]
    BiDiMode = bdRightToLeft
    Caption = '&ç«Å'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 9
    OnClick = BprintClick
  end
  object BedSum: TDBEdit
    Left = 575
    Top = 338
    Width = 134
    Height = 20
    TabStop = False
    Anchors = [akRight, akBottom]
    AutoSize = False
    BiDiMode = bdRightToLeftNoAlign
    Color = clLime
    DataField = 'BedSum'
    DataSource = FroDM.BillDs
    ParentBiDiMode = False
    ReadOnly = True
    TabOrder = 5
    OnEnter = BItemsExit
    OnKeyPress = NextTab
  end
  object Dat: TMaskEdit
    Left = 16
    Top = 5
    Width = 86
    Height = 23
    AutoSize = False
    BiDiMode = bdRightToLeft
    Constraints.MaxHeight = 26
    EditMask = '1300/00/00;1;_'
    MaxLength = 10
    ParentBiDiMode = False
    TabOrder = 2
    Text = '13  /  /  '
    OnEnter = DatEnter
    OnExit = DatExit
    OnKeyPress = NextTab
  end
  object FDesc: TDBEdit
    Left = 14
    Top = 31
    Width = 703
    Height = 20
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    BiDiMode = bdRightToLeft
    DataField = 'Des'
    DataSource = FroDM.BillDs
    ParentBiDiMode = False
    TabOrder = 3
    OnKeyPress = NextTab
  end
  object BItems: TDBGrid
    Left = 2
    Top = 60
    Width = 779
    Height = 272
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = FroDM.AcBillDs
    FixedColor = clTeal
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Serif'
    Font.Style = []
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 4
    TitleFont.Charset = ARABIC_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Mitra'
    TitleFont.Style = [fsBold]
    OnColEnter = BItemsColEnter
    OnColExit = BItemsColExit
    OnDrawColumnCell = BItemsDrawColumnCell
    OnDblClick = BItemsDblClick
    OnEditButtonClick = BItemsEditButtonClick
    OnEnter = BItemsEnter
    OnKeyDown = BItemsKeyDown
    OnKeyPress = BItemsKeyPress
    OnMouseMove = BItemsMouseMove
    Columns = <
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'Radif'
        Title.Alignment = taCenter
        Title.Caption = '—œÌ›'
        Width = 37
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Ackod'
        Title.Alignment = taCenter
        Title.Caption = 'ﬂœ Õ”«»'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Accnam'
        Title.Alignment = taCenter
        Title.Caption = '‘—Õ'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cost'
        Title.Caption = 'Å—ÊéÂ'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Ckod'
        Title.Caption = '„—ò“'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Des'
        Title.Alignment = taCenter
        Title.Caption = ' Ê÷ÌÕ« '
        Width = 173
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Bed'
        Title.Alignment = taCenter
        Title.Caption = '»œÂﬂ«—'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Bes'
        Title.Alignment = taCenter
        Title.Caption = '»” «‰ﬂ«—'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Ctip'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = '‰Ê⁄ «—“'
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cbed'
        Title.Alignment = taCenter
        Title.Caption = '»œÂò«— «—“Ì'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cbes'
        Title.Alignment = taCenter
        Title.Caption = '»” «‰ò«— «—“Ì'
        Width = 97
        Visible = True
      end>
    object GList: TPopupListBox
      Left = 523
      Top = 24
      Width = 35
      Height = 272
      TabStop = False
      BiDiMode = bdRightToLeft
      Color = clSilver
      ItemHeight = 13
      Parent = BItems
      ParentBiDiMode = False
      ParentShowHint = False
      ShowHint = True
      Sorted = True
      TabOrder = 0
      Visible = False
      OnKeyDown = GListKeyDown
      OnKeyPress = GListKeyPress
    end
    object CList: TPopupListBox
      Left = 411
      Top = 20
      Width = 35
      Height = 272
      TabStop = False
      BiDiMode = bdRightToLeft
      Color = clSilver
      ItemHeight = 13
      Parent = BItems
      ParentBiDiMode = False
      ParentShowHint = False
      ShowHint = True
      Sorted = True
      TabOrder = 1
      Visible = False
      OnKeyDown = CListKeyDown
      OnKeyPress = CListKeyPress
    end
    object AList: TPopupListBox
      Left = 457
      Top = 20
      Width = 35
      Height = 272
      TabStop = False
      BiDiMode = bdRightToLeft
      Color = clSilver
      ItemHeight = 13
      Parent = BItems
      ParentBiDiMode = False
      ParentShowHint = False
      ShowHint = True
      Sorted = True
      TabOrder = 2
      Visible = False
      OnKeyDown = AListKeyDown
      OnKeyPress = AListKeyPress
    end
    object CuList: TPopupListBox
      Left = 348
      Top = 24
      Width = 35
      Height = 272
      Color = clSilver
      ItemHeight = 13
      Parent = BItems
      TabOrder = 3
      Visible = False
      OnKeyDown = CuListKeyDown
      OnKeyPress = CuListKeyPress
    end
  end
  object Bedit: TButton
    Tag = 2
    Left = 540
    Top = 373
    Width = 49
    Height = 25
    Hint = 'ÃÂ   €ÌÌ— »— —ÊÌ ”‰œ Ã«—Ì'
    Anchors = [akRight, akBottom]
    BiDiMode = bdRightToLeft
    Caption = '&ÊÌ—«Ì‘'
    Enabled = False
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 12
    TabStop = False
    OnClick = BeditClick
  end
  object BesSum: TDBEdit
    Left = 1
    Top = 338
    Width = 134
    Height = 20
    TabStop = False
    Anchors = [akLeft, akBottom]
    AutoSize = False
    BiDiMode = bdRightToLeftNoAlign
    Color = clRed
    DataField = 'BesSum'
    DataSource = FroDM.BillDs
    ParentBiDiMode = False
    ReadOnly = True
    TabOrder = 6
    OnKeyPress = NextTab
  end
  object Bdel: TButton
    Tag = 2
    Left = 589
    Top = 373
    Width = 49
    Height = 25
    Anchors = [akRight, akBottom]
    BiDiMode = bdRightToLeft
    Caption = '&Õ–›'
    Enabled = False
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 13
    TabStop = False
    OnClick = BdelClick
  end
  object FPerm: TDBCheckBox
    Left = 168
    Top = 377
    Width = 97
    Height = 17
    TabStop = False
    Anchors = [akLeft, akBottom]
    Caption = '”‰œ œ«∆„‹‹‹Ì'
    DataField = 'LPerm'
    DataSource = FroDM.BillDs
    ReadOnly = True
    TabOrder = 10
    ValueChecked = 'True'
    ValueUnchecked = 'False'
  end
  object FBTip: TDBLookupComboBox
    Left = 269
    Top = 6
    Width = 145
    Height = 21
    Anchors = [akTop, akRight]
    DataField = 'Tip'
    DataSource = FroDM.BillDs
    KeyField = 'Id'
    ListField = 'Des'
    ListSource = FroDM.BtipDs
    TabOrder = 1
    OnKeyPress = NextTab
  end
  object EdQu: TQuery
    SQL.Strings = (
      'Select *'
      'From AcountBill I'
      'Where ')
    Left = 48
    Top = 138
  end
end
