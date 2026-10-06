object FCashier: TFCashier
  Left = 287
  Top = 105
  BiDiMode = bdRightToLeft
  BorderStyle = bsNone
  Caption = ' ⁄—Ì› ’‰œÊﬁ'
  ClientHeight = 314
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 561
    Top = 1
    Width = 74
    Height = 19
    Alignment = taRightJustify
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '‰«„ ’‰œÊﬁ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    Transparent = True
  end
  object Label1: TLabel
    Left = 305
    Top = 1
    Width = 85
    Height = 19
    Alignment = taRightJustify
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '„”∆Ê· ’‰œÊﬁ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    Transparent = True
  end
  object Label3: TLabel
    Left = 564
    Top = 31
    Width = 65
    Height = 19
    Alignment = taRightJustify
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '‰Ê⁄ «—“'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    Transparent = True
  end
  object Label4: TLabel
    Left = 306
    Top = 31
    Width = 86
    Height = 20
    Alignment = taRightJustify
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = 'òœ Õ”«»œ«—Ì'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    Transparent = True
  end
  object FName: TDBEdit
    Left = 433
    Top = 0
    Width = 124
    Height = 21
    AutoSize = False
    BiDiMode = bdRightToLeft
    DataField = 'Name'
    DataSource = FroDM.CashierDS
    ParentBiDiMode = False
    TabOrder = 0
    OnKeyPress = NextTab
  end
  object FOwner: TDBEdit
    Left = 152
    Top = 0
    Width = 147
    Height = 21
    AutoSize = False
    BiDiMode = bdRightToLeft
    DataField = 'Owner'
    DataSource = FroDM.CashierDS
    ParentBiDiMode = False
    TabOrder = 1
    OnKeyPress = NextTab
  end
  object FCtip: TDBComboBox
    Left = 486
    Top = 30
    Width = 71
    Height = 21
    Style = csDropDownList
    BiDiMode = bdRightToLeft
    DataField = 'Ctip'
    DataSource = FroDM.CashierDS
    ItemHeight = 13
    ParentBiDiMode = False
    TabOrder = 2
    OnKeyPress = NextTab
  end
  object dbg: TDBGrid
    Left = 0
    Top = 65
    Width = 631
    Height = 205
    DataSource = FroDM.CashierDS
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Id'
        Title.Caption = 'òœ'
        Width = 27
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'Name'
        Title.Caption = '‰«„ ’‰œÊﬁ'
        Width = 139
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'Owner'
        Title.Caption = '„”∆Ê· ’‰œÊﬁ'
        Width = 188
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Ctip'
        Title.Caption = '‰Ê⁄ «—“'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Ackod'
        Title.Caption = 'òœ Õ”«»œ«—Ì'
        Width = 151
        Visible = True
      end>
  end
  object FBehKod: TDBLookupComboBox
    Left = 151
    Top = 30
    Width = 147
    Height = 21
    BiDiMode = bdRightToLeft
    Constraints.MaxHeight = 28
    DataField = 'Ackod'
    DataSource = FroDM.CashierDS
    KeyField = 'Acckod'
    ListField = 'Nam'
    ListSource = FroDM.AcKodDs
    ParentBiDiMode = False
    ParentColor = True
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnKeyDown = FBehKodKeyDown
    OnKeyPress = NextTab
  end
  object dbn: TDBNavigator
    Left = 1
    Top = 272
    Width = 120
    Height = 22
    DataSource = FroDM.CashierDS
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost]
    Flat = True
    Hints.Strings = (
      '«Ê·Ì‰ —ﬂÊ—œ'
      '—ﬂÊ—œ ﬁ»·Ì'
      '—ﬂÊ—œ »⁄œÌ'
      '¬Œ—Ì‰ —ﬂÊ—œ'
      '—ﬂÊ—œ ÃœÌœ'
      'Õ–› —ﬂÊ—œ'
      ' ’ÕÌÕ —ﬂÊ—œ'
      'À» '
      '«‰’—«›'
      '»«“”«“Ì')
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
  end
  object Sb: TStatusBar
    Left = 0
    Top = 295
    Width = 630
    Height = 19
    Align = alNone
    BiDiMode = bdRightToLeft
    Panels = <
      item
        Text = 'Ctrl+Ins =  ÃœÌœ'
        Width = 100
      end
      item
        Text = 'Ctrl+Del = Õ–› '
        Width = 100
      end
      item
        Text = 'F3 =À»  '
        Width = 65
      end
      item
        Text = 'Esc=Œ—ÊÃ'
        Width = 120
      end>
    ParentBiDiMode = False
    ParentColor = True
    ParentFont = True
    SimplePanel = False
    SimpleText = 
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9 +
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9
    SizeGrip = False
    UseSystemFont = False
  end
end
