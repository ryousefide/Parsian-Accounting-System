object FCost: TFCost
  Left = 207
  Top = 186
  AutoSize = True
  BiDiMode = bdRightToLeft
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = '„⁄—›Ì Å—ÊéÂ'
  ClientHeight = 212
  ClientWidth = 422
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
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel2: TBevel
    Left = 0
    Top = 0
    Width = 422
    Height = 57
  end
  object Label1: TLabel
    Left = 379
    Top = 7
    Width = 31
    Height = 18
    Alignment = taCenter
    AutoSize = False
    Caption = '‰«„'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 378
    Top = 33
    Width = 37
    Height = 18
    Alignment = taCenter
    AutoSize = False
    Caption = '‘—Õ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 0
    Top = 64
    Width = 422
    Height = 27
  end
  object FNam: TEdit
    Left = 126
    Top = 8
    Width = 241
    Height = 21
    AutoSize = False
    Constraints.MaxHeight = 21
    MaxLength = 45
    TabOrder = 0
    OnExit = FNamExit
    OnKeyPress = NextTab
  end
  object FDesc: TEdit
    Left = 0
    Top = 32
    Width = 367
    Height = 21
    AutoSize = False
    Constraints.MaxHeight = 21
    MaxLength = 140
    TabOrder = 1
    OnKeyPress = NextTab
  end
  object Bprev: TButton
    Left = 1
    Top = 65
    Width = 70
    Height = 25
    Caption = '&ﬁ»·Ì'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 2
    OnClick = BprevClick
  end
  object Bnext: TButton
    Left = 71
    Top = 65
    Width = 70
    Height = 25
    Caption = '&»⁄œÌ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 3
    OnClick = BnextClick
  end
  object Bprint: TButton
    Left = 141
    Top = 65
    Width = 70
    Height = 25
    Caption = '&·Ì” '
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 4
    OnClick = BprintClick
  end
  object Bsave: TButton
    Left = 211
    Top = 65
    Width = 70
    Height = 25
    Caption = '&À» '
    Enabled = False
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 5
    OnClick = BsaveClick
  end
  object Bdel: TButton
    Left = 281
    Top = 65
    Width = 70
    Height = 25
    Caption = '&Õ–›'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 6
    OnClick = BdelClick
  end
  object Bexit: TButton
    Left = 351
    Top = 65
    Width = 70
    Height = 25
    Cancel = True
    Caption = 'Œ—ÊÃ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 7
    OnClick = BexitClick
  end
  object Dbg: TDBGrid
    Left = 1
    Top = 92
    Width = 419
    Height = 120
    DataSource = FroDM.CostcDs
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 8
    TitleFont.Charset = ARABIC_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Kod'
        Title.Caption = 'ﬂœ'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nam'
        Title.Caption = '‰«„'
        Width = 226
        Visible = True
      end>
  end
end
