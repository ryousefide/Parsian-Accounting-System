object FCustEst: TFCustEst
  Tag = 1
  Left = 324
  Top = 51
  BiDiMode = bdRightToLeft
  BorderStyle = bsNone
  Caption = '«” ⁄·«„ „‘ —Ì'
  ClientHeight = 565
  ClientWidth = 940
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
    Width = 940
    Height = 69
    Align = alTop
  end
  object Label1: TLabel
    Left = 612
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
    Left = 881
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
    Left = 765
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
    Left = 612
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
    Left = 360
    Top = 6
    Width = 23
    Height = 18
    Anchors = [akTop, akRight]
    Flat = True
    OnClick = spCalcClick
  end
  object FAccNam: TComboBox
    Left = 395
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
    Left = 802
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
    Left = 684
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
    Left = 395
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
    Width = 940
    Height = 496
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 8
    object TabSheet1: TTabSheet
      Caption = '⁄„·ò—œ ›—Ê‘'
      object Splitter1: TSplitter
        Left = 188
        Top = 0
        Width = 4
        Height = 468
        Cursor = crHSplit
      end
      object Panel1: TPanel
        Left = 192
        Top = 0
        Width = 740
        Height = 468
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object Splitter2: TSplitter
          Left = 326
          Top = 0
          Width = 4
          Height = 468
          Cursor = crHSplit
        end
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 326
          Height = 468
          Align = alLeft
          TabOrder = 0
          object Label5: TLabel
            Tag = 1
            Left = 1
            Top = 1
            Width = 324
            Height = 36
            Align = alTop
            Alignment = taCenter
            AutoSize = False
            Caption = '›—Ê‘ '
            Layout = tlCenter
          end
          object Splitter3: TSplitter
            Left = 1
            Top = 244
            Width = 324
            Height = 7
            Cursor = crVSplit
            Align = alBottom
            Beveled = True
          end
          object Label10: TLabel
            Tag = 1
            Left = 1
            Top = 251
            Width = 324
            Height = 30
            Align = alBottom
            Alignment = taCenter
            AutoSize = False
            Caption = '„—ÃÊ⁄Ì ›—Ê‘ '
            Layout = tlCenter
          end
          object rdbg: TDBGrid
            Left = 1
            Top = 281
            Width = 324
            Height = 186
            Align = alBottom
            BiDiMode = bdRightToLeftReadingOnly
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
            Left = 1
            Top = 37
            Width = 324
            Height = 207
            Align = alClient
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
        end
        object Panel3: TPanel
          Left = 330
          Top = 0
          Width = 410
          Height = 468
          Align = alClient
          TabOrder = 1
          object Splitter4: TSplitter
            Left = 1
            Top = 247
            Width = 408
            Height = 4
            Cursor = crVSplit
            Align = alBottom
          end
          object Label11: TLabel
            Tag = 1
            Left = 1
            Top = 251
            Width = 408
            Height = 30
            Align = alBottom
            Alignment = taCenter
            AutoSize = False
            Caption = '«ﬁ·«„ „—ÃÊ⁄Ì ›—Ê‘ '
            Layout = tlCenter
          end
          object Label16: TLabel
            Tag = 1
            Left = 1
            Top = 1
            Width = 408
            Height = 36
            Align = alTop
            Alignment = taCenter
            AutoSize = False
            Caption = '«ﬁ·«„ ›—Ê‘ '
            Layout = tlCenter
          end
          object Gdbg: TDBGrid
            Left = 1
            Top = 37
            Width = 408
            Height = 210
            Align = alClient
            BiDiMode = bdRightToLeftNoAlign
            DataSource = GDs
            Options = [dgTitles, dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ParentBiDiMode = False
            TabOrder = 0
            TitleFont.Charset = ARABIC_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
          end
          object RGdbg: TDBGrid
            Left = 1
            Top = 281
            Width = 408
            Height = 186
            Align = alBottom
            BiDiMode = bdRightToLeftReadingOnly
            DataSource = RGDs
            Options = [dgTitles, dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ParentBiDiMode = False
            TabOrder = 1
            TitleFont.Charset = ARABIC_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
          end
        end
      end
      object CTree: TTreeView
        Tag = 1
        Left = 0
        Top = 0
        Width = 188
        Height = 468
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
    object TabSheet2: TTabSheet
      Caption = '⁄„·ò—œ „«·Ì'
      ImageIndex = 1
      object Label12: TLabel
        Left = 267
        Top = 12
        Width = 94
        Height = 24
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = '„«‰œÂ  Õ”«»'
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
        Left = 268
        Top = 50
        Width = 94
        Height = 24
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = 'çò Ê’Ê· ‰‘œÂ'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        Layout = tlCenter
      end
      object Label14: TLabel
        Left = 268
        Top = 86
        Width = 94
        Height = 24
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = '»—ê‘ Ì  Ê’Ê· ‰‘œÂ'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        Layout = tlCenter
      end
      object Label15: TLabel
        Left = 268
        Top = 149
        Width = 94
        Height = 24
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = '„«‰œÂ Õ”«» œ—êÌ—'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        Layout = tlCenter
      end
      object Label18: TLabel
        Left = 268
        Top = 192
        Width = 94
        Height = 24
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = 'Ã„⁄ ÕÊ«·Â Œ—ÊÃ ‰‘œÂ'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        Layout = tlCenter
      end
      object FRem: TEdit
        Left = 53
        Top = 13
        Width = 213
        Height = 21
        TabOrder = 0
        Text = '„«‰œÂ —Ì«·Ì'
      end
      object Rdbg3: TDBGrid
        Left = 386
        Top = 330
        Width = 545
        Height = 120
        Anchors = [akLeft, akTop, akRight]
        DataSource = RDs3
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 1
        TitleFont.Charset = ARABIC_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object Rdbg4: TDBGrid
        Left = 386
        Top = 482
        Width = 545
        Height = 120
        Anchors = [akLeft, akTop, akRight]
        DataSource = RDs4
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 2
        TitleFont.Charset = ARABIC_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object StaticText1: TStaticText
        Left = 389
        Top = 304
        Width = 540
        Height = 23
        Alignment = taCenter
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        BiDiMode = bdLeftToRight
        Caption = '·Ì”  ò· çò Â«Ì œ—Ì«› Ì'
        ParentBiDiMode = False
        TabOrder = 3
      end
      object StaticText2: TStaticText
        Left = 389
        Top = 456
        Width = 542
        Height = 23
        Alignment = taCenter
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        BiDiMode = bdLeftToRight
        Caption = '·Ì”  çò Â«Ì »—ê‘ Ì Ê’Ê· ‘œÂ'
        ParentBiDiMode = False
        TabOrder = 4
      end
      object StaticText3: TStaticText
        Left = 391
        Top = 3
        Width = 540
        Height = 22
        Alignment = taCenter
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        BiDiMode = bdLeftToRight
        Caption = '·Ì”   çò Â«Ì Ê’Ê· ‰‘œÂ'
        ParentBiDiMode = False
        TabOrder = 5
      end
      object Rdbg1: TDBGrid
        Left = 386
        Top = 30
        Width = 545
        Height = 120
        Anchors = [akLeft, akTop, akRight]
        DataSource = RDs1
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 6
        TitleFont.Charset = ARABIC_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object StaticText4: TStaticText
        Left = 391
        Top = 155
        Width = 540
        Height = 23
        Alignment = taCenter
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        BiDiMode = bdLeftToRight
        Caption = '·Ì”  »—ê‘ Ì Â«Ì Ê’Ê· ‰‘œÂ'
        ParentBiDiMode = False
        TabOrder = 7
      end
      object Rdbg2: TDBGrid
        Left = 386
        Top = 178
        Width = 545
        Height = 120
        Anchors = [akLeft, akTop, akRight]
        DataSource = RDs2
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 8
        TitleFont.Charset = ARABIC_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object FRSum1: TEdit
        Left = 53
        Top = 51
        Width = 213
        Height = 21
        TabOrder = 9
        Text = '„«‰œÂ —Ì«·Ì'
      end
      object FRSum2: TEdit
        Left = 53
        Top = 87
        Width = 213
        Height = 21
        TabOrder = 10
        Text = '„«‰œÂ —Ì«·Ì'
      end
      object FRsum3: TEdit
        Left = 53
        Top = 150
        Width = 213
        Height = 21
        TabOrder = 11
        Text = '„«‰œÂ —Ì«·Ì'
      end
      object FRGSum: TEdit
        Left = 53
        Top = 193
        Width = 213
        Height = 21
        TabOrder = 12
        Text = '„«‰œÂ —Ì«·Ì'
      end
    end
    object TabSheet3: TTabSheet
      Caption = '⁄„·ò—œ «‰»«—'
      ImageIndex = 2
      object Splitter5: TSplitter
        Left = 486
        Top = 0
        Width = 8
        Height = 468
        Cursor = crHSplit
        Align = alRight
        AutoSnap = False
        Beveled = True
      end
      object dbg: TDBGrid
        Left = 494
        Top = 0
        Width = 438
        Height = 468
        Align = alRight
        DataSource = HDs1
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = ARABIC_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = dbgDrawColumnCell
      end
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 486
        Height = 468
        Align = alClient
        TabOrder = 1
        object Label17: TLabel
          Left = 1
          Top = 173
          Width = 484
          Height = 30
          Align = alTop
          Alignment = taCenter
          AutoSize = False
          Caption = '—Ì“ «ﬁ·«„  ÕÊÌ· ‰‘œÂ'
          Layout = tlCenter
        end
        object Splitter6: TSplitter
          Left = 1
          Top = 170
          Width = 484
          Height = 3
          Cursor = crVSplit
          Align = alTop
        end
        object Goods: TDBGrid
          Left = 1
          Top = 1
          Width = 484
          Height = 169
          Align = alTop
          DataSource = HGDs
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = ARABIC_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
        end
        object dbg2: TDBGrid
          Left = 1
          Top = 203
          Width = 484
          Height = 264
          Align = alClient
          DataSource = HG2Ds
          Options = [dgTitles, dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 1
          TitleFont.Charset = ARABIC_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDrawColumnCell = dbg2DrawColumnCell
        end
      end
    end
  end
  object GQu: TQuery
    DatabaseName = 'ParFro'
    SQL.Strings = (
      'Select G.Kod,G.Nam,Sum(Quant),Sum(Ptotal) '
      'From Invogood G , Invoice I'
      'Where  I.No=G.No'
      'Group by G.Kod,G.Nam'
      'order by 3 Desc')
    Left = 297
    Top = 4
    object GQuKod: TIntegerField
      DisplayLabel = 'òœ ò«·«'
      DisplayWidth = 13
      FieldName = 'Kod'
    end
    object GQuNam: TStringField
      DisplayLabel = '‘—Õ ò«·«'
      DisplayWidth = 45
      FieldName = 'Nam'
      FixedChar = True
      Size = 100
    end
    object GQuCOLUMN3: TFloatField
      DisplayLabel = '„ﬁœ«—'
      DisplayWidth = 10
      FieldName = 'COLUMN3'
    end
    object GQuCOLUMN4: TCurrencyField
      DisplayLabel = 'Ã„⁄ —Ì«·Ì'
      DisplayWidth = 30
      FieldName = 'COLUMN4'
    end
  end
  object GDs: TDataSource
    DataSet = GQu
    Left = 324
    Top = 4
  end
  object KQu: TQuery
    AfterOpen = KQuAfterOpen
    AfterScroll = KQuAfterOpen
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
      DisplayWidth = 15
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
      DisplayWidth = 25
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
    AfterOpen = RKQuAfterOpen
    AfterScroll = RKQuAfterOpen
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
      DisplayWidth = 15
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
    object CurrencyField1: TCurrencyField
      Alignment = taLeftJustify
      DisplayLabel = 'Ã„⁄ (—Ì«·)'
      DisplayWidth = 25
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
  object RGQu: TQuery
    DatabaseName = 'ParFro'
    SQL.Strings = (
      'Select G.Kod,G.Nam,Sum(Quant),Sum(Ptotal) '
      'From RejInvogood G , RejInvo I'
      'Where  I.No=G.No'
      'Group by G.Kod,G.Nam')
    Left = 297
    Top = 36
    object TIntegerField
      DisplayLabel = 'òœ ò«·«'
      DisplayWidth = 10
      FieldName = 'Kod'
    end
    object StringField2: TStringField
      DisplayLabel = '‘—Õ ò«·«'
      DisplayWidth = 50
      FieldName = 'Nam'
      FixedChar = True
      Size = 100
    end
    object FloatField2: TFloatField
      DisplayLabel = '„ﬁœ«—'
      DisplayWidth = 10
      FieldName = 'COLUMN3'
    end
    object CurrencyField2: TCurrencyField
      DisplayLabel = 'Ã„⁄ —Ì«·Ì'
      DisplayWidth = 30
      FieldName = 'COLUMN4'
    end
  end
  object RGDs: TDataSource
    DataSet = RGQu
    Left = 326
    Top = 36
  end
  object RQu3: TQuery
    DatabaseName = 'ParFro'
    SQL.Strings = (
      'Select RecDat,BDat,BNo,Pbill,Bank,Reject,Acnam,Ckod'
      'From RCheq'
      'order by recdat'
      ' ')
    Left = 704
    Top = 57
    object RQu3RecDat: TIntegerField
      DisplayLabel = ' «—ÌŒ œ—Ì«› '
      DisplayWidth = 12
      FieldName = 'RecDat'
      Origin = 'PARFRO."RCheq.DB".RecDat'
      DisplayFormat = '####/##/##'
    end
    object RQu3BDat: TIntegerField
      DisplayLabel = '”——”Ìœ'
      DisplayWidth = 12
      FieldName = 'BDat'
      Origin = 'PARFRO."RCheq.DB".Bdat'
      DisplayFormat = '####/##/##'
    end
    object RQu3BNo: TStringField
      DisplayLabel = '”—Ì«·'
      DisplayWidth = 9
      FieldName = 'BNo'
      Origin = 'PARFRO."RCheq.DB".Bno'
    end
    object RQu3Pbill: TCurrencyField
      DisplayLabel = '„»·€'
      DisplayWidth = 20
      FieldName = 'Pbill'
      Origin = 'PARFRO."RCheq.DB".Pbill'
    end
    object RQu3Bank: TStringField
      DisplayLabel = '»«‰ò'
      DisplayWidth = 20
      FieldName = 'Bank'
      Origin = 'PARFRO."RCheq.DB".Bank'
      Size = 45
    end
    object RQu3Reject: TBooleanField
      DisplayWidth = 6
      FieldName = 'Reject'
      Origin = 'PARFRO."RCheq.DB".Reject'
      Visible = False
    end
    object RQu3Acnam: TStringField
      FieldName = 'Acnam'
      Visible = False
      FixedChar = True
      Size = 45
    end
    object RQu3Ckod: TIntegerField
      FieldName = 'Ckod'
      Visible = False
    end
  end
  object RDs3: TDataSource
    DataSet = RQu3
    Left = 732
    Top = 58
  end
  object RQu4: TQuery
    Active = True
    DatabaseName = 'ParFro'
    SQL.Strings = (
      'Select RecDat,BDat,BNo,Pbill,Bank,Reject,Acnam,Ckod'
      'From RCheq'
      'Where Reject=1 and RecKod=1'
      'order by recdat')
    Left = 760
    Top = 57
    object RQu4RecDat: TIntegerField
      DisplayLabel = ' «—ÌŒ œ—Ì«› '
      FieldName = 'RecDat'
      DisplayFormat = '####/##/##'
    end
    object RQu4BDat: TIntegerField
      DisplayLabel = '”——”Ìœ'
      DisplayWidth = 12
      FieldName = 'BDat'
      DisplayFormat = '####/##/##'
    end
    object RQu4BNo: TStringField
      DisplayLabel = '”—Ì«·'
      DisplayWidth = 12
      FieldName = 'BNo'
    end
    object RQu4Pbill: TCurrencyField
      DisplayLabel = '„»·€'
      DisplayWidth = 20
      FieldName = 'Pbill'
    end
    object RQu4Bank: TStringField
      DisplayLabel = '»«‰ò'
      DisplayWidth = 19
      FieldName = 'Bank'
      Size = 45
    end
    object RQu4Reject: TBooleanField
      FieldName = 'Reject'
      Visible = False
    end
    object RQu4Acnam: TStringField
      FieldName = 'Acnam'
      Visible = False
      FixedChar = True
      Size = 45
    end
    object RQu4Ckod: TIntegerField
      FieldName = 'Ckod'
      Visible = False
    end
  end
  object RDs4: TDataSource
    DataSet = RQu4
    Left = 788
    Top = 58
  end
  object RQu1: TQuery
    DatabaseName = 'ParFro'
    SQL.Strings = (
      'Select RecDat,BDat,BNo,Pbill,Bank,Reject,Acnam,Ckod'
      'From RCheq'
      'Where Reckod=0 and Reject = 0'
      'order by recdat')
    Left = 816
    Top = 58
    object RQu1RecDat: TIntegerField
      DisplayLabel = ' «—ÌŒ œ—Ì«› '
      DisplayWidth = 12
      FieldName = 'RecDat'
      Visible = False
      DisplayFormat = '####/##/##'
    end
    object RQu1BDat: TIntegerField
      DisplayLabel = '”——”Ìœ'
      DisplayWidth = 12
      FieldName = 'BDat'
      DisplayFormat = '####/##/##'
    end
    object RQu1BNo: TStringField
      DisplayLabel = '”—Ì«·'
      DisplayWidth = 9
      FieldName = 'BNo'
    end
    object RQu1PBill: TCurrencyField
      DisplayLabel = '„»·€'
      DisplayWidth = 20
      FieldName = 'Pbill'
    end
    object RQu1Bank: TStringField
      DisplayLabel = '»«‰ò'
      DisplayWidth = 20
      FieldName = 'Bank'
      Size = 45
    end
    object RQu1Reject: TBooleanField
      DisplayWidth = 6
      FieldName = 'Reject'
      Visible = False
    end
    object RQu1Acnam: TStringField
      FieldName = 'Acnam'
      Visible = False
      FixedChar = True
      Size = 45
    end
    object RQu1Ckod: TIntegerField
      FieldName = 'Ckod'
      Visible = False
    end
  end
  object RDs1: TDataSource
    DataSet = RQu1
    Left = 844
    Top = 58
  end
  object RQu2: TQuery
    DatabaseName = 'ParFro'
    SQL.Strings = (
      'Select RecDat,BDat,BNo,Pbill,Bank,Reject,Acnam,Ckod'
      'From RCheq'
      'Where Reckod=0 and Reject = 1'
      'order by recdat')
    Left = 872
    Top = 58
    object RQu2RecDat: TIntegerField
      DisplayLabel = ' «—ÌŒ œ—Ì«› '
      DisplayWidth = 12
      FieldName = 'RecDat'
      Visible = False
      DisplayFormat = '####/##/##'
    end
    object RQu2BDat: TIntegerField
      DisplayLabel = '”——”Ìœ'
      DisplayWidth = 12
      FieldName = 'BDat'
      DisplayFormat = '####/##/##'
    end
    object RQu2BNo: TStringField
      DisplayLabel = '”—Ì«·'
      DisplayWidth = 9
      FieldName = 'BNo'
    end
    object RQu2PBill: TCurrencyField
      DisplayLabel = '„»·€'
      DisplayWidth = 20
      FieldName = 'Pbill'
    end
    object RQu2Bank: TStringField
      DisplayLabel = '»«‰ò'
      DisplayWidth = 20
      FieldName = 'Bank'
      Size = 45
    end
    object RQu2Reject: TBooleanField
      DisplayWidth = 6
      FieldName = 'Reject'
      Visible = False
    end
    object RQu2Acnam: TStringField
      FieldName = 'Acnam'
      Visible = False
      FixedChar = True
      Size = 45
    end
    object RQu2Ckod: TIntegerField
      FieldName = 'Ckod'
      Visible = False
    end
  end
  object RDs2: TDataSource
    DataSet = RQu2
    Left = 900
    Top = 58
  end
  object HVQu: TQuery
    AfterOpen = HVQuAfterScroll
    AfterScroll = HVQuAfterScroll
    DatabaseName = 'ParFro'
    SQL.Strings = (
      'Select *'
      'From DHav D'
      
        'Where D.No in (Select G.No From DhavG G Where G.Reject < G.Quant' +
        ' or G.Reject =0 or G.Reject is null)'
      'Order by Dat,D.No '
      ' ')
    Left = 567
    Top = 104
    object HVQuNo: TIntegerField
      DisplayLabel = '‘„«—Â'
      DisplayWidth = 11
      FieldName = 'No'
    end
    object HVQuDat: TIntegerField
      DisplayLabel = ' «—ÌŒ'
      DisplayWidth = 14
      FieldName = 'Dat'
      DisplayFormat = '####/##/##'
    end
    object HVQuNam: TStringField
      DisplayLabel = '»Õ”«»'
      DisplayWidth = 29
      FieldName = 'Nam'
      FixedChar = True
      Size = 45
    end
    object HVQuPkol: TCurrencyField
      FieldName = 'Pkol'
      Visible = False
    end
    object HVQuPdis: TCurrencyField
      FieldName = 'Pdis'
      Visible = False
    end
    object HVQuPnet: TCurrencyField
      FieldName = 'Pnet'
      Visible = False
    end
    object HVQuBkod: TBooleanField
      FieldName = 'Bkod'
      Visible = False
    end
    object HVQuBno: TIntegerField
      FieldName = 'Bno'
      Visible = False
    end
    object HVQuCost: TStringField
      DisplayLabel = 'Å—ÊéÂ'
      DisplayWidth = 20
      FieldName = 'Cost'
      Visible = False
      FixedChar = True
      Size = 45
    end
    object HVQuCkod: TIntegerField
      DisplayLabel = '»‰«„/„—ò“'
      DisplayWidth = 27
      FieldName = 'Ckod'
    end
    object HVQuRefno: TIntegerField
      DisplayLabel = '›«ò Ê—'
      DisplayWidth = 15
      FieldName = 'Refno'
    end
    object HVQuDes: TStringField
      FieldName = 'Des'
      Visible = False
      FixedChar = True
      Size = 200
    end
  end
  object HDs1: TDataSource
    DataSet = HVQu
    Left = 594
    Top = 105
  end
  object HGQu: TQuery
    DatabaseName = 'ParFro'
    SQL.Strings = (
      'Select *'
      'From DHavG G'
      'Where G.No=:n')
    Left = 247
    Top = 142
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'n'
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
    Left = 280
    Top = 140
  end
  object HG2Qu: TQuery
    DatabaseName = 'ParFro'
    SQL.Strings = (
      
        'SELECT D.Dat, D.Nam, D.Ckod, G.Nam, G.Quant, G.Unit, G.Reject, G' +
        '.Kod, D.No ,D.RefNo ,I.Pfee,G.Quant-G.Reject As Remain,(G.Quant-' +
        'G.Reject)*I.Pfee As RemFee'
      'FROM DHav D, DHavG G ,Invogood I'
      
        'WHERE  (D.No = G.No)  and (G.Reject Is Null or G.Reject < G.Quan' +
        't) and (G.Kod=I.Kod) and (D.RefNo=I.No)'
      ' '
      ' '
      ' '
      ' ')
    Left = 246
    Top = 171
    object GQuDat: TIntegerField
      DisplayLabel = ' «—ÌŒ'
      DisplayWidth = 14
      FieldName = 'Dat'
      DisplayFormat = '####/##/##'
    end
    object GQuNo: TIntegerField
      DisplayLabel = '‘„«—Â ÕÊ«·Â'
      DisplayWidth = 13
      FieldName = 'No'
    end
    object StringField3: TStringField
      DisplayLabel = '»Õ”«»'
      DisplayWidth = 27
      FieldName = 'Nam'
      FixedChar = True
      Size = 45
    end
    object GQuCkod: TIntegerField
      DisplayLabel = '»‰«„/„—ò“'
      DisplayWidth = 24
      FieldName = 'Ckod'
    end
    object GQuNam_1: TStringField
      DisplayLabel = '‘—Õ ò«·«'
      DisplayWidth = 59
      FieldName = 'Nam_1'
      FixedChar = True
      Size = 100
    end
    object GQuQuant: TFloatField
      DisplayLabel = '„ﬁœ«—'
      DisplayWidth = 11
      FieldName = 'Quant'
    end
    object GQuUnit: TStringField
      DisplayLabel = 'Ê«Õœ'
      DisplayWidth = 8
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
      DefaultExpression = '0'
      DisplayLabel = ' ÕÊÌ·Ì'
      DisplayWidth = 12
      FieldName = 'Reject'
    end
    object IntegerField1: TIntegerField
      DisplayLabel = 'òœ ò«·«'
      DisplayWidth = 10
      FieldName = 'Kod'
      Visible = False
    end
    object HG2QuRefNo: TIntegerField
      DisplayWidth = 11
      FieldName = 'RefNo'
      Visible = False
    end
    object HG2QuPfee: TCurrencyField
      DisplayLabel = '›Ì ›—Ê‘'
      DisplayWidth = 16
      FieldName = 'Pfee'
      DisplayFormat = '###,##'
      Currency = False
    end
    object HG2QuRemain: TFloatField
      DisplayLabel = ' ÕÊÌ· ‰‘œÂ'
      DisplayWidth = 12
      FieldName = 'Remain'
    end
    object HG2QuRemFee: TFloatField
      DisplayWidth = 21
      FieldName = 'RemFee'
      DisplayFormat = '###,##'
    end
  end
  object HG2Ds: TDataSource
    DataSet = HG2Qu
    Left = 280
    Top = 169
  end
end
