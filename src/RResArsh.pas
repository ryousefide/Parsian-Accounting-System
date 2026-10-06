unit RResArsh;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, DBCtrls;

type
  TFRResArsh = class(TForm)
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
  FRResArsh: TFRResArsh;

implementation

uses Routins, FrooshDM, ProVar, MainForm, Db, RRes, CRoutins;

{$R *.DFM}
Function TFRResArsh.Beg_Date:Integer;
begin
     Qu.SQL.Clear;
     Qu.SQL.Add(Encrypt('½«¤«­œðÃ§¢èÌ¯œçðÊž¡£ð¾¾«',17));
     Qu.Open;
     Result:=Qu.Fields[0].AsInteger;
     Qu.Close;
end;

procedure TFRResArsh.SetImage;
begin
     Main.glKey.GetBitmap(12,sp1.Glyph);
     Main.glKey.GetBitmap(13,sp2.Glyph);
     Main.glKey.GetBitmap(9,sp3.Glyph);
     Main.glKey.GetBitmap(11,spBill.Glyph);
end;


procedure TFRResArsh.FormActivate(Sender: TObject);
begin
     If Frodm.RRes.State In[dsEdit,dsInsert] Then FRRes.BSaveClick(Sender);
     If Not Frodm.RRes.Active Then Frodm.RRes.Open;
end;

procedure TFRResArsh.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Frodm.RRes.Filtered:=False;
     Frodm.RRes.Filter:='';
     Frodm.RRes.Close;
     Action:=caFree;
end;

procedure TFRResArsh.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     SetImage;
     Fill_Comb(Frodm.RRes,'AcNam',FAcNam.Items);//FAcNam.Items.Assign(AcList);
     Frodm.RRes.Filtered:=True;
     Year:=Beg_Date Div 10000;
     If Year = 0 Then Year:= Fardate Div 10000;
     sp2.Enabled:=CUser.Master;;
end;

procedure TFRResArsh.tvDayClick(Sender: TObject);
Var
Filt:String;
begin
     Mon :=tvDay.Selected.Index+1;
     st:=StrToIntDef(Sd.Text,1);
     En:=StrToIntDef(Ed.Text,31);
     Frodm.RRes.Filtered:=False;
     IF tvDay.Selected.Level > 0 Then
     Filt:=' Dat >='+IntToStr(Year*10000+Mon*100+St)+' and Dat <='+IntToStr(Year*10000+Mon*100+En);
     If FCkod.KeyValue <>Null Then Filt:=Filt+' and Ckod='+IntToStr(Fckod.KeyValue);
     If FAcNam.Text <> '' Then Filt:=Filt+' and Acnam ='+QuotedStr(FAcNam.Text);
     If Pos(' and',Filt) = 1 Then Delete(Filt,1,4);
     Frodm.RRes.Filter:=Filt;
     Frodm.RRes.Filtered:=True;
end;

procedure TFRResArsh.BGridDrawColumnCell(Sender: TObject; const Rect: TRect;
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
    If Not(Frodm.RResPerm.Value) Then BGrid.Canvas.Font.Color :=clRed;
end;

procedure TFRResArsh.tvDayKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
       Key :=#0;
       tvDayClick(Sender);
     End;
end;

procedure TFRResArsh.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key Of
     VK_ESCAPE  : Close;
     VK_ADD     : SP1Click(Sender);
     VK_SUBTRACT: Sp2Click(Sender);
     End;
end;

procedure TFRResArsh.spBillClick(Sender: TObject);
Var
No:Integer;
begin
     NO:=Frodm.RResNo.Value;
     CreatingForm(TFRRes,'FRRes',FRRes);
     Frodm.RRes.Cancel;
     Frodm.RRes.Locate('No',NO,[loCaseInsensitive]);
     FRRes.FNo.Text:=Frodm.RResNo.AsString;
     FRRes.Dat1.Text:=IntTodate(Frodm.RResDat.Value);
end;

procedure TFRResArsh.BGridKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
      Key :=#0;
      spBillClick(Sender);
     End;
end;

procedure TFRResArsh.FCKodDropDown(Sender: TObject);
begin
     FCkod.KeyValue:=Null;
end;

procedure TFRResArsh.FNoChange(Sender: TObject);
begin
     BGrid.SelectedRows.Clear;
     BGrid.DataSource.DataSet.Locate('No',StrToIntDef(FNo.Text,0),[loCaseInsensitive]);
end;

procedure TFRResArsh.FNoKeyPress(Sender: TObject; var Key: Char);
begin
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;
     If Key = #13 Then spBillClick(Sender);
end;

procedure TFRResArsh.FInvChange(Sender: TObject);
begin
     BGrid.SelectedRows.Clear;
     BGrid.DataSource.DataSet.Locate('Inv',StrToIntDef(FInv.Text,0),[loCaseInsensitive]);
end;

procedure TFRResArsh.FCKodKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetCentLookup(Sender,Key);
end;

procedure TFRResArsh.Sp2Click(Sender: TObject);
Var
I:Integer;
begin
     If Not Sp2.Enabled Then Exit;
     If BGrid.SelectedRows.Count > 0 Then
      For I:=0 To BGrid.SelectedRows.Count-1 Do
      Begin
        Frodm.RRes.GotoBookmark(Pointer(BGrid.SelectedRows.items[I]));
        Frodm.RRes.Edit;
        Frodm.RResPerm.Value:=False;
        Frodm.RRes.Post;
      End
     Else
     Begin
        Frodm.RRes.Edit;
        Frodm.RResPerm.Value:=False;
        Frodm.RRes.Post;
     End;
end;

procedure TFRResArsh.Sp1Click(Sender: TObject);
Var
I:Integer;
begin
     If BGrid.SelectedRows.Count > 0 Then
      For I:=0 To BGrid.SelectedRows.Count-1 Do
      Begin
        Frodm.RRes.GotoBookmark(Pointer(BGrid.SelectedRows.items[I]));
        Frodm.RRes.Edit;
        Frodm.RResPerm.Value:=True;
        Frodm.RRes.Post;
      End
     Else
     Begin
        Frodm.RRes.Edit;
        Frodm.RResPerm.Value:=True;
        Frodm.RRes.Post;
     End;
end;

end.
