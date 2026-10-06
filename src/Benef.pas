unit Benef;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Grids, DBGrids, Db, DBTables, Buttons, ExtCtrls, ComCtrls;

type
  TFBenef = class(TForm)
    SQu: TQuery;
    DataSource1: TDataSource;
    dbg: TDBGrid;
    spCalc: TSpeedButton;
    spPrint: TSpeedButton;
    SQuId: TAutoIncField;
    SQuBDes: TStringField;
    SQuBed: TCurrencyField;
    SQuSDes: TStringField;
    SQuBes: TCurrencyField;
    PrgB: TProgressBar;
    Label2: TLabel;
    Rg: TRadioGroup;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure NextTab(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure spCalcClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure spPrintClick(Sender: TObject);
  private
    { Private declarations }
    Benefit:Currency;
    Function Sum_Sold_Price:Currency;
    Function Benef_Calc:Currency;
    Function Sarm_Calc:Currency;
    Procedure Mali_Taraz;
  public
    { Public declarations }
  end;

var
  FBenef: TFBenef;

implementation

uses Routins, ProVar, FrooshDM, MainForm, RepTols;

{$R *.DFM}
Function IsBlank(bsKod:Integer):Boolean;
Var
I:Integer;
begin
     Result:=False;
     Frodm.Mali.First;
     For I:=1 To Frodm.Mali.RecordCount Do
     Begin
       Case bsKod Of
     1: If Frodm.MalibDes.Value = '' Then
        Begin
          Result:=True;
          Exit;
        End;
    -1: If Frodm.MalisDes.Value = '' Then
        Begin
          Result:=True;
          Exit;
        End;
       End;
       Frodm.Mali.Next;
     End;
     If Frodm.Mali.Eof Then Result:=False;
end;

Procedure Mali_Append(Acc:String;Value:Currency);
Var
bsKod:Integer;
begin
     bsKod:=AcMah(Acc);
     //If ISBlank(bsKod) Then Frodm.Mali.Edit Else
     Frodm.Mali.Append;
     Case bsKod Of
   1: Begin
        Frodm.MalibDes.Value :=Acc;
        Frodm.MaliBed.Value :=Value*bsKod;
      End;
  -1: Begin
        Frodm.MalisDes.Value :=Acc;
        Frodm.MaliBes.Value :=Value*bsKod;
      End;
     End;
     Frodm.Mali.Post;
end;

Function TFBenef.Sum_Sold_Price:Currency;
var
Sum,LastValue:Currency;
I,AnbKod:Integer;
GKod,Color,AnbNam:String;
Q:Real;
begin
     Screen.Cursor:=crHourGlass;
     Sum:=0;
     PrgB.Min:=0;
     Prgb.Max:=Frodm.Depot.RecordCount;
     PrgB.Position:=0;
     Frodm.Depot.First;
     For I:=1 To Frodm.Depot.RecordCount Do
     Begin
       PrgB.Position:=I;
       GKod:=IntToStr(Frodm.DepotKod.Value);
       Color:=Frodm.DepotColor.Value;
       AnbNam:=Frodm.DepotAnbNam.Value;
       AnbKod:=0;
       Label2.Caption:=Frodm.DepotNam.AsString;
       Label2.Refresh;
       Q:=0;
       Sum:=Sum+Sold_Price(P_Rule,Qu,GKod,Color,AnbNam,AnbKod,0,111111111,Q,LastValue);
       Frodm.Depot.Next;
     End;
     Result:=Sum;
     Label2.Caption:='';
     Label2.Refresh;
     Screen.Cursor:=crDefault;
end;

Function TFBenef.Benef_Calc:Currency;
Var
I,J:Integer;
Sum,SoldSum,Prof,ExpSum:Currency;
//ExpKod:Real;
GQu:Tquery;
ExpName:String;
begin
     Open_g(Frodm.Gardesh);
     Open_g(Frodm.Mali);
     Sum:=0;Prof:=0;
     Frodm.Mali.Append;
     Frodm.MaliBDes.Value :=':ÏÑÂãÜÜÜÜÏåÇ';
     Frodm.Mali.Post;
     Gardesh_Kol(6000000000000,'','','','');
     Frodm.Gardesh.First;
     For I:=1 To Frodm.Gardesh.RecordCount Do
     Begin
       FroDM.Mali.Append;
       Frodm.MaliBdes.Value:=Frodm.GardeshDesc.Value;
       Frodm.MaliBed.Value:=Frodm.GardeshDiag.Value*-1;
       Frodm.Mali.Post;
       Sum:=Sum+Frodm.GardeshDiag.Value;
       Frodm.Gardesh.Next;
     End;
     Close_g(Frodm.Gardesh);
     Frodm.Mali.Append;
     Frodm.MaliBDes.Value:='ÌãÚ ÏÑÂãÜÜÜÜÏåÇ';
     Frodm.MaliBes.Value :=-1*Sum;
     Frodm.Mali.Post;
     Frodm.Mali.Append;
     Frodm.MaliBDes.Value :=':ßÓÜÜÜÜÜÜÑãíÔæÏ';
     Frodm.Mali.Post;
     SoldSum:=Sum_Sold_Price;
     Frodm.Mali.Append;
     Frodm.MaliBDes.Value :='ÈåÇí ÊãÇã ÔÏå ßÇáÇí ÝÑæÔ ÑÝÊå';
     Frodm.MaliBed.Value := 1*SoldSum;
     Frodm.Mali.Post;
     Frodm.Mali.Append;
     Frodm.MaliBDes.Value:='ÓæÏ äÇæíÜÜÜÜÜÜŽå';
     Frodm.MaliBes.Value:=-1*(Sum+SoldSum);
     Frodm.Mali.Post;
     Prof:=Prof+Sum+SoldSum;
     Frodm.Mali.Append;
     Frodm.MaliBDes.Value :=':ßÓÜÜÜÜÜÜÜÜÜÜÜÜÑãíÔæÏ';
     Frodm.MaliBes.Value:=0;
     Frodm.Mali.Post;

     Frodm.AutoBill.FindKey(['GF']);
     ExpName:=AccNam(Frodm.AutoBillBehKod.Value);

     GQu:=Tquery.Create(Application);
     GQu.DataBaseName:=CurrDb;
     GQu.SQL.Add('SELECT AccKod,Nam FROM AccountKod ');
     GQu.SQL.Add('WHERE AccKod > 7000000000000 and AccKod <=7999000000000');
     GQu.SQL.Add(' and Kkol=0 and kmo=0 and Ktaf=0');
     GQu.SQL.Add('ORDER BY AccKod');
     GQu.Open;
     GQu.First;
     ExpSum:=0;
     For I:=1 to GQu.RecordCount Do
     Begin
      Frodm.Mali.Append;
      Frodm.MaliBDes.Value :=GQu.Fields[1].AsString;
      Frodm.Mali.Post;
      Open_g(Frodm.Gardesh);
      Sum:=0;
      Gardesh_Kol(GQu.Fields[0].AsFloat,'','','','');
      Frodm.Gardesh.First;
      For J:=1 To Frodm.Gardesh.RecordCount Do
      Begin
       If Frodm.GardeshDesc.AsString <> ExpName Then
       Begin
        FroDM.Mali.Append;
        Frodm.MaliBdes.Value:=Frodm.GardeshDesc.Value;
        Frodm.MAliBed.Value:=Frodm.GardeshDiag.Value;
        Frodm.Mali.Post;
        Sum:=Sum+Frodm.GardeshDiag.Value;
       End;
       Frodm.Gardesh.Next;
      End;
      ExpSum:=ExpSum+Sum;
      Frodm.Mali.Append;
      Frodm.MaliBDes.Value:='ÌãÚ '+GQu.Fields[1].AsString;
      Frodm.MaliBes.Value :=-1*Sum;
      Frodm.Mali.Post;
      GQu.Next;
     End;
     Frodm.Mali.First;
     Prof:=Prof+ExpSum;
     Sum:=0;
{     For I:=1 To Frodm.Mali.RecordCount Do
     Begin
       Sum:=Sum+Frodm.MaliBes.Value;
       Frodm.Mali.Next;
     End;}
     Frodm.Mali.Append;
     Frodm.MaliBDes.Value:='ÓæÏ æíÜÜÜÜÜÜŽå';
     Frodm.MaliBes.Value :=-1*Prof;
     Frodm.Mali.Post;
     Result:=Prof;
     Benefit:=Result;
end;

Function TFBenef.Sarm_Calc:Currency;
Var
Sum:Currency;
I:Integer;
begin
     Sum:=0;
     If Benefit = 0 Then Benefit:=Benef_Calc;
     Open_g(Frodm.Mali);
     Open_g(Frodm.Gardesh);
     Gardesh_Kol(5000000000000,'','','','');
     Frodm.Gardesh.First;
     For I:=1 To Frodm.Gardesh.RecordCount Do
     Begin
       FroDM.Mali.Append;
       Frodm.MaliBdes.Value:=Frodm.GardeshDesc.Value;
       Frodm.MaliBed.Value:=-1*Frodm.GardeshDiag.Value;
       Frodm.Mali.Post;
       Sum:=Sum+Frodm.GardeshDiag.Value;
       Frodm.Gardesh.Next;
     End;
     Frodm.Mali.Append;
     Frodm.MaliBDes.Value:='ÌãÚ ÓÑãÇíå';
     Frodm.MaliBes.Value :=-1*Sum;
     Frodm.Mali.Post;
     Frodm.Mali.Append;
     Frodm.MaliBdes.Value:='ÇÖÇÝå ãíÔæÏ:ÓæÏ æíŽå';
     Frodm.MaliBed.Value:= -1*Benefit;
     Frodm.Mali.Post;
     Frodm.Mali.Append;
     Frodm.MaliBdes.Value:=':ÓÑãÇíå ÏÑÂÎÑ ÏæÑå';
     Frodm.MaliBes.Value:=-1*(Sum+Benefit);
     Frodm.Mali.Post;
     Result:=Sum+Benefit;
end;

Procedure TFBenef.Mali_Taraz;
Var
I,J:Integer;
Qu:TQuery;
begin
     Open_g(Frodm.Mali);
     Open_g(Frodm.Gardesh);
     Qu:=TQuery.Create(Application);
     Qu.DatabaseName:=CurrDb;
     Qu.SQL.Clear;
     Qu.SQL.Add('Select AccKod,Nam,Mah From AccountKod Where Kgp>0 and kgro=0 order By AccKod ');
     Qu.Open;
     For I:=1 To Qu.RecordCount Do
     Begin
      Open_g(Frodm.Gardesh);
      Mali_Append(Qu.Fields[1].AsString,0);
      Gardesh_Kol(Qu.Fields[0].AsFloat,'','','','');


      Frodm.Gardesh.Filter :='Diag <> 0';
      Frodm.Gardesh.Filtered :=True;
      Frodm.Gardesh.First;
      For J:=1 To Frodm.Gardesh.RecordCount Do
      Begin
       Mali_Append(Frodm.GardeshDesc.Value,Frodm.GardeshDiag.Value);
       Frodm.Gardesh.Next;
      End;
      Frodm.Gardesh.Filtered:=False;

      Qu.Next;
     End;
     Qu.Close;
     Qu.Destroy;
end;

procedure TFBenef.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFBenef.NextTab(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
      Key:=#0;
      SelectNext(Sender As TwinControl,True,True);
     End;
end;

procedure TFBenef.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     Main.glKey.GetBitmap(8,spCalc.Glyph);
     Main.glKey.GetBitmap(2,spPrint.Glyph);
     SQu.DatabaseName:=CurrDb;
end;

procedure TFBenef.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key Of
     VK_F3 :spCalcClick(Sender);
     27    :Close;
     End;
end;

procedure TFBenef.spCalcClick(Sender: TObject);
begin
     Screen.Cursor:=crHourGlass;
     SQu.Close;
     PrgB.Position:=0;
     Case Rg.ItemIndex of
     0:Benef_Calc;
     1:Sarm_Calc;
     2:Mali_Taraz;
     End;
     SQu.Open;
     Screen.Cursor:=crDefault;
end;
//DatabaseName = 'ParFro'

procedure TFBenef.spPrintClick(Sender: TObject);
begin
     CreatingForm(TTolsRep,'TolsRep',TolsRep);
     Set_Sys_Enviroment;
     TolsRep.I:=0;
     If Not bmpP1.Empty Then TolsRep.Logo.Picture.Bitmap:=bmpP1;
     TolsRep.qrTit.Caption:=InvoLbl;
     TolsRep.QrTit2.Caption:=BarNamLbl;
     TolsRep.Preview;
     TolsRep.Destroy;
end;

end.
