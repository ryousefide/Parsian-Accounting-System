unit DatedBenef;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, Mask, ComCtrls, Grids, DBGrids, Buttons;

type
  TFDBenef = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    SDat: TMaskEdit;
    EDat: TMaskEdit;
    BQu: TQuery;
    BQuNam: TStringField;
    BQuColor: TStringField;
    BQuAnbNam: TStringField;
    BQuKod: TIntegerField;
    dbg: TDBGrid;
    PrgB: TProgressBar;
    GQu: TQuery;
    Ds: TDataSource;
    QSum: TQuery;
    spCalc: TSpeedButton;
    spPrint: TSpeedButton;
    GQuId: TIntegerField;
    GQuDat: TIntegerField;
    GQuNam: TStringField;
    GQuColor: TStringField;
    GQuAnb: TStringField;
    GQuAnbKod: TIntegerField;
    GQuIn: TFloatField;
    GQuOut: TFloatField;
    GQuRem: TFloatField;
    GQuNo: TIntegerField;
    GQuDes: TStringField;
    GQuFacnam: TStringField;
    GQuFee: TCurrencyField;
    GQuPerc: TFloatField;
    GQuPrem: TCurrencyField;
    GQuDiag: TFloatField;
    GQuPdiag: TCurrencyField;
    BQuAnbKod: TFloatField;
    procedure NextTab(Sender: TObject; var Key: Char);
    procedure SDatEnter(Sender: TObject);
    procedure SDatExit(Sender: TObject);
    procedure EDatEnter(Sender: TObject);
    procedure EDatExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure spPrintClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    St,En:Integer;
    LastValue:Currency;
    Procedure GetParams;
    Function Sold_Filt:String;
    Function SumFro(Filt:String):Currency;
    Function SumRej(Filt:String):Currency;
    Function SumBuy(Filt:String):Currency;
    Function SumDisc:Currency;
    Procedure CalcCost;
  public
    { Public declarations }
  end;

var
  FDBenef: TFDBenef;

implementation

uses ProVar, Routins, FrooshDM, RepGProf, MainForm;

{$R *.DFM}

{ TForm1 }

procedure TFDBenef.GetParams;
begin
     St:=DateToInt(SDat.Text);
     En:=DateToInt(EDat.Text);
     If St=0 Then St:=0;
     If En=0 Then En:=111111111;
end;

function TFDBenef.Sold_Filt: String;
Var
Str:String;
begin
     Str:='Kod = '+BQuKod.AsString ;
     If BQuColor.AsString <> '' Then Str:=Str+' and Color = '+#39+BQuColor.AsString+#39;
     If BQuAnbNam.AsString <> ''   Then Str:=Str+' and AnbNam = '+#39+BQuAnbNam.AsString+#39;
     //If BQuAnbKod.AsInteger > 0 Then Str:=Str+' and AnbKod = '+BQuAnbKod.AsString;
     If Pos(' and',Str) = 1 Then Delete(Str,1,4);
     Result:=Str;
end;

function TFDBenef.SumFro(Filt:String): Currency;
begin
     Qu.Sql.Clear;
     Qu.Sql.Add('SELECT SUM(Ptotal)');
     Qu.Sql.Add('FROM Invogood');
     Qu.SQL.Add('WHERE Dat between :a and :b and '+Filt);
     Qu.Params[0].Value:=St;
     Qu.Params[1].Value:=En;
     Qu.Open;
     If Qu.Fields[0].Value > 0 Then  Result:=Qu.Fields[0].Value Else Result:=0;
     Qu.Close;
end;

function TFDBenef.SumRej(Filt:String): Currency;
begin
     Qu.Sql.Clear;
     Qu.Sql.Add('SELECT SUM(Ptotal)');
     Qu.Sql.Add('FROM RejInvogood');
     Qu.SQL.Add('WHERE Dat between :a and :b and '+Filt);
     Qu.Params[0].Value:=St;
     Qu.Params[1].Value:=En;
     Qu.Open;
     If Qu.Fields[0].Value > 0 Then  Result:=Qu.Fields[0].Value Else Result:=0;
     Qu.Close;
end;

Function TFDBenef.SumBuy(Filt:String):Currency;
begin
     Result:=0;
     Open_g(Frodm.Cardex);
     If P_Rule = 'FiFo' Then Result:=Kala_Kart_FIFO(BQuNam.AsString,Filt,St,En,LastValue,0);
     If P_Rule = 'LiFo' Then Result:=Kala_Kart_LIFO(BQuNam.AsString,Filt,St,En,LastValue,0);
     If P_Rule = 'Mean' Then Result:=Kala_Kart(BQuNam.AsString,Filt,St,En,LastValue,0);
end;

Function TFDBenef.SumDisc:Currency;
begin
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Sum(PDis) From Invoice Where Dat BetWeen :a and :b ');
     Qu.Params[0].Value:=St;
     Qu.Params[1].Value:=En;
     Qu.Open;
     Result:=Qu.Fields[0].AsCurrency;
     Qu.Close;
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Sum(PDis) From RejInvo Where Dat BetWeen :a and :b ');
     Qu.Params[0].Value:=St;
     Qu.Params[1].Value:=En;
     Qu.Open;
     Result:=Result-Qu.Fields[0].AsCurrency;
     Qu.Close;
     Frodm.Cardex.Append;
     Frodm.CardexNam.Value:=' Œ›Ì› Å«Ì ›«ò Ê—';
     Frodm.CardexPrem.Value:=Result;
     Frodm.Cardex.Post;
end;

Procedure TFDBenef.CalcCost;
Var
I:Integer;
begin
     Open_g(Frodm.Gardesh);
     Gardesh_Kol(7000000000000,IntToStr(St),IntToStr(En),'','');
     Frodm.Gardesh.First;
     For I:=1 To Frodm.Gardesh.RecordCount Do
     Begin
      Frodm.Cardex.Append;
      Frodm.CardexNam.Value:=Frodm.GardeshDesc.Value;
      Frodm.CardexPrem.Value:=Frodm.GardeshDiag.Value;
      Frodm.Cardex.Post;
      Frodm.Gardesh.Next;
     End;
     Close_g(Frodm.Gardesh);
end;

procedure TFDBenef.NextTab(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
       Key:=#0;
       SelectNext(Sender As TWinControl,True,True);
     End;
end;

procedure TFDBenef.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
     Close_g(Frodm.Cardex);
end;

procedure TFDBenef.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     Main.glKey.GetBitmap(8,spCalc.Glyph);
     Main.glKey.GetBitmap(2,spPrint.Glyph);
     BQu.DatabaseName:=CurrDb;
     GQu.DatabaseName:=CurrDb;
     QSum.DatabaseName:=CurrDb;
end;

procedure TFDBenef.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key=VK_F3 Then Button1Click(Sender);
end;

procedure TFDBenef.SDatEnter(Sender: TObject);
begin
     GetMaskText(SDat);
end;

procedure TFDBenef.SDatExit(Sender: TObject);
begin
     SetMaskText(SDat);
     If (Not Date_Check(SDat.Text))And(DateToInt(SDat.Text)>0) Then SDat.SetFocus;
end;

procedure TFDBenef.EDatEnter(Sender: TObject);
begin
     GetMaskText(EDat);
end;

procedure TFDBenef.EDatExit(Sender: TObject);
begin
     SetMaskText(EDat);
     If (Not Date_Check(EDat.Text))And(DateToInt(EDat.Text)>0) Then EDat.SetFocus;
end;


procedure TFDBenef.Button1Click(Sender: TObject);
Var
I,J:Integer;
T1:TTable;
Filt:String;
begin
     Open_g(Frodm.Cardex);
     GQu.Close;
     T1:=TTable.Create(Owner);
     T1.DatabaseName:=CurrDb;
     T1.TableName:='CarT';
     T1.FieldDefs.Assign(Frodm.Cardex.FieldDefs);
     T1.CreateTable;
     GetParams;
     BQu.Params[0].Value:=St;
     BQu.Params[1].Value:=En;
     T1.Open;
     BQu.Open;
     PrgB.Min:=0;
     Prgb.Max:=BQu.RecordCount;
     PrgB.Position:=0;
     For I:=1 To BQu.RecordCount Do
     Begin
       PrgB.Position:=I;
       Filt:=Sold_Filt;
       T1.Append;
       T1.FieldByName('Id').AsInteger:=I;
       T1.FieldByName('Nam').Value:=BQuNam.AsString;
       T1.FieldByName('Anb').Value:=BQuAnbNam.AsString;
       //T1.FieldByName('AnbKod').Value:=BQuAnbKod.AsInteger;
       T1.FieldByName('Color').Value:=BQuColor.AsString;
       T1.FieldByName('Fee').AsCurrency:=SumFro(Filt)-SumRej(Filt);
       T1.FieldByName('Prem').Value:=SumBuy(Filt);
       T1.FieldByName('Pdiag').AsCurrency:=Round(T1.FieldByName('Fee').AsCurrency - T1.FieldByName('Prem').Value);
       T1.Post;
       BQu.Next;
     End;
     BQu.Close;
     T1.Close;
     T1.Open;
     T1.First;
     Open_g(Frodm.Cardex);
     Frodm.Cardex.Open;
     For I:=1 To T1.RecordCount Do
     Begin
      Frodm.Cardex.Append;
      For J:=1 To Frodm.Cardex.Fields.Count-1 Do
      Frodm.Cardex.Fields[J].Value:=T1.Fields[J].Value;
      Frodm.Cardex.Post;
      T1.Next;
     End;
     T1.Close;
     T1.DeleteTable;
{     Frodm.Cardex.Append;
     Frodm.CardexNam.Value:='ò”— „Ì‘Êœ:';
     Frodm.Cardex.Post;
     CalcCost;}
     Qsum.Open;
     Frodm.Cardex.Last;
     Frodm.Cardex.Append;
     Frodm.CardexNam.Value:='Ã„⁄ ò·';
     Frodm.CardexFee.Value:=QSum.Fields[0].AsCurrency;
     Frodm.CardexPrem.Value:=QSum.Fields[1].AsCurrency;
     Frodm.CardexPDiag.Value:=QSum.Fields[3].AsCurrency;
     Frodm.Cardex.Post;
     QSum.Close; 
     GQu.Open;
     Close_g(Frodm.Cardex);
end;

procedure TFDBenef.spPrintClick(Sender: TObject);
begin
     CreatingForm(TGPRep,'GPRep',GPRep);
     Set_Sys_Enviroment;
     GPRep.QRLabel1.Caption:='’Ê—  ”Êœ ò«·« »Â ò«·« «“  «—ÌŒ '+SDat.Text+' «·Ì '+EDat.Text;
     GPRep.QrDat.Caption:=IntToDate(Fardate);
     GPRep.qrRule.Caption:=P_Rule;
     GPRep.Preview;
     GPRep.Destroy;
end;


end.
