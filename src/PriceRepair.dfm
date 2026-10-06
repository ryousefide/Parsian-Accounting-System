object FPrices: TFPrices
  Left = 314
  Top = 190
  AutoSize = True
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  BorderWidth = 3
  Caption = '»«“”«“Ì ‰—Œ Â«Ì Ê—ÊœÌ Ê Œ—ÊÃÌ «‰»«—'
  ClientHeight = 361
  ClientWidth = 497
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 497
    Height = 257
  end
  object Label1: TLabel
    Left = 301
    Top = 64
    Width = 179
    Height = 37
    Alignment = taRightJustify
    AutoSize = False
    Layout = tlCenter
  end
  object Label2: TLabel
    Left = 9
    Top = 64
    Width = 273
    Height = 37
    Alignment = taRightJustify
    AutoSize = False
    Layout = tlCenter
  end
  object Label3: TLabel
    Left = 19
    Top = 9
    Width = 456
    Height = 37
    Alignment = taCenter
    AutoSize = False
    Caption = ' '
    Layout = tlCenter
  end
  object PB: TProgressBar
    Left = 8
    Top = 110
    Width = 473
    Height = 16
    Min = 0
    Max = 100
    TabOrder = 0
  end
  object Ani1: TAnimate
    Left = 112
    Top = 136
    Width = 272
    Height = 60
    Active = False
    CommonAVI = aviCopyFiles
    StopFrame = 31
  end
  object Button1: TButton
    Left = 111
    Top = 205
    Width = 281
    Height = 25
    Caption = '»«“”«“Ì ‰—Œ Â«Ì Ê—ÊœÌ Ê Œ—ÊÃÌ «“ «‰»«—'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 26
    Top = 264
    Width = 435
    Height = 97
    Lines.Strings = (
      'Memo1')
    TabOrder = 3
  end
  object GQu: TQuery
    DatabaseName = 'ParFro'
    SQL.Strings = (
      'Select *'
      'From Depot '
      'Order by Kod')
    Left = 192
    Top = 16
    object GQuId: TIntegerField
      FieldName = 'Id'
    end
    object GQuKod: TIntegerField
      FieldName = 'Kod'
    end
    object GQuGene: TIntegerField
      FieldName = 'Gene'
    end
    object GQuNam: TStringField
      FieldName = 'Nam'
      Size = 100
    end
    object GQuColor: TStringField
      FieldName = 'Color'
      Size = 45
    end
    object GQuAnbNam: TStringField
      FieldName = 'AnbNam'
      Size = 45
    end
    object GQuAnbKod: TFloatField
      FieldName = 'AnbKod'
    end
    object GQuQuant: TFloatField
      FieldName = 'Quant'
    end
  end
  object IQu: TQuery
    DatabaseName = 'ParFro'
    SQL.Strings = (
      'UPDATE    DHav'
      
        'SET DHav.Pkol =(SELECT SUM(G.Ptotal) FROM  DHavg G WHERE DHav.No' +
        ' = G.No)'
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 226
    Top = 16
  end
  object BQu: TQuery
    DatabaseName = 'ParFro'
    SQL.Strings = (
      'Update RejBinvoGood R'
      'Set R.Reject =(Select C.Fee From Cardex C'
      'Where R.No = C.No and C.Des='#39'„—ÃÊ⁄Ì Œ—Ìœ'#39' and R.Radif=C.AnbKod)')
    Left = 256
    Top = 18
  end
  object DataSource1: TDataSource
    DataSet = IQu
    Left = 320
    Top = 24
  end
end
