object FNewYear: TFNewYear
  Left = 621
  Top = 116
  AutoSize = True
  BiDiMode = bdRightToLeft
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  BorderWidth = 5
  Caption = ' ”«· „«·Ì ÃœÌœ'
  ClientHeight = 460
  ClientWidth = 628
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
  object Shape1: TShape
    Left = 0
    Top = 0
    Width = 410
    Height = 79
    Brush.Style = bsClear
    Pen.Mode = pmMask
    Pen.Style = psDashDot
    Pen.Width = 2
    Shape = stRoundRect
  end
  object Bevel3: TBevel
    Left = 2
    Top = 411
    Width = 398
    Height = 28
  end
  object Label1: TLabel
    Left = 322
    Top = 12
    Width = 67
    Height = 18
    Hint = '‰«„Ì ﬂÂ »Â Å«Ìê«Â œ«œÂ ”«· „«·Ì ÃœÌœ œ«œÂ „Ì‘Êœ'
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '‰«„ ”«· „«·Ì'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    Layout = tlCenter
  end
  object Label2: TLabel
    Left = 310
    Top = 38
    Width = 82
    Height = 18
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '‰«„ »«‰ò «ÿ·«⁄« Ì'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    Layout = tlCenter
  end
  object Label3: TLabel
    Left = 559
    Top = 14
    Width = 41
    Height = 18
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '«“  «—ÌŒ'
    Enabled = False
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    Visible = False
  end
  object Label4: TLabel
    Left = 428
    Top = 14
    Width = 41
    Height = 18
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '»Â »⁄œ'
    Enabled = False
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    Visible = False
  end
  object Label5: TLabel
    Left = 560
    Top = 38
    Width = 41
    Height = 18
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '«“  «—ÌŒ'
    Enabled = False
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    Visible = False
  end
  object Label6: TLabel
    Left = 429
    Top = 38
    Width = 41
    Height = 18
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '»Â »⁄œ'
    Enabled = False
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    Visible = False
  end
  object Shape2: TShape
    Left = 0
    Top = 81
    Width = 410
    Height = 322
    Brush.Style = bsClear
    Pen.Mode = pmMask
    Pen.Style = psDash
    Shape = stRoundRect
  end
  object SpeedButton1: TSpeedButton
    Left = 13
    Top = 35
    Width = 23
    Height = 22
    Caption = '...'
    Enabled = False
    Visible = False
    OnClick = SpeedButton1Click
  end
  object Label7: TLabel
    Left = 16
    Top = 94
    Width = 179
    Height = 18
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '·Ì”  Õ”«» Â«ÌÌ òÂ „‰ ﬁ· „Ì ‘Ê‰œ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    Layout = tlCenter
  end
  object cbD: TCheckBox
    Left = 214
    Top = 198
    Width = 181
    Height = 17
    Caption = '„ÊÃÊœÌ «‰»«— „‰ ﬁ· ê—œœ'
    Checked = True
    State = cbChecked
    TabOrder = 7
    OnKeyPress = NextTab
  end
  object cbP: TCheckBox
    Left = 214
    Top = 177
    Width = 181
    Height = 17
    Caption = '«”‰«œ Å—œ«Œ ‰Ì „‰ ﬁ· ê—œœ'
    Checked = True
    State = cbChecked
    TabOrder = 6
    OnKeyPress = NextTab
  end
  object cbJari: TCheckBox
    Left = 214
    Top = 137
    Width = 181
    Height = 17
    Caption = 'Õ”«» Â«Ì »«‰ﬂÌ „‰ ﬁ· ê—œœ'
    Checked = True
    State = cbChecked
    TabOrder = 3
    OnKeyPress = NextTab
  end
  object cbR: TCheckBox
    Left = 214
    Top = 157
    Width = 181
    Height = 17
    Caption = '«”‰«œ œ—Ì«› Ì „‰ ﬁ· ê—œœ'
    Checked = True
    State = cbChecked
    TabOrder = 4
    OnKeyPress = NextTab
  end
  object cbAc: TCheckBox
    Left = 214
    Top = 117
    Width = 181
    Height = 17
    Caption = '„«‰œÂ Õ”«» Â« „‰ ﬁ· ê—œœ'
    Checked = True
    State = cbChecked
    TabOrder = 2
    OnClick = cbAcClick
    OnKeyPress = NextTab
  end
  object FNam: TEdit
    Left = 103
    Top = 10
    Width = 182
    Height = 21
    Hint = '‰«„Ì ﬂÂ »Â Å«Ìê«Â œ«œÂ ”«· „«·Ì ÃœÌœ œ«œÂ „Ì‘Êœ'
    AutoSize = False
    BiDiMode = bdLeftToRight
    ParentBiDiMode = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnExit = FNamExit
    OnKeyPress = NextTab
  end
  object FPath: TEdit
    Left = 103
    Top = 35
    Width = 183
    Height = 21
    Hint = '„”Ì— ‰êÂœ«—Ì «ÿ·«⁄«  œÊ—Â ÃœÌœ'
    AutoSize = False
    BiDiMode = bdLeftToRight
    ParentBiDiMode = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnKeyPress = NextTab
  end
  object Bexit: TButton
    Left = 287
    Top = 413
    Width = 111
    Height = 25
    BiDiMode = bdRightToLeft
    Cancel = True
    Caption = 'Œ—ÊÃ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 11
    OnClick = BexitClick
  end
  object BMake: TButton
    Left = 3
    Top = 413
    Width = 284
    Height = 25
    BiDiMode = bdRightToLeft
    Caption = '«ÌÃ«œ ”«· „«·Ì ÃœÌœ Ê »” ‰ Õ”«» Â«'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 10
    OnClick = BMakeClick
  end
  object RDat: TMaskEdit
    Left = 477
    Top = 13
    Width = 75
    Height = 21
    AutoSize = False
    BiDiMode = bdRightToLeft
    Constraints.MaxHeight = 26
    Enabled = False
    EditMask = '1300/00/00;1;_'
    MaxLength = 10
    ParentBiDiMode = False
    TabOrder = 5
    Text = '13  /  /  '
    Visible = False
    OnEnter = RDatEnter
    OnExit = RDatExit
    OnKeyPress = NextTab
  end
  object PDat: TMaskEdit
    Left = 477
    Top = 36
    Width = 75
    Height = 21
    AutoSize = False
    BiDiMode = bdRightToLeft
    Constraints.MaxHeight = 26
    Enabled = False
    EditMask = '1300/00/00;1;_'
    MaxLength = 10
    ParentBiDiMode = False
    TabOrder = 9
    Text = '13  /  /  '
    Visible = False
    OnEnter = PDatEnter
    OnExit = PDatExit
    OnKeyPress = NextTab
  end
  object StatusBar1: TStatusBar
    Left = 3
    Top = 440
    Width = 396
    Height = 20
    AutoHint = True
    Align = alNone
    Panels = <>
    ParentFont = True
    SimplePanel = True
    UseSystemFont = False
  end
  object List: TXPCheckListBox
    Left = 447
    Top = 100
    Width = 181
    Height = 223
    ItemHeight = 13
    Sorted = True
    TabOrder = 13
    Visible = False
  end
  object PageControl1: TPageControl
    Left = 15
    Top = 118
    Width = 181
    Height = 267
    ActivePage = TS1
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    MultiLine = True
    ParentFont = False
    TabOrder = 8
    TabStop = False
    object TS1: TTabSheet
      Caption = ' Õ”«»'
      object List1: TXPCheckListBox
        Left = 0
        Top = 0
        Width = 173
        Height = 239
        Align = alClient
        ItemHeight = 13
        Sorted = True
        TabOrder = 0
      end
    end
    object TS2: TTabSheet
      Caption = '»Â —Ì“  „—ò“'
      ImageIndex = 1
      object List2: TXPCheckListBox
        Left = 0
        Top = 0
        Width = 173
        Height = 239
        Align = alClient
        ItemHeight = 13
        Sorted = True
        TabOrder = 0
      end
    end
    object TS3: TTabSheet
      Caption = '„—ò“ Ê Å—ÊéÂ'
      ImageIndex = 2
      object List3: TXPCheckListBox
        Left = 0
        Top = 0
        Width = 173
        Height = 239
        Align = alClient
        ItemHeight = 13
        Sorted = True
        TabOrder = 0
      end
    end
  end
  object QTJ: TQuery
    DatabaseName = 'ParFro'
    SQL.Strings = (
      'CREATE TABLE [dbo].[Jari] ('
      #9'[Idd] [int] IDENTITY (1, 1) NOT NULL ,'
      #9'[Id] [int]  NULL ,'
      #9'[Dat] [int] NOT NULL ,'
      #9'[Serial] [varchar] (20) NULL ,'
      #9'[Bestan] [money] NULL ,'
      #9'[Bedeh] [money] NULL ,'
      #9'[Rema] [money] NULL ,'
      #9'[Des] [varchar] (140) NULL '
      ') ON [PRIMARY]'
      'ALTER TABLE [dbo].[Jari] WITH NOCHECK ADD'
      #9'CONSTRAINT [PK_Jari] PRIMARY KEY  NONCLUSTERED'
      #9'('
      #9#9'[Idd]'
      #9')  ON [PRIMARY]'
      ' ')
    Left = 30
    Top = 6
  end
end
