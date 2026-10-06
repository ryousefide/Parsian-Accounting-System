unit BegAc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, Db, PopupListBox;

type
  TFbegAc = class(TForm)
    BItems: TDBGrid;
    GList: TPopupListBox;
    Bexit: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BItemsColExit(Sender: TObject);
    procedure BItemsEditButtonClick(Sender: TObject);
    procedure BItemsEnter(Sender: TObject);
    procedure BItemsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BItemsKeyPress(Sender: TObject; var Key: Char);
    procedure GListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GListKeyPress(Sender: TObject; var Key: Char);
    procedure BItemsColEnter(Sender: TObject);
    procedure BexitClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    Radif:Integer;
    St:String;
    Procedure DrawList(List:TPopupListBox);
    Procedure FillGList;
  public
    { Public declarations }
    Function Balanc :Boolean;
  end;

var
  FbegAc: TFbegAc;

implementation

uses FrooshDM, ProVar, Routins, BegRch, Converts;

{$R *.DFM}
Procedure TFbegAc.DrawList(List:TPopupListBox);
begin
{     List.Left :=420-List.Width;
     List.Top:=40+Frodm.AcBill.RecNo *20;
     If List.Top > 200 Then List.Top:=200;}
     List.Visible :=True;
     List.SetFocus;
     Bexit.Cancel :=False;
end;

Procedure TFbegAc.FillGList;
Var
Width:Integer;
begin
     Frodm.AcKod.Filter :='UseKod = 1';
     Frodm.AcKod.Filtered :=True;
     Frodm.AcKod.First;
     GList.Items.Clear;
     Width:=BItems.Columns[1].Width;
     Fill(Frodm.AcKod,'Nam',GList.Items);
     Frodm.AcKod.Filtered :=False;
     GList.Width :=Width+50;
     Glist.Items.Delete(GList.Items.IndexOf('ÂÌçﬂœ«„'));
end;

Function TFbegAc.Balanc :Boolean;
Var
Tbed,Tbes,Dif:Currency;
AcKod:Real;
begin
     Result:=False;
     St:='«›  «ÕÌÂ Õ”«»Â«';
     AcKod:=AccKod('”—„«ÌÂ «Ê· œÊ—Â');
     Qu.Sql.Clear;
     Qu.SQl.Add('Select Sum(C.Bed),Sum(C.Bes)');
     Qu.Sql.Add('From AcountBill C');
     Qu.Sql.Add('Where C.No = 1 and C.BTip=-1');
     Qu.Open;
     TBed:=Qu.Fields[0].AsCurrency;
     TBes:=Qu.Fields[1].AsCurrency;
     Qu.Close;
     Dif:=Tbed-Tbes;
     If Dif <> 0 Then
     Begin
       If Dif > 0 Then BesBill(Dif,AcKod,St,'',1,-1,0,'',0,0,0,DefaultCurr);
       If Dif < 0 Then BedBill(Abs(Dif),AcKod,St,'',1,-1,0,'',0,0,0,DefaultCurr);
     End;
     If Dif <> 0  Then Result:=False Else Result:=True;
end;

procedure TFbegAc.FormCreate(Sender: TObject);
begin
     Set_Forms(FbegAc);
     Frodm.Acbill.MasterSource:=Nil;
     Frodm.AcBill.Filter:='BTip = -1';
     Frodm.AcBill.Filtered:=True;
     Frodm.AcBill.Append;
end;

procedure TFbegAc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Frodm.AcBill.Filter:='';
     Frodm.AcBill.Filtered:=False;
     Action:=caFree;
end;

procedure TFbegAc.BItemsColEnter(Sender: TObject);
begin
     Case BItems.SelectedField.Index Of
     6: DrawList(GList);
     End;
end;

procedure TFbegAc.BItemsColExit(Sender: TObject);
begin
     Case BItems.SelectedField.Index Of
     8:If Frodm.AcBillRadif.Value = 0 Then Frodm.AcBillRadif.Value :=Radif Else
        Radif:=Frodm.AcBillRadif.Value;
     End;
     If BItems.Columns[0].Field.Value > 0 Then Radif:=Frodm.AcBillRadif.Value ;

end;

procedure TFbegAc.BItemsEditButtonClick(Sender: TObject);
begin
     Frodm.AcBill.Delete;
     Frodm.AcBill.Edit;
end;

procedure TFbegAc.BItemsEnter(Sender: TObject);
begin
//     BItems.ReadOnly :=False;
//     Frodm.AcBill.Edit;
     BItems.SelectedField:= BItems.Columns[0].Field;

end;

procedure TFbegAc.BItemsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Frodm.AcBill.Edit;
     Case BItems.SelectedIndex of
       1: If Key =VK_F4 Then DrawList(GList);
     2,3: Case Key Of
     VK_MULTIPLY :Begin
                  Frodm.AcBill.Post;
                  Frodm.AcBill.Edit;
                  BItems.SelectedField.Value := BItems.SelectedField.Value*1000;
                  End;
       VK_DIVIDE :Begin
                  Frodm.AcBill.Post;
                  Frodm.AcBill.Edit;
                  BItems.SelectedField.Value := BItems.SelectedField.Value* 100;
                  End;
               End;
     End;

end;

procedure TFbegAc.BItemsKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
       Key:=#0;
       GridMove(BItems,Frodm.AcBill,Radif);
     End;
//     If Frodm.Bill.State In [dsEdit,dsInsert] Then Frodm.AcBill.Edit;
end;

procedure TFbegAc.GListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key = 27 Then
     Begin
       BItems.SetFocus;
       BItems.SelectedField :=BItems.Columns[1].Field;
       GList.Visible :=False;
       Bexit.Cancel :=True;
     End;
end;

procedure TFbegAc.GListKeyPress(Sender: TObject; var Key: Char);
Var
Str:String;
Kod:Real;
begin
     If Key=#13 Then
     Begin
     Key:=#0;
     Str:=Glist.Items.Strings[Glist.ItemIndex];
     Kod:=AccKod(Str);
     Frodm.AcBill.Edit;
     Frodm.AcbillNo.Value:=1;
     Frodm.AcbillBtip.Value:=-1;//New
     Frodm.AcBillAccNam.Value :=Str;
     Frodm.AcBillAckod.AsFloat :=Kod;
     Frodm.AcbillDat.Value :=Fardate;
     Frodm.AcBillDesc.Value:='«›  «ÕÌÂ ';
     BItems.SetFocus;
     BItems.SelectedField := BItems.Columns[2].Field;
     GList.Visible :=False;
     Bexit.Cancel:=True;
     End;

end;

procedure TFbegAc.BexitClick(Sender: TObject);
begin
{     If Balanc Then
     Begin
      Frodm.Bill.Post;

     End;}
     FbegAc.Close;
     CreatingForm(TFbegRch,'FbegRch',FbegRch);
end;

procedure TFbegAc.FormActivate(Sender: TObject);
begin
     FillGList;
end;

end.
