object FGProfit: TFGProfit
  Tag = 1
  Left = 227
  Top = 104
  BiDiMode = bdRightToLeft
  BorderStyle = bsSingle
  Caption = '¬‰«·Ì“„’—› „ÊÃÊœÌ «‰»«—Â«'
  ClientHeight = 494
  ClientWidth = 1056
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
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel4: TBevel
    Left = 0
    Top = 0
    Width = 1056
    Height = 73
    Align = alTop
  end
  object Bevel5: TBevel
    Left = 2
    Top = 4
    Width = 209
    Height = 57
    Hint = 'Ã” ÃÊ »— «”«” ﬂœ Â«Ì ›—⁄Ì'
    ParentShowHint = False
    Shape = bsFrame
    ShowHint = True
    Style = bsRaised
  end
  object Label8: TLabel
    Left = 135
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
  object Label9: TLabel
    Left = 53
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
  object Label10: TLabel
    Left = 135
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
  object Label11: TLabel
    Left = 55
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
  object Splitter2: TSplitter
    Left = 171
    Top = 73
    Width = 5
    Height = 402
    Cursor = crHSplit
    Beveled = True
  end
  object Splitter1: TSplitter
    Left = 299
    Top = 73
    Width = 5
    Height = 402
    Cursor = crHSplit
    Beveled = True
  end
  object Label2: TLabel
    Left = 549
    Top = 8
    Width = 40
    Height = 18
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '„œ·'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object Label3: TLabel
    Left = 550
    Top = 37
    Width = 40
    Height = 18
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = 'œ— «‰»«—'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object BPrint: TButton
    Left = 304
    Top = 33
    Width = 91
    Height = 25
    Caption = '&ç«Å'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 1
    OnClick = BPrintClick
  end
  object BShow: TButton
    Left = 304
    Top = 7
    Width = 91
    Height = 25
    Caption = 'ê“«—‘ ﬂ·'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 0
    OnClick = BShowClick
  end
  object FKod1: TEdit
    Left = 91
    Top = 10
    Width = 40
    Height = 21
    AutoSize = False
    BiDiMode = bdRightToLeft
    MaxLength = 3
    ParentBiDiMode = False
    TabOrder = 2
  end
  object FKod2: TEdit
    Left = 10
    Top = 10
    Width = 40
    Height = 21
    AutoSize = False
    BiDiMode = bdRightToLeft
    MaxLength = 3
    ParentBiDiMode = False
    TabOrder = 3
  end
  object FKod3: TEdit
    Left = 91
    Top = 34
    Width = 40
    Height = 21
    AutoSize = False
    BiDiMode = bdRightToLeft
    MaxLength = 4
    ParentBiDiMode = False
    TabOrder = 4
  end
  object FKod31: TEdit
    Left = 10
    Top = 34
    Width = 40
    Height = 21
    AutoSize = False
    BiDiMode = bdRightToLeft
    MaxLength = 4
    ParentBiDiMode = False
    TabOrder = 5
  end
  object CTree: TTreeView
    Tag = 1
    Left = 0
    Top = 73
    Width = 171
    Height = 402
    Align = alLeft
    BiDiMode = bdRightToLeft
    Color = 15000804
    DragMode = dmAutomatic
    HideSelection = False
    Indent = 19
    ParentBiDiMode = False
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 6
    OnClick = CTreeClick
  end
  object SB: TStatusBar
    Left = 0
    Top = 475
    Width = 1056
    Height = 19
    Panels = <
      item
        BiDiMode = bdRightToLeft
        ParentBiDiMode = False
        Text = 'F3=‰„«Ì‘'
        Width = 150
      end
      item
        BiDiMode = bdRightToLeft
        ParentBiDiMode = False
        Text = '       '
        Width = 50
      end
      item
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        Width = 50
      end>
    ParentFont = True
    SimplePanel = False
    SizeGrip = False
    UseSystemFont = False
  end
  object GList: TXPListBox
    Left = 176
    Top = 73
    Width = 123
    Height = 402
    Hint = '·Ì”  ò«·«Â«Ì ê—ÊÂ'
    Align = alLeft
    ItemHeight = 13
    ParentShowHint = False
    ShowHint = True
    Sorted = True
    TabOrder = 8
  end
  object Color: TComboBox
    Left = 406
    Top = 5
    Width = 133
    Height = 21
    ItemHeight = 13
    Sorted = True
    TabOrder = 9
    OnKeyPress = NextTab
  end
  object Anb: TComboBox
    Left = 406
    Top = 34
    Width = 132
    Height = 21
    ItemHeight = 13
    Sorted = True
    TabOrder = 10
    OnKeyPress = NextTab
  end
  object Panel1: TPanel
    Left = 304
    Top = 73
    Width = 752
    Height = 402
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 3
    BorderStyle = bsSingle
    Caption = 'Panel1'
    TabOrder = 11
    object dbg: TDBGrid
      Left = 5
      Top = 5
      Width = 738
      Height = 232
      Align = alClient
      DataSource = Ds
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = ARABIC_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Serif'
      TitleFont.Style = []
      OnKeyPress = dbgKeyPress
      Columns = <
        item
          Expanded = False
          FieldName = 'Nam'
          Title.Alignment = taCenter
          Title.Caption = '‘—Õ ò«·«'
          Width = 224
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Color'
          Title.Caption = '„œ·'
          Width = 73
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Anb'
          Title.Alignment = taCenter
          Title.Caption = '«‰»«—'
          Width = 105
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Rem'
          Title.Alignment = taCenter
          Title.Caption = 'Ã„⁄ Œ—Ìœ'
          Width = 124
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Prem'
          Title.Alignment = taCenter
          Title.Caption = '»Â«Ì ò«·«Ì ›—Ê‘ —› Â'
          Width = 101
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IIn'
          Title.Alignment = taCenter
          Title.Caption = '„’—›Ì œ—  Ê·Ìœ'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'Diag'
          Title.Alignment = taCenter
          Title.Caption = '«—“‘ „ÊÃÊœÌ'
          Width = 97
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Out'
          Title.Alignment = taCenter
          Title.Caption = '„ÊÃÊœÌ'
          Width = 78
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Perc'
          Title.Alignment = taCenter
          Title.Caption = 'ﬁÌ„   „«„ ‘œÂ'
          Width = 97
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Fee'
          Title.Alignment = taCenter
          Title.Caption = '›—Ê‘'
          Width = 122
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Pdiag'
          Title.Alignment = taCenter
          Title.Caption = '”Êœ'
          Width = 88
          Visible = True
        end>
    end
    object Panel2: TPanel
      Left = 5
      Top = 330
      Width = 738
      Height = 63
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      Visible = False
      object lGname: TLabel
        Left = 0
        Top = 0
        Width = 738
        Height = 53
        Align = alClient
        Alignment = taRightJustify
        AutoSize = False
        BiDiMode = bdLeftToRight
        Caption = 'SDASDSADSADASDSADASDAS'
        ParentBiDiMode = False
        Transparent = True
        Layout = tlCenter
      end
      object PrgB: TProgressBar
        Left = 0
        Top = 53
        Width = 738
        Height = 10
        Align = alBottom
        Min = 0
        Max = 100
        TabOrder = 0
      end
    end
    object Panel3: TPanel
      Left = 5
      Top = 237
      Width = 738
      Height = 93
      Align = alBottom
      TabOrder = 2
      object Label1: TLabel
        Left = 570
        Top = 5
        Width = 161
        Height = 18
        Anchors = [akTop, akRight]
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = '«—“‘ „ÊÃÊœÌ'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
      end
      object Label4: TLabel
        Left = 376
        Top = 6
        Width = 161
        Height = 18
        Anchors = [akTop, akRight]
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = '›—Ê‘'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
      end
      object Label5: TLabel
        Left = 195
        Top = 7
        Width = 161
        Height = 18
        Anchors = [akTop, akRight]
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = '»Â«Ì  „«„ ‘œÂ'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
      end
      object Label6: TLabel
        Left = 22
        Top = 8
        Width = 161
        Height = 18
        Anchors = [akTop, akRight]
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = '”Êœ'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
      end
      object Label7: TLabel
        Left = -1
        Top = 58
        Width = 420
        Height = 31
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = '„œ·'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
      end
      object FValue: TEdit
        Left = 552
        Top = 33
        Width = 181
        Height = 21
        TabStop = False
        Anchors = [akTop, akRight]
        ReadOnly = True
        TabOrder = 0
      end
      object FSold: TEdit
        Left = 365
        Top = 33
        Width = 181
        Height = 21
        TabStop = False
        Anchors = [akTop, akRight]
        ReadOnly = True
        TabOrder = 1
      end
      object FTam: TEdit
        Left = 189
        Top = 33
        Width = 169
        Height = 21
        TabStop = False
        Anchors = [akTop, akRight]
        ReadOnly = True
        TabOrder = 2
      end
      object Fbenef: TEdit
        Left = 11
        Top = 33
        Width = 169
        Height = 21
        TabStop = False
        Anchors = [akTop, akRight]
        ReadOnly = True
        TabOrder = 3
      end
    end
  end
  object FGNam: TComboBox
    Left = 600
    Top = 8
    Width = 367
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    ItemHeight = 13
    Sorted = True
    TabOrder = 12
    OnKeyDown = FGNamKeyDown
    OnKeyPress = NextTab
  end
  object BQu: TQuery
    DatabaseName = 'ParFro'
    SQL.Strings = (
      'Select *'
      'From Depot '
      'Order by Nam')
    Left = 243
    Top = 4
    object BQuId: TIntegerField
      FieldName = 'Id'
    end
    object BQuKod: TIntegerField
      FieldName = 'Kod'
    end
    object BQuGene: TIntegerField
      FieldName = 'Gene'
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
    object BQuAnbkod: TFloatField
      FieldName = 'Anbkod'
      Origin = 'PARFRO.Depot.Anbkod'
    end
    object BQuQuant: TFloatField
      FieldName = 'Quant'
    end
  end
  object GQu: TQuery
    DatabaseName = 'ParFro'
    SQL.Strings = (
      'Select * From Cardex')
    Left = 270
    Top = 4
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
      currency = True
    end
    object GQuOut: TFloatField
      FieldName = 'Out'
    end
    object GQuRem: TFloatField
      FieldName = 'Rem'
      currency = True
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
      currency = True
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
    AutoEdit = False
    DataSet = GQu
    Left = 268
    Top = 32
  end
  object QSum: TQuery
    DatabaseName = 'ParFro'
    SQL.Strings = (
      
        'Select Sum(Rem),Sum(PRem),Sum(Diag),Sum(Fee),Sum(PDiag),Sum(C.II' +
        'n)'
      'From Cardex C')
    Left = 216
    Top = 4
  end
end
