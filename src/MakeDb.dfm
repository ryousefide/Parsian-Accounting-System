object FNewDb: TFNewDb
  Left = 112
  Top = 138
  AutoSize = True
  BiDiMode = bdRightToLeft
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = '„⁄—›Ì ‘—ﬂ  ÃœÌœ'
  ClientHeight = 205
  ClientWidth = 283
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
    Width = 283
    Height = 60
  end
  object Label1: TLabel
    Left = 176
    Top = 8
    Width = 100
    Height = 18
    Hint = '‰«„ ‘—ﬂ  («‰ê·Ì”Ì)'
    Alignment = taCenter
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '‰«„ ‘—ﬂ '
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object Label2: TLabel
    Left = 171
    Top = 36
    Width = 105
    Height = 18
    Hint = '„”Ì— ‰êÂœ«—Ì «ÿ·«⁄«  ‘—ﬂ  («‰ê·Ì”Ì)'
    Alignment = taCenter
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '„”Ì—Å«Ìê«Â œ«œÂ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object Bevel3: TBevel
    Left = 0
    Top = 64
    Width = 283
    Height = 27
  end
  object FNam: TEdit
    Left = 1
    Top = 8
    Width = 169
    Height = 21
    AutoSize = False
    BiDiMode = bdLeftToRight
    ParentBiDiMode = False
    TabOrder = 0
    Text = 'New DataBase Name'
    OnKeyPress = FNamKeyPress
  end
  object FPath: TEdit
    Left = 1
    Top = 33
    Width = 169
    Height = 21
    AutoSize = False
    BiDiMode = bdLeftToRight
    ParentBiDiMode = False
    TabOrder = 1
    Text = 'New DataBase Path'
    OnKeyPress = FPathKeyPress
  end
  object Bexit: TButton
    Left = 141
    Top = 65
    Width = 141
    Height = 25
    BiDiMode = bdRightToLeft
    Cancel = True
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
  object BMake: TButton
    Left = 1
    Top = 65
    Width = 140
    Height = 25
    BiDiMode = bdRightToLeft
    Caption = '«ÌÃ«œ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 3
    OnClick = BMakeClick
  end
  object FileListBox1: TFileListBox
    Left = 57
    Top = 95
    Width = 122
    Height = 110
    ItemHeight = 13
    TabOrder = 4
    Visible = False
  end
end
