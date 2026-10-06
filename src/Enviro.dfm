object FEnviro: TFEnviro
  Left = 263
  Top = 120
  ActiveControl = Pgc
  AutoSize = True
  BiDiMode = bdLeftToRight
  BorderIcons = [biSystemMenu, biMinimize, biHelp]
  BorderStyle = bsSingle
  BorderWidth = 5
  Caption = ' ‰ŸÌ„ „ÕÌÿ'
  ClientHeight = 384
  ClientWidth = 457
  Color = clBtnFace
  DockSite = True
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
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel2: TBevel
    Left = 0
    Top = 0
    Width = 457
    Height = 357
  end
  object Bexit: TButton
    Left = 147
    Top = 358
    Width = 164
    Height = 26
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
    TabOrder = 0
    OnClick = BexitClick
  end
  object Pgc: TPageControl
    Left = 1
    Top = 1
    Width = 454
    Height = 355
    ActivePage = TabSheet1
    BiDiMode = bdRightToLeft
    ParentBiDiMode = False
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'Å«Ìê«Â œ«œÂ '
      object Label15: TLabel
        Left = 2
        Top = 9
        Width = 54
        Height = 18
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = 'ÅÌ‘ ›—÷'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        Layout = tlCenter
      end
      object Label13: TLabel
        Left = 10
        Top = 39
        Width = 44
        Height = 18
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = '„”Ì—'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        Layout = tlCenter
      end
      object Label18: TLabel
        Left = 229
        Top = 133
        Width = 111
        Height = 18
        Alignment = taRightJustify
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = ' €ÌÌ— Å«Ìê«Â œ— Ã—Ì«‰'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        Layout = tlCenter
      end
      object Bevel4: TBevel
        Left = 5
        Top = 100
        Width = 333
        Height = 5
        Shape = bsTopLine
      end
      object FDefaultDb: TEdit
        Left = 58
        Top = 8
        Width = 137
        Height = 21
        AutoSize = False
        BiDiMode = bdLeftToRight
        Constraints.MaxHeight = 21
        ParentBiDiMode = False
        ReadOnly = True
        TabOrder = 0
        OnKeyPress = FormKeyPress
      end
      object FPath: TEdit
        Left = 58
        Top = 39
        Width = 377
        Height = 21
        AutoSize = False
        BiDiMode = bdLeftToRight
        Constraints.MaxHeight = 21
        ParentBiDiMode = False
        ReadOnly = True
        TabOrder = 1
        OnKeyPress = FormKeyPress
      end
      object FCurrDb: TComboBox
        Left = 38
        Top = 131
        Width = 180
        Height = 21
        BiDiMode = bdLeftToRight
        ItemHeight = 13
        ParentBiDiMode = False
        TabOrder = 2
        OnEnter = FCurrDbEnter
        OnExit = FCurrDbExit
        OnKeyPress = FormKeyPress
      end
      object Cb1: TCheckBox
        Tag = 3
        Left = 38
        Top = 159
        Width = 178
        Height = 17
        BiDiMode = bdRightToLeft
        Caption = 'Ã«Ìê“Ì‰ ÅÌ‘ ›—÷ ‘Êœø'
        ParentBiDiMode = False
        TabOrder = 3
        OnClick = Cb1Click
        OnKeyPress = FormKeyPress
      end
    end
    object TabSheet2: TTabSheet
      Caption = '›—„ Â«'
      ImageIndex = 1
      object Bevel1: TBevel
        Left = 1
        Top = 101
        Width = 284
        Height = 5
        Shape = bsTopLine
      end
      object Label17: TLabel
        Left = 172
        Top = 15
        Width = 114
        Height = 18
        Alignment = taRightJustify
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = '÷—Ì» ‰„«Ì‘ ›—„'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        Layout = tlCenter
      end
      object Label1: TLabel
        Left = 125
        Top = 91
        Width = 44
        Height = 19
        Alignment = taCenter
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = 'ﬁ·„ Â«'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        Layout = tlCenter
      end
      object Label2: TLabel
        Left = 277
        Top = 117
        Width = 54
        Height = 18
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = '»—ç”»'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        Layout = tlCenter
      end
      object Label3: TLabel
        Left = 277
        Top = 147
        Width = 54
        Height = 18
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = '„ ‰ ›—„'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        Layout = tlCenter
      end
      object Label4: TLabel
        Left = 277
        Top = 174
        Width = 54
        Height = 18
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = '„ ‰ Ãœ«Ê·'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        Layout = tlCenter
      end
      object FormRate: TEdit
        Left = 125
        Top = 15
        Width = 36
        Height = 21
        AutoSize = False
        BiDiMode = bdRightToLeft
        ParentBiDiMode = False
        TabOrder = 0
        OnExit = FormRateExit
        OnKeyPress = FormKeyPress
      end
      object Font1: TEdit
        Left = 26
        Top = 116
        Width = 249
        Height = 21
        AutoSize = False
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        TabOrder = 1
        OnKeyPress = FormKeyPress
      end
      object Font2: TEdit
        Left = 25
        Top = 145
        Width = 249
        Height = 21
        AutoSize = False
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        TabOrder = 3
        OnKeyPress = FormKeyPress
      end
      object Font3: TEdit
        Left = 25
        Top = 173
        Width = 249
        Height = 21
        AutoSize = False
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        TabOrder = 5
        OnKeyPress = FormKeyPress
      end
      object B1: TButton
        Left = 6
        Top = 116
        Width = 18
        Height = 20
        Caption = '....'
        TabOrder = 2
        OnClick = B1Click
      end
      object B2: TButton
        Left = 5
        Top = 145
        Width = 18
        Height = 20
        Caption = '....'
        TabOrder = 4
        OnClick = B2Click
      end
      object B3: TButton
        Left = 5
        Top = 174
        Width = 18
        Height = 20
        Caption = '....'
        TabOrder = 6
        OnClick = B3Click
      end
    end
    object TabSheet3: TTabSheet
      Caption = ' ç«Å'
      ImageIndex = 2
      object Label14: TLabel
        Left = 280
        Top = 4
        Width = 62
        Height = 18
        Alignment = taCenter
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = '«»⁄«œ ›«ò Ê— Â«'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        Layout = tlCenter
      end
      object Label16: TLabel
        Left = 367
        Top = 26
        Width = 27
        Height = 18
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = 'ÿÊ·'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        Layout = tlCenter
      end
      object Label19: TLabel
        Left = 282
        Top = 26
        Width = 30
        Height = 18
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = '⁄—÷'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
      end
      object Label20: TLabel
        Left = 117
        Top = 28
        Width = 33
        Height = 18
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = '›Ê«’·:'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        Layout = tlCenter
      end
      object Bevel5: TBevel
        Left = 7
        Top = 101
        Width = 332
        Height = 5
        Shape = bsTopLine
      end
      object Label21: TLabel
        Left = 136
        Top = 92
        Width = 79
        Height = 19
        Alignment = taCenter
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = 'ﬁ·„ Â«Ì ç«Å'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        Transparent = True
        Layout = tlCenter
      end
      object Label22: TLabel
        Left = 284
        Top = 114
        Width = 55
        Height = 18
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = '»—ç”»'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        Layout = tlCenter
      end
      object Label23: TLabel
        Left = 284
        Top = 142
        Width = 55
        Height = 18
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = '„ ‰ ›—„'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        Layout = tlCenter
      end
      object Label26: TLabel
        Left = 284
        Top = 170
        Width = 55
        Height = 18
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = '”—»—ê'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        Layout = tlCenter
      end
      object Label27: TLabel
        Left = 326
        Top = 63
        Width = 59
        Height = 19
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = ' ⁄œ«œ ‰”ŒÂ'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        Layout = tlCenter
      end
      object RMar: TEdit
        Left = 77
        Top = 25
        Width = 30
        Height = 17
        AutoSize = False
        TabOrder = 2
        OnKeyPress = RMarKeyPress
      end
      object TopM: TEdit
        Left = 46
        Top = 6
        Width = 30
        Height = 17
        AutoSize = False
        TabOrder = 3
        OnKeyPress = TopMKeyPress
      end
      object LMar: TEdit
        Left = 16
        Top = 23
        Width = 30
        Height = 17
        AutoSize = False
        TabOrder = 4
        OnKeyPress = LMarKeyPress
      end
      object ButM: TEdit
        Left = 46
        Top = 42
        Width = 30
        Height = 17
        AutoSize = False
        TabOrder = 5
        OnKeyPress = ButMKeyPress
      end
      object PLen: TEdit
        Left = 317
        Top = 26
        Width = 48
        Height = 20
        AutoSize = False
        TabOrder = 0
        OnKeyPress = PLenKeyPress
      end
      object Pwid: TEdit
        Left = 234
        Top = 26
        Width = 48
        Height = 19
        AutoSize = False
        TabOrder = 1
        OnKeyPress = PwidKeyPress
      end
      object PFont1: TEdit
        Left = 29
        Top = 114
        Width = 243
        Height = 21
        AutoSize = False
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        ReadOnly = True
        TabOrder = 6
        OnKeyPress = FormKeyPress
      end
      object PFont2: TEdit
        Left = 29
        Top = 142
        Width = 243
        Height = 21
        AutoSize = False
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        ReadOnly = True
        TabOrder = 8
        OnKeyPress = FormKeyPress
      end
      object PFont3: TEdit
        Left = 29
        Top = 170
        Width = 243
        Height = 21
        AutoSize = False
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        ReadOnly = True
        TabOrder = 10
        OnKeyPress = FormKeyPress
      end
      object B4: TButton
        Left = 9
        Top = 114
        Width = 18
        Height = 20
        Caption = '....'
        TabOrder = 7
        OnClick = B4Click
      end
      object B5: TButton
        Left = 8
        Top = 141
        Width = 18
        Height = 20
        Caption = '....'
        TabOrder = 9
        OnClick = B5Click
      end
      object B6: TButton
        Left = 8
        Top = 169
        Width = 18
        Height = 20
        Caption = '....'
        TabOrder = 11
        OnClick = B6Click
      end
      object FCopy: TEdit
        Left = 285
        Top = 59
        Width = 25
        Height = 21
        TabStop = False
        AutoSize = False
        BiDiMode = bdRightToLeftNoAlign
        Constraints.MaxHeight = 21
        ParentBiDiMode = False
        TabOrder = 12
        Text = '1'
        OnChange = FCopyChange
        OnKeyPress = FormKeyPress
      end
      object UpDown3: TUpDown
        Left = 310
        Top = 59
        Width = 17
        Height = 21
        Enabled = False
        Min = 1
        Max = 6
        Position = 1
        TabOrder = 13
        Visible = False
        Wrap = False
      end
    end
    object TabSheet4: TTabSheet
      Tag = 3
      Caption = '«Œ Ì«—« '
      ImageIndex = 3
      object Label7: TLabel
        Tag = 1
        Left = 98
        Top = 110
        Width = 107
        Height = 18
        Alignment = taRightJustify
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = '—Ê‘ „Õ«”»Â ”Êœ'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        Layout = tlCenter
      end
      object Label8: TLabel
        Left = 367
        Top = 11
        Width = 75
        Height = 18
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = '”—»—ê Ìﬂ'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        Layout = tlCenter
      end
      object Label9: TLabel
        Left = 367
        Top = 36
        Width = 75
        Height = 18
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = '”—Ì—ê œÊ'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        Layout = tlCenter
      end
      object Label10: TLabel
        Left = 367
        Top = 60
        Width = 75
        Height = 18
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = '¬œ—” '
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        Layout = tlCenter
      end
      object Lb6: TLabel
        Left = 185
        Top = 205
        Width = 98
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        BiDiMode = bdRightToLeftNoAlign
        Caption = 'Lb6'
        ParentBiDiMode = False
        Layout = tlCenter
      end
      object Bevel3: TBevel
        Left = 154
        Top = 180
        Width = 293
        Height = 5
        Shape = bsTopLine
      end
      object Label6: TLabel
        Left = 367
        Top = 82
        Width = 75
        Height = 18
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = 'Å«’›ÕÂ ›«ﬂ Ê—'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        Layout = tlCenter
      end
      object Label5: TLabel
        Left = 353
        Top = 171
        Width = 59
        Height = 18
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = ' ‰ŸÌ„   «—ÌŒ '
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        Transparent = True
        Layout = tlCenter
      end
      object Label11: TLabel
        Left = 368
        Top = 109
        Width = 75
        Height = 18
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = '«—“ ÅÌ‘ ›—÷'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        Layout = tlCenter
      end
      object PLog: TImage
        Left = 9
        Top = 195
        Width = 120
        Height = 93
        Stretch = True
        IsControl = True
      end
      object Label12: TLabel
        Left = 367
        Top = 142
        Width = 75
        Height = 18
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = 'œ—’œ ⁄Ê«—÷'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        Layout = tlCenter
      end
      object PRule: TComboBox
        Tag = 1
        Left = 8
        Top = 108
        Width = 84
        Height = 21
        ItemHeight = 13
        Sorted = True
        TabOrder = 5
        OnChange = PRuleChange
        OnKeyPress = FormKeyPress
        Items.Strings = (
          'FiFo'
          'LiFo'
          'Mean')
      end
      object FInvoLbl: TEdit
        Left = 5
        Top = 10
        Width = 348
        Height = 21
        AutoSize = False
        BiDiMode = bdRightToLeft
        ParentBiDiMode = False
        TabOrder = 0
        OnKeyPress = FormKeyPress
      end
      object FBarNamLbl: TEdit
        Left = 5
        Top = 33
        Width = 348
        Height = 21
        AutoSize = False
        BiDiMode = bdRightToLeft
        ParentBiDiMode = False
        TabOrder = 1
        OnKeyPress = FormKeyPress
      end
      object FMaster: TEdit
        Left = 5
        Top = 57
        Width = 348
        Height = 21
        BiDiMode = bdRightToLeft
        ParentBiDiMode = False
        TabOrder = 2
        OnKeyPress = FormKeyPress
      end
      object Dat: TEdit
        Left = 373
        Top = 200
        Width = 25
        Height = 21
        AutoSize = False
        BiDiMode = bdRightToLeftNoAlign
        Constraints.MaxHeight = 21
        ParentBiDiMode = False
        TabOrder = 8
        Text = '0'
        OnKeyPress = FormKeyPress
      end
      object UpDown1: TUpDown
        Left = 398
        Top = 200
        Width = 14
        Height = 21
        Associate = Dat
        Min = 30
        Max = -30
        Constraints.MaxHeight = 21
        Position = 0
        TabOrder = 9
        Wrap = False
        OnClick = UpDown1Click
      end
      object FCom: TEdit
        Left = 5
        Top = 80
        Width = 348
        Height = 21
        BiDiMode = bdRightToLeft
        ParentBiDiMode = False
        TabOrder = 3
        OnKeyPress = FormKeyPress
      end
      object Mon: TEdit
        Left = 301
        Top = 199
        Width = 25
        Height = 21
        AutoSize = False
        BiDiMode = bdRightToLeftNoAlign
        Constraints.MaxHeight = 21
        ParentBiDiMode = False
        TabOrder = 10
        Text = '0'
        OnKeyPress = FormKeyPress
      end
      object UpDown2: TUpDown
        Left = 326
        Top = 199
        Width = 14
        Height = 21
        Associate = Mon
        Min = 12
        Max = -12
        Constraints.MaxHeight = 21
        Position = 0
        TabOrder = 11
        Wrap = False
        OnClick = UpDown2Click
      end
      object Barm: TButton
        Tag = 1
        Left = 6
        Top = 169
        Width = 126
        Height = 22
        Caption = ' ⁄ÌÌ‰ ¬—„ œ— ”—»—ê Â«'
        TabOrder = 7
        TabStop = False
        OnClick = BarmClick
      end
      object cbCurr: TComboBox
        Tag = 1
        Left = 269
        Top = 108
        Width = 83
        Height = 21
        ItemHeight = 13
        Sorted = True
        TabOrder = 4
        OnChange = cbCurrChange
        OnKeyPress = FormKeyPress
        Items.Strings = (
          'FiFo'
          'LiFo'
          'Mean')
      end
      object FTax: TEdit
        Left = 303
        Top = 138
        Width = 48
        Height = 20
        AutoSize = False
        TabOrder = 6
        OnKeyPress = PLenKeyPress
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'Å«—«„ —Â«Ì ”Ì” „'
      ImageIndex = 4
      object Label24: TLabel
        Tag = 3
        Left = 212
        Top = 129
        Width = 39
        Height = 18
        AutoSize = False
        Caption = '—Ê“ ﬁ»·'
        Layout = tlCenter
      end
      object Label25: TLabel
        Left = 208
        Top = 155
        Width = 43
        Height = 19
        AutoSize = False
        Caption = 'œﬁÌﬁÂ'
        Layout = tlCenter
      end
      object Sp1: TSpeedButton
        Tag = 1
        Left = 6
        Top = 243
        Width = 125
        Height = 22
        Caption = ' €ÌÌ— —„“ «Ê·ÌÂ'
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000003
          333333333F777773FF333333008888800333333377333F3773F3333077870787
          7033333733337F33373F3308888707888803337F33337F33337F330777880887
          7703337F33337FF3337F3308888000888803337F333777F3337F330777700077
          7703337F33377733337F33088888888888033373FFFFFFFFFF73333000000000
          00333337777777777733333308033308033333337F7F337F7F33333308033308
          033333337F7F337F7F33333308033308033333337F73FF737F33333377800087
          7333333373F77733733333333088888033333333373FFFF73333333333000003
          3333333333777773333333333333333333333333333333333333}
        NumGlyphs = 2
        OnClick = Sp1Click
      end
      object cbRej: TCheckBox
        Tag = 3
        Left = 202
        Top = 108
        Width = 230
        Height = 17
        Caption = 'çﬂ »—ê‘ Ì »Â Õ”«» „‘ —Ì'
        TabOrder = 5
        OnKeyPress = FormKeyPress
      end
      object cbAKod: TCheckBox
        Tag = 3
        Left = 260
        Top = 23
        Width = 172
        Height = 17
        Caption = '”Ì” „ ç‰œ «‰»«—Â'
        Enabled = False
        TabOrder = 1
        OnKeyPress = FormKeyPress
      end
      object cbPerc: TCheckBox
        Tag = 3
        Left = 264
        Top = 44
        Width = 168
        Height = 17
        Caption = 'œ—’œ  Œ›Ì›'
        TabOrder = 2
        OnKeyPress = FormKeyPress
      end
      object cbGene: TCheckBox
        Tag = 3
        Left = 264
        Top = 65
        Width = 168
        Height = 17
        Caption = 'ﬂœ⁄„Ê„Ì'
        TabOrder = 3
        OnKeyPress = FormKeyPress
      end
      object cbRem: TCheckBox
        Left = -29
        Top = 44
        Width = 212
        Height = 17
        Caption = 'ç«Å „«‰œÂ ﬁ»·Ì œ— ›«ﬂ Ê—Â«'
        TabOrder = 16
        OnKeyPress = FormKeyPress
      end
      object cbDcheq: TCheckBox
        Tag = 3
        Left = 222
        Top = 86
        Width = 210
        Height = 17
        Caption = 'ﬂ‰ —· çﬂ Â«Ì «ﬁœ«„ ‰‘œÂ'
        TabOrder = 4
        OnKeyPress = FormKeyPress
      end
      object cbPcheq: TCheckBox
        Tag = 3
        Left = 284
        Top = 130
        Width = 148
        Height = 17
        Caption = '«Œÿ«— çﬂ Â«Ì Å—œ«Œ ‰Ì'
        TabOrder = 6
        OnKeyPress = FormKeyPress
      end
      object Fdays: TEdit
        Tag = 3
        Left = 256
        Top = 128
        Width = 28
        Height = 21
        AutoSize = False
        TabOrder = 7
        OnKeyPress = ButMKeyPress
      end
      object cbModel: TCheckBox
        Tag = 3
        Left = 258
        Top = 2
        Width = 174
        Height = 17
        Caption = '”Ì” „ „œ·'
        TabOrder = 0
        OnKeyPress = FormKeyPress
      end
      object cbNYear: TCheckBox
        Left = 2
        Top = 129
        Width = 181
        Height = 17
        Caption = 'Å” “„Ì‰Â „ÕÌÿ «Ã—«'
        TabOrder = 20
        OnClick = cbNYearClick
        OnKeyPress = FormKeyPress
      end
      object cbBK: TCheckBox
        Left = 288
        Top = 156
        Width = 144
        Height = 17
        Caption = ' ÂÌÂ Å‘ Ì»«‰ œ—Â—'
        TabOrder = 8
        OnKeyPress = FormKeyPress
      end
      object FMin: TEdit
        Left = 256
        Top = 154
        Width = 28
        Height = 21
        AutoSize = False
        TabOrder = 9
        OnKeyPress = ButMKeyPress
      end
      object cbBill: TCheckBox
        Tag = 3
        Left = 220
        Top = 205
        Width = 212
        Height = 17
        Caption = '«”‰«œ Õ”«»œ«—Ì »’Ê—  „Ã“« ’«œ— ‘Ê‰œ'
        TabOrder = 11
        OnKeyPress = FormKeyPress
      end
      object cbFac: TCheckBox
        Tag = 3
        Left = 4
        Top = 23
        Width = 179
        Height = 17
        Caption = '‘„«—Â ›«ﬂ Ê— Å‘  ”— Â„'
        TabOrder = 15
        OnKeyPress = FormKeyPress
      end
      object cbPerm: TCheckBox
        Tag = 3
        Left = 19
        Top = 2
        Width = 164
        Height = 17
        Caption = 'À»  ﬁÿ⁄Ì ›«ﬂ Ê— Â«'
        TabOrder = 14
        OnKeyPress = FormKeyPress
      end
      object cbNet: TCheckBox
        Tag = 3
        Left = 4
        Top = 108
        Width = 179
        Height = 17
        Caption = '«” ›«œÂ  Õ  ‘»ﬂÂ'
        TabOrder = 19
        OnKeyPress = FormKeyPress
      end
      object cbFRem: TCheckBox
        Left = 2
        Top = 65
        Width = 181
        Height = 17
        Caption = '‰„«Ì‘ „«‰œÂ Õ”«» œ— ›«ò Ê—'
        TabOrder = 17
        OnKeyPress = FormKeyPress
      end
      object cbPas: TComboBox
        Left = 18
        Top = 151
        Width = 166
        Height = 21
        Style = csDropDownList
        Enabled = False
        ItemHeight = 13
        TabOrder = 21
        OnChange = cbPasChange
        OnKeyPress = FormKeyPress
        Items.Strings = (
          'Center'
          'Stretch'
          'Tile')
      end
      object cbDp: TCheckBox
        Tag = 3
        Left = 10
        Top = 86
        Width = 173
        Height = 17
        Caption = 'ﬂ‰ —· „ÊÃÊœÌ'
        TabOrder = 18
        OnKeyPress = FormKeyPress
      end
      object cbCent: TCheckBox
        Tag = 3
        Left = 220
        Top = 228
        Width = 212
        Height = 17
        Caption = '„—«ò“ Â“Ì‰Â «Œ ’«’Ì »«‘œ '
        TabOrder = 12
        OnKeyPress = FormKeyPress
      end
      object cbBTip: TCheckBox
        Tag = 3
        Left = 220
        Top = 249
        Width = 212
        Height = 17
        Caption = '«”‰«œ ”Ì” „Ì „Êﬁ  »«‘‰œ'
        TabOrder = 13
        OnKeyPress = FormKeyPress
      end
      object cbABill: TCheckBox
        Tag = 3
        Left = 220
        Top = 184
        Width = 212
        Height = 17
        Caption = '”‰œ Õ”«»œ«—Ì  Â„“„«‰ ’«œ— ‘Êœ '
        TabOrder = 10
        OnClick = cbABillClick
        OnKeyPress = FormKeyPress
      end
      object cbSkin: TCheckBox
        Left = 29
        Top = 186
        Width = 154
        Height = 17
        Caption = 'ÅÊ‘‘ ›—„ Â«'
        TabOrder = 22
        OnClick = cbSkinClick
        OnKeyPress = FormKeyPress
      end
      object cSkin: TComboBox
        Left = 20
        Top = 204
        Width = 163
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 23
        OnChange = cSkinChange
        OnKeyPress = FormKeyPress
        Items.Strings = (
          'ÅÊ‘‘ 1'
          'ÅÊ‘‘2'
          'ÅÊ‘‘3'
          'ÅÊ‘‘4'
          'ÅÊ‘‘5'
          'ÅÊ‘‘6'
          'ÅÊ‘‘7'
          'ÅÊ‘‘8'
          'ÅÊ‘‘9'
          'ÅÊ‘‘10')
      end
    end
  end
  object FD1: TFontDialog
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MinFontSize = 0
    MaxFontSize = 0
    Left = 37
    Top = 320
  end
  object FD2: TFontDialog
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MinFontSize = 0
    MaxFontSize = 0
    Left = 9
    Top = 320
  end
  object FD3: TFontDialog
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MinFontSize = 0
    MaxFontSize = 0
    Left = 63
    Top = 320
  end
  object OPD: TOpenPictureDialog
    DefaultExt = '*.jpg;*.jpeg;*.bmp;*.ico'
    Options = [ofEnableSizing]
    Title = '«‰ Œ«» ¬—„'
    Left = 211
    Top = 61
  end
end
