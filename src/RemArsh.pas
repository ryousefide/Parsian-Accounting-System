unit RemArsh;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, DBCtrls;

type
  TFRemArsh = class(TForm)
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
  FRemArsh: TFRemArsh;

implementation

uses Routins, FrooshDM, ProVar, MainForm, Db, CRoutins, Remitance;

{$R *.DFM}
Function TFRemArsh.Beg_Date:Integer;
begin
     Qu.SQL.Clear;
     Qu.SQL.Add(Encrypt('½«¤«­œðÃ§¢èÌ¯œçðÊž¡£ð¾Ã¡¢',17));
     Qu.Open;
     Result:=Qu.Fields[0].AsInteger;
     Qu.Close;
end;

procedure TFRemArsh.SetImage;
begin
     Main.glKey.GetBitmap(12,sp1.Glyph);
     Main.glKey.GetBitmap(13,sp2.Glyph);
     Main.glKey.GetBitmap(9,sp3.Glyph);
     Main.glKey.GetBitmap(11,spBill.Glyph);
end;

procedure TFRemArsh.FormActivate(Sender: TObject);
begin
     If Frodm.RM.State In[dsEdit,dsInsert] Then FRemit.BSaveClick(Sender);
     If Not Frodm.RM.Active Then Frodm.RM.Open;
end;

procedure TFRemArsh.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Frodm.RM.Filtered:=False;
     Frodm.RM.Filter:='';
     Frodm.RM.Close;
     Action:=caFree;
end;

procedure TFRemArsh.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     SetImage;
     Frodm.RM.Filtered:=True;
     Year:=Beg_Date Div 10000;
     If Year = 0 Then Year:= Fardate Div 10000;
     sp2.Enabled:=Boss;
end;

procedure TFRemArsh.tvDayClick(Sender: TObject);
Var
Filt:String;
begin
     Mon :=tvDay.Selected.Index+1;
     St:=StrToIntDef(Sd.Text,1);
     En:=StrToIntDef(Ed.Text,31);
     Frodm.RM.Filtered:=False;
     IF tvDay.Selected.Level > 0 Then
     Filt:=' Dat >='+IntToStr(Year*10000+Mon*100+St)+' and Dat <='+IntToStr(Year*10000+Mon*100+En);
     If FCkod.KeyValue <>Null Then Filt:=Filt+' and Ckod='+IntToStr(Fckod.KeyValue);
     If Pos(' and',Filt) = 1 Then Delete(Filt,1,4);
     Frodm.RM.Filter:=Filt;
     Frodm.RM.Filtered:=True;
end;

procedure TFRemArsh.BGridDrawColumnCell(Sender: TObject; const Rect: TRect;
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

procedure TFRemArsh.tvDayKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
       Key :=#0;
       tvDayClick(Sender);
     End;
end;

procedure TFRemArsh.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key Of
     VK_ESCAPE  : Close;
     VK_ADD     : SP1Click(Sender);
     VK_SUBTRACT: Sp2Click(Sender);
     End;
end;

procedure TFRemArsh.spBillClick(Sender: TObject);
Var
No:Integer;
begin
     NO:=Frodm.RMNo.Value;
     CreatingForm(TFRemit,'FRemit',FRemit);
     Frodm.RM.Cancel;
     Frodm.RM.Locate('No',NO,[loCaseInsensitive]);
     FRemit.FNo.Text:=Frodm.RMNo.AsString;
end;

procedure TFRemArsh.BGridKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
      Key :=#0;
      spBillClick(Sender);
     End;
end;

procedure TFRemArsh.FCKodDropDown(Sender: TObject);
begin
     FCkod.KeyValue:=Null;
end;

procedure TFRemArsh.FNoChange(Sender: TObject);
begin
     BGrid.SelectedRows.Clear;
     BGrid.DataSource.DataSet.Locate('No',StrToIntDef(FNo.Text,0),[loCaseInsensitive]);
end;

procedure TFRemArsh.FCKodKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetCentLookup(Sender,Key);
end;

procedure TFRemArsh.FNoKeyPress(Sender: TObject; var Key: Char);
begin
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;
     If Key = #13 Then spBillClick(Sender);
end;

procedure TFRemArsh.FInvChange(Sender: TObject);
begin
     BGrid.SelectedRows.Clear;
     BGrid.DataSource.DataSet.Locate('Inv',StrToIntDef(FInv.Text,0),[loCaseInsensitive]);
end;

procedure TFRemArsh.Sp1Click(Sender: TObject);
Var
I:Integer;
begin
     If BGrid.SelectedRows.Count > 0 Then
      For I:=0 To BGrid.SelectedRows.Count-1 Do
      Begin
        Frodm.RM.GotoBookmark(Pointer(BGrid.SelectedRows.items[I]));
        Frodm.RM.Edit;
        Frodm.RMlperm.Value:=True;
        Frodm.RM.Post;
      End
     Else
     Begin
        Frodm.RM.Edit;
        Frodm.RMlperm.Value:=True;
        Frodm.RM.Post;
     End;
end;

procedure TFRemArsh.Sp2Click(Sender: TObject);
Var
I:Integer;
begin
     If Not Sp2.Enabled Then Exit;
     If BGrid.SelectedRows.Count > 0 Then
      For I:=0 To BGrid.SelectedRows.Count-1 Do
      Begin
        Frodm.RM.GotoBookmark(Pointer(BGrid.SelectedRows.items[I]));
        Frodm.RM.Edit;
        Frodm.RMlperm.Value:=False;
        Frodm.RM.Post;
      End
     Else
     Begin
        Frodm.RM.Edit;
        Frodm.RMlperm.Value:=False;
        Frodm.RM.Post;
     End;
end;

end.
