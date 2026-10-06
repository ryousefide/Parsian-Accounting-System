unit OuPrice;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls;

type
  TFOutPrices = class(TForm)
    FQu: TQuery;
    Ds: TDataSource;
    FQuDat: TIntegerField;
    FQuNam: TStringField;
    FQuAnb: TStringField;
    FQuOut: TFloatField;
    FQuNo: TIntegerField;
    FQuDes: TStringField;
    FQuFee: TCurrencyField;
    dbg: TDBGrid;
    FQuFacnam: TStringField;
    FQuId: TIntegerField;
    FQuColor: TStringField;
    FQuAnbKod: TIntegerField;
    FQuIn: TFloatField;
    FQuRem: TFloatField;
    FQuPerc: TFloatField;
    FQuPrem: TCurrencyField;
    FQuDiag: TFloatField;
    FQuPdiag: TCurrencyField;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Procedure NextTab(Sender:TObject;Var Key :Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    LastValue:Currency;
    OutQt:Real;
    Procedure RemoveRejected;
  public
    { Public declarations }
    Filter:String;
    Qt:Real;
    Fee:Currency;
    Kod:Integer;
    AnbNam:String;
    FacNam:String;
    procedure CalcList;
  end;

var
  FOutPrices: TFOutPrices;

implementation

uses ProVar, FrooshDM, Routins;

{$R *.DFM}

{ TFOutPrices }
procedure TFOutPrices.RemoveRejected;
begin
     Qu.SQL.Clear;
     Qu.SQL.Add('Update Cardex  ');
     Qu.SQL.Add('Set IIn=(Select Sum(Quant) From RejInvoGood R Where ');
     Qu.SQL.Add(' Cardex.No=R.Inv) ' );
     Qu.SQL.Add('Where Des='+QuotedStr('›«ﬂ Ê— ›—Ê‘')+' and FacNam = '+#39+FacNam+#39 );
     Qu.ExecSQL;
{     Qu.SQL.Clear;
     Qu.SQL.Add('Update Cardex C ');
     Qu.SQL.Add('Set C.In=0 Where C.In Is Null and ');
     Qu.SQL.Add('C.Des='+QuotedStr('›«ﬂ Ê— ›—Ê‘')+' and C.FacNam = '+#39+FacNam+#39 );
     Qu.ExecSQL; }
     Qu.SQL.Clear;
     Qu.SQL.Add('Update Cardex  ');
     Qu.SQL.Add('Set Out=Out-IIn ');
     Qu.SQL.Add('Where Des='+QuotedStr('›«ﬂ Ê— ›—Ê‘')+' and FacNam = '+#39+FacNam+#39 );
     Qu.SQL.Add('and Not IIn Is Null');
     Qu.ExecSQL;
end;

procedure TFOutPrices.CalcList;
begin
     Sold_Price(P_Rule,Qu,IntToStr(Kod),'',AnbNam,0,0,111111111,Qt,LastValue);
     RemoveRejected;
     FQu.Close;
     FQu.Filter:=Filter;
     FQu.Open;
     FQu.Filtered:=True;
end;

procedure TFOutPrices.NextTab(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
      Key:=#0;
      SelectNext(Sender As TWinControl,True,True);
     End;
end;

procedure TFOutPrices.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFOutPrices.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
end;


end.
