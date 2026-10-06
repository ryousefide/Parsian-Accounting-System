unit RVosArsh;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, DBCtrls;

type
  TFRVosArsh = class(TForm)
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
    Label4: TLabel;
    FInv: TEdit;
    sp3: TSpeedButton;
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
    procedure FNoChange(Sender: TObject);
    procedure FNoKeyPress(Sender: TObject; var Key: Char);
    procedure FInvChange(Sender: TObject);
    procedure FCKodKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
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
  FRVosArsh: TFRVosArsh;

implementation

uses Routins, FrooshDM, ProVar, MainForm, Db, CRoutins, RVosol;

{$R *.DFM}
Function TFRVosArsh.Beg_Date:Integer;
begin
     Qu.SQL.Clear;
     Qu.SQL.Add(Encrypt('½«¤«­œðÃ§¢èÌ¯œçðÊž¡£ð¾¾«',17));
     Qu.Open;
     Result:=Qu.Fields[0].AsInteger;
     Qu.Close;
end;

procedure TFRVosArsh.SetImage;
begin
     Main.glKey.GetBitmap(12,sp1.Glyph);
     Main.glKey.GetBitmap(13,sp2.Glyph);
     Main.glKey.GetBitmap(9,sp3.Glyph);
     Main.glKey.GetBitmap(11,spBill.Glyph);
end;


procedure TFRVosArsh.FormActivate(Sender: TObject);
begin
     If Frodm.Rvos.State In[dsEdit,dsInsert] Then FRVosol.BSaveClick(Sender);
end;

procedure TFRVosArsh.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Frodm.Rvos.Filtered:=False;
     Frodm.Rvos.Filter:='';
     Action:=caFree;
end;

procedure TFRVosArsh.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     SetImage;
     //FAcNam.Items.Assign(AcList);
     Fill_Comb(Frodm.JariNam,'Nam',FAcNam.Items);
     Frodm.Rvos.Filtered:=True;
     Year:=Beg_Date Div 10000;
     If Year = 0 Then Year:= Fardate Div 10000;
     sp2.Enabled:=CUser.Master;;
end;

procedure TFRVosArsh.tvDayClick(Sender: TObject);
Var
Filt:String;
begin
     Mon :=tvDay.Selected.Index+1;
     st:=StrToIntDef(Sd.Text,1);
     En:=StrToIntDef(Ed.Text,31);
     Frodm.Rvos.Filtered:=False;
     IF tvDay.Selected.Level > 0 Then
     Filt:=' Dat >='+IntToStr(Year*10000+Mon*100+St)+' and Dat <='+IntToStr(Year*10000+Mon*100+En);
     If FCkod.KeyValue <>Null Then Filt:=Filt+' and Ckod='+IntToStr(Fckod.KeyValue);
     If FAcNam.Text <> '' Then Filt:=Filt+' and Acnam ='+QuotedStr(FAcNam.Text);
     If Pos(' and',Filt) = 1 Then Delete(Filt,1,4);
     Frodm.Rvos.Filter:=Filt;
     Frodm.Rvos.Filtered:=True;
end;

procedure TFRVosArsh.BGridDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
Var
DrawRect: TRect;
begin
    If Not(Frodm.RvosPerm.Value) Then BGrid.Canvas.Font.Color :=clRed;
    BGrid.DefaultDrawColumnCell(Rect,DataCol,Column,State);
    if (Column.Field.FieldName ='Ckod' ) then
    Begin
     DrawRect:=Rect;
     BGrid.Canvas.FillRect(DrawRect);
     If Not Column.Field.IsNull Then
     BGrid.Canvas.Textout(DrawRect.Left+4,DrawRect.Top,CentName(Column.Field.Value));
    End;
end;

procedure TFRVosArsh.tvDayKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
       Key :=#0;
       tvDayClick(Sender);
     End;
end;

procedure TFRVosArsh.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key Of
     VK_ESCAPE  : Close;
     VK_ADD     : SP1Click(Sender);
     VK_SUBTRACT: Sp2Click(Sender);
     End;
end;

procedure TFRVosArsh.spBillClick(Sender: TObject);
Var
No:Integer;
begin
     NO:=Frodm.RvosNo.Value;
     CreatingForm(TFRVosol,'FRVosol',FRVosol);
     Frodm.Rvos.Cancel;
     Frodm.Rvos.Locate('No',NO,[loCaseInsensitive]);
     FRVosol.FNo.Text:=Frodm.RvosNo.AsString;
     FRVosol.Dat1.Text:=IntTodate(Frodm.RvosDat.Value);
end;

procedure TFRVosArsh.BGridKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
      Key :=#0;
      spBillClick(Sender);
     End;
end;

procedure TFRVosArsh.FCKodDropDown(Sender: TObject);
begin
     FCkod.KeyValue:=Null;
end;

procedure TFRVosArsh.FNoChange(Sender: TObject);
begin
     BGrid.SelectedRows.Clear;
     BGrid.DataSource.DataSet.Locate('No',StrToIntDef(FNo.Text,0),[loCaseInsensitive]);
end;

procedure TFRVosArsh.FNoKeyPress(Sender: TObject; var Key: Char);
begin
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;
     If Key = #13 Then spBillClick(Sender);
end;

procedure TFRVosArsh.FInvChange(Sender: TObject);
begin
     BGrid.SelectedRows.Clear;
     BGrid.DataSource.DataSet.Locate('Inv',StrToIntDef(FInv.Text,0),[loCaseInsensitive]);
end;

procedure TFRVosArsh.FCKodKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetCentLookup(Sender,Key);
end;

procedure TFRVosArsh.Sp2Click(Sender: TObject);
Var
I:Integer;
begin
     If Not Sp2.Enabled Then Exit;
     If BGrid.SelectedRows.Count > 0 Then
      For I:=0 To BGrid.SelectedRows.Count-1 Do
      Begin
        Frodm.Rvos.GotoBookmark(Pointer(BGrid.SelectedRows.items[I]));
        Frodm.Rvos.Edit;
        Frodm.RvosPerm.Value:=False;
        Frodm.Rvos.Post;
      End
     Else
     Begin
        Frodm.Rvos.Edit;
        Frodm.RvosPerm.Value:=False;
        Frodm.Rvos.Post;
     End;
end;

procedure TFRVosArsh.Sp1Click(Sender: TObject);
Var
I:Integer;
begin
     If BGrid.SelectedRows.Count > 0 Then
      For I:=0 To BGrid.SelectedRows.Count-1 Do
      Begin
        Frodm.Rvos.GotoBookmark(Pointer(BGrid.SelectedRows.items[I]));
        Frodm.Rvos.Edit;
        Frodm.RvosPerm.Value:=True;
        Frodm.Rvos.Post;
      End
     Else
     Begin
        Frodm.Rvos.Edit;
        Frodm.RvosPerm.Value:=True;
        Frodm.Rvos.Post;
     End;
end;

end.
