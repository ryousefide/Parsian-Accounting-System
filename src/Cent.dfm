object FCent: TFCent
  Left = 401
  Top = 68
  HelpContext = 150
  ActiveControl = FNam
  AutoSize = True
  BiDiMode = bdRightToLeft
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  BorderWidth = 5
  Caption = 'À»  „—«ò“ Ê «‘Œ«’'
  ClientHeight = 416
  ClientWidth = 411
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poDefault
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 2
    Top = 0
    Width = 409
    Height = 364
  end
  object Label1: TLabel
    Left = 290
    Top = 124
    Width = 94
    Height = 19
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'ê—ÊÂ'
    FocusControl = FGro
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object Label2: TLabel
    Left = 292
    Top = 16
    Width = 94
    Height = 19
    Alignment = taRightJustify
    AutoSize = False
    Caption = '‘—Õ'
    FocusControl = FNam
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object Label8: TLabel
    Left = 290
    Top = 99
    Width = 94
    Height = 19
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'ﬂœ  Õ”«»œ«—Ì'
    FocusControl = FKod
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object Label4: TLabel
    Left = 290
    Top = 259
    Width = 94
    Height = 19
    AutoSize = False
    Caption = ' ·›‰'
    FocusControl = FTel
    ParentShowHint = False
    ShowHint = True
  end
  object Label6: TLabel
    Left = 290
    Top = 232
    Width = 94
    Height = 19
    AutoSize = False
    Caption = '¬œ—”'
    FocusControl = FAdd
    ParentShowHint = False
    ShowHint = True
  end
  object Label7: TLabel
    Left = 290
    Top = 289
    Width = 94
    Height = 19
    AutoSize = False
    Caption = '«⁄ »«— “„«‰Ì'
    FocusControl = FPerc
    ParentShowHint = False
    ShowHint = True
  end
  object Label5: TLabel
    Left = 290
    Top = 316
    Width = 94
    Height = 19
    AutoSize = False
    Caption = '«⁄ »«— —Ì«·Ì'
    FocusControl = F
    ParentShowHint = False
    ShowHint = True
  end
  object Label9: TLabel
    Left = 290
    Top = 151
    Width = 94
    Height = 19
    AutoSize = False
    Caption = '«” «‰'
    FocusControl = cbState
    ParentShowHint = False
    ShowHint = True
  end
  object Label10: TLabel
    Left = 290
    Top = 178
    Width = 94
    Height = 19
    AutoSize = False
    Caption = '‘Â—” «‰'
    FocusControl = cbCity
    ParentShowHint = False
    ShowHint = True
  end
  object Label11: TLabel
    Left = 290
    Top = 206
    Width = 94
    Height = 19
    AutoSize = False
    Caption = '„‰ÿﬁÂ'
    FocusControl = cbRegon
    ParentShowHint = False
    ShowHint = True
  end
  object Label3: TLabel
    Left = 290
    Top = 44
    Width = 94
    Height = 19
    Alignment = taRightJustify
    AutoSize = False
    Caption = '‘—Õ «‰ê·Ì”Ì'
    FocusControl = FEnam
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object Label12: TLabel
    Left = 290
    Top = 71
    Width = 94
    Height = 19
    Alignment = taRightJustify
    AutoSize = False
    Caption = '⁄·«„  «Œ ’«—Ì'
    FocusControl = FShM
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object Bevel2: TBevel
    Left = 0
    Top = 389
    Width = 411
    Height = 27
  end
  object Label13: TLabel
    Left = 100
    Top = 73
    Width = 53
    Height = 18
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'ﬂœ '
    FocusControl = FId
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object FNam: TEdit
    Left = 17
    Top = 15
    Width = 269
    Height = 21
    HelpContext = 151
    AutoSize = False
    MaxLength = 45
    TabOrder = 0
    OnKeyPress = NextTab
  end
  object FGro: TComboBox
    Left = 93
    Top = 123
    Width = 193
    Height = 21
    HelpContext = 155
    ItemHeight = 13
    MaxLength = 45
    TabOrder = 5
    OnKeyPress = NextTab
  end
  object FKod: TEdit
    Left = 211
    Top = 97
    Width = 75
    Height = 21
    HelpContext = 154
    AutoSize = False
    ReadOnly = True
    TabOrder = 4
    OnEnter = FKodEnter
    OnKeyPress = FKodKeyPress
  end
  object Bsave: TButton
    Left = 49
    Top = 392
    Width = 100
    Height = 23
    HelpContext = 50
    BiDiMode = bdRightToLeft
    Caption = '&À» '
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 13
    OnClick = BsaveClick
  end
  object Bexit: TButton
    Left = 249
    Top = 392
    Width = 100
    Height = 23
    HelpContext = 54
    BiDiMode = bdRightToLeft
    Cancel = True
    Caption = '&Œ—ÊÃ'
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
  object FAdd: TEdit
    Left = 19
    Top = 233
    Width = 267
    Height = 21
    HelpContext = 159
    MaxLength = 200
    TabOrder = 9
    OnKeyPress = NextTab
  end
  object FTel: TEdit
    Left = 93
    Top = 260
    Width = 193
    Height = 21
    HelpContext = 160
    MaxLength = 20
    TabOrder = 10
    OnKeyPress = NextTab
  end
  object FPerc: TEdit
    Left = 235
    Top = 288
    Width = 51
    Height = 21
    HelpContext = 161
    MaxLength = 45
    TabOrder = 11
    OnKeyPress = NextTab
  end
  object F: TEdit
    Left = 93
    Top = 315
    Width = 193
    Height = 21
    HelpContext = 162
    MaxLength = 45
    TabOrder = 12
    OnKeyPress = NextTab
  end
  object cbState: TComboBox
    Left = 93
    Top = 150
    Width = 193
    Height = 21
    HelpContext = 156
    ItemHeight = 13
    Sorted = True
    TabOrder = 6
    OnKeyPress = NextTab
  end
  object cbCity: TComboBox
    Left = 93
    Top = 178
    Width = 193
    Height = 21
    HelpContext = 157
    ItemHeight = 13
    Sorted = True
    TabOrder = 7
    OnKeyPress = NextTab
  end
  object cbRegon: TComboBox
    Left = 93
    Top = 205
    Width = 193
    Height = 21
    HelpContext = 158
    ItemHeight = 13
    Sorted = True
    TabOrder = 8
    OnKeyPress = NextTab
  end
  object FEnam: TEdit
    Left = 18
    Top = 43
    Width = 268
    Height = 21
    HelpContext = 152
    AutoSize = False
    MaxLength = 45
    TabOrder = 1
    OnKeyPress = NextTab
  end
  object FShM: TEdit
    Left = 212
    Top = 70
    Width = 74
    Height = 21
    HelpContext = 153
    AutoSize = False
    MaxLength = 45
    TabOrder = 2
    OnKeyPress = NextTab
  end
  object FId: TEdit
    Left = 21
    Top = 71
    Width = 75
    Height = 21
    HelpContext = 164
    AutoSize = False
    TabOrder = 3
    OnEnter = FIdEnter
    OnExit = FIdExit
    OnKeyPress = FKodKeyPress
  end
end
