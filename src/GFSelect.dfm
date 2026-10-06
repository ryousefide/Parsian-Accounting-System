object FGFSelect: TFGFSelect
  Left = 346
  Top = 183
  BiDiMode = bdRightToLeft
  BorderStyle = bsDialog
  BorderWidth = 2
  Caption = '«‰ Œ«» ò«·«Ì  —òÌ»Ì'
  ClientHeight = 235
  ClientWidth = 579
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
  object Label1: TLabel
    Left = 381
    Top = 11
    Width = 68
    Height = 18
    Anchors = [akTop, akRight]
    AutoSize = False
    Caption = '‘—Õ ﬂ«·«'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 520
    Top = 11
    Width = 53
    Height = 18
    Anchors = [akTop, akRight]
    AutoSize = False
    Caption = ' ⁄œ«œ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object GFName: TAcComboBox
    Left = 184
    Top = 10
    Width = 193
    Height = 21
    Anchors = [akTop, akRight]
    ItemHeight = 13
    TabOrder = 1
    Text = '‰«„ ò«·« «“ ·Ì”  «‰ Œ«» ‘Êœ'
    OnChange = GFNameChange
  end
  object FQt: TEdit
    Left = 474
    Top = 10
    Width = 40
    Height = 21
    AutoSize = False
    TabOrder = 0
    Text = '1'
    OnChange = GFNameChange
    OnKeyPress = FQtKeyPress
  end
  object dbg: TDBGrid
    Left = 2
    Top = 40
    Width = 575
    Height = 164
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DataSource1
    TabOrder = 2
    TitleFont.Charset = ARABIC_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object UpDown1: TUpDown
    Left = 514
    Top = 10
    Width = 15
    Height = 21
    Associate = FQt
    Min = 1
    Position = 1
    TabOrder = 3
    Wrap = False
  end
  object Button1: TBitBtn
    Left = 108
    Top = 210
    Width = 92
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = ' «∆Ìœ'
    TabOrder = 4
    OnClick = Button1Click
    Kind = bkOK
  end
  object Button2: TBitBtn
    Left = 394
    Top = 210
    Width = 92
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '«‰’—«›'
    TabOrder = 5
    OnClick = Button2Click
    Kind = bkCancel
  end
  object QList: TQuery
    DatabaseName = 'ParFro'
    SQL.Strings = (
      'Select Kod ,Nam ,Quant * :a1   Qt'
      'From GForm'
      'Where MKod=:a2')
    Left = 282
    Top = 148
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'a1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'a2'
        ParamType = ptUnknown
      end>
    object QListKod: TIntegerField
      DisplayLabel = 'òœ ò«·«'
      FieldName = 'Kod'
      Origin = 'PARFRO.GForm.Kod'
    end
    object QListNam: TStringField
      DisplayLabel = '‘—Õ ò«·«'
      DisplayWidth = 45
      FieldName = 'Nam'
      Origin = 'PARFRO.GForm.Nam'
      FixedChar = True
      Size = 100
    end
    object QListQt: TFloatField
      DisplayLabel = ' ⁄œ«œ'
      FieldName = 'Qt'
      Origin = 'PARFRO.GForm.Quant'
    end
  end
  object DataSource1: TDataSource
    AutoEdit = False
    DataSet = QList
    Left = 254
    Top = 148
  end
end
