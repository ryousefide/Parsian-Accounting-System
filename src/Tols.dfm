object FTols: TFTols
  Tag = 1
  Left = 144
  Top = 279
  BorderStyle = bsNone
  Caption = 'ê“«—‘  ﬁÌ„   „«„ ‘œÂ  „Õ’Ê·« '
  ClientHeight = 411
  ClientWidth = 688
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
  object Label1: TLabel
    Left = 603
    Top = 10
    Width = 58
    Height = 18
    Anchors = [akTop, akRight]
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = ' «“  «—ÌŒ '
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
    Left = 459
    Top = 11
    Width = 44
    Height = 16
    Anchors = [akTop, akRight]
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
    Layout = tlCenter
  end
  object Label3: TLabel
    Left = 199
    Top = 10
    Width = 58
    Height = 18
    Anchors = [akTop, akRight]
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = ' Œ—Ìœ«—'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    Layout = tlCenter
    Visible = False
  end
  object spCalc: TSpeedButton
    Left = 341
    Top = 9
    Width = 23
    Height = 22
    Anchors = [akTop, akRight]
    Flat = True
    OnClick = spCalcClick
  end
  object spPrint: TSpeedButton
    Left = 318
    Top = 9
    Width = 23
    Height = 22
    Anchors = [akTop, akRight]
    Flat = True
    OnClick = spPrintClick
  end
  object Dat1: TMaskEdit
    Left = 511
    Top = 9
    Width = 86
    Height = 21
    Hint = ' «—ÌŒ ”——”Ìœ çﬂ'
    Anchors = [akTop, akRight]
    BiDiMode = bdRightToLeft
    Constraints.MaxHeight = 21
    EditMask = '1300/00/00;1;_'
    MaxLength = 10
    ParentBiDiMode = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    Text = '13  /  /  '
    OnEnter = Dat1Enter
    OnExit = Dat1Exit
    OnKeyPress = NextTab
  end
  object Dat2: TMaskEdit
    Left = 370
    Top = 9
    Width = 84
    Height = 21
    Anchors = [akTop, akRight]
    BiDiMode = bdRightToLeft
    Constraints.MaxHeight = 21
    EditMask = '1300/00/00;1;_'
    MaxLength = 10
    ParentBiDiMode = False
    TabOrder = 1
    Text = '13  /  /  '
    OnEnter = Dat2Enter
    OnExit = Dat2Exit
    OnKeyPress = NextTab
  end
  object FAccNam: TComboBox
    Left = 27
    Top = 8
    Width = 162
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    BiDiMode = bdRightToLeft
    ItemHeight = 13
    ParentBiDiMode = False
    Sorted = True
    TabOrder = 2
    Visible = False
    OnKeyPress = NextTab
  end
  object DBGrid1: TDBGrid
    Left = 3
    Top = 40
    Width = 682
    Height = 357
    Anchors = [akLeft, akTop, akRight, akBottom]
    BiDiMode = bdRightToLeft
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentBiDiMode = False
    TabOrder = 3
    TitleFont.Charset = ARABIC_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object SQu: TQuery
    DatabaseName = 'ParFro'
    SQL.Strings = (
      
        'SELECT G.Nam GNam,G.Pfee,G.Quant,G.Ptotal,G.Perc,-1*G.No,G.Dat,G' +
        '.Bfee,G.Pay'
      'FROM Binvogood  G'
      'Order by G.Dat,7'
      ' '
      ' '
      ' '
      ' ')
    Left = 124
    Top = 102
    object SQuDat: TIntegerField
      DisplayLabel = ' «—ÌŒ'
      DisplayWidth = 10
      FieldName = 'Dat'
      DisplayFormat = '####/##/##'
    end
    object SQuF: TIntegerField
      DisplayLabel = '›«ò Ê—'
      FieldName = 'F'
    end
    object SQuGNam: TStringField
      DisplayLabel = '‘—Õ ò«·«'
      DisplayWidth = 30
      FieldName = 'GNam'
      Size = 100
    end
    object SQuQuant: TFloatField
      DisplayLabel = '„ﬁœ«—'
      DisplayWidth = 15
      FieldName = 'Quant'
    end
    object SQuPfee: TCurrencyField
      DisplayLabel = 'ﬁÌ„   „«„ ‘œÂ'
      DisplayWidth = 10
      FieldName = 'Pfee'
    end
    object SQuPtotal: TCurrencyField
      DisplayLabel = '»Â«Ì ò·'
      DisplayWidth = 15
      FieldName = 'Ptotal'
    end
  end
  object DataSource1: TDataSource
    DataSet = SQu
    Left = 154
    Top = 101
  end
end
