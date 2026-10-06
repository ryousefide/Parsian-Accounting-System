object FChCor: TFChCor
  Left = 192
  Top = 107
  AutoSize = True
  BiDiMode = bdRightToLeft
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = ' ’ÕÌÕ çﬂ Â«Ì «Ê· œÊ—Â'
  ClientHeight = 155
  ClientWidth = 419
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
  object Label1: TLabel
    Left = 149
    Top = 14
    Width = 60
    Height = 13
    AutoSize = False
    Caption = '»« ”—Ì«·'
  end
  object Label2: TLabel
    Left = 149
    Top = 50
    Width = 60
    Height = 16
    AutoSize = False
    Caption = '”—Ì«· ÃœÌœ :'
  end
  object Label3: TLabel
    Left = 149
    Top = 75
    Width = 60
    Height = 16
    AutoSize = False
    Caption = '„»·€ ÃœÌœ :'
  end
  object Label4: TLabel
    Left = 149
    Top = 99
    Width = 60
    Height = 16
    AutoSize = False
    Caption = ' «—ÌŒ ÃœÌœ :'
  end
  object FBNo: TDBText
    Left = 227
    Top = 50
    Width = 135
    Height = 17
    BiDiMode = bdRightToLeftNoAlign
    DataField = 'Bno'
    DataSource = FroDM.RcheqDs
    ParentBiDiMode = False
  end
  object FPBill: TDBText
    Left = 227
    Top = 75
    Width = 135
    Height = 17
    DataField = 'Pbill'
    DataSource = FroDM.RcheqDs
  end
  object FBDat: TDBText
    Left = 227
    Top = 99
    Width = 135
    Height = 17
    DataField = 'Bdat'
    DataSource = FroDM.RcheqDs
  end
  object Bevel1: TBevel
    Left = 220
    Top = 43
    Width = 199
    Height = 82
    Shape = bsFrame
  end
  object Label5: TLabel
    Left = 372
    Top = 50
    Width = 40
    Height = 16
    AutoSize = False
    Caption = '”—Ì«· çﬂ :'
  end
  object Label6: TLabel
    Left = 372
    Top = 75
    Width = 40
    Height = 16
    AutoSize = False
    Caption = '„»·€ :'
  end
  object Label7: TLabel
    Left = 372
    Top = 99
    Width = 40
    Height = 16
    AutoSize = False
    Caption = ' «—ÌŒ :'
  end
  object Bevel2: TBevel
    Left = 0
    Top = 44
    Width = 218
    Height = 81
    Shape = bsFrame
  end
  object rgDataSet: TRadioGroup
    Left = 220
    Top = 0
    Width = 199
    Height = 39
    BiDiMode = bdRightToLeft
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'çﬂ œ—Ì«› Ì'
      'çﬂ Å—œ«Œ Ì')
    ParentBiDiMode = False
    TabOrder = 0
    OnClick = rgDataSetClick
  end
  object FNo: TEdit
    Left = 5
    Top = 10
    Width = 135
    Height = 21
    MaxLength = 20
    TabOrder = 1
    OnKeyPress = FNoKeyPress
  end
  object NBNo: TEdit
    Left = 5
    Top = 48
    Width = 135
    Height = 21
    MaxLength = 20
    TabOrder = 2
    OnKeyPress = NextTab
  end
  object NPrice: TEdit
    Left = 5
    Top = 73
    Width = 135
    Height = 21
    MaxLength = 20
    TabOrder = 3
    OnExit = NPriceExit
    OnKeyDown = NPriceKeyDown
    OnKeyPress = NPriceKeyPress
  end
  object Bsave: TButton
    Left = 9
    Top = 130
    Width = 133
    Height = 25
    Caption = 'À»   €ÌÌ—« '
    TabOrder = 5
    OnClick = BsaveClick
  end
  object Bexit: TButton
    Left = 329
    Top = 130
    Width = 86
    Height = 25
    Cancel = True
    Caption = 'Œ—ÊÃ'
    TabOrder = 6
    OnClick = BexitClick
  end
  object SDat: TMaskEdit
    Left = 54
    Top = 99
    Width = 85
    Height = 21
    AutoSize = False
    BiDiMode = bdRightToLeft
    Constraints.MaxHeight = 26
    EditMask = '1300/00/00;1;_'
    MaxLength = 10
    ParentBiDiMode = False
    TabOrder = 4
    Text = '13  /  /  '
    OnEnter = SDatEnter
    OnExit = SDatExit
    OnKeyPress = NextTab
  end
end
