object FBFind: TFBFind
  Left = 284
  Top = 159
  AutoSize = True
  BiDiMode = bdRightToLeft
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'ÅÌêÌ—Ì «”‰«œ Õ”«»œ«—Ì'
  ClientHeight = 180
  ClientWidth = 378
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
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 378
    Height = 152
  end
  object Label4: TLabel
    Left = 312
    Top = 35
    Width = 50
    Height = 21
    Alignment = taCenter
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '«“  «—ÌŒ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object Label1: TLabel
    Left = 132
    Top = 35
    Width = 51
    Height = 21
    Alignment = taCenter
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = ' «  «—ÌŒ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object Label2: TLabel
    Left = 312
    Top = 6
    Width = 51
    Height = 21
    Alignment = taCenter
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '«“ ‘„«—Â'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object Label3: TLabel
    Left = 131
    Top = 6
    Width = 53
    Height = 21
    Alignment = taCenter
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = ' « ‘„«—Â'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object Label5: TLabel
    Left = 311
    Top = 94
    Width = 57
    Height = 21
    Alignment = taCenter
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '‘—Õ ”‰œ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object Bevel3: TBevel
    Left = 0
    Top = 153
    Width = 378
    Height = 27
  end
  object Label6: TLabel
    Left = 316
    Top = 67
    Width = 46
    Height = 21
    Alignment = taCenter
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '«“ „»·€'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object Label7: TLabel
    Left = 134
    Top = 66
    Width = 46
    Height = 21
    Alignment = taCenter
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = ' « „»·€'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object SDat: TMaskEdit
    Left = 221
    Top = 34
    Width = 81
    Height = 23
    AutoSize = False
    BiDiMode = bdRightToLeft
    EditMask = '1300/00/00;1;_'
    MaxLength = 10
    ParentBiDiMode = False
    TabOrder = 2
    Text = '13  /  /  '
    OnEnter = SDatEnter
    OnExit = SDatExit
    OnKeyPress = FormKeyPress
  end
  object EDat: TMaskEdit
    Left = 41
    Top = 34
    Width = 81
    Height = 23
    AutoSize = False
    BiDiMode = bdRightToLeft
    EditMask = '1300/00/00;1;_'
    MaxLength = 10
    ParentBiDiMode = False
    TabOrder = 3
    Text = '13  /  /  '
    OnEnter = EDatEnter
    OnExit = EDatExit
    OnKeyPress = FormKeyPress
  end
  object SNo: TEdit
    Left = 224
    Top = 6
    Width = 79
    Height = 21
    AutoSize = False
    BiDiMode = bdRightToLeft
    ParentBiDiMode = False
    TabOrder = 0
    OnKeyPress = SNoKeyPress
  end
  object ENo: TEdit
    Left = 44
    Top = 6
    Width = 79
    Height = 21
    AutoSize = False
    BiDiMode = bdRightToLeft
    ParentBiDiMode = False
    TabOrder = 1
    OnKeyPress = SNoKeyPress
  end
  object BDo: TButton
    Left = 1
    Top = 154
    Width = 203
    Height = 25
    Caption = '&‰„«Ì‘'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 8
    OnClick = BDoClick
  end
  object BExit: TButton
    Left = 204
    Top = 154
    Width = 173
    Height = 25
    Cancel = True
    Caption = 'Œ—ÊÃ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 9
    OnClick = BExitClick
  end
  object Fdesc: TEdit
    Left = 5
    Top = 94
    Width = 299
    Height = 21
    AutoSize = False
    Constraints.MaxHeight = 26
    TabOrder = 6
    OnKeyPress = FormKeyPress
  end
  object Scurr: TEdit
    Left = 184
    Top = 66
    Width = 120
    Height = 21
    AutoSize = False
    BiDiMode = bdRightToLeft
    ParentBiDiMode = False
    TabOrder = 4
    OnKeyDown = ScurrKeyDown
    OnKeyPress = SNoKeyPress
  end
  object Ecurr: TEdit
    Left = 4
    Top = 65
    Width = 120
    Height = 21
    AutoSize = False
    BiDiMode = bdRightToLeft
    ParentBiDiMode = False
    TabOrder = 5
    OnKeyDown = EcurrKeyDown
    OnKeyPress = SNoKeyPress
  end
  object rgPerm: TRadioGroup
    Left = 0
    Top = 116
    Width = 377
    Height = 35
    Columns = 4
    ItemIndex = 2
    Items.Strings = (
      'œ«∆„Ì'
      '„Êﬁ '
      '‰« —«“'
      'ﬂ·ÌÂ')
    TabOrder = 7
  end
end
