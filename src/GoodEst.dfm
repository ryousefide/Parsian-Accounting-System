object FGoodEst: TFGoodEst
  Tag = 1
  Left = 75
  Top = 135
  BiDiMode = bdRightToLeft
  BorderStyle = bsNone
  Caption = '«” ⁄·«„ ò«·«'
  ClientHeight = 536
  ClientWidth = 1174
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
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 1174
    Height = 61
    Align = alTop
  end
  object Splitter1: TSplitter
    Left = 179
    Top = 61
    Width = 5
    Height = 456
    Cursor = crHSplit
    AutoSnap = False
    Beveled = True
  end
  object Label1: TLabel
    Left = 1108
    Top = 8
    Width = 56
    Height = 19
    Anchors = [akTop, akRight]
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '‘—Õ ò«·«'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object Bevel3: TBevel
    Left = 2
    Top = 4
    Width = 209
    Height = 57
    Hint = 'Ã” ÃÊ »— «”«” ﬂœ Â«Ì ›—⁄Ì'
    ParentShowHint = False
    Shape = bsFrame
    ShowHint = True
    Style = bsRaised
  end
  object Label5: TLabel
    Left = 135
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
  object Label6: TLabel
    Left = 53
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
  object Label7: TLabel
    Left = 135
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
  object Label8: TLabel
    Left = 55
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
  object Splitter2: TSplitter
    Left = 410
    Top = 61
    Width = 5
    Height = 456
    Cursor = crHSplit
    Beveled = True
  end
  object CTree: TTreeView
    Tag = 1
    Left = 0
    Top = 61
    Width = 179
    Height = 456
    Align = alLeft
    BiDiMode = bdRightToLeft
    Color = 15000804
    DragMode = dmAutomatic
    HideSelection = False
    Indent = 19
    ParentBiDiMode = False
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 0
    OnClick = CTreeClick
  end
  object GList: TXPListBox
    Left = 184
    Top = 61
    Width = 226
    Height = 456
    Hint = '·Ì”  ò«·«Â«Ì ê—ÊÂ'
    Align = alLeft
    ItemHeight = 13
    ParentShowHint = False
    ShowHint = True
    Sorted = True
    TabOrder = 1
    OnClick = GListClick
  end
  object FGNam: TComboBox
    Left = 538
    Top = 7
    Width = 563
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    BiDiMode = bdRightToLeft
    ItemHeight = 13
    ParentBiDiMode = False
    Sorted = True
    TabOrder = 2
    OnKeyDown = FGNamKeyDown
    OnKeyPress = NextTab
  end
  object FKod1: TEdit
    Left = 91
    Top = 10
    Width = 40
    Height = 21
    AutoSize = False
    BiDiMode = bdRightToLeft
    MaxLength = 3
    ParentBiDiMode = False
    TabOrder = 3
  end
  object FKod2: TEdit
    Left = 10
    Top = 10
    Width = 40
    Height = 21
    AutoSize = False
    BiDiMode = bdRightToLeft
    MaxLength = 3
    ParentBiDiMode = False
    TabOrder = 4
  end
  object FKod3: TEdit
    Left = 91
    Top = 34
    Width = 40
    Height = 21
    AutoSize = False
    BiDiMode = bdRightToLeft
    MaxLength = 4
    ParentBiDiMode = False
    TabOrder = 5
  end
  object FKod31: TEdit
    Left = 10
    Top = 34
    Width = 40
    Height = 21
    AutoSize = False
    BiDiMode = bdRightToLeft
    MaxLength = 4
    ParentBiDiMode = False
    TabOrder = 6
  end
  object SB: TStatusBar
    Left = 0
    Top = 517
    Width = 1174
    Height = 19
    Panels = <
      item
        BiDiMode = bdRightToLeft
        ParentBiDiMode = False
        Text = 'F3=‰„«Ì‘'
        Width = 150
      end
      item
        BiDiMode = bdRightToLeft
        ParentBiDiMode = False
        Text = '       '
        Width = 50
      end
      item
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        Width = 50
      end>
    ParentFont = True
    SimplePanel = False
    SizeGrip = False
    UseSystemFont = False
  end
  object PageControl1: TPageControl
    Left = 415
    Top = 61
    Width = 759
    Height = 456
    ActivePage = TabSheet1
    Align = alClient
    BiDiMode = bdRightToLeft
    ParentBiDiMode = False
    TabOrder = 8
    object TabSheet1: TTabSheet
      Caption = '¬‰«·Ì“ ﬁÌ„ '
      object Bevel2: TBevel
        Left = 0
        Top = 331
        Width = 751
        Height = 97
        Align = alBottom
      end
      object Bevel4: TBevel
        Left = 0
        Top = 0
        Width = 751
        Height = 35
        Align = alTop
      end
      object Label2: TLabel
        Left = 686
        Top = 10
        Width = 60
        Height = 18
        Alignment = taRightJustify
        Anchors = [akTop, akRight]
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = '‰«„ Õ”«»'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
      end
      object Label4: TLabel
        Left = 395
        Top = 11
        Width = 60
        Height = 18
        Anchors = [akTop, akRight]
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = '„—ﬂ“ Â“Ì‰Â'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
      end
      object Label3: TLabel
        Left = 626
        Top = 342
        Width = 117
        Height = 20
        Anchors = [akRight, akBottom]
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = '„Ì«‰êÌ‰ ‰—Œ ›—Ê‘'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
      end
      object Label9: TLabel
        Left = 626
        Top = 371
        Width = 117
        Height = 20
        Anchors = [akRight, akBottom]
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = '»«·« —Ì‰ ‰—Œ ›—Ê‘'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
      end
      object Label10: TLabel
        Left = 626
        Top = 398
        Width = 117
        Height = 20
        Anchors = [akRight, akBottom]
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = 'Å«ÌÌ‰  —Ì‰ ‰—Œ ›—Ê‘'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
      end
      object Label11: TLabel
        Left = 402
        Top = 373
        Width = 77
        Height = 20
        Anchors = [akRight, akBottom]
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = 'œ— „ﬁœ«— ›—Ê‘'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
      end
      object Label12: TLabel
        Left = 402
        Top = 400
        Width = 77
        Height = 20
        Anchors = [akRight, akBottom]
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = 'œ— „ﬁœ«— ›—Ê‘'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
      end
      object spCalc: TSpeedButton
        Left = 150
        Top = 10
        Width = 23
        Height = 18
        Anchors = [akTop, akRight]
        Flat = True
        OnClick = spCalcClick
      end
      object Label14: TLabel
        Left = 403
        Top = 344
        Width = 77
        Height = 20
        Anchors = [akRight, akBottom]
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = 'œ— „ﬁœ«— ›—Ê‘'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
      end
      object Label15: TLabel
        Left = 157
        Top = 371
        Width = 76
        Height = 20
        Anchors = [akRight, akBottom]
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = '„Ì«‰êÌ‰ Œ—Ìœ'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
      end
      object Label13: TLabel
        Left = 160
        Top = 342
        Width = 72
        Height = 20
        Anchors = [akRight, akBottom]
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = '„ÊÃÊœÌ «‰»«—'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
      end
      object FAccNam: TComboBox
        Left = 469
        Top = 9
        Width = 210
        Height = 21
        Anchors = [akTop, akRight]
        BiDiMode = bdRightToLeft
        ItemHeight = 13
        ParentBiDiMode = False
        Sorted = True
        TabOrder = 0
        OnKeyDown = FAccNamKeyDown
        OnKeyPress = NextTab
      end
      object FCentN: TComboBox
        Left = 178
        Top = 9
        Width = 210
        Height = 21
        Anchors = [akTop, akRight]
        BiDiMode = bdRightToLeft
        ItemHeight = 13
        ParentBiDiMode = False
        TabOrder = 1
        OnKeyDown = FCentNKeyDown
        OnKeyPress = NextTab
      end
      object Pdbg: TDBGrid
        Left = 0
        Top = 35
        Width = 751
        Height = 296
        Align = alClient
        DataSource = FeeDs
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 2
        TitleFont.Charset = ARABIC_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = PdbgDrawColumnCell
      end
      object FMFee: TEdit
        Left = 505
        Top = 342
        Width = 121
        Height = 21
        TabStop = False
        Anchors = [akRight, akBottom]
        AutoSelect = False
        AutoSize = False
        ReadOnly = True
        TabOrder = 3
      end
      object FMaxFee: TEdit
        Left = 505
        Top = 371
        Width = 121
        Height = 21
        TabStop = False
        Anchors = [akRight, akBottom]
        AutoSelect = False
        AutoSize = False
        ReadOnly = True
        TabOrder = 5
      end
      object FMinFee: TEdit
        Left = 505
        Top = 398
        Width = 121
        Height = 21
        TabStop = False
        Anchors = [akRight, akBottom]
        AutoSelect = False
        AutoSize = False
        ReadOnly = True
        TabOrder = 7
      end
      object FMaxQt: TEdit
        Left = 279
        Top = 371
        Width = 121
        Height = 21
        TabStop = False
        Anchors = [akRight, akBottom]
        AutoSelect = False
        AutoSize = False
        ReadOnly = True
        TabOrder = 6
      end
      object FMinQt: TEdit
        Left = 279
        Top = 398
        Width = 121
        Height = 21
        TabStop = False
        Anchors = [akRight, akBottom]
        AutoSelect = False
        AutoSize = False
        ReadOnly = True
        TabOrder = 8
      end
      object FTotQt: TEdit
        Left = 279
        Top = 342
        Width = 121
        Height = 21
        TabStop = False
        Anchors = [akRight, akBottom]
        AutoSelect = False
        AutoSize = False
        ReadOnly = True
        TabOrder = 4
      end
      object FMoj: TEdit
        Left = 28
        Top = 340
        Width = 121
        Height = 21
        TabStop = False
        Anchors = [akRight, akBottom]
        AutoSelect = False
        AutoSize = False
        ReadOnly = True
        TabOrder = 9
      end
      object FBFee: TEdit
        Left = 28
        Top = 368
        Width = 121
        Height = 21
        TabStop = False
        Anchors = [akRight, akBottom]
        AutoSelect = False
        AutoSize = False
        ReadOnly = True
        TabOrder = 10
      end
    end
    object TabSheet2: TTabSheet
      Caption = '‰„Êœ«— Â«Ì ‰—Œ'
      ImageIndex = 1
      object Bevel5: TBevel
        Left = 0
        Top = 0
        Width = 751
        Height = 41
        Align = alTop
      end
      object sbPrev: TSpeedButton
        Left = 679
        Top = 9
        Width = 23
        Height = 22
        Hint = '’›ÕÂ ﬁ»·Ì ‰„Êœ«—'
        Anchors = [akTop, akRight]
        ParentShowHint = False
        ShowHint = True
        OnClick = sbPrevClick
      end
      object sbNext: TSpeedButton
        Left = 702
        Top = 9
        Width = 23
        Height = 22
        Hint = '’›ÕÂ »⁄œÌ ‰„Êœ«—'
        Anchors = [akTop, akRight]
        ParentShowHint = False
        ShowHint = True
        OnClick = sbNextClick
      end
      object bPrint: TSpeedButton
        Left = 656
        Top = 9
        Width = 23
        Height = 22
        Hint = 'ç«Å ‰„Êœ«—'
        Anchors = [akTop, akRight]
        ParentShowHint = False
        ShowHint = True
        OnClick = bPrintClick
      end
      object Dbc: TDBChart
        Left = 0
        Top = 41
        Width = 751
        Height = 387
        BackImageMode = pbmTile
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Gradient.EndColor = 14282747
        Gradient.StartColor = 16777088
        LeftWall.Color = clSilver
        MarginBottom = 2
        MarginLeft = 2
        MarginRight = 2
        MarginTop = 5
        PrintProportional = False
        Title.Font.Charset = ARABIC_CHARSET
        Title.Font.Color = clBlue
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Title.Text.Strings = (
          '‰„Êœ«— Ê“‰Ì ﬁÌ„ ')
        BottomAxis.AxisValuesFormat = '##,# '
        BottomAxis.ExactDateTime = False
        BottomAxis.GridCentered = True
        BottomAxis.Increment = 5
        BottomAxis.LabelsAngle = 90
        BottomAxis.LabelStyle = talNone
        BottomAxis.Logarithmic = True
        BottomAxis.TickLength = 5
        BottomAxis.Title.Caption = 'ﬁÌ„  - —Ì«·'
        LeftAxis.AxisValuesFormat = '##,#'
        LeftAxis.LabelStyle = talValue
        LeftAxis.TickLength = 7
        LeftAxis.Title.Caption = '„ﬁœ«—'
        Legend.ColorWidth = 0
        Legend.LegendStyle = lsSeries
        Legend.TopPos = 1
        Legend.Visible = False
        MaxPointsPerPage = 12
        ScaleLastPage = False
        View3D = False
        View3DOptions.Elevation = 338
        View3DOptions.HorizOffset = -13
        View3DOptions.Perspective = 0
        View3DOptions.Rotation = 319
        View3DOptions.VertOffset = 11
        View3DOptions.Zoom = 97
        Align = alClient
        BevelOuter = bvNone
        Color = 14408667
        TabOrder = 1
        object Series3: TBarSeries
          Marks.ArrowLength = 8
          Marks.BackColor = clWhite
          Marks.Style = smsXValue
          Marks.Visible = True
          DataSource = QMFee
          SeriesColor = clGray
          Title = ' Ê“Ì⁄ ‰—Œ'
          BarBrush.Color = clGray
          BarBrush.Style = bsDiagCross
          BarWidthPercent = 20
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          XValues.ValueSource = 'Pfee'
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
          YValues.ValueSource = 'Quant'
          object TeeFunction1: TSubtractTeeFunction
          end
        end
      end
      object MfDbg: TDBGrid
        Left = 100
        Top = 162
        Width = 603
        Height = 45
        DataSource = MFeeDs
        TabOrder = 0
        TitleFont.Charset = ARABIC_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Visible = False
      end
      object UpDown1: TUpDown
        Left = 612
        Top = 10
        Width = 15
        Height = 21
        AlignButton = udLeft
        Anchors = [akTop, akRight]
        Associate = Cnt
        Min = 0
        Position = 50
        TabOrder = 2
        Wrap = False
      end
      object Cnt: TEdit
        Left = 627
        Top = 10
        Width = 25
        Height = 21
        Hint = ' ⁄œ«œ œ— Â— ’›ÕÂ ‰„Êœ«—'
        Anchors = [akTop, akRight]
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        Text = '50'
        OnChange = CntChange
      end
    end
    object TabSheet3: TTabSheet
      Caption = '‰„Êœ«— —‘œ ‰—Œ'
      ImageIndex = 2
      object Bevel6: TBevel
        Left = 0
        Top = 0
        Width = 751
        Height = 41
        Align = alTop
      end
      object DBChart1: TDBChart
        Left = 0
        Top = 41
        Width = 751
        Height = 387
        AnimatedZoom = True
        BackImageMode = pbmTile
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Gradient.EndColor = 14282747
        Gradient.StartColor = 16777088
        LeftWall.Color = clSilver
        MarginBottom = 2
        MarginLeft = 2
        MarginRight = 2
        MarginTop = 5
        PrintProportional = False
        Title.Font.Charset = ARABIC_CHARSET
        Title.Font.Color = clBlue
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Title.Text.Strings = (
          '‰„Êœ«— ﬁÌ„ ')
        BottomAxis.AxisValuesFormat = '##.##'
        BottomAxis.ExactDateTime = False
        BottomAxis.GridCentered = True
        BottomAxis.Increment = 5
        BottomAxis.LabelsAngle = 90
        BottomAxis.LabelsMultiLine = True
        BottomAxis.LabelStyle = talValue
        BottomAxis.Logarithmic = True
        BottomAxis.TickLength = 5
        BottomAxis.Title.Caption = 'ﬁÌ„  - —Ì«·'
        LeftAxis.AxisValuesFormat = '##,#'
        LeftAxis.LabelStyle = talValue
        LeftAxis.TickLength = 7
        LeftAxis.Title.Caption = '„ﬁœ«—'
        Legend.ColorWidth = 0
        Legend.LegendStyle = lsSeries
        Legend.TopPos = 1
        Legend.Visible = False
        MaxPointsPerPage = 20
        View3D = False
        View3DOptions.Elevation = 338
        View3DOptions.HorizOffset = -13
        View3DOptions.Perspective = 0
        View3DOptions.Rotation = 319
        View3DOptions.VertOffset = 11
        View3DOptions.Zoom = 97
        Align = alClient
        BevelOuter = bvNone
        Color = 14408667
        TabOrder = 0
        object BarSeries1: TLineSeries
          Marks.ArrowLength = 8
          Marks.BackColor = clWhite
          Marks.Visible = True
          DataSource = QDFee
          SeriesColor = clBlack
          Title = '—‘œ ‰—Œ'
          ValueFormat = '##,#'
          XLabelsSource = 'Quant'
          Dark3D = False
          LinePen.Width = 2
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = True
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          XValues.ValueSource = 'Dat'
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1
          YValues.Order = loNone
          YValues.ValueSource = 'Fee'
          object SubtractTeeFunction1: TSubtractTeeFunction
          end
        end
        object Series1: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          DataSource = BarSeries1
          SeriesColor = clRed
          LinePen.Width = 3
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1
          YValues.Order = loNone
          object TeeFunction2: TAverageTeeFunction
          end
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = '‰„Êœ«—  Ê“Ì⁄'
      ImageIndex = 3
      object Bevel7: TBevel
        Left = 0
        Top = 0
        Width = 751
        Height = 41
        Align = alTop
      end
      object DBChart2: TDBChart
        Left = 0
        Top = 41
        Width = 751
        Height = 387
        AnimatedZoom = True
        BackImageMode = pbmTile
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Gradient.EndColor = 14282747
        Gradient.StartColor = 16777088
        LeftWall.Color = clSilver
        MarginBottom = 2
        MarginLeft = 2
        MarginRight = 2
        MarginTop = 5
        PrintProportional = False
        Title.Font.Charset = ARABIC_CHARSET
        Title.Font.Color = clBlue
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Title.Text.Strings = (
          '‰„Êœ«—  Ê“Ì⁄')
        BottomAxis.AxisValuesFormat = '##.##'
        BottomAxis.ExactDateTime = False
        BottomAxis.GridCentered = True
        BottomAxis.Increment = 5
        BottomAxis.LabelsAngle = 90
        BottomAxis.LabelsMultiLine = True
        BottomAxis.TickLength = 5
        LeftAxis.AxisValuesFormat = '##,#'
        LeftAxis.LabelStyle = talValue
        LeftAxis.TickLength = 7
        LeftAxis.Title.Caption = '„ﬁœ«—'
        Legend.ColorWidth = 0
        Legend.LegendStyle = lsSeries
        Legend.TopPos = 1
        Legend.Visible = False
        MaxPointsPerPage = 20
        View3D = False
        View3DOptions.Elevation = 338
        View3DOptions.HorizOffset = -13
        View3DOptions.Perspective = 0
        View3DOptions.Rotation = 319
        View3DOptions.VertOffset = 11
        View3DOptions.Zoom = 97
        Align = alClient
        BevelOuter = bvNone
        Color = 14408667
        TabOrder = 0
        object LineSeries1: TBarSeries
          Marks.ArrowLength = 8
          Marks.BackColor = clWhite
          Marks.Style = smsValue
          Marks.Visible = True
          DataSource = Qdis
          SeriesColor = clBlack
          Title = ' Ê“Ì⁄'
          ValueFormat = '##,#'
          XLabelsSource = 'Nam'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
          YValues.ValueSource = 'Quant'
          object SubtractTeeFunction2: TSubtractTeeFunction
          end
        end
      end
      object RG: TRadioGroup
        Left = 466
        Top = 4
        Width = 285
        Height = 31
        Anchors = [akTop, akRight]
        Caption = '»— «”«”'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Õ”«»'
          '„—ò“ Â“Ì‰Â')
        TabOrder = 1
        OnClick = RGClick
      end
    end
  end
  object QFee: TQuery
    DatabaseName = 'ParFro'
    Filter = 'Nam='#39'”—«„Ìò 60◊60 ò—Ì” «· ”›Ìœ òœ 6P001'#39
    Filtered = True
    SQL.Strings = (
      'Select  G.*, I.Nam Acnam , I.Ckod'
      'From Invogood G, Invoice I'
      'Where I.No=G.No'
      '     ')
    Left = 380
    Top = 5
    object QFeeDat: TIntegerField
      DisplayLabel = ' «—ÌŒ'
      DisplayWidth = 12
      FieldName = 'Dat'
      DisplayFormat = '####/##/##'
    end
    object QFeeNo: TIntegerField
      DisplayLabel = '‘„«—Â'
      DisplayWidth = 10
      FieldName = 'No'
    end
    object QFeeAcnam: TStringField
      DisplayLabel = '‰«„ Õ”«»'
      DisplayWidth = 30
      FieldName = 'Acnam'
      Visible = False
      FixedChar = True
      Size = 45
    end
    object QFeeCkod: TIntegerField
      DisplayLabel = '„—ò“'
      DisplayWidth = 30
      FieldName = 'Ckod'
    end
    object QFeeKod: TIntegerField
      DisplayLabel = 'òœ ò«·«'
      DisplayWidth = 11
      FieldName = 'Kod'
      Visible = False
    end
    object QFeeNam: TStringField
      DisplayLabel = '‘—Õ ò«·«'
      DisplayWidth = 54
      FieldName = 'Nam'
      FixedChar = True
      Size = 100
    end
    object QFeeQuant: TFloatField
      DisplayLabel = '„ﬁœ«—'
      DisplayWidth = 12
      FieldName = 'Quant'
    end
    object QFeeUnit: TStringField
      DisplayLabel = 'Ê«Õœ'
      DisplayWidth = 12
      FieldKind = fkLookup
      FieldName = 'Unit'
      LookupDataSet = FroDM.Good
      LookupKeyFields = 'Kod'
      LookupResultField = 'Unit'
      KeyFields = 'Kod'
      LookupCache = True
      FixedChar = True
      Lookup = True
    end
    object QFeePfee: TCurrencyField
      DisplayLabel = '‰—Œ'
      DisplayWidth = 14
      FieldName = 'Pfee'
      DisplayFormat = '##,#'
      Currency = False
    end
    object QFeePerc: TFloatField
      DisplayLabel = 'œ—’œ'
      DisplayWidth = 6
      FieldName = 'Perc'
    end
    object QFeePtotal: TCurrencyField
      DisplayLabel = 'Ã„⁄ ò·'
      DisplayWidth = 22
      FieldName = 'Ptotal'
      DisplayFormat = '##,#'
      Currency = False
    end
  end
  object FeeDs: TDataSource
    DataSet = QFee
    Left = 407
    Top = 5
  end
  object QMFee: TQuery
    DatabaseName = 'ParFro'
    Filter = 'Nam='#39'”—«„Ìò 60◊60 ò—Ì” «· ”›Ìœ òœ 6P001'#39
    Filtered = True
    SQL.Strings = (
      'Select Pfee,Nam,Sum(Quant) As Quant'
      'From InvoGood '
      'Group by Nam,Pfee'
      'order by Nam,Pfee ')
    Left = 461
    Top = 94
    object QMFeeNam: TStringField
      DisplayWidth = 58
      FieldName = 'Nam'
      Origin = 'PARFRO.InvoGood.Nam'
      FixedChar = True
      Size = 100
    end
    object QMFeePfee: TCurrencyField
      DisplayWidth = 12
      FieldName = 'Pfee'
      Origin = 'PARFRO.InvoGood.Pfee'
      DisplayFormat = '##,#'
      Currency = False
    end
    object QMFeeQuant: TFloatField
      DisplayWidth = 7
      FieldName = 'Quant'
      Origin = 'PARFRO.InvoGood.Quant'
    end
  end
  object MFeeDs: TDataSource
    DataSet = QCent
    Left = 489
    Top = 93
  end
  object QDFee: TQuery
    DatabaseName = 'ParFro'
    Filter = 'Fee <> 0 '
    Filtered = True
    SQL.Strings = (
      'Select Dat,Sum(PTotal)/Sum(Quant) as Fee,Sum(Quant)  Quant'
      'From Invogood '
      'Where Kod=:a'
      'Group by Dat'
      'Order by Dat')
    Left = 555
    Top = 92
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'a'
        ParamType = ptUnknown
      end>
    object QDFeeDat: TIntegerField
      DisplayWidth = 12
      FieldName = 'Dat'
      DisplayFormat = '####/##/##'
    end
    object QDFeeFee: TFloatField
      DisplayWidth = 25
      FieldName = 'Fee'
      Precision = 6
    end
    object QDFeeQuant: TFloatField
      FieldName = 'Quant'
    end
  end
  object QCust: TQuery
    DatabaseName = 'ParFro'
    SQL.Strings = (
      'SELECT DISTINCT Invoice.Nam Nam ,Sum( Invogood.Quant)  Quant'
      'FROM Invogood Invogood, Invoice Invoice'
      'WHERE   (Invogood.Nam ='#39'”—«„Ìò 60◊60 ò—Ì” «· ”›Ìœ òœ 6P001'#39')  '
      '   AND  Invogood.No IN '
      '( SELECT i.No'
      'FROM Invoice i'
      'WHERE  i.Nam = Invoice.Nam  ) '
      'And Invoice.No=InvoGood.No'
      'GROUP BY Invoice.Nam'
      'Order By Invoice.Nam')
    Left = 954
    Top = 132
    object QCustNam: TStringField
      FieldName = 'Nam'
      FixedChar = True
      Size = 45
    end
    object QCustQuant: TFloatField
      FieldName = 'Quant'
    end
  end
  object QCent: TQuery
    DatabaseName = 'ParFro'
    SQL.Strings = (
      'SELECT DISTINCT C.Nam Nam ,Sum( Invogood.Quant)  Quant'
      'FROM Invogood Invogood, Cent C'
      'WHERE   (Invogood.Nam ='#39'”—«„Ìò 60◊60 ò—Ì” «· ”›Ìœ òœ 6P001'#39')'
      '   AND  Invogood.No IN'
      '( SELECT i.No FROM Invoice i WHERE  I.ckod = C.kod  '
      'And I.No=InvoGood.No)'
      'GROUP BY C.Nam'
      'Order By Quant Desc'
      ' ')
    Left = 982
    Top = 132
    object StringField1: TStringField
      DisplayWidth = 51
      FieldName = 'Nam'
      FixedChar = True
      Size = 45
    end
    object FloatField1: TFloatField
      DisplayWidth = 12
      FieldName = 'Quant'
    end
  end
  object Qdis: TQuery
    Active = True
    DatabaseName = 'ParFro'
    SQL.Strings = (
      'SELECT DISTINCT C.Nam Nam ,Sum( Invogood.Quant)  Quant'
      'FROM Invogood Invogood, Cent C'
      'WHERE   (Invogood.Nam ='#39'”—«„Ìò 60◊60 ò—Ì” «· ”›Ìœ òœ 6P001'#39')'
      '   AND  Invogood.No IN'
      '( SELECT i.No FROM Invoice i WHERE  I.ckod = C.kod  '
      'And I.No=InvoGood.No)'
      'GROUP BY C.Nam'
      'Order By Quant Desc'
      ' ')
    Left = 1037
    Top = 132
    object StringField2: TStringField
      DisplayWidth = 51
      FieldName = 'Nam'
      FixedChar = True
      Size = 45
    end
    object FloatField2: TFloatField
      DisplayWidth = 12
      FieldName = 'Quant'
    end
  end
end
