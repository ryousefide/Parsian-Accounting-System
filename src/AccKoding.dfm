object FAccKoding: TFAccKoding
  Left = 117
  Top = 134
  AutoSize = True
  BiDiMode = bdLeftToRight
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'ﬂœÌ‰ê Õ”«»Â«'
  ClientHeight = 126
  ClientWidth = 382
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
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Tag = 1
    Left = 0
    Top = 0
    Width = 381
    Height = 71
    BevelInner = bvLowered
    BorderWidth = 2
    BorderStyle = bsSingle
    TabOrder = 0
    object Label3: TLabel
      Left = 333
      Top = 6
      Width = 33
      Height = 18
      Alignment = taCenter
      AutoSize = False
      BiDiMode = bdRightToLeft
      Caption = 'ﬂ·'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
    end
    object Label5: TLabel
      Left = 145
      Top = 5
      Width = 35
      Height = 18
      Alignment = taCenter
      AutoSize = False
      BiDiMode = bdRightToLeft
      Caption = '„⁄Ì‰'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
    end
    object Label6: TLabel
      Left = 327
      Top = 37
      Width = 46
      Height = 18
      Alignment = taCenter
      AutoSize = False
      BiDiMode = bdRightToLeft
      Caption = ' ›’Ì·Ì'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
    end
    object Label8: TLabel
      Left = 148
      Top = 36
      Width = 34
      Height = 18
      Alignment = taCenter
      AutoSize = False
      BiDiMode = bdRightToLeft
      Caption = 'Ã“¡'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
    end
    object FKgroCmb: TComboBox
      Left = 196
      Top = 5
      Width = 127
      Height = 21
      BiDiMode = bdRightToLeft
      ItemHeight = 13
      ParentBiDiMode = False
      Sorted = True
      TabOrder = 0
      OnChange = FKgroCmbChange
      OnExit = FKgroCmbExit
      OnKeyPress = FormKeyPress
    end
    object FkolCmb: TComboBox
      Left = 4
      Top = 4
      Width = 131
      Height = 21
      BiDiMode = bdRightToLeft
      ItemHeight = 13
      ParentBiDiMode = False
      Sorted = True
      TabOrder = 1
      OnChange = FkolCmbChange
      OnExit = FkolCmbExit
      OnKeyPress = FormKeyPress
    end
    object FkmoCmb: TComboBox
      Left = 195
      Top = 36
      Width = 127
      Height = 21
      BiDiMode = bdRightToLeft
      ItemHeight = 13
      ParentBiDiMode = False
      Sorted = True
      TabOrder = 2
      OnChange = FkmoCmbChange
      OnExit = FkmoCmbExit
      OnKeyPress = FormKeyPress
    end
    object Fktafcmb: TComboBox
      Left = 5
      Top = 36
      Width = 131
      Height = 21
      BiDiMode = bdRightToLeft
      ItemHeight = 13
      ParentBiDiMode = False
      Sorted = True
      TabOrder = 3
      OnChange = FktafcmbChange
      OnExit = FktafcmbExit
      OnKeyPress = FormKeyPress
    end
  end
  object Panel2: TPanel
    Left = 102
    Top = 72
    Width = 158
    Height = 33
    AutoSize = True
    BevelInner = bvLowered
    BorderWidth = 2
    TabOrder = 1
    object Bdel: TButton
      Left = 4
      Top = 4
      Width = 75
      Height = 25
      BiDiMode = bdRightToLeft
      Caption = '&Õ–›'
      Enabled = False
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Mitra'
      Font.Style = [fsBold, fsItalic]
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 0
      OnClick = BdelClick
    end
    object Bexit: TButton
      Left = 79
      Top = 4
      Width = 75
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
      TabOrder = 1
      OnClick = BexitClick
    end
  end
  object Sb1: TStatusBar
    Left = 1
    Top = 105
    Width = 381
    Height = 21
    Align = alNone
    Panels = <
      item
        BiDiMode = bdRightToLeftNoAlign
        ParentBiDiMode = False
        Width = 95
      end
      item
        Alignment = taRightJustify
        Width = 80
      end
      item
        Alignment = taRightJustify
        Width = 50
      end>
    ParentColor = True
    ParentFont = True
    ParentShowHint = False
    ShowHint = False
    SimplePanel = False
    SizeGrip = False
    UseSystemFont = False
  end
end
