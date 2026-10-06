object FDConvert: TFDConvert
  Left = 386
  Top = 161
  AutoSize = True
  BiDiMode = bdRightToLeft
  BorderStyle = bsSingle
  Caption = '„»œ·  «—ÌŒÌ'
  ClientHeight = 83
  ClientWidth = 262
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 262
    Height = 83
  end
  object Label1: TLabel
    Left = 172
    Top = 8
    Width = 80
    Height = 25
    AutoSize = False
    Caption = ' «—ÌŒ  ‘„”Ì'
    Layout = tlCenter
  end
  object Label2: TLabel
    Left = 10
    Top = 8
    Width = 86
    Height = 25
    AutoSize = False
    Caption = ' «—ÌŒ „Ì·«œÌ'
    Layout = tlCenter
  end
  object SDat: TMaskEdit
    Left = 172
    Top = 40
    Width = 78
    Height = 21
    AutoSize = False
    BiDiMode = bdRightToLeft
    Constraints.MaxHeight = 26
    MaxLength = 8
    ParentBiDiMode = False
    TabOrder = 0
    OnKeyPress = SDatKeyPress
  end
  object Mdat: TMaskEdit
    Left = 8
    Top = 40
    Width = 89
    Height = 21
    MaxLength = 8
    TabOrder = 1
    OnKeyPress = MdatKeyPress
  end
end
