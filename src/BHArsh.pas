unit BHArsh;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, DBCtrls;

type
  TFBHArsh = class(TForm)
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
    FAcNam: TComboBox;
    Label5: TLabel;
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
    procedure FNoKeyPress(Sender: TObject; var Key: Char);
    procedure FNoChange(Sender: TObject);
    procedure FCKodKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FInvChange(Sender: TObject);
    procedure Sp2Click(Sender: TObject);
    procedure Sp1Click(Sender: TObject);
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
  FBHArsh: TFBHArsh;

implementation

uses Routins, FrooshDM, ProVar, MainForm, Db, CashMoney, HavBill, CRoutins;

{$R *.DFM}
Function TFBHArsh.Beg_Date:Integer;
begin
     Qu.SQL.Clear;
     Qu.SQL.Add(Encrypt('½«¤«­œðÃ§¢èÌ¯œçðÊž¡£ðÎÈ¯š',17));
     Qu.Open;
     Result:=Qu.Fields[0].AsInteger;
     Qu.Close;
end;

procedure TFBHArsh.SetImage;
begin
     Main.glKey.GetBitmap(12,sp1.Glyph);
     Main.glKey.GetBitmap(13,sp2.Glyph);
     Main.glKey.GetBitmap(9,sp3.Glyph);
     Main.glKey.GetBitmap(11,spBill.Glyph);
end;

procedure TFBHArsh.FormActivate(Sender: TObject);
begin
     If Frodm.BHav.State In[dsEdit,dsInsert] Then FHav.BDoClick(Sender);
     If Not Frodm.BHav.Active Then Frodm.BHav.Open;
end;

procedure TFBHArsh.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Frodm.BHav.Filtered:=False;
     Frodm.BHav.Filter:='';
     Frodm.BHav.Close;
     Action:=caFree;
end;

procedure TFBHArsh.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     SetImage;
     Fill_Comb(Frodm.BHav,'AccNam',FAcNam.Items);//FAcNam.Items.Assign(AcList);
     Frodm.BHav.Filtered:=True;
     Year:=Beg_Date Div 10000;
     If Year = 0 Then Year:= Fardate Div 10000;
     sp2.Enabled:=CUser.Master;;
end;

procedure TFBHArsh.tvDayClick(Sender: TObject);
Var
Filt:String;
begin
     Mon :=tvDay.Selected.Index+1;
     st:=StrToIntDef(Sd.Text,1);
     En:=StrToIntDef(Ed.Text,31);
     Frodm.BHav.Filtered:=False;
     IF tvDay.Selected.Level > 0 Then
     Filt:=' Dat >='+IntToStr(Year*10000+Mon*100+St)+' and Dat <='+IntToStr(Year*10000+Mon*100+En);
     If FCkod.KeyValue <>Null Then Filt:=Filt+' and Ckod='+IntToStr(Fckod.KeyValue);
     If FAcNam.Text <> '' Then Filt:=Filt+' and Accnam ='+QuotedStr(FAcNam.Text);
     If Pos(' and',Filt) = 1 Then Delete(Filt,1,4);
     Frodm.BHav.Filter:=Filt;
     Frodm.BHav.Filtered:=True;
end;

procedure TFBHArsh.BGridDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
Var
DrawRect: TRect;
begin
    If Not(Frodm.BHavLPerm.Value) Then BGrid.Canvas.Font.Color :=clRed;
    BGrid.DefaultDrawColumnCell(Rect,DataCol,Column,State);
    if (Column.Field.FieldName ='Ckod' ) then
    Begin
     DrawRect:=Rect;
     Bgrid.Canvas.FillRect(DrawRect);
     If Not Column.Field.IsNull Then
     Bgrid.Canvas.Textout(DrawRect.Left+4,DrawRect.Top,CentName(Column.Field.Value));
    End;
end;

procedure TFBHArsh.tvDayKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
       Key :=#0;
       tvDayClick(Sender);
     End;
end;

procedure TFBHArsh.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key Of
     VK_ESCAPE  : Close;
     VK_ADD     : SP1Click(Sender);
     VK_SUBTRACT: Sp2Click(Sender);
     End;
end;

procedure TFBHArsh.spBillClick(Sender: TObject);
Var
No:Integer;
begin
     NO:=Frodm.BHavNo.Value;
     CreatingForm(TFHav,'FHav',FHav);
     Frodm.BHav.Cancel;
     Frodm.BHav.Locate('No',NO,[loCaseInsensitive]);
     FHav.FNo.Text:=Frodm.BHavNo.AsString;
     FHav.Dat1.Text:=IntTodate(Frodm.BHavDat.Value);
end;

procedure TFBHArsh.BGridKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
      Key :=#0;
      spBillClick(Sender);
     End;
end;

procedure TFBHArsh.FCKodDropDown(Sender: TObject);
begin
     FCkod.KeyValue:=Null;
end;

procedure TFBHArsh.FNoKeyPress(Sender: TObject; var Key: Char);
begin
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;
     If Key = #13 Then spBillClick(Sender);
end;

procedure TFBHArsh.FNoChange(Sender: TObject);
begin
     BGrid.SelectedRows.Clear;
     BGrid.DataSource.DataSet.Locate('No',StrToIntDef(FNo.Text,0),[loCaseInsensitive]);
end;

procedure TFBHArsh.FCKodKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetCentLookup(Sender,Key);
end;

procedure TFBHArsh.FInvChange(Sender: TObject);
begin
     BGrid.SelectedRows.Clear;
     BGrid.DataSource.DataSet.Locate('Inv',StrToIntDef(FInv.Text,0),[loCaseInsensitive]);
end;

procedure TFBHArsh.Sp2Click(Sender: TObject);
Var
I:Integer;
begin
     If Not Sp2.Enabled Then Exit;
     If BGrid.SelectedRows.Count > 0 Then
      For I:=0 To BGrid.SelectedRows.Count-1 Do
      Begin
        Frodm.BHav.GotoBookmark(Pointer(BGrid.SelectedRows.items[I]));
        Frodm.BHav.Edit;
        Frodm.BHavLPerm.Value:=False;
        Frodm.BHav.Post;
      End
     Else
     Begin
        Frodm.BHav.Edit;
        Frodm.BHavLPerm.Value:=False;
        Frodm.BHav.Post;
     End;
end;

procedure TFBHArsh.Sp1Click(Sender: TObject);
Var
I:Integer;
begin
     If BGrid.SelectedRows.Count > 0 Then
      For I:=0 To BGrid.SelectedRows.Count-1 Do
      Begin
        Frodm.BHav.GotoBookmark(Pointer(BGrid.SelectedRows.items[I]));
        Frodm.BHav.Edit;
        Frodm.BHavLPerm.Value:=True;
        Frodm.BHav.Post;
      End
     Else
     Begin
        Frodm.BHav.Edit;
        Frodm.BHavLPerm.Value:=True;
        Frodm.BHav.Post;
     End;
end;

end.
