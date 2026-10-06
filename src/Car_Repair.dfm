object FCarRepair: TFCarRepair
  Left = 458
  Top = 205
  AutoSize = True
  BiDiMode = bdRightToLeft
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  BorderWidth = 5
  Caption = '»«“”«“Ì ﬂ«—œﬂ”'
  ClientHeight = 114
  ClientWidth = 345
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poDefault
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 345
    Height = 114
  end
  object Label1: TLabel
    Left = 9
    Top = 7
    Width = 326
    Height = 26
    AutoSize = False
    BiDiMode = bdRightToLeft
    ParentBiDiMode = False
  end
  object Pb: TProgressBar
    Left = 8
    Top = 37
    Width = 329
    Height = 16
    Min = 0
    Max = 10
    TabOrder = 0
  end
  object Brepair: TButton
    Left = 16
    Top = 82
    Width = 281
    Height = 25
    Caption = '»«“”«“Ì ﬂ«—œﬂ”'
    TabOrder = 1
    OnClick = BrepairClick
  end
  object Del: TQuery
    DatabaseName = 'ParFro'
    SQL.Strings = (
      'Delete From GCardex')
    Left = 232
    Top = 54
  end
  object sel: TQuery
    DatabaseName = 'ParFro'
    SQL.Strings = (
      
        'Select J.Dat,Kod,I.Nam,Color,Quant,AnbNam,Radif,I.No,Pfee,Perc,J' +
        '.Nam,I.Reject'
      'From BinvoGood I,BVoice  J'
      'Where  J.No=I.No'
      ' '
      ' '
      ' '
      ' ')
    UpdateMode = upWhereChanged
    Left = 176
    Top = 53
  end
  object QTol: TQuery
    DatabaseName = 'ParFro'
    SQL.Strings = (
      'Select Dat,Kod,Nam,Color,Quant,AnbNam,AnbKod,I.No,Pfee,Perc'
      'From BinvoGood I'
      'Where  I.No <0'
      ' ')
    UpdateMode = upWhereChanged
    Left = 148
    Top = 53
  end
  object Hav: TQuery
    DatabaseName = 'ParFro'
    SQL.Strings = (
      
        'Select J.Dat,I.Kod,I.Nam,I.Color,I.Quant,I.AnbNam,I.Radif,I.No,I' +
        '.Pfee,J.Nam,I.Reject'
      'From DHavG I,DHav  J'
      'Where  J.No=I.No'
      ' '
      ' '
      ' '
      ' ')
    UpdateMode = upWhereChanged
    Left = 85
    Top = 53
  end
end
