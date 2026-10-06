object FgoodsEdit: TFgoodsEdit
  Left = 277
  Top = 91
  AutoSize = True
  BiDiMode = bdRightToLeft
  BorderIcons = [biSystemMenu, biMinimize, biHelp]
  BorderStyle = bsSingle
  Caption = ' ’ÕÌÕ ﬂ«·«'
  ClientHeight = 298
  ClientWidth = 359
  Color = clBtnFace
  Font.Charset = ARABIC_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Serif'
  Font.Style = []
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 359
    Height = 275
    ActivePage = TabSheet1
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = '«ÿ·«⁄«  Å«ÌÂ'
      object Label1: TLabel
        Left = 277
        Top = 41
        Width = 73
        Height = 19
        Alignment = taRightJustify
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
        Left = 277
        Top = 14
        Width = 73
        Height = 19
        Alignment = taRightJustify
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
        Left = 277
        Top = 136
        Width = 73
        Height = 19
        Alignment = taRightJustify
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
        Left = 277
        Top = 163
        Width = 73
        Height = 19
        Alignment = taRightJustify
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
        Left = 277
        Top = 69
        Width = 73
        Height = 19
        Alignment = taRightJustify
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = 'ﬂœ ‘‰«”«ÌÌ'
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
        Left = 277
        Top = 99
        Width = 73
        Height = 19
        Alignment = taRightJustify
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
        Top = 190
        Width = 73
        Height = 19
        Alignment = taRightJustify
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
        Top = 217
        Width = 73
        Height = 19
        Alignment = taRightJustify
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
      object FNAm: TEdit
        Left = 1
        Top = 13
        Width = 266
        Height = 21
        AutoSize = False
        BiDiMode = bdRightToLeft
        MaxLength = 100
        ParentBiDiMode = False
        TabOrder = 0
        OnKeyPress = FormKeyPress
      end
      object FUnit: TComboBox
        Left = 195
        Top = 39
        Width = 73
        Height = 21
        BiDiMode = bdRightToLeft
        ItemHeight = 13
        MaxLength = 20
        ParentBiDiMode = False
        TabOrder = 1
        Text = '⁄œœ'
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
        Left = 193
        Top = 68
        Width = 75
        Height = 21
        AutoSize = False
        ReadOnly = True
        TabOrder = 2
        OnKeyPress = FkolKeyPress
      end
      object FPkh: TEdit
        Left = 137
        Top = 136
        Width = 131
        Height = 21
        AutoSize = False
        BiDiMode = bdRightToLeft
        ParentBiDiMode = False
        TabOrder = 5
        OnExit = FPkhExit
        OnKeyDown = FPkhKeyDown
        OnKeyPress = FkolKeyPress
      end
      object Fpfro: TEdit
        Left = 137
        Top = 162
        Width = 131
        Height = 21
        AutoSize = False
        BiDiMode = bdRightToLeft
        ParentBiDiMode = False
        TabOrder = 6
        OnExit = FpfroExit
        OnKeyDown = FpfroKeyDown
        OnKeyPress = FkolKeyPress
      end
      object FGene: TEdit
        Left = 191
        Top = 98
        Width = 77
        Height = 21
        AutoSize = False
        TabOrder = 3
        OnKeyPress = FkolKeyPress
      end
      object cbFdp: TCheckBox
        Left = -1
        Top = 97
        Width = 169
        Height = 17
        Caption = 'ﬂ«·«Ì Œœ„« Ì'
        TabOrder = 4
        OnKeyPress = FormKeyPress
      end
      object FQreq: TEdit
        Left = 190
        Top = 189
        Width = 78
        Height = 21
        TabOrder = 7
        OnKeyPress = FkolKeyPress
      end
      object FBreq: TEdit
        Left = 190
        Top = 217
        Width = 78
        Height = 21
        TabOrder = 8
        OnKeyPress = FkolKeyPress
      end
    end
    object TabSheet2: TTabSheet
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
  object Bsave: TButton
    Left = 66
    Top = 275
    Width = 201
    Height = 23
    BiDiMode = bdRightToLeft
    Caption = '&À» '
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
end
