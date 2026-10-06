object FLinkCent: TFLinkCent
  Left = 258
  Top = 112
  Width = 650
  Height = 500
  Caption = '«— »«ÿ ê—ÊÂ „—«ò“ Ê Õ”«» Â«'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 642
    Height = 25
    Align = alTop
    Shape = bsBottomLine
  end
  object Splitter1: TSplitter
    Left = 474
    Top = 25
    Width = 3
    Height = 448
    Cursor = crHSplit
    Align = alRight
  end
  object bEdit: TSpeedButton
    Left = 1
    Top = 2
    Width = 23
    Height = 22
    OnClick = bEditClick
  end
  object bSave: TSpeedButton
    Left = 24
    Top = 2
    Width = 23
    Height = 22
    OnClick = bSaveClick
  end
  object tvAckod: TTreeView
    Left = 0
    Top = 25
    Width = 474
    Height = 448
    Hint = 'Enter=«‰ ﬁ«· »Â ·Ì”  '
    Align = alClient
    DragMode = dmAutomatic
    Indent = 19
    ParentColor = True
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 0
    TabStop = False
    OnKeyUp = tvAckodKeyDown
    Items.Data = {
      030000001D000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000
      04C8CFE5ED1F000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000
      0006D3D1E3C7EDE51F000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000
      0000000006CFC7D1C7EDED}
  end
  object lCGroup: TXPCheckListBox
    Left = 477
    Top = 25
    Width = 165
    Height = 448
    Align = alRight
    Enabled = False
    ItemHeight = 13
    TabOrder = 1
  end
  object CQu: TQuery
    SQL.Strings = (
      'Select Grop '
      'From Cperm '
      'Where Ackod=:A')
    Left = 102
    Top = 82
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'A'
        ParamType = ptUnknown
      end>
  end
end
