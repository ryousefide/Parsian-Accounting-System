object FCredit: TFCredit
  Left = 239
  Top = 102
  ActiveControl = FNam
  AutoSize = True
  BiDiMode = bdRightToLeft
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  BorderWidth = 3
  Caption = ' ’ÕÌÕ  ⁄—Ì› Õ”«»'
  ClientHeight = 323
  ClientWidth = 406
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
    Top = 26
    Width = 406
    Height = 264
  end
  object Label1: TLabel
    Left = 290
    Top = 42
    Width = 70
    Height = 18
    AutoSize = False
    Caption = '‘—Õ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label4: TLabel
    Left = 290
    Top = 251
    Width = 70
    Height = 18
    AutoSize = False
    Caption = '«⁄ »«— —Ì«·Ì'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label5: TLabel
    Left = 290
    Top = 72
    Width = 70
    Height = 18
    Alignment = taCenter
    AutoSize = False
    Caption = '‘—Õ «‰ê·Ì”Ì'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Bevel2: TBevel
    Left = 4
    Top = 296
    Width = 398
    Height = 27
  end
  object Label6: TLabel
    Left = 290
    Top = 103
    Width = 70
    Height = 18
    AutoSize = False
    Caption = '«” «‰'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label7: TLabel
    Left = 290
    Top = 135
    Width = 70
    Height = 18
    AutoSize = False
    Caption = '‘Â—” «‰'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label2: TLabel
    Left = 290
    Top = 218
    Width = 70
    Height = 18
    AutoSize = False
    Caption = ' ·›‰'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label12: TLabel
    Left = 290
    Top = 162
    Width = 70
    Height = 18
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '„‰ÿﬁÂ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    Transparent = True
    Layout = tlCenter
  end
  object Label3: TLabel
    Left = 290
    Top = 192
    Width = 70
    Height = 18
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '¬œ—”'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    Transparent = True
    Layout = tlCenter
  end
  object DBText1: TDBText
    Left = 133
    Top = 41
    Width = 149
    Height = 24
    DataField = 'Nam'
    DataSource = FroDM.AcKodDs
  end
  object FNam: TComboBox
    Left = 122
    Top = 0
    Width = 158
    Height = 21
    BiDiMode = bdRightToLeft
    ItemHeight = 13
    ParentBiDiMode = False
    Sorted = True
    TabOrder = 0
    OnChange = FNamChange
    OnExit = FNamExit
    OnKeyPress = NexTab
  end
  object FTel: TDBEdit
    Left = 132
    Top = 217
    Width = 151
    Height = 21
    BiDiMode = bdRightToLeftNoAlign
    Constraints.MaxHeight = 26
    DataField = 'Tel'
    DataSource = FroDM.AcKodDs
    ParentBiDiMode = False
    TabOrder = 7
    OnKeyPress = NexTab
  end
  object FAdd: TDBEdit
    Left = 11
    Top = 189
    Width = 272
    Height = 21
    Hint = '¬œ—”'
    BiDiMode = bdRightToLeft
    Constraints.MaxHeight = 26
    DataField = 'Adr'
    DataSource = FroDM.AcKodDs
    ParentBiDiMode = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnKeyPress = NexTab
  end
  object FPCred: TDBEdit
    Left = 131
    Top = 249
    Width = 152
    Height = 21
    BiDiMode = bdRightToLeftNoAlign
    Constraints.MaxHeight = 26
    DataField = 'Pcred'
    DataSource = FroDM.AcKodDs
    ParentBiDiMode = False
    TabOrder = 8
    OnKeyPress = NexTab
  end
  object FTCred: TDBEdit
    Left = 134
    Top = 73
    Width = 149
    Height = 21
    BiDiMode = bdRightToLeftNoAlign
    Constraints.MaxHeight = 26
    DataField = 'Ename'
    DataSource = FroDM.AcKodDs
    ParentBiDiMode = False
    TabOrder = 2
    OnKeyPress = NexTab
  end
  object Bsave: TButton
    Left = 5
    Top = 297
    Width = 196
    Height = 25
    Caption = 'À» '
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 9
    OnClick = BsaveClick
  end
  object BExit: TButton
    Left = 201
    Top = 297
    Width = 200
    Height = 25
    Cancel = True
    Caption = 'Œ—ÊÃ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 10
    OnClick = BExitClick
  end
  object cbState: TDBComboBox
    Left = 133
    Top = 102
    Width = 151
    Height = 21
    BiDiMode = bdRightToLeft
    DataField = 'State'
    DataSource = FroDM.AcKodDs
    ItemHeight = 13
    ParentBiDiMode = False
    Sorted = True
    TabOrder = 3
    OnKeyPress = NexTab
  end
  object cbCity: TDBComboBox
    Left = 133
    Top = 132
    Width = 151
    Height = 21
    BiDiMode = bdRightToLeft
    DataField = 'City'
    DataSource = FroDM.AcKodDs
    ItemHeight = 13
    ParentBiDiMode = False
    Sorted = True
    TabOrder = 4
    OnKeyPress = NexTab
  end
  object cbRegon: TDBComboBox
    Left = 186
    Top = 160
    Width = 98
    Height = 21
    BiDiMode = bdRightToLeft
    DataField = 'Regon'
    DataSource = FroDM.AcKodDs
    ItemHeight = 13
    ParentBiDiMode = False
    Sorted = True
    TabOrder = 5
    OnKeyPress = NexTab
  end
  object FName: TDBEdit
    Left = 35
    Top = 49
    Width = 149
    Height = 21
    TabStop = False
    BiDiMode = bdRightToLeftNoAlign
    Constraints.MaxHeight = 26
    DataField = 'Nam'
    DataSource = FroDM.AcKodDs
    Enabled = False
    ParentBiDiMode = False
    ReadOnly = True
    TabOrder = 1
    Visible = False
    OnKeyPress = NexTab
  end
end
