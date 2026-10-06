object FGFind: TFGFind
  Left = 368
  Top = 113
  Width = 791
  Height = 379
  ActiveControl = FNam
  BiDiMode = bdRightToLeft
  BorderWidth = 2
  Caption = 'Ã” ÃÊÌ Õ—Ê›Ì ﬂ«·« '
  Color = clBtnFace
  Font.Charset = ARABIC_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poDefaultPosOnly
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 779
    Height = 31
    Align = alTop
  end
  object Label2: TLabel
    Left = 375
    Top = 6
    Width = 99
    Height = 19
    Alignment = taRightJustify
    Anchors = [akTop, akRight]
    AutoSize = False
    Caption = '»Œ‘Ì «“...'
  end
  object Label1: TLabel
    Left = 576
    Top = 6
    Width = 79
    Height = 18
    Alignment = taRightJustify
    Anchors = [akTop, akRight]
    AutoSize = False
    Caption = 'Ã” ÃÊ œ—...'
  end
  object Splitter1: TSplitter
    Left = 714
    Top = 31
    Width = 5
    Height = 296
    Cursor = crHSplit
    Align = alRight
    Beveled = True
  end
  object Splitter2: TSplitter
    Left = 134
    Top = 31
    Width = 5
    Height = 296
    Cursor = crHSplit
    Beveled = True
  end
  object spC: TSpeedButton
    Left = 155
    Top = 1
    Width = 66
    Height = 28
    Caption = 'Collect '
    Enabled = False
    OnClick = spCClick
  end
  object spClear: TSpeedButton
    Left = 112
    Top = 1
    Width = 41
    Height = 28
    Hint = 'Clear'
    Enabled = False
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
      555557777F777555F55500000000555055557777777755F75555005500055055
      555577F5777F57555555005550055555555577FF577F5FF55555500550050055
      5555577FF77577FF555555005050110555555577F757777FF555555505099910
      555555FF75777777FF555005550999910555577F5F77777775F5500505509990
      3055577F75F77777575F55005055090B030555775755777575755555555550B0
      B03055555F555757575755550555550B0B335555755555757555555555555550
      BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
      50BB555555555555575F555555555555550B5555555555555575}
    Layout = blGlyphTop
    NumGlyphs = 2
    Spacing = 0
    OnClick = spClearClick
  end
  object spPrint: TSpeedButton
    Left = 87
    Top = 1
    Width = 25
    Height = 28
    OnClick = spPrintClick
  end
  object Splitter3: TSplitter
    Left = 611
    Top = 31
    Width = 3
    Height = 296
    Cursor = crHSplit
    Align = alRight
  end
  object BOk: TButton
    Left = 42
    Top = 262
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'BOk'
    ModalResult = 2
    TabOrder = 5
    Visible = False
  end
  object FNam: TEdit
    Left = 222
    Top = 5
    Width = 146
    Height = 21
    Hint = 'ﬁ”„ Ì «“ ‰«„ ﬂ «»'
    Anchors = [akTop, akRight]
    AutoSize = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnKeyDown = FNamKeyDown
  end
  object rbMoj: TCheckBox
    Left = 662
    Top = 7
    Width = 103
    Height = 17
    Anchors = [akTop, akRight]
    Caption = '„ÊÃÊœÌ œ«—Â«'
    TabOrder = 3
    OnClick = rbMojClick
  end
  object Sb1: TStatusBar
    Left = 0
    Top = 327
    Width = 779
    Height = 21
    BiDiMode = bdRightToLeft
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Constraints.MaxHeight = 21
    Panels = <
      item
        BiDiMode = bdRightToLeft
        ParentBiDiMode = False
        Text = 'Esc =Œ—ÊÃ'
        Width = 80
      end
      item
        Text = 
          'Å” «“ «‰ Œ«» ò«·«Ì „Ê—œ ‰Ÿ— «“  ·Ì”  ∫ò·Ìœ Enter —« »“‰Ìœ  « ò«·' +
          '« »Â ›«ò Ê— „‰ ﬁ· ê—œœ.'
        Width = 50
      end>
    ParentBiDiMode = False
    ParentColor = True
    SimplePanel = False
    SimpleText = 
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9 +
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9 +
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9 +
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9 +
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9 +
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9 +
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9 +
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9 +
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9 +
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9 +
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9 +
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9 +
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9 +
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9 +
      #9#9#9#9#9#9#9#9#9#9#9#9
    SizeGrip = False
    UseSystemFont = False
    Visible = False
  end
  object cbState: TComboBox
    Left = 479
    Top = 5
    Width = 94
    Height = 21
    Style = csDropDownList
    Anchors = [akTop, akRight]
    ItemHeight = 13
    TabOrder = 0
    OnChange = cbStateChange
    Items.Strings = (
      'ò·ÌÂ „Ê«—œ'
      '‰«„ ò«·«'
      '„‘Œ’Â1'
      '„‘Œ’Â2'
      '„‘Œ’Â3'
      '„‘Œ’Â4'
      '‰«„ «‰»«—')
  end
  object Dbg: TDBGrid
    Left = 139
    Top = 31
    Width = 472
    Height = 296
    Align = alClient
    BiDiMode = bdRightToLeftNoAlign
    DataSource = Ds
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentBiDiMode = False
    PopupMenu = PopupMenu1
    TabOrder = 6
    TitleFont.Charset = ARABIC_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = DbgDrawColumnCell
    OnDblClick = DbgDblClick
    OnKeyDown = DbgKeyDown
  end
  object FList: TXPCheckListBox
    Left = 719
    Top = 31
    Width = 60
    Height = 296
    Align = alRight
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 13
    ParentFont = False
    TabOrder = 7
    OnClick = FListClick
    OnKeyUp = FListKeyUp
  end
  object CTree: TTreeView
    Tag = 1
    Left = 0
    Top = 31
    Width = 134
    Height = 296
    Hint = 'Enter= Ê—Êœ »Â ·Ì”  ò«·«'
    Align = alLeft
    BiDiMode = bdLeftToRight
    Color = 15000804
    DragMode = dmAutomatic
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    HideSelection = False
    HotTrack = True
    Indent = 19
    ParentBiDiMode = False
    ParentFont = False
    ParentShowHint = False
    PopupMenu = PopupMenu1
    ReadOnly = True
    ShowHint = True
    TabOrder = 2
    OnClick = CTreeClick
    OnEditing = CTreeEditing
    OnKeyUp = CTreeKeyUp
  end
  object cbCollect: TCheckBox
    Left = 3
    Top = 3
    Width = 83
    Height = 17
    Caption = 'Search'
    Enabled = False
    TabOrder = 8
    OnClick = cbCollectClick
  end
  object DBGrid1: TDBGrid
    Left = 614
    Top = 31
    Width = 100
    Height = 296
    Align = alRight
    BiDiMode = bdRightToLeftNoAlign
    DataSource = ColorDs
    ParentBiDiMode = False
    TabOrder = 9
    TitleFont.Charset = ARABIC_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object PopupMenu1: TPopupMenu
    Left = 210
    Top = 138
    object N2: TMenuItem
      Caption = ' ’ÕÌÕ ò«·«'
      OnClick = N2Click
    end
  end
  object SQu: TQuery
    AfterScroll = SQuAfterScroll
    DatabaseName = 'ParFro'
    SQL.Strings = (
      
        'Select G.ISBN,G.Kod,G.Nam,D.Color,D.AnbNam,D.Quant,G.PKh,G.PFro,' +
        'G.Prop1,G.Prop2,'
      'G.Prop3,G.Prop4,G.Kol,G.Mo,G.Taf'
      'From Goods G'
      'Left Outer Join Depot D'
      'On D.Kod=G.Kod'
      'Where G.Nam Like  '#39'1'#39
      'Order By G.Nam '
      ' '
      ' '
      ' ')
    Left = 1
    Top = 33
    object SQuKod: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'òœ ò«·«'
      FieldName = 'Kod'
    end
    object SQuISBN: TStringField
      DisplayLabel = '»«—òœ'
      DisplayWidth = 10
      FieldName = 'ISBN'
      Size = 30
    end
    object SQuNam: TStringField
      DisplayLabel = '‰«„ ò«·«'
      DisplayWidth = 27
      FieldName = 'Nam'
      Size = 100
    end
    object SQuColor: TStringField
      DisplayLabel = '„œ·'
      DisplayWidth = 10
      FieldName = 'Color'
      Size = 45
    end
    object SQuAnbNam: TStringField
      DisplayLabel = '«‰»«—'
      DisplayWidth = 10
      FieldName = 'AnbNam'
      Size = 45
    end
    object SQuQuant: TFloatField
      Alignment = taLeftJustify
      DisplayLabel = '„ÊÃÊœÌ'
      DisplayWidth = 8
      FieldName = 'Quant'
    end
    object SQuPKh: TCurrencyField
      Alignment = taLeftJustify
      DisplayLabel = 'Œ—Ìœ'
      FieldName = 'PKh'
    end
    object SQuPFro: TCurrencyField
      Alignment = taLeftJustify
      DisplayLabel = '›—Ê‘'
      DisplayWidth = 10
      FieldName = 'PFro'
    end
    object SQuProp1: TStringField
      DisplayLabel = '„‘Œ’Â1'
      DisplayWidth = 18
      FieldName = 'Prop1'
      Size = 100
    end
    object SQuProp2: TStringField
      DisplayLabel = '„‘Œ’Â2'
      DisplayWidth = 18
      FieldName = 'Prop2'
      Size = 100
    end
    object SQuProp3: TStringField
      DisplayLabel = '„‘Œ’Â3'
      DisplayWidth = 18
      FieldName = 'Prop3'
      Size = 100
    end
    object SQuProp4: TStringField
      DisplayLabel = '„‘Œ’Â4'
      DisplayWidth = 18
      FieldName = 'Prop4'
      Size = 100
    end
    object SQuKol: TSmallintField
      Alignment = taLeftJustify
      DisplayLabel = 'òœ ò·'
      DisplayWidth = 8
      FieldName = 'Kol'
    end
    object SQuMo: TSmallintField
      Alignment = taLeftJustify
      DisplayLabel = 'òœ „⁄Ì‰'
      DisplayWidth = 8
      FieldName = 'Mo'
    end
    object SQuTaf: TSmallintField
      Alignment = taLeftJustify
      DisplayLabel = 'òœ  ›’Ì·Ì'
      DisplayWidth = 8
      FieldName = 'Taf'
    end
  end
  object Ds: TDataSource
    DataSet = SQu
    Left = 29
    Top = 33
  end
  object CT: TTable
    TableName = 'CGood'
    Left = 57
    Top = 34
  end
  object CQu: TQuery
    DatabaseName = 'ParFro'
    SQL.Strings = (
      'Select max(Dat) as Dat,Color'
      'From Gcardex '
      'Where Kod =:R1 and IOKod=-1'
      'group by color'
      'order by 1 Desc')
    Left = 30
    Top = 98
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'R1'
        ParamType = ptUnknown
      end>
    object CQuDat: TIntegerField
      DisplayLabel = ' «—ÌŒ'
      FieldName = 'Dat'
      Origin = 'PARFRO.Gcardex.Dat'
      Visible = False
      DisplayFormat = '####/##/##'
    end
    object CQuColor: TStringField
      DisplayLabel = '„œ·'
      DisplayWidth = 13
      FieldName = 'Color'
      Origin = 'PARFRO.Gcardex.Color'
      FixedChar = True
      Size = 45
    end
  end
  object ColorDs: TDataSource
    DataSet = CQu
    Left = 54
    Top = 98
  end
end
