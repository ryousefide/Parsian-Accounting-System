object FGAmar: TFGAmar
  Tag = 1
  Left = 376
  Top = 68
  BiDiMode = bdRightToLeft
  BorderStyle = bsNone
  BorderWidth = 3
  Caption = 'ê“«—‘ ⁄œœÌ Ê „»·€Ì «Ã‰«”'
  ClientHeight = 535
  ClientWidth = 432
  Color = clBtnFace
  Font.Charset = ARABIC_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Serif'
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
    Width = 432
    Height = 535
    Align = alClient
  end
  object Label2: TLabel
    Left = 373
    Top = 8
    Width = 53
    Height = 18
    Anchors = [akTop, akRight]
    AutoSize = False
    Caption = '«“  «—ÌŒ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 183
    Top = 8
    Width = 53
    Height = 18
    Anchors = [akTop, akRight]
    AutoSize = False
    Caption = ' «  «—ÌŒ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Rg: TRadioGroup
    Left = 0
    Top = 32
    Width = 431
    Height = 35
    Anchors = [akLeft, akTop, akRight]
    Columns = 4
    Items.Strings = (
      '›—Ê‘'
      'Œ—Ìœ'
      '„—ÃÊ⁄Ì ›—Ê‘'
      '„—ÃÊ⁄Ì Œ—Ìœ')
    TabOrder = 2
    OnClick = RgClick
  end
  object dbg: TDBGrid
    Left = 2
    Top = 68
    Width = 428
    Height = 407
    TabStop = False
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DataSource1
    TabOrder = 4
    TitleFont.Charset = ARABIC_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Nam'
        Title.Alignment = taCenter
        Title.Caption = '‘—Õ'
        Width = 186
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Quant'
        Title.Alignment = taCenter
        Title.Caption = ' ⁄œ«œ'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Price'
        Title.Alignment = taCenter
        Title.Caption = 'Ã„⁄ ›—Ê‘'
        Width = 133
        Visible = True
      end>
  end
  object SDat: TMaskEdit
    Left = 296
    Top = 6
    Width = 75
    Height = 21
    Anchors = [akTop, akRight]
    AutoSize = False
    BiDiMode = bdRightToLeft
    Constraints.MaxHeight = 26
    EditMask = '1300/00/00;1;_'
    MaxLength = 10
    ParentBiDiMode = False
    TabOrder = 0
    Text = '13  /  /  '
    OnEnter = SDatEnter
    OnExit = SDatExit
    OnKeyPress = NextTab
  end
  object EDat: TMaskEdit
    Left = 101
    Top = 6
    Width = 75
    Height = 21
    Anchors = [akTop, akRight]
    AutoSize = False
    BiDiMode = bdRightToLeft
    Constraints.MaxHeight = 26
    EditMask = '1300/00/00;1;_'
    MaxLength = 10
    ParentBiDiMode = False
    TabOrder = 1
    Text = '13  /  /  '
    OnEnter = EDatEnter
    OnExit = EDatExit
    OnKeyPress = NextTab
  end
  object Bexit: TButton
    Left = 179
    Top = 508
    Width = 75
    Height = 25
    Anchors = [akLeft, akRight, akBottom]
    Cancel = True
    Caption = 'Œ—ÊÃ'
    TabOrder = 5
    OnClick = BexitClick
  end
  object FSum: TEdit
    Left = 2
    Top = 477
    Width = 244
    Height = 21
    Anchors = [akLeft, akBottom]
    TabOrder = 6
  end
  object FQuant: TEdit
    Left = 305
    Top = 477
    Width = 121
    Height = 21
    Anchors = [akRight, akBottom]
    TabOrder = 7
  end
  object BShow: TButton
    Left = 123
    Top = 435
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '‰„«Ì‘'
    TabOrder = 3
    Visible = False
    OnClick = BShowClick
  end
  object DQu: TQuery
    DatabaseName = 'ParFro'
    SQL.Strings = (
      'SELECT Nam, SUM( Quant ) Quant, SUM( Ptotal ) Price'
      'FROM InvoGood'
      'Where Dat Between :Dat1 and :Dat2'
      'GROUP BY Nam, Nam'
      'ORDER BY 2 Desc')
    Left = 240
    Top = 98
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Dat1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Dat2'
        ParamType = ptUnknown
      end>
  end
  object DataSource1: TDataSource
    DataSet = DQu
    Left = 283
    Top = 109
  end
end
