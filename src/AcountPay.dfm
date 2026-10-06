object FAccPayment: TFAccPayment
  Left = 330
  Top = 196
  ActiveControl = FNo
  AutoSize = True
  BiDiMode = bdRightToLeft
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  BorderWidth = 3
  Caption = 'ﬁ»÷ «‰ ﬁ«·Ì'
  ClientHeight = 353
  ClientWidth = 551
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
    Top = 0
    Width = 550
    Height = 285
  end
  object Label3: TLabel
    Left = 485
    Top = 59
    Width = 51
    Height = 19
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '„»·€ «—“Ì'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object Label1: TLabel
    Left = 486
    Top = 130
    Width = 51
    Height = 19
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '«“ Õ”«»'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object Label2: TLabel
    Left = 487
    Top = 217
    Width = 51
    Height = 19
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '»«» '
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object Bevel2: TBevel
    Left = 46
    Top = 301
    Width = 459
    Height = 27
  end
  object Label5: TLabel
    Left = 485
    Top = 14
    Width = 51
    Height = 19
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '‘„«—Â'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object Label6: TLabel
    Left = 109
    Top = 15
    Width = 49
    Height = 19
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
  end
  object Label10: TLabel
    Left = 488
    Top = 245
    Width = 48
    Height = 20
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '—›—«‰”'
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
    Left = 487
    Top = 160
    Width = 51
    Height = 19
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = 'Å—ÊéÂ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object Label7: TLabel
    Left = 487
    Top = 190
    Width = 52
    Height = 19
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '«“ „—ò“'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object Label8: TLabel
    Left = 281
    Top = 57
    Width = 41
    Height = 21
    Alignment = taRightJustify
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '‰Ê⁄ «—“'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object Label9: TLabel
    Left = 486
    Top = 88
    Width = 51
    Height = 19
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '„⁄«œ·'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object DBText1: TDBText
    Left = 260
    Top = 15
    Width = 85
    Height = 17
    DataField = 'Rate'
    DataSource = FroDM.AcpayDs
    Transparent = True
  end
  object Label11: TLabel
    Left = 176
    Top = 128
    Width = 51
    Height = 19
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '»Â Õ”«»'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object Label14: TLabel
    Left = 109
    Top = 56
    Width = 48
    Height = 21
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '‰—Œ «—“'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object Label12: TLabel
    Left = 175
    Top = 187
    Width = 52
    Height = 19
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '»Â „—ò“'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object FPbill: TDBEdit
    Left = 362
    Top = 58
    Width = 116
    Height = 21
    AutoSize = False
    BiDiMode = bdRightToLeftNoAlign
    DataField = 'CPrice'
    DataSource = FroDM.AcpayDs
    ParentBiDiMode = False
    TabOrder = 2
    OnKeyPress = FPbillKeyPress
  end
  object FBesNam: TDBComboBox
    Left = 316
    Top = 129
    Width = 161
    Height = 21
    Hint = '‰«„ ÿ—› Õ”«»Ì ﬂÂ „»·€ —« Å—œ«Œ  „Ì ﬂ‰œ(«·“«„Ì)'
    BiDiMode = bdRightToLeft
    Color = clRed
    DataField = 'Besnam'
    DataSource = FroDM.AcpayDs
    ItemHeight = 13
    ParentBiDiMode = False
    ParentShowHint = False
    ShowHint = True
    Sorted = True
    TabOrder = 6
    OnKeyDown = FBesNamKeyDown
    OnKeyPress = NextTab
  end
  object BDo: TButton
    Left = 297
    Top = 302
    Width = 64
    Height = 25
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
    Left = 421
    Top = 302
    Width = 83
    Height = 25
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
    Left = 6
    Top = 217
    Width = 471
    Height = 21
    AutoSize = False
    BiDiMode = bdRightToLeft
    DataField = 'Des'
    DataSource = FroDM.AcpayDs
    ParentBiDiMode = False
    TabOrder = 11
    OnKeyPress = NextTab
  end
  object cbPrint: TCheckBox
    Left = 10
    Top = 247
    Width = 65
    Height = 17
    BiDiMode = bdRightToLeft
    Caption = 'ç«Å ﬁ»÷'
    ParentBiDiMode = False
    TabOrder = 13
    OnKeyPress = NextTab
  end
  object FNo: TEdit
    Left = 400
    Top = 13
    Width = 78
    Height = 21
    TabOrder = 0
    OnKeyPress = FNoKeyPress
  end
  object Bedit: TButton
    Left = 237
    Top = 302
    Width = 60
    Height = 25
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
    Left = 361
    Top = 302
    Width = 60
    Height = 25
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
    Left = 48
    Top = 302
    Width = 60
    Height = 25
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
    Left = 108
    Top = 302
    Width = 60
    Height = 25
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
    Left = 168
    Top = 302
    Width = 69
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
    TabOrder = 17
    OnClick = BprintClick
  end
  object Dat1: TMaskEdit
    Left = 16
    Top = 13
    Width = 85
    Height = 21
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
    Left = 394
    Top = 245
    Width = 83
    Height = 21
    AutoSize = False
    BiDiMode = bdRightToLeft
    DataField = 'Inv'
    DataSource = FroDM.AcpayDs
    ParentBiDiMode = False
    TabOrder = 12
    OnKeyPress = NextTab
  end
  object FCost: TDBComboBox
    Left = 315
    Top = 159
    Width = 161
    Height = 21
    BiDiMode = bdRightToLeft
    DataField = 'Cost'
    DataSource = FroDM.AcpayDs
    ItemHeight = 13
    ParentBiDiMode = False
    ParentShowHint = False
    ShowHint = True
    Sorted = True
    TabOrder = 8
    OnKeyPress = NextTab
  end
  object FCKod: TDBLookupComboBox
    Left = 317
    Top = 188
    Width = 161
    Height = 21
    DataField = 'Ckod'
    DataSource = FroDM.AcpayDs
    KeyField = 'Kod'
    ListField = 'Nam'
    ListSource = FroDM.CentDs
    TabOrder = 9
    OnKeyDown = FCKodKeyDown
    OnKeyPress = NextTab
  end
  object FCtip: TDBComboBox
    Left = 203
    Top = 56
    Width = 72
    Height = 21
    Style = csDropDownList
    BiDiMode = bdRightToLeft
    DataField = 'Ctip'
    DataSource = FroDM.AcpayDs
    ItemHeight = 13
    ParentBiDiMode = False
    TabOrder = 3
    OnKeyPress = NextTab
  end
  object FEQ: TDBEdit
    Left = 362
    Top = 86
    Width = 116
    Height = 21
    AutoSize = False
    BiDiMode = bdRightToLeftNoAlign
    DataField = 'Price'
    DataSource = FroDM.AcpayDs
    ParentBiDiMode = False
    TabOrder = 5
    OnEnter = FEQEnter
    OnKeyPress = FPbillKeyPress
  end
  object lCurr: TStaticText
    Left = 312
    Top = 88
    Width = 46
    Height = 17
    Alignment = taRightJustify
    AutoSize = False
    Caption = '—Ì«·'
    TabOrder = 21
  end
  object FBedNam: TDBComboBox
    Left = 7
    Top = 127
    Width = 161
    Height = 21
    Hint = '‰«„ ÿ—› Õ”«»Ì ﬂÂ „»·€ —« œ—Ì«›  „Ì ﬂ‰œ(«·“«„Ì)'
    BiDiMode = bdRightToLeft
    Color = clRed
    DataField = 'Bednam'
    DataSource = FroDM.AcpayDs
    ItemHeight = 13
    ParentBiDiMode = False
    ParentShowHint = False
    ShowHint = True
    Sorted = True
    TabOrder = 7
    OnKeyDown = FBesNamKeyDown
    OnKeyPress = NextTab
  end
  object FRate: TDBEdit
    Left = 17
    Top = 55
    Width = 84
    Height = 21
    AutoSize = False
    BiDiMode = bdRightToLeft
    DataField = 'Rate'
    DataSource = FroDM.AcpayDs
    ParentBiDiMode = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnKeyPress = NextTab
  end
  object Sb: TStatusBar
    Left = 0
    Top = 333
    Width = 551
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
      #9#9#9#9#9#9
    SizeGrip = False
    UseSystemFont = False
  end
  object FCkod2: TDBLookupComboBox
    Left = 7
    Top = 185
    Width = 161
    Height = 21
    DataField = 'CKod2'
    DataSource = FroDM.AcpayDs
    KeyField = 'Kod'
    ListField = 'Nam'
    ListSource = FroDM.CentDs
    TabOrder = 10
    OnEnter = FCkod2Enter
    OnKeyDown = FCKodKeyDown
    OnKeyPress = NextTab
  end
end
