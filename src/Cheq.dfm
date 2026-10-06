object CheqSerial: TCheqSerial
  Left = 206
  Top = 137
  AutoSize = True
  BiDiMode = bdRightToLeft
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  BorderWidth = 3
  Caption = ' ⁄—Ì› œ” Â çﬂ'
  ClientHeight = 116
  ClientWidth = 252
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
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel2: TBevel
    Left = 0
    Top = 0
    Width = 252
    Height = 85
  end
  object Label1: TLabel
    Left = 202
    Top = 4
    Width = 48
    Height = 18
    Alignment = taCenter
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '”—Ì«· «“'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object Label2: TLabel
    Left = 202
    Top = 31
    Width = 42
    Height = 18
    Alignment = taCenter
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '«·‹‹‹Ì'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object Label3: TLabel
    Left = 202
    Top = 60
    Width = 37
    Height = 18
    Alignment = taCenter
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = 'Ã‹«—Ì'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 0
    Top = 89
    Width = 252
    Height = 27
  end
  object SSerial: TMaskEdit
    Left = 127
    Top = 3
    Width = 69
    Height = 21
    AutoSize = False
    BiDiMode = bdRightToLeft
    EditMask = '999999;1;_'
    MaxLength = 6
    ParentBiDiMode = False
    TabOrder = 0
    Text = '      '
    OnKeyPress = FormKeyPress
  end
  object ESerial: TMaskEdit
    Left = 127
    Top = 30
    Width = 69
    Height = 21
    AutoSize = False
    BiDiMode = bdRightToLeft
    EditMask = '999999'
    MaxLength = 6
    ParentBiDiMode = False
    TabOrder = 1
    Text = '      '
    OnKeyPress = FormKeyPress
  end
  object Bexit: TButton
    Left = 125
    Top = 90
    Width = 126
    Height = 25
    BiDiMode = bdRightToLeft
    Cancel = True
    Caption = 'Œ—ÊÃ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 4
    OnClick = BexitClick
  end
  object Bsave: TButton
    Left = 1
    Top = 90
    Width = 125
    Height = 25
    BiDiMode = bdRightToLeft
    Caption = 'À» '
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 3
    OnClick = BsaveClick
  end
  object FJari: TComboBox
    Left = 10
    Top = 59
    Width = 186
    Height = 21
    BiDiMode = bdRightToLeft
    ItemHeight = 13
    ParentBiDiMode = False
    TabOrder = 2
    OnKeyPress = FormKeyPress
  end
end
