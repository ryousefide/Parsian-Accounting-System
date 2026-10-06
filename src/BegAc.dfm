object FbegAc: TFbegAc
  Tag = 1
  Left = 541
  Top = 179
  BiDiMode = bdRightToLeft
  BorderIcons = []
  BorderStyle = bsNone
  Caption = '„«‰œÂ «Ê· œÊ—Â Õ”«» Â« '
  ClientHeight = 249
  ClientWidth = 471
  Color = clBtnFace
  Font.Charset = ARABIC_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poMainFormCenter
  Visible = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object BItems: TDBGrid
    Left = 0
    Top = 0
    Width = 471
    Height = 224
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = FroDM.AcBillDs
    FixedColor = clTeal
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Serif'
    Font.Style = []
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = ARABIC_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Mitra'
    TitleFont.Style = [fsBold]
    OnColEnter = BItemsColEnter
    OnColExit = BItemsColExit
    OnEditButtonClick = BItemsEditButtonClick
    OnEnter = BItemsEnter
    OnKeyDown = BItemsKeyDown
    OnKeyPress = BItemsKeyPress
    Columns = <
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'Radif'
        Title.Alignment = taCenter
        Title.Caption = '#'
        Width = 29
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Accnam'
        Title.Alignment = taCenter
        Title.Caption = '‰«„ Õ”«»'
        Width = 126
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'Bed'
        Title.Alignment = taCenter
        Title.Caption = '»œÂﬂ«—'
        Width = 114
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'Bes'
        Title.Alignment = taCenter
        Title.Caption = '»” «‰ﬂ«—'
        Width = 107
        Visible = True
      end>
    object GList: TPopupListBox
      Left = 198
      Top = 20
      Width = 35
      Height = 224
      TabStop = False
      BiDiMode = bdRightToLeft
      Color = clSilver
      ItemHeight = 13
      Parent = BItems
      ParentBiDiMode = False
      ParentShowHint = False
      ShowHint = True
      Sorted = True
      TabOrder = 0
      Visible = False
      OnKeyDown = GListKeyDown
      OnKeyPress = GListKeyPress
    end
  end
  object Bexit: TButton
    Left = 397
    Top = 224
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '»⁄œÌ'
    TabOrder = 1
    OnClick = BexitClick
  end
end
