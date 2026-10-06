object FReBill: TFReBill
  Left = 319
  Top = 230
  HelpContext = 1047
  AutoSize = True
  BiDiMode = bdRightToLeft
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  BorderWidth = 3
  Caption = '»«“”«“Ì «”‰«œ'
  ClientHeight = 242
  ClientWidth = 697
  Color = clBtnFace
  Font.Charset = ARABIC_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
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
    Width = 298
    Height = 209
  end
  object Label2: TLabel
    Left = 244
    Top = 6
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
    Left = 98
    Top = 6
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
    Left = 244
    Top = 55
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
    Left = 98
    Top = 55
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
  object Bevel2: TBevel
    Left = 0
    Top = 214
    Width = 300
    Height = 27
  end
  object Teep: TRadioGroup
    Left = 300
    Top = 0
    Width = 397
    Height = 242
    BiDiMode = bdRightToLeft
    Columns = 2
    Items.Strings = (
      '›«ﬂ Ê— Œ—Ìœ'
      '›«ﬂ Ê— ›—Ê‘'
      '›«ﬂ Ê— „—ÃÊ⁄Ì ›—Ê‘'
      '›«ﬂ Ê— „—ÃÊ⁄Ì Œ—Ìœ'
      'ﬁ»÷ œ—Ì«› '
      'ﬁ»÷ Å—œ«Œ '
      '›Ì‘ Ê«—Ì“ ‰ﬁœÌ'
      '»—œ«‘  ‰ﬁœÌ «“ »«‰ò'
      '«”‰«œ œ—Ì«› ‰Ì'
      'Ê«ê–«—Ì «”‰«œ œ—Ì«› ‰Ì'
      '«”‰«œ œ— Ã—Ì«‰ Ê’Ê·-«—”«· »Â ò·—'
      '«”‰«œ œ— Ã—Ì«‰ Ê’Ê·-⁄Êœ  «“ ò·—'
      '«”‰«œ œ— Ã—Ì«‰ Ê’Ê·-«⁄·«„ Ê’Ê·Ì'
      '«”‰«œ œ— Ã—Ì«‰ Ê’Ê·-«⁄·«„ »—ê‘ Ì'
      '’œÊ— «”‰«œ Å—œ«Œ ‰Ì'
      'Å«” çò'
      'ò«—„“œ»«‰òÌ'
      '—„Ì «‰” ’—«›Ì'
      '—”Ìœ  »œÌ· «—“Ì'
      '’Ê—   ‰ŒÊ«Â'
      'ÕÊ«·Â «‰»«—'
      '—”Ìœ «‰»«—'
      '»—ê‘  »Â «‰»«—'
      '»—ê‘  «“ «‰»«—')
    ParentBiDiMode = False
    TabOrder = 0
  end
  object FNo1: TEdit
    Left = 173
    Top = 5
    Width = 63
    Height = 21
    BiDiMode = bdRightToLeftNoAlign
    Constraints.MaxHeight = 21
    ParentBiDiMode = False
    TabOrder = 1
    OnKeyPress = FNo1KeyPress
  end
  object FNo2: TEdit
    Left = 23
    Top = 6
    Width = 63
    Height = 21
    BiDiMode = bdRightToLeftNoAlign
    Constraints.MaxHeight = 21
    ParentBiDiMode = False
    TabOrder = 2
    OnKeyPress = FNo1KeyPress
  end
  object FDat1: TMaskEdit
    Left = 173
    Top = 53
    Width = 63
    Height = 21
    AutoSize = False
    BiDiMode = bdRightToLeft
    Constraints.MaxHeight = 21
    EditMask = '1300/00/00;1;_'
    MaxLength = 10
    ParentBiDiMode = False
    TabOrder = 3
    Text = '13  /  /  '
    OnEnter = FDat1Enter
    OnExit = FDat1Exit
    OnKeyPress = FormKeyPress
  end
  object FDat2: TMaskEdit
    Left = 23
    Top = 51
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
    OnEnter = FDat2Enter
    OnExit = FDat2Exit
    OnKeyPress = FormKeyPress
  end
  object Bshow: TButton
    Left = 1
    Top = 215
    Width = 100
    Height = 25
    BiDiMode = bdRightToLeft
    Caption = '&»«“”«“Ì ”‰œ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 5
    OnClick = BshowClick
  end
  object Bexit: TButton
    Left = 201
    Top = 215
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
    TabOrder = 6
    OnClick = BexitClick
  end
end
