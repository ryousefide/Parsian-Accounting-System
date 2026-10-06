object FCentSearch: TFCentSearch
  Left = 465
  Top = 168
  BiDiMode = bdRightToLeft
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsNone
  Caption = 'Ã” ÃÊÌ Õ—Ê›Ì „—«ò“ Â“Ì‰Â'
  ClientHeight = 371
  ClientWidth = 262
  Color = clBtnFace
  Font.Charset = ARABIC_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 262
    Height = 48
    Align = alTop
  end
  object Label1: TLabel
    Left = 132
    Top = 3
    Width = 123
    Height = 18
    Anchors = [akTop, akRight]
    AutoSize = False
    Caption = 'ﬁ”„ Ì «“ ‰«„ „—ò“'
  end
  object FNam: TEdit
    Left = 3
    Top = 24
    Width = 254
    Height = 21
    AutoSize = False
    TabOrder = 0
    OnKeyDown = FNamKeyDown
  end
  object lbName: TXPListBox
    Left = 29
    Top = 73
    Width = 209
    Height = 234
    TabStop = False
    DragCursor = crHandPoint
    DragMode = dmAutomatic
    ItemHeight = 13
    ParentShowHint = False
    ShowHint = True
    Sorted = True
    TabOrder = 2
    Visible = False
    OnKeyDown = lbNameKeyDown
  end
  object Dbg: TDBGrid
    Left = 0
    Top = 51
    Width = 261
    Height = 315
    DataSource = Ds
    Options = [dgTitles, dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = ARABIC_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Serif'
    TitleFont.Style = []
    OnKeyDown = DbgKeyDown
  end
  object SQu: TQuery
    DatabaseName = 'ParFro'
    SQL.Strings = (
      'Select Radif,Nam,EName,Kod'
      'From Cent'
      'Where Nam like '#39'%»Â%'#39)
    Left = 28
    Top = 10
    object SQuRadif: TIntegerField
      DisplayLabel = 'Cust.Id'
      DisplayWidth = 8
      FieldName = 'Radif'
    end
    object SQuNam: TStringField
      DisplayLabel = '‘—Õ'
      DisplayWidth = 14
      FieldName = 'Nam'
      FixedChar = True
      Size = 45
    end
    object SQuEName: TStringField
      DisplayLabel = 'English Name'
      DisplayWidth = 14
      FieldName = 'EName'
      FixedChar = True
      Size = 45
    end
    object SQuKod: TIntegerField
      DisplayLabel = 'Acc.Id'
      DisplayWidth = 10
      FieldName = 'Kod'
      Visible = False
    end
  end
  object Ds: TDataSource
    AutoEdit = False
    DataSet = SQu
    Left = 58
    Top = 10
  end
end
