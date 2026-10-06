object FGChart: TFGChart
  Left = 498
  Top = 158
  BiDiMode = bdRightToLeft
  BorderStyle = bsNone
  BorderWidth = 3
  Caption = 'œ—Œ  ò«·«'
  ClientHeight = 363
  ClientWidth = 617
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
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 185
    Top = 25
    Width = 3
    Height = 319
    Cursor = crHSplit
  end
  object ToolBar1: TToolBar
    Tag = -1
    Left = 0
    Top = 0
    Width = 617
    Height = 25
    Caption = 'ToolBar1'
    Images = Main.glBut
    TabOrder = 0
    object tb1: TToolButton
      Left = 0
      Top = 2
      Hint = '”«Œ  „Ãœœ ‰„Êœ«—'
      Caption = 'tb1'
      ImageIndex = 15
      OnClick = tb1Click
    end
    object ToolButton1: TToolButton
      Left = 23
      Top = 2
      Width = 150
      Caption = 'ToolButton1'
      Enabled = False
      ImageIndex = 3
      Style = tbsSeparator
    end
  end
  object CTree: TTreeView
    Tag = 1
    Left = 0
    Top = 25
    Width = 185
    Height = 319
    Align = alLeft
    BiDiMode = bdRightToLeft
    Color = 15000804
    DragMode = dmAutomatic
    HideSelection = False
    Indent = 19
    ParentBiDiMode = False
    ParentShowHint = False
    PopupMenu = PopupMenu1
    ShowHint = True
    TabOrder = 1
    OnClick = CTreeClick
    OnDragDrop = CTreeDragDrop
    OnDragOver = CTreeDragOver
    OnEdited = CTreeEdited
    OnEditing = CTreeEditing
    OnKeyUp = CTreeKeyUp
    OnMouseDown = CTreeMouseDown
  end
  object Panel1: TPanel
    Left = 188
    Top = 25
    Width = 429
    Height = 319
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object Splitter2: TSplitter
      Left = 207
      Top = 0
      Width = 5
      Height = 319
      Cursor = crHSplit
      Beveled = True
      Color = clBtnFace
      ParentColor = False
    end
    object GList: TXPListBox
      Left = 0
      Top = 0
      Width = 207
      Height = 319
      Hint = '·Ì”  ò«·«Â«Ì ê—ÊÂ'
      Align = alLeft
      DragMode = dmAutomatic
      ItemHeight = 13
      ParentShowHint = False
      ShowHint = True
      Sorted = True
      TabOrder = 0
      OnDblClick = spOutClick
    end
    object Panel4: TPanel
      Left = 212
      Top = 0
      Width = 25
      Height = 319
      Align = alLeft
      TabOrder = 1
      object spIn: TSpeedButton
        Left = 1
        Top = 56
        Width = 23
        Height = 22
        Hint = 'Ê—Êœ »Â ê—ÊÂ'
        Flat = True
        OnClick = spInClick
      end
      object spOut: TSpeedButton
        Left = 1
        Top = 238
        Width = 23
        Height = 22
        Hint = 'Œ—ÊÃ «“ ê—ÊÂ'
        Flat = True
        OnClick = spOutClick
      end
    end
    object List: TXPListBox
      Left = 237
      Top = 0
      Width = 192
      Height = 319
      Hint = '·Ì”  ò«·«Â«Ì »œÊ‰ ê—ÊÂ'
      Align = alClient
      DragMode = dmAutomatic
      ItemHeight = 13
      ParentShowHint = False
      ShowHint = True
      Sorted = True
      TabOrder = 2
      OnDblClick = spInClick
    end
  end
  object SB: TStatusBar
    Left = 0
    Top = 344
    Width = 617
    Height = 19
    Panels = <
      item
        BiDiMode = bdRightToLeft
        ParentBiDiMode = False
        Text = ' Ctrl+Del = Õ–› ê—ÊÂ'
        Width = 150
      end
      item
        BiDiMode = bdRightToLeft
        ParentBiDiMode = False
        Text = '  Ins = ê—ÊÂ ÃœÌœ'
        Width = 150
      end
      item
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        Width = 50
      end>
    ParentFont = True
    SimplePanel = False
    SizeGrip = False
    UseSystemFont = False
  end
  object PopupMenu1: TPopupMenu
    Left = 258
    Top = 129
  end
end
