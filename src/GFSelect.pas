unit GFSelect;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, AcComboBox, Db, DBTables, Grids, DBGrids, ComCtrls, Buttons;

type
  TFGFSelect = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    GFName: TAcComboBox;
    FQt: TEdit;
    QList: TQuery;
    DataSource1: TDataSource;
    dbg: TDBGrid;
    QListKod: TIntegerField;
    QListNam: TStringField;
    QListQt: TFloatField;
    UpDown1: TUpDown;
    Button1: TBitBtn;
    Button2: TBitBtn;
    procedure NextTab(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FQtKeyPress(Sender: TObject; var Key: Char);
    procedure GFNameChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    No,Dat:Integer;
    Name:String;
    T1:TTable;
  end;

var
  FGFSelect: TFGFSelect;

implementation

uses ProVar, FrooshDM, Routins, CRoutins;

{$R *.DFM}

procedure TFGFSelect.NextTab(Sender: TObject; var Key: Char);
begin
     If Key =#13 Then
     Begin
      Key:=#0;
      SelectNext(Sender As TWinControl,True,True);
     End;
end;

procedure TFGFSelect.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFGFSelect.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     Fill_AcCombs(Frodm.Good,'Nam','Kod','Kod in (Select MKod From GForm)',GFName);
     QList.DataBaseName:=CurrDb;
end;

procedure TFGFSelect.FQtKeyPress(Sender: TObject; var Key: Char);
begin
     NextTab(Sender,Key);
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;

end;

procedure TFGFSelect.GFNameChange(Sender: TObject);
begin
     QList.Close;
     QList.Params[0].Value:=StrToFloat(FQt.Text);
     QList.Params[1].Value:=GFName.AcCode[GFName.ItemIndex];
     QList.Open;
end;


procedure TFGFSelect.Button1Click(Sender: TObject);
Var
I:Integer;
begin
     If QList.RecordCount = 0 Then Exit;
      QList.First;
      For I :=1 To QList.RecordCount Do
      Begin
       If T1.State = dsBrowse Then T1.Append Else T1.Edit;
       T1.FieldByName('No').AsInteger:=No;
       T1.FieldByName('Dat').AsInteger:=Dat;
       //T1.Fields[11].AsString:=Name;
       T1.Fields[1].AsInteger:=T1.RecordCount+1;
       T1.Fields[2].AsInteger:=QListKod.AsInteger;
       T1.Fields[3].AsString:=QListNam.AsString;
       T1.Fields[9].AsCurrency:=GoodSoldPrice(QListKod.AsInteger);
       T1.FieldByName('Quant').value:=QListQt.Value;
       T1.Post;
       Windows.Beep(2500,250);
       QList.Next;
      End;
end;

procedure TFGFSelect.Button2Click(Sender: TObject);
begin
     Close;
end;

end.
