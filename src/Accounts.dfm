object FAcount: TFAcount
  Left = 379
  Top = 217
  AutoSize = True
  BiDiMode = bdRightToLeft
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  BorderWidth = 3
  Caption = '„⁄—›Ì Õ”«» '
  ClientHeight = 361
  ClientWidth = 366
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
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 366
    Height = 361
  end
  object Label1: TLabel
    Left = 282
    Top = 14
    Width = 63
    Height = 19
    AutoSize = False
    BiDiMode = bdLeftToRight
    Caption = '‰«„ Õ”«»'
    ParentBiDiMode = False
    ParentShowHint = False
    ShowHint = True
  end
  object Label3: TLabel
    Left = 282
    Top = 93
    Width = 63
    Height = 19
    AutoSize = False
    BiDiMode = bdLeftToRight
    Caption = 'ê—ÊÂ Õ”«»'
    ParentBiDiMode = False
    ParentShowHint = False
    ShowHint = True
  end
  object Label4: TLabel
    Left = 282
    Top = 260
    Width = 63
    Height = 19
    AutoSize = False
    BiDiMode = bdLeftToRight
    Caption = ' ·›‰'
    ParentBiDiMode = False
    ParentShowHint = False
    ShowHint = True
  end
  object Label6: TLabel
    Left = 282
    Top = 235
    Width = 63
    Height = 19
    AutoSize = False
    BiDiMode = bdLeftToRight
    Caption = '¬œ—”'
    ParentBiDiMode = False
    ParentShowHint = False
    ShowHint = True
  end
  object Label7: TLabel
    Left = 281
    Top = 65
    Width = 83
    Height = 19
    AutoSize = False
    BiDiMode = bdLeftToRight
    Caption = '‘—Õ «‰ê·Ì”Ì'
    ParentBiDiMode = False
    ParentShowHint = False
    ShowHint = True
  end
  object Label8: TLabel
    Left = 282
    Top = 297
    Width = 63
    Height = 19
    AutoSize = False
    BiDiMode = bdLeftToRight
    Caption = '«⁄ »«— —Ì«·Ì'
    ParentBiDiMode = False
    ParentShowHint = False
    ShowHint = True
  end
  object Label2: TLabel
    Left = 280
    Top = 151
    Width = 63
    Height = 19
    AutoSize = False
    BiDiMode = bdLeftToRight
    Caption = '«” «‰'
    ParentBiDiMode = False
    ParentShowHint = False
    ShowHint = True
  end
  object Label5: TLabel
    Left = 280
    Top = 179
    Width = 63
    Height = 19
    AutoSize = False
    BiDiMode = bdLeftToRight
    Caption = '‘Â—” «‰'
    ParentBiDiMode = False
    ParentShowHint = False
    ShowHint = True
  end
  object Label9: TLabel
    Left = 280
    Top = 208
    Width = 63
    Height = 19
    AutoSize = False
    BiDiMode = bdLeftToRight
    Caption = '„‰ÿﬁÂ'
    ParentBiDiMode = False
    ParentShowHint = False
    ShowHint = True
  end
  object LPath: TLabel
    Left = 6
    Top = 120
    Width = 273
    Height = 26
    AutoSize = False
    BiDiMode = bdLeftToRight
    ParentBiDiMode = False
    ParentShowHint = False
    ShowHint = True
  end
  object cbRoot: TAcComboBox
    Left = 84
    Top = 93
    Width = 193
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    Sorted = True
    TabOrder = 2
    OnChange = cbRootChange
    OnKeyPress = NextTab
  end
  object FNam: TEdit
    Left = 84
    Top = 13
    Width = 193
    Height = 21
    MaxLength = 45
    TabOrder = 0
    OnKeyPress = NextTab
  end
  object FAdd: TEdit
    Left = 8
    Top = 234
    Width = 269
    Height = 21
    MaxLength = 200
    TabOrder = 6
    OnKeyPress = NextTab
  end
  object FTel: TEdit
    Left = 84
    Top = 260
    Width = 193
    Height = 21
    MaxLength = 20
    TabOrder = 7
    OnKeyPress = NextTab
  end
  object Fename: TEdit
    Left = 86
    Top = 65
    Width = 191
    Height = 21
    MaxLength = 45
    TabOrder = 1
    OnKeyPress = NextTab
  end
  object F: TEdit
    Left = 84
    Top = 296
    Width = 193
    Height = 21
    MaxLength = 45
    TabOrder = 8
    OnKeyPress = NextTab
  end
  object Bmake: TButton
    Left = 125
    Top = 327
    Width = 113
    Height = 25
    Caption = '«ÌÃ«œ Õ”«»'
    TabOrder = 9
    OnClick = BmakeClick
  end
  object cbState: TComboBox
    Left = 84
    Top = 151
    Width = 193
    Height = 21
    ItemHeight = 13
    Sorted = True
    TabOrder = 3
    OnKeyPress = NextTab
  end
  object cbCity: TComboBox
    Left = 84
    Top = 179
    Width = 193
    Height = 21
    ItemHeight = 13
    Sorted = True
    TabOrder = 4
    OnKeyPress = NextTab
  end
  object cbRegon: TComboBox
    Left = 84
    Top = 207
    Width = 193
    Height = 21
    ItemHeight = 13
    Sorted = True
    TabOrder = 5
    OnKeyPress = NextTab
  end
  object cbFdp: TCheckBox
    Left = 89
    Top = 41
    Width = 189
    Height = 17
    Caption = 'Õ”«» «—“Ì «” '
    TabOrder = 10
    OnKeyPress = NextTab
  end
end
