object DataCheck: TDataCheck
  Left = 406
  Top = 190
  AutoSize = True
  BiDiMode = bdRightToLeft
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = 'ﬂ‰ —· ’Õ  «ÿ·«⁄« '
  ClientHeight = 81
  ClientWidth = 293
  Color = clBtnFace
  Font.Charset = ARABIC_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poMainFormCenter
  Visible = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 293
    Height = 81
  end
  object Label1: TLabel
    Left = 29
    Top = 13
    Width = 237
    Height = 28
    Alignment = taCenter
    AutoSize = False
    Caption = '”Ì” „ œ— Õ«· ﬂ‰ —· «ÿ·« ⁄«  „Ì »«‘œ '
    Layout = tlCenter
  end
  object Button1: TButton
    Left = 108
    Top = 52
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Button1'
    TabOrder = 0
    Visible = False
    OnClick = Button1Click
  end
end
