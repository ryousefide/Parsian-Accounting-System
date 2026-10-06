unit UserLog;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids, Db, DBTables;

type
  TFUserLog = class(TForm)
    Label1: TLabel;
    User: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    cbDoc: TComboBox;
    cbAct: TComboBox;
    Bgrid: TDBGrid;
    spCalc: TSpeedButton;
    UQu: TQuery;
    Uds: TDataSource;
    UQuId: TAutoIncField;
    UQuUname: TStringField;
    UQuDat: TDateTimeField;
    UQuDoc: TStringField;
    UQuDdat: TIntegerField;
    UQuDno: TIntegerField;
    UQuDvalue: TFloatField;
    UQuAct: TStringField;
    UQuHtime: TDateTimeField;
    UQuFDat: TIntegerField;
    Procedure NextTab(Sender:TObject;Var Key:Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure spCalcClick(Sender: TObject);
    procedure BgridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    Function Make_Filter:String;
  public
    { Public declarations }
  end;

var
  FUserLog: TFUserLog;

implementation

uses ProVar, Routins, FrooshDM, MainForm;

{$R *.DFM}

{ TFUserLog }

Function TFUserLog.Make_Filter:String;
Var
St:String;
begin
     St:='';
     If User.Text <> '' Then St:='Uname = '+QuotedStr(User.Text);
     If cbDoc.Text <> '' Then St:=St+' and Doc = '+QuotedStr(cbDoc.Text);
     If cbAct.Text <> '' Then St:=St+' and Act = '+QuotedStr(cbAct.Text);
     If Pos(' and',St) = 1 Then Delete(St,1,4);
     Result:=St;
end;

procedure TFUserLog.NextTab(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
       Key:=#0;
       SelectNext(Sender As TWinControl,True,True);
     End;
end;

procedure TFUserLog.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Frodm.UAct.Filtered:=False;
     Action:=caFree;
end;

procedure TFUserLog.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     Main.glKey.GetBitmap(8,spCalc.Glyph);
     Fill(Frodm.Users,'UserN',User.Items);
     Fill_Comb(Frodm.UAct,'Doc',cbDoc.Items);
     UQu.DatabaseName:=CurrDb;
end;

procedure TFUserLog.spCalcClick(Sender: TObject);
begin
     UQu.Close;
     UQu.Filter:=Make_Filter;
     UQu.Filtered:=True;
     UQu.Open;
end;

procedure TFUserLog.BgridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
    If (Frodm.UActDdat.Value<>Frodm.UActFDat.Value) Then BGrid.Canvas.Font.Color :=clRed;
    BGrid.DefaultDrawColumnCell(Rect,DataCol,Column,State);

end;

end.
