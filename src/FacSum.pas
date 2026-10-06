unit FacSum;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Db, DBTables, Grids, DBGrids, ExtCtrls, Buttons;

type
  TFFucSum = class(TForm)
    FacGrid: TDBGrid;
    Ds1: TDataSource;
    Label1: TLabel;
    Bprint: TBitBtn;
    BExit: TBitBtn;
    Bevel1: TBevel;
    SKol: TEdit;
    Label2: TLabel;
    FQu: TQuery;
    FQuDat: TIntegerField;
    FQuNo: TIntegerField;
    FQuNam: TStringField;
    FQuPkol: TCurrencyField;
    FQuPdis: TCurrencyField;
    FQuPnet: TCurrencyField;
    FQuAdd: TStringField;
    FQuTel: TStringField;
    FQuPerm: TBooleanField;
    Label3: TLabel;
    Dat: TEdit;
    FPayed: TEdit;
    Label4: TLabel;
    FQuPRule: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BExitClick(Sender: TObject);
    procedure BprintClick(Sender: TObject);
    procedure FacGridKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    SNo:String;
    ENo:String;
    SDat:String;
    EDat:String;
    Cust:String;
    Function GetRas:String;
    Function GetPaid(Flt:String):Currency;
  end;

var
  FFucSum: TFFucSum;

implementation

uses FrooshDM, Routins, ProVar, RepFacSum, QRCtrls, MainForm;

{$R *.DFM}

Function TFFucSum.GetRas:String;
Var
BY,BM,BD,Dat:Integer;
I:Integer;
Days:Integer;
begin
 Result:='';
 If FQu.RecordCount = 0 Then Exit;
 FQu.First;
 Dat:=FQuDat.AsInteger;
 BY:=Dat Div 10000;
 BM:=(Dat Div 100)Mod 100;
 BD:=Dat Mod 100;
 Days:=0;
 For I:=1 To FQu.RecordCount Do
 Begin
  Days:=Days+DayDistance(FQuDat.AsInteger,BY,BM,BD);
  FQu.Next;
 End;
 Days:=Days Div FQu.RecordCount;
 FQu.First;
 BY:=Days Div 365+BY;
 BM:=(Days Mod 365)Div 30+BM;
 BD:=(Days Mod 365)Mod 30+BD;
 If BD >30 Then
 Begin
  BD:=BD-30;
  BM:=BM+1;
 End;
 If BM >12 Then
 Begin
  BM:=BM-12;
  BY:=BY+1;
 End;
 Dat:=By*10000+BM*100+BD;
 Result:=IntToDate(Dat);
end;

Function TFFucSum.GetPaid(Flt:String):Currency;
begin
 Result:=GetCashPay(Flt)+GetHavPay(Flt)+GetFishPay(Flt)+GetCheqPay(Flt);
end;

procedure TFFucSum.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     Main.glKey.GetBitmap(2,BPrint.Glyph);
     Main.glKey.GetBitmap(7,BExit.Glyph);
     FacGrid.TitleFont :=Label1.Font;
end;

procedure TFFucSum.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFFucSum.FormKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
        Key:=#0;
        SelectNext(Sender As TWinControl,True,True);
     End;
end;

procedure TFFucSum.BExitClick(Sender: TObject);
begin
     Close;
end;

procedure TFFucSum.BprintClick(Sender: TObject);
Var
I:Integer;
DbT:TQrDbText;
begin
     CreatingForm(TSumFacRep,'SumFacRep',SumFacRep);
     Set_Sys_Enviroment;
     If Not bmpP1.Empty Then SumFacRep.Logo.Picture.Bitmap:=bmpP1;
     SumFacRep.qrTit.Caption:=InvoLbl;
     SumFacRep.QrTit2.Caption:=BarNamLbl;
     SumFacRep.QRLabel1.Caption :=Label1.Caption;
     SumFacRep.QRSubDetail1.DataSet:=Ds1.DataSet;
     For I:=0 To SumFacRep.ComponentCount-1 Do
      IF SumFacRep.Components[i] Is TQrDbText Then
      Begin
        DbT:=SumFacRep.Components[i] As TQrDbText;
        DbT.DataSet :=Ds1.DataSet;
      End;
     SumFacRep.SDat.Caption:=SDat;
     SumFacRep.EDat.Caption:=EDat;
     SumFacRep.SNo.Caption:=SNo;
     SumFacRep.ENo.Caption:=ENo;
     SumFacRep.Cust.Caption:=Cust;
     SumFacRep.QSum.Caption:=SKol.Text;
     SumFacRep.qrRas.Caption:=Dat.Text;
     SumFacRep.Preview;
     SumFacRep.Destroy;

end;

procedure TFFucSum.FacGridKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
       Key:=#0;
     End;
end;

end.
