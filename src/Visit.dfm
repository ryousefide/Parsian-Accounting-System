object FVisit: TFVisit
  Left = 189
  Top = 195
  BiDiMode = bdRightToLeft
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = ' ⁄—Ì› ÊÌ“Ì Ê—'
  ClientHeight = 486
  ClientWidth = 903
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 903
    Height = 129
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 708
      Top = 10
      Width = 37
      Height = 18
      Alignment = taRightJustify
      AutoSize = False
      BiDiMode = bdLeftToRight
      Caption = '‰«„'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
    end
    object Label2: TLabel
      Left = 525
      Top = 10
      Width = 32
      Height = 18
      Alignment = taCenter
      AutoSize = False
      Caption = ' ·›‰'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 706
      Top = 33
      Width = 40
      Height = 18
      Alignment = taRightJustify
      AutoSize = False
      BiDiMode = bdLeftToRight
      Caption = '¬œ—”'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
    end
    object Label4: TLabel
      Left = 374
      Top = 10
      Width = 31
      Height = 18
      Alignment = taCenter
      AutoSize = False
      Caption = '‘Â—'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 664
      Top = 57
      Width = 84
      Height = 18
      Alignment = taRightJustify
      AutoSize = False
      BiDiMode = bdLeftToRight
      Caption = ' «—ÌŒ ‘—Ê⁄ ﬂ«—'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
    end
    object Label6: TLabel
      Left = 475
      Top = 57
      Width = 69
      Height = 18
      Alignment = taRightJustify
      AutoSize = False
      BiDiMode = bdLeftToRight
      Caption = 'œ—’œ «“ ›—Ê‘'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
    end
    object Label7: TLabel
      Left = 343
      Top = 57
      Width = 69
      Height = 18
      Alignment = taRightJustify
      AutoSize = False
      BiDiMode = bdLeftToRight
      Caption = 'ﬂœ ‘‰«”«ÌÌ'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
    end
    object FNam: TDBEdit
      Left = 562
      Top = 6
      Width = 138
      Height = 21
      AutoSize = False
      BiDiMode = bdRightToLeft
      DataField = 'Nam'
      DataSource = FroDM.VisitDs
      ParentBiDiMode = False
      TabOrder = 0
      OnExit = FNamExit
      OnKeyPress = NextTab
    end
    object Tel: TDBEdit
      Left = 409
      Top = 6
      Width = 114
      Height = 21
      AutoSize = False
      DataField = 'Tel'
      DataSource = FroDM.VisitDs
      TabOrder = 1
      OnKeyPress = NextTab
    end
    object City: TDBEdit
      Left = 253
      Top = 6
      Width = 114
      Height = 21
      AutoSize = False
      DataField = 'City'
      DataSource = FroDM.VisitDs
      TabOrder = 2
      OnKeyPress = NextTab
    end
    object Add: TDBEdit
      Left = 253
      Top = 31
      Width = 447
      Height = 21
      AutoSize = False
      DataField = 'Adr'
      DataSource = FroDM.VisitDs
      TabOrder = 3
      OnKeyPress = NextTab
    end
    object Bprev: TButton
      Left = 242
      Top = 92
      Width = 75
      Height = 25
      Caption = '&ﬁ»·Ì'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Mitra'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      TabOrder = 4
      OnClick = BprevClick
    end
    object Bdat: TMaskEdit
      Left = 558
      Top = 55
      Width = 99
      Height = 21
      AutoSize = False
      EditMask = '1300/00/00;1;_'
      MaxLength = 10
      TabOrder = 5
      Text = '13  /  /  '
      OnEnter = BdatEnter
      OnExit = BdatExit
      OnKeyPress = NextTab
    end
    object Perc: TDBEdit
      Left = 425
      Top = 57
      Width = 41
      Height = 21
      AutoSize = False
      DataField = 'Perc'
      DataSource = FroDM.VisitDs
      TabOrder = 6
      OnKeyPress = NextTab
    end
    object Bnext: TButton
      Left = 317
      Top = 92
      Width = 75
      Height = 25
      Caption = '&»⁄œÌ'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Mitra'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      TabOrder = 7
      OnClick = BnextClick
    end
    object Bnew: TButton
      Left = 392
      Top = 92
      Width = 75
      Height = 25
      Caption = '&ÃœÌœ'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Mitra'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      TabOrder = 8
      OnClick = BnewClick
    end
    object Bedit: TButton
      Left = 467
      Top = 92
      Width = 75
      Height = 25
      Caption = '&ÊÌ—«Ì‘'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Mitra'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      TabOrder = 9
      OnClick = BeditClick
    end
    object Bsave: TButton
      Left = 542
      Top = 92
      Width = 75
      Height = 25
      Caption = 'À» '
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Mitra'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      TabOrder = 10
      OnClick = BsaveClick
    end
    object Bdel: TButton
      Left = 617
      Top = 92
      Width = 75
      Height = 25
      Caption = '&Õ–›'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Mitra'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      TabOrder = 11
      OnClick = BdelClick
    end
    object Bexit: TButton
      Left = 692
      Top = 92
      Width = 75
      Height = 25
      Cancel = True
      Caption = 'Œ—ÊÃ'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Mitra'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      TabOrder = 12
      OnClick = BexitClick
    end
    object Code: TDBEdit
      Left = 254
      Top = 56
      Width = 81
      Height = 21
      AutoSize = False
      DataField = 'Code'
      DataSource = FroDM.VisitDs
      TabOrder = 13
      OnKeyPress = NextTab
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 129
    Width = 903
    Height = 357
    Align = alClient
    TabOrder = 1
    object Splitter1: TSplitter
      Left = 216
      Top = 1
      Width = 3
      Height = 355
      Cursor = crHSplit
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 215
      Height = 355
      Align = alLeft
      Caption = 'Panel3'
      TabOrder = 0
      object Bevel1: TBevel
        Left = 1
        Top = 1
        Width = 213
        Height = 69
        Align = alTop
      end
      object Label8: TLabel
        Left = 141
        Top = 10
        Width = 43
        Height = 21
        Alignment = taCenter
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = 'ﬂœﬂ·'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
      end
      object Label9: TLabel
        Left = 59
        Top = 10
        Width = 33
        Height = 21
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
      object Label10: TLabel
        Left = 143
        Top = 34
        Width = 65
        Height = 21
        Alignment = taCenter
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = ' ›’Ì·Ì «“'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
      end
      object Label11: TLabel
        Left = 61
        Top = 34
        Width = 30
        Height = 21
        Alignment = taCenter
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = '«·‹‹Ì'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
      end
      object FKod1: TEdit
        Left = 97
        Top = 10
        Width = 40
        Height = 21
        AutoSize = False
        BiDiMode = bdRightToLeft
        MaxLength = 3
        ParentBiDiMode = False
        TabOrder = 0
      end
      object FKod2: TEdit
        Left = 16
        Top = 10
        Width = 40
        Height = 21
        AutoSize = False
        BiDiMode = bdRightToLeft
        MaxLength = 3
        ParentBiDiMode = False
        TabOrder = 1
      end
      object FKod3: TEdit
        Left = 97
        Top = 34
        Width = 40
        Height = 21
        AutoSize = False
        BiDiMode = bdRightToLeft
        MaxLength = 4
        ParentBiDiMode = False
        TabOrder = 2
      end
      object FKod31: TEdit
        Left = 16
        Top = 34
        Width = 40
        Height = 21
        AutoSize = False
        BiDiMode = bdRightToLeft
        MaxLength = 4
        ParentBiDiMode = False
        TabOrder = 3
      end
      object CTree: TTreeView
        Tag = 1
        Left = 1
        Top = 70
        Width = 213
        Height = 284
        Align = alClient
        BiDiMode = bdRightToLeft
        Color = 15000804
        DragMode = dmAutomatic
        HideSelection = False
        Indent = 19
        ParentBiDiMode = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 4
        OnClick = CTreeClick
        OnDblClick = CTreeDblClick
        OnKeyUp = CTreeKeyUp
      end
    end
    object Panel4: TPanel
      Left = 219
      Top = 1
      Width = 683
      Height = 355
      Align = alClient
      TabOrder = 1
      object Splitter2: TSplitter
        Left = 1
        Top = 120
        Width = 681
        Height = 5
        Cursor = crVSplit
        Align = alTop
      end
      object dbg: TDBGrid
        Left = 1
        Top = 125
        Width = 681
        Height = 229
        Align = alClient
        DataSource = FroDM.VActDs
        TabOrder = 0
        TitleFont.Charset = ARABIC_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Serif'
        TitleFont.Style = []
        OnEditButtonClick = dbgEditButtonClick
        OnKeyPress = dbgKeyPress
        Columns = <
          item
            Expanded = False
            FieldName = 'Id'
            Visible = True
          end
          item
            ButtonStyle = cbsEllipsis
            Expanded = False
            FieldName = 'Des'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QtRate'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Perc'
            Width = 50
            Visible = True
          end>
      end
      object dgVisit: TDBGrid
        Left = 1
        Top = 1
        Width = 681
        Height = 119
        TabStop = False
        Align = alTop
        DataSource = FroDM.VisitDs
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = ARABIC_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Serif'
        TitleFont.Style = []
        OnKeyDown = dgVisitKeyDown
        OnKeyPress = dgVisitKeyPress
        Columns = <
          item
            Expanded = False
            FieldName = 'Code'
            Title.Alignment = taCenter
            Title.Caption = 'ﬂœ'
            Width = 44
            Visible = True
          end
          item
            Alignment = taLeftJustify
            Expanded = False
            FieldName = 'Nam'
            Title.Alignment = taCenter
            Title.Caption = '‰«„'
            Width = 135
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'Tel'
            Title.Alignment = taCenter
            Title.Caption = ' ·›‰'
            Width = 102
            Visible = True
          end
          item
            Alignment = taLeftJustify
            Expanded = False
            FieldName = 'City'
            Title.Alignment = taCenter
            Title.Caption = '‘Â—'
            Width = 94
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Bdat'
            Title.Alignment = taCenter
            Title.Caption = ' «—ÌŒ ‘—Ê⁄'
            Width = 87
            Visible = True
          end>
      end
    end
  end
end
