object FDepotDaily: TFDepotDaily
  Tag = 1
  Left = 413
  Top = 82
  BiDiMode = bdRightToLeft
  BorderStyle = bsNone
  Caption = 'ê“«—‘ ÕÊ«·Â  Â«Ì ’«œ—Â ò«·«'
  ClientHeight = 473
  ClientWidth = 716
  Color = clBtnFace
  Font.Charset = ARABIC_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
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
    Left = 619
    Top = 85
    Width = 3
    Height = 388
    Cursor = crHSplit
    Align = alRight
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 716
    Height = 85
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 662
      Top = 14
      Width = 48
      Height = 18
      Anchors = [akTop, akRight]
      AutoSize = False
      BiDiMode = bdRightToLeft
      Caption = '«“  «—ÌŒ '
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      Layout = tlCenter
    end
    object Label2: TLabel
      Left = 511
      Top = 14
      Width = 49
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
      Layout = tlCenter
    end
    object Label3: TLabel
      Left = 663
      Top = 50
      Width = 48
      Height = 18
      Anchors = [akTop, akRight]
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
      Left = 479
      Top = 51
      Width = 47
      Height = 18
      Anchors = [akTop, akRight]
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
      Left = 258
      Top = 52
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
    object spCalc: TSpeedButton
      Left = 61
      Top = 18
      Width = 23
      Height = 22
      Anchors = [akTop, akRight]
      Flat = True
      OnClick = spCalcClick
    end
    object Dat1: TMaskEdit
      Left = 570
      Top = 13
      Width = 86
      Height = 21
      Hint = ' «—ÌŒ ”——”Ìœ çﬂ'
      Anchors = [akTop, akRight]
      BiDiMode = bdRightToLeft
      Constraints.MaxHeight = 21
      EditMask = '1300/00/00;1;_'
      MaxLength = 10
      ParentBiDiMode = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Text = '13  /  /  '
      OnEnter = Dat1Enter
      OnExit = Dat1Exit
      OnKeyPress = NextTab
    end
    object Dat2: TMaskEdit
      Left = 419
      Top = 13
      Width = 86
      Height = 21
      Anchors = [akTop, akRight]
      BiDiMode = bdRightToLeft
      Constraints.MaxHeight = 21
      EditMask = '1300/00/00;1;_'
      MaxLength = 10
      ParentBiDiMode = False
      TabOrder = 1
      Text = '13  /  /  '
      OnEnter = Dat2Enter
      OnExit = Dat2Exit
      OnKeyPress = NextTab
    end
    object RadioGroup1: TRadioGroup
      Left = 93
      Top = 8
      Width = 320
      Height = 35
      Anchors = [akTop, akRight]
      Caption = '‰Ê⁄ ê“«—‘'
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        '»Â  ›òÌò ò«·«'
        '»Â Œ·«’Â ò«·«')
      TabOrder = 2
    end
    object FAccNam: TComboBox
      Left = 535
      Top = 49
      Width = 123
      Height = 21
      Anchors = [akTop, akRight]
      BiDiMode = bdRightToLeft
      ItemHeight = 13
      ParentBiDiMode = False
      Sorted = True
      TabOrder = 3
      OnKeyPress = NextTab
    end
    object FCostN: TComboBox
      Left = 330
      Top = 50
      Width = 141
      Height = 21
      Anchors = [akTop, akRight]
      BiDiMode = bdRightToLeft
      ItemHeight = 13
      ParentBiDiMode = False
      Sorted = True
      TabOrder = 4
      OnKeyPress = NextTab
    end
    object FCentN: TComboBox
      Left = 93
      Top = 49
      Width = 157
      Height = 21
      Anchors = [akTop, akRight]
      BiDiMode = bdRightToLeft
      ItemHeight = 13
      ParentBiDiMode = False
      TabOrder = 5
      OnKeyPress = NextTab
    end
  end
  object dbg: TDBGrid
    Left = 0
    Top = 85
    Width = 619
    Height = 388
    Align = alClient
    DataSource = DS
    TabOrder = 1
    TitleFont.Charset = ARABIC_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = dbgDrawColumnCell
  end
  object xpcFields: TXPCheckListBox
    Left = 622
    Top = 85
    Width = 94
    Height = 388
    Align = alRight
    ItemHeight = 13
    TabOrder = 2
    OnClick = xpcFieldsClick
  end
  object DS: TDataSource
    DataSet = HQu
    Left = 22
    Top = 48
  end
  object HQu: TQuery
    DatabaseName = 'ParFro'
    SQL.Strings = (
      
        'SELECT G.Kod, G.Nam, G.Anbnam, G.Quant, G.Unit, I.No, I.Dat, I.C' +
        'ost, I.Nam AcNam, I.Ckod'
      'FROM DHav I, DHavG G'
      'WHERE  (I.No = G.No)'
      ' '
      ' '
      ' ')
    Left = 50
    Top = 48
    object HQuDat: TIntegerField
      DisplayLabel = ' «—ÌŒ'
      DisplayWidth = 18
      FieldName = 'Dat'
      DisplayFormat = '####/##/##'
    end
    object HQuNo: TIntegerField
      DisplayLabel = ' ÕÊ«·Â'
      DisplayWidth = 13
      FieldName = 'No'
    end
    object HQuKod: TIntegerField
      DisplayLabel = 'òœ ò«·«'
      DisplayWidth = 11
      FieldName = 'Kod'
    end
    object HQuNam: TStringField
      DisplayLabel = '‘—Õ'
      DisplayWidth = 48
      FieldName = 'Nam'
      FixedChar = True
      Size = 100
    end
    object HQuAnbnam: TStringField
      DisplayLabel = '«‰»«—'
      DisplayWidth = 22
      FieldName = 'Anbnam'
      FixedChar = True
      Size = 45
    end
    object HQuQuant: TFloatField
      DisplayLabel = '„ﬁœ«—'
      DisplayWidth = 18
      FieldName = 'Quant'
    end
    object HQuUnit: TStringField
      DisplayLabel = 'Ê«Õœ'
      DisplayWidth = 8
      FieldName = 'Unit'
      FixedChar = True
    end
    object HQuAcNam: TStringField
      DisplayLabel = '»Õ”«»'
      DisplayWidth = 27
      FieldName = 'AcNam'
      FixedChar = True
      Size = 45
    end
    object HQuCkod: TIntegerField
      DisplayLabel = '„—ò“'
      DisplayWidth = 29
      FieldName = 'Ckod'
    end
    object HQuCost: TStringField
      DisplayLabel = 'Å—ÊéÂ'
      DisplayWidth = 19
      FieldName = 'Cost'
      FixedChar = True
      Size = 45
    end
  end
end
