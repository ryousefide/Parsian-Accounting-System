object FChTaraz: TFChTaraz
  Tag = 1
  Left = 83
  Top = 156
  BiDiMode = bdRightToLeft
  BorderStyle = bsNone
  BorderWidth = 5
  Caption = ' —«“ «”‰«œ Ê«—œÂ /’«œ—Â'
  ClientHeight = 241
  ClientWidth = 541
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
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 541
    Height = 241
    Align = alClient
  end
  object Label1: TLabel
    Left = 464
    Top = 8
    Width = 58
    Height = 18
    Anchors = [akTop, akRight]
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = ' —«“ «“  «—ÌŒ '
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    Layout = tlCenter
  end
  object Label2: TLabel
    Left = 321
    Top = 7
    Width = 40
    Height = 16
    Anchors = [akTop, akRight]
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = ' «  «—ÌŒ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    Layout = tlCenter
  end
  object ChGrid: TDBGrid
    Left = 2
    Top = 29
    Width = 535
    Height = 174
    TabStop = False
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = FroDM.GardeshDs
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = ARABIC_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Serif'
    TitleFont.Style = []
    OnKeyPress = ChGridKeyPress
    Columns = <
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'Dat'
        Title.Alignment = taCenter
        Title.Caption = ' «—ÌŒ'
        Width = 92
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'Bedeh'
        Title.Alignment = taCenter
        Title.Caption = '«”‰«œ œ—Ì«› ‰Ì'
        Width = 126
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'Bestan'
        Title.Alignment = taCenter
        Title.Caption = '«”‰«œ Å—œ«Œ ‰Ì'
        Width = 135
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'Baghi'
        Title.Alignment = taCenter
        Title.Caption = '„«‰œÂ'
        Width = 136
        Visible = True
      end>
  end
  object Dat1: TMaskEdit
    Left = 371
    Top = 6
    Width = 86
    Height = 21
    Hint = ' «—ÌŒ ”——”Ìœ çﬂ'
    Anchors = [akTop, akRight]
    BiDiMode = bdRightToLeft
    Constraints.MaxHeight = 21
    EditMask = '1300/00/00;1;_'
    MaxLength = 10
    ParentBiDiMode = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    Text = '13  /  /  '
    OnEnter = Dat1Enter
    OnExit = Dat1Exit
    OnKeyPress = NextTab
  end
  object Dat2: TMaskEdit
    Left = 230
    Top = 4
    Width = 84
    Height = 21
    Anchors = [akTop, akRight]
    BiDiMode = bdRightToLeft
    Constraints.MaxHeight = 21
    EditMask = '1300/00/00;1;_'
    MaxLength = 10
    ParentBiDiMode = False
    TabOrder = 1
    Text = '13  /  /  '
    OnEnter = Dat2Enter
    OnExit = Dat2Exit
    OnKeyPress = NextTab
  end
  object Bshow: TButton
    Left = 14
    Top = 210
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '‰„«Ì‘'
    TabOrder = 3
    OnClick = BshowClick
  end
  object Bexit: TButton
    Left = 455
    Top = 211
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Œ—ÊÃ'
    TabOrder = 4
    OnClick = BexitClick
  end
  object RQu: TQuery
    DatabaseName = 'ParFro'
    SQL.Strings = (
      'SELECT SUM(PBILL)'
      'FROM RCHEQ'
      'WHERE')
    Left = 91
    Top = 1
  end
  object PQu: TQuery
    SQL.Strings = (
      'SELECT SUM(PBILL)'
      'FROM PCHEQ'
      'WHRE ')
    Left = 139
  end
end
