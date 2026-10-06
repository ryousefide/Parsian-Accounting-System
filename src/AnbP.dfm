object FAnbP: TFAnbP
  Tag = 1
  Left = 211
  Top = 153
  BiDiMode = bdRightToLeft
  BorderStyle = bsNone
  Caption = '«—“‘ —Ì«·Ì «‰»«—Â«'
  ClientHeight = 570
  ClientWidth = 1017
  Color = clBtnFace
  Font.Charset = ARABIC_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 219
    Top = 0
    Width = 13
    Height = 510
    Cursor = crHSplit
    Beveled = True
  end
  object Panel1: TPanel
    Left = 0
    Top = 510
    Width = 1017
    Height = 60
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    Visible = False
    object Label2: TLabel
      Left = 7
      Top = 10
      Width = 543
      Height = 30
      AutoSize = False
      Caption = '                                                         '
    end
    object PrgB: TProgressBar
      Left = 0
      Top = 48
      Width = 1017
      Height = 12
      Align = alBottom
      Min = 0
      Max = 100
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 232
    Top = 0
    Width = 785
    Height = 510
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object dbg: TDBGrid
      Left = 0
      Top = 85
      Width = 785
      Height = 425
      Align = alClient
      DataSource = Ds
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = ARABIC_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'Nam'
          Title.Alignment = taCenter
          Title.Caption = '‘—Õ'
          Width = 207
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Color'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Anb'
          Title.Alignment = taCenter
          Title.Caption = '«‰»«—'
          Width = 114
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Rem'
          Title.Alignment = taCenter
          Title.Caption = '„ÊÃÊœÌ'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Fee'
          Title.Alignment = taCenter
          Title.Caption = 'ﬁÌ„ '
          Width = 93
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Prem'
          Title.Alignment = taCenter
          Title.Caption = 'Ã„⁄ «—“‘ »Â —Ì«·'
          Width = 156
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Diag'
          Title.Caption = '›Ì »«“«—'
          Width = 93
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Pdiag'
          Title.Caption = ' «—“‘ »«“«—'
          Width = 156
          Visible = True
        end>
    end
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 785
      Height = 85
      Align = alTop
      BevelInner = bvLowered
      BevelWidth = 2
      BorderStyle = bsSingle
      TabOrder = 1
      object Label1: TLabel
        Left = 722
        Top = 48
        Width = 49
        Height = 18
        Anchors = [akTop, akRight]
        AutoSize = False
        Caption = '‰«„ «‰»«—'
        Transparent = True
      end
      object BShow: TSpeedButton
        Left = 534
        Top = 46
        Width = 23
        Height = 22
        Anchors = [akTop, akRight]
        Flat = True
        OnClick = BshowClick
      end
      object spPrint: TSpeedButton
        Left = 511
        Top = 46
        Width = 23
        Height = 22
        Anchors = [akTop, akRight]
        Flat = True
        OnClick = spPrintClick
      end
      object cmbAnb: TComboBox
        Left = 563
        Top = 47
        Width = 154
        Height = 21
        Anchors = [akTop, akRight]
        ItemHeight = 13
        TabOrder = 0
      end
      object RG: TRadioGroup
        Left = 4
        Top = 4
        Width = 773
        Height = 40
        Align = alTop
        Columns = 4
        ItemIndex = 0
        Items.Strings = (
          '»Â  ›ﬂÌﬂ „ÊÃÊœÌ «‰»«— '
          'Œ·«’Â «‰»«— '
          '»Â  ›ﬂÌﬂ „ÊÃÊœÌ ﬂ· «‰»«— Â«'
          'Œ·«’Â ﬂ· «‰»«— Â«')
        TabOrder = 1
      end
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 0
    Width = 219
    Height = 510
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 2
    object Bevel1: TBevel
      Left = 0
      Top = 0
      Width = 219
      Height = 69
      Align = alTop
    end
    object Label6: TLabel
      Left = 141
      Top = 10
      Width = 43
      Height = 21
      Alignment = taCenter
      AutoSize = False
      BiDiMode = bdRightToLeft
      Caption = 'ﬂœﬂ·'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
    end
    object Label7: TLabel
      Left = 59
      Top = 10
      Width = 33
      Height = 21
      Alignment = taCenter
      AutoSize = False
      BiDiMode = bdRightToLeft
      Caption = '„⁄Ì‰'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
    end
    object Label8: TLabel
      Left = 143
      Top = 34
      Width = 65
      Height = 21
      Alignment = taCenter
      AutoSize = False
      BiDiMode = bdRightToLeft
      Caption = ' ›’Ì·Ì «“'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
    end
    object Label9: TLabel
      Left = 61
      Top = 34
      Width = 30
      Height = 21
      Alignment = taCenter
      AutoSize = False
      BiDiMode = bdRightToLeft
      Caption = '«·‹‹Ì'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
    end
    object FKod1: TEdit
      Left = 97
      Top = 10
      Width = 40
      Height = 21
      AutoSize = False
      BiDiMode = bdRightToLeft
      MaxLength = 3
      ParentBiDiMode = False
      TabOrder = 0
    end
    object FKod2: TEdit
      Left = 16
      Top = 10
      Width = 40
      Height = 21
      AutoSize = False
      BiDiMode = bdRightToLeft
      MaxLength = 3
      ParentBiDiMode = False
      TabOrder = 1
    end
    object FKod3: TEdit
      Left = 97
      Top = 34
      Width = 40
      Height = 21
      AutoSize = False
      BiDiMode = bdRightToLeft
      MaxLength = 4
      ParentBiDiMode = False
      TabOrder = 2
    end
    object FKod31: TEdit
      Left = 16
      Top = 34
      Width = 40
      Height = 21
      AutoSize = False
      BiDiMode = bdRightToLeft
      MaxLength = 4
      ParentBiDiMode = False
      TabOrder = 3
    end
    object CTree: TTreeView
      Tag = 1
      Left = 0
      Top = 69
      Width = 219
      Height = 441
      Align = alClient
      BiDiMode = bdRightToLeft
      Color = 15000804
      DragMode = dmAutomatic
      HideSelection = False
      Indent = 19
      ParentBiDiMode = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 4
      OnClick = CTreeClick
    end
  end
  object DepQu: TQuery
    DatabaseName = 'ParFro'
    SQL.Strings = (
      'Select * '
      'From Depot'
      'Where AnbNam = :Anb1 And Quant > 0'
      'Order By Nam')
    Left = 247
    Top = 51
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Anb1'
        ParamType = ptUnknown
      end>
  end
  object GQu: TQuery
    DatabaseName = 'ParFro'
    SQL.Strings = (
      'Select * From AnbP')
    Left = 278
    Top = 52
    object GQuId: TIntegerField
      FieldName = 'Id'
      Origin = 'PARFRO."Cardex.DB".Id'
    end
    object GQuDat: TIntegerField
      FieldName = 'Dat'
      Origin = 'PARFRO."Cardex.DB".Dat'
    end
    object GQuNam: TStringField
      FieldName = 'Nam'
      Origin = 'PARFRO."Cardex.DB".Nam'
      Size = 100
    end
    object GQuColor: TStringField
      FieldName = 'Color'
      Origin = 'PARFRO."Cardex.DB".Color'
      Size = 45
    end
    object GQuAnb: TStringField
      FieldName = 'Anb'
      Origin = 'PARFRO."Cardex.DB".Anb'
      Size = 45
    end
    object GQuAnbKod: TIntegerField
      FieldName = 'AnbKod'
      Origin = 'PARFRO."Cardex.DB".AnbKod'
    end
    object GQuIn: TFloatField
      FieldName = 'IIn'
      Origin = 'PARFRO."Cardex.DB".In'
    end
    object GQuOut: TFloatField
      FieldName = 'Out'
      Origin = 'PARFRO."Cardex.DB".Out'
    end
    object GQuRem: TFloatField
      FieldName = 'Rem'
      Origin = 'PARFRO."Cardex.DB".Rem'
    end
    object GQuNo: TIntegerField
      FieldName = 'No'
      Origin = 'PARFRO."Cardex.DB".No'
    end
    object GQuDes: TStringField
      FieldName = 'Des'
      Origin = 'PARFRO."Cardex.DB".Des'
    end
    object GQuFacnam: TStringField
      FieldName = 'Facnam'
      Origin = 'PARFRO."Cardex.DB".Facnam'
      Size = 45
    end
    object GQuFee: TCurrencyField
      FieldName = 'Fee'
      Origin = 'PARFRO."Cardex.DB".Fee'
    end
    object GQuPerc: TFloatField
      FieldName = 'Perc'
      Origin = 'PARFRO."Cardex.DB".Perc'
    end
    object GQuPrem: TCurrencyField
      FieldName = 'Prem'
      Origin = 'PARFRO."Cardex.DB".Prem'
    end
    object GQuDiag: TFloatField
      FieldName = 'Diag'
      Origin = 'PARFRO."Cardex.DB".Diag'
    end
    object GQuPdiag: TCurrencyField
      FieldName = 'Pdiag'
      Origin = 'PARFRO."Cardex.DB".Pdiag'
    end
  end
  object Ds: TDataSource
    DataSet = GQu
    Left = 306
    Top = 51
  end
  object QFee: TQuery
    DatabaseName = 'ParFro'
    SQL.Strings = (
      'SELECT     Kod, Color,SUM(Quant * Pfee) / SUM(Quant)  Fee'
      'FROM         Invogood'
      ''
      'GROUP BY Kod,Color'
      'ORDER BY Kod')
    Left = 280
    Top = 122
    object QFeeKod: TIntegerField
      FieldName = 'Kod'
    end
    object QFeeColor: TStringField
      FieldName = 'Color'
      FixedChar = True
      Size = 45
    end
    object QFeeFee: TFloatField
      FieldName = 'Fee'
    end
  end
end
