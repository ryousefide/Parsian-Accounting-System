unit RejBinvo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls,Mask, Grids, DBGrids,DB, ExtCtrls, DBCGrids,
  DBTables, ComCtrls, Buttons, PopupListBox;

type
  TFRejBvoice = class(TForm)
    Sb1: TStatusBar;
    Panel1: TPanel;
    Bprev: TBitBtn;
    Bsave: TBitBtn;
    Bnext: TBitBtn;
    Bnew: TBitBtn;
    Bexit: TBitBtn;
    BPrint: TBitBtn;
    Bdel: TBitBtn;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    FNam: TDBComboBox;
    Ftel: TDBEdit;
    Goods: TDBGrid;
    Fkol: TDBEdit;
    Fdis: TDBEdit;
    Fnet: TDBEdit;
    FNo: TEdit;
    FPINo: TDBEdit;
    Label2: TLabel;
    FEco: TDBComboBox;
    GList: TPopupListBox;
    CList: TPopupListBox;
    AList: TPopupListBox;
    Bedit: TBitBtn;
    EdQu: TQuery;
    Fbk: TDBCheckBox;
    Dat1: TMaskEdit;
    Label17: TLabel;
    Label18: TLabel;
    FCost: TDBComboBox;
    FCKod: TDBLookupComboBox;
    procedure GoodsExit(Sender: TObject);
    procedure BprevClick(Sender: TObject);
    procedure BnextClick(Sender: TObject);
    procedure BnewClick(Sender: TObject);
    procedure BsaveClick(Sender: TObject);
    procedure BexitClick(Sender: TObject);
    procedure GoodsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FNoKeyPress(Sender: TObject; var Key: Char);
    procedure FNoExit(Sender: TObject);
    procedure FNamExit(Sender: TObject);
    procedure GoodsKeyPress(Sender: TObject; var Key: Char);
    procedure GoodsEditButtonClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FPINoKeyPress(Sender: TObject; var Key: Char);
    procedure GoodsColExit(Sender: TObject);
    procedure FPINoExit(Sender: TObject);
    procedure FnetEnter(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure GListKeyPress(Sender: TObject; var Key: Char);
    procedure GListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CListKeyPress(Sender: TObject; var Key: Char);
    procedure AListKeyPress(Sender: TObject; var Key: Char);
    procedure AListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GoodsEnter(Sender: TObject);
    procedure BPrintClick(Sender: TObject);
    procedure GoodsColEnter(Sender: TObject);
    procedure BdelClick(Sender: TObject);
    Procedure NexTab(Sender:TObject;Var Key :Char);
    procedure FormActivate(Sender: TObject);
    procedure FNoEnter(Sender: TObject);
    procedure FdisEnter(Sender: TObject);
    procedure GoodsMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure BeditClick(Sender: TObject);
    procedure FNamDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure FNamDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure Dat1Enter(Sender: TObject);
    procedure Dat1Exit(Sender: TObject);
    procedure FNamKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FCKodKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    SumP,SumQ:Real;
    Disc:Currency;
    MoFlag:Boolean;
    New:Boolean;
    NewNo:Integer;
    BNo,
    NewBNo,
    BDat :Integer;
    FacNo:String;
    OSum:Currency;
    Rate:Currency;
    Procedure ColumnEnable;
    Procedure Find_SuplKod;
    Procedure Good_Del;
    Procedure UnDepot;
    Procedure Depot;
    Function Check_Fac:Boolean;
    Procedure FillFromPI(Sender:TObject;PINo:Integer);
    Procedure DrawList(List:TPopupListBox;Index:Integer);
    Procedure Close_Bill(Sender: TObject);
    Procedure QPSums;
    Procedure SetImage;
    Procedure CancelEdit;
    Procedure GoodFilter(FacNo:Integer);
  public
    { Public declarations }
  end;

var
  FRejBvoice: TFRejBvoice;

implementation

uses FrooshDM, Routins, ProVar, RejFacRep, MainForm, AcSearch, Converts, XPListBox,
  CRoutins;
Const
Tip='ãÑÌæÚí ÎÑíÏ';
FTip = 4;
Var
BehKod:Real;
Radif,BInvoNo:Integer;  // NewNo,
                             
{$R *.DFM}
Procedure TFRejBvoice.NexTab(Sender:TObject;Var Key :Char);
begin
     If Key = #13 Then
     Begin
       Key:=#0;
       SelectNext(Sender As TWinControl,True,True);
     End;
end;

Procedure TFRejBvoice.ColumnEnable;
Var
I:Integer;
begin
//     If (Frodm.RejBinvoGoodKod.Value > 0) And (Frodm.RejBInvoGoodQuant.Value > 0) Then
     If Good_Moj_Anb(Frodm.RejBinvoGoodNam.Value,Frodm.RejBinvoGoodColor.Value,
       Frodm.RejBinvoGoodAnbNam.Value,Frodm.RejBinvoGoodAnbKod.Value)< 0 Then
      For I:=0 To 5 Do Goods.Columns[I].ReadOnly :=True
     Else
      For I:=0 To 5 Do Goods.Columns[I].ReadOnly :=False;
     Goods.Columns[2].ReadOnly :=True;
end;

Procedure TFRejBvoice.Good_Del;
Var
I:Integer;
begin
     Frodm.RejBinvoGood.First;
     For I:= 1 To Frodm.RejBinvoGood.RecordCount Do
     Begin
      IF Frodm.RejBinvoGoodBkod.Value Then Frodm.RejBinvoGood.Delete;
      If Frodm.RejBinvoGood.Eof Then Exit;
      Frodm.RejBinvoGood.Next;
     End;
     Frodm.RejBinvoGood.First;
end;

Procedure TFRejBvoice.UnDepot;
Var
I:Integer;
begin
     Frodm.RejBinvoGood.First;
     For I:= 1 To Frodm.RejBinvoGood.RecordCount Do
     Begin
      DepotChange(Frodm.RejBinvoGoodKod.Value,Frodm.RejBinvoGoodAnbKod.Value,
                  Frodm.RejBinvoGoodColor.Value,Frodm.RejBinvoGoodAnbNam.Value,
                  Frodm.RejBinvoGoodQuant.Value,dpIn);
      Frodm.RejBinvogood.Next;
     End;
     Cardex_Del(FNo.Text,Tip);
end;

Procedure TFRejBvoice.Depot;
Var
I:Integer;
begin
     For I:=1 To Frodm.RejBinvoGood.RecordCount Do
     Begin
       Frodm.RejBinvoGood.Edit;
       Frodm.RejBinvoGoodRadif.Value:=I;
       Frodm.RejBinvoGoodNo.Value:=Frodm.RejBinvoNo.Value;
       Frodm.RejBinvoGoodDat.Value:=Frodm.RejBinvoDat.Value;
       Frodm.RejBinvoGood.Post;
       If DepotCheck(Frodm.RejBinvoGoodKod.Value,Frodm.RejBinvoGoodAnbKod.Value,
                     Frodm.RejBinvoGoodColor.Value,Frodm.RejBinvoGoodAnbNam.Value,
                     Frodm.RejBinvoGoodQuant.Value) Then
       Begin
       Auto_GCardex(Frodm.RejBinvoGoodNam.Value,Frodm.RejBinvoGoodColor.Value,
                    Frodm.RejBinvoGoodAnbNam.Value,Frodm.RejBinvoGoodKod.Value,
                    Frodm.RejBinvoGoodRadif.Value,Frodm.RejBinvoGoodQuant.Value,
                    dpOut,Frodm.RejBinvoNo.Value,Frodm.RejBinvoDat.Value,Tip,
                    FNam.Text,Frodm.RejBinvoGoodOPfee.Value,Frodm.RejBinvoGoodPerc.Value);
       DepotChange(Frodm.RejBinvoGoodKod.Value,Frodm.RejBinvoGoodAnbKod.Value,
                   Frodm.RejBinvoGoodColor.Value,Frodm.RejBinvoGoodAnbNam.Value,
                   Frodm.RejBinvoGoodQuant.Value,dpOut);
       End Else
       Begin
         Frodm.RejBinvoGood.Edit;
         Frodm.RejBinvoGoodBKod.Value:=True;
         Frodm.RejBinvoGood.Post;
       End;
       Frodm.RejBinvoGood.Next;
     End;
     Good_Del;
//     Cardex_Price;
end;
{
Procedure TFRejBvoice.Cardex_Price;
Var
I:Integer;
begin
     Frodm.RejBinvoGood.First;
     For I:=1 To Frodm.RejBinvoGood.RecordCount Do
     Begin
       GCardex_Price(Frodm.RejBinvoGoodNam.Value,Frodm.RejBinvoGoodColor.Value,
         Frodm.RejBinvoGoodAnbNam.Value,Frodm.RejBinvoGoodKod.Value,
         Frodm.RejBinvoGoodAnbKod.Value,Frodm.RejBinvoGoodQuant.Value,0,dpOut
         ,StrToInt(FNo.Text),'ãÑÌæÚí ÎÑíÏ',FNam.Text,Frodm.RejBinvoGoodPfee.Value
         ,Frodm.RejBinvoGoodPerc.Value);
       Frodm.RejBinvoGood.Next;
     End;
end;
}
Function TFRejBvoice.Check_Fac:Boolean;
Var
I:Integer;
begin
     Result:=True;
     If Frodm.RejBinvo.State = dsBrowse Then Exit;
     If Not sDp Then Exit;
     Frodm.RejBinvoGood.First;
     For I:=1 To Frodm.RejBinvoGood.RecordCount Do
     Begin
       Result:=DepotCheck(Frodm.RejBinvoGoodKod.Value,Frodm.RejBinvoGoodAnbKod.Value,
                          Frodm.RejBinvoGoodColor.Value,Frodm.RejBinvoGoodAnbNam.Value,
                          Frodm.RejBinvoGoodQuant.Value);
       MoFlag:=Result;
       If Not Result Then
       Begin
         Bsave.Enabled:=True;
         ShowMessage( 'ÚÜÜÜÏã ãæÌæÏí ßÇÝí');
         Exit;
       End;
       Frodm.RejBinvoGood.Next;
     End;
     Frodm.RejBinvoGood.First;
end;

Procedure TFRejBvoice.Find_SuplKod;
Var
Pnam:String;
Dat:Integer;
Kod:Real;
begin
     Pnam:=FroDM.RejBinvoNam.Value;
     BehKod:=AccKod(Pnam);
     If  BehKod > 0 Then
     Begin
       If Frodm.RejBInvo.State In[dsInsert,dsEdit] Then
       Begin
         Frodm.AcKod.IndexFieldNames :='AccKod';
         Frodm.AcKod.FindKey([BehKod]);
         If Frodm.AcKodUseKod.Value = 0 Then
         Begin
          ShowMessage('ÍÓÇÈ ÚãáíÇÊí äíÓÊ');
          FNam.SetFocus;
          Exit;
         End;
         Frodm.RejBinvoTel.Value :=Frodm.AcKodTel.Value;
       End;
       Sb1.Panels[2].Text :='ÝÑæÔäÏå ËÇÈÊ';
       Sb1.Panels[1].Text :=AccString(Behkod);
       If sFrem Then Sb1.Panels[0].Text :=CurrToFar(AcRemain(BehKod,Dat,
       Frodm.RejBinvoCkod.AsString,Frodm.RejBinvoCost.AsString));
     End Else
     Begin
       Sb1.Panels[2].Text :='ÝÑæÔäÏå ãÊÝÑÞå';
       Frodm.AutoBill.FindKey (['RKJK']);
       Kod:=Frodm.AutoBillBehKod.Value;
       Sb1.Panels[1].Text :=AccString(Kod);
       If sFrem Then Sb1.Panels[0].Text :=CurrToFar(AcRemain(Kod,Dat,
       Frodm.RejBinvoCkod.AsString,Frodm.RejBinvoCost.AsString));
     End;
End;

Procedure TFRejBvoice.FillFromPI(Sender:TObject;PINo:Integer);
Var
I,J:Integer;
IQu:TQuery;
Filt:String;
Q:Real;
LastValue:Currency;
begin
     IF PINo = 0 Then Exit;
     IF (Frodm.RejBinvoGood.RecordCount>0)Or(Frodm.RejBinvo.State = dsBrowse) Then Exit;
     IQu:=TQuery.Create(Owner);
     IQu.DataBaseName:=CurrDb;
     IQu.SQL.Clear;
     IQu.SQL.Add('Select B.Nam,B.Tel,B.PKol,B.Pdis,B.Pnet,B.LPerm');
     IQu.SQL.Add('From Bvoice B Where B.No = '+IntToStr(PINo));
     IQu.Open;

     Frodm.RejBinvoFacNo.Value :=PiNo;
     Frodm.RejBinvoNam.Value :=IQu.Fields[0].AsString;
     Frodm.RejBinvoTel.Value :=IQu.Fields[1].AsString;
     Frodm.RejBinvoPkol.Value:=IQu.Fields[2].AsCurrency;
     Frodm.RejBinvoPdis.Value :=IQu.Fields[3].AsCurrency;
     Frodm.RejBinvoPnet.Value :=IQu.Fields[4].AsCurrency;
     IQu.Close;
     IQu.SQL.Clear;
     IQu.SQL.Add('Select Kod,Nam,Color,Radif,AnbNam,AnbKod,Quant,Bfee,'+
     'Perc,Ptotal,Serial,Garan,Prop');
     IQu.SQL.Add('From BinvoGood B Where B.No = '+IntToStr(PINo));
     IQu.Open;
     For I:=1 To IQu.RecordCount Do
     Begin
      Q:=IQu.Fields[6].AsFloat;
      Sold_Price(P_Rule,Qu,IQu.Fields[0].AsString,IQu.Fields[2].AsString,
      IQu.Fields[4].AsString,IQu.Fields[5].AsInteger,0,111111111,Q,LastValue);
      Qu.SQL.Clear;
      Qu.SQL.Add('Select Nam,Color,Anb,AnbKod,I.IIn,Fee');
      Qu.SQL.Add('From Cardex I Where Des=:b ');
      Qu.Params[0].Value:='RejB';
      Qu.Open;
      For J:=1 To Qu.RecordCount Do
      Begin
       Frodm.RejBinvoGood.Append;
       Frodm.RejBinvoGoodNo.Value:=Frodm.RejBinvoNo.Value;
       Frodm.RejBinvoGoodDat.Value :=FRodm.RejBinvoDat.Value;
       Frodm.RejBinvoGoodBkod.Value:=False;
       Frodm.RejBinvoGoodkod.Value :=IQu.Fields[0].AsInteger;
       Frodm.RejBinvoGoodNam.Value :=Qu.Fields[0].AsString;
       Frodm.RejBinvoGoodColor.Value :=Qu.Fields[1].AsString;
       Frodm.RejBinvoGoodRadif.Value :=IQu.Fields[3].AsInteger;
       Frodm.RejBinvoGoodAnbNam.Value:=Qu.Fields[2].AsString;
       Frodm.RejBinvoGoodAnbKod.Value :=Qu.Fields[3].AsInteger;
       Frodm.RejBinvoGoodQuant.Value :=-Qu.Fields[4].AsFloat;
       Frodm.RejBinvoGoodPfee.Value :=IQu.Fields[7].AsCurrency;
       Frodm.RejBinvoGoodPerc.Value :=IQu.Fields[8].AsFloat;
       Frodm.RejBinvoGoodReject.Value:=Qu.Fields[5].AsCurrency;
//       Frodm.RejBinvoGoodPtotal.Value :=Qu.Fields[9].AsCurrency;
       Frodm.RejBinvoGoodSerial.Value :=IQu.Fields[10].AsString;
       Frodm.RejBinvoGoodGaran.Value :=IQu.Fields[11].AsString;
       Frodm.RejBinvoGoodProp.Value :=IQu.Fields[12].AsString;
       Frodm.RejBinvoGood.Post;
       Qu.Next;
      End;
      Qu.Close;
      IQu.Next;
     End;
     IQu.Close;
     IQu.Free;
     FNamExit(Sender);
     Goods.SetFocus;
     Frodm.RejBinvoGood.First;
     Frodm.RejBinvoGood.Edit;
end;


Procedure TFRejBvoice.DrawList(List:TPopupListBox;Index:Integer);
begin
     List.Visible :=True;
     List.SetFocus;
     Bexit.Cancel :=False;
     If List.Items.Count>0 Then List.ItemIndex :=0;
end;

Procedure TFRejBvoice.Close_Bill(Sender: TObject);
var
State:Boolean;
Beskod:Real;
Str:String;
Sum:Currency;
begin
     BDat:=Frodm.RejBinvoDat.Value;
     Rate:=GetRateatDate(Frodm.RejBinvoEco.AsString,Frodm.RejBinvoDat.Value);
     Sum:=Frodm.RejBinvoPNet.Value;
     Str:='ÎÇáÕ ÝÇßÊæÑ ãÑÌæÚí ÎÑíÏ ÔãÇÑå'+' '+FNo.Text+'  '+FNam.Text;
     If BehKod > 0 Then
     Begin
       Frodm.AutoBill.FindKey(['RKJK']);
       State:=Frodm.AutoBillStat.Value;
       BesKod:=Frodm.AutoBillBesKod.Value;
       NewBNo:=AutoBill(State,BesKod,BehKod,Sum*Rate,Str,FacNo,BNo,FTip,BDat,
       Frodm.RejBinvoCost.AsString,Frodm.RejBinvoCKod.AsInteger,Sum,Rate,
       Frodm.RejBinvoEco.AsString);
     End else
       NewBNo:=Automation(Str,0,Sum*Rate,'RKJK',FacNo,BNo,FTip,BDat,
       Frodm.RejBinvoCost.AsString,Frodm.RejBinvoCKod.AsInteger,Sum,Rate,
       Frodm.RejBinvoEco.AsString);
//-----------------
     Frodm.AutoBill.FindKey(['GF']);
     State:=Frodm.AutoBillStat.Value;
     BehKod:=Frodm.AutoBillBehKod.Value;
     BesKod:=Frodm.AutoBillBesKod.Value;

     Str:='˜ÓÑÇÞáÇã ÝÇßÊæÑ ãÑÌæÚí ÎÑíÏ ÔãÇÑå'+' '+FNo.Text+' '+FNam.Text;
     NewBNo:=AutoBill(State,BesKod,BehKod,OSum,Str,FacNo,BNo,FTip,BDat,
      Frodm.RejBinvoCost.AsString,Frodm.RejBinvoCKod.AsInteger,0,0,DefaultCurr);
//------------------
     If NewBNo = BNo Then BillUpdate(BNo) Else
      If sBill Then MakeBill('ÓäÏ ãÑÌæÚ ÎÑíÏ ÇÒ '+' '+FNam.Text+' '+
      'Øí ÝÇßÊæÑ ãÑÌæÚí ÎÑíÏ ÔãÇÑå'+FNo.Text);
     BNo:=NewBNo;
end;

Procedure TFRejBvoice.QPSums;
Begin
     Qu.SQL.Clear;
     Qu.SQL.ADD('SELECT SUM(D.Quant),SUM(D.Perc)');
     Qu.SQL.ADD('FROM RejBInvoGood D');
     QU.SQL.ADD('WHERE D.No = '+FNo.Text);
     Qu.Open;
     SumQ:=Qu.Fields[0].AsFloat;
     SumP:=Qu.Fields[1].AsFloat;
     Qu.Close;
end;

Procedure TFRejBvoice.SetImage;
begin
     Main.glKey.GetBitmap(0,BPrev.Glyph);
     Main.glKey.GetBitmap(1,Bnext.Glyph);
     Main.glKey.GetBitmap(2,BPrint.Glyph);
     Main.glKey.GetBitmap(3,Bedit.Glyph);
     Main.glKey.GetBitmap(4,Bsave.Glyph);
     Main.glKey.GetBitmap(5,Bdel.Glyph);
     Main.glKey.GetBitmap(7,BExit.Glyph);
end;

Procedure TFRejBvoice.CancelEdit;
Var
I,J:Integer;
Send:TObject;
begin
     If (Not EdQu.Active)or(EdQu.RecordCount =0) Then Exit;
     GoodFilter(Frodm.RejBinvoNo.AsInteger);
     Frodm.RejBinvoGood.First;
     Send:=TObject.Create;
     For I:=1 To Frodm.RejBinvoGood.RecordCount Do Frodm.RejBinvoGood.Delete;
     EdQu.First;
     For I:=1 To EdQu.RecordCount Do
     Begin
       Frodm.RejBinvoGood.Append;
       For J:=1 To 18 Do
         Frodm.RejBinvoGood.Fields[J].Value:=EdQu.Fields[J].Value;
       Frodm.RejBinvoGood.Post;
       EdQu.Next;
     End;
     EdQu.Close;
     Frodm.RejBinvo.Cancel;
     Frodm.RejBinvoGood.First;
     Close_Bill(Send);
     Depot;
     Send.Free;
End;

Procedure TFRejBvoice.GoodFilter(FacNo:Integer);
begin
     Frodm.RejBinvoGood.Filtered:=False;
     Frodm.RejBinvoGood.Filter:='No = '+IntToStr(FacNo);
     Frodm.RejBinvoGood.Filtered:=True;
     Dat1.Text:=IntToDate(Frodm.RejBinvoDat.Value)
end;
//End of private deceleration

procedure TFRejBvoice.GoodsExit(Sender: TObject);
var
I:integer;
Sum,Nsum:Currency;
begin
     If FroDM.RejBinvo.State = dsBrowse Then Exit;
     FroDM.RejBinvoGood.First;
     Sum:=0;Nsum:=0;OSum:=0;
     For I:=1 to FroDM.RejBinvoGood.RecordCount Do
     Begin
       Sum:=Sum+FroDM.RejBinvoGoodPFee.Value * Frodm.RejBinvoGoodQuant.Value;
       Nsum:=Nsum+Frodm.RejBinvogoodPTotal.Value;
       OSum:=OSum+Frodm.RejBinvoGoodOPSum.AsCurrency;
       FroDM.RejBinvoGood.Next;
     End;
     FroDM.RejBinvoPkol.AsCurrency:=Sum;
     Frodm.RejBinvoPnet.AsCurrency:=Nsum;
     Disc:=0;
     If sPerc Then
     Begin
      Disc:=Sum-Nsum;
      Frodm.RejBinvoPdis.AsCurrency:=Disc;
     End;
end;

procedure TFRejBvoice.GoodsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Not(Frodm.RejBInvo.State = dsBrowse) Then Frodm.RejBInvoGood.Edit;
     If (Shift = [ssCtrl])   Then FKol.SetFocus;
     If (Shift = [ssCtrl]+[ssShift])   Then FTel.SetFocus;
     IF (Key = VK_F4) and Not(Frodm.RejBinvo.State = dsBrowse)Then
{       and Not(Goods.Columns[Goods.SelectedIndex].ReadOnly)}
     Case Goods.SelectedField.Index Of
     3: DrawList(GList,2);
     4: DrawList(Clist,3);
     5: DrawList(AList,4);
     End;
     If (Goods.SelectedIndex In [0,1,2,3])and(Key=32)and Not(Frodm.RejBInvo.State = dsBrowse) Then
     Begin
      FindGoods(Frodm.RejBinvoGood,Frodm.RejBinvoNo.AsInteger,Frodm.RejBInvoDat.AsInteger,Frodm.RejBInvoNam.AsString);
      Goods.SelectedField :=Frodm.RejBinvoGoodPfee;
     End;
     If (Goods.SelectedIndex In [8,9]) and Not(Frodm.RejBInvo.State = dsBrowse) Then
     Case Key Of
       VK_MULTIPLY :Begin
               Frodm.RejBInvoGood.Post;
               Frodm.RejBInvoGood.Edit;
               Goods.SelectedField.Value := Goods.SelectedField.Value*1000;
               End;
       VK_DIVIDE   : Begin
               Frodm.RejBInvoGood.Post;
               Frodm.RejBInvoGood.Edit;
               Goods.SelectedField.Value := Goods.SelectedField.Value* 100;
               End;
     End;
end;

procedure TFRejBvoice.BprevClick(Sender: TObject);
begin
     If Frodm.RejBinvo.State In [dsEdit,dsInsert] Then
     Begin
      FNo.SetFocus;
      Check_Factor_State(Frodm.RejBinvo,BSaveClick,FormDestroy);
      Exit;
     End;
     New:=False;
     If Not MoFlag Then Exit;
     Frodm.RejBinvo.Refresh;
     FroDM.RejBinvo.Prior;
     GoodFilter(Frodm.RejBinvoNo.AsInteger);//1381-08-29
     FNo.Text:=IntToStr(Frodm.RejBinvoNo.Value);
     Find_SuplKod;
end;

procedure TFRejBvoice.BnextClick(Sender: TObject);
begin
//     IF Check_Factor_State(Frodm.RejBinvo,BSaveClick,FormDestroy) = idCancel Then Exit;
     If Frodm.RejBinvo.State In [dsEdit,dsInsert] Then
     Begin
      FNo.SetFocus;
      Check_Factor_State(Frodm.RejBinvo,BSaveClick,FormDestroy);
      Exit;
     End;
     New:=False;
     If Not MoFlag Then Exit;
     Frodm.RejBinvo.Refresh;
     FroDM.RejBinvo.Next;
     GoodFilter(Frodm.RejBinvoNo.AsInteger);//1381-08-29
     FNo.Text:=IntToStr(Frodm.RejBinvoNo.Value);
     NewNo:=Frodm.RejBinvoNo.Value+1;
     Find_SuplKod;
     If Frodm.RejBinvo.Filtered = True Then Exit;
     If Frodm.RejBinvo.Eof Then
     Begin
       FNo.Text:=IntToStr(NewNo);
       FNo.SetFocus;
     End;
end;

procedure TFRejBvoice.BnewClick(Sender: TObject);
begin
     If Frodm.RejBinvo.Filtered Then Exit;
     FroDM.RejBinvo.Append;
     Frodm.RejBinvoNam.Value :='äÇã ÝÑæÔäÏå';
     Frodm.RejBinvoNo.Value:=StrToInt(FNo.Text);
     Frodm.RejBinvoDat.Value:=Fardate;
     Frodm.RejBinvoPerm.Value:=False;
     New:=True;
     FacNo:=FNo.Text;
     BNo:=0;
     Bdat:=Frodm.RejBinvoDat.Value;
     Frodm.RejBinvo.Post;
     Frodm.RejBinvo.Edit;
     GoodFilter(Frodm.RejBinvoNo.AsInteger);//1381-08-29
     Sb1.Panels[2].Text :='ÌÏíÏ';
     BSave.Enabled:=True;
     BEdit.Enabled:=False;
//     FNam.SetFocus;
end;

procedure TFRejBvoice.BsaveClick(Sender: TObject);
begin
     BSave.Enabled:=False;
     If Frodm.RejBinvo.State = dsBrowse Then Exit;
     FNo.SetFocus;
     If Frodm.RejBinvoGood.RecordCount = 0 Then
     Begin
       Frodm.RejBinvo.Delete;
       New:=False;
       BDat:=0;
       BNo:=0;
       FacNo:='';
       GoodFilter(Frodm.RejBinvoNo.AsInteger);//1381-08-29
       FNo.Text:=IntToStr(Frodm.RejBinvoNo.Value);
       Find_SuplKod;
       BEdit.Enabled:=True;
       Exit;
     End;
     GoodsExit(Sender);//If Frodm.RejBinvoPkol.Value = 0 Then
     Disc:=0;
     FroDM.RejBInvoPnet.Value :=Frodm.RejBInvoPkol.Value -Frodm.RejBInvoPdis.Value;
     If Not RequierdCheck(Frodm.RejBinvo) Then
     Begin
       Bsave.Enabled:=True;
       Exit;
     End;
     Frodm.RejBinvoPerm.Value:=sPerm;
     If Check_Fac Then Frodm.RejBinvo.Post Else Exit;
//     If (IntFieldCheck(Frodm.RejBinvoDat)) Then
//     Begin
      Depot;
      Close_Bill(Sender);
      FacBillNo(Frodm.RejBinvo,Frodm.RejBinvoNo.AsInteger,BNo);
//     End;
     QuickCloseOpen([23,22,6,24,11,27]);
     Frodm.RejBinvo.Locate('No',StrToInt(FNo.Text),[loCaseInsensitive]);
     Find_SuplKod;
     Radif:=1;
     EdQu.Close;
     New:=False;
     BDat:=0;
     BNo:=0;
     FacNo:='';
     BEdit.Enabled:=True;
end;

procedure TFRejBvoice.BexitClick(Sender: TObject);
begin
     FNo.SetFocus;
     IF Check_Factor_State(Frodm.RejBinvo,BSaveClick,FormDestroy) = idCancel Then Exit;
//     IF Net_Check_State(New,BSaveClick,FormDestroy)=idCancel Then Exit;
     FRejBvoice.Close;
end;

procedure TFRejBvoice.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     EdQu.DatabaseName :=CurrDb;
     Frodm.RejBinvo.Open;
     Frodm.RejBinvoGood.Open;;
     SetImage;
     Fbk.Visible :=Boss;
     Bdel.Enabled :=Boss;
     Find_SuplKod;
     Goods.Columns[4].Visible :=sAKod;
     Goods.Columns[3].Visible :=sModel;
     Goods.Columns[9].Visible :=sPerc;
     Goods.Columns[9].Width:=31;
     Goods.Columns[4].Width:=31;
     Goods.Columns[3].Width:=81;
     Frodm.RejBinvo.Refresh;
     FroDM.RejBinvo.Last;
     NewNo:=Frodm.RejBinvoNo.Value;
     Radif:=1;
     MoFlag:=True;
     New:=False;
     GoodFilter(Frodm.RejBinvoNo.AsInteger);//1381-08-29
     FNo.Text:=IntToStr(Frodm.RejBinvoNo.Value);
end;

procedure TFRejBvoice.FormActivate(Sender: TObject);
begin
     FNam.Items.Assign(AcList);
     GList.Items.Assign(Kala);
     FCost.Items.Assign(CostList);
     FEco.Items.Assign(CurrList);
     Fill_Comb(Frodm.Color,'Color',CList.Items);
     Fill_Comb(Frodm.AnbDat,'Nam',AList.Items);
end;

procedure TFRejBvoice.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Case New Of
     True :IF Check_Factor_State(Frodm.RejBinvo,BSaveClick,FormDestroy) = idCancel Then
      Action :=caNone
     Else
      Action:=caFree;//Action:=caFree;
     False: If Check_Fac Then Action:=caFree Else Action :=caNone;
     End;
     If Action = caFree Then
     Begin
      Frodm.RejBinvo.Close;
      Frodm.RejBinvoGood.Close;
     End;

end;

procedure TFRejBvoice.FormDestroy(Sender: TObject);
begin
     If Frodm.RejBinvo.State = dsBrowse Then Exit;
     Case New Of
     True :Begin
            CancelFactor(Frodm.RejBinvo,Frodm.RejBinvoGood);// CancelOnExit(Frodm.RejBinvoGood);
            GoodFilter(Frodm.RejBinvoNo.AsInteger);//1381-08-29
            FNo.Text:=IntToStr(Frodm.RejBinvoNo.Value);
           End;
     False: CancelEdit; //BSaveClick(Sender);
     End;
     Bsave.Enabled:=False;
     BEdit.Enabled:=True;
end;

procedure TFRejBvoice.FNoKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then FNoExit(Sender);
     NexTab(Sender, key);
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;
end;

procedure TFRejBvoice.FNoExit(Sender: TObject);
begin
     If Frodm.RejBinvo.State In [dsEdit,dsInsert] Then
     Begin
       Fno.Text:=IntToStr(Frodm.RejBinvoNo.Value);
       Exit;
     End;
//     If Not(Frodm.RejBinvo.FindKey([StrToInt(FNo.Text)])) Then BnewClick(Sender) Else
     IF Not Frodm.RejBinvo.Locate('No',StrToInt(FNo.Text),[loCaseInsensitive]) Then
       BnewClick(Sender)
     Else
       GoodFilter(Frodm.RejBinvoNo.AsInteger);//1381-08-29
     Find_SuplKod;
end;

procedure TFRejBvoice.FNamExit(Sender: TObject);
begin
     Find_SuplKod;
end;

procedure TFRejBvoice.GoodsKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
       If (Goods.SelectedField.Index = 11)And Not(Frodm.RejBinvoGood.State = dsBrowse) Then
        If Frodm.RejBinvoGoodPfee.Value = 0 Then
        Frodm.RejBinvoGoodPfee.Value:=Frodm.RejBinvoGoodPTotal.Value/
          (Frodm.RejBinvoGoodQuant.Value*(1-Frodm.RejBinvoGoodPerc.AsFloat /100));
       Key:=#0;
       GridMove(Goods,Frodm.RejBInvo,Radif);
     End;
     If Not(Frodm.RejBInvo.State = dsBrowse) Then Frodm.RejBInvoGood.Edit;
end;

procedure TFRejBvoice.GoodsMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
  Var
  coord:TGridCoord;
  rec:Integer;
begin
     rec:=Goods.DataSource.DataSet.RecNo;
     Coord:=Goods.MouseCoord(x,y);
     If Coord.X > 1 Then
     Begin
       Goods.SelectedIndex :=0;
       Goods.DataSource.DataSet.RecNo:=rec;//Coord.y;
     End;
end;

procedure TFRejBvoice.GoodsEditButtonClick(Sender: TObject);
begin
     If Frodm.RejBinvo.State In [dsEdit,dsInsert] Then
     Begin
       Frodm.RejBinvoGood.Delete;
       Frodm.RejBinvoGood.Edit;
     End;
end;

procedure TFRejBvoice.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key = VK_F3 Then BsaveClick(Sender);
     If Shift = [ssAlt] Then
      Case Key Of
       VK_Left  :BprevClick(Sender);
       VK_RIGHT :BnextClick(Sender);
      End;
end;

procedure TFRejBvoice.FPINoKeyPress(Sender: TObject; var Key: Char);
begin
     NexTab(Sender, key);
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;
end;

procedure TFRejBvoice.GoodsColExit(Sender: TObject);
begin
     If Frodm.RejBinvo.State = dsBrowse Then Exit Else Frodm.RejBinvoGood.Edit;
     Case Goods.SelectedField.Index Of
     1: Begin
          If Frodm.RejBinvoGoodRadif.Value = 0 Then Frodm.RejBinvoGoodRadif.Value :=Radif;
          Frodm.RejBinvoGoodDat.Value :=Frodm.RejBinvoDat.Value;
          Frodm.RejBinvoGoodNo.Value:=Frodm.RejBinvoNo.Value;
          Frodm.RejBinvoGoodBkod.Value:=False;
          Frodm.RejBinvoGood.Post;
          ColumnEnable;
        End;
     2: If Goods.SelectedField.Value > -1 Then
        Case sGene Of
          False:Begin
             If Frodm.RejBinvoGoodNam.IsNull Then
              Frodm.RejBinvoGoodNam.Value :=GoodNam(Goods.SelectedField.Value)
             Else
              GList.Items.Assign(Kala);
             If Goods.Columns[1].ReadOnly Then Exit;
             DrawList(GList,2);
             GList.ItemIndex:=GList.Items.IndexOf(Frodm.RejBinvoGoodNam.Value);
             If GList.ItemIndex =-1 Then GList.ItemIndex:=0;
            End;
          True:Begin
             If Frodm.RejBinvoGoodNam.IsNull Then
              FillGene(GList.Items,Goods.SelectedField.Value)
             Else
              GList.Items.Assign(Kala);
             If Goods.Columns[1].ReadOnly Then Exit;
             DrawList(GList,2);
             GList.ItemIndex:=GList.Items.IndexOf(Frodm.RejBinvoGoodNam.Value);
             If GList.ItemIndex =-1 Then GList.ItemIndex:=0;
            End;
        End;
{     2: If Goods.SelectedField.Value > 0 Then
        Case sGene Of
          0:Begin
             If Goods.Columns[1].ReadOnly Then Exit;
             Frodm.RejBinvoGoodNam.Value :=GoodNam(Goods.SelectedField.Value);
             Frodm.RejBinvoGoodPfee.Value :=GoodBuyPrice(Goods.SelectedField.Value);
            End;
          1:Begin
             If Goods.Columns[1].ReadOnly Then Exit;
             FillGene(GList.Items,Goods.SelectedField.Value);
             DrawList(GList,2);
            End;
        End;
     4: If Goods.SelectedField.Value > '' Then Frodm.RejBinvoGoodColor.Value :=
           TeepNam(Goods.SelectedField.Value);}
     5:  Frodm.RejBinvoGoodAnbNam.Value :=AnbNam(Frodm.RejBinvoGoodAnbNam.Value);
     6: If Goods.SelectedField.Text = Null Then Goods.SelectedField.Value :=0;
     7: Begin
         ColumnEnable;
         Frodm.RejBinvoGoodPtotal.Value :=Frodm.RejBinvoGoodQuant.Value *
         Frodm.RejBinvoGoodPfee.Value;
         Frodm.RejBinvoGoodOPSum.Value:=GetOutPrice(Frodm.RejBinvoGoodkod.AsString,
         Frodm.RejBinvoGoodColor.AsString,Frodm.RejBinvoGoodAnbNam.AsString,
         Frodm.RejBinvoGoodAnbKod.Value,0,Frodm.RejBinvoDat.AsInteger,
         Frodm.RejBinvoGoodQuant.Value);
         Frodm.RejBinvoGoodOPfee.Value:=Frodm.RejBinvoGoodOPSum.Value/Frodm.RejBinvoGoodQuant.Value;
        End;
     10: Frodm.RejBinvoGoodPtotal.Value :=(1-Frodm.RejBinvoGoodPerc.AsFloat /100)*
            Frodm.RejBinvoGoodQuant.Value *Frodm.RejBinvoGoodPfee.Value;
     End;
     If Goods.Columns[0].Field.Value > 0 Then Radif:=Frodm.BinvoGoodRadif.Value ;
end;

procedure TFRejBvoice.FPINoExit(Sender: TObject);
begin
//     If (New)and(FPiNo.Text >'') Then//(Frodm.RejBInvo.State = dsInsert)
//     Begin
//       BInvoNo :=StrToInt(FPINo.Text);
       FillFromPI(Sender,Frodm.RejBinvoFacNo.AsInteger);
//     End;
end;

procedure TFRejBvoice.FdisEnter(Sender: TObject);
begin
     If (FroDM.RejBinvo.State = dsBrowse)Or(sPerc=False) Then Exit ;
     Frodm.RejBinvoPdis.Clear;
end;

procedure TFRejBvoice.FnetEnter(Sender: TObject);
begin
     If FroDM.RejBinvo.State = dsBrowse Then Exit ;
     Frodm.RejBinvoPdis.AsCurrency:=Frodm.RejBinvoPdis.AsCurrency+Disc;
     FroDM.RejBinvoPnet.Value:=FroDM.RejBinvoPKol.Value-FroDM.RejBinvoPDis.Value;
end;

procedure TFRejBvoice.GListKeyPress(Sender: TObject; var Key: Char);
begin
     If Key =#13 Then
     Begin
       Frodm.RejBinvoGood.Edit;
       Frodm.RejBinvoGoodNo.Value:=Frodm.RejBinvoNo.Value;
       Frodm.RejBinvoGoodNam.Value:=GList.Items.Strings[GList.ItemIndex];
       Frodm.RejBinvoGoodKod.Value :=GoodKod(Frodm.RejBinvoGoodNam.Value);
       Frodm.RejBinvoGoodPfee.Value :=GoodBuyPrice(Frodm.RejBinvoGoodKod.Value);
       Frodm.RejBinvoGood.Post;
       Goods.SetFocus;
       Goods.SelectedField :=Frodm.RejBinvoGoodNam;
       GList.Visible :=False;
       Bexit.Cancel :=True;
     End;

end;

procedure TFRejBvoice.GListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If (Key = 27) Then
     Begin
      Goods.SetFocus;
      Goods.SelectedField :=Goods.Columns[1].Field;
      GList.Visible :=False;
      Bexit.Cancel :=True;
     End;

end;

procedure TFRejBvoice.CListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If (Key = VK_F4) Then
     Begin
       Goods.SetFocus;
       Goods.SelectedField :=Frodm.RejBinvoGoodColor;
       CList.Visible :=False;
       Bexit.Cancel :=True;
     End;

end;

procedure TFRejBvoice.CListKeyPress(Sender: TObject; var Key: Char);
begin
     If Key =#13 Then
     Begin
       Frodm.RejBinvoGood.Edit;
       Frodm.RejBinvoGoodColor.Value:=CList.Items.Strings[CList.ItemIndex];
       Goods.SetFocus;
       Goods.SelectedField :=Frodm.RejBinvoGoodColor;
       CList.Visible :=False;
       Bexit.Cancel :=True;
     End;

end;

procedure TFRejBvoice.AListKeyPress(Sender: TObject; var Key: Char);
begin
     If Key =#13 Then
     Begin
       Frodm.RejBinvoGood.Edit;
       Frodm.RejBinvoGoodAnbNam.Value:=AList.Items.Strings[AList.ItemIndex];
       Goods.SetFocus;
       Goods.SelectedField :=Frodm.RejBinvoGoodAnbNam;
       AList.Visible :=False;
       Bexit.Cancel :=True;
     End;

end;

procedure TFRejBvoice.AListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If (Key = 27) Then
     Begin
       Goods.SetFocus;
       Goods.SelectedField :=Frodm.RejBinvoGoodAnbNam;
       AList.Visible :=False;
       Bexit.Cancel :=True;
     End;

end;

procedure TFRejBvoice.GoodsEnter(Sender: TObject);
begin
     If (Frodm.RejBInvo.State = dsBrowse) Then
      Goods.ReadOnly :=True
     Else
      Goods.ReadOnly :=False;
     Goods.SelectedIndex :=0;
end;

procedure TFRejBvoice.BPrintClick(Sender: TObject);
Var
RowCnt:Integer;
FreeP:Real;
LesMar:Real;
CnHeight:Real;
SubH:Real;
begin
     If Not(Frodm.RejBinvo.State = dsBrowse) Then Exit;
     QPSums;
     CreatingForm(TRepBuyRej,'RepBuyRej',RepBuyRej);
     Set_Sys_Enviroment;

     CnHeight:=RepBuyRej.QRBand1.Size.Height+RepBuyRej.QRBand2.Size.Height+
     RepBuyRej.QRChildBand2.Size.Height+RepBuyRej.ChildBand2.Size.Height+
     RepBuyRej.ChildBand1.Size.Height+RepBuyRej.PgFooter.Size.Height;
     RepBuyRej.QRSubDetail3.Size.Height:=5.8;
     SubH:=RepBuyRej.QRSubDetail3.Size.Height;
     FreeP:=(PLength-CnHeight-TopMar-ButMar);
     RowCnt:=Trunc((FreeP/SubH));
     LesMar:=FreeP-(RowCnt*SubH);
     RepBuyRej.ChildBand2.Size.Height:=RepBuyRej.ChildBand2.Size.Height+Int(LesMar);
     RepBuyRej.GFB.Size.Height:=(SubH)*(RowCnt-Frodm.RejBinvoGood.RecordCount Mod RowCnt);

     RepBuyRej.qrTit.Caption:=InvoLbl;
     RepBuyRej.QRMemo1.Lines.Add(Master);
     RepBuyRej.qrCom.Caption:=Comm;
     RepBuyRej.PrinterSettings.Copies:=PrnCnt;
     RepBuyRej.qrFrem.CapTion:=FarsiPrice(Frodm.RejBinvoPnet.Value);
     RepBuyRej.qrPSum.Caption:=FloatToStr(SumP);
     RepBuyRej.qrQSums.Caption:=FloatToStr(SumQ);
     If BehKod > 0 Then RepBuyRej.qrlRem.Caption :=Sb1.Panels[0].Text;
     RepBuyRej.qrlRem.Enabled :=sRem;
     RepBuyRej.QRLabel20.Enabled :=sRem;
     RepBuyRej.Preview;
     RepBuyRej.Destroy;
end;

procedure TFRejBvoice.GoodsColEnter(Sender: TObject);
begin
     If Frodm.RejBinvo.State = dsBrowse Then Exit Else Frodm.RejBinvoGood.Edit;
     Case Goods.SelectedField.Index Of
      1:If Frodm.RejBinvoGoodRadif.Value > 0 Then Radif:=Frodm.RejBinvoGoodRadif.Value;
      3: If(Frodm.RejBinvoGoodKod.Value = 0)Then
        Case sGene of
         False: Begin
              If Goods.Columns[1].ReadOnly Then Exit;
              DrawList(GList,2);
            End;
         True: Begin
              If Goods.Columns[1].ReadOnly Then Exit;
              GList.Items.Assign(Kala);
              DrawList(GList,2);
            End;
        End;
     4: If SModel Then
        Begin
         If Goods.Columns[1].ReadOnly Then Exit;
         DrawList(CList,3);
         CList.ItemIndex:=CList.Items.IndexOf(Frodm.RejBinvoGoodColor.Value);
         If CList.ItemIndex =-1 Then CList.ItemIndex:=0;
        End;
      5: Begin
          //IF (Frodm.RejBInvoGoodColor.Value = '')and(sModel) Then Goods.SelectedField:=Frodm.RejBInvoGoodColor;
          IF Frodm.RejBInvoGoodNam.Value = '' Then Goods.SelectedField:=Frodm.RejBInvoGoodNam;
          If Not Goods.Columns[1].ReadOnly Then DrawList(AList,4);
         End;
      6: IF Frodm.RejBInvoGoodAnbNam.Value = '' Then Goods.SelectedField:= Frodm.RejBInvoGoodAnbNam;
     11: Frodm.RejBinvoGoodPtotal.Value :=(1-Frodm.RejBinvoGoodPerc.Value /100)*
        Frodm.RejBinvoGoodQuant.Value *  Frodm.RejBinvoGoodPfee.Value;

     End;

end;

procedure TFRejBvoice.BdelClick(Sender: TObject);
Var
I:Integer;
begin
     If Not(Frodm.RejBinvo.State = DsBrowse) Then Exit;
     If MessageDlg('ÝÇßÊæÑ ÍÐÝ ÔæÏ',mtWarning,mbYesNo,0) = mrYes Then
     begin
       If Frodm.RejBInvoPerm.Value = True Then
       Begin
         ShowMessage('ÝÇßÊæÑ ÏÇÆãí ÇÓÊ');
         Exit;
       End;
       BNo:=Frodm.RejBinvoBNo.Value;
       FacNo:=IntToStr(Frodm.RejBinvoNo.Value);
       BDat:=Frodm.RejBinvoDat.Value;
       DelBitem(FacNo,BNo,FTip);
       BillUpdate(BNo);
       UnDepot;
       Frodm.RejBInvoGood.First;
       For I:=1 To Frodm.RejBInvoGood.RecordCount Do Frodm.RejBInvoGood.Delete;
       Frodm.RejBInvo.Delete;
       New:=False;
       GoodFilter(Frodm.RejBinvoNo.AsInteger);//1381-08-29
       FNo.Text:=IntToStr(Frodm.RejBInvoNo.Value);
     End;
end;

procedure TFRejBvoice.FNoEnter(Sender: TObject);
Var
I:Integer;
begin
     If Frodm.RejBInvo.State = dsInsert Then
     Begin
       Frodm.RejBInvoGood.First;
       For I:=1 To Frodm.RejBInvoGood.RecordCount Do
       Begin
         Frodm.RejBInvoGood.Next;
       End;
       Frodm.RejBInvo.Delete;
     End Else
       Frodm.RejBInvo.Cancel;
end;

procedure TFRejBvoice.BeditClick(Sender: TObject);
begin
     BEdit.Enabled:=False;
     If Not(Frodm.RejBInvo.State=dsBrowse) Then Exit;
     BNo:=Frodm.RejBinvoBNo.Value;
     IF (Frodm.RejBInvoPerm.Value)or(IsBillLocked(BNO)) Then
     Begin
       BEdit.Enabled:=True;
       ShowMessage(sLocked);
       Exit;
     End;
     Find_SuplKod;
     
     FacNo:=IntToStr(Frodm.RejBinvoNo.Value);
     BDat:=Frodm.RejBinvoDat.Value;
     EdQu.SQL.Strings[1]:='WHERE I.No = '+FNo.Text;
     EdQu.Open;
     DelBitem(FacNo,BNo,FTip);
     UnDepot;
     FNam.SetFocus;
     Frodm.RejBinvo.Edit;
     New:=False;
     BSave.Enabled:=True;
end;

procedure TFRejBvoice.FNamDragDrop(Sender, Source: TObject; X, Y: Integer);
Var
List:TXPListBox;
begin
     If Not(Frodm.RejBinvo.State = dsBrowse)and (Source Is TXPListBox) Then
     Begin
       List:=(Source As TXPListBox);
       Frodm.RejBinvoNam.Value:=List.Items.Strings[List.ItemIndex];
       FAcSearch.Close;
       FNam.SetFocus;
     End;
end;

procedure TFRejBvoice.FNamDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
     Accept:=(Source Is TXPListBox) And ((Source As TXPListBox).Name = 'lbName')
end;

procedure TFRejBvoice.Dat1Enter(Sender: TObject);
begin
     If Frodm.RejBinvo.State = dsBrowse Then Dat1.ReadOnly :=True Else
     Begin
        Dat1.ReadOnly :=False;
        GetMaskText(Dat1);
     End;
end;

procedure TFRejBvoice.Dat1Exit(Sender: TObject);
begin
     If (Frodm.RejBinvo.State = dsBrowse) Then Exit;
     SetMaskText(Dat1);
     If(Not Date_Check(Dat1.Text))And(DateToInt(Dat1.Text)>0) Then Dat1.SetFocus Else
       Frodm.RejBinvoDat.Value :=DateToInt(Dat1.Text);
end;

procedure TFRejBvoice.FNamKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetAccountDbCombo(Sender,Key,'',0);
end;

procedure TFRejBvoice.FCKodKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetCentLookup(Sender,Key);
end;

end.
