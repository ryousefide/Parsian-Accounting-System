object FAutoAcc: TFAutoAcc
  Left = 222
  Top = 118
  AutoSize = True
  BiDiMode = bdLeftToRight
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  BorderWidth = 5
  Caption = '« Ê„«”ÌÊ‰ Õ”«»œ«—Ì'
  ClientHeight = 365
  ClientWidth = 465
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
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 462
    Height = 30
    Shape = bsFrame
    Style = bsRaised
  end
  object Bevel2: TBevel
    Left = 0
    Top = 32
    Width = 462
    Height = 31
  end
  object Label1: TLabel
    Left = 64
    Top = 6
    Width = 66
    Height = 18
    Alignment = taCenter
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = ' »” «‰ﬂ«—'
    Color = clBtnFace
    Font.Charset = ARABIC_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Serif'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentColor = False
    ParentFont = False
  end
  object Label2: TLabel
    Left = 270
    Top = 5
    Width = 60
    Height = 19
    Alignment = taCenter
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '»œÂﬂ«—'
    Color = clBtnFace
    Font.Charset = ARABIC_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Serif'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentColor = False
    ParentFont = False
  end
  object Label4: TLabel
    Left = 372
    Top = 4
    Width = 81
    Height = 19
    Alignment = taCenter
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '›⁄«·/€Ì—›⁄«·'
    Color = clBtnFace
    Font.Charset = ARABIC_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Serif'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentColor = False
    ParentFont = False
  end
  object Stat: TDBCheckBox
    Left = 426
    Top = 39
    Width = 14
    Height = 17
    DataField = 'Stat'
    DataSource = FroDM.AutoBillDs
    TabOrder = 0
    ValueChecked = 'True'
    ValueUnchecked = 'False'
    OnKeyPress = StatKeyPress
  end
  object Bexit: TButton
    Left = 380
    Top = 69
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
    TabOrder = 7
    OnClick = BexitClick
  end
  object Bedit: TButton
    Left = 184
    Top = 69
    Width = 75
    Height = 25
    Caption = 'ÊÌ—«Ì‘'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 5
    OnClick = BeditClick
  end
  object Bnext: TButton
    Left = 76
    Top = 69
    Width = 75
    Height = 25
    BiDiMode = bdRightToLeft
    Caption = '»⁄œÌ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 4
    OnClick = BnextClick
  end
  object Bprev: TButton
    Left = 1
    Top = 69
    Width = 75
    Height = 25
    BiDiMode = bdRightToLeft
    Caption = 'ﬁ»·Ì'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 3
    OnClick = BprevClick
  end
  object Bsave: TButton
    Left = 260
    Top = 69
    Width = 75
    Height = 25
    BiDiMode = bdRightToLeft
    Caption = 'À» '
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 6
    OnClick = BsaveClick
  end
  object FBesKod: TDBLookupComboBox
    Left = 4
    Top = 37
    Width = 180
    Height = 21
    BiDiMode = bdRightToLeft
    Constraints.MaxHeight = 28
    DataField = 'BesKod'
    DataSource = FroDM.AutoBillDs
    KeyField = 'Acckod'
    ListField = 'Nam'
    ListSource = FroDM.AcKodDs
    ParentBiDiMode = False
    ParentColor = True
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnKeyDown = FBesKodKeyDown
    OnKeyUp = FBehKodKeyUp
  end
  object FBehKod: TDBLookupComboBox
    Left = 206
    Top = 37
    Width = 180
    Height = 21
    BiDiMode = bdRightToLeft
    Constraints.MaxHeight = 28
    DataField = 'BehKod'
    DataSource = FroDM.AutoBillDs
    KeyField = 'Acckod'
    ListField = 'Nam'
    ListSource = FroDM.AcKodDs
    ParentBiDiMode = False
    ParentColor = True
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnKeyDown = FBesKodKeyDown
    OnKeyUp = FBehKodKeyUp
  end
  object Sb: TStatusBar
    Left = 1
    Top = 99
    Width = 463
    Height = 19
    Align = alNone
    BiDiMode = bdRightToLeft
    Panels = <
      item
        Width = 100
      end
      item
        Width = 50
      end>
    ParentBiDiMode = False
    ParentFont = True
    SimplePanel = False
    UseSystemFont = False
  end
  object dbg: TDBGrid
    Left = 0
    Top = 120
    Width = 465
    Height = 245
    BiDiMode = bdRightToLeft
    DataSource = FroDM.AutoBillDs
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentBiDiMode = False
    ReadOnly = True
    TabOrder = 9
    TitleFont.Charset = ARABIC_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Serif'
    TitleFont.Style = []
    OnDrawColumnCell = dbgDrawColumnCell
    OnKeyUp = dbgKeyUp
    Columns = <
      item
        Expanded = False
        FieldName = 'Caption'
        Title.Alignment = taCenter
        Title.Caption = '‘—Õ'
        Width = 183
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BehKod'
        Title.Alignment = taCenter
        Title.Caption = 'òœ»œÂò«—'
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BesKod'
        Title.Alignment = taCenter
        Title.Caption = 'òœ »” «‰ò«—'
        Width = 109
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Stat'
        Title.Caption = '›⁄«·'
        Width = 41
        Visible = True
      end>
  end
end
