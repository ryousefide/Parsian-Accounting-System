object FAccMove: TFAccMove
  Left = 310
  Top = 162
  AutoSize = True
  BiDiMode = bdRightToLeft
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = '«‰ ﬁ«· ”«»ﬁÂ Õ”«»'
  ClientHeight = 235
  ClientWidth = 334
  Color = clBtnFace
  Font.Charset = ARABIC_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
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
    Width = 333
    Height = 72
  end
  object Label1: TLabel
    Left = 254
    Top = 8
    Width = 78
    Height = 20
    Alignment = taCenter
    AutoSize = False
    Caption = '”Ê«»ﬁ Õ”«» '
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 254
    Top = 46
    Width = 78
    Height = 20
    Alignment = taCenter
    AutoSize = False
    Caption = '„‰ ﬁ· ‘Êœ »Â '
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object FirstAc: TComboBox
    Left = 11
    Top = 7
    Width = 236
    Height = 21
    ItemHeight = 13
    Sorted = True
    TabOrder = 0
    OnKeyDown = FirstAcKeyDown
    OnKeyPress = FirstAcKeyPress
  end
  object NextAc: TComboBox
    Left = 11
    Top = 44
    Width = 236
    Height = 21
    ItemHeight = 13
    ParentColor = True
    Sorted = True
    TabOrder = 1
    OnKeyDown = FirstAcKeyDown
    OnKeyPress = NextAcKeyPress
  end
  object Panel1: TPanel
    Left = 0
    Top = 202
    Width = 334
    Height = 33
    AutoSize = True
    BevelInner = bvLowered
    BorderWidth = 2
    TabOrder = 2
    object BDo: TButton
      Left = 4
      Top = 4
      Width = 139
      Height = 25
      Caption = '&«‰ ﬁ«· ”«»ﬁÂ'
      Enabled = False
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Mitra'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      TabOrder = 0
      OnClick = BDoClick
    end
    object Bexit: TButton
      Left = 144
      Top = 4
      Width = 186
      Height = 25
      Cancel = True
      Caption = 'Œ—ÊÃ'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Mitra'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      TabOrder = 1
      OnClick = BexitClick
    end
  end
  object Memo1: TMemo
    Left = 2
    Top = 76
    Width = 331
    Height = 101
    Lines.Strings = (
      '»œÌ‰Ê”Ì·Â ò·ÌÂ ”Ê«»ﬁ Õ”«» «‰ Œ«» ‘œÂ «Ê· »Â Õ”«» œÊ„ „‰ ﬁ· '
      'ŒÊ«Âœ ‘œ.'
      '                              «Œÿ«— „Â„        '
      'Å” «“ «‰ ﬁ«· «„ò«‰ »—ê‘  ⁄„·Ì«  ‰ŒÊ«Âœ »Êœ')
    TabOrder = 3
  end
  object cb1: TCheckBox
    Left = 10
    Top = 180
    Width = 119
    Height = 17
    Caption = '›Â„Ìœ„'
    TabOrder = 4
    OnClick = cb1Click
  end
end
