unit PMArsh;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, DBCtrls;

type
  TFPMArsh = class(TForm)
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
  FPMArsh: TFPMArsh;

implementation

uses Routins, FrooshDM, ProVar, MainForm, Db, CashPay, CRoutins;

{$R *.DFM}
Function TFPMArsh.Beg_Date:Integer;
begin
     Qu.SQL.Clear;
     Qu.SQL.Add(Encrypt('½«¤«­œðÃ§¢èÌ¯œçðÊž¡£ðÀÃ¡¢',17));
     Qu.Open;
     Result:=Qu.Fields[0].AsInteger;
     Qu.Close;
end;

procedure TFPMArsh.SetImage;
begin
     Main.glKey.GetBitmap(12,sp1.Glyph);
     Main.glKey.GetBitmap(13,sp2.Glyph);
     Main.glKey.GetBitmap(9,sp3.Glyph);
     Main.glKey.GetBitmap(11,spBill.Glyph);
end;

procedure TFPMArsh.FormActivate(Sender: TObject);
begin
     If Frodm.PMon.State In[dsEdit,dsInsert] Then FCashPay.BDoClick(Sender);
     If Not Frodm.PMon.Active Then Frodm.PMon.Open;
end;

procedure TFPMArsh.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Frodm.PMon.Filtered:=False;
     Frodm.PMon.Filter:='';
     Frodm.PMon.Close;
     Action:=caFree;
end;

procedure TFPMArsh.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     SetImage;
     Fill_Comb(Frodm.PMon,'AccNam',FAcNam.Items);
     Frodm.PMon.Filtered:=True;
     Year:=Beg_Date Div 10000;
     If Year = 0 Then Year:= Fardate Div 10000;
     Sd.Text:=IntToStr(Fardate Mod 100);
     sp2.Enabled:=CUser.Master;;
end;

procedure TFPMArsh.tvDayClick(Sender: TObject);
Var
Filt:String;
begin
     Mon :=tvDay.Selected.Index+1;
     st:=StrToInt(Sd.Text);
     En:=StrToInt(Ed.Text);
     Frodm.PMon.Filtered:=False;
     IF tvDay.Selected.Level > 0 Then
     Filt:=' Dat >='+IntToStr(Year*10000+Mon*100+St)+' and Dat <='+IntToStr(Year*10000+Mon*100+En);
     If FCkod.KeyValue <>Null Then Filt:=Filt+' and Ckod='+IntToStr(Fckod.KeyValue);
     If FAcNam.Text <> '' Then Filt:=Filt+' and Accnam ='+QuotedStr(FAcNam.Text);
     If Pos(' and',Filt) = 1 Then Delete(Filt,1,4);
     Frodm.PMon.Filter:=Filt;
     Frodm.PMon.Filtered:=True;
end;

procedure TFPMArsh.BGridDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
Var
DrawRect: TRect;
begin
    If Not(Frodm.PMonLPerm.Value) Then BGrid.Canvas.Font.Color :=clRed;
    BGrid.DefaultDrawColumnCell(Rect,DataCol,Column,State);
    if (Column.Field.FieldName ='Ckod' ) then
    Begin
     DrawRect:=Rect;
     BGrid.Canvas.FillRect(DrawRect);
     If Not Column.Field.IsNull Then
     BGrid.Canvas.Textout(DrawRect.Left+4,DrawRect.Top,CentName(Column.Field.Value));
    End;
end;

procedure TFPMArsh.tvDayKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
       Key :=#0;
       tvDayClick(Sender);
     End;
end;

procedure TFPMArsh.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key Of
     VK_ESCAPE  : Close;
     VK_ADD     : SP1Click(Sender);
     VK_SUBTRACT: Sp2Click(Sender);
     End;
end;

procedure TFPMArsh.spBillClick(Sender: TObject);
Var
No:Integer;
begin
     NO:=Frodm.PMonNo.Value;
     CreatingForm(TFCashPay,'FCashPay',FCashPay);
     Frodm.PMon.Cancel;
     Frodm.PMon.Locate('No',NO,[loCaseInsensitive]);
     FCashPay.FNo.Text:=Frodm.PMonNo.AsString;
     FCashpay.Dat1.Text:=IntTodate(Frodm.PMonDat.Value);
end;

procedure TFPMArsh.BGridKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
      Key :=#0;
      spBillClick(Sender);
     End;
end;

procedure TFPMArsh.FCKodDropDown(Sender: TObject);
begin
     FCkod.KeyValue:=Null;
end;

procedure TFPMArsh.FNoKeyPress(Sender: TObject; var Key: Char);
begin
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;
     If Key = #13 Then spBillClick(Sender);
end;

procedure TFPMArsh.FNoChange(Sender: TObject);
begin
     BGrid.SelectedRows.Clear;
     BGrid.DataSource.DataSet.Locate('No',StrToIntDef(FNo.Text,0),[loCaseInsensitive]);
end;

procedure TFPMArsh.FInvChange(Sender: TObject);
begin
     BGrid.SelectedRows.Clear;
     BGrid.DataSource.DataSet.Locate('Inv',StrToIntDef(FInv.Text,0),[loCaseInsensitive]);
end;

procedure TFPMArsh.FCKodKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetCentLookup(Sender,Key);
end;

procedure TFPMArsh.Sp2Click(Sender: TObject);
Var
I:Integer;
begin
     If Not Sp2.Enabled Then Exit;
     If BGrid.SelectedRows.Count > 0 Then
      For I:=0 To BGrid.SelectedRows.Count-1 Do
      Begin
        Frodm.Pmon.GotoBookmark(Pointer(BGrid.SelectedRows.items[I]));
        Frodm.PMon.Edit;
        Frodm.PMonLPerm.Value:=False;
        Frodm.PMon.Post;
      End
     Else
     Begin
        Frodm.PMon.Edit;
        Frodm.PMonLPerm.Value:=False;
        Frodm.PMon.Post;
     End;
end;

procedure TFPMArsh.Sp1Click(Sender: TObject);
Var
I:Integer;
begin
     If BGrid.SelectedRows.Count > 0 Then
      For I:=0 To BGrid.SelectedRows.Count-1 Do
      Begin
        Frodm.Pmon.GotoBookmark(Pointer(BGrid.SelectedRows.items[I]));
        Frodm.PMon.Edit;
        Frodm.PMonLPerm.Value:=True;
        Frodm.PMon.Post;
      End
     Else
     Begin
        Frodm.PMon.Edit;
        Frodm.PMonLPerm.Value:=True;
        Frodm.PMon.Post;
     End;end;

end.
