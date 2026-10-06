unit Arshiv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls,Db,DbTables,
  DBCtrls;

type
  TFArsh = class(TForm)
    tvDay: TTreeView;
    BGrid: TDBGrid;
    Panel1: TPanel;
    Sp1: TSpeedButton;
    Sp2: TSpeedButton;
    spBill: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Sd: TEdit;
    Ed: TEdit;
    ud1: TUpDown;
    Ud2: TUpDown;
    Splitter1: TSplitter;
    Cb1: TCheckBox;
    Label3: TLabel;
    FNo: TEdit;
    FCurrDb: TComboBox;
    spMove: TSpeedButton;
    Button1: TButton;
    Sp3: TSpeedButton;
    BQu: TQuery;
    sp4: TSpeedButton;
    sp5: TSpeedButton;
    FBTip: TDBLookupComboBox;
    SP6: TSpeedButton;
    sp7: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure tvDayClick(Sender: TObject);
    procedure BGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure tvDayKeyPress(Sender: TObject; var Key: Char);
    procedure Sp1Click(Sender: TObject);
    procedure Sp2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure spBillClick(Sender: TObject);
    procedure BGridKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure Cb1Click(Sender: TObject);
    procedure FNoKeyPress(Sender: TObject; var Key: Char);
    procedure FNoChange(Sender: TObject);
    procedure spMoveClick(Sender: TObject);
    procedure FCurrDbEnter(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Sp3Click(Sender: TObject);
    procedure sp4Click(Sender: TObject);
    procedure sp5Click(Sender: TObject);
    procedure FBTipCloseUp(Sender: TObject);
    procedure FBTipDropDown(Sender: TObject);
    procedure FBTipKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SP6Click(Sender: TObject);
    procedure BGridDblClick(Sender: TObject);
    procedure sp7Click(Sender: TObject);
  private
    { Private declarations }
    Year:Integer;
    MYear:Integer;
    Mon:Integer;
    St,En:Integer;
    Procedure MoveBills(Table:TTable);
    Function MaxNo(Alias:String):Integer;
    Procedure UpdateBNo(NewNo:Integer;TName:TTable;BFieldName,FacField:String;FacNo:Variant);
    Procedure ChangeBillNo(BillNo,NewNo:Integer);
    Procedure SetImage;
  public
    { Public declarations }
  end;

var
  FArsh: TFArsh;

implementation

uses Routins, FrooshDM, ProVar, MainForm, Bill, Converts, Math, ArshivD;

var
  ColumnWidthHelper : TColumnWidthHelper;
{$R *.DFM}
Procedure TFArsh.MoveBills(Table:TTable);
Var
I,J:Integer;
MNo:Integer;
begin
     Table.TableName:='Bill';
     Table.Open;
     If Table.Locate('No',Frodm.BillNo.Value,[loCaseInsensitive]) Then
     Begin
      Table.Close;
      Exit;
     End;
     MNo:=MaxNo(Table.DatabaseName)+1;
     Table.Append;
     For I:=0 To Frodm.Bill.FieldDefs.Count-1 Do
      Table.Fields[I].Value:=Frodm.Bill.Fields[i].Value;
     Table.FieldByName('No').AsInteger:=MNo;
     Table.Post;
     Table.Close;
     Table.TableName:='AcountBill';
     Table.Open;
     Frodm.AcBill.Filter:='No= '+Frodm.BillNo.AsString;
     Frodm.AcBill.Filtered:=True;
     Frodm.Acbill.First;
     For I:=1 To Frodm.Acbill.RecordCount Do
     Begin
      Table.Append;
      For J:=1 To 10 Do
      Table.Fields[J].Value:=Frodm.Acbill.Fields[J].Value;
      Table.FieldByName('No').AsInteger:=MNo;
      Table.Post;
      Frodm.Acbill.Next;
     end;
     Table.Close;
end;

Function TFArsh.MaxNo(Alias:String):Integer;
Var
MQu:TQuery;
Begin
     MQu:=TQuery.Create(Owner);
     MQu.DataBaseName:=Alias;
     MQu.SQL.Clear;
     MQu.SQL.Add('Select Max(I.No) From Bill I ');
     MQu.Open;
     Result:=MQu.Fields[0].AsInteger;
     MQu.Close;
end;

Procedure TFArsh.UpdateBNo(NewNo:Integer;TName:TTable;BFieldName,FacField:String;FacNo:Variant);
begin
     TName.Filtered:=False;
     If  TName.Locate(FacField,FacNo,[loCaseInsensitive]) Then
     Begin
      TName.Edit;
      TName.FieldByName(BFieldName).AsInteger:=NewNo;
      TName.Post;
     End;
end;

Procedure TFArsh.ChangeBillNo(BillNo,NewNo:Integer);
Var
I:Integer;
begin
     If Frodm.Bill.Locate('No',BillNo,[loCaseInsensitive]) Then
     Begin
      Frodm.AcBill.Filter:='No='+IntToStr(BillNo);
      Frodm.Acbill.Filtered:=True;
      For I:=1 To Frodm.Acbill.RecordCount Do
      Begin
       Frodm.Acbill.Edit;
       Frodm.AcbillNo.Value:=-NewNo;
       Case Frodm.AcbillBtip.AsInteger Of
       1:UpdateBNo(-Frodm.AcBillNo.AsInteger,Frodm.Invo,'BNo','No',Frodm.AcbillFacno.Value);
       2:UpdateBNo(-Frodm.AcBillNo.AsInteger,Frodm.RejInvo,'BNo','No',Frodm.AcbillFacno.Value);
       3:UpdateBNo(-Frodm.AcBillNo.AsInteger,Frodm.Binvo,'BNo','No',Frodm.AcbillFacno.Value);
       4:UpdateBNo(-Frodm.AcBillNo.AsInteger,Frodm.RejBinvo,'BNo','No',Frodm.AcbillFacno.Value);
       5:UpdateBNo(-Frodm.AcBillNo.AsInteger,Frodm.RMon,'BNo','No',Frodm.AcbillFacno.Value);
       6:UpdateBNo(-Frodm.AcBillNo.AsInteger,Frodm.PMon,'BNo','No',Frodm.AcbillFacno.Value);
       7:UpdateBNo(-Frodm.AcBillNo.AsInteger,Frodm.Rcheq,'RBNo','BNo',Frodm.AcbillFacno.Value);
       8:UpdateBNo(-Frodm.AcBillNo.AsInteger,Frodm.Rcheq,'PBNo','BNo',Frodm.AcbillFacno.Value);
       9:UpdateBNo(-Frodm.AcBillNo.AsInteger,Frodm.Pcheq,'PBNo','BNo',Frodm.AcbillFacno.Value);
      12:UpdateBNo(-Frodm.AcBillNo.AsInteger,Frodm.BHav,'BNo','No',Frodm.AcbillFacno.Value);
      13:UpdateBNo(-Frodm.AcBillNo.AsInteger,Frodm.NFish,'BNo','No',Frodm.AcbillFacno.Value);
      14:UpdateBNo(-Frodm.AcBillNo.AsInteger,Frodm.Pcheq,'PaNo','BNo',Frodm.AcbillFacno.Value);
      15:UpdateBNo(-Frodm.AcBillNo.AsInteger,Frodm.Rcheq,'VBNo','BNo',Frodm.AcbillFacno.Value);
      //16:UpdateBNo(Frodm.AcBillNo.AsInteger,Frodm.Rcheq,'PBNo','BNo',Frodm.AcbillFacno.Value);
       End;
       Frodm.Acbill.Post;
       Frodm.Acbill.Next;
      End;
      Frodm.Acbill.Filtered:=False;
      Frodm.Bill.Edit;
      Frodm.BillNo.Value:=NewNo;
      Frodm.Bill.Post;
     End;
end;

procedure TFArsh.SetImage;
begin
     Main.glKey.GetBitmap(12,sp1.Glyph);
     Main.glKey.GetBitmap(13,sp2.Glyph);
     Main.glKey.GetBitmap(11,spBill.Glyph);
     Main.glBut.GetBitmap(0,sp7.Glyph);
end;

procedure TFArsh.FormActivate(Sender: TObject);
begin
     If Frodm.Bill.State In [dsEdit,dsInsert] Then FBill.BsaveClick(Sender);
     If Not Frodm.Bill.Active Then Frodm.Acbill.Open;
end;

procedure TFArsh.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Frodm.Bill.Filtered:=False;
     Frodm.Bill.Last;
     Action:=caFree;
end;

procedure TFArsh.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     SetImage;
     Year:=DateToInt(Beg_Date) Div 10000;
     MYear:=DateToInt(End_Date) Div 10000;
     If Year = 0 Then Year:= Fardate Div 10000;
     sp2.Enabled:=CUser.Master;
     sp3.Enabled:=Boss;
     sp4.Enabled:=Boss;
     sp5.Enabled:=Boss;
     sp6.Enabled:=Boss;
     BQu.DatabaseName:=CurrDb;
end;

procedure TFArsh.tvDayClick(Sender: TObject);
Var
Filt:String;
begin
     Mon :=tvDay.Selected.Index+1;
     st:=StrToInt(Sd.Text);
     En:=StrToInt(Ed.Text);
     Frodm.Bill.Filtered:=False;
     IF tvDay.Selected.Level = 0 Then Exit;
     Filt:=' Dat >='+IntToStr(Year*10000+Mon*100+St)+' and Dat <='+IntToStr(Year*10000+Mon*100+En);
     Filt:=Filt+' or (Dat >='+IntToStr(MYear*10000+Mon*100+St)+' and Dat <='+IntToStr(MYear*10000+Mon*100+En)+')';
     Frodm.Bill.Filter:=Filt;
     Frodm.Bill.Filtered:=True;
end;

procedure TFArsh.BGridDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
     if DataCol = ColumnWidthHelper.Index then
     begin
      if Assigned(Column.Field) then
      ColumnWidthHelper.MaxWidth := Max(ColumnWidthHelper.MaxWidth, BGrid.Canvas.TextWidth(Column.Field.DisplayText));
     end;
     If Not(Frodm.BillPerm.Value) Then BGrid.Canvas.Font.Color :=clRed;
     If  (Frodm.BillBedSum.Value <> Frodm.BillBesSum.Value) Then BGrid.Canvas.Brush.Color:=clGray;
     If ((Frodm.BillBedSum.Value=0)and(Frodm.BillBesSum.Value=0))
     or(Frodm.BillTip.Value = 1)  Then BGrid.Canvas.Font.Color :=clGray;
     BGrid.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TFArsh.tvDayKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
      Key :=#0;
      tvDayClick(Sender);
     End;
end;

procedure TFArsh.Sp1Click(Sender: TObject);
Var
I:Integer;
begin
     If BGrid.SelectedRows.Count > 0 Then
      For I:=0 To BGrid.SelectedRows.Count-1 Do
      Begin
        Frodm.Bill.GotoBookmark(Pointer(BGrid.SelectedRows.items[I]));
        Frodm.Bill.Edit;
        Frodm.BillPerm.Value:=True;
        Frodm.Bill.Post;
      End
     Else
     Begin
        Frodm.Bill.Edit;
        Frodm.BillPerm.Value:=True;
        Frodm.Bill.Post;
     End;
end;

procedure TFArsh.Sp2Click(Sender: TObject);
Var
I:Integer;
begin
     If Not Sp2.Enabled Then Exit;
     If BGrid.SelectedRows.Count > 0 Then
      For I:=0 To BGrid.SelectedRows.Count-1 Do
      Begin
        Frodm.Bill.GotoBookmark(Pointer(BGrid.SelectedRows.items[I]));
        Frodm.Bill.Edit;
        Frodm.BillPerm.Value:=False;
        Frodm.Bill.Post;
      End
     Else
     Begin
        Frodm.Bill.Edit;
        Frodm.BillPerm.Value:=False;
        Frodm.Bill.Post;
     End;
end;

procedure TFArsh.Sp3Click(Sender: TObject);
Const
Ask='‘„«—Â «”‰«œ œ«‰„Ì  €ÌÌ— ŒÊ«Âœ ò—œ «œ«„Â „ÌœÂÌœø';
Var
I:Integer;
begin
     BGrid.DataSource:=FroDM.BillDs;
     If MessageDlg(Ask,mtWarning,mbYESNO,-1)=mrNo Then Exit;
     Frodm.Bill.Close;
     Qu.SQL.Clear;
     Qu.SQL.Add('Select B.No,Dat,Atf From Bill B Order By Dat,B.No');
     Qu.Open;
     Qu.First;
     For I:=1 To Qu.RecordCount Do
     Begin
      BQu.Params[0].Value:=I;
      BQu.Params[1].Value:=Qu.Fields[0].Value;
      BQu.ExecSQL;
      Qu.Next;
     End;
     Qu.Close;
     Frodm.Bill.Open;
end;

procedure TFArsh.sp4Click(Sender: TObject);
Var
I:Integer;
begin
     BGrid.DataSource:=Nil;
     Frodm.Bill.First;
     For I:=1 To Frodm.Bill.RecordCount Do
     Begin
      BillUpdate(Frodm.BillNo.AsInteger);
      Frodm.Bill.Next;
     End;
     Frodm.Bill.First;
     BGrid.DataSource:=Frodm.BillDs;
end;

procedure TFArsh.sp5Click(Sender: TObject);
Var
I:Integer;
begin
     Frodm.Bill.Filter:='Bedsum=0 and Bessum=0';
     Frodm.Bill.Filtered:=True;
     For I:=1 To Frodm.Bill.RecordCount Do
     If Frodm.BillBedSum.Value = 0 Then Frodm.Bill.Delete;
     Frodm.Bill.Filter:='';
     Frodm.Bill.Filtered:=False;
end;

procedure TFArsh.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key Of
     VK_ESCAPE  : Close;
     VK_ADD     : SP1Click(Sender);
     VK_SUBTRACT: Sp2Click(Sender);
     End;
end;

procedure TFArsh.spBillClick(Sender: TObject);
Var
No:Integer;
begin
     NO:=Frodm.BillNo.Value;
     CreatingForm(TFBill,'FBill',FBill);
     FBill.FNo.Text:=IntToStr(No);
     FBill.FNoExit(Sender);
end;

procedure TFArsh.BGridKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
      Key :=#0;
      spBillClick(Sender);
     End;
end;

procedure TFArsh.Cb1Click(Sender: TObject);
Var
idx:Integer;
begin
     idx:=((Fardate Div 100)Mod 100);
     If Cb1.Checked Then
     Begin
      Sd.Text:=IntToStr(Fardate Mod 100);
      tvDay.Selected :=tvDay.Items[idx];
     End Else
     Begin
      tvDay.Selected :=tvDay.Items[idx];
      Sd.Text:='1';
     End;
     tvDayClick(Sender);
end;

procedure TFArsh.FNoKeyPress(Sender: TObject; var Key: Char);
begin
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;
     If Key = #13 Then spBillClick(Sender);
end;

procedure TFArsh.FNoChange(Sender: TObject);
begin
     Frodm.Bill.Filter:='';
     Frodm.Bill.Filtered:=False;
     BGrid.SelectedRows.Clear;
     BGrid.DataSource.DataSet.Locate('No',StrToIntDef(FNo.Text,0),[loCaseInsensitive]);
end;

procedure TFArsh.spMoveClick(Sender: TObject);
Var
Table:TTable;
K:Integer;
begin
     If BGrid.DataSource <> Frodm.BillDs Then Exit;
     If (FCurrDb.ItemIndex = -1) Then
     Begin
      ShowMessage('„ﬁ’œ «”‰«œ «‰ Œ«» ‘œÂ „‘Œ’ ‰Ì” ');
      Exit;
     End;
     Table:=TTable.Create(Owner);
     Table.DatabaseName:=FCurrDb.Text;
     If BGrid.SelectedRows.Count > 0 Then
     For K:=0 To BGrid.SelectedRows.Count-1 Do
     Begin
      Frodm.Bill.GotoBookmark(Pointer(BGrid.SelectedRows.items[K]));
      MoveBills(Table)
     End Else
      MoveBills(Table);
     Table.Free;
end;

procedure TFArsh.FCurrDbEnter(Sender: TObject);
Var
List:TStringList;
Str:String;
I:Integer;
begin
//     Alias_Update;
     FCurrDb.Items.Clear;
     List:=TstringList.Create;
     Session.GetAliasNames(List);
     For I:=0 To List.Count-1 Do
     Begin
       Str:=Session.GetAliasDriverName(List.Strings[I]);
       If Str = 'STANDARD' Then FCurrDb.Items.Add(List.Strings[I]);
     End;
     FCurrDb.Items.Delete(FcurrDb.Items.IndexOf('FroData'));
     List.Free;
end;

procedure TFArsh.Button1Click(Sender: TObject);
Var
I:Integer;
BQu:TQuery;
begin
     BQu:=TQuery.Create(Owner);
     BQu.DatabaseName:=CurrDb;
     BQu.SQL.Add('Select B.No,B.Dat From Bill B Order By B.Dat '); //,B.No
     BQu.Open;
     For I:=1 To BQu.RecordCount Do
     Begin
      Button1.Caption:=BQu.Fields[0].AsString;
      ChangeBillNo(BQu.Fields[0].AsInteger,BQu.RecNo);
      BQu.Next;
     End;
     BQu.Close;
     Bqu.SQL.Clear;
     BQu.SQL.Add('Update AcountBill  A Set A.No=-A.No ');
     BQu.ExecSQL;
     BQu.Free;
     QuickCloseOpen(hTable);
end;

procedure TFArsh.FBTipCloseUp(Sender: TObject);
Var
Filt:String;
begin
     If FBTip.KeyValue <> Null Then Filt:='Tip='+IntToStr(FBTip.KeyValue);
     Frodm.Bill.Filter:=Filt;
     Frodm.Bill.Filtered:=True;
end;

procedure TFArsh.FBTipDropDown(Sender: TObject);
begin
     FBTip.KeyValue:=Null;
end;

procedure TFArsh.FBTipKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     FBTipCloseUp(Sender);
end;

procedure TFArsh.SP6Click(Sender: TObject);
Var
I,J:Integer;
Filt:String;
begin
     If BGrid.SelectedRows.Count > 0 Then
      For I:=0 To BGrid.SelectedRows.Count-1 Do
      Begin
       Frodm.Bill.GotoBookmark(Pointer(BGrid.SelectedRows.items[I]));
       Frodm.Bill.Edit;
       Frodm.BillTip.Value:=0;
       Frodm.Bill.Post;
       Filt:='No='+Frodm.BillNo.AsString;
       Frodm.Acbill.Filter:=Filt;
       Frodm.Acbill.Filtered:=True;
       For J:=1 To Frodm.Acbill.RecordCount Do
       Begin
        Frodm.Acbill.Edit;
        Frodm.AcbillTip.Value:=0;
        Frodm.Acbill.Post;
        Frodm.Acbill.Next;
       End;
       Frodm.Acbill.Filter:='';
       Frodm.Acbill.Filtered:=False;
      End
     Else
     Begin
      Frodm.Bill.Edit;
      Frodm.BillTip.Value:=0;
      Frodm.Bill.Post;
      Filt:='No='+Frodm.BillNo.AsString;
      Frodm.Acbill.Filter:=Filt;
      Frodm.Acbill.Filtered:=True;
      For J:=1 To Frodm.Acbill.RecordCount Do
      Begin
       Frodm.Acbill.Edit;
       Frodm.AcbillTip.Value:=0;
       Frodm.Acbill.Post;
       Frodm.Acbill.Next;
      End;
      Frodm.Acbill.Filter:='';
      Frodm.Acbill.Filtered:=False;
     End;
     QuickCloseOpen([6,24]);
end;

procedure TFArsh.BGridDblClick(Sender: TObject);
Var
mouseInGrid : TPoint;
gridCoord: TGridCoord;
begin
     mouseInGrid := BGrid.ScreenToClient(Mouse.CursorPos);
     gridCoord := BGrid.MouseCoord(mouseInGrid.X, mouseInGrid.Y);
     if not (dgTitles in BGrid.Options) then Exit;
     if gridCoord.Y <> 0 then Exit;
//find Column index
     if dgIndicator in BGrid.Options then
      ColumnWidthHelper.Index :=  -1 + gridCoord.x
     else
      ColumnWidthHelper.Index := gridCoord.x;
     if ColumnWidthHelper.Index < 0 then Exit;
     ColumnWidthHelper.MaxWidth := -1;
     BGrid.Repaint;
//"auto size" Column width
     BGrid.Columns[ColumnWidthHelper.Index].Width := 4 + ColumnWidthHelper.MaxWidth;
end;

procedure TFArsh.sp7Click(Sender: TObject);
begin
     CreatingForm(TFArshD,'FArshD',FArshD);
end;

end.
