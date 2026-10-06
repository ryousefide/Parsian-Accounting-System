object FDBenef: TFDBenef
  Tag = 1
  Left = 333
  Top = 189
  BiDiMode = bdRightToLeft
  BorderStyle = bsNone
  BorderWidth = 3
  Caption = '’Ê—  ”Êœ —Ê“«‰Â'
  ClientHeight = 333
  ClientWidth = 601
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
  object Label2: TLabel
    Left = 520
    Top = 3
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
    Left = 384
    Top = 1
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
  object spCalc: TSpeedButton
    Left = 264
    Top = 0
    Width = 23
    Height = 22
    Anchors = [akTop, akRight]
    Flat = True
    OnClick = Button1Click
  end
  object spPrint: TSpeedButton
    Left = 241
    Top = 0
    Width = 23
    Height = 22
    Anchors = [akTop, akRight]
    Flat = True
    OnClick = spPrintClick
  end
  object SDat: TMaskEdit
    Left = 443
    Top = 2
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
    Left = 299
    Top = 0
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
  object dbg: TDBGrid
    Left = 0
    Top = 32
    Width = 600
    Height = 284
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = Ds
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = ARABIC_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Nam'
        Title.Alignment = taCenter
        Title.Caption = '‘—Õ'
        Width = 141
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Color'
        Title.Alignment = taCenter
        Title.Caption = '„œ·'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Anb'
        Title.Alignment = taCenter
        Title.Caption = '«‰»«—'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AnbKod'
        Title.Alignment = taCenter
        Title.Caption = 'ﬁ›”Â'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Fee'
        Title.Alignment = taCenter
        Title.Caption = '›—Ê‘'
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Prem'
        Title.Alignment = taCenter
        Title.Caption = '»Â«Ì  „«„ ‘œÂ'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Pdiag'
        Title.Alignment = taCenter
        Title.Caption = '”Êœ'
        Width = 126
        Visible = True
      end>
  end
  object PrgB: TProgressBar
    Left = 2
    Top = 319
    Width = 597
    Height = 10
    Anchors = [akLeft, akRight, akBottom]
    Min = 0
    Max = 100
    TabOrder = 3
  end
  object BQu: TQuery
    DatabaseName = 'ParFro'
    SQL.Strings = (
      'Select  Distinct  Kod,Nam,Color,AnbNam,AnbKod'
      'From InvoGood'
      'Where Dat  Between  :a and :b'
      'Order by Nam')
    Left = 46
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'a'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'b'
        ParamType = ptUnknown
      end>
    object BQuKod: TIntegerField
      FieldName = 'Kod'
    end
    object BQuNam: TStringField
      FieldName = 'Nam'
      Size = 100
    end
    object BQuColor: TStringField
      FieldName = 'Color'
      Size = 45
    end
    object BQuAnbNam: TStringField
      FieldName = 'AnbNam'
      Size = 45
    end
    object BQuAnbKod: TFloatField
      FieldName = 'AnbKod'
      Origin = 'PARFRO.InvoGood.AnbKod'
    end
  end
  object GQu: TQuery
    DatabaseName = 'ParFro'
    SQL.Strings = (
      'Select * From Cardex')
    Left = 72
    Top = 184
    object GQuId: TIntegerField
      FieldName = 'Id'
    end
    object GQuDat: TIntegerField
      FieldName = 'Dat'
    end
    object GQuNam: TStringField
      FieldName = 'Nam'
      Size = 100
    end
    object GQuColor: TStringField
      FieldName = 'Color'
      Size = 45
    end
    object GQuAnb: TStringField
      FieldName = 'Anb'
      Size = 45
    end
    object GQuAnbKod: TIntegerField
      FieldName = 'AnbKod'
    end
    object GQuIn: TFloatField
      FieldName = 'IIn'
    end
    object GQuOut: TFloatField
      FieldName = 'Out'
    end
    object GQuRem: TFloatField
      FieldName = 'Rem'
    end
    object GQuNo: TIntegerField
      FieldName = 'No'
    end
    object GQuDes: TStringField
      FieldName = 'Des'
    end
    object GQuFacnam: TStringField
      FieldName = 'Facnam'
      Size = 45
    end
    object GQuFee: TCurrencyField
      FieldName = 'Fee'
    end
    object GQuPerc: TFloatField
      FieldName = 'Perc'
    end
    object GQuPrem: TCurrencyField
      FieldName = 'Prem'
    end
    object GQuDiag: TFloatField
      FieldName = 'Diag'
    end
    object GQuPdiag: TCurrencyField
      FieldName = 'Pdiag'
    end
  end
  object Ds: TDataSource
    DataSet = GQu
    Left = 112
    Top = 184
  end
  object QSum: TQuery
    DatabaseName = 'ParFro'
    SQL.Strings = (
      'Select Sum(Fee),Sum( Prem),Sum( Pdiag),Sum(Fee)-Sum(Prem)'
      'From Cardex')
    Left = 15
  end
end
