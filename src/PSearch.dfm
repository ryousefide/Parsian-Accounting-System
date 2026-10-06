object FPSearch: TFPSearch
  Left = 363
  Top = 183
  AutoSize = True
  BiDiMode = bdRightToLeft
  BorderStyle = bsNone
  Caption = '·Ì”  ﬁÌ„  Â«Ì ›—Ê‘ ò«·« '
  ClientHeight = 336
  ClientWidth = 590
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  ParentBiDiMode = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Dbg: TDBGrid
    Left = 0
    Top = 48
    Width = 590
    Height = 288
    Hint = 'Enter = «‰ ﬁ«· œ—’œ Ê  ⁄œ«œ »Â ›«ò Ê—'
    DataSource = DS
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    TitleFont.Charset = ARABIC_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnKeyPress = DbgKeyPress
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 589
    Height = 48
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 530
      Top = 4
      Width = 56
      Height = 19
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      AutoSize = False
      BiDiMode = bdRightToLeft
      Caption = '”«· „«·Ì'
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
    object Memo1: TMemo
      Left = -6
      Top = 0
      Width = 250
      Height = 45
      TabStop = False
      Color = clBtnFace
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Lines.Strings = (
        '·Ì”  ﬁÌ„  ò«·«Ì ›—ÊŒ Â ‘œÂ œ— ÿÌ œÊ—Â'
        'Enter = «‰ ﬁ«· œ—’œ Ê  ⁄œ«œ »Â ›«ò Ê—'
        'ESC =»” ‰ ›—„ Ê À»  œ·ŒÊ«Â œ—’œ Ê  ⁄œ«œ')
      ParentFont = False
      TabOrder = 1
    end
    object FCurrDb: TComboBox
      Left = 361
      Top = 2
      Width = 154
      Height = 21
      Style = csDropDownList
      BiDiMode = bdRightToLeft
      ItemHeight = 13
      ParentBiDiMode = False
      TabOrder = 0
      OnChange = FCurrDbChange
    end
  end
  object DQu: TQuery
    DatabaseName = 'ParFro'
    SQL.Strings = (
      'Use MELORIN90'
      ''
      
        'SELECT I.Dat, I.No,I.Nam, I.Quant, I.Pfee, I.Perc, D.Pfee AS inp' +
        'ut'
      'FROM         Invogood I INNER JOIN'
      
        '                      DHavG D ON I.[No] = D.Anbkod AND I.Kod = D' +
        '.Kod'
      'WHERE     (I.Kod = :p1) AND (I.[No] IN'
      '                          (SELECT     No'
      '                             FROM         Invoice'
      
        '                             WHERE     Nam = :p2 AND Ckod = :p3)' +
        ')'
      'order by I.Dat'
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 108
    Top = 130
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'p1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'p2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'p3'
        ParamType = ptUnknown
      end>
    object DQuNam: TStringField
      DisplayLabel = '‰«„ ò«·«'
      DisplayWidth = 35
      FieldName = 'Nam'
      FixedChar = True
      Size = 100
    end
    object DQuDat: TIntegerField
      DisplayLabel = ' «—ÌŒ'
      DisplayWidth = 17
      FieldName = 'Dat'
      DisplayFormat = '####/##/##'
    end
    object DQuNo: TIntegerField
      DisplayLabel = '›«ò Ê—'
      DisplayWidth = 9
      FieldName = 'No'
    end
    object DQuQuant: TFloatField
      DisplayLabel = '„ﬁœ«—'
      DisplayWidth = 10
      FieldName = 'Quant'
    end
    object DQuPfee: TCurrencyField
      DisplayLabel = 'ﬁÌ„ '
      DisplayWidth = 21
      FieldName = 'Pfee'
    end
    object DQuPerc: TFloatField
      DisplayLabel = 'œ—’œ'
      DisplayWidth = 9
      FieldName = 'Perc'
    end
    object DQuinput: TCurrencyField
      DisplayLabel = 'Œ—ÊÃÌ «‰»«—'
      DisplayWidth = 22
      FieldName = 'input'
    end
  end
  object DS: TDataSource
    DataSet = DQu
    Left = 136
    Top = 130
  end
end
