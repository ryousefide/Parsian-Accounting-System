unit Accpri;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, CheckLst,DbTables, ExtCtrls, Mask, Db, XPCheckListBox, ComCtrls,
  Buttons;

type
  TFAccPri = class(TForm)
    FAccList: TXPCheckListBox;
    Bexit: TButton;
    Btaraz: TButton;
    Sb1: TStatusBar;
    Bevel1: TBevel;
    Bevel2: TBevel;
    AcType: TRadioGroup;
    BTalf: TButton;
    Label2: TLabel;
    FCap: TEdit;
    EDat: TMaskEdit;
    Label3: TLabel;
    cbPrint: TCheckBox;
    GQu: TQuery;
    GQuDat: TIntegerField;
    GQuBedeh: TCurrencyField;
    GQuBestan: TCurrencyField;
    GQuBedRem: TCurrencyField;
    GQuBesRem: TCurrencyField;
    GQuBaghi: TCurrencyField;
    GQuDesc: TStringField;
    GQuNo: TIntegerField;
    GQuDiag: TCurrencyField;
    GQuDs: TDataSource;
    Label4: TLabel;
    Sp: TSpeedButton;
    Label6: TLabel;
    SpCen: TSpeedButton;
    FCostN: TComboBox;
    FCentN: TComboBox;
    Label5: TLabel;
    cbCurr: TComboBox;
    procedure FormActivate(Sender: TObject);
    procedure BexitClick(Sender: TObject);
    procedure BtarazClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FAccListClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure NextTab(Sender: TObject; var Key: Char);
    procedure BTalfClick(Sender: TObject);
    procedure EDatEnter(Sender: TObject);
    procedure EDatExit(Sender: TObject);
    procedure SpClick(Sender: TObject);
    procedure SpCenClick(Sender: TObject);
  private
    { Private declarations }
    Procedure Gardesh_Tal(AcNam:String);
    Procedure Gardesh_Tal_ARzi(AcNam,Curr:String);
    Function Tel(AcNam:String):String;
    Function Mas(AcNam:String):String;

  public
    { Public declarations }
  end;

var
  FAccPri: TFAccPri;

implementation

uses FrooshDM, Routins, ProVar, GardeshRep, TarazReport, AccKoding,
  CustBRep, CustBill, CRoutins;

{$R *.DFM}

Function TFAccPri.Tel(AcNam:String):String;
begin
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Tel From AccountKod A Where A.Nam =');
     Qu.SQL.Add(#39+AcNam+#39);
     Qu.Open;
     Result:=Qu.Fields[0].AsString;
     Qu.Close;
end;

Function TFAccPri.Mas(AcNam:String):String;
begin
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Mas From AccountKod A Where A.Nam =');
     Qu.SQL.Add(#39+AcNam+#39);
     Qu.Open;
     Result:=Qu.Fields[0].AsString;
     Qu.Close;
end;

Procedure TFAccPri.Gardesh_Tal(AcNam:String);
Var
Rem,bsRem:Currency;
Bed,Bes:Currency;
Dat,EnDat:Integer;
Ratio:Real;
AcKod:Real;
begin
     EnDat:=DateToInt(EDat.Text);
     AcKod:=AccKod(AcNam);
     Frodm.Gardesh.Last;
     Rem:=Frodm.GardeshBaghi.Value;
     Ratio:=0;
     Case AcType.ItemIndex Of
      0:Ratio:=999999999;
      1:Ratio:=999999;
      2:Ratio:=999;
      3:Ratio:=0;
     End;
     If EnDat = 0 Then
     Begin
      Gardesh_Sum(AcKod,Ratio,Bed,Bes,Dat,'','',FCentN.Text,FCostN.Text);
      bsRem:=Bed-Bes;
     End Else
      bsRem:=FCustBill.Dated_Remain(AcKod,EnDat,FCentN.Text,FCostN.Text,Dat);
     Frodm.Gardesh.Append;
     Frodm.GardeshDat.Value:=Dat;
     Frodm.GardeshDesc.Value:=BillString(AcKod)+'  '+Tel(AcNam);//AcNam
     If bsRem > 0 Then Frodm.GardeshBedeh.Value:=Abs(bsRem) Else
        Frodm.GardeshBestan.Value:=Abs(bsRem);
     Frodm.GardeshDiag.Value:=bsRem;
     Rem:=Rem+bsRem;
     Frodm.GardeshBaghi.Value:=Rem;
     Frodm.Gardesh.Post;
end;

Procedure TFAccPri.Gardesh_Tal_ARZI(AcNam,Curr:String);
Var
Rem,bsRem:Currency;
Bed,Bes:Currency;
Dat,EnDat:Integer;
Ratio:Real;
AcKod:Real;
begin
     EnDat:=DateToInt(EDat.Text);
     AcKod:=AccKod(AcNam);
     Frodm.Gardesh.Last;
     Rem:=Frodm.GardeshBaghi.Value;
     Ratio:=0;
     Case AcType.ItemIndex Of
      0:Ratio:=999999999;
      1:Ratio:=999999;
      2:Ratio:=999;
      3:Ratio:=0;
     End;
     If EnDat = 0 Then
     Begin
      Gardesh_Sum_Arzi(AcKod,Ratio,Bed,Bes,Dat,'','',FCentN.Text,FCostN.Text,Curr);
      bsRem:=Bed-Bes;
     End Else
      bsRem:=FCustBill.Dated_Remain_Arzi(AcKod,EnDat,FCentN.Text,FCostN.Text,Dat,Curr);
     Frodm.Gardesh.Append;
     Frodm.GardeshDat.Value:=Dat;
     Frodm.GardeshDesc.Value:=BillString(AcKod)+'  '+Tel(AcNam);//AcNam
     If bsRem > 0 Then Frodm.GardeshBedeh.Value:=Abs(bsRem) Else
        Frodm.GardeshBestan.Value:=Abs(bsRem);
     Frodm.GardeshDiag.Value:=bsRem;
     Rem:=Rem+bsRem;
     Frodm.GardeshBaghi.Value:=Rem;
     Frodm.Gardesh.Post;
end;

procedure TFAccPri.NextTab(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
       Key := #0;
       FAccPri.SelectNext(Sender As TWinControl,True,True);
     End;
end;

procedure TFAccPri.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     GQu.DatabaseName:=CurrDb;
     FCostN.Items.Assign(CostList);
     Fill_Comb(Frodm.Cent,'Nam',FCentN.Items);
     cbCurr.Items.Assign(CurrList);
     FormActivate(Sender);
end;

procedure TFAccPri.FormActivate(Sender: TObject);
Var
I,Tip,Idx:Integer;
begin
     FAccList.Items.Clear;
     Frodm.AcKod.First;
     For I:=1 To Frodm.AcKod.RecordCount do
     Begin
      Tip:=AccountType(Frodm.AckodAccKod.Value);//FAccKoding.AcTip
      If (Tip = AcType.ItemIndex+1)and(Frodm.AcKodKdas.Value<>1) Then
      Begin
       Idx:=FAccList.Items.Add(Frodm.AcKodNam.Value);
       FAccList.AcCode[Idx]:=Frodm.AcKodAcckod.AsFloat;
      End;
      Frodm.AcKod.Next;
     End;
end;

procedure TFAccPri.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     IF Key = VK_F3 Then BtarazClick(sender);
end;

procedure TFAccPri.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
     Open_g(Frodm.Gardesh);
     Frodm.Gardesh.Active :=False;
     Frodm.Gardesh.Exclusive :=False;
end;

procedure TFAccPri.FAccListClick(Sender: TObject);
Var
Str:String;
I:Real;
begin
     I:= AccKod(FaccList.Items[FaccList.ItemIndex]);
     Str:=AccString(I);
     Sb1.Panels[0].Text:=Str;
     Sb1.Hint:=Str;
end;

procedure TFAccPri.BTalfClick(Sender: TObject);
Var
I:Integer;
aList:TStringlist;
begin
     aList:=TStringList.Create;
     Create_Gardesh_Table('Gardesh'+IntToStr(CUser.Id));
     GQu.SQL.Clear;
     GQu.SQL.Add('Select * From '+Frodm.Gardesh.TableName+' order by Id');
     Open_g(Frodm.Gardesh);
     For I:=0 To FAccList.Items.Count-1 Do
     If FAccList.State[I] = cbChecked Then aList.Add(Facclist.Items[i]);
     For I:=0 To aList.Count-1 Do  If cbCurr.Text = '' Then
                                    Gardesh_Tal(aList.Strings[I])
                                   Else
                                    Gardesh_Tal_Arzi(aList.Strings[I],cbCurr.Text);
     GQu.Close;
     GQu.Open;
     Close_g(Frodm.Gardesh);
     Delete_Gardesh_Table;

     CreatingForm(TGReport,'GReport',GReport);
     Set_Sys_Enviroment;

     GReport.SBed:=0;
     GReport.SBes:=0;
     GReport.QRDBText1.DataSet:=GQu;
     GReport.QRDBText2.DataSet:=GQu;
     GReport.QRDBText3.DataSet:=GQu;
     GReport.QRDBText4.DataSet:=GQu;
     GReport.QRDBText5.DataSet:=GQu;
     GReport.QRDBText6.DataSet:=GQu;
     GReport.QRSubDetail1.DataSet:=GQu;

     Greport.Cap:=CbCurr.Text;
     GReport.qrTit.Caption:=InvoLbl;
     GReport.qrLabel1.Caption:='ê—œ‘  ·›ÌﬁÌ Õ”«» Â«Ì «‰ Œ«» ‘œÂ';
     GReport.AccNam.Caption:=FCap.Text;
     If cbPrint.Checked Then GReport.Print Else  GReport.Preview;
     GReport.Destroy;
end;

procedure TFAccPri.BtarazClick(Sender: TObject);
Var
AcNam:String[45];
AcKod:Real;
Price:Currency;
I:Integer;
Dat,EndDat:Integer;
aList:TStringlist;
begin
     aList:=TStringList.Create;
     EndDat:=DateToInt(Edat.Text);
     If EndDat = 0 Then
     Begin
       ShowMessage(' «—ÌŒ „‘Œ’ ‰Ì” ');
       Exit;
     End;
     CreatingForm(TFCustBRep,'FCustBRep',FCustBRep);
     Set_Sys_Enviroment;
     FCustBRep.qrTit.Caption:=InvoLbl;
     FCustBRep.qrTit2.Caption:=BarNamLbl;
     FCustBRep.qrFdat.Caption:=IntToDate(Fardate);
     FCustBRep.qrCom.Caption:=Comm;

     For I:=0 To FAccList.Items.Count-1 Do
      If FAccList.State[I] = cbChecked Then aList.Add(Facclist.Items[i]);
     For I:=0 To aList.Count-1 Do
     Begin
      AcNam:=aList.Strings[I];
      AcKod:=AccKod(AcNam);
      Price:=FCustBill.Dated_Remain(AcKod,EndDat,FCentN.Text,FCostN.Text,Dat);
      If Price <> 0 Then
      Begin
       FCustBRep.ReportTitle:='’Ê—  „«‰œÂ '+AcNam;
       FCustBRep.qrNam.Caption:='';//Mas(AcNam);
       FCustBRep.qrAc.Caption:=AcNam;
       FCustBRep.qrRdat.Caption:=IntToDate(Dat);
       FCustBRep.qrPice.Caption:=CurrToFar(Price);
       FCustBRep.qrFPrice.Caption:=FarsiPrice(Abs(Price));
       If Price < 0 Then
         FCustBRep.qrFPrice.Caption:=FCustBRep.qrFPrice.Caption+'     »” «‰ﬂ«—'
       Else
         FCustBRep.qrFPrice.Caption:=FCustBRep.qrFPrice.Caption+'     »œÂﬂ«—';
       If cbPrint.Checked Then FCustBRep.Print Else FCustBRep.Preview;
      End;
     End;
     FCustBRep.Destroy;
     AList.Free;
end;

procedure TFAccPri.BexitClick(Sender: TObject);
begin
     Frodm.Gardesh.Active :=False;
     Frodm.Gardesh.Exclusive :=False;
     FAccPri.Close;
end;

procedure TFAccPri.EDatEnter(Sender: TObject);
begin
     GetMaskText(EDat);
end;

procedure TFAccPri.EDatExit(Sender: TObject);
begin
     SetMaskText(EDat);
     If (Not Date_Check(EDat.Text))and(DateToInt(EDat.Text)>0) Then EDat.SetFocus;
end;

procedure TFAccPri.SpClick(Sender: TObject);
begin
     FCostN.ItemIndex:=-1;
     FCostN.Text:=C_Choose;
end;

procedure TFAccPri.SpCenClick(Sender: TObject);
begin
     FCentN.Text:=A_Choose;
end;

end.
