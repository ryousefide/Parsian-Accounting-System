object FJariEdit: TFJariEdit
  Left = 365
  Top = 180
  AutoSize = True
  BiDiMode = bdRightToLeft
  BorderStyle = bsNone
  BorderWidth = 5
  Caption = ' ’ÕÌÕ  »«‰ò '
  ClientHeight = 277
  ClientWidth = 599
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
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 527
    Top = 7
    Width = 59
    Height = 18
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '‰«„ Ã«—Ì'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object Label2: TLabel
    Left = 527
    Top = 64
    Width = 59
    Height = 18
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '‰«„ »«‰ﬂ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object Label3: TLabel
    Left = 527
    Top = 35
    Width = 59
    Height = 18
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = 'œ«—‰œÂ Ã«—Ì'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object Label5: TLabel
    Left = 248
    Top = 7
    Width = 59
    Height = 18
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '‰Ê⁄ «—“'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object Label4: TLabel
    Left = 237
    Top = 36
    Width = 70
    Height = 18
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = 'Õ”«» ÊÃÊÂ ‰ﬁœ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object Label6: TLabel
    Left = 229
    Top = 64
    Width = 78
    Height = 18
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = 'Õ”«» «”‰«œ ’«œ—Â'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 599
    Height = 277
  end
  object dbg: TDBGrid
    Left = 6
    Top = 104
    Width = 583
    Height = 133
    TabStop = False
    DataSource = FroDM.JariNamDs
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 6
    TitleFont.Charset = ARABIC_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'Nam'
        Title.Caption = '‰«„ Ã«—Ì'
        Width = 143
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'Bnam'
        Title.Caption = '‰«„ »«‰ò'
        Width = 146
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'DJari'
        Title.Caption = 'œ«—‰œÂ Ã«—Ì'
        Width = 151
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'Bkod'
        Title.Caption = '‰Ê⁄ «—“'
        Width = 72
        Visible = True
      end>
  end
  object dbn: TDBNavigator
    Left = 9
    Top = 238
    Width = 120
    Height = 22
    DataSource = FroDM.JariNamDs
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost]
    Flat = True
    Hints.Strings = (
      '«Ê·Ì‰ —ﬂÊ—œ'
      '—ﬂÊ—œ ﬁ»·Ì'
      '—ﬂÊ—œ »⁄œÌ'
      '¬Œ—Ì‰ —ﬂÊ—œ'
      '—ﬂÊ—œ ÃœÌœ'
      'Õ–› —ﬂÊ—œ'
      ' ’ÕÌÕ —ﬂÊ—œ'
      'À» '
      '«‰’—«›'
      '»«“”«“Ì')
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
  end
  object Fjarinam: TDBEdit
    Left = 339
    Top = 5
    Width = 174
    Height = 21
    AutoSize = False
    BiDiMode = bdRightToLeft
    DataField = 'Nam'
    DataSource = FroDM.JariNamDs
    MaxLength = 20
    ParentBiDiMode = False
    ReadOnly = True
    TabOrder = 0
    OnKeyPress = NextTab
  end
  object FDjari: TDBEdit
    Left = 339
    Top = 33
    Width = 174
    Height = 21
    AutoSize = False
    BiDiMode = bdRightToLeft
    DataField = 'DJari'
    DataSource = FroDM.JariNamDs
    ParentBiDiMode = False
    TabOrder = 1
    OnKeyPress = NextTab
  end
  object FBkod: TDBComboBox
    Left = 139
    Top = 4
    Width = 83
    Height = 21
    Style = csDropDownList
    BiDiMode = bdRightToLeft
    DataField = 'Bkod'
    DataSource = FroDM.JariNamDs
    ItemHeight = 13
    ParentBiDiMode = False
    TabOrder = 3
    OnKeyPress = NextTab
  end
  object FBank: TDBComboBox
    Left = 339
    Top = 62
    Width = 174
    Height = 21
    BiDiMode = bdRightToLeft
    DataField = 'Bnam'
    DataSource = FroDM.JariNamDs
    ItemHeight = 13
    ParentBiDiMode = False
    TabOrder = 2
    OnKeyPress = NextTab
  end
  object FBehKod: TDBLookupComboBox
    Left = 61
    Top = 32
    Width = 161
    Height = 21
    BiDiMode = bdRightToLeft
    Constraints.MaxHeight = 28
    DataField = 'AccKod'
    DataSource = FroDM.JariNamDs
    KeyField = 'Acckod'
    ListField = 'Nam'
    ListSource = FroDM.AcKodDs
    ParentBiDiMode = False
    ParentColor = True
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
  end
  object FBesKod: TDBLookupComboBox
    Left = 61
    Top = 64
    Width = 161
    Height = 21
    BiDiMode = bdRightToLeft
    Constraints.MaxHeight = 28
    DataField = 'CheqKod'
    DataSource = FroDM.JariNamDs
    KeyField = 'Acckod'
    ListField = 'Nam'
    ListSource = FroDM.AcKodDs
    ParentBiDiMode = False
    ParentColor = True
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
  end
end
