unit Solds;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Grids, DBGrids, Db, DBTables, Buttons;

type
  TFSolds = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Dat1: TMaskEdit;
    Dat2: TMaskEdit;
    Label3: TLabel;
    FAccNam: TComboBox;
    SQu: TQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    SQuPfee: TCurrencyField;
    SQuQuant: TFloatField;
    SQuPtotal: TCurrencyField;
    SQuPerc: TFloatField;
    SQuNo: TIntegerField;
    SQuDat: TIntegerField;
    SQuNam: TStringField;
    SQuPrule: TStringField;
    spCalc: TSpeedButton;
    Label4: TLabel;
    FFac: TEdit;
    Label5: TLabel;
    FSum: TEdit;
    Label6: TLabel;
    FRem: TEdit;
    Label7: TLabel;
    Fcheq: TEdit;
    Label8: TLabel;
    FCash: TEdit;
    Label9: TLabel;
    Fbank: TEdit;
    SQuGNam: TStringField;
    spPrint: TSpeedButton;
    Label10: TLabel;
    cbState: TComboBox;
    Label11: TLabel;
    cbCity: TComboBox;
    Label12: TLabel;
    cbRegon: TComboBox;
    Label13: TLabel;
    FCostN: TComboBox;
    Label14: TLabel;
    FCentN: TComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure NextTab(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure Dat1Enter(Sender: TObject);
    procedure Dat1Exit(Sender: TObject);
    procedure Dat2Enter(Sender: TObject);
    procedure Dat2Exit(Sender: TObject);
    procedure spCalcClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure spPrintClick(Sender: TObject);
    procedure FCentNKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    Function Make_Filter:String;
    Function Payment_Filter:String;
    Function StateSQL:String;
  public
    { Public declarations }
  end;

var
  FSolds: TFSolds;

implementation

uses Routins, ProVar, FrooshDM, MainForm, RepSolds, CRoutins;

{$R *.DFM}

Function GetFactorSum(Filt:String):Currency;
begin
     If Filt > '' Then Filt:='Where '+Filt;
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Sum(Pnet) From Invoice I '+Filt);
     Qu.Open;
     Result:=Qu.Fields[0].AsCurrency;
     Qu.Close;
end;

Function GetRejFactorSum(Filt:String):Currency;
begin
     If Filt > '' Then Filt:='Where '+Filt;
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Sum(Pnet) From RejInvo I '+Filt);
     Qu.Open;
     Result:=Qu.Fields[0].AsCurrency;
     Qu.Close;
end;

Function GetCashPay(Filt:String):Currency;
begin
     If Filt > '' Then Filt:='Where '+Filt;
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Sum(Price) From RMon '+Filt);
     Qu.Open;
     Result:=Qu.Fields[0].AsCurrency;
     Qu.Close;
end;

Function GetHavPay(Filt:String):Currency;
begin
     If Filt > '' Then Filt:='Where '+Filt;
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Sum(Price) From BHav '+Filt);
     Qu.Open;
     Result:=Qu.Fields[0].AsCurrency;
     Qu.Close;
end;

Function GetFishPay(Filt:String):Currency;
begin
     If Filt > '' Then Filt:='Where '+Filt;
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Sum(Price) From NFish  '+Filt);
     Qu.Open;
     Result:=Qu.Fields[0].AsCurrency;
     Qu.Close;
end;

Function GetCheqPay(Filt:String):Currency;
Var
Str:String;
I:Integer;
begin
     Str:='';
     I:=DateToInt(FSolds.Dat1.Text);
     If I>0 Then Str:='Dat >= '+IntToStr(I);
     I:=DateToInt(FSolds.Dat2.Text);
     If I>0 Then Str:=Str+' and Dat <= '+IntToStr(I);
     If FSolds.FAccNam.Text > ''  Then Str:=Str+' and Acnam = '+chr(39)+FSolds.FAccNam.Text+chr(39);
     If FSolds.FCostN.Text > ''  Then Str:=Str+' and Cost = '+chr(39)+FSolds.FCostN.Text+chr(39);
     If FSolds.FCentN.Text >'' Then Str:=Str+' and CKod = '+IntToStr(CentKod(FSolds.FCentN.Text));
     If Pos(' and',Str) = 1 Then Delete(Str,1,4);
     If Str > '' Then Str:='Where '+Str;
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Sum(PSum) From RRes '+Str);
     Qu.Open;
     Result:=Qu.Fields[0].AsCurrency;
     Qu.Close;
end;

Function TFSolds.Make_Filter: String;
Var
Str:String;
I:Integer;
begin
     Str:='';
     I:=DateToInt(Dat1.Text);
     If I>0 Then Str:='I.Dat >= '+IntToStr(I);
     I:=DateToInt(Dat2.Text);
     If I>0 Then Str:=Str+' and I.Dat <= '+IntToStr(I);
     If FAccNam.Text > ''  Then Str:=Str+' and I.Nam = '+chr(39)+FAccNam.Text+chr(39);
     If FCostN.Text > ''  Then Str:=Str+' and I.Cost = '+chr(39)+FCostN.Text+chr(39);
     If FCentN.Text >'' Then Str:=Str+' and I.CKod = '+IntToStr(CentKod(FCentN.Text));
     If (cbState.Text > '')Or(cbCity.Text > '')Or(cbRegon.Text>'') Then Str:=Str+' and '+StateSQL;
     If Pos(' and',Str) = 1 Then Delete(Str,1,4);
     Result:=Str;
end;

Function TFSolds.Payment_Filter:String;
Var
Str:String;
I:Integer;
begin
     Str:='';
     I:=DateToInt(Dat1.Text);
     If I>0 Then Str:='Dat >= '+IntToStr(I);
     I:=DateToInt(Dat2.Text);
     If I>0 Then Str:=Str+' and Dat <= '+IntToStr(I);
     If FAccNam.Text > ''  Then Str:=Str+' and AccNam = '+chr(39)+FAccNam.Text+chr(39);
     If FCostN.Text > ''  Then Str:=Str+' and Cost = '+chr(39)+FCostN.Text+chr(39);
     If FCentN.Text >'' Then Str:=Str+' and CKod = '+IntToStr(CentKod(FCentN.Text));
     If Pos(' and',Str) = 1 Then Delete(Str,1,4);
     Result:=Str;
end;

Function TFSolds.StateSQL:String;
Var
Str:String;
begin
     Str:='';
     If cbState.Text > ''  Then Str:=Str+' A.State = '+QuotedStr(cbState.Text);
     If cbCity.Text > ''  Then Str:=Str+' and A.City = '+QuotedStr(cbCity.Text);
     If cbRegon.Text > ''  Then Str:=Str+' and A.Regon = '+QuotedStr(cbRegon.Text);
     If Pos(' and',Str) = 1 Then Delete(Str,1,4);
     Result:=' I.Nam in(Select A.Nam From AccountKod A Where '+Str+')';
end;

procedure TFSolds.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFSolds.NextTab(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
      Key:=#0;
      SelectNext(Sender As TwinControl,True,True);
     End;
end;

procedure TFSolds.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     Main.glKey.GetBitmap(8,spCalc.Glyph);
     Main.glKey.GetBitmap(2,spPrint.Glyph);
     Fill_Comb(Frodm.Invo,'Nam',FAccNam.Items);
     Fill_Comb(Frodm.Cent,'State',cbState.Items);
     cbState.Items.Add('');
     Fill_Cond(Frodm.Cent,'City','',cbCity.Items);
     cbCity.Items.Add('');
     Fill_Cond(Frodm.Cent,'Regon','',cbRegon.Items);
     cbRegon.Items.Add('');
     FCostN.Items.Assign(CostList);
     Fill_Comb(Frodm.Cent,CUser.CentField,FCentN.Items);
     SQu.DatabaseName:=CurrDb;
end;

procedure TFSolds.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key Of
     VK_F3 :spCalcClick(Sender);
     27    :Close;
     End;
end;

procedure TFSolds.Dat1Enter(Sender: TObject);
begin
     GetMaskText(Dat1);
end;

procedure TFSolds.Dat1Exit(Sender: TObject);
begin
     SetMaskText(Dat1);
     If(Not Date_Check(Dat1.Text))And(DateToInt(Dat1.Text)>0)Then Dat1.SetFocus;
end;

procedure TFSolds.Dat2Enter(Sender: TObject);
begin
     GetMaskText(Dat2);
end;

procedure TFSolds.Dat2Exit(Sender: TObject);
begin
     SetMaskText(Dat2);
     If(Not Date_Check(Dat2.Text))And(DateToInt(Dat2.Text)>0)Then Dat2.SetFocus;
end;

procedure TFSolds.spCalcClick(Sender: TObject);
Var
Flt:String;
FSu,Sum:Currency;
Csh,Che,Ban:Currency;
begin
     SQu.Close;
     Flt:=Make_Filter;
     If Flt > '' Then
      SQu.SQL.Strings[4]:='Where '+Flt
     Else
      SQu.SQL.Strings[4]:='';
     SQu.Open;
     FSu:=GetFactorSum(Flt)-GetRejFactorSum(Flt);
     FFac.Text:=CurrToFar(FSu);
     Flt:=Payment_Filter;
     Csh:=GetCashPay(Flt);
     FCash.Text:=CurrToFar(Csh);
     Che:=GetCheqPay(Flt);
     FCheq.Text:=CurrToFar(Che);
     Ban:=GetFishPay(Flt)-GetHavPay(Flt);
     FBank.Text:=CurrToFar(Ban);
     Sum:=Ban+Che+Csh;
     FSum.Text:=CurrToFar(Sum);
     FRem.Text:=CurrToFar(FSu-Sum);

end;
//DatabaseName = 'ParFro'

procedure TFSolds.spPrintClick(Sender: TObject);
begin
     CreatingForm(TSoldsRep,'SoldsRep',SoldsRep);
     Set_Sys_Enviroment;
     SoldsRep.I:=0;
     If Not bmpP1.Empty Then SoldsRep.Logo.Picture.Bitmap:=bmpP1;
     SoldsRep.qrTit.Caption:=InvoLbl;
     SoldsRep.QrTit2.Caption:=BarNamLbl;
     SoldsRep.SDat.Caption:=Dat1.Text;
     SoldsRep.EDat.Caption:=Dat2.Text;
     SoldsRep.Cust.Caption:=FAccNam.Text;
     SoldsRep.State.Caption:=cbState.Text;
     SoldsRep.City.Caption:=cbCity.Text;
     SoldsRep.Regon.Caption:=cbRegon.Text;
     SoldsRep.QBank.Caption:=FBank.Text;
     SoldsRep.QCash.Caption:=FCash.Text;
     SoldsRep.QCheq.Caption:=FCheq.Text;
     SoldsRep.QFac.Caption:=FFac.Text;
     SoldsRep.QSum.Caption:=FSum.Text;
     SoldsRep.QRem.Caption:=FRem.Text;
     SoldsRep.Preview;
     SoldsRep.Destroy;
end;

procedure TFSolds.FCentNKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetCentLookup(Sender,Key);
end;

end.
