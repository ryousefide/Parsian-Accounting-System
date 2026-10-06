object Fbank: TFbank
  Left = 232
  Top = 124
  ActiveControl = bank
  AutoSize = True
  BiDiMode = bdLeftToRight
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = '»«‰ﬂ Â«'
  ClientHeight = 64
  ClientWidth = 252
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
    Width = 252
    Height = 33
  end
  object Label1: TLabel
    Left = 188
    Top = 7
    Width = 51
    Height = 19
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '‰«„ »«‰ﬂ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object Bevel2: TBevel
    Left = 0
    Top = 37
    Width = 252
    Height = 27
  end
  object bank: TEdit
    Left = 6
    Top = 5
    Width = 171
    Height = 21
    AutoSize = False
    BiDiMode = bdRightToLeft
    Constraints.MaxHeight = 21
    ParentBiDiMode = False
    TabOrder = 0
    OnKeyPress = bankKeyPress
  end
  object Bnext: TButton
    Left = 51
    Top = 38
    Width = 50
    Height = 25
    BiDiMode = bdRightToLeft
    Caption = '»⁄œÌ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 2
    OnClick = BnextClick
  end
  object Bprev: TButton
    Left = 1
    Top = 38
    Width = 50
    Height = 25
    BiDiMode = bdRightToLeft
    Caption = 'ﬁ»·Ì'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 1
    OnClick = BprevClick
  end
  object Bsave: TButton
    Left = 101
    Top = 38
    Width = 50
    Height = 25
    BiDiMode = bdRightToLeft
    Caption = 'À» '
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 3
    OnClick = BsaveClick
  end
  object Bexit: TButton
    Left = 201
    Top = 38
    Width = 50
    Height = 25
    BiDiMode = bdRightToLeft
    Cancel = True
    Caption = 'Œ—ÊÃ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clActiveCaption
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 4
    OnClick = BexitClick
  end
  object Bdel: TButton
    Left = 151
    Top = 38
    Width = 50
    Height = 25
    BiDiMode = bdRightToLeft
    Caption = 'Õ–›'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 5
    OnClick = BdelClick
  end
end
