object FJaPrint: TFJaPrint
  Left = 211
  Top = 155
  AutoSize = True
  BiDiMode = bdRightToLeft
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsNone
  Caption = 'ç«Å Õ”«» Ã«—Ì »«‰ﬂ'
  ClientHeight = 58
  ClientWidth = 313
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
  object Label1: TLabel
    Left = 252
    Top = 6
    Width = 61
    Height = 18
    Alignment = taCenter
    AutoSize = False
    Caption = '«“  «—ÌŒ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 99
    Top = 6
    Width = 61
    Height = 18
    Alignment = taCenter
    AutoSize = False
    Caption = ' «  «—ÌŒ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 310
    Height = 31
  end
  object SDat: TMaskEdit
    Left = 167
    Top = 5
    Width = 75
    Height = 21
    AutoSize = False
    BiDiMode = bdRightToLeft
    EditMask = '1300/00/00;1;_'
    MaxLength = 10
    ParentBiDiMode = False
    TabOrder = 0
    Text = '13  /  /  '
    OnEnter = SDatEnter
    OnExit = SDatExit
    OnKeyPress = SDatKeyPress
  end
  object EDat: TMaskEdit
    Left = 18
    Top = 5
    Width = 75
    Height = 21
    AutoSize = False
    BiDiMode = bdRightToLeft
    EditMask = '1300/00/00;1;_'
    MaxLength = 10
    ParentBiDiMode = False
    TabOrder = 1
    Text = '13  /  /  '
    OnEnter = EDatEnter
    OnExit = EDatExit
    OnKeyPress = EDatKeyPress
  end
  object Bprint: TButton
    Left = 118
    Top = 33
    Width = 75
    Height = 25
    Caption = 'ç«Å'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 2
    OnClick = BprintClick
  end
end
