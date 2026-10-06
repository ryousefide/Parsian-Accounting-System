object FRKeler: TFRKeler
  Left = 405
  Top = 129
  AutoSize = True
  BiDiMode = bdRightToLeft
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  BorderWidth = 4
  Caption = '—”Ìœ «”‰«œ œ—Ã—Ì«‰ Ê’Ê·    ò·—'
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
    Top = 0
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
    Top = 26
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
    Top = 85
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
  object Label8: TLabel
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
    TabOrder = 11
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
    DataSource = FroDM.RkelDs
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
    DataSource = FroDM.RKIDs
    TabOrder = 6
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
    TabOrder = 14
    OnClick = BSaveClick
  end
  object Bexit: TBitBtn
    Left = 467
    Top = 368
    Width = 84
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
    TabOrder = 16
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
    TabOrder = 13
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
    TabOrder = 9
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
    TabOrder = 10
    OnClick = BnextClick
  end
  object Bprint: TBitBtn
    Left = 403
    Top = 368
    Width = 64
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
    TabOrder = 15
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
    DataSource = FroDM.RkelDs
    ParentBiDiMode = False
    ReadOnly = True
    TabOrder = 8
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
    TabOrder = 12
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
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9
    SizeGrip = False
    UseSystemFont = False
  end
  object DBCheckBox1: TDBCheckBox
    Left = 6
    Top = 29
    Width = 97
    Height = 17
    TabStop = False
    Caption = 'ﬁÿ⁄Ì'
    DataField = 'LPerm'
    DataSource = FroDM.RPayDs
    ReadOnly = True
    TabOrder = 18
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
    DataSource = FroDM.RkelDs
    TabOrder = 7
    OnKeyPress = NextTab
  end
  object FDNo: TEdit
    Left = 359
    Top = 85
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
  object FCost: TDBComboBox
    Left = 312
    Top = 55
    Width = 168
    Height = 21
    BiDiMode = bdRightToLeft
    DataField = 'Cost'
    DataSource = FroDM.RkelDs
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
    DataSource = FroDM.RkelDs
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
      'Select * From RKeli  I'
      'Where I.No=:g')
    Left = 198
    Top = 1
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'g'
        ParamType = ptUnknown
      end>
  end
  object ppBDEPipeline1: TppBDEPipeline
    DataSource = DS
    UserName = 'BDEPipeline1'
    Left = 6
    Top = 78
  end
  object ppKelerRep: TppReport
    AutoStop = False
    DataPipeline = ppBDEPipeline1
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 0
    PrinterSetup.mmMarginLeft = 0
    PrinterSetup.mmMarginRight = 0
    PrinterSetup.mmMarginTop = 0
    PrinterSetup.mmPaperHeight = 140000
    PrinterSetup.mmPaperWidth = 215000
    PrinterSetup.PaperSize = 141
    Template.FileName = 'D:\Applications\Forooshes\Parsian Foroosh V5\Reports\Keler.rtm'
    Units = utMillimeters
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zsPercentage
    PreviewFormSettings.ZoomPercentage = 125
    TextFileName = 'D:\Applications\Forooshes\Parsian Foroosh V5\Reports\ò·—.TXT'
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 68
    Top = 78
    Version = '7.02'
    mmColumnWidth = 197300
    DataPipelineName = 'ppBDEPipeline1'
    object ppHeaderBand1: TppHeaderBand
      Save = True
      mmBottomOffset = 0
      mmHeight = 39952
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        SaveOrder = 0
        Save = True
        DataField = ' «—ÌŒ'
        DataPipeline = ppBDEPipeline1
        DisplayFormat = '####/##/##'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clBlack
        Font.Name = 'B Zar'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppBDEPipeline1'
        mmHeight = 5000
        mmLeft = 156898
        mmTop = 10000
        mmWidth = 25000
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        SaveOrder = 1
        Save = True
        DataField = '‰«„ Õ”«» ò·—'
        DataPipeline = ppBDEPipeline1
        Font.Charset = ARABIC_CHARSET
        Font.Color = clBlack
        Font.Name = 'B Zar'
        Font.Size = 12
        Font.Style = [fsBold, fsItalic, fsUnderline]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppBDEPipeline1'
        mmHeight = 10000
        mmLeft = 140000
        mmTop = 29952
        mmWidth = 40000
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        SaveOrder = 4
        Save = True
        Caption = 'çÂ«——«Â œﬁÌﬁÌ '
        Font.Charset = ARABIC_CHARSET
        Font.Color = clBlack
        Font.Name = 'B Zar'
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6350
        mmLeft = 95515
        mmTop = 17992
        mmWidth = 30956
        BandType = 0
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        SaveOrder = 2
        Save = True
        DataField = '‘„«—Â ﬁ»÷'
        DataPipeline = ppBDEPipeline1
        Font.Charset = ARABIC_CHARSET
        Font.Color = clBlack
        Font.Name = 'B Zar'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        DataPipelineName = 'ppBDEPipeline1'
        mmHeight = 7144
        mmLeft = 7938
        mmTop = 3440
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        SaveOrder = 3
        Save = True
        DataField = '’«Õ» Õ”«» ò·—'
        DataPipeline = ppBDEPipeline1
        Font.Charset = ARABIC_CHARSET
        Font.Color = clBlack
        Font.Name = 'B Zar'
        Font.Size = 12
        Font.Style = [fsBold, fsItalic, fsUnderline]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppBDEPipeline1'
        mmHeight = 10000
        mmLeft = 104000
        mmTop = 29952
        mmWidth = 32000
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      Save = True
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 8000
      mmPrintPosition = 0
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        SaveOrder = 0
        Save = True
        DataField = '”——”Ìœ'
        DataPipeline = ppBDEPipeline1
        DisplayFormat = '####/##/##'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clBlack
        Font.Name = 'B Zar'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppBDEPipeline1'
        mmHeight = 6879
        mmLeft = 105834
        mmTop = 529
        mmWidth = 24606
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        SaveOrder = 1
        Save = True
        DataField = '”—Ì«· çò'
        DataPipeline = ppBDEPipeline1
        Font.Charset = ARABIC_CHARSET
        Font.Color = clBlack
        Font.Name = 'B Zar'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppBDEPipeline1'
        mmHeight = 7000
        mmLeft = 157000
        mmTop = 500
        mmWidth = 25000
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        SaveOrder = 2
        Save = True
        DataField = '‰«„ »«‰ò çò'
        DataPipeline = ppBDEPipeline1
        Font.Charset = ARABIC_CHARSET
        Font.Color = clBlack
        Font.Name = 'B Zar'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppBDEPipeline1'
        mmHeight = 7000
        mmLeft = 60000
        mmTop = 500
        mmWidth = 45000
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        SaveOrder = 3
        Save = True
        DataField = '„»·€ çò'
        DataPipeline = ppBDEPipeline1
        Font.Charset = ARABIC_CHARSET
        Font.Color = clBlack
        Font.Name = 'B Zar'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppBDEPipeline1'
        mmHeight = 7000
        mmLeft = 15081
        mmTop = 529
        mmWidth = 43921
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 42000
      mmPrintPosition = 0
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'Ã„⁄ ò·'
        DataPipeline = ppBDEPipeline1
        Font.Charset = ARABIC_CHARSET
        Font.Color = clBlack
        Font.Name = 'B Zar'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppBDEPipeline1'
        mmHeight = 8000
        mmLeft = 15000
        mmTop = 9000
        mmWidth = 45000
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'ppDBText6'
      BreakType = btCustomField
      OutlineSettings.CreateNode = True
      NewPage = True
      ReprintOnSubsequentPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 10000
        mmPrintPosition = 0
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 9000
        mmPrintPosition = 0
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object ppDesigner1: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.CollationType = ctASCII
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    EnableHelp = False
    Position = poScreenCenter
    RAPOptions = [roViewGlobals, roEditGlobals]
    Report = ppKelerRep
    IniStorageType = 'Registry'
    IniStorageName = 'RBuilder'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 34
    Top = 78
  end
  object PQu: TQuery
    DatabaseName = 'ParFro'
    Filtered = True
    SQL.Strings = (
      
        'SELECT Rkel.No '#39'‘„«—Â ﬁ»÷'#39', Rkel.Dat  «—ÌŒ, Rkel.Acnam '#39'‰«„ Õ”«»' +
        ' ò·—'#39', Rkel.Psum '#39'Ã„⁄ ò·'#39', Jarin.DJari '#39'’«Õ» Õ”«» ò·—'#39', Rkeli.Bd' +
        'at ”——”Ìœ, Rkeli.Bno '#39'”—Ì«· çò'#39', Rkeli.Pbill '#39'„»·€ çò'#39', Rkeli.Ba' +
        'nk '#39'‰«„ »«‰ò çò'#39
      'FROM RKel Rkel'
      '   INNER JOIN JariN Jarin'
      '   ON  (Jarin.Nam = Rkel.Acnam)'
      '   INNER JOIN Rkeli Rkeli'
      '   ON  (Rkeli.No = Rkel.No)'
      ''
      ' '
      ' '
      ' '
      ' ')
    Left = 104
    Top = 78
    object PQuBDEDesigner: TIntegerField
      FieldName = '‘„«—Â ﬁ»÷'
    end
    object PQuBDEDesigner2: TIntegerField
      FieldName = ' «—ÌŒ'
    end
    object PQuBDEDesigner3: TCurrencyField
      FieldName = 'Ã„⁄ ò·'
    end
    object PQuBDEDesigner4: TStringField
      FieldName = '‰«„ Õ”«» ò·—'
      Size = 45
    end
    object PQuBDEDesigner5: TStringField
      FieldName = '’«Õ» Õ”«» ò·—'
      Size = 45
    end
    object PQuBDEDesigner6: TIntegerField
      FieldName = '”——”Ìœ'
    end
    object PQuBDEDesigner7: TStringField
      FieldName = '”—Ì«· çò'
    end
    object PQuBDEDesigner8: TCurrencyField
      FieldName = '„»·€ çò'
    end
    object PQuBDEDesigner9: TStringField
      FieldName = '‰«„ »«‰ò çò'
      Size = 45
    end
  end
  object DS: TDataSource
    DataSet = PQu
    Left = 132
    Top = 78
  end
end
