unit DOutArsh;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, XPListBox, DBCtrls;

type
  TFDoutArsh = class(TForm)
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
    RefNo: TEdit;
    Label4: TLabel;
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
  FDoutArsh: TFDoutArsh;

implementation

uses Routins, FrooshDM, ProVar, MainForm, Db, CRoutins, DOutg;

{$R *.DFM}

procedure TFDoutArsh.SetImage;
begin
     Main.glKey.GetBitmap(12,sp1.Glyph);
     Main.glKey.GetBitmap(13,sp2.Glyph);
     Main.glKey.GetBitmap(9,sp4.Glyph);
     Main.glKey.GetBitmap(11,spBill.Glyph);
end;

procedure TFDoutArsh.FormActivate(Sender: TObject);
begin
     If Frodm.DOut.State In[dsEdit,dsInsert] Then FDOut.BsaveClick(Sender);
     If Not Frodm.DOut.Active Then  Frodm.DOut.Open;
end;

procedure TFDoutArsh.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Frodm.DOut.Filter:='';
     Frodm.DOut.Filtered:=False;
     Frodm.DOut.Close;
     Action:=caFree;
end;

procedure TFDoutArsh.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     SetImage;
     Fill_Comb(Frodm.Dout,'Nam',FAcNam.Items);//FAcNam.Items.Assign(AcList);
     Frodm.DOut.Filtered:=True;
     Year:=DateToInt(Beg_Date) Div 10000;
     MYear:=DateToInt(End_Date) Div 10000;
     If Year = 0 Then Year:= Fardate Div 10000;
     sp2.Enabled:=CUser.Master;
end;

procedure TFDoutArsh.tvDayClick(Sender: TObject);
Var
Filt:String;
begin
     Mon :=tvDay.Selected.Index+1;
     st:=StrToInt(Sd.Text);
     En:=StrToInt(Ed.Text);
     Frodm.DOut.Filtered:=False;
     IF tvDay.Selected.Level > 0 Then
     Begin
      Filt:='(Dat >='+IntToStr(Year*10000+Mon*100+St)+' and Dat <='+IntToStr(Year*10000+Mon*100+En)+')';
      Filt:=Filt+' or (Dat >='+IntToStr(MYear*10000+Mon*100+St)+' and Dat <='+IntToStr(MYear*10000+Mon*100+En)+')';
     End;
     If FCkod.KeyValue <>Null Then Filt:=Filt+' and Ckod='+IntToStr(Fckod.KeyValue);
     If FAcNam.Text <> '' Then Filt:=Filt+' and Nam ='+QuotedStr(FAcNam.Text);
     If StrToIntDef(RefNo.Text,0)>0 Then Filt:=Filt+' and Refno ='+RefNo.Text;
     If Pos(' and',Filt) = 1 Then Delete(Filt,1,4);
     Frodm.DOut.Filter:=Filt;
     Frodm.DOut.Filtered:=True;
end;

procedure TFDoutArsh.BGridDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
Var
DrawRect: TRect;
begin
     If Not(Frodm.DOutBkod.Value) Then BGrid.Canvas.Font.Color :=clRed;
     BGrid.DefaultDrawColumnCell(Rect,DataCol,Column,State);
    if (Column.Field.FieldName ='Ckod' ) then
    Begin
     DrawRect:=Rect;
     BGrid.Canvas.FillRect(DrawRect);
     If Not Column.Field.IsNull Then
     BGrid.Canvas.Textout(DrawRect.Left+4,DrawRect.Top,CentName(Column.Field.Value));
    End;
end;

procedure TFDoutArsh.tvDayKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
       Key :=#0;
       tvDayClick(Sender);
     End;
end;

procedure TFDoutArsh.Sp1Click(Sender: TObject);
Var
I:Integer;
begin
     If BGrid.SelectedRows.Count > 0 Then
      For I:=0 To BGrid.SelectedRows.Count-1 Do
      Begin
        Frodm.DOut.GotoBookmark(Pointer(BGrid.SelectedRows.items[I]));
        Frodm.DOut.Edit;
        Frodm.DOutBkod.Value:=True;
        Frodm.DOut.Post;
      End
     Else
     Begin
        Frodm.DOut.Edit;
        Frodm.DOutBkod.Value:=True;
        Frodm.DOut.Post;
     End;
end;

procedure TFDoutArsh.Sp2Click(Sender: TObject);
Var
I:Integer;
begin
     If Not Sp2.Enabled Then Exit;
     If BGrid.SelectedRows.Count > 0 Then
      For I:=0 To BGrid.SelectedRows.Count-1 Do
      Begin
        Frodm.DOut.GotoBookmark(Pointer(BGrid.SelectedRows.items[I]));
        Frodm.DOut.Edit;
        Frodm.DOutBkod.Value:=False;
        Frodm.DOut.Post;
      End
     Else
     Begin
        Frodm.DOut.Edit;
        Frodm.DOutBkod.Value:=False;
        Frodm.DOut.Post;
     End;
end;

procedure TFDoutArsh.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key Of
     VK_ESCAPE  : Close;
     VK_ADD     : SP1Click(Sender);
     VK_SUBTRACT: Sp2Click(Sender);
     End;
end;

procedure TFDoutArsh.spBillClick(Sender: TObject);
Var
No:Integer;
begin
     NO:=Frodm.DOutNo.Value;
     Frodm.DOut.Filtered:=True;
     CreatingForm(TFDout,'FDout',FDout);
     FDout.FNo.Text:=IntToStr(No);
     FDout.FNoExit(Sender);
     Frodm.DOut.Locate('No',No,[loCaseInsensitive]);
end;

procedure TFDoutArsh.BGridKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
      Key :=#0;
      spBillClick(Sender);
     End;
end;

procedure TFDoutArsh.Cb1Click(Sender: TObject);
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

procedure TFDoutArsh.FNoKeyPress(Sender: TObject; var Key: Char);
begin
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;
     If Key = #13 Then spBillClick(Sender);
end;

procedure TFDoutArsh.FNoChange(Sender: TObject);
begin
     Frodm.DOut.Filter:='';
     Frodm.DOut.Filtered:=False;
     BGrid.SelectedRows.Clear;
     BGrid.DataSource.DataSet.Locate('No',StrToIntDef(FNo.Text,0),[loCaseInsensitive]);
end;

procedure TFDoutArsh.sp3Click(Sender: TObject);
Var
I,Min,Max:Integer;
Flt:String;
begin
     Flt:=Frodm.DOut.Filter;
     lbFacNo.Items.Clear;
     lbFacNo.Width:=55;
     If Qu.Active Then Exit;
     Qu.Close;
     Qu.SQL.Clear;
     Qu.SQL.Add('Select I.No N1 From DOut I ');
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

procedure TFDoutArsh.FCKodDropDown(Sender: TObject);
begin
     FCkod.KeyValue:=Null;
end;

procedure TFDoutArsh.FCKodKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetCentLookup(Sender,Key);
end;

end.
