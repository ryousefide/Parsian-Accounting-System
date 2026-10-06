unit PriceRepair;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  MPlayer, ComCtrls, StdCtrls, ExtCtrls, Db, DBTables, Grids, DBGrids;

type
  TFPrices = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    PB: TProgressBar;
    Ani1: TAnimate;
    Button1: TButton;
    Label3: TLabel;
    GQu: TQuery;
    GQuId: TIntegerField;
    GQuKod: TIntegerField;
    GQuGene: TIntegerField;
    GQuNam: TStringField;
    GQuColor: TStringField;
    GQuAnbNam: TStringField;
    GQuAnbKod: TFloatField;
    GQuQuant: TFloatField;
    Bevel1: TBevel;
    IQu: TQuery;
    BQu: TQuery;
    DataSource1: TDataSource;
    Memo1: TMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    OFilt:String;
    Function GetRefInvoice(RejInvoNo:Integer):Integer;
    Procedure UpdateRejectedGoods;
    Procedure UpdateRejectedGoodsMean;
    Procedure UpdateRejectedBuys;
    Procedure RepairCardex;
    Procedure HavePriceUpdate(GKod:Integer);
  public
    { Public declarations }
  end;

var
  FPrices: TFPrices;

implementation

uses Routins, ProVar, CheckData, FrooshDM, MainForm, Car_Repair;

{$R *.DFM}

Function TFPrices.GetRefInvoice(RejInvoNo:Integer):Integer;
begin
 Qu.SQL.Clear;
 Qu.SQL.Add('Select FacNo From RejInvo R Where R.No = :a');
 Qu.Params[0].Value:=RejInvoNo;
 Qu.Open;
 Result:=Qu.Fields[0].AsInteger;
 Qu.Close;
end;

Procedure TFPrices.UpdateRejectedGoods;
Var
I,J:Integer;
InvNo:Integer;
RejFilt:String;
CQu:TQuery;
begin
 CQu:=TQuery.Create(Owner);
 CQu.DataBaseName:=CurrDb;
 CQu.SQL.Clear;
 CQu.SQL.Add('Select C.No,Nam,Color,Anb From Cardex C Where Des = :a');
 CQu.Params[0].Value:='„—ÃÊ⁄Ì ›—Ê‘';
 CQu.Open;
 OFilt:=Frodm.RejInvoGood.Filter;
 For I:=1 To CQu.RecordCount Do
 Begin
  InvNo:=GetRefInvoice(CQu.Fields[0].AsInteger);
  Frodm.Cardex.Filter:='No='+IntToStr(InvNo)+' and Des='+QuotedStr('ÕÊ«·Â ›—Ê‘');
  Frodm.Cardex.Filtered:=True;
  If P_Rule = 'LiFo' Then Frodm.Cardex.Last;
  RejFilt:='No= '+CQu.Fields[0].AsString+' and Nam ='+QuotedStr(CQu.Fields[1].AsString)+
  ' and Color='+QuotedStr(CQu.Fields[2].AsString)+' and AnbNam= '+QuotedStr(CQu.Fields[3].AsString);
  Frodm.RejInvoGood.Filter:=RejFilt;
  Frodm.RejInvoGood.Filtered:=True;
  For J:=1 To Frodm.RejInvoGood.RecordCount Do
  Begin
   Frodm.RejInvoGood.Edit;
   Frodm.RejInvoGoodReject.AsCurrency:=Frodm.CardexFee.AsCurrency;
   Frodm.RejInvoGood.Post;
   Frodm.RejInvoGood.Next;
   If P_Rule = 'LiFo' Then Frodm.Cardex.Prior Else Frodm.Cardex.Next;
  End;
  CQu.Next;
 End;
 CQu.Close;
 CQu.Free;
 Frodm.Cardex.Filtered:=False;
 Frodm.RejInvoGood.Filter:=OFilt;
end;

Procedure TFPrices.UpdateRejectedGoodsMean;
Var
I:Integer;
RejFilt:String;
begin
 Frodm.Cardex.Filter:='Des = '+QuotedStr('„—ÃÊ⁄Ì ›—Ê‘');
 Frodm.Cardex.Filtered:=True;
 OFilt:=Frodm.RejInvoGood.Filter;
 For I:=1 To Frodm.Cardex.RecordCount Do
 Begin
  RejFilt:=' No = '+Frodm.CardexNo.AsString+' and Radif='+Frodm.CardexAnbKod.AsString+
  ' and Nam='+QuotedStr(Frodm.CardexNam.AsString);
  IF  Frodm.CardexColor.AsString <> '' Then RejFilt:=RejFilt+' and Color='+QuotedStr(Frodm.CardexColor.AsString);

  Memo1.Lines.Clear;
  Memo1.Lines.Text:='Rejected Sell Filter = '+RejFilt;
  Memo1.Refresh;

  Frodm.RejInvoGood.Filter:=RejFilt;
  Frodm.RejInvoGood.Filtered:=True;
  Memo1.Lines.Add(Frodm.CardexFee.AsString);
  Frodm.RejInvoGood.Edit;
  Frodm.RejInvoGoodReject.AsCurrency:=Frodm.CardexFee.AsCurrency;
  Frodm.RejInvoGood.Post;
  Frodm.Cardex.Next;
 End;
 Frodm.Cardex.Filtered:=False;
 Frodm.RejInvoGood.Filter:=OFilt;
end;

Procedure TFPrices.UpdateRejectedBuys;
Var
I:Integer;
RejFilt:String;
begin
 Frodm.Cardex.Filter:='Des = '+QuotedStr('„—ÃÊ⁄Ì Œ—Ìœ');
 Frodm.Cardex.Filtered:=True;
 OFilt:=Frodm.RejBinvoGood.Filter;
 For I:=1 To Frodm.Cardex.RecordCount Do
 Begin
  RejFilt:=' No = '+Frodm.CardexNo.AsString+' and Radif='+Frodm.CardexAnbKod.AsString+
  ' and Nam='+QuotedStr(Frodm.CardexNam.AsString);
  IF  Frodm.CardexColor.AsString <> '' Then RejFilt:=RejFilt+' and Color='+QuotedStr(Frodm.CardexColor.AsString);

  Memo1.Lines.Clear;
  Memo1.Lines.Text:='Rejected Buy Filter = '+RejFilt;
  Memo1.Refresh;

  Frodm.RejBinvoGood.Filter:=RejFilt;
  Frodm.RejBinvoGood.Filtered:=True;
  Frodm.RejBinvoGood.Edit;
  Frodm.RejBinvoGoodReject.AsCurrency:=Frodm.CardexFee.AsCurrency;
  Frodm.RejBinvoGood.Post;
  Frodm.Cardex.Next;
 End;
 Frodm.Cardex.Filtered:=False;
 Frodm.RejBinvoGood.Filter:=OFilt;
end;

Procedure TFPrices.RepairCardex;
Var
CR:TFCarRepair;
begin
     CR:=TFCarRepair.Create(Application.Owner);
     With CR Do
     Try
      Position:=poMainFormCenter;
      BorderStyle:=bsSingle;
      Brepair.Enabled:=False;
      Visible:=True;
      BrepairClick(Owner);
     Finally
      CR.Free;
     End;
end;

Procedure TFPrices.HavePriceUpdate(GKod:Integer);
Var
I:Integer;
No:Integer;
Qt:Real;
sColor:String;
Fee:Currency;
begin
 Frodm.Cardex.Filtered:=False;
 Frodm.Cardex.Filter:='Des ='+QuotedStr('ÕÊ«·Â ›—Ê‘');
 Frodm.Cardex.Filtered:=True;
 Frodm.Cardex.First;
 Frodm.HavG.UpdateMode:=upWhereChanged;
 Frodm.HavG.Open;
 Frodm.HavG.Filtered:=False;
 Frodm.HavG.Filter:='Kod = '+IntToStr(GKod);
 Frodm.HavG.Filtered:=True;
 For I:=1 To Frodm.Cardex.RecordCount Do
 Begin
  No:=Frodm.CardexNo.AsInteger;
  sColor:=Frodm.CardexColor.AsString;
  Qt:=Frodm.CardexOut.AsFloat;
  Fee:=Frodm.CardexFee.AsCurrency;
  Memo1.Lines.Add('Kod = '+IntToStr(GKod)+' ÕÊ«·Â ='+IntToStr(No)+'   Color='+sColor+'   Quant='+FloatToStr(Qt)+'   Fee='+FloatToStr(Fee));
  If sColor <>'' Then
  Begin
   If Frodm.HavG.Locate('No;Color;Quant',VarArrayof([No,sColor,Qt]),[loCaseinsensitive]) Then
   Begin
    Frodm.HavG.Edit;
    Frodm.HavGPfee.Value:=Fee;
    Frodm.HavGPtotal.AsCurrency :=Frodm.HavGPfee.AsCurrency *Frodm.HavGQuant.AsFloat;
    Frodm.HavG.Post;
   End;
  End Else Begin
   If Frodm.HavG.Locate('No;Quant',VarArrayof([No,Qt]),[loCaseinsensitive]) Then
   Begin
    Frodm.HavG.Edit;
    Frodm.HavGPfee.Value:=Fee;
    Frodm.HavGPtotal.AsCurrency :=Frodm.HavGPfee.AsCurrency *Frodm.HavGQuant.AsFloat;
    Frodm.HavG.Post;
   End;
  End;
  Frodm.Cardex.Next;
 End;
 Frodm.HavG.Filtered:=False;
 Frodm.HavG.Filter:='';
 Frodm.HavG.Close;
 Frodm.HavG.UpdateMode:=upWhereAll;
 Frodm.Cardex.Filtered:=False;
 Frodm.Cardex.Filter:='';
End;

procedure TFPrices.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFPrices.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     GQu.DataBaseName:=CurrDb;
     IQu.DataBaseName:=CurrDb;
     BQu.DataBaseName:=CurrDb;
end;
{Where Kod In (Select Kod From RejBinvoGood R Where R.No >0)
 Or Kod In (Select Kod From RejInvoGood)
Order by AnbNam}
procedure TFPrices.Button1Click(Sender: TObject);
Var
I:Integer;
LValue:Currency;
begin
     Ani1.Active:=True;
     Label3.Caption:='»«“”«“Ì ﬁÌ„ ';
     Label3.Refresh;
     Frodm.Depot.First;
     Frodm.RejInvoGood.Open;
     Frodm.RejBinvoGood.Open;
     GQu.Open;
     PB.Max:=GQu.RecordCount;
     PB.Position:=0;
     For I:=1 To GQu.RecordCount Do
     Begin
      Label1.Caption:=GQuAnbNam.AsString;
      Label1.Refresh;
      Label2.Caption:=GQuNam.AsString+'-----'+GQuColor.AsString;
      Label2.Refresh;

      Sold_Price(P_Rule,Qu,GQuKod.AsString,GQuColor.AsString,GQuAnbNam.AsString,
      GQuAnbKod.AsInteger,0,1111111111,0,LValue);

      If P_Rule = 'Mean' Then
       UpdateRejectedGoodsMean
      Else
       UpdateRejectedGoods;
      UpdateRejectedBuys;
      HavePriceUpdate(GQuKod.AsInteger);
      PB.Position:=I;
      GQu.Next;
     End;
     GQu.Close;
     Close_g(Frodm.Cardex);
     Frodm.RejInvoGood.Close;
     Frodm.RejBinvoGood.Close;
     IQu.ExecSQL;

     RepairCardex;
     Close;
end;

end.
