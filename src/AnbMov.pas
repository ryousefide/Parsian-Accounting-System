unit AnbMov;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls,Mask, Grids, DBGrids,DB, ExtCtrls, DBCGrids,
  DBTables, ComCtrls, Buttons, PopupListBox;

type
  TFAnbMov = class(TForm)
    Sb1: TStatusBar;
    Panel1: TPanel;
    Bprev: TBitBtn;
    Bsave: TBitBtn;
    Bnext: TBitBtn;
    Bnew: TBitBtn;
    Bexit: TBitBtn;
    BPrint: TBitBtn;
    Bdel: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Goods: TDBGrid;
    Fnet: TDBEdit;
    FNo: TEdit;
    GList: TPopupListBox;
    CList: TPopupListBox;
    AList: TPopupListBox;
    Bedit: TBitBtn;
    EdQu: TQuery;
    Fbk: TDBCheckBox;
    Dat1: TMaskEdit;
    IList: TPopupListBox;
    Label1: TLabel;
    FDes: TDBEdit;
    procedure BprevClick(Sender: TObject);
    procedure BnextClick(Sender: TObject);
    procedure BnewClick(Sender: TObject);
    procedure BsaveClick(Sender: TObject);
    procedure BexitClick(Sender: TObject);
    procedure GoodsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FNoKeyPress(Sender: TObject; var Key: Char);
    procedure FNoExit(Sender: TObject);
    procedure GoodsKeyPress(Sender: TObject; var Key: Char);
    procedure GoodsEditButtonClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GoodsColExit(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure GListKeyPress(Sender: TObject; var Key: Char);
    procedure GListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CListKeyPress(Sender: TObject; var Key: Char);
    procedure AListKeyPress(Sender: TObject; var Key: Char);
    procedure AListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GoodsEnter(Sender: TObject);
    procedure BPrintClick(Sender: TObject);
    procedure GoodsColEnter(Sender: TObject);
    procedure BdelClick(Sender: TObject);
    Procedure NexTab(Sender:TObject;Var Key :Char);
    procedure FormActivate(Sender: TObject);
    procedure FNoEnter(Sender: TObject);
    procedure GoodsMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure BeditClick(Sender: TObject);
    procedure Dat1Enter(Sender: TObject);
    procedure Dat1Exit(Sender: TObject);
    procedure IListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure IListKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    MoFlag:Boolean;
    New:Boolean;
    NewNo:Integer;
    BDat :Integer;
    FacNo:String;
    Procedure Good_Del;
    Procedure UnDepot;
    Procedure Depot;
    Function Check_Fac:Boolean;
    Procedure DrawList(List:TPopupListBox;Index:Integer);
    Procedure SetImage;
    Procedure CancelEdit;
    Procedure GoodFilter(FacNo:Integer);
    Function QPSums:Currency;
  public
    { Public declarations }
  end;

var
  FAnbMov: TFAnbMov;

implementation

uses FrooshDM, Routins, ProVar, RejFacRep, MainForm, AcSearch, Converts, XPListBox;
Const
Tip='ãÑÌæÚí ÎÑíÏ';
FTip = 4;
Var
BehKod:Real;
Radif,BInvoNo:Integer;  
                             
{$R *.DFM}
Procedure TFAnbMov.NexTab(Sender:TObject;Var Key :Char);
begin
     If Key = #13 Then
     Begin
      Key:=#0;
      SelectNext(Sender As TWinControl,True,True);
     End;
end;

Procedure TFAnbMov.Good_Del;
Var
I:Integer;
begin
     Frodm.MVG.First;
     For I:= 1 To Frodm.MVG.RecordCount Do
     Begin
      IF Frodm.MVGBkod.Value Then Frodm.MVG.Delete;
      If Frodm.MVG.Eof Then Exit;
      Frodm.MVG.Next;
     End;
     Frodm.MVG.First;
end;

Procedure TFAnbMov.UnDepot;
Var
I:Integer;
begin
     Frodm.MVG.First;
     For I:= 1 To Frodm.MVG.RecordCount Do
     Begin
       //OutGoing Good From Depots
       DepotChange(Frodm.MVGKod.Value,Frodm.MVGOAnbKod.Value,
                   Frodm.MVGColor.Value,Frodm.MVGOAnbNam.Value,
                   Frodm.MVGQuant.Value,dpIn);
       //Incomming Good To Depots
       DepotChange(Frodm.MVGKod.Value,Frodm.MVGIAnbKod.Value,
                   Frodm.MVGColor.Value,Frodm.MVGIAnbNam.Value,
                   Frodm.MVGQuant.Value,dpOut);
      Frodm.MVG.Next;
     End;
     Cardex_Del(FNo.Text,'ÎÑæÌ ßÇáÇ');
     Cardex_Del(FNo.Text,'æÑæÏ ßÇáÇ')
end;

Procedure TFAnbMov.Depot;
Var
I:Integer;
begin
     For I:=1 To Frodm.MVG.RecordCount Do
     Begin
       Frodm.MVG.Edit;
       Frodm.MVGRadif.Value:=I;
       Frodm.MVGNo.Value:=Frodm.MoveNo.Value;
       Frodm.MVGDat.Value:=Frodm.MoveDat.Value;
       Frodm.MVG.Post;
       If DepotCheck(Frodm.MVGKod.Value,Frodm.MVGOAnbKod.Value,
                     Frodm.MVGColor.Value,Frodm.MVGOAnbNam.Value,
                     Frodm.MVGQuant.Value) Then
       Begin
       //OutGoing Good From Depots
       Auto_GCardex(Frodm.MVGNam.Value,Frodm.MVGColor.Value,
                    Frodm.MVGOAnbNam.Value,Frodm.MVGKod.Value,
                    Frodm.MVGRadif.Value,Frodm.MVGQuant.Value,
                    dpOut,Frodm.MoveNo.Value,Frodm.MoveDat.Value,'ÎÑæÌ ßÇáÇ',
                    '',Frodm.MVGPfee.Value,0);
       DepotChange(Frodm.MVGKod.Value,Frodm.MVGOAnbKod.Value,
                   Frodm.MVGColor.Value,Frodm.MVGOAnbNam.Value,
                   Frodm.MVGQuant.Value,dpOut);
       //Incomming Good To Depots
       Auto_GCardex(Frodm.MVGNam.Value,Frodm.MVGColor.Value,
                    Frodm.MVGIAnbNam.Value,Frodm.MVGKod.Value,
                    Frodm.MVGRadif.Value,Frodm.MVGQuant.Value,
                    dpIn,Frodm.MoveNo.Value,Frodm.MoveDat.Value,'æÑæÏ ßÇáÇ',
                    '',Frodm.MVGPfee.Value,0);
       DepotChange(Frodm.MVGKod.Value,Frodm.MVGIAnbKod.Value,
                   Frodm.MVGColor.Value,Frodm.MVGIAnbNam.Value,
                   Frodm.MVGQuant.Value,dpIn);
       End Else
       Begin
         Frodm.MVG.Edit;
         Frodm.MVGBKod.Value:=True;
         Frodm.MVG.Post;
       End;
       Frodm.MVG.Next;
     End;
     Good_Del;
end;

Function TFAnbMov.Check_Fac:Boolean;
Var
I:Integer;
begin
     Result:=True;
     If Frodm.Move.State = dsBrowse Then Exit;
     If Not sDp Then Exit;
     Frodm.MVG.First;
     For I:=1 To Frodm.MVG.RecordCount Do
     Begin
       Result:=DepotCheck(Frodm.MVGKod.Value,Frodm.MVGOAnbKod.Value,
                          Frodm.MVGColor.Value,Frodm.MVGOAnbNam.Value,
                          Frodm.MVGQuant.Value);
       MoFlag:=Result;
       If Not Result Then
       Begin
         Bsave.Enabled:=True;
         ShowMessage( 'ÚÜÜÜÏã ãæÌæÏí ßÇÝí');
         Exit;
       End;
       Frodm.MVG.Next;
     End;
     Frodm.MVG.First;
end;

Procedure TFAnbMov.DrawList(List:TPopupListBox;Index:Integer);
begin
     List.Visible :=True;
     List.SetFocus;
     Bexit.Cancel :=False;
     List.ItemIndex :=0;
end;

Procedure TFAnbMov.SetImage;
begin
     Main.glKey.GetBitmap(0,BPrev.Glyph);
     Main.glKey.GetBitmap(1,Bnext.Glyph);
     Main.glKey.GetBitmap(2,BPrint.Glyph);
     Main.glKey.GetBitmap(3,Bedit.Glyph);
     Main.glKey.GetBitmap(4,Bsave.Glyph);
     Main.glKey.GetBitmap(5,Bdel.Glyph);
     Main.glKey.GetBitmap(7,BExit.Glyph);
end;

Procedure TFAnbMov.CancelEdit;
Var
I,J:Integer;
begin
     If (Not EdQu.Active)or(EdQu.RecordCount =0) Then Exit;
     GoodFilter(Frodm.MoveNo.AsInteger);
     Frodm.MVG.First;
     For I:=1 To Frodm.MVG.RecordCount Do Frodm.MVG.Delete;
     EdQu.First;
     For I:=1 To EdQu.RecordCount Do
     Begin
       Frodm.MVG.Append;
       For J:=1 To 16 Do
         Frodm.MVG.Fields[J].Value:=EdQu.Fields[J].Value;
       Frodm.MVG.Post;
       EdQu.Next;
     End;
     EdQu.Close;
     Frodm.Move.Cancel;
     Frodm.MVG.First;
     Depot;
End;

Procedure TFAnbMov.GoodFilter(FacNo:Integer);
begin
     Frodm.MVG.Filtered:=False;
     Frodm.MVG.Filter:='No = '+IntToStr(FacNo);
     Frodm.MVG.Filtered:=True;
     Dat1.Text:=IntToDate(Frodm.MoveDat.Value)
end;

Function TFAnbMov.QPSums:Currency;
begin
     Qu.SQL.Clear;
     Qu.SQL.ADD('SELECT SUM(D.PTotal)');
     Qu.SQL.ADD('FROM MoveGood D');
     QU.SQL.ADD('WHERE D.No = '+FNo.Text);
     Qu.Open;
     Result:=Qu.Fields[0].AsCurrency;
     Qu.Close;
end;

//End of private deceleration

procedure TFAnbMov.GoodsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Not(Frodm.Move.State = dsBrowse) Then Frodm.MVG.Edit;
     IF (Key = VK_F4) and Not(Frodm.Move.State = dsBrowse)Then
{       and Not(Goods.Columns[Goods.SelectedIndex].ReadOnly)}
     Case Goods.SelectedField.Index Of
     3: DrawList(GList,2);
     4: DrawList(Clist,3);
     5: DrawList(AList,4);
     7: DrawList(IList,4);
     End;
     If (Goods.SelectedIndex In [0,1,2,3])and(Key=32)and Not(Frodm.Move.State = dsBrowse) Then
      If FindGoods(Frodm.MVG,Frodm.MoveNo.AsInteger,Frodm.MoveDat.AsInteger,'') Then
       Goods.SelectedField :=Frodm.MVGIAnbNam;
end;

procedure TFAnbMov.BprevClick(Sender: TObject);
begin
     If Frodm.Move.State In [dsEdit,dsInsert] Then
     Begin
      FNo.SetFocus;
      Check_Factor_State(Frodm.Move,BSaveClick,FormDestroy);
      Exit;
     End;
     New:=False;
     If Not MoFlag Then Exit;
     Frodm.Move.Refresh;
     FroDM.Move.Prior;
     GoodFilter(Frodm.MoveNo.AsInteger);
     FNo.Text:=IntToStr(Frodm.MoveNo.Value);
end;

procedure TFAnbMov.BnextClick(Sender: TObject);
begin
     If Frodm.Move.State In [dsEdit,dsInsert] Then
     Begin
      FNo.SetFocus;
      Check_Factor_State(Frodm.Move,BSaveClick,FormDestroy);
      Exit;
     End;
     New:=False;
     If Not MoFlag Then Exit;
     Frodm.Move.Refresh;
     FroDM.Move.Next;
     GoodFilter(Frodm.MoveNo.AsInteger);
     FNo.Text:=IntToStr(Frodm.MoveNo.Value);
     NewNo:=Frodm.MoveNo.Value+1;
     If Frodm.Move.Filtered = True Then Exit;
     If Frodm.Move.Eof Then
     Begin
       FNo.Text:=IntToStr(NewNo);
       FNo.SetFocus;
     End;
end;

procedure TFAnbMov.BnewClick(Sender: TObject);
begin
     If Frodm.Move.Filtered Then Exit;
     FroDM.Move.Append;
     Frodm.MoveNo.Value:=StrToInt(FNo.Text);
     Frodm.MoveDat.Value:=Fardate;
     Frodm.MovePerm.Value:=False;
     New:=True;
     FacNo:=FNo.Text;
     Bdat:=Frodm.MoveDat.Value;
     Frodm.Move.Post;
     Frodm.Move.Edit;
     GoodFilter(Frodm.MoveNo.AsInteger);
     Sb1.Panels[2].Text :='ÌÏíÏ';
     BSave.Enabled:=True;
     BEdit.Enabled:=False;
end;

procedure TFAnbMov.BsaveClick(Sender: TObject);
begin
     BSave.Enabled:=False;
     If Frodm.Move.State = dsBrowse Then Exit;
     FNo.SetFocus;
     If Frodm.MVG.RecordCount = 0 Then
     Begin
       Frodm.Move.Delete;
       New:=False;
       GoodFilter(Frodm.MoveNo.AsInteger);
       FNo.Text:=IntToStr(Frodm.MoveNo.Value);
       BEdit.Enabled:=True;
       Exit;
     End;
     If Not RequierdCheck(Frodm.Move) Then
     Begin
       Bsave.Enabled:=True;
       Exit;
     End;
     Frodm.MovePerm.Value:=sPerm;
     Frodm.MovePnet.Value:=QPSums;
     If Check_Fac Then Frodm.Move.Post Else Exit;
     Depot;
     QuickCloseOpen([23,22,6,24,11,27]);
     Frodm.Move.Locate('No',StrToInt(FNo.Text),[loCaseInsensitive]);
     Radif:=1;
     EdQu.Close;
     New:=False;
     BEdit.Enabled:=True;
end;

procedure TFAnbMov.BexitClick(Sender: TObject);
begin
     FNo.SetFocus;
     IF Check_Factor_State(Frodm.Move,BSaveClick,FormDestroy) = idCancel Then Exit;
     Close;
end;

procedure TFAnbMov.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     EdQu.DatabaseName :=CurrDb;
     Frodm.Move.Open;
     Frodm.MVG.Open;
     SetImage;
     Fbk.Visible :=Boss;
     Bdel.Enabled :=Boss;
     Goods.Columns[5].Visible :=sAKod;
     Goods.Columns[3].Visible :=sModel;
     Goods.Columns[9].Visible :=sAKod;
     Goods.Columns[9].Width:=31;
     Goods.Columns[5].Width:=31;
     Goods.Columns[3].Width:=81;
     Frodm.Move.Refresh;
     FroDM.Move.Last;
     NewNo:=Frodm.MoveNo.Value;
     Radif:=1;
     MoFlag:=True;
     New:=False;
     GoodFilter(Frodm.MoveNo.AsInteger);
     FNo.Text:=IntToStr(Frodm.MoveNo.Value);
end;

procedure TFAnbMov.FormActivate(Sender: TObject);
begin
     GList.Items.Assign(Kala);
     Fill_Comb(Frodm.Color,'Color',CList.Items);
     Fill_Comb(Frodm.AnbDat,'Nam',AList.Items);
     IList.Items.Assign(AList.Items);
end;

procedure TFAnbMov.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Case New Of
     True :IF Check_Factor_State(Frodm.Move,BSaveClick,FormDestroy) = idCancel Then
      Action :=caNone
     Else
      Action:=caFree;
     False: If Check_Fac Then Action:=caFree Else Action :=caNone;
     End;
     If Action= caFree Then
     Begin
      Frodm.Move.Open;
      Frodm.MVG.Open;
     End;
end;

procedure TFAnbMov.FormDestroy(Sender: TObject);
begin
     If Frodm.Move.State = dsBrowse Then Exit;
     Case New Of
     True :Begin
            CancelFactor(Frodm.Move,Frodm.MVG);
            GoodFilter(Frodm.MoveNo.AsInteger);
            FNo.Text:=IntToStr(Frodm.MoveNo.Value);
           End;
     False: CancelEdit; 
     End;
     Bsave.Enabled:=False;
     BEdit.Enabled:=True;
end;

procedure TFAnbMov.FNoKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then FNoExit(Sender);
     NexTab(Sender, key);
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;
end;

procedure TFAnbMov.FNoExit(Sender: TObject);
begin
     If Frodm.Move.State In [dsEdit,dsInsert] Then
     Begin
       Fno.Text:=IntToStr(Frodm.MoveNo.Value);
       Exit;
     End;
     IF Not Frodm.Move.Locate('No',StrToInt(FNo.Text),[loCaseInsensitive]) Then
       BnewClick(Sender)
     Else
       GoodFilter(Frodm.MoveNo.AsInteger);
end;

procedure TFAnbMov.GoodsKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
      Key:=#0;
      GridMove(Goods,Frodm.Move,Radif);
     End;
     If Not(Frodm.Move.State = dsBrowse) Then Frodm.MVG.Edit;
end;

procedure TFAnbMov.GoodsMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
  Var
  coord:TGridCoord;
  rec:Integer;
begin
     rec:=Goods.DataSource.DataSet.RecNo;
     Coord:=Goods.MouseCoord(x,y);
     If Coord.X > 1 Then
     Begin
       Goods.SelectedIndex :=0;
       Goods.DataSource.DataSet.RecNo:=rec;
     End;
end;

procedure TFAnbMov.GoodsEditButtonClick(Sender: TObject);
begin
     If Frodm.Move.State In [dsEdit,dsInsert] Then
     Begin
       Frodm.MVG.Delete;
       Frodm.MVG.Edit;
     End;
end;

procedure TFAnbMov.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key = VK_F3 Then BsaveClick(Sender);
     If Shift = [ssAlt] Then
      Case Key Of
       VK_Left  :BprevClick(Sender);
       VK_RIGHT :BnextClick(Sender);
      End;
end;

procedure TFAnbMov.GoodsColExit(Sender: TObject);
begin
     If Frodm.Move.State = dsBrowse Then Exit Else Frodm.MVG.Edit;
     Case Goods.SelectedField.Index Of
     1: Begin
          If Frodm.MVGRadif.Value = 0 Then Frodm.MVGRadif.Value :=Radif;
          Frodm.MVGDat.Value :=Frodm.MoveDat.Value;
          Frodm.MVGNo.Value:=Frodm.MoveNo.Value;
          Frodm.MVG.Post;
        End;
     2: If Goods.SelectedField.Value > -1 Then
        Case sGene Of
        False:
        Begin
         If Frodm.MVGNam.IsNull Then
          Frodm.MVGNam.Value :=GoodNam(Goods.SelectedField.Value)
         Else
          GList.Items.Assign(Kala);
         If Goods.Columns[1].ReadOnly Then Exit;
         DrawList(GList,2);
         GList.ItemIndex:=GList.Items.IndexOf(Frodm.MVGNam.Value);
         If GList.ItemIndex =-1 Then GList.ItemIndex:=0;
        End;
        True:
        Begin
         If Frodm.MVGNam.IsNull Then
          FillGene(GList.Items,Goods.SelectedField.Value)
         Else
          GList.Items.Assign(Kala);
         If Goods.Columns[1].ReadOnly Then Exit;
         DrawList(GList,2);
         GList.ItemIndex:=GList.Items.IndexOf(Frodm.MVGNam.Value);
         If GList.ItemIndex =-1 Then GList.ItemIndex:=0;
        End;
        End;
     5: Frodm.MVGOAnbNam.Value :=AnbNam(Frodm.MVGOAnbNam.Value);
     6: If Goods.SelectedField.Text = Null Then Goods.SelectedField.Value :=0;
    11: Frodm.MVGPtotal.Value :=Frodm.MVGQuant.Value *Frodm.MVGPfee.Value;
     7: Begin
         Frodm.MVGPtotal.Value :=GetOutPrice(Frodm.MVGKod.AsString,Frodm.MVGColor.Value,
         Frodm.MVGOAnbNam.Value,Frodm.MVGOAnbKod.Value,0,Frodm.MoveDat.AsInteger,Frodm.MVGQuant.Value);
         Frodm.MVGPfee.Value:= Frodm.MVGPtotal.Value/Frodm.MVGQuant.Value;
        End;
     End;
     If Goods.Columns[0].Field.Value > 0 Then Radif:=Frodm.BinvoGoodRadif.Value ;
end;

procedure TFAnbMov.GListKeyPress(Sender: TObject; var Key: Char);
begin
     If Key =#13 Then
     Begin
       Frodm.MVG.Edit;
       Frodm.MVGNo.Value:=Frodm.MoveNo.Value;
       Frodm.MVGNam.Value:=GList.Items.Strings[GList.ItemIndex];
       Frodm.MVGKod.Value :=GoodKod(Frodm.MVGNam.Value);
       Frodm.MVGPfee.Value :=GoodBuyPrice(Frodm.MVGKod.Value);
       Frodm.MVG.Post;
       Goods.SetFocus;
       Goods.SelectedField :=Frodm.MVGNam;
       GList.Visible :=False;
       Bexit.Cancel :=True;
     End;

end;

procedure TFAnbMov.GListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If (Key = 27) Then
     Begin
       Goods.SetFocus;
       Goods.SelectedField :=Goods.Columns[1].Field;
       GList.Visible :=False;
       Bexit.Cancel :=True;
     End;

end;

procedure TFAnbMov.CListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If (Key = VK_F4) Then
     Begin
       Goods.SetFocus;
       Goods.SelectedField :=Frodm.MVGColor;
       CList.Visible :=False;
       Bexit.Cancel :=True;
     End;

end;

procedure TFAnbMov.CListKeyPress(Sender: TObject; var Key: Char);
begin
     If Key =#13 Then
     Begin
       Frodm.MVG.Edit;
       Frodm.MVGColor.Value:=CList.Items.Strings[CList.ItemIndex];
       Goods.SetFocus;
       Goods.SelectedField :=Frodm.MVGColor;
       CList.Visible :=False;
       Bexit.Cancel :=True;
     End;

end;

procedure TFAnbMov.AListKeyPress(Sender: TObject; var Key: Char);
begin
     If Key =#13 Then
     Begin
       Frodm.MVG.Edit;
       Frodm.MVGOAnbNam.Value:=AList.Items.Strings[AList.ItemIndex];
       Goods.SetFocus;
       Goods.SelectedField :=Frodm.MVGOAnbNam;
       AList.Visible :=False;
       Bexit.Cancel :=True;
     End;
end;

procedure TFAnbMov.AListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If (Key = 27) Then
     Begin
       Goods.SetFocus;
       Goods.SelectedField :=Frodm.MVGOAnbNam;
       AList.Visible :=False;
       Bexit.Cancel :=True;
     End;
end;

procedure TFAnbMov.GoodsEnter(Sender: TObject);
begin
     If (Frodm.Move.State = dsBrowse) Then Goods.ReadOnly :=True Else
        Goods.ReadOnly :=False;
     Goods.SelectedIndex :=0;
end;

procedure TFAnbMov.BPrintClick(Sender: TObject);
Var
RowCnt:Integer;
FreeP:Real;
LesMar:Real;
CnHeight:Real;
SubH:Real;
begin
     If Not(Frodm.Move.State = dsBrowse) Then Exit;
     CreatingForm(TRepBuyRej,'RepBuyRej',RepBuyRej);
     Set_Sys_Enviroment;

     CnHeight:=RepBuyRej.QRBand1.Size.Height+RepBuyRej.QRBand2.Size.Height+
     RepBuyRej.QRChildBand2.Size.Height+RepBuyRej.ChildBand2.Size.Height+
     RepBuyRej.ChildBand1.Size.Height+RepBuyRej.PgFooter.Size.Height;
     RepBuyRej.QRSubDetail3.Size.Height:=5.8;
     SubH:=RepBuyRej.QRSubDetail3.Size.Height;
     FreeP:=(PLength-CnHeight-TopMar-ButMar);
     RowCnt:=Trunc((FreeP/SubH));
     LesMar:=FreeP-(RowCnt*SubH);
     RepBuyRej.ChildBand2.Size.Height:=RepBuyRej.ChildBand2.Size.Height+Int(LesMar);
     RepBuyRej.GFB.Size.Height:=(SubH)*(RowCnt-Frodm.MVG.RecordCount Mod RowCnt);

     RepBuyRej.qrTit.Caption:=InvoLbl;
     RepBuyRej.QRMemo1.Lines.Add(Master);
     RepBuyRej.qrCom.Caption:=Comm;
     RepBuyRej.PrinterSettings.Copies:=PrnCnt;
     RepBuyRej.qrFrem.CapTion:=FarsiPrice(Frodm.MovePnet.Value);

     If BehKod > 0 Then RepBuyRej.qrlRem.Caption :=Sb1.Panels[0].Text;
     RepBuyRej.qrlRem.Enabled :=sRem;
     RepBuyRej.QRLabel20.Enabled :=sRem;
     RepBuyRej.Preview;
     RepBuyRej.Destroy;
end;

procedure TFAnbMov.GoodsColEnter(Sender: TObject);
begin
     If Frodm.Move.State = dsBrowse Then Exit Else Frodm.MVG.Edit;
     Case Goods.SelectedField.Index Of
     1: If Frodm.MVGRadif.Value > 0 Then Radif:=Frodm.MVGRadif.Value;
     3: If(Frodm.MVGKod.Value = 0)Then
        Case sGene of
         False: Begin
              If Goods.Columns[1].ReadOnly Then Exit;
              DrawList(GList,2);
            End;
         True: Begin
              If Goods.Columns[1].ReadOnly Then Exit;
              GList.Items.Assign(Kala);
              DrawList(GList,2);
            End;
        End;
     4: If SModel Then
        Begin
         If Goods.Columns[1].ReadOnly Then Exit;
         DrawList(CList,3);
         CList.ItemIndex:=CList.Items.IndexOf(Frodm.MVGColor.Value);
         If CList.ItemIndex =-1 Then CList.ItemIndex:=0;
        End;
     5: Begin
         IF (Frodm.MVGColor.Value = '')and(sModel) Then Goods.SelectedField:=
         Frodm.MVGColor;
         IF Frodm.MVGNam.Value = '' Then Goods.SelectedField:=
         Frodm.MVGNam;
         If Not Goods.Columns[1].ReadOnly Then DrawList(AList,4);
        End;
      7: If Not Goods.Columns[1].ReadOnly Then DrawList(IList,4);
     11: If Frodm.MVGOAnbNam.Value = '' Then Goods.SelectedField:=Frodm.MVGOAnbNam;
     12: Frodm.MVGPtotal.Value :=Frodm.MVGQuant.Value *  Frodm.MVGPfee.Value;

     End;

end;

procedure TFAnbMov.BdelClick(Sender: TObject);
Var
I:Integer;
begin
     If Not(Frodm.Move.State = DsBrowse) Then Exit;
     If MessageDlg('ÝÇßÊæÑ ÍÐÝ ÔæÏ',mtWarning,mbYesNo,0) = mrYes Then
     begin
       If Frodm.MovePerm.Value = True Then
       Begin
         ShowMessage('ÝÇßÊæÑ ÏÇÆãí ÇÓÊ');
         Exit;
       End;
       UnDepot;
       Frodm.MVG.First;
       For I:=1 To Frodm.MVG.RecordCount Do Frodm.MVG.Delete;
       Frodm.Move.Delete;
       New:=False;
       GoodFilter(Frodm.MoveNo.AsInteger);
       FNo.Text:=IntToStr(Frodm.MoveNo.Value);
     End;
end;

procedure TFAnbMov.FNoEnter(Sender: TObject);
Var
I:Integer;
begin
     If Frodm.Move.State = dsInsert Then
     Begin
       Frodm.MVG.First;
       For I:=1 To Frodm.MVG.RecordCount Do
       Begin
         Frodm.MVG.Next;
       End;
       Frodm.Move.Delete;
     End Else
       Frodm.Move.Cancel;
end;

procedure TFAnbMov.BeditClick(Sender: TObject);
begin
     BEdit.Enabled:=False;
     If Not(Frodm.Move.State=dsBrowse) Then Exit;
     IF Frodm.MovePerm.Value Then
     Begin
       BEdit.Enabled:=True;
       ShowMessage('ÝÇßÊæÑ ÏÇÆãí ÇÓÊ.ÞÇÈá ÇÕáÇÍ äãí ÈÇÔÏ');
       Exit;
     End;
     EdQu.SQL.Strings[1]:='WHERE I.No = '+FNo.Text;
     EdQu.Open;
     UnDepot;
     Frodm.Move.Edit;
     New:=False;
     BSave.Enabled:=True;
end;

procedure TFAnbMov.Dat1Enter(Sender: TObject);
begin
     If Frodm.Move.State = dsBrowse Then Dat1.ReadOnly :=True Else
     Begin
        Dat1.ReadOnly :=False;
        GetMaskText(Dat1);
     End;
end;

procedure TFAnbMov.Dat1Exit(Sender: TObject);
begin
     If (Frodm.Move.State = dsBrowse) Then Exit;
     SetMaskText(Dat1);
     If(Not Date_Check(Dat1.Text))And(DateToInt(Dat1.Text)>0) Then Dat1.SetFocus Else
       Frodm.MoveDat.Value :=DateToInt(Dat1.Text);
end;

procedure TFAnbMov.IListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If (Key = 27) Then
     Begin
       Goods.SetFocus;
       Goods.SelectedField :=Frodm.MVGIAnbNam;
       IList.Visible :=False;
       Bexit.Cancel :=True;
     End;
end;

procedure TFAnbMov.IListKeyPress(Sender: TObject; var Key: Char);
begin
     If Key =#13 Then
     Begin
      Frodm.MVG.Edit;
      Frodm.MVGIAnbNam.Value:=IList.Items.Strings[IList.ItemIndex];
      Goods.SetFocus;
      Goods.SelectedField :=Frodm.MVGIAnbNam;
      IList.Visible :=False;
      Bexit.Cancel :=True;
     End;
end;


end.
