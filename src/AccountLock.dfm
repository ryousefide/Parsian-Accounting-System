object FAcLock: TFAcLock
  Left = 281
  Top = 104
  AutoSize = True
  BiDiMode = bdRightToLeft
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = '»·ÊﬂÂ ﬂ—œ‰ Õ”«» Â«Ì ⁄„·Ì« Ì'
  ClientHeight = 400
  ClientWidth = 537
  Color = clBtnFace
  Font.Charset = ARABIC_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object FAcList: TXPListBox
    Left = 0
    Top = 41
    Width = 247
    Height = 340
    BiDiMode = bdRightToLeft
    ExtendedSelect = False
    ItemHeight = 13
    ParentBiDiMode = False
    Sorted = True
    TabOrder = 0
    OnClick = FAcListClick
    OnDblClick = Sp1Click
  end
  object Sb1: TStatusBar
    Left = 0
    Top = 381
    Width = 537
    Height = 19
    Align = alNone
    BiDiMode = bdRightToLeft
    Constraints.MaxHeight = 19
    Panels = <
      item
        Text = '„”Ì—'
        Width = 500
      end>
    ParentBiDiMode = False
    ParentColor = True
    ParentFont = True
    SimplePanel = False
    SimpleText = 
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9 +
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9 +
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9
    SizeGrip = False
    UseSystemFont = False
  end
  object Panel1: TPanel
    Tag = 1
    Left = 0
    Top = 0
    Width = 537
    Height = 41
    Align = alTop
    ParentColor = True
    TabOrder = 2
    object Label1: TLabel
      Left = 1
      Top = 1
      Width = 237
      Height = 39
      Align = alLeft
      Alignment = taCenter
      AutoSize = False
      Caption = '·Ì”  Õ”«» Â«Ì ¬“«œ'
      Layout = tlCenter
    end
    object Label2: TLabel
      Left = 294
      Top = 1
      Width = 242
      Height = 39
      Align = alRight
      Alignment = taCenter
      AutoSize = False
      Caption = '·Ì”  Õ”«» Â«Ì »·ÊﬂÂ'
      Layout = tlCenter
    end
  end
  object Panel2: TPanel
    Tag = 1
    Left = 248
    Top = 41
    Width = 289
    Height = 340
    ParentColor = True
    TabOrder = 3
    object Sp1: TSpeedButton
      Left = 14
      Top = 22
      Width = 23
      Height = 22
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333333333333333FFF333333333333000333333333
        3333777FFF3FFFFF33330B000300000333337F777F777773F333000E00BFBFB0
        3333777F773333F7F333000E0BFBF0003333777F7F3337773F33000E0FBFBFBF
        0333777F7F3333FF7FFF000E0BFBF0000003777F7F3337777773000E0FBFBFBF
        BFB0777F7F33FFFFFFF7000E0BF000000003777F7FF777777773000000BFB033
        33337777773FF733333333333300033333333333337773333333333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
      OnClick = Sp1Click
    end
    object Sp2: TSpeedButton
      Left = 12
      Top = 287
      Width = 23
      Height = 22
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333333333333333333333333333333333333333333333333FF333333333333
        3000333333FFFFF3F77733333000003000B033333777773777F733330BFBFB00
        E00033337FFF3377F7773333000FBFB0E000333377733337F7773330FBFBFBF0
        E00033F7FFFF3337F7773000000FBFB0E000377777733337F7770BFBFBFBFBF0
        E00073FFFFFFFF37F777300000000FB0E000377777777337F7773333330BFB00
        000033333373FF77777733333330003333333333333777333333333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
      OnClick = Sp2Click
    end
  end
  object locked: TXPListBox
    Left = 290
    Top = 41
    Width = 247
    Height = 340
    BiDiMode = bdRightToLeft
    ItemHeight = 13
    ParentBiDiMode = False
    Sorted = True
    TabOrder = 4
    OnClick = lockedClick
    OnDblClick = Sp2Click
  end
end
