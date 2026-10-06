unit AcountPay;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls, DBCtrls, Mask,Db;

type
  TFAccPayment = class(TForm)
    Label3: TLabel;
    FPbill: TDBEdit;
    Label1: TLabel;
    FBesNam: TDBComboBox;
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
    FCtip: TDBComboBox;
    Label9: TLabel;
    FEQ: TDBEdit;
    DBText1: TDBText;
    Label11: TLabel;
    lCurr: TStaticText;
    FBedNam: TDBComboBox;
    Label14: TLabel;
    FRate: TDBEdit;
    Sb: TStatusBar;
    Label12: TLabel;
    FCkod2: TDBLookupComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BDoClick(Sender: TObject);
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
    procedure FBesNamKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FEQEnter(Sender: TObject);
    procedure FCKodKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FCkod2Enter(Sender: TObject);
  private
    { Private declarations }
    BehKod,BesKod:Real;
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
    Function AutoBill(St:Boolean;Bestan,Bedeh:Real;Price:Currency;Desc,FacNo:string;
             BNo,Btip,Bdat:Integer;Cost:String;CKod,CKod2:Integer;cValue:Currency;
             cRate:Real;Ctip:String):Integer;

  end;

var
  FAccPayment: TFAccPayment;

implementation

uses FrooshDM, Routins, ProVar, AcSearch, AghsEdit, XPListBox,
  CRoutins, QrCtrls, APResid;
Const
FTip = 10;
{$R *.DFM}
Procedure TFAccPayment.NextTab(Sender:TObject;Var Key:Char);
begin
     If Key= #13 Then
     Begin
       Key:=#0;
       SelectNext(Sender As TWinControl,True,True);
     End;
end;

Procedure TFAccPayment.FNo_Exit;
begin
     If Not(Frodm.Acpay.State =dsBrowse) Then
     Begin
       FNo.Text :=IntToStr(Frodm.AcpayNo.Value);
       Exit;
     End;
     RNo:=StrToInt(FNo.Text);
     If Not(Frodm.Acpay.Locate('No',RNo,[loCaseInsensitive])) Then MakeNew;
     Dat1.Text:=IntToDate(Frodm.AcpayDat.Value);
end;

Procedure TFAccPayment.MakeNew;
begin
     If Not(Frodm.Acpay.State=dsBrowse) Then Exit;
     Frodm.Acpay.Append;
     Frodm.AcpayNo.Value:=MaxNo+1;
     FNo.Text:=IntToStr(Frodm.AcpayNo.Value);
     Frodm.AcpayDat.Value:=FarDate;
     Frodm.AcpayCtip.Value:=DefaultCurr;
     Frodm.AcpayLperm.Value:=False;
     BDat:=Frodm.AcpayDat.Value;
     Dat1.Text:=IntToDate(Frodm.AcpayDat.Value);
     BNo:=0;
     RNo:=Frodm.AcpayNo.Value;
     MoFlag:=True;
end;

Function TFAccPayment.MaxNo;
begin
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Max(R.No) From AccountPay R ');
     Qu.Open;
     Result:=Qu.Fields[0].AsInteger;
     Qu.Close;
end;

Procedure TFAccPayment.SetBNo(BNo,No:Integer);
begin
     If BNo=0 Then Exit;
     If Frodm.Acpay.Locate('No',No,[locaseInsensitive]) Then
     Begin
      Frodm.Acpay.Edit;
      Frodm.AcpayBno.Value:=BNo;
      Frodm.Acpay.Post;
     End;
end;

Procedure TFAccPayment.DataClear;
begin
     Sb.Panels[0].Text :=FPBill.Text;
     Sb.Panels[1].Text :=FBesNam.Text;
     Sb.Panels[2].Text :=CurrToFar(Rem);//' ÏÑíÇÝÊ äÞÏí ÇÒ ÍÓÇÈ '+FBesNam.Text;
     BNo:=0;
     RNo:=0;
     BDat:=0;
     Str:='';
end;

Function TFAccPayment.AutoBill(St:Boolean;Bestan,Bedeh:Real;Price:Currency;Desc,FacNo:string;
             BNo,Btip,Bdat:Integer;Cost:String;CKod,CKod2:Integer;cValue:Currency;
             cRate:Real;Ctip:String):Integer;
Begin
     If (BNo = 0)and sBill Then BNo:=LastBillNo+1;
     If Bdat = 0 Then BDat:=Fardate;
     If St Then
     Begin
      BedBill(Price,Bedeh,Desc,FacNo,BNo,Btip,Bdat,Cost,Ckod2,cValue,cRate,Ctip);
      BesBill(Price,Bestan,Desc,FacNo,BNo,Btip,Bdat,Cost,Ckod,cValue,cRate,Ctip);
     End;
     Result:=BNo;
End;

procedure TFAccPayment.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     Frodm.Acpay.Open;
     FCost.Items.Assign(CostList);
     FBesNam.Items.Assign(AcList);
     FBedNam.Items.Assign(AcList);
     FCtip.Items.Assign(CurrList);
     lCurr.Caption:=DefaultCurr;
     Frodm.Acpay.Last;
     FNo.Text:=IntToStr(Frodm.AcpayNo.Value);
     Dat1.Text:=IntToDate(Frodm.AcpayDat.Value);
     MoFlag:=True;
     //MakeNew;
end;

procedure TFAccPayment.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
     IF Frodm.Acpay.State = dsInsert Then Check_State(Frodm.Acpay,BDoClick);
     MoFlag:=Frodm.Acpay.State = dsBRowse;
     If (Frodm.Acpay.State = dsEdit) Or Not MoFlag Then Action :=caNone;
end;

procedure TFAccPayment.BDoClick(Sender: TObject);
Var
NBNo:Integer;
begin
     If Frodm.Acpay.State = dsBrowse Then Exit;
     Price:=Frodm.AcpayPrice.Value;
     MoFlag:=True;
     If (Price = 0) or (FBesNam.ItemIndex = -1) or (FBedNam.ItemIndex = -1)Then//FPBill.Text = ''
     Begin
       ShowMessage('ÇØáÇÚÇÊ ßÇÝí äíÓÊäÏ');
       MoFLag:=False;
       Exit;
     End;
     FNo.SetFocus;
     Frodm.AcpayLperm.Value:=sPerm;
     Frodm.Acpay.Post;
     BDat:=Frodm.AcpayDat.Value;
     Str:=' ËÈÊ ÑæÒäÇãå'+FNo.Text+' ÈÔÑÍ '+FDesc.Text;
     BesKod:=AccKod(FBesNam.Text);
     BehKod:=AccKod(FBedNam.Text);
     NBNo:=AutoBill(True,BesKod,BehKod,Price,Str,IntToStr(RNo),BNo,FTip,BDat,
     Frodm.AcpayCost.AsString,Frodm.AcpayCKod.AsInteger,Frodm.AcpayCKod2.AsInteger,
     Frodm.AcpayCprice.Value,Rate,Frodm.AcpayCtip.AsString);
     If NBNo = BNo Then BillUpdate(BNo) Else
      If sBill Then MakeBill('ÓäÏ ÇäÊÞÇáí Èíä ÍÓÇÈåÇ');
     BNo:=NBNo;
     SetBNo(BNo,RNo);

     If cbPrint.Checked Then BprintClick(Sender);
     QuickCloseOpen([6,24,68]);
     Frodm.Acpay.Locate('No',RNo,[loCaseInsensitive]);
     DataClear;
     //If sFac Then MakeNew;
     FPBill.SetFocus;
end;

procedure TFAccPayment.FPbillKeyPress(Sender: TObject; var Key: Char);
begin
     NextTab(Sender,Key);
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0','-',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;
end;

procedure TFAccPayment.BexitClick(Sender: TObject);
begin
     If Frodm.Acpay.State =dsEdit Then Exit;
     FNo.SetFocus;
     Check_State(Frodm.Acpay,BDoClick);
     If Not MoFLag Then Exit;
     Close;
end;

procedure TFAccPayment.BprintClick(Sender: TObject);
Var
I:Integer;
begin
     If Not(Frodm.Acpay.State = dsBrowse) Then Exit;
     CreatingForm(TqrAPResid,'qrAPResid',qrAPResid);
     Set_Sys_Enviroment;
     //qrAPResid.PrinterSettings.Copies:=PrnCnt;
     qrAPResid.qrDesc.Caption:=FarsiPrice(Frodm.AcpayPrice.Value);// FDesc.Text;
     qrAPResid.qrCent.Caption:=FCKod.Text;
     qrAPResid.qrCent2.Caption:=FCKod2.Text;
     qrAPResid.qrDCurr.Caption:=DefaultCurr;
     If cbPrint.Checked Then qrAPResid.Print Else qrAPResid.Preview;
     qrAPResid.Destroy;
end;
procedure TFAccPayment.BeditClick(Sender: TObject);
begin
     If Not(Frodm.Acpay.State = dsBRowse) Then Exit;
     BNo:=Frodm.AcpayBNo.Value;
     If (Frodm.AcpayLperm.Value)or(IsBillLocked(BNO)) Then
     Begin
      ShowMessage(sLocked);
      Exit;
     End;
     BDat:=Frodm.AcpayDat.Value;
     RNo :=Frodm.AcpayNo.Value;
     FBesNam.ItemIndex:=FBesNam.Items.IndexOf(FBesNam.Text);
     FBedNam.ItemIndex:=FBedNam.Items.IndexOf(FBedNam.Text);
     DelBitem(IntToStr(RNo),BNo,FTip);
     Frodm.Acpay.Edit;
     FPBill.SetFocus;
end;

procedure TFAccPayment.BDelClick(Sender: TObject);
begin
     If Not(Frodm.Acpay.State = dsBRowse) Then Exit;
     If Frodm.AcpayLperm.Value Then
     Begin
      ShowMessage('Çã˜Çä ÊÕÍíÍ äíÓÊ');
      Exit;
     End;
     If MessageDlg('ÞÈÖ ÍÐÝ ÔæÏ¿',mtWarning,mbYesNo,0) = idYes Then
     Begin
      BNo:=Frodm.AcpayBNo.Value;
      BDat:=Frodm.AcpayDat.Value;
      RNo :=Frodm.AcpayNo.Value;
      DelBitem(IntToStr(RNo),BNo,FTip);
      BillUpdate(BNo);
      Frodm.Acpay.Delete;
      FNo.Text:=IntToStr(Frodm.AcpayNo.Value);
      Dat1.Text:=IntToDate(Frodm.AcpayDat.Value);
     End;
end;

procedure TFAccPayment.FNoKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then FNo_Exit;
     NextTab(Sender,Key);
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;

end;

procedure TFAccPayment.BprevClick(Sender: TObject);
begin
     IF Frodm.Acpay.State = dsEdit Then Exit;
     IF Frodm.Acpay.State = dsInsert Then
     Begin
      FNo.SetFocus;
      Check_State(Frodm.Acpay,BDoClick);
      MoFlag:=Frodm.Acpay.State =dsBrowse;
      FNo.Text:=IntToStr(Frodm.AcpayNo.Value);
      Dat1.Text:=IntToDate(Frodm.AcpayDat.Value);
      Exit;
     End;
     MoFlag:=Frodm.Acpay.State =dsBrowse;
     If Not MoFLag Then Exit;
     Frodm.Acpay.Prior;
     FNo.Text:=IntToStr(Frodm.AcpayNo.Value);
     Dat1.Text:=IntToDate(Frodm.AcpayDat.Value);
end;

procedure TFAccPayment.BnextClick(Sender: TObject);
begin
     IF Frodm.Acpay.State = dsEdit Then Exit;
     IF Frodm.Acpay.State = dsInsert Then
     Begin
      FNo.SetFocus;
      Check_State(Frodm.Acpay,BDoClick);
      MoFlag:=Frodm.Acpay.State =dsBrowse;
      FNo.Text:=IntToStr(Frodm.AcpayNo.Value);
      Dat1.Text:=IntToDate(Frodm.AcpayDat.Value);
      Exit;
     End;
     MoFlag:=Frodm.Acpay.State =dsBrowse;
     If Not MoFLag Then Exit;
     Frodm.Acpay.Next;
     FNo.Text:=IntToStr(Frodm.AcpayNo.Value);
     Dat1.Text:=IntToDate(Frodm.AcpayDat.Value);
end;

procedure TFAccPayment.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key Of
      VK_F3 :BDoClick(Sender);
      VK_INSERT :MakeNew;
      VK_DELETE :If (Shift = [ssCtrl])and BDel.Enabled Then BDelClick(Sender);
      VK_RETURN :If (Shift = [ssAlt])and BEdit.Enabled Then BEditClick(Sender);
      VK_Left   :If (Shift = [ssAlt])and BPrev.Enabled Then BprevClick(Sender);
      VK_RIGHT  :If (Shift = [ssAlt])and BNext.Enabled Then BnextClick(Sender);
     End;
end;

procedure TFAccPayment.Dat1Enter(Sender: TObject);
begin
     If Frodm.Acpay.State = dsBrowse Then Dat1.ReadOnly :=True Else
     Begin
        Dat1.ReadOnly :=False;
        GetMaskText(Dat1);
     End;
end;

procedure TFAccPayment.Dat1Exit(Sender: TObject);
begin
     If (Frodm.Acpay.State = dsBrowse) Then Exit;
     SetMaskText(Dat1);
     If(Not Date_Check(Dat1.Text))And(DateToInt(Dat1.Text)>0) Then Dat1.SetFocus Else
       Frodm.AcpayDat.Value :=DateToInt(Dat1.Text);
end;

procedure TFAccPayment.FBesNamKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetAccountDbCombo(Sender,Key,'',0);
end;

procedure TFAccPayment.FEQEnter(Sender: TObject);
begin
     If (Frodm.Acpay.State = dsBrowse) Then Exit;
     If Frodm.AcpayCtip.AsString = DefaultCurr Then
      Rate := 1
     Else
      If Frodm.AcpayRate.AsCurrency = 0 Then
       Rate:=GetRateatDate(Frodm.AcpayCtip.AsString,Frodm.AcpayDat.AsInteger)
      Else
       Rate:=Frodm.AcpayRate.AsCurrency;
     Frodm.AcpayPrice.Value:=Frodm.AcpaycPrice.Value*Rate;
     Frodm.AcpayRate.Value:=Rate;
end;

procedure TFAccPayment.FCKodKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetCentLookup(Sender,Key);
end;

procedure TFAccPayment.FCkod2Enter(Sender: TObject);
begin
     If Frodm.Acpay.State = dsBrowse then Exit;
     If Frodm.AcpayCKod2.IsNull Then Frodm.AcpayCKod2.Value:=Frodm.AcpayCKod.Value;
end;

end.
