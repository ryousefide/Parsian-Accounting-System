object FTjari: TFTjari
  Left = 278
  Top = 193
  AutoSize = True
  BiDiMode = bdLeftToRight
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  BorderWidth = 3
  Caption = ' ‘ﬂÌ· Ã«—Ì'
  ClientHeight = 156
  ClientWidth = 282
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
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel2: TBevel
    Left = 0
    Top = 0
    Width = 282
    Height = 121
  end
  object Label1: TLabel
    Left = 201
    Top = 9
    Width = 59
    Height = 18
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '‰«„ Ã«—Ì'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object Label2: TLabel
    Left = 201
    Top = 95
    Width = 59
    Height = 18
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '‰«„ »«‰ﬂ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object Label3: TLabel
    Left = 201
    Top = 66
    Width = 59
    Height = 18
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = 'œ«—‰œÂ Ã«—Ì'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 0
    Top = 129
    Width = 282
    Height = 27
  end
  object Label5: TLabel
    Left = 201
    Top = 38
    Width = 59
    Height = 18
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = '‰Ê⁄ «—“'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Mitra'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
  end
  object Fjarinam: TEdit
    Left = 13
    Top = 6
    Width = 174
    Height = 21
    AutoSize = False
    BiDiMode = bdRightToLeft
    MaxLength = 20
    ParentBiDiMode = False
    TabOrder = 0
    OnKeyPress = FormKeyPress
  end
  object Bexit1: TButton
    Left = 188
    Top = 130
    Width = 94
    Height = 25
    BiDiMode = bdRightToLeft
    Cancel = True
    Caption = 'Œ—ÊÃ'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 5
    OnClick = Bexit1Click
  end
  object Bmake: TButton
    Left = 1
    Top = 130
    Width = 104
    Height = 25
    BiDiMode = bdRightToLeft
    Caption = '& ‘ﬂÌ· Ã«—Ì'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Mitra'
    Font.Style = [fsBold, fsItalic]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 4
    OnClick = BmakeClick
  end
  object FDjari: TEdit
    Left = 13
    Top = 64
    Width = 174
    Height = 21
    AutoSize = False
    BiDiMode = bdRightToLeft
    ParentBiDiMode = False
    TabOrder = 2
    OnKeyPress = FormKeyPress
  end
  object FBkod: TComboBox
    Left = 104
    Top = 35
    Width = 83
    Height = 21
    BiDiMode = bdRightToLeft
    ItemHeight = 13
    ParentBiDiMode = False
    TabOrder = 1
    OnKeyPress = FormKeyPress
  end
  object FBank: TComboBox
    Left = 13
    Top = 93
    Width = 174
    Height = 21
    Style = csDropDownList
    BiDiMode = bdRightToLeft
    ItemHeight = 13
    ParentBiDiMode = False
    TabOrder = 3
    OnKeyPress = FormKeyPress
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
    Left = 22
    Top = 34
  end
end
