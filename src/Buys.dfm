object FBuys: TFBuys
  Tag = 1
  Left = 187
  Top = 204
  BorderStyle = bsNone
  Caption = 'ê“«—‘  Œ—Ìœ Ê ﬁÌ„   „«„ ‘œÂ  Œ—Ìœ'
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
    Left = 605
    Top = 40
    Width = 58
    Height = 18
    Anchors = [akTop, akRight]
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '›—Ê‘‰œÂ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    Layout = tlCenter
  end
  object spCalc: TSpeedButton
    Left = 343
    Top = 39
    Width = 23
    Height = 22
    Flat = True
    OnClick = spCalcClick
  end
  object spPrint: TSpeedButton
    Left = 320
    Top = 39
    Width = 23
    Height = 22
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
    Left = 369
    Top = 38
    Width = 229
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    BiDiMode = bdRightToLeft
    ItemHeight = 13
    ParentBiDiMode = False
    Sorted = True
    TabOrder = 2
    OnKeyPress = NextTab
  end
  object DBGrid1: TDBGrid
    Left = 3
    Top = 68
    Width = 682
    Height = 341
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
  object Panel1: TPanel
    Left = 10
    Top = 172
    Width = 688
    Height = 95
    Caption = 'Panel1'
    TabOrder = 4
    Visible = False
    object Label4: TLabel
      Left = 140
      Top = 8
      Width = 70
      Height = 18
      Anchors = [akRight, akBottom]
      AutoSize = False
      BiDiMode = bdRightToLeft
      Caption = 'Ã„⁄ ›«ò Ê—Â«'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      Layout = tlCenter
    end
    object Label5: TLabel
      Left = 140
      Top = 36
      Width = 70
      Height = 18
      Anchors = [akRight, akBottom]
      AutoSize = False
      BiDiMode = bdRightToLeft
      Caption = 'Ã„⁄« »„»·€'
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
      Left = 140
      Top = 73
      Width = 70
      Height = 18
      Anchors = [akRight, akBottom]
      AutoSize = False
      BiDiMode = bdRightToLeft
      Caption = '„«‰œÂ'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      Layout = tlCenter
    end
    object Label7: TLabel
      Left = 267
      Top = 14
      Width = 100
      Height = 18
      Anchors = [akRight, akBottom]
      AutoSize = False
      BiDiMode = bdRightToLeft
      Caption = 'œ—Ì«› Ì Â«Ì ”‰œÌ'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      Layout = tlCenter
    end
    object Label8: TLabel
      Left = 435
      Top = 14
      Width = 86
      Height = 18
      Anchors = [akRight, akBottom]
      AutoSize = False
      BiDiMode = bdRightToLeft
      Caption = 'œ—Ì«› Ì Â«Ì ‰ﬁœ'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      Layout = tlCenter
    end
    object Label9: TLabel
      Left = 595
      Top = 14
      Width = 86
      Height = 18
      Anchors = [akRight, akBottom]
      AutoSize = False
      BiDiMode = bdRightToLeft
      Caption = 'œ—Ì«› Ì Â«Ì »«‰òÌ'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      Layout = tlCenter
    end
    object FFac: TEdit
      Left = 10
      Top = 6
      Width = 121
      Height = 21
      TabStop = False
      Anchors = [akRight, akBottom]
      AutoSize = False
      BiDiMode = bdRightToLeftNoAlign
      ParentBiDiMode = False
      ReadOnly = True
      TabOrder = 0
    end
    object FSum: TEdit
      Left = 10
      Top = 35
      Width = 121
      Height = 21
      TabStop = False
      Anchors = [akRight, akBottom]
      AutoSize = False
      BiDiMode = bdRightToLeftNoAlign
      ParentBiDiMode = False
      ReadOnly = True
      TabOrder = 1
    end
    object FRem: TEdit
      Tag = 1
      Left = 10
      Top = 70
      Width = 121
      Height = 21
      TabStop = False
      Anchors = [akRight, akBottom]
      AutoSize = False
      BiDiMode = bdRightToLeftNoAlign
      Color = 12963836
      ParentBiDiMode = False
      ReadOnly = True
      TabOrder = 2
    end
    object Fcheq: TEdit
      Left = 217
      Top = 35
      Width = 150
      Height = 21
      TabStop = False
      Anchors = [akRight, akBottom]
      AutoSize = False
      BiDiMode = bdRightToLeftNoAlign
      ParentBiDiMode = False
      ReadOnly = True
      TabOrder = 3
    end
    object FCash: TEdit
      Left = 381
      Top = 35
      Width = 143
      Height = 21
      TabStop = False
      Anchors = [akRight, akBottom]
      AutoSize = False
      BiDiMode = bdRightToLeftNoAlign
      ParentBiDiMode = False
      ReadOnly = True
      TabOrder = 4
    end
    object Fbank: TEdit
      Left = 536
      Top = 35
      Width = 146
      Height = 21
      TabStop = False
      Anchors = [akRight, akBottom]
      AutoSize = False
      BiDiMode = bdRightToLeftNoAlign
      ParentBiDiMode = False
      ReadOnly = True
      TabOrder = 5
    end
  end
  object SQu: TQuery
    DatabaseName = 'ParFro'
    SQL.Strings = (
      
        'SELECT G.Nam GNam,G.Pfee,G.Quant,G.Ptotal,G.Perc,G.No,G.Dat,G.Bf' +
        'ee,G.Pay,I.Nam,I.Prule'
      'FROM Binvogood  G'
      '   INNER JOIN Bvoice I'
      '   ON  (I.No = G.No) '
      'Order by G.Dat,G.No'
      ' '
      ' '
      ' ')
    Left = 126
    Top = 100
    object SQuDat: TIntegerField
      DisplayLabel = ' «—ÌŒ'
      DisplayWidth = 10
      FieldName = 'Dat'
      Origin = 'PARFRO."Invogood.DB".Dat'
      DisplayFormat = '####/##/##'
    end
    object SQuNo: TIntegerField
      DisplayLabel = '›«ò Ê—'
      DisplayWidth = 8
      FieldName = 'No'
      Origin = 'PARFRO."Invogood.DB".No'
    end
    object SQuGNam: TStringField
      DisplayLabel = '‘—Õ ò«·«'
      DisplayWidth = 30
      FieldName = 'GNam'
      Origin = 'PARFRO."Invogood.DB".Nam'
      Size = 100
    end
    object SQuQuant: TFloatField
      DisplayLabel = '„ﬁœ«—'
      DisplayWidth = 15
      FieldName = 'Quant'
      Origin = 'PARFRO."Invogood.DB".Quant'
    end
    object SQuBfee: TCurrencyField
      DisplayLabel = '»Â«Ì Ê«Õœ'
      DisplayWidth = 10
      FieldName = 'Bfee'
      Origin = 'PARFRO."Binvogood.DB".Bfee'
    end
    object SQuPtotal: TCurrencyField
      DisplayLabel = '»Â«Ì ò·'
      DisplayWidth = 15
      FieldName = 'Ptotal'
      Origin = 'PARFRO."Invogood.DB".Ptotal'
    end
    object SQuPay: TCurrencyField
      DisplayLabel = 'Å—œ«Œ Ì'
      DisplayWidth = 15
      FieldName = 'Pay'
      Origin = 'PARFRO."Binvogood.DB".Pay'
    end
    object SQuPfee: TCurrencyField
      DisplayLabel = 'ﬁÌ„   „«„ ‘œÂ'
      DisplayWidth = 10
      FieldName = 'Pfee'
      Origin = 'PARFRO."Invogood.DB".Pfee'
    end
    object SQuPerc: TFloatField
      DisplayLabel = 'œ—’œ'
      DisplayWidth = 4
      FieldName = 'Perc'
      Origin = 'PARFRO."Invogood.DB".Perc'
      Visible = False
    end
    object SQuNam: TStringField
      DisplayLabel = '›—Ê‘‰œÂ'
      DisplayWidth = 20
      FieldName = 'Nam'
      Origin = 'PARFRO."Invoice.DB".Nam'
      Size = 45
    end
    object SQuPrule: TStringField
      DisplayLabel = '‰ÕÊÂ Å—œ«Œ '
      DisplayWidth = 10
      FieldName = 'Prule'
      Origin = 'PARFRO."Invoice.DB".PRule'
      Size = 30
    end
  end
  object DataSource1: TDataSource
    DataSet = SQu
    Left = 154
    Top = 101
  end
end
