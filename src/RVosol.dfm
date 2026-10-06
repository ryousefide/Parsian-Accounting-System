object FRVosol: TFRVosol
  Left = 405
  Top = 129
  AutoSize = True
  BiDiMode = bdRightToLeft
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  BorderWidth = 4
  Caption = '—”Ìœ Ê’Ê·  çò'
  ClientHeight = 414
  ClientWidth = 552
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
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 486
    Top = 1
    Width = 65
    Height = 20
    Alignment = taRightJustify
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '‘„«—Â'
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
    Left = 95
    Top = 0
    Width = 67
    Height = 20
    Alignment = taRightJustify
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = ' «—ÌŒ'
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
    Left = 488
    Top = 27
    Width = 64
    Height = 20
    Alignment = taRightJustify
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = 'Ã«—Ì'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    Layout = tlCenter
  end
  object Bevel2: TBevel
    Left = 0
    Top = 367
    Width = 552
    Height = 27
  end
  object Label5: TLabel
    Left = 138
    Top = 341
    Width = 43
    Height = 20
    Alignment = taRightJustify
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = 'Ã„⁄:'
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
    Left = 496
    Top = 341
    Width = 51
    Height = 20
    Alignment = taRightJustify
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = ' Ê÷ÌÕ« :'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    Layout = tlCenter
  end
  object Label6: TLabel
    Left = 487
    Top = 86
    Width = 63
    Height = 21
    Alignment = taRightJustify
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '”—Ì«· çﬂ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    Visible = False
  end
  object Label7: TLabel
    Left = 293
    Top = 87
    Width = 58
    Height = 19
    Alignment = taRightJustify
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '«“ —”Ìœ ò·—'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    Visible = False
  end
  object Label8: TLabel
    Left = 489
    Top = 56
    Width = 60
    Height = 19
    Alignment = taRightJustify
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = 'Å—ÊéÂ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object Label9: TLabel
    Left = 143
    Top = 56
    Width = 51
    Height = 19
    Alignment = taRightJustify
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '„—ò“'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object BDel: TBitBtn
    Left = 146
    Top = 368
    Width = 65
    Height = 25
    Caption = 'Õ–›'
    TabOrder = 12
    OnClick = BDelClick
  end
  object FNo: TEdit
    Left = 396
    Top = 0
    Width = 84
    Height = 20
    AutoSelect = False
    AutoSize = False
    BiDiMode = bdRightToLeft
    MaxLength = 20
    ParentBiDiMode = False
    TabOrder = 0
    OnKeyPress = FNoKeyPress
  end
  object Dat1: TMaskEdit
    Left = 5
    Top = 0
    Width = 84
    Height = 20
    Hint = ' «—ÌŒ ”— —”Ìœ çﬂ'
    AutoSize = False
    BiDiMode = bdRightToLeft
    Constraints.MaxHeight = 21
    EditMask = '1300/00/00;1;_'
    MaxLength = 10
    ParentBiDiMode = False
    TabOrder = 1
    Text = '13  /  /  '
    OnEnter = Dat1Enter
    OnExit = Dat1Exit
    OnKeyPress = NextTab
  end
  object FAccNam: TDBComboBox
    Left = 312
    Top = 25
    Width = 168
    Height = 21
    BiDiMode = bdRightToLeft
    DataField = 'Acnam'
    DataSource = FroDM.RvosDs
    ItemHeight = 13
    ParentBiDiMode = False
    ParentShowHint = False
    ShowHint = True
    Sorted = True
    TabOrder = 2
    OnKeyDown = FAccNamKeyDown
    OnKeyPress = NextTab
  end
  object dbg: TDBGrid
    Left = 1
    Top = 109
    Width = 549
    Height = 226
    DataSource = FroDM.RVIDs
    TabOrder = 7
    TitleFont.Charset = ARABIC_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnColEnter = dbgColEnter
    OnEditButtonClick = dbgEditButtonClick
    OnEnter = dbgEnter
    OnKeyDown = dbgKeyDown
    OnKeyPress = dbgKeyPress
    Columns = <
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'Radif'
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Bno'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Bdat'
        Title.Caption = ' «—ÌŒ'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Bank'
        Width = 108
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Pbill'
        Width = 115
        Visible = True
      end>
    object BList: TPopupListBox
      Left = 257
      Top = 18
      Width = 35
      Height = 226
      Color = clSilver
      ItemHeight = 13
      Parent = dbg
      TabOrder = 0
      Visible = False
      OnKeyDown = BListKeyDown
    end
  end
  object BSave: TBitBtn
    Left = 339
    Top = 368
    Width = 64
    Height = 25
    BiDiMode = bdRightToLeft
    Caption = 'À» '
    Enabled = False
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 15
    OnClick = BSaveClick
  end
  object Bexit: TBitBtn
    Left = 468
    Top = 368
    Width = 83
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
    TabOrder = 17
    OnClick = BexitClick
  end
  object Bedit: TBitBtn
    Left = 275
    Top = 368
    Width = 64
    Height = 25
    BiDiMode = bdRightToLeft
    Caption = '&ÊÌ—«Ì‘'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 14
    OnClick = BeditClick
  end
  object Bprev: TBitBtn
    Left = 2
    Top = 368
    Width = 72
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
    TabOrder = 10
    OnClick = BprevClick
  end
  object Bnext: TBitBtn
    Left = 74
    Top = 368
    Width = 72
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
    TabOrder = 11
    OnClick = BnextClick
  end
  object Bprint: TBitBtn
    Left = 403
    Top = 368
    Width = 65
    Height = 25
    BiDiMode = bdRightToLeft
    Caption = '&ç«Å'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 16
    OnClick = BprintClick
  end
  object FSum: TDBEdit
    Left = 7
    Top = 340
    Width = 127
    Height = 20
    TabStop = False
    AutoSize = False
    BiDiMode = bdRightToLeft
    DataField = 'Psum'
    DataSource = FroDM.RvosDs
    ParentBiDiMode = False
    ReadOnly = True
    TabOrder = 9
    OnKeyPress = NextTab
  end
  object BNew: TBitBtn
    Left = 211
    Top = 368
    Width = 64
    Height = 25
    BiDiMode = bdRightToLeft
    Caption = 'ÃœÌœ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 13
    OnClick = BNewClick
  end
  object Sb: TStatusBar
    Left = 0
    Top = 394
    Width = 552
    Height = 20
    Align = alNone
    BiDiMode = bdRightToLeft
    Panels = <
      item
        Text = 'Ins =  ÃœÌœ'
        Width = 100
      end
      item
        Text = 'Alt+Enter=ÊÌ—«Ì‘'
        Width = 110
      end
      item
        Text = 'F3 =À»  '
        Width = 80
      end
      item
        Text = 'Ctrl+Del = Õ–› '
        Width = 110
      end
      item
        Text = 'Alt+ç=ç«Å'
        Width = 90
      end
      item
        Text = 'Esc=Œ—ÊÃ'
        Width = 100
      end>
    ParentBiDiMode = False
    ParentColor = True
    ParentFont = True
    SimplePanel = False
    SimpleText = 
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9 +
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9 +
      #9#9#9#9#9#9#9#9#9#9
    SizeGrip = False
    UseSystemFont = False
  end
  object DBCheckBox1: TDBCheckBox
    Left = 6
    Top = 28
    Width = 97
    Height = 17
    TabStop = False
    Caption = 'ﬁÿ⁄Ì'
    DataField = 'LPerm'
    DataSource = FroDM.RvosDs
    ReadOnly = True
    TabOrder = 19
    ValueChecked = 'True'
    ValueUnchecked = 'False'
    Visible = False
  end
  object FDes: TDBEdit
    Left = 188
    Top = 340
    Width = 300
    Height = 21
    DataField = 'Des'
    DataSource = FroDM.RvosDs
    TabOrder = 8
    OnKeyPress = NextTab
  end
  object FDNo: TEdit
    Left = 359
    Top = 86
    Width = 121
    Height = 21
    Hint = '”—Ì«· çò „Ê—œ ‰Ÿ— —«  «ÌÅ ò—œÂ Ê ò·Ìœ ENTER —« »“‰Ìœ'
    AutoSelect = False
    AutoSize = False
    BiDiMode = bdRightToLeft
    MaxLength = 20
    ParentBiDiMode = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    Visible = False
    OnKeyPress = FDNoKeyPress
  end
  object FRNo: TEdit
    Left = 227
    Top = 86
    Width = 58
    Height = 21
    Hint = '‘„«—Â —”Ìœ „Ê—œ ‰Ÿ— —«  «ÌÅ ò—œÂ Ê ò·Ìœ ENTER —« »“‰Ìœ'
    AutoSelect = False
    AutoSize = False
    BiDiMode = bdRightToLeft
    MaxLength = 20
    ParentBiDiMode = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    Visible = False
    OnKeyPress = FRNoKeyPress
  end
  object FCost: TDBComboBox
    Left = 312
    Top = 55
    Width = 168
    Height = 21
    BiDiMode = bdRightToLeft
    DataField = 'Cost'
    DataSource = FroDM.RvosDs
    ItemHeight = 13
    ParentBiDiMode = False
    ParentShowHint = False
    ShowHint = True
    Sorted = True
    TabOrder = 3
    OnKeyPress = NextTab
  end
  object FCKod: TDBLookupComboBox
    Left = 4
    Top = 55
    Width = 131
    Height = 21
    DataField = 'Ckod'
    DataSource = FroDM.RvosDs
    KeyField = 'Kod'
    ListField = 'Nam'
    ListSource = FroDM.CentDs
    TabOrder = 4
    OnKeyDown = FCKodKeyDown
    OnKeyPress = NextTab
  end
  object EdQu: TQuery
    DatabaseName = 'E:\Poran\Db'
    SQL.Strings = (
      'Select * From RVosi  I'
      'Where I.No=:g')
    Left = 198
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'g'
        ParamType = ptUnknown
      end>
  end
end
