object FGDiag: TFGDiag
  Left = 295
  Top = 109
  BiDiMode = bdLeftToRight
  BorderStyle = bsSingle
  Caption = '‰„Êœ«— ﬂ«—œﬂ” ⁄œœÌ ﬂ«·«'
  ClientHeight = 462
  ClientWidth = 864
  Color = clBtnFace
  Font.Charset = ARABIC_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poDefaultSizeOnly
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 576
    Height = 336
  end
  object Dch1: TDBChart
    Left = 0
    Top = 2
    Width = 864
    Height = 421
    AnimatedZoom = True
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    BackWall.Color = clAqua
    BackWall.Size = 1
    BottomWall.Brush.Color = clWhite
    BottomWall.Brush.Style = bsClear
    BottomWall.Color = 4194368
    BottomWall.Size = 14
    Foot.Font.Charset = ARABIC_CHARSET
    Foot.Font.Color = clBlack
    Foot.Font.Height = -11
    Foot.Font.Name = 'Mitra'
    Foot.Font.Style = [fsBold, fsItalic]
    Gradient.EndColor = 16777088
    Gradient.StartColor = clBlack
    LeftWall.Brush.Color = clWhite
    LeftWall.Brush.Style = bsClear
    MarginBottom = 3
    MarginLeft = 0
    MarginTop = 3
    PrintProportional = False
    Title.AdjustFrame = False
    Title.Font.Charset = ARABIC_CHARSET
    Title.Font.Color = clBlack
    Title.Font.Height = -13
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold, fsItalic]
    Title.Text.Strings = (
      '')
    Title.Visible = False
    BackColor = clAqua
    BottomAxis.AxisValuesFormat = '—Ê“####/##/##'
    BottomAxis.ExactDateTime = False
    BottomAxis.Increment = 1
    BottomAxis.LabelsFont.Charset = ARABIC_CHARSET
    BottomAxis.LabelsFont.Color = clBlack
    BottomAxis.LabelsFont.Height = -11
    BottomAxis.LabelsFont.Name = 'Tahoma'
    BottomAxis.LabelsFont.Style = []
    BottomAxis.TickLength = 5
    BottomAxis.Title.Font.Charset = ARABIC_CHARSET
    BottomAxis.Title.Font.Color = clBlack
    BottomAxis.Title.Font.Height = -11
    BottomAxis.Title.Font.Name = 'Tahoma'
    BottomAxis.Title.Font.Style = []
    Chart3DPercent = 40
    LeftAxis.Grid.Color = 8454143
    LeftAxis.LabelsFont.Charset = ARABIC_CHARSET
    LeftAxis.LabelsFont.Color = clYellow
    LeftAxis.LabelsFont.Height = -11
    LeftAxis.LabelsFont.Name = 'Arial'
    LeftAxis.LabelsFont.Style = []
    LeftAxis.MinorTicks.Color = 8454143
    Legend.Font.Charset = ARABIC_CHARSET
    Legend.Font.Color = clBlack
    Legend.Font.Height = -12
    Legend.Font.Name = 'Mitra'
    Legend.Font.Style = [fsItalic]
    Legend.Visible = False
    MaxPointsPerPage = 45
    RightAxis.Title.Font.Charset = ARABIC_CHARSET
    RightAxis.Title.Font.Color = clBlack
    RightAxis.Title.Font.Height = -11
    RightAxis.Title.Font.Name = 'Mitra'
    RightAxis.Title.Font.Style = []
    RightAxis.Visible = False
    TopAxis.Title.Font.Charset = ARABIC_CHARSET
    TopAxis.Title.Font.Color = clBlack
    TopAxis.Title.Font.Height = -11
    TopAxis.Title.Font.Name = 'Mitra'
    TopAxis.Title.Font.Style = []
    TopAxis.Visible = False
    View3D = False
    View3DOptions.Elevation = 314
    View3DOptions.HorizOffset = 48
    View3DOptions.Orthogonal = False
    View3DOptions.Perspective = 0
    View3DOptions.Rotation = 331
    View3DOptions.VertOffset = 48
    View3DOptions.Zoom = 81
    View3DOptions.ZoomText = False
    BevelOuter = bvNone
    BorderWidth = 1
    Color = clSilver
    TabOrder = 0
    Anchors = [akLeft, akTop, akRight, akBottom]
    OnDblClick = Dch1DblClick
    object Series1: TLineSeries
      Marks.ArrowLength = 20
      Marks.BackColor = clWhite
      Marks.Font.Charset = ARABIC_CHARSET
      Marks.Font.Color = clBlack
      Marks.Font.Height = -11
      Marks.Font.Name = 'Tahoma'
      Marks.Font.Style = [fsItalic]
      Marks.Visible = True
      DataSource = FroDM.Cardex
      SeriesColor = 4194368
      VertAxis = aBothVertAxis
      XLabelsSource = 'Dat'
      Pointer.HorizSize = 3
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.VertSize = 3
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
      YValues.ValueSource = 'Diag'
      object TeeFunction1: THighTeeFunction
      end
    end
  end
  object Bprint: TButton
    Left = 1
    Top = 423
    Width = 91
    Height = 38
    Anchors = [akLeft, akBottom]
    Caption = 'ç«Å'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 1
    OnClick = BprintClick
  end
  object Bexit: TButton
    Left = 771
    Top = 423
    Width = 92
    Height = 38
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Œ—ÊÃ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 2
    OnClick = BexitClick
  end
  object Panel1: TPanel
    Tag = 1
    Left = 91
    Top = 423
    Width = 680
    Height = 38
    Anchors = [akLeft, akRight, akBottom]
    PopupMenu = PopupMenu1
    TabOrder = 3
    object sc3D: TScrollBar
      Left = 206
      Top = 4
      Width = 100
      Height = 13
      Hint = ' €ÌÌ— ⁄„ﬁ'
      BiDiMode = bdLeftToRight
      Min = 1
      PageSize = 0
      ParentBiDiMode = False
      ParentShowHint = False
      Position = 44
      ShowHint = True
      TabOrder = 2
      OnChange = sc3DChange
    end
    object cb3D: TCheckBox
      Left = 608
      Top = 3
      Width = 67
      Height = 17
      Anchors = [akTop, akRight]
      BiDiMode = bdRightToLeft
      Caption = '”Â »⁄œÌ'
      ParentBiDiMode = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = cb3DClick
    end
    object scZoom: TScrollBar
      Left = 206
      Top = 21
      Width = 100
      Height = 13
      Hint = '»“—ê‰„«ÌÌ'
      Max = 300
      Min = 1
      PageSize = 0
      ParentShowHint = False
      Position = 100
      ShowHint = True
      TabOrder = 3
      OnChange = scZoomChange
    end
    object scEle: TScrollBar
      Left = 103
      Top = 4
      Width = 100
      Height = 13
      Hint = '‰”» '
      LargeChange = 5
      Max = 180
      PageSize = 0
      ParentShowHint = False
      Position = 45
      ShowHint = True
      TabOrder = 4
      OnChange = scEleChange
    end
    object scRotation: TScrollBar
      Left = 103
      Top = 21
      Width = 100
      Height = 13
      Hint = 'ç—Œ‘'
      LargeChange = 10
      Max = 365
      Min = -365
      PageSize = 0
      ParentShowHint = False
      Position = 45
      ShowHint = True
      TabOrder = 5
      OnChange = scRotationChange
    end
    object cbOrtog: TCheckBox
      Left = 631
      Top = 19
      Width = 44
      Height = 17
      Anchors = [akTop, akRight]
      BiDiMode = bdRightToLeft
      Caption = 'À«» '
      ParentBiDiMode = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = cbOrtogClick
    end
    object scVOf: TScrollBar
      Left = 3
      Top = 4
      Width = 100
      Height = 13
      LargeChange = 10
      Max = 1500
      Min = -1500
      PageSize = 0
      TabOrder = 6
      OnChange = scVOfChange
    end
    object scHof: TScrollBar
      Left = 3
      Top = 21
      Width = 100
      Height = 13
      LargeChange = 10
      Max = 1500
      Min = -1500
      PageSize = 0
      TabOrder = 7
      OnChange = scHofChange
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 12
    Top = 257
    object N801: TMenuItem
      Caption = '10%'
      OnClick = N801Click
    end
    object N1001: TMenuItem
      Caption = '25%'
      OnClick = N1001Click
    end
    object N1201: TMenuItem
      Caption = '-25%'
      OnClick = N1201Click
    end
    object N1401: TMenuItem
      Caption = '-10%'
      OnClick = N1401Click
    end
  end
end
