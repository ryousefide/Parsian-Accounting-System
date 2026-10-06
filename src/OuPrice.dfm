object FOutPrices: TFOutPrices
  Left = 355
  Top = 181
  AutoSize = True
  BiDiMode = bdRightToLeft
  BorderStyle = bsNone
  Caption = '·Ì”  ‰—Œ „Õ’Ê·« '
  ClientHeight = 228
  ClientWidth = 407
  Color = clBtnFace
  Font.Charset = ARABIC_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poDefault
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object dbg: TDBGrid
    Left = 0
    Top = 0
    Width = 407
    Height = 201
    DataSource = Ds
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = ARABIC_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object BitBtn1: TBitBtn
    Left = 88
    Top = 203
    Width = 75
    Height = 25
    Caption = ' «ÌÌœ'
    TabOrder = 1
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 264
    Top = 203
    Width = 75
    Height = 25
    Caption = '«‰’—«›'
    TabOrder = 2
    Kind = bkCancel
  end
  object FQu: TQuery
    DatabaseName = 'ParFro'
    SQL.Strings = (
      'Select * From cardex'
      'Order By dat')
    Left = 106
    Top = 100
    object FQuDat: TIntegerField
      DisplayLabel = ' «—ÌŒ'
      DisplayWidth = 15
      FieldName = 'Dat'
      DisplayFormat = '####/##/##'
    end
    object FQuNam: TStringField
      DisplayLabel = '‘—Õ'
      DisplayWidth = 30
      FieldName = 'Nam'
      Size = 100
    end
    object FQuAnb: TStringField
      DisplayLabel = '«‰»«—'
      DisplayWidth = 23
      FieldName = 'Anb'
      Visible = False
      Size = 45
    end
    object FQuOut: TFloatField
      DisplayLabel = '„«‰œÂ'
      DisplayWidth = 15
      FieldName = 'Out'
    end
    object FQuFee: TCurrencyField
      DisplayLabel = '‰—Œ'
      DisplayWidth = 12
      FieldName = 'Fee'
      Visible = False
    end
    object FQuNo: TIntegerField
      DisplayLabel = '‘„«—Â'
      DisplayWidth = 11
      FieldName = 'No'
    end
    object FQuDes: TStringField
      DisplayLabel = '‘—Õ'
      FieldName = 'Des'
      Visible = False
    end
    object FQuFacnam: TStringField
      FieldName = 'Facnam'
      Visible = False
      Size = 45
    end
    object FQuId: TIntegerField
      FieldName = 'Id'
      Visible = False
    end
    object FQuColor: TStringField
      FieldName = 'Color'
      Visible = False
      Size = 45
    end
    object FQuAnbKod: TIntegerField
      FieldName = 'AnbKod'
      Visible = False
    end
    object FQuIn: TFloatField
      FieldName = 'IIn'
      Visible = False
    end
    object FQuRem: TFloatField
      FieldName = 'Rem'
      Visible = False
    end
    object FQuPerc: TFloatField
      FieldName = 'Perc'
      Visible = False
    end
    object FQuPrem: TCurrencyField
      FieldName = 'Prem'
      Visible = False
    end
    object FQuDiag: TFloatField
      FieldName = 'Diag'
      Visible = False
    end
    object FQuPdiag: TCurrencyField
      FieldName = 'Pdiag'
      Visible = False
    end
  end
  object Ds: TDataSource
    DataSet = FQu
    Left = 134
    Top = 100
  end
end
