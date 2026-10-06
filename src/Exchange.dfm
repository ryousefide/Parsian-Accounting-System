object FExchange: TFExchange
  Left = 431
  Top = 111
  HelpContext = 210
  ActiveControl = FNo
  AutoSize = True
  BiDiMode = bdRightToLeft
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  BorderWidth = 5
  Caption = '—”Ìœ  »œÌ· «—“Ì '
  ClientHeight = 237
  ClientWidth = 521
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
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 2
    Top = 29
    Width = 519
    Height = 154
  end
  object Label3: TLabel
    Left = 455
    Top = 68
    Width = 53
    Height = 19
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '„»·€ «—“Ì'
    FocusControl = FPbill
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object Label1: TLabel
    Left = 455
    Top = 37
    Width = 53
    Height = 19
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '«“ Õ”«»'
    FocusControl = FAccNam
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object Label2: TLabel
    Left = 455
    Top = 152
    Width = 53
    Height = 19
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '»«» '
    FocusControl = FDesc
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object Bevel2: TBevel
    Left = 0
    Top = 188
    Width = 521
    Height = 27
  end
  object Label5: TLabel
    Left = 455
    Top = 1
    Width = 53
    Height = 19
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '‘„«—Â'
    FocusControl = FNo
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object Label6: TLabel
    Left = 115
    Top = 1
    Width = 49
    Height = 19
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = ' «—ÌŒ'
    FocusControl = Dat1
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object Label7: TLabel
    Left = 189
    Top = 38
    Width = 67
    Height = 19
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '„—ò“'
    FocusControl = FCKod
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object Label9: TLabel
    Left = 455
    Top = 121
    Width = 53
    Height = 19
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '„⁄«œ·'
    FocusControl = FEQ
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object Label4: TLabel
    Left = 455
    Top = 95
    Width = 53
    Height = 19
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '—Ì   »œÌ·'
    FocusControl = FRate
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object FPbill: TDBEdit
    Left = 331
    Top = 67
    Width = 116
    Height = 21
    HelpContext = 123
    AutoSize = False
    BiDiMode = bdRightToLeftNoAlign
    DataField = 'Amount'
    DataSource = FroDM.ExchDs
    ParentBiDiMode = False
    TabOrder = 4
    OnKeyPress = NextTab
  end
  object FAccNam: TDBLookupComboBox
    Left = 269
    Top = 36
    Width = 178
    Height = 21
    HelpContext = 128
    BiDiMode = bdRightToLeft
    Color = clRed
    DataField = 'Acnam'
    DataSource = FroDM.ExchDs
    KeyField = 'Nam'
    ListField = 'Nam'
    ListSource = FroDM.AcKodDs
    ParentBiDiMode = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnKeyDown = FAccNamKeyDown
    OnKeyPress = NextTab
  end
  object BDo: TButton
    Left = 278
    Top = 189
    Width = 64
    Height = 25
    HelpContext = 50
    BiDiMode = bdRightToLeft
    Caption = 'À» '
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 11
    OnClick = BDoClick
  end
  object Bexit: TButton
    Left = 401
    Top = 189
    Width = 86
    Height = 25
    HelpContext = 54
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
    TabOrder = 17
    OnClick = BexitClick
  end
  object FDesc: TDBEdit
    Left = 26
    Top = 151
    Width = 421
    Height = 21
    HelpContext = 132
    AutoSize = False
    BiDiMode = bdRightToLeft
    DataField = 'Des'
    DataSource = FroDM.ExchDs
    ParentBiDiMode = False
    TabOrder = 9
    OnKeyPress = NextTab
  end
  object cbPrint: TCheckBox
    Left = 101
    Top = 106
    Width = 65
    Height = 17
    HelpContext = 134
    BiDiMode = bdRightToLeft
    Caption = 'ç«Å ﬁ»÷'
    ParentBiDiMode = False
    TabOrder = 10
    Visible = False
    OnKeyPress = NextTab
  end
  object FNo: TEdit
    Left = 369
    Top = 0
    Width = 78
    Height = 21
    HelpContext = 121
    TabOrder = 0
    OnKeyPress = FNoKeyPress
  end
  object Bedit: TButton
    Left = 218
    Top = 189
    Width = 60
    Height = 25
    HelpContext = 51
    BiDiMode = bdRightToLeft
    Caption = '&ÊÌ—«Ì‘'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 15
    OnClick = BeditClick
  end
  object BDel: TButton
    Tag = 2
    Left = 342
    Top = 189
    Width = 60
    Height = 25
    HelpContext = 52
    BiDiMode = bdRightToLeft
    Caption = '&Õ–›'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 16
    OnClick = BDelClick
  end
  object Bprev: TButton
    Tag = 2
    Left = 29
    Top = 189
    Width = 60
    Height = 25
    HelpContext = 57
    BiDiMode = bdRightToLeft
    Caption = '&ﬁ»·Ì'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 12
    OnClick = BprevClick
  end
  object Bnext: TButton
    Tag = 2
    Left = 89
    Top = 189
    Width = 60
    Height = 25
    HelpContext = 56
    BiDiMode = bdRightToLeft
    Caption = '&»⁄œÌ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 13
    OnClick = BnextClick
  end
  object Bprint: TButton
    Left = 149
    Top = 189
    Width = 69
    Height = 25
    HelpContext = 53
    BiDiMode = bdRightToLeft
    Caption = '&ç«Å'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 14
  end
  object Dat1: TMaskEdit
    Tag = 2
    Left = 26
    Top = 0
    Width = 85
    Height = 21
    HelpContext = 122
    AutoSize = False
    BiDiMode = bdRightToLeft
    Constraints.MaxHeight = 21
    EditMask = '1300/00/00;1;_'
    MaxLength = 10
    ParentBiDiMode = False
    TabOrder = 1
    Text = '13  /  /  '
    OnEnter = Dat1Enter
    OnExit = Dat1Exit
    OnKeyPress = NextTab
  end
  object FCKod: TDBLookupComboBox
    Left = 26
    Top = 36
    Width = 159
    Height = 21
    HelpContext = 131
    DataField = 'Ckod'
    DataSource = FroDM.ExchDs
    KeyField = 'Kod'
    ListField = 'Nam'
    ListSource = FroDM.CentDs
    TabOrder = 3
    OnKeyDown = FCKodKeyDown
    OnKeyPress = NextTab
  end
  object FCtip: TDBLookupComboBox
    Left = 270
    Top = 67
    Width = 57
    Height = 21
    HelpContext = 125
    BiDiMode = bdRightToLeft
    DataField = 'Ctip'
    DataSource = FroDM.ExchDs
    KeyField = 'Name'
    ListField = 'Name'
    ListSource = FroDM.CtipDs
    ParentBiDiMode = False
    TabOrder = 5
    OnKeyPress = NextTab
  end
  object FEQ: TDBEdit
    Left = 331
    Top = 120
    Width = 116
    Height = 21
    HelpContext = 212
    AutoSize = False
    BiDiMode = bdRightToLeftNoAlign
    DataField = 'IAmount'
    DataSource = FroDM.ExchDs
    ParentBiDiMode = False
    TabOrder = 7
    OnEnter = FEQEnter
    OnKeyPress = NextTab
  end
  object FRate: TDBEdit
    Left = 363
    Top = 94
    Width = 84
    Height = 21
    HelpContext = 126
    AutoSize = False
    BiDiMode = bdRightToLeft
    DataField = 'Rate'
    DataSource = FroDM.ExchDs
    ParentBiDiMode = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnKeyPress = NextTab
  end
  object FICtip: TDBLookupComboBox
    Left = 270
    Top = 120
    Width = 57
    Height = 21
    HelpContext = 125
    BiDiMode = bdRightToLeft
    DataField = 'ICtip'
    DataSource = FroDM.ExchDs
    KeyField = 'Name'
    ListField = 'Name'
    ListSource = FroDM.CtipDs
    ParentBiDiMode = False
    TabOrder = 8
    OnKeyPress = NextTab
  end
  object Sb: TStatusBar
    Left = 0
    Top = 217
    Width = 521
    Height = 20
    HelpContext = 118
    Align = alNone
    Anchors = [akLeft, akRight, akBottom]
    Panels = <
      item
        Text = 'Ins =  ÃœÌœ'
        Width = 90
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
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9
    SizeGrip = False
    UseSystemFont = False
  end
end
