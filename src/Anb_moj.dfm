object FAnb_Moj: TFAnb_Moj
  Tag = 1
  Left = 275
  Top = 133
  BiDiMode = bdRightToLeft
  BorderStyle = bsNone
  BorderWidth = 4
  Caption = '„‹ÊÃÊœÌ  «‰»«—Â«'
  ClientHeight = 487
  ClientWidth = 906
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
  Position = poDefaultSizeOnly
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 766
    Top = 3
    Width = 29
    Height = 20
    Anchors = [akTop, akRight]
    AutoSize = False
    Caption = 'ﬂ«·«'
    Constraints.MaxHeight = 21
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 766
    Top = 32
    Width = 31
    Height = 20
    Anchors = [akTop, akRight]
    AutoSize = False
    Caption = '«‰»«—'
    Constraints.MaxHeight = 21
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 427
    Top = 3
    Width = 30
    Height = 20
    AutoSize = False
    Caption = '„œ·'
    Constraints.MaxHeight = 21
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 668
    Top = 452
    Width = 217
    Height = 26
    Alignment = taRightJustify
    Anchors = [akRight, akBottom]
    AutoSize = False
  end
  object Label5: TLabel
    Left = 843
    Top = 4
    Width = 59
    Height = 18
    Anchors = [akTop, akRight]
    AutoSize = False
    Caption = 'ﬂœ⁄„Ê„Ì'
    Constraints.MaxHeight = 21
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel2: TBevel
    Left = 0
    Top = 437
    Width = 906
    Height = 50
    Align = alBottom
    Shape = bsTopLine
  end
  object Splitter2: TSplitter
    Left = 160
    Top = 71
    Width = 7
    Height = 366
    Cursor = crHSplit
    Beveled = True
  end
  object Bevel3: TBevel
    Left = 0
    Top = 0
    Width = 906
    Height = 71
    Align = alTop
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
    Visible = False
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
    Visible = False
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
    Visible = False
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
    Visible = False
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
    Visible = False
  end
  object Splitter1: TSplitter
    Left = 311
    Top = 71
    Width = 7
    Height = 366
    Cursor = crHSplit
    Beveled = True
  end
  object rgMoj: TRadioGroup
    Left = 311
    Top = 30
    Width = 293
    Height = 34
    Columns = 4
    ItemIndex = 3
    Items.Strings = (
      '»«·«Ì ’›—'
      '“Ì— ’›—'
      '’›—'
      'ﬂ·ÌÂ')
    TabOrder = 4
  end
  object dbg: TDBGrid
    Left = 318
    Top = 71
    Width = 588
    Height = 366
    Hint = 'ò·Ìò —«”  = ò«—œò” ò«·«Ì «‰ Œ«» ‘œÂ œ— ÃœÊ·'
    Align = alClient
    BiDiMode = bdRightToLeft
    DataSource = FroDM.DepotDs
    FixedColor = clTeal
    ParentBiDiMode = False
    ParentShowHint = False
    PopupMenu = kPop
    ReadOnly = True
    ShowHint = True
    TabOrder = 9
    TitleFont.Charset = ARABIC_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Serif'
    TitleFont.Style = []
    OnEditButtonClick = dbgEditButtonClick
    OnEnter = dbgEnter
    OnKeyPress = dbgKeyPress
    OnKeyUp = dbgKeyUp
    Columns = <
      item
        Expanded = False
        FieldName = 'Kod'
        Visible = True
      end
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'Nam'
        Title.Alignment = taCenter
        Width = 214
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Color'
        Title.Alignment = taCenter
        Width = 94
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'AnbNam'
        Title.Alignment = taCenter
        Width = 99
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Anbkod'
        Title.Alignment = taCenter
        Title.Caption = 'ﬁ›”Â'
        Visible = False
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Quant'
        Title.Alignment = taCenter
        Width = 81
        Visible = True
      end>
  end
  object FKala: TComboBox
    Left = 466
    Top = 3
    Width = 295
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    BiDiMode = bdRightToLeft
    ItemHeight = 13
    ParentBiDiMode = False
    TabOrder = 1
    OnDragDrop = FKalaDragDrop
    OnDragOver = FKalaDragOver
    OnDropDown = FKalaDropDown
    OnKeyDown = FKalaKeyDown
    OnKeyPress = NextTab
  end
  object FAnb: TComboBox
    Left = 615
    Top = 31
    Width = 146
    Height = 21
    Anchors = [akTop, akRight]
    BiDiMode = bdRightToLeft
    ItemHeight = 13
    ParentBiDiMode = False
    TabOrder = 3
    OnKeyPress = NextTab
  end
  object FColor: TComboBox
    Left = 310
    Top = 3
    Width = 111
    Height = 21
    BiDiMode = bdRightToLeft
    ItemHeight = 13
    ParentBiDiMode = False
    TabOrder = 2
    OnKeyPress = NextTab
  end
  object Gene: TEdit
    Left = 801
    Top = 3
    Width = 38
    Height = 21
    Anchors = [akTop, akRight]
    AutoSize = False
    Constraints.MaxHeight = 21
    TabOrder = 0
    OnKeyPress = NextTab
  end
  object Panel1: TPanel
    Left = 0
    Top = 452
    Width = 396
    Height = 33
    Anchors = [akLeft, akBottom]
    AutoSize = True
    BevelInner = bvLowered
    BorderWidth = 2
    TabOrder = 11
    object Bexit: TButton
      Left = 333
      Top = 4
      Width = 59
      Height = 25
      BiDiMode = bdRightToLeft
      Cancel = True
      Caption = 'Œ—ÊÃ'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Mitra'
      Font.Style = [fsBold, fsItalic]
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 4
      OnClick = BexitClick
    end
    object BPrint: TButton
      Left = 78
      Top = 4
      Width = 75
      Height = 25
      BiDiMode = bdRightToLeft
      Caption = '&ç«Å'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Mitra'
      Font.Style = [fsBold, fsItalic]
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 1
      OnClick = BPrintClick
    end
    object BShow: TBitBtn
      Left = 4
      Top = 4
      Width = 74
      Height = 25
      Caption = '&‰„«Ì‘'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = BShowClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFF000000F
        FFFFFFF00BBBBBB00FFFFF0BBBBBBBBBB0FFF0BBBBBBBBBBBB0FF00B00BBBB00
        BB0F0BBB0BBBB0BB0BB00BBB0BBBBBBB0BB00BBB0B0BBBBB0BB00BBB000BBB00
        BBB00BBB0B0BBBBB0BB00BBB0BBBBBBB0BB0F0BB0BB0B0BB0B0FF00B0000BB00
        BB0FFF0BBBBBBBBBB0FFFFF00BBBBBB00FFFFFFFF000000FFFFF}
    end
    object BCheck: TButton
      Left = 153
      Top = 4
      Width = 64
      Height = 25
      BiDiMode = bdRightToLeft
      Caption = 'ﬂ‰ —· «‰»«—'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Mitra'
      Font.Style = [fsBold, fsItalic]
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 2
      OnClick = BCheckClick
    end
    object Brepair: TButton
      Left = 217
      Top = 4
      Width = 115
      Height = 25
      Caption = '&»«“”«“Ì „ÊÃÊœÌ'
      TabOrder = 3
      OnClick = BrepairClick
    end
  end
  object Pb: TProgressBar
    Left = 1
    Top = 441
    Width = 394
    Height = 10
    Anchors = [akLeft, akBottom]
    Min = 0
    Max = 8
    TabOrder = 12
  end
  object CTree: TTreeView
    Tag = 1
    Left = 0
    Top = 71
    Width = 160
    Height = 366
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
    TabOrder = 10
    OnClick = CTreeClick
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
    TabOrder = 5
    Visible = False
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
    TabOrder = 6
    Visible = False
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
    TabOrder = 7
    Visible = False
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
    TabOrder = 8
    Visible = False
  end
  object GList: TXPListBox
    Left = 167
    Top = 71
    Width = 144
    Height = 366
    Hint = '·Ì”  ò«·«Â«Ì ê—ÊÂ'
    Align = alLeft
    ItemHeight = 13
    ParentShowHint = False
    ShowHint = True
    Sorted = True
    TabOrder = 13
    OnClick = GListClick
  end
  object qIns: TQuery
    DatabaseName = 'ParFro'
    SQL.Strings = (
      'Insert Into Depot (Kod,Nam,Color,AnbNam,AnbKod,Quant) '
      'Select  B.Kod,B.Nam,B.Color ,B.AnbNam,B.AnbKod,Sum(B.Quant)'
      'From BinvoGood B'
      'Where Not  B.Kod IS Null '
      'Group By B.Kod,B.Nam,B.Color ,B.AnbNam,B.AnbKod')
    Left = 352
    Top = 119
  end
  object qDel: TQuery
    DatabaseName = 'ParFro'
    SQL.Strings = (
      'Delete From Depot ')
    UpdateMode = upWhereChanged
    Left = 375
    Top = 165
  end
  object qRem: TQuery
    DatabaseName = 'ParFro'
    SQL.Strings = (
      'Update Depot D'
      'Set D.Quant = D.Quant-(Select Sum(I.Quant)  From InvoGood  I '
      ' Where  D.Kod = I.Kod and D.AnbNam=I.AnbNam)'
      'Where D.Kod In (Select G.Kod From InvoGood G) ')
    Left = 417
    Top = 119
  end
  object qInv: TQuery
    DatabaseName = 'ParFro'
    SQL.Strings = (
      'Insert Into Depot (Kod,Nam,Color,AnbNam,Quant)'
      
        'Select  B.Kod,B.Nam,B.Color ,B.AnbNam,Round(Sum(B.Quant*B.IOKOD)' +
        ',2)'
      'From GCardex B'
      
        'Where Not B.Kod IS Null and Not B.Kod IN (Select Kod From Goods ' +
        'Where FDP=1)'
      'Group By B.Kod,B.Nam,B.Color ,B.AnbNam'
      ''
      ' ')
    UpdateMode = upWhereChanged
    Left = 410
    Top = 165
  end
  object qIns2: TQuery
    DatabaseName = 'ParFro'
    SQL.Strings = (
      'Update Depot D'
      'Set D.Quant = D.Quant+(Select Sum(I.Quant)  From RejInvoGood  I'
      '  Where  D.Kod = I.Kod and D.AnbNam=I.AnbNam)'
      'Where D.Kod In (Select G.Kod From RejInvoGood G) ')
    Left = 384
    Top = 119
  end
  object qRem2: TQuery
    DatabaseName = 'ParFro'
    SQL.Strings = (
      'Update Depot D'
      
        'Set D.Quant = D.Quant-(Select Sum(I.Quant)  From RejBinvoGood  I' +
        ' '
      ' Where  D.Kod = I.Kod and D.AnbNam=I.AnbNam)'
      'Where D.Kod In (Select G.Kod From RejBinvoGood G) ')
    Left = 449
    Top = 119
  end
  object qGene: TQuery
    DatabaseName = 'ParFro'
    SQL.Strings = (
      'Update Depot '
      
        'Set Gene = (Select I.Gene  From Goods  I  Where  Depot.Kod = I.K' +
        'od)')
    UpdateMode = upWhereChanged
    Left = 439
    Top = 164
  end
  object qUpdate: TQuery
    DatabaseName = 'ParFro'
    SQL.Strings = (
      'Update Invogood  SET Qout =(SELECT SUM(H.Quant) FROM DHavG H'
      
        '                       WHERE  Invogood.No = H.AnbKod AND Invogoo' +
        'd.Kod = H.Kod) ')
    Left = 343
    Top = 164
  end
  object QSort: TQuery
    DatabaseName = 'ParFro'
    SQL.Strings = (
      'Select * From Depot')
    Left = 393
    Top = 254
    object QSortId: TIntegerField
      FieldName = 'Id'
    end
    object QSortKod: TIntegerField
      FieldName = 'Kod'
    end
    object QSortGene: TIntegerField
      FieldName = 'Gene'
    end
    object QSortNam: TStringField
      FieldName = 'Nam'
      Size = 100
    end
    object QSortColor: TStringField
      FieldName = 'Color'
      Size = 45
    end
    object QSortAnbNam: TStringField
      FieldName = 'AnbNam'
      Size = 45
    end
    object QSortAnbkod: TFloatField
      FieldName = 'Anbkod'
      Origin = 'PARFRO.Depot.Anbkod'
    end
    object QSortQuant: TFloatField
      FieldName = 'Quant'
    end
  end
  object SortDs: TDataSource
    AutoEdit = False
    DataSet = QSort
    Left = 365
    Top = 254
  end
  object kPop: TPopupMenu
    Left = 296
    Top = 144
    object N1: TMenuItem
      Caption = 'ò«—œò” ⁄œœÌ'
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = 'ò«—œò” —Ì«·Ì'
      OnClick = N2Click
    end
  end
  object DepQu: TQuery
    DatabaseName = 'ParFro'
    SQL.Strings = (
      'Select * '
      'From Depot')
    Left = 238
    Top = 12
    object DepQuId: TAutoIncField
      FieldName = 'Id'
      Origin = 'PARFRO.Depot.Id'
    end
    object DepQuKod: TIntegerField
      DisplayLabel = 'òœ ò«·«'
      DisplayWidth = 8
      FieldName = 'Kod'
      Origin = 'PARFRO.Depot.Kod'
    end
    object DepQuGene: TIntegerField
      DisplayLabel = 'òœ ⁄„Ê„Ì'
      DisplayWidth = 5
      FieldName = 'Gene'
      Origin = 'PARFRO.Depot.Gene'
    end
    object DepQuNam: TStringField
      DisplayLabel = '‘—Õ ò«·«'
      DisplayWidth = 50
      FieldName = 'Nam'
      Origin = 'PARFRO.Depot.Nam'
      FixedChar = True
      Size = 100
    end
    object DepQuColor: TStringField
      DisplayLabel = '„œ·'
      DisplayWidth = 20
      FieldName = 'Color'
      Origin = 'PARFRO.Depot.Color'
      FixedChar = True
      Size = 45
    end
    object DepQuAnbnam: TStringField
      DisplayLabel = '«‰»«—'
      DisplayWidth = 35
      FieldName = 'Anbnam'
      Origin = 'PARFRO.Depot.Anbnam'
      FixedChar = True
      Size = 45
    end
    object DepQuAnbkod: TFloatField
      DisplayLabel = 'Œ—ÊÃ ‰‘œÂ'
      FieldName = 'Anbkod'
      Origin = 'PARFRO.Depot.Anbkod'
    end
    object DepQuQuant: TFloatField
      DisplayLabel = '„ÊÃÊœÌ'
      DisplayWidth = 10
      FieldName = 'Quant'
      Origin = 'PARFRO.Depot.Quant'
    end
  end
  object DS: TDataSource
    DataSet = DepQu
    Left = 266
    Top = 12
  end
end
