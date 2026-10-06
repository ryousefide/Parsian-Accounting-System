object FAcRem: TFAcRem
  Tag = 1
  Left = 274
  Top = 165
  BiDiMode = bdRightToLeft
  BorderStyle = bsNone
  BorderWidth = 3
  Caption = '„«‰œÂ êÌ—Ì'
  ClientHeight = 318
  ClientWidth = 689
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
  object rgFilt: TRadioGroup
    Left = 0
    Top = 276
    Width = 214
    Height = 39
    Cursor = crHandPoint
    Anchors = [akLeft, akBottom]
    BiDiMode = bdRightToLeft
    Caption = '„«‰œÂ'
    Color = clBtnFace
    Columns = 3
    ItemIndex = 2
    Items.Strings = (
      '»œÂﬂ«—«‰'
      '»” «‰ﬂ«—«‰'
      'ﬂ·ÌÂ')
    ParentBiDiMode = False
    ParentColor = False
    TabOrder = 2
    OnClick = rgAccClick
  end
  object rgAcc: TRadioGroup
    Left = 460
    Top = 277
    Width = 227
    Height = 39
    Cursor = crHandPoint
    Anchors = [akRight, akBottom]
    BiDiMode = bdRightToLeft
    Caption = 'Õ”«»Â«Ì'
    Color = clBtnFace
    Columns = 3
    ItemIndex = 2
    Items.Strings = (
      '⁄„·Ì« Ì'
      '«⁄ »«—Ì'
      '»œÂò«—«‰')
    ParentBiDiMode = False
    ParentColor = False
    TabOrder = 1
    OnClick = rgAccClick
  end
  object Rems: TDBGrid
    Left = 0
    Top = 0
    Width = 689
    Height = 277
    TabStop = False
    Anchors = [akLeft, akTop, akRight, akBottom]
    BiDiMode = bdRightToLeft
    DataSource = FroDM.GardeshDs
    DefaultDrawing = False
    FixedColor = clTeal
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = ARABIC_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Mitra'
    TitleFont.Style = [fsBold]
    OnDrawColumnCell = RemsDrawColumnCell
    OnKeyPress = RemsKeyPress
    Columns = <
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'Dat'
        Title.Alignment = taCenter
        Title.Caption = ' «—ÌŒ'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Des'
        Title.Alignment = taCenter
        Title.Caption = '‘—Õ'
        Width = 160
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'Bedeh'
        Title.Alignment = taCenter
        Title.Caption = '»œÂﬂ«—'
        Width = 122
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'Bestan'
        Title.Alignment = taCenter
        Title.Caption = '»” «‰ﬂ«—'
        Width = 118
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'Baghi'
        Title.Alignment = taCenter
        Title.Caption = '„«‰œÂ'
        Width = 122
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 215
    Top = 285
    Width = 245
    Height = 33
    Anchors = [akLeft, akRight, akBottom]
    BevelInner = bvLowered
    BorderWidth = 2
    TabOrder = 3
    object Bexit: TButton
      Left = 151
      Top = 4
      Width = 90
      Height = 25
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
      TabOrder = 2
      OnClick = BexitClick
    end
    object Bprint: TButton
      Left = 4
      Top = 4
      Width = 95
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
      TabOrder = 0
      OnClick = BprintClick
    end
    object Bshow: TButton
      Left = 99
      Top = 4
      Width = 51
      Height = 25
      Anchors = [akLeft, akRight, akBottom]
      BiDiMode = bdRightToLeft
      Caption = '‰„«Ì‘'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Mitra'
      Font.Style = [fsBold, fsItalic]
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 1
      OnClick = rgAccClick
    end
  end
  object PrgB: TProgressBar
    Left = 215
    Top = 276
    Width = 245
    Height = 10
    Anchors = [akLeft, akRight, akBottom]
    Min = 0
    Max = 100
    TabOrder = 4
  end
end
