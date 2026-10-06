object FFacRem: TFFacRem
  Left = 68
  Top = 121
  HelpContext = 1054
  AutoSize = True
  BiDiMode = bdRightToLeft
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'œ—Ì«›  „«‰œÂ ›«ﬂ Ê— ›—Ê‘'
  ClientHeight = 84
  ClientWidth = 488
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
    Width = 488
    Height = 34
  end
  object Label1: TLabel
    Left = 372
    Top = 8
    Width = 109
    Height = 23
    AutoSize = False
    Caption = '»«»  „«‰œÂ ›«ﬂ Ê— ‘„«—Â '
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 250
    Top = 7
    Width = 32
    Height = 23
    AutoSize = False
    Caption = '„»·€'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 4
    Top = 9
    Width = 75
    Height = 23
    AutoSize = False
    Caption = 'œ—Ì«›  ê—œÌœ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel2: TBevel
    Left = 0
    Top = 37
    Width = 488
    Height = 27
  end
  object FNo: TEdit
    Left = 287
    Top = 7
    Width = 80
    Height = 21
    Constraints.MaxHeight = 26
    TabOrder = 0
    OnExit = FNoExit
    OnKeyPress = FNoKeyPress
  end
  object FPrice: TEdit
    Left = 88
    Top = 8
    Width = 160
    Height = 21
    Constraints.MaxHeight = 26
    TabOrder = 1
    OnExit = FPriceExit
    OnKeyDown = FPriceKeyDown
    OnKeyPress = FNoKeyPress
  end
  object Sb1: TStatusBar
    Left = 0
    Top = 65
    Width = 488
    Height = 19
    Hint = '‰«„ ‘Œ’-‰«„ Õ”«»-„«‰œÂ Õ”«»-„«‰œÂ «Ì‰ ›«ﬂ Ê—'
    Align = alNone
    Panels = <
      item
        BiDiMode = bdRightToLeftNoAlign
        ParentBiDiMode = False
        Width = 100
      end
      item
        BiDiMode = bdRightToLeftNoAlign
        ParentBiDiMode = False
        Width = 100
      end
      item
        Width = 150
      end
      item
        Width = 80
      end>
    ParentFont = True
    ParentShowHint = False
    ShowHint = True
    SimplePanel = False
    UseSystemFont = False
  end
  object Bsave: TButton
    Left = 1
    Top = 38
    Width = 144
    Height = 25
    Caption = 'À» '
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 3
    OnClick = BsaveClick
  end
  object Bexit: TButton
    Left = 343
    Top = 38
    Width = 144
    Height = 25
    Cancel = True
    Caption = 'Œ—ÊÃ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 4
    OnClick = BexitClick
  end
  object cbPrint: TCheckBox
    Left = 195
    Top = 43
    Width = 97
    Height = 17
    TabStop = False
    BiDiMode = bdRightToLeft
    Caption = 'ç«Å ﬁ»÷'
    ParentBiDiMode = False
    TabOrder = 5
  end
end
