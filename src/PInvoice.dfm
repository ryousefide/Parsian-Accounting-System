object FPInvoice: TFPInvoice
  Tag = 1
  Left = 278
  Top = 210
  ActiveControl = FNo
  BiDiMode = bdLeftToRight
  BorderStyle = bsNone
  BorderWidth = 3
  Caption = 'ÅÌ‘ ›«ﬂ Ê— ›—Ê‘ '
  ClientHeight = 463
  ClientWidth = 761
  Color = clBtnFace
  Font.Charset = ARABIC_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
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
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 384
    Width = 761
    Height = 79
    Anchors = [akLeft, akRight, akBottom]
  end
  object Label1: TLabel
    Left = 715
    Top = 29
    Width = 44
    Height = 19
    Alignment = taRightJustify
    Anchors = [akTop, akRight]
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = 'Œ—Ìœ«—'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    Layout = tlCenter
  end
  object Label2: TLabel
    Left = 497
    Top = 29
    Width = 29
    Height = 19
    Alignment = taCenter
    Anchors = [akTop, akRight]
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = ' ·›‰'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    Layout = tlCenter
  end
  object Label3: TLabel
    Left = 123
    Top = 4
    Width = 34
    Height = 17
    Alignment = taCenter
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = ' «—ÌŒ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    Layout = tlCenter
  end
  object Label4: TLabel
    Left = 715
    Top = 1
    Width = 44
    Height = 19
    Alignment = taRightJustify
    Anchors = [akTop, akRight]
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '‘„«—Â'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    Layout = tlCenter
  end
  object Label5: TLabel
    Left = 715
    Top = 58
    Width = 44
    Height = 18
    Alignment = taRightJustify
    Anchors = [akTop, akRight]
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '¬œ—”'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    Layout = tlCenter
  end
  object DBText1: TDBText
    Left = 290
    Top = 2
    Width = 88
    Height = 18
    Alignment = taRightJustify
    BiDiMode = bdRightToLeftNoAlign
    DataField = 'Dat'
    DataSource = FroDM.PInvoDs
    ParentBiDiMode = False
    Visible = False
  end
  object Label6: TLabel
    Left = 151
    Top = 386
    Width = 52
    Height = 20
    Anchors = [akLeft, akBottom]
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = 'Ã„⁄ ﬂ·'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    Transparent = True
    Layout = tlCenter
  end
  object Label19: TLabel
    Left = 151
    Top = 437
    Width = 52
    Height = 20
    Anchors = [akLeft, akBottom]
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = 'Œ«·’'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    Transparent = True
    Layout = tlCenter
  end
  object Label12: TLabel
    Left = 151
    Top = 412
    Width = 52
    Height = 20
    Anchors = [akLeft, akBottom]
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = ' Œ›Ì›'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    Transparent = True
    Layout = tlCenter
  end
  object Label10: TLabel
    Left = 121
    Top = 31
    Width = 64
    Height = 17
    Alignment = taCenter
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = 'ﬂœ «ﬁ ’«œÌ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    Layout = tlCenter
  end
  object Label7: TLabel
    Left = 144
    Top = 58
    Width = 41
    Height = 19
    Alignment = taCenter
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = 'ÊÌ“Ì Ê—'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    Layout = tlCenter
  end
  object FPnet: TDBEdit
    Left = 2
    Top = 436
    Width = 143
    Height = 22
    Anchors = [akLeft, akBottom]
    AutoSize = False
    BiDiMode = bdRightToLeftNoAlign
    DataField = 'Pnet'
    DataSource = FroDM.PInvoDs
    ParentBiDiMode = False
    ReadOnly = True
    TabOrder = 10
    OnEnter = FPnetEnter
    OnKeyPress = NextTab
  end
  object FPkol: TDBEdit
    Left = 5
    Top = 385
    Width = 141
    Height = 22
    Anchors = [akLeft, akBottom]
    AutoSize = False
    BiDiMode = bdRightToLeftNoAlign
    DataField = 'Pkol'
    DataSource = FroDM.PInvoDs
    ParentBiDiMode = False
    ReadOnly = True
    TabOrder = 8
    OnEnter = GoodsExit
    OnKeyPress = NextTab
  end
  object FPdis: TDBEdit
    Left = 20
    Top = 411
    Width = 125
    Height = 22
    Anchors = [akLeft, akBottom]
    AutoSize = False
    BiDiMode = bdRightToLeftNoAlign
    DataField = 'Pdis'
    DataSource = FroDM.PInvoDs
    ParentBiDiMode = False
    TabOrder = 9
    OnEnter = FPdisEnter
    OnKeyPress = NextTab
  end
  object Goods: TDBGrid
    Left = 1
    Top = 83
    Width = 760
    Height = 295
    Hint = 'F4 ·Ì”  ﬂ„ﬂÌ'
    Anchors = [akLeft, akTop, akRight, akBottom]
    BiDiMode = bdRightToLeft
    DataSource = FroDM.PInvoGoodDs
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Serif'
    Font.Style = []
    ParentBiDiMode = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    TitleFont.Charset = ARABIC_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnColEnter = GoodsColEnter
    OnColExit = GoodsColExit
    OnEditButtonClick = GoodsEditButtonClick
    OnEnter = GoodsEnter
    OnKeyDown = GoodsKeyDown
    OnKeyPress = GoodsKeyPress
    Columns = <
      item
        Alignment = taCenter
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'Radif'
        Title.Alignment = taCenter
        Title.Caption = '—œÌ›'
        Width = 20
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'Kod'
        Title.Alignment = taCenter
        Title.Caption = 'ﬂœ ﬂ«·«'
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nam'
        Title.Alignment = taCenter
        Title.Caption = '‘—Õ ﬂ«·«'
        Width = 152
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Color'
        Title.Alignment = taCenter
        Title.Caption = '„œ·'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'AnbNam'
        Title.Alignment = taCenter
        Title.Caption = '«‰»«—'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AnbKod'
        Title.Alignment = taCenter
        Title.Caption = 'ﬁ›”Â'
        Visible = False
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Quant'
        Title.Alignment = taCenter
        Title.Caption = '„ﬁœ«—'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Unit'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'Ê«Õœ'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Pfee'
        Title.Alignment = taCenter
        Title.Caption = '»Â«Ì Ê«Õœ'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Perc'
        Title.Alignment = taCenter
        Title.Caption = 'œ—’œ'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Ptotal'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'Ã„⁄'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Serial'
        Title.Alignment = taCenter
        Title.Caption = '”—Ì«·'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Garan'
        Title.Caption = 'ê«—«‰ Ì'
        Width = 166
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Prop'
        Title.Caption = ' Ê÷ÌÕ« '
        Width = 231
        Visible = True
      end>
    object CList: TPopupListBox
      Left = 298
      Top = 18
      Width = 35
      Height = 295
      TabStop = False
      BiDiMode = bdRightToLeft
      Color = clSilver
      ItemHeight = 13
      Parent = Goods
      ParentBiDiMode = False
      ParentShowHint = False
      ShowHint = True
      Sorted = True
      TabOrder = 0
      Visible = False
      OnKeyDown = CListKeyDown
      OnKeyPress = CListKeyPress
    end
    object GoodList: TPopupListBox
      Left = 298
      Top = 18
      Width = 35
      Height = 295
      TabStop = False
      BiDiMode = bdRightToLeft
      Color = clSilver
      ItemHeight = 13
      Parent = Goods
      ParentBiDiMode = False
      ParentShowHint = False
      ShowHint = True
      Sorted = True
      TabOrder = 1
      Visible = False
      OnKeyDown = GoodListKeyDown
      OnKeyPress = GoodListKeyPress
    end
    object GList: TPopupListBox
      Left = 357
      Top = 18
      Width = 35
      Height = 295
      Hint = 'ﬂ«·«-„œ·-«‰»«—-ﬁ›”Â- ⁄œ«œ'
      TabStop = False
      Anchors = [akTop, akRight]
      BiDiMode = bdRightToLeft
      Color = clSilver
      ExtendedSelect = False
      ItemHeight = 13
      Parent = Goods
      ParentBiDiMode = False
      ParentShowHint = False
      ShowHint = True
      Sorted = True
      TabOrder = 2
      Visible = False
      OnKeyDown = GListKeyDown
      OnKeyPress = GListKeyPress
    end
    object AList: TPopupListBox
      Left = 164
      Top = 18
      Width = 35
      Height = 295
      TabStop = False
      BiDiMode = bdRightToLeft
      Color = clSilver
      ItemHeight = 13
      Parent = Goods
      ParentBiDiMode = False
      Sorted = True
      TabOrder = 3
      Visible = False
      OnKeyDown = AListKeyDown
      OnKeyPress = AListKeyPress
    end
  end
  object Ftel: TDBEdit
    Left = 363
    Top = 27
    Width = 126
    Height = 22
    Anchors = [akTop, akRight]
    AutoSize = False
    BiDiMode = bdRightToLeftNoAlign
    DataField = 'Tel'
    DataSource = FroDM.PInvoDs
    ParentBiDiMode = False
    TabOrder = 3
    OnKeyPress = NextTab
  end
  object FAdd: TDBEdit
    Left = 189
    Top = 56
    Width = 514
    Height = 22
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    BiDiMode = bdRightToLeft
    DataField = 'Adr'
    DataSource = FroDM.PInvoDs
    ParentBiDiMode = False
    TabOrder = 5
    OnKeyPress = NextTab
  end
  object Bprev: TButton
    Left = 518
    Top = 405
    Width = 52
    Height = 26
    Anchors = [akRight, akBottom]
    BiDiMode = bdRightToLeft
    Caption = '&ﬁ»·Ì'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 11
    OnClick = BprevClick
  end
  object Bsave: TButton
    Left = 570
    Top = 431
    Width = 52
    Height = 26
    Anchors = [akRight, akBottom]
    BiDiMode = bdRightToLeft
    Caption = '&À» '
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 16
    OnClick = BsaveClick
  end
  object Bnext: TButton
    Left = 570
    Top = 405
    Width = 52
    Height = 26
    Anchors = [akRight, akBottom]
    BiDiMode = bdRightToLeft
    Caption = '&»⁄œÌ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 12
    OnClick = BnextClick
  end
  object Bnew: TButton
    Left = 424
    Top = 422
    Width = 52
    Height = 26
    Anchors = [akRight, akBottom]
    BiDiMode = bdRightToLeft
    Caption = 'ÃœÌœ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 14
    TabStop = False
    Visible = False
    OnClick = BnewClick
  end
  object Bexit: TButton
    Left = 686
    Top = 405
    Width = 70
    Height = 52
    Anchors = [akRight, akBottom]
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
    TabOrder = 18
    OnClick = BexitClick
  end
  object Bprint: TButton
    Left = 623
    Top = 405
    Width = 63
    Height = 26
    Anchors = [akRight, akBottom]
    BiDiMode = bdRightToLeft
    Caption = '&ç«Å'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 13
    OnClick = BprintClick
  end
  object FNo: TEdit
    Left = 621
    Top = 0
    Width = 82
    Height = 21
    Anchors = [akTop, akRight]
    AutoSize = False
    BiDiMode = bdRightToLeftNoAlign
    Constraints.MaxHeight = 26
    ParentBiDiMode = False
    TabOrder = 0
    OnEnter = FNoEnter
    OnExit = FNoExit
    OnKeyDown = FormKeyDown
    OnKeyPress = NextTab
  end
  object Bdel: TButton
    Left = 623
    Top = 431
    Width = 63
    Height = 26
    Anchors = [akRight, akBottom]
    Caption = '&Õ–›'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 17
    OnClick = BdelClick
  end
  object FNam: TDBComboBox
    Left = 546
    Top = 28
    Width = 157
    Height = 21
    Anchors = [akTop, akRight]
    BiDiMode = bdRightToLeft
    DataField = 'Nam'
    DataSource = FroDM.PInvoDs
    ItemHeight = 13
    ParentBiDiMode = False
    TabOrder = 2
    OnExit = FNamExit
    OnKeyDown = FNamKeyDown
    OnKeyPress = NextTab
  end
  object FEco: TDBEdit
    Left = 6
    Top = 28
    Width = 113
    Height = 22
    AutoSize = False
    BiDiMode = bdRightToLeftNoAlign
    DataField = 'Eco'
    DataSource = FroDM.PInvoDs
    ParentBiDiMode = False
    TabOrder = 4
    OnKeyPress = NextTab
  end
  object dblVisit: TDBLookupComboBox
    Left = 4
    Top = 57
    Width = 132
    Height = 21
    DataField = 'Visit'
    DataSource = FroDM.PInvoDs
    KeyField = 'Code'
    ListField = 'Nam'
    ListSource = FroDM.VisitDs
    TabOrder = 6
    OnEnter = dblVisitEnter
    OnKeyPress = NextTab
  end
  object Bedit: TButton
    Left = 518
    Top = 431
    Width = 52
    Height = 26
    Anchors = [akRight, akBottom]
    BiDiMode = bdRightToLeft
    Caption = 'ÊÌ—«Ì‘'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 15
    OnClick = BeditClick
  end
  object Dat1: TMaskEdit
    Left = 37
    Top = 3
    Width = 82
    Height = 21
    AutoSize = False
    BiDiMode = bdRightToLeft
    Constraints.MaxHeight = 21
    EditMask = '1300/00/00;1;_'
    MaxLength = 10
    ParentBiDiMode = False
    TabOrder = 1
    Text = '13  /  /  '
    OnEnter = Dat1Enter
    OnExit = Dat1Exit
    OnKeyPress = NextTab
  end
end
