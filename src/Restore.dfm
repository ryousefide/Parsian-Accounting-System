object FRestore: TFRestore
  Left = 194
  Top = 107
  Hint = 'ÃÂ  »«“Ì«»Ì «ÿ·«⁄«  Å«Ìê«Â œ«Â «“ Å‘ Ì»«‰Â«Ì —Ê“«‰Â'
  AutoSize = True
  BiDiMode = bdRightToLeft
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = '»«“Ì«»Ì «ÿ·«⁄« '
  ClientHeight = 106
  ClientWidth = 251
  Color = clBtnFace
  Font.Charset = ARABIC_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poMainFormCenter
  ShowHint = True
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 1
    Top = 0
    Width = 250
    Height = 42
  end
  object Label1: TLabel
    Left = 172
    Top = 9
    Width = 71
    Height = 18
    Alignment = taCenter
    AutoSize = False
    Caption = '»«“Ì«»Ì «“ —Ê“'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 9
    Top = 10
    Width = 40
    Height = 18
    Alignment = taCenter
    AutoSize = False
    Caption = 'ê–‘ Â'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 0
    Top = 93
    Width = 245
    Height = 13
    AutoSize = False
    BiDiMode = bdLeftToRight
    Caption = '             '
    ParentBiDiMode = False
  end
  object Bevel2: TBevel
    Left = 1
    Top = 47
    Width = 250
    Height = 27
  end
  object FDay: TComboBox
    Left = 61
    Top = 10
    Width = 106
    Height = 21
    ItemHeight = 13
    TabOrder = 0
    Items.Strings = (
      'Ìﬂ‘‰»Â'
      'œÊ‘‰»Â'
      '”Â ‘‰»Â'
      'çÂ«—‘‰»Â'
      'Å‰Ã‘‰»Â'
      'Ã„⁄Â'
      '‘‰»Â')
  end
  object BRestore: TButton
    Left = 2
    Top = 48
    Width = 125
    Height = 25
    Caption = '»«“Ì«»Ì'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 1
    OnClick = BRestoreClick
  end
  object Bexit: TButton
    Left = 127
    Top = 48
    Width = 122
    Height = 25
    Caption = 'Œ—ÊÃ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 2
    OnClick = BexitClick
  end
  object Pb: TProgressBar
    Left = 1
    Top = 75
    Width = 250
    Height = 16
    BorderWidth = 2
    Min = 0
    Max = 100
    TabOrder = 3
  end
end
