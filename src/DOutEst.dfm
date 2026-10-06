object FDOutEst: TFDOutEst
  Tag = 1
  Left = 266
  Top = 50
  BiDiMode = bdRightToLeft
  BorderStyle = bsSingle
  ClientHeight = 473
  ClientWidth = 862
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
  object dbg: TDBGrid
    Left = -1
    Top = 77
    Width = 862
    Height = 394
    Anchors = [akLeft, akTop, akRight, akBottom]
    BiDiMode = bdRightToLeft
    BorderStyle = bsNone
    DataSource = EsDs
    Options = [dgTitles, dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentBiDiMode = False
    TabOrder = 0
    TitleFont.Charset = ARABIC_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = dbgDrawColumnCell
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 862
    Height = 79
    Align = alTop
    BevelInner = bvLowered
    BorderWidth = 2
    TabOrder = 1
    object Label2: TLabel
      Left = 803
      Top = 12
      Width = 55
      Height = 20
      Anchors = [akTop, akRight]
      AutoSize = False
      BiDiMode = bdRightToLeft
      Caption = '«“  «—ÌŒ'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
    end
    object Label3: TLabel
      Left = 670
      Top = 12
      Width = 51
      Height = 18
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
    end
    object Label4: TLabel
      Left = 805
      Top = 48
      Width = 51
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
    object Label5: TLabel
      Left = 389
      Top = 48
      Width = 33
      Height = 18
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = '„œ·'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 204
      Top = 48
      Width = 59
      Height = 18
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = '‰«„ «‰»«—'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object spCalc: TSpeedButton
      Left = 541
      Top = 11
      Width = 23
      Height = 22
      Anchors = [akTop, akRight]
      Flat = True
      OnClick = spCalcClick
    end
    object spPrint: TSpeedButton
      Left = 518
      Top = 11
      Width = 23
      Height = 22
      Anchors = [akTop, akRight]
      Flat = True
    end
    object SDat: TMaskEdit
      Left = 726
      Top = 11
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
      Left = 588
      Top = 11
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
    object GNam: TComboBox
      Tag = 1
      Left = 427
      Top = 47
      Width = 374
      Height = 21
      Anchors = [akTop, akRight]
      BiDiMode = bdRightToLeft
      ItemHeight = 13
      ParentBiDiMode = False
      Sorted = True
      TabOrder = 3
      OnKeyDown = GNamKeyDown
      OnKeyPress = NextTab
    end
    object FColor: TComboBox
      Left = 268
      Top = 47
      Width = 118
      Height = 21
      Anchors = [akTop, akRight]
      BiDiMode = bdRightToLeft
      ItemHeight = 13
      ParentBiDiMode = False
      Sorted = True
      TabOrder = 4
      OnKeyPress = NextTab
      Items.Strings = (
        '')
    end
    object FAnb: TComboBox
      Left = 57
      Top = 47
      Width = 151
      Height = 21
      Anchors = [akTop, akRight]
      BiDiMode = bdRightToLeft
      ItemHeight = 13
      ParentBiDiMode = False
      Sorted = True
      TabOrder = 5
      OnKeyPress = NextTab
      Items.Strings = (
        '')
    end
    object rgMoj: TRadioGroup
      Left = 56
      Top = 5
      Width = 330
      Height = 34
      Caption = '„«‰œÂ'
      Columns = 4
      ItemIndex = 3
      Items.Strings = (
        '»«·«Ì ’›—'
        '“Ì— ’›—'
        '’›—'
        'ﬂ·ÌÂ')
      TabOrder = 2
    end
  end
  object EsQu: TQuery
    DatabaseName = 'ParFro'
    SQL.Strings = (
      
        'Select G.Kod,G.Nam,G.color,G.Anbnam,G.No,Sum (distinct G.Quant) ' +
        #39'HQuant'#39',Sum(D.Quant) '#39'DQuant'#39',Sum (distinct G.Quant)-Sum(D.Quan' +
        't) '#39'REMAIN'#39
      'From DHavG G,DoutG D '
      
        'Where D.Kod=G.Kod and D.Color=G.Color and D.anbkod=G.No  and G.D' +
        'at between :R1 and :R2'
      'Group by G.No,G.Kod,G.Nam,G.color,G.Anbnam'
      'Order by 1'
      ' ')
    Left = 43
    Top = 150
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'R1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'R2'
        ParamType = ptUnknown
      end>
    object EsQuKod: TIntegerField
      DisplayLabel = 'òœ ò«·«'
      DisplayWidth = 10
      FieldName = 'Kod'
    end
    object EsQuNam: TStringField
      DisplayLabel = '‘—Õ ò«·«'
      DisplayWidth = 40
      FieldName = 'Nam'
      FixedChar = True
      Size = 100
    end
    object EsQucolor: TStringField
      DisplayLabel = '„œ· ò«·«'
      DisplayWidth = 20
      FieldName = 'color'
      FixedChar = True
      Size = 45
    end
    object EsQuAnbnam: TStringField
      DisplayLabel = '‰«„ «‰»«—'
      DisplayWidth = 25
      FieldName = 'Anbnam'
      FixedChar = True
      Size = 45
    end
    object EsQuNo: TIntegerField
      DisplayLabel = '‘„«—Â ÕÊ«·Â'
      DisplayWidth = 10
      FieldName = 'No'
    end
    object EsQuHQuant: TFloatField
      DisplayLabel = 'ÕÊ«·Â'
      DisplayWidth = 10
      FieldName = 'HQuant'
    end
    object EsQuDQuant: TFloatField
      DisplayLabel = 'Œ—ÊÃÌ'
      DisplayWidth = 10
      FieldName = 'DQuant'
    end
    object EsQuREMAIN: TFloatField
      DisplayLabel = '„«‰œÂ'
      DisplayWidth = 10
      FieldName = 'REMAIN'
    end
  end
  object EsDs: TDataSource
    DataSet = EsQu
    Left = 73
    Top = 150
  end
end
