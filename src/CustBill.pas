unit CustBill;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask;

type
  TFCustBill = class(TForm)
    Label1: TLabel;
    Fnam: TEdit;
    Label2: TLabel;
    FAcNam: TComboBox;
    Bprint: TButton;
    Bexit: TButton;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label3: TLabel;
    EDat: TMaskEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure NextTab(Sender: TObject; var Key: Char);
    procedure BprintClick(Sender: TObject);
    procedure BexitClick(Sender: TObject);
    procedure EDatEnter(Sender: TObject);
    procedure EDatExit(Sender: TObject);
    procedure FAcNamKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    Procedure Gardesh_Sum_Date(Kod,Ratio:Real;EndDat:Integer;Cent,Cost:String;
      Var Bed,Bes:Currency;Var Dat:Integer);
    Procedure Gardesh_Sum_Date_ARZI(Kod,Ratio:Real;EndDat:Integer;Cent,Cost:String;
      Var Bed,Bes:Currency;Var Dat:Integer;Curr:String);
  public
    { Public declarations }
    Function  Dated_Remain(AccKod:Real;EndDat:Integer;Cent,Cost:String;Var Dat:Integer):Currency;
    Function  Dated_Remain_ARZI(AccKod:Real;EndDat:Integer;
    Cent,Cost:String;Var Dat:Integer;Curr:String):Currency;
  end;

var
  FCustBill: TFCustBill;

implementation

uses FrooshDM, Routins, ProVar, CustBRep, CRoutins;

{$R *.DFM}
Procedure TFCustBill.Gardesh_Sum_Date(Kod,Ratio:Real;EndDat:Integer;Cent,Cost:String;
      Var Bed,Bes:Currency;Var Dat:Integer);
Var
Filt:String;
begin
     Filt:='Tip=0 and AcKod >='+FloatToStr(Kod)+' and AcKod <='+FloatToStr(Kod+Ratio);
     Filt:=Filt+' and Dat <='+IntToStr(EndDat);
     If Cent > '' Then Filt:=Filt+' and CKod In ('+CentString(Cent)+')';
     If Cost > '' Then Filt:=Filt+' and Cost In ('+CostString(Cost)+')';
     Qu.SQL.Clear;
     Qu.SQL.Add('SELECT Sum(Bed),Sum(Bes),Max(Dat)');
     Qu.SQL.Add('FROM AcountBill');
     Qu.SQL.Add('WHERE '+Filt);
     Qu.Active :=True;
     Bed:=Qu.Fields[0].AsCurrency;
     Bes:=Qu.Fields[1].AsCurrency;
     Dat:=Qu.Fields[2].AsInteger;
     Qu.Active:=False;
end;

Procedure TFCustBill.Gardesh_Sum_Date_ARZI(Kod,Ratio:Real;EndDat:Integer;Cent,Cost:String;
      Var Bed,Bes:Currency;Var Dat:Integer;Curr:String);
Var
Filt:String;
begin
     Filt:='Tip=0 and AcKod >='+FloatToStr(Kod)+' and AcKod <='+FloatToStr(Kod+Ratio);
     Filt:=Filt+' and Dat <='+IntToStr(EndDat);
     If Curr >'' Then Filt:=Filt+' and Ctip='+QuotedStr(Curr);
     If Cent > '' Then Filt:=Filt+' and CKod In ('+CentString(Cent)+')';
     If Cost > '' Then Filt:=Filt+' and Cost In ('+CostString(Cost)+')';
     Qu.SQL.Clear;
     Qu.SQL.Add('SELECT Sum(Bed),Sum(Bes),Max(Dat)');
     Qu.SQL.Add('FROM AcountBill');
     Qu.SQL.Add('WHERE '+Filt);
     Qu.Active :=True;
     Bed:=Qu.Fields[0].AsCurrency;
     Bes:=Qu.Fields[1].AsCurrency;
     Dat:=Qu.Fields[2].AsInteger;
     Qu.Active:=False;
end;

Function  TFCustBill.Dated_Remain(AccKod:Real;EndDat:Integer;Cent,Cost:String;Var Dat:Integer):Currency;
Var
Bed,Bes:Currency;
Ratio,Act:Real;
Tip:Integer;
begin
     Ratio:=0;Act:=0;
     If KodFound(AccKod) Then Act:=Frodm.AcKodUseKod.Value;
     If Act = 1 Then Ratio :=0 Else
     Begin
       Tip:=AccountType(AccKod);
       Case Tip of
        0:Ratio:=1000000000000;
        1:Ratio:=1000000000;
        2:Ratio:=1000000;
        3:Ratio:=1000;
        4:Ratio:=0;
       End;
     End;
     Gardesh_Sum_Date(AccKod,Ratio,EndDat,Cent,Cost,Bed,Bes,Dat);
     Result:=Bed-Bes;
end;

Function  TFCustBill.Dated_Remain_ARZI(AccKod:Real;EndDat:Integer;
Cent,Cost:String;Var Dat:Integer;Curr:String):Currency;
Var
Bed,Bes:Currency;
Ratio,Act:Real;
Tip:Integer;
begin
     Ratio:=0;Act:=0;
     If KodFound(AccKod) Then Act:=Frodm.AcKodUseKod.Value;
     If Act = 1 Then Ratio :=0 Else
     Begin
       Tip:=AccountType(AccKod);
       Case Tip of
        0:Ratio:=1000000000000;
        1:Ratio:=1000000000;
        2:Ratio:=1000000;
        3:Ratio:=1000;
        4:Ratio:=0;
       End;
     End;
     Gardesh_Sum_Date_Arzi(AccKod,Ratio,EndDat,Cent,Cost,Bed,Bes,Dat,Curr);
     Result:=Bed-Bes;
end;

procedure TFCustBill.NextTab(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
       Key:=#0;
       FCustBill.SelectNext(Sender As TwinControl,True,True);
     End;
end;

procedure TFCustBill.FormCreate(Sender: TObject);
begin
     Set_Forms(FCustBill);
     Fill_Comb(Frodm.AcKod,'Nam',FAcNam.Items);
     EDat.Text:=IntToDate(Fardate);
end;

procedure TFCustBill.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;


procedure TFCustBill.BprintClick(Sender: TObject);
Var
Price:Currency;
EndDat,Dat:Integer;
AcKod:Real;
begin
     If FacNam.ItemIndex = -1 Then Exit;
     AcKod:=AccKod(FAcNam.Text);
     EndDat:=DateToInt(Edat.Text);
//     Price:=AcRemain(AcKod,Dat);
     Price:=Dated_Remain(AcKod,EndDat,'','',Dat);
     CreatingForm(TFCustBRep,'FCustBRep',FCustBRep);
     Set_Sys_Enviroment;
     FCustBRep.Page.Length:=100;
     FCustBRep.ReportTitle:='„«‰œÂ'+FNam.Text;
     FCustBRep.qrTit.Caption:=InvoLbl;
//     FCustBRep.qrTit.Font.Size :=LFont.Size+5;
     FCustBRep.qrFdat.Caption:=IntToDate(Fardate);
     FCustBRep.qrNam.Caption:=FNam.Text;
     FCustBRep.qrAc.Caption:=FAcNam.Text;
     FCustBRep.qrRdat.Caption:=IntToDate(Dat);
     FCustBRep.qrPice.Caption:=CurrToFar(Price);
     FCustBRep.qrFPrice.Caption:=FarsiPrice(Abs(Price));
     If Price < 0 Then FCustBRep.qrFPrice.Caption:=FCustBRep.qrFPrice.Caption+
      '     »” «‰ﬂ«—';
//     FCustBRep.qrAdd.Caption:=Master;
     FCustBRep.qrCom.Caption:=Comm;
     FCustBRep.Preview;
     FCustBRep.Destroy;
end;

procedure TFCustBill.BexitClick(Sender: TObject);
begin
     FCustBill.Close;
end;

procedure TFCustBill.EDatEnter(Sender: TObject);
begin
     GetMaskText(EDat);
end;

procedure TFCustBill.EDatExit(Sender: TObject);
begin
     SetMaskText(EDat);
     If Not Date_Check(EDat.Text) Then EDat.SetFocus;
end;

procedure TFCustBill.FAcNamKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetAccountCombo(Sender,Key);
end;

end.
