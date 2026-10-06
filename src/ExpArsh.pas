unit ExpArsh;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, DBCtrls;

type
  TFExpArsh = class(TForm)
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
    Label7: TLabel;
    FCKod: TDBLookupComboBox;
    Label3: TLabel;
    FNo: TEdit;
    sp3: TSpeedButton;
    Label4: TLabel;
    FInv: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure tvDayClick(Sender: TObject);
    procedure BGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure tvDayKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure spBillClick(Sender: TObject);
    procedure BGridKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure FCKodDropDown(Sender: TObject);
    procedure FNoChange(Sender: TObject);
    procedure FCKodKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FNoKeyPress(Sender: TObject; var Key: Char);
    procedure FInvChange(Sender: TObject);
    procedure Sp1Click(Sender: TObject);
    procedure Sp2Click(Sender: TObject);
  private
    { Private declarations }
    Year:Integer;
    Mon:Integer;
    St,En:Integer;
    Function Beg_Date:Integer;
    procedure SetImage;
  public
    { Public declarations }
  end;

var
  FExpArsh: TFExpArsh;

implementation

uses Routins, FrooshDM, ProVar, MainForm, Db, CRoutins, Expense;

{$R *.DFM}
Function TFExpArsh.Beg_Date:Integer;
begin
     Qu.SQL.Clear;
     Qu.SQL.Add(Encrypt('½«¤«­œðÃ§¢èÌ¯œçðÊž¡£ðË˜ «¢',17));
     Qu.Open;
     Result:=Qu.Fields[0].AsInteger;
     Qu.Close;
end;

procedure TFExpArsh.SetImage;
begin
     Main.glKey.GetBitmap(12,sp1.Glyph);
     Main.glKey.GetBitmap(13,sp2.Glyph);
     Main.glKey.GetBitmap(9,sp3.Glyph);
     Main.glKey.GetBitmap(11,spBill.Glyph);
end;

procedure TFExpArsh.FormActivate(Sender: TObject);
begin
     If Frodm.EXP.State In[dsEdit,dsInsert] Then FExpense.BSaveClick(Sender);
     If Not Frodm.EXP.Active Then Frodm.Exp.Open;
end;

procedure TFExpArsh.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Frodm.EXP.Filtered:=False;
     Frodm.EXP.Filter:='';
     Frodm.EXP.Close;
     Action:=caFree;
end;

procedure TFExpArsh.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     SetImage;
     Frodm.EXP.Filtered:=True;
     Year:=Beg_Date Div 10000;
     If Year = 0 Then Year:= Fardate Div 10000;
     sp2.Enabled:=Boss;
end;

procedure TFExpArsh.tvDayClick(Sender: TObject);
Var
Filt:String;
begin
     Mon :=tvDay.Selected.Index+1;
     St:=StrToIntDef(Sd.Text,1);
     En:=StrToIntDef(Ed.Text,31);
     Frodm.EXP.Filtered:=False;
     IF tvDay.Selected.Level > 0 Then
     Filt:=' Dat >='+IntToStr(Year*10000+Mon*100+St)+' and Dat <='+IntToStr(Year*10000+Mon*100+En);
     If FCkod.KeyValue <>Null Then Filt:=Filt+' and Ckod='+IntToStr(Fckod.KeyValue);
     If Pos(' and',Filt) = 1 Then Delete(Filt,1,4);
     Frodm.EXP.Filter:=Filt;
     Frodm.EXP.Filtered:=True;
end;

procedure TFExpArsh.BGridDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
Var
DrawRect: TRect;
begin
    if (Column.Field.FieldName ='Ckod' ) then
    Begin
     DrawRect:=Rect;
     BGrid.Canvas.FillRect(DrawRect);
     If Not Column.Field.IsNull Then
     BGrid.Canvas.Textout(DrawRect.Left+4,DrawRect.Top,CentName(Column.Field.Value));
    End;
end;

procedure TFExpArsh.tvDayKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
       Key :=#0;
       tvDayClick(Sender);
     End;
end;

procedure TFExpArsh.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key Of
     VK_ESCAPE  : Close;
     VK_ADD     : SP1Click(Sender);
     VK_SUBTRACT: Sp2Click(Sender);
     End;
end;

procedure TFExpArsh.spBillClick(Sender: TObject);
Var
No:Integer;
begin
     NO:=Frodm.EXPNo.Value;
     CreatingForm(TFExpense,'FExpense',FExpense);
     Frodm.EXP.Cancel;
     Frodm.EXP.Locate('No',NO,[loCaseInsensitive]);
     FExpense.FNo.Text:=Frodm.EXPNo.AsString;
     FExpense.Dat1.Text:=IntTodate(Frodm.EXPDat.Value);
end;

procedure TFExpArsh.BGridKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
      Key :=#0;
      spBillClick(Sender);
     End;
end;

procedure TFExpArsh.FCKodDropDown(Sender: TObject);
begin
     FCkod.KeyValue:=Null;
end;

procedure TFExpArsh.FNoChange(Sender: TObject);
begin
     BGrid.SelectedRows.Clear;
     BGrid.DataSource.DataSet.Locate('No',StrToIntDef(FNo.Text,0),[loCaseInsensitive]);
end;

procedure TFExpArsh.FCKodKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetCentLookup(Sender,Key);
end;

procedure TFExpArsh.FNoKeyPress(Sender: TObject; var Key: Char);
begin
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;
     If Key = #13 Then spBillClick(Sender);
end;

procedure TFExpArsh.FInvChange(Sender: TObject);
begin
     BGrid.SelectedRows.Clear;
     BGrid.DataSource.DataSet.Locate('Inv',StrToIntDef(FInv.Text,0),[loCaseInsensitive]);
end;

procedure TFExpArsh.Sp1Click(Sender: TObject);
Var
I:Integer;
begin
     If BGrid.SelectedRows.Count > 0 Then
      For I:=0 To BGrid.SelectedRows.Count-1 Do
      Begin
        Frodm.EXP.GotoBookmark(Pointer(BGrid.SelectedRows.items[I]));
        Frodm.EXP.Edit;
        Frodm.ExpLperm.Value:=True;
        Frodm.EXP.Post;
      End
     Else
     Begin
        Frodm.EXP.Edit;
        Frodm.ExpLperm.Value:=True;
        Frodm.EXP.Post;
     End;
end;

procedure TFExpArsh.Sp2Click(Sender: TObject);
Var
I:Integer;
begin
     If Not Sp2.Enabled Then Exit;
     If BGrid.SelectedRows.Count > 0 Then
      For I:=0 To BGrid.SelectedRows.Count-1 Do
      Begin
        Frodm.EXP.GotoBookmark(Pointer(BGrid.SelectedRows.items[I]));
        Frodm.EXP.Edit;
        Frodm.ExpLperm.Value:=False;
        Frodm.EXP.Post;
      End
     Else
     Begin
        Frodm.EXP.Edit;
        Frodm.ExpLperm.Value:=False;
        Frodm.EXP.Post;
     End;
end;

end.
