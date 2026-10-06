object FBackUp: TFBackUp
  Tag = 1
  Left = 126
  Top = 242
  Width = 590
  Height = 196
  AutoSize = True
  BiDiMode = bdRightToLeft
  BorderIcons = [biSystemMenu, biMinimize]
  BorderWidth = 2
  Caption = 'Å‘ Ì»«‰Ì'
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
    Left = 184
    Top = 0
    Width = 393
    Height = 137
  end
  object Label2: TLabel
    Left = 482
    Top = 5
    Width = 91
    Height = 18
    AutoSize = False
    Caption = 'œ«Ì—ﬂ Ê—Ì „»œ«¡'
    Constraints.MaxHeight = 21
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label3: TLabel
    Left = 529
    Top = 28
    Width = 46
    Height = 18
    AutoSize = False
    Caption = '‰Ê⁄ ›«Ì·'
    Constraints.MaxHeight = 21
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Bevel2: TBevel
    Left = 185
    Top = 138
    Width = 393
    Height = 20
  end
  object Label4: TLabel
    Left = 482
    Top = 58
    Width = 91
    Height = 18
    AutoSize = False
    Caption = 'œ«Ì—ﬂ Ê—Ì „ﬁ’œ'
    Constraints.MaxHeight = 21
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label5: TLabel
    Left = 189
    Top = 112
    Width = 381
    Height = 13
    AutoSize = False
    BiDiMode = bdLeftToRight
    Caption = '   '
    Color = clBtnFace
    ParentBiDiMode = False
    ParentColor = False
  end
  object sp1: TSpeedButton
    Left = 188
    Top = 6
    Width = 18
    Height = 18
    Caption = '...'
    OnClick = sp1Click
  end
  object sp2: TSpeedButton
    Left = 189
    Top = 57
    Width = 18
    Height = 18
    Caption = '...'
    OnClick = sp2Click
  end
  object Files: TFileListBox
    Left = 0
    Top = 0
    Width = 180
    Height = 158
    TabStop = False
    FileType = [ftHidden, ftSystem, ftNormal]
    ItemHeight = 16
    MultiSelect = True
    ShowGlyphs = True
    TabOrder = 6
  end
  object BPath: TEdit
    Left = 210
    Top = 4
    Width = 270
    Height = 21
    BiDiMode = bdLeftToRight
    Constraints.MaxHeight = 21
    ParentBiDiMode = False
    TabOrder = 0
    OnExit = BPathExit
    OnKeyPress = NextTab
  end
  object FMask: TEdit
    Left = 390
    Top = 29
    Width = 90
    Height = 21
    BiDiMode = bdLeftToRight
    Constraints.MaxHeight = 21
    ParentBiDiMode = False
    TabOrder = 1
    OnExit = FMaskExit
    OnKeyPress = NextTab
  end
  object Pb: TProgressBar
    Left = 188
    Top = 91
    Width = 385
    Height = 16
    BorderWidth = 2
    Min = 0
    Max = 100
    TabOrder = 3
  end
  object Bcopy: TButton
    Left = 186
    Top = 139
    Width = 192
    Height = 18
    BiDiMode = bdRightToLeft
    Caption = ' ÂÌÂ Å‘ Ì»«‰'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = []
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 4
    OnClick = BcopyClick
  end
  object Bexit: TButton
    Left = 378
    Top = 139
    Width = 198
    Height = 18
    BiDiMode = bdRightToLeft
    Cancel = True
    Caption = 'Œ—ÊÃ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = []
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 5
    OnClick = BexitClick
  end
  object CPath: TEdit
    Left = 210
    Top = 56
    Width = 269
    Height = 21
    BiDiMode = bdLeftToRight
    Constraints.MaxHeight = 21
    ParentBiDiMode = False
    TabOrder = 2
    OnExit = BPathExit
    OnKeyPress = NextTab
  end
end
