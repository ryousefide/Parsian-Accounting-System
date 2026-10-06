object FCperm: TFCperm
  Tag = 1
  Left = 220
  Top = 126
  HelpContext = 140
  BiDiMode = bdRightToLeft
  BorderStyle = bsNone
  Caption = ' ‰ŸÌ„ „—«ﬂ“ Â“Ì‰Â'
  ClientHeight = 484
  ClientWidth = 717
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
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
    Left = 0
    Top = 352
    Width = 717
    Height = 11
    Cursor = crVSplit
    Align = alBottom
    Beveled = True
  end
  object Panel1: TPanel
    Tag = 1
    Left = 0
    Top = 28
    Width = 717
    Height = 62
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 6
    Visible = False
    object Label1: TLabel
      Left = 654
      Top = 4
      Width = 53
      Height = 21
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = '‰«„ „—ﬂ“'
      Layout = tlCenter
    end
    object Label2: TLabel
      Left = 453
      Top = 4
      Width = 45
      Height = 21
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = 'ê—ÊÂ'
      Layout = tlCenter
    end
    object BNext: TBitBtn
      Left = 5
      Top = 21
      Width = 67
      Height = 19
      Caption = '»⁄œÌ'
      Default = True
      TabOrder = 2
      OnClick = BNextClick
    end
    object BPrev: TBitBtn
      Left = 72
      Top = 21
      Width = 67
      Height = 19
      Caption = 'ﬁ»·Ì'
      TabOrder = 3
      OnClick = BPrevClick
    end
    object BRet: TBitBtn
      Left = 5
      Top = 40
      Width = 134
      Height = 19
      Cancel = True
      Caption = '»«“ê‘ '
      TabOrder = 4
      OnClick = BRetClick
    end
    object BFirst: TBitBtn
      Left = 5
      Top = 2
      Width = 67
      Height = 19
      Caption = '«Ê·Ì‰'
      TabOrder = 0
      OnClick = BFirstClick
    end
    object BLast: TBitBtn
      Left = 72
      Top = 2
      Width = 67
      Height = 19
      Caption = '¬Œ—Ì‰'
      TabOrder = 1
      OnClick = BLastClick
    end
    object FCen: TEdit
      Left = 501
      Top = 4
      Width = 147
      Height = 21
      HelpContext = 141
      Anchors = [akTop, akRight]
      TabOrder = 5
      OnChange = FCenChange
      OnKeyPress = NextTab
    end
    object FGro: TComboBox
      Left = 301
      Top = 4
      Width = 146
      Height = 21
      HelpContext = 142
      Anchors = [akTop, akRight]
      BiDiMode = bdRightToLeft
      ItemHeight = 13
      MaxLength = 45
      ParentBiDiMode = False
      Sorted = True
      TabOrder = 6
      OnChange = FGroChange
      OnKeyPress = NextTab
    end
  end
  object Cdbg: TDBGrid
    Tag = 1
    Left = 0
    Top = 90
    Width = 717
    Height = 262
    HelpContext = 143
    Align = alClient
    DataSource = FroDM.CentDs
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnColEnter = CdbgColEnter
    OnEditButtonClick = CdbgEditButtonClick
    OnKeyDown = CdbgKeyDown
    OnKeyPress = CdbgKeyPress
    Columns = <
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'Radif'
        Title.Caption = '—œÌ›'
        Width = 31
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Kod'
        ReadOnly = True
        Title.Caption = 'ﬂœ'
        Width = 57
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'Nam'
        Title.Alignment = taCenter
        Title.Caption = '‘—Õ'
        Width = 212
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EName'
        Title.Alignment = taCenter
        Title.Caption = '‘—Õ «‰ê·Ì”Ì'
        Width = 130
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'Grop'
        Title.Alignment = taCenter
        Title.Caption = 'ê—ÊÂ'
        Width = 119
        Visible = True
      end>
  end
  object Pdbg: TDBGrid
    Left = 0
    Top = 363
    Width = 717
    Height = 121
    Hint = '·Ì”  Õ”«» Â«Ì Ê«Ã» «·„—ò“'
    Align = alBottom
    Enabled = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Visible = False
    OnColEnter = PdbgColEnter
    OnColExit = PdbgColExit
    OnEditButtonClick = PdbgEditButtonClick
    OnEnter = PdbgEnter
    OnKeyPress = PdbgKeyPress
    Columns = <
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'Radif'
        Title.Caption = '—œÌ›'
        Width = 28
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Ackod'
        Title.Alignment = taCenter
        Title.Caption = 'ﬂœ Õ”«»'
        Width = 119
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Acnam'
        Title.Alignment = taCenter
        Title.Caption = '‰«„ Õ”«»'
        Width = 195
        Visible = True
      end>
    object GKod: TPopupListBox
      Left = 610
      Top = 8
      Width = 35
      Height = 121
      Color = clSilver
      ItemHeight = 13
      Parent = Pdbg
      TabOrder = 0
      Visible = False
      OnKeyDown = GKodKeyDown
      OnKeyPress = GKodKeyPress
    end
  end
  object BnewLast: TBitBtn
    Left = 2
    Top = 458
    Width = 85
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '„—ﬂ“ÃœÌœ'
    TabOrder = 2
    Visible = False
    OnClick = BnewLastClick
  end
  object BeditLast: TBitBtn
    Left = 87
    Top = 458
    Width = 214
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = ' ’ÕÌÕ „—«ò“ Ê Õ”«» Â«Ì „— »ÿ'
    TabOrder = 3
    Visible = False
    OnClick = BeditLastClick
  end
  object Bsave: TBitBtn
    Left = 301
    Top = 458
    Width = 115
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'À» '
    TabOrder = 4
    Visible = False
    OnClick = BsaveClick
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 717
    Height = 28
    Align = alTop
    AutoSize = True
    TabOrder = 5
    object BNew: TBitBtn
      Left = 651
      Top = 2
      Width = 66
      Height = 25
      HelpContext = 58
      Anchors = [akTop, akRight]
      Caption = '&ÃœÌœ'
      ModalResult = 5
      TabOrder = 0
      OnClick = BNewClick
    end
    object BEdit: TBitBtn
      Left = 585
      Top = 2
      Width = 66
      Height = 25
      HelpContext = 51
      Anchors = [akTop, akRight]
      Caption = '«’·«Õ'
      TabOrder = 1
      OnClick = BEditClick
    end
    object BDel: TBitBtn
      Tag = 2
      Left = 519
      Top = 2
      Width = 66
      Height = 25
      HelpContext = 52
      Anchors = [akTop, akRight]
      Caption = 'Õ–›'
      TabOrder = 2
      OnClick = BDelClick
    end
    object BPrint: TBitBtn
      Left = 114
      Top = 1
      Width = 53
      Height = 25
      HelpContext = 53
      Anchors = [akTop, akRight]
      Caption = 'ç«Å'
      TabOrder = 3
      OnClick = BPrintClick
    end
    object Bexit: TBitBtn
      Left = 2
      Top = 2
      Width = 82
      Height = 25
      HelpContext = 54
      Cancel = True
      Caption = 'Œ—ÊÃ'
      TabOrder = 4
      OnClick = BexitClick
    end
    object bFilter: TBitBtn
      Left = 232
      Top = 1
      Width = 66
      Height = 25
      Anchors = [akTop, akRight]
      BiDiMode = bdRightToLeft
      Caption = '&›Ì· —'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Mitra'
      Font.Style = [fsBold, fsItalic]
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 5
      OnClick = bFilterClick
    end
    object BSearch: TBitBtn
      Left = 167
      Top = 1
      Width = 66
      Height = 25
      Anchors = [akTop, akRight]
      BiDiMode = bdRightToLeft
      Caption = '&Ã” ÃÊ'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Mitra'
      Font.Style = [fsBold, fsItalic]
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 6
      OnClick = BSearchClick
    end
    object bLink: TBitBtn
      Tag = 2
      Left = 415
      Top = 2
      Width = 92
      Height = 25
      HelpContext = 52
      Anchors = [akTop, akRight]
      Caption = '«— »«ÿ „—«ò“'
      TabOrder = 7
      OnClick = bLinkClick
    end
  end
end
