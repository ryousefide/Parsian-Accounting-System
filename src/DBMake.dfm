object FDBMake: TFDBMake
  Left = 188
  Top = 110
  AutoSize = True
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  BorderWidth = 5
  Caption = 'Å«Ìê«Â œ«œÂ'
  ClientHeight = 268
  ClientWidth = 295
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 275
    Top = 173
    Width = 12
    Height = 18
    Hint = '‰«„ „‰»⁄ œ«œÂ «Ì ﬂÂ ÃÂ  –ŒÌ—Â «ÿ·«⁄«  Ê«Õœ „—»ÊÿÂ «” ›«œÂ „Ì‘Êœ'
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '‰«„'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object Label2: TLabel
    Left = 266
    Top = 201
    Width = 21
    Height = 18
    Hint = '„”Ì— Ÿ»ÿ «ÿ·«⁄«  »— —ÊÌ œÌ”ﬂ ”Œ '
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '„”Ì—'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 134
    Top = 163
    Width = 161
    Height = 64
  end
  object Bevel2: TBevel
    Left = 134
    Top = 230
    Width = 161
    Height = 38
  end
  object FDBNam: TEdit
    Left = 141
    Top = 172
    Width = 121
    Height = 21
    AutoSize = False
    ParentColor = True
    TabOrder = 0
    OnKeyPress = FDBNamKeyPress
  end
  object FDBPath: TEdit
    Left = 140
    Top = 198
    Width = 121
    Height = 21
    AutoSize = False
    ParentColor = True
    TabOrder = 1
    OnChange = FDBPathChange
    OnKeyPress = FDBPathKeyPress
  end
  object Bexit: TButton
    Left = 217
    Top = 236
    Width = 75
    Height = 25
    BiDiMode = bdRightToLeft
    Caption = 'Œ—ÊÃ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 2
    OnClick = BexitClick
  end
  object Bmake: TButton
    Left = 137
    Top = 236
    Width = 75
    Height = 25
    BiDiMode = bdRightToLeft
    Caption = '«ÌÃ«œ'
    Enabled = False
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 3
    OnClick = BmakeClick
  end
  object FileListBox1: TFileListBox
    Left = 0
    Top = 0
    Width = 122
    Height = 268
    ItemHeight = 13
    TabOrder = 4
    Visible = False
  end
  object Kbl: TKeyboardLanguage
    Language = ksEnglish
    Left = 4
    Top = 65533
  end
end
