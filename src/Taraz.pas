unit Taraz;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DbTables,  Db, Buttons, Mask, XPCheckListBox, ExtCtrls, CheckLst;

type
  TFTaraz = class(TForm)
    FAccList: TXpCheckListBox;
    Bexit: TButton;
    Btaraz: TBitBtn;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label2: TLabel;
    FCap: TEdit;
    AcType: TRadioGroup;
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
    Sdat: TMaskEdit;
    Label1: TLabel;
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
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EDatEnter(Sender: TObject);
    procedure EDatExit(Sender: TObject);
    procedure SdatEnter(Sender: TObject);
    procedure SdatExit(Sender: TObject);
    procedure NextTab(Sender: TObject; var Key: Char);
    procedure SpClick(Sender: TObject);
    procedure SpCenClick(Sender: TObject);
  private
    { Private declarations }
    Procedure Sums;
    Procedure Gardesh_Kol_Dated(Kod:Real;Dat,SDat:Integer;Cent,Cost:String);
  public
    { Public declarations }
  end;

var
  FTaraz: TFTaraz;

implementation

uses FrooshDM, Routins, TarazReport, ProVar, AccKoding, CRoutins;

{$R *.DFM}
Procedure TFTaraz.Sums;
begin
     Qu.SQL.Clear;
     Qu.SQL.Add('SELECT SUM(Bedeh),SUM(Bestan),SUM(BedRem),SUM(BesRem)');
     Qu.Sql.Add('FROM '+Frodm.Gardesh.TableName);
     Qu.Active :=True;
     If Qu.Fields[0].Value > 0 Then TarazRep.BedSum.Caption :=CurrToFar(Qu.Fields[0].AsCurrency);
     If Qu.Fields[1].Value > 0 Then TarazRep.BesSum.Caption :=CurrToFar(Qu.Fields[1].AsCurrency);
     If Qu.Fields[2].Value > 0 Then TarazRep.SbedRem.Caption :=CurrToFar(Qu.Fields[2].AsCurrency);
     If Qu.Fields[3].Value > 0 Then TarazRep.SBesRem.Caption :=CurrToFar(Qu.Fields[3].AsCurrency);
     Qu.Active:=False;
end;

Procedure TFTaraz.Gardesh_Kol_Dated(Kod:Real;Dat,SDat:Integer;Cent,Cost:String);
Const
Das=' and AcKod In (Select AccKod From AccountKod Where Kdas <> 1)';
Var
Rate,Ratio,GKod:Real;
Tip,I:Integer;
bsRem,Rem:Currency;
GQu:TQuery;
Filt:String;
begin
     Tip:=AccountType(Kod);
     Case Tip Of
     5:Begin
         Rate:=1000000000000;
         Ratio:=999999999999;
       End;
     0:Begin
         Rate:=1000000000;
         Ratio:=999999999;
       End;
     1:Begin
         Rate:=1000000;
         Ratio:=999999;
       End;
     2:Begin
         Rate:=1000;
         Ratio:=999;
       End;
     3:Begin
         Rate:=1;
         Ratio:=0;
       End;
     Else
       Begin
        Rate:=0;
        Ratio:=0;
       End;
     End;
     Frodm.Gardesh.Last;
     Rem:=Frodm.GardeshBaghi.Value;
     GQu:=Tquery.Create(Owner);
     GQu.DataBaseName:=CurrDb;
     GQu.SQL.Add('SELECT AccKod,Nam FROM AccountKod ');
     GQu.SQL.Add('WHERE AccKod > '+FloatToStr(Kod)+' and AccKod <= '
                  +FloatToStr(Kod+999*Rate));
     GQu.SQL.Add('ORDER BY Nam');
     GQu.Open;
     GQu.First;
     For I:=1 To GQu.RecordCount Do
     Begin
       GKod:=GQu.Fields[0].AsFloat;
       If Frac(GKod/Rate) = 0 Then
       Begin
        Filt:='Tip=0 and Dat <= '+IntToStr(Dat)+' and Dat >= '+IntToStr(SDat)+' and AcKod >='+
         FloatToStr(GKod)+' and AcKod <='+FloatToStr(GKod+Ratio);
        If Cent > '' Then Filt:=Filt+' and CKod In ('+CentString(Cent)+')';
        If Cost > '' Then Filt:=Filt+' and Cost In ('+CostString(Cost)+')';
        Qu.SQL.Clear;
        Qu.SQL.Add('SELECT Sum(Bed),Sum(Bes),Max(Dat)');
        Qu.SQL.Add('FROM AcountBill');
        Qu.SQL.Add('WHERE '+Filt);
        If Not Boss Then Qu.Sql.Add(Das);
        Qu.Active :=True;
        Frodm.Gardesh.Append;
        Frodm.GardeshDesc.Value :=GQu.Fields[1].AsString;
        Frodm.GardeshBedeh.Value :=Qu.Fields[0].AsCurrency;
        Frodm.GardeshBestan.Value :=Qu.Fields[1].AsCurrency;
        Frodm.GardeshDat.Value :=Qu.Fields[2].AsInteger;
        bsRem:=Qu.Fields[0].AsCurrency-Qu.Fields[1].AsCurrency;
        Frodm.GardeshDiag.Value :=bsRem;
        If bsRem > 0 Then Frodm.GardeshBedrem.Value :=bsRem;
        If bsRem < 0 Then Frodm.GardeshBesrem.Value :=Abs(bsRem);
        Rem:=Rem+bsRem;
        Frodm.GardeshBaghi.Value :=Rem;
        Frodm.Gardesh.Post;
        Qu.Close;
       End;
       GQu.Next;
     End;
     GQu.Close;
     GQu.Free;
end;

procedure TFTaraz.FormActivate(Sender: TObject);
Var
I,Tip,Idx:Integer;
begin
     Frodm.AcKod.First;
     FAccList.Items.Clear;
     For I:=1 To Frodm.AcKod.RecordCount do
     Begin
       Tip:=FAccKoding.AcTip(Frodm.AckodAccKod.Value);  //FAccKoding.AcTip
       If (Tip = AcType.ItemIndex)And(FroDM.AcKodUseKod.Value = 0)
       and(Frodm.AcKodKdas.Value<>1) Then
       Begin
        Idx:=FAccList.Items.Add(Frodm.AcKodNam.Value);
        FAccList.AcCode[Idx]:=Frodm.AcKodAcckod.AsFloat;
       End;
       Frodm.AcKod.Next;
     End;
end;

procedure TFTaraz.BexitClick(Sender: TObject);
begin
     Frodm.Gardesh.Active :=False;
     Frodm.Gardesh.Exclusive :=False;
     Close;
end;

procedure TFTaraz.BtarazClick(Sender: TObject);
Var
I:Integer;
St,En:Integer;
begin
     Screen.Cursor:=crHourGlass;
     Create_Gardesh_Table('Gardesh'+IntToStr(CUser.Id));
     GQu.SQL.Clear;
     GQu.SQL.Add('Select * From '+Frodm.Gardesh.TableName+' order by Id');
     Open_g(Frodm.Gardesh);
     St:=DateToInt(SDat.Text);
     En:=DateToInt(EDat.Text);
     If St=0 Then St:=1;
     If En=0 Then En:=111111111;
     For I:=0 To FAccList.Items.Count-1 Do
      If FAccList.State[I] = cbChecked Then
       If cbCurr.Text='' Then
        Gardesh_Kol_Dated(FAcclist.AcCode[I],En,St,FCentN.Text,FCostN.Text)
       Else
        Gardesh_Kol_Arzi(FAcclist.AcCode[I],Inttostr(St),IntTostr(En),
         FCentN.Text,FCostN.Text,cbCurr.Text);
     GQu.Close;
     GQu.Open;
     Close_g(Frodm.Gardesh);
     Delete_Gardesh_Table;

     GQu.Filter:='Diag <> 0 Or Bedeh > 0 Or Bestan >0 ';
     GQu.Filtered:=True;
     CreatingForm(TTarazRep,'TarazRep',TarazRep);
     Set_Sys_Enviroment;
     TarazRep.qrTit.Caption:=InvoLbl;
     TarazRep.Cap:=CbCurr.Text;
     TarazRep.QRLabel1.Caption :=FCap.Text+' '+Label3.Caption+' '+SDat.Text
      +' '+Label1.Caption+' '+EDat.Text;
     Sums;
     If cbPrint.Checked Then TarazRep.Print Else TarazRep.Preview;
     TarazRep.Destroy;
     Frodm.Gardesh.Filtered:=False;
     Screen.Cursor:=crDefault;
end;

procedure TFTaraz.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFTaraz.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     GQu.DatabaseName:=CurrDb;
     FCostN.Items.Assign(CostList);
     Fill_Comb(Frodm.Cent,'Nam',FCentN.Items);
     cbCurr.Items.Assign(CurrList);
     FormActivate(Sender);
     SDat.Text:=Beg_Date;
end;

procedure TFTaraz.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     IF Key = VK_F3 Then BtarazClick(Sender);
end;

procedure TFTaraz.NextTab(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
      Key:=#0;
      SelectNext(Sender As TwinControl,True,True);
     End;
end;

procedure TFTaraz.EDatEnter(Sender: TObject);
begin
     GetMaskText(EDat);
end;

procedure TFTaraz.EDatExit(Sender: TObject);
begin
     SetMaskText(EDat);
     If (Not Date_Check(EDat.Text))and(DateToInt(EDat.Text)>0) Then EDat.SetFocus;
end;

procedure TFTaraz.SdatEnter(Sender: TObject);
begin
     GetMaskText(SDat);
end;

procedure TFTaraz.SdatExit(Sender: TObject);
begin
     SetMaskText(SDat);
     If (Not Date_Check(SDat.Text))and(DateToInt(SDat.Text)>0) Then SDat.SetFocus;
end;

procedure TFTaraz.SpClick(Sender: TObject);
begin
     FCostN.ItemIndex:=-1;
     FCostN.Text:=C_Choose;
end;

procedure TFTaraz.SpCenClick(Sender: TObject);
begin
     FCentN.Text:=A_Choose;
end;

end.
