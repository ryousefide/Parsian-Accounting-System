unit Exchange;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls, DBCtrls, Mask,Db;

type
  TFExchange = class(TForm)
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
    Label7: TLabel;
    FCKod: TDBLookupComboBox;
    FCtip: TDBLookupComboBox;
    Label9: TLabel;
    FEQ: TDBEdit;
    FRate: TDBEdit;
    FICtip: TDBLookupComboBox;
    Label4: TLabel;
    Sb: TStatusBar;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BDoClick(Sender: TObject);
    Procedure NextTab(Sender:TObject;Var Key:Char);
    procedure FPbillKeyPress(Sender: TObject; var Key: Char);
    procedure BexitClick(Sender: TObject);
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
  private
    { Private declarations }
    BehKod,BesKod:Real;
    State:Boolean;
    Price,Rem:Currency;
    St:String;
    Dat:Integer;
    RNo:Integer;
    BNo:Integer;
    BDat:Integer;
    MoFlag:Boolean;
    Rate:Currency;
    Procedure Make_Bill;
    Procedure SetBNo(BNo,No:Integer);
    Function MaxNo:Integer;
    Procedure FNo_Exit;
    Procedure MakeNew;
    Procedure DataClear;
  public
    { Public declarations }
  end;

var
  FExchange: TFExchange;

implementation

uses FrooshDM, Routins, ProVar, AcSearch, RMResid, AghsEdit, XPListBox,
  CRoutins, DbTables;
Const
FTip = 21;
{$R *.DFM}
Procedure TFExchange.NextTab(Sender:TObject;Var Key:Char);
begin
     If Key= #13 Then
     Begin
      Key:=#0;
      SelectNext(Sender As TWinControl,True,True);
     End;
end;

Procedure TFExchange.FNo_Exit;
begin
     If Not(Frodm.Exch.State =dsBrowse) Then
     Begin
       FNo.Text :=IntToStr(Frodm.ExchNo.Value);
       Exit;
     End;
     RNo:=StrToInt(FNo.Text);
     If Not(Frodm.Exch.Locate('No',RNo,[loCaseInsensitive])) Then MakeNew;
     Dat1.Text:=IntToDate(Frodm.ExchDat.Value);
end;

Procedure TFExchange.MakeNew;
begin
     If Not(Frodm.Exch.State=dsBrowse) Then Exit;
     Frodm.Exch.Append;
     Frodm.ExchNo.Value:=MaxNo+1;
     FNo.Text:=IntToStr(Frodm.ExchNo.Value);
     Frodm.ExchDat.Value:=FarDate;
     Frodm.ExchCtip.Value:=DefaultCurr;
     BDat:=Frodm.ExchDat.Value;
     Dat1.Text:=IntToDate(Frodm.ExchDat.Value);
     BNo:=0;
     RNo:=Frodm.ExchNo.Value;
     MoFlag:=True;
end;

Function TFExchange.MaxNo;
begin
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Max(R.No) From Cexchange R ');
     Qu.Open;
     Result:=Qu.Fields[0].AsInteger;
     Qu.Close;
end;

Procedure TFExchange.Make_Bill;
Var
NBNo:Integer;
begin
     BDat:=Frodm.ExchDat.Value;
     BesKod:=Def_Exh;
     BehKod:=Frodm.ExchAccKod.Value;
     Rate:=GetrateatDate(Frodm.ExchCTip.Value,Frodm.ExchDat.AsInteger);
     Price:=Frodm.ExchAmount.Value*Rate;
     State:=sABill;
     St:='Exchange '+FPBill.Text+' '+FCtip.Text+' to '+FiCtip.Text;
     NBNo:=AutoBill(State,BesKod,BehKod,Price,St,IntToStr(RNo),BNo,FTip,BDat,
     '',Frodm.ExchCKod.AsInteger,Frodm.ExchAmount.Value,Rate,Frodm.ExchCtip.AsString);

     Rate:=GetrateatDate(Frodm.ExchICTip.Value,Frodm.ExchDat.AsInteger);
     Price:=Frodm.ExchIAmount.Value*Rate;
     NBNo:=AutoBill(State,BehKod,BesKod,Price,St,IntToStr(RNo),BNo,FTip,BDat,
     '',Frodm.ExchCKod.AsInteger,Frodm.ExchIAmount.Value,Rate,Frodm.ExchICtip.AsString);

     If NBNo = BNo Then
      BillUpdate(BNo)
     Else
      If sBill Then
       MakeBill(' ÓäÏ ÑÓíÏ ÊÈÏíá ÇÑÒí  ÔãÇÑå'+FNo.Text);
     BNo:=NBNo;
end;

Procedure TFExchange.SetBNo(BNo,No:Integer);
begin
     If BNo=0 Then Exit;
     If Frodm.Exch.Locate('No',No,[locaseInsensitive]) Then
     Begin
      Frodm.Exch.Edit;
      Frodm.ExchBno.Value:=BNo;
      Frodm.Exch.Post;
     End;
end;

Procedure TFExchange.DataClear;
begin
     BNo:=0;
     RNo:=0;
     BDat:=0;
     St:='';
end;
procedure TFExchange.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     Frodm.Exch.Open;
     MoFlag:=True;
     FCtip.ListField:=CUser.CurrField;
     FICtip.ListField:=CUser.CurrField;
     FCKod.ListField:=CUser.CentField;
     FAccnam.ListField:=CUser.AcField;
     State:=sABill;
     Frodm.Exch.Last;
     FNo.Text:=IntToStr(Frodm.ExchNo.Value);
     Dat1.Text:=IntToDate(Frodm.ExchDat.Value);
     If sFac Then MakeNew;
end;

procedure TFExchange.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
     IF Frodm.Exch.State = dsInsert Then Check_State(Frodm.Exch,BDoClick);
     MoFlag:=Frodm.Exch.State = dsBRowse;
     If (Frodm.Exch.State = dsEdit) Or Not MoFlag Then Action :=caNone;
     If Action=caFree Then Frodm.Exch.Close;
end;

procedure TFExchange.BDoClick(Sender: TObject);
Var
AtfQu:TQuery;
begin
     If Frodm.Exch.State = dsBrowse Then Exit;
     MoFlag:=True;
     Price:=Frodm.ExchAmount.Value;
     If (Price = 0) or (FAccNam.KeyValue = '') Then//FPBill.Text = ''
     Begin
       ShowMessage('ÇØáÇÚÇÊ ßÇÝí äíÓÊäÏ');
       MoFLag:=False;
       Exit;
     End;
     FNo.SetFocus;
     Frodm.ExchAccKod.Value:=AccKod(FAccNam.Text);
//---Get No From Database---
     AtfQu:=TQuery.Create(Application);
     AtfQu.DataBaseName:=CurrDb;
     AtfQu.SQL.Clear;
     AtfQu.SQL.Add('Set Transaction Isolation Level Serializable');
     AtfQu.SQL.Add('begin Transaction Select Max(A.No) From CExchange A With (TabLockX) commit transaction');
     If Frodm.Exch.State=dsInsert Then
     Begin
      AtfQu.Open;
      RNo:=AtfQu.Fields[0].AsInteger+1;
     End;
     Frodm.ExchNo.Value:=RNo;
     FNo.Text:=Frodm.ExchNo.AsString;
//---------------------------
     Frodm.Exch.Post;
     AtfQu.Close;
     Make_Bill;
     SetBNo(BNo,RNo);
     QuickCloseOpen([6,24,74]);
     Frodm.Exch.Locate('No',RNo,[loCaseInsensitive]);
     DataClear;
     If sFac Then MakeNew;
     FPBill.SetFocus;
end;

procedure TFExchange.FPbillKeyPress(Sender: TObject; var Key: Char);
begin
     NextTab(Sender,Key);
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0','-',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;
end;

procedure TFExchange.BexitClick(Sender: TObject);
begin
     If Frodm.Exch.State =dsEdit Then Exit;
     FNo.SetFocus;
     Check_State(Frodm.Exch,BDoClick);
     If Not MoFLag Then Exit;
     Close;
end;

procedure TFExchange.BeditClick(Sender: TObject);
begin
     If Not(Frodm.Exch.State = dsBRowse) Then Exit;
     BNo:=Frodm.ExchBNo.Value;
     BDat:=Frodm.ExchDat.Value;
     RNo :=Frodm.ExchNo.Value;
     //FAccNam.ItemIndex:=FAccNam.Items.IndexOf(FAccNam.Text); 
     DelBitem(IntToStr(RNo),BNo,FTip);
     Frodm.Exch.Edit;
     Rate:=Frodm.ExchRate.AsCurrency;
     FPBill.SetFocus;
end;

procedure TFExchange.BDelClick(Sender: TObject);
begin
     If Not(Frodm.Exch.State = dsBRowse) Then Exit;
     If MessageDlg(Delconfirm,mtWarning,mbYesNo,0) = idYes Then
     Begin
      BNo:=Frodm.ExchBNo.Value;
      BDat:=Frodm.ExchDat.Value;
      RNo :=Frodm.ExchNo.Value;
      DelBitem(IntToStr(RNo),BNo,FTip);
      BillUpdate(BNo);
      Frodm.Exch.Delete;
      FNo.Text:=IntToStr(Frodm.ExchNo.Value);
      Dat1.Text:=IntToDate(Frodm.ExchDat.Value);
     End;
end;

procedure TFExchange.FNoKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then FNo_Exit;
     NextTab(Sender,Key);
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;

end;

procedure TFExchange.BprevClick(Sender: TObject);
begin
     IF Frodm.Exch.State = dsEdit Then Exit;
     IF Frodm.Exch.State = dsInsert Then
     Begin
      FNo.SetFocus;
      Check_State(Frodm.Exch,BDoClick);
      MoFlag:=Frodm.Exch.State =dsBrowse;
      FNo.Text:=IntToStr(Frodm.ExchNo.Value);
      Dat1.Text:=IntToDate(Frodm.ExchDat.Value);
      Exit;
     End;
     MoFlag:=Frodm.Exch.State =dsBrowse;
     If Not MoFLag Then Exit;
     Frodm.Exch.Prior;
     FNo.Text:=IntToStr(Frodm.ExchNo.Value);
     Dat1.Text:=IntToDate(Frodm.ExchDat.Value);
end;

procedure TFExchange.BnextClick(Sender: TObject);
begin
     IF Frodm.Exch.State = dsEdit Then Exit;
     IF Frodm.Exch.State = dsInsert Then
     Begin
      FNo.SetFocus;
      Check_State(Frodm.Exch,BDoClick);
      MoFlag:=Frodm.Exch.State =dsBrowse;
      FNo.Text:=IntToStr(Frodm.ExchNo.Value);
      Dat1.Text:=IntToDate(Frodm.ExchDat.Value);
      Exit;
     End;
     MoFlag:=Frodm.Exch.State =dsBrowse;
     If Not MoFLag Then Exit;
     Frodm.Exch.Next;
     FNo.Text:=IntToStr(Frodm.ExchNo.Value);
     Dat1.Text:=IntToDate(Frodm.ExchDat.Value);
end;

procedure TFExchange.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFExchange.Dat1Enter(Sender: TObject);
begin
     If Frodm.Exch.State = dsBrowse Then Dat1.ReadOnly :=True Else
     Begin
        Dat1.ReadOnly :=False;
        GetMaskText(Dat1);
     End;
end;

procedure TFExchange.Dat1Exit(Sender: TObject);
begin
     If (Frodm.Exch.State = dsBrowse) Then Exit;
     SetMaskText(Dat1);
     If(Not Date_Check(Dat1.Text))And(DateToInt(Dat1.Text)>0) Then Dat1.SetFocus Else
       Frodm.ExchDat.Value :=DateToInt(Dat1.Text);
end;

procedure TFExchange.FAccNamKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetAccountDbCombo(Sender,Key,'',0);
end;

procedure TFExchange.FEQEnter(Sender: TObject);
begin
     If (Frodm.Exch.State = dsBrowse)Then Exit;
     Frodm.ExchIAmount.Value:=Frodm.ExchRate.Value*Frodm.ExchAmount.Value;
end;

procedure TFExchange.FCKodKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetCentLookup(Sender,Key);
end;

end.
