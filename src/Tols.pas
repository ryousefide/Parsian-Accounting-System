unit Tols;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Grids, DBGrids, Db, DBTables, Buttons, ExtCtrls;

type
  TFTols = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Dat1: TMaskEdit;
    Dat2: TMaskEdit;
    Label3: TLabel;
    FAccNam: TComboBox;
    SQu: TQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    SQuPfee: TCurrencyField;
    SQuQuant: TFloatField;
    SQuPtotal: TCurrencyField;
    SQuDat: TIntegerField;
    spCalc: TSpeedButton;
    SQuGNam: TStringField;
    spPrint: TSpeedButton;
    SQuF: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure NextTab(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure Dat1Enter(Sender: TObject);
    procedure Dat1Exit(Sender: TObject);
    procedure Dat2Enter(Sender: TObject);
    procedure Dat2Exit(Sender: TObject);
    procedure spCalcClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure spPrintClick(Sender: TObject);
  private
    { Private declarations }
    Function Make_Filter:String;
  public
    { Public declarations }
  end;

var
  FTols: TFTols;

implementation

uses Routins, ProVar, FrooshDM, MainForm, RepTols;

{$R *.DFM}
Function TFTols.Make_Filter: String;
Var
Str:String;
I:Integer;
begin
     Str:='F >0 ';
     I:=DateToInt(Dat1.Text);
     If I>0 Then Str:=Str+' and Dat >= '+IntToStr(I);
     I:=DateToInt(Dat2.Text);
     If I>0 Then Str:=Str+' and Dat <= '+IntToStr(I);
     If FAccNam.Text > ''  Then Str:=Str+' and Nam = '+chr(39)+FAccNam.Text+chr(39);
     If Pos(' and',Str) = 1 Then Delete(Str,1,4);
     Result:=Str;
end;

procedure TFTols.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFTols.NextTab(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
      Key:=#0;
      SelectNext(Sender As TwinControl,True,True);
     End;
end;

procedure TFTols.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     Main.glKey.GetBitmap(8,spCalc.Glyph);
     Main.glKey.GetBitmap(2,spPrint.Glyph);
     Fill_Comb(Frodm.Binvo,'Nam',FAccNam.Items);
     SQu.DatabaseName:=CurrDb;
end;

procedure TFTols.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key Of
     VK_F3 :spCalcClick(Sender);
     27    :Close;
     End;
end;

procedure TFTols.Dat1Enter(Sender: TObject);
begin
     GetMaskText(Dat1);
end;

procedure TFTols.Dat1Exit(Sender: TObject);
begin
     SetMaskText(Dat1);
     If(Not Date_Check(Dat1.Text))And(DateToInt(Dat1.Text)>0)Then Dat1.SetFocus;
end;

procedure TFTols.Dat2Enter(Sender: TObject);
begin
     GetMaskText(Dat2);
end;

procedure TFTols.Dat2Exit(Sender: TObject);
begin
     SetMaskText(Dat2);
     If(Not Date_Check(Dat2.Text))And(DateToInt(Dat2.Text)>0)Then Dat2.SetFocus;
end;

procedure TFTols.spCalcClick(Sender: TObject);
Var
Flt:String;
FSu,Sum:Currency;
Csh,Che,Ban:Currency;
begin
     SQu.Close;
     Flt:=Make_Filter;
     SQu.Filter:=Flt;
     SQu.Filtered:=True;
     SQu.Open;
{     FSu:=GetFactorSum(Flt);
     FFac.Text:=CurrToFar(FSu);
     Csh:=GetCashPay(Flt);
     FCash.Text:=CurrToFar(Csh);
     Che:=GetCheqPay(Flt);
     FCheq.Text:=CurrToFar(Che);
     Ban:=GetHavPay(Flt)+GetFishPay(Flt);
     FBank.Text:=CurrToFar(Ban);
     Sum:=Ban+Che+Csh;
     FSum.Text:=CurrToFar(Sum);
     FRem.Text:=CurrToFar(FSu-Sum);}

end;
//DatabaseName = 'ParFro'

procedure TFTols.spPrintClick(Sender: TObject);
begin
     CreatingForm(TTolsRep,'TolsRep',TolsRep);
     Set_Sys_Enviroment;
     TolsRep.I:=0;
     If Not bmpP1.Empty Then TolsRep.Logo.Picture.Bitmap:=bmpP1;
     TolsRep.qrTit.Caption:=InvoLbl;
     TolsRep.QrTit2.Caption:=BarNamLbl;
     TolsRep.SDat.Caption:=Dat1.Text;
     TolsRep.EDat.Caption:=Dat2.Text;
     TolsRep.Preview;
     TolsRep.Destroy;
end;

end.
