unit BegPch;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, PopupListBox;

type
  TFbegPch = class(TForm)
    PGrid: TDBGrid;
    Fpayed: TEdit;
    Bnext: TButton;
    GList: TPopupListBox;
    Bprev: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PGridKeyPress(Sender: TObject; var Key: Char);
    procedure BnextClick(Sender: TObject);
    procedure GListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GListKeyPress(Sender: TObject; var Key: Char);
    procedure PGridColEnter(Sender: TObject);
    procedure PGridEditButtonClick(Sender: TObject);
    procedure BprevClick(Sender: TObject);
    procedure PGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PGridEnter(Sender: TObject);
  private
    { Private declarations }
    St:String;
    AcKod :Real;
    Procedure DrawList(List:TPopupListBox);
    Procedure FillGList;
    Function PkodFind(Jari:String):Real;
    Function BankFind(Jari:String):String;
    Function BKodFind(Jari:String):String;
  public
    { Public declarations }
    Procedure CheqSums;
    Function  RCheqSum:Currency;
    Function  Balanc :Boolean;
  end;

var
  FbegPch: TFbegPch;

implementation

uses FrooshDM, ProVar, Routins, BegAc, BegRch, Goods, Converts, MainForm;

{$R *.DFM}
Procedure TFbegPch.DrawList(List:TPopupListBox);
begin
{     List.Left :=List.Width+2; //  420-
 //    List.Top:=40+Frodm.Pcheq.RecNo *20;
 //    If List.Top > 124 Then List.Top:=124;
     List.Top:=111;}
     List.Visible :=True;
     List.SetFocus;
end;

Procedure TFbegPch.FillGList;
Var
Width:Integer;
begin
     GList.Items.Clear;
     Width:=PGrid.Columns[2].Width;
     Fill_Comb(Frodm.JariNam,'Nam',GList.Items);
     GList.Width :=Width+10;
end;

Function TFbegPch.PkodFind(Jari:String):Real;
begin
     If Frodm.JariNam.FindKey([Jari]) Then
     Result:= Frodm.JariNamCheqKod.Value Else Result:=0;
end;

Function TFbegPch.BankFind(Jari:String):String;
begin
     If Frodm.JariNam.FindKey([Jari]) Then
     Result:= Frodm.JariNamBnam.Value Else Result:='';
end;

Function TFbegPch.BKodFind(Jari:String):String;
begin
     If Frodm.JariNam.FindKey([Jari]) Then
     Result:= Frodm.JariNamBkod.Value Else Result:='';
end;

Procedure TFbegPch.CheqSums;
Var
I:Integer;
PSum:Currency;
Price:Currency;
PKod:Real;
JariT:String;
begin
     Qu.SQL.Clear;
     Qu.SQl.Add('SELECT Sum(PBill)');
     Qu.SQL.Add('FROM Pcheq ');
     Qu.SQL.Add('WHERE  ');
     Frodm.JariNam.First;
     PSum:=0;
     For I:=1 To Frodm.JariNam.RecordCount Do
     Begin
       JariT:= Frodm.JariNamNam.Value;
       PKod:= PkodFind(JariT);
       Qu.SQL.Clear;
       Qu.SQl.Add('SELECT Sum(PBill)');
       Qu.SQL.Add('FROM Pcheq ');
       Qu.SQL.Add('WHERE PBNo=-1 and Jari = '+#39+JariT+#39 );
       Qu.Open;
       Price:=Qu.Fields[0].AsCurrency;
       Qu.Close;
       Psum:=Psum+Price;
       If Price > 0 Then
       Begin
         Frodm.Acbill.Append;
         Frodm.AcbillNo.Value:=1;
         Frodm.AcbillDesc.Value:='çﬂ Â«Ì Å—œ«Œ  ‘œÂ «Ê· œÊ—Â Ã«—Ì'+JariT;
         Frodm.AcbillDat.Value:=Fardate;
         Frodm.AcbillAccnam.Value:=AccNam(Pkod);
         Frodm.AcbillBtip.Value:=-1;
         Frodm.AcbillFacno.Value:='-1';
         Frodm.AcbillAckod.Value:=PKod;
         Frodm.AcbillBes.Value:=Price;
         Frodm.Acbill.Post;
       End;
       Frodm.JariNam.Next;
     End;
     FPayed.Text:=CurrToFar(PSum);
end;

Function TFbegPch.RCheqSum:Currency;
Var
BedKod:Real;
begin
     BedKod:=AccKod('çﬂ œ—Ì«› ‰Ì');
     Qu.Sql.Clear;
     Qu.Sql.Add('SELECT SUM(PBILL)');
     Qu.Sql.Add('FROM RCHEQ');
     Qu.Sql.Add('Where RBNo = -1');
     Qu.Active :=True;
     If Qu.Fields[0].Value > 0 Then  Result:=Qu.Fields[0].AsCurrency Else Result:=0;
     Qu.Active :=False;
     FPayed.Text :=CurrToFar(Result);
     St:='«›  «ÕÌÂ «”‰«œ œ—Ì«› Ì «Ê· œÊ—Â';
     AutoBill(True,0,BedKod,Result,St,'-1',1,-1,0,'',0,0,0,DefaultCurr);//AcKod
end;

Function TFbegPch.Balanc :Boolean;
Var
Tbed,Tbes,Dif:Currency;
AcKod:Real;
begin
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

//End Of Private
procedure TFbegPch.FormCreate(Sender: TObject);
begin
     Set_Forms(FbegPch);
     FillGList;
     AcKod:=AccKod('”—„«ÌÂ «Ê· œÊ—Â');
     Frodm.Pcheq.Filter:='PBNo = -1';
     Frodm.Pcheq.Filtered:=True;
     Frodm.Pcheq.Append;
end;

procedure TFbegPch.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Frodm.Pcheq.Filter:='';
     Frodm.Pcheq.Filtered:=False;
     Action:=caFree;
end;

procedure TFbegPch.PGridKeyPress(Sender: TObject; var Key: Char);
Var
Radif:Integer;
begin
     If Key = #13 Then
     Begin
      Key:=#0;
     GridMove(PGrid,Frodm.Pcheq,Radif);
     End;
end;

procedure TFbegPch.BnextClick(Sender: TObject);
begin
     DelBitem('-1',1,-1);
     RCheqSum;
     CheqSums;
     Balanc;
     If Frodm.Good.RecordCount = 0 Then CreatingForm(TFgoods,'Fgoods',Fgoods);
     Main.Menu:=Main.MMenu;
     Close;
end;

procedure TFbegPch.GListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key = 27 Then
     Begin
       PGrid.SetFocus;
       PGrid.SelectedField :=PGrid.Columns[2].Field;
       GList.Visible :=False;
     End;

end;

procedure TFbegPch.GListKeyPress(Sender: TObject; var Key: Char);
Var
Str:String;
begin
     If Key=#13 Then
     Begin
       Key:=#0;
       Str:=Glist.Items.Strings[Glist.ItemIndex];
       Frodm.Pcheq.Edit;
       Frodm.PcheqPaydat.Value :=Fardate;
       Frodm.PcheqPayKod.Value:=False;       
       Frodm.PcheqDesc.Value:='œ—Ì«›  «Ê· œÊ—Â';
       Frodm.PcheqJari.Value :=Str;
       Frodm.PcheqPkod.Value:=PkodFind(Str);
       Frodm.PcheqAcckod.Value:=AcKod;
       Frodm.PcheqPBNo.Value:=-1;//New
       Frodm.PcheqBank.Value:=BankFind(Str);
       Frodm.PcheqBkod.Value:=BkodFind(Str);
       PGrid.SetFocus;
       PGrid.SelectedField := PGrid.Columns[3].Field;
       GList.Visible :=False;
     End;
end;

procedure TFbegPch.PGridColEnter(Sender: TObject);
begin
     Frodm.Pcheq.Edit;
     Case PGrid.SelectedIndex Of
     2: DrawList(GList);
     3: Begin
{          Frodm.PcheqPayDat.Value :=Fardate;
          Frodm.PcheqAccKod.Value:=AcKod;
          Frodm.PcheqDesc.Value:='œ—Ì«›  «Ê· œÊ—Â';}
        End;
     End;
end;

procedure TFbegPch.PGridEditButtonClick(Sender: TObject);
begin
     Frodm.Pcheq.Delete;
     Frodm.Pcheq.Edit;
end;

procedure TFbegPch.BprevClick(Sender: TObject);
begin
     CreatingForm(TFbegRch,'FBegRch',FbegRch);
end;

procedure TFbegPch.PGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case PGrid.SelectedIndex of
     3: Case Key Of
     VK_MULTIPLY :Begin
                  Frodm.Pcheq.Post;
                  Frodm.Pcheq.Edit;
                  PGrid.SelectedField.Value := PGrid.SelectedField.Value*1000;
                  End;
       VK_DIVIDE :Begin
                  Frodm.Pcheq.Post;
                  Frodm.Pcheq.Edit;
                  PGrid.SelectedField.Value := PGrid.SelectedField.Value* 100;
                  End;
               End;
     End;

end;

procedure TFbegPch.PGridEnter(Sender: TObject);
begin
     Frodm.Pcheq.Edit;
end;

end.
