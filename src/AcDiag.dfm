object FAcDiag: TFAcDiag
  Left = 244
  Top = 152
  HelpContext = 1075
  AutoSize = True
  BiDiMode = bdRightToLeft
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = ' ‰„Êœ«— „ﬁ«Ì”Â «Ì'
  ClientHeight = 126
  ClientWidth = 257
  Color = clBtnFace
  Font.Charset = ARABIC_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  HelpFile = 'ParFro'
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 257
    Height = 95
  end
  object Label1: TLabel
    Left = 179
    Top = 10
    Width = 53
    Height = 20
    AutoSize = False
    Caption = '‰«„ Õ”«»'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentFont = False
    Layout = tlCenter
  end
  object Bevel2: TBevel
    Left = 0
    Top = 99
    Width = 257
    Height = 27
  end
  object Label2: TLabel
    Left = 87
    Top = 39
    Width = 43
    Height = 18
    AutoSize = False
    Caption = '«“  «—ÌŒ'
    Enabled = False
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 87
    Top = 65
    Width = 43
    Height = 18
    AutoSize = False
    Caption = ' «  «—ÌŒ'
    Enabled = False
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object FNam: TComboBox
    Left = 6
    Top = 8
    Width = 165
    Height = 21
    ItemHeight = 13
    Sorted = True
    TabOrder = 0
    OnKeyPress = NextTab
  end
  object Bprint: TButton
    Left = 1
    Top = 100
    Width = 81
    Height = 25
    Caption = '‰„«Ì‘'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 4
    OnClick = BprintClick
  end
  object Bexit: TButton
    Left = 169
    Top = 100
    Width = 87
    Height = 25
    Cancel = True
    Caption = 'Œ—ÊÃ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 6
    OnClick = BexitClick
  end
  object BShow: TButton
    Left = 82
    Top = 100
    Width = 87
    Height = 25
    Caption = '‰„Êœ«—'
    TabOrder = 5
    OnClick = BShowClick
  end
  object Rg1: TRadioGroup
    Left = 164
    Top = 31
    Width = 70
    Height = 56
    ItemIndex = 0
    Items.Strings = (
      '„«ÂÌ«‰Â'
      '—Ê“«‰Â')
    TabOrder = 1
    OnClick = Rg1Click
  end
  object SDat: TMaskEdit
    Left = 8
    Top = 38
    Width = 75
    Height = 21
    AutoSize = False
    BiDiMode = bdRightToLeft
    Constraints.MaxHeight = 26
    Enabled = False
    EditMask = '1300/00/00;1;_'
    MaxLength = 10
    ParentBiDiMode = False
    TabOrder = 2
    Text = '13  /  /  '
    OnEnter = SDatEnter
    OnExit = SDatExit
    OnKeyPress = NextTab
  end
  object EDat: TMaskEdit
    Left = 8
    Top = 64
    Width = 75
    Height = 21
    AutoSize = False
    BiDiMode = bdRightToLeft
    Constraints.MaxHeight = 26
    Enabled = False
    EditMask = '1300/00/00;1;_'
    MaxLength = 10
    ParentBiDiMode = False
    TabOrder = 3
    Text = '13  /  /  '
    OnEnter = EDatEnter
    OnExit = EDatExit
    OnKeyPress = NextTab
  end
end
