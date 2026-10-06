object FJariDel: TFJariDel
  Left = 152
  Top = 145
  Width = 188
  Height = 94
  AutoSize = True
  BiDiMode = bdRightToLeft
  BorderIcons = [biSystemMenu, biMinimize]
  BorderWidth = 5
  Caption = 'ÍÐÝ ÌÇÑí'
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
  object Label4: TLabel
    Left = 109
    Top = 0
    Width = 43
    Height = 17
    Alignment = taCenter
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = 'ÌÇÑí '
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    Transparent = True
  end
  object FJari: TComboBox
    Left = 10
    Top = 0
    Width = 92
    Height = 21
    ItemHeight = 13
    TabOrder = 0
    OnKeyPress = FJariKeyPress
  end
  object Bdel: TButton
    Left = 0
    Top = 32
    Width = 75
    Height = 25
    Caption = 'ÍÐÝ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 1
    OnClick = BdelClick
  end
  object Bexit: TButton
    Left = 95
    Top = 32
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'ÎÑæÌ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 2
    OnClick = BexitClick
  end
end
