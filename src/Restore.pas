unit Restore;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, FileCtrl, ExtCtrls, ComCtrls;

type
  TFRestore = class(TForm)
    FDay: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    BRestore: TButton;
    Bexit: TButton;
    Bevel1: TBevel;
    Pb: TProgressBar;
    Label4: TLabel;
    Bevel2: TBevel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BexitClick(Sender: TObject);
    procedure BRestoreClick(Sender: TObject);
  private
    { Private declarations }
    Dstr,PPath:String;
    Source,Dest:String;
    Procedure Close_Database;
    Procedure RescuBack(Sender:TObject);
    Function GetBackDate(FName:String):TDateTime;
  public
    { Public declarations }
  end;

var
  FRestore: TFRestore;

implementation

uses FrooshDM, MainForm, Routins, ProVar,DBTables;

{$R *.DFM}


Procedure TFRestore.Close_Database;
Var
I:Integer;
begin
     For I:=0 To Length(hTable)-1 Do
     (FroDM.Components[hTable[I]] As TTable).Close;
{     Frodm.DB1.CloseDataSets;
      For I:=0 To Frodm.ComponentCount-1 Do
      Begin
        If Frodm.Components[I] Is TTable Then
        Begin
          Table:=Frodm.Components[I] As TTable;
          Table.Active:=False;
        End;
      End;}
end;

Function TFRestore.GetBackDate(FName:String):TDateTime;
Var
FHandle:Integer;
begin
     fHandle:=FileOpen(FName,0);
     Try
      Result:=FileDateToDateTime(FileGetDate(FHandle));
     Finally
      FileClose(FHandle);
     End;
end;

Procedure TFRestore.RescuBack(Sender:TObject);
Var
St:String;
begin
     Screen.Cursor:=crSQLWait;
     St:=GetCorPath(CurrDataBase);
     Qu.SQL.Clear;
     Qu.SQL.Add('Backup DataBase '+St);
     Qu.SQL.Add('To Disk =:d');
     Qu.SQL.Add('With Format');
     Qu.Params[0].Value:='D:\Parsian Backs\'+St+IntToStr(Fardate)+'.bak';
     Qu.ExecSQL;
     Qu.SQL.Clear;
     Screen.Cursor:=crDefault;
end;

procedure TFRestore.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action :=caFree;
end;

procedure TFRestore.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     PPath:=GetCurrentDir;
end;

procedure TFRestore.BexitClick(Sender: TObject);
begin
     Close;
end;

procedure TFRestore.BRestoreClick(Sender: TObject);
Var
St:String;
FQu:TQuery;
Db:TDataBase;
begin
     St:=GetCorPath(CurrDataBase);
     FroDM.Db1.Close;
     FroDM.Db1.Connected:=False;
     Try
      FroDM.Db1.Exclusive:=True;
      FroDM.Db1.Open;
     Except On EDbEngineError Do
      Begin
      ShowMessage('«„ò«‰ »«“Ì«»Ì ‰„Ì »«‘œ.Å«Ìê«Â œ«œÂ „Ê—œ «” ›«œÂ œÌê—«‰ „Ì »«‘œ');
      Exit;
      End;
     End;
     RescuBack(Sender);
     Screen.Cursor:=crHourGlass;
     FQu:=TQuery.Create(Owner);
     FQu.DatabaseName:=FroDM.Db1.DatabaseName;
     FQu.SQL.Clear;
     FQu.SQL.Add('Use Master ');
     FQu.SQL.Add('Restore Database '+St);
     FQu.SQL.Add('From Disk = :d');
     FQu.SQL.Add('With Replace');
     FQu.Params[0].Value:='D:\Parsian Backs\'+St+IntToStr(FDay.ItemIndex+1)+'.bak';
     FQu.ExecSQL;
     FQu.Destroy;
     FroDM.Db1.Connected:=False;
     FroDM.Db1.Exclusive:=False;
     Setup_DataBase(CurrDataBase);
     Screen.Cursor:=crDefault;
     Close;
end;



end.
