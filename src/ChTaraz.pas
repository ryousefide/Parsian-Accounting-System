unit ChTaraz;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Grids, DBGrids, Db, DBTables, ExtCtrls;

type
  TFChTaraz = class(TForm)
    ChGrid: TDBGrid;
    Label1: TLabel;
    Dat1: TMaskEdit;
    Label2: TLabel;
    Dat2: TMaskEdit;
    RQu: TQuery;
    PQu: TQuery;
    Bshow: TButton;
    Bexit: TButton;
    Bevel1: TBevel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Dat1Enter(Sender: TObject);
    procedure Dat1Exit(Sender: TObject);
    procedure Dat2Enter(Sender: TObject);
    procedure Dat2Exit(Sender: TObject);
    procedure NextTab(Sender: TObject; var Key: Char);
    procedure BshowClick(Sender: TObject);
    procedure ChGridKeyPress(Sender: TObject; var Key: Char);
    procedure BexitClick(Sender: TObject);
  private
    { Private declarations }
    SDat,EDat:Integer;
    Function DInSum(Dat:Integer):Currency;
    Function DOutSum(Dat:Integer):Currency;
    Function Ch_Period:Boolean;
    Procedure Calc;
  public
    { Public declarations }
  end;

var
  FChTaraz: TFChTaraz;

implementation

uses FrooshDM, ProVar, Routins, Converts;

{$R *.DFM}

procedure TFChTaraz.NextTab(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
       Key :=#0;
       FChTaraz.SelectNext(Sender As TWinControl,True,True);
     End;
end;

Function TFChTaraz.Ch_Period:Boolean;
begin
     SDat:=DateToInt(Dat1.Text);
     EDat:=DateToInt(Dat2.Text);
     If (SDat=0) Or (SDat > EDat) Then Result :=False Else Result := True;
end;

Function TFChTaraz.DInSum(Dat:Integer):Currency;
begin
     RQu.SQL.Strings[2]:='WHERE RecKod = 0 and BDat = '+IntToStr(Dat);
     RQu.Open;
     Result:=RQu.Fields[0].AsCurrency;
     RQu.Close;
end;

Function TFChTaraz.DOutSum(Dat:Integer):Currency;
begin
     PQu.SQL.Strings[2]:='WHERE PayKod = 0 and BDat = '+IntToStr(Dat);
     PQu.Open;
     Result:=PQu.Fields[0].AsCurrency;
     PQu.Close;
end;

Procedure TFChTaraz.Calc;
Var
I:Integer;
Bed,Bes:Currency;
begin
     If Ch_Period Then
     Begin
       For I:=Sdat To EDat Do
       Begin
         Bed:=DInSum(I);
         Bes:=DOutSum(I);
         Frodm.Gardesh.Append;
         Frodm.GardeshBedeh.Value:=Bed;
         Frodm.GardeshBestan.Value:=Bes;
         Frodm.GardeshBaghi.Value:=Bed-Bes;
         Frodm.GardeshDat.Value:=I;
         Frodm.Gardesh.Post;
       End;
     End;
end;

procedure TFChTaraz.FormCreate(Sender: TObject);
begin
     Set_Forms(FChTaraz);
     Open_g(Frodm.Gardesh);
     RQu.DataBaseName:=CurrDb;
     PQu.DataBaseName:=CurrDb;
end;

procedure TFChTaraz.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Frodm.Gardesh.Filtered:=False;
     Open_g(Frodm.Gardesh);
     Frodm.Gardesh.Close;
     Action:=caFree;
end;

procedure TFChTaraz.Dat1Enter(Sender: TObject);
begin
     GetMaskText(Dat1);
end;

procedure TFChTaraz.Dat1Exit(Sender: TObject);
begin
     SetMaskText(Dat1);
     If(Not Date_Check(Dat1.Text))And(DateToInt(Dat1.Text)>0)Then Dat1.SetFocus;
end;

procedure TFChTaraz.Dat2Enter(Sender: TObject);
begin
     GetMaskText(Dat2);
end;

procedure TFChTaraz.Dat2Exit(Sender: TObject);
begin
     SetMaskText(Dat2);
     If(Not Date_Check(Dat2.Text))And(DateToInt(Dat2.Text)>0)Then Dat2.SetFocus;
end;

procedure TFChTaraz.BshowClick(Sender: TObject);
begin
     Screen.Cursor:=crHourGlass;
     ChGrid.DataSource:=Nil;
     Open_g(Frodm.Gardesh);
     Calc;
     Frodm.Gardesh.Filter:='Bedeh > 0 Or Bestan >0';
     Frodm.Gardesh.Filtered:=True;
     ChGrid.DataSource:=Frodm.GardeshDs;
     Screen.Cursor:=crDefault;
end;

procedure TFChTaraz.ChGridKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
       Key:=#0;
       GMove(ChGrid,Frodm.Gardesh);
     End;
end;

procedure TFChTaraz.BexitClick(Sender: TObject);
begin
     FChTaraz.Close;
end;

end.
