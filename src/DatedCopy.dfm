object MonCopy: TMonCopy
  Left = 410
  Top = 200
  Width = 278
  Height = 311
  AutoSize = True
  BiDiMode = bdRightToLeft
  Caption = ' ÂÌÂ œÌ”ﬂ  Â«Ì „«ÂÌ«‰Â'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 1
    Top = 192
    Width = 267
    Height = 16
    AutoSize = False
    BiDiMode = bdRightToLeftNoAlign
    ParentBiDiMode = False
  end
  object Label2: TLabel
    Left = 207
    Top = 232
    Width = 56
    Height = 16
    AutoSize = False
    Caption = '„”Ì—'
  end
  object BCopy: TButton
    Left = 19
    Top = 259
    Width = 75
    Height = 25
    Caption = 'ﬂÅÌ'
    TabOrder = 3
    OnClick = BCopyClick
  end
  object BRestore: TButton
    Left = 94
    Top = 259
    Width = 75
    Height = 25
    Caption = '»«“Ì«»Ì'
    TabOrder = 4
    OnClick = BRestoreClick
  end
  object rgMon: TRadioGroup
    Left = 0
    Top = 1
    Width = 84
    Height = 191
    BiDiMode = bdRightToLeft
    Items.Strings = (
      '›—Ê—œÌ‰'
      '«—œÌ»Â‘ '
      'Œ—œ«œ'
      ' Ì—'
      '„—œ«œ'
      '‘Â—ÌÊ—'
      '„‹‹Â—'
      '¬»«‰'
      '¬–—'
      'œÌ'
      '»Â„‰'
      '«”›‰œ')
    ParentBiDiMode = False
    TabOrder = 1
  end
  object GroupBox1: TGroupBox
    Left = 86
    Top = 0
    Width = 184
    Height = 192
    BiDiMode = bdRightToLeft
    ParentBiDiMode = False
    TabOrder = 0
    object cbFac: TCheckBox
      Left = 83
      Top = 9
      Width = 97
      Height = 17
      Caption = '›«ﬂ Ê— Â«'
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
    object cbBill: TCheckBox
      Left = 83
      Top = 25
      Width = 97
      Height = 17
      Caption = '«”‰«œ Õ”«»œ«—Ì'
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
    object cbRch: TCheckBox
      Left = 83
      Top = 58
      Width = 97
      Height = 17
      Caption = 'çﬂ Â«Ì Ê«—œÂ'
      Checked = True
      State = cbChecked
      TabOrder = 3
    end
    object cbPch: TCheckBox
      Left = 83
      Top = 74
      Width = 97
      Height = 17
      Caption = 'çﬂ Â«Ì ’«œ—Â'
      Checked = True
      State = cbChecked
      TabOrder = 4
    end
    object cbSaf: TCheckBox
      Left = 70
      Top = 106
      Width = 110
      Height = 17
      Caption = '”› Â Â«Ì œ—Ì«› Ì'
      Checked = True
      State = cbChecked
      TabOrder = 6
    end
    object cbConst: TCheckBox
      Left = 83
      Top = 138
      Width = 97
      Height = 17
      Caption = '«ÿ·«⁄«  ”Ì” „'
      TabOrder = 8
    end
    object cbCar: TCheckBox
      Left = 83
      Top = 154
      Width = 97
      Height = 17
      Caption = 'ﬂ«—œﬂ” Â«'
      Checked = True
      State = cbChecked
      TabOrder = 9
    end
    object cbJari: TCheckBox
      Left = 83
      Top = 170
      Width = 97
      Height = 17
      Caption = 'Ã«—Ì Â«'
      TabOrder = 10
    end
    object cbGa: TCheckBox
      Left = 28
      Top = 41
      Width = 152
      Height = 17
      Caption = 'ﬁ»÷ œ—Ì«›  Ê Å—œ«Œ '
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
    object cbFish: TCheckBox
      Left = 38
      Top = 90
      Width = 142
      Height = 17
      Caption = 'ÕÊ«·Â Ê ›Ì‘ ‰ﬁœÌ'
      Checked = True
      State = cbChecked
      TabOrder = 5
    end
    object cbAghs: TCheckBox
      Left = 36
      Top = 122
      Width = 144
      Height = 17
      Caption = '«ﬁ”«ÿ ’«œ—Â'
      Checked = True
      State = cbChecked
      TabOrder = 7
    end
  end
  object Pb: TProgressBar
    Left = 1
    Top = 210
    Width = 269
    Height = 15
    Min = 0
    Max = 100
    TabOrder = 5
  end
  object Path: TEdit
    Left = 2
    Top = 228
    Width = 194
    Height = 21
    BiDiMode = bdLeftToRight
    ParentBiDiMode = False
    TabOrder = 2
  end
  object Bexit: TButton
    Left = 169
    Top = 259
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Œ—ÊÃ'
    TabOrder = 6
    OnClick = BexitClick
  end
  object BM1: TBatchMove
    Left = 188
    Top = 264
  end
  object Table: TTable
    Left = 207
    Top = 262
  end
end
