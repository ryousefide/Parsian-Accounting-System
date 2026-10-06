unit BInvArsh;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TFBInvArsh = class(TForm)
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
    sp3: TSpeedButton;
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
  private
    { Private declarations }
    Year:Integer;
    MYear:Integer;
    Mon:Integer;
    St,En:Integer;
    Procedure SetImage;
  public
    { Public declarations }
  end;

var
  FBInvArsh: TFBInvArsh;
implementation

uses Routins, FrooshDM, ProVar, MainForm, Binvoice, Converts, Db, CRoutins, Math;

{$R *.DFM}

procedure TFBInvArsh.SetImage;
begin
     Main.glKey.GetBitmap(12,sp1.Glyph);
     Main.glKey.GetBitmap(13,sp2.Glyph);
     Main.glKey.GetBitmap(0,sp3.Glyph);
     Main.glKey.GetBitmap(11,spBill.Glyph);
end;

procedure TFBInvArsh.FormActivate(Sender: TObject);
begin
     If Frodm.Binvo.State In[dsEdit,dsInsert] Then FBvoice.BsaveClick(Sender);
     If Not Frodm.Binvo.Active Then Frodm.Binvo.Open;
end;

procedure TFBInvArsh.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Frodm.Binvo.Filtered:=False;
     Frodm.Binvo.Close;
     Action:=caFree;
end;

procedure TFBInvArsh.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     SetImage;
     Year:=DateToInt(Beg_Date) Div 10000;
     MYear:=DateToInt(End_Date) Div 10000;
     If Year = 0 Then Year:= Fardate Div 10000;
     sp2.Enabled:=Boss;
end;

procedure TFBInvArsh.tvDayClick(Sender: TObject);
Var
Filt:String;
begin
     Mon :=tvDay.Selected.Index+1;
     st:=StrToInt(Sd.Text);
     En:=StrToInt(Ed.Text);
     Frodm.Binvo.Filtered:=False;
     IF tvDay.Selected.Level = 0 Then Exit;
     Filt:='(Dat >='+IntToStr(Year*10000+Mon*100+St)+' and Dat <='+IntToStr(Year*10000+Mon*100+En)+')';
     Filt:=Filt+' or (Dat >='+IntToStr(MYear*10000+Mon*100+St)+' and Dat <='+IntToStr(MYear*10000+Mon*100+En)+')';
     Frodm.Binvo.Filter:=Filt;
     Frodm.Binvo.Filtered:=True;
end;

procedure TFBInvArsh.BGridDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
Var
DrawRect: TRect;
begin
     If Not(Frodm.BinvoPerm.Value) Then BGrid.Canvas.Font.Color :=clRed;
     BGrid.DefaultDrawColumnCell(Rect,DataCol,Column,State);
    if (Column.Field.FieldName ='Ckod' ) then
    Begin
     DrawRect:=Rect;
     BGrid.Canvas.FillRect(DrawRect);
     If Not Column.Field.IsNull Then
     BGrid.Canvas.Textout(DrawRect.Left+4,DrawRect.Top,CentName(Column.Field.Value));
    End;
end;

procedure TFBInvArsh.tvDayKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
       Key :=#0;
       tvDayClick(Sender);
     End;
end;

procedure TFBInvArsh.Sp1Click(Sender: TObject);
Var
I:Integer;
begin
     If BGrid.SelectedRows.Count > 0 Then
      For I:=0 To BGrid.SelectedRows.Count-1 Do
      Begin
        Frodm.Binvo.GotoBookmark(Pointer(BGrid.SelectedRows.items[I]));
        Frodm.Binvo.Edit;
        Frodm.BinvoPerm.Value:=True;
        Frodm.Binvo.Post;
      End
     Else
     Begin
        Frodm.Binvo.Edit;
        Frodm.BinvoPerm.Value:=True;
        Frodm.Binvo.Post;
     End;
end;

procedure TFBInvArsh.Sp2Click(Sender: TObject);
Var
I:Integer;
begin
     If Not Sp2.Enabled Then Exit;
     If BGrid.SelectedRows.Count > 0 Then
      For I:=0 To BGrid.SelectedRows.Count-1 Do
      Begin
        Frodm.Binvo.GotoBookmark(Pointer(BGrid.SelectedRows.items[I]));
        Frodm.Binvo.Edit;
        Frodm.BinvoPerm.Value:=False;
        Frodm.Binvo.Post;
      End
     Else
     Begin
        Frodm.Binvo.Edit;
        Frodm.BinvoPerm.Value:=False;
        Frodm.Binvo.Post;
     End;
end;

procedure TFBInvArsh.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key Of
     VK_ESCAPE  : Close;
     VK_ADD     : SP1Click(Sender);
     VK_SUBTRACT: Sp2Click(Sender);
     End;
end;

procedure TFBInvArsh.spBillClick(Sender: TObject);
Var
No:Integer;
begin
     NO:=Frodm.BinvoNo.Value;
     Frodm.Binvo.Filtered:=True;
     CreatingForm(TFBvoice,'FBvoice',FBvoice);
     FBvoice.FNo.Text:=IntToStr(No);
     FBvoice.FNoExit(Sender);
     Frodm.Binvo.Locate('No',No,[loCaseInsensitive])
end;

procedure TFBInvArsh.BGridKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
      Key :=#0;
      spBillClick(Sender);
     End;
end;

procedure TFBInvArsh.Cb1Click(Sender: TObject);
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

procedure TFBInvArsh.FNoKeyPress(Sender: TObject; var Key: Char);
begin
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
      #9,#27,#83,#46]) Then Key:=#0;
     If Key = #13 Then spBillClick(Sender);
end;

procedure TFBInvArsh.FNoChange(Sender: TObject);
begin
     Frodm.Binvo.Filter:='';
     Frodm.Binvo.Filtered:=False;
     BGrid.SelectedRows.Clear;
     //BGrid.DataSource.DataSet.Locate('No',StrToIntDef(FNo.Text,0),[loCaseInsensitive]);
     BGrid.DataSource.DataSet.Locate('No',FNo.Text,[loCaseInsensitive]);
end;

procedure TFBInvArsh.sp3Click(Sender: TObject);
begin
     Frodm.Binvo.Filtered:=False;
     Frodm.Binvo.Filter:='Tel='+QuotedStr(FNo.Text);
     Frodm.Binvo.FindNext;
end;


end.
