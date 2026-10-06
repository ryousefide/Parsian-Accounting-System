unit DailyGoz;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Mask, ExtCtrls, Db, DBTables;

type
  TFDaily = class(TForm)
    dbgRch: TDBGrid;
    dbgPch: TDBGrid;
    dbgBinvo: TDBGrid;
    dbgInvo: TDBGrid;
    Label1: TLabel;
    SDat: TMaskEdit;
    Bshow: TButton;
    Bexit: TButton;
    Label2: TLabel;
    FCash: TEdit;
    Bevel1: TBevel;
    Bevel2: TBevel;
    RQu: TQuery;
    RDs: TDataSource;
    PQu: TQuery;
    Pds: TDataSource;
    BQu: TQuery;
    BDs: TDataSource;
    IQu: TQuery;
    IDs: TDataSource;
    PQuBDat: TIntegerField;
    PQuBNo: TStringField;
    PQuPBill: TCurrencyField;
    RQuBDat: TIntegerField;
    RQuBNo: TStringField;
    RQuPBill: TCurrencyField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure NextTab(Sender: TObject; var Key: Char);
    procedure SDatEnter(Sender: TObject);
    procedure SDatExit(Sender: TObject);
    procedure BshowClick(Sender: TObject);
    procedure BexitClick(Sender: TObject);
    procedure dbgRchKeyPress(Sender: TObject; var Key: Char);
    procedure dbgPchKeyPress(Sender: TObject; var Key: Char);
    procedure dbgBinvoKeyPress(Sender: TObject; var Key: Char);
    procedure dbgInvoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDaily: TFDaily;

implementation

uses FrooshDM, Routins, ProVar, Converts;

{$R *.DFM}

procedure TFDaily.NextTab(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
       Key:= #0;
       FDaily.SelectNext(Sender As TWinControl,True,True);
     End;
end;

procedure TFDaily.FormCreate(Sender: TObject);
begin
     Set_Forms(FDaily);
     RQu.DatabaseName:=CurrDb;
     PQu.DatabaseName:=CurrDb;
     BQu.DatabaseName:=CurrDb;
     IQu.DatabaseName:=CurrDb;
end;

procedure TFDaily.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFDaily.SDatEnter(Sender: TObject);
begin
     GetMaskText(SDat);
end;

procedure TFDaily.SDatExit(Sender: TObject);
begin
     SetMaskText(SDat);
     If(Not Date_Check(SDat.Text))and(DateToInt(SDat.Text) > 0) Then SDat.SetFocus;
end;

procedure TFDaily.BshowClick(Sender: TObject);
Const
 Sand = '’‰œÊﬁ';
Var
I:Integer;
Psum:Currency;
begin
     PQu.Close;
     RQu.Close;
     IQu.Close;
     BQu.Close;
     Frodm.Acbill.Filter:= ' AccNam ='+#39+Sand+#39+' and Dat ='+
     IntToStr(DateToInt(SDat.Text));
     Frodm.AcBill.MasterSource:=Nil;
     Frodm.Acbill.Filtered:=True;
     Frodm.AcBill.First;
     Psum:=0;
     For I:=1 To Frodm.AcBill.RecordCount Do
     Begin
        Psum:=Psum+Frodm.AcbillBed.Value-Frodm.AcBillBes.Value;
        Frodm.AcBill.Next;
     End;
     Frodm.AcBill.Filtered:=False;
     Frodm.AcBill.MasterSource:=Frodm.BillDs;
     FCash.Text:=CurrToFar(Psum);
     RQu.SQl.Strings[2]:='Where RecDat = '+IntToStr(DateToInt(SDat.Text));
     PQu.SQl.Strings[2]:='Where PayDat = '+IntToStr(DateToInt(Sdat.Text));
     IQu.SQl.Strings[2]:='Where Dat = '+IntToStr(DateToInt(Sdat.Text));
     BQu.SQl.Strings[2]:='Where Dat = '+IntToStr(DateToInt(Sdat.Text));
     PQu.Open;
     RQu.Open;
     IQu.Open;
     BQu.Open;
end;

procedure TFDaily.BexitClick(Sender: TObject);
begin
     Frodm.Rcheq.Filtered:=False;
     Frodm.Pcheq.Filtered:=False;
     Frodm.InvoGood.Filtered:=False;
     Frodm.BinvoGood.Filtered:=False;
     Frodm.InvoGood.MasterSource:=Frodm.InvoDs;
     Frodm.BinvoGood.MasterSource:=Frodm.BinvoDs;
     FDaily.Close;
end;

procedure TFDaily.dbgRchKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
       Key:=#0;
       GMove(dbgRch,Frodm.Rcheq);
     End;
end;

procedure TFDaily.dbgPchKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
       Key:=#0;
       GMove(dbgPch,Frodm.Pcheq);
     End;
end;

procedure TFDaily.dbgBinvoKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
       Key:=#0;
       GMove(dbgBinvo,Frodm.BinvoGood);
     End;

end;

procedure TFDaily.dbgInvoKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
       Key:=#0;
       GMove(dbgInvo,Frodm.InvoGood);
     End;
end;

end.
