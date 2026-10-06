unit RInvArsh;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, DBCtrls, Db,
  DBTables;

type
  TFRInvArsh = class(TForm)
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
    Label7: TLabel;
    sp4: TSpeedButton;
    Label5: TLabel;
    FCKod: TDBLookupComboBox;
    FAcNam: TComboBox;
    Panel2: TPanel;
    Label4: TLabel;
    Fsum: TEdit;
    Dbg: TDBGrid;
    SQu: TQuery;
    DS: TDataSource;
    FVName: TDBLookupComboBox;
    r: TLabel;
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
    procedure FCKodDropDown(Sender: TObject);
    procedure FCKodKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FVNameDropDown(Sender: TObject);
  private
    { Private declarations }
    Year:Integer;
    MYear:Integer;
    Mon:Integer;
    St,En:Integer;
    procedure SetImage;
    Function GetSumField(Dbg:TDbGrid):String;
    Procedure GetSum(Filter:String);
  public
    { Public declarations }
  end;

var
  FRInvArsh: TFRInvArsh;

implementation

uses Routins, FrooshDM, ProVar, MainForm, RejInvo, CRoutins;

{$R *.DFM}

procedure TFRInvArsh.SetImage;
begin
     Main.glKey.GetBitmap(12,sp1.Glyph);
     Main.glKey.GetBitmap(13,sp2.Glyph);
     Main.glKey.GetBitmap(9,sp4.Glyph);
     Main.glKey.GetBitmap(11,spBill.Glyph);
end;

Function TFRInvArsh.GetSumField(Dbg:TDbGrid):String;
Var
I:Integer;
St:String;
begin
 St:='';
 For I:=0 To Dbg.Columns.Count-1 Do
  If Dbg.Columns[I].Field.DataType = ftCurrency Then St:=St+',Sum('+Dbg.Columns[I].Field.FieldName+
  ') as ['+Dbg.Columns[I].Title.Caption+']';
 Delete(St,1,1);
 Result:=St;
end;

Procedure TFRInvArsh.GetSum(Filter:String);
Var
I:Integer;
begin
 SQu.Close;
 SQu.DatabaseName:=CurrDb;
 SQu.SQL.Clear;
 SQu.Sql.Add('Select '+ GetSumField(BGrid)+' From '+(BGrid.DataSource.DataSet as TTable).TableName);
 If Filter >'' Then SQu.Sql.Add('Where '+Filter);
 SQu.Open;
 For I:=0 To Dbg.Columns.Count-1 Do   Dbg.Columns[I].Width:=148;
end;

procedure TFRInvArsh.FormActivate(Sender: TObject);
begin
     If Frodm.RejInvo.State In[dsEdit,dsInsert] Then FRejInvo.BsaveClick(Sender);
     If Not Frodm.RejInvo.Active Then Frodm.RejInvo.open;
end;

procedure TFRInvArsh.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Frodm.RejInvo.Filtered:=False;
     Frodm.RejInvo.Close;
     Action:=caFree;
end;

procedure TFRInvArsh.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     SetImage;
     Fill_Comb(Frodm.RejInvo,'Nam',FAcNam.Items);//
     Frodm.RejInvo.Filtered:=True;
     Year:=DateToInt(Beg_Date) Div 10000;
     MYear:=DateToInt(End_Date) Div 10000;
     If Year = 0 Then Year:= Fardate Div 10000;
     sp2.Enabled:=Boss;
end;

procedure TFRInvArsh.tvDayClick(Sender: TObject);
Var
Filt:String;
begin
     Mon :=tvDay.Selected.Index+1;
     st:=StrToInt(Sd.Text);
     En:=StrToInt(Ed.Text);
     Frodm.RejInvo.Filtered:=False;

     IF tvDay.Selected.Level > 0 Then
     Begin
      Filt:='(Dat >='+IntToStr(Year*10000+Mon*100+St)+' and Dat <='+IntToStr(Year*10000+Mon*100+En)+')';
      Filt:=Filt+' or (Dat >='+IntToStr(MYear*10000+Mon*100+St)+' and Dat <='+IntToStr(MYear*10000+Mon*100+En)+')';
     End;
     If FCkod.KeyValue <>Null Then Filt:=Filt+' and Ckod='+IntToStr(Fckod.KeyValue);
     If FAcNam.Text <> '' Then Filt:=Filt+' and Nam ='+QuotedStr(FAcNam.Text);
     If FVName.KeyValue <>Null Then Filt:=Filt+' and Visit='+IntToStr(FVName.KeyValue);
     If Pos(' and',Filt) = 1 Then Delete(Filt,1,4);

     Frodm.RejInvo.Filter:=Filt;
     Frodm.RejInvo.Filtered:=True;

     GetSum(Filt);
     Panel2.Visible:=True;

end;

procedure TFRInvArsh.BGridDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
Var
DrawRect: TRect;
begin
     If Not(Frodm.RejInvoPerm.Value) Then BGrid.Canvas.Font.Color :=clRed;
     BGrid.DefaultDrawColumnCell(Rect,DataCol,Column,State);
     if (Column.Field.FieldName ='Ckod' ) then
     Begin
      DrawRect:=Rect;
      BGrid.Canvas.FillRect(DrawRect);
      If Not Column.Field.IsNull Then
      BGrid.Canvas.Textout(DrawRect.Left+4,DrawRect.Top,CentName(Column.Field.Value));
     End;
end;

procedure TFRInvArsh.tvDayKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
       Key :=#0;
       tvDayClick(Sender);
     End;
end;

procedure TFRInvArsh.Sp1Click(Sender: TObject);
Var
I:Integer;
begin
     If BGrid.SelectedRows.Count > 0 Then
      For I:=0 To BGrid.SelectedRows.Count-1 Do
      Begin
        Frodm.RejInvo.GotoBookmark(Pointer(BGrid.SelectedRows.items[I]));
        Frodm.RejInvo.Edit;
        Frodm.RejInvoPerm.Value:=True;
        Frodm.RejInvo.Post;
      End
     Else
     Begin
        Frodm.RejInvo.Edit;
        Frodm.RejInvoPerm.Value:=True;
        Frodm.RejInvo.Post;
     End;
end;

procedure TFRInvArsh.Sp2Click(Sender: TObject);

Var
I:Integer;
begin
     If Not Sp2.Enabled Then Exit;
     If BGrid.SelectedRows.Count > 0 Then
      For I:=0 To BGrid.SelectedRows.Count-1 Do
      Begin
        Frodm.RejInvo.GotoBookmark(Pointer(BGrid.SelectedRows.items[I]));
        Frodm.RejInvo.Edit;
        Frodm.RejInvoPerm.Value:=False;
        Frodm.RejInvo.Post;
      End
     Else
     Begin
        Frodm.RejInvo.Edit;
        Frodm.RejInvoPerm.Value:=False;
        Frodm.RejInvo.Post;
     End;
end;

procedure TFRInvArsh.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key Of
     VK_ESCAPE  : Close;
     VK_ADD     : SP1Click(Sender);
     VK_SUBTRACT: Sp2Click(Sender);
     End;
end;

procedure TFRInvArsh.spBillClick(Sender: TObject);
Var
No:Integer;
begin
     NO:=Frodm.RejInvoNo.Value;
     Frodm.RejInvo.Filtered:=True;
     CreatingForm(TFRejInvo,'FRejInvo',FRejInvo);
     FRejInvo.FNo.Text:=IntToStr(No);
     FRejInvo.FNoExit(Sender);
     Frodm.RejInvo.Locate('No',No,[loCaseInsensitive])
end;

procedure TFRInvArsh.BGridKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
      Key :=#0;
      spBillClick(Sender);
     End;
end;

procedure TFRInvArsh.Cb1Click(Sender: TObject);
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

procedure TFRInvArsh.FNoKeyPress(Sender: TObject; var Key: Char);
begin
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;
     If Key = #13 Then spBillClick(Sender);
end;

procedure TFRInvArsh.FNoChange(Sender: TObject);
begin
     Frodm.RejInvo.Filter:='';
     Frodm.RejInvo.Filtered:=False;
     BGrid.SelectedRows.Clear;
     BGrid.DataSource.DataSet.Locate('No',StrToIntDef(FNo.Text,0),[loCaseInsensitive]);
end;

procedure TFRInvArsh.FCKodDropDown(Sender: TObject);
begin
     FCkod.KeyValue:=Null;
end;

procedure TFRInvArsh.FCKodKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetCentLookup(Sender,Key);
end;

procedure TFRInvArsh.FVNameDropDown(Sender: TObject);
begin
     FVName.KeyValue:=Null;
end;

end.
