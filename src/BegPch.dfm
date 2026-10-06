object FbegPch: TFbegPch
  Tag = 1
  Left = 541
  Top = 241
  ActiveControl = PGrid
  BiDiMode = bdRightToLeft
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'çﬂ Â«Ì ’«œ—Â «Ê· œÊ—Â'
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
  object PGrid: TDBGrid
    Left = 0
    Top = 0
    Width = 471
    Height = 222
    TabStop = False
    Anchors = [akLeft, akTop, akRight, akBottom]
    BiDiMode = bdRightToLeft
    DataSource = FroDM.PcheqDs
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
    OnColEnter = PGridColEnter
    OnEditButtonClick = PGridEditButtonClick
    OnEnter = PGridEnter
    OnKeyDown = PGridKeyDown
    OnKeyPress = PGridKeyPress
    Columns = <
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'Bdat'
        Title.Alignment = taCenter
        Title.Caption = '”——”Ìœ'
        Width = 80
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Bno'
        Title.Alignment = taCenter
        Title.Caption = '”—Ì«·'
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Jari'
        Title.Alignment = taCenter
        Title.Caption = 'Ã«—Ì'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Pbill'
        Title.Alignment = taCenter
        Title.Caption = '„»·€'
        Width = 127
        Visible = True
      end>
    object GList: TPopupListBox
      Left = 218
      Top = 20
      Width = 35
      Height = 222
      TabStop = False
      BiDiMode = bdRightToLeft
      Color = clSilver
      ItemHeight = 13
      Parent = PGrid
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
  object Fpayed: TEdit
    Left = 134
    Top = 226
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
    Caption = 'Œ—ÊÃ'
    TabOrder = 2
    OnClick = BnextClick
  end
  object Bprev: TButton
    Left = 0
    Top = 224
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'ﬁ»·Ì'
    TabOrder = 3
    OnClick = BprevClick
  end
end
