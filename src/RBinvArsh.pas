unit RBinvArsh;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TFRBinvArsh = class(TForm)
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
  private
    { Private declarations }
    Year:Integer;
    MYear:Integer;
    Mon:Integer;
    St,En:Integer;
    procedure SetImage;
  public
    { Public declarations }
  end;

var
  FRBinvArsh: TFRBinvArsh;

implementation

uses Routins, FrooshDM, ProVar, MainForm, RejBinvo, Db;

{$R *.DFM}
procedure TFRBinvArsh.SetImage;
begin
     Main.glKey.GetBitmap(12,sp1.Glyph);
     Main.glKey.GetBitmap(13,sp2.Glyph);
     Main.glKey.GetBitmap(11,spBill.Glyph);
end;

procedure TFRBinvArsh.FormActivate(Sender: TObject);
begin
     If Frodm.RejBinvo.State In[dsEdit,dsInsert] Then FRejBvoice.BsaveClick(Sender);
     If Not Frodm.RejBinvo.Active Then Frodm.RejBinvo.Open;
end;

procedure TFRBinvArsh.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Frodm.RejBinvo.Filtered:=False;
     Frodm.RejBinvo.Close;
     Action:=caFree;
end;

procedure TFRBinvArsh.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     SetImage;
     Year:=DateToInt(Beg_Date) Div 10000;
     MYear:=DateToInt(End_Date) Div 10000;
     If Year = 0 Then Year:= Fardate Div 10000;
     sp2.Enabled:=Boss;
end;

procedure TFRBinvArsh.tvDayClick(Sender: TObject);
Var
Filt:String;
begin
     Mon :=tvDay.Selected.Index+1;
     st:=StrToInt(Sd.Text);
     En:=StrToInt(Ed.Text);
     Frodm.RejBinvo.Filtered:=False;
     IF tvDay.Selected.Level = 0 Then Exit;
     Filt:='(Dat >='+IntToStr(Year*10000+Mon*100+St)+' and Dat <='+IntToStr(Year*10000+Mon*100+En)+')';
     Filt:=Filt+' or (Dat >='+IntToStr(MYear*10000+Mon*100+St)+' and Dat <='+IntToStr(MYear*10000+Mon*100+En)+')';
     Frodm.RejBinvo.Filter:=Filt;
     Frodm.RejBinvo.Filtered:=True;
end;

procedure TFRBinvArsh.BGridDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
     If Not(Frodm.RejBinvoPerm.Value) Then BGrid.Canvas.Font.Color :=clRed;
     BGrid.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TFRBinvArsh.tvDayKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
       Key :=#0;
       tvDayClick(Sender);
     End;
end;

procedure TFRBinvArsh.Sp1Click(Sender: TObject);
Var
I:Integer;
begin
     If BGrid.SelectedRows.Count > 0 Then
      For I:=0 To BGrid.SelectedRows.Count-1 Do
      Begin
        Frodm.RejBinvo.GotoBookmark(Pointer(BGrid.SelectedRows.items[I]));
        Frodm.RejBinvo.Edit;
        Frodm.RejBinvoPerm.Value:=True;
        Frodm.RejBinvo.Post;
      End
     Else
     Begin
        Frodm.RejBinvo.Edit;
        Frodm.RejBinvoPerm.Value:=True;
        Frodm.RejBinvo.Post;
     End;
end;

procedure TFRBinvArsh.Sp2Click(Sender: TObject);
Var
I:Integer;
begin
     If Not Sp2.Enabled Then Exit;
     If BGrid.SelectedRows.Count > 0 Then
      For I:=0 To BGrid.SelectedRows.Count-1 Do
      Begin
       Frodm.RejBinvo.GotoBookmark(Pointer(BGrid.SelectedRows.items[I]));
       Frodm.RejBinvo.Edit;
       Frodm.RejBinvoPerm.Value:=False;
       Frodm.RejBinvo.Post;
      End
     Else
     Begin
       Frodm.RejBinvo.Edit;
       Frodm.RejBinvoPerm.Value:=False;
       Frodm.RejBinvo.Post;
     End;
end;

procedure TFRBinvArsh.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key Of
     VK_ESCAPE  : Close;
     VK_ADD     : SP1Click(Sender);
     VK_SUBTRACT: Sp2Click(Sender);
     End;
end;

procedure TFRBinvArsh.spBillClick(Sender: TObject);
Var
No:Integer;
begin
     NO:=Frodm.RejBinvoNo.Value;
     Frodm.RejBinvo.Filtered:=True;
     CreatingForm(TFRejBvoice,'FRejBvoice',FRejBvoice);
     FRejBvoice.FNo.Text:=IntToStr(No);
     FRejBvoice.FNoExit(Sender);
     Frodm.RejBinvo.Locate('No',No,[loCaseInsensitive]);
end;

procedure TFRBinvArsh.BGridKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
      Key :=#0;
      spBillClick(Sender);
     End;
end;

procedure TFRBinvArsh.Cb1Click(Sender: TObject);
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

procedure TFRBinvArsh.FNoKeyPress(Sender: TObject; var Key: Char);
begin
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;
     If Key = #13 Then spBillClick(Sender);
end;

procedure TFRBinvArsh.FNoChange(Sender: TObject);
begin
     Frodm.RejBinvo.Filter:='';
     Frodm.RejBinvo.Filtered:=False;
     BGrid.SelectedRows.Clear;
     BGrid.DataSource.DataSet.Locate('No',StrToIntDef(FNo.Text,0),[loCaseInsensitive]);
end;

end.
