object FUserLog: TFUserLog
  Left = 207
  Top = 217
  BiDiMode = bdRightToLeft
  BorderStyle = bsNone
  Caption = '⁄„·ò—œ «Å—« Ê— Â«'
  ClientHeight = 473
  ClientWidth = 939
  Color = clBtnFace
  Font.Charset = ARABIC_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
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
  object Label1: TLabel
    Left = 838
    Top = 14
    Width = 74
    Height = 18
    Anchors = [akTop, akRight]
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '‰«„ ﬂ«—»—'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object Label2: TLabel
    Left = 657
    Top = 14
    Width = 57
    Height = 18
    Anchors = [akTop, akRight]
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '‰Ê⁄ ”‰œ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object Label3: TLabel
    Left = 458
    Top = 14
    Width = 74
    Height = 18
    Anchors = [akTop, akRight]
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '‰Ê⁄ ⁄„·Ì« '
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object spCalc: TSpeedButton
    Left = 310
    Top = 12
    Width = 23
    Height = 22
    Anchors = [akTop, akRight]
    Flat = True
    OnClick = spCalcClick
  end
  object User: TComboBox
    Left = 720
    Top = 13
    Width = 111
    Height = 21
    Anchors = [akTop, akRight]
    BiDiMode = bdRightToLeft
    ItemHeight = 13
    ParentBiDiMode = False
    TabOrder = 0
    OnKeyPress = NextTab
  end
  object cbDoc: TComboBox
    Left = 540
    Top = 13
    Width = 111
    Height = 21
    Anchors = [akTop, akRight]
    BiDiMode = bdRightToLeft
    ItemHeight = 13
    ParentBiDiMode = False
    TabOrder = 1
    OnKeyPress = NextTab
  end
  object cbAct: TComboBox
    Left = 340
    Top = 13
    Width = 111
    Height = 21
    Style = csDropDownList
    Anchors = [akTop, akRight]
    BiDiMode = bdRightToLeft
    ItemHeight = 13
    ParentBiDiMode = False
    TabOrder = 2
    OnKeyPress = NextTab
    Items.Strings = (
      ''
      'ÊÌ—«Ì‘'
      'À» '
      'Õ–›')
  end
  object Bgrid: TDBGrid
    Left = 2
    Top = 41
    Width = 934
    Height = 432
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = Uds
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 3
    TitleFont.Charset = ARABIC_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = BgridDrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'Id'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Uname'
        Title.Caption = '«Å—« Ê—'
        Width = 101
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FDat'
        Title.Caption = ' «—ÌŒ (‘„”Ì)'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Dat'
        Title.Caption = ' «—ÌŒ („Ì·«œÌ)'
        Width = 109
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Htime'
        Title.Caption = '“„«‰'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Act'
        Title.Caption = '⁄„·Ì« '
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Doc'
        Title.Caption = '‰Ê⁄ ”‰œ'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Dno'
        Title.Caption = '‘„«—Â ”‰œ'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Ddat'
        Title.Caption = ' «—ÌŒ ”‰œ'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Dvalue'
        Title.Caption = '„»·€ ”‰œ'
        Width = 101
        Visible = True
      end>
  end
  object UQu: TQuery
    DatabaseName = 'ParFro'
    SQL.Strings = (
      'Select * '
      'From UserAct')
    Left = 42
    Top = 6
    object UQuId: TAutoIncField
      FieldName = 'Id'
      Origin = 'PARFRO.UserAct.Id'
    end
    object UQuUname: TStringField
      FieldName = 'Uname'
      Origin = 'PARFRO.UserAct.Uname'
      FixedChar = True
      Size = 45
    end
    object UQuDat: TDateTimeField
      FieldName = 'Dat'
      Origin = 'PARFRO.UserAct.Dat'
    end
    object UQuDoc: TStringField
      FieldName = 'Doc'
      Origin = 'PARFRO.UserAct.Doc'
      FixedChar = True
      Size = 50
    end
    object UQuDdat: TIntegerField
      FieldName = 'Ddat'
      Origin = 'PARFRO.UserAct.Ddat'
      DisplayFormat = '####/##/##'
    end
    object UQuDno: TIntegerField
      FieldName = 'Dno'
      Origin = 'PARFRO.UserAct.Dno'
    end
    object UQuDvalue: TFloatField
      FieldName = 'Dvalue'
      Origin = 'PARFRO.UserAct.Dvalue'
    end
    object UQuAct: TStringField
      FieldName = 'Act'
      Origin = 'PARFRO.UserAct.Act'
      FixedChar = True
      Size = 50
    end
    object UQuHtime: TDateTimeField
      FieldName = 'Htime'
      Origin = 'PARFRO.UserAct.Htime'
    end
    object UQuFDat: TIntegerField
      FieldName = 'FDat'
      Origin = 'PARFRO.UserAct.FDat'
      DisplayFormat = '####/##/##'
    end
  end
  object Uds: TDataSource
    AutoEdit = False
    DataSet = UQu
    Left = 70
    Top = 6
  end
end
