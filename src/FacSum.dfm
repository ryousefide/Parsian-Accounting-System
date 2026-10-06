object FFucSum: TFFucSum
  Tag = 1
  Left = 98
  Top = 141
  BiDiMode = bdRightToLeft
  BorderStyle = bsSingle
  BorderWidth = 3
  Caption = '·Ì”  ›«ﬂ Ê— Â«'
  ClientHeight = 356
  ClientWidth = 601
  Color = clBtnFace
  Font.Charset = ARABIC_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Serif'
  Font.Style = []
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poDefaultSizeOnly
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 601
    Height = 24
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = '·Ì”  ›«ﬂ Ê— Â«Ì ›—Ê‘'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 0
    Top = 303
    Width = 601
    Height = 52
    Anchors = [akLeft, akRight, akBottom]
  end
  object Label2: TLabel
    Left = 482
    Top = 306
    Width = 76
    Height = 19
    Anchors = [akRight, akBottom]
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = 'Ã„⁄ ›«ò Ê—Â«:'
    Constraints.MaxHeight = 21
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    Transparent = True
  end
  object Label3: TLabel
    Left = 204
    Top = 306
    Width = 78
    Height = 19
    Anchors = [akLeft, akBottom]
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '—«” “„«‰Ì :'
    Constraints.MaxHeight = 21
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    Transparent = True
  end
  object Label4: TLabel
    Left = 484
    Top = 330
    Width = 74
    Height = 19
    Anchors = [akRight, akBottom]
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = 'œ—Ì«› Ì :'
    Constraints.MaxHeight = 21
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    Transparent = True
  end
  object FacGrid: TDBGrid
    Left = 0
    Top = 24
    Width = 601
    Height = 276
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = Ds1
    FixedColor = clTeal
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Serif'
    Font.Style = []
    Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = ARABIC_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Serif'
    TitleFont.Style = []
    OnKeyPress = FacGridKeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'Dat'
        Title.Alignment = taCenter
        Width = 81
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'No'
        Title.Alignment = taCenter
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nam'
        Title.Alignment = taCenter
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Pkol'
        Title.Alignment = taCenter
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Pdis'
        Title.Alignment = taCenter
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Pnet'
        Title.Alignment = taCenter
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRule'
        Title.Alignment = taCenter
        Width = 81
        Visible = True
      end>
  end
  object Bprint: TBitBtn
    Left = 56
    Top = 305
    Width = 22
    Height = 22
    Anchors = [akLeft, akBottom]
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 1
    OnClick = BprintClick
  end
  object BExit: TBitBtn
    Left = 3
    Top = 305
    Width = 53
    Height = 22
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = 'Œ—ÊÃ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 2
    OnClick = BExitClick
  end
  object SKol: TEdit
    Left = 323
    Top = 305
    Width = 157
    Height = 21
    TabStop = False
    Anchors = [akLeft, akRight, akBottom]
    AutoSize = False
    BiDiMode = bdRightToLeftNoAlign
    ParentBiDiMode = False
    ReadOnly = True
    TabOrder = 3
  end
  object Dat: TEdit
    Left = 81
    Top = 305
    Width = 120
    Height = 21
    TabStop = False
    Anchors = [akLeft, akBottom]
    AutoSize = False
    BiDiMode = bdRightToLeftNoAlign
    ParentBiDiMode = False
    ReadOnly = True
    TabOrder = 4
  end
  object FPayed: TEdit
    Left = 323
    Top = 329
    Width = 157
    Height = 21
    TabStop = False
    Anchors = [akLeft, akRight, akBottom]
    AutoSize = False
    BiDiMode = bdRightToLeftNoAlign
    ParentBiDiMode = False
    ReadOnly = True
    TabOrder = 5
  end
  object Ds1: TDataSource
    AutoEdit = False
    DataSet = FQu
    Left = 73
    Top = 2
  end
  object FQu: TQuery
    DatabaseName = 'ParFro'
    SQL.Strings = (
      'Select *'
      'From Invoice'
      'Order By Dat')
    Left = 128
    object FQuDat: TIntegerField
      Alignment = taCenter
      DisplayLabel = ' «—ÌŒ'
      FieldName = 'Dat'
      DisplayFormat = '####/##/##'
    end
    object FQuNo: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = '‘„«—Â'
      FieldName = 'No'
    end
    object FQuNam: TStringField
      DisplayLabel = '»‰«„'
      FieldName = 'Nam'
      Size = 45
    end
    object FQuPkol: TCurrencyField
      Alignment = taLeftJustify
      DisplayLabel = 'Ã„⁄ ﬂ·'
      FieldName = 'Pkol'
    end
    object FQuPdis: TCurrencyField
      Alignment = taLeftJustify
      DisplayLabel = ' Œ›Ì›'
      FieldName = 'Pdis'
    end
    object FQuPnet: TCurrencyField
      Alignment = taLeftJustify
      DisplayLabel = 'Œ«·’'
      FieldName = 'Pnet'
    end
    object FQuAdd: TStringField
      DisplayLabel = '¬œ—”'
      DisplayWidth = 60
      FieldName = 'Adr'
      Size = 200
    end
    object FQuTel: TStringField
      DisplayLabel = ' ·›‰'
      FieldName = 'Tel'
    end
    object FQuPerm: TBooleanField
      FieldName = 'LPerm'
      Visible = False
    end
    object FQuPRule: TStringField
      DisplayLabel = '‰ÕÊÂ Å—œ«Œ '
      FieldName = 'PRule'
      Size = 30
    end
  end
end
