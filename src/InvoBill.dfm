object FInvoBill: TFInvoBill
  Left = 48
  Top = 109
  AutoSize = True
  BiDiMode = bdRightToLeft
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'œ—Ì«›  çﬂ ›«ﬂ Ê—'
  ClientHeight = 95
  ClientWidth = 527
  Color = clBtnFace
  Font.Charset = ARABIC_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = BexitClick
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 527
    Height = 65
  end
  object Label1: TLabel
    Left = 465
    Top = 5
    Width = 54
    Height = 18
    Alignment = taCenter
    AutoSize = False
    Caption = ' «—ÌŒ çﬂ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 326
    Top = 6
    Width = 36
    Height = 18
    Alignment = taCenter
    AutoSize = False
    Caption = '”—Ì«·'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 160
    Top = 6
    Width = 29
    Height = 18
    Alignment = taCenter
    AutoSize = False
    Caption = '»«‰ﬂ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 474
    Top = 33
    Width = 43
    Height = 18
    Alignment = taCenter
    AutoSize = False
    Caption = 'Ã«—Ì'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 333
    Top = 37
    Width = 31
    Height = 18
    Alignment = taCenter
    AutoSize = False
    Caption = '„»·€'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel2: TBevel
    Left = 0
    Top = 68
    Width = 527
    Height = 27
  end
  object FBno: TDBEdit
    Left = 192
    Top = 4
    Width = 132
    Height = 24
    AutoSize = False
    BiDiMode = bdRightToLeft
    DataField = 'Bno'
    DataSource = FroDM.RcheqDs
    ParentBiDiMode = False
    TabOrder = 1
    OnKeyPress = FormKeyPress
  end
  object FBbank: TDBComboBox
    Left = 11
    Top = 5
    Width = 144
    Height = 21
    BiDiMode = bdRightToLeft
    DataField = 'Bank'
    DataSource = FroDM.RcheqDs
    ItemHeight = 13
    ParentBiDiMode = False
    TabOrder = 2
    OnKeyPress = FormKeyPress
  end
  object FBkod: TDBEdit
    Left = 380
    Top = 32
    Width = 77
    Height = 24
    AutoSize = False
    BiDiMode = bdRightToLeft
    DataField = 'Bkod'
    DataSource = FroDM.RcheqDs
    ParentBiDiMode = False
    TabOrder = 3
    OnKeyPress = FormKeyPress
  end
  object FPbill: TDBEdit
    Left = 191
    Top = 33
    Width = 134
    Height = 24
    AutoSize = False
    BiDiMode = bdRightToLeftNoAlign
    DataField = 'Pbill'
    DataSource = FroDM.RcheqDs
    ParentBiDiMode = False
    TabOrder = 4
    OnEnter = FPbillEnter
    OnKeyDown = FPbillKeyDown
    OnKeyPress = FormKeyPress
  end
  object Bsave: TButton
    Left = 203
    Top = 69
    Width = 101
    Height = 25
    Caption = 'À» '
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 8
    OnClick = BsaveClick
  end
  object Bprev: TButton
    Left = 1
    Top = 69
    Width = 101
    Height = 25
    Caption = '&ﬁ»·Ì'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 6
    OnClick = BprevClick
  end
  object Bexit: TButton
    Left = 424
    Top = 69
    Width = 101
    Height = 25
    Cancel = True
    Caption = 'Œ—ÊÃ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 10
    OnClick = BexitClick
  end
  object Dat: TMaskEdit
    Left = 378
    Top = 3
    Width = 80
    Height = 22
    AutoSize = False
    BiDiMode = bdRightToLeft
    Constraints.MaxHeight = 26
    EditMask = '1300/00/00;1;_'
    MaxLength = 10
    ParentBiDiMode = False
    TabOrder = 0
    Text = '13  /  /  '
    OnEnter = DatEnter
    OnExit = DatExit
    OnKeyPress = FormKeyPress
  end
  object FShar: TDBCheckBox
    Left = 16
    Top = 36
    Width = 97
    Height = 17
    Caption = 'çﬂ ‘Â—” «‰'
    DataField = 'Shar'
    DataSource = FroDM.RcheqDs
    TabOrder = 5
    ValueChecked = 'True'
    ValueUnchecked = 'False'
    OnKeyPress = FSharKeyPress
  end
  object BNext: TButton
    Left = 102
    Top = 69
    Width = 101
    Height = 25
    Caption = '&»⁄œÌ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 7
    OnClick = BNextClick
  end
  object Bdel: TButton
    Left = 323
    Top = 69
    Width = 101
    Height = 25
    Caption = 'Õ–›'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 9
    OnClick = BdelClick
  end
end
