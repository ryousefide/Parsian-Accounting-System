object FHavEst: TFHavEst
  Tag = 1
  Left = 260
  Top = 111
  Width = 948
  Height = 627
  BiDiMode = bdRightToLeft
  Caption = 'ÕÊ«·Â Â«Ì Œ—ÊÃ ‰‘œÂ'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
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
  object Splitter1: TSplitter
    Left = 528
    Top = 63
    Width = 8
    Height = 537
    Cursor = crHSplit
    Align = alRight
    AutoSnap = False
    Beveled = True
  end
  object dbg: TDBGrid
    Left = 536
    Top = 63
    Width = 404
    Height = 537
    Align = alRight
    DataSource = Ds
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = dbgDrawColumnCell
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 940
    Height = 63
    Align = alTop
    BevelInner = bvLowered
    BevelWidth = 2
    BorderWidth = 1
    TabOrder = 1
    object Label3: TLabel
      Left = 881
      Top = 16
      Width = 48
      Height = 18
      Anchors = [akTop, akRight, akBottom]
      AutoSize = False
      BiDiMode = bdRightToLeft
      Caption = 'Õ”«»'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      Layout = tlCenter
    end
    object Label13: TLabel
      Left = 680
      Top = 16
      Width = 47
      Height = 18
      Anchors = [akTop, akRight, akBottom]
      AutoSize = False
      BiDiMode = bdRightToLeft
      Caption = 'Å—ÊéÂ'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
    end
    object Label14: TLabel
      Left = 439
      Top = 16
      Width = 60
      Height = 18
      Anchors = [akTop, akRight, akBottom]
      AutoSize = False
      BiDiMode = bdRightToLeft
      Caption = '„—ﬂ“ Â“Ì‰Â'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
    end
    object spCalc: TSpeedButton
      Left = 226
      Top = 13
      Width = 23
      Height = 22
      Anchors = [akTop, akRight]
      Flat = True
      OnClick = spCalcClick
    end
    object FAccNam: TComboBox
      Left = 752
      Top = 13
      Width = 123
      Height = 21
      Anchors = [akTop, akRight, akBottom]
      BiDiMode = bdRightToLeft
      ItemHeight = 13
      ParentBiDiMode = False
      Sorted = True
      TabOrder = 0
      OnChange = spCalcClick
      OnKeyPress = NextTab
    end
    object FCostN: TComboBox
      Left = 531
      Top = 13
      Width = 141
      Height = 21
      Anchors = [akTop, akRight, akBottom]
      BiDiMode = bdRightToLeft
      ItemHeight = 13
      ParentBiDiMode = False
      Sorted = True
      TabOrder = 1
      OnChange = spCalcClick
      OnKeyPress = NextTab
    end
    object FCentN: TComboBox
      Left = 259
      Top = 13
      Width = 173
      Height = 21
      Anchors = [akTop, akRight, akBottom]
      BiDiMode = bdRightToLeft
      ItemHeight = 13
      ParentBiDiMode = False
      TabOrder = 2
      OnChange = spCalcClick
      OnKeyPress = NextTab
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 63
    Width = 528
    Height = 537
    Align = alClient
    TabOrder = 2
    object Label1: TLabel
      Left = 1
      Top = 259
      Width = 526
      Height = 30
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Caption = '”«Ì— ÕÊ«·Â Â«Ì   ÕÊÌ· ‰‘œÂ ò«·«'
      Layout = tlCenter
    end
    object Splitter2: TSplitter
      Left = 1
      Top = 254
      Width = 526
      Height = 5
      Cursor = crVSplit
      Align = alTop
    end
    object Label2: TLabel
      Left = 1
      Top = 1
      Width = 526
      Height = 30
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Caption = '«ﬁ·«„  ÕÊÌ· ‰‘œÂ ÕÊ«·Â '
      Layout = tlCenter
    end
    object Goods: TDBGrid
      Left = 1
      Top = 31
      Width = 526
      Height = 223
      Align = alTop
      DataSource = HGDs
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = GoodsDrawColumnCell
    end
    object Gdbg: TDBGrid
      Left = 1
      Top = 289
      Width = 526
      Height = 247
      Align = alClient
      DataSource = GQuDs
      Options = [dgTitles, dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = GdbgDrawColumnCell
    end
  end
  object EsQu: TQuery
    AfterOpen = EsQuAfterScroll
    AfterScroll = EsQuAfterScroll
    DatabaseName = 'ParFro'
    SQL.Strings = (
      'Select *'
      'From DHav D'
      
        'Where D.No in (Select G.No From DhavG G Where G.Reject < G.Quant' +
        ' or G.Reject =0 or G.Reject is null)'
      'Order by Dat,D.No '
      ' ')
    Left = 495
    Top = 168
    object EsQuNo: TIntegerField
      DisplayLabel = '‘„«—Â'
      DisplayWidth = 9
      FieldName = 'No'
    end
    object EsQuDat: TIntegerField
      DisplayLabel = ' «—ÌŒ'
      DisplayWidth = 15
      FieldName = 'Dat'
      DisplayFormat = '####/##/##'
    end
    object EsQuNam: TStringField
      DisplayLabel = '»Õ”«»'
      DisplayWidth = 24
      FieldName = 'Nam'
      FixedChar = True
      Size = 45
    end
    object EsQuPkol: TCurrencyField
      FieldName = 'Pkol'
      Visible = False
    end
    object EsQuPdis: TCurrencyField
      FieldName = 'Pdis'
      Visible = False
    end
    object EsQuPnet: TCurrencyField
      FieldName = 'Pnet'
      Visible = False
    end
    object EsQuBkod: TBooleanField
      FieldName = 'Bkod'
      Visible = False
    end
    object EsQuBno: TIntegerField
      FieldName = 'Bno'
      Visible = False
    end
    object EsQuCost: TStringField
      DisplayLabel = 'Å—ÊéÂ'
      DisplayWidth = 20
      FieldName = 'Cost'
      Visible = False
      FixedChar = True
      Size = 45
    end
    object EsQuCkod: TIntegerField
      DisplayLabel = '»‰«„/„—ò“'
      DisplayWidth = 22
      FieldName = 'Ckod'
    end
    object EsQuRefno: TIntegerField
      DisplayLabel = '›«ò Ê—'
      DisplayWidth = 12
      FieldName = 'Refno'
    end
    object EsQuDes: TStringField
      FieldName = 'Des'
      Visible = False
      FixedChar = True
      Size = 200
    end
  end
  object Ds: TDataSource
    AutoEdit = False
    DataSet = EsQu
    Left = 524
    Top = 168
  end
  object HGQu: TQuery
    AfterOpen = HGQuAfterOpen
    AfterScroll = HGQuAfterOpen
    DatabaseName = 'ParFro'
    SQL.Strings = (
      'Select *'
      'From DHavG G'
      'Where G.No=:n1')
    Left = 18
    Top = 4
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'n1'
        ParamType = ptUnknown
      end>
    object HGQuRadif: TIntegerField
      DisplayLabel = '—œÌ›'
      DisplayWidth = 6
      FieldName = 'Radif'
      Origin = 'PARFRO.DHavG.Radif'
    end
    object HGQuKod: TIntegerField
      DisplayLabel = 'òœ ò«·«'
      DisplayWidth = 7
      FieldName = 'Kod'
      Origin = 'PARFRO.DHavG.Kod'
    end
    object HGQuNam: TStringField
      DisplayLabel = '‘—Õ ò«·«'
      DisplayWidth = 25
      FieldName = 'Nam'
      Origin = 'PARFRO.DHavG.Nam'
      FixedChar = True
      Size = 100
    end
    object HGQuColor: TStringField
      DisplayLabel = '„œ·'
      DisplayWidth = 17
      FieldName = 'Color'
      Origin = 'PARFRO.DHavG.Color'
      FixedChar = True
      Size = 45
    end
    object HGQuAnbnam: TStringField
      DisplayLabel = '«‰»«—'
      DisplayWidth = 15
      FieldName = 'Anbnam'
      Origin = 'PARFRO.DHavG.Anbnam'
      FixedChar = True
      Size = 45
    end
    object HGQuAnbkod: TIntegerField
      FieldName = 'Anbkod'
      Origin = 'PARFRO.DHavG.Anbkod'
      Visible = False
    end
    object HGQuQuant: TFloatField
      DisplayLabel = '„ﬁœ«—'
      DisplayWidth = 10
      FieldName = 'Quant'
      Origin = 'PARFRO.DHavG.Quant'
    end
    object HGQuUnit: TStringField
      DisplayLabel = 'Ê«Õœ'
      DisplayWidth = 12
      FieldKind = fkLookup
      FieldName = 'Unit'
      LookupDataSet = FroDM.Good
      LookupKeyFields = 'Kod'
      LookupResultField = 'Unit'
      KeyFields = 'Kod'
      Origin = 'PARFRO.DHavG.Unit'
      FixedChar = True
      Lookup = True
    end
    object HGQuReject: TFloatField
      DisplayLabel = 'Œ—ÊÃ ‘œÂ'
      DisplayWidth = 8
      FieldName = 'Reject'
      Origin = 'PARFRO.DHavG.Reject'
    end
  end
  object HGDs: TDataSource
    AutoEdit = False
    DataSet = HGQu
    Left = 46
    Top = 4
  end
  object GQu: TQuery
    DatabaseName = 'ParFro'
    SQL.Strings = (
      
        'SELECT D.Dat, D.Nam, D.Ckod, G.Nam, G.Quant, G.Unit, G.Reject, G' +
        '.Kod, D.No'
      'FROM DHav D, DHavG G'
      
        'WHERE  (D.No = G.No)  and (G.Reject Is Null or G.Reject < G.Quan' +
        't) and G.Kod=:n1')
    Left = 34
    Top = 315
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'n1'
        ParamType = ptUnknown
      end>
    object GQuDat: TIntegerField
      DisplayLabel = ' «—ÌŒ'
      FieldName = 'Dat'
      DisplayFormat = '####/##/##'
    end
    object GQuNo: TIntegerField
      DisplayLabel = '‘„«—Â ÕÊ«·Â'
      DisplayWidth = 8
      FieldName = 'No'
    end
    object GQuNam: TStringField
      DisplayLabel = '»Õ”«»'
      DisplayWidth = 18
      FieldName = 'Nam'
      FixedChar = True
      Size = 45
    end
    object GQuCkod: TIntegerField
      DisplayLabel = '»‰«„/„—ò“'
      DisplayWidth = 18
      FieldName = 'Ckod'
    end
    object GQuNam_1: TStringField
      DisplayLabel = '‘—Õ ò«·«'
      DisplayWidth = 28
      FieldName = 'Nam_1'
      FixedChar = True
      Size = 100
    end
    object GQuQuant: TFloatField
      DisplayLabel = '„ﬁœ«—'
      DisplayWidth = 8
      FieldName = 'Quant'
    end
    object GQuUnit: TStringField
      DisplayLabel = 'Ê«Õœ'
      DisplayWidth = 10
      FieldKind = fkLookup
      FieldName = 'Unit'
      LookupDataSet = FroDM.Good
      LookupKeyFields = 'Kod'
      LookupResultField = 'Unit'
      KeyFields = 'Kod'
      FixedChar = True
      Lookup = True
    end
    object GQuReject: TFloatField
      DisplayLabel = ' ÕÊÌ·Ì'
      DisplayWidth = 7
      FieldName = 'Reject'
    end
    object GQuKod: TIntegerField
      DisplayLabel = 'òœ ò«·«'
      DisplayWidth = 10
      FieldName = 'Kod'
      Visible = False
    end
  end
  object GQuDs: TDataSource
    AutoEdit = False
    DataSet = GQu
    Left = 78
    Top = 319
  end
end
