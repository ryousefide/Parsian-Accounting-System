unit MArsh;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, XPListBox;

type
  TFMArsh = class(TForm)
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
  FMArsh: TFMArsh;

implementation

uses Routins, FrooshDM, ProVar, MainForm, Db, AnbMov;

{$R *.DFM}

procedure TFMArsh.SetImage;
begin
     Main.glKey.GetBitmap(12,sp1.Glyph);
     Main.glKey.GetBitmap(13,sp2.Glyph);
     Main.glKey.GetBitmap(11,spBill.Glyph);
end;

procedure TFMArsh.FormActivate(Sender: TObject);
begin
     If Frodm.Move.State In[dsEdit,dsInsert] Then FAnbMov.BsaveClick(Sender);
     Frodm.Move.open;
end;

procedure TFMArsh.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Frodm.Move.Filter:='';
     Frodm.Move.Filtered:=False;
     Frodm.Move.Close;
     Action:=caFree;
end;

procedure TFMArsh.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     SetImage;
     Frodm.Move.Filtered:=True;
     Year:=DateToInt(Beg_Date) Div 10000;
     MYear:=DateToInt(End_Date) Div 10000;
     If Year = 0 Then Year:= Fardate Div 10000;
     sp2.Enabled:=Boss;
end;

procedure TFMArsh.tvDayClick(Sender: TObject);
Var
Filt:String;
begin
     Mon :=tvDay.Selected.Index+1;
     st:=StrToInt(Sd.Text);
     En:=StrToInt(Ed.Text);
     Frodm.Move.Filtered:=False;
     IF tvDay.Selected.Level = 0 Then Exit;
     Filt:='(Dat >='+IntToStr(Year*10000+Mon*100+St)+' and Dat <='+IntToStr(Year*10000+Mon*100+En)+')';
     Filt:=Filt+' or (Dat >='+IntToStr(MYear*10000+Mon*100+St)+' and Dat <='+IntToStr(MYear*10000+Mon*100+En)+')';
     Frodm.Move.Filter:=Filt;
     Frodm.Move.Filtered:=True;
end;

procedure TFMArsh.BGridDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
     If Not(Frodm.MovePerm.Value) Then BGrid.Canvas.Font.Color :=clRed;
     BGrid.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TFMArsh.tvDayKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
       Key :=#0;
       tvDayClick(Sender);
     End;
end;

procedure TFMArsh.Sp1Click(Sender: TObject);
Var
I:Integer;
begin
     If BGrid.SelectedRows.Count > 0 Then
      For I:=0 To BGrid.SelectedRows.Count-1 Do
      Begin
        Frodm.Move.GotoBookmark(Pointer(BGrid.SelectedRows.items[I]));
        Frodm.Move.Edit;
        Frodm.MovePerm.Value:=True;
        Frodm.Move.Post;
      End
     Else
     Begin
        Frodm.Move.Edit;
        Frodm.MovePerm.Value:=True;
        Frodm.Move.Post;
     End;
end;

procedure TFMArsh.Sp2Click(Sender: TObject);
{begin
     Frodm.Move.Edit;
     Frodm.MovePerm.Value:=False;
     Frodm.Move.Post;}
Var
I:Integer;
begin
     If Not Sp2.Enabled Then Exit;
     If BGrid.SelectedRows.Count > 0 Then
      For I:=0 To BGrid.SelectedRows.Count-1 Do
      Begin
        Frodm.Move.GotoBookmark(Pointer(BGrid.SelectedRows.items[I]));
        Frodm.Move.Edit;
        Frodm.MovePerm.Value:=False;
        Frodm.Move.Post;
      End
     Else
     Begin
        Frodm.Move.Edit;
        Frodm.MovePerm.Value:=False;
        Frodm.Move.Post;
     End;
end;

procedure TFMArsh.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key Of
     VK_ESCAPE  : Close;
     VK_ADD     : SP1Click(Sender);
     VK_SUBTRACT: Sp2Click(Sender);
     End;
end;

procedure TFMArsh.spBillClick(Sender: TObject);
Var
No:Integer;
begin
     NO:=Frodm.MoveNo.Value;
     Frodm.Move.Filtered:=True;
     CreatingForm(TFAnbMov,'FAnbMov',FAnbMov);
     FAnbMov.FNo.Text:=IntToStr(No);
     FAnbMov.FNoExit(Sender);
     Frodm.Move.Locate('No',No,[loCaseInsensitive]);
end;

procedure TFMArsh.BGridKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
      Key :=#0;
      spBillClick(Sender);
     End;
end;

procedure TFMArsh.Cb1Click(Sender: TObject);
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

procedure TFMArsh.FNoKeyPress(Sender: TObject; var Key: Char);
begin
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;
     If Key = #13 Then spBillClick(Sender);
end;

procedure TFMArsh.FNoChange(Sender: TObject);
begin
     Frodm.Move.Filter:='';
     Frodm.Move.Filtered:=False;
     BGrid.SelectedRows.Clear;
     BGrid.DataSource.DataSet.Locate('No',StrToIntDef(FNo.Text,0),[loCaseInsensitive]);
end;

procedure TFMArsh.sp3Click(Sender: TObject);
Var
I,Min,Max:Integer;
Flt:String;
begin
     Flt:=Frodm.Move.Filter;
     lbFacNo.Items.Clear;
     lbFacNo.Width:=55;
     If Qu.Active Then Exit;
     Qu.Close;
     Qu.SQL.Clear;
     Qu.SQL.Add('Select I.No N1 From Move I ');
     If Flt > '' Then  Qu.SQL.Add('Where '+Flt);
     Qu.SQL.Add('Order By I.No ');
     Qu.Open;
     Qu.First;
     Min:=Qu.Fields[0].AsInteger;
     Qu.Last;
     Max:=Qu.Fields[0].AsInteger;
     For I:=Min To Max Do
     Begin
      If Not Qu.Locate('N1',I,[loCaseInsensitive]) Then//Frodm.Move
       lbFacNo.Items.Add(IntToStr(I));
     End;
     Qu.Close;
end;

end.
