object FCrate: TFCrate
  Left = 374
  Top = 161
  AutoSize = True
  BiDiMode = bdRightToLeft
  BorderStyle = bsSingle
  Caption = '‰—Œ »—«»—Ì «—“'
  ClientHeight = 398
  ClientWidth = 298
  Color = clBtnFace
  Font.Charset = ARABIC_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 298
    Height = 27
    Align = alTop
  end
  object dbg: TDBGrid
    Left = 0
    Top = 27
    Width = 298
    Height = 370
    DataSource = FroDM.CrateDs
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = ARABIC_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Dat'
        Title.Caption = ' «—ÌŒ'
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CName'
        Title.Caption = '‰«„ «—“'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Fee'
        Title.Caption = '‰—Œ'
        Width = 93
        Visible = True
      end>
  end
  object PG: TPageControl
    Left = 0
    Top = 271
    Width = 298
    Height = 127
    ActivePage = TabSheet1
    Align = alBottom
    BiDiMode = bdLeftToRight
    MultiLine = True
    ParentBiDiMode = False
    TabOrder = 1
    Visible = False
    object TabSheet1: TTabSheet
      Tag = 1
      Caption = 'À» '
      object Label2: TLabel
        Left = 245
        Top = 4
        Width = 40
        Height = 20
        Alignment = taRightJustify
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = ' «—ÌŒ'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        Layout = tlCenter
      end
      object Label11: TLabel
        Left = 105
        Top = 5
        Width = 44
        Height = 19
        Alignment = taRightJustify
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = ' «—“'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        Transparent = True
        Layout = tlCenter
      end
      object Label1: TLabel
        Left = 106
        Top = 30
        Width = 44
        Height = 19
        Alignment = taRightJustify
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = '‰—Œ'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Mitra'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        Transparent = True
        Layout = tlCenter
      end
      object Dat1: TMaskEdit
        Left = 155
        Top = 4
        Width = 84
        Height = 20
        AutoSize = False
        BiDiMode = bdRightToLeft
        Constraints.MaxHeight = 21
        EditMask = '1300/00/00;1;_'
        MaxLength = 10
        ParentBiDiMode = False
        TabOrder = 0
        Text = '13  /  /  '
        OnEnter = Dat1Enter
        OnExit = Dat1Exit
        OnKeyPress = NextTab
      end
      object FCname: TDBComboBox
        Left = 10
        Top = 4
        Width = 90
        Height = 21
        BiDiMode = bdRightToLeft
        DataField = 'CName'
        DataSource = FroDM.CrateDs
        ItemHeight = 13
        ParentBiDiMode = False
        TabOrder = 1
        OnKeyPress = NextTab
      end
      object FPnet: TDBEdit
        Left = 10
        Top = 31
        Width = 90
        Height = 19
        AutoSize = False
        BiDiMode = bdRightToLeftNoAlign
        DataField = 'Fee'
        DataSource = FroDM.CrateDs
        ParentBiDiMode = False
        TabOrder = 2
        OnKeyPress = NextTab
      end
      object Bexit: TBitBtn
        Left = 215
        Top = 66
        Width = 75
        Height = 25
        Caption = 'Œ—ÊÃ'
        ModalResult = 1
        TabOrder = 3
        OnClick = BexitClick
        NumGlyphs = 2
      end
      object Bnew: TBitBtn
        Left = 75
        Top = 66
        Width = 75
        Height = 25
        Caption = 'À»  »⁄œÌ'
        ModalResult = 1
        TabOrder = 4
        OnClick = BnewClick
        NumGlyphs = 2
      end
      object Bsave: TBitBtn
        Left = 0
        Top = 66
        Width = 75
        Height = 25
        Caption = 'À» '
        ModalResult = 1
        TabOrder = 5
        OnClick = BsaveClick
        NumGlyphs = 2
      end
      object Bdel: TBitBtn
        Left = 150
        Top = 66
        Width = 65
        Height = 25
        Caption = 'Õ–›'
        TabOrder = 6
        OnClick = BdelClick
      end
    end
  end
  object BitBtn1: TBitBtn
    Left = 241
    Top = 1
    Width = 55
    Height = 25
    Caption = 'ÃœÌœ'
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object BitBtn4: TBitBtn
    Left = 166
    Top = 1
    Width = 75
    Height = 25
    Caption = ' ’ÕÌÕ'
    TabOrder = 3
    OnClick = BitBtn4Click
  end
end
