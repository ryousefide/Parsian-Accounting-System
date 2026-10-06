object FGSearch: TFGSearch
  Tag = 1
  Left = 209
  Top = 129
  Width = 239
  Height = 357
  BiDiMode = bdRightToLeft
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Ã” ÃÊÌ Õ—Ê›Ì ﬂ«·«'
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
    Width = 231
    Height = 51
    Align = alTop
  end
  object Label1: TLabel
    Left = 134
    Top = 4
    Width = 94
    Height = 18
    Anchors = [akTop, akRight]
    AutoSize = False
    Caption = 'ﬁ”„ Ì «“ ‰«„ ﬂ«·«'
  end
  object FNam: TEdit
    Left = 4
    Top = 25
    Width = 222
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    TabOrder = 0
    OnKeyDown = FNamKeyDown
  end
  object lbGName: TXPListBox
    Left = 0
    Top = 51
    Width = 231
    Height = 279
    TabStop = False
    Align = alClient
    DragCursor = crHandPoint
    DragMode = dmAutomatic
    ItemHeight = 13
    ParentShowHint = False
    ShowHint = True
    Sorted = True
    TabOrder = 1
    OnKeyDown = lbGNameKeyDown
  end
  object rbMoj: TCheckBox
    Left = 10
    Top = 6
    Width = 113
    Height = 17
    Caption = 'ﬂ«·«Â«Ì „ÊÃÊœÌ œ«—'
    TabOrder = 2
    OnClick = rbMojClick
  end
end
