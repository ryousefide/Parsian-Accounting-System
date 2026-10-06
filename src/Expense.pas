unit Expense;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Mask, Grids, DBGrids, ExtCtrls, PopupListBox, Db,
  DBTables, Buttons, ComCtrls, Menus;

type
  TFExpense = class(TForm)
    Label1: TLabel;
    FNo: TEdit;
    Label2: TLabel;
    Dat1: TMaskEdit;
    Label4: TLabel;
    FAccNam: TDBComboBox;
    dbg: TDBGrid;
    Bevel2: TBevel;
    BSave: TBitBtn;
    Bexit: TBitBtn;
    Bedit: TBitBtn;
    Bprev: TBitBtn;
    Bnext: TBitBtn;
    Bprint: TBitBtn;
    EdQu: TQuery;
    FSum: TDBEdit;
    Label5: TLabel;
    BNew: TBitBtn;
    BDel: TBitBtn;
    Sb: TStatusBar;
    DBCheckBox1: TDBCheckBox;
    Label3: TLabel;
    FDes: TDBEdit;
    GList: TPopupListBox;
    AList: TPopupListBox;
    CuList: TPopupListBox;
    procedure NextTab(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FNoKeyPress(Sender: TObject; var Key: Char);
    procedure BeditClick(Sender: TObject);
    procedure Dat1Enter(Sender: TObject);
    procedure Dat1Exit(Sender: TObject);

    procedure dbgColEnter(Sender: TObject);
    procedure dbgColExit(Sender: TObject);
    procedure dbgDblClick(Sender: TObject);
    procedure dbgDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgEditButtonClick(Sender: TObject);
    procedure dbgEnter(Sender: TObject);
    procedure dbgKeyPress(Sender: TObject; var Key: Char);
    procedure dbgKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

    procedure FormActivate(Sender: TObject);
    procedure BprevClick(Sender: TObject);
    procedure BnextClick(Sender: TObject);
    procedure BSaveClick(Sender: TObject);
    procedure BexitClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FAccNamKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BNewClick(Sender: TObject);
    procedure BDelClick(Sender: TObject);
    procedure BprintClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FSumEnter(Sender: TObject);
    procedure GListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GListKeyPress(Sender: TObject; var Key: Char);
    procedure AListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure AListKeyPress(Sender: TObject; var Key: Char);
    procedure CuListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CuListKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    RNo:Integer;
    BNo:Integer;
    Radif:Integer;
    New:Boolean;
    Rate:Currency;
    Function Max_No:Integer;
    Procedure FNo_Exit;
    Procedure NewRec;
    Procedure CancelEdit;
    Function GetSum:Currency;
    Procedure DrawList(List:TPopupListBox;Index:Integer);
    Procedure SetImage;
    Procedure CancelFactor(Table1,Table2:TTable);
    Procedure Make_Bill;
  public
    { Public declarations }
    SNo:Integer;
    Name:String;
  end;

var
  FExpense: TFExpense;

implementation

uses ProVar, Routins, MainForm, FrooshDM, CRoutins, Math;

{$R *.DFM}
Var
  ColumnWidthHelper : TColumnWidthHelper;

function TFExpense.Max_No: Integer;
begin
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Max(I.No) From Expen I ');
     Qu.Open;
     Result:=Qu.Fields[0].AsInteger;
     Qu.Close;
end;

procedure TFExpense.FNo_Exit;
begin
     If Not(Frodm.Exp.State =dsBrowse) Then
     Begin
       FNo.Text :=IntToStr(Frodm.ExpNo.Value);
       Exit;
     End;
     RNo:=StrToInt(FNo.Text);
     If Not(Frodm.Exp.Locate('No',RNo,[loCaseInsensitive])) Then NewRec;// Else BeditClick(Owner);
     Dat1.Text:=IntToDate(Frodm.ExpDat.AsInteger);
end;

procedure TFExpense.NewRec;
begin
     Frodm.Exp.Append;
     Frodm.ExpNo.Value:=Max_No+1;
     Frodm.ExpDat.Value:=Fardate;
     Frodm.ExpLPerm.Value:=False;
     Frodm.Exp.Post;
     Frodm.Exp.Edit;
     BSave.Enabled:=True;
     BEdit.Enabled:=False;
     New:=True;
     FNo.Text:=Frodm.ExpNo.AsString;
     Dat1.Text:=IntToDate(Frodm.ExpDat.AsInteger);
     RNo:=Frodm.ExpNo.Value
end;

procedure TFExpense.CancelEdit;
Var
I,J:Integer;
begin
     If (Frodm.ExpD.Filtered=False)or(EDQu.RecordCount = 0)or(EDQu.Active =False) Then Exit;
     Frodm.ExpD.First;
     For I:=1 To Frodm.ExpD.RecordCount Do Frodm.ExpD.Delete;
     EdQu.First;
     For I:=1 To EdQu.RecordCount Do
     Begin
      Frodm.ExpD.Append;
      For J:=1 To 11 Do Frodm.ExpD.Fields[J].Value:=EdQu.Fields[J].Value;
      Frodm.ExpD.Post;
      EdQu.Next;
     End;
     EdQu.Close;
     Frodm.Exp.Cancel;
     Frodm.Exp.First;
     Make_Bill;
     Dat1.Text:=IntToDate(Frodm.ExpDat.AsInteger);
     FNo.Text:=Frodm.ExpNo.AsString;
end;

Function TFExpense.GetSum:Currency;
begin
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Sum(Amount) From ExpenD R Where R.No=:g ');
     Qu.Params[0].Value:=RNo;
     Qu.Open;
     Result:=Qu.Fields[0].AsCurrency;
     Qu.Close;
end;

Procedure TFExpense.DrawList(List:TPopupListBox;Index:Integer);
begin
     List.Visible :=True;
     Bexit.Cancel :=False;
     List.SetFocus;
     List.ItemIndex :=List.Items.IndexOf(dbg.Columns[Index].Field.Text);
     If List.ItemIndex = -1 Then List.ItemIndex:=0;
end;

procedure TFExpense.SetImage;
begin
     Main.glKey.GetBitmap(0,BPrev.Glyph);
     Main.glKey.GetBitmap(1,Bnext.Glyph);
     Main.glKey.GetBitmap(2,BPrint.Glyph);
     Main.glKey.GetBitmap(3,Bedit.Glyph);
     Main.glKey.GetBitmap(8,Bsave.Glyph);
     Main.glKey.GetBitmap(7,BExit.Glyph);
     Main.glKey.GetBitmap(5,Bdel.Glyph);
end;

Procedure TFExpense.CancelFactor(Table1,Table2:TTable);
Var
I:Integer;
begin
     Table2.Cancel;
     If Not Table2.Filtered Then Exit;
     If Table2.RecordCount > 0 Then
         For I:=1 To Table2.RecordCount Do Table2.Delete;
     Table1.Delete;
end;

Procedure TFExpense.Make_Bill;
Var
I:Integer;
BesKod:Real;
BehKod:Real;
Net,Rate:Currency;
BTip,NBNo,BDat:Integer;
St,Ctip:String;
CPrice:Currency;
State:Boolean;
begin
     BTip:=22;
     St:='’Ê—   ‰ŒÊ«Â ‘„«—Â '+' '+Frodm.ExpNo.AsString;
     State:=sABill;
     BesKod:=Frodm.ExpAcckod.Value;
     BDat:=Frodm.ExpDat.Value;
     Net:=Frodm.ExpPsum.Value;
     Rate:=1;
     AutoBill(State,BesKod,0,Net,St,Frodm.ExpNo.AsString,BNo,BTip,BDat,Frodm.ExpCost.Value,
      0,Net,Rate,DefaultCurr);

     Frodm.ExpD.First;
     For I:=1 To Frodm.ExpD.RecordCount Do
     Begin
      Frodm.ExpD.Edit;
      Frodm.ExpDItNo.Value:=I;
      Frodm.ExpD.Post;
      Net:=Frodm.ExpDPrice.Value;
      CPrice:=Frodm.ExpDAmount.Value;
      Rate:=Frodm.ExpDRate.Value;
      BehKod:=Frodm.ExpDAcckod.Value;
      Ctip:=CurrName(Frodm.ExpDCtip.Value);
      St:='’Ê—   ‰ŒÊ«Â ‘„«—Â '+' '+Frodm.ExpNo.AsString+' »‘—Õ '+Frodm.ExpDDes.Value;
      NBNo:=AutoBill(State,0,Behkod,Net,St,Frodm.ExpNo.AsString,BNo,BTip,BDat,'',
      Frodm.ExpDCkod.AsInteger,Cprice,Rate,Ctip);
      Frodm.ExpD.Next;
     End;
     Frodm.ExpD.First;

     BesKod:=Frodm.ExpAcckod.Value;

     If NBNo = BNo Then BillUpdate(BNo) Else
      If sBill Then MakeBill('”‰œ —„Ì «‰” ‘„«—Â '+Frodm.ExpNo.AsString);
     BNo:=NBNo;
end;

procedure TFExpense.NextTab(Sender: TObject; var Key: Char);
begin
     If Key=#13 Then
     Begin
      Key:=#0;
      SelectNext(Sender As TWinControl,True,True);
     End;
end;

procedure TFExpense.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Case New Of
     True : IF Check_Factor_State(Frodm.Exp,BSaveClick,FormDestroy)=idCancel Then
      Action :=caNone
     Else
      Action:=caFree;
     False:Action:=caFree;
     End;
     If Action = caFree Then
     Begin
      Frodm.ExpD.Filtered:=False;
      Frodm.ExpD.Close;
      Frodm.EXP.Close;
     End;
end;

procedure TFExpense.FormActivate(Sender: TObject);
begin
     Frodm.ExpD.Filtered:=True;
end;

procedure TFExpense.FormCreate(Sender: TObject);
begin
     SetImage;
     Set_Forms(Self);
     EdQu.DatabaseName:=CurrDb;
     Radif:=1;
     Frodm.ExpD.open;
     Frodm.EXP.Open;

     Fill_Popup(Frodm.Cent,'Nam','Kod','',AList);
     Fill_Popup(Frodm.Ctip,'Name','Id','',CuList);
     Fill_Popup(Frodm.UAC,'Acname','AccKod','Userid='+IntTostr(CUser.Id),GList);
     If GList.Items.Count =0 Then   Fill_Popup(Frodm.Ackod,'Nam','AccKod',CCond,GList);


     FAccNam.Items.Assign(CUser.AcList);
     Frodm.Exp.Last;
     FNo.Text:=Frodm.ExpNo.AsString;
     Dat1.Text:=IntToDate(Frodm.ExpDat.AsInteger);
end;

procedure TFExpense.FormDestroy(Sender: TObject);
begin
     If Frodm.Exp.State = dsBrowse Then Exit;
     FNo.SetFocus;
     Case New Of
     True  :Begin
             CancelFactor(Frodm.Exp,Frodm.ExpD);
             FNo.Text:=IntToStr(Frodm.ExpNo.Value);
             Dat1.Text:=IntToDate(Frodm.ExpDat.AsInteger);
            End;
     False : CancelEdit;
     End;
     BSave.Enabled:=False;
     BEdit.Enabled:=True;
end;

procedure TFExpense.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key Of
      VK_F3: BsaveClick(Sender);
      VK_INSERT:BNewClick(Sender);
      VK_DELETE:If (Shift = [ssCtrl])and BDel.Enabled Then BDelClick(Sender);
      VK_RETURN:If (Shift = [ssAlt]) and BEdit.Enabled Then BEditClick(Sender);
      VK_Left  :If (Shift = [ssAlt])and BPrev.Enabled Then BprevClick(Sender);
      VK_RIGHT :If (Shift = [ssAlt])and BNext.Enabled Then BnextClick(Sender);
      End;
end;

procedure TFExpense.FNoKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then FNo_Exit;
     NextTab(Sender,Key);
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;
end;

procedure TFExpense.Dat1Enter(Sender: TObject);
begin
     If Frodm.Exp.State = dsBrowse Then Dat1.ReadOnly :=True Else
     Begin
      Dat1.ReadOnly :=False;
      GetMaskText(Dat1);
     End;
end;

procedure TFExpense.Dat1Exit(Sender: TObject);
begin
     If (Frodm.Exp.State = dsBrowse) Then Exit;
     SetMaskText(Dat1);
     If(Not Date_Check(Dat1.Text))And(DateToInt(Dat1.Text)>0) Then
      Dat1.SetFocus
     Else
      Frodm.Expdat.Value :=DateToInt(Dat1.Text);
end;

procedure TFExpense.dbgColEnter(Sender: TObject);
begin
     If Frodm.Exp.State = dsBrowse Then Exit Else Frodm.ExpD.Edit;
     Case Dbg.SelectedField.Index Of
      2: DrawList(GList,1);
      4: Begin// DrawList(AList,2);
         If sCent Then
          Fill_Popup(Frodm.Cent,'Nam','Kod',' Grop In (Select Grop From CPerm Where AcKod='+Frodm.ExpDAcckod.AsString+')',Alist);
          DrawList(AList,2);
         End;
      6: DrawList(CuList,4);
      7: Frodm.ExpDRate.Value:=GetrateatDate(CurrName(Frodm.ExpDCTip.Value),Frodm.ExpDat.AsInteger);
      8: Frodm.ExpDPrice.Value:=Frodm.ExpDAmount.Value*Frodm.ExpDRate.Value;
      End;
end;

procedure TFExpense.dbgColExit(Sender: TObject);
begin
     If Frodm.Exp.State = dsBrowse Then Exit Else Frodm.ExpD.Edit;
     Case Dbg.SelectedField.Index Of
      1: Begin
          If Frodm.ExpDItNo.Value = 0 Then Frodm.ExpDItNo.Value:=Radif;//Dbg.Row;// Frodm.ExpD.RecNo;
          Frodm.ExpDDat.Value:=Frodm.ExpDat.Value;
          Frodm.ExpDNo.Value:=Frodm.ExpNo.Value;
          Frodm.ExpD.Post;
          Radif:=Radif+1;
         End;
     End;
     If dbg.Columns[0].Field.Value > 0 Then Radif:=Frodm.ExpDItNo.Value ;
end;

procedure TFExpense.dbgKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key Of
     VK_TAB: If (ssShift in Shift)and(dbg.Row=1)and(dbg.SelectedIndex=0) Then
              SelectNext(Sender As TWinControl,Not (ssShift in Shift),True) Else
             If Not(ssShift in Shift)and(dbg.Row=dbg.DataSource.DataSet.RecordCount)and
             (dbg.SelectedIndex=dbg.Columns.Count-1) Then
              SelectNext(Sender As TWinControl,Not (ssShift in Shift),True);

     End;
end;

procedure TFExpense.dbgEnter(Sender: TObject);
begin
     If (Frodm.Exp.State = dsBrowse)  Then
      dbg.ReadOnly := True
     Else
      dbg.ReadOnly :=False;
     CuList.Parent:=Dbg;
     dbg.selectedField:=dbg.Columns[0].Field;
end;

procedure TFExpense.dbgKeyPress(Sender: TObject; var Key: Char);
Var
Radif:Integer;
begin
     If Key = #13 Then
     Begin
      Key:=#0;
      GridMove(dbg,Frodm.Exp,Radif);
     End;
     If Not(Frodm.Exp.State = dsBrowse) Then Frodm.ExpD.Edit;
end;

procedure TFExpense.dbgDblClick(Sender: TObject);
Var
mouseInGrid : TPoint;
gridCoord: TGridCoord;
begin
     mouseInGrid := Dbg.ScreenToClient(Mouse.CursorPos);
     gridCoord := Dbg.MouseCoord(mouseInGrid.X, mouseInGrid.Y);
     if not (dgTitles in Dbg.Options) then Exit;
     if gridCoord.Y <> 0 then Exit;
//find Column index
     if dgIndicator in Dbg.Options then
      ColumnWidthHelper.Index :=  -1 + gridCoord.x
     else
      ColumnWidthHelper.Index := gridCoord.x;
     if ColumnWidthHelper.Index < 0 then Exit;
     ColumnWidthHelper.MaxWidth := -1;
     Dbg.Repaint;
//"auto size" Column width
     Dbg.Columns[ColumnWidthHelper.Index].Width := 4 + ColumnWidthHelper.MaxWidth;
end;

procedure TFExpense.dbgDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  DrawState: Integer;
  DrawRect: TRect;
begin
  if DataCol = ColumnWidthHelper.Index then
  begin
   if Assigned(Column.Field) then
   ColumnWidthHelper.MaxWidth := Max(ColumnWidthHelper.MaxWidth, Dbg.Canvas.TextWidth(Column.Field.DisplayText));
  end;
  if (Column.Field.FieldName ='Ckod' ) then
  Begin
   DrawRect:=Rect;
   Dbg.Canvas.FillRect(DrawRect);
   If Not Column.Field.IsNull Then
   Dbg.Canvas.Textout(DrawRect.Left+4,DrawRect.Top,CentName(Column.Field.Value));
  End;
  if (Column.Field.FieldName ='Ctip' ) then
  Begin
   DrawRect:=Rect;
   Dbg.Canvas.FillRect(DrawRect);
   If Not Column.Field.IsNull Then
   Dbg.Canvas.Textout(DrawRect.Left+4,DrawRect.Top,CurrName(Column.Field.Value));
  End;
end;

procedure TFExpense.dbgEditButtonClick(Sender: TObject);
begin
     If (Frodm.Exp.State In [dsInsert,dsEdit]) Then
     Begin
      Frodm.ExpD.Delete;
      Frodm.ExpD.Edit;
     End;
end;

procedure TFExpense.BprevClick(Sender: TObject);
begin
     If Frodm.Exp.State In [dsEdit,dsInsert] Then
     Begin
       FNo.SetFocus;
       IF Check_Factor_State(Frodm.Exp,BSaveClick,FormDestroy) = idCancel Then Exit;
       New:=False;
       Exit;
     End;
     Frodm.Exp.Refresh;
     Frodm.Exp.Prior;
     Dat1.Text:=IntToDate(Frodm.ExpDat.AsInteger);
     FNo.Text:=IntToStr(Frodm.ExpNo.Value);
     RNo:=Frodm.ExpNo.Value;
end;

procedure TFExpense.BnextClick(Sender: TObject);
begin
     If Frodm.Exp.State In [dsEdit,dsInsert] Then
     Begin
       FNo.SetFocus;
       IF Check_Factor_State(Frodm.Exp,BSaveClick,FormDestroy) = idCancel Then Exit;
       New:=False;
       Exit;
     End;
     Frodm.Exp.Refresh;
     Frodm.Exp.Next;
     Dat1.Text:=IntToDate(Frodm.ExpDat.AsInteger);
     FNo.Text:=IntToStr(Frodm.ExpNo.Value);
     RNo:=Frodm.ExpNo.Value;
end;

procedure TFExpense.BeditClick(Sender: TObject);
begin
     If Not(Frodm.Exp.State = dsBRowse) Then Exit;
     BNo:=Frodm.ExpBno.Value;
     If (Frodm.Explperm.Value)or(IsBillLocked(BNO)) Then
     Begin
      Beep;
      ShowMessage(sLocked);
      Exit;
     End;
     Dat1.Text:=IntToDate(Frodm.ExpDat.AsInteger);
     FAccNam.ItemIndex:=FAccNam.Items.IndexOf(FAccNam.Text);
     RNo:=Frodm.ExpNo.AsInteger;
     
     DelBitem(IntToStr(RNo),BNo,22);
     EdQu.Params[0].Value:=RNo;
     EdQu.Open;
     Frodm.Exp.Edit;
     New:=False;
     BSave.Enabled:=True;
     BEdit.Enabled:=False;
     Dat1.SetFocus;
end;

procedure TFExpense.BSaveClick(Sender: TObject);
begin
     If (Frodm.Exp.State = dsBRowse) Then Exit;
     If Frodm.Exp.RecordCount = 0 Then
     Begin
      Frodm.Exp.Delete;
      FNo.Text:=Frodm.ExpNo.AsString;
      Dat1.Text:=IntToDate(Frodm.ExpDat.AsInteger);
      RNo:=Frodm.ExpNo.AsInteger;
      New:=False;
     End Else Begin
//      Frodm.ExpAccKod.Value:=AccKod(Frodm.ExpAccnam.AsString);
      Frodm.ExpPsum.Value:=GetSum;
      Frodm.Exp.Post;
      Make_Bill;
      FacBillNo(Frodm.Exp,Frodm.ExpNo.AsInteger,BNo);
     End;
     QuickCloseOpen([75,76,6,24]);
     EdQu.Close;
     Frodm.Exp.Locate('No',RNo,[loCaseInsensitive]);
     FNo.Text:=Frodm.ExpNo.AsString;
     Dat1.Text:=IntToDate(Frodm.ExpDat.AsInteger);
     BSave.Enabled:=False;
     BEdit.Enabled:=True;
     New:=False;
     BNo:=0;
     Radif:=1;
     FNo.SetFocus;
end;

procedure TFExpense.BexitClick(Sender: TObject);
begin
     If Frodm.Exp.State In [dsEdit,dsInsert] Then
     Begin
      FNo.SetFocus;
      IF Check_Factor_State(Frodm.Exp,BSaveClick,FormDestroy) = idCancel Then Exit;
      Exit;
     End;
     Close;
end;


procedure TFExpense.FAccNamKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Frodm.Exp.State = dsBrowse Then Exit;
     If Key = 32 Then
     Begin
      Frodm.ExpAccNam.Value:=FindAccount(Frodm.ExpAccNam.Value,FindCode);
      Frodm.ExpAcckod.AsFloat:=FindCode;
     End;
end;

procedure TFExpense.BNewClick(Sender: TObject);
begin
     If Frodm.Exp.State <> dsBrowse Then Exit;
     NewRec;
end;

procedure TFExpense.BDelClick(Sender: TObject);
Var
I:Integer;
begin
     If Not (Frodm.Exp.State = dsBrowse) Then Exit;
     If Frodm.ExplPerm.Value Then
     Begin
      Beep;
      ShowMessage('ﬁÿ⁄Ì ‘œÂ «” ');
      Exit;
     End;
     If MessageDlg('—„Ì «‰” Õ–› ê—œœø',mtWarning,mbYesNo,-1) = mrYes Then
      begin
       RNo:=Frodm.ExpNo.AsInteger;
       BNo:=Frodm.ExpBno.AsInteger;
       DelBItem(IntToStr(RNo),BNo,22);
       BillUpdate(BNo);
       For I:=1 To Frodm.ExpD.RecordCount Do Frodm.ExpD.Delete;
       Frodm.Exp.Delete;
       FNo.Text:=Frodm.ExpNo.AsString;
       Dat1.Text:=IntToDate(Frodm.ExpDat.AsInteger);
     End;
end;

procedure TFExpense.BprintClick(Sender: TObject);
begin
{     If Not(Frodm.Exp.State = dsBrowse) Then Exit;
     CreatingForm(TQrRcheq,'QrRcheq',QrRcheq);
     Set_Sys_Enviroment;
     QrRcheq.ShowProgress:=True;
     QrRcheq.qrTit.Caption:=InvoLbl;
     //QrRcheq.qrAdd.Caption:=Master;
     QrRcheq.Preview;
     QrRcheq.Destroy;}
end;

procedure TFExpense.FSumEnter(Sender: TObject);
begin
     If (Frodm.Exp.State = dsBRowse) Then Exit;
     Frodm.ExpPsum.Value:=GetSum;
end;


procedure TFExpense.GListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key = 27 Then
     Begin
      dbg.SetFocus;
      dbg.SelectedField :=Dbg.Columns[1].Field;
      GList.Visible :=False;
      Bexit.Cancel :=True;
     End;
end;

procedure TFExpense.GListKeyPress(Sender: TObject; var Key: Char);
Var
Str:String;
Kod:Real;
begin
     If Key=#13 Then
     Begin
     Key:=#0;
     Str:=Glist.Items.Strings[Glist.ItemIndex];
     Kod:=GList.AcCode[Glist.ItemIndex];// AccKod(Str);
     Frodm.ExpD.Edit;
     Frodm.ExpDAcnam.Value :=Str;
     Frodm.ExpDAcckod.AsFloat :=Kod;
     Frodm.ExpDDat.Value :=Frodm.ExpDat.Value;
     Frodm.ExpDNo.Value:=Frodm.ExpNo.Value;
     Frodm.ExpD.Post;
     Dbg.SetFocus;
     Dbg.SelectedField := Dbg.Columns[2].Field;
     GList.Visible :=False;
     Bexit.Cancel:=True;
     End;
end;

procedure TFExpense.AListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key = 27 Then
     Begin
      Dbg.SetFocus;
      Dbg.SelectedField :=Dbg.Columns[2].Field;
      AList.Visible :=False;
      BExit.Cancel:=True;
     End;
end;

procedure TFExpense.AListKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     begin
      Frodm.ExpD.Edit;
      Frodm.ExpDCKod.AsFloat:=Alist.AcCode[Alist.ItemIndex];//CentKod(Str);
      Frodm.ExpD.Post;
      Dbg.SetFocus;
      Dbg.SelectedField :=Dbg.Columns[3].Field;
      AList.Visible :=False;
      Bexit.Cancel:=True;
     End;
end;

procedure TFExpense.CuListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key = 27 Then
     Begin
      Parent.SetFocus;
      Dbg.SelectedField :=Dbg.Columns[4].Field;
      Dbg.Visible :=False;
      BExit.Cancel:=True;
     End;
end;

procedure TFExpense.CuListKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     begin
      Frodm.ExpD.Edit;
      Frodm.ExpDCTip.AsFloat:=CuList.AcCode[CuList.ItemIndex];//CentKod(Str);
      Frodm.ExpD.Post;
      Dbg.SetFocus;
      Dbg.SelectedField :=Dbg.Columns[5].Field;
      CuList.Visible :=False;
      Bexit.Cancel:=True;
     End;
end;

//----------------------------------------------------
end.
