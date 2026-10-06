object FbegRch: TFbegRch
  Tag = 1
  Left = 540
  Top = 210
  BiDiMode = bdRightToLeft
  BorderIcons = []
  BorderStyle = bsNone
  Caption = '«”‰«œ œ—Ì«› Ì «Ê· œÊ—Â'
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
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DGrid: TDBGrid
    Left = 0
    Top = 0
    Width = 471
    Height = 222
    TabStop = False
    Anchors = [akLeft, akTop, akRight, akBottom]
    BiDiMode = bdRightToLeft
    DataSource = FroDM.RcheqDs
    FixedColor = clTeal
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Serif'
    Font.Style = []
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = ARABIC_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Mitra'
    TitleFont.Style = [fsBold]
    OnColEnter = DGridColEnter
    OnEditButtonClick = DGridEditButtonClick
    OnKeyDown = DGridKeyDown
    OnKeyPress = DGridKeyPress
    Columns = <
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'Bdat'
        Title.Alignment = taCenter
        Title.Caption = '”——”Ìœ'
        Width = 66
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Bno'
        Title.Alignment = taCenter
        Title.Caption = '”—Ì«·'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Pbill'
        Title.Alignment = taCenter
        Title.Caption = '„»·€'
        Width = 106
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Bank'
        Title.Alignment = taCenter
        Title.Caption = '»«‰ﬂ'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Bkod'
        Title.Alignment = taCenter
        Title.Caption = 'Ã«—Ì'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AccKod'
        Visible = False
      end>
    object AList: TPopupListBox
      Left = 198
      Top = 20
      Width = 35
      Height = 222
      TabStop = False
      BiDiMode = bdRightToLeft
      Color = clSilver
      ItemHeight = 13
      Parent = DGrid
      ParentBiDiMode = False
      ParentShowHint = False
      ShowHint = True
      Sorted = True
      TabOrder = 0
      Visible = False
      OnKeyDown = AListKeyDown
      OnKeyPress = AListKeyPress
    end
    object GList: TPopupListBox
      Left = 198
      Top = 20
      Width = 35
      Height = 222
      TabStop = False
      BiDiMode = bdRightToLeft
      Color = clSilver
      ItemHeight = 13
      Parent = DGrid
      ParentBiDiMode = False
      ParentShowHint = False
      ShowHint = True
      Sorted = True
      TabOrder = 1
      Visible = False
      OnKeyDown = GListKeyDown
      OnKeyPress = GListKeyPress
    end
  end
  object Fpayed: TEdit
    Left = 125
    Top = 227
    Width = 167
    Height = 18
    TabStop = False
    Anchors = [akLeft, akBottom]
    AutoSize = False
    BiDiMode = bdRightToLeft
    BorderStyle = bsNone
    ParentBiDiMode = False
    ParentColor = True
    TabOrder = 1
  end
  object Bnext: TButton
    Left = 396
    Top = 224
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '»⁄œÌ'
    TabOrder = 2
    OnClick = BnextClick
  end
  object BPrev: TButton
    Left = 0
    Top = 224
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'ﬁ»·Ì'
    TabOrder = 3
    OnClick = BPrevClick
  end
end
