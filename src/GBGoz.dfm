object FGBGoz: TFGBGoz
  Tag = 1
  Left = 124
  Top = 61
  BiDiMode = bdRightToLeft
  BorderStyle = bsSingle
  Caption = ' ê“«—‘ Œ—Ìœ ﬂ«·«'
  ClientHeight = 418
  ClientWidth = 400
  Color = clBtnFace
  Font.Charset = ARABIC_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  HelpFile = 'ParFro'
  KeyPreview = True
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 400
    Height = 387
    Anchors = [akLeft, akTop, akRight, akBottom]
  end
  object Label1: TLabel
    Left = 371
    Top = 5
    Width = 25
    Height = 18
    Anchors = [akTop, akRight]
    AutoSize = False
    Caption = ' ﬂ«·«'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel2: TBevel
    Left = 0
    Top = 391
    Width = 400
    Height = 27
    Anchors = [akLeft, akRight, akBottom]
  end
  object Label2: TLabel
    Left = 124
    Top = 5
    Width = 28
    Height = 18
    Anchors = [akTop, akRight]
    AutoSize = False
    Caption = '„œ·'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 353
    Top = 362
    Width = 34
    Height = 18
    Alignment = taCenter
    Anchors = [akRight, akBottom]
    AutoSize = False
    Caption = 'Ã„⁄'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 220
    Top = 362
    Width = 39
    Height = 18
    Alignment = taCenter
    Anchors = [akRight, akBottom]
    AutoSize = False
    Caption = '„ ›—ﬁÂ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 86
    Top = 362
    Width = 43
    Height = 18
    Alignment = taCenter
    Anchors = [akRight, akBottom]
    AutoSize = False
    Caption = 'Ã„⁄ ﬂ·'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object GNam: TComboBox
    Left = 158
    Top = 3
    Width = 206
    Height = 21
    Anchors = [akTop, akRight]
    ItemHeight = 13
    Sorted = True
    TabOrder = 0
    OnDragDrop = GNamDragDrop
    OnDragOver = GNamDragOver
    OnDropDown = GNamDropDown
    OnKeyDown = GNamKeyDown
    OnKeyPress = NextTab
  end
  object Pers: TDBGrid
    Left = 1
    Top = 30
    Width = 397
    Height = 329
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = Ds
    FixedColor = clTeal
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = ARABIC_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Mitra'
    TitleFont.Style = [fsBold]
    OnKeyDown = PersKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'Nam'
        Title.Alignment = taCenter
        Title.Caption = '›—Ê‘‰œÂ'
        Width = 202
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Quant'
        Title.Alignment = taCenter
        Title.Caption = '„ﬁœ«—'
        Width = 83
        Visible = True
      end>
  end
  object BshowOld: TButton
    Left = 235
    Top = 392
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&‰„«Ì‘'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 9
    Visible = False
    OnClick = BshowOldClick
  end
  object Bexit: TButton
    Left = 324
    Top = 392
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Œ—ÊÃ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 8
    OnClick = BexitClick
  end
  object FColor: TComboBox
    Left = 7
    Top = 3
    Width = 110
    Height = 21
    Anchors = [akTop, akRight]
    ItemHeight = 13
    Sorted = True
    TabOrder = 1
    OnKeyPress = NextTab
  end
  object FSum: TEdit
    Left = 270
    Top = 361
    Width = 75
    Height = 21
    Anchors = [akRight, akBottom]
    Constraints.MaxHeight = 26
    ReadOnly = True
    TabOrder = 3
    OnKeyPress = NextTab
  end
  object FSum2: TEdit
    Left = 136
    Top = 361
    Width = 75
    Height = 21
    Anchors = [akRight, akBottom]
    Constraints.MaxHeight = 26
    ReadOnly = True
    TabOrder = 4
    OnKeyPress = NextTab
  end
  object FKol: TEdit
    Left = 8
    Top = 361
    Width = 69
    Height = 21
    Anchors = [akRight, akBottom]
    Constraints.MaxHeight = 26
    ReadOnly = True
    TabOrder = 5
    OnKeyPress = NextTab
  end
  object Bprint: TButton
    Left = 154
    Top = 392
    Width = 75
    Height = 25
    Anchors = [akLeft, akRight, akBottom]
    Caption = '&ç«Å'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 7
    OnClick = BprintClick
  end
  object BShow: TButton
    Left = 0
    Top = 392
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '‰„«Ì‘'
    TabOrder = 6
    OnClick = BShowClick
  end
  object Query1: TQuery
    DatabaseName = 'ParFro'
    SQL.Strings = (
      'SELECT DISTINCT Invoice.Nam Nam ,Sum( Invogood.Quant)  Quant'
      'FROM Binvogood Invogood, Bvoice Invoice'
      'WHERE   (Invogood.Nam = :FNam)  '
      '   AND  Invogood.No IN '
      '( SELECT i.No'
      'FROM Bvoice i'
      'WHERE  i.Nam = Invoice.Nam  ) '
      'And Invoice.No=InvoGood.No'
      'GROUP BY Invoice.Nam'
      'Order By Invoice.Nam')
    Left = 110
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FNam'
        ParamType = ptUnknown
      end>
  end
  object Ds: TDataSource
    DataSet = Query1
    Left = 79
    Top = 94
  end
end
