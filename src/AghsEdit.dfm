object FAgsEdit: TFAgsEdit
  Tag = 1
  Left = 259
  Top = 112
  BiDiMode = bdRightToLeft
  BorderStyle = bsSingle
  BorderWidth = 3
  Caption = '«’·«Õ «ﬁ”«ÿ'
  ClientHeight = 214
  ClientWidth = 517
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
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel2: TBevel
    Left = 0
    Top = 187
    Width = 517
    Height = 27
    Anchors = [akLeft, akRight, akBottom]
  end
  object FNam: TComboBox
    Left = 367
    Top = 4
    Width = 142
    Height = 21
    Hint = '‰«„ „ ⁄Âœ'
    Style = csDropDownList
    Anchors = [akTop, akRight]
    ItemHeight = 13
    ParentShowHint = False
    ShowHint = True
    Sorted = True
    TabOrder = 0
    OnKeyPress = NextTab
  end
  object Rg: TRadioGroup
    Left = 1
    Top = 0
    Width = 340
    Height = 31
    Columns = 4
    ItemIndex = 0
    Items.Strings = (
      'Å—œ«Œ  ‰‘œÂ'
      'Å—œ«Œ  ‘œÂ'
      '—Ê“'
      'ﬂ·ÌÂ')
    TabOrder = 1
  end
  object dbg1: TDBGrid
    Left = 0
    Top = 32
    Width = 516
    Height = 147
    Hint = 'Ctrl+N ﬁ»÷ œ—Ì«› '
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = FroDM.AghsDs
    ParentShowHint = False
    PopupMenu = PopupMenu1
    ShowHint = False
    TabOrder = 2
    TitleFont.Charset = ARABIC_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Serif'
    TitleFont.Style = []
    OnDrawColumnCell = dbg1DrawColumnCell
    OnKeyDown = dbg1KeyDown
    OnKeyPress = dbg1KeyPress
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'No'
        Title.Alignment = taCenter
        Title.Caption = '‘„«—Â'
        Width = 41
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'Dat'
        Title.Alignment = taCenter
        Title.Caption = ' «—ÌŒ'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nam'
        Title.Alignment = taCenter
        Title.Caption = '„ ⁄Âœ'
        Width = 125
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'Gprice'
        Title.Alignment = taCenter
        Title.Caption = '„»·€'
        Width = 100
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'RNo'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = ' ﬁ»÷'
        Width = 43
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'RDat'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = '’«œ—Â'
        Width = 71
        Visible = True
      end>
  end
  object BShow: TButton
    Left = 2
    Top = 188
    Width = 87
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '‰„«Ì‘'
    TabOrder = 3
    OnClick = BShowClick
  end
  object Bexit: TButton
    Left = 427
    Top = 188
    Width = 87
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Œ—ÊÃ'
    TabOrder = 4
    OnClick = BexitClick
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 341
    Top = 191
    object N1: TMenuItem
      Caption = 'œ—Ì«› '
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = 'Õ–›'
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = ' €ÌÌ— Ê÷⁄Ì '
      OnClick = N3Click
    end
  end
end
