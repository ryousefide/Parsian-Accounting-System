object FCashBill: TFCashBill
  Left = 231
  Top = 216
  HelpContext = 120
  ActiveControl = FNo
  AutoSize = True
  BiDiMode = bdRightToLeft
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  BorderWidth = 5
  Caption = 'ﬁ»÷ œ—Ì«›  ‰ﬁœÌ'
  ClientHeight = 282
  ClientWidth = 612
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
    Left = 0
    Top = 25
    Width = 612
    Height = 200
  end
  object Label3: TLabel
    Left = 545
    Top = 34
    Width = 51
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
    Left = 546
    Top = 102
    Width = 51
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
    Left = 547
    Top = 158
    Width = 51
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
    Left = 2
    Top = 231
    Width = 609
    Height = 28
  end
  object Label5: TLabel
    Left = 545
    Top = 1
    Width = 51
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
    Left = 161
    Top = 2
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
  object Label10: TLabel
    Left = 549
    Top = 186
    Width = 48
    Height = 20
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '—›—«‰”'
    FocusControl = FacNo
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    Layout = tlCenter
  end
  object Label4: TLabel
    Left = 548
    Top = 130
    Width = 51
    Height = 19
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = 'Å—ÊéÂ'
    FocusControl = FCost
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object Label7: TLabel
    Left = 236
    Top = 130
    Width = 51
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
  object Label8: TLabel
    Left = 291
    Top = 33
    Width = 45
    Height = 20
    Alignment = taRightJustify
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '‰Ê⁄ «—“'
    FocusControl = FCtip
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object Label9: TLabel
    Left = 546
    Top = 65
    Width = 51
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
  object DBText1: TDBText
    Left = 272
    Top = 1
    Width = 85
    Height = 18
    DataField = 'Rate'
    Transparent = True
  end
  object Label11: TLabel
    Left = 236
    Top = 102
    Width = 51
    Height = 19
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '»Â ’‰œÊﬁ'
    FocusControl = FCaKod
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object Label14: TLabel
    Left = 162
    Top = 33
    Width = 48
    Height = 19
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '‰—Œ «—“'
    FocusControl = FRate
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object Label15: TLabel
    Left = 377
    Top = 34
    Width = 41
    Height = 21
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = 'ò«—„“œ'
    FocusControl = FCw
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object FPbill: TDBEdit
    Left = 421
    Top = 34
    Width = 116
    Height = 21
    Hint = '„»·€Ì òÂ Å” «“ ò”— ò«—„“œ Ê«—œ  Õ”«» ‘œÂ «” '
    HelpContext = 123
    AutoSize = False
    BiDiMode = bdRightToLeftNoAlign
    DataField = 'CPrice'
    DataSource = FroDM.RMonDs
    ParentBiDiMode = False
    TabOrder = 2
    OnKeyPress = NextTab
  end
  object FAccNam: TDBLookupComboBox
    Left = 376
    Top = 101
    Width = 161
    Height = 21
    HelpContext = 128
    BiDiMode = bdRightToLeft
    Color = clRed
    DataField = 'AccNam'
    DataSource = FroDM.RMonDs
    KeyField = 'Nam'
    ListField = 'Nam'
    ListSource = AcQuDs
    ParentBiDiMode = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    OnKeyDown = FAccNamKeyDown
    OnKeyPress = NextTab
  end
  object BDo: TButton
    Left = 323
    Top = 233
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
    TabOrder = 14
    OnClick = BDoClick
  end
  object Bexit: TButton
    Left = 447
    Top = 233
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
    TabOrder = 20
    OnClick = BexitClick
  end
  object FDesc: TDBEdit
    Left = 68
    Top = 158
    Width = 470
    Height = 21
    HelpContext = 132
    AutoSize = False
    BiDiMode = bdRightToLeft
    DataField = 'Des'
    DataSource = FroDM.RMonDs
    ParentBiDiMode = False
    TabOrder = 11
    OnKeyPress = NextTab
  end
  object cbPrint: TCheckBox
    Left = 73
    Top = 188
    Width = 65
    Height = 17
    HelpContext = 134
    BiDiMode = bdRightToLeft
    Caption = 'ç«Å ﬁ»÷'
    ParentBiDiMode = False
    TabOrder = 13
    OnKeyPress = NextTab
  end
  object FNo: TEdit
    Left = 459
    Top = 0
    Width = 78
    Height = 21
    HelpContext = 121
    TabOrder = 0
    OnKeyPress = FNoKeyPress
  end
  object Bedit: TButton
    Left = 263
    Top = 233
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
    TabOrder = 18
    OnClick = BeditClick
  end
  object BDel: TButton
    Tag = 2
    Left = 387
    Top = 233
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
    TabOrder = 19
    OnClick = BDelClick
  end
  object Bprev: TButton
    Tag = 2
    Left = 74
    Top = 233
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
    TabOrder = 15
    OnClick = BprevClick
  end
  object Bnext: TButton
    Tag = 2
    Left = 134
    Top = 233
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
    TabOrder = 16
    OnClick = BnextClick
  end
  object Bprint: TButton
    Left = 194
    Top = 233
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
    TabOrder = 17
    OnClick = BprintClick
  end
  object Dat1: TMaskEdit
    Left = 72
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
  object FacNo: TDBEdit
    Left = 378
    Top = 186
    Width = 159
    Height = 21
    HelpContext = 133
    AutoSize = False
    BiDiMode = bdRightToLeft
    DataField = 'Inv'
    DataSource = FroDM.RMonDs
    ParentBiDiMode = False
    TabOrder = 12
    OnKeyPress = NextTab
  end
  object FCost: TDBComboBox
    Left = 376
    Top = 129
    Width = 161
    Height = 21
    HelpContext = 130
    BiDiMode = bdRightToLeft
    DataField = 'Cost'
    DataSource = FroDM.RMonDs
    ItemHeight = 13
    ParentBiDiMode = False
    ParentShowHint = False
    ShowHint = True
    Sorted = True
    TabOrder = 9
    OnKeyPress = NextTab
  end
  object FCKod: TDBLookupComboBox
    Left = 68
    Top = 129
    Width = 161
    Height = 21
    HelpContext = 131
    DataField = 'Ckod'
    DataSource = FroDM.RMonDs
    KeyField = 'Kod'
    ListField = 'Nam'
    ListSource = FroDM.CentDs
    TabOrder = 10
    OnKeyDown = FCKodKeyDown
    OnKeyPress = NextTab
  end
  object FCtip: TDBLookupComboBox
    Left = 213
    Top = 32
    Width = 72
    Height = 21
    HelpContext = 125
    BiDiMode = bdRightToLeft
    DataField = 'Ctip'
    DataSource = FroDM.RMonDs
    KeyField = 'Name'
    ListField = 'Name'
    ListSource = FroDM.CtipDs
    ParentBiDiMode = False
    TabOrder = 4
    OnKeyPress = NextTab
  end
  object FEQ: TDBEdit
    Left = 421
    Top = 63
    Width = 116
    Height = 21
    HelpContext = 127
    AutoSize = False
    BiDiMode = bdRightToLeftNoAlign
    DataField = 'Price'
    DataSource = FroDM.RMonDs
    ParentBiDiMode = False
    TabOrder = 6
    OnEnter = FEQEnter
    OnExit = FEQExit
    OnKeyPress = NextTab
  end
  object lCurr: TStaticText
    Left = 370
    Top = 66
    Width = 46
    Height = 17
    Alignment = taRightJustify
    AutoSize = False
    Caption = '—Ì«·'
    TabOrder = 21
  end
  object FCaKod: TDBLookupComboBox
    Left = 68
    Top = 101
    Width = 161
    Height = 21
    HelpContext = 129
    DataField = 'Cakod'
    DataSource = FroDM.RMonDs
    KeyField = 'Ackod'
    ListField = 'Name'
    ListSource = FroDM.CashierDS
    TabOrder = 8
    OnKeyPress = NextTab
  end
  object FRate: TDBEdit
    Left = 72
    Top = 31
    Width = 84
    Height = 21
    HelpContext = 126
    AutoSize = False
    BiDiMode = bdRightToLeft
    DataField = 'Rate'
    DataSource = FroDM.RMonDs
    ParentBiDiMode = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnKeyPress = FRateKeyPress
  end
  object FCw: TDBEdit
    Left = 338
    Top = 32
    Width = 36
    Height = 22
    Hint = 'ò«—„“œ ò”— ‘œÂ «“ ÅÊ· «‰ ﬁ«·Ì'
    HelpContext = 124
    AutoSize = False
    BiDiMode = bdRightToLeft
    DataField = 'Cwage'
    DataSource = FroDM.RMonDs
    ParentBiDiMode = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnKeyPress = NextTab
  end
  object Sb: TStatusBar
    Left = 0
    Top = 262
    Width = 612
    Height = 20
    HelpContext = 118
    Align = alNone
    Panels = <
      item
        Text = 'Ins =  ÃœÌœ'
        Width = 110
      end
      item
        Text = 'Alt+Enter=ÊÌ—«Ì‘'
        Width = 130
      end
      item
        Text = 'F3 =À»  '
        Width = 80
      end
      item
        Text = 'Ctrl+Del = Õ–› '
        Width = 120
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
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9 +
      #9#9#9#9#9#9#9#9#9#9
    SizeGrip = False
    UseSystemFont = False
  end
  object AcQu: TQuery
    DatabaseName = 'ParFro'
    SQL.Strings = (
      'Select *'
      'From Accountkod '
      'where usekod=1'
      'order by Nam')
    Left = 2
    Top = 65534
  end
  object AcQuDs: TDataSource
    DataSet = AcQu
    Left = 30
    Top = 65534
  end
end
