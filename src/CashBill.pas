unit CashBill;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ExtCtrls, DBCtrls, ComCtrls, Buttons;

type
  TFCash = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    FNo: TEdit;
    Label3: TLabel;
    FPbill: TDBEdit;
    BDo: TButton;
    Bexit: TButton;
    Label4: TLabel;
    FDesc: TDBEdit;
    Bevel1: TBevel;
    JariKod: TDBComboBox;
    Label6: TLabel;
    lbFar: TLabel;
    Bevel2: TBevel;
    Label8: TLabel;
    Label9: TLabel;
    FAccNam: TDBComboBox;
    Label10: TLabel;
    Bprev: TButton;
    Bnext: TButton;
    Bedit: TButton;
    Bdel: TButton;
    Dat1: TMaskEdit;
    FacNo: TDBEdit;
    Label7: TLabel;
    Label5: TLabel;
    Label11: TLabel;
    FCost: TDBComboBox;
    FCKod: TDBLookupComboBox;
    Label12: TLabel;
    Label13: TLabel;
    FCtip: TDBLookupComboBox;
    FEQ: TDBEdit;
    lCurr: TStaticText;
    Label14: TLabel;
    FRate: TDBEdit;
    Label15: TLabel;
    FCw: TDBEdit;
    Sb: TStatusBar;
    Bprint: TButton;
    cbPrint: TCheckBox;
    procedure BDoClick(Sender: TObject);
    procedure BexitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    Procedure NextTab(Sender:TObject;Var Key:Char);
    procedure BprevClick(Sender: TObject);
    procedure BnextClick(Sender: TObject);
    procedure BeditClick(Sender: TObject);
    procedure BdelClick(Sender: TObject);
    procedure FPbillChange(Sender: TObject);
    procedure FNoKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Dat1Enter(Sender: TObject);
    procedure Dat1Exit(Sender: TObject);
    procedure FAccNamDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure FAccNamDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure FAccNamKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FCKodKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FEQEnter(Sender: TObject);
    procedure BprintClick(Sender: TObject);
    procedure JariKodDropDown(Sender: TObject);
    procedure FRateKeyPress(Sender: TObject; var Key: Char);
    procedure FEQExit(Sender: TObject);
  private
    { Private declarations }
    RNo:Integer;
    BNo:Integer;
    BDat:Integer;
    OPrice:Currency;
    CPrice:Currency;
    MoFlag:Boolean;
    Rate:Currency;
    Procedure SetBNo(BNo,No:Integer);
    Function MaxNo:Integer;
    Procedure FNo_Exit;
    Procedure MakeNew;
    Procedure DeleteFromJari(Jari_Name,J_Date,Serial,JAmount:String);
  public
    { Public declarations }
  end;

var
  FCash: TFCash;

implementation

uses DbTables,Db, FrooshDM, Routins, ProVar, Converts, AcSearch, XPListBox,
  CRoutins, NFResid;
Const
FTip = 13;
{$R *.DFM}
Procedure TFCash.NextTab(Sender:TObject;Var Key:Char);
begin
     If Key =#13 Then
     Begin
        Key:=#0;
        SelectNext(Sender As TWinControl,True,True);
     End;
end;

Function TFCash.MaxNo:Integer;
begin
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Max(R.No) From NFish R ');
     Qu.Open;
     Result:=Qu.Fields[0].AsInteger;
     Qu.Close;
end;

Procedure TFCash.FNo_Exit;
begin
     If Not(Frodm.NFish.State =dsBrowse) Then
     Begin
       FNo.Text :=IntToStr(Frodm.NFishNo.Value);
       Exit;
     End;
     RNo:=StrToInt(FNo.Text);
     If Not(Frodm.NFish.Locate('No',RNo,[loCaseInsensitive])) Then MakeNew;
     Dat1.Text:=IntToDate(Frodm.NFishDat.Value);
end;

Procedure TFCash.MakeNew;
begin
     If Not(Frodm.NFish.State=dsBrowse) Then Exit;
     Frodm.NFish.Append;
     Frodm.NFishNo.Value:=MaxNo+1;
     Frodm.NFishDat.Value:=Fardate;
     Frodm.NFishCtip.Value:=DefaultCurr;
     Frodm.NFishLperm.Value:=False;
     BNo:=0;
     BDat:=Frodm.NFishDat.Value;
     Dat1.Text:=IntToDate(Frodm.NFishDat.Value);
     MoFlag:=True;
end;

Procedure TFCash.SetBNo(BNo,No:Integer);
begin
     If BNo =0 Then Exit;
     If Frodm.NFish.Locate('No',No,[loCaseInsensitive]) Then
     Begin
      Frodm.NFish.Edit;
      Frodm.NFishBNo.Value:=BNo;
      Frodm.NFish.Post;
     End;
end;

Procedure TFCash.DeleteFromJari(Jari_Name,J_Date,Serial,JAmount:String);
Var
Table:TTable;
begin
     Table:=TTable.Create(Self);
     Table.Tag:=2;
     Table.DatabaseName :=CurrDb;
     Table.TableName :='dbo.Jari'+JariKod.Text;
     Table.Open;
     Table.Filter:='Dat = '+J_Date+' and Serial ='+Serial+
       ' and Bestan = '+JAmount;
     Table.Filtered:=True;
     Table.Delete;
end;

procedure TFCash.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
     IF Frodm.NFish.State = dsInsert Then Check_State(Frodm.NFish,BDoClick);
     MoFlag:=Frodm.NFish.State = dsBRowse;
     If (Frodm.NFish.State = dsEdit) Or Not MoFlag Then Action :=caNone;
     If Action=caFree Then Frodm.NFish.Close;
end;

procedure TFCash.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     Frodm.NFish.Open;
     lbFar.Font:=FFont;
     Label6.Font:=FFont;
     Fill_Comb(Frodm.JariNam,'Nam',JariKod.Items);
     FAccNam.Items.Assign(AcList);
     FCost.Items.Assign(CostList);
     //FCtip.Items.Assign(CUser.CurrList);
     FCtip.ListField:=CUser.CurrField;
     FCKod.ListField:=CUser.CentField;
     lCurr.Caption:=DefaultCurr;
     MoFlag:=True;
     Frodm.NFish.Last;
     FNo.Text:=IntToStr(Frodm.NFishNo.Value);
     Dat1.Text:=IntToDate(Frodm.NFishDat.Value);
end;

procedure TFCash.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFCash.FNoKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then FNo_Exit;
     NextTab(Sender,Key);
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;
end;

procedure TFCash.FPbillChange(Sender: TObject);
begin
     lbFar.Caption:=FarsiPrice(Frodm.NFishPrice.Value);
end;

procedure TFCash.BprevClick(Sender: TObject);
begin
     IF Frodm.NFish.State = dsEdit Then Exit;
     IF Frodm.NFish.State = dsInsert Then
     Begin
      FNo.SetFocus;
      Check_State(Frodm.NFish,BDoClick);
      MoFlag:=Frodm.NFish.State =dsBrowse;
      FNo.Text:=IntToStr(Frodm.NFishNo.Value);
      Dat1.Text:=IntToDate(Frodm.NFishDat.Value);
      Exit;
     End;
     MoFlag:=Frodm.NFish.State =dsBrowse;
     If Not MoFLag Then Exit;
     Frodm.NFish.Prior;
     FNo.Text:=IntToStr(Frodm.NFishNo.Value);
     Dat1.Text:=IntToDate(Frodm.NFishDat.Value);
end;

procedure TFCash.BnextClick(Sender: TObject);
begin
     IF Frodm.NFish.State = dsEdit Then Exit;
     IF Frodm.NFish.State = dsInsert Then
     Begin
      FNo.SetFocus;
      Check_State(Frodm.NFish,BDoClick);
      MoFlag:=Frodm.NFish.State =dsBrowse;
      FNo.Text:=IntToStr(Frodm.NFishNo.Value);
      Dat1.Text:=IntToDate(Frodm.NFishDat.Value);
      Exit;
     End;
     MoFlag:=Frodm.NFish.State =dsBrowse;
     If Not MoFLag Then Exit;
     Frodm.NFish.Next;
     FNo.Text:=IntToStr(Frodm.NFishNo.Value);
     Dat1.Text:=IntToDate(Frodm.NFishDat.Value);
end;

procedure TFCash.BeditClick(Sender: TObject);
begin
     If Not(Frodm.NFish.State = dsBRowse) Then Exit;
     BNo:=Frodm.NFishBNo.Value;
     If (Frodm.NFishLperm.Value)or(IsBillLocked(BNO))  Then
     Begin
      ShowMessage(sLocked);
      Exit;
     End;
     BDat :=Frodm.NFishDat.Value;
     RNo :=Frodm.NFishNo.Value;
     If Frodm.JariNam.FindKey([JariKod.Text]) Then
      If DefaultCurr = Frodm.JariNamBkod.Value Then
       OPrice:=Frodm.NFishPrice.AsCurrency
      Else
       OPrice:=Frodm.NFishCPrice.AsCurrency+Frodm.NFishCwage.Value;
     FAccNam.ItemIndex:=FAccNam.Items.IndexOf(FAccNam.Text);
     JariKod.ItemIndex:=JariKod.Items.IndexOf(JariKod.Text);

     DeleteFromJari(Frodm.NFishJari.AsString,Frodm.NFishDat.AsString,Frodm.NFishNo.AsString,currtoStr(OPrice));//Frodm.NFishPrice.AsString
     DelBitem(IntToStr(RNo),BNo,FTip);
     Frodm.NFish.Edit;
     FPBill.SetFocus;
     Rate:=Frodm.NFishRate.AsCurrency;
end;

procedure TFCash.BdelClick(Sender: TObject);
Var
Table:TTable;
mPrice:Currency;
begin
     If Not(Frodm.NFish.State = dsBRowse) Then Exit;
     If Frodm.NFishLperm.Value Then
     Begin
      ShowMessage('«„ò«‰  ’ÕÌÕ ‰Ì” ');
      Exit;
     End;
     If MessageDlg('›Ì‘ Õ–› ‘Êœø',mtWarning,mbYesNo,0) = idYes Then
     Begin
      BNo:=Frodm.NFishBNo.Value;
      BDat:=Frodm.NFishDat.Value;
      RNo :=Frodm.NFishNo.Value;
//Update Jari
      Table:=TTable.Create(Self);
      Table.Tag:=2;
      Table.DatabaseName :=CurrDb;//Frodm.Invo.DatabaseName;
      Table.TableName :='dbo.Jari'+JariKod.Text;
      If Not OpenTable(Table) Then
      Begin
       ShowMessage('Ã«—Ì Ì«›  ‰‘œ');
       MoFlag:=False;
       Exit;
      End;
     If Frodm.JariNam.FindKey([JariKod.Text]) Then
      If DefaultCurr = Frodm.JariNamBkod.Value Then
       mPrice:=Frodm.NFishPrice.AsCurrency
      Else
       mPrice:=Frodm.NFishCPrice.AsCurrency+Frodm.NFishCwage.Value;

      Table.Filter:='Dat = '+Frodm.NFishDat.AsString+' and Serial ='+Frodm.NFishNo.AsString+
       ' and Bestan = '+CurrToStr(mPrice);
      Table.Filtered:=True;
      Table.Delete;
      Table.Filtered:=False;
      JariRepair(Table);
      Table.Free;
//End Of Update Jari

      DelBitem(IntToStr(RNo),BNo,FTip);
      BillUpdate(BNo);
      Frodm.NFish.Delete;
      FNo.Text:=IntToStr(Frodm.NFishNo.Value);
      Dat1.Text:=IntToDate(Frodm.NFishDat.Value);
     End;
end;

procedure TFCash.BDoClick(Sender: TObject);
Var
Table:TTable;
AcRem,Rem,Price:Currency;
BehKod,BesKod:Real;
Str:String;
State:Boolean;
Dat:Integer;
NbNo:Integer;
mPrice,fDif:Currency;
Id:Integer;
AtfQu:TQuery;
bIns,bArzi:Boolean;
begin
     If Frodm.NFish.State = dsBrowse Then Exit;
     FNo.SetFocus;
     MoFlag:=True;
     Price:=Frodm.NFishPrice.Value;
     CPrice:=Frodm.NFishCPrice.Value;
     If Price = 0 Then
     Begin
      ShowMessage('„»·€ ›Ì‘  ⁄ÌÌ‰ ‰‘œÂ «” ');
      MoFlag:=False;
      Exit;
     End;
     fDif:=Frodm.NFishPrice.Value-(Frodm.NFishCPrice.Value+Frodm.NFishCwage.Value)*Frodm.NFishRate.Value;
     if Abs(fDif) > Frodm.NFishRate.Value Then
     Begin
      ShowMessage('„»·€ «—“Ì Ê „⁄«œ· «—“ —«ÌÃ »Ì‘ «“ Õœ „Ã«“ «Œ ·«› œ«—‰œ');
      MoFlag:=False;
      Exit;
     End;

     Table:=TTable.Create(Self);
     Table.Tag:=2;
     Table.DatabaseName :=CurrDb;
     Table.TableName :='dbo.Jari'+JariKod.Text;
     If Not OpenTable(Table) Then
     Begin
      ShowMessage('Ã«—Ì Ì«›  ‰‘œ');
      MoFlag:=False;
      Exit;
     End;
     bArzi:=False;
     If Frodm.JariNam.FindKey([JariKod.Text]) Then bArzi:=Not(DefaultCurr = Frodm.JariNamBkod.Value);
      If bArzi Then
       mPrice:=cPrice+Frodm.NFishCwage.AsCurrency
      Else
       mPrice:=Price;

//---Get No From Database---
     AtfQu:=TQuery.Create(Application);
     AtfQu.DataBaseName:=CurrDb;
     AtfQu.SQL.Clear;
     AtfQu.SQL.Add('Set Transaction Isolation Level Serializable'); // With (TabLockX) commit transaction
     AtfQu.SQL.Add('begin Transaction Select Max(A.No) From NFish A ');
     If Frodm.NFish.State=dsInsert Then
     Begin
      AtfQu.Open;
      bIns:=True;
      RNo:=AtfQu.Fields[0].AsInteger+1;
     End;
     Frodm.NFishNo.Value:=RNo;
     Frodm.NFishLperm.Value:=sPerm;
     FNo.Text:=Frodm.NFishNo.AsString;

//---------------------------
     Table.Last;
     Rem:=Table.FieldByName('Rema').AsCurrency;
     Id:=Table.FieldByName('Id').AsInteger;
     Table.Append;
     Table.FieldByName('Id').AsInteger:=Id+1;
     Table.FieldByName('Bestan').AsCurrency:=mPrice;
     If bArzi Then
     begin
      Table.FieldByName('Bedeh').AsCurrency:=Frodm.NFishCwage.AsCurrency;
      Table.FieldByName('Rema').AsCurrency:=Rem+mPrice-Frodm.NFishCwage.AsCurrency;
      End Else Begin
      Table.FieldByName('Bedeh').AsCurrency:=0;
      Table.FieldByName('Rema').AsCurrency:=Rem+mPrice;
     End;

     Table.FieldByName('Dat').AsInteger:=Frodm.NFishDat.Value;//FarDate;
     Table.FieldByName('Serial').AsString:=FNo.Text;
     Table.FieldByName('Des').AsString:='Ê«—Ì“ ‰ﬁœÌ'+'-'+Frodm.NFishAccNam.AsString+
     '-'+FCKod.Text+'-'+Frodm.NFishDes.AsString;
     Table.Post;
     If Frodm.NFish.State=dsEdit Then JariRepair(Table);
     Frodm.NFish.Post;
     If bIns Then //Frodm.RMon.State =dsInsert Then
     Begin
      AtfQu.Close;
      AtfQU.SQL.Clear;
      AtfQU.SQL.Add('commit transaction');
      AtfQu.ExecSQL;
      bIns:=False;
     End;

// Accounting Automation Part
     BDat:=Frodm.NFishDat.Value;
     bArzi:=False;
     If Frodm.JariNam.FindKey([JariKod.Text]) Then
     Begin

      AtfQu.Close;
      BehKod:=Frodm.JariNamAccKod.Value;
      BesKod:=0;
      bArzi:=Not(DefaultCurr = Frodm.JariNamBkod.Value);

      State:=sABill;
      Str:='Ê«—Ì“ ‰ﬁœÌ »Â Ã«—Ì'+'  '+JariKod.Text+' «“ Õ”«» '+ Frodm.NFishAccNam.AsString;
      NBNo:=AutoBill(State,Beskod,Behkod,Price,Str,IntToStr(RNo),BNo,FTip,BDat,
      Frodm.NFishCost.AsString,Frodm.NFishCkod.AsInteger,Frodm.NFishCprice.Value+Frodm.NFishCwage.Value,
      Rate,Frodm.NFishCtip.AsString);
//»” «‰ò«—Ì „‘ —Ì
      BesKod:=AccKod(FAccNam.Text);
      IF BesKod = 0 Then
      Begin
       Frodm.AutoBill.FindKey(['CASH']);
       State:=Frodm.AutoBillStat.Value;
       Beskod:=Frodm.AutoBillBesKod.Value;
      End;
      //Price:=Frodm.NFishCprice.Value*Frodm.NFishRate.Value;
      Str:='Ê«—Ì“ ‰ﬁœÌ »Â Ã«—Ì'+'  '+JariKod.Text+'-‘'+Frodm.NFishNo.AsString+'-„⁄«œ· '+Frodm.NFishCprice.AsString+
      Frodm.NFishCtip.AsString+'-'+Frodm.NFishDes.AsString;

      Price:=Frodm.NFishPrice.Value;
      CPrice:=Frodm.NFishCprice.Value+Frodm.NFishCWage.Value;

      NBNo:=AutoBill(State,Beskod,0,Price,Str,IntToStr(RNo),BNo,FTip,BDat,
      Frodm.NFishCost.AsString,Frodm.NFishCkod.AsInteger,cPrice,
      Rate,Frodm.NFishCtip.AsString);

//ò«—„“œ ÕÊ«·Â
     If bArzi Then
     Begin
      BesKod:=Frodm.JariNamAccKod.Value;
      BehKod:=Def_Car_Bes;
     End Else
     Begin
      BesKod:=Def_Car_Bes;
      BehKod:=AccKod(FAccNam.Text);
     End;

      Price:=Frodm.NFishCWage.Value*Frodm.NFishRate.Value;
      Str:='ò«—„“œ ÕÊ«·Â «—“Ì ›Ì‘ »«‰òÌ ‘„«—Â'+ Frodm.NFishNo.AsString+' «“'+Frodm.NFishAccNam.AsString;
      NBNo:=AutoBill(State,BesKod,BehKod,Price,Str,IntToStr(RNo),BNo,FTip,BDat,
      Frodm.NFishCost.AsString,Frodm.NFishCkod.AsInteger,Frodm.NFishCWage.Value,
      Rate,Frodm.NFishCtip.AsString);
//ò”— Ê «÷«›Ì Ê«—Ì“Ì
      BesKod:=Def_Car_Bes;
      Price:=(Frodm.NFishCWage.Value+Frodm.NFishCprice.Value)*Frodm.NFishRate.Value-Frodm.NFishPrice.Value;
      If Price < 0.009*Rate Then Price:=0;//2017
      Str:='ò”—Ê «÷«›Â Ê«—Ì“Ì —Ì«·Ì ÕÊ«·Â «—“Ì Ê«—Ì“ »«‰òÌ ‘„«—Â'+ Frodm.NFishNo.AsString+' «“'+Frodm.NFishAccNam.AsString;
      NBNo:=AutoBill(State,0,Beskod,Price,Str,IntToStr(RNo),BNo,FTip,BDat,
      Frodm.NFishCost.AsString,Frodm.NFishCkod.AsInteger,Price/Rate,
      Rate,DefaultCurr);

      If NBNo = BNo Then
       BillUpdate(BNo)
      Else
       If sBill Then MakeBill('”‰œ Ê«—Ì“ ›Ì‘ ‰ﬁœÌ »«‰ﬂ');
      BNo:=NBNo;
      SetBNo(BNo,RNo);
     End Else
     Begin
      Application.MessageBox('«ÿ·«⁄«  Ã«—Ì Ì«›  ‰‘œ','Â‘œ«—',mb_Ok);
      Application.MessageBox('«”‰«œ Õ”«»œ«—Ì À»  ‰ê—œÌœÂ «” ','Â‘œ«—',mb_Ok);
      MoFlag:=False;
      Exit;
     End;
// End of Accounting Automation Part
//     FNo.SetFocus;
     QuickCloseOpen([6,24,34]);
     Frodm.NFish.Locate('No',RNo,[loCaseInsensitive]);
     FNo.Text :=IntToStr(RNo);
     If cbPrint.Checked Then BprintClick(Sender);
     RNo:=0;
     BNo:=0;
     BDat:=0;
     MoFlag:=True;
     Table.Free;
end;

procedure TFCash.BexitClick(Sender: TObject);
begin
     If Frodm.NFish.State =dsEdit Then Exit;
     Check_State(Frodm.NFish,BDoClick);
     MoFlag:= Frodm.NFish.State = dsBrowse;
     If Not MoFLag Then Exit;
     FCash.Close;
end;

procedure TFCash.Dat1Enter(Sender: TObject);
begin
     If Frodm.NFish.State = dsBrowse Then Dat1.ReadOnly :=True Else
     Begin
        Dat1.ReadOnly :=False;
        GetMaskText(Dat1);
     End;
end;

procedure TFCash.Dat1Exit(Sender: TObject);
begin
     If (Frodm.NFish.State = dsBrowse) Then Exit;
     SetMaskText(Dat1);
     If(Not Date_Check(Dat1.Text))And(DateToInt(Dat1.Text)>0) Then Dat1.SetFocus Else
       Frodm.NFishDat.Value :=DateToInt(Dat1.Text);
end;

procedure TFCash.FAccNamDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
     Accept:=(Source Is TXPListBox) And ((Source As TXPListBox).Name = 'lbName');
     Accept:=Accept and Not(Frodm.NFish.State =dsBrowse);
end;

procedure TFCash.FAccNamDragDrop(Sender, Source: TObject; X, Y: Integer);
Var
List:TXPListBox;
begin
     If (Source Is TXPListBox) Then
     Begin
       List:=(Source As TXPListBox);
       FAccNam.Text:=List.Items.Strings[List.ItemIndex];
       FAcSearch.Close;
       FAccNam.ItemIndex:=FAccNam.Items.IndexOf(FAccNam.Text);
       FAccnam.Field.AsString:=FAccNam.Text;
       FAccNam.SetFocus;
     End;
end;

procedure TFCash.FAccNamKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetAccountDbCombo(Sender,Key,'',0);
end;

procedure TFCash.FCKodKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetCentLookup(Sender,Key);
end;

procedure TFCash.FEQEnter(Sender: TObject);
begin
     If (Frodm.NFish.State = dsBrowse)or(Frodm.NFishPrice.Value>0) Then Exit;
     If Frodm.NFishCtip.AsString = DefaultCurr Then
      Rate := 1
     Else
      If Frodm.NFishRate.AsCurrency = 0 Then
       Rate:=GetRateatDate(Frodm.NFishCtip.AsString,Frodm.NFishDat.AsInteger)
      Else
       Rate:=Frodm.NFishRate.AsCurrency;
     Frodm.NFishRate.Value:=Rate;
     If Frodm.NFishCprice.Value = 0 Then Exit;
     Frodm.NFishPrice.Value:=(Frodm.NFishCprice.Value+Frodm.NFishCwage.Value)*Rate;
end;

procedure TFCash.FEQExit(Sender: TObject);
begin
     If (Frodm.NFish.State = dsBrowse)or(Frodm.NFishPrice.Value = 0) Then Exit;
     Frodm.NFishCPrice.Value:=(Frodm.NFishPrice.Value / Frodm.NFishRate.Value)-Frodm.NFishCwage.Value;
end;

procedure TFCash.BprintClick(Sender: TObject);
begin
     If Not(Frodm.NFish.State = dsBrowse) Then Exit;
     CreatingForm(TqrNFResid,'qrNFResid',qrNFResid);
     Set_Sys_Enviroment;
     qrNFResid.PrinterSettings.Copies:=PrnCnt;
     qrNFResid.qrDesc.Caption:=FarsiPrice(Frodm.NFishPrice.Value);// FDesc.Text;
     qrNFResid.qrCent.Caption:=FCKod.Text;
     qrNFResid.qrCashier.Caption:=JariKod.Text;
     qrNFResid.qrDCurr.Caption:=DefaultCurr;
     If cbPrint.Checked Then qrNFResid.Print Else qrNFResid.Preview;
     qrNFResid.Destroy;
end;

procedure TFCash.JariKodDropDown(Sender: TObject);
var
Price:Currency;
begin
     If Frodm.NFish.State <> dsBrowse Then
     Begin
      Price:=(Frodm.NFishCwage.Value+Frodm.NFishCprice.Value)*Frodm.NFishRate.Value-
       Frodm.NFishPrice.Value;
      If Price = 0 Then
       Fill_Cond(Frodm.JariNam,'Nam','BKod='+QuotedStr(Frodm.NFishCtip.AsString),JariKod.Items)
      Else
       Fill_Comb(Frodm.JariNam,'Nam',JariKod.Items);
     End;
end;

procedure TFCash.FRateKeyPress(Sender: TObject; var Key: Char);
begin
     NextTab(Sender,Key);
     If Frodm.NFish.State = dsBrowse Then Exit;
     If (Key In ['1','2','3','4','5','6','7','8','9','0']) Then Frodm.NFishPrice.Clear;
end;


end.
