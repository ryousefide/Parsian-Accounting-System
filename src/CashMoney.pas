unit CashMoney;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls, DBCtrls, Mask,Db, DBTables;

type
  TFCashBill = class(TForm)
    Label3: TLabel;
    FPbill: TDBEdit;
    Label1: TLabel;
    FAccNam: TDBLookupComboBox;
    Label2: TLabel;
    BDo: TButton;
    Bexit: TButton;
    Bevel1: TBevel;
    FDesc: TDBEdit;
    Bevel2: TBevel;
    cbPrint: TCheckBox;
    Label5: TLabel;
    Label6: TLabel;
    FNo: TEdit;
    Bedit: TButton;
    BDel: TButton;
    Bprev: TButton;
    Bnext: TButton;
    Bprint: TButton;
    Dat1: TMaskEdit;
    Label10: TLabel;
    FacNo: TDBEdit;
    Label4: TLabel;
    FCost: TDBComboBox;
    Label7: TLabel;
    FCKod: TDBLookupComboBox;
    Label8: TLabel;
    FCtip: TDBLookupComboBox;
    Label9: TLabel;
    FEQ: TDBEdit;
    DBText1: TDBText;
    Label11: TLabel;
    lCurr: TStaticText;
    FCaKod: TDBLookupComboBox;
    Label14: TLabel;
    FRate: TDBEdit;
    Label15: TLabel;
    FCw: TDBEdit;
    Sb: TStatusBar;
    AcQu: TQuery;
    AcQuDs: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BDoClick(Sender: TObject);
    procedure AghBDoClick(Sender: TObject);
    Procedure NextTab(Sender:TObject;Var Key:Char);
    procedure FPbillKeyPress(Sender: TObject; var Key: Char);
    procedure BexitClick(Sender: TObject);
    procedure BprintClick(Sender: TObject);
    procedure BeditClick(Sender: TObject);
    procedure BDelClick(Sender: TObject);
    procedure FNoKeyPress(Sender: TObject; var Key: Char);
    procedure BprevClick(Sender: TObject);
    procedure BnextClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Dat1Enter(Sender: TObject);
    procedure Dat1Exit(Sender: TObject);
    procedure FAccNamKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FEQEnter(Sender: TObject);
    procedure FCKodKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FEQExit(Sender: TObject);
    procedure FRateKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    BehKod,BesKod:Real;
    State:Boolean;
    Price,Rem:Currency;
    Str:String;
    Dat:Integer;
    RNo:Integer;
    BNo:Integer;
    BDat:Integer;
    MoFlag:Boolean;
    Rate:Currency;
    Procedure SetBNo(BNo,No:Integer);
    Function MaxNo:Integer;
    Procedure FNo_Exit;
    Procedure MakeNew;
    Procedure DataClear;
  public
    { Public declarations }
  end;

var
  FCashBill: TFCashBill;

implementation

uses FrooshDM, Routins, ProVar, AcSearch, RMResid, AghsEdit, XPListBox,
  CRoutins;// RepResid,
Const
FTip = 5;
{$R *.DFM}
Procedure TFCashBill.NextTab(Sender:TObject;Var Key:Char);
begin
     If Key= #13 Then
     Begin
      Key:=#0;
      SelectNext(Sender As TWinControl,True,True);
     End;
end;

Procedure TFCashBill.FNo_Exit;
begin
     If Not(Frodm.RMon.State =dsBrowse) Then
     Begin
       FNo.Text :=IntToStr(Frodm.RMonNo.Value);
       Exit;
     End;
     RNo:=StrToInt(FNo.Text);
     If Not(Frodm.RMon.Locate('No',RNo,[loCaseInsensitive])) Then MakeNew;
     Dat1.Text:=IntToDate(Frodm.RMonDat.Value);
end;

Procedure TFCashBill.MakeNew;
begin
     If Not(Frodm.RMon.State=dsBrowse) Then Exit;
     Frodm.RMon.Append;
     Frodm.RMonNo.Value:=MaxNo+1;
     FNo.Text:=IntToStr(Frodm.RMonNo.Value);
     Frodm.RMonDat.Value:=FarDate;
     Frodm.RMonCtip.Value:=DefaultCurr;
     Frodm.RMonLperm.Value:=False;
     BDat:=Frodm.RMonDat.Value;
     Dat1.Text:=IntToDate(Frodm.RMonDat.Value);
     BNo:=0;
     RNo:=Frodm.RMonNo.Value;
     MoFlag:=True;
end;

Function TFCashBill.MaxNo;
begin
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Max(R.No) From RMon R ');
     Qu.Open;
     Result:=Qu.Fields[0].AsInteger;
     Qu.Close;
end;

Procedure TFCashBill.SetBNo(BNo,No:Integer);
begin
     If BNo=0 Then Exit;
     If Frodm.Rmon.Locate('No',No,[locaseInsensitive]) Then
     Begin
      Frodm.RMon.Edit;
      Frodm.RMonBno.Value:=BNo;
      Frodm.RMon.Post;
     End;
end;

Procedure TFCashBill.DataClear;
begin
     BNo:=0;
     RNo:=0;
     BDat:=0;
     Str:='';
end;
procedure TFCashBill.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     MoFlag:=True;
     FCost.Items.Assign(CostList);
     AcQu.DatabaseName:=CurrDb;
     AcQu.Filter:=CUser.AcFilter;
     AcQu.Filtered:=True;
     AcQu.Open;
     Frodm.RMon.Open;
     Frodm.Cashier.Open;
     Frodm.Cashier.Filter:=CUser.CashFilter;
     Frodm.Cashier.Filtered:=True;
     //FAccNam.Items.Assign(AcList);
     //FCtip.Items.Assign(CUser.CurrList);
     FCtip.ListField:=CUser.CurrField;
     FCKod.ListField:=CUser.CentField;
     FCakod.ListField:=CUser.CashierField;
     FAccnam.ListField:=CUser.AcField;
     lCurr.Caption:=DefaultCurr;
     State:=sABill;
     Frodm.RMon.Last;
     FNo.Text:=IntToStr(Frodm.RMonNo.Value);
     Dat1.Text:=IntToDate(Frodm.RMonDat.Value);
     If sFac Then MakeNew;
end;

procedure TFCashBill.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
     IF Frodm.RMon.State = dsInsert Then Check_State(Frodm.RMon,BDoClick);
     MoFlag:=Frodm.RMon.State = dsBRowse;
     If (Frodm.RMon.State = dsEdit) Or Not MoFlag Then Action :=caNone;
     If Action=caFree Then
     Begin
      Frodm.Cashier.Close;
      Frodm.RMon.Close;
     End;
end;

procedure TFCashBill.BDoClick(Sender: TObject);
Var
NBNo:Integer;
AtfQu:TQuery;
bIns:Boolean;
fDif,Cprice:Currency;
begin
     If Frodm.RMon.State = dsBrowse Then Exit;
     MoFlag:=True;
     Price:=Frodm.RMonPrice.Value;
     If (Price = 0) or (FAccNam.KeyValue = '') Then
     Begin
       ShowMessage('«ÿ·«⁄«  ﬂ«›Ì ‰Ì” ‰œ');
       MoFLag:=False;
       Exit;
     End;
     fDif:=Frodm.RMonPrice.Value-(Frodm.RMonCPrice.Value+Frodm.RMonCwage.Value)*Frodm.RMonRate.Value;
     if Abs(fDif) > Frodm.RMonRate.Value Then
     Begin
      ShowMessage('„»·€ «—“Ì Ê „⁄«œ· «—“ —«ÌÃ »Ì‘ «“ Õœ „Ã«“ «Œ ·«› œ«—‰œ');
      MoFlag:=False;
      Exit;
     End;
     FNo.SetFocus;
//---------------------------
//Get No From Database
     AtfQu:=TQuery.Create(Application);
     AtfQu.DataBaseName:=CurrDb;
     AtfQu.SQL.Clear;
     AtfQu.SQL.Add('Set Transaction Isolation Level Serializable');  //commit transaction  With (TabLockX)
     AtfQu.SQL.Add('begin Transaction Select Max(A.No) From RMon A ');
     If Frodm.RMon.State=dsInsert Then
     Begin
      AtfQu.Open;
      bIns:=True;
      RNo:=AtfQu.Fields[0].AsInteger+1;
     End;
//---------------------------
     Frodm.RMonNo.Value:=RNo;
     Frodm.RMonLperm.Value:=sPerm;
     FNo.Text:=Frodm.RMonNo.AsString;
     Frodm.RMon.Post;
     If bIns Then //Frodm.RMon.State =dsInsert Then
     Begin
      AtfQu.Close;
      AtfQU.SQL.Clear;
      AtfQU.SQL.Add('commit transaction');
      AtfQu.ExecSQL;
      bIns:=False;
     End;
     BDat:=Frodm.RMonDat.Value;
     Str:='ﬁ»÷ œ—Ì«›  '+FNo.Text+' '+FDesc.Text;
     BesKod:=AccKod(FAccNam.Text);
     BehKod:=Frodm.RMonCakod.Value;
     State:=sABill;
//»œÂò«—Ì ’‰œÊﬁ
     NBNo:=AutoBill(State,0,BehKod,Price,Str,IntToStr(RNo),BNo,FTip,BDat,
     Frodm.RMonCost.AsString,Frodm.RMonCKod.AsInteger,Frodm.RMonCPrice.Value+Frodm.RMonCwage.Value,
     Rate,Frodm.RMonCtip.AsString);
//»” «‰ò«—Ì „‘ —Ì
{     If Frodm.CashierCtip.Value <> DefaultCurr Then
     Begin
      Price:=Frodm.RMonPrice.Value-Frodm.RMonCwage.Value*Frodm.RMonRate.Value; //Frodm.PMonCPrice.Value*Frodm.PMonRate.Value;
      CPrice:=Frodm.RMonCprice.Value;
     End Else
     Begin
      Price:=Frodm.RMonPrice.Value;
      CPrice:=Frodm.RMonCprice.Value+Frodm.RMonCWage.Value;
     End;}
      Price:=Frodm.RMonPrice.Value;
      CPrice:=Frodm.RMonCprice.Value+Frodm.RMonCWage.Value;

     //Price:=Frodm.RMonPrice.Value-Frodm.RMonCWage.Value*Frodm.RMonRate.Value;// Frodm.RMonCPrice.Value*Frodm.RMonRate.Value;
     NBNo:=AutoBill(State,BesKod,0,Price,Str,IntToStr(RNo),BNo,FTip,BDat,
     Frodm.RMonCost.AsString,Frodm.RMonCKod.AsInteger,CPrice,Rate,Frodm.RMonCtip.AsString); //Frodm.RMonCPrice.Value+Frodm.RMonCWage.Value,
                               
//ò«—„“œ ÕÊ«·Â
     If Frodm.CashierCtip.Value = DefaultCurr Then
     Begin
      BesKod:=Def_Car_Bes;
      BehKod:=AccKod(FAccNam.Text);
     End Else
     Begin
      BesKod:=Frodm.RMonCakod.Value;
      BehKod:=Def_Car_Bes;
     End;
     Price:=Frodm.RMonCWage.Value*Frodm.RMonRate.Value;
     Str:='ò«—„“œ Œ—Ìœ ÕÊ«·Â «—“Ì ﬁ»÷ œ—Ì«›  ‘„«—Â'+ Frodm.RMonNo.AsString+' «“'+Frodm.RMonAccNam.AsString;
     NBNo:=AutoBill(State,BesKod,BehKod,Price,Str,IntToStr(RNo),BNo,FTip,BDat,
     Frodm.RMonCost.AsString,Frodm.RMonCkod.AsInteger,Frodm.RMonCWage.Value,
     Rate,Frodm.RMonCtip.AsString);
//ò”— Ê «÷«›Ì Ê«—Ì“Ì
     Price:=(Frodm.RMonCWage.Value+Frodm.RMonCprice.Value)*Frodm.RMonRate.Value-
     Frodm.RMonPrice.Value;
     If Price < 0.009*Rate Then Price:=0;//2017
     Str:='ò”—Ê «÷«›Â Ê«—Ì“Ì ﬁ»÷ œ—Ì«›  ‘„«—Â'+ Frodm.RMonNo.AsString+' «“'+Frodm.RmonAccNam.AsString;
     NBNo:=AutoBill(State,0,Def_Car_Bes,Price,Str,IntToStr(RNo),BNo,FTip,BDat,
     Frodm.RMonCost.AsString,Frodm.RMonCkod.AsInteger,Price/Rate,
     Rate,DefaultCurr);//Frodm.RMonCtip.AsString);

     If NBNo = BNo Then
      BillUpdate(BNo)
     Else
      If sBill Then
       MakeBill('”‰œ œ—Ì«›  ‰ﬁœÌ '+FCaKod.Text);
     BNo:=NBNo;
     SetBNo(BNo,RNo);
     QuickCloseOpen([6,24,32]);
     Frodm.RMon.Locate('No',RNo,[loCaseInsensitive]);
     If cbPrint.Checked Then BprintClick(Sender);
     DataClear;
     bIns:=False;
     If sFac Then MakeNew;
     FPBill.SetFocus;
end;

procedure TFCashBill.AghBDoClick(Sender: TObject);
Var
NBNo:Integer;
begin
     If Frodm.RMon.State = dsBrowse Then Exit;
     Price:=Frodm.RMonPrice.Value;
     MoFlag:=True;
     If (Price = 0){ or (FAccNam.ItemIndex = -1) }Then//FPBill.Text = ''
     Begin
       ShowMessage('«ÿ·«⁄«  ﬂ«›Ì ‰Ì” ‰œ');
       MoFLag:=False;
       Exit;
     End;
     Frodm.RMon.Post;
     Str:='ﬁ»÷ œ—Ì«›  ‰ﬁœÌ  ‘„«—Â '+FNo.Text;
     BesKod:=AccKod(FAccNam.Text);
     NBNo:=AutoBill(True,BesKod,BehKod,Price,Str,IntToStr(RNo),BNo,FTip,BDat,
     Frodm.RMonCost.AsString,Frodm.RMonCKod.AsInteger,Frodm.RMonCPrice.Value,Rate,
     Frodm.RMonCtip.Value);
     If NBNo = BNo Then BillUpdate(BNo) Else
      If sBill Then MakeBill('”‰œ œ—Ì«›  ‰ﬁœÌ');
     BNo:=NBNo;
     SetBNo(BNo,RNo);
     If cbPrint.Checked Then BprintClick(Sender);
     //Rem:=AcRemain(BehKod,Dat);
     QuickCloseOpen([6,24,32]);
     Frodm.RMon.Locate('No',RNo,[loCaseInsensitive]);
     Frodm.Aghs.Edit;
     Frodm.AghsRNo.Value:=RNo;
     Frodm.AghsPayed.Value:=True;
     Frodm.Aghs.Post;
     QuickCloseOpen([36]);
     FCashBill.Close;
end;

procedure TFCashBill.FPbillKeyPress(Sender: TObject; var Key: Char);
begin
     NextTab(Sender,Key);
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0','-',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;
end;

procedure TFCashBill.BexitClick(Sender: TObject);
begin
     If Frodm.RMon.State =dsEdit Then Exit;
     FNo.SetFocus;
     Check_State(Frodm.RMon,BDoClick);
     If Not MoFLag Then Exit;
     Close;
end;

procedure TFCashBill.BprintClick(Sender: TObject);
begin
     If Not(Frodm.RMon.State = dsBrowse) Then Exit;
     CreatingForm(TqrRMResid,'qrRMResid',qrRMResid);
     Set_Sys_Enviroment;
     qrRMResid.PrinterSettings.Copies:=PrnCnt;
     qrRMResid.qrDesc.Caption:=FarsiPrice(Frodm.RMonPrice.Value);
     qrRMResid.qrCent.Caption:=FCKod.Text;
     qrRMResid.qrCashier.Caption:=FCaKod.Text;
     If cbPrint.Checked Then qrRMResid.Print Else qrRMResid.Preview;
     qrRMResid.Destroy;
end;

procedure TFCashBill.BeditClick(Sender: TObject);
begin
     If Not(Frodm.RMon.State = dsBRowse) Then Exit;
     BNo:=Frodm.RMonBNo.Value;
     If (Frodm.RMonLperm.Value)or(IsBillLocked(BNO)) Then
     Begin
      ShowMessage(sLocked);
      Exit;
     End;
     BDat:=Frodm.RMonDat.Value;
     RNo :=Frodm.RMonNo.Value;
     DelBitem(IntToStr(RNo),BNo,FTip);
     Frodm.RMon.Edit;
     Rate:=Frodm.RMonRate.AsCurrency;
     FPBill.SetFocus;
end;

procedure TFCashBill.BDelClick(Sender: TObject);
begin
     If Not(Frodm.RMon.State = dsBRowse) Then Exit;
     If Frodm.RMonLperm.Value Then
     Begin
      ShowMessage('«„ò«‰  ’ÕÌÕ ‰Ì” ');
      Exit;
     End;
     If MessageDlg('ﬁ»÷ Õ–› ‘Êœø',mtWarning,mbYesNo,0) = idYes Then
     Begin
      BNo:=Frodm.RMonBNo.Value;
      BDat:=Frodm.RMonDat.Value;
      RNo :=Frodm.RMonNo.Value;
      DelBitem(IntToStr(RNo),BNo,FTip);
      BillUpdate(BNo);
      Frodm.RMon.Delete;
      FNo.Text:=IntToStr(Frodm.RMonNo.Value);
      Dat1.Text:=IntToDate(Frodm.RMonDat.Value);
     End;
end;

procedure TFCashBill.FNoKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then FNo_Exit;
     NextTab(Sender,Key);
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;

end;

procedure TFCashBill.BprevClick(Sender: TObject);
begin
     IF Frodm.RMon.State = dsEdit Then Exit;
     IF Frodm.RMon.State = dsInsert Then
     Begin
      FNo.SetFocus;
      Check_State(Frodm.RMon,BDoClick);
      MoFlag:=Frodm.RMon.State =dsBrowse;
      FNo.Text:=IntToStr(Frodm.RMonNo.Value);
      Dat1.Text:=IntToDate(Frodm.RMonDat.Value);
      Exit;
     End;
     MoFlag:=Frodm.RMon.State =dsBrowse;
     If Not MoFLag Then Exit;
     Frodm.RMon.Prior;
     FNo.Text:=IntToStr(Frodm.RMonNo.Value);
     Dat1.Text:=IntToDate(Frodm.RMonDat.Value);
end;

procedure TFCashBill.BnextClick(Sender: TObject);
begin
     IF Frodm.RMon.State = dsEdit Then Exit;
     IF Frodm.RMon.State = dsInsert Then
     Begin
      FNo.SetFocus;
      Check_State(Frodm.RMon,BDoClick);
      MoFlag:=Frodm.RMon.State =dsBrowse;
      FNo.Text:=IntToStr(Frodm.RMonNo.Value);
      Dat1.Text:=IntToDate(Frodm.RMonDat.Value);
      Exit;
     End;
     MoFlag:=Frodm.RMon.State =dsBrowse;
     If Not MoFLag Then Exit;
     Frodm.RMon.Next;
     FNo.Text:=IntToStr(Frodm.RMonNo.Value);
     Dat1.Text:=IntToDate(Frodm.RMonDat.Value);
end;

procedure TFCashBill.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key OF
      VK_F3     : BDoClick(Sender);
      VK_INSERT : MakeNew;
      VK_DELETE :If (Shift = [ssCtrl])and BDel.Enabled Then BDelClick(Sender);
      VK_RETURN :If (Shift = [ssAlt])and BEdit.Enabled Then BEditClick(Sender);
      VK_Left   :If (Shift = [ssAlt])and BPrev.Enabled Then BprevClick(Sender);
      VK_RIGHT  :If (Shift = [ssAlt])and BNext.Enabled Then BnextClick(Sender);
      End;
end;

procedure TFCashBill.Dat1Enter(Sender: TObject);
begin
     If Frodm.RMon.State = dsBrowse Then Dat1.ReadOnly :=True Else
     Begin
        Dat1.ReadOnly :=False;
        GetMaskText(Dat1);
     End;
end;

procedure TFCashBill.Dat1Exit(Sender: TObject);
begin
     If (Frodm.RMon.State = dsBrowse) Then Exit;
     SetMaskText(Dat1);
     If(Not Date_Check(Dat1.Text))And(DateToInt(Dat1.Text)>0) Then Dat1.SetFocus Else
       Frodm.RMonDat.Value :=DateToInt(Dat1.Text);
end;

procedure TFCashBill.FAccNamKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetAccountDbCombo(Sender,Key,'',0);
end;

procedure TFCashBill.FEQEnter(Sender: TObject);
begin
     If (Frodm.RMon.State = dsBrowse)or(Frodm.RMonPrice.Value>0) Then Exit;
     If Frodm.RMonCtip.AsString = DefaultCurr Then
      Rate := 1
     Else
      If Frodm.RMonRate.AsCurrency = 0 Then
       Rate:=GetRateatDate(Frodm.RMonCtip.AsString,Frodm.RMonDat.AsInteger)
      Else
       Rate:=Frodm.RMonRate.AsCurrency;
     Frodm.RMonRate.AsCurrency:=Rate;
     If Frodm.RMonCPrice.Value = 0 Then Exit;
     Frodm.RMonPrice.Value:=(Frodm.RMoncPrice.Value+Frodm.RMonCwage.Value)*Rate;
end;

procedure TFCashBill.FEQExit(Sender: TObject);
begin
     If (Frodm.RMon.State = dsBrowse)or(Frodm.RMonPrice.Value = 0) Then Exit;
     Frodm.RMonCPrice.Value:=(Frodm.RMonPrice.Value / Frodm.RMonRate.Value)-Frodm.RMonCwage.Value;
end;

procedure TFCashBill.FCKodKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetCentLookup(Sender,Key);
end;

procedure TFCashBill.FRateKeyPress(Sender: TObject; var Key: Char);
begin
     NextTab(Sender,Key);
     If Frodm.RMon.State = dsBrowse Then Exit;
     If (Key In ['1','2','3','4','5','6','7','8','9','0']) Then Frodm.RMonPrice.Clear;

end;

end.
