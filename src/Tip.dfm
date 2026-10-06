object FTip: TFTip
  Left = 354
  Top = 212
  Width = 475
  Height = 359
  AutoSize = True
  BiDiMode = bdRightToLeft
  BorderIcons = [biSystemMenu, biMinimize]
  BorderWidth = 5
  Caption = ' ⁄—Ì› «‰Ê«⁄ „⁄«„·« '
  Color = clBtnFace
  Font.Charset = ARABIC_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 300
    Top = 3
    Width = 78
    Height = 17
    AutoSize = False
    Caption = '‘—Õ'
  end
  object Label2: TLabel
    Left = 299
    Top = 30
    Width = 79
    Height = 17
    AutoSize = False
    Caption = 'Õ”«» œ—¬„œ'
  end
  object Label3: TLabel
    Left = 299
    Top = 56
    Width = 79
    Height = 17
    AutoSize = False
    Caption = 'Õ”«»  Œ›Ì›'
  end
  object FDes: TDBEdit
    Left = 52
    Top = 0
    Width = 212
    Height = 21
    AutoSize = False
    DataField = 'Des'
    DataSource = FroDM.FTipDs
    TabOrder = 0
    OnKeyPress = NextTab
  end
  object Dbg: TDBGrid
    Left = 0
    Top = 84
    Width = 457
    Height = 196
    TabStop = False
    DataSource = FroDM.FTipDs
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = ARABIC_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Id'
        Title.Alignment = taCenter
        Title.Caption = 'òœ'
        Width = 45
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'Des'
        Title.Alignment = taCenter
        Title.Caption = '‘—Õ'
        Width = 125
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Beskod'
        Title.Alignment = taCenter
        Title.Caption = 'òœ œ—¬„œ'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Bedkod'
        Title.Caption = 'òœ  Œ›Ì›'
        Width = 106
        Visible = True
      end>
  end
  object dbn: TDBNavigator
    Left = 3
    Top = 281
    Width = 120
    Height = 22
    DataSource = FroDM.FTipDs
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
    TabOrder = 2
  end
  object Sb: TStatusBar
    Left = 0
    Top = 303
    Width = 456
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
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9
    SizeGrip = False
    UseSystemFont = False
  end
  object FBedKod: TDBLookupComboBox
    Left = 52
    Top = 54
    Width = 212
    Height = 21
    BiDiMode = bdRightToLeft
    Constraints.MaxHeight = 28
    DataField = 'Bedkod'
    DataSource = FroDM.FTipDs
    KeyField = 'Acckod'
    ListField = 'Nam'
    ListSource = FroDM.AcKodDs
    ParentBiDiMode = False
    ParentColor = True
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnKeyPress = NextTab
  end
  object FBeskod: TDBLookupComboBox
    Left = 52
    Top = 28
    Width = 212
    Height = 21
    BiDiMode = bdRightToLeft
    Constraints.MaxHeight = 28
    DataField = 'Beskod'
    DataSource = FroDM.FTipDs
    KeyField = 'Acckod'
    ListField = 'Nam'
    ListSource = FroDM.AcKodDs
    ParentBiDiMode = False
    ParentColor = True
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnKeyPress = NextTab
  end
end
