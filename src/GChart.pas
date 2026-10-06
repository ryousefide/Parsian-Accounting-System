unit GChart;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, ExtCtrls, StdCtrls, CheckLst, XPCheckListBox,
  XPListBox, Buttons, Menus, ImgList;

type
  TFGChart = class(TForm)
    ToolBar1: TToolBar;
    tb1: TToolButton;
    CTree: TTreeView;
    Splitter1: TSplitter;
    ToolButton1: TToolButton;
    Panel1: TPanel;
    GList: TXPListBox;
    Splitter2: TSplitter;
    Panel4: TPanel;
    spIn: TSpeedButton;
    spOut: TSpeedButton;
    List: TXPListBox;
    PopupMenu1: TPopupMenu;
    SB: TStatusBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure CTreeEditing(Sender: TObject; Node: TTreeNode;
      var AllowEdit: Boolean);
    procedure CTreeClick(Sender: TObject);
    procedure CTreeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CTreeEdited(Sender: TObject; Node: TTreeNode; var S: String);
    procedure spInClick(Sender: TObject);
    procedure spOutClick(Sender: TObject);
    procedure CTreeMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tb1Click(Sender: TObject);
    procedure CTreeKeyPress(Sender: TObject; var Key: Char);
    procedure CTreeDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure CTreeDragDrop(Sender, Source: TObject; X, Y: Integer);
  private
    { Private declarations }
    FKol:SmallInt;// Integer;
    FMo:SmallInt;
    FTaf:SmallInt;
    New:Boolean;
    sPath:String;
    Procedure GetKods(Node:TTreeNode);
    Function GetLastKol:Integer;
    Function GetLastMo(Kol:Integer):Integer;
    Function GetLastTaf(Kol,Mo:Integer):Integer;
    procedure MakeTree;
    procedure CTreeAddItem;
    procedure CTreeDelItem(Sender: TObject; Node: TTreeNode);
    Procedure UpdateList;
    Procedure DragFromListBox(List:TXPListBox);
  public
    { Public declarations }
  end;

var
  FGChart: TFGChart;

implementation

uses ProVar, Routins, FrooshDM, Db, Goods, MainForm;

{$R *.DFM}
Procedure TFGChart.GetKods(Node:TTreeNode);
Var
I:Integer;
iNode:TTreeNode;
begin
     FKol:=0;FMo:=0;FTaf:=0;
     iNode:=Node;//CTree.Selected;
     If Node.Level <1 Then Exit;
     For I:=Node.Level DownTo 0 Do
     Begin
      Case iNode.Level Of
      3: FTaf:=iNode.OverlayIndex;
      2: FMo :=iNode.OverlayIndex;
      1: FKol:=iNode.OverlayIndex;
      End;
      iNode:=iNode.Parent;
     End;
end;

function TFGChart.GetLastKol: Integer;
begin
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Max(Kol) From GChart Where Mo=0 and Taf=0 ');
     Qu.Open;
     Result:=Qu.Fields[0].AsInteger+1;
     Qu.Close;
end;

function TFGChart.GetLastMo(Kol: Integer): Integer;
begin
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Max(Mo) From GChart Where Kol=:k and Taf=0 ');
     Qu.Params[0].Value:=Kol;
     Qu.Open;
     Result:=Qu.Fields[0].AsInteger+1;
     Qu.Close;
end;

function TFGChart.GetLastTaf(Kol, Mo: Integer): Integer;
begin
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Max(Taf) From GChart Where Kol=:k and Mo=:m ');
     Qu.Params[0].Value:=Kol;
     Qu.Params[1].Value:=Mo;
     Qu.Open;
     Result:=Qu.Fields[0].AsInteger+1;
     Qu.Close;
end;

procedure TFGChart.MakeTree;
Var
I,J,K,L,M:Integer;
Node,LNode:TTreeNode;
begin
     ctree.Items.Clear;
     Ctree.Items.AddFirst(Nil,'œ—Œ  ò«·« ');
     Node:=Ctree.Items.GetFirstNode;
//-----Adding Kols-----
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Des,Kol From GChart Where Kol>0 and Mo=0 and Taf=0 Order By Des');
     Qu.Open;
     For I:=1 To Qu.RecordCount Do
     Begin
      Ctree.Items.AddChild(Node,Qu.Fields[0].AsString).OverlayIndex:=Qu.Fields[1].AsInteger;
      Qu.Next;
     End;
     Qu.Close;
//-----Adding Kols-----
     Node:=Ctree.Items[0].getFirstChild;
//------Adding Mo----
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Des,Mo From GChart Where Kol=:k and Mo>0 and Taf=0 Order By Des');
     For J:=0 to ctree.Items[0].Count-1 Do
     Begin
      Node:=Ctree.Items[0].Item[j];
      Qu.Params[0].Value:=Node.OverlayIndex;
      Qu.Open;
      Qu.First;
      For I:=1 To Qu.RecordCount Do
      Begin
       Ctree.Items.AddChild(Node,Qu.Fields[0].AsString).OverlayIndex:=Qu.Fields[1].AsInteger;
       Qu.Next;
      End;
      Qu.Close;
     End;

//------Adding Taf----
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Des,Taf From GChart Where Kol=:k and Mo=:m and Taf > 0 Order By Des');
     For J:=0 to ctree.Items[0].Count-1 Do
     Begin
      Node:=Ctree.Items[0].Item[j];
      FKol:=Node.OverlayIndex;
      For K:=0 To Ctree.Items[0].Item[j].Count-1 Do
      Begin
       Node:=Ctree.Items[0].Item[j].Item[K];
       FMo:=Node.OverlayIndex;
       Qu.Params[0].Value:=FKol;
       Qu.Params[1].Value:=FMo;
       Qu.Open;
       Qu.First;
       For I:=1 To Qu.RecordCount Do
       Begin
        Ctree.Items.AddChild(Node,Qu.Fields[0].AsString).OverlayIndex:=Qu.Fields[1].AsInteger;
        Qu.Next;
       End;
       Qu.Close;
      End;
     End;
//------Adding Taf----
     Ctree.Items[0].Expand(False);
end;

procedure TFGChart.CTreeAddItem;
Var
Node:TTreeNode;
DG:TFgoods;
begin
//     If Ctree.Selected.Level >2 Then Exit;

     Case Ctree.Selected.Level Of
     0..2: Begin
            Ctree.Selected.Expand(False);
            Ctree.Items.AddChild(Ctree.Selected,'');//‰«„ ê—ÊÂ
            Ctree.Selected:=Ctree.Selected.GetLastChild;
            GetKods(Ctree.Selected.Parent);
            Node:=Ctree.Selected.GetLastChild;
            New:=True;
            Ctree.Selected.EditText;
           End;
        3: Begin
            DG:=TFgoods.Create(Application);
            With DG Do
            Try
             Hmu:=CreateMutex(nil,False,PChar(CCrypt('8OYK0v+1nH6o0RJYCYyhHoHkoevTug==')));
             //If GetLastError() <> ERROR_ALREADY_EXISTS Then Frodm.Destroy;;
             CloseHandle(Hmu);
             FormStyle:=fsNormal;
             FKol.Text:=IntToStr(FGChart.FKol);
             FMo.Text:=IntToStr(FGChart.FMo);
             FTaf.Text:=IntToStr(FGChart.FTaf);
             Fkol.ReadOnly:=True;
             FMo.ReadOnly:=True;
             FTaf.ReadOnly:=True;
             Visible:=False;
             Bexit.Cancel:=False;
             BorderStyle:=bsSingle;
             ShowModal;
            Finally
             Free;
            End;
            CTreeClick(Owner);
           End;
     End;
end;

procedure TFGChart.CTreeDelItem(Sender: TObject; Node: TTreeNode);
begin
     If Node.Level =0 Then Exit;
     GetKods(Node);
     If MessageDlg('ê—ÊÂ Õ–› ‘Êœø',mtWarning,mbYESNO,-1) = idNo Then Exit;
     If Node.HasChildren Then
     Begin
      MessageBeep(MB_ICONEXCLAMATION);
      ShowMessage('“Ì— „Ã„Ê⁄Â œ«—œ ﬁ«»· Õ–› ‰Ì” ');
      Exit;
     End;
     If GList.Items.Count >0 Then
     Begin
      MessageBeep(MB_ICONEXCLAMATION);
      ShowMessage('“Ì— „Ã„Ê⁄Â ò«·«ÌÌ œ«—œ.ﬁ«»· Õ–› ‰Ì” ');
      Exit;
     End;
     If FroDm.GCH.Locate('Kol;Mo;Taf',VararrayOf([FKol,FMo,FTaf]),[loCaseInsensitive]) Then
     Begin
      FroDm.GCH.Delete;
      Node.Delete;
     End;
end;

procedure TFGChart.UpdateList;
Var
I,Idx:Integer;
begin
     Qu.SQL.Clear;
     Qu.SQL.Add('Select I.Nam,I.Kod From Goods I Where Kol=0 or Kol Is Null');
     Qu.Open;
     List.Items.Clear;
     For I:=1 To Qu.RecordCount Do
     Begin
      Idx:=List.Items.Add(Qu.Fields[0].AsString);
      List.AcCode[Idx]:=Qu.Fields[1].Value;
      Qu.Next;
     End;
     Qu.Close;
end;

Procedure TFGChart.DragFromListBox(List:TXPListBox);
Var
I:Integer;
Kod:Integer;
begin
      GetKods(CTree.DropTarget);
      For I:=0 To List.Items.Count-1 Do
      If List.Selected[I] Then
      Begin
       Qu.SQL.Clear;
       Qu.SQL.Add('Update Goods  Set Kol =:g,Mo=:s ,Taf=:t Where Kod=:n');
       Qu.Params[0].AsSmallInt:=FKol;
       Qu.Params[1].AsSmallInt:=FMo;
       Qu.Params[2].AsSmallInt:=FTaf;
       Kod:=StrToInt(FloatToStr(List.AcCode[I]));
       Qu.Params[3].AsInteger:=Kod;
       Qu.ExecSQL;
      End;
      UpdateList;
end;

//---------------------------
procedure TFGChart.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
     Frodm.GCH.Close;
end;

procedure TFGChart.FormCreate(Sender: TObject);
Var
I:Integer;
begin
     Set_Forms(Self);
     FroDM.GCH.Open;
     PopUpMenu:=Nil;
     cTree.Font:=Self.Font;
     Main.glBut.GetBitmap(13,spIn.Glyph);
     Main.glBut.GetBitmap(12,spOut.Glyph);
     List.MultiSelect:=True;
     GList.MultiSelect:=True;
     MakeTree;
     UpdateList;
     New:=False;
     cTree.Images:=Main.TreeImage;
     CTree.StateImages:=Main.TreeImage;
     For I:=0 To CTree.Items.Count-1 Do
     Begin
      IF CTree.Items[i].Count > 0 Then
       CTree.Items[i].ImageIndex :=1
      Else
       CTree.Items[i].ImageIndex :=2;//-1
      CTree.Items[i].StateIndex:=CTree.Items[i].Level+3;
     End;
end;

procedure TFGChart.CTreeClick(Sender: TObject);
Var
I,J,Idx:Integer;
Node:TTreeNode;
begin
     Node:=cTree.Selected;
     FKol:=0;FMo:=0;FTaf:=0;sPath:='';
     GList.Items.Clear;
     If Node.Level <1 Then Exit;
     For I:=ctree.Selected.Level DownTo 0 Do
     Begin
      Case Node.Level Of
      3: FTaf:=Node.OverlayIndex;
      2: FMo :=Node.OverlayIndex;
      1: FKol:=Node.OverlayIndex;
      End;
      Case Node.Level Of
      3: sPath:=Node.Text;//sPath+'<--'+
      2: sPath:=sPath+'<--'+Node.Text;
      1: sPath:=sPath+'<--'+Node.Text;
      End;
      Node:=Node.Parent;
     End;
     Qu.SQL.Clear;
     Qu.SQL.Add('Select I.Nam,I.Kod From Goods I ');
     Case cTree.Selected.Level of
     1:Begin
        Qu.SQL.Add('Where I.Kol=:t');
        Qu.Params[0].Value:=FKol;
       End;
     2:Begin
       Qu.SQL.Add('Where I.Kol=:t and I.Mo=:s');
       Qu.Params[0].Value:=FKol;
       Qu.Params[1].Value:=FMo;
       End;
     3:Begin
       Qu.SQL.Add('Where I.Kol=:t and I.Mo=:s  and I.Taf=:g ');
       Qu.Params[0].Value:=FKol;
       Qu.Params[1].Value:=FMo;
       Qu.Params[2].Value:=FTaf;
       End;
     End;
     sPath:=IntToStr(FTaf)+'<--'+IntToStr(FMo)+'<--'+IntToStr(FKol)+'       '+sPath;
     Sb.Panels[2].Text:=sPath;
     Qu.Open;
     GList.Items.Clear;
     For I:=1 To Qu.RecordCount Do
     Begin
      Idx:=GList.Items.Add(Qu.Fields[0].AsString);
      GList.AcCode[Idx]:=Qu.Fields[1].Value;
      Qu.Next;
     End;
     Qu.Close;
end;

procedure TFGChart.CTreeEdited(Sender: TObject; Node: TTreeNode;
  var S: String);
Var
NKol,NMo,NTaf:Integer;
begin
     s:=Trim(s);
     If S='' Then
     Begin
      Node.Delete;
      Exit;
     End;
     Case New Of
      False:If FroDM.GCH.Locate('Kol;Mo;Taf',VararrayOf([FKol,FMo,FTaf]),[loCaseInsensitive])
            Then FroDm.GCH.Edit Else Exit;
      True: FroDm.GCH.Append;
     End;
     NKol:=FKol;NMo:=FMo;NTaf:=FTaf;
     If New Then
      Case Node.Level Of
      1: NKol:=GetLastKol;
      2: NMo:=GetLastMo(FKol);
      3: NTaf:=GetLastTaf(FKol,FMo);
      End;
     Frodm.GCHDes.Value:=S;
     Frodm.GCHKol.Value:=NKol;
     Frodm.GCHMo.Value:=NMo;
     Frodm.GCHTaf.Value:=NTaf;
     Frodm.GCH.Post;
     If New Then
      Case Node.Level Of
      1: Node.OverlayIndex:=NKol;
      2: Node.OverlayIndex:=NMo;
      3: Node.OverlayIndex:=NTaf;
      End;
     Ctree.Selected:=Ctree.Selected.Parent;
     QuickCloseOpen([38]);
     New:=False;
end;

procedure TFGChart.CTreeEditing(Sender: TObject; Node: TTreeNode;
  var AllowEdit: Boolean);
begin
     AllowEdit:=(Node.Level>=0)and ((Node.Text='')Or (Not New));
end;

procedure TFGChart.CTreeKeyPress(Sender: TObject; var Key: Char);
begin
     IF Key In [#13,#27] Then CTree.ReadOnly :=True;
end;

procedure TFGChart.CTreeKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key Of
     VK_INSERT :
      CTreeAddItem;
     VK_LEFT,VK_RIGHT,VK_UP,VK_DOWN,VK_LBUTTON,VK_RBUTTON:
      CTreeClick(Sender);
     VK_RETURN:
      If Ctree.Selected.Text = '' Then CTree.Selected.Delete;
     VK_DELETE:
      If ssCtrl in Shift Then CTreeDelItem(Sender,CTree.Selected);
     VK_ESCAPE: Close;
     End;
end;

procedure TFGChart.CTreeMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
     If Button = mbRight Then
     Begin
      //Old_Name:=tvAcKod.Selected.Text;
      Ctree.ReadOnly :=False;
      New:=False;
      Ctree.Selected.EditText;
     End;
end;

procedure TFGChart.spInClick(Sender: TObject);
Var
I:Integer;
Kod:Integer;
begin
     If cTree.Selected.Level > 0 Then
     Begin
      For I:=0 To List.Items.Count-1 Do
      If List.Selected[I] Then
      Begin
       Qu.SQL.Clear;
       Qu.SQL.Add('Update Goods  Set Kol =:g,Mo=:s ,Taf=:t Where Kod=:n');
       Qu.Params[0].AsSmallInt:=FKol;
       Qu.Params[1].AsSmallInt:=FMo;
       Qu.Params[2].AsSmallInt:=FTaf;
       Kod:=StrToInt(FloatToStr(List.AcCode[I]));
       Qu.Params[3].AsInteger:=Kod;
       Qu.ExecSQL;
      End;
      CTreeClick(Sender);
      UpdateList;
     End;
end;

procedure TFGChart.spOutClick(Sender: TObject);
Var
I:Integer;
begin
     If cTree.Selected.Level > 0 Then
     Begin
      For I:=0 To GList.Items.Count-1 Do
      If GList.Selected[I] Then
      Begin
       Qu.SQL.Clear;
       Qu.SQL.Add('Update Goods  Set Kol =0,Mo=0,Taf=0 Where Kod=:n');
       Qu.Params[0].Value:=GList.AcCode[I];
       Qu.ExecSQL;
      End;
      CTreeClick(Sender);
      UpdateList;
     End;
end;



procedure TFGChart.tb1Click(Sender: TObject);
Var
I:Integer;
begin
     MakeTree;
     UpdateList;
     For I:=0 To CTree.Items.Count-1 Do
     Begin
      IF CTree.Items[i].Count > 0 Then
       CTree.Items[i].ImageIndex :=1
      Else
       CTree.Items[i].ImageIndex :=2;
      CTree.Items[i].StateIndex:=CTree.Items[i].Level+3;
     End;
end;


procedure TFGChart.CTreeDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
     Accept:=Source Is TXPListBox;
     If Source Is TXPListBox Then Exit;
     Accept:=Not CTree.Selected.HasChildren;
end;

procedure TFGChart.CTreeDragDrop(Sender, Source: TObject; X, Y: Integer);
Var
stDest:String;
stSource :String;
OKol,OMo,OTaf:SmallInt;
NKol,NMo,NTaf:SmallInt;
Node:TTreeNode;
begin
     If (CTree.DropTarget.Level > 2) and (Source Is TTreeView) Then Exit;
     If Source Is TXPListBox Then
     Begin
      DragFromListBox(Source As TXPListBox);
      CTreeClick(Sender);
      Exit;
     End;
     StDest:=CTree.DropTarget.Text;
     GetKods(cTree.Selected);
     OKol:=FKol;
     OMo:=FMo;
     OTaf:=FTaf;
     stSource:=CTree.Selected.Text;
     GetKods(cTree.DropTarget);
     Node:=CTree.Items.AddChild(CTree.DropTarget,stSource);
     cTree.Selected.Delete;
     NKol:=FKol;NMo:=FMo;NTaf:=FTaf;
     Case CTree.DropTarget.Level+1 Of
      1: NKol:=GetLastKol;
      2: NMo:=GetLastMo(FKol);
      3: NTaf:=GetLastTaf(FKol,FMo);
     End;

     If FroDM.GCH.Locate('Kol;Mo;Taf',VararrayOf([OKol,OMo,OTaf]),[loCaseInsensitive])Then
      FroDm.GCH.Edit
     Else
      Exit;
     Frodm.GCHDes.Value:=stSource;
     Frodm.GCHKol.Value:=NKol;
     Frodm.GCHMo.Value:=NMo;
     Frodm.GCHTaf.Value:=NTaf;
     Frodm.GCH.Post;

     Qu.SQL.Clear;
     Qu.SQL.Add('Update Goods Set Kol=:n1,Mo=:n2,Taf=:n3 ');
     Qu.SQL.Add('Where Kol=:o1 and Mo=:O2 and Taf=:O3 ');
     Qu.Params[0].Value:=NKol;
     Qu.Params[1].Value:=NMo;
     Qu.Params[2].Value:=NTaf;
     Qu.Params[3].Value:=OKol;
     Qu.Params[4].Value:=OMo;
     Qu.Params[5].Value:=OTaf;
     Qu.ExecSQL;

     Case Node.Level Of
      1: Node.OverlayIndex:=NKol;
      2: Node.OverlayIndex:=NMo;
      3: Node.OverlayIndex:=NTaf;
     End;
end;

end.
