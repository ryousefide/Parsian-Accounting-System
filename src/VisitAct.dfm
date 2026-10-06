object FVisitAct: TFVisitAct
  Left = 337
  Top = 40
  AutoSize = True
  BiDiMode = bdRightToLeft
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = '⁄„·ﬂ—œ ÊÌ“Ì Ê— Â«'
  ClientHeight = 578
  ClientWidth = 866
  Color = clBtnFace
  Font.Charset = ARABIC_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 827
    Top = 4
    Width = 36
    Height = 18
    Alignment = taCenter
    Anchors = [akTop, akRight]
    AutoSize = False
    BiDiMode = bdLeftToRight
    Caption = 'ÊÌ“Ì Ê—'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object Label2: TLabel
    Left = 649
    Top = 4
    Width = 24
    Height = 18
    Alignment = taCenter
    Anchors = [akTop, akRight]
    AutoSize = False
    BiDiMode = bdLeftToRight
    Caption = '«“'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object Label3: TLabel
    Left = 502
    Top = 4
    Width = 39
    Height = 18
    Alignment = taCenter
    Anchors = [akTop, akRight]
    AutoSize = False
    BiDiMode = bdLeftToRight
    Caption = '«·‹‹Ì'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 866
    Height = 36
    Align = alTop
    Anchors = [akTop, akRight]
  end
  object FVisitor: TComboBox
    Left = 679
    Top = 4
    Width = 142
    Height = 21
    Anchors = [akTop, akRight]
    ItemHeight = 13
    TabOrder = 0
    OnKeyPress = NextTab
  end
  object Dat1: TMaskEdit
    Left = 547
    Top = 4
    Width = 100
    Height = 21
    Anchors = [akTop, akRight]
    AutoSize = False
    EditMask = '1300/00/00;1;_'
    MaxLength = 10
    TabOrder = 1
    Text = '13  /  /  '
    OnEnter = Dat1Enter
    OnExit = Dat1Exit
    OnKeyPress = NextTab
  end
  object Dat2: TMaskEdit
    Left = 393
    Top = 4
    Width = 100
    Height = 21
    Anchors = [akTop, akRight]
    AutoSize = False
    EditMask = '1300/00/00;1;_'
    MaxLength = 10
    TabOrder = 2
    Text = '13  /  /  '
    OnEnter = Dat2Enter
    OnExit = Dat2Exit
    OnKeyPress = NextTab
  end
  object Bshow: TButton
    Left = 225
    Top = 0
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = '&‰„«Ì‘'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 3
    OnClick = BshowClick
  end
  object Bexit: TButton
    Left = 300
    Top = 0
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Cancel = True
    Caption = 'Œ—ÊÃ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 4
    OnClick = BexitClick
  end
  object DBGrid1: TDBGrid
    Left = 2
    Top = 39
    Width = 861
    Height = 189
    DataSource = DS
    TabOrder = 5
    TitleFont.Charset = ARABIC_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBGrid2: TDBGrid
    Left = 2
    Top = 322
    Width = 861
    Height = 164
    BiDiMode = bdRightToLeft
    DataSource = DS2
    ParentBiDiMode = False
    TabOrder = 6
    TitleFont.Charset = ARABIC_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Panel1: TPanel
    Left = 0
    Top = 231
    Width = 865
    Height = 89
    TabOrder = 7
    object Label9: TLabel
      Left = 788
      Top = 3
      Width = 72
      Height = 20
      Alignment = taRightJustify
      AutoSize = False
      BiDiMode = bdLeftToRight
      Caption = 'Ã„⁄ «ﬁ·«„'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
    end
    object Label11: TLabel
      Left = 573
      Top = 3
      Width = 114
      Height = 20
      Alignment = taRightJustify
      AutoSize = False
      BiDiMode = bdLeftToRight
      Caption = 'Ã„⁄  ›—Ê‘ «ﬁ·«„'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
    end
    object Label13: TLabel
      Left = 393
      Top = 3
      Width = 102
      Height = 20
      Alignment = taRightJustify
      AutoSize = False
      BiDiMode = bdLeftToRight
      Caption = 'ÅÊ—”«‰  „ﬁœ«—Ì'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
    end
    object Label14: TLabel
      Left = 218
      Top = 3
      Width = 102
      Height = 20
      Alignment = taRightJustify
      AutoSize = False
      BiDiMode = bdLeftToRight
      Caption = 'ÅÊ—”«‰  —Ì«·Ì'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
    end
    object Label15: TLabel
      Left = 46
      Top = 3
      Width = 102
      Height = 20
      Alignment = taRightJustify
      AutoSize = False
      BiDiMode = bdLeftToRight
      Caption = 'Ã„⁄ ÅÊ—”«‰ '
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
    end
    object LQtSum: TLabel
      Left = 698
      Top = 28
      Width = 165
      Height = 23
      Alignment = taRightJustify
      AutoSize = False
      BiDiMode = bdLeftToRight
      Caption = '000000000000000000'
      ParentBiDiMode = False
      Layout = tlCenter
    end
    object LPsum: TLabel
      Left = 526
      Top = 28
      Width = 163
      Height = 23
      Alignment = taRightJustify
      AutoSize = False
      BiDiMode = bdLeftToRight
      Caption = '000000000000000000'
      ParentBiDiMode = False
      Layout = tlCenter
    end
    object LQtCom: TLabel
      Left = 340
      Top = 28
      Width = 158
      Height = 23
      Alignment = taRightJustify
      AutoSize = False
      BiDiMode = bdLeftToRight
      Caption = '000000000000000000'
      ParentBiDiMode = False
      Layout = tlCenter
    end
    object LPCom: TLabel
      Left = 177
      Top = 28
      Width = 144
      Height = 23
      Alignment = taRightJustify
      AutoSize = False
      BiDiMode = bdLeftToRight
      Caption = '000000000000000000'
      ParentBiDiMode = False
      Layout = tlCenter
    end
    object LCSum: TLabel
      Left = 18
      Top = 28
      Width = 133
      Height = 23
      Alignment = taRightJustify
      AutoSize = False
      BiDiMode = bdLeftToRight
      Caption = '000000000000000000'
      ParentBiDiMode = False
      Layout = tlCenter
    end
    object Label4: TLabel
      Left = 696
      Top = 62
      Width = 115
      Height = 19
      AutoSize = False
      BiDiMode = bdLeftToRight
      Caption = 'Ã„⁄ Œ«·’ ›«ò Ê—'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
    end
    object Inv: TEdit
      Left = 563
      Top = 60
      Width = 128
      Height = 21
      AutoSize = False
      ReadOnly = True
      TabOrder = 0
      OnKeyPress = NextTab
    end
  end
  object Panel2: TPanel
    Left = 4
    Top = 489
    Width = 860
    Height = 89
    TabOrder = 8
    object Label7: TLabel
      Left = 783
      Top = 3
      Width = 72
      Height = 20
      Alignment = taRightJustify
      AutoSize = False
      BiDiMode = bdLeftToRight
      Caption = 'Ã„⁄ «ﬁ·«„'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
    end
    object Label12: TLabel
      Left = 574
      Top = 3
      Width = 114
      Height = 20
      Alignment = taRightJustify
      AutoSize = False
      BiDiMode = bdLeftToRight
      Caption = 'Ã„⁄  ›—Ê‘ «ﬁ·«„'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
    end
    object Label16: TLabel
      Left = 398
      Top = 3
      Width = 102
      Height = 20
      Alignment = taRightJustify
      AutoSize = False
      BiDiMode = bdLeftToRight
      Caption = 'ÅÊ—”«‰  „ﬁœ«—Ì'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
    end
    object Label17: TLabel
      Left = 196
      Top = 3
      Width = 102
      Height = 20
      Alignment = taRightJustify
      AutoSize = False
      BiDiMode = bdLeftToRight
      Caption = 'ÅÊ—”«‰  —Ì«·Ì'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
    end
    object Label18: TLabel
      Left = 24
      Top = 3
      Width = 102
      Height = 20
      Alignment = taRightJustify
      AutoSize = False
      BiDiMode = bdLeftToRight
      Caption = 'Ã„⁄ò”—  ÅÊ—”«‰ '
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
    end
    object LRQtSum: TLabel
      Left = 747
      Top = 36
      Width = 108
      Height = 13
      Alignment = taRightJustify
      BiDiMode = bdLeftToRight
      Caption = '000000000000000000'
      ParentBiDiMode = False
      Layout = tlCenter
    end
    object LRPsum: TLabel
      Left = 581
      Top = 36
      Width = 108
      Height = 13
      Alignment = taRightJustify
      BiDiMode = bdLeftToRight
      Caption = '000000000000000000'
      ParentBiDiMode = False
      Layout = tlCenter
    end
    object LRQtCom: TLabel
      Left = 390
      Top = 36
      Width = 108
      Height = 13
      Alignment = taRightJustify
      BiDiMode = bdLeftToRight
      Caption = '000000000000000000'
      ParentBiDiMode = False
      Layout = tlCenter
    end
    object LRPCom: TLabel
      Left = 189
      Top = 36
      Width = 108
      Height = 13
      Alignment = taRightJustify
      BiDiMode = bdLeftToRight
      Caption = '000000000000000000'
      ParentBiDiMode = False
      Layout = tlCenter
    end
    object LRCSum: TLabel
      Left = 18
      Top = 36
      Width = 108
      Height = 13
      Alignment = taRightJustify
      BiDiMode = bdLeftToRight
      Caption = '000000000000000000'
      ParentBiDiMode = False
      Layout = tlCenter
    end
    object Label24: TLabel
      Left = 696
      Top = 62
      Width = 151
      Height = 19
      AutoSize = False
      BiDiMode = bdLeftToRight
      Caption = 'Ã„⁄ Œ«·’ ›«ò Ê— „—ÃÊ⁄Ì '
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
    end
    object LNet: TLabel
      Left = 17
      Top = 70
      Width = 108
      Height = 13
      Alignment = taRightJustify
      BiDiMode = bdLeftToRight
      Caption = '000000000000000000'
      ParentBiDiMode = False
      Layout = tlCenter
    end
    object Label6: TLabel
      Left = 163
      Top = 65
      Width = 102
      Height = 20
      Alignment = taRightJustify
      AutoSize = False
      BiDiMode = bdLeftToRight
      Caption = 'Œ«·’ ÅÊ—”«‰ '
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
    end
    object Rej: TEdit
      Left = 555
      Top = 57
      Width = 134
      Height = 24
      AutoSize = False
      ReadOnly = True
      TabOrder = 0
      OnKeyPress = NextTab
    end
    object Frem: TEdit
      Left = 360
      Top = 60
      Width = 142
      Height = 21
      AutoSize = False
      ReadOnly = True
      TabOrder = 1
      Visible = False
      OnKeyPress = NextTab
    end
  end
  object DS: TDataSource
    DataSet = QuFro
    Left = 584
    Top = 98
  end
  object DS2: TDataSource
    DataSet = QuRej
    Left = 326
    Top = 384
  end
  object QuFro: TQuery
    DatabaseName = 'ParFro'
    SQL.Strings = (
      
        'SELECT  H.Des,SUM(G.Ptotal) AS PSum,SUM(G.Quant) AS QSum, H.Kol,' +
        ' H.Mo, H.Taf ,'
      
        '       SUM(G.Quant*H.Qtrate) As QTCommision ,SUM(G.Ptotal*H.Perc' +
        '/100) As PriceCommision'
      'FROM    Invoice I,Invogood G CROSS JOIN VAct H'
      
        'WHERE   I.No=G.No and G.Kod IN (SELECT Kod FROM  Goods G  WHERE ' +
        ' G.Kol = H.Kol AND G.Mo = H.Mo AND G.taf = H.taf )'
      
        '        and I.Dat>:n1 and I.Dat <:n2 and I.Visit=:n3 and I.Visit' +
        '=H.Vkod'
      'GROUP BY H.Kol, H.Mo, H.Taf,H.Des'
      'Order by H.Kol'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 554
    Top = 98
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'n1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'n2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'n3'
        ParamType = ptUnknown
      end>
    object QuFroDes: TStringField
      DisplayLabel = '‘—Õ'
      DisplayWidth = 28
      FieldName = 'Des'
      FixedChar = True
      Size = 50
    end
    object QuFroQSum: TFloatField
      DisplayLabel = 'Ã„⁄ „ﬁœ«—Ì'
      DisplayWidth = 17
      FieldName = 'QSum'
    end
    object QuFroPSum: TCurrencyField
      DisplayLabel = 'ç„⁄ „»·€Ì'
      DisplayWidth = 25
      FieldName = 'PSum'
    end
    object QuFroQTCommision: TFloatField
      DisplayLabel = 'ÅÊ—”«‰  „ﬁœ«—Ì'
      DisplayWidth = 17
      FieldName = 'QTCommision'
      currency = True
    end
    object QuFroPriceCommision: TFloatField
      DisplayLabel = 'ÅÊ—”«‰  —Ì«·Ì'
      DisplayWidth = 25
      FieldName = 'PriceCommision'
      currency = True
    end
    object QuFroKol: TSmallintField
      FieldName = 'Kol'
      Visible = False
    end
    object QuFroMo: TSmallintField
      FieldName = 'Mo'
      Visible = False
    end
    object QuFroTaf: TSmallintField
      FieldName = 'Taf'
      Visible = False
    end
  end
  object QuRej: TQuery
    DatabaseName = 'ParFro'
    SQL.Strings = (
      
        'SELECT  H.Des,SUM(G.Ptotal) AS PSum,SUM(G.Quant) AS QSum, H.Kol,' +
        ' H.Mo, H.Taf ,'
      
        '       SUM(G.Quant*H.Qtrate) As QTCommision ,SUM(G.Ptotal*H.Perc' +
        '/100) As PriceCommision'
      'FROM    RejInvo I,RejInvogood G CROSS JOIN VAct H'
      
        'WHERE   I.No=G.No and G.Kod IN (SELECT Kod FROM  Goods G  WHERE ' +
        ' G.Kol = H.Kol AND G.Mo = H.Mo AND G.taf = H.taf )'
      
        '        and I.Dat>:n1 and I.Dat <:n2 and I.Visit=:n3 and I.Visit' +
        '=H.Vkod'
      'GROUP BY H.Kol, H.Mo, H.Taf,H.Des'
      'Order by H.Kol'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 276
    Top = 397
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'n1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'n2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'n3'
        ParamType = ptUnknown
      end>
    object QuRejDes: TStringField
      DisplayLabel = '‘—Õ'
      DisplayWidth = 28
      FieldName = 'Des'
      FixedChar = True
      Size = 50
    end
    object QuRejQSum: TFloatField
      DisplayLabel = 'Ã„⁄ „ﬁœ«—Ì'
      FieldName = 'QSum'
    end
    object QuRejPSum: TCurrencyField
      DisplayLabel = 'ç„⁄ „»·€Ì'
      DisplayWidth = 30
      FieldName = 'PSum'
    end
    object QuRejQTCommision: TFloatField
      DisplayLabel = 'ÅÊ—”«‰  „ﬁœ«—Ì'
      DisplayWidth = 15
      FieldName = 'QTCommision'
    end
    object QuRejPriceCommision: TFloatField
      DisplayLabel = 'ÅÊ—”«‰  —Ì«·Ì'
      DisplayWidth = 30
      FieldName = 'PriceCommision'
    end
    object QuRejKol: TSmallintField
      FieldName = 'Kol'
      Visible = False
    end
    object QuRejMo: TSmallintField
      FieldName = 'Mo'
      Visible = False
    end
    object QuRejTaf: TSmallintField
      FieldName = 'Taf'
      Visible = False
    end
  end
end
