unit ReBill;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ExtCtrls, Db, DBTables;

type
  TFReBill = class(TForm)
    Teep: TRadioGroup;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    FNo1: TEdit;
    FNo2: TEdit;
    FDat1: TMaskEdit;
    FDat2: TMaskEdit;
    Bshow: TButton;
    Bexit: TButton;
    Bevel1: TBevel;
    Bevel2: TBevel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure BshowClick(Sender: TObject);
    procedure BexitClick(Sender: TObject);
    procedure FDat1Exit(Sender: TObject);
    procedure FDat2Exit(Sender: TObject);
    procedure FDat1Enter(Sender: TObject);
    procedure FDat2Enter(Sender: TObject);
    procedure FNo1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    Procedure DelAllBItem(Btip
    :Integer);
    Function Make_Filt_String :String;
    Function Cheq_Filt:String;
    Function Pay_Cheq_Filt:String;
    Function GetPassDate(BNo,Keler:String;PBill:Currency):Integer;
    Procedure Make_Buy_Bill;
    Procedure Make_Sell_Bill;
    Function Get_Inv_Rej(FNo:Integer):Currency;
    Procedure Make_RInv_Bill;
    Function Get_Binv_Rej(FNo:Integer):Currency;
    Procedure Make_RBInv_Bill;
    Procedure Make_RMon_Bill;
    Procedure Make_PMon_Bill;
    Procedure Make_NFish_Bill;
    Procedure Make_BHav_Bill;
    Procedure Make_DCheq_Bill;
    Procedure Make_CheqOut_Bill;
    Procedure Make_Keler_Bill;
    Procedure Make_UnKeler_Bill;
    Procedure Make_Vosol_Bill;
    Procedure Make_Reject_Bill;
    Procedure Make_PCheq_Bill;
    Procedure Make_Pass_Bill;
    Procedure Make_CarMoz_Bill;
    Procedure Make_Remmitance_Bill;
    Procedure Make_Exchange_Bill;
    Procedure Make_Expense_Bill;
    Procedure Make_Havale_Bill;
    Procedure Make_Resid_Bill;
    Procedure Make_IRej_Bill;
    Procedure Make_ORej_Bill;
  public
    { Public declarations }
  end;

var
  FReBill: TFReBill;

implementation

uses FrooshDM, Routins, ProVar, Converts, CRoutins;

{$R *.DFM}

Procedure TFReBill.DelAllBItem(Btip:Integer);
Var
I:Integer;
OFlt:String;
begin
     OFlt:=Frodm.AcBill.Filter;
     Frodm.AcBill.Filter:='Btip = '+IntToStr(Btip);
     Frodm.AcBill.Filtered:=True;
     For I:=1 to Frodm.Acbill.RecordCount Do Frodm.AcBill.Delete;
     If OFlt > '' Then
      Frodm.AcBill.Filter:=OFlt
     Else Begin
      Frodm.AcBill.Filter:='';
      Frodm.AcBill.Filtered:=False;
      Frodm.AcBill.Last;
     End;
end;

Function TFReBill.Make_Filt_String :String;
Var
Str:String;
I:Integer;
begin
     Str:='';
     If FNo1.Text <> '' Then Str:='No >='+FNo1.Text;
     If FNo2.Text <> '' Then Str:=Str+' and No <='+FNo2.Text;
     I:=DateToInt(FDat1.Text);
     If I > 0 Then Str:=Str+' and Dat >= '+IntToStr(I);
     I:=DateToInt(FDat2.Text);
     If I > 0 Then Str:=Str+' and Dat <= '+IntToStr(I);
     If Pos(' and',Str) = 1 Then Delete(Str,1,4);
     Result:=Str;
end;

Function TFReBill.Cheq_Filt :String;
Var
Str:String;
I:Integer;
begin
     Str:='';
     If FNo1.Text <> '' Then Str:='Inv >='+FNo1.Text;
     If FNo2.Text <> '' Then Str:=Str+' and Inv <='+FNo2.Text;
     I:=DateToInt(FDat1.Text);
     If I > 0 Then Str:=Str+' and Recdat >= '+IntToStr(I);
     I:=DateToInt(FDat2.Text);
     If I > 0 Then Str:=Str+' and Recdat <= '+IntToStr(I);
     If Pos(' and',Str) = 1 Then Delete(Str,1,4);
     Result:=Str;
end;

Function TFReBill.Pay_Cheq_Filt:String;
Var
Str:String;
I:Integer;
begin
     Str:='';
     I:=DateToInt(FDat1.Text);
     If I > 0 Then Str:=Str+' and Paydat >= '+IntToStr(I);
     I:=DateToInt(FDat2.Text);
     If I > 0 Then Str:=Str+' and Paydat <= '+IntToStr(I);
     If Pos(' and',Str) = 1 Then Delete(Str,1,4);
     Result:=Str;
end;

Function TFReBill.GetPassDate(BNo,Keler:String;PBill:Currency):Integer;
begin
     Qu.SQL.Clear;
     Qu.SQL.Add('Select J.Dat From '+Keler+' J Where J.Serial=:b'+
     ' and J.Bedeh=:p');
     Qu.Params[0].Value:=BNo;
     Qu.Params[1].Value:=PBill;
     Qu.Open;
     Result:=Qu.Fields[0].AsInteger;
     Qu.Close;
end;

Procedure TFReBill.Make_Buy_Bill;
Var
I:Integer;
C_Kod:Real;
K_Kod,T_Kod:Real;
BNo:Integer;
St,Ctip:String;
Kol,Taf,Net,Rate:Currency;
BDat,BTip:Integer;
begin
     Frodm.Binvo.Open;
     Frodm.Binvo.Filter:=Make_Filt_String;
     Frodm.AutoBill.FindKey(['KJK']);
     K_Kod:=Frodm.AutoBillBehKod.Value;
     Frodm.AutoBill.FindKey(['KDF']);
     T_Kod:=Frodm.AutoBillBesKod.Value;
     BTip:=3;
     Frodm.Binvo.Filtered:=True;
     For I:=1 To Frodm.Binvo.RecordCount Do
     Begin
      C_Kod:=Acckod(Frodm.BinvoNam.AsString);
      If C_Kod = 0 Then C_Kod:=Def_BesKod;
      BNo:=Frodm.BinvoBno.AsInteger;
      BDat:=Frodm.BinvoDat.Value;
      Kol:=Frodm.BinvoPkol.Value;
      Taf:=Frodm.BinvoPdis.Value;
      Net:=Frodm.BinvoPnet.Value;
      Ctip:=Frodm.BinvoEco.AsString;
      Rate:=GetRateAtDate(Ctip,Frodm.BinvoDat.Value);
      DelBitem(Frodm.BinvoNo.AsString,BNo,BTip);
      St:='Ã„⁄ ﬂ· —”Ìœ «‰»«— ‘„«—Â'+Frodm.BinvoNo.AsString+' ›‹‹'+
      Frodm.BinvoTel.AsString+' '+Frodm.BinvoNam.AsString;
      Autobill(True,0,K_Kod,Kol*Rate,St,Frodm.BinvoNo.AsString,BNo,BTip,BDat,
      Frodm.BinvoCost.AsString,Frodm.BinvoCkod.AsInteger,Kol,Rate,Ctip);
      St:=' Œ›Ì› —”Ìœ «‰»«— ‘„«—Â'+Frodm.BinvoNo.AsString+' ›‹‹'+
      Frodm.BinvoTel.AsString+' '+Frodm.BinvoNam.AsString;
      Autobill(True,T_kod,0,Taf*Rate,St,Frodm.BinvoNo.AsString,BNo,BTip,BDat,
      Frodm.BinvoCost.AsString,Frodm.BinvoCkod.AsInteger,Taf,Rate,Ctip);
      St:='Œ«·’ —”Ìœ «‰»«— ‘„«—Â'+Frodm.BinvoNo.AsString+' ›‹‹'+
      Frodm.BinvoTel.AsString+' '+Frodm.BinvoNam.AsString;
      Autobill(True,C_Kod,0,Net*Rate,St,Frodm.BinvoNo.AsString,BNo,BTip,BDat,
      Frodm.BinvoCost.AsString,Frodm.BinvoCkod.AsInteger,Net,Rate,Ctip);
      Frodm.Binvo.Next;
     End;
     Frodm.Binvo.Filter:='';
     Frodm.Binvo.Filtered:=False;
     Frodm.Binvo.Close;
end;

Procedure TFReBill.Make_Sell_Bill;
Var
I:Integer;
C_Kod:Real;
K_Kod,T_Kod,Tax_Kod,Sandog:Real;
BNo:Integer;
St,Ctip:String;
Kol,Taf,Net,Pay,Rate,Tax:Currency;
BDat,BTip:Integer;
MultiCurr:Boolean;
begin
     Frodm.Invo.Open;
     Frodm.Invo.Filter:=Make_Filt_String;
     Frodm.AutoBill.FindKey(['CF']);
     Sandog:=Frodm.AutoBillBehKod.Value;
     Frodm.AutoBill.FindKey(['CF2']);
     Tax_Kod:=Frodm.AutoBillBehKod.Value;
     BTip:=1;
     Frodm.Invo.Filtered:=True;
     For I:=1 To Frodm.Invo.RecordCount Do
     Begin
      Frodm.AutoBill.FindKey(['JK']);
      K_Kod:=Frodm.AutoBillBesKod.Value;
      Frodm.AutoBill.FindKey(['DF']);
      T_Kod:=Frodm.AutoBillBehKod.Value;
      C_Kod:=Acckod(Frodm.InvoNam.AsString);
      If C_Kod = 0 Then C_Kod:=Def_BedKod;
      Update_FtipCode(Frodm.InvoPRule.Value);
      if FtipCode.Beskod > 0 Then K_Kod:=FtipCode.Beskod;
      if FtipCode.Behkod > 0 Then T_Kod:=FtipCode.Behkod;
      BNo:=Frodm.InvoBno.AsInteger;
      BDat:=Frodm.InvoDat.Value;
      Kol:=Frodm.InvoPkol.Value;
      Taf:=Frodm.InvoPdis.Value;
      Tax:=Frodm.InvoPtax.Value;
      Net:=Frodm.InvoPnet.Value;
      Pay:=Frodm.InvoPpay.Value;
      MultiCurr:=Frodm.InvoBkod.Value;
      If MultiCurr Then
      Begin
       Ctip:=DefaultCurr;
       Rate:=1;
      End Else Begin
       Rate:=Frodm.InvoPpay.Value;
       Ctip:=Frodm.InvoEco.AsString;
      End;
      DelBitem(Frodm.InvoNo.AsString,BNo,BTip);

      St:='œ—¬„œ ›—Ê‘ ›«ﬂ Ê—'+Frodm.InvoNo.AsString+' »‰«„ '+Frodm.InvoNam.AsString;
      Autobill(True,K_Kod,0,Kol*Rate,St,Frodm.InvoNo.AsString,BNo,BTip,BDat,
      Frodm.InvoCost.AsString,Frodm.InvoCkod.AsInteger,Kol,Rate,Ctip);

      St:=' Œ›Ì› ›«ò Ê— ‘„«—Â'+Frodm.InvoNo.AsString+' »‰«„  '+Frodm.InvoNam.AsString;
      Autobill(True,0,T_kod,Taf*Rate,St,Frodm.InvoNo.AsString,BNo,BTip,BDat,
      Frodm.InvoCost.AsString,Frodm.InvoCkod.AsInteger,Taf,Rate,Ctip);

      St:='⁄Ê«—÷ ›«ò Ê— ‘„«—Â'+Frodm.InvoNo.AsString+' »‰«„  '+Frodm.InvoNam.AsString;
      Autobill(True,Tax_kod,0,Tax*Rate,St,Frodm.InvoNo.AsString,BNo,BTip,BDat,
      Frodm.InvoCost.AsString,Frodm.InvoCkod.AsInteger,Tax,Rate,Ctip);

      St:='Œ«·’ ›«ò Ê—  ‘„«—Â'+Frodm.InvoNo.AsString;
      Autobill(True,0,C_Kod,Net*rate,St,Frodm.InvoNo.AsString,BNo,BTip,BDat,
      Frodm.InvoCost.AsString,Frodm.InvoCkod.AsInteger,Net,Rate,Ctip);
{      St:='œ—Ì«›  ‰ﬁœÌ ›«ﬂ Ê— '+Frodm.InvoNo.AsString;
      Autobill(True,C_Kod,Sandog,Pay*Rate,St,Frodm.InvoNo.AsString,BNo,BTip,BDat,
      Frodm.InvoCost.AsString,Frodm.InvoCkod.AsInteger,Pay,Rate,Ctip); }
      Frodm.Invo.Next;
     End;
     Frodm.Invo.Filter:='';
     Frodm.Invo.Filtered:=False;
     Frodm.Invo.Close;
end;

Function TFReBill.Get_Inv_Rej(FNo:Integer):Currency;
Var
RejQu:TQuery;
begin
 RejQu:=Tquery.Create(Application);;
 RejQu.DatabaseName:=CurrDb;
 RejQu.SQL.Add('Select Sum(R.Reject*R.Quant) From RejInvogood R Where R.No = :a');
 RejQu.Params[0].Value:=FNo;
 RejQu.Open;
 Result:=RejQu.Fields[0].AsCurrency;
 RejQu.Close;
 RejQu.Destroy;
end;

Procedure TFReBill.Make_RInv_Bill;
Var
I:Integer;
C_Kod:Real;
K_Kod:Real;
DBehKod:Real;
DBesKod:Real;
BNo:Integer;
St,Ctip:String;
Net,Rate,OutSum:Currency;
BDat,BTip:Integer;
begin
     Frodm.RejInvo.Open;
     Frodm.RejInvo.Filter:=Make_Filt_String;

     Frodm.AutoBill.FindKey(['GF']);
     DBehKod:=Frodm.AutoBillBehKod.Value;
     DBesKod:=Frodm.AutoBillBesKod.Value;

     Frodm.AutoBill.FindKey(['RJK']);
     K_Kod:=Frodm.AutoBillBehKod.Value;
     BTip:=2;
     Frodm.RejInvo.Filtered:=True;
     For I:=1 To Frodm.RejInvo.RecordCount Do
     Begin
      C_Kod:=Acckod(Frodm.RejInvoNam.AsString);
      If C_Kod = 0 Then C_Kod:=Def_BedKod;
      BNo:=Frodm.RejInvoBno.AsInteger;
      BDat:=Frodm.RejInvoDat.Value;
      Net:=Frodm.RejInvoPnet.Value;
      Ctip:=Frodm.RejInvoEco.AsString;
      Rate:=GetRateAtDate(Ctip,BDat);
      DelBitem(Frodm.RejInvoNo.AsString,BNo,BTip);
      St:='Œ«·’ ›«ﬂ Ê— „—ÃÊ⁄Ì ›—Ê‘ ‘„«—Â'+Frodm.RejInvoNo.AsString+' »‰«„ '+Frodm.RejInvoNam.AsString;
      Autobill(True,C_kod,K_kod,Net*Rate,St,Frodm.RejInvoNo.AsString,BNo,BTip,BDat,
      Frodm.RejInvoCost.AsString,Frodm.RejInvoCKod.AsInteger,Net,Rate,Ctip);
//-------------------------------
      OutSum:=Get_Inv_Rej(Frodm.RejInvoNo.AsInteger);
      St:='»—ê‘  «ﬁ·«„ ›«ﬂ Ê— „—ÃÊ⁄Ì ‘„«—Â'+' '+Frodm.RejInvoNo.AsString+' '+Frodm.RejInvoNam.AsString;
      AutoBill(True,DBehKod,DBesKod,OutSum,St,Frodm.RejInvoNo.AsString,BNo,BTip,BDat,
       Frodm.RejInvoCost.AsString,Frodm.RejInvoCKod.AsInteger,0,0,DefaultCurr);
//----------------------------------
      Frodm.RejInvo.Next;
     End;
     Frodm.RejInvo.Filter:='';
     Frodm.RejInvo.Filtered:=False;
     Frodm.RejInvo.Close;
end;

Function TFReBill.Get_Binv_Rej(FNo:Integer):Currency;
Var
RejQu:TQuery;
begin
 RejQu:=Tquery.Create(Application);;
 RejQu.DatabaseName:=CurrDb;
 RejQu.SQL.Add('Select Sum(OPsum) From RejBinvogood R Where R.No = :a');
 RejQu.Params[0].Value:=FNo;
 RejQu.Open;
 Result:=RejQu.Fields[0].AsCurrency;
 RejQu.Close;
 RejQu.Destroy;
end;

Procedure TFReBill.Make_RBInv_Bill;
Var
I:Integer;
C_Kod:Real;
K_Kod:Real;
DBehKod:Real;
DBesKod:Real;
BNo:Integer;
St,Ctip:String;
Net,Rate,OSum:Currency;
BDat,BTip:Integer;
begin
     Frodm.RejBinvo.Open;
     Frodm.RejBinvo.Filter:=Make_Filt_String;
     Frodm.AutoBill.FindKey(['RKJK']);
     K_Kod:=Frodm.AutoBillBesKod.Value;

     Frodm.AutoBill.FindKey(['GF']);
     DBehKod:=Frodm.AutoBillBehKod.Value;
     DBesKod:=Frodm.AutoBillBesKod.Value;

     BTip:=4;
     Frodm.RejBInvo.Filtered:=True;
     For I:=1 To Frodm.RejBInvo.RecordCount Do
     Begin
      C_Kod:=Acckod(Frodm.RejBInvoNam.AsString);
      If C_Kod = 0 Then C_Kod:=Def_BedKod;
      BNo:=Frodm.RejBInvoBno.AsInteger;
      BDat:=Frodm.RejBInvoDat.Value;
      Net:=Frodm.RejBInvoPnet.Value;
      Ctip:=Frodm.RejBInvoEco.AsString;
      Rate:=GetRateAtDate(CTip,BDat);
      DelBitem(Frodm.RejBInvoNo.AsString,BNo,BTip);

      St:='Œ«·’ ›«ﬂ Ê— „—ÃÊ⁄Ì Œ—Ìœ ‘„«—Â'+Frodm.RejBInvoNo.AsString+' »‰«„ '+Frodm.RejBInvoNam.AsString;
      Autobill(True,K_kod,C_kod,Net*Rate,St,Frodm.RejBinvoNo.AsString,BNo,BTip,BDat,
      Frodm.RejBinvoCost.AsString,Frodm.RejBinvoCKod.AsInteger,Net,Rate,Ctip);

      OSum:=Get_Binv_Rej(Frodm.RejBinvoNo.AsInteger);
      St:='ò”—«ﬁ·«„ ›«ﬂ Ê— „—ÃÊ⁄Ì Œ—Ìœ ‘„«—Â'+Frodm.RejBInvoNo.AsString+' »‰«„ '+Frodm.RejBInvoNam.AsString;
      AutoBill(True,DBesKod,DBehKod,OSum,St,Frodm.RejBinvoNo.AsString,BNo,BTip,BDat,
      Frodm.RejBinvoCost.AsString,Frodm.RejBinvoCKod.AsInteger,0,0,DefaultCurr);
//------------------
      Frodm.RejBInvo.Next;
     End;
     Frodm.RejBInvo.Filter:='';
     Frodm.RejBInvo.Filtered:=False;
     Frodm.RejBinvo.Close;
end;

Procedure TFReBill.Make_RMon_Bill;
Var
I:Integer;
C_Kod:Real;
K_Kod:Real;
BNo:Integer;
St:String;
Net,CNet:Currency;
BDat,BTip:Integer;
begin
     Frodm.RMon.Open;
     Frodm.RMon.Filter:=Make_Filt_String;
     Frodm.AutoBill.FindKey(['CF']);
     K_Kod:=Frodm.AutoBillBehKod.Value;
     BTip:=5;
     Frodm.RMon.Filtered:=True;
     Frodm.Cashier.Open;
     For I:=1 To Frodm.RMon.RecordCount Do
     Begin
      C_Kod:=Acckod(Frodm.RMonAccNam.AsString);
      If C_Kod = 0 Then C_Kod:=Def_BedKod;
      BNo:=Frodm.RMonBNo.Value;
      BDat:=Frodm.RMonDat.Value;
      DelBitem(Frodm.RMonNo.AsString,BNo,BTip);
//-----------------------------------
//»œÂò«—Ì ’‰œÊﬁ
      Net:=Frodm.RMonPrice.Value;
      CNet:=Frodm.RMonCPrice.Value+Frodm.RMonCwage.Value;
      K_Kod:=Frodm.RMonCakod.Value;
      St:='ﬁ»÷ œ—Ì«›  '+Frodm.RMonNo.AsString+' '+Frodm.RMonDes.AsString;
      AutoBill(True,0,K_Kod,Net,St,Frodm.RMonNo.AsString,BNo,BTip,BDat,
               Frodm.RMonCost.AsString,Frodm.RMonCKod.AsInteger,CNet,
               Frodm.RMonRate.AsCurrency,Frodm.RMonCtip.AsString);
//»” «‰ò«—Ì „‘ —Ì
      //Net:=Frodm.RMonPrice.Value;// Frodm.RMonCPrice.Value*Frodm.RMonRate.Value;
      AutoBill(True,C_Kod,0,Net,St,Frodm.RMonNo.AsString,BNo,BTip,BDat,
               Frodm.RMonCost.AsString,Frodm.RMonCKod.AsInteger,CNet,
               Frodm.RMonRate.AsCurrency,Frodm.RMonCtip.AsString);
//ò«—„“œ ÕÊ«·Â
      Frodm.Cashier.Locate('Ackod',Frodm.RMonCakod.Value,[loCaseInsensitive]);
      If Frodm.CashierCtip.Value = DefaultCurr Then
      Begin
       K_Kod:=Def_Car_Bes;
       C_Kod:=AccKod(Frodm.RMonAccNam.AsString);
      End Else
      Begin
       K_Kod:=Frodm.RMonCakod.Value;
       C_Kod:=Def_Car_Bes;
      End;

      Net:=Frodm.RMonCWage.Value*Frodm.RMonRate.Value;
      St:='ò«—„“œ ÕÊ«·Â «—“Ì ﬁ»÷ œ—Ì«›  ‘„«—Â'+ Frodm.RMonNo.AsString+' «“'+Frodm.RMonAccNam.AsString;
      AutoBill(True,K_Kod,C_Kod,Net,St,Frodm.RMonNo.AsString,BNo,BTip,BDat,
               Frodm.RMonCost.AsString,Frodm.RMonCkod.AsInteger,Frodm.RMonCWage.Value,
               Frodm.RMonRate.AsCurrency,Frodm.RMonCtip.AsString);
//ò”— Ê «÷«›Ì Ê«—Ì“Ì
      Net:=(Frodm.RMonCWage.Value+Frodm.RMonCprice.Value)*Frodm.RMonRate.Value-
      Frodm.RMonPrice.Value;
      If Net < 0.009*Frodm.RMonRate.Value Then Net:=0;//2017
      St:='ò”—Ê «÷«›Â Ê«—Ì“Ì ﬁ»÷ œ—Ì«›  ‘„«—Â'+ Frodm.RMonNo.AsString+' «“'+Frodm.RmonAccNam.AsString;
      AutoBill(True,0,Def_Car_Bes,Net,St, Frodm.RMonNo.AsString,BNo,BTip,BDat,
               Frodm.RMonCost.AsString,Frodm.RMonCkod.AsInteger,Net/Frodm.RMonRate.AsCurrency,
               Frodm.RMonRate.AsCurrency,DefaultCurr);
//-----------------------------------
      Frodm.RMon.Next;
     End;
     Frodm.RMon.Filter:='';
     Frodm.RMon.Filtered:=False;
     Frodm.RMon.Close;
     Frodm.Cashier.Close;
end;

Procedure TFReBill.Make_PMon_Bill;
Var
I:Integer;
C_Kod:Real;
K_Kod:Real;
BNo:Integer;
St:String;
Net,CNet:Currency;
BDat,BTip:Integer;
begin
     Frodm.PMon.Open;
     Frodm.PMon.Filter:=Make_Filt_String;
//     Frodm.AutoBill.FindKey(['CF']);
//     K_Kod:=Frodm.AutoBillBehKod.Value;
     BTip:=6;
     Frodm.PMon.Filtered:=True;
     Frodm.Cashier.Open;
     For I:=1 To Frodm.PMon.RecordCount Do
     Begin
      C_Kod:=Acckod(Frodm.PMonAccNam.AsString);
      If C_Kod = 0 Then C_Kod:=Def_BedKod;
      BNo:=Frodm.PMonBNo.Value;
      BDat:=Frodm.PMonDat.Value;
      Frodm.Cashier.Locate('Ackod',Frodm.PMonCakod.Value,[loCaseInsensitive]);
      DelBitem(Frodm.PMonNo.AsString,BNo,BTip);
//------------------------------
//»—œ«‘  «“ Õ”«»
     K_Kod:=Frodm.PMonCakod.Value;
     Net:=Frodm.PMonPrice.Value;
     CNet:=Frodm.PMonCprice.Value+Frodm.PMonCWage.Value;
     St:='ﬁ»÷ Å—œ«Œ  '+Frodm.PMonNo.AsString+' '+Frodm.PMonDes.asString;
     AutoBill(True,K_Kod,0,Net,St,Frodm.PMonNo.AsString,BNo,BTip,BDat,Frodm.PMonCost.AsString,
              Frodm.PMonCKod.AsInteger,CNet,Frodm.PMonRate.Value,Frodm.PMonCtip.AsString);
//»œÂò«—Ì „‘ —Ì
     //Net:=Frodm.PMonCPrice.Value*Frodm.PMonRate.Value;
     If Frodm.CashierCtip.Value <> DefaultCurr Then
     Begin
      Net :=Frodm.PMonPrice.Value-Frodm.PMonCwage.Value*Frodm.PMonRate.Value; //Frodm.PMonCPrice.Value*Frodm.PMonRate.Value;
      CNet:=Frodm.PMonCprice.Value;
     End Else
     Begin
      Net :=Frodm.PMonPrice.Value;
      CNet:=Frodm.PMonCprice.Value+Frodm.PMonCWage.Value;
     End;
     AutoBill(True,0,C_Kod,Net,St,Frodm.PMonNo.AsString,BNo,BTip,BDat,Frodm.PMonCost.AsString,
              Frodm.PMonCKod.AsInteger,CNet,Frodm.PMonRate.Value,Frodm.PMonCtip.AsString);

//ò«—„“œ ÕÊ«·Â
     If Frodm.CashierCtip.Value = DefaultCurr Then
      C_Kod:=C_Kod //AccKod(FAccNam.Text)
     Else
      C_Kod:=0;
     St:='ò«—„“œ «—”«· ÊÃÊÂ«  «—“Ì ﬁ»÷ Å—œ«Œ  ‘„«—Â '+Frodm.PMonNo.AsString;
     Net:=Frodm.PMonCwage.Value*Frodm.PMonRate.Value;
     AutoBill(True,C_Kod,Def_Car_Bes,Net,St,Frodm.PMonNo.AsString,BNo,BTip,BDat,
              Frodm.PMonCost.AsString,Frodm.PMonCKod.AsInteger,Frodm.PMonCWage.Value,
              Frodm.PMonRate.Value,Frodm.PMonCtip.AsString);
//ò”— Ê «÷«›Ì Ê«—Ì“Ì
      Net:=Frodm.PMonPrice.Value-(Frodm.PMonCWage.Value+Frodm.PMonCprice.Value)*Frodm.PMonRate.Value;
      If Net < 0.009*Frodm.PMonRate.Value Then Net:=0;//2017
      St:='ò”—Ê «÷«›Â Ê«—Ì“Ì ﬁ»÷ Å—œ«Œ  ‘„«—Â'+ Frodm.PMonNo.AsString+' «“'+Frodm.PMonAccNam.AsString;
      AutoBill(True,0,Def_Car_Bes,Net,St, Frodm.PMonNo.AsString,BNo,BTip,BDat,
               Frodm.PMonCost.AsString,Frodm.PMonCkod.AsInteger,Net/Frodm.PMonRate.AsCurrency,
               Frodm.PMonRate.AsCurrency,DefaultCurr);
//-------------------------------------
      Frodm.PMon.Next;
     End;
     Frodm.RMon.Filter:='';
     Frodm.RMon.Filtered:=False;
     Frodm.PMon.Close;
     Frodm.Cashier.Close;
end;

Procedure TFReBill.Make_NFish_Bill;
Var
I:Integer;
C_Kod:Real;
J_Kod:Real;
BNo:Integer;
St:String;
Net,CNet:Currency;
BDat,BTip:Integer;
bArzi:Boolean;
begin
     Frodm.NFish.Open;
     Frodm.NFish.Filter:=Make_Filt_String;
     BTip:=13;
     bArzi:=False;
     Frodm.NFish.Filtered:=True;
     For I:=1 To Frodm.NFish.RecordCount Do
     Begin
      C_Kod:=Acckod(Frodm.NFishAccNam.AsString);
      If C_Kod = 0 Then C_Kod:=Def_BedKod;
      If Frodm.JariNam.FindKey([Frodm.NFishJari.Value]) Then
      Begin
       J_Kod:=Frodm.JariNamAccKod.Value;
       bArzi:=Not(DefaultCurr = Frodm.JariNamBkod.Value);
      End;
      BNo:=Frodm.NFishBNo.Value;
      BDat:=Frodm.NFishDat.Value;
      DelBitem(Frodm.NFishNo.AsString,BNo,BTip);
//------»œÂò«—Ì »«‰ò ---------
      Net:=Frodm.NFishPrice.Value;
      CNet:=Frodm.NFishCprice.Value+Frodm.NFishCWage.Value;

      St:='Ê«—Ì“ ‰ﬁœÌ »Â Ã«—Ì'+'  '+Frodm.NFishJari.AsString+'--‘„«—Â'+ Frodm.NFishNo.AsString
      +' «“ Õ”«» '+ Frodm.NFishAccNam.AsString+'-'+Frodm.NFishDes.AsString;
      Autobill(True,0,J_kod,Net,St,Frodm.NFishNo.AsString,BNo,BTip,BDat,
      Frodm.NFishCost.AsString,Frodm.NFishCkod.AsInteger,CNet,Frodm.NFishRate.Value,Frodm.NFishCtip.Value);
//»” «‰ò«—Ì „‘ —Ì
      //Net:=Frodm.NFishPrice.Value;// Frodm.NFishCprice.Value*Frodm.NFishRate.Value;
//      St:='Ê«—Ì“ ‰ﬁœÌ »Â Ã«—Ì'+'  '+Frodm.NFishJari.AsString+'--‘„«—Â'+ Frodm.NFishNo.AsString
//      +' »—«»— '+Frodm.NFishCprice.AsString+Frodm.NFishCtip.AsString+'-'+Frodm.NFishDes.AsString;

      Autobill(True,C_Kod,0,Net,St,Frodm.NFishNo.AsString,BNo,BTip,BDat,
      Frodm.NFishCost.AsString,Frodm.NFishCkod.AsInteger,CNet, Frodm.NFishRate.Value,Frodm.NFishCtip.Value);

//ò«—„“œ ÕÊ«·Â
      If bArzi Then
      Begin
       //J_Kod:=J_Kod;//Frodm.JariNamAccKod.Value;
       C_Kod:=Def_Car_Bes;
      End Else
      Begin
       J_Kod:=Def_Car_Bes;
       //C_Kod:=C_Kod;//Acckod(Frodm.NFishAccNam.AsString);//AccKod(FAccNam.Text);      Def_Car_Bes
      End;

      Net:=Frodm.NFishCWage.Value*Frodm.NFishRate.Value;
      St:='ò«—„“œ ÕÊ«·Â «—“Ì ﬁ»÷ ‘„«—Â'+ Frodm.NFishNo.AsString+' «“'+Frodm.NFishAccNam.AsString;
      Autobill(True,J_Kod,C_Kod,Net,St,Frodm.NFishNo.AsString,BNo,BTip,BDat,
      Frodm.NFishCost.AsString,Frodm.NFishCkod.AsInteger,Frodm.NFishCWage.Value,
      Frodm.NFishRate.Value,Frodm.NFishCtip.Value);
//ò”— Ê «÷«›Ì Ê«—Ì“Ì
      Net:=(Frodm.NFishCWage.Value+Frodm.NFishCprice.Value)*Frodm.NFishRate.Value-
      Frodm.NFishPrice.Value;
      If Net < 0.009*Frodm.NFishRate.Value Then Net:=0; //2017
      St:='ò”—Ê «÷«›Â Ê«—Ì“Ì —Ì«·Ì ÕÊ«·Â «—“Ì Ê«—Ì“ »«‰òÌ ‘„«—Â'+ Frodm.NFishNo.AsString+' «“'+Frodm.NFishAccNam.AsString;
      AutoBill(True,0,Def_Car_Bes,Net,St,Frodm.NFishNo.AsString,BNo,BTip,BDat,
               Frodm.NFishCost.AsString,Frodm.NFishCkod.AsInteger,Net/Frodm.NFishRate.Value,
               Frodm.NFishRate.Value,DefaultCurr);


      Frodm.NFish.Next;
     End;
     Frodm.NFish.Filter:='';
     Frodm.NFish.Filtered:=False;
     Frodm.NFish.Close;
end;

Procedure TFReBill.Make_BHav_Bill;
Var
I:Integer;
C_Kod:Real;
J_Kod:Real;
BNo:Integer;
St:String;
Net,CNet:Currency;
BDat,BTip:Integer;
bArzi:Boolean;
begin
     Frodm.BHav.Open;
     Frodm.BHav.Filter:=Make_Filt_String;
     BTip:=12;
     Frodm.BHav.Filtered:=True;
     For I:=1 To Frodm.BHav.RecordCount Do
     Begin
      C_Kod:=Acckod(Frodm.BHavAccNam.AsString);
      If C_Kod = 0 Then C_Kod:=Def_BedKod;
      If Frodm.JariNam.FindKey([Frodm.BHavJari.Value]) Then
      Begin
       J_Kod:=Frodm.JariNamAccKod.Value;
       bArzi:=Not(DefaultCurr = Frodm.JariNamBkod.Value);
      End;

      BNo:=Frodm.BHavBNo.Value;
      BDat:=Frodm.BHavDat.Value;
      DelBitem(Frodm.BHavNo.AsString,BNo,BTip);

//-------»—œ«‘ -------

      St:='»—œ«‘  «“ Ã«—Ì'+'  '+Frodm.BHavJari.AsString+'--‘„«—Â'+ Frodm.BHavNo.AsString
      +' '+' »Õ”«» '+Frodm.BHavAccNam.AsString;
      Net:=Frodm.BHavPrice.Value;
      CNet:=Frodm.BHavCprice.Value+Frodm.BHavCwage.Value;

      Autobill(True,J_kod,0,Net,St,Frodm.BHavNo.AsString,BNo,BTip,BDat,Frodm.BHavCost.AsString,
               Frodm.BHavCkod.AsInteger,CNet,Frodm.BHavRate.Value,Frodm.BHavCtip.Value);
//»œÂò«—Ì „‘ —Ì
//      Net:=Frodm.BhavCprice.Value*Frodm.BHavRate.Value;
      If bArzi Then
      Begin
       Net:=Frodm.BHavPrice.Value-Frodm.BHavCwage.Value*Frodm.BHavRate.Value;
       CNet:=Frodm.BHavCprice.Value;
      End Else
      Begin
       Net:=Frodm.BHavPrice.Value;
       CNet:=Frodm.BHavCprice.Value+Frodm.BHavCWage.Value;
     End;
      St:='œ—Ì«›  «“ Ã«—Ì'+' '+Frodm.BHavJari.AsString+'-‘'+Frodm.BHavNo.AsString+'-„⁄«œ· '+Frodm.BhavCPrice.AsString+' '+
      Frodm.BHavCtip.AsString+'-'+Frodm.BHavDes.AsString;
      Autobill(True,0,C_Kod,Net,St,Frodm.BHavNo.AsString,BNo,BTip,BDat,Frodm.BHavCost.AsString,
               Frodm.BHavCkod.AsInteger,Frodm.BHavCprice.Value,Frodm.BHavRate.Value,
               Frodm.BHavCtip.Value);

//ò«—„“œ ÕÊ«·Â
      If bArzi Then
       C_Kod:=0
      Else
       C_Kod:=C_Kod;//AccKod(Frodm.BHavAccNam.AsString);

      Net:=Frodm.BHavCWage.Value*Frodm.BHavRate.Value;
      St:='ò«—„“œ Œ—Ìœ ÕÊ«·Â «—“Ì ﬁ»÷ »—œ«‘  »«‰òÌ »‘„«—Â'+ Frodm.BHavNo.AsString+' «“'+Frodm.BHavAccNam.AsString;
      Autobill(True,C_Kod,Def_Car_Bes,Net,St,Frodm.BHavNo.AsString,BNo,BTip,BDat,
               Frodm.BHavCost.AsString,Frodm.BHavCkod.AsInteger,Frodm.BHavCwage.Value,
               Frodm.BHavRate.Value,Frodm.BHavCtip.Value);

//ò”— Ê «÷«›Ì Ê«—Ì“Ì
      Net:=(Frodm.BHavCWage.Value+Frodm.BHavCprice.Value)*Frodm.BHavRate.Value-Frodm.BHavPrice.Value;
      If Net < 0.009*Frodm.BHavRate.Value Then Net:=0; //2017
      St:='ò”—Ê «÷«›Â Ê«—Ì“Ì »—œ«‘  »«‰òÌ ‘„«—Â'+ Frodm.BHavNo.AsString+' «“'+Frodm.BHavAccNam.AsString;
      AutoBill(True,Def_Car_Bes,0,Net,St,Frodm.BHavNo.AsString,BNo,BTip,BDat,
               Frodm.BHavCost.AsString,Frodm.BHavCkod.AsInteger,Net/Frodm.BHavRate.Value,
               Frodm.BHavRate.Value,DefaultCurr);
//------»—œ«‘ --------
      Frodm.BHav.Next;
     End;
     Frodm.BHav.Filter:='';
     Frodm.BHav.Filtered:=False;
     Frodm.BHav.Close;
end;

Procedure TFReBill.Make_DCheq_Bill;
Var
I,J:Integer;
BehKod,BesKod:Real;
BNo,NBNo:Integer;
St,Flt:String;
Net:Currency;
BDat,BTip:Integer;
begin
     Flt:=Make_Filt_String;
     Frodm.RRes.Open;
     Frodm.Rcheq.Open;
     Frodm.RRes.Filter:=Flt;
     BTip:=7;
     BehKod:=Def_Cheq;
     Frodm.RRes.Filtered:=True;
     Frodm.RCheq.Filtered:=True;
     If Flt = '' Then DelAllBItem(BTip);
     For I:=1 To Frodm.RRes.RecordCount Do
     Begin
      BesKod:=Frodm.RResAccKod.Value;
      If BesKod = 0 Then BesKod:=Def_BesKod;
      BDat:=Frodm.RResDat.Value;
      BNo:=Frodm.RResBno.Value;
      If Flt <> '' Then DelBitem(Frodm.RResNo.AsString,BNo,BTip);

      St:='Ã„⁄ ò· —”Ìœ «”‰«œ œ—Ì«› ‰Ì ‘„«—Â'+' '+Frodm.RResNo.AsString;
      Net:=Frodm.RResPsum.Value;
      NBNo:=AutoBill(True,0,BehKod,Net,St,Frodm.RResNo.AsString,BNo,BTip,BDat,
      Frodm.RResCost.AsString,Frodm.RResCkod.AsInteger,Net,1,DefaultCurr);

      Frodm.Rcheq.First;
      For J:=1 To Frodm.Rcheq.RecordCount Do
      Begin
       St:='œ—Ì«›  çò ‘„«—Â'+' '+Frodm.RcheqBno.AsString+' ÿÌ —”Ìœ ‘„«—Â '+Frodm.RResNo.AsString;
       Net:=Frodm.RcheqPbill.Value;
       NBNo:=AutoBill(True,BesKod,0,Net,St,Frodm.RResNo.AsString,BNo,BTip,BDat,
       Frodm.RResCost.AsString,Frodm.RResCkod.AsInteger,Net,1,DefaultCurr);
       Frodm.Rcheq.Next;
      End;

      If NBNo = BNo Then BillUpdate(BNo) Else
       If sBill Then MakeBill('”‰œ —”Ìœ œ—Ì«›  çò ‘„«—Â'+Frodm.RResNo.AsString);

      Frodm.RRes.Next;
     End;
     Frodm.RRes.Filter:='';
     Frodm.RRes.Filtered:=False;
     Frodm.RRes.Close;
     Frodm.Rcheq.Filtered:=False;
     Frodm.Rcheq.Close;
end;

Procedure TFReBill.Make_CheqOut_Bill;
Var
I,J:Integer;
BehKod,BesKod:Real;
BNo,NBNo:Integer;
St,Flt:String;
Net:Currency;
BDat,BTip:Integer;
begin
     Flt:=Make_Filt_String;
     Frodm.RPay.Open;
     Frodm.RPI.Open;
     Frodm.RPay.Filter:=Flt;
     BTip:=8;
     Frodm.RPay.Filtered:=True;
     Frodm.RPI.Filtered:=True;
     BesKod:=Def_Vosol;
     If Flt = '' Then DelAllBItem(BTip);
     Frodm.RPay.First;
     For I:=1 To Frodm.RPay.RecordCount Do
     Begin
      BehKod:=Frodm.RPayAccKod.Value;
      BNo:=Frodm.RPayBNo.Value;
      BDat:=Frodm.RPayDat.Value;
      If Flt <> '' Then DelBitem(Frodm.RPayNo.AsString,BNo,BTip);
      If BehKod = 0 Then BehKod:=Def_BesKod;
      For J:=1 To Frodm.RPI.RecordCount Do
      Begin
       St:='Ê«ê–«—Ì  çò ‘„«—Â'+' '+Frodm.RPIBno.AsString+' ÿÌ —”Ìœ ‘„«—Â '+Frodm.RPayNo.AsString;
       Net:=Frodm.RPIPbill.Value;
       AutoBill(True,0,BehKod,Net,St,Frodm.RPayNo.AsString,BNo,BTip,BDat,
       Frodm.RPayCost.AsString,Frodm.RPayCkod.AsInteger,Net,1,DefaultCurr);
       Frodm.RPI.Next;
      End;

      St:='Ã„⁄ ò· —”Ìœ Ê«ê–«—Ì «”‰«œ œ—Ì«› ‰Ì ‘„«—Â'+' '+Frodm.RPayNo.AsString;
      Net:=Frodm.RPayPsum.Value;
      BDat:=Frodm.RPayDat.Value;
      NBNo:=AutoBill(True,BesKod,0,Net,St,Frodm.RPayNo.AsString,BNo,BTip,BDat,
      Frodm.RPayCost.AsString,Frodm.RPayCkod.AsInteger,Net,1,DefaultCurr);

      If NBNo = BNo Then BillUpdate(BNo) Else
       If sBill Then MakeBill('”‰œ —”Ìœ Ê«ê–«—Ì «”‰«œ ‘„«—Â'+Frodm.RPayNo.AsString);
      Frodm.RPay.Next;
     End;
     Frodm.RPay.Filter:='';
     Frodm.RPay.Filtered:=False;
     Frodm.RPI.Filtered:=False;
     Frodm.RPay.Close;
     Frodm.RPI.Close;
end;

Procedure TFReBill.Make_Keler_Bill;
Var
I,J:Integer;
BehKod,BesKod:Real;
BNo,NBNo:Integer;
St,Flt:String;
Net:Currency;
BDat,BTip:Integer;
begin
     Flt:=Make_Filt_String;
     BTip:=17;
     BesKod:=Def_Vosol;
     BehKod:=Def_Keler;
     Frodm.Rkel.Open;
     Frodm.RKI.Open;
     Frodm.Rkel.Filter:=Flt;
     Frodm.Rkel.Filtered:=True;
     Frodm.RKI.Filtered:=True;
     If Flt = '' Then DelAllBItem(BTip);

     Frodm.Rkel.First;
     For I:=1 To Frodm.RKel.RecordCount Do
     Begin
      BNo:=Frodm.RKelBNo.Value;
      BDat:=Frodm.RKelDat.Value;
      If Flt <> '' Then DelBitem(Frodm.RKelNo.AsString,BNo,BTip);

      Frodm.RKI.First;
      For J:=1 To Frodm.RKI.RecordCount Do
      Begin
       St:='ò·—Ì‰ê çò ‘„«—Â'+' '+Frodm.RKIBno.AsString+' ÿÌ —”Ìœ ‘„«—Â '+Frodm.RKelNo.AsString;
       Net:=Frodm.RKIPbill.Value;
       BDat:=Frodm.RKelDat.Value;
       AutoBill(True,0,BehKod,Net,St,Frodm.RKelNo.AsString,BNo,BTip,BDat,
       Frodm.RkelCost.AsString,Frodm.RKelCKod.AsInteger,Net,1,DefaultCurr);
       Frodm.RKI.Next;
      End;

      St:='Ã„⁄ ò· —”Ìœ «”‰«œ œ— Ã—Ì«‰ Ê’Ê· ‘„«—Â'+' '+Frodm.RKelNo.AsString;
      Net:=Frodm.RKelPsum.Value;
      NBNo:=AutoBill(True,BesKod,0,Net,St,Frodm.RKelNo.AsString,BNo,BTip,BDat,
      Frodm.RkelCost.AsString,Frodm.RKelCKod.AsInteger,Net,1,DefaultCurr);

      If NBNo = BNo Then BillUpdate(BNo) Else
       If sBill Then MakeBill('”‰œ —”Ìœ«”‰«œ œ— Ã—Ì«‰ Ê’Ê· ‘„«—Â'+Frodm.RKelNo.AsString);

      Frodm.Rkel.Next;
     End;
     Frodm.RKel.Filter:='';
     Frodm.RKel.Filtered:=False;
     Frodm.RKI.Filtered:=False;
     Frodm.Rkel.Close;
     Frodm.RKI.Close;
end;

Procedure TFReBill.Make_UnKeler_Bill;
Var
I,J:Integer;
BehKod,BesKod:Real;
BNo,NBNo:Integer;
St,Flt:String;
Net:Currency;
BDat,BTip:Integer;
begin
     Flt:=Make_Filt_String;
     BTip:=19;
     BehKod:=Def_Vosol;
     BesKod:=Def_Keler;
     Frodm.Rukel.Open;
     Frodm.RUKI.Open;
     Frodm.Rukel.Filter:=Flt;
     Frodm.Rukel.Filtered:=True;
     Frodm.RUKI.Filtered:=True;
     If Flt = '' Then DelAllBItem(BTip);

     Frodm.Rukel.First;
     For I:=1 To Frodm.Rukel.RecordCount Do
     Begin
      BNo:=Frodm.RukelBNo.Value;
      BDat:=Frodm.RukelDat.Value;
      If Flt <> '' Then DelBitem(Frodm.RukelNo.AsString,BNo,BTip);

      St:='Ã„⁄ ò· —”Ìœ ⁄Êœ  «“ ò·— ‘„«—Â'+' '+Frodm.RUKelNo.AsString;
      Net:=Frodm.RukelPsum.Value;
      NBNo:=AutoBill(True,0,BehKod,Net,St,Frodm.RukelNo.AsString,BNo,BTip,BDat,
      Frodm.RUkelCost.AsString,Frodm.RUKelCKod.AsInteger,Net,1,DefaultCurr);

      Frodm.RUKI.First;
      For J:=1 To Frodm.RUKI.RecordCount Do
      Begin
       St:='⁄Êœ  «“ ò·— çò ‘„«—Â'+' '+Frodm.RUKIBno.AsString+' ÿÌ —”Ìœ ‘„«—Â '+Frodm.RukelNo.AsString;
       Net:=Frodm.RUKIPbill.Value;
       AutoBill(True,BesKod,0,Net,St,Frodm.RukelNo.AsString,BNo,BTip,BDat,
       Frodm.RUkelCost.AsString,Frodm.RUKelCKod.AsInteger,Net,1,DefaultCurr);
       Frodm.RUKI.Next;
      End;

      If NBNo = BNo Then BillUpdate(BNo) Else
       If sBill Then MakeBill('”‰œ —”Ìœ«”‰«œ œ— Ã—Ì«‰ Ê’Ê· ‘„«—Â'+Frodm.RukelNo.AsString);
      Frodm.Rukel.Next;
     End;
     Frodm.Rukel.Filter:='';
     Frodm.Rukel.Filtered:=False;
     Frodm.RUKI.Filtered:=False;
     Frodm.Rukel.Close;
     Frodm.RUKI.Close;
end;

Procedure TFReBill.Make_Vosol_Bill;
Var
I,J:Integer;
BesKod,BehKod:Real;
BNo,NBNo:Integer;
St,Flt:String;
Net:Currency;
BDat,BTip:Integer;
begin
     Flt:=Make_Filt_String;
     Frodm.RVos.Filter:=Flt;
     BTip:=15;
     Frodm.AutoBill.FindKey(['VCD']);
     Beskod:=Frodm.AutoBillBesKod.Value;
     Frodm.RVos.Open;
     Frodm.RVI.Open;
     Frodm.RVos.Filtered:=True;
     Frodm.RVI.Filtered:=True;
     If Flt = '' Then DelAllBItem(BTip);
     For I:=1 To Frodm.RVos.RecordCount Do
     Begin
      If Frodm.JariNam.FindKey([Frodm.RvosAcnam.Value]) Then BehKod:=Frodm.JariNamAccKod.Value;
      BNo:=Frodm.RVosBNo.Value;
      BDat:=Frodm.RVosDat.Value;
      If Flt <> '' Then DelBitem(Frodm.RVosNo.AsString,BNo,BTip);

      Frodm.RVI.First;
      For J:=1 To Frodm.RVI.RecordCount Do
      Begin
       St:='Ê’Ê· çò ‘„«—Â'+' '+Frodm.RVIBno.AsString+' ÿÌ —”Ìœ ‘„«—Â '+Frodm.RVosNo.AsString;
       Net:=Frodm.RVIPbill.Value;
       AutoBill(True,0,BehKod,Net,St,Frodm.RVosNo.AsString,BNo,BTip,BDat,
       Frodm.RVosCost.AsString,Frodm.RVosCKod.AsInteger,Net,1,DefaultCurr);
       Frodm.RVI.Next;
      End;

      St:='Ã„⁄ ò· —”Ìœ Ê’Ê· «”‰«œ ‘„«—Â'+' '+Frodm.RVosNo.AsString;
      Net:=Frodm.RVosPsum.Value;
      BDat:=Frodm.RVosDat.Value;
      NBNo:=AutoBill(True,BesKod,0,Net,St,Frodm.RVosNo.AsString,BNo,BTip,BDat,
      Frodm.RVosCost.AsString,Frodm.RVosCKod.AsInteger,Net,1,DefaultCurr);

      If NBNo = BNo Then BillUpdate(BNo) Else
       If sBill Then MakeBill('”‰œ —”Ìœ Ê’Ê· «”‰«œ ‘„«—Â'+Frodm.RVosNo.AsString);

      Frodm.Rvos.Next;
     End;
     Frodm.RVos.Filter:='';
     Frodm.RVos.Filtered:=False;
     Frodm.RVI.Filtered:=False;
     Frodm.RVos.Close;
     Frodm.RVI.Close;
end;

Procedure TFReBill.Make_Reject_Bill;
Var
I,J:Integer;
BesKod,BehKod:Real;
BNo,NBNo:Integer;
St,Flt:String;
Net:Currency;
BDat,BTip:Integer;
begin
{ TODO :  ’ÕÌÕ —Ê Ì‰ Ê «ﬁ“Êœ‰ —Ê Ì‰ »—ê‘  «“ ò·— }
     Flt:=Make_Filt_String;
     Frodm.Rrej.Open;
     Frodm.RRI.Open;
     Frodm.RRej.Filter:=Flt;
     BTip:=18;
     BesKod:=Def_Reject_Bes;
     BehKod:=Def_Reject;
     If Flt = '' Then DelAllBItem(BTip);

     Frodm.RRej.Filtered:=True;
     Frodm.RRI.Filtered:=True;

     For I:=1 To Frodm.RRej.RecordCount Do
     Begin
      BNo:=Frodm.RrejBno.Value;
      BDat:=Frodm.RrejDat.Value;
      If Flt <> '' Then DelBitem(Frodm.RrejNo.AsString,BNo,BTip);

      Frodm.RRI.First;
      For J:=1 To Frodm.RRI.RecordCount Do
      Begin
       St:='»—ê‘  çò ‘„«—Â'+' '+Frodm.RRIBno.AsString+' ÿÌ —”Ìœ ‘„«—Â '+Frodm.RRejNo.AsString;
       Net:=Frodm.RRIPbill.Value;
       Case sRej Of
       True : BehKod:=Frodm.RRIAckod.Value;
       False: BehKod:=Def_Reject;
       End;
       NBNo:=AutoBill(True,BesKod,BehKod,Net,St,Frodm.RRejNo.AsString,BNo,BTip,BDat,
       Frodm.RRejCost.AsString,Frodm.RRejCKod.AsInteger,Net,1,DefaultCurr);
       Frodm.RRI.Next;
      End;
      If NBNo = BNo Then BillUpdate(BNo) Else
       If sBill Then MakeBill('”‰œ —”Ìœ »—ê‘  çò ‘„«—Â'+Frodm.RRejNo.AsString);
      Frodm.Rrej.Next;
     End;
     Frodm.Rrej.Filter:='';
     Frodm.Rrej.Filtered:=False;
     Frodm.RRI.Filtered:=False;
     Frodm.Rrej.Close;
     Frodm.RRI.Close;
end;

Procedure TFReBill.Make_PCheq_Bill;
Var
I:Integer;
Bes_Kod,Beh_Kod:Real;
BNo:Integer;
St,Flt:String;
Net:Currency;
BDat,BTip:Integer;
begin
     Flt:=Pay_Cheq_Filt;
     If Flt > '' Then
      Flt:=Flt+' and Pbill>0 '
     Else
      Flt:=' Pbill>0';
     Frodm.Pcheq.Open;
     Frodm.PCheq.Filter:=Flt;
     BTip:=9;
     Frodm.PCheq.Filtered:=True;
     If Pay_Cheq_Filt = '' Then DelAllBItem(BTip);
     For I:=1 To Frodm.PCheq.RecordCount Do
     Begin
      BNo:=Frodm.PcheqPBNo.Value;
      BDat:=Frodm.PcheqPaydat.Value;
      Net:=Frodm.PCheqPBill.Value;
      Bes_Kod:=Frodm.PcheqPkod.Value;
      Beh_Kod:=Frodm.PcheqAcckod.Value;
      If Pay_Cheq_Filt <> '' Then DelBitem(Frodm.PCheqBNo.AsString,BNo,BTip);
      St:='’œÊ—çﬂ ‘„«—Â'+'  '+Frodm.PCheqBNo.AsString+' '+Frodm.PCheqDesc.AsString;
      Autobill(True,Bes_Kod,Beh_Kod,Net,St,Frodm.PCheqBNo.AsString,BNo,BTip,BDat,
      Frodm.PcheqCost.AsString,Frodm.PcheqCkod.AsInteger,Net,1,DefaultCurr);
      Frodm.PCheq.Next;
     End;
     Frodm.PCheq.Filter:='';
     Frodm.PCheq.Filtered:=False;
     Frodm.Pcheq.Close;
end;

Procedure TFReBill.Make_Pass_Bill;
Var
I:Integer;
Bes_Kod,Beh_Kod:Real;
BNo:Integer;
St,Flt,Cost:String;
Net:Currency;
BDat,BTip,CKod:Integer;
begin
     Flt:=Pay_Cheq_Filt;
     If Flt > '' Then
      Flt:=Flt+' and Pbill>0 and Paykod=True'
     Else
      Flt:=' Pbill>0 and Paykod=True';
     Frodm.Pcheq.Open;
     Frodm.PCheq.Filter:=Flt;
     BTip:=14;
     Frodm.PCheq.Filtered:=True;
     If Pay_Cheq_Filt = '' Then DelAllBItem(BTip);
     For I:=1 To Frodm.PCheq.RecordCount Do
     Begin
      BNo:=Frodm.PcheqPaNo.Value;
      Net:=Frodm.PCheqPBill.Value;
      Cost:=Frodm.PcheqCost.AsString;
      CKod:=Frodm.PcheqCkod.AsInteger;
      BDat:=GetPassDate(Frodm.PcheqBNo.AsString,Frodm.PcheqJari.AsString,Net);
      If Frodm.JariNam.FindKey([Frodm.PCheqJari.Value]) Then
      Bes_Kod:=Frodm.JariNamAccKod.Value;
      Beh_Kod:=Frodm.PcheqPkod.Value;
      If Pay_Cheq_Filt <> '' Then DelBitem(Frodm.PCheqBNo.AsString,BNo,BTip);
      St:='Å«” çﬂ ‘„«—Â'+'  '+Frodm.PCheqBNo.AsString+' «“ Ã«—Ì'+Frodm.PCheqJari.AsString;
      Autobill(True,Bes_Kod,Beh_Kod,Net,St,Frodm.PCheqBNo.AsString,BNo,BTip,BDat,
      Cost,CKod,Net,1,DefaultCurr);
      Frodm.PCheq.Next;
     End;
     Frodm.PCheq.Filter:='';
     Frodm.PCheq.Filtered:=False;
     Frodm.Pcheq.Close;
end;

Procedure TFReBill.Make_CarMoz_Bill;
Var
I:Integer;
BehKod:Real;
BesKod:Real;
BNo:Integer;
St:String;
Net:Currency;
BDat,BTip:Integer;
begin
     Frodm.NCar.Filter:=Make_Filt_String;
     Frodm.AutoBill.FindKey(['CARMOZ']);
     Behkod:=Frodm.AutoBillBehKod.Value;
     BTip:=11;
     Frodm.NCar.Open;
     Frodm.NCar.Filtered:=True;
     For I:=1 To Frodm.NCar.RecordCount Do
     Begin                                
      If Frodm.JariNam.FindKey([Frodm.NcarJari.Value]) Then BesKod:=Frodm.JariNamAccKod.Value;
      If BesKod = 0 Then BesKod:=Def_BesKod;
      BNo:=Frodm.NCarBNo.Value;
      BDat:=Frodm.NCarDat.Value;
      Net:=Frodm.NCarPrice.Value;
      DelBitem(Frodm.NCarNo.AsString,BNo,BTip);
      St:='ﬂ«—„“œ »«‰ﬂÌ «“ Ã«—Ì'+'  '+Frodm.NCarJari.AsString+'--‘„«—Â'+ Frodm.NCarNo.AsString;
      Autobill(True,Beskod,Behkod,Net,St,Frodm.NCarNo.AsString,BNo,BTip,BDat,
      Frodm.NCarCost.AsString,Frodm.NCarCKod.AsInteger,Frodm.NCarCprice.Value,
      Frodm.NCarRate.Value,Frodm.NCarCtip.Value);
      Frodm.NCar.Next;
     End;
     Frodm.NCar.Filter:='';
     Frodm.NCar.Filtered:=False;
     Frodm.NCar.Close;
end;

Procedure TFReBill.Make_Remmitance_Bill;
Var
I:Integer;
J:Integer;
BNo:Integer;
BesKod:Real;
BehKod:Real;
Net,Rate:Currency;
CPrice:Currency;
BTip,NBNo,BDat:Integer;
St,Ctip,Flt:String;
begin
     Frodm.RMout.Open;
     Frodm.RMin.Open;
     FRodm.RM.Open;
     Frodm.RMout.Filtered:=True;
     Frodm.RMin.Filtered:=True;
     Flt:=Make_Filt_String;
     Frodm.RM.Filter:=Flt;
     Frodm.RM.Filtered:=True;
     BTip:=20;
     If Flt = '' Then DelAllBItem(BTip);
     Frodm.RM.First;
     For I:=1 To Frodm.RM.RecordCount Do
     Begin
      St:='T/T from Iran by Remmitance No.'+' '+Frodm.RMNo.AsString;
      BehKod:=Frodm.RMAcckod.Value;
      BDat:=Frodm.RMDat.Value;
      BNo:=Frodm.RMBno.AsInteger;
      If Flt <> '' Then DelBitem(Frodm.RMNo.AsString,BNo,BTip);

      Frodm.RMOut.First;
      For J:=1 To Frodm.RMOut.RecordCount Do
      Begin
       Net:=Frodm.RMOutPrice.Value;
       CPrice:=Frodm.RMOutAmount.Value;
       Rate:=Frodm.RMOutRate.Value;
       BesKod:=Frodm.RMOutAcckod.Value;
       Ctip:=CurrName(Frodm.RMOutCtip.Value);
       NBNo:=AutoBill(True,BesKod,Behkod,Net,St,Frodm.RMNo.AsString,BNo,BTip,BDat,'',
       Frodm.RMOutCkod.AsInteger,Cprice,Rate,Ctip);
       Frodm.RMOut.Next;
      End;

      BesKod:=Frodm.RMAcckod.Value;
      Frodm.RMIn.First;
      For J:=1 To Frodm.RMin.RecordCount Do
      Begin
       Net:=Frodm.RMinPrice.Value;
       CPrice:=Frodm.RMInAmount.Value;
       Rate:=Frodm.RMinRate.Value;
       BehKod:=Frodm.RMinAcckod.Value;
       Ctip:=CurrName(Frodm.RMinCtip.Value);
       NBNo:=AutoBill(True,BesKod,Behkod,Net,St,Frodm.RMNo.AsString,BNo,BTip,BDat,'',
       Frodm.RMinCkod.AsInteger,Cprice,Rate,Ctip);
       Frodm.RMin.Next;
      End;

      Frodm.RM.Next;
     End;

     Frodm.RM.Filter:='';
     Frodm.RM.Filtered:=False;
     Frodm.RMout.Filtered:=False;
     Frodm.RMin.Filtered:=False;
     Frodm.RMout.Close;
     Frodm.RMin.Close;
     FRodm.RM.Close;
end;

Procedure TFReBill.Make_Exchange_Bill;
Var
I:Integer;
BNo:Integer;
BehKod:Real;
Net,Rate:Currency;
BTip,BDat:Integer;
St,Flt:String;
begin
     Flt:=Make_Filt_String;
     Frodm.Exch.Filter:=Flt;
     Frodm.Exch.open;
     Frodm.Exch.Filtered:=True;
     BTip:=21;
     If Flt = '' Then DelAllBItem(BTip);
     Frodm.Exch.First;
     For I:=1 To Frodm.Exch.RecordCount Do
     Begin
      BDat:=Frodm.ExchDat.Value;
      BNo:=Frodm.ExchBNo.Value;
      BehKod:=Frodm.ExchAccKod.Value;
      If Flt <> '' Then DelBitem(Frodm.ExchNo.AsString,BNo,BTip);

      Rate:=GetrateatDate(Frodm.ExchCTip.Value,Frodm.ExchDat.AsInteger);
      Net:=Frodm.ExchAmount.Value*Rate;
      St:='Exchange '+Frodm.ExchAmount.AsString+' '+Frodm.ExchCTip.Value+' to '+Frodm.ExchICTip.Value;
      AutoBill(True,Def_Exh,BehKod,Net,St,Frodm.ExchNo.AsString,BNo,BTip,BDat,
      '',Frodm.ExchCKod.AsInteger,Frodm.ExchAmount.Value,Rate,Frodm.ExchCtip.AsString);

      Rate:=GetrateatDate(Frodm.ExchICTip.Value,Frodm.ExchDat.AsInteger);
      Net:=Frodm.ExchIAmount.Value*Rate;
      AutoBill(True,BehKod,Def_Exh,Net,St,Frodm.ExchNo.AsString,BNo,BTip,BDat,
      '',Frodm.ExchCKod.AsInteger,Frodm.ExchIAmount.Value,Rate,Frodm.ExchICtip.AsString);

      Frodm.Exch.Next;
     End;
     Frodm.Exch.Filter:='';
     Frodm.Exch.Filtered:=False;
     Frodm.Exch.Close;
end;

Procedure TFReBill.Make_Expense_Bill;
Var
I,J:Integer;
BNo:Integer;
BehKod:Real;
BesKod:Real;
Net,Rate,CPrice:Currency;
BTip,BDat:Integer;
St,Ctip,Flt:String;
begin
     Flt:=Make_Filt_String;
     BTip:=22;
     Frodm.Exp.Filter:=Flt;
     Frodm.Exp.Open;
     Frodm.ExpD.Open;
     Frodm.Exp.Filtered:=True;
     Frodm.ExpD.Filtered:=True;
     If Flt = '' Then DelAllBItem(BTip);

     Frodm.Exp.First;
     For I:=1 To Frodm.Exp.RecordCount Do
     Begin
      St:='’Ê—   ‰ŒÊ«Â ‘„«—Â '+' '+Frodm.ExpNo.AsString;
      BesKod:=Frodm.ExpAcckod.Value;
      BDat:=Frodm.ExpDat.Value;
      Net:=Frodm.ExpPsum.Value;
      Rate:=1;
      BNo:=Frodm.ExpBNo.Value;
      If Flt <> '' Then DelBitem(Frodm.ExpNo.AsString,BNo,BTip);
      AutoBill(True,BesKod,0,Net,St,Frodm.ExpNo.AsString,BNo,BTip,BDat,'',0,
               Net,Rate,DefaultCurr);
      Frodm.ExpD.First;
      For J:=1 to Frodm.ExpD.RecordCount Do
      Begin
       Net:=Frodm.ExpDPrice.Value;
       CPrice:=Frodm.ExpDAmount.Value;
       Rate:=Frodm.ExpDRate.Value;
       BehKod:=Frodm.ExpDAcckod.Value;
       BDat:=Frodm.ExpDat.Value;
       Ctip:=CurrName(Frodm.ExpDCtip.Value);
       St:='’Ê—   ‰ŒÊ«Â ‘„«—Â '+' '+Frodm.ExpNo.AsString+' »‘—Õ '+Frodm.ExpDDes.Value;
       AutoBill(True,0,Behkod,Net,St,Frodm.ExpDNo.AsString,BNo,BTip,BDat,'',
       Frodm.ExpDCkod.AsInteger,Cprice,Rate,Ctip);
       Frodm.ExpD.Next;
      End;

      Frodm.Exp.Next;
     End;
     Frodm.Exp.Filter:='';
     Frodm.Exp.Filtered:=False;
     Frodm.ExpD.Filtered:=False;
     Frodm.Exp.Close;
     Frodm.ExpD.Close;
end;

Procedure TFReBill.Make_Havale_Bill;
Var
I,J:Integer;
BNo:Integer;
BehKod:Real;
BesKod:Real;
Net,Rate,CPrice:Currency;
BTip,BDat:Integer;
St,Ctip,Flt:String;
begin
     Flt:=Make_Filt_String;
     BTip:=23;
     Frodm.AutoBill.FindKey(['GF']);
     BehKod:=Frodm.AutoBillBehKod.Value;
     BesKod:=Frodm.AutoBillBesKod.Value;
     Frodm.Hav.Filter:=Flt;
     Frodm.Hav.Open;
     Frodm.Hav.Filtered:=True;

     If Flt = '' Then DelAllBItem(BTip);
//------------------
     For I:=1 To Frodm.Hav.RecordCount Do
     Begin

      Net:=Frodm.HavPkol.Value;
      BDat:=Frodm.HavDat.Value;
      BNo:=Frodm.HavBno.Value;

      If Flt <> '' Then DelBitem(Frodm.HavNo.AsString,BNo,BTip);

      St:='ò”—«ﬁ·«„ ÕÊ«·Â ›—Ê‘ ‘„«—Â'+' '+Frodm.HavNo.AsString+' '+Frodm.HavNam.AsString;

      AutoBill(True,BesKod,BehKod,Net,St,Frodm.HavNo.AsString,BNo,BTip,BDat,
      Frodm.HavCost.AsString,Frodm.HavCkod.AsInteger,0,0,DefaultCurr);

      Frodm.Hav.Next;

     End;
     Frodm.Hav.Filter:='';
     Frodm.Hav.Filtered:=False;
     Frodm.Hav.Close;
end;

Procedure TFReBill.Make_Resid_Bill;
Var
I,J:Integer;
BNo:Integer;
BehKod:Real;
BesKod:Real;
Net,Rate,CPrice:Currency;
BTip,BDat:Integer;
St,Ctip,Flt:String;
begin
     Flt:=Make_Filt_String;
     BTip:=24;
     Frodm.AutoBill.FindKey(['GF']);
     BehKod:=Frodm.AutoBillBehKod.Value;
     BesKod:=Frodm.AutoBillBesKod.Value;
     Frodm.Res.Filter:=Flt;
     Frodm.Res.Open;
     Frodm.Res.Filtered:=True;
     If Flt = '' Then DelAllBItem(BTip);
//------------------
     For I:=1 To Frodm.Res.RecordCount Do
     Begin
      Net:=Frodm.ResPkol.Value;
      BDat:=Frodm.ResDat.Value;
      BNo:=Frodm.ResBno.Value;
      If Flt <> '' Then DelBitem(Frodm.ResNo.AsString,BNo,BTip);
      St:='—”Ìœ „” ﬁÌ„ «‰»«— »Â ‘„«—Â '+' '+Frodm.ResNo.AsString+' '+Frodm.ResNam.AsString;
      AutoBill(True,BehKod,BesKod,Net,St,Frodm.ResNo.AsString,BNo,BTip,BDat,
      Frodm.ResCost.AsString,Frodm.ResCkod.AsInteger,0,0,DefaultCurr);
      Frodm.Res.Next;
     End;
     Frodm.Res.Filter:='';
     Frodm.Res.Filtered:=False;
     Frodm.Res.Close;
end;

Procedure TFReBill.Make_IRej_Bill;
Var
I,J:Integer;
BNo:Integer;
BehKod:Real;
BesKod:Real;
Net,Rate,CPrice:Currency;
BTip,BDat:Integer;
St,Ctip,Flt:String;
begin
     Flt:=Make_Filt_String;
     BTip:=25;
     Frodm.AutoBill.FindKey(['GF']);
     BehKod:=Frodm.AutoBillBehKod.Value;
     BesKod:=Frodm.AutoBillBesKod.Value;
     Frodm.IRej.Filter:=Flt;
     Frodm.IRej.Open;
     Frodm.IRej.Filtered:=True;
     If Flt = '' Then DelAllBItem(BTip);
//------------------
     For I:=1 To Frodm.IRej.RecordCount Do
     Begin
      Net:=Frodm.IRejPkol.Value;
      BDat:=Frodm.IRejDat.Value;
      BNo:=Frodm.IRejBno.Value;
      If Flt <> '' Then DelBitem(Frodm.IRejNo.AsString,BNo,BTip);
      St:='Ã„⁄ «ﬁ·«„ »—ê‘  »Â «‰»«—'+' '+Frodm.IRejNo.AsString+' '+Frodm.IRejNam.AsString;
      AutoBill(True,BehKod,BesKod,Net,St,Frodm.IRejNo.AsString,BNo,BTip,BDat,
      Frodm.IRejCost.AsString,Frodm.IRejCkod.AsInteger,0,0,DefaultCurr);
      Frodm.IRej.Next;
     End;
     Frodm.IRej.Filter:='';
     Frodm.IRej.Filtered:=False;
     Frodm.IRej.Close;
end;

Procedure TFReBill.Make_ORej_Bill;
Var
I,J:Integer;
BNo:Integer;
BehKod:Real;
BesKod:Real;
Net,Rate,CPrice:Currency;
BTip,BDat:Integer;
St,Ctip,Flt:String;
begin
     Flt:=Make_Filt_String;
     BTip:=26;
     Frodm.AutoBill.FindKey(['GF']);
     BehKod:=Frodm.AutoBillBehKod.Value;
     BesKod:=Frodm.AutoBillBesKod.Value;
     Frodm.ORej.Filter:=Flt;
     Frodm.ORej.Open;
     Frodm.ORej.Filtered:=True;
     If Flt = '' Then DelAllBItem(BTip);
//------------------
     For I:=1 To Frodm.ORej.RecordCount Do
     Begin
      Net:=Frodm.ORejPkol.Value;
      BDat:=Frodm.ORejDat.Value;
      BNo:=Frodm.ORejBno.Value;
      If Flt <> '' Then DelBitem(Frodm.ORejNo.AsString,BNo,BTip);
      St:='Ã„⁄ «ﬁ·«„ »—ê‘  «“ «‰»«— ‘„«—Â'+' '+Frodm.ORejNo.AsString+' '+Frodm.ORejNam.AsString;
      AutoBill(True,BesKod,BehKod,Net,St,Frodm.ORejNo.AsString,BNo,BTip,BDat,
      Frodm.ORejCost.AsString,Frodm.ORejCkod.AsInteger,0,0,DefaultCurr);
      Frodm.ORej.Next;
     End;
     Frodm.ORej.Filter:='';
     Frodm.ORej.Filtered:=False;
     Frodm.ORej.Close;
end;

procedure TFReBill.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFReBill.FormKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
      Key:=#0;
      SelectNext(Sender as TWinControl,True,True);
     End;
end;

procedure TFReBill.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     Setup_DefCodes;
end;

procedure TFReBill.FNo1KeyPress(Sender: TObject; var Key: Char);
begin
     FormKeyPress(Sender,Key);
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;
end;

procedure TFReBill.BshowClick(Sender: TObject);
begin
     Screen.Cursor:=crHourGlass;
     Case Teep.ItemIndex Of
      0: Make_Buy_Bill;
      1: Make_Sell_Bill;
      2: Make_RInv_Bill;
      3: Make_RBInv_Bill;
      4: Make_RMon_Bill;
      5: Make_PMon_Bill;
      6: Make_NFish_Bill;
      7: Make_BHav_Bill;
      8: Make_DCheq_Bill;
      9: Make_CheqOut_Bill;
     10: Make_Keler_Bill;
     11: Make_UnKeler_Bill;
     12: Make_Vosol_Bill;
     13: Make_Reject_Bill;
     14: Make_PCheq_Bill;
     15: Make_Pass_Bill;
     16: Make_CarMoz_Bill;
     17: Make_Remmitance_Bill;
     18: Make_Exchange_Bill;
     19: Make_Expense_Bill;
     20: Make_Havale_Bill;
     21: Make_Resid_Bill;
     22: Make_IRej_Bill;
     23: Make_ORej_Bill;
     End;
     Screen.Cursor:=crDefault;
end;

procedure TFReBill.BexitClick(Sender: TObject);
begin
     Close;
end;

procedure TFReBill.FDat1Exit(Sender: TObject);
begin
     SetMaskText(FDat1);
     If(Not Date_Check(FDat1.Text))And(DateToInt(FDat1.Text)>0) Then FDat1.SetFocus;
end;

procedure TFReBill.FDat2Exit(Sender: TObject);
begin
     SetMaskText(FDat2);
     If(Not Date_Check(FDat2.Text))And(DateToInt(FDat2.Text)>0) Then FDat2.SetFocus;
end;

procedure TFReBill.FDat1Enter(Sender: TObject);
begin
     GetMaskText(FDat1);
end;

procedure TFReBill.FDat2Enter(Sender: TObject);
begin
     GetMaskText(FDat2);
end;

end.
