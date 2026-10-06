unit Remitance;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Mask, Grids, DBGrids, ExtCtrls, PopupListBox, Db,
  DBTables, Buttons, ComCtrls, Menus;

type
  TFRemit = class(TForm)
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
    Dbg2: TDBGrid;
    GList2: TPopupListBox;
    AList2: TPopupListBox;
    CuList2: TPopupListBox;
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

    procedure dbg2ColEnter(Sender: TObject);
    procedure dbg2ColExit(Sender: TObject);
    procedure dbg2DblClick(Sender: TObject);
    procedure dbg2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbg2EditButtonClick(Sender: TObject);
    procedure dbg2Enter(Sender: TObject);
    procedure dbg2KeyPress(Sender: TObject; var Key: Char);
    procedure dbg2KeyDown(Sender: TObject; var Key: Word;
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
    procedure GList2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GList2KeyPress(Sender: TObject; var Key: Char);
    procedure AList2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure AList2KeyPress(Sender: TObject; var Key: Char);
    procedure CuList2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CuList2KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    RNo:Integer;
    BNo:Integer;
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
  FRemit: TFRemit;

implementation

uses ProVar, Routins, MainForm, FrooshDM, RcheqRep, CRoutins, Math;

{$R *.DFM}
Var
  ColumnWidthHelper : TColumnWidthHelper;

function TFRemit.Max_No: Integer;
begin
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Max(I.No) From Remit I ');
     Qu.Open;
     Result:=Qu.Fields[0].AsInteger;
     Qu.Close;
end;

procedure TFRemit.FNo_Exit;
begin
     If Not(Frodm.RM.State =dsBrowse) Then
     Begin
       FNo.Text :=IntToStr(Frodm.RMNo.Value);
       Exit;
     End;
     RNo:=StrToInt(FNo.Text);
     If Not(Frodm.RM.Locate('No',RNo,[loCaseInsensitive])) Then NewRec;// Else BeditClick(Owner);
     Dat1.Text:=IntToDate(Frodm.RMDat.AsInteger);
end;

procedure TFRemit.NewRec;
begin
     Frodm.RM.Append;
     Frodm.RMNo.Value:=Max_No+1;
     Frodm.RMDat.Value:=Fardate;
     Frodm.RMLPerm.Value:=False;
     Frodm.RM.Post;
     Frodm.RM.Edit;
     BSave.Enabled:=True;
     BEdit.Enabled:=False;
     New:=True;
     FNo.Text:=Frodm.RMNo.AsString;
     Dat1.Text:=IntToDate(Frodm.RMDat.AsInteger);
     RNo:=Frodm.RMNo.Value
end;

procedure TFRemit.CancelEdit;
Var
I,J:Integer;
begin
     If (Frodm.RM.Filtered=False)or(EDQu.RecordCount = 0)or(EDQu.Active =False) Then Exit;
     Frodm.RM.First;
     For I:=1 To Frodm.RMout.RecordCount Do Frodm.RMOut.Delete;
     EdQu.First;
     For I:=1 To EdQu.RecordCount Do
     Begin
      Frodm.RMOut.Append;
      For J:=1 To 16 Do Frodm.RMOut.Fields[J].Value:=EdQu.Fields[J].Value;
      Frodm.RMOut.Post;
      EdQu.Next;
     End;
     EdQu.Close;
     Frodm.RM.Cancel;
     Frodm.RM.First;
     Make_Bill;
     Dat1.Text:=IntToDate(Frodm.RMDat.AsInteger);
     FNo.Text:=Frodm.RMNo.AsString;
end;

Function TFRemit.GetSum:Currency;
begin
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Sum(Amount) From RemitOut R Where R.No=:g ');
     Qu.Params[0].Value:=RNo;
     Qu.Open;
     Result:=Qu.Fields[0].AsCurrency;
     Qu.Close;
end;

Procedure TFRemit.DrawList(List:TPopupListBox;Index:Integer);
begin
     List.Visible :=True;
     Bexit.Cancel :=False;
     List.SetFocus;
     List.ItemIndex :=List.Items.IndexOf(dbg.Columns[Index].Field.Text);
     If List.ItemIndex = -1 Then List.ItemIndex:=0;
end;

procedure TFRemit.SetImage;
begin
     Main.glKey.GetBitmap(0,BPrev.Glyph);
     Main.glKey.GetBitmap(1,Bnext.Glyph);
     Main.glKey.GetBitmap(2,BPrint.Glyph);
     Main.glKey.GetBitmap(3,Bedit.Glyph);
     Main.glKey.GetBitmap(8,Bsave.Glyph);
     Main.glKey.GetBitmap(7,BExit.Glyph);
     Main.glKey.GetBitmap(5,Bdel.Glyph);
end;

Procedure TFRemit.CancelFactor(Table1,Table2:TTable);
Var
I:Integer;
begin
     Table2.Cancel;
     If Not Table2.Filtered Then Exit;
     If Table2.RecordCount > 0 Then
         For I:=1 To Table2.RecordCount Do Table2.Delete;
     Table1.Delete;
end;

Procedure TFRemit.Make_Bill;
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
     BTip:=20;
     St:='T/T from Iran by Remmitance No.'+' '+Frodm.RMNo.AsString;
     State:=sABill;
     BehKod:=Frodm.RMAcckod.Value;
     BDat:=Frodm.RMDat.Value;

     Frodm.RMOut.First;
     For I:=1 To Frodm.RMOut.RecordCount Do
     Begin
      //St:='ÏÑíÇÝÊ ˜ ÔãÇÑå'+' '+Frodm.RMBno.AsString+' Øí ÑÓíÏ ÔãÇÑå '+Frodm.RMNo.AsString;
      Net:=Frodm.RMOutPrice.Value;
      CPrice:=Frodm.RMOutAmount.Value;
      Rate:=Frodm.RMOutRate.Value;
      BesKod:=Frodm.RMOutAcckod.Value;
      Ctip:=CurrName(Frodm.RMOutCtip.Value);
      NBNo:=AutoBill(State,BesKod,Behkod,Net,St,Frodm.RMNo.AsString,BNo,BTip,BDat,'',
      Frodm.RMOutCkod.AsInteger,Cprice,Rate,Ctip);
      Frodm.RMOut.Next;
     End;
     Frodm.RMOut.First;

     BesKod:=Frodm.RMAcckod.Value;
     Frodm.RMIn.First;
     For I:=1 To Frodm.RMin.RecordCount Do
     Begin
      //St:='ÏÑíÇÝÊ ˜ ÔãÇÑå'+' '+Frodm.RMBno.AsString+' Øí ÑÓíÏ ÔãÇÑå '+Frodm.RMNo.AsString;
      Net:=Frodm.RMinPrice.Value;
      CPrice:=Frodm.RMInAmount.Value;
      Rate:=Frodm.RMinRate.Value;
      BehKod:=Frodm.RMinAcckod.Value;
      Ctip:=CurrName(Frodm.RMinCtip.Value);
      NBNo:=AutoBill(State,BesKod,Behkod,Net,St,Frodm.RMNo.AsString,BNo,BTip,BDat,'',
      Frodm.RMinCkod.AsInteger,Cprice,Rate,Ctip);
      Frodm.RMin.Next;
     End;
     Frodm.RMin.First;

     If NBNo = BNo Then BillUpdate(BNo) Else
      If sBill Then MakeBill('ÓäÏ ÑãíÊÇäÓ ÔãÇÑå '+Frodm.RMNo.AsString);
     BNo:=NBNo;
end;

procedure TFRemit.NextTab(Sender: TObject; var Key: Char);
begin
     If Key=#13 Then
     Begin
      Key:=#0;
      SelectNext(Sender As TWinControl,True,True);
     End;
end;

procedure TFRemit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Case New Of
     True : IF Check_Factor_State(Frodm.RM,BSaveClick,FormDestroy)=idCancel Then
      Action :=caNone
     Else
      Action:=caFree;
     False:Action:=caFree;
     End;
     If Action = caFree Then
     Begin
      Frodm.RMOut.Filtered:=False;
      Frodm.RMin.Filtered:=False;
      Frodm.RMout.Close;
      Frodm.RMin.Close;
      FRodm.RM.Close;
     End;
end;

procedure TFRemit.FormActivate(Sender: TObject);
begin
     Frodm.RMout.Filtered:=True;
     Frodm.RMin.Filtered:=True;
end;

procedure TFRemit.FormCreate(Sender: TObject);
begin
     SetImage;
     Set_Forms(Self);
     dbg2.Visible:=Dbg2.Enabled;
     EdQu.DatabaseName:=CurrDb;

     FRodm.RM.Open;

     Fill_Popup(Frodm.Cent,'Nam','Kod','',AList);
     Fill_Popup(Frodm.Ctip,'Name','Id','',CuList);
     Fill_Popup(Frodm.UAC,'Acname','AccKod','Userid='+IntTostr(CUser.Id),GList);
     If GList.Items.Count =0 Then   Fill_Popup(Frodm.Ackod,'Nam','AccKod',CCond,GList);

     Fill_Popup(Frodm.Cent,'Nam','Kod','',AList2);
     Fill_Popup(Frodm.Ctip,'Name','Id','',CuList2);
     Fill_Popup(Frodm.UAC,'Acname','AccKod','Userid='+IntTostr(CUser.Id),GList2);
     If GList2.Items.Count =0 Then   Fill_Popup(Frodm.Ackod,'Nam','AccKod',CCond,GList2);

     FAccNam.Items.Assign(CUser.AcList);
     Frodm.RM.Last;
     Frodm.RMout.Open;
     Frodm.RMin.Open;
     FNo.Text:=Frodm.RMNo.AsString;
     Dat1.Text:=IntToDate(Frodm.RMDat.AsInteger);
end;

procedure TFRemit.FormDestroy(Sender: TObject);
begin
     If Frodm.RM.State = dsBrowse Then Exit;
     FNo.SetFocus;
     Case New Of
     True  :Begin
             CancelFactor(Frodm.RM,Frodm.RMOut);
             FNo.Text:=IntToStr(Frodm.RMNo.Value);
             Dat1.Text:=IntToDate(Frodm.RMDat.AsInteger);
            End;
     False : CancelEdit;
     End;
     BSave.Enabled:=False;
     BEdit.Enabled:=True;
end;

procedure TFRemit.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFRemit.FNoKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then FNo_Exit;
     NextTab(Sender,Key);
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;
end;

procedure TFRemit.Dat1Enter(Sender: TObject);
begin
     If Frodm.RM.State = dsBrowse Then Dat1.ReadOnly :=True Else
     Begin
      Dat1.ReadOnly :=False;
      GetMaskText(Dat1);
     End;
end;

procedure TFRemit.Dat1Exit(Sender: TObject);
begin
     If (Frodm.RM.State = dsBrowse) Then Exit;
     SetMaskText(Dat1);
     If(Not Date_Check(Dat1.Text))And(DateToInt(Dat1.Text)>0) Then
      Dat1.SetFocus
     Else
      Frodm.RMdat.Value :=DateToInt(Dat1.Text);
end;

procedure TFRemit.dbgColEnter(Sender: TObject);
begin
     If Frodm.RM.State = dsBrowse Then Exit Else Frodm.RMOut.Edit;
     Case Dbg.SelectedField.Index Of
      2://IF Frodm.RMOutAccKod.Value >0 Then
        // Frodm.RMOutAcnam.Value:=AccNam(Frodm.RMOutAccKod.Value)
       //Else
        DrawList(GList,1);
      4: DrawList(AList,2);
      6: DrawList(CuList,4);
      7: Frodm.RMOutRate.Value:=GetrateatDate(CurrName(Frodm.RMOutCTip.Value),Frodm.RMDat.AsInteger);
      8: Frodm.RMOutPrice.Value:=Frodm.RMOutAmount.Value*Frodm.RMOutRate.Value;
      End;
end;

procedure TFRemit.dbgColExit(Sender: TObject);
begin
     If Frodm.RM.State = dsBrowse Then Exit Else Frodm.RMOut.Edit;
     Case Dbg.SelectedField.Index Of
      1: Begin
          Frodm.RMOutItNo.Value:=Dbg.Row;// Frodm.RMOut.RecNo;
          Frodm.RMOutDat.Value:=Frodm.RMDat.Value;
          Frodm.RMOutNo.Value:=Frodm.RMNo.Value;
         End;
     End;

end;

procedure TFRemit.dbgKeyDown(Sender: TObject; var Key: Word;
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

procedure TFRemit.dbgEnter(Sender: TObject);
begin
     If (Frodm.RM.State = dsBrowse)  Then
      dbg.ReadOnly := True
     Else
      dbg.ReadOnly :=False;
     CuList.Parent:=Dbg;
     dbg.selectedField:=dbg.Columns[0].Field;
end;

procedure TFRemit.dbgKeyPress(Sender: TObject; var Key: Char);
Var
Radif:Integer;
begin
     If Key = #13 Then
     Begin
      Key:=#0;
      GridMove(dbg,Frodm.RM,Radif);
     End;
     If Not(Frodm.RM.State = dsBrowse) Then Frodm.RMout.Edit;
end;

procedure TFRemit.dbgDblClick(Sender: TObject);
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

procedure TFRemit.dbgDrawColumnCell(Sender: TObject; const Rect: TRect;
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

procedure TFRemit.dbgEditButtonClick(Sender: TObject);
begin
     If (Frodm.RM.State In [dsInsert,dsEdit]) Then
     Begin
      Frodm.RMOut.Delete;
      Frodm.RMOut.Edit;
     End;
end;

procedure TFRemit.BprevClick(Sender: TObject);
begin
     If Frodm.RM.State In [dsEdit,dsInsert] Then
     Begin
       FNo.SetFocus;
       IF Check_Factor_State(Frodm.RM,BSaveClick,FormDestroy) = idCancel Then Exit;
       New:=False;
       Exit;
     End;
     Frodm.RM.Refresh;
     Frodm.RM.Prior;
     Dat1.Text:=IntToDate(Frodm.RMDat.AsInteger);
     FNo.Text:=IntToStr(Frodm.RMNo.Value);
     RNo:=Frodm.RMNo.Value;
end;

procedure TFRemit.BnextClick(Sender: TObject);
begin
     If Frodm.RM.State In [dsEdit,dsInsert] Then
     Begin
       FNo.SetFocus;
       IF Check_Factor_State(Frodm.RM,BSaveClick,FormDestroy) = idCancel Then Exit;
       New:=False;
       Exit;
     End;
     Frodm.RM.Refresh;
     Frodm.RM.Next;
     Dat1.Text:=IntToDate(Frodm.RMDat.AsInteger);
     FNo.Text:=IntToStr(Frodm.RMNo.Value);
     RNo:=Frodm.RMNo.Value;
end;

procedure TFRemit.BeditClick(Sender: TObject);
begin
     If Not(Frodm.RM.State = dsBRowse) Then Exit;
     If Frodm.RMlperm.Value Then
     Begin
      Beep;
      ShowMessage('ÞØÚí ÔÏå ÇÓÊ');
      Exit;
     End;
     Dat1.Text:=IntToDate(Frodm.RMDat.AsInteger);
     FAccNam.ItemIndex:=FAccNam.Items.IndexOf(FAccNam.Text);
     RNo:=Frodm.RMNo.AsInteger;
     BNo:=Frodm.RMBno.Value;
     DelBitem(IntToStr(RNo),BNo,20);
     EdQu.Params[0].Value:=RNo;
     EdQu.Open;
     Frodm.RM.Edit;
     New:=False;
     BSave.Enabled:=True;
     BEdit.Enabled:=False;
     Dat1.SetFocus;
end;

procedure TFRemit.BSaveClick(Sender: TObject);
begin
     If (Frodm.RM.State = dsBRowse) Then Exit;
     If Frodm.RM.RecordCount = 0 Then
     Begin
      Frodm.RM.Delete;
      FNo.Text:=Frodm.RMNo.AsString;
      Dat1.Text:=IntToDate(Frodm.RMDat.AsInteger);
      RNo:=Frodm.RMNo.AsInteger;
      New:=False;
     End Else Begin
      //Frodm.RMAccKod.Value:=AccKod(Frodm.RMAcnam.AsString);
      Frodm.RMPsum.Value:=GetSum;
      Frodm.RM.Post;
      Make_Bill;
      FacBillNo(Frodm.RM,Frodm.RMNo.AsInteger,BNo);
     End;
     QuickCloseOpen([72,71,6,24]);
     EdQu.Close;
     Frodm.RM.Locate('No',RNo,[loCaseInsensitive]);
     FNo.Text:=Frodm.RMNo.AsString;
     Dat1.Text:=IntToDate(Frodm.RMDat.AsInteger);
     BSave.Enabled:=False;
     BEdit.Enabled:=True;
     New:=False;
     BNo:=0;
     FNo.SetFocus;
end;

procedure TFRemit.BexitClick(Sender: TObject);
begin
     If Frodm.RM.State In [dsEdit,dsInsert] Then
     Begin
      FNo.SetFocus;
      IF Check_Factor_State(Frodm.RM,BSaveClick,FormDestroy) = idCancel Then Exit;
      Exit;
     End;
     Close;
end;


procedure TFRemit.FAccNamKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Frodm.RM.State = dsBrowse Then Exit;
     If Key = 32 Then
     Begin
      Frodm.RMAcNam.Value:=FindAccount(Frodm.RMAcNam.Value,FindCode);
      Frodm.RMAcckod.AsFloat:=FindCode;
     End;
end;

procedure TFRemit.BNewClick(Sender: TObject);
begin
     If Frodm.RM.State <> dsBrowse Then Exit;
     NewRec;
end;

procedure TFRemit.BDelClick(Sender: TObject);
Var
I:Integer;
begin
     If Not (Frodm.RM.State = dsBrowse) Then Exit;
     If Frodm.RMlPerm.Value Then
     Begin
      Beep;
      ShowMessage('ÞØÚí ÔÏå ÇÓÊ');
      Exit;
     End;
     If MessageDlg('ÑãíÊÇäÓ ÍÐÝ ÑÏÏ¿',mtWarning,mbYesNo,-1) = mrYes Then
      begin
       RNo:=Frodm.RMNo.AsInteger;
       BNo:=Frodm.RMBno.AsInteger;
       DelBItem(IntToStr(RNo),BNo,20);
       BillUpdate(BNo);
       For I:=1 To Frodm.RMOut.RecordCount Do Frodm.RMOut.Delete;
       Frodm.RM.Delete;
       FNo.Text:=Frodm.RMNo.AsString;
       Dat1.Text:=IntToDate(Frodm.RMDat.AsInteger);
     End;
end;

procedure TFRemit.BprintClick(Sender: TObject);
begin
     If Not(Frodm.RM.State = dsBrowse) Then Exit;
     CreatingForm(TQrRcheq,'QrRcheq',QrRcheq);
     Set_Sys_Enviroment;
     QrRcheq.ShowProgress:=True;
     QrRcheq.qrTit.Caption:=InvoLbl;
     //QrRcheq.qrAdd.Caption:=Master;
     QrRcheq.Preview;
//     QrRcheq.Destroy;
end;

procedure TFRemit.FSumEnter(Sender: TObject);
begin
     If (Frodm.RM.State = dsBRowse) Then Exit;
     Frodm.RMPsum.Value:=GetSum;
end;


procedure TFRemit.GListKeyDown(Sender: TObject; var Key: Word;
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

procedure TFRemit.GListKeyPress(Sender: TObject; var Key: Char);
Var
Str:String;
Kod:Real;
begin
     If Key=#13 Then
     Begin
     Key:=#0;
     Str:=Glist.Items.Strings[Glist.ItemIndex];
     Kod:=GList.AcCode[Glist.ItemIndex];// AccKod(Str);
     Frodm.RMOut.Edit;
     Frodm.RMOutAcnam.Value :=Str;
     Frodm.RMOutAcckod.AsFloat :=Kod;
     Frodm.RMOutDat.Value :=Frodm.RMDat.Value;
     Frodm.RMOutNo.Value:=Frodm.RMNo.Value;
     Frodm.RMOut.Post;
     Dbg.SetFocus;
     Dbg.SelectedField := Dbg.Columns[2].Field;
     GList.Visible :=False;
     Bexit.Cancel:=True;
     End;
end;

procedure TFRemit.AListKeyDown(Sender: TObject; var Key: Word;
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

procedure TFRemit.AListKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     begin
      Frodm.RMOut.Edit;
      Frodm.RMOutCKod.AsFloat:=Alist.AcCode[Alist.ItemIndex];//CentKod(Str);
      Frodm.RMOut.Post;
      Dbg.SetFocus;
      Dbg.SelectedField :=Dbg.Columns[3].Field;
      AList.Visible :=False;
      Bexit.Cancel:=True;
     End;
end;

procedure TFRemit.CuListKeyDown(Sender: TObject; var Key: Word;
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

procedure TFRemit.CuListKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     begin
      Frodm.RMOut.Edit;
      Frodm.RMOutCTip.AsFloat:=CuList.AcCode[CuList.ItemIndex];//CentKod(Str);
      Frodm.RMOut.Post;
      Dbg.SetFocus;
      Dbg.SelectedField :=Dbg.Columns[5].Field;
      CuList.Visible :=False;
      Bexit.Cancel:=True;
     End;
end;

//----------------------------------------------------
procedure TFRemit.dbg2ColEnter(Sender: TObject);
begin
     If Frodm.RM.State = dsBrowse Then Exit Else Frodm.RMOut.Edit;
     Case dbg2.SelectedField.Index Of
      2:IF Frodm.RMinAccKod.Value >0 Then
         Frodm.RMinAcnam.Value:=AccNam(Frodm.RMinAccKod.Value)
       Else
        DrawList(GList2,1);
      4: DrawList(AList2,2);
      6: DrawList(CuList2,4);
      7: Frodm.RMinRate.Value:=GetrateatDate(CurrName(Frodm.RMinCTip.Value),Frodm.RMDat.AsInteger);
      8: Frodm.RMinPrice.Value:=Frodm.RMinAmount.Value*Frodm.RMinRate.Value;
      End;
end;

procedure TFRemit.dbg2ColExit(Sender: TObject);
begin
     If Frodm.RM.State = dsBrowse Then Exit Else Frodm.RMin.Edit;
     Case dbg2.SelectedField.Index Of
      1: Begin
          Frodm.RMinItNo.Value:=dbg2.Row;// Frodm.RMin.RecNo;
          Frodm.RMinDat.Value:=Frodm.RMDat.Value;
          Frodm.RMinNo.Value:=Frodm.RMNo.Value;
         End;
     End;

end;

procedure TFRemit.dbg2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key Of
     VK_TAB: If (ssShift in Shift)and(dbg2.Row=1)and(dbg2.SelectedIndex=0) Then
              SelectNext(Sender As TWinControl,Not (ssShift in Shift),True) Else
             If Not(ssShift in Shift)and(dbg2.Row=dbg2.DataSource.DataSet.RecordCount)and
             (dbg2.SelectedIndex=dbg2.Columns.Count-1) Then
              SelectNext(Sender As TWinControl,Not (ssShift in Shift),True);

     End;
end;

procedure TFRemit.dbg2Enter(Sender: TObject);
begin
     If (Frodm.RM.State = dsBrowse)  Then
      dbg2.ReadOnly := True
     Else
      dbg2.ReadOnly :=False;
     CuList.Parent:=Dbg2;
     dbg2.selectedField:=dbg2.Columns[0].Field;
end;

procedure TFRemit.dbg2KeyPress(Sender: TObject; var Key: Char);
Var
Radif:Integer;
begin
     If Key = #13 Then
     Begin
      Key:=#0;
      GridMove(dbg2,Frodm.RM,Radif);
     End;
     If Not(Frodm.RM.State = dsBrowse) Then Frodm.RMin.Edit;
end;

procedure TFRemit.dbg2DblClick(Sender: TObject);
Var
mouseInGrid : TPoint;
gridCoord: TGridCoord;
begin
     mouseInGrid := dbg2.ScreenToClient(Mouse.CursorPos);
     gridCoord := dbg2.MouseCoord(mouseInGrid.X, mouseInGrid.Y);
     if not (dgTitles in dbg2.Options) then Exit;
     if gridCoord.Y <> 0 then Exit;
//find Column index
     if dgIndicator in dbg2.Options then
      ColumnWidthHelper.Index :=  -1 + gridCoord.x
     else
      ColumnWidthHelper.Index := gridCoord.x;
     if ColumnWidthHelper.Index < 0 then Exit;
     ColumnWidthHelper.MaxWidth := -1;
     dbg2.Repaint;
//"auto size" Column width
     dbg2.Columns[ColumnWidthHelper.Index].Width := 4 + ColumnWidthHelper.MaxWidth;
end;

procedure TFRemit.dbg2DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  DrawState: Integer;
  DrawRect: TRect;
begin
  if DataCol = ColumnWidthHelper.Index then
  begin
   if Assigned(Column.Field) then
   ColumnWidthHelper.MaxWidth := Max(ColumnWidthHelper.MaxWidth, dbg2.Canvas.TextWidth(Column.Field.DisplayText));
  end;
  if (Column.Field.FieldName ='Ckod' ) then
  Begin
   DrawRect:=Rect;
   dbg2.Canvas.FillRect(DrawRect);
   If Not Column.Field.IsNull Then
   dbg2.Canvas.Textout(DrawRect.Left+4,DrawRect.Top,CentName(Column.Field.Value));
  End;
  if (Column.Field.FieldName ='Ctip' ) then
  Begin
   DrawRect:=Rect;
   dbg2.Canvas.FillRect(DrawRect);
   If Not Column.Field.IsNull Then
   dbg2.Canvas.Textout(DrawRect.Left+4,DrawRect.Top,CurrName(Column.Field.Value));
  End;
end;

procedure TFRemit.dbg2EditButtonClick(Sender: TObject);
begin
     If (Frodm.RM.State In [dsInsert,dsEdit]) Then
     Begin
      Frodm.RMin.Delete;
      Frodm.RMin.Edit;
     End;
end;

procedure TFRemit.GList2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key = 27 Then
     Begin
      dbg2.SetFocus;
      dbg2.SelectedField :=Dbg2.Columns[1].Field;
      GList2.Visible :=False;
      Bexit.Cancel :=True;
     End;
end;

procedure TFRemit.GList2KeyPress(Sender: TObject; var Key: Char);
Var
Str:String;
Kod:Real;
begin
     If Key=#13 Then
     Begin
     Key:=#0;
     Str:=Glist2.Items.Strings[Glist2.ItemIndex];
     Kod:=GList2.AcCode[Glist2.ItemIndex];// AccKod(Str);
     Frodm.RMin.Edit;
     Frodm.RMinAcnam.Value :=Str;
     Frodm.RMinAcckod.AsFloat :=Kod;
     Frodm.RMinDat.Value :=Frodm.RMDat.Value;
     Frodm.RMinNo.Value:=Frodm.RMNo.Value;
     Frodm.RMin.Post;
     Dbg2.SetFocus;
     Dbg2.SelectedField := Dbg2.Columns[2].Field;
     GList2.Visible :=False;
     Bexit.Cancel:=True;
     End;
end;

procedure TFRemit.AList2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key = 27 Then
     Begin
      Dbg2.SetFocus;
      Dbg2.SelectedField :=Dbg2.Columns[2].Field;
      AList2.Visible :=False;
      BExit.Cancel:=True;
     End;
end;

procedure TFRemit.AList2KeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     begin
      Frodm.RMin.Edit;
      Frodm.RMinCKod.AsFloat:=Alist2.AcCode[Alist2.ItemIndex];//CentKod(Str);
      Frodm.RMin.Post;
      Dbg2.SetFocus;
      Dbg2.SelectedField :=Dbg2.Columns[3].Field;
      AList2.Visible :=False;
      Bexit.Cancel:=True;
     End;
end;

procedure TFRemit.CuList2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key = 27 Then
     Begin
      Dbg2.SetFocus;
      Dbg2.SelectedField :=Dbg2.Columns[4].Field;
      Dbg2.Visible :=False;
      BExit.Cancel:=True;
     End;
end;

procedure TFRemit.CuList2KeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     begin
      Frodm.RMin.Edit;
      Frodm.RMinCTip.AsFloat:=CuList2.AcCode[CuList2.ItemIndex];//CentKod(Str);
      Frodm.RMin.Post;
      Dbg2.SetFocus;
      Dbg2.SelectedField :=Dbg2.Columns[5].Field;
      CuList2.Visible :=False;
      Bexit.Cancel:=True;
     End;
end;

end.
