object FAnb_Check: TFAnb_Check
  Tag = 1
  Left = 210
  Top = 128
  BiDiMode = bdRightToLeft
  BorderStyle = bsNone
  BorderWidth = 4
  Caption = '«‰»«—ê—œ«‰Ì'
  ClientHeight = 465
  ClientWidth = 899
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
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = 818
    Top = 10
    Width = 44
    Height = 18
    Anchors = [akTop, akRight]
    AutoSize = False
    Caption = '‰«„ ﬂ«·«'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 899
    Height = 71
    Align = alTop
  end
  object Splitter1: TSplitter
    Left = 179
    Top = 71
    Width = 3
    Height = 394
    Cursor = crHSplit
  end
  object Bevel3: TBevel
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
  object Label5: TLabel
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
  object Label6: TLabel
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
  object Label7: TLabel
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
  object Label8: TLabel
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
  object bShow: TSpeedButton
    Left = 583
    Top = 8
    Width = 23
    Height = 22
    Flat = True
    OnClick = BShowClick
  end
  object GNam: TComboBox
    Left = 610
    Top = 8
    Width = 203
    Height = 21
    Style = csDropDownList
    Anchors = [akLeft, akTop, akRight]
    BiDiMode = bdRightToLeft
    ItemHeight = 13
    ParentBiDiMode = False
    Sorted = True
    TabOrder = 0
    OnKeyDown = GNamKeyDown
  end
  object CTree: TTreeView
    Tag = 1
    Left = 0
    Top = 71
    Width = 179
    Height = 394
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
    TabOrder = 1
    OnClick = CTreeClick
    OnKeyDown = CTreeKeyDown
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
    TabOrder = 2
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
    TabOrder = 3
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
    TabOrder = 4
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
    TabOrder = 5
  end
  object Panel1: TPanel
    Left = 182
    Top = 71
    Width = 717
    Height = 394
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 6
    object Bevel2: TBevel
      Left = 0
      Top = 364
      Width = 717
      Height = 30
      Align = alBottom
      Anchors = [akLeft, akBottom]
      Shape = bsTopLine
    end
    object Label1: TLabel
      Left = 290
      Top = 371
      Width = 51
      Height = 20
      Anchors = [akLeft, akBottom]
      AutoSize = False
      BiDiMode = bdRightToLeft
      Caption = 'Ã„⁄ ò·'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
    end
    object dbg: TDBGrid
      Left = 0
      Top = 0
      Width = 717
      Height = 364
      Align = alClient
      DataSource = DS
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = ARABIC_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
    object FQ3: TEdit
      Left = 46
      Top = 370
      Width = 65
      Height = 21
      TabStop = False
      Anchors = [akLeft, akBottom]
      ReadOnly = True
      TabOrder = 1
    end
    object FQ2: TEdit
      Left = 131
      Top = 370
      Width = 65
      Height = 21
      TabStop = False
      Anchors = [akLeft, akBottom]
      ReadOnly = True
      TabOrder = 2
    end
    object FQ1: TEdit
      Left = 215
      Top = 370
      Width = 65
      Height = 21
      TabStop = False
      Anchors = [akLeft, akBottom]
      ReadOnly = True
      TabOrder = 3
    end
  end
  object tbTally: TTable
    DatabaseName = 'ParFro'
    TableName = 'Anb_Check'
    Left = 282
    Top = 10
    object tbTallyId: TIntegerField
      FieldName = 'Id'
      Visible = False
    end
    object tbTallyKod: TIntegerField
      DisplayLabel = 'òœ ò«·«'
      DisplayWidth = 9
      FieldName = 'Kod'
    end
    object tbTallyGene: TIntegerField
      FieldName = 'Gene'
      Visible = False
    end
    object tbTallyNam: TStringField
      DisplayLabel = '‘—Õ '
      DisplayWidth = 53
      FieldName = 'Nam'
      FixedChar = True
      Size = 100
    end
    object tbTallyColor: TStringField
      DisplayLabel = '„œ· /‘Ìœ'
      DisplayWidth = 11
      FieldName = 'Color'
      FixedChar = True
      Size = 45
    end
    object tbTallyAnbnam: TStringField
      DisplayLabel = '«‰»«—'
      DisplayWidth = 18
      FieldName = 'Anbnam'
      FixedChar = True
      Size = 45
    end
    object tbTallyQuant: TFloatField
      DisplayLabel = '„ÊÃÊœÌ '
      DisplayWidth = 12
      FieldName = 'Quant'
    end
    object tbTallyAnbkod: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Œ—ÊÃ ‰‘œÂ'
      DisplayWidth = 12
      FieldName = 'Anbkod'
    end
    object tbTallyQsum: TFloatField
      DisplayLabel = '„ÊÃÊœÌ «‰Ì«—'
      DisplayWidth = 14
      FieldName = 'Qsum'
    end
    object tbTallyTally: TFloatField
      DisplayLabel = '‘„«—‘ '
      DisplayWidth = 10
      FieldName = 'Tally'
    end
  end
  object DS: TDataSource
    AutoEdit = False
    DataSet = tbTally
    Left = 310
    Top = 10
  end
  object DepQu: TQuery
    DatabaseName = 'ParFro'
    SQL.Strings = (
      'Select *'
      'From Anb_Check')
    Left = 338
    Top = 10
    object DepQuId: TIntegerField
      FieldName = 'Id'
      Origin = 'PARFRO.Anb_Check.Id'
      Visible = False
    end
    object DepQuKod: TIntegerField
      DisplayLabel = 'òœò«·«'
      DisplayWidth = 7
      FieldName = 'Kod'
      Origin = 'PARFRO.Anb_Check.Kod'
    end
    object DepQuGene: TIntegerField
      DisplayLabel = 'òœ⁄„Ê„Ì'
      DisplayWidth = 8
      FieldName = 'Gene'
      Origin = 'PARFRO.Anb_Check.Gene'
    end
    object DepQuNam: TStringField
      DisplayLabel = '‘—Õ ò«·«'
      DisplayWidth = 50
      FieldName = 'Nam'
      Origin = 'PARFRO.Anb_Check.Nam'
      FixedChar = True
      Size = 100
    end
    object DepQuColor: TStringField
      DisplayLabel = '„œ·'
      DisplayWidth = 10
      FieldName = 'Color'
      Origin = 'PARFRO.Anb_Check.Color'
      FixedChar = True
      Size = 45
    end
    object DepQuAnbnam: TStringField
      DisplayLabel = 'œ— «‰»«—'
      DisplayWidth = 15
      FieldName = 'Anbnam'
      Origin = 'PARFRO.Anb_Check.Anbnam'
      FixedChar = True
      Size = 45
    end
    object DepQuQuant: TFloatField
      DisplayLabel = '„ÊçÊœÌ'
      FieldName = 'Quant'
      Origin = 'PARFRO.Anb_Check.Quant'
    end
    object DepQuAnbkod: TFloatField
      DisplayLabel = 'Œ—ÊÃ ‰‘œÂ'
      FieldName = 'Anbkod'
      Origin = 'PARFRO.Anb_Check.Anbkod'
    end
    object DepQuQsum: TFloatField
      DisplayLabel = '„ÊÃÊœ «‰»«—'
      FieldName = 'Qsum'
      Origin = 'PARFRO.Anb_Check.Qsum'
    end
    object DepQuTally: TFloatField
      DisplayLabel = '‘„«—‘'
      FieldName = 'Tally'
      Origin = 'PARFRO.Anb_Check.Tally'
    end
  end
end
