object FAnbDat: TFAnbDat
  Left = 234
  Top = 145
  AutoSize = True
  BiDiMode = bdLeftToRight
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = '  ⁄—Ì› «‰»«—'
  ClientHeight = 99
  ClientWidth = 351
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
  ShowHint = True
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 349
    Height = 63
  end
  object Label1: TLabel
    Left = 309
    Top = 5
    Width = 36
    Height = 20
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '‰«„ «‰»«—'
    FocusControl = FNam
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
  end
  object Label2: TLabel
    Left = 140
    Top = 7
    Width = 32
    Height = 21
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '„”∆Ê·'
    FocusControl = FAdmin
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
  end
  object Label3: TLabel
    Left = 228
    Top = 35
    Width = 31
    Height = 20
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '¬œ—”'
    FocusControl = FAdr
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
  end
  object Bevel2: TBevel
    Left = 0
    Top = 64
    Width = 350
    Height = 35
  end
  object Label4: TLabel
    Left = 312
    Top = 34
    Width = 32
    Height = 20
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = 'ﬂœ«‰»«—'
    FocusControl = FAdr
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
  end
  object FNam: TDBEdit
    Left = 178
    Top = 4
    Width = 129
    Height = 24
    Hint = '‰«„ „ œ«Ê· «‰»«—Ì ﬂÂ  ﬁ’œ «ÌÃ«œ ¬‰ —« œ«—Ìœ'
    AutoSize = False
    BiDiMode = bdRightToLeft
    DataField = 'Nam'
    DataSource = FroDM.AnbDatDs
    ParentBiDiMode = False
    TabOrder = 0
    OnEnter = FNamEnter
    OnExit = FNamExit
    OnKeyPress = FNamKeyPress
  end
  object FAdmin: TDBEdit
    Left = 1
    Top = 4
    Width = 129
    Height = 24
    Hint = '«‰»«—œ«— ÊÌ« ‘Œ’Ì ﬂÂ „”∆Ê·Ì   ÕÊÌ· ﬂ«·« —« œ«—œ'
    AutoSize = False
    BiDiMode = bdRightToLeft
    DataField = 'Admin'
    DataSource = FroDM.AnbDatDs
    ParentBiDiMode = False
    TabOrder = 1
    OnKeyPress = FAdminKeyPress
  end
  object FAdr: TDBEdit
    Left = 1
    Top = 34
    Width = 221
    Height = 24
    Hint = '¬œ—” «‰»«— „Ê—œ  ⁄—Ì›'
    AutoSize = False
    BiDiMode = bdRightToLeft
    DataField = 'Adr'
    DataSource = FroDM.AnbDatDs
    ParentBiDiMode = False
    TabOrder = 3
    OnKeyPress = FAdrKeyPress
  end
  object FKod: TDBEdit
    Left = 269
    Top = 33
    Width = 39
    Height = 24
    Hint = 'ﬂœ ⁄œœÌ «‰»«— ÃÂ  œ” —”Ì ”—Ì⁄ »Â «‰»«—'
    AutoSize = False
    BiDiMode = bdRightToLeft
    DataField = 'Kod'
    DataSource = FroDM.AnbDatDs
    ParentBiDiMode = False
    ReadOnly = True
    TabOrder = 2
    OnKeyPress = FKodKeyPress
  end
  object Panel1: TPanel
    Left = 1
    Top = 65
    Width = 350
    Height = 33
    BevelInner = bvLowered
    BorderWidth = 2
    TabOrder = 4
    object Bexit: TButton
      Left = 275
      Top = 4
      Width = 70
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
    object Bnext: TButton
      Left = 49
      Top = 4
      Width = 46
      Height = 25
      BiDiMode = bdRightToLeft
      Caption = '&»⁄œÌ'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Mitra'
      Font.Style = [fsBold, fsItalic]
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 1
      OnClick = BnextClick
    end
    object Bprev: TButton
      Left = 4
      Top = 4
      Width = 45
      Height = 25
      BiDiMode = bdRightToLeft
      Caption = '&ﬁ»·Ì'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Mitra'
      Font.Style = [fsBold, fsItalic]
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 0
      OnClick = BprevClick
    end
    object Bnew: TButton
      Left = 140
      Top = 4
      Width = 45
      Height = 25
      BiDiMode = bdRightToLeft
      Caption = '&ÃœÌœ'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Mitra'
      Font.Style = [fsBold, fsItalic]
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 3
      OnClick = BnewClick
    end
    object Bsave: TButton
      Left = 230
      Top = 4
      Width = 45
      Height = 25
      BiDiMode = bdRightToLeft
      Caption = '&À» '
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Mitra'
      Font.Style = [fsBold, fsItalic]
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 5
      OnClick = BsaveClick
    end
    object Bedit: TButton
      Left = 95
      Top = 4
      Width = 45
      Height = 25
      BiDiMode = bdRightToLeft
      Caption = '& €ÌÌ—'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Mitra'
      Font.Style = [fsBold, fsItalic]
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 2
      OnClick = BeditClick
    end
    object Bdel: TButton
      Left = 185
      Top = 4
      Width = 45
      Height = 25
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
      OnClick = BdelClick
    end
  end
end
