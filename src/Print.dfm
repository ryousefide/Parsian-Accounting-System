object FPrint: TFPrint
  Tag = 1
  Left = 349
  Top = 253
  Width = 316
  Height = 193
  AutoSize = True
  BiDiMode = bdRightToLeft
  Caption = 'ç«Å ›«ò Ê— ›—Ê‘'
  Color = clBtnFace
  Font.Charset = ARABIC_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 308
    Height = 166
  end
  object Label1: TLabel
    Left = 229
    Top = 17
    Width = 55
    Height = 18
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '«“  «—ÌŒ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object Label3: TLabel
    Left = 86
    Top = 17
    Width = 50
    Height = 18
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = ' «  «—ÌŒ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object Label2: TLabel
    Left = 229
    Top = 50
    Width = 55
    Height = 18
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '«“ ‘„«—Â'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object Label4: TLabel
    Left = 86
    Top = 50
    Width = 50
    Height = 18
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = ' « ‘„«—Â'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object SDat: TMaskEdit
    Left = 148
    Top = 16
    Width = 75
    Height = 21
    Hint = '”«·/„«Â/—Ê“'
    AutoSize = False
    BiDiMode = bdRightToLeft
    Constraints.MaxHeight = 21
    EditMask = '1300/00/00;1;_'
    MaxLength = 10
    ParentBiDiMode = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    Text = '13  /  /  '
    OnEnter = SDatEnter
    OnExit = SDatExit
    OnKeyPress = NextTab
  end
  object EDat: TMaskEdit
    Left = 3
    Top = 16
    Width = 75
    Height = 21
    Hint = '”«·/„«Â/—Ê“'
    AutoSize = False
    BiDiMode = bdRightToLeft
    Constraints.MaxHeight = 21
    EditMask = '1300/00/00;1;_'
    MaxLength = 10
    ParentBiDiMode = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    Text = '13  /  /  '
    OnEnter = EDatEnter
    OnExit = EDatExit
    OnKeyPress = NextTab
  end
  object SNo: TEdit
    Left = 148
    Top = 49
    Width = 74
    Height = 21
    AutoSize = False
    BiDiMode = bdRightToLeftNoAlign
    ParentBiDiMode = False
    TabOrder = 2
    OnKeyPress = SNoKeyPress
  end
  object ENo: TEdit
    Left = 4
    Top = 49
    Width = 74
    Height = 21
    AutoSize = False
    BiDiMode = bdRightToLeftNoAlign
    ParentBiDiMode = False
    TabOrder = 3
    OnKeyPress = SNoKeyPress
  end
  object Button1: TButton
    Left = 43
    Top = 125
    Width = 75
    Height = 25
    Caption = 'ç«Å'
    TabOrder = 4
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 118
    Top = 125
    Width = 75
    Height = 25
    Caption = 'ÿ—«ÕÌ '
    TabOrder = 5
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 193
    Top = 125
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Œ—ÊÃ'
    TabOrder = 6
    OnClick = Button3Click
  end
  object InvQ: TQuery
    Active = True
    DatabaseName = 'C:\AlishBook V402\DB'
    Filtered = True
    SQL.Strings = (
      
        'SELECT I."No" ‘„«—Â, I.Dat  «—ÌŒ, I.Pkol „»·€, I.Pdis  Œ›Ì›, I.P' +
        'net Œ«·’ , G.Id òœò «»,'
      
        'G.Nashr ‰«‘—, G.Nam ò «», G.Quant  ⁄œ«œ, G.Unit Ê«Õœ, G.Pfee ﬁÌ„' +
        '  ,'
      
        'G.Perc œ—’œ, G.Ptotal Ã„⁄, I.Nam Œ—Ìœ«—, A.Tel  ·›‰, A."Add" ¬œ—' +
        '”'
      'FROM "Invoice.DB" I,"AcCode.DB" A,"GOut.DB" G'
      'Where (A.Nam = I.Nam)and (I."No" = G."No") '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 254
    Top = 106
    object InvQBDEDesigner: TIntegerField
      FieldName = '‘„«—Â'
    end
    object InvQBDEDesigner2: TIntegerField
      FieldName = ' «—ÌŒ'
    end
    object InvQBDEDesigner3: TCurrencyField
      FieldName = '„»·€'
    end
    object InvQBDEDesigner4: TCurrencyField
      FieldName = ' Œ›Ì›'
    end
    object InvQBDEDesigner5: TCurrencyField
      FieldName = 'Œ«·’'
    end
    object InvQBDEDesigner6: TIntegerField
      FieldName = 'òœò «»'
    end
    object InvQBDEDesigner7: TStringField
      FieldName = '‰«‘—'
      Size = 50
    end
    object InvQBDEDesigner8: TStringField
      FieldName = 'ò «»'
      Size = 100
    end
    object InvQBDEDesigner9: TFloatField
      FieldName = ' ⁄œ«œ'
    end
    object InvQBDEDesigner10: TStringField
      FieldName = 'Ê«Õœ'
      Size = 10
    end
    object InvQBDEDesigner11: TCurrencyField
      FieldName = 'ﬁÌ„ '
    end
    object InvQBDEDesigner12: TFloatField
      FieldName = 'œ—’œ'
    end
    object InvQBDEDesigner13: TCurrencyField
      FieldName = 'Ã„⁄'
    end
    object InvQBDEDesigner14: TStringField
      FieldName = 'Œ—Ìœ«—'
      Size = 45
    end
    object InvQBDEDesigner15: TStringField
      FieldName = ' ·›‰'
    end
    object InvQBDEDesigner16: TStringField
      FieldName = '¬œ—”'
      Size = 100
    end
  end
  object Ds: TDataSource
    DataSet = InvQ
    Left = 226
    Top = 106
  end
  object ppInvRep: TppReport
    AutoStop = False
    DataPipeline = FDHav.ppHavg
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 188000
    PrinterSetup.mmPaperWidth = 250000
    PrinterSetup.PaperSize = 119
    Template.FileName = 
      'D:\Applications\Forooshes\Parsian Foroosh V5 SQL_M\Reports\HavRe' +
      'p.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 253
    Top = 78
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppHavg'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 67352
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'Dat'
        DataPipeline = FDHav.ppHav
        DisplayFormat = '####/##/##'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppHav'
        mmHeight = 4233
        mmLeft = 23548
        mmTop = 30000
        mmWidth = 30163
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'Œ—Ìœ«—'
        DataPipeline = ppBDEPipeline1
        Font.Charset = ARABIC_CHARSET
        Font.Color = clBlack
        Font.Name = 'Traditional Arabic'
        Font.Size = 16
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipeline1'
        mmHeight = 8636
        mmLeft = 57415
        mmTop = 4763
        mmWidth = 55298
        BandType = 0
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'RefNo'
        DataPipeline = FDHav.ppHav
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppHav'
        mmHeight = 4233
        mmLeft = 23548
        mmTop = 40000
        mmWidth = 29898
        BandType = 0
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'No'
        DataPipeline = FDHav.ppHav
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppHav'
        mmHeight = 4233
        mmLeft = 170000
        mmTop = 20050
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'Nam'
        DataPipeline = FDHav.ppHav
        Font.Charset = ARABIC_CHARSET
        Font.Color = clBlack
        Font.Name = 'MRT_Vanilla'
        Font.Size = 12
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppHav'
        mmHeight = 7144
        mmLeft = 114300
        mmTop = 4763
        mmWidth = 66411
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 10081
      mmPrintPosition = 0
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        Color = clSilver
        DataField = 'Nam'
        DataPipeline = FDHav.ppHavg
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppHavg'
        mmHeight = 9642
        mmLeft = 127265
        mmTop = 0
        mmWidth = 86900
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'Quant'
        DataPipeline = FDHav.ppHavg
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppHavg'
        mmHeight = 4233
        mmLeft = 70908
        mmTop = 0
        mmWidth = 15875
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'Unit'
        DataPipeline = FDHav.ppHavg
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppHavg'
        mmHeight = 3810
        mmLeft = 53975
        mmTop = 0
        mmWidth = 16404
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'Color'
        DataPipeline = FDHav.ppHavg
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppHavg'
        mmHeight = 9377
        mmLeft = 110596
        mmTop = 0
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'Serial'
        DataPipeline = FDHav.ppHavg
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppHavg'
        mmHeight = 3704
        mmLeft = 89429
        mmTop = 0
        mmWidth = 20638
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 35000
      mmPrintPosition = 0
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        AutoSize = True
        DataField = 'Des'
        DataPipeline = FDHav.ppHav
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppHav'
        mmHeight = 4233
        mmLeft = 102870
        mmTop = 6350
        mmWidth = 102447
        BandType = 8
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object ppDesigner1: TppDesigner
    Caption = 'ÿ—«ÕÌ ›«ò Ê—'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.CollationType = ctASCII
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    ShowComponents = [scLabel, scMemo, scRichText, scCalc, scImage, scShape, scLine, scBarCode, scDBText, scDBMemo, scDBRichText, scDBCalc, scDBBarCode, scDBTeeChart, scSystemVariable]
    Report = ppInvRep
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 226
    Top = 78
  end
  object ppBDEPipeline1: TppBDEPipeline
    DataSource = Ds
    UserName = 'Invoice'
    Left = 282
    Top = 78
    object ppBDEPipeline1ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = '‘„«—Â'
      FieldName = '‘„«—Â'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 0
      Position = 0
    end
    object ppBDEPipeline1ppField2: TppField
      Alignment = taRightJustify
      FieldAlias = ' «—ÌŒ'
      FieldName = ' «—ÌŒ'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 1
    end
    object ppBDEPipeline1ppField3: TppField
      FieldAlias = '„»·€'
      FieldName = '„»·€'
      FieldLength = 0
      DataType = dtCurrency
      DisplayWidth = 10
      Position = 2
    end
    object ppBDEPipeline1ppField4: TppField
      FieldAlias = ' Œ›Ì›'
      FieldName = ' Œ›Ì›'
      FieldLength = 0
      DataType = dtCurrency
      DisplayWidth = 10
      Position = 3
    end
    object ppBDEPipeline1ppField5: TppField
      FieldAlias = 'Œ«·’'
      FieldName = 'Œ«·’'
      FieldLength = 0
      DataType = dtCurrency
      DisplayWidth = 10
      Position = 4
    end
    object ppBDEPipeline1ppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'òœò «»'
      FieldName = 'òœò «»'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 5
    end
    object ppBDEPipeline1ppField7: TppField
      FieldAlias = '‰«‘—'
      FieldName = '‰«‘—'
      FieldLength = 50
      DisplayWidth = 50
      Position = 6
    end
    object ppBDEPipeline1ppField8: TppField
      FieldAlias = 'ò «»'
      FieldName = 'ò «»'
      FieldLength = 100
      DisplayWidth = 100
      Position = 7
    end
    object ppBDEPipeline1ppField9: TppField
      Alignment = taRightJustify
      FieldAlias = ' ⁄œ«œ'
      FieldName = ' ⁄œ«œ'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object ppBDEPipeline1ppField10: TppField
      FieldAlias = 'Ê«Õœ'
      FieldName = 'Ê«Õœ'
      FieldLength = 10
      DisplayWidth = 10
      Position = 9
    end
    object ppBDEPipeline1ppField11: TppField
      FieldAlias = 'ﬁÌ„ '
      FieldName = 'ﬁÌ„ '
      FieldLength = 0
      DataType = dtCurrency
      DisplayWidth = 10
      Position = 10
    end
    object ppBDEPipeline1ppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'œ—’œ'
      FieldName = 'œ—’œ'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object ppBDEPipeline1ppField13: TppField
      FieldAlias = 'Ã„⁄'
      FieldName = 'Ã„⁄'
      FieldLength = 0
      DataType = dtCurrency
      DisplayWidth = 10
      Position = 12
    end
    object ppBDEPipeline1ppField14: TppField
      FieldAlias = 'Œ—Ìœ«—'
      FieldName = 'Œ—Ìœ«—'
      FieldLength = 45
      DisplayWidth = 45
      Position = 13
    end
    object ppBDEPipeline1ppField15: TppField
      FieldAlias = ' ·›‰'
      FieldName = ' ·›‰'
      FieldLength = 20
      DisplayWidth = 20
      Position = 14
    end
    object ppBDEPipeline1ppField16: TppField
      FieldAlias = '¬œ—”'
      FieldName = '¬œ—”'
      FieldLength = 100
      DisplayWidth = 100
      Position = 15
    end
  end
end
