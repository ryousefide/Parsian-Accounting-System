object FAcSearch: TFAcSearch
  Left = 307
  Top = 157
  BiDiMode = bdRightToLeft
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsNone
  Caption = 'Ã” ÃÊÌ Õ—Ê›Ì Õ”«» Â«'
  ClientHeight = 465
  ClientWidth = 345
  Color = clBtnFace
  Font.Charset = ARABIC_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 345
    Height = 59
    Align = alTop
  end
  object Label1: TLabel
    Left = 214
    Top = 3
    Width = 123
    Height = 18
    Anchors = [akTop, akRight]
    AutoSize = False
    Caption = 'ﬁ”„ Ì «“ ‰«„ Õ”«»'
  end
  object Label2: TLabel
    Left = 0
    Top = 438
    Width = 345
    Height = 27
    Align = alBottom
    Alignment = taRightJustify
    AutoSize = False
    BiDiMode = bdRightToLeft
    ParentBiDiMode = False
  end
  object FNam: TEdit
    Left = 116
    Top = 26
    Width = 222
    Height = 21
    Anchors = [akTop, akRight]
    AutoSize = False
    TabOrder = 0
    OnKeyDown = FNamKeyDown
  end
  object lbName: TXPListBox
    Left = 0
    Top = 59
    Width = 345
    Height = 379
    TabStop = False
    Align = alClient
    DragCursor = crHandPoint
    DragMode = dmAutomatic
    ItemHeight = 13
    ParentShowHint = False
    ShowHint = True
    Sorted = True
    TabOrder = 1
    OnClick = lbNameClick
    OnKeyDown = lbNameKeyDown
    OnKeyUp = lbNameKeyUp
  end
end
