object Fgoods: TFgoods
  Left = 143
  Top = 91
  ActiveControl = FNam
  AutoSize = True
  BiDiMode = bdRightToLeft
  BorderIcons = [biSystemMenu, biMinimize, biHelp]
  BorderStyle = bsSingle
  BorderWidth = 3
  Caption = '„⁄—›Ì ﬂ«·«'
  ClientHeight = 298
  ClientWidth = 423
  Color = clBtnFace
  Font.Charset = ARABIC_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Serif'
  Font.Style = []
  OldCreateOrder = False
  ParentBiDiMode = False
  PopupMenu = Pop1
  Position = poDefault
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel2: TBevel
    Left = 0
    Top = 5
    Width = 52
    Height = 132
    Visible = False
  end
  object Bexit: TButton
    Left = 259
    Top = 272
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
    TabOrder = 5
    OnClick = BexitClick
  end
  object Bsave: TButton
    Left = 66
    Top = 272
    Width = 193
    Height = 26
    BiDiMode = bdRightToLeft
    Caption = '&À» '
    Enabled = False
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 1
    OnClick = BsaveClick
  end
  object Bnext: TButton
    Left = 1
    Top = 58
    Width = 50
    Height = 26
    BiDiMode = bdRightToLeft
    Caption = '&»⁄œÌ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 3
    Visible = False
    OnClick = BnextClick
  end
  object Bprev: TButton
    Left = 1
    Top = 32
    Width = 50
    Height = 26
    BiDiMode = bdRightToLeft
    Caption = '&ﬁ»·Ì'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 2
    Visible = False
    OnClick = BprevClick
  end
  object Bdel: TButton
    Left = 1
    Top = 84
    Width = 50
    Height = 26
    BiDiMode = bdRightToLeft
    Caption = '&Õ–›'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 4
    Visible = False
    OnClick = BdelClick
  end
  object PageControl1: TPageControl
    Tag = -1
    Left = 66
    Top = 0
    Width = 357
    Height = 272
    ActivePage = TabSheet1
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object TabSheet1: TTabSheet
      Tag = -1
      Caption = '«ÿ·«⁄«  Å«ÌÂ'
      object Label1: TLabel
        Left = 274
        Top = 33
        Width = 67
        Height = 19
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = 'Ê«Õœ'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object Label2: TLabel
        Left = 274
        Top = 6
        Width = 67
        Height = 19
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = '‘—Õ ﬂ«·«'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object Label3: TLabel
        Left = 274
        Top = 138
        Width = 67
        Height = 19
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = 'ﬁÌ„  Œ—Ìœ'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object Label5: TLabel
        Left = 274
        Top = 166
        Width = 67
        Height = 19
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = 'ﬁÌ„  ›—Ê‘'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object Label6: TLabel
        Left = 274
        Top = 60
        Width = 67
        Height = 19
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = 'ﬂœ ò«·«'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object Label11: TLabel
        Left = 274
        Top = 87
        Width = 67
        Height = 19
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = 'ﬂœ ⁄„Ê„Ì'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object Label9: TLabel
        Left = 277
        Top = 194
        Width = 67
        Height = 19
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = '‰ﬁÿÂ ”›«—‘'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object Label10: TLabel
        Left = 277
        Top = 218
        Width = 67
        Height = 19
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = '„Ì“«‰ ”›«—‘'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object Label17: TLabel
        Left = 276
        Top = 113
        Width = 67
        Height = 19
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = '—ÊÌÂ «‰»«—'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object FNam: TEdit
        Left = 0
        Top = 5
        Width = 275
        Height = 21
        AutoSize = False
        BiDiMode = bdRightToLeft
        MaxLength = 100
        ParentBiDiMode = False
        TabOrder = 0
        OnExit = FNamExit
        OnKeyPress = FormKeyPress
      end
      object FUnit: TComboBox
        Left = 178
        Top = 32
        Width = 97
        Height = 21
        BiDiMode = bdRightToLeft
        ItemHeight = 13
        MaxLength = 20
        ParentBiDiMode = False
        TabOrder = 1
        Text = 'œ” ê«Â'
        OnKeyPress = FormKeyPress
        Items.Strings = (
          '⁄œœ'
          'ﬂÌ·Ê'
          ' ‰'
          'Ê—ﬁ'
          '”«‰ '
          '„ —'
          'ﬂ«— ‰'
          'Ã·œ'
          '»” Â'
          'ê—„'
          'œ” ê«Â')
      end
      object FKod: TEdit
        Left = 178
        Top = 58
        Width = 97
        Height = 21
        AutoSize = False
        TabOrder = 2
        OnEnter = FKodEnter
        OnExit = FKodExit
        OnKeyPress = FkolKeyPress
      end
      object FPkh: TEdit
        Left = 144
        Top = 138
        Width = 131
        Height = 21
        AutoSize = False
        BiDiMode = bdRightToLeft
        ParentBiDiMode = False
        TabOrder = 6
        OnExit = FPkhExit
        OnKeyDown = FPkhKeyDown
        OnKeyPress = FkolKeyPress
      end
      object Fpfro: TEdit
        Left = 144
        Top = 165
        Width = 131
        Height = 21
        AutoSize = False
        BiDiMode = bdRightToLeft
        ParentBiDiMode = False
        TabOrder = 7
        OnExit = FpfroExit
        OnKeyDown = FpfroKeyDown
        OnKeyPress = FkolKeyPress
      end
      object FGene: TEdit
        Left = 209
        Top = 85
        Width = 66
        Height = 21
        AutoSize = False
        TabOrder = 3
        OnKeyPress = FkolKeyPress
      end
      object cbFdp: TCheckBox
        Left = 4
        Top = 87
        Width = 185
        Height = 17
        Caption = 'ﬂ«·«Ì Œœ„« Ì «”  '
        TabOrder = 4
        OnKeyPress = FormKeyPress
      end
      object FQreq: TEdit
        Left = 197
        Top = 191
        Width = 78
        Height = 21
        TabOrder = 8
        OnKeyPress = FkolKeyPress
      end
      object FBreq: TEdit
        Left = 197
        Top = 218
        Width = 78
        Height = 21
        TabOrder = 9
        OnKeyPress = FkolKeyPress
      end
      object PRule: TComboBox
        Tag = 1
        Left = 144
        Top = 112
        Width = 131
        Height = 21
        ItemHeight = 13
        Sorted = True
        TabOrder = 5
        Text = 'Mean'
        OnKeyPress = FormKeyPress
        Items.Strings = (
          'FiFo'
          'LiFo'
          'Mean')
      end
    end
    object TabSheet2: TTabSheet
      Tag = -1
      Caption = '«ÿ·«⁄«   ò„Ì·Ì'
      ImageIndex = 1
      object Label12: TLabel
        Left = 249
        Top = 97
        Width = 64
        Height = 18
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = '„‘Œ’Â1'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object Label13: TLabel
        Left = 249
        Top = 122
        Width = 64
        Height = 19
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = '„‘Œ’Â2'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object Label14: TLabel
        Left = 249
        Top = 173
        Width = 64
        Height = 19
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = '„‘Œ’Â4'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object Label15: TLabel
        Left = 249
        Top = 149
        Width = 64
        Height = 19
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = '„‘Œ’Â3'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object Label16: TLabel
        Left = 249
        Top = 199
        Width = 64
        Height = 19
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = '»«—òœ'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object Label4: TLabel
        Left = 235
        Top = 8
        Width = 37
        Height = 19
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = 'òœ ﬂ·'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object Label7: TLabel
        Left = 180
        Top = 34
        Width = 48
        Height = 19
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = 'òœ „⁄Ì‰'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object Label8: TLabel
        Left = 118
        Top = 61
        Width = 65
        Height = 19
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = 'òœ  ›’Ì·Ì'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object FNashr: TEdit
        Left = 41
        Top = 96
        Width = 206
        Height = 21
        AutoSize = False
        BiDiMode = bdRightToLeft
        MaxLength = 100
        ParentBiDiMode = False
        TabOrder = 3
        OnKeyPress = FormKeyPress
      end
      object FWriter: TEdit
        Left = 41
        Top = 121
        Width = 206
        Height = 21
        AutoSize = False
        BiDiMode = bdRightToLeft
        MaxLength = 100
        ParentBiDiMode = False
        TabOrder = 4
        OnKeyPress = FormKeyPress
      end
      object FMot: TEdit
        Left = 41
        Top = 146
        Width = 206
        Height = 21
        AutoSize = False
        BiDiMode = bdRightToLeft
        MaxLength = 100
        ParentBiDiMode = False
        TabOrder = 5
        OnKeyPress = FormKeyPress
      end
      object FPrint: TEdit
        Left = 41
        Top = 171
        Width = 206
        Height = 21
        AutoSize = False
        BiDiMode = bdRightToLeft
        MaxLength = 100
        ParentBiDiMode = False
        TabOrder = 6
        OnKeyPress = FormKeyPress
      end
      object FIsbn: TEdit
        Left = 42
        Top = 198
        Width = 205
        Height = 21
        AutoSize = False
        BiDiMode = bdRightToLeft
        MaxLength = 100
        ParentBiDiMode = False
        TabOrder = 7
        OnKeyPress = FormKeyPress
      end
      object Fkol: TEdit
        Left = 179
        Top = 7
        Width = 51
        Height = 21
        AutoSize = False
        MaxLength = 3
        TabOrder = 0
        Text = '0'
        OnKeyPress = FkolKeyPress
      end
      object Ftaf: TEdit
        Left = 45
        Top = 60
        Width = 68
        Height = 21
        AutoSize = False
        MaxLength = 3
        TabOrder = 2
        Text = '0'
        OnEnter = FtafEnter
        OnKeyPress = FkolKeyPress
      end
      object Fmo: TEdit
        Left = 114
        Top = 34
        Width = 64
        Height = 21
        AutoSize = False
        MaxLength = 3
        TabOrder = 1
        Text = '0'
        OnKeyPress = FkolKeyPress
      end
    end
  end
  object Pop1: TPopupMenu
    Alignment = paRight
    BiDiMode = bdRightToLeft
    MenuAnimation = [maTopToBottom]
    ParentBiDiMode = False
    Left = 77
    Top = 37
    object N1: TMenuItem
      Caption = 'À» '
      OnClick = BsaveClick
    end
    object N2: TMenuItem
      Caption = '»⁄œÌ'
      OnClick = BnextClick
    end
    object N3: TMenuItem
      Caption = 'ﬁ»·Ì'
      OnClick = BprevClick
    end
  end
end
