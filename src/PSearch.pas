unit PSearch;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Grids, DBGrids, StdCtrls, ExtCtrls;

type
  TFPSearch = class(TForm)
    DQu: TQuery;
    DS: TDataSource;
    Dbg: TDBGrid;
    Panel1: TPanel;
    Memo1: TMemo;
    DQuNam: TStringField;
    DQuQuant: TFloatField;
    DQuPfee: TCurrencyField;
    DQuPerc: TFloatField;
    DQuinput: TCurrencyField;
    DQuDat: TIntegerField;
    FCurrDb: TComboBox;
    Label1: TLabel;
    DQuNo: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure DbgKeyPress(Sender: TObject; var Key: Char);
    procedure FCurrDbChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    fPerc:Real;
    fPrice:Currency;
    fOPrice:Currency;
    pYear:String;
    pGKod:Integer;
    pAcName:String;
    pCkod:Integer;
    pCost:String;
  end;

var
  FPSearch: TFPSearch;

implementation

uses ProVar, FrooshDM, Routins;

{$R *.DFM}

procedure TFPSearch.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     FCurrDb.Items:=Fill_Corps;
     DQu.DatabaseName:=CurrDb;
end;

procedure TFPSearch.DbgKeyPress(Sender: TObject; var Key: Char);
begin
     If Key =#13 Then ModalResult:=mrOK;
     If Key =#27 Then ModalResult:=mrCancel;
end;

procedure TFPSearch.FCurrDbChange(Sender: TObject);
begin
     pYear:=GetCorPath(FCurrDb.Text);
     DQu.Close;
     DQu.SQL.Strings[1]:='Use '+pYear;
     DQu.Open;
end;

end.
