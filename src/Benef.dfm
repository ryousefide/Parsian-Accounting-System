object FBenef: TFBenef
  Tag = 1
  Left = 375
  Top = 99
  BorderStyle = bsNone
  Caption = '’Ê—  ”Êœ'
  ClientHeight = 411
  ClientWidth = 737
  Color = clBtnFace
  Font.Charset = ARABIC_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object spCalc: TSpeedButton
    Left = 382
    Top = 7
    Width = 23
    Height = 22
    Anchors = [akTop, akRight]
    Flat = True
    OnClick = spCalcClick
  end
  object spPrint: TSpeedButton
    Left = 359
    Top = 7
    Width = 23
    Height = 22
    Anchors = [akTop, akRight]
    Flat = True
    OnClick = spPrintClick
  end
  object Label2: TLabel
    Left = 6
    Top = 6
    Width = 343
    Height = 24
    Alignment = taRightJustify
    AutoSize = False
    BiDiMode = bdLeftToRight
    ParentBiDiMode = False
  end
  object dbg: TDBGrid
    Left = 0
    Top = 47
    Width = 736
    Height = 364
    Anchors = [akLeft, akTop, akRight, akBottom]
    BiDiMode = bdRightToLeft
    DataSource = DataSource1
    Options = [dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentBiDiMode = False
    TabOrder = 0
    TitleFont.Charset = ARABIC_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object PrgB: TProgressBar
    Left = 1
    Top = 36
    Width = 735
    Height = 10
    Anchors = [akLeft, akTop, akRight]
    Min = 0
    Max = 100
    TabOrder = 1
  end
  object Rg: TRadioGroup
    Left = 501
    Top = 2
    Width = 236
    Height = 33
    Anchors = [akTop, akRight]
    BiDiMode = bdRightToLeft
    Columns = 2
    Items.Strings = (
      '’Ê—  ”Êœ'
      '’Ê—  ”—„«ÌÂ')
    ParentBiDiMode = False
    TabOrder = 2
  end
  object SQu: TQuery
    DatabaseName = 'ParFro'
    SQL.Strings = (
      'SELECT *'
      'FROM Mali'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 124
    Top = 100
    object SQuId: TAutoIncField
      DisplayWidth = 12
      FieldName = 'Id'
      Origin = 'PARFRO.Mali.Id'
      Visible = False
    end
    object SQuBDes: TStringField
      DisplayWidth = 35
      FieldName = 'BDes'
      Origin = 'PARFRO.Mali.BDes'
      FixedChar = True
      Size = 150
    end
    object SQuBed: TCurrencyField
      DisplayWidth = 35
      FieldName = 'Bed'
      Origin = 'PARFRO.Mali.Bed'
    end
    object SQuSDes: TStringField
      DisplayWidth = 35
      FieldName = 'SDes'
      Origin = 'PARFRO.Mali.SDes'
      Visible = False
      FixedChar = True
      Size = 150
    end
    object SQuBes: TCurrencyField
      DisplayWidth = 35
      FieldName = 'Bes'
      Origin = 'PARFRO.Mali.Bes'
    end
  end
  object DataSource1: TDataSource
    DataSet = SQu
    Left = 152
    Top = 101
  end
end
