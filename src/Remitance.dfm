object FRemit: TFRemit
  Tag = 1
  Left = 498
  Top = 79
  HelpContext = 200
  BiDiMode = bdRightToLeft
  BorderStyle = bsSingle
  BorderWidth = 4
  Caption = '—„Ì «‰” ’—«›Ì'
  ClientHeight = 504
  ClientWidth = 557
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
  Position = poDefault
  Visible = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 491
    Top = 2
    Width = 65
    Height = 20
    Alignment = taRightJustify
    Anchors = [akTop, akRight]
    AutoSize = False
    Caption = '‘„«—Â'
    FocusControl = FNo
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentFont = False
    Layout = tlCenter
  end
  object Label2: TLabel
    Left = 95
    Top = 2
    Width = 48
    Height = 20
    Alignment = taRightJustify
    AutoSize = False
    Caption = ' «—ÌŒ'
    FocusControl = Dat1
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentFont = False
    Layout = tlCenter
  end
  object Label4: TLabel
    Left = 493
    Top = 28
    Width = 64
    Height = 20
    Alignment = taRightJustify
    Anchors = [akTop, akRight]
    AutoSize = False
    Caption = ' Ê”ÿ'
    FocusControl = FAccNam
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentFont = False
    Layout = tlCenter
  end
  object Bevel2: TBevel
    Left = -1
    Top = 455
    Width = 556
    Height = 27
    Anchors = [akLeft, akRight, akBottom]
  end
  object Label5: TLabel
    Left = 502
    Top = 271
    Width = 51
    Height = 20
    Alignment = taRightJustify
    Anchors = [akRight, akBottom]
    AutoSize = False
    Caption = 'Ã„⁄:'
    FocusControl = FSum
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentFont = False
    Layout = tlCenter
  end
  object Label3: TLabel
    Left = 493
    Top = 59
    Width = 61
    Height = 20
    Alignment = taRightJustify
    Anchors = [akTop, akRight]
    AutoSize = False
    Caption = ' Ê÷ÌÕ« :'
    FocusControl = FDes
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentFont = False
    Layout = tlCenter
  end
  object BDel: TBitBtn
    Tag = 2
    Left = 145
    Top = 456
    Width = 65
    Height = 25
    HelpContext = 52
    Anchors = [akLeft, akBottom]
    Caption = 'Õ–›'
    TabOrder = 9
    OnClick = BDelClick
  end
  object FNo: TEdit
    Left = 401
    Top = 2
    Width = 84
    Height = 20
    HelpContext = 121
    Anchors = [akTop, akRight]
    AutoSelect = False
    AutoSize = False
    MaxLength = 20
    TabOrder = 0
    OnKeyPress = FNoKeyPress
  end
  object Dat1: TMaskEdit
    Left = 6
    Top = 2
    Width = 84
    Height = 20
    Hint = ' «—ÌŒ ”— —”Ìœ çﬂ'
    HelpContext = 122
    AutoSize = False
    Constraints.MaxHeight = 21
    EditMask = '1300/00/00;1;_'
    MaxLength = 10
    TabOrder = 1
    Text = '13  /  /  '
    OnEnter = Dat1Enter
    OnExit = Dat1Exit
    OnKeyPress = NextTab
  end
  object FAccNam: TDBComboBox
    Left = 316
    Top = 27
    Width = 168
    Height = 21
    HelpContext = 201
    Anchors = [akTop, akRight]
    DataField = 'Acnam'
    DataSource = FroDM.RMDs
    ItemHeight = 13
    ParentShowHint = False
    ShowHint = True
    Sorted = True
    TabOrder = 2
    OnKeyDown = FAccNamKeyDown
    OnKeyPress = NextTab
  end
  object dbg: TDBGrid
    Left = 0
    Top = 85
    Width = 557
    Height = 181
    HelpContext = 203
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = FroDM.RMOutDs
    TabOrder = 4
    TitleFont.Charset = ARABIC_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnColEnter = dbgColEnter
    OnColExit = dbgColExit
    OnDrawColumnCell = dbgDrawColumnCell
    OnDblClick = dbgDblClick
    OnEditButtonClick = dbgEditButtonClick
    OnEnter = dbgEnter
    OnKeyDown = dbgKeyDown
    OnKeyPress = dbgKeyPress
    Columns = <
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'ItNo'
        Title.Caption = '—œÌ›'
        Width = 31
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Acnam'
        Title.Caption = '‰«„ Õ”«»'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Ckod'
        Title.Caption = '„—ò“'
        Width = 115
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Amount'
        Title.Caption = '„ﬁœ«—'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Ctip'
        Title.Caption = '‰Ê⁄ «—“'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Rate'
        Title.Caption = '‰—Œ »—«»—Ì'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Price'
        Title.Caption = '„⁄«œ· —Ì«·Ì'
        Width = 129
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Remfee'
        Title.Caption = 'Â“Ì‰Â «—”«·'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Code'
        Title.Caption = 'òœ  ÕÊÌ·'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Des'
        Title.Caption = '‘—Õ'
        Width = 295
        Visible = True
      end>
    object GList: TPopupListBox
      Left = 426
      Top = 20
      Width = 35
      Height = 181
      TabStop = False
      BiDiMode = bdRightToLeft
      Color = clSilver
      ItemHeight = 13
      Parent = dbg
      ParentBiDiMode = False
      ParentShowHint = False
      ShowHint = True
      Sorted = True
      TabOrder = 0
      Visible = False
      OnKeyDown = GListKeyDown
      OnKeyPress = GListKeyPress
    end
    object AList: TPopupListBox
      Left = 357
      Top = 20
      Width = 35
      Height = 181
      TabStop = False
      BiDiMode = bdRightToLeft
      Color = clSilver
      ItemHeight = 13
      Parent = dbg
      ParentBiDiMode = False
      ParentShowHint = False
      ShowHint = True
      Sorted = True
      TabOrder = 1
      Visible = False
      OnKeyDown = AListKeyDown
      OnKeyPress = AListKeyPress
    end
    object CuList: TPopupListBox
      Left = 296
      Top = 22
      Width = 35
      Height = 181
      Color = clSilver
      ItemHeight = 13
      Parent = dbg
      TabOrder = 2
      Visible = False
      OnKeyDown = CuListKeyDown
      OnKeyPress = CuListKeyPress
    end
  end
  object BSave: TBitBtn
    Left = 338
    Top = 456
    Width = 64
    Height = 25
    HelpContext = 50
    Anchors = [akLeft, akBottom]
    BiDiMode = bdRightToLeft
    Caption = 'À» '
    Enabled = False
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 12
    OnClick = BSaveClick
  end
  object Bexit: TBitBtn
    Left = 466
    Top = 456
    Width = 83
    Height = 25
    HelpContext = 53
    Anchors = [akLeft, akBottom]
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
  object Bedit: TBitBtn
    Tag = 2
    Left = 274
    Top = 456
    Width = 64
    Height = 25
    HelpContext = 51
    Anchors = [akLeft, akBottom]
    BiDiMode = bdRightToLeft
    Caption = '&ÊÌ—«Ì‘'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 11
    OnClick = BeditClick
  end
  object Bprev: TBitBtn
    Tag = 2
    Left = 1
    Top = 456
    Width = 72
    Height = 25
    HelpContext = 57
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
    TabOrder = 7
    OnClick = BprevClick
  end
  object Bnext: TBitBtn
    Tag = 2
    Left = 73
    Top = 456
    Width = 72
    Height = 25
    HelpContext = 56
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
    TabOrder = 8
    OnClick = BnextClick
  end
  object Bprint: TBitBtn
    Left = 402
    Top = 456
    Width = 64
    Height = 25
    HelpContext = 54
    Anchors = [akLeft, akBottom]
    BiDiMode = bdRightToLeft
    Caption = '&ç«Å'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 13
    OnClick = BprintClick
  end
  object FSum: TDBEdit
    Left = 367
    Top = 271
    Width = 127
    Height = 20
    HelpContext = 202
    TabStop = False
    Anchors = [akRight, akBottom]
    AutoSize = False
    DataField = 'Psum'
    DataSource = FroDM.RMDs
    ReadOnly = True
    TabOrder = 5
    OnEnter = FSumEnter
    OnKeyPress = NextTab
  end
  object BNew: TBitBtn
    Left = 210
    Top = 456
    Width = 64
    Height = 25
    HelpContext = 58
    Anchors = [akLeft, akBottom]
    BiDiMode = bdRightToLeft
    Caption = 'ÃœÌœ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 10
    OnClick = BNewClick
  end
  object Sb: TStatusBar
    Left = 0
    Top = 483
    Width = 556
    Height = 20
    HelpContext = 118
    Align = alNone
    Anchors = [akLeft, akRight, akBottom]
    Panels = <
      item
        Text = 'Ins =  ÃœÌœ'
        Width = 100
      end
      item
        Text = 'Alt+Enter=ÊÌ—«Ì‘'
        Width = 110
      end
      item
        Text = 'F3 =À»  '
        Width = 80
      end
      item
        Text = 'Ctrl+Del = Õ–› '
        Width = 110
      end
      item
        Text = 'Esc=Œ—ÊÃ'
        Width = 100
      end>
    ParentColor = True
    ParentFont = True
    SimplePanel = False
    SimpleText = 
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9 +
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9 +
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9
    SizeGrip = False
    UseSystemFont = False
  end
  object DBCheckBox1: TDBCheckBox
    Left = 5
    Top = 273
    Width = 80
    Height = 17
    TabStop = False
    Anchors = [akLeft, akBottom]
    Caption = 'ﬁÿ⁄Ì'
    DataField = 'LPerm'
    DataSource = FroDM.RMDs
    ReadOnly = True
    TabOrder = 6
    ValueChecked = 'True'
    ValueUnchecked = 'False'
    Visible = False
  end
  object FDes: TDBEdit
    Left = 6
    Top = 57
    Width = 478
    Height = 21
    HelpContext = 132
    Anchors = [akLeft, akTop, akRight]
    DataField = 'Des'
    DataSource = FroDM.RMDs
    TabOrder = 3
    OnKeyPress = NextTab
  end
  object Dbg2: TDBGrid
    Tag = 2
    Left = 0
    Top = 297
    Width = 555
    Height = 152
    HelpContext = 204
    Anchors = [akLeft, akRight, akBottom]
    DataSource = FroDM.RMinDs
    TabOrder = 16
    TitleFont.Charset = ARABIC_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnColEnter = dbg2ColEnter
    OnColExit = dbg2ColExit
    OnDrawColumnCell = dbg2DrawColumnCell
    OnDblClick = dbg2DblClick
    OnEditButtonClick = dbg2EditButtonClick
    OnEnter = dbg2Enter
    OnKeyDown = dbg2KeyDown
    OnKeyPress = dbg2KeyPress
    Columns = <
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'ItNo'
        Title.Caption = '—œÌ›'
        Width = 31
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Acnam'
        Title.Caption = '‰«„ Õ”«»'
        Width = 132
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Ckod'
        Title.Caption = '„—ò“ '
        Width = 133
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Amount'
        Title.Caption = '„ﬁœ«—'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Ctip'
        Title.Caption = '‰Ê⁄ «—“'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Rate'
        Title.Caption = '‰—Œ »—«»—Ì'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Price'
        Title.Caption = '„⁄«œ· —Ì«·Ì'
        Width = 137
        Visible = True
      end>
    object GList2: TPopupListBox
      Left = 426
      Top = 18
      Width = 35
      Height = 152
      TabStop = False
      BiDiMode = bdRightToLeft
      Color = clSilver
      ItemHeight = 13
      Parent = Dbg2
      ParentBiDiMode = False
      ParentShowHint = False
      ShowHint = True
      Sorted = True
      TabOrder = 0
      Visible = False
      OnKeyDown = GList2KeyDown
      OnKeyPress = GList2KeyPress
    end
    object AList2: TPopupListBox
      Left = 351
      Top = 16
      Width = 35
      Height = 152
      TabStop = False
      BiDiMode = bdRightToLeft
      Color = clSilver
      ItemHeight = 13
      Parent = Dbg2
      ParentBiDiMode = False
      ParentShowHint = False
      ShowHint = True
      Sorted = True
      TabOrder = 1
      Visible = False
      OnKeyDown = AList2KeyDown
      OnKeyPress = AList2KeyPress
    end
    object CuList2: TPopupListBox
      Left = 282
      Top = 18
      Width = 35
      Height = 152
      Color = clSilver
      ItemHeight = 13
      Parent = Dbg2
      TabOrder = 2
      Visible = False
      OnKeyDown = CuList2KeyDown
      OnKeyPress = CuList2KeyPress
    end
  end
  object EdQu: TQuery
    DatabaseName = 'E:\Poran\Db'
    SQL.Strings = (
      'Select * From Remitout  I'
      'Where I.No=:g')
    Left = 230
    Top = 14
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'g'
        ParamType = ptUnknown
      end>
  end
end
