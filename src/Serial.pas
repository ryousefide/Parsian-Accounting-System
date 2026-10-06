unit Serial;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, Db, DBTables, ExtCtrls;

type
  TFSerial = class(TForm)
    Label1: TLabel;
    FNo: TEdit;
    dbg: TDBGrid;
    Bevel1: TBevel;
    CQu: TQuery;
    CQuId: TIntegerField;
    CQuDat: TIntegerField;
    CQuNam: TStringField;
    CQuColor: TStringField;
    CQuAnb: TStringField;
    CQuAnbKod: TIntegerField;
    CQuIn: TFloatField;
    CQuOut: TFloatField;
    CQuRem: TFloatField;
    CQuNo: TIntegerField;
    CQuDes: TStringField;
    CQuFacnam: TStringField;
    CQuFee: TCurrencyField;
    CQuPerc: TFloatField;
    CQuPrem: TCurrencyField;
    CQuDiag: TFloatField;
    CQuPdiag: TCurrencyField;
    CDs: TDataSource;
    Q1: TQuery;
    Q2: TQuery;
    Q3: TQuery;
    Q4: TQuery;
    Procedure NextTab(Sender:TObject;Var Key :Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FNoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSerial: TFSerial;

implementation

uses ProVar, Routins, FrooshDM;

{$R *.DFM}

procedure TFSerial.NextTab(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
      Key:=#0;
      SelectNext(Sender As TWinControl,True,True);
     End;
end;

procedure TFSerial.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFSerial.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     Q1.DataBaseName:=CurrDb;
     Q2.DataBaseName:=CurrDb;
     Q3.DataBaseName:=CurrDb;
     Q4.DataBaseName:=CurrDb;
     CQu.DataBaseName:=CurrDb;
end;

procedure TFSerial.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key Of
     VK_ESCAPE:Close;
     End;
end;

procedure TFSerial.FNoKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
      Key:=#0;
      CQu.Close;
      Q1.Params[0].Value:=FNo.Text;
      Q2.Params[0].Value:=FNo.Text;
      Q3.Params[0].Value:=FNo.Text;
      Q4.Params[0].Value:=FNo.Text;
      Open_g(Frodm.Cardex);
      Q1.ExecSQL;
      Q2.ExecSQL;
      Q3.ExecSQL;
      Q4.ExecSQL;
      CQu.Open;
      Close_g(Frodm.Cardex);
     End;
end;

end.
