object FAccList: TFAccList
  Left = 206
  Top = 175
  BiDiMode = bdLeftToRight
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  BorderWidth = 2
  Caption = '                              ·Ì”  Õ”«»'
  ClientHeight = 192
  ClientWidth = 255
  Color = clBtnFace
  DragKind = dkDock
  Font.Charset = ARABIC_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poMainFormCenter
  ShowHint = True
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 255
    Height = 170
  end
  object AcBox: TListBox
    Left = 7
    Top = 8
    Width = 241
    Height = 133
    BiDiMode = bdRightToLeft
    DragKind = dkDock
    ItemHeight = 13
    ParentBiDiMode = False
    ParentColor = True
    Sorted = True
    TabOrder = 0
    OnClick = AcBoxClick
  end
  object Bok: TButton
    Left = 90
    Top = 145
    Width = 75
    Height = 22
    BiDiMode = bdRightToLeft
    Cancel = True
    Caption = 'Œ—ÊÃ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindow
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 1
    OnClick = BokClick
  end
  object Sb1: TStatusBar
    Left = 0
    Top = 173
    Width = 255
    Height = 19
    BiDiMode = bdRightToLeft
    Panels = <
      item
        Text = '„”Ì—'
        Width = 500
      end>
    ParentBiDiMode = False
    ParentColor = True
    ParentFont = True
    SimplePanel = False
    SimpleText = #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9
    UseSystemFont = False
  end
end
