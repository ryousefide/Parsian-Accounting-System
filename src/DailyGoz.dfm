object FDaily: TFDaily
  Left = 15
  Top = 84
  AutoSize = True
  BiDiMode = bdRightToLeft
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = '⁄„·ﬂ—œ —Ê“«‰Â'
  ClientHeight = 310
  ClientWidth = 593
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
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 503
    Top = 7
    Width = 77
    Height = 21
    AutoSize = False
    Caption = '⁄„·ﬂ—œ œ—  «—ÌŒ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentFont = False
    Layout = tlCenter
  end
  object Label2: TLabel
    Left = 215
    Top = 7
    Width = 77
    Height = 21
    AutoSize = False
    Caption = '⁄„·ﬂ—œ ’‰œÊﬁ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentFont = False
    Layout = tlCenter
  end
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 593
    Height = 279
  end
  object Bevel2: TBevel
    Left = 0
    Top = 283
    Width = 593
    Height = 27
  end
  object dbgRch: TDBGrid
    Left = 297
    Top = 36
    Width = 295
    Height = 120
    Hint = '·Ì”  çﬂ Â«Ì œ—Ì«›  ‘œÂ'
    TabStop = False
    DataSource = RDs
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 1
    TitleFont.Charset = ARABIC_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Serif'
    TitleFont.Style = []
    OnKeyPress = dbgRchKeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'BDat'
        Title.Alignment = taCenter
        Title.Caption = ' «—ÌŒ çﬂ'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BNo'
        Title.Alignment = taCenter
        Title.Caption = '”—Ì«· çﬂ'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PBill'
        Title.Alignment = taCenter
        Title.Caption = '„»·€ çﬂ'
        Width = 101
        Visible = True
      end>
  end
  object dbgPch: TDBGrid
    Left = 1
    Top = 36
    Width = 292
    Height = 120
    Hint = '·Ì”  çﬂ Â«Ì Å—œ«Œ  ‘œÂ'
    TabStop = False
    DataSource = Pds
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 2
    TitleFont.Charset = ARABIC_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Serif'
    TitleFont.Style = []
    OnKeyPress = dbgPchKeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'BDat'
        Title.Alignment = taCenter
        Title.Caption = ' «—ÌŒ çﬂ'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BNo'
        Title.Alignment = taCenter
        Title.Caption = '”—Ì«· çﬂ'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PBill'
        Title.Alignment = taCenter
        Title.Caption = '„»·€ çﬂ'
        Width = 93
        Visible = True
      end>
  end
  object dbgBinvo: TDBGrid
    Left = 297
    Top = 159
    Width = 295
    Height = 120
    Hint = '·Ì”  «Ã‰«” Œ—Ìœ«—Ì ‘œÂ'
    TabStop = False
    DataSource = BDs
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 3
    TitleFont.Charset = ARABIC_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Serif'
    TitleFont.Style = []
    OnKeyPress = dbgBinvoKeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'No'
        Title.Alignment = taCenter
        Title.Caption = '›«ﬂ Ê—'
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nam'
        Title.Alignment = taCenter
        Title.Caption = '‘—Õ ﬂ«·«'
        Width = 163
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Quant'
        Title.Alignment = taCenter
        Title.Caption = ' ⁄œ«œ'
        Width = 45
        Visible = True
      end>
  end
  object dbgInvo: TDBGrid
    Left = 0
    Top = 160
    Width = 293
    Height = 120
    Hint = '·Ì”  «Ã‰«” ›—ÊŒ Â ‘œÂ'
    TabStop = False
    DataSource = IDs
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 4
    TitleFont.Charset = ARABIC_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Serif'
    TitleFont.Style = []
    OnKeyPress = dbgInvoKeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'No'
        Title.Alignment = taCenter
        Title.Caption = '›«ﬂ Ê—'
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nam'
        Title.Alignment = taCenter
        Title.Caption = '‘—Õ ﬂ«·«'
        Width = 158
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Quant'
        Title.Alignment = taCenter
        Title.Caption = ' ⁄œ«œ'
        Width = 46
        Visible = True
      end>
  end
  object SDat: TMaskEdit
    Left = 422
    Top = 7
    Width = 75
    Height = 21
    AutoSize = False
    BiDiMode = bdRightToLeft
    Constraints.MaxHeight = 21
    EditMask = '1300/00/00;1;_'
    MaxLength = 10
    ParentBiDiMode = False
    TabOrder = 0
    Text = '13  /  /  '
    OnEnter = SDatEnter
    OnExit = SDatExit
    OnKeyPress = NextTab
  end
  object Bshow: TButton
    Left = 12
    Top = 284
    Width = 75
    Height = 25
    Caption = '‰„«Ì‘'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 5
    OnClick = BshowClick
  end
  object Bexit: TButton
    Left = 508
    Top = 284
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Œ—ÊÃ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 6
    OnClick = BexitClick
  end
  object FCash: TEdit
    Left = 49
    Top = 6
    Width = 161
    Height = 21
    TabOrder = 7
    OnKeyPress = NextTab
  end
  object RQu: TQuery
    DatabaseName = 'ParFro'
    SQL.Strings = (
      'Select BDat,BNo,PBill'
      'From Rcheq'
      'Where')
    Left = 330
    Top = 76
    object RQuBDat: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'BDat'
      DisplayFormat = '0000/00/00'
    end
    object RQuBNo: TStringField
      Alignment = taRightJustify
      FieldName = 'BNo'
    end
    object RQuPBill: TCurrencyField
      Alignment = taLeftJustify
      FieldName = 'PBill'
    end
  end
  object RDs: TDataSource
    AutoEdit = False
    DataSet = RQu
    Left = 378
    Top = 78
  end
  object PQu: TQuery
    DatabaseName = 'ParFro'
    SQL.Strings = (
      'Select BDat,BNo,PBill'
      'From Pcheq'
      'Where')
    Left = 110
    Top = 78
    object PQuBDat: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'BDat'
      DisplayFormat = '0000/00/00'
    end
    object PQuBNo: TStringField
      Alignment = taRightJustify
      FieldName = 'BNo'
    end
    object PQuPBill: TCurrencyField
      Alignment = taLeftJustify
      FieldName = 'PBill'
    end
  end
  object Pds: TDataSource
    DataSet = PQu
    Left = 192
    Top = 82
  end
  object BQu: TQuery
    SQL.Strings = (
      'Select B.No,B.Nam,B.Quant'
      'From BinvoGood B'
      'Where')
    Left = 372
    Top = 194
  end
  object BDs: TDataSource
    AutoEdit = False
    DataSet = BQu
    Left = 425
    Top = 203
  end
  object IQu: TQuery
    SQL.Strings = (
      'Select B.No,B.Nam,B.Quant'
      'From InvoGood B'
      'Where')
    Left = 92
    Top = 197
  end
  object IDs: TDataSource
    AutoEdit = False
    DataSet = IQu
    Left = 184
    Top = 206
  end
end
