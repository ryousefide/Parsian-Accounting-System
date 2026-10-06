object FUsers: TFUsers
  Tag = 1
  Left = 281
  Top = 104
  BiDiMode = bdLeftToRight
  BorderStyle = bsSingle
  BorderWidth = 5
  Caption = ' ⁄—Ì› ﬂ«—»—'
  ClientHeight = 360
  ClientWidth = 531
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
  Position = poDesktopCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel2: TBevel
    Left = 0
    Top = 333
    Width = 531
    Height = 27
    Align = alBottom
    Anchors = [akRight, akBottom]
  end
  object Bsave: TButton
    Left = 237
    Top = 334
    Width = 64
    Height = 25
    Anchors = [akRight, akBottom]
    BiDiMode = bdRightToLeft
    Caption = 'À» '
    Enabled = False
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 2
    OnClick = BsaveClick
  end
  object Bexit: TButton
    Left = 301
    Top = 334
    Width = 64
    Height = 25
    Anchors = [akRight, akBottom]
    BiDiMode = bdRightToLeft
    Cancel = True
    Caption = 'Œ—ÊÃ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 3
    OnClick = BexitClick
  end
  object Bdel: TButton
    Left = 173
    Top = 334
    Width = 64
    Height = 25
    Anchors = [akRight, akBottom]
    BiDiMode = bdRightToLeft
    Caption = 'Õ–›'
    Enabled = False
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 1
    OnClick = BdelClick
  end
  object Panel1: TPanel
    Tag = 1
    Left = 0
    Top = 0
    Width = 531
    Height = 57
    Align = alTop
    BevelInner = bvLowered
    BorderWidth = 2
    TabOrder = 0
    object Label1: TLabel
      Left = 483
      Top = 8
      Width = 42
      Height = 18
      Alignment = taCenter
      Anchors = [akTop, akRight]
      AutoSize = False
      BiDiMode = bdRightToLeft
      Caption = '‰«„ ﬂ«—»—'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
    end
    object Label2: TLabel
      Left = 317
      Top = 8
      Width = 48
      Height = 18
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      AutoSize = False
      BiDiMode = bdRightToLeft
      Caption = '—„“ ⁄»Ê—'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
    end
    object Label3: TLabel
      Left = 184
      Top = 10
      Width = 49
      Height = 18
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      AutoSize = False
      BiDiMode = bdRightToLeft
      Caption = ' ﬂ—«— —„“'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
    end
    object Label4: TLabel
      Left = 68
      Top = 8
      Width = 28
      Height = 18
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      AutoSize = False
      BiDiMode = bdRightToLeft
      Caption = '“»«‰'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Mitra'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
    end
    object Nam: TEdit
      Left = 286
      Top = 32
      Width = 73
      Height = 21
      Anchors = [akTop]
      AutoSize = False
      BiDiMode = bdRightToLeft
      ParentBiDiMode = False
      TabOrder = 5
      Visible = False
      OnExit = NamExit
    end
    object Pass1: TEdit
      Left = 236
      Top = 7
      Width = 77
      Height = 21
      Anchors = [akTop, akRight]
      AutoSize = False
      BiDiMode = bdRightToLeft
      MaxLength = 16
      ParentBiDiMode = False
      PasswordChar = '*'
      TabOrder = 1
      OnKeyPress = NextTab
    end
    object Pass2: TEdit
      Left = 102
      Top = 7
      Width = 77
      Height = 21
      Anchors = [akTop, akRight]
      AutoSize = False
      BiDiMode = bdRightToLeft
      MaxLength = 16
      ParentBiDiMode = False
      PasswordChar = '*'
      TabOrder = 2
      OnExit = Pass2Change
      OnKeyPress = NextTab
    end
    object User: TComboBox
      Left = 368
      Top = 7
      Width = 111
      Height = 21
      Anchors = [akTop, akRight]
      BiDiMode = bdRightToLeft
      ItemHeight = 13
      ParentBiDiMode = False
      TabOrder = 0
      OnEnter = UserEnter
      OnExit = NamExit
      OnKeyPress = NextTab
    end
    object DBCheckBox1: TDBCheckBox
      Left = 367
      Top = 33
      Width = 125
      Height = 18
      Anchors = [akTop, akRight]
      BiDiMode = bdRightToLeft
      Caption = '„œÌ— ”Ì” „'
      DataField = 'Master'
      DataSource = FroDM.UsersDs
      ParentBiDiMode = False
      TabOrder = 4
      ValueChecked = 'True'
      ValueUnchecked = 'False'
      OnKeyPress = NextTab
    end
    object cbLan: TDBComboBox
      Left = 13
      Top = 6
      Width = 48
      Height = 21
      Anchors = [akTop, akRight]
      BiDiMode = bdRightToLeft
      DataField = 'Lang'
      DataSource = FroDM.UsersDs
      ItemHeight = 13
      Items.Strings = (
        'FA'
        'EN')
      ParentBiDiMode = False
      TabOrder = 3
      OnKeyPress = NextTab
    end
  end
  object PgC1: TPageControl
    Tag = -1
    Left = 0
    Top = 57
    Width = 531
    Height = 276
    ActivePage = TS1
    Align = alClient
    MultiLine = True
    TabOrder = 4
    object TS1: TTabSheet
      Tag = -1
      Caption = ' ⁄ÌÌ‰ œ” —”Ì „‰ÊÌÌ'
      object Splitter1: TSplitter
        Left = 414
        Top = 21
        Width = 3
        Height = 227
        Cursor = crHSplit
        Align = alRight
      end
      object Splitter2: TSplitter
        Left = 307
        Top = 21
        Width = 3
        Height = 227
        Cursor = crHSplit
        Align = alRight
      end
      object Splitter3: TSplitter
        Left = 202
        Top = 21
        Width = 3
        Height = 227
        Cursor = crHSplit
        Align = alRight
      end
      object Splitter4: TSplitter
        Left = 110
        Top = 21
        Width = 3
        Height = 227
        Cursor = crHSplit
        Align = alRight
      end
      object Bevel3: TBevel
        Tag = -1
        Left = 0
        Top = 0
        Width = 523
        Height = 21
        Align = alTop
      end
      object CB1: TCheckListBox
        Tag = -1
        Left = 417
        Top = 21
        Width = 106
        Height = 227
        Align = alRight
        BiDiMode = bdRightToLeft
        Enabled = False
        ItemHeight = 13
        ParentBiDiMode = False
        TabOrder = 0
        OnClick = CB1Click
        OnKeyPress = NextTab
      end
      object cb2: TCheckListBox
        Tag = -1
        Left = 310
        Top = 21
        Width = 104
        Height = 227
        Align = alRight
        BiDiMode = bdRightToLeft
        Enabled = False
        ItemHeight = 13
        ParentBiDiMode = False
        Style = lbOwnerDrawVariable
        TabOrder = 1
        OnClick = cb2Click
        OnKeyPress = NextTab
      end
      object cb3: TCheckListBox
        Tag = -1
        Left = 205
        Top = 21
        Width = 102
        Height = 227
        Align = alRight
        BiDiMode = bdRightToLeft
        Enabled = False
        ItemHeight = 13
        ParentBiDiMode = False
        TabOrder = 2
        OnClick = cb3Click
        OnKeyPress = NextTab
      end
      object cb4: TCheckListBox
        Tag = -1
        Left = 113
        Top = 21
        Width = 89
        Height = 227
        Align = alRight
        BiDiMode = bdRightToLeft
        Enabled = False
        ItemHeight = 13
        ParentBiDiMode = False
        TabOrder = 3
        OnClick = cb4Click
        OnKeyPress = NextTab
      end
      object cb5: TCheckListBox
        Tag = -1
        Left = 0
        Top = 21
        Width = 110
        Height = 227
        Align = alClient
        BiDiMode = bdRightToLeft
        Enabled = False
        ItemHeight = 13
        ParentBiDiMode = False
        TabOrder = 4
        OnClick = cb5Click
        OnKeyPress = NextTab
      end
      object cbAll: TCheckBox
        Left = 423
        Top = 3
        Width = 97
        Height = 17
        TabStop = False
        Anchors = [akTop, akRight]
        BiDiMode = bdRightToLeft
        Caption = '«‰ Œ«» Â„Â'
        ParentBiDiMode = False
        TabOrder = 5
        OnClick = cbAllClick
      end
    end
    object TS2: TTabSheet
      Tag = -1
      Caption = ' Õ”«» Â«Ì „Ã«“'
      object Splitter5: TSplitter
        Left = 355
        Top = 24
        Width = 5
        Height = 224
        Cursor = crHSplit
        Align = alRight
        Beveled = True
      end
      object Bevel1: TBevel
        Tag = -1
        Left = 0
        Top = 0
        Width = 523
        Height = 24
        Align = alTop
      end
      object tvAckod: TTreeView
        Left = 0
        Top = 24
        Width = 355
        Height = 224
        Hint = 'Enter=«‰ ﬁ«· »Â ·Ì”  '
        Align = alClient
        DragMode = dmAutomatic
        Indent = 19
        ParentColor = True
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 0
        TabStop = False
        OnKeyPress = tvAckodKeyPress
        Items.Data = {
          030000001D000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000
          04C8CFE5ED1F000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000
          0006D3D1E3C7EDE51F000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000
          0000000006CFC7D1C7EDED}
      end
      object ListAc: TXPListBox
        Left = 360
        Top = 24
        Width = 163
        Height = 224
        Align = alRight
        BiDiMode = bdRightToLeft
        ItemHeight = 13
        ParentBiDiMode = False
        Sorted = True
        TabOrder = 1
        OnDblClick = ListAcDblClick
      end
    end
    object TS3: TTabSheet
      Caption = '”ÿÊÕ „—«ò“ Â“Ì‰Â Ê ’‰œÊﬁ'
      ImageIndex = 2
      object Label5: TLabel
        Left = 317
        Top = 5
        Width = 163
        Height = 21
        Alignment = taRightJustify
        Anchors = [akTop, akRight]
        AutoSize = False
        Caption = '’‰œÊﬁ Â«Ì „Ã«“'
      end
      object Label6: TLabel
        Left = 26
        Top = 3
        Width = 162
        Height = 21
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'ê—ÊÂ Â«Ì „Ã«“ „—«ò“ Â“Ì‰Â'
      end
      object lCashier: TXPCheckListBox
        Left = 316
        Top = 28
        Width = 165
        Height = 213
        Anchors = [akTop, akRight, akBottom]
        ItemHeight = 13
        TabOrder = 0
      end
      object lCGroup: TXPCheckListBox
        Left = 24
        Top = 28
        Width = 165
        Height = 213
        Anchors = [akLeft, akTop, akBottom]
        ItemHeight = 13
        TabOrder = 1
      end
    end
  end
end
