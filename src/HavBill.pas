unit HavBill;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ExtCtrls, ComCtrls, DBCtrls;

type
  TFHav = class(TForm)
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
    FAccNam: TDBComboBox;
    Label7: TLabel;
    FacNo: TDBEdit;
    Bevel2: TBevel;
    lbFar: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Bprev: TButton;
    Bnext: TButton;
    Bedit: TButton;
    Bdel: TButton;
    Label5: TLabel;
    Dat1: TMaskEdit;
    Label8: TLabel;
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
    procedure FPbillKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    Procedure NextTab(Sender:TObject;Var Key:Char);
    procedure FNoKeyPress(Sender: TObject; var Key: Char);
    procedure FPbillChange(Sender: TObject);
    procedure BprevClick(Sender: TObject);
    procedure BnextClick(Sender: TObject);
    procedure BeditClick(Sender: TObject);
    procedure BdelClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Dat1Enter(Sender: TObject);
    procedure Dat1Exit(Sender: TObject);
    procedure FAccNamDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure FAccNamDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure FAccNamKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FEQEnter(Sender: TObject);
    procedure FCKodKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BprintClick(Sender: TObject);
    procedure JariKodDropDown(Sender: TObject);
    procedure FEQExit(Sender: TObject);
    procedure FRateKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    No:Integer;
    Kod:Real;
    Nam:String;
    Perm:Boolean;
    FacRem,AcRem,Price:Currency;
    cPrice:Currency;

    RNo:Integer;
    BNo:Integer;
    BDat:Integer;
    OPrice:Currency;
    MoFlag:Boolean;
    Rate:Currency;
    Function InvoRem(InvoNo:Integer):Currency;


    Procedure SetBNo(BNo,No:Integer);
    Function MaxNo:Integer;
    Procedure FNo_Exit;
    Procedure MakeNew;
    Procedure DeleteFromJari(Jari_Name,J_Date,Serial,JAmount:String);
  public
    { Public declarations }
  end;

var
  FHav: TFHav;

implementation

uses DbTables,Db, FrooshDM, Routins, ProVar, Invoice, Converts, AcSearch, XPListBox,
  CRoutins, BHResid;
Const
FTip = 12;
{$R *.DFM}
Procedure TFHav.NextTab(Sender:TObject;Var Key:Char);
begin
     If Key =#13 Then
     Begin
      Key:=#0;
      SelectNext(Sender As TWinControl,True,True);
     End;
end;

Function TFHav.MaxNo:Integer;
begin
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Max(R.No) From BHav R ');
     Qu.Open;
     Result:=Qu.Fields[0].AsInteger;
     Qu.Close;
end;

Procedure TFHav.FNo_Exit;
begin
     If Not(Frodm.BHav.State =dsBrowse) Then
     Begin
       FNo.Text :=IntToStr(Frodm.BHavNo.Value);
       Exit;
     End;
     RNo:=StrToInt(FNo.Text);
     If Not(Frodm.BHav.Locate('No',RNo,[loCaseInsensitive])) Then MakeNew;
     Dat1.Text:=IntToDate(Frodm.BHavDat.Value);
end;

Procedure TFHav.MakeNew;
begin
     If Not(Frodm.BHav.State=dsBrowse) Then Exit;
     Frodm.BHav.Append;
     Frodm.BHavNo.Value:=MaxNo+1;
     Frodm.BHavDat.Value:=Fardate;
     Frodm.BHavCtip.Value:=DefaultCurr;
     Frodm.BHavLPerm.Value:=False;
     Dat1.Text:=IntToDate(Frodm.BHavDat.Value);
     BNo:=0;
     BDat:=Frodm.BHavDat.Value;
     MoFlag:=True;
end;

Procedure TFHav.SetBNo(BNo,No:Integer);
begin
     If BNo = 0 Then Exit;
     If Frodm.BHav.Locate('No',No,[locaseInsensitive]) Then
     Begin
      Frodm.BHav.Edit;
      Frodm.BHavBNo.Value:=BNo;
      Frodm.BHav.Post;
     End;
end;

Function TFHav.InvoRem(InvoNo:Integer):Currency;
Var
Dat:Integer;
begin
     Result:=0;
     Qu.SQL.Clear;
     Qu.SQL.Add(' Select Nam,Prem,LPerm ');
     Qu.SQL.Add(' From Invoice I ');
     Qu.SQL.Add(' Where I.No = '+IntToStr(InvoNo));
     Qu.Open;
//     IF Frodm.Invo.FindKey([InvoNo]) Then
     If Qu.RecordCount > 0 Then
     Begin
       Perm:=Qu.Fields[2].AsBoolean;// Frodm.InvoPerm.Value;
       Nam:=Qu.Fields[0].AsString;// Frodm.InvoNam.Value;
       Result:=Qu.Fields[1].AsCurrency;// Frodm.InvoPrem.Value;
       Kod:=AccKod(Nam);
       IF Kod = 0 Then
       Begin
         Frodm.AutoBill.FindKey (['CF']);
         Kod:=Frodm.AutoBillBesKod.Value;
       End;
       //AcRem:=AcRemain(Kod,Dat);
       Frodm.BHavAccNam.Value :=AccNam(Kod);
     End Else
     Begin
       Beep;
       ShowMessage('»« «Ì‰ ‘„«—Â ›«ﬂ Ê— „ÊÃÊœ ‰Ì” ');
       FacNo.SetFocus;
       Qu.Close;
       Exit;
     End;
     Qu.Close;
end;


Procedure TFHav.DeleteFromJari(Jari_Name,J_Date,Serial,JAmount:String);
Var
Table:TTable;
begin
     Table:=TTable.Create(Self);
     Table.Tag:=2;
     Table.DatabaseName :=CurrDb;
     Table.TableName :='dbo.Jari'+JariKod.Text;
     Table.Open;
     Table.Filter:='Dat = '+J_Date+' and Serial ='+Serial+
       ' and Bedeh = '+JAmount;
     Table.Filtered:=True;
     Table.Delete;
end;

//End Of Privates
procedure TFHav.BDoClick(Sender: TObject);
Var
Table:TTable;
Rem:Currency;
BehKod:Real;
Str:String;
State:Boolean;
NBNo:Integer;
mPrice,fDif:Currency;
Id:Integer;
AtfQu:TQuery;
bIns,bArzi:Boolean;
begin
     If Frodm.BHav.State =dsBrowse Then Exit;
     FNo.SetFocus;
     Price:=Frodm.BHavPrice.Value;
     CPrice:=Frodm.BHavCPrice.Value;
     If ((Price =0) or (cPrice=0))or(JariKod.ItemIndex=-1) or((FAccNam.ItemIndex=-1) and (No = 0))Then
     Begin
      ShowMessage('«ÿ·«⁄«  ﬂ«›Ì ‰Ì” ‰œ');
      MoFlag:=False;
      Exit;
     End;
     fDif:=Frodm.BHavPrice.Value-(Frodm.BHavCPrice.Value+Frodm.BHavCwage.Value)*Frodm.BHavRate.Value;
     if Abs(fDif) > Frodm.BHavRate.Value Then
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
       mPrice:=cPrice+Frodm.BHavCwage.AsCurrency
      Else
       mPrice:=Price;

//---Get No From Database---
     AtfQu:=TQuery.Create(Application);
     AtfQu.DataBaseName:=CurrDb;
     AtfQu.SQL.Clear;
     AtfQu.SQL.Add('Set Transaction Isolation Level Serializable'); //With (TabLockX) commit transaction
     AtfQu.SQL.Add('begin Transaction Select Max(A.No) From BHav A ');
     If Frodm.BHav.State=dsInsert Then
     Begin
      AtfQu.Open;
      RNo:=AtfQu.Fields[0].AsInteger+1;
      bIns:=True;
     End;
     Frodm.BHavNo.Value:=RNo;
     Frodm.BHavLPerm.Value:=sPerm;
     FNo.Text:=Frodm.BHavNo.AsString;
//---------------------------
     Table.Last;
     Rem:=Table.FieldByName('Rema').AsCurrency;
     Id:=Table.FieldByName('Id').AsInteger;
     Table.Append;
     Table.FieldByName('Id').AsInteger:=Id+1;
     Table.FieldByName('Bestan').AsCurrency:=0;
     Table.FieldByName('Bedeh').AsCurrency:=mPrice;
     Table.FieldByName('Dat').AsInteger:=Frodm.BHavDat.Value;
     Table.FieldByName('Serial').AsString:=FNo.Text;
     Table.FieldByName('Rema').AsCurrency:=Rem-mPrice;
     Table.FieldByName('Des').AsString:='»—œ«‘  ‰ﬁœÌ'+'-'+FNo.Text+'-'+FDesc.Text;
     Table.Post;
     If Frodm.BHav.State=dsEdit Then JariRepair(Table);

     Frodm.BHav.Post;
     If bIns Then
     Begin
      AtfQu.Close;
      AtfQU.SQL.Clear;
      AtfQU.SQL.Add('commit transaction');
      AtfQu.ExecSQL;
      bIns:=False;
     End;

// Accounting Automation Part
     BDat:=Frodm.BHavDat.Value;
     If Frodm.JariNam.FindKey([JariKod.Text]) Then
     Begin

      BehKod:=Frodm.JariNamAccKod.Value;
      State:=sAbill;
      Kod:=0;
      Str:='ﬁ»÷ »—œ«‘  «“ Ã«—Ì »‘„«—Â'+'-'+FNo.Text+' '+' »Õ”«» '+FAccNam.Text+' '+FDesc.Text ;

      NBNo:=AutoBill(State,Behkod,0,Price,Str,IntToStr(RNo),BNo,FTip,BDat,
      Frodm.BHavCost.AsString,Frodm.BHavCKod.AsInteger,Cprice+Frodm.BHavCwage.Value,Rate,Frodm.BHavCtip.AsString);

//»œÂò«—Ì „‘ —Ì
      If Kod = 0 Then Kod:=AccKod(FAccNam.Text);
      If bArzi Then
      Begin
       Price:=Frodm.BHavPrice.Value-Frodm.BHavCwage.Value*Frodm.BHavRate.Value;
       CPrice:=Frodm.BHavCprice.Value;
      End Else
      Begin
       Price:=Frodm.BHavPrice.Value;
       CPrice:=Frodm.BHavCprice.Value+Frodm.BHavCWage.Value;
     End;

      //Price:=Frodm.BhavCprice.Value*Rate;
      Str:='œ—Ì«›  «“ Ã«—Ì'+' '+JariKod.Text+'-‘'+Frodm.BHavNo.AsString+'-„⁄«œ· '+Frodm.BhavCPrice.AsString+' '+
      Frodm.BHavCtip.AsString+'-'+Frodm.BHavDes.AsString;
      NBNo:=AutoBill(State,0,Kod,Price,Str,IntToStr(RNo),BNo,FTip,BDat,
      Frodm.BHavCost.AsString,Frodm.BHavCKod.AsInteger,CPrice,Rate,
      Frodm.BHavCtip.AsString);

//ò«—„“œ ÕÊ«·Â
      If bArzi Then
       Kod:=0
      Else
       Kod:=AccKod(FAccNam.Text);
      Price:=Frodm.BHavCWage.Value*Rate;
      Str:='ò«—„“œ Œ—Ìœ ÕÊ«·Â «—“Ì ﬁ»÷ »—œ«‘  »«‰òÌ ‘„«—Â'+ Frodm.BHavNo.AsString+' «“'+Frodm.BHavAccNam.AsString;
      NBNo:=AutoBill(State,Kod,Def_Car_Bes,Price,Str,IntToStr(RNo),BNo,FTip,BDat,
      Frodm.BHavCost.AsString,Frodm.BHavCKod.AsInteger,Frodm.BhavCWage.Value,Rate,
      Frodm.BHavCtip.AsString);

//ò”— Ê «÷«›Ì Ê«—Ì“Ì
      Kod:=Def_Car_Bes;
      Price:=(Frodm.BHavCWage.Value+Frodm.BHavCprice.Value)*Frodm.BHavRate.Value-Frodm.BHavPrice.Value;
      If Price < 0.009*Rate Then Price:=0;//2017
      Str:='ò”—Ê «÷«›Â Ê«—Ì“Ì »—œ«‘  »«‰òÌ ‘„«—Â'+ Frodm.BHavNo.AsString+' «“'+Frodm.BHavAccNam.AsString;
      NBNo:=AutoBill(State,kod,0,Price,Str,IntToStr(RNo),BNo,FTip,BDat,
      Frodm.BHavCost.AsString,Frodm.BHavCkod.AsInteger,Price/Rate,
      Rate,DefaultCurr);

      If NBNo = BNo Then
       BillUpdate(BNo)
      Else
       If sBill Then MakeBill('”‰œ »—œ«‘  ‰ﬁœÌ «“ »«‰ò ');
      BNo:=NBNo;
      SetBNO(BNo,RNO);
     End Else
     Begin
      Application.MessageBox('«ÿ·«⁄«  Ã«—Ì Ì«›  ‰‘œ','Â‘œ«—',mb_Ok);
      Application.MessageBox('«”‰«œ Õ”«»œ«—Ì À»  ‰ê—œÌœÂ «” ','Â‘œ«—',mb_Ok);
      Exit;
     End;
     QuickCloseOpen([6,24,35]);
     Frodm.BHav.Locate('No',RNo,[loCaseInsensitive]);
// End of Accounting Automation Part
     FNo.Text :=IntToStr(RNo);
     Dat1.Text:=IntToDate(Frodm.BHavDat.Value);
     If cbPrint.Checked Then BprintClick(Sender);
     Kod:=0;
     BNo:=0;
     BDat:=0;
     RNo:=0;
     FNo.SetFocus;
     Table.Free;
end;

procedure TFHav.BexitClick(Sender: TObject);
begin
     If Frodm.BHav.State =dsEdit Then Exit;
     Check_State(Frodm.BHav,BDoClick);
     FNo.SetFocus;
     If Not MoFLag Then Exit;
     FHav.Close;
end;

procedure TFHav.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     FNo.SetFocus;
     Action:=caFree;
     IF Frodm.BHav.State = dsInsert Then Check_State(Frodm.BHav,BDoClick);
     MoFlag:=Frodm.BHav.State = dsBRowse;
     If (Frodm.BHav.State = dsEdit) Or Not MoFlag Then Action :=caNone;
     If Action=caFree Then Frodm.BHav.Close;
end;

procedure TFHav.FPbillKeyPress(Sender: TObject; var Key: Char);
begin
     NextTab(Sender,Key);
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0','-',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;
end;

procedure TFHav.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     Frodm.BHav.open;
     lbFar.Font:=FFont;
     Label9.Font:=FFont;
     Fill_Comb(Frodm.JariNam,'Nam',JariKod.Items);
     FAccNam.Items.Assign(AcList);
     FCost.Items.Assign(CostList);
     //FCtip.Items.Assign(CurrList);
     FCtip.ListField:=CUser.CurrField;
     FCKod.ListField:=CUser.CentField;
     MoFlag:=True;
     Frodm.BHav.Last;
     FNo.Text:=IntToStr(Frodm.BHavNo.Value);
     Dat1.Text:=IntToDate(Frodm.BHavDat.Value);
     lCurr.Caption:=DefaultCurr;
end;

procedure TFHav.FPbillChange(Sender: TObject);
begin
     lbFar.Caption:=FarsiPrice(Frodm.BHavPrice.Value);
end;

procedure TFHav.FNoKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then FNo_Exit;
     NextTab(Sender,Key);
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;
end;

procedure TFHav.BprevClick(Sender: TObject);
begin
     IF Frodm.BHav.State = dsEdit Then Exit;
     IF Frodm.BHav.State = dsInsert Then
     Begin
      FNo.SetFocus;
      Check_State(Frodm.BHav,BDoClick);
      MoFlag:=Frodm.BHav.State =dsBrowse;
      FNo.Text:=IntToStr(Frodm.BHavNo.Value);
      Dat1.Text:=IntToDate(Frodm.BHavDat.Value);
      Exit;
     End;
     MoFlag:=Frodm.BHav.State =dsBrowse;
     If Not MoFLag Then Exit;
     Frodm.BHav.Prior;
     FNo.Text:=IntToStr(Frodm.BHavNo.Value);
     Dat1.Text:=IntToDate(Frodm.BHavDat.Value);
end;

procedure TFHav.BnextClick(Sender: TObject);
begin
     IF Frodm.BHav.State = dsEdit Then Exit;
     IF Frodm.BHav.State = dsInsert Then
     Begin
      FNo.SetFocus;
      Check_State(Frodm.BHav,BDoClick);
      MoFlag:=Frodm.BHav.State =dsBrowse;
      FNo.Text:=IntToStr(Frodm.BHavNo.Value);
      Dat1.Text:=IntToDate(Frodm.BHavDat.Value);
      Exit;
     End;
     MoFlag:=Frodm.BHav.State =dsBrowse;
     If Not MoFLag Then Exit;
     Frodm.BHav.Next;
     FNo.Text:=IntToStr(Frodm.BHavNo.Value);
     Dat1.Text:=IntToDate(Frodm.BHavDat.Value);
end;

procedure TFHav.BeditClick(Sender: TObject);
begin
     If Not(Frodm.BHav.State = dsBRowse) Then Exit;
     BNo:=Frodm.BHavBNo.Value;
     If (Frodm.BHavLperm.Value)or(IsBillLocked(BNO)) Then
     Begin
      ShowMessage(sLocked);
      Exit;
     End;
     BDat:=Frodm.BHavDat.Value;
     RNo :=Frodm.BHavNo.Value;
     If Frodm.JariNam.FindKey([JariKod.Text]) Then
      If DefaultCurr = Frodm.JariNamBkod.Value Then
       OPrice:=Frodm.BHavPrice.AsCurrency
      Else
      OPrice:=Frodm.BHavCPrice.AsCurrency+Frodm.BHavCwage.AsCurrency;

     FAccNam.ItemIndex:=FAccNam.Items.IndexOf(FAccNam.Text);
     JariKod.ItemIndex:=JariKod.Items.IndexOf(JariKod.Text);

     DeleteFromJari(Frodm.BHavJari.AsString,Frodm.BHavDat.AsString,
                    Frodm.BHavNo.AsString,CurrTostr(OPrice));// Frodm.BHavPrice.AsString);
     DelBitem(IntToStr(RNo),BNo,FTip);
     Frodm.BHav.Edit;
     Rate:=Frodm.BHavRate.AsCurrency;
     FPBill.SetFocus;
end;

procedure TFHav.BdelClick(Sender: TObject);
Var
Table:TTable;
mPrice:Currency;
begin
     If Not(Frodm.BHav.State = dsBRowse) Then Exit;
     If Frodm.BHavLperm.Value Then
     Begin
      ShowMessage('«„ò«‰  ’ÕÌÕ ‰Ì” ');
      Exit;
     End;
     If MessageDlg('—”Ìœ »—œ«‘  Õ–› ‘Êœø',mtWarning,mbYesNo,0) = idYes Then
     Begin
      BNo:=Frodm.BHavBNo.Value;
      BDat:=Frodm.BHavDat.Value;
      RNo :=Frodm.BHavNo.Value;
{ Delete Jari Article }
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
     If Frodm.JariNam.FindKey([JariKod.Text]) Then
      If DefaultCurr = Frodm.JariNamBkod.Value Then
       mPrice:=Frodm.BHavPrice.AsCurrency
      Else
       mPrice:=Frodm.BHavCPrice.AsCurrency+Frodm.BHavCwage.AsCurrency;

      Table.Filter:='Dat = '+Frodm.BHavDat.AsString+' and Serial ='+Frodm.BHavNo.AsString+
       ' and Bedeh = '+CurrToStr(mPrice);// Frodm.BHavCPrice.AsString;
      Table.Filtered:=True;
      Table.Delete;
      Table.Filtered:=False;
      JariRepair(Table);
      Table.Free;
      DelBitem(IntToStr(RNo),BNo,FTip);
      BillUpdate(BNo);
      Frodm.BHav.Delete;
      FNo.Text:=IntToStr(Frodm.BHavNo.Value);
      Dat1.Text:=IntToDate(Frodm.BHavDat.Value);
     End;
end;

procedure TFHav.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFHav.Dat1Enter(Sender: TObject);
begin
     If Frodm.BHav.State = dsBrowse Then Dat1.ReadOnly :=True Else
     Begin
        Dat1.ReadOnly :=False;
        GetMaskText(Dat1);
     End;
end;

procedure TFHav.Dat1Exit(Sender: TObject);
begin
     If (Frodm.BHav.State = dsBrowse) Then Exit;
     SetMaskText(Dat1);
     If(Not Date_Check(Dat1.Text))And(DateToInt(Dat1.Text)>0) Then Dat1.SetFocus Else
       Frodm.BHavDat.Value :=DateToInt(Dat1.Text);
end;


procedure TFHav.FAccNamDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
     Accept:=(Source Is TXPListBox) And ((Source As TXPListBox).Name = 'lbName');
     Accept:=Accept and Not(Frodm.BHav.State =dsBrowse);
end;

procedure TFHav.FAccNamDragDrop(Sender, Source: TObject; X, Y: Integer);
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

procedure TFHav.FAccNamKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetAccountDBCombo(Sender,Key,'',0);
end;

procedure TFHav.FEQEnter(Sender: TObject);
begin
     If (Frodm.BHav.State = dsBrowse)or(Frodm.BHavPrice.Value>0) Then Exit;
     If Frodm.BHavCtip.AsString = DefaultCurr Then
      Rate := 1
     Else
      If Frodm.BHavRate.AsCurrency = 0 Then
       Rate:=GetRateatDate(Frodm.BHavCtip.AsString,Frodm.BHavDat.AsInteger)
      Else
       Rate:=Frodm.BHavRate.AsCurrency;
     Frodm.BHavRate.AsCurrency:=Rate;
     If Frodm.BHavCprice.Value = 0 Then Exit;
     Frodm.BHavPrice.Value:=(Frodm.BHavCprice.Value+Frodm.BHavCWage.Value)*Rate;
end;

procedure TFHav.FEQExit(Sender: TObject);
begin
     If (Frodm.BHav.State = dsBrowse)or(Frodm.BHavPrice.Value = 0) Then Exit;
     Frodm.BHavCPrice.Value:=(Frodm.BHavPrice.Value / Frodm.BHavRate.Value)-Frodm.BHavCwage.Value;
end;

procedure TFHav.JariKodDropDown(Sender: TObject);
var
Price:Currency;
begin
     If Frodm.BHav.State <> dsBrowse Then
     Begin
      Price:=(Frodm.BHavCWage.Value+Frodm.BHavCprice.Value)*Frodm.BHavRate.Value-
       Frodm.BHavPrice.Value;
      If Price = 0 Then
       Fill_Cond(Frodm.JariNam,'Nam','BKod='+QuotedStr(Frodm.BHavCtip.AsString),JariKod.Items)
      Else
       Fill_Comb(Frodm.JariNam,'Nam',JariKod.Items);
     End;
end;

procedure TFHav.FCKodKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetCentLookup(Sender,Key);
end;

procedure TFHav.BprintClick(Sender: TObject);
begin
     If Not(Frodm.BHav.State = dsBrowse) Then Exit;
     CreatingForm(TqrBHResid,'qrBHResid',qrBHResid);
     Set_Sys_Enviroment;
     qrBHResid.PrinterSettings.Copies:=PrnCnt;
     qrBHResid.qrDesc.Caption:=FarsiPrice(Frodm.BHavPrice.Value);// FDesc.Text;
     qrBHResid.qrCent.Caption:=FCKod.Text;
     qrBHResid.qrCashier.Caption:=JariKod.Text;
     qrBHResid.qrDCurr.Caption:=DefaultCurr;
     If cbPrint.Checked Then qrBHResid.Print Else qrBHResid.Preview;
     qrBHResid.Destroy;
end;


procedure TFHav.FRateKeyPress(Sender: TObject; var Key: Char);
begin
     NextTab(Sender,Key);
     If Frodm.BHav.State = dsBrowse Then Exit;
     If (Key In ['1','2','3','4','5','6','7','8','9','0']) Then Frodm.BHavPrice.Clear;

end;

end.
