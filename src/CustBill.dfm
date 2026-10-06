object FCustBill: TFCustBill
  Left = 18
  Top = 23
  AutoSize = True
  BiDiMode = bdRightToLeft
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = '’Ê—  „«‰œÂ Õ”«»'
  ClientHeight = 112
  ClientWidth = 247
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
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 247
    Height = 81
  end
  object Label1: TLabel
    Left = 164
    Top = 5
    Width = 75
    Height = 18
    AutoSize = False
    Caption = '‰«„  êÌ—‰œÂ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 164
    Top = 30
    Width = 74
    Height = 18
    AutoSize = False
    Caption = '‰«„ Õ”«»'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel2: TBevel
    Left = 0
    Top = 85
    Width = 247
    Height = 27
  end
  object Label3: TLabel
    Left = 164
    Top = 59
    Width = 73
    Height = 18
    AutoSize = False
    Caption = ' « Å«Ì«‰  «—ÌŒ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Fnam: TEdit
    Left = 1
    Top = 3
    Width = 153
    Height = 21
    AutoSize = False
    TabOrder = 0
    OnKeyPress = NextTab
  end
  object FAcNam: TComboBox
    Left = 0
    Top = 27
    Width = 153
    Height = 21
    ItemHeight = 13
    Sorted = True
    TabOrder = 1
    OnKeyDown = FAcNamKeyDown
    OnKeyPress = NextTab
  end
  object Bprint: TButton
    Left = 1
    Top = 86
    Width = 76
    Height = 25
    Caption = 'ç«Å'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 3
    OnClick = BprintClick
  end
  object Bexit: TButton
    Left = 158
    Top = 86
    Width = 88
    Height = 25
    Cancel = True
    Caption = 'Œ—ÊÃ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 4
    OnClick = BexitClick
  end
  object EDat: TMaskEdit
    Left = 73
    Top = 54
    Width = 80
    Height = 21
    AutoSize = False
    BiDiMode = bdRightToLeft
    Constraints.MaxHeight = 26
    EditMask = '1300/00/00;1;_'
    MaxLength = 10
    ParentBiDiMode = False
    TabOrder = 2
    Text = '13  /  /  '
    OnEnter = EDatEnter
    OnExit = EDatExit
    OnKeyPress = NextTab
  end
end
