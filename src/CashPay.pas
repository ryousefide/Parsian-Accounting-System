unit CashPay;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls, DBCtrls, Mask, Db, DBTables;

type
  TFCashPay = class(TForm)
    Label3: TLabel;
    FPbill: TDBEdit;
    Label1: TLabel;
    FAccNam: TDBLookupComboBox;
    BDo: TButton;
    Bexit: TButton;
    Bevel1: TBevel;
    Label4: TLabel;
    FDesc: TDBEdit;
    Bevel2: TBevel;
    cbPrint: TCheckBox;
    Label5: TLabel;
    FNo: TEdit;
    Label6: TLabel;
    Bedit: TButton;
    Bprev: TButton;
    Bnext: TButton;
    Bprint: TButton;
    BDel: TButton;
    Dat1: TMaskEdit;
    FacNo: TDBEdit;
    Label10: TLabel;
    Label2: TLabel;
    Label7: TLabel;
    FCost: TDBComboBox;
    FCKod: TDBLookupComboBox;
    Label8: TLabel;
    Label9: TLabel;
    FCtip: TDBLookupComboBox;
    FEQ: TDBEdit;
    lCurr: TStaticText;
    Label11: TLabel;
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
    Procedure NextTab(Sender:TObject;Var Key:Char);
    procedure FPbillKeyPress(Sender: TObject; var Key: Char);
    procedure BexitClick(Sender: TObject);
    procedure BprintClick(Sender: TObject);
    procedure FAccNamDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure FAccNamDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure BprevClick(Sender: TObject);
    procedure BnextClick(Sender: TObject);
    procedure BeditClick(Sender: TObject);
    procedure BDelClick(Sender: TObject);
    procedure FNoKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Dat1Enter(Sender: TObject);
    procedure Dat1Exit(Sender: TObject);
    procedure FAccNamKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FCKodKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FEQEnter(Sender: TObject);
    procedure FRateKeyPress(Sender: TObject; var Key: Char);
    procedure FEQExit(Sender: TObject);

  private
    { Private declarations }
    BehKod,BesKod:Real;
    State:Boolean;
    Price,Rem:Currency;
    Dat:Integer;
    Str:String;
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
  FCashPay: TFCashPay;

implementation

uses FrooshDM, Routins, ProVar, QrCtrls, AcSearch, RMResid, XPListBox,
  CRoutins, PMResid;
Const
FTip = 6;
{$R *.DFM}
Procedure TFCashPay.NextTab(Sender:TObject;Var Key:Char);
begin
     If Key= #13 Then
     Begin
       Key:=#0;
       SelectNext(Sender As TWinControl,True,True);
     End;
end;
Procedure TFCashPay.FNo_Exit;
begin
     If Not(Frodm.PMon.State =dsBrowse) Then
     Begin
       FNo.Text :=IntToStr(Frodm.PMonNo.Value);
       Exit;
     End;
     RNo:=StrToInt(FNo.Text);
     If Not(Frodm.PMon.Locate('No',RNo,[loCaseInsensitive])) Then MakeNew;
     Dat1.Text:=IntToDate(Frodm.PMonDat.Value);
end;

Procedure TFCashPay.MakeNew;
begin
     If Not(Frodm.PMon.State=dsBrowse) Then Exit;
     Frodm.PMon.Append;
     Frodm.PMonNo.Value:=MaxNo+1;
     FNo.Text:=IntToStr(Frodm.PMonNo.Value);
     Frodm.PMonDat.Value:=FarDate;
     Frodm.PMonCtip.Value:=DefaultCurr;
     Frodm.PMonLperm.Value:=False;
     BDat:=Frodm.PMonDat.Value;
     Dat1.Text:=IntToDate(Frodm.PMonDat.Value);
     BNo:=0;
     RNo:=Frodm.PMonNo.Value;
     MoFlag:=True;
end;

Function TFCashPay.MaxNo;
begin
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Max(R.No) From PMon R ');
     Qu.Open;
     Result:=Qu.Fields[0].AsInteger;
     Qu.Close;
end;

Procedure TFCashPay.SetBNo(BNo,No:Integer);
begin
     If BNo=0 Then Exit;
     If Frodm.Pmon.Locate('No',No,[locaseInsensitive]) Then
     Begin
      Frodm.PMon.Edit;
      Frodm.PMonBno.Value:=BNo;
      Frodm.PMon.Post;
     End;
end;


Procedure TFCashPay.DataClear;
begin
     Str:='';
     BNo:=0;
     RNo:=0;
     BDat:=0;
end;

procedure TFCashPay.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     MoFlag:=True;
     FCost.Items.Assign(CostList);
     AcQu.DatabaseName:=CurrDb;
     AcQu.Open;
     Frodm.PMon.Open;
     Frodm.Cashier.Open;
     Frodm.Cashier.Filter:=CUser.CashFilter;
     Frodm.Cashier.Filtered:=True;
     //FAccNam.Items.Assign(AcList);
     //FCtip.Items.Assign(CurrList);
     FCtip.ListField:=CUser.CurrField;
     FCKod.ListField:=CUser.CentField;
     FCakod.ListField:=CUser.CashierField;
     FAccnam.ListField:=CUser.AcField;
     lCurr.Caption:=DefaultCurr;
     Frodm.PMon.Last;
     FNo.Text:=IntToStr(Frodm.PMonNo.Value);
     Dat1.Text:=IntToDate(Frodm.PMonDat.Value);
     If sFac Then MakeNew;
end;

procedure TFCashPay.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     FNo.SetFocus;
     Action:=caFree;
     IF Frodm.PMon.State = dsInsert Then Check_State(Frodm.PMon,BDoClick);
     MoFlag:=Frodm.PMon.State = dsBRowse;
     If (Frodm.PMon.State = dsEdit) Or Not MoFlag Then Action :=caNone;
     If Action=caFree Then
     Begin
      Frodm.Cashier.Close;
      Frodm.PMon.Close;
     End;
end;

procedure TFCashPay.BDoClick(Sender: TObject);
Var
NBNo:Integer;
AtfQu:TQuery;
NewNo:Integer;
bIns:Boolean;
fDif,CPrice:Currency;
begin
     If Frodm.PMon.State = dsBrowse Then Exit;
     MoFlag:=True;
     If ((Price = 0)and (Frodm.PMonCprice.Value=0)) or (FAccNam.KeyValue ='') Then
     Begin
       ShowMessage('«ÿ·«⁄«  ﬂ«›Ì ‰Ì” ‰œ');
       MoFlag:=False;
       Exit;
     End;
     fDif:=Frodm.PMonPrice.Value-(Frodm.PMonCPrice.Value+Frodm.PMonCwage.Value)*Frodm.PMonRate.Value;
     If Abs(fDif) > Frodm.PMonRate.Value Then
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
     AtfQu.SQL.Add('Set Transaction Isolation Level Serializable');      //commit transaction   With (TabLockX)
     AtfQu.SQL.Add('begin Transaction Select Max(A.No) From PMon A  ');
     If Frodm.PMon.State=dsInsert Then
     Begin
      AtfQu.Open;
      bIns:=True;
      RNo:=AtfQu.Fields[0].AsInteger+1;
     End;
//---------------------------
     Frodm.PMonNo.Value:=RNo;
     Frodm.PMonLperm.Value:=sPerm;
     FNo.Text:=Frodm.PMonNo.AsString;
     Frodm.PMon.Post;
     If bIns Then
     Begin
      AtfQu.Close;
      AtfQU.SQL.Clear;
      AtfQU.SQL.Add('commit transaction');
      AtfQu.ExecSQL;
     End;
     BDat:=Frodm.PMonDat.Value;
     Str:='ﬁ»÷ Å—œ«Œ  '+FNo.Text+' '+FDesc.Text;
     State:=sABill;
//»—œ«‘  «“ Õ”«»
     BesKod:=AccKod(FAccNam.Text);
     BehKod:=Frodm.PMonCakod.Value;
     Price:=Frodm.PMonPrice.Value;
     NBNo:=AutoBill(State,BehKod,0,Price,Str,IntToStr(RNo),BNo,FTip,BDat,
     Frodm.PMonCost.AsString,Frodm.PMonCKod.AsInteger,Frodm.PMonCprice.Value+Frodm.PMonCwage.Value,
     Rate,Frodm.PMonCtip.AsString);
//»œÂò«—Ì „‘ —Ì
     If Frodm.CashierCtip.Value <> DefaultCurr Then
     Begin
      Price:=Frodm.PMonPrice.Value-Frodm.PMonCwage.Value*Frodm.PMonRate.Value;
      CPrice:=Frodm.PMonCprice.Value;
     End Else
     Begin
      Price:=Frodm.PMonPrice.Value;
      CPrice:=Frodm.PMonCprice.Value+Frodm.PMonCWage.Value;
     End;
     NBNo:=AutoBill(State,0,BesKod,Price,Str,IntToStr(RNo),BNo,FTip,BDat,
      Frodm.PMonCost.AsString,Frodm.PMonCKod.AsInteger,CPrice,Rate,Frodm.PMonCtip.AsString);
//ò«—„“œ ÕÊ«·Â
     If Frodm.CashierCtip.Value = DefaultCurr Then
      BesKod:=AccKod(FAccNam.Text)
     Else
      BesKod:=0;
     Str:='ò«—„“œ «—”«· ÊÃÊÂ«  «—“Ì ﬁ»÷ Å—œ«Œ  ‘„«—Â '+Frodm.PMonNo.AsString;
     Price:=Frodm.PMonCwage.Value*Frodm.PMonRate.Value;
     NBNo:=AutoBill(State,BesKod,Def_Car_Bes,Price,Str,IntToStr(RNo),BNo,FTip,BDat,
     Frodm.PMonCost.AsString,Frodm.PMonCKod.AsInteger,Frodm.PMonCWage.Value,
     Rate,Frodm.PMonCtip.AsString);
//ò”— Ê «÷«›Ì Ê«—Ì“Ì
       BesKod:=Def_Car_Bes;
       Price:=Frodm.PMonPrice.Value-(Frodm.PMonCWage.Value+Frodm.PMonCprice.Value)*Frodm.PMonRate.Value;
       If Price < 0.009*Rate Then Price:=0;//2017
       Str:='ò”—Ê «÷«›Â Ê«—Ì“Ì ﬁ»÷ Å—œ«Œ  ‘„«—Â'+ Frodm.PMonNo.AsString+' «“'+Frodm.PMonAccNam.AsString;
       NBNo:=AutoBill(State,0,Beskod,Price,Str,IntToStr(RNo),BNo,FTip,BDat,
       Frodm.PMonCost.AsString,Frodm.PMonCkod.AsInteger,Price/Rate,
       Rate,DefaultCurr);//Frodm.PMonCtip.AsString);


     If NBNo = BNo Then BillUpdate(BNo) Else
      If sBill Then MakeBill('”‰œ Å—œ«Œ  ‰ﬁœÌ  '+FCaKod.Text);
     BNo:=NBNo;
     SetBNo(BNo,RNo);
     QuickCloseOpen([6,24,33]);
     Frodm.PMon.Locate('No',RNo,[loCaseInsensitive]);
     If cbPrint.Checked Then BprintClick(Sender);
     DataClear;
     bIns:=False;
     If sFac Then MakeNew;
     FPBill.SetFocus;
end;

procedure TFCashPay.FPbillKeyPress(Sender: TObject; var Key: Char);
begin
     NextTab(Sender,Key);
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0','-',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;
end;

procedure TFCashPay.BexitClick(Sender: TObject);
begin
     If Frodm.PMon.State =dsEdit Then Exit;
     FNo.SetFocus;
     Check_State(Frodm.PMon,BDoClick);
     If Not MoFLag Then Exit;
     FCashPay.Close;
end;

procedure TFCashPay.BprintClick(Sender: TObject);
Var
I:Integer;
begin
     If Not(Frodm.PMon.State = dsBrowse) Then Exit;
     CreatingForm(TqrPMResid,'qrPMResid',qrPMResid);
     Set_Sys_Enviroment;
     qrPMResid.PrinterSettings.Copies:=PrnCnt;
     qrPMResid.qrDesc.Caption:=FarsiPrice(Frodm.PMonPrice.Value);// FDesc.Text;
     qrPMResid.qrCent.Caption:=FCKod.Text;
     qrPMResid.qrCashier.Caption:=FCaKod.Text;
     If cbPrint.Checked Then qrPMResid.Print Else qrPMResid.Preview;
     qrPMResid.Destroy;
end;

procedure TFCashPay.FAccNamDragDrop(Sender, Source: TObject; X,
  Y: Integer);
Var
List:TXPListBox;
begin
{     If (Source Is TXPListBox) Then
     Begin
       List:=(Source As TXPListBox);
       FAccNam.Text:=List.Items.Strings[List.ItemIndex];
       FAcSearch.Close;
       FAccNam.ItemIndex:=FAccNam.Items.IndexOf(FAccNam.Text);
       FAccnam.Field.AsString:=FAccNam.Text;
       FAccNam.SetFocus;
     End;    }
end;

procedure TFCashPay.FAccNamDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
     Accept:=(Source Is TXPListBox) And ((Source As TXPListBox).Name = 'lbName');
     Accept:=Accept and Not(Frodm.PMon.State =dsBrowse);
end;

procedure TFCashPay.BprevClick(Sender: TObject);
begin
     IF Frodm.PMon.State = dsEdit Then Exit;
     IF Frodm.PMon.State = dsInsert Then
     Begin
      FNo.SetFocus;
      Check_State(Frodm.PMon,BDoClick);
      MoFlag:=Frodm.PMon.State =dsBrowse;
      FNo.Text:=IntToStr(Frodm.PMonNo.Value);
      Dat1.Text:=IntToDate(Frodm.PMonDat.Value);
      Exit;
     End;
     MoFlag:=Frodm.PMon.State =dsBrowse;
     If Not MoFLag Then Exit;
     Frodm.PMon.Prior;
     FNo.Text:=IntToStr(Frodm.PMonNo.Value);
     Dat1.Text:=IntToDate(Frodm.PMonDat.Value);
end;

procedure TFCashPay.BnextClick(Sender: TObject);
begin
     IF Frodm.PMon.State = dsEdit Then Exit;
     IF Frodm.PMon.State = dsInsert Then
     Begin
      FNo.SetFocus;
      Check_State(Frodm.PMon,BDoClick);
      MoFlag:=Frodm.PMon.State =dsBrowse;
      FNo.Text:=IntToStr(Frodm.PMonNo.Value);
      Dat1.Text:=IntToDate(Frodm.PMonDat.Value);
      Exit;
     End;
     MoFlag:=Frodm.PMon.State =dsBrowse;
     If Not MoFLag Then Exit;
     Frodm.PMon.Next;
     FNo.Text:=IntToStr(Frodm.PMonNo.Value);
     Dat1.Text:=IntToDate(Frodm.PMonDat.Value);
end;

procedure TFCashPay.BeditClick(Sender: TObject);
begin
     If Not(Frodm.PMon.State = dsBRowse) Then Exit;
     BNo:=Frodm.PMonBNo.Value;
     If (Frodm.PMonLperm.Value)or(IsBillLocked(BNO)) Then
     Begin
      ShowMessage(sLocked);
      Exit;
     End;
     BDat:=Frodm.PMonDat.Value;
     RNo :=Frodm.PMonNo.Value;
     DelBitem(IntToStr(RNo),BNo,FTip);
     Frodm.PMon.Edit;
     Rate:=Frodm.PMonRate.AsCurrency;
     FPBill.SetFocus;
end;

procedure TFCashPay.BDelClick(Sender: TObject);
begin
     If Not(Frodm.PMon.State = dsBRowse) Then Exit;
     If Frodm.PMonLperm.Value Then
     Begin
      ShowMessage('«„ò«‰  ’ÕÌÕ ‰Ì” ');
      Exit;
     End;
     If MessageDlg('ﬁ»÷ Õ–› ‘Êœø',mtWarning,mbYesNo,0) = idYes Then
     Begin
      BNo:=Frodm.PMonBNo.Value;
      BDat:=Frodm.PMonDat.Value;
      RNo :=Frodm.PMonNo.Value;
      DelBitem(IntToStr(RNo),BNo,FTip);
      BillUpdate(BNo);
      Frodm.PMon.Delete;
      FNo.Text:=IntToStr(Frodm.PMonNo.Value);
      Dat1.Text:=IntToDate(Frodm.PMonDat.Value);
     End;
end;

procedure TFCashPay.FNoKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then FNo_Exit;
     NextTab(Sender,Key);
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;
end;

procedure TFCashPay.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key OF
      VK_F3     : BDoClick(Sender);
      VK_INSERT :MakeNew;
      VK_DELETE :If (Shift = [ssCtrl])and BDel.Enabled Then BDelClick(Sender);
      VK_RETURN :If (Shift = [ssAlt])and BEdit.Enabled Then BEditClick(Sender);
      VK_Left   :If (Shift = [ssAlt])and BPrev.Enabled Then BprevClick(Sender);
      VK_RIGHT  :If (Shift = [ssAlt])and BNext.Enabled Then BnextClick(Sender);
      End;
end;

procedure TFCashPay.Dat1Enter(Sender: TObject);
begin
     If Frodm.PMon.State = dsBrowse Then Dat1.ReadOnly :=True Else
     Begin
        Dat1.ReadOnly :=False;
        GetMaskText(Dat1);
     End;
end;

procedure TFCashPay.Dat1Exit(Sender: TObject);
begin
     If (Frodm.PMon.State = dsBrowse) Then Exit;
     SetMaskText(Dat1);
     If(Not Date_Check(Dat1.Text))And(DateToInt(Dat1.Text)>0) Then Dat1.SetFocus Else
       Frodm.PMonDat.Value :=DateToInt(Dat1.Text);
end;


procedure TFCashPay.FAccNamKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetAccountDbCombo(Sender,Key,'',0);
end;

procedure TFCashPay.FCKodKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetCentLookup(Sender,Key);
end;

procedure TFCashPay.FEQEnter(Sender: TObject);
begin
     If (Frodm.PMon.State = dsBrowse)or(Frodm.PMonPrice.Value>0) Then Exit;
     If Frodm.PMonCtip.AsString = DefaultCurr Then
      Rate := 1
     Else
      If Frodm.PMonRate.AsCurrency = 0 Then
       Rate:=GetRateatDate(Frodm.PMonCtip.AsString,Frodm.PMonDat.AsInteger)
      Else
       Rate:=Frodm.PMonRate.AsCurrency;
     Frodm.PMonRate.AsCurrency:=Rate;
     If Frodm.PMonCPrice.Value = 0 Then Exit;
     Frodm.PMonPrice.Value:=(Frodm.PMoncPrice.Value+Frodm.PMonCwage.Value)*Rate;
end;

procedure TFCashPay.FEQExit(Sender: TObject);
begin
     If (Frodm.PMon.State = dsBrowse)or(Frodm.PMonPrice.Value = 0) Then Exit;
     Frodm.PMonCPrice.Value:=(Frodm.PMonPrice.Value / Frodm.PMonRate.Value)-Frodm.PMonCwage.Value;
end;

procedure TFCashPay.FRateKeyPress(Sender: TObject; var Key: Char);
begin
     NextTab(Sender,Key);
     If Frodm.PMon.State = dsBrowse Then Exit;
     If (Key In ['1','2','3','4','5','6','7','8','9','0']) Then Frodm.PMonPrice.Clear;
end;

end.
