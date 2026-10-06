unit PCheq;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, Mask, ExtCtrls,Db, Buttons, DBTables;

type
  TFPcheq = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBText1: TDBText;
    Label4: TLabel;
    FPBill: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    DBText2: TDBText;
    DBText3: TDBText;
    Label7: TLabel;
    Bprev: TButton;
    Bsave: TBitBtn;
    Bnext: TButton;
    Bedit: TButton;
    Bexit: TButton;
    Fno: TEdit;
    Bevel2: TBevel;
    DBText5: TDBText;
    Label8: TLabel;
    FDesc: TDBEdit;
    Fpaykod: TDBCheckBox;
    Bdel: TButton;
    Bevel1: TBevel;
    Dat1: TMaskEdit;
    Bprint: TButton;
    SDat: TMaskEdit;
    Label9: TLabel;
    Label10: TLabel;
    FCost: TDBComboBox;
    FCKod: TDBLookupComboBox;
    lCurr: TStaticText;
    Label12: TLabel;
    FCtip: TDBComboBox;
    Label13: TLabel;
    FCPric: TDBEdit;
    FAccNam: TDBComboBox;
    procedure BprevClick(Sender: TObject);
    procedure BeditClick(Sender: TObject);
    procedure BsaveClick(Sender: TObject);
    procedure BnextClick(Sender: TObject);
    procedure BexitClick(Sender: TObject);
    procedure BdelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FnoKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure Dat1Enter(Sender: TObject);
    procedure Dat1Exit(Sender: TObject);
    procedure NextTab(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FpaykodMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BprintClick(Sender: TObject);
    procedure SDatEnter(Sender: TObject);
    procedure SDatExit(Sender: TObject);
    procedure FCPricEnter(Sender: TObject);
  private
    { Private declarations }
    BNo:Integer;
    BDat:Integer;
    Rate:Currency;
    Procedure SetPayBNo(BNo:Integer;Serial:String);
  public
    { Public declarations }
  end;

var
  FPcheq: TFPcheq;

implementation

uses FrooshDM, Routins, ProVar, RcheqRep, CRoutins;

{$R *.DFM}
Procedure TFPcheq.SetPayBNo(BNo:Integer;Serial:String);
begin
     If BNo =0 Then Exit;
     If Frodm.Pcheq.Findkey([Serial]) Then //,[loCaseInsensitive]) Then
     Begin
      Frodm.Pcheq.Edit;
      Frodm.PcheqPBNo.Value:=BNo;
      Frodm.Pcheq.Post;
     End;
end;


procedure TFPcheq.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     Frodm.Pcheq.Open;
     Frodm.Pcheq.IndexFieldNames:='Bno';
     FAccNam.Items.Assign(AcList);
     FCost.Items.Assign(CostList);
     FCtip.Items.Assign(CurrList);
     If Frodm.Pcheq.IsEmpty Then
     Begin
      Bedit.Enabled:=False;
      BDel.Enabled :=False;
      Exit;
     End;
     BDel.Enabled:=Boss;
     SDat.Text:=IntToDate(Frodm.PCheqPayDat.Value);
     Dat1.Text:=IntToDate(Frodm.PCheqBDat.Value);
     lCurr.Caption:=DefaultCurr;
end;

procedure TFPcheq.NextTab(Sender: TObject; var Key: Char);
begin
     IF Key = #13 Then
     Begin
      Key :=#0;
      SelectNext(Sender As TWinControl,True,True);
     End;
end;

procedure TFPcheq.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
     If Frodm.Pcheq.State = dsEdit Then Action:=caNone;
     If Action = caFree Then Frodm.Pcheq.Close; 
end;

procedure TFPcheq.BprevClick(Sender: TObject);
begin
     If Frodm.Pcheq.State = dsEdit Then Exit;
     BDel.Enabled:=Frodm.PcheqPaykod.Value=False;//BDel.Enabled:=Frodm.PcheqAccKod.Value = 0;
     FNo.SetFocus;
     Check_State(Frodm.Pcheq,BsaveClick);
     FroDM.Pcheq.Prior;
     Dat1.Text:=IntToDate(Frodm.PCheqBDat.Value);
     SDat.Text:=IntToDate(Frodm.PCheqPayDat.Value);
end;

procedure TFPcheq.BeditClick(Sender: TObject);
begin
     If Frodm.PCheqBDat.Value > 0 Then Dat1.Text:=IntToDate(Frodm.PCheqBDat.Value)
          Else Dat1.Text:='13  /  /  ';//IntToDate(Fardate);
     If Frodm.PCheqPayDat.Value > 0 Then SDat.Text:=IntToDate(Frodm.PCheqPayDat.Value)
          Else SDat.Text:='13  /  /  ';//IntToDate(Fardate);
     If Frodm.PcheqPaykod.Value  = True Then Exit;
     BNo:=Frodm.PcheqPBNo.Value;
     BDat:=Frodm.PcheqPaydat.Value;
     IF (BNo = -1) and (Frodm.PcheqPbill.Value >0) Then
     Begin
       ShowMessage('ß ãÑÈæØ Èå ÇÝÊÊÇÍíå ãí ÈÇÔÏ.ÇÒ ãäæí ÊÕÍíÍ ß åÇí Çæá ÏæÑå ÇÞÏÇã ßäíÏ');
       Exit;
     End;
     DelBitem(Frodm.PcheqBNo.AsString,BNo,9);
     BillUpdate(BNo);
     FroDM.Pcheq.Edit;
     IF Frodm.PcheqPaydat.Value = 0 Then
     Begin
      Frodm.PcheqPaydat.Value:=Fardate;
      Sdat.Text:=IntToDate(Frodm.PcheqPaydat.Value);
     End;
     Bdel.Enabled :=Boss;
     Bsave.Enabled :=True;
     SDat.SetFocus;
end;

procedure TFPcheq.BsaveClick(Sender: TObject);
var
Kod,AcKod:Real;
Stat:Boolean;
St:String;
NewB:Integer;
begin
     If  FroDM.Pcheq.State = dsBrowse Then Exit;

     If (Frodm.PcheqPBill.Value > 0)Then // And (Frodm.PcheqAccKod.Value > 0)Then
     Begin
      FNo.SetFocus;
      Frodm.PcheqAcckod.value:=AccKod(Frodm.PcheqAcNam.AsString);
      If Frodm.PcheqAccKod.Value = 0 Then Frodm.PcheqPbill.Value:=0;
      FroDM.Pcheq.Post;
      BDat:=Frodm.PcheqPaydat.Value;//Handi Date
      Frodm.AutoBill.FindKey(['PCH']);
      Stat:=FroDM.AutoBill.FieldByName('Stat').AsBoolean;
      Kod:=Frodm.PcheqPKod.AsFloat;
      Ackod:=Frodm.PcheqAcckod.AsFloat;
      If Frodm.PcheqPaydat.Value = 0 Then Frodm.PcheqPaydat.Value:=Fardate;
      St:= 'ÕÏæÑß ÔãÇÑå'+Frodm.PcheqBNo.AsString+Frodm.PcheqDesc.Value ;
      NewB:=AutoBill(Stat,Kod,Ackod,Frodm.PcheqPBill.Value,St,
      Frodm.PcheqBno.AsString,BNo,9,BDat,Frodm.PcheqCost.AsString,Frodm.PcheqCkod.AsInteger,
      Frodm.PcheqCprice.Value,Frodm.PcheqRate.Value,Frodm.PcheqCtip.Value);
      IF NewB = BNo Then
       BillUpdate(BNo)
      Else
       If sBill Then MakeBill(St);
      BNo:=NewB;
     End;
//     If Frodm.PcheqAccKod.Value = 0 Then Frodm.PcheqPbill.Value:=0;
//     FroDM.Pcheq.Post;
     SetPayBNo(BNo,Frodm.PcheqBNo.AsString);
     QuickCloseOpen([7,6,24]);
     Frodm.Pcheq.FindKey([Fno.Text]);//Locate('BNo',Fno.Text,[loCaseInsensitive]);//
     BSave.Enabled :=False;
     Bdel.Enabled:=False;
     BNo:=0;
     BDat:=0;
end;

procedure TFPcheq.BnextClick(Sender: TObject);
begin
     If Frodm.Pcheq.State = dsEdit Then
     Begin
      Beep;
      ShowMessage('ÇÈÊÏÇ ÑßæÑÏ ÌÇÑí ÑÇ ËÈÊ ßäíÏ');
      Exit;
     End;
     FNo.SetFocus;
     Check_State(Frodm.Pcheq,BsaveClick);
     FroDM.Pcheq.Next;
     BDel.Enabled:=Frodm.PcheqPaykod.Value=False;//BDel.Enabled:=Frodm.PcheqAccKod.Value = 0;
     Dat1.Text:=IntToDate(Frodm.PCheqBDat.Value);
     SDat.Text:=IntToDate(Frodm.PCheqPayDat.Value);
end;

procedure TFPcheq.BexitClick(Sender: TObject);
begin
     If Frodm.Pcheq.State = dsEdit Then
     Begin
      Beep;
      ShowMessage('ÇÈÊÏÇ ÑßæÑÏ ÌÇÑí ÑÇ ËÈÊ ßäíÏ');
      Exit;
     End;
     FNo.SetFocus;
     Check_State(Frodm.Pcheq,BsaveClick);
     FPcheq.Close;
end;

procedure TFPcheq.BdelClick(Sender: TObject);
begin
     If ((Frodm.PcheqPaydat.Value > DateToInt(Beg_Date))Or(Frodm.PcheqPaydat.Value = 0)) And
      (Frodm.PcheqPaykod.Value=False) Then Frodm.Pcheq.Edit;//(Frodm.pcheqPBNo.Value = 0 )
     If FroDM.Pcheq.State = dsBrowse Then Exit;
//-------------
     BNo:=Frodm.PcheqPBNo.Value;
     BDat:=Frodm.PcheqPaydat.Value;
     DelBitem(Frodm.PcheqBNo.AsString,BNo,9);
     BillUpdate(BNo);
//     FroDM.Pcheq.Edit;
//----------------------------------
     BNo:=0;
     BDat:=0;
     Frodm.PcheqAcckod.Clear;//Value:=0;
     Frodm.PcheqDesc.Value:='';
     Frodm.PcheqPbill.Clear;//Value:=0;
     Frodm.PcheqPaydat.Clear;//Value:=0;
     Frodm.PcheqBdat.Clear;//Value:=0;
     Dat1.Text:='13  /  /  ';
     Frodm.PcheqPBNo.Clear;//Value:=0;
     FNo.SetFocus;
     Frodm.Pcheq.Post;
     QuickCloseOpen([7,6,24]);
     Frodm.Pcheq.FindKey([Fno.Text]);//Locate('BNo',Fno.Text,[loCaseInsensitive]);//
     BSave.Enabled :=False;
     Bdel.Enabled:=False;
//     BNo:=0;
//     BDat:=0;
     Bdel.Enabled :=False;

end;

procedure TFPcheq.FnoKeyPress(Sender: TObject; var Key: Char);
begin
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;
//     If(Key =#13)And(FroDM.Pcheq.FindKey([FNo.Text])) Then
     If Not(Frodm.Pcheq.State = dsBrowse) Then Exit;
     If(Key =#13)And(FroDM.Pcheq.FindKey([FNo.Text])) Then//Locate('BNo',sSerial,[loCaseInsensitive])) Then//
     Begin
      Key:=#0;
      Dat1.Text:=IntToDate(Frodm.PcheqBdat.Value);
      SDat.Text:=IntToDate(Frodm.PCheqPayDat.Value);
      BDel.Enabled:=Frodm.PcheqPaykod.Value=False;// AccKod.Value = 0;
     End;
end;


procedure TFPcheq.Dat1Enter(Sender: TObject);
begin
     If Frodm.Pcheq.State = dsBrowse Then Dat1.ReadOnly :=True Else
     Begin
        Dat1.ReadOnly :=False;
        GetMaskText(Dat1);
     End;
end;

procedure TFPcheq.Dat1Exit(Sender: TObject);
begin
     If (Frodm.Pcheq.State = dsBrowse) Then Exit;
     SetMaskText(Dat1);
     If (Not Date_Check(Dat1.Text))And(DateToInt(Dat1.Text)>0) Then Dat1.SetFocus Else
         Frodm.PcheqBdat.Value :=DateToInt(Dat1.Text);
end;

procedure TFPcheq.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     IF Key = VK_F3 Then BsaveClick(Sender);
end;

procedure TFPcheq.FpaykodMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
     IF (Button=mbLeft)and(CUser.Name = 'ãÏíÑíÊ ãÇáí')  Then
      If MessageDlg('ÂíÇ æÖÚíÊ æÕæá ß ÊÛííÑ ãíßäÏ¿',mtWarning,mbYesNo,0) = mrYes Then
      Begin
        Frodm.Pcheq.Edit;
        Frodm.PcheqPaykod.Value :=Not Frodm.PcheqPaykod.Value;
        Frodm.Pcheq.Post;
      End;

end;

procedure TFPcheq.BprintClick(Sender: TObject);
begin
{     If Not(Frodm.Pcheq.State = dsBrowse) Then Exit;
     CreatingForm(TQrRcheq,'QrRcheq',QrRcheq);
     QrRcheq.qrTit.Caption:=InvoLbl;
     QrRcheq.qrAdd.Caption:=Master;
     QrRcheq.qrFdat.Caption:=DbText1.Field.DisplayText;
     QrRcheq.qrNam.Caption:=DbText2.Field.DisplayText;
     QrRcheq.qrBno.Caption:=DbText5.Field.DisplayText;
     QrRcheq.qrFPrice.Caption:=FarsiPrice(Frodm.PcheqPBill.Value);
     QrRcheq.qrDes.Caption:=FDesc.Text;
     QrRcheq.qrJari.Caption:=DbText3.Field.DisplayText;
     QrRcheq.qrBdat.Caption:=IntToDate(Frodm.PcheqBDat.Value);
     QrRcheq.qrPBill.Caption:=CurrToFar(Frodm.PcheqPBill.Value);
     QrRcheq.Preview;
     QrRcheq.Destroy;}
end;

procedure TFPcheq.SDatEnter(Sender: TObject);
begin
     If Frodm.Pcheq.State = dsBrowse Then SDat.ReadOnly :=True Else
     Begin
        SDat.ReadOnly :=False;
        GetMaskText(SDat);
     End;
end;

procedure TFPcheq.SDatExit(Sender: TObject);
begin
     If (Frodm.Pcheq.State = dsBrowse) Then Exit;
     SetMaskText(SDat);
     If(Not Date_Check(SDat.Text))And(DateToInt(SDat.Text)>0) Then SDat.SetFocus Else
       Frodm.PcheqPayDat.Value :=DateToInt(SDat.Text);
end;

procedure TFPcheq.FCPricEnter(Sender: TObject);
begin
     If (Frodm.Pcheq.State = dsBrowse)or(Frodm.PcheqCPrice.Value>0) Then Exit;
     Rate:=GetRateatDate(Frodm.PcheqCtip.AsString,Frodm.PcheqPayDat.AsInteger);
     If Rate > 0 Then Frodm.PcheqCPrice.Value:=Frodm.PcheqPBill.Value/Rate;
end;

end.
