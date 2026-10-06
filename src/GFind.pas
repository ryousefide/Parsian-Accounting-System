unit GFind;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, Db, DBTables, Menus, Grids, DBGrids, quickrpt,
  CheckLst, XPCheckListBox, Buttons;
type
  TColumnWidthHelper = record
    Index : integer;
    MaxWidth : integer;
  end;

type
  TFGFind = class(TForm)
    FNam: TEdit;
    Bevel1: TBevel;
    rbMoj: TCheckBox;
    Sb1: TStatusBar;
    Label2: TLabel;
    PopupMenu1: TPopupMenu;
    N2: TMenuItem;
    Label1: TLabel;
    cbState: TComboBox;
    SQu: TQuery;
    Ds: TDataSource;
    SQuNam: TStringField;
    SQuISBN: TStringField;
    SQuPFro: TCurrencyField;
    SQuQuant: TFloatField;
    BOk: TButton;
    Dbg: TDBGrid;
    FList: TXPCheckListBox;
    SQuKod: TIntegerField;
    SQuAnbNam: TStringField;
    SQuProp1: TStringField;
    SQuProp2: TStringField;
    SQuProp3: TStringField;
    SQuProp4: TStringField;
    SQuColor: TStringField;
    SQuKol: TSmallintField;
    SQuMo: TSmallintField;
    SQuTaf: TSmallintField;
    CTree: TTreeView;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    SQuPKh: TCurrencyField;
    spC: TSpeedButton;
    cbCollect: TCheckBox;
    CT: TTable;
    spClear: TSpeedButton;
    spPrint: TSpeedButton;
    DBGrid1: TDBGrid;
    Splitter3: TSplitter;
    CQu: TQuery;
    ColorDs: TDataSource;
    CQuDat: TIntegerField;
    CQuColor: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lbGNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FNamKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FListKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FListClick(Sender: TObject);
    procedure rbMojClick(Sender: TObject);
    procedure cbStateChange(Sender: TObject);
    procedure CTreeClick(Sender: TObject);
    procedure CTreeEditing(Sender: TObject; Node: TTreeNode;
      var AllowEdit: Boolean);
    procedure CTreeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DbgDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure N2Click(Sender: TObject);
    procedure DbgKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure spCClick(Sender: TObject);
    procedure cbCollectClick(Sender: TObject);
    procedure spClearClick(Sender: TObject);
    procedure spPrintClick(Sender: TObject);
    procedure DbgDblClick(Sender: TObject);
    procedure SQuAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
    CreateListReport : TQuickRep;
    Function MakeAllCond(NamePart:String):String;
    Procedure ListFill(NamePart:String);
    procedure MakeTree;
    Procedure RegRead;
    Procedure RegWrite;
    procedure DBBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  public
    { Public declarations }
    No,Dat:Integer;
    Name:String;
    T1:TTable;
    sPerc:String;
    choosed:Boolean;
    FKol:SmallInt;// Integer;
    FMo:SmallInt;
    FTaf:SmallInt;
  end;

var
  FGFind: TFGFind;
  ColumnWidthHelper : TColumnWidthHelper;
implementation

uses FrooshDM, ProVar, Routins, KalaCardex, GoodsEdit,Registry, QrExtra,
  MainForm, Math;
Const
 SearchCond: Array [1..6] of String=(
 ('Where G.Nam Like '),
 ('Where G.Prop1 Like '),
 ('Where G.Prop2 Like '),
 ('Where G.Prop3 Like '),
 ('Where G.Prop4 Like '),
 ('Where D.AnbNam Like '));

 AllCond: Array [0..5] of String=(
 ('Where G.Nam Like '),
 ('Or G.Prop1 Like '),
 ('Or G.Prop2 Like '),
 ('Or G.Prop3 Like '),
 ('Or G.Prop4 Like '),
 ('Or D.AnbNam Like '));


{$R *.DFM}
function TFGFind.MakeAllCond(NamePart:String): String;
Var
I:integer;
begin
     Result:='';
     For I:=0 To 5 Do
     Result:=Result+' '+AllCond[I]+' '+QuotedStr('%'+NamePart+'%');
end;

Procedure TFGFind.ListFill(NamePart:String);
begin
     If NamePart = '' Then Exit;
     Screen.Cursor:=crHourGlass;
     Case cbState.ItemIndex Of
     0:SQu.SQL.Strings[5]:=MakeAllCond(NamePart);
     1..6:SQu.SQL.Strings[5]:=SearchCond[cbState.ItemIndex]+' '+QuotedStr('%'+NamePart+'%');
     End;
     If rbMoj.Checked Then
      SQu.Filter:='Quant >0'
     Else
      SQu.Filter:='';
     SQu.Filtered:=SQu.Filter >'';
     SQu.Open;
     Screen.Cursor:=crDefault;
end;

procedure TFGFind.MakeTree;
Var
I,J,K:Integer;
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
      Ctree.Items.AddChild(Node,Qu.Fields[0].AsString).SelectedIndex:=Qu.Fields[1].AsInteger;
      Qu.Next;
     End;
     Qu.Close;
     Node:=Ctree.Items[0].getFirstChild;
//------Adding Mo----
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Des,Mo From GChart Where Kol=:k and Mo>0 and Taf=0 Order By Des');
     For J:=0 to ctree.Items[0].Count-1 Do
     Begin
      Node:=Ctree.Items[0].Item[j];
      Qu.Params[0].Value:=Node.SelectedIndex;
      Qu.Open;
      Qu.First;
      For I:=1 To Qu.RecordCount Do
      Begin
       Ctree.Items.AddChild(Node,Qu.Fields[0].AsString).SelectedIndex:=Qu.Fields[1].AsInteger;
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
      FKol:=Node.SelectedIndex;
      For K:=0 To Ctree.Items[0].Item[j].Count-1 Do
      Begin
       Node:=Ctree.Items[0].Item[j].Item[K];
       FMo:=Node.SelectedIndex;
       Qu.Params[0].Value:=FKol;
       Qu.Params[1].Value:=FMo;
       Qu.Open;
       Qu.First;
       For I:=1 To Qu.RecordCount Do
       Begin
        Ctree.Items.AddChild(Node,Qu.Fields[0].AsString).SelectedIndex:=Qu.Fields[1].AsInteger;
        Qu.Next;
       End;
       Qu.Close;
      End;
     End;
     Ctree.Items[0].Expand(False);
end;

procedure TFGFind.RegRead;
Var
Reg:TRegistry;
St:String;
I:Integer;
begin
  Reg:=TRegistry.Create;
  Try
   Reg.OpenKey('SoftWare\Hadieh Rayaneh\MParFro',False);
   St:=Reg.ReadString('SCrit');
   For I:=0 To FList.Items.Count-1 Do
   FList.Checked[I]:=St[I+1]='1';
  Finally
   Reg.Free;
  End;
end;

procedure TFGFind.RegWrite;
Var
Reg:TRegistry;
St:String;
I:Integer;
begin
  St:='';
  For I:=0 To FList.Items.Count-1 Do
   If FList.Checked[I] Then St:=St+'1' Else St:=St+'0';
  Reg:=TRegistry.Create;
  Try
   Reg.OpenKey('SoftWare\Hadieh Rayaneh\MParFro',True);
   Reg.WriteString('SCrit',St);
  Finally
   Reg.Free;
  End;
  DeleteFile('Par001.Rgs');
  RegKeyExport(HKEY_CURRENT_USER,'SoftWare\Hadieh Rayaneh\MParFro','Par001.Rgs');
end;

procedure TFGFind.DBBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
     If TQuickRep((Sender As TQRCustomBand).ParentReport).DataSet.RecNo Mod 2 =1  Then
     (Sender As TQRCustomBand).Color:=$00F0F0F0
     Else
     (Sender As TQRCustomBand).Color:=clWhite;
end;

//-----------------------------------------------

procedure TFGFind.FormCreate(Sender: TObject);
Var
I:Integer;
begin
     Set_Forms(Self);
     Main.glKey.GetBitmap(2,spPrint.Glyph);
     CreateListReport := TQuickRep.Create(self);
     SQu.DatabaseName:=CurrDb;
     CQu.DatabaseName:=CurrDb;
     CT.DatabaseName:=CurrDb;
     If CT.Exists Then CT.DeleteTable;
     cbState.ItemIndex:=0;
     MakeTree;
     For I:=0 To SQu.FieldCount-1 Do
     Begin
      //If SQu.Fields[I].Visible Then
      FList.Items.Add(SQu.Fields[I].DisplayName);
      RegRead;//If I in [0,2,4,5] Then FList.Checked[I]:=True;
     End;
     FListClick(Self);
end;

procedure TFGFind.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     CT.Close;
     If CT.Exists Then CT.DeleteTable;
     RegWrite;
     Action:=caFree;
end;

procedure TFGFind.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key Of
     VK_UP,VK_DOWN: If (SQu.Active)and(Not CTree.Focused )Then Dbg.SetFocus;
     27:  Close;
     End;
end;

procedure TFGFind.FListKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Begin
     FListClick(Self);
end;

procedure TFGFind.FListClick(Sender: TObject);
Var
I:Integer;
begin
     For I:=0 To FList.Items.Count-1 Do
     dbg.DataSource.DataSet.Fields[I].Visible:=FList.Checked[I];
end;

procedure TFGFind.rbMojClick(Sender: TObject);
begin
     If rbMoj.Checked Then
      SQu.Filter:='Quant >0'
     Else
      SQu.Filter:='';
     SQu.Filtered:=SQu.Filter >'';
end;

procedure TFGFind.cbStateChange(Sender: TObject);
begin
     ListFill(FNam.Text);
end;

procedure TFGFind.FNamKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key Of
     VK_UP,VK_DOWN: If SQu.Active Then Dbg.SetFocus;
     VK_ESCAPE:ModalResult:=mrCancel;
     13:ListFill(FNam.Text);
     End;
end;

procedure TFGFind.lbGNameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Const
ACap=' ⁄ÌÌ‰ „ﬁœ«—';
APromp='„ﬁœ«— œ—ŒÊ«” Ì —« Ê«—œ ò‰Ìœ';
Var
sQt:String;
Qt:real;
begin
     If SQu.RecordCount = 0 Then Exit;
     If Key = 13 Then
     Begin
      If T1.State = dsBrowse Then T1.Append Else T1.Edit;
      T1.FieldByName('No').AsInteger:=No;
      T1.FieldByName('Dat').AsInteger:=Dat;
      //T1.Fields[11].AsString:=Name;
      T1.Fields[1].AsInteger:=T1.RecordCount+1;
      T1.Fields[2].AsInteger:=SQuKod.AsInteger;
      T1.Fields[3].AsString:=SQuNam.AsString;
      T1.Fields[4].AsString:=SQuColor.AsString;
      T1.Fields[5].AsString:=SQuAnbNam.AsString;
      sQt:=InputBoxClear( ACap,APromp,'1',True);
      Qt:=StrToFloat(sQt);
      //If StrToIntDef(sQt,0) = 0 Then
      If Qt = 0 Then
      Begin
       T1.Cancel;
       Exit;
      End;
      //T1.FieldByName('Quant').AsString:=sQt;
      T1.FieldByName('Quant').AsFloat:=Qt;
      T1.FieldByName('Pfee').AsCurrency:=SQuPFro.AsCurrency;//Fields[9]
      T1.FieldByName('Prop').AsString:=SQuProp1.AsString+' '+SQuProp2.AsString+' '+
       SQuProp3.AsString+' '+SQuProp4.AsString;
      T1.Post;
      Windows.Beep(2500,250);
      //choosed:=True;
      //Close;
     End;
end;

procedure TFGFind.CTreeClick(Sender: TObject);
Var
I,J,Idx:Integer;
Node:TTreeNode;
begin
     Node:=cTree.Selected;
     FKol:=0;FMo:=0;FTaf:=0;
     SQu.Close;
     If Node.Level <1 Then Exit;
     For I:=ctree.Selected.Level DownTo 0 Do
     Begin
      Case Node.Level Of
      3: FTaf:=Node.SelectedIndex;
      2: FMo :=Node.SelectedIndex;
      1: FKol:=Node.SelectedIndex;
      End;
      Node:=Node.Parent;
     End;
     Case cTree.Selected.Level of
     1:Begin
        SQu.SQL.Strings[5]:='Where G.Kol=:t';
        SQu.Params[0].Value:=FKol;
       End;
     2:Begin
       SQu.SQL.Strings[5]:='Where G.Kol=:t and G.Mo=:s';
       SQu.Params[0].Value:=FKol;
       SQu.Params[1].Value:=FMo;
       End;
     3:Begin
       SQu.SQL.Strings[5]:='Where G.Kol=:t and G.Mo=:s  and G.Taf=:g ';
       SQu.Params[0].Value:=FKol;
       SQu.Params[1].Value:=FMo;
       SQu.Params[2].Value:=FTaf;
       End;
     End;
     SQu.Open;
end;

procedure TFGFind.CTreeEditing(Sender: TObject; Node: TTreeNode;
  var AllowEdit: Boolean);
begin
     AllowEdit:=False;
end;

procedure TFGFind.CTreeKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key Of
     VK_LEFT,VK_RIGHT,VK_UP,VK_DOWN,VK_LBUTTON,VK_RBUTTON:
      CTreeClick(Sender);
      13:dbg.SetFocus;
     End;
end;

procedure TFGFind.N2Click(Sender: TObject);
Var
DG:TFgoodsEdit;
iRec:Integer;
begin
     Frodm.Good.Locate('Kod',SQuKod.Value,[loCaseInsensitive]);
     DG:=TFgoodsEdit.Create(Application);
     With DG Do
     Try
      Hmu:=CreateMutex(nil,False,PChar(CCrypt('8OYK0v+1nH6o0RJYCYyhHoHkoevTug==')));
      //If GetLastError() <> ERROR_ALREADY_EXISTS Then SetToBack;
      CloseHandle(Hmu);
      FormStyle:=fsNormal;
      Visible:=False;
      BorderStyle:=bsSingle;
      FieldShow;
      iRec:=Frodm.Good.RecNo;
      ShowModal;
     Finally
      Free;
      Frodm.Good.RecNo:=iRec;
     End;
end;

procedure TFGFind.DbgDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
     if DataCol = ColumnWidthHelper.Index then
     begin
      if Assigned(Column.Field) then
      ColumnWidthHelper.MaxWidth := Max(ColumnWidthHelper.MaxWidth, Dbg.Canvas.TextWidth(Column.Field.DisplayText));
     end;
     dbg.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TFGFind.DbgKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     spC.Enabled:=dbg.SelectedRows.Count > 0;
end;

procedure TFGFind.spCClick(Sender: TObject);
Var
I,J:Integer;
begin
     If Not CT.Exists Then
     Begin
      CT.FieldDefs.Assign(SQu.FieldDefs);
      CT.CreateTable;
//      CT.EmptyTable;
     End;
     CT.Open;
     For I:=0 To Ct.Fields.Count-1 Do
     Begin
      CT.Fields[I].DisplayLabel:=SQu.Fields[I].DisplayLabel;
      CT.Fields[I].DisplayWidth:=SQu.Fields[I].DisplayWidth;
      End;
     For I:=0 To dbg.SelectedRows.Count-1 Do
     Begin
      SQu.GotoBookmark(Pointer(dbg.SelectedRows.items[I]));
      CT.Append;
      For J:=0 To SQu.FieldCount-1 Do
      CT.Fields[J].Value:=SQu.Fields[J].Value;
      CT.Post;
     End;
     dbg.SelectedRows.Clear;
     cbCollect.Enabled:=CT.RecordCount>0;
     spClear.Enabled:=CT.RecordCount>0;
     spC.Enabled:=False;
end;

procedure TFGFind.cbCollectClick(Sender: TObject);
begin
     Case cbCollect.Checked Of
     True:  Begin
             cbCollect.Caption:='Collection';
             Ds.DataSet:=CT;
            End;
     False: Begin
             cbCollect.Caption:='Search';
             Ds.DataSet:=SQu;
            End;
     End;
     FListClick(Owner);
end;

procedure TFGFind.spClearClick(Sender: TObject);
Const
Msg='«ÿ·«⁄«  «‰ Œ«»Ì Õ–› ‘Êœø';
begin
     If MessageDlg(msg,mtWarning,mbYESNO,-1)= mrYes Then
     Begin
      CT.Close;
      CT.EmptyTable;
      spClear.Enabled:=False;
     End;
end;

procedure TFGFind.spPrintClick(Sender: TObject);
var
  aReport : TCustomQuickRep;
  SomeFields: TStringList;
  MyTable: TDataSet;
  nIdx: integer;
  BWid:Integer;
begin
  MyTable := Dbg.DataSource.DataSet;
  SomeFields := TStringList.Create;
  With MyTable Do
    for nIdx := 0 to FieldCount - 1 do
     If Fields[nIdx].Visible Then SomeFields.Add(Fields[nIdx].FieldName);

{create The Report}
  areport := nil;
  QRCreateList(aReport,Nil,Dbg.DataSource.DataSet,' ·Ì”  ò«·« ',SomeFields);
  //aReport.Bands.ColumnHeaderBand.Font.Style := [fsBold];
  aReport.Bands.ColumnHeaderBand.Font:=PLFont;
  aReport.Bands.ColumnHeaderBand.Color:=clGray;
  BWid:=aReport.Bands.ColumnHeaderBand.Width;
  for nIdx := 0 to aReport.Bands.ColumnHeaderBand.ControlCount -1 do
    if aReport.Bands.ColumnHeaderBand.Controls[nIdx] is TQRPrintable then
      with TQRPrintable(aReport.Bands.ColumnHeaderBand.Controls[nIdx]) do
        Left:=BWid-(Left+Width+5);

  for nIdx := 0 to aReport.Bands.DetailBand.ControlCount -1 do
    if aReport.Bands.DetailBand.Controls[nIdx] is TQRPrintable then
      with TQRPrintable(aReport.Bands.DetailBand.Controls[nIdx]) do
        Left:=BWid-(Left+Width+5);
  aReport.Bands.DetailBand.Frame.DrawBottom:=True;
  aReport.Bands.DetailBand.Frame.Color:=clGray;
  aReport.Bands.DetailBand.BeforePrint:=DBBeforePrint;
  areport.Font:=PFFont;
  areport.preview;
  aReport.Free;
  SomeFields.Free;

end;

procedure TFGFind.DbgDblClick(Sender: TObject);
Var
mouseInGrid : TPoint;
gridCoord: TGridCoord;
begin
     mouseInGrid := Dbg.ScreenToClient(Mouse.CursorPos);
     gridCoord := Dbg.MouseCoord(mouseInGrid.X, mouseInGrid.Y);
     if not (dgTitles in Dbg.Options) then Exit;
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

procedure TFGFind.SQuAfterScroll(DataSet: TDataSet);
begin
     If CQu.Params[0].AsInteger <>SQuKod.AsInteger Then
     Begin
      CQu.Close;
      CQu.Params[0].Value:=SQuKod.AsInteger;
      CQu.Open;
     End;
end;

end.

.
