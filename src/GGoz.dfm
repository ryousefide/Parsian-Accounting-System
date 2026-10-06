object FGGoz: TFGGoz
  Tag = 1
  Left = 336
  Top = 142
  BiDiMode = bdRightToLeft
  BorderStyle = bsSingle
  Caption = 'ê“«—‘  Ê“Ì⁄ ﬂ«·«'
  ClientHeight = 421
  ClientWidth = 485
  Color = clBtnFace
  Font.Charset = ARABIC_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Serif'
  Font.Style = []
  FormStyle = fsMDIChild
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
    Left = 2
    Top = 0
    Width = 484
    Height = 390
    Anchors = [akLeft, akTop, akRight, akBottom]
  end
  object Label1: TLabel
    Left = 450
    Top = 7
    Width = 30
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
    Top = 394
    Width = 485
    Height = 27
    Anchors = [akLeft, akRight, akBottom]
  end
  object Label2: TLabel
    Left = 159
    Top = 7
    Width = 25
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
  object Label5: TLabel
    Left = 156
    Top = 366
    Width = 43
    Height = 18
    Alignment = taCenter
    Anchors = [akLeft, akBottom]
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
    Left = 198
    Top = 5
    Width = 244
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
    Top = 31
    Width = 482
    Height = 330
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
    OnDrawColumnCell = PersDrawColumnCell
    OnKeyDown = PersKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'Nam'
        Title.Alignment = taCenter
        Title.Caption = 'Õ”«»'
        Width = 196
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Ckod'
        Title.Caption = '„—ò“'
        Width = 116
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Quant'
        Title.Alignment = taCenter
        Title.Caption = '„ﬁœ«—'
        Width = 98
        Visible = True
      end>
  end
  object BshowOld: TButton
    Left = 322
    Top = 395
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&‰„«Ì‘'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 7
    Visible = False
    OnClick = BshowOldClick
  end
  object Bexit: TButton
    Left = 408
    Top = 395
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
    TabOrder = 6
    OnClick = BexitClick
  end
  object FColor: TComboBox
    Left = 34
    Top = 5
    Width = 120
    Height = 21
    Anchors = [akTop, akRight]
    ItemHeight = 13
    Sorted = True
    TabOrder = 1
    OnKeyPress = NextTab
  end
  object FKol: TEdit
    Left = 24
    Top = 364
    Width = 122
    Height = 21
    Anchors = [akLeft, akBottom]
    Constraints.MaxHeight = 26
    ReadOnly = True
    TabOrder = 3
    OnKeyPress = NextTab
  end
  object Bprint: TButton
    Left = 158
    Top = 395
    Width = 160
    Height = 25
    Anchors = [akLeft, akRight, akBottom]
    Caption = '&ç«Å'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 5
    OnClick = BprintClick
  end
  object BShow: TButton
    Left = 1
    Top = 395
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '‰„«Ì‘'
    TabOrder = 4
    OnClick = BShowClick
  end
  object Query1: TQuery
    DatabaseName = 'ParFro'
    SQL.Strings = (
      
        'SELECT DISTINCT Invoice.Nam Nam ,Invoice.Ckod,Sum( Invogood.Quan' +
        't)  Quant'
      'FROM Invogood Invogood, Invoice Invoice'
      'WHERE   (Invogood.Nam = :FNam)  '
      '   AND  Invogood.No IN '
      '( SELECT i.No'
      'FROM Invoice i'
      'WHERE  i.Nam = Invoice.Nam  ) '
      'And Invoice.No=InvoGood.No'
      'GROUP BY Invoice.Nam,Invoice.Ckod'
      'Order By Invoice.Nam')
    Left = 108
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
    Left = 80
    Top = 96
  end
end
