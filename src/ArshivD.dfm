object FArshD: TFArshD
  Tag = 1
  Left = 367
  Top = 199
  ActiveControl = FNo
  BiDiMode = bdRightToLeft
  BorderStyle = bsSingle
  BorderWidth = 2
  Caption = '»«Ìê«‰Ì «”‰«œ —Ê“«‰Â'
  ClientHeight = 621
  ClientWidth = 829
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
  object Splitter1: TSplitter
    Left = 118
    Top = 48
    Width = 3
    Height = 573
    Cursor = crHSplit
  end
  object tvDay: TTreeView
    Left = 0
    Top = 48
    Width = 118
    Height = 573
    Align = alLeft
    HideSelection = False
    Indent = 19
    ReadOnly = True
    TabOrder = 0
    OnClick = tvDayClick
    OnKeyPress = tvDayKeyPress
    Items.Data = {
      01000000260000000000000000000000FFFFFFFFFFFFFFFF000000000C000000
      0DC8C7ED90C7E4ED20C7D3E4C7CF200000000000000000000000FFFFFFFFFFFF
      FFFF000000000000000007DDD1E6D1CFEDE4210000000000000000000000FFFF
      FFFFFFFFFFFF000000000000000008C7D1CFEDC8E5D4CA1E0000000000000000
      000000FFFFFFFFFFFFFFFF000000000000000005CED1CFC7CF1C000000000000
      0000000000FFFFFFFFFFFFFFFF000000000000000003CAEDD11E000000000000
      0000000000FFFFFFFFFFFFFFFF000000000000000005E3D1CFC7CF1F00000000
      00000000000000FFFFFFFFFFFFFFFF000000000000000006D4E5D1EDE6D11C00
      00000000000000000000FFFFFFFFFFFFFFFF000000000000000003E3E5D11D00
      00000000000000000000FFFFFFFFFFFFFFFF000000000000000004C2C8C7E41C
      0000000000000000000000FFFFFFFFFFFFFFFF000000000000000003C2D0D11B
      0000000000000000000000FFFFFFFFFFFFFFFF000000000000000002CFED1D00
      00000000000000000000FFFFFFFFFFFFFFFF000000000000000004C8E5E3E41E
      0000000000000000000000FFFFFFFFFFFFFFFF000000000000000005C7D3DDE4
      CF}
  end
  object BGrid: TDBGrid
    Tag = -1
    Left = 121
    Top = 48
    Width = 708
    Height = 573
    Hint = 'Enter-‰„«Ì‘ ”‰œ'
    Align = alClient
    DataSource = FroDM.BillDds
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 1
    TitleFont.Charset = ARABIC_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Serif'
    TitleFont.Style = []
    OnDrawColumnCell = BGridDrawColumnCell
    OnDblClick = BGridDblClick
    OnKeyPress = BGridKeyPress
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'No'
        Title.Alignment = taCenter
        Title.Caption = '‘„«—Â ”‰œ'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Atf'
        Title.Caption = '‘„«—Â ”‰œ'
        Visible = False
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Dat'
        Title.Alignment = taCenter
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Des'
        Title.Alignment = taCenter
        Title.Caption = '‘—Õ ”‹‹‹‰œ'
        Width = 291
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BesSum'
        Title.Alignment = taCenter
        Title.Caption = '„»·€ ”‰œ'
        Width = 114
        Visible = True
      end>
  end
  object Panel1: TPanel
    Tag = 1
    Left = 0
    Top = 0
    Width = 829
    Height = 48
    Align = alTop
    AutoSize = True
    BevelInner = bvLowered
    BorderWidth = 2
    ParentColor = True
    TabOrder = 2
    object Sp1: TSpeedButton
      Left = 419
      Top = 4
      Width = 23
      Height = 22
      Hint = 'ﬁÿ⁄Ì ‘œ‰ ”‰œ'
      Anchors = [akTop, akRight]
      Flat = True
      ParentShowHint = False
      ShowHint = True
      Spacing = 0
      Visible = False
      OnClick = Sp1Click
    end
    object Sp2: TSpeedButton
      Left = 373
      Top = 4
      Width = 23
      Height = 22
      Hint = '„Êﬁ  ‘œ‰ «”‰«œ'
      Anchors = [akTop, akRight]
      Flat = True
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = Sp2Click
    end
    object spBill: TSpeedButton
      Left = 396
      Top = 4
      Width = 23
      Height = 22
      Hint = '‰„«Ì‘ ”‰œ '
      Anchors = [akTop, akRight]
      Flat = True
      ParentShowHint = False
      ShowHint = True
      OnClick = spBillClick
    end
    object Label1: TLabel
      Left = 311
      Top = 7
      Width = 32
      Height = 18
      AutoSize = False
      Caption = '«“—Ê“'
    end
    object Label2: TLabel
      Left = 242
      Top = 7
      Width = 21
      Height = 17
      AutoSize = False
      Caption = '«·Ì'
    end
    object Label3: TLabel
      Left = 781
      Top = 7
      Width = 42
      Height = 15
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = '⁄ÿ›'
    end
    object spMove: TSpeedButton
      Left = 7
      Top = 4
      Width = 23
      Height = 22
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333303
        333333333333337FF3333333333333903333333333333377FF33333333333399
        03333FFFFFFFFF777FF3000000999999903377777777777777FF0FFFF0999999
        99037F3337777777777F0FFFF099999999907F3FF777777777770F00F0999999
        99037F773777777777730FFFF099999990337F3FF777777777330F00FFFFF099
        03337F773333377773330FFFFFFFF09033337F3FF3FFF77733330F00F0000003
        33337F773777777333330FFFF0FF033333337F3FF7F3733333330F08F0F03333
        33337F7737F7333333330FFFF003333333337FFFF77333333333000000333333
        3333777777333333333333333333333333333333333333333333}
      NumGlyphs = 2
      OnClick = spMoveClick
    end
    object Sp3: TSpeedButton
      Left = 556
      Top = 4
      Width = 23
      Height = 22
      Hint = '‘„«—Â »‰œÌ «”‰«œ'
      Anchors = [akTop, akRight]
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        55555555FFFFFFFF5555555000000005555555577777777FF555550999999900
        55555575555555775F55509999999901055557F55555557F75F5001111111101
        105577FFFFFFFF7FF75F00000000000011057777777777775F755070FFFFFF0F
        01105777F555557F75F75500FFFFFF0FF0105577F555FF7F57575550FF700008
        8F0055575FF7777555775555000888888F005555777FFFFFFF77555550000000
        0F055555577777777F7F555550FFFFFF0F05555557F5FFF57F7F555550F000FF
        0005555557F777557775555550FFFFFF0555555557F555FF7F55555550FF7000
        05555555575FF777755555555500055555555555557775555555}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = Sp3Click
    end
    object sp4: TSpeedButton
      Left = 510
      Top = 4
      Width = 23
      Height = 22
      Hint = 'ò‰ —· «”‰«œ ’›— Ê Œ«·Ì'
      Anchors = [akTop, akRight]
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555550FF0559
        1950555FF75F7557F7F757000FF055591903557775F75557F77570FFFF055559
        1933575FF57F5557F7FF0F00FF05555919337F775F7F5557F7F700550F055559
        193577557F7F55F7577F07550F0555999995755575755F7FFF7F5570F0755011
        11155557F755F777777555000755033305555577755F75F77F55555555503335
        0555555FF5F75F757F5555005503335505555577FF75F7557F55505050333555
        05555757F75F75557F5505000333555505557F777FF755557F55000000355557
        07557777777F55557F5555000005555707555577777FF5557F55553000075557
        0755557F7777FFF5755555335000005555555577577777555555}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = sp4Click
    end
    object sp5: TSpeedButton
      Left = 533
      Top = 4
      Width = 22
      Height = 22
      Hint = 'Õ–› «”‰«œ Œ«·Ì Ê ’›—'
      Anchors = [akTop, akRight]
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
        3333333777777777F3333330F777777033333337F3F3F3F7F3333330F0808070
        33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
        33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
        333333F7F7F7F7F7F3F33030F080707030333737F7F7F7F7F7333300F0808070
        03333377F7F7F7F773333330F080707033333337F7F7F7F7F333333070707070
        33333337F7F7F7F7FF3333000000000003333377777777777F33330F88877777
        0333337FFFFFFFFF7F3333000000000003333377777777777333333330777033
        3333333337FFF7F3333333333000003333333333377777333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = sp5Click
    end
    object SP6: TSpeedButton
      Left = 442
      Top = 4
      Width = 23
      Height = 22
      Hint = ' «ÌÌœ «”‰«œ „Êﬁ '
      Anchors = [akTop, akRight]
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        555555555555555555555555555555555555555555FF55555555555559055555
        55555555577FF5555555555599905555555555557777F5555555555599905555
        555555557777FF5555555559999905555555555777777F555555559999990555
        5555557777777FF5555557990599905555555777757777F55555790555599055
        55557775555777FF5555555555599905555555555557777F5555555555559905
        555555555555777FF5555555555559905555555555555777FF55555555555579
        05555555555555777FF5555555555557905555555555555777FF555555555555
        5990555555555555577755555555555555555555555555555555}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      Spacing = 0
      OnClick = SP6Click
    end
    object Button1: TButton
      Left = 62
      Top = 5
      Width = 75
      Height = 21
      Caption = 'Button1'
      TabOrder = 7
      Visible = False
    end
    object Sd: TEdit
      Left = 266
      Top = 5
      Width = 27
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 0
      Text = '1'
    end
    object Ed: TEdit
      Left = 195
      Top = 5
      Width = 27
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 1
      Text = '31'
    end
    object ud1: TUpDown
      Left = 293
      Top = 5
      Width = 15
      Height = 21
      Associate = Sd
      Min = 1
      Max = 31
      Position = 1
      TabOrder = 2
      Wrap = False
    end
    object Ud2: TUpDown
      Left = 222
      Top = 5
      Width = 15
      Height = 21
      Associate = Ed
      Min = 1
      Max = 31
      Position = 31
      TabOrder = 3
      Wrap = False
    end
    object Cb1: TCheckBox
      Left = 77
      Top = 27
      Width = 75
      Height = 17
      TabStop = False
      Caption = '—Ê“ Ã«—Ì'
      TabOrder = 4
      Visible = False
      OnClick = Cb1Click
    end
    object FNo: TEdit
      Left = 704
      Top = 4
      Width = 73
      Height = 19
      Anchors = [akTop, akRight]
      AutoSize = False
      TabOrder = 5
      OnChange = FNoChange
      OnKeyPress = FNoKeyPress
    end
    object FCurrDb: TComboBox
      Left = 33
      Top = 5
      Width = 152
      Height = 21
      Style = csDropDownList
      BiDiMode = bdLeftToRight
      ItemHeight = 13
      ParentBiDiMode = False
      TabOrder = 6
      OnEnter = FCurrDbEnter
    end
    object FBTip: TDBLookupComboBox
      Left = 594
      Top = 4
      Width = 102
      Height = 21
      Anchors = [akTop, akRight]
      KeyField = 'Id'
      ListField = 'Des'
      ListSource = FroDM.BtipDs
      TabOrder = 8
      OnCloseUp = FBTipCloseUp
      OnDropDown = FBTipDropDown
      OnKeyUp = FBTipKeyUp
    end
  end
  object BQu: TQuery
    DatabaseName = 'Parsian Foroosh'
    SQL.Strings = (
      'UPDATE BillD'
      'Set Atf = :New'
      'Where No = :Old'
      ' '
      ' ')
    Left = 235
    Top = 94
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'New'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Old'
        ParamType = ptUnknown
      end>
  end
  object MakeQu: TQuery
    DatabaseName = 'ParFro'
    SQL.Strings = (
      'INSERT INTO BillD'
      ' (Dat, Bedsum, BesSum,Lperm)'
      'SELECT Distinct Dat, SUM(Bed) , SUM(Bes) ,0'
      'FROM         AcountBill'
      'GROUP BY Dat'
      'ORDER BY Dat'
      ' '
      ' ')
    Left = 234
    Top = 146
  end
end
