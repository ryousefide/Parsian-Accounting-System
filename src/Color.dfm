object FColor: TFColor
  Left = 208
  Top = 179
  ActiveControl = FColors
  AutoSize = True
  BiDiMode = bdLeftToRight
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  BorderWidth = 5
  Caption = '„œ· ﬂ«·«'
  ClientHeight = 86
  ClientWidth = 201
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
    Width = 201
    Height = 56
  end
  object Label1: TLabel
    Left = 150
    Top = 9
    Width = 46
    Height = 18
    Alignment = taCenter
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '„œ· ﬂ«·«'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object Label2: TLabel
    Left = 152
    Top = 36
    Width = 44
    Height = 18
    Alignment = taCenter
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = 'ﬂœ „œ·'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object DBText1: TDBText
    Left = 82
    Top = 36
    Width = 39
    Height = 13
    AutoSize = True
    BiDiMode = bdRightToLeftNoAlign
    DataField = 'Id'
    DataSource = FroDM.ColorDs
    ParentBiDiMode = False
  end
  object Bevel2: TBevel
    Left = 0
    Top = 59
    Width = 201
    Height = 27
  end
  object Bnext: TButton
    Left = 50
    Top = 60
    Width = 50
    Height = 25
    BiDiMode = bdRightToLeft
    Caption = '»⁄œÌ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 1
    OnClick = BnextClick
  end
  object Bprev: TButton
    Left = 1
    Top = 60
    Width = 50
    Height = 25
    BiDiMode = bdRightToLeft
    Caption = 'ﬁ»·Ì'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 2
    OnClick = BprevClick
  end
  object Bdel: TButton
    Left = 100
    Top = 60
    Width = 50
    Height = 25
    BiDiMode = bdRightToLeft
    Caption = 'Õ–›'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 3
    OnClick = BdelClick
  end
  object Bexit: TButton
    Left = 150
    Top = 60
    Width = 50
    Height = 25
    BiDiMode = bdRightToLeft
    Cancel = True
    Caption = 'Œ—ÊÃ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clActiveCaption
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 4
    OnClick = BexitClick
  end
  object FColors: TEdit
    Left = 4
    Top = 9
    Width = 139
    Height = 21
    BiDiMode = bdRightToLeft
    MaxLength = 45
    ParentBiDiMode = False
    TabOrder = 0
    OnKeyPress = FColorsKeyPress
  end
end
