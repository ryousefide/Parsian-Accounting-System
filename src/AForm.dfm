object FAForm: TFAForm
  Left = 476
  Top = 216
  AutoSize = True
  BiDiMode = bdRightToLeft
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  BorderWidth = 2
  Caption = '·Ì”  „—«ﬂ“Â“Ì‰Â'
  ClientHeight = 286
  ClientWidth = 184
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poDefault
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object cbGRP: TComboBox
    Left = 0
    Top = 0
    Width = 184
    Height = 21
    TabStop = False
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 1
    OnChange = cbGRPChange
  end
  object CList: TXPCheckListBox
    Left = 0
    Top = 23
    Width = 184
    Height = 211
    ItemHeight = 13
    Sorted = True
    TabOrder = 0
  end
  object Button1: TBitBtn
    Left = 0
    Top = 261
    Width = 92
    Height = 25
    Caption = ' «∆Ìœ'
    TabOrder = 2
    Kind = bkOK
  end
  object Button2: TBitBtn
    Left = 92
    Top = 261
    Width = 92
    Height = 25
    Caption = '«‰’—«›'
    TabOrder = 3
    Kind = bkCancel
  end
  object BitBtn1: TBitBtn
    Left = 0
    Top = 236
    Width = 184
    Height = 25
    Caption = ' Ìò ‰‘œÂ Â«'
    TabOrder = 4
    Kind = bkAll
  end
end
