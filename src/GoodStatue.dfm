object FGStatue: TFGStatue
  Left = 69
  Top = 69
  AutoSize = True
  BiDiMode = bdRightToLeft
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = '«” ⁄·«„ ﬂ«·«'
  ClientHeight = 220
  ClientWidth = 514
  Color = clBtnFace
  Font.Charset = ARABIC_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poDefaultSizeOnly
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel6: TBevel
    Left = 0
    Top = 0
    Width = 306
    Height = 220
  end
  object Bexit: TButton
    Left = 214
    Top = 190
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Œ—ÊÃ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 3
    OnClick = BexitClick
  end
  object PG: TPageControl
    Left = 11
    Top = 5
    Width = 283
    Height = 182
    ActivePage = BuyTab
    TabOrder = 2
    object BuyTab: TTabSheet
      Caption = 'Œ—Ì‹‹œ'
      object Bevel1: TBevel
        Left = 8
        Top = 24
        Width = 202
        Height = 97
        Shape = bsFrame
        Style = bsRaised
      end
      object Label17: TLabel
        Left = 17
        Top = 1
        Width = 52
        Height = 20
        Alignment = taCenter
        AutoSize = False
        Caption = '„ﬁœ«—'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label18: TLabel
        Left = 115
        Top = 3
        Width = 52
        Height = 19
        Alignment = taCenter
        AutoSize = False
        Caption = 'ﬁÌ„ '
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label19: TLabel
        Left = 221
        Top = 29
        Width = 52
        Height = 22
        Alignment = taCenter
        AutoSize = False
        Caption = '»«·« —Ì‰'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label20: TLabel
        Left = 220
        Top = 56
        Width = 53
        Height = 22
        Alignment = taCenter
        AutoSize = False
        Caption = 'Å«∆Ì‰  —Ì‰'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label21: TLabel
        Left = 218
        Top = 87
        Width = 52
        Height = 22
        Alignment = taCenter
        AutoSize = False
        Caption = '„Ì«‰êÌ‰'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object MaxBp: TEdit
        Left = 83
        Top = 29
        Width = 121
        Height = 21
        TabStop = False
        AutoSize = False
        Constraints.MaxHeight = 26
        ReadOnly = True
        TabOrder = 0
      end
      object MaxBq: TEdit
        Left = 14
        Top = 29
        Width = 57
        Height = 21
        TabStop = False
        AutoSize = False
        Constraints.MaxHeight = 26
        ReadOnly = True
        TabOrder = 1
      end
      object MinBp: TEdit
        Left = 83
        Top = 55
        Width = 121
        Height = 21
        TabStop = False
        AutoSize = False
        Constraints.MaxHeight = 26
        ReadOnly = True
        TabOrder = 2
      end
      object MinBq: TEdit
        Left = 14
        Top = 55
        Width = 57
        Height = 21
        TabStop = False
        AutoSize = False
        Constraints.MaxHeight = 26
        ReadOnly = True
        TabOrder = 3
      end
      object AvBp: TEdit
        Left = 83
        Top = 87
        Width = 121
        Height = 21
        TabStop = False
        AutoSize = False
        Constraints.MaxHeight = 26
        ReadOnly = True
        TabOrder = 4
      end
    end
    object FroTab: TTabSheet
      Caption = '›‹‹—Ê‘'
      ImageIndex = 1
      object Bevel2: TBevel
        Left = 8
        Top = 24
        Width = 202
        Height = 97
        Shape = bsFrame
        Style = bsRaised
      end
      object Label3: TLabel
        Left = 17
        Top = 1
        Width = 52
        Height = 20
        Alignment = taCenter
        AutoSize = False
        Caption = '„ﬁœ«—'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 115
        Top = 3
        Width = 52
        Height = 19
        Alignment = taCenter
        AutoSize = False
        Caption = 'ﬁÌ„ '
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 221
        Top = 29
        Width = 52
        Height = 22
        Alignment = taCenter
        AutoSize = False
        Caption = '»«·« —Ì‰'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label12: TLabel
        Left = 220
        Top = 56
        Width = 53
        Height = 22
        Alignment = taCenter
        AutoSize = False
        Caption = 'Å«∆Ì‰  —Ì‰'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label13: TLabel
        Left = 218
        Top = 87
        Width = 52
        Height = 22
        Alignment = taCenter
        AutoSize = False
        Caption = '„Ì«‰êÌ‰'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object MaxSp: TEdit
        Left = 83
        Top = 29
        Width = 121
        Height = 21
        TabStop = False
        AutoSize = False
        Constraints.MaxHeight = 26
        ReadOnly = True
        TabOrder = 0
      end
      object MaxSq: TEdit
        Left = 14
        Top = 29
        Width = 57
        Height = 21
        TabStop = False
        AutoSize = False
        Constraints.MaxHeight = 26
        ReadOnly = True
        TabOrder = 1
      end
      object MinSp: TEdit
        Left = 83
        Top = 55
        Width = 121
        Height = 21
        TabStop = False
        AutoSize = False
        Constraints.MaxHeight = 26
        ReadOnly = True
        TabOrder = 2
      end
      object MinSq: TEdit
        Left = 14
        Top = 55
        Width = 57
        Height = 21
        TabStop = False
        AutoSize = False
        Constraints.MaxHeight = 26
        ReadOnly = True
        TabOrder = 3
      end
      object AvSp: TEdit
        Left = 83
        Top = 87
        Width = 121
        Height = 21
        TabStop = False
        AutoSize = False
        Constraints.MaxHeight = 26
        ReadOnly = True
        TabOrder = 4
      end
    end
    object BRejTab: TTabSheet
      Caption = '„—ÃÊ⁄Ì Œ—Ìœ'
      ImageIndex = 2
      object Bevel3: TBevel
        Left = 8
        Top = 24
        Width = 202
        Height = 97
        Shape = bsFrame
        Style = bsRaised
      end
      object Label14: TLabel
        Left = 221
        Top = 29
        Width = 52
        Height = 22
        Alignment = taCenter
        AutoSize = False
        Caption = '»«·« —Ì‰'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label15: TLabel
        Left = 219
        Top = 55
        Width = 53
        Height = 22
        Alignment = taCenter
        AutoSize = False
        Caption = 'Å«∆Ì‰  —Ì‰'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label16: TLabel
        Left = 218
        Top = 87
        Width = 52
        Height = 22
        Alignment = taCenter
        AutoSize = False
        Caption = '„Ì«‰êÌ‰'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 115
        Top = 2
        Width = 52
        Height = 19
        Alignment = taCenter
        AutoSize = False
        Caption = 'ﬁÌ„ '
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 17
        Top = 1
        Width = 52
        Height = 20
        Alignment = taCenter
        AutoSize = False
        Caption = '„ﬁœ«—'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object MaxRBp: TEdit
        Left = 83
        Top = 29
        Width = 121
        Height = 21
        TabStop = False
        AutoSize = False
        Constraints.MaxHeight = 26
        ReadOnly = True
        TabOrder = 0
      end
      object MaxRBq: TEdit
        Left = 14
        Top = 29
        Width = 57
        Height = 21
        TabStop = False
        AutoSize = False
        Constraints.MaxHeight = 26
        ReadOnly = True
        TabOrder = 1
      end
      object MinRBp: TEdit
        Left = 83
        Top = 55
        Width = 121
        Height = 21
        TabStop = False
        AutoSize = False
        Constraints.MaxHeight = 26
        ReadOnly = True
        TabOrder = 2
      end
      object MinRBq: TEdit
        Left = 14
        Top = 55
        Width = 57
        Height = 21
        TabStop = False
        AutoSize = False
        Constraints.MaxHeight = 26
        ReadOnly = True
        TabOrder = 3
      end
      object AvRBp: TEdit
        Left = 84
        Top = 87
        Width = 121
        Height = 21
        TabStop = False
        AutoSize = False
        Constraints.MaxHeight = 26
        ReadOnly = True
        TabOrder = 4
      end
    end
    object IRejTab: TTabSheet
      Caption = '„—ÃÊ⁄Ì ›—Ê‘'
      ImageIndex = 3
      object Bevel4: TBevel
        Left = 8
        Top = 24
        Width = 202
        Height = 97
        Shape = bsFrame
        Style = bsRaised
      end
      object Label22: TLabel
        Left = 17
        Top = 1
        Width = 52
        Height = 20
        Alignment = taCenter
        AutoSize = False
        Caption = '„ﬁœ«—'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label23: TLabel
        Left = 115
        Top = 2
        Width = 52
        Height = 19
        Alignment = taCenter
        AutoSize = False
        Caption = 'ﬁÌ„ '
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label24: TLabel
        Left = 221
        Top = 29
        Width = 52
        Height = 22
        Alignment = taCenter
        AutoSize = False
        Caption = '»«·« —Ì‰'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label25: TLabel
        Left = 219
        Top = 55
        Width = 53
        Height = 22
        Alignment = taCenter
        AutoSize = False
        Caption = 'Å«∆Ì‰  —Ì‰'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label26: TLabel
        Left = 218
        Top = 87
        Width = 52
        Height = 22
        Alignment = taCenter
        AutoSize = False
        Caption = '„Ì«‰êÌ‰'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object MaxRSp: TEdit
        Left = 83
        Top = 29
        Width = 121
        Height = 21
        TabStop = False
        AutoSize = False
        Constraints.MaxHeight = 26
        ReadOnly = True
        TabOrder = 0
      end
      object MaxRSq: TEdit
        Left = 14
        Top = 29
        Width = 57
        Height = 21
        TabStop = False
        AutoSize = False
        Constraints.MaxHeight = 26
        ReadOnly = True
        TabOrder = 1
      end
      object MinRSp: TEdit
        Left = 83
        Top = 55
        Width = 121
        Height = 21
        TabStop = False
        AutoSize = False
        Constraints.MaxHeight = 26
        ReadOnly = True
        TabOrder = 2
      end
      object MinRSq: TEdit
        Left = 14
        Top = 55
        Width = 57
        Height = 21
        TabStop = False
        AutoSize = False
        Constraints.MaxHeight = 26
        ReadOnly = True
        TabOrder = 3
      end
      object AvRSp: TEdit
        Left = 83
        Top = 87
        Width = 121
        Height = 21
        TabStop = False
        AutoSize = False
        Constraints.MaxHeight = 26
        ReadOnly = True
        TabOrder = 4
      end
    end
  end
  object Bnext: TButton
    Left = 18
    Top = 190
    Width = 81
    Height = 25
    Caption = '&‰„«Ì‘'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 1
    OnClick = BnextClick
  end
  object Panel1: TPanel
    Tag = 1
    Left = 311
    Top = 1
    Width = 203
    Height = 217
    TabOrder = 0
    object Label11: TLabel
      Left = 157
      Top = 11
      Width = 42
      Height = 22
      AutoSize = False
      Caption = '‰«„ ﬂ«·«'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 162
      Top = 39
      Width = 36
      Height = 17
      AutoSize = False
      Caption = '„œ·'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 131
      Top = 85
      Width = 64
      Height = 22
      Alignment = taCenter
      AutoSize = False
      Caption = '„ÊÃÊœÌ —Ê“'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object GNam: TComboBox
      Left = 2
      Top = 9
      Width = 153
      Height = 21
      BiDiMode = bdRightToLeft
      ItemHeight = 13
      ParentBiDiMode = False
      Sorted = True
      TabOrder = 0
      OnChange = GNamChange
      OnDropDown = GNamDropDown
      OnKeyDown = GNamKeyDown
      OnKeyPress = NextTab
    end
    object FColor: TComboBox
      Left = 2
      Top = 36
      Width = 153
      Height = 21
      BiDiMode = bdRightToLeft
      ItemHeight = 13
      ParentBiDiMode = False
      Sorted = True
      TabOrder = 1
      OnKeyPress = NextTab
      Items.Strings = (
        '')
    end
    object FMoj: TEdit
      Left = 59
      Top = 85
      Width = 60
      Height = 21
      TabStop = False
      AutoSize = False
      Constraints.MaxHeight = 26
      ReadOnly = True
      TabOrder = 2
    end
  end
end
