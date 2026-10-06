object FFgoz: TFFgoz
  Left = 319
  Top = 123
  AutoSize = True
  BiDiMode = bdRightToLeft
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  BorderWidth = 3
  Caption = 'ÅÌêÌ—Ì ›«ﬂ Ê—Â«'
  ClientHeight = 265
  ClientWidth = 300
  Color = clBtnFace
  Font.Charset = ARABIC_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  HelpFile = 'ParFro'
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 300
    Height = 234
  end
  object Label2: TLabel
    Left = 237
    Top = 126
    Width = 62
    Height = 19
    Alignment = taRightJustify
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '«“‘„«—Â'
    Constraints.MaxHeight = 21
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    Transparent = True
  end
  object Label3: TLabel
    Left = 91
    Top = 126
    Width = 53
    Height = 19
    Alignment = taRightJustify
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = ' « ‘„«—Â'
    Constraints.MaxHeight = 21
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    Transparent = True
  end
  object Label4: TLabel
    Left = 237
    Top = 155
    Width = 62
    Height = 19
    Alignment = taRightJustify
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '«“ «—ÌŒ'
    Constraints.MaxHeight = 21
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    Transparent = True
  end
  object Label5: TLabel
    Left = 91
    Top = 155
    Width = 53
    Height = 19
    Alignment = taRightJustify
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = ' « «—ÌŒ'
    Constraints.MaxHeight = 21
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    Transparent = True
  end
  object Label7: TLabel
    Left = 237
    Top = 212
    Width = 62
    Height = 19
    Alignment = taRightJustify
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = 'Õ”«»'
    Constraints.MaxHeight = 21
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    Transparent = True
  end
  object Bevel2: TBevel
    Left = 0
    Top = 238
    Width = 300
    Height = 27
  end
  object Label1: TLabel
    Left = 237
    Top = 185
    Width = 62
    Height = 19
    Alignment = taRightJustify
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '»«·«Ì „»·€'
    Constraints.MaxHeight = 21
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    Transparent = True
  end
  object Teep: TRadioGroup
    Left = 1
    Top = 1
    Width = 298
    Height = 84
    BiDiMode = bdRightToLeft
    Columns = 2
    ItemIndex = 1
    Items.Strings = (
      '›«ﬂ Ê— Œ—Ìœ'
      '›«ﬂ Ê— ›—Ê‘'
      'ÅÌ‘ ›«ﬂ Ê— ›—Ê‘'
      '›«ﬂ Ê— „—ÃÊ⁄Ì ›—Ê‘'
      '›«ﬂ Ê— „—ÃÊ⁄Ì Œ—Ìœ')
    ParentBiDiMode = False
    TabOrder = 0
    OnClick = TeepClick
  end
  object FNo1: TEdit
    Left = 166
    Top = 125
    Width = 63
    Height = 21
    BiDiMode = bdRightToLeftNoAlign
    Constraints.MaxHeight = 21
    ParentBiDiMode = False
    TabOrder = 2
    OnExit = FNo1Exit
    OnKeyPress = FormKeyPress
  end
  object FNo2: TEdit
    Left = 16
    Top = 126
    Width = 63
    Height = 21
    BiDiMode = bdRightToLeftNoAlign
    Constraints.MaxHeight = 21
    ParentBiDiMode = False
    TabOrder = 3
    OnExit = FNo2Exit
    OnKeyPress = FormKeyPress
  end
  object FDat1: TMaskEdit
    Left = 166
    Top = 153
    Width = 63
    Height = 21
    AutoSize = False
    BiDiMode = bdRightToLeft
    Constraints.MaxHeight = 21
    EditMask = '1300/00/00;1;_'
    MaxLength = 10
    ParentBiDiMode = False
    TabOrder = 4
    Text = '13  /  /  '
    OnEnter = FDat1Enter
    OnExit = FDat1Exit
    OnKeyPress = FormKeyPress
  end
  object FDat2: TMaskEdit
    Left = 16
    Top = 151
    Width = 63
    Height = 21
    AutoSize = False
    BiDiMode = bdRightToLeft
    Constraints.MaxHeight = 21
    EditMask = '1300/00/00;1;_'
    MaxLength = 10
    ParentBiDiMode = False
    TabOrder = 5
    Text = '13  /  /  '
    OnEnter = FDat2Enter
    OnExit = FDat2Exit
    OnKeyPress = FormKeyPress
  end
  object Bshow: TButton
    Left = 1
    Top = 239
    Width = 100
    Height = 25
    BiDiMode = bdRightToLeft
    Caption = '&‰„«Ì‘'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 8
    OnClick = BshowClick
  end
  object Bexit: TButton
    Left = 201
    Top = 239
    Width = 98
    Height = 25
    BiDiMode = bdRightToLeft
    Cancel = True
    Caption = 'Œ—ÊÃ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 10
    OnClick = BexitClick
  end
  object FNam: TComboBox
    Left = 16
    Top = 209
    Width = 214
    Height = 21
    BiDiMode = bdRightToLeft
    ItemHeight = 13
    ParentBiDiMode = False
    Sorted = True
    TabOrder = 7
    OnKeyDown = FNamKeyDown
    OnKeyPress = FormKeyPress
  end
  object BList: TButton
    Left = 101
    Top = 239
    Width = 100
    Height = 25
    BiDiMode = bdRightToLeft
    Caption = '&·Ì” '
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 9
    OnClick = BListClick
  end
  object FPnet: TEdit
    Left = 16
    Top = 183
    Width = 213
    Height = 21
    BiDiMode = bdRightToLeftNoAlign
    Constraints.MaxHeight = 21
    ParentBiDiMode = False
    TabOrder = 6
    OnKeyPress = FormKeyPress
  end
  object Perm: TRadioGroup
    Left = 1
    Top = 78
    Width = 299
    Height = 39
    BiDiMode = bdRightToLeft
    Caption = '›«ﬂ Ê—Â«Ì'
    Columns = 3
    ItemIndex = 2
    Items.Strings = (
      '»” Â'
      '»«“'
      'Â—œÊ')
    ParentBiDiMode = False
    TabOrder = 1
  end
end
