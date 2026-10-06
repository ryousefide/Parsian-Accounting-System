unit ArshivD;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls,Db,DbTables,
  DBCtrls;

type
  TFArshD = class(TForm)
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
    MakeQu: TQuery;
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
    procedure Sp3Click(Sender: TObject);
    procedure sp4Click(Sender: TObject);
    procedure sp5Click(Sender: TObject);
    procedure FBTipCloseUp(Sender: TObject);
    procedure FBTipDropDown(Sender: TObject);
    procedure FBTipKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BGridDblClick(Sender: TObject);
    procedure SP6Click(Sender: TObject);
  private
    { Private declarations }
    Year:Integer;
    MYear:Integer;
    Mon:Integer;
    St,En:Integer;
    Procedure MoveBills(Table:TTable);
    Function MaxNo(Alias:String):Integer;
    Procedure SetImage;
  public
    { Public declarations }
  end;

var
  FArshD: TFArshD;

implementation

uses Routins, FrooshDM, ProVar, MainForm, Bill, Converts, Math, BillRep2,
  CRoutins;

var
  ColumnWidthHelper : TColumnWidthHelper;
{$R *.DFM}
Procedure TFArshD.MoveBills(Table:TTable);
Var
I,J:Integer;
MNo:Integer;
begin
     Table.TableName:='BillD';
     Table.Open;
     If Table.Locate('No',Frodm.BillDNo.Value,[loCaseInsensitive]) Then
     Begin
      Table.Close;
      Exit;
     End;
     MNo:=MaxNo(Table.DatabaseName)+1;
     Table.Append;
     For I:=0 To Frodm.BillD.FieldDefs.Count-1 Do
      Table.Fields[I].Value:=Frodm.BillD.Fields[i].Value;
     Table.FieldByName('No').AsInteger:=MNo;
     Table.Post;
     Table.Close;
     Table.TableName:='AcountBill';
     Table.Open;
     Frodm.AcBill.Filter:='No= '+Frodm.BillDNo.AsString;
     Frodm.AcBill.Filtered:=True;
     Frodm.AcBill.First;
     For I:=1 To Frodm.AcBill.RecordCount Do
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

Function TFArshD.MaxNo(Alias:String):Integer;
Var
MQu:TQuery;
Begin
     MQu:=TQuery.Create(Owner);
     MQu.DataBaseName:=Alias;
     MQu.SQL.Clear;
     MQu.SQL.Add('Select Max(I.No) From BillD I ');
     MQu.Open;
     Result:=MQu.Fields[0].AsInteger;
     MQu.Close;
end;


procedure TFArshD.SetImage;
begin
     Main.glKey.GetBitmap(12,sp1.Glyph);
     Main.glKey.GetBitmap(13,sp2.Glyph);
     Main.glKey.GetBitmap(11,spBill.Glyph);
end;

procedure TFArshD.FormActivate(Sender: TObject);
begin
     If Frodm.BillD.State In [dsEdit,dsInsert] Then FBill.BsaveClick(Sender);
     If Not Frodm.BillD.Active Then Frodm.Acbill.Open;
end;

procedure TFArshD.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Frodm.BillD.Filtered:=False;
     Frodm.BillD.Last;
     Action:=caFree;
end;

procedure TFArshD.FormCreate(Sender: TObject);
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
     MakeQu.DatabaseName:=CurrDb;
     Frodm.BillD.Open;
end;

procedure TFArshD.tvDayClick(Sender: TObject);
Var
Filt:String;
begin
     Mon :=tvDay.Selected.Index+1;
     st:=StrToInt(Sd.Text);
     En:=StrToInt(Ed.Text);
     Frodm.BillD.Filtered:=False;
     IF tvDay.Selected.Level = 0 Then Exit;
     Filt:=' Dat >='+IntToStr(Year*10000+Mon*100+St)+' and Dat <='+IntToStr(Year*10000+Mon*100+En);
     Filt:=Filt+' or (Dat >='+IntToStr(MYear*10000+Mon*100+St)+' and Dat <='+IntToStr(MYear*10000+Mon*100+En)+')';
     Frodm.BillD.Filter:=Filt;
     Frodm.BillD.Filtered:=True;
end;

procedure TFArshD.BGridDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
     if DataCol = ColumnWidthHelper.Index then
     begin
      if Assigned(Column.Field) then
      ColumnWidthHelper.MaxWidth := Max(ColumnWidthHelper.MaxWidth, BGrid.Canvas.TextWidth(Column.Field.DisplayText));
     end;
     If Not(Frodm.BillDLPerm.Value) Then BGrid.Canvas.Font.Color :=clRed;
     If  (Frodm.BillDBedSum.Value <> Frodm.BillDBesSum.Value) Then BGrid.Canvas.Brush.Color:=clGray;
     If ((Frodm.BillDBedSum.Value=0)and(Frodm.BillDBesSum.Value=0))
     or(Frodm.BillDTip.Value = 1)  Then BGrid.Canvas.Font.Color :=clGray;
     BGrid.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TFArshD.tvDayKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
      Key :=#0;
      tvDayClick(Sender);
     End;
end;

procedure TFArshD.Sp1Click(Sender: TObject);
Var
I:Integer;
begin
     If BGrid.SelectedRows.Count > 0 Then
      For I:=0 To BGrid.SelectedRows.Count-1 Do
      Begin
        Frodm.BillD.GotoBookmark(Pointer(BGrid.SelectedRows.items[I]));
        Frodm.BillD.Edit;
        Frodm.BillDLPerm.Value:=True;
        Frodm.BillD.Post;
      End
     Else
     Begin
        Frodm.BillD.Edit;
        Frodm.BillDLPerm.Value:=True;
        Frodm.BillD.Post;
     End;
end;

procedure TFArshD.Sp2Click(Sender: TObject);
Var
I:Integer;
begin
     If Not Sp2.Enabled Then Exit;
     If BGrid.SelectedRows.Count > 0 Then
      For I:=0 To BGrid.SelectedRows.Count-1 Do
      Begin
        Frodm.BillD.GotoBookmark(Pointer(BGrid.SelectedRows.items[I]));
        Frodm.BillD.Edit;
        Frodm.BillDLPerm.Value:=False;
        Frodm.BillD.Post;
      End
     Else
     Begin
        Frodm.BillD.Edit;
        Frodm.BillDLPerm.Value:=False;
        Frodm.BillD.Post;
     End;
end;

procedure TFArshD.Sp3Click(Sender: TObject);
Const
Ask='‘„«—Â «”‰«œ œ«‰„Ì  €ÌÌ— ŒÊ«Âœ ò—œ «œ«„Â „ÌœÂÌœø';
Var
I:Integer;
begin
     BGrid.DataSource:=FroDM.BillDDs;
     If MessageDlg(Ask,mtWarning,mbYESNO,-1)=mrNo Then Exit;
     Frodm.BillD.Close;
     Qu.SQL.Clear;
     Qu.SQL.Add('Select B.No,Dat,Atf From BillD B Order By Dat,B.No');
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
     Frodm.BillD.Open;
end;

procedure TFArshD.sp4Click(Sender: TObject);
Var
I:Integer;
begin
     BGrid.DataSource:=Nil;
     Frodm.BillD.First;
     For I:=1 To Frodm.BillD.RecordCount Do
     Begin
      BillUpdate(Frodm.BillDNo.AsInteger);
      Frodm.BillD.Next;
     End;
     Frodm.BillD.First;
     BGrid.DataSource:=Frodm.BillDDs;
end;

procedure TFArshD.sp5Click(Sender: TObject);
Var
I:Integer;
begin
     Frodm.BillD.Filter:='Bedsum=0 and Bessum=0';
     Frodm.BillD.Filtered:=True;
     For I:=1 To Frodm.BillD.RecordCount Do
     If Frodm.BillDBedSum.Value = 0 Then Frodm.BillD.Delete;
     Frodm.BillD.Filter:='';
     Frodm.BillD.Filtered:=False;
end;

procedure TFArshD.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key Of
     VK_ESCAPE  : Close;
     VK_ADD     : SP1Click(Sender);
     VK_SUBTRACT: Sp2Click(Sender);
     End;
end;

procedure TFArshD.spBillClick(Sender: TObject);
Var
No:Integer;
Dated:Boolean;
begin
{     NO:=Frodm.BillDNo.Value;
     CreatingForm(TFBill,'FBill',FBill);
     FBill.FNo.Text:=IntToStr(No);
     FBill.FNoExit(Sender); }
     Dated:=True;
     MoveBillToTemp(Dated,Frodm.BillDDat.AsInteger);
     CreatingForm(TRepBill2,'RepBill2',RepBill2);
     Set_Sys_Enviroment;
     RepBill2.TAC.DatabaseName:=CurrDb;
     RepBill2.TAC.Open;
     RepBill2.QRLabel1.Caption :=InvoLbl;
     //RepBill2.QRLabel1.Font.Size :=LFont.Size+4;
     with RepBill2 Do
     Begin
      QrdbText6.DataSet:=Frodm.BillD;
      QrdbText7.DataSet:=Frodm.BillD;
      QrdbText8.DataSet:=Frodm.BillD;
      QrdbText11.DataSet:=Frodm.BillD;
      QrdbText5.DataSet:=Frodm.BillD;
      QrdbText5.DataField:='No';
     End;
     RepBill2.Preview;
     RepBill2.Destroy;

end;

procedure TFArshD.BGridKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
      Key :=#0;
      spBillClick(Sender);
     End;
end;

procedure TFArshD.Cb1Click(Sender: TObject);
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

procedure TFArshD.FNoKeyPress(Sender: TObject; var Key: Char);
begin
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;
     If Key = #13 Then spBillClick(Sender);
end;

procedure TFArshD.FNoChange(Sender: TObject);
begin
     Frodm.BillD.Filter:='';
     Frodm.BillD.Filtered:=False;
     BGrid.SelectedRows.Clear;
     BGrid.DataSource.DataSet.Locate('No',StrToIntDef(FNo.Text,0),[loCaseInsensitive]);
end;

procedure TFArshD.spMoveClick(Sender: TObject);
Var
Table:TTable;
K:Integer;
begin
     If BGrid.DataSource <> Frodm.BillDDs Then Exit;
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
      Frodm.BillD.GotoBookmark(Pointer(BGrid.SelectedRows.items[K]));
      MoveBills(Table)
     End Else
      MoveBills(Table);
     Table.Free;
end;

procedure TFArshD.FCurrDbEnter(Sender: TObject);
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

procedure TFArshD.FBTipCloseUp(Sender: TObject);
Var
Filt:String;
begin
     If FBTip.KeyValue <> Null Then Filt:='Tip='+IntToStr(FBTip.KeyValue);
     Frodm.BillD.Filter:=Filt;
     Frodm.BillD.Filtered:=True;
end;

procedure TFArshD.FBTipDropDown(Sender: TObject);
begin
     FBTip.KeyValue:=Null;
end;

procedure TFArshD.FBTipKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     FBTipCloseUp(Sender);
end;

procedure TFArshD.BGridDblClick(Sender: TObject);
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

procedure TFArshD.SP6Click(Sender: TObject);
Var
I:Integer;
begin
     Open_g(Frodm.BillD);
     MakeQu.ExecSQL;
     Frodm.BillD.IndexFieldNames:='Dat';
     Frodm.BillD.First;
     For I:=1 To Frodm.BillD.RecordCount Do
     Begin
      Frodm.BillD.Edit;
      Frodm.BillDNo.Value:=I;
      Frodm.BillDDes.AsString:='”‰œ —Ê“«‰Â „Ê—ŒÂ  '+IntTodate(Frodm.BillDDat.AsInteger);
      Frodm.BillDLperm.Value:=True;
      Frodm.BillD.Post;
      Frodm.BillD.Next;
     End;
     Frodm.BillD.First;
end;

end.
