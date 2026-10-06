unit InvArsh;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, XPListBox, DBCtrls,
  Db, DBTables;

type
  TFInvArsh = class(TForm)
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
    lbFacNo: TXPListBox;
    Splitter2: TSplitter;
    sp3: TSpeedButton;
    Label7: TLabel;
    sp4: TSpeedButton;
    FCKod: TDBLookupComboBox;
    FAcNam: TComboBox;
    Label5: TLabel;
    Panel2: TPanel;
    Fsum: TEdit;
    Label4: TLabel;
    SQu: TQuery;
    Dbg: TDBGrid;
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
    procedure sp3Click(Sender: TObject);
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
    Procedure SetImage;
    Function GetSumField(Dbg:TDbGrid):String;
    //Function GetSum(Filter:String):Currency;
    Procedure GetSum(Filter:String);
  public
    { Public declarations }
  end;

var
  FInvArsh: TFInvArsh;

implementation

uses Routins, FrooshDM, ProVar, MainForm, Invoice, CRoutins;

{$R *.DFM}

procedure TFInvArsh.SetImage;
begin
 Main.glKey.GetBitmap(12,sp1.Glyph);
 Main.glKey.GetBitmap(13,sp2.Glyph);
 Main.glKey.GetBitmap(9,sp4.Glyph);
 Main.glKey.GetBitmap(11,spBill.Glyph);
end;

Function TFInvArsh.GetSumField(Dbg:TDbGrid):String;
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

Procedure TFInvArsh.GetSum(Filter:String);
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

{Function TFInvArsh.GetSum(Filter:String):Currency;
Var
SQu:Tquery;
begin
 SQu:=TQuery.Create(Owner);
 SQu.DatabaseName:=CurrDb;
 SQu.Sql.Add('Select Sum(PNet) From Invoice ');
 SQu.Sql.Add('Where '+Filter);
 SQu.Open;
 Result:=SQu.Fields[0].AsCurrency;
 SQu.Close;
 SQu.Destroy;
end; }

procedure TFInvArsh.FormActivate(Sender: TObject);
begin
     If Frodm.Invo.State In[dsEdit,dsInsert] Then FInvoice.BsaveClick(Sender);
     If Not Frodm.Invo.Active Then  Frodm.Invo.Open;
end;

procedure TFInvArsh.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Frodm.Invo.Filter:='';
     Frodm.Invo.Filtered:=False;
     Frodm.invo.Close;
     Action:=caFree;
end;

procedure TFInvArsh.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     SetImage;
     Fill_Comb(Frodm.Invo,'Nam',FAcNam.Items);//FAcNam.Items.Assign(AcList);
     Frodm.Invo.Filtered:=True;
     Year:=DateToInt(Beg_Date) Div 10000;
     MYear:=DateToInt(End_Date) Div 10000;
     If Year = 0 Then Year:= Fardate Div 10000;
     sp2.Enabled:=CUser.Master;
end;

procedure TFInvArsh.tvDayClick(Sender: TObject);
Var
Filt:String;
begin
     Mon :=tvDay.Selected.Index+1;
     st:=StrToInt(Sd.Text);
     En:=StrToInt(Ed.Text);
     Frodm.Invo.Filtered:=False;
     IF tvDay.Selected.Level > 0 Then
     Begin
      Filt:='(Dat >='+IntToStr(Year*10000+Mon*100+St)+' and Dat <='+IntToStr(Year*10000+Mon*100+En)+')';
      Filt:=Filt+' or (Dat >='+IntToStr(MYear*10000+Mon*100+St)+' and Dat <='+IntToStr(MYear*10000+Mon*100+En)+')';
     End;
     If FCkod.KeyValue <>Null Then Filt:=Filt+' and Ckod='+IntToStr(Fckod.KeyValue);
     If FAcNam.Text <> '' Then Filt:=Filt+' and Nam ='+QuotedStr(FAcNam.Text);
     If FVName.KeyValue <>Null Then Filt:=Filt+' and Visit='+IntToStr(FVName.KeyValue);
     If Pos(' and',Filt) = 1 Then Delete(Filt,1,4);
     Frodm.Invo.Filter:=Filt;
     Frodm.Invo.Filtered:=True;

     //Fsum.Text:=CurrToFar(GetSum(Filt));
     GetSum(Filt);
     Panel2.Visible:=True;
end;

procedure TFInvArsh.BGridDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
Var
DrawRect: TRect;
begin
     If Not(Frodm.InvoPerm.Value) Then BGrid.Canvas.Font.Color :=clRed;
     BGrid.DefaultDrawColumnCell(Rect,DataCol,Column,State);
    if (Column.Field.FieldName ='Ckod' ) then
    Begin
     DrawRect:=Rect;
     BGrid.Canvas.FillRect(DrawRect);
     If Not Column.Field.IsNull Then
     BGrid.Canvas.Textout(DrawRect.Left+4,DrawRect.Top,CentName(Column.Field.Value));
    End;
end;

procedure TFInvArsh.tvDayKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
       Key :=#0;
       tvDayClick(Sender);
     End;
end;

procedure TFInvArsh.Sp1Click(Sender: TObject);
Var
I:Integer;
begin
     If BGrid.SelectedRows.Count > 0 Then
      For I:=0 To BGrid.SelectedRows.Count-1 Do
      Begin
        Frodm.Invo.GotoBookmark(Pointer(BGrid.SelectedRows.items[I]));
        Frodm.Invo.Edit;
        Frodm.InvoPerm.Value:=True;
        Frodm.Invo.Post;
      End
     Else
     Begin
        Frodm.Invo.Edit;
        Frodm.InvoPerm.Value:=True;
        Frodm.Invo.Post;
     End;
end;

procedure TFInvArsh.Sp2Click(Sender: TObject);
Var
I:Integer;
begin
     If Not Sp2.Enabled Then Exit;
     If BGrid.SelectedRows.Count > 0 Then
      For I:=0 To BGrid.SelectedRows.Count-1 Do
      Begin
        Frodm.Invo.GotoBookmark(Pointer(BGrid.SelectedRows.items[I]));
        Frodm.Invo.Edit;
        Frodm.InvoPerm.Value:=False;
        Frodm.Invo.Post;
      End
     Else
     Begin
        Frodm.Invo.Edit;
        Frodm.InvoPerm.Value:=False;
        Frodm.Invo.Post;
     End;
end;

procedure TFInvArsh.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key Of
     VK_ESCAPE  : Close;
     VK_ADD     : SP1Click(Sender);
     VK_SUBTRACT: Sp2Click(Sender);
     End;
end;

procedure TFInvArsh.spBillClick(Sender: TObject);
Var
No:Integer;
Factor:TFInvoice;
begin
     NO:=Frodm.InvoNo.Value;
     Frodm.Invo.Filtered:=True;
     CreatingForm(TFInvoice,'FInvoice',FInvoice);
     FInvoice.FNo.Text:=IntToStr(No);
     FInvoice.FNoExit(Sender);
     Frodm.Invo.Locate('No',No,[loCaseInsensitive]);
end;

procedure TFInvArsh.BGridKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
      Key :=#0;
      spBillClick(Sender);
     End;
end;

procedure TFInvArsh.Cb1Click(Sender: TObject);
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

procedure TFInvArsh.FNoKeyPress(Sender: TObject; var Key: Char);
begin
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;
     If Key = #13 Then spBillClick(Sender);
end;

procedure TFInvArsh.FNoChange(Sender: TObject);
begin
     Frodm.Invo.Filter:='';
     Frodm.Invo.Filtered:=False;
     BGrid.SelectedRows.Clear;
     BGrid.DataSource.DataSet.Locate('No',StrToIntDef(FNo.Text,0),[loCaseInsensitive]);
end;

procedure TFInvArsh.sp3Click(Sender: TObject);
Var
I,Min,Max:Integer;
Flt:String;
begin
     Flt:=Frodm.Invo.Filter;
     lbFacNo.Items.Clear;
     lbFacNo.Width:=55;
     If Qu.Active Then Exit;
     Qu.Close;
     Qu.SQL.Clear;
     Qu.SQL.Add('Select I.No N1 From Invoice I ');
     If Flt > '' Then  Qu.SQL.Add('Where '+Flt);
     Qu.SQL.Add('Order By I.No ');
     Qu.Open;
     Qu.First;
     Min:=Qu.Fields[0].AsInteger;
     Qu.Last;
     Max:=Qu.Fields[0].AsInteger;
     For I:=Min To Max Do
     Begin
      If Not Qu.Locate('N1',I,[loCaseInsensitive]) Then//Frodm.Invo
       lbFacNo.Items.Add(IntToStr(I));
     End;
     Qu.Close;
end;

procedure TFInvArsh.FCKodDropDown(Sender: TObject);
begin
     FCkod.KeyValue:=Null;
end;

procedure TFInvArsh.FCKodKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetCentLookup(Sender,Key);
end;

procedure TFInvArsh.FVNameDropDown(Sender: TObject);
begin
      FVName.KeyValue:=Null;
end;

end.
