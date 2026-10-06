object FCTip: TFCTip
  Left = 354
  Top = 212
  Width = 352
  Height = 356
  AutoSize = True
  BiDiMode = bdRightToLeft
  BorderIcons = [biSystemMenu, biMinimize]
  BorderWidth = 5
  Caption = '„⁄—›Ì «‰Ê«⁄ «—“'
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
    Left = 279
    Top = 3
    Width = 53
    Height = 17
    AutoSize = False
    Caption = '‰«„ «—“'
  end
  object Label2: TLabel
    Left = 106
    Top = 3
    Width = 53
    Height = 17
    AutoSize = False
    Caption = '⁄·«„ '
  end
  object FDes: TDBEdit
    Left = 164
    Top = 0
    Width = 109
    Height = 21
    AutoSize = False
    DataField = 'Name'
    DataSource = FroDM.CtipDs
    TabOrder = 0
    OnKeyPress = NextTab
  end
  object Dbg: TDBGrid
    Left = 0
    Top = 26
    Width = 334
    Height = 250
    TabStop = False
    DataSource = FroDM.CtipDs
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 2
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
        FieldName = 'Name'
        Title.Alignment = taCenter
        Title.Caption = '‰«„ «—“'
        Width = 116
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'Sign'
        Title.Caption = '‰‘«‰ «Œ ’«—Ì'
        Width = 89
        Visible = True
      end>
  end
  object dbn: TDBNavigator
    Left = 0
    Top = 277
    Width = 120
    Height = 22
    DataSource = FroDM.CtipDs
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
    TabOrder = 3
  end
  object Sb: TStatusBar
    Left = 0
    Top = 300
    Width = 331
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
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9
    SizeGrip = False
    UseSystemFont = False
  end
  object FSign: TDBEdit
    Left = 2
    Top = 0
    Width = 100
    Height = 21
    AutoSize = False
    DataField = 'Sign'
    DataSource = FroDM.CtipDs
    TabOrder = 1
    OnKeyPress = NextTab
  end
end
