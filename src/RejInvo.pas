unit RejInvo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Db, DBTables, ComCtrls, ExtCtrls,
  Grids, DBGrids, DBCGrids, Buttons, PopupListBox;

type
  TFRejInvo = class(TForm)
    Sb1: TStatusBar;
    Panel1: TPanel;
    Bprev: TBitBtn;
    Bsave: TBitBtn;
    Bnext: TBitBtn;
    Bnew: TBitBtn;
    Bexit: TBitBtn;
    Bprint: TBitBtn;
    Bdel: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label12: TLabel;
    Label19: TLabel;
    Label10: TLabel;
    FPkol: TDBEdit;
    FPdis: TDBEdit;
    Goods: TDBGrid;
    FNam: TDBComboBox;
    Ftel: TDBEdit;
    FAdd: TDBEdit;
    FPnet: TDBEdit;
    FNo: TEdit;
    FPINo: TDBEdit;
    Label7: TLabel;
    FEco: TDBComboBox;
    dblVisit: TDBLookupComboBox;
    Label13: TLabel;
    Deli: TDBCheckBox;
    cbPrint: TCheckBox;
    GoodList: TPopupListBox;
    CList: TPopupListBox;
    AList: TPopupListBox;
    Bedit: TBitBtn;
    BQu: TQuery;
    EdQu: TQuery;
    Label3: TLabel;
    Dat1: TMaskEdit;
    Label17: TLabel;
    Label18: TLabel;
    FCost: TDBComboBox;
    FCKod: TDBLookupComboBox;
    NQu: TQuery;
    procedure GoodsColExit(Sender: TObject);
    procedure BprevClick(Sender: TObject);
    procedure BsaveClick(Sender: TObject);
    procedure BnextClick(Sender: TObject);
    procedure GoodsExit(Sender: TObject);
    procedure BnewClick(Sender: TObject);
    procedure BexitClick(Sender: TObject);
    procedure FNamExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BprintClick(Sender: TObject);
    procedure FDatEnter(Sender: TObject);
    procedure GoodsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FNamChange(Sender: TObject);
    procedure GNamKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GoodsKeyPress(Sender: TObject; var Key: Char);
    procedure FNoExit(Sender: TObject);
    procedure FNoKeyPress(Sender: TObject; var Key: Char);
    procedure GoodsEditButtonClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FPnetEnter(Sender: TObject);
    procedure FPINoKeyPress(Sender: TObject; var Key: Char);
    procedure FPINoExit(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure GoodListKeyPress(Sender: TObject; var Key: Char);
    procedure GoodListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CListKeyPress(Sender: TObject; var Key: Char);
    procedure AListKeyPress(Sender: TObject; var Key: Char);
    procedure AListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GoodsEnter(Sender: TObject);
    procedure GoodsColEnter(Sender: TObject);
    procedure BdelClick(Sender: TObject);
    Procedure NexTab(Sender:TObject;Var Key :Char);
    procedure FormActivate(Sender: TObject);
    procedure dblVisitEnter(Sender: TObject);
    procedure FPdisEnter(Sender: TObject);
    procedure GoodsMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure BeditClick(Sender: TObject);
    procedure FNamDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure FNamDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure Dat1Enter(Sender: TObject);
    procedure Dat1Exit(Sender: TObject);
    procedure FNamKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FCKodKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    CustomerKod:Real;
    BehKod,BesKod:Real;
    Radif,InvoNo:Integer;
    State:Boolean;
    Str:String;
    MaxQ:Real;
    SumQ,SumP:Real;
    OutSum:Currency;
    Disc:Currency;
    MaxNo:Integer;
    MinNo:Integer;
    NewNo:Integer;
    MoFlag:Boolean;
    New:Boolean;
    BNo:Integer;
    NewBNo:Integer;
    BDat:Integer;
    FacNo:String;
    Rate:Currency;
    Procedure ColumnEnable;
    procedure Find_CustomerKod;
    Function DeleteCheck:Boolean;
    Function GoodSum(Kod:Integer;BNo,Color,Anb:String;Shelf:Integer):Real;
    Function NegDep:Boolean;
    Procedure UnDepot;
    Procedure Depot;
    Procedure FillFromPI(Sender:TObject;PINo:Integer);
    Procedure DrawList(List:TPopupListBox;Index:Integer);
    Procedure Close_Bill(Sender :TObject);
    Procedure QPSums;
    Procedure SetImage;
    Procedure CancelEdit;
    Procedure GoodFilter(FacNo:Integer);
    Function GetHavFacNo(HavNo:Integer):Integer;
    Function GetSoldFee(GKod,InvNo:Integer):Currency;
    Function GetInvPerc:Real;
  public
    { Public declarations }
  end;

var
  FRejInvo: TFRejInvo;

implementation

uses FrooshDM, FactorRep,Routins, ProVar, QrCtrls, MainForm,
  AcSearch, Converts, XPListBox, CRoutins, PSearch;

{$R *.DFM}
Const
Tip='„—ÃÊ⁄Ì ›—Ê‘';
FTip = 2;

Procedure TFRejInvo.NexTab(Sender:TObject;Var Key :Char);
begin
     If Key = #13 Then
     Begin
       Key:=#0;
       SelectNext(Sender As TWinControl,True,True);
     End;
end;

Procedure TFRejInvo.ColumnEnable;
Var
I:Integer;
begin
//     If (Frodm.RejInvoGoodKod.Value > 0) And (Frodm.RejInvoGoodQuant.Value > 0) Then
     If Good_Moj_Anb(Frodm.RejInvoGoodNam.Value,Frodm.RejInvoGoodColor.Value,
     Frodm.RejInvoGoodAnbNam.Value,Frodm.RejInvoGoodAnbKod.Value)<0 Then
      For I:=0 To 5 Do Goods.Columns[I].ReadOnly :=True
     Else
      For I:=0 To 5 Do Goods.Columns[I].ReadOnly :=False;
     Goods.Columns[2].ReadOnly :=True;
end;

Function TFRejInvo.DeleteCheck:Boolean;
Var
I:Integer;
begin
     Result:=True;
     Frodm.RejInvoGood.First;
     For I:=1 To Frodm.RejInvoGood.RecordCount Do
     Begin
       Result:=DepotCheck(Frodm.RejInvoGoodKod.Value,Frodm.RejInvoGoodAnbKod.Value,
                   Frodm.RejInvoGoodColor.Value,Frodm.RejInvoGoodAnbNam.Value,
                   Frodm.RejInvoGoodQuant.Value);
       If Not Result Then Exit;
       Frodm.RejInvoGood.Next;
     End;
     Frodm.RejInvoGood.First;
end;

Function TFRejInvo.GoodSum(Kod:Integer;BNo,Color,Anb:String;Shelf:Integer):Real;
Var
Filt:String;
begin
     Filt:='';
     Filt:='D.Kod = '+IntToStr(Kod);
     If Color > ''Then Filt:=Filt+' and D.Color='+#39+Color+#39;
     If Anb > ''  Then Filt:=Filt+' and D.AnbNam='+#39+Anb+#39;
     If Shelf > 0 Then Filt:=Filt+' and D.AnbKod= '+IntToStr(Shelf);
     If Pos(' and',Filt)= 1 Then Delete(Filt,1,4);

     If Color > ''Then Filt:=Filt+' and B.Color='+#39+Color+#39;
     If Anb > ''  Then Filt:=Filt+' and B.AnbNam='+#39+Anb+#39;
     If Shelf > 0 Then Filt:=Filt+' and B.AnbKod= '+IntToStr(Shelf);
     If Pos(' and',Filt)= 1 Then Delete(Filt,1,4);
     BQu.SQL.Strings[2]:='WHERE '+Filt+' and B.Kod='+IntToStr(Kod)+' and B.No ='+BNo;
     BQu.Open;
     Result:=BQu.Fields[0].AsFloat+BQu.Fields[1].AsFloat;
     BQu.Close;
end;

Function TFRejInvo.NegDep:Boolean;
Var
I:Integer;
Dbl:Boolean;
begin
     Result:=True;
     MoFlag:=True;
     If Frodm.RejInvo.State = dsBrowse Then Exit;
     If Not sDp Then Exit;
     Screen.Cursor:=crSQLWait;
     Qu.SQL.Clear;
     Qu.SQL.Add('SELECT Distinct Kod From RejInvoGood B Where B.No= '+FNo.Text);
     Qu.Open;
     Dbl:=Qu.RecordCount = Frodm.RejInvoGood.RecordCount;
     Qu.Close;
//     Result:=True;
//     MoFlag:=True;
     Frodm.RejInvoGood.First;
//-----------
     IF dbl Then

     For I:=1 To Frodm.RejInvoGood.RecordCount Do //
     Begin
        If Good_Moj_Anb(Frodm.RejInvoGoodNam.Value,Frodm.RejInvoGoodColor.Value,
                     Frodm.RejInvoGoodAnbNam.Value,Frodm.RejInvoGoodAnbKod.Value)+
                     Frodm.RejInvoGoodQuant.Value < 0 Then
       Begin
         Result:=False;
         MoFlag:=False;
         BSave.Enabled:=True;
         ShowMessage('„ﬁœ«— «“ Õœ«ﬁ· „„ﬂ‰ ﬂ„ — «” -Œÿ«Ì «‰»«— „‰›Ì');
         Goods.SetFocus;
         Exit;
       End;
       Frodm.RejInvoGood.Next;
     End
      ELse  //----
     For I:=1 To Frodm.RejInvoGood.RecordCount Do
     Begin
       If GoodSum(Frodm.RejInvoGoodKod.Value,FNo.Text,Frodm.RejInvoGoodColor.Value,
                  Frodm.RejInvoGoodAnbNam.Value,Frodm.RejInvoGoodAnbKod.Value) < 0 Then
       Begin
         Result:=False;
         MoFlag:=False;
         Bsave.Enabled:=True;
         ShowMessage('„ﬁœ«— «“ Õœ«ﬁ· „„ﬂ‰ ﬂ„ — «” -Œÿ«Ì «‰»«— „‰›Ì');
         Goods.SetFocus;
         Exit;
       End;
       Frodm.RejInvoGood.Next;
     End;
     Screen.Cursor:=crDefault;
     Frodm.RejInvoGood.First;
end;

Procedure TFRejInvo.UnDepot;
Var
I:Integer;
begin
     Frodm.RejInvoGood.First;
     For I:=1 To Frodm.RejInvoGood.RecordCount Do
     Begin
       DepotChange(Frodm.RejInvoGoodKod.Value,Frodm.RejInvoGoodAnbKod.value,
                   Frodm.RejInvoGoodColor.Value,Frodm.RejInvoGoodAnbNam.Value,
                   Frodm.RejInvoGoodQuant.Value,dpOut);
       Frodm.RejInvoGood.Next;
     End;
     Cardex_Del(FNo.Text,Tip);
end;

Procedure TFRejInvo.Depot;
Var
I:Integer;
begin
     For I:=1 To Frodm.RejInvoGood.RecordCount Do
     Begin
       Frodm.RejInvoGood.Edit;
       Frodm.RejInvoGoodRadif.Value:=I;
       Frodm.RejInvoGoodNo.Value:=Frodm.RejInvoNo.Value;
       Frodm.RejInvoGoodDat.Value:=Frodm.RejInvoDat.Value;
       Frodm.RejInvoGood.Post;
       DepotChange(Frodm.RejInvoGoodKod.Value,Frodm.RejInvoGoodAnbKod.value,
                   Frodm.RejInvoGoodColor.Value,Frodm.RejInvoGoodAnbNam.Value,
                   Frodm.RejInvoGoodQuant.Value,dpIn);
       Auto_GCardex(Frodm.RejInvoGoodNam.Value,Frodm.RejInvoGoodColor.Value,
                    Frodm.RejInvoGoodAnbNam.Value,Frodm.RejInvoGoodKod.Value,
                    Frodm.RejInvoGoodRadif.value,Frodm.RejInvoGoodQuant.Value,
                    dpIn,Frodm.RejInvoNo.Value,Frodm.RejInvoDat.Value,Tip,
                    FNam.Text,Frodm.RejInvoGoodReject.Value,Frodm.RejInvoGoodPerc.Value);//Frodm.RejInvoGoodPfee.Value
       Frodm.RejInvoGood.Next;
     End;
end;

//Procedure For Find Customers Kod If There is
procedure TFRejInvo.Find_CustomerKod;
Var
Kod:Real;
Dat:Integer;
begin
     Str:=Frodm.RejInvoNam.Value;
     CustomerKod:=AccKod(Str);
     If CustomerKod > 0 Then
     Begin
       If Frodm.RejInvo.State In[dsInsert,dsEdit] Then
       Begin
         Frodm.AcKod.IndexFieldNames :='AccKod';
         Frodm.AcKod.FindKey([CustomerKod]);
         If Frodm.AcKodUseKod.Value = 0 Then
         Begin
          ShowMessage('Õ”«» ⁄„·Ì« Ì ‰Ì” ');
          FNam.SetFocus;
          Exit;
         End;
         Frodm.RejInvoTel.Value :=Frodm.AcKodTel.Value;
         Frodm.RejInvoAdd.Value :=Frodm.AcKodAdd.Value;
       End;
       Sb1.Panels[2].Text :='Œ—Ìœ«— À«» ';
       Sb1.Panels[1].Text :=AccString(CustomerKod);
       If sFrem Then Sb1.Panels[0].Text :=CurrToFar(AcRemain(CustomerKod,Dat,
       Frodm.RejInvoCkod.AsString,Frodm.RejInvoCost.AsString));
     End;
     If CustomerKod = 0 Then
     Begin
       Sb1.Panels[2].Text :='Œ—Ìœ«— „ ›—ﬁÂ';
       Frodm.AutoBill.FindKey (['RJK']);
       Kod:=Frodm.AutoBillBesKod.Value;
       Sb1.Panels[1].Text:=AccString(Kod);
       If sFrem Then Sb1.Panels[0].Text :=CurrToFar(AcRemain(Kod,Dat,
       Frodm.RejInvoCkod.AsString,Frodm.RejInvoCost.AsString));
     End;
end;

Procedure TFRejInvo.FillFromPI(Sender:TObject;PINo:Integer);
Var
I,J:Integer;
IQu:TQuery;
Filt:String;
Q:Real;
LastValue:Currency;
InvNo:Integer;
begin
     IF PINo = 0 Then Exit;
     IF (Frodm.RejInvo.State=dsBrowse)Or(Frodm.RejInvoGood.RecordCount>0) Then Exit;
     InvNo:=GetHavFacNo(PINo);
     IQu:=TQuery.Create(Owner);
     IQu.DataBaseName:=CurrDb;
     IQu.SQL.Clear;
     IQu.SQL.Add('Select I.Nam,I.Tel,I.Adr,I.PKol,I.PDis,I.Pnet,I.Eco,I.Visit,I.LPerm,I.Ckod');
     IQu.SQL.Add('From Invoice I Where I.No=:n ');//+IntToStr(PINo));
     IQu.Params[0].Value:=InvNo;
     IQu.Open;

     Frodm.RejInvoFacNo.Value :=PINo;
     Frodm.RejInvoNam.Value  :=IQu.Fields[0].AsString;
     Frodm.RejInvoTel.Value  :=IQu.Fields[1].AsString;
     Frodm.RejInvoAdd.Value  :=IQu.Fields[2].AsString;
     Frodm.RejInvoPkol.Value :=IQu.Fields[3].AsCurrency;
     Frodm.RejInvoPdis.Value :=IQu.Fields[4].AsCurrency;
     Frodm.RejInvoPnet.Value :=IQu.Fields[5].AsCurrency;
     Frodm.RejInvoEco.Value  :=IQu.Fields[6].AsString;
     Frodm.RejInvoVisit.Value:=IQu.Fields[7].AsInteger;
     Frodm.RejInvoCkod.Value:=IQu.Fields[9].AsInteger;
     IQu.Close;
     IQu.SQL.Clear;
     IQu.SQL.Add('Select Kod,Nam,Color,Radif,AnbNam,AnbKod,Quant,'+
     'Pfee,Ptotal,Serial');//'Pfee,Perc,Ptotal,Serial,Garan,Prop');
     //IQu.SQL.Add('From InvoGood I Where I.No = '+IntToStr(PINo));
     IQu.SQL.Add('From DHavG I Where I.No = '+IntToStr(PINo));
     IQu.Open;
     IQu.First;

     For I:=1 To IQu.RecordCount Do
     Begin
      Q:=0;
      Sold_Price(P_Rule,Qu,IQu.Fields[0].AsString,IQu.Fields[2].AsString,
      IQu.Fields[4].AsString,0,0,111111111,Q,LastValue);
      Qu.SQL.Clear;
      Qu.SQL.Add('Select Nam,Color,Anb,AnbKod,Out,Fee');
      Qu.SQL.Add('From Cardex I Where I.No =:a and I.Des=:b ');
      Qu.Params[0].Value:=PINo;
      Qu.Params[1].Value:='ÕÊ«·Â ›—Ê‘';
      Qu.Open;
      If P_Rule = 'LiFo' Then Qu.Last;
      For J:=1 To Qu.RecordCount Do
      Begin
       Frodm.RejInvoGood.Append;
       Frodm.RejInvoGoodNo.Value:=Frodm.RejInvoNo.Value;
       Frodm.RejInvoGoodDat.Value :=Frodm.RejInvoDat.Value;
       Frodm.RejInvoGoodDelikod.Value:=False;
       Frodm.RejInvoGoodkod.Value :=IQu.Fields[0].AsInteger;
       Frodm.RejInvoGoodNam.Value :=Qu.Fields[0].AsString;
       Frodm.RejInvoGoodColor.Value :=Qu.Fields[1].AsString;
       Frodm.RejInvoGoodRadif.Value :=IQu.Fields[3].AsInteger;
       Frodm.RejInvoGoodAnbNam.Value:=Qu.Fields[2].AsString;
       //Frodm.RejInvoGoodAnbKod.Value :=IQu.Fields[5].AsInteger;
       Frodm.RejInvoGoodInv.Value :=IQu.Fields[5].AsInteger;
       Frodm.RejInvoGoodQuant.Value :=Qu.Fields[4].AsFloat;
       Frodm.RejInvoGoodPfee.Value :=GetSoldFee(IQu.Fields[0].AsInteger,IQu.Fields[5].AsInteger);// IQu.Fields[7].AsCurrency;
       //Frodm.RejInvoGoodPerc.Value :=IQu.Fields[8].AsCurrency;
       //Frodm.RejInvoGoodPtotal.Value :=IQu.Fields[9].AsCurrency;
       Frodm.RejInvoGoodReject.value:=Qu.Fields[5].value;//AsCurrency;
       Frodm.RejInvoGoodSerial.Value :=IQu.Fields[9].AsString;
       //Frodm.RejInvoGoodGaran.Value :=IQu.Fields[11].AsString;
       //Frodm.RejInvoGoodProp.Value:=IQu.Fields[12].AsString;
       Frodm.RejInvoGood.Post;
       If P_Rule = 'LiFo' Then Qu.Prior Else Qu.Next;
      End;
      Qu.Close;
      IQu.Next;
     End;
     IQu.Close;
     IQu.Destroy;
     FNamExit(Sender);
     Goods.SetFocus;
     Frodm.RejInvoGood.Edit;
end;

Procedure TFRejInvo.DrawList(List:TPopupListBox;Index:Integer);
begin
     List.Visible :=True;
     List.SetFocus;
     Bexit.Cancel :=False;
     List.ItemIndex :=0;
end;

Procedure TFRejInvo.Close_Bill(Sender :TObject);
Var
Sum:Currency;
begin
     BDat:=Frodm.RejInvoDat.Value;
     Rate:=GetRateatDate(Frodm.RejInvoEco.AsString,Frodm.RejInvoDat.Value);
     Sum:=FroDM.RejInvoPnet.Value;
     Str:='Œ«·’ ›«ﬂ Ê— „—ÃÊ⁄Ì ‘„«—Â'+' '+FNo.Text+' '+FNam.Text;
     Fno.Text;
     If CustomerKod > 0 Then
     Begin
       Frodm.AutoBill.FindKey(['RJK']);
       State:=Frodm.AutoBillStat.Value;
       BehKod:=Frodm.AutoBillBehKod.Value;
       NewBNo:=AutoBill(State,CustomerKod,BehKod,Sum*Rate,Str,FacNo,BNo,FTip,BDat,
       Frodm.RejInvoCost.AsString,Frodm.RejInvoCKod.AsInteger,Sum,Rate,
       Frodm.RejInvoEco.AsString);
     End else
       NewBNo:=Automation(Str,0,Sum*Rate,'RJK',FacNo,BNo,FTip,BDat,Frodm.RejInvoCost.AsString,
       Frodm.RejInvoCKod.AsInteger,Sum,Rate,Frodm.RejInvoEco.AsString);
//-----------------
     Frodm.AutoBill.FindKey(['GF']);
     State:=Frodm.AutoBillStat.Value;
     BehKod:=Frodm.AutoBillBehKod.Value;
     BesKod:=Frodm.AutoBillBesKod.Value;
     Str:='»—ê‘  «ﬁ·«„ ›«ﬂ Ê— „—ÃÊ⁄Ì ‘„«—Â'+' '+FNo.Text+' '+FNam.Text;
     NewBNo:=AutoBill(State,BehKod,BesKod,OutSum,Str,FacNo,BNo,FTip,BDat,
      Frodm.RejInvoCost.AsString,Frodm.RejInvoCKod.AsInteger,0,0,DefaultCurr);
//------------------
     If NewBNo = BNo Then BillUpdate(BNo) Else
      If sBill Then MakeBill('”‰œ „—ÃÊ⁄Ì ›—Ê‘ «“ '+' '+FNam.Text+''+
      'ÿÌ ›«ﬂ Ê— „—ÃÊ⁄Ì ›—Ê‘ ‘„«—Â '+FNo.Text);
     BNo:=NewBNo;
end;

Procedure TFRejInvo.QPSums;
begin
     Qu.SQL.Clear;
     Qu.SQL.ADD('SELECT SUM(D.Quant),SUM(D.Perc)');
     Qu.SQL.ADD('FROM RejInvoGood D');
     QU.SQL.ADD('WHERE D.No = '+FNo.Text);
     Qu.Open;
     SumQ:=Qu.Fields[0].AsFloat;
     SumP:=Qu.Fields[1].AsFloat;
     Qu.Close;
end;

Procedure TFRejInvo.SetImage;
begin
     Main.glKey.GetBitmap(0,BPrev.Glyph);
     Main.glKey.GetBitmap(1,Bnext.Glyph);
     Main.glKey.GetBitmap(2,BPrint.Glyph);
     Main.glKey.GetBitmap(3,Bedit.Glyph);
     Main.glKey.GetBitmap(4,Bsave.Glyph);
     Main.glKey.GetBitmap(5,Bdel.Glyph);
     Main.glKey.GetBitmap(7,BExit.Glyph);
end;

Procedure TFRejInvo.CancelEdit;
Var
I,J:Integer;
Send:TObject;
begin
     If (Not EdQu.Active)or(EdQu.RecordCount =0) Then Exit;
     GoodFilter(Frodm.RejInvoNo.AsInteger);
     Frodm.RejInvoGood.First;
     Send:=TObject.Create;
     For I:=1 To Frodm.RejInvoGood.RecordCount Do Frodm.RejInvoGood.Delete;
     EdQu.First;
     For I:=1 To EdQu.RecordCount Do
     Begin
       Frodm.RejInvoGood.Append;
       For J:=1 To 19 Do
         Frodm.RejInvoGood.Fields[J].Value:=EdQu.Fields[J].Value;
       Frodm.RejInvoGood.Post;
       EdQu.Next;
     End;
     EdQu.Close;
     Frodm.RejInvo.Cancel;
     Frodm.RejInvoGood.First;
     Close_Bill(Send);
     Depot;
     Send.Free;
End;

Procedure TFRejInvo.GoodFilter(FacNo:Integer);
begin
     Frodm.RejInvoGood.Filtered:=False;
     Frodm.RejInvoGood.Filter:='No = '+IntToStr(FacNo);
     Frodm.RejInvoGood.Filtered:=True;
     Dat1.Text:=IntToDate(Frodm.RejInvoDat.Value);
end;

Function TFRejInvo.GetHavFacNo(HavNo:Integer):Integer;
begin
     NQu.SQL.Clear;
     NQu.SQL.Add('Select RefNo From DHav D Where D.No=:n');
     NQu.Params[0].Value:=HavNo;
     NQu.Open;
     Result:=NQu.Fields[0].AsInteger;
     NQu.Close;
end;

Function TFRejInvo.GetSoldFee(GKod,InvNo:Integer):Currency;
begin
     NQu.SQL.Clear;
     NQu.SQL.Add('Select PFee From Invogood D Where D.Kod=:k and D.No=:n');
     NQu.Params[0].Value:=GKod;
     NQu.Params[1].Value:=InvNo;
     NQu.Open;
     Result:=NQu.Fields[0].AsCurrency;
     NQu.Close;
end;

function TFRejInvo.GetInvPerc: Real;
Var
Ps:TFPSearch;
begin
     Ps:=TFPSearch.Create(Application);
     With Ps Do
     Try
      Visible:=False;
      BorderStyle:=bsSingle;
      Caption:='·Ì”  ﬁÌ„  Â«Ì ›—ÊŒ Â ‘œÂ';
      DQu.SQL.Strings[1]:='Use '+Currpath;
      DQu.Params[0].Value:=Frodm.RejInvoGoodKod.Value;
      DQu.Params[1].Value:=Frodm.RejInvoNam.Value;
      DQu.Params[2].Value:=Frodm.RejInvoCkod.Value;
      DQu.Open;
      //If DQu.RecordCount > 0 Then
      ShowModal;
      Case ModalResult Of
      mrOK    :Begin
                Result:=DQuPerc.AsFloat;
                Frodm.RejInvoGoodQuant.Value:=DQuQuant.Value;
                Frodm.RejInvoGoodPfee.Value:=DQuPfee.Value;
                Frodm.RejInvoGoodReject.Value:=DQuinput.Value;
                Frodm.RejInvoGoodInv.Value:=DQuNo.Value;
                DQu.Close;
                DQu.SQL.Strings[1]:='Use '+Currpath;
                DQu.Open;
               end;
      mrCancel: Result:=Frodm.RejinvogoodPerc.AsFloat;
      End;
     Finally
      DQu.Close;
      DQu.SQL.Strings[1]:='Use '+Currpath;
      DQu.Open;
      DQu.Close;
      Free;
     End;
end;

//End Of Private decaleration

procedure TFRejInvo.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     Frodm.RejInvo.Open;
     Frodm.RejInvoGood.Open;
//     Frodm.RejInvoGood.MasterSource:=Frodm.RejInvoDs;
     BQu.DatabaseName:=CurrDb;
     EdQu.DatabaseName:=CurrDb;
     NQu.DatabaseName:=CurrDb;
     SetImage;
     Deli.Visible :=Boss;
     Bdel.Enabled :=Boss;
     Find_CustomerKod;
     Goods.Columns[4].Visible :=sAKod;
     Goods.Columns[9].Visible :=sPerc;
     Goods.Columns[3].Visible :=sModel;
     Goods.Columns[9].Width:=31;
     Goods.Columns[4].Width:=31;
     Goods.Columns[3].Width:=81;
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Min(I.No),Max(I.No) From RejInvo I');
     Qu.Open;
     MinNo:=Qu.Fields[0].AsInteger;
     MaxNo:=Qu.Fields[1].AsInteger;
     Qu.Close;
     Frodm.RejInvo.Refresh;
     Frodm.RejInvo.Last;
     NewNo:=MaxNo;
     FNo.Text :=IntToStr(Frodm.RejInvoNo.Value);
     GoodFilter(Frodm.RejInvoNo.AsInteger);//1381-08-29
     Radif:=1;
     MoFlag:=True;
     If sFac Then
      If MaxNo = 0 Then Exit Else BnewClick(Sender);
end;

procedure TFRejInvo.FormActivate(Sender: TObject);
begin
     FNam.Items.Assign(AcList);
     FCost.Items.Assign(CostList);
     GoodList.Items.Assign(Kala);
     FEco.Items.Assign(CurrList);
     Fill_Comb(Frodm.Color,'Color',CList.Items);
     Fill_Comb(Frodm.AnbDat,'Nam',AList.Items);
end;

// Calculating The Depot and Acount Bill For Sold Goods
procedure TFRejInvo.GoodsColExit(Sender: TObject);
begin
     If Frodm.RejInvo.State = dsBrowse Then Exit Else Frodm.RejInvoGood.Edit;
     Case Goods.SelectedField.Index Of
     1: Begin
          ColumnEnable;
          If Frodm.RejInvoGoodRadif.Value = 0 Then Frodm.RejInvoGoodRadif.Value :=Radif;
          Frodm.RejInvoGoodDat.Value :=Frodm.RejInvoDat.Value;
          Frodm.RejInvoGoodNo.Value:=Frodm.RejInvoNo.Value;
          Frodm.RejInvoGoodDelikod.Value:=False;
          Frodm.RejInvoGood.Post;
        End;
     2: If Goods.SelectedField.Value > 0 Then
        Case sGene Of
          False: Begin
              If Goods.Columns[1].ReadOnly Then Exit;
              If Frodm.RejInvoGoodNam.IsNull Then
               Frodm.RejInvoGoodNam.Value :=GoodNam(Goods.SelectedField.Value)
              Else
               GoodList.Items.Assign(Kala);
              If Goods.Columns[1].ReadOnly Then Exit;
              DrawList(GoodList,2);
              GoodList.ItemIndex:=GoodList.Items.IndexOf(Frodm.RejInvoGoodNam.Value);
              If GoodList.ItemIndex =-1 Then GoodList.ItemIndex:=0;
             End;
          True: Begin
              If Goods.Columns[1].ReadOnly Then Exit;
              If Frodm.RejInvoGoodNam.IsNull Then
               FillGene(GoodList.Items,Goods.SelectedField.Value)
              Else
               GoodList.Items.Assign(Kala);
              If Goods.Columns[1].ReadOnly Then Exit;
              DrawList(GoodList,2);
              GoodList.ItemIndex:=GoodList.Items.IndexOf(Frodm.RejInvoGoodNam.Value);
              If GoodList.ItemIndex =-1 Then GoodList.ItemIndex:=0;
             End;
        End;
     5:  Frodm.RejInvoGoodAnbNam.Value := AnbNam(Frodm.RejInvoGoodAnbNam.Value);
     6: If Goods.SelectedField.Text = Null Then Goods.SelectedField.Value :=0;
     7: Begin
         ColumnEnable;
         If (Frodm.RejInvoGoodQuant.Value>MaxQ)and(MaxQ>0) Then
         Frodm.RejInvoGoodQuant.Value:=MaxQ;
         Frodm.RejInvoGoodPtotal.Value :=(1-Frodm.RejInvoGoodPerc.AsFloat /100)*
         Frodm.RejInvoGoodPfee.Value *Frodm.RejInvoGoodQuant.Value;
         //Frodm.RejInvoGoodPerc.AsFloat:=GetInvPerc;
        End;
     10:Frodm.RejInvoGoodPtotal.Value :=(1-Frodm.RejInvoGoodPerc.AsFloat /100)*
       Frodm.RejInvoGoodPfee.Value *Frodm.RejInvoGoodQuant.Value;
     End;
     If Goods.Columns[0].Field.Value > 0 Then Radif:=Frodm.RejInvoGoodRadif.Value ;
end;

procedure TFRejInvo.GoodsExit(Sender: TObject);
var
I:Integer;
Sum,Nsum:Currency;
begin
     If FroDM.RejInvo.State = dsBrowse Then Exit ;
     FroDM.RejInvoGood.First;
     Sum:=0;Nsum:=0;OutSum:=0;
     For I:=1 to FroDM.RejInvoGood.RecordCount Do
     Begin
       Sum:=Sum+FroDM.RejInvoGoodPFee.Value * Frodm.RejInvoGoodQuant.Value;
       OutSum:=OutSum+FroDM.RejInvoGoodReject.Value * Frodm.RejInvoGoodQuant.Value;
       Nsum:=Nsum+FroDM.RejInvoGoodPtotal.Value;
       FroDM.RejInvoGood.Next;
     End;
     FroDM.RejInvoPkol.Value:=Sum;
     Frodm.RejInvoPnet.Value:=Nsum;
     Disc:=0;
     If sPerc Then
     Begin
      Disc:=Sum-Nsum;
      Frodm.RejInvoPdis.Value:=Disc;
     End;
end;

procedure TFRejInvo.GoodsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Not(Frodm.RejInvo.State = dsBrowse) Then Frodm.RejInvoGood.Edit;
     //MaxQ:=Frodm.RejInvoGoodQuant.Value;
     If (Shift = [ssCtrl]) Then FPkol.SetFocus;
     If (Shift = [ssCtrl]+[ssShift]) Then FAdd.SetFocus;
     IF (Key = VK_F4) and Not(Frodm.RejInvo.State = dsBrowse) Then
     {And Not(Goods.Columns[Goods.SelectedIndex].ReadOnly)}
     Case Goods.SelectedField.Index Of
     3: DrawList(GoodList,2);
     4: DrawList(Clist,3);
     5: DrawList(AList,4);
     End;
     If (Goods.SelectedIndex In [0,1,2,3])and(Key=32)and Not(Frodm.RejInvo.State = dsBrowse) Then
     Begin
      FindGoods(Frodm.RejInvoGood,Frodm.RejInvoNo.AsInteger,Frodm.RejInvoDat.AsInteger,Frodm.RejInvoNam.AsString);
      Goods.SelectedField :=Frodm.RejInvoGoodQuant;
     End;

     If (Goods.SelectedIndex In [8,10]) and Not(Frodm.RejInvo.State = dsBrowse) Then
     Case Key Of
       VK_MULTIPLY :Begin
               Frodm.RejInvoGood.Post;
               Frodm.RejInvoGood.Edit;
               Goods.SelectedField.Value := Goods.SelectedField.Value*1000;
               End;
       VK_DIVIDE   : Begin
               Frodm.RejInvoGood.Post;
               Frodm.RejInvoGood.Edit;
               Goods.SelectedField.Value := Goods.SelectedField.Value* 100;
               End;
     End;

end;

procedure TFRejInvo.BprevClick(Sender: TObject);
begin
     If Frodm.RejInvo.State In [dsEdit,dsInsert] Then
     Begin
      FNo.SetFocus;
      IF Check_Factor_State(Frodm.RejInvo,BSaveClick,FormDestroy) = idCancel Then Exit;
      New:=False;
      Exit;
     End;
     If Not MoFlag Then Exit;
     Frodm.RejInvo.Refresh;
     FroDM.RejInvo.Prior;
     FNo.Text:=IntToStr(Frodm.RejInvoNo.Value);
     GoodFilter(Frodm.RejInvoNo.AsInteger);//1381-08-29
     NewNo:=Frodm.RejInvoNo.Value+1;
     Find_CustomerKod;
end;

procedure TFRejInvo.BeditClick(Sender: TObject);
begin
     BEdit.Enabled:=False;
     If Not(Frodm.RejInvo.State=dsBrowse) Then Exit;
     BNo:=Frodm.RejInvoBno.Value;
     If (Frodm.RejInvoPerm.Value)or(IsBillLocked(BNO)) Then
     Begin
       BEdit.Enabled:=True;
       ShowMessage(sLocked);
       Exit;
     End;
     Find_CustomerKod;
     EdQu.SQL.Strings[1]:='WHERE I.No ='+FNo.Text;
     EdQu.Open;
     
     BDat:=Frodm.RejInvoDat.Value;
     FacNo:=IntToStr(Frodm.RejInvoNo.Value);
     DelBitem(FacNo,BNo,FTip);
     UnDepot;
     FNam.SetFocus;
     Frodm.RejInvo.Edit;
     New:=False;
     BSave.Enabled:=True;
end;

procedure TFRejInvo.BsaveClick(Sender: TObject);
begin
     BSave.Enabled:=False;
     If FroDM.RejInvo.State = dsBrowse Then Exit;
     FNo.SetFocus;
     If Frodm.RejInvoGood.RecordCount = 0 Then
     Begin
       Frodm.RejInvo.Delete;
       FNo.Text:=IntToStr(Frodm.RejInvoNo.Value);
       GoodFilter(Frodm.RejInvoNo.AsInteger);//1381-08-29
       New:=False;
       BNo:=0;
       BDat:=0;
       FacNo:='';
       Find_CustomerKod;
       BEdit.Enabled:=True;
       Exit;
     End;
     GoodsExit(Sender);//If Frodm.RejInvoPKol.Value = 0 Then
     Disc:=0;
     FroDM.RejInvoPnet.Value :=Frodm.RejInvoPkol.Value -Frodm.RejInvoPdis.Value;
     If Not RequierdCheck(Frodm.RejInvo) Then
     Begin
       Bsave.Enabled:=True;
       Exit;
     End;
     FroDM.RejInvoPerm.Value:=sPerm;
     If NegDep Then FroDM.RejInvo.Post Else Exit;
     Depot;
     Close_Bill(Sender);
     FacBillNo(Frodm.RejInvo,Frodm.RejInvoNo.AsInteger,BNo);
     QuickCloseOpen([21,20,6,24,11,27]);
     Frodm.RejInvo.Locate('No',StrToInt(FNo.Text),[loCaseInsensitive]);
     Find_CustomerKod;
     Radif:=1;
     EdQu.Close;
     New:=False;
     BNo:=0;
     BDat:=0;
     FacNo:='';
     OutSum:=0;
     BEdit.Enabled:=True;
     If cbPrint.Checked Then BprintClick(Sender);
     If sFac Then BnewClick(Sender);
end;

procedure TFRejInvo.BnextClick(Sender: TObject);
begin
     If Frodm.RejInvo.State In [dsEdit,dsInsert] Then
     Begin
      FNo.SetFocus;
      IF Check_Factor_State(Frodm.RejInvo,BSaveClick,FormDestroy) = idCancel Then Exit;
      New:=False;
      Exit;
     End;
     If Not MoFlag Then Exit;
     frodm.RejInvo.Refresh;
     FroDM.RejInvo.Next;
     FNo.Text:=IntToStr(Frodm.RejInvoNo.Value);
     GoodFilter(Frodm.RejInvoNo.AsInteger);//1381-08-29
     NewNo:=Frodm.RejInvoNo.Value+1;
     Find_CustomerKod;
     If Frodm.RejInvo.Filtered = True Then Exit;
     If Frodm.RejInvo.Eof = True Then
     Begin
       FNo.Text:=IntToStr(NewNo);
       FNo.SetFocus;
     End;
end;


procedure TFRejInvo.BnewClick(Sender: TObject);
begin
     If Frodm.RejInvo.Filtered Then Exit;
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Max(I.No) From RejInvo I ');
     Qu.Open;
     MaxNo:=Qu.Fields[0].AsInteger;
     Qu.Close;
     FroDM.RejInvo.Append;
     IF sFac Then
      Frodm.RejInvoNo.Value :=MaxNo+1
     Else
      Frodm.RejInvoNo.Value :=StrToInt(FNo.Text);
     Frodm.RejInvoNam.Value:='‰«„ Œ—Ìœ«—';
     Frodm.RejInvoDat.Value:=Fardate;
     Frodm.RejInvoPerm.Value:=False;
     GoodFilter(Frodm.RejInvoNo.AsInteger);//1381-08-29
     FNo.Text:=IntToStr(Frodm.RejInvoNo.Value);
     Frodm.RejInvo.Post;
     Frodm.RejInvo.Edit;
     New:=True;
     BNo:=0;
     BDat:=Frodm.RejInvoDat.Value;
     FacNo:=FNo.Text;
     Sb1.Panels[2].Text :='ÃœÌœ';
     BSave.Enabled:=True;
     BEdit.Enabled:=False;
     FPiNo.Text :='0';
end;

procedure TFRejInvo.BexitClick(Sender: TObject);
begin
     FNo.SetFocus;
     IF Check_Factor_State(Frodm.RejInvo,BSaveClick,FormDestroy) = idCancel Then Exit;
//     IF Net_Check_State(New,BSaveClick,FormDestroy)=idCancel Then Exit;
     FRejInvo.Close;
end;

procedure TFRejInvo.BprintClick(Sender: TObject);
Var
QDbT:TQRDbText;
I:Integer;
RowCnt:Integer;
FreeP:Real;
LesMar:Real;
CnHeight:Real;
SubH:Real;
BRow:Integer;
begin
     If Not(Frodm.RejInvo.State = dsBrowse) Then Exit;
     QPSums;
     CreatingForm(TFacQr,'FacQr',FacQr);
     FacQr.qrPSum.Caption:=FloatToStr(SumP);
     FacQr.qrQsum.Caption:=FloatToStr(SumQ);
     FacQr.QRSubDetail3.DataSet :=Frodm.RejInvoGood;  //  'RejInvoGood.Radif+'+#39+'-'+#39+
//     FacQr.QRExpr1.Expression :='+RejInvoGood.Nam +'+#39+ '  '+#39+'+RejInvoGood.Color';
     Set_Sys_Enviroment;

     CnHeight:=FacQr.QRBand1.Size.Height+FacQr.QRBand2.Size.Height+
     FacQr.QRChildBand2.Size.Height+FacQr.ChildBand3.Size.Height+
     FacQr.ChildBand1.Size.Height+FacQr.PageFooterBand1.Size.Height;
     FacQr.QRSubDetail3.Size.Height:=5.8;
     SubH:=FacQr.QRSubDetail3.Size.Height;
     FreeP:=(PLength-CnHeight-TopMar-ButMar);
     RowCnt:=Trunc((FreeP/SubH));
     LesMar:=FreeP-(RowCnt*SubH);
     If Int(LesMar) = Int(SubH) Then LesMar:=LesMar-1;
     FacQr.ChildBand1.Size.Height:=FacQr.ChildBand1.Size.Height+Int(LesMar);
     BRow:=Frodm.RejInvoGood.RecordCount Mod RowCnt;
     IF BRow>0 Then
      FacQr.GFB.Size.Height:=(SubH)*(RowCnt-BRow)
     Else
      FacQr.GFB.Size.Height:=0;
//     FacQr.GFB.Size.Height:=(SubH)*(RowCnt-Frodm.RejInvoGood.RecordCount Mod RowCnt);

     FacQr.QRLabel1.Caption:='›«ﬂ Ê— „—ÃÊ⁄Ì ›—Ê‘';
     FacQr.qrTit.Caption :=InvoLbl;
     FacQr.QrAdd.Caption:=Master;
     FacQr.qrCom.Caption:=Comm;
     FacQr.PrinterSettings.Copies:=PrnCnt;
     FacQr.qrFRem.Caption:=FarsiPrice(Frodm.RejInvoPnet.Value);
     If CustomerKod > 0 Then FacQr.qrlRem.Caption :=Sb1.Panels[0].Text;
     FacQr.qrlRem.Enabled :=sRem;
//     If sRem = 0 Then FacQr.QRLabel20.Enabled :=False;}
     For I:=0 To FacQr.ComponentCount-1 Do
     Begin
       If FacQr.Components[I] is TQRDbText Then
       Begin
          QDbT:=(FacQr.Components[I] As TQRDbText);
          If QDbT.DataSet =Frodm.Invo Then QDbT.DataSet :=Frodm.RejInvo;
          If QDbT.DataSet =Frodm.InvoGood Then QDbT.DataSet :=Frodm.RejInvoGood;
       End;
     End;
     If cbPrint.Checked Then FacQr.Print Else FacQr.Preview;
     FacQr.Destroy;
end;

procedure TFRejInvo.FNamExit(Sender: TObject);
begin
     Find_CustomerKod;
     If Not(FroDM.RejInvo.State = dsInsert) Then Exit;
//     FroDM.RejInvo.FieldByName('Dat').AsInteger:=FarDate;
end;

procedure TFRejInvo.FDatEnter(Sender: TObject);
begin
     If FroDM.RejInvo.State = dsBrowse Then Exit;
     FroDM.RejInvo.FieldByName('Dat').AsInteger:=FarDate;
end;

procedure TFRejInvo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Case New Of
     True : IF Check_Factor_State(Frodm.RejInvo,BSaveClick,FormDestroy) = idCancel Then
             Action:=caNone
            Else
             Action:=caFree;
     False: If NegDep Then Action:=caFree Else Action :=caNone;
     End;
     If Action= caFree Then
     Begin
      Frodm.RejInvo.Close;
      Frodm.RejInvoGood.Close;
     End;
end;

procedure TFRejInvo.FormDestroy(Sender: TObject);
begin
     If Frodm.RejInvo.State = dsBrowse Then Exit;
     Case New Of
     True  :Begin
             CancelFactor(Frodm.RejInvo,Frodm.RejInvoGood);// CancelOnExit(Frodm.RejInvoGood);
             GoodFilter(Frodm.RejInvoNo.AsInteger);//1381-08-29
             FNo.Text:=IntToStr(Frodm.RejInvoNo.AsInteger);
            End;
     False : CancelEdit; //BSaveClick(Sender);
     End;
     BSave.Enabled:=False;
     BEdit.Enabled:=True;
end;

procedure TFRejInvo.FNamChange(Sender: TObject);
begin
//     If Frodm.RejInvo.State =dsBrowse Then
//                     FPiNo.Text :=IntToStr(Frodm.RejInvoFacNo.Value);
end;

procedure TFRejInvo.GNamKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key = 13 Then
     Begin
       Key:=0;
       FRejInvo.SelectNext(Sender As TWinControl,True,True);
     End;
end;

procedure TFRejInvo.GoodsKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
       If (Goods.SelectedField.Index = 11) and Not(Frodm.RejInvo.State =dsBrowse) Then
         If (Frodm.RejInvoGoodPfee.Value = 0 ) Then
          Frodm.RejInvoGoodPfee.Value:=Frodm.RejInvoGoodPTotal.Value /
                 (Frodm.RejInvoGoodQuant.Value/(1-Frodm.RejInvoGoodPerc.AsFloat/100));
       Key:=#0;
       GridMove(Goods,Frodm.RejInvo,Radif);
     End;
     If Not(Frodm.RejInvo.State = dsBrowse) Then Frodm.RejInvoGood.Edit;
end;

procedure TFRejInvo.GoodsMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
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

procedure TFRejInvo.FNoExit(Sender: TObject);
begin
     If Frodm.RejInvo.State in [dsEdit,dsInsert] Then
     Begin
      Fno.Text:=IntToStr(Frodm.RejInvoNo.Value);
      Exit;
     End;
     NewNo:=StrToInt(FNo.Text);
     IF Not Frodm.RejInvo.Locate('No',NewNo,[loCaseInsensitive]) Then BNewClick(Sender) Else
      GoodFilter(Frodm.RejInvoNo.AsInteger);//1381-08-29
     Find_CustomerKod;
end;

procedure TFRejInvo.FNoKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then FNoExit(Sender);
     NexTab(Sender,Key);
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;
end;

procedure TFRejInvo.GoodsEditButtonClick(Sender: TObject);
begin
     If Frodm.RejInvo.State In [dsInsert,dsEdit] Then
     Begin
//       If Good_Moj_Anb(Frodm.RejInvoGoodNam.Value,Frodm.RejInvoGoodColor.Value,
//       Frodm.RejInvoGoodAnbNam.Value,Frodm.RejInvoGoodAnbKod.Value)<0 Then Exit;
       Frodm.RejInvoGood.Delete;
       Frodm.RejInvoGood.Edit;
     End;
end;

procedure TFRejInvo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key = VK_F3 Then BsaveClick(Sender);
     If Shift = [ssAlt] Then
      Case Key Of
       VK_Left:BprevClick(Sender);
       VK_RIGHT:BnextClick(Sender);
      End;
end;

procedure TFRejInvo.FPdisEnter(Sender: TObject);
begin
     If (Frodm.RejInvo.State = dsBrowse)Or(sPerc = False) Then Exit;
     Frodm.RejInvoPdis.Clear;
end;

procedure TFRejInvo.FPnetEnter(Sender: TObject);
begin
     If Frodm.RejInvo.State = dsBrowse Then Exit;
     Frodm.RejInvoPdis.Value:=Frodm.RejInvoPdis.Value+Disc;
     FroDM.RejInvoPnet.Value :=Frodm.RejInvoPkol.Value -Frodm.RejInvoPdis.Value;
end;

procedure TFRejInvo.FPINoKeyPress(Sender: TObject; var Key: Char);
begin
     NexTab(Sender,Key);
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;

end;

procedure TFRejInvo.FPINoExit(Sender: TObject);
begin
//     If (New)and(FPiNo.Text >'') Then//(Frodm.RejInvo.State = dsInsert)
//     Begin
       InvoNo:=StrToInt(FPINo.Text);
       FillFromPI(Sender,Frodm.RejInvoFacNo.AsInteger);
//     End;
end;

procedure TFRejInvo.GoodListKeyPress(Sender: TObject; var Key: Char);
begin
     If Key =#13 Then
     Begin
       Frodm.RejInvoGood.Edit;
       Frodm.RejInvoGoodNo.Value:=Frodm.RejInvoNo.Value;
       Frodm.RejInvoGoodNam.Value:=GoodList.Items.Strings[GoodList.ItemIndex];
       Frodm.RejInvoGoodKod.Value :=GoodKod(Frodm.RejInvoGoodNam.Value);
       Frodm.RejInvoGoodPfee.Value :=GoodSoldPrice(Frodm.RejInvoGoodKod.Value);
       Frodm.RejInvoGood.Post;
       Goods.SetFocus;
       Goods.SelectedField :=Frodm.RejInvoGoodNam;
       GoodList.Visible :=False;
       Bexit.Cancel :=True;
     End;

end;

procedure TFRejInvo.GoodListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key = 27 Then
     Begin
       Goods.SetFocus;
       Goods.SelectedField :=Goods.Columns[1].Field;
       GoodList.Visible :=False;
       Bexit.Cancel :=True;
     End;

end;

procedure TFRejInvo.CListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key = 27 Then
     Begin
       Goods.SetFocus;
       Goods.SelectedField :=Frodm.RejInvoGoodColor;
       CList.Visible :=False;
       Bexit.Cancel :=True;
     End;
end;

procedure TFRejInvo.CListKeyPress(Sender: TObject; var Key: Char);
begin
     If Key =#13 Then
     Begin
       Frodm.RejInvoGood.Edit;
       Frodm.RejInvoGoodColor.Value:=CList.Items.Strings[CList.ItemIndex];
       Goods.SetFocus;
       Goods.SelectedField :=Frodm.RejInvoGoodColor;
       CList.Visible :=False;
       Bexit.Cancel :=True;
     End;
end;

procedure TFRejInvo.AListKeyPress(Sender: TObject; var Key: Char);
begin
     If Key =#13 Then
     Begin
       Frodm.RejInvoGood.Edit;
       Frodm.RejInvoGoodAnbNam.Value:=AList.Items.Strings[AList.ItemIndex];
       Goods.SetFocus;
       Goods.SelectedField :=Frodm.RejInvoGoodAnbNam;
       AList.Visible :=False;
       Bexit.Cancel :=True;
     End;

end;

procedure TFRejInvo.AListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key = 27 Then
     Begin
       Goods.SetFocus;
       Goods.SelectedField :=Frodm.RejInvoGoodAnbNam;
       AList.Visible :=False;
       Bexit.Cancel :=True;
     End;
end;

procedure TFRejInvo.GoodsEnter(Sender: TObject);
begin
     If (FroDM.RejInvo.State = dsBrowse) Then  Goods.ReadOnly := True Else
         Goods.ReadOnly :=False;
     Goods.SelectedField :=Goods.Columns[0].Field;
end;

procedure TFRejInvo.GoodsColEnter(Sender: TObject);
Var
iNo:Integer;
begin
     If Frodm.RejInvo.State = dsBrowse Then Exit Else Frodm.RejInvoGood.Edit;
     Case Goods.SelectedField.Index Of
     1: If Frodm.RejInvoGoodRadif.Value > 0 Then Radif:=Frodm.RejInvoGoodRadif.Value;
     3: If (Frodm.RejInvoGoodKod.Value = 0 )Then
        Case sGene Of
        False:Begin
           If Goods.Columns[1].ReadOnly Then Exit;
           DrawList(GoodList,2);
          End;
        True:Begin
           If Goods.Columns[1].ReadOnly Then Exit;
           GoodList.Items.Assign(Kala);
           DrawList(GoodList,2);
          End;
        End;
     4: If SModel Then
        Begin
         If Goods.Columns[1].ReadOnly Then Exit;
         DrawList(CList,3);
         CList.ItemIndex:=CList.Items.IndexOf(Frodm.RejInvoGoodColor.Value);
         If CList.ItemIndex =-1 Then CList.ItemIndex:=0;
        End;
     5: Begin
         //IF (Frodm.RejInvoGoodColor.Value = '')and(sModel) Then Goods.SelectedField:=Frodm.RejInvoGoodColor;
         IF Frodm.RejInvoGoodNam.Value = '' Then Goods.SelectedField:=Frodm.RejInvoGoodNam;
         If Not Goods.Columns[1].ReadOnly Then DrawList(AList,4);
        End;
     6: IF Frodm.RejInvoGoodAnbNam.Value = '' Then Goods.SelectedField:=Frodm.RejInvoGoodAnbNam;
     7: Frodm.RejInvoGoodPerc.AsFloat:=GetInvPerc;
    11: Frodm.RejInvoGoodPtotal.Value :=(1-Frodm.RejInvoGoodPerc.Value /100)*
           Frodm.RejInvoGoodPfee.Value *Frodm.RejInvoGoodQuant.Value;
     End;

end;

procedure TFRejInvo.BdelClick(Sender: TObject);
Var
I:Integer;
begin
     If Not(Frodm.RejInvo.State = dsBrowse) Then Exit;
     If MessageDlg('›«ﬂ Ê— Õ–› ‘Êœ',mtWarning,mbYesNo,0) = mrYes Then
     begin
       If Frodm.RejInvoPerm.Value = True Then
       Begin
         ShowMessage('›«ﬂ Ê— œ«∆„Ì «” ');
         Exit;
       End;
       If Not DeleteCheck Then
       Begin
         Beep;
         ShowMessage('ÌﬂÌ «“ «ﬁ·«„°„ÊÃÊœÌ ﬂ«›Ì ‰œ«—œ.ﬁ«»· Õ–› ‰Ì” ');
         Exit;
       End;
       BNo:=Frodm.RejInvoBno.Value;
       FacNo:=IntToStr(Frodm.RejInvoNo.Value);
       BDat:=Frodm.RejInvoDat.Value;
       DelBItem(FacNo,BNo,FTip);
       BillUpdate(BNo);
       UnDepot;
       Frodm.RejInvoGood.First;
       For I:=1 To Frodm.RejInvoGood.RecordCount Do Frodm.RejInvoGood.Delete;
       Frodm.RejInvo.Delete;
       New:=False;
       GoodFilter(Frodm.RejInvoNo.AsInteger);//1381-08-29
       FNo.Text:=IntToStr(Frodm.RejInvoNo.Value);
     End;
end;

procedure TFRejInvo.dblVisitEnter(Sender: TObject);
begin
     If Frodm.RejInvo.State <> dsBrowse Then dblVisit.DropDown;
end;

procedure TFRejInvo.FNamDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
     Accept:=(Source Is TXPListBox) And ((Source As TXPListBox).Name = 'lbName')
end;

procedure TFRejInvo.FNamDragDrop(Sender, Source: TObject; X, Y: Integer);
Var
List:TXPListBox;
begin
     If Not(Frodm.RejInvo.State = dsBrowse)and (Source Is TXPListBox) Then
     Begin
       List:=(Source As TXPListBox);
       Frodm.RejInvoNam.Value:=List.Items.Strings[List.ItemIndex];
       FAcSearch.Close;
       FNam.SetFocus;
     End;
end;

procedure TFRejInvo.Dat1Enter(Sender: TObject);
begin
     If Frodm.RejInvo.State = dsBrowse Then Dat1.ReadOnly :=True Else
     Begin
        Dat1.ReadOnly :=False;
        GetMaskText(Dat1);
     End;
end;

procedure TFRejInvo.Dat1Exit(Sender: TObject);
begin
     If (Frodm.RejInvo.State = dsBrowse) Then Exit;
     SetMaskText(Dat1);
     If(Not Date_Check(Dat1.Text))And(DateToInt(Dat1.Text)>0) Then Dat1.SetFocus Else
       Frodm.RejInvoDat.Value :=DateToInt(Dat1.Text);
end;

procedure TFRejInvo.FNamKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetAccountDbCombo(Sender,Key,'',0);
end;


procedure TFRejInvo.FCKodKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetCentLookup(Sender,Key);
end;

end.
