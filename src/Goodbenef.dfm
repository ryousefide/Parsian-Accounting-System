object FGoodBenef: TFGoodBenef
  Tag = 1
  Left = 270
  Top = 87
  BiDiMode = bdRightToLeft
  BorderStyle = bsNone
  Caption = '’Ê—  ”Êœ ò«·«'
  ClientHeight = 656
  ClientWidth = 841
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
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 841
    Height = 69
    Align = alTop
  end
  object Label1: TLabel
    Left = 513
    Top = 5
    Width = 60
    Height = 18
    Anchors = [akTop, akRight]
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '‰«„ Õ”«»'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object Label2: TLabel
    Left = 782
    Top = 11
    Width = 41
    Height = 18
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
    Left = 666
    Top = 11
    Width = 30
    Height = 18
    Anchors = [akTop, akRight]
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '«·Ì'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object Label4: TLabel
    Left = 513
    Top = 35
    Width = 60
    Height = 18
    Anchors = [akTop, akRight]
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
  object Bevel4: TBevel
    Left = 8
    Top = 4
    Width = 209
    Height = 57
    Hint = 'Ã” ÃÊ »— «”«” ﬂœ Â«Ì ›—⁄Ì'
    ParentShowHint = False
    Shape = bsFrame
    ShowHint = True
    Style = bsRaised
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
    Left = 141
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
  object spCalc: TSpeedButton
    Left = 267
    Top = 6
    Width = 23
    Height = 18
    Anchors = [akTop, akRight]
    Flat = True
    OnClick = CTreeClick
  end
  object FAccNam: TComboBox
    Left = 296
    Top = 4
    Width = 210
    Height = 21
    Anchors = [akTop, akRight]
    BiDiMode = bdRightToLeft
    ItemHeight = 13
    ParentBiDiMode = False
    Sorted = True
    TabOrder = 2
    OnKeyDown = FAccNamKeyDown
    OnKeyPress = NextTab
  end
  object SDat: TMaskEdit
    Left = 703
    Top = 10
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
    Left = 585
    Top = 10
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
  object FCentN: TComboBox
    Left = 296
    Top = 34
    Width = 210
    Height = 21
    Anchors = [akTop, akRight]
    BiDiMode = bdRightToLeft
    ItemHeight = 13
    ParentBiDiMode = False
    TabOrder = 3
    OnKeyDown = FCentNKeyDown
    OnKeyPress = NextTab
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
    TabOrder = 4
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
    TabOrder = 5
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
    TabOrder = 6
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
    TabOrder = 7
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 69
    Width = 841
    Height = 587
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 8
    object TabSheet1: TTabSheet
      Caption = '⁄„·ò—œ ›—Ê‘'
      object Splitter1: TSplitter
        Left = 174
        Top = 0
        Width = 4
        Height = 559
        Cursor = crHSplit
      end
      object Panel1: TPanel
        Left = 178
        Top = 0
        Width = 655
        Height = 559
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object Splitter2: TSplitter
          Left = 318
          Top = 0
          Width = 7
          Height = 458
          Cursor = crHSplit
          Beveled = True
        end
        object Splitter5: TSplitter
          Left = 0
          Top = 458
          Width = 655
          Height = 8
          Cursor = crVSplit
          Align = alBottom
          Beveled = True
        end
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 318
          Height = 458
          Align = alLeft
          BorderWidth = 2
          TabOrder = 0
          object Splitter4: TSplitter
            Left = 3
            Top = 250
            Width = 312
            Height = 9
            Cursor = crVSplit
            Align = alTop
            Beveled = True
          end
          object rdbg: TDBGrid
            Left = 3
            Top = 259
            Width = 312
            Height = 161
            Align = alClient
            BiDiMode = bdRightToLeftNoAlign
            DataSource = RKDs
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ParentBiDiMode = False
            TabOrder = 0
            TitleFont.Charset = ARABIC_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
          end
          object kdbg: TDBGrid
            Left = 3
            Top = 38
            Width = 312
            Height = 212
            Align = alTop
            BiDiMode = bdRightToLeftNoAlign
            DataSource = KDs
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ParentBiDiMode = False
            TabOrder = 1
            TitleFont.Charset = ARABIC_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
          end
          object Panel4: TPanel
            Left = 3
            Top = 420
            Width = 312
            Height = 35
            Align = alBottom
            Alignment = taLeftJustify
            BevelOuter = bvNone
            BorderWidth = 5
            Caption = 'Panel4'
            TabOrder = 2
            object Label10: TLabel
              Tag = 1
              Left = 2
              Top = 1
              Width = 120
              Height = 31
              AutoSize = False
              Caption = '„—ÃÊ⁄Ì ›—Ê‘ '
              Layout = tlCenter
            end
          end
          object Panel5: TPanel
            Left = 3
            Top = 3
            Width = 312
            Height = 35
            Align = alTop
            Alignment = taLeftJustify
            BevelOuter = bvNone
            BorderWidth = 5
            Caption = 'Panel5'
            TabOrder = 3
            object Label5: TLabel
              Tag = 1
              Left = 15
              Top = 4
              Width = 82
              Height = 26
              AutoSize = False
              Caption = '›—Ê‘ '
              Layout = tlCenter
            end
          end
        end
        object Panel3: TPanel
          Left = 325
          Top = 0
          Width = 330
          Height = 458
          Align = alClient
          BorderWidth = 2
          TabOrder = 1
          object Splitter3: TSplitter
            Left = 3
            Top = 249
            Width = 324
            Height = 8
            Cursor = crVSplit
            Align = alTop
            Beveled = True
          end
          object Panel6: TPanel
            Left = 3
            Top = 3
            Width = 324
            Height = 35
            Align = alTop
            Alignment = taLeftJustify
            BevelOuter = bvNone
            BorderWidth = 5
            Caption = 'Panel6'
            TabOrder = 0
            object Label11: TLabel
              Tag = 1
              Left = 10
              Top = 3
              Width = 107
              Height = 25
              AutoSize = False
              Caption = '»Â«Ì  „«„ ‘œÂ'
              Layout = tlCenter
            end
          end
          object Hdbg: TDBGrid
            Left = 3
            Top = 38
            Width = 324
            Height = 211
            Align = alTop
            BiDiMode = bdRightToLeftNoAlign
            DataSource = HDs
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ParentBiDiMode = False
            TabOrder = 1
            TitleFont.Charset = ARABIC_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
          end
          object Panel8: TPanel
            Left = 3
            Top = 420
            Width = 324
            Height = 35
            Align = alBottom
            Alignment = taLeftJustify
            BevelOuter = bvNone
            BorderWidth = 5
            Caption = 'Panel8'
            TabOrder = 2
            object Label12: TLabel
              Tag = 1
              Left = 2
              Top = 1
              Width = 120
              Height = 31
              AutoSize = False
              Caption = '»—ê‘  »Â «‰»«—'
              Layout = tlCenter
            end
          end
          object Rhdbg: TDBGrid
            Left = 3
            Top = 257
            Width = 324
            Height = 163
            Align = alClient
            BiDiMode = bdRightToLeftNoAlign
            DataSource = RHDs
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ParentBiDiMode = False
            TabOrder = 3
            TitleFont.Charset = ARABIC_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
          end
        end
        object Panel7: TPanel
          Left = 0
          Top = 466
          Width = 655
          Height = 93
          Align = alBottom
          Caption = 'Panel7'
          TabOrder = 2
        end
      end
      object CTree: TTreeView
        Tag = 1
        Left = 0
        Top = 0
        Width = 174
        Height = 559
        Align = alLeft
        BiDiMode = bdRightToLeft
        Color = 15000804
        DragMode = dmAutomatic
        HideSelection = False
        HotTrack = True
        Indent = 19
        ParentBiDiMode = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 1
        OnClick = CTreeClick
      end
    end
  end
  object KQu: TQuery
    DatabaseName = 'ParFro'
    SQL.Strings = (
      
        'SELECT  SUM(I.Ptotal) AS PSum,SUM(I.Quant) AS QSum, H.Kol, H.Mo,' +
        ' H.Taf, H.Des'
      'FROM         Invogood I CROSS JOIN GChart H'
      
        'WHERE I.Kod IN (SELECT Kod FROM  Goods G  WHERE  G.Kol = H.Kol A' +
        'ND G.Mo = H.Mo AND G.taf = H.taf )'
      'GROUP BY H.Kol, H.Mo, H.Taf,H.Des'
      'Order by H.Kol'
      ''
      ' ')
    Left = 237
    Top = 4
    object KQuDes: TStringField
      DisplayLabel = '‘—Õ'
      DisplayWidth = 28
      FieldName = 'Des'
      FixedChar = True
      Size = 45
    end
    object KQuQSum: TFloatField
      Alignment = taCenter
      DisplayLabel = '„ﬁœ«—'
      DisplayWidth = 12
      FieldName = 'QSum'
    end
    object KQuPSum: TCurrencyField
      Alignment = taLeftJustify
      DisplayLabel = 'Ã„⁄ (—Ì«·)'
      DisplayWidth = 24
      FieldName = 'PSum'
    end
    object KQuKol: TSmallintField
      DisplayWidth = 12
      FieldName = 'Kol'
      Visible = False
    end
    object KQuMo: TSmallintField
      FieldName = 'Mo'
      Visible = False
    end
    object KQuTaf: TSmallintField
      FieldName = 'Taf'
      Visible = False
    end
  end
  object KDs: TDataSource
    DataSet = KQu
    Left = 265
    Top = 4
  end
  object RKQu: TQuery
    DatabaseName = 'ParFro'
    SQL.Strings = (
      
        'SELECT  SUM(I.Ptotal) AS PSum,SUM(I.Quant) AS QSum, H.Kol, H.Mo,' +
        ' H.Taf, H.Des'
      'FROM         RejInvogood I CROSS JOIN GChart H'
      
        'WHERE I.Kod IN (SELECT Kod FROM  Goods G  WHERE  G.Kol = H.Kol A' +
        'ND G.Mo = H.Mo AND G.taf = H.taf )'
      'GROUP BY H.Kol,H.Mo,H.Taf,H.Des'
      'Order by H.Kol'
      ''
      ' ')
    Left = 238
    Top = 36
    object StringField1: TStringField
      DisplayLabel = '‘—Õ'
      DisplayWidth = 25
      FieldName = 'Des'
      FixedChar = True
      Size = 45
    end
    object FloatField1: TFloatField
      Alignment = taCenter
      DisplayLabel = '„ﬁœ«—'
      DisplayWidth = 12
      FieldName = 'QSum'
    end
    object RKQuPsum: TCurrencyField
      Alignment = taLeftJustify
      DisplayLabel = 'Ã„⁄ (—Ì«·)'
      DisplayWidth = 28
      FieldName = 'PSum'
    end
    object RKQuKol: TSmallintField
      DisplayWidth = 12
      FieldName = 'Kol'
      Visible = False
    end
    object RKQuMo: TSmallintField
      FieldName = 'Mo'
      Visible = False
    end
    object RKQuTaf: TSmallintField
      FieldName = 'Taf'
      Visible = False
    end
  end
  object RKDs: TDataSource
    DataSet = RKQu
    Left = 266
    Top = 36
  end
  object HQu: TQuery
    DatabaseName = 'ParFro'
    SQL.Strings = (
      
        'SELECT  SUM(I.Ptotal) AS PSum,SUM(I.Quant) AS QSum, H.Kol, H.Mo,' +
        ' H.Taf, H.Des'
      'FROM         DHavg I CROSS JOIN GChart H'
      
        'WHERE I.Kod IN (SELECT Kod FROM  Goods G  WHERE  G.Kol = H.Kol A' +
        'ND G.Mo = H.Mo AND G.taf = H.taf )'
      'GROUP BY H.Kol, H.Mo, H.Taf,H.Des'
      'Order by H.Kol'
      ''
      ' '
      ' ')
    Left = 306
    Top = 4
    object StringField2: TStringField
      DisplayLabel = '‘—Õ'
      DisplayWidth = 25
      FieldName = 'Des'
      FixedChar = True
      Size = 45
    end
    object FloatField2: TFloatField
      Alignment = taCenter
      DisplayLabel = '„ﬁœ«—'
      DisplayWidth = 12
      FieldName = 'QSum'
    end
    object HQuPsum: TCurrencyField
      Alignment = taLeftJustify
      DisplayLabel = 'Ã„⁄ (—Ì«·)'
      DisplayWidth = 25
      FieldName = 'PSum'
    end
    object SmallintField1: TSmallintField
      DisplayWidth = 12
      FieldName = 'Kol'
      Visible = False
    end
    object SmallintField2: TSmallintField
      FieldName = 'Mo'
      Visible = False
    end
    object SmallintField3: TSmallintField
      FieldName = 'Taf'
      Visible = False
    end
  end
  object HDs: TDataSource
    DataSet = HQu
    Left = 334
    Top = 4
  end
  object RHQu: TQuery
    DatabaseName = 'ParFro'
    SQL.Strings = (
      
        'SELECT  SUM(I.Quant *I.Reject) AS PSum,SUM(I.Quant) AS QSum, H.K' +
        'ol, H.Mo, H.Taf, H.Des'
      'FROM         RejInvogood I CROSS JOIN GChart H'
      
        'WHERE I.Kod IN (SELECT Kod FROM  Goods G  WHERE  G.Kol = H.Kol A' +
        'ND G.Mo = H.Mo AND G.taf = H.taf )'
      'GROUP BY H.Kol,H.Mo,H.Taf,H.Des'
      'Order by H.Kol'
      ''
      ' '
      ' ')
    Left = 305
    Top = 36
    object StringField3: TStringField
      DisplayLabel = '‘—Õ'
      DisplayWidth = 25
      FieldName = 'Des'
      FixedChar = True
      Size = 45
    end
    object FloatField3: TFloatField
      Alignment = taCenter
      DisplayLabel = '„ﬁœ«—'
      DisplayWidth = 12
      FieldName = 'QSum'
    end
    object RHQuPsum: TCurrencyField
      Alignment = taLeftJustify
      DisplayLabel = 'Ã„⁄ (—Ì«·)'
      DisplayWidth = 28
      FieldName = 'PSum'
    end
    object SmallintField4: TSmallintField
      DisplayWidth = 12
      FieldName = 'Kol'
      Visible = False
    end
    object SmallintField5: TSmallintField
      FieldName = 'Mo'
      Visible = False
    end
    object SmallintField6: TSmallintField
      FieldName = 'Taf'
      Visible = False
    end
  end
  object RHDs: TDataSource
    DataSet = RHQu
    Left = 335
    Top = 36
  end
end
