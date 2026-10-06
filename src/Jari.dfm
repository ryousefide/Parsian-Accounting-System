object FJari: TFJari
  Tag = 1
  Left = 161
  Top = 125
  ActiveControl = JariNam
  Anchors = [akLeft, akTop, akRight, akBottom]
  BiDiMode = bdRightToLeft
  BorderStyle = bsSingle
  Caption = 'Õ”«» Ã«—Ì »«‰ﬂ'
  ClientHeight = 427
  ClientWidth = 865
  Color = clBtnFace
  Font.Charset = ARABIC_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poDefaultSizeOnly
  PrintScale = poPrintToFit
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 865
    Height = 396
    Anchors = [akLeft, akTop, akRight, akBottom]
  end
  object Label1: TLabel
    Left = 822
    Top = 6
    Width = 37
    Height = 19
    Anchors = [akTop, akRight]
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = 'Ã«—Ì'
    FocusControl = JariNam
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object DBText1: TDBText
    Left = 156
    Top = 5
    Width = 251
    Height = 20
    Anchors = [akTop, akRight]
    BiDiMode = bdRightToLeft
    DataField = 'DJari'
    DataSource = FroDM.JariNamDs
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object DBText2: TDBText
    Left = 412
    Top = 5
    Width = 120
    Height = 21
    Anchors = [akTop, akRight]
    BiDiMode = bdRightToLeft
    DataField = 'Bnam'
    DataSource = FroDM.JariNamDs
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object Label2: TLabel
    Left = 539
    Top = 6
    Width = 31
    Height = 19
    Alignment = taCenter
    Anchors = [akTop, akRight]
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '»«‰ﬂ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object Bevel2: TBevel
    Left = 0
    Top = 400
    Width = 865
    Height = 27
    Anchors = [akLeft, akRight, akBottom]
  end
  object spDouble: TSpeedButton
    Left = 15
    Top = 5
    Width = 23
    Height = 22
    Hint = 'ÃÂ  ”—Ì«· Â«Ì  ﬂ—«—Ì'
    Flat = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FFFFFFFFFFF
      FFFF33333333333FFFFF3FFFFFFFFF00000F333333333377777F33FFFFFFFF09
      990F33333333337F337F333FFFFFFF09990F33333333337F337F3333FFFFFF09
      990F33333333337FFF7F33333FFFFF00000F3333333333777773333333FFFFFF
      FFFF3FFFFF3333333F330000033FFFFF0FFF77777F3333337FF30EEE0333FFF0
      00FF7F337FFF333777FF0EEE00033F00000F7F33777F3777777F0EEE0E033000
      00007FFF7F7FF777777700000E00033000FF777773777F3777F3330EEE0E0330
      00FF337FFF7F7F3777F33300000E033000FF337777737F37773333330EEE0300
      03FF33337FFF77777333333300000333333F3333777773333333}
    NumGlyphs = 2
    ParentShowHint = False
    ShowHint = True
    OnClick = spDoubleClick
  end
  object DBText3: TDBText
    Left = 575
    Top = 5
    Width = 68
    Height = 20
    Anchors = [akTop, akRight]
    BiDiMode = bdRightToLeft
    DataField = 'Bkod'
    DataSource = FroDM.JariNamDs
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object JariDbg: TDBGrid
    Left = 1
    Top = 32
    Width = 863
    Height = 363
    Anchors = [akLeft, akTop, akRight, akBottom]
    BiDiMode = bdRightToLeft
    DataSource = FroDM.JariDS
    FixedColor = clTeal
    ParentBiDiMode = False
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = ARABIC_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Serif'
    TitleFont.Style = []
    OnEditButtonClick = JariDbgEditButtonClick
    OnEnter = JariDbgEnter
    OnKeyDown = JariDbgKeyDown
    OnKeyPress = JariDbgKeyPress
    Columns = <
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'Id'
        Title.Caption = '—œÌ›'
        Width = 32
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Dat'
        Title.Alignment = taCenter
        Title.Caption = ' «—ÌŒ'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Des'
        Title.Alignment = taCenter
        Title.Caption = '‘—Õ'
        Width = 205
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Serial'
        Title.Alignment = taCenter
        Title.Caption = '‘„«—Â ”‰œ'
        Width = 55
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Bedeh'
        Title.Alignment = taCenter
        Title.Caption = '»œÂﬂ«—'
        Width = 102
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Bestan'
        Title.Alignment = taCenter
        Title.Caption = '»” «‰ﬂ«—'
        Width = 91
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Rema'
        Title.Alignment = taCenter
        Title.Caption = '„«‰œÂ'
        Width = 123
        Visible = True
      end>
  end
  object JariNam: TComboBox
    Left = 647
    Top = 5
    Width = 168
    Height = 21
    Style = csDropDownList
    Anchors = [akTop, akRight]
    BiDiMode = bdRightToLeft
    ItemHeight = 13
    ParentBiDiMode = False
    TabOrder = 0
    OnChange = JariNamExit
    OnKeyPress = JariNamKeyPress
  end
  object BExit: TButton
    Left = 526
    Top = 401
    Width = 84
    Height = 25
    Anchors = [akLeft, akBottom]
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
    TabOrder = 8
    OnClick = BExitClick
  end
  object Bcash: TButton
    Left = 125
    Top = 401
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    BiDiMode = bdRightToLeft
    Caption = '&Ê«—Ì“ ‰ﬁœÌ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 3
    OnClick = BcashClick
  end
  object Bpass: TButton
    Left = 1
    Top = 401
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    BiDiMode = bdRightToLeft
    Caption = '&Å«” çﬂ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 2
    OnClick = BpassClick
  end
  object BPrint: TButton
    Left = 376
    Top = 401
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    BiDiMode = bdRightToLeft
    Caption = '&ç«Å'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 6
    OnClick = BPrintClick
  end
  object BhavBill: TButton
    Left = 200
    Top = 401
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    BiDiMode = bdRightToLeft
    Caption = '&»—œ«‘  ‰ﬁœÌ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 4
    OnClick = BhavBillClick
  end
  object BCMoz: TButton
    Left = 275
    Top = 401
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    BiDiMode = bdRightToLeft
    Caption = '&ﬂ«—„“œ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 5
    OnClick = BCMozClick
  end
  object Brepair: TButton
    Left = 451
    Top = 401
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    BiDiMode = bdRightToLeft
    Caption = '&»«“”«“Ì'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 7
    OnClick = BrepairClick
  end
  object FSer: TEdit
    Left = 39
    Top = 5
    Width = 110
    Height = 21
    Hint = 'Ã” ÃÊÌ ‘„«—Â ”‰œ'
    TabStop = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
    OnChange = FSerChange
  end
end
