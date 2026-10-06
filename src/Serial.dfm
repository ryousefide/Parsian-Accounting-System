object FSerial: TFSerial
  Left = 245
  Top = 193
  Width = 758
  Height = 500
  BiDiMode = bdRightToLeft
  Caption = '«” ⁄·«„ ”—Ì«·'
  Color = clBtnFace
  Font.Charset = ARABIC_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 653
    Top = 8
    Width = 85
    Height = 16
    AutoSize = False
    Caption = '”—Ì«· œ” ê«Â'
  end
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 750
    Height = 33
    Align = alTop
    Shape = bsBottomLine
  end
  object FNo: TEdit
    Left = 526
    Top = 6
    Width = 121
    Height = 21
    TabOrder = 0
    OnKeyPress = FNoKeyPress
  end
  object dbg: TDBGrid
    Left = 0
    Top = 33
    Width = 750
    Height = 440
    Align = alClient
    DataSource = CDs
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = ARABIC_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Dat'
        Title.Caption = ' «—ÌŒ'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nam'
        Title.Caption = '‘—Õ ò«·« /Œœ„« '
        Width = 212
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'In'
        Title.Caption = 'Ê«—œÂ'
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Out'
        Title.Caption = '’«œ—Â'
        Width = 38
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Des'
        Title.Caption = '‰Ê⁄ ›«ò Ê—'
        Width = 112
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'No'
        Title.Caption = '‘„«—Â ›«ò Ê—'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Facnam'
        Title.Caption = '»‰«„ '
        Width = 121
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Anb'
        Title.Caption = 'ê«—«‰ Ì'
        Visible = True
      end>
  end
  object CQu: TQuery
    DatabaseName = 'ParFro'
    SQL.Strings = (
      'Select * From Cardex'
      'Order by Dat')
    Left = 86
    Top = 72
    object CQuId: TIntegerField
      FieldName = 'Id'
    end
    object CQuDat: TIntegerField
      FieldName = 'Dat'
      DisplayFormat = '####/##/##'
    end
    object CQuNam: TStringField
      FieldName = 'Nam'
      Size = 100
    end
    object CQuColor: TStringField
      FieldName = 'Color'
      Size = 45
    end
    object CQuAnb: TStringField
      FieldName = 'Anb'
      Size = 45
    end
    object CQuAnbKod: TIntegerField
      FieldName = 'AnbKod'
    end
    object CQuIn: TFloatField
      FieldName = 'In'
    end
    object CQuOut: TFloatField
      FieldName = 'Out'
    end
    object CQuRem: TFloatField
      FieldName = 'Rem'
    end
    object CQuNo: TIntegerField
      FieldName = 'No'
    end
    object CQuDes: TStringField
      FieldName = 'Des'
    end
    object CQuFacnam: TStringField
      FieldName = 'Facnam'
      Size = 45
    end
    object CQuFee: TCurrencyField
      FieldName = 'Fee'
    end
    object CQuPerc: TFloatField
      FieldName = 'Perc'
    end
    object CQuPrem: TCurrencyField
      FieldName = 'Prem'
    end
    object CQuDiag: TFloatField
      FieldName = 'Diag'
    end
    object CQuPdiag: TCurrencyField
      FieldName = 'Pdiag'
    end
  end
  object CDs: TDataSource
    DataSet = CQu
    Left = 114
    Top = 72
  end
  object Q1: TQuery
    DatabaseName = 'ParFro'
    SQL.Strings = (
      
        'Insert InTo Cardex(Dat,Nam,Cardex.IIn,Out,Des,Cardex.No,FacNam,A' +
        'nb)'
      'Select G.Dat,G.Nam,0,G.Quant,'#39'›«ò Ê— Œ—Ìœ'#39',G.No,I.Nam,G.Garan'
      'From BinvoGood G ,Bvoice I'
      'Where G.No=I.No and G.Serial=:s'
      ' ')
    Left = 48
    Top = 2
    ParamData = <
      item
        DataType = ftUnknown
        Name = 's'
        ParamType = ptUnknown
      end>
  end
  object Q2: TQuery
    DatabaseName = 'ParFro'
    SQL.Strings = (
      
        'Insert InTo Cardex(Dat,Nam,Cardex.IIn,Out,Des,Cardex.No,FacNam,A' +
        'nb)'
      'Select G.Dat,G.Nam,0,G.Quant,'#39'›«ò Ê— ›—Ê‘'#39',G.No,I.Nam,G.Garan'
      'From InvoGood G ,Invoice I'
      'Where G.No=I.No  and G.Serial=:s')
    Left = 76
    Top = 2
    ParamData = <
      item
        DataType = ftUnknown
        Name = 's'
        ParamType = ptUnknown
      end>
  end
  object Q3: TQuery
    DatabaseName = 'ParFro'
    SQL.Strings = (
      
        'Insert InTo Cardex(Dat,Nam,Cardex.IIn,Out,Des,Cardex.No,FacNam,A' +
        'nb)'
      'Select G.Dat,G.Nam,0,G.Quant,'#39'„—ÃÊ⁄Ì ›—Ê‘'#39',G.No,I.Nam,G.Garan'
      'From RejInvoGood G ,RejInvo I'
      'Where G.No=I.No  and G.Serial=:s'
      ' '
      ' ')
    Left = 104
    Top = 2
    ParamData = <
      item
        DataType = ftUnknown
        Name = 's'
        ParamType = ptUnknown
      end>
  end
  object Q4: TQuery
    DatabaseName = 'ParFro'
    SQL.Strings = (
      
        'Insert InTo Cardex(Dat,Nam,Cardex.IIn,Out,Des,Cardex.No,FacNam,A' +
        'nb)'
      'Select G.Dat,G.Nam,0,G.Quant,'#39'„—ÃÊ⁄Ì Œ—Ìœ'#39',G.No,I.Nam,G.Garan'
      'From RejBinvoGood G ,RejBvoice I'
      'Where G.No=I.No  and G.Serial=:s'
      ' ')
    Left = 132
    Top = 2
    ParamData = <
      item
        DataType = ftUnknown
        Name = 's'
        ParamType = ptUnknown
      end>
  end
end
