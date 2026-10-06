unit Corps;

interface


uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, ExtCtrls, Outline, DirOutln, ComCtrls, StdCtrls, Buttons, Db,
  DBTables, DBGrids;

type
  TFCorp = class(TForm)
    Bevel1: TBevel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    StatusBar1: TStatusBar;
    Dbg: TDBGrid;
    T1: TTable;
    Ds: TDataSource;
    T1FName: TStringField;
    T1DbName: TStringField;
    T1Server: TStringField;
    FNet: TEdit;
    Sp: TSpeedButton;
    Label1: TLabel;
    cnCName: TComboBox;
    Q: TQuery;
    QDb: TQuery;
    T1User: TStringField;
    T1Pass: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DbgDblClick(Sender: TObject);
    procedure DbgKeyPress(Sender: TObject; var Key: Char);
    procedure DbgEditButtonClick(Sender: TObject);
    procedure T1BeforeScroll(DataSet: TDataSet);
    procedure T1BeforeInsert(DataSet: TDataSet);
    procedure DbgKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpClick(Sender: TObject);
  private
    { Private declarations }
    Procedure AppendAcKod(Table:TTable;Ac_Name:String;Ac_Kod,Ac_Kol,Ac_Mah:Integer);
    Procedure AppendUser(Table:TTable;UserName,PassWord:String;lBoss:Boolean;Id:Integer);
    Procedure ImportTable(Table:TTable;TableName,DestTable:String;Idx:Integer);
    Procedure MakeNew(SERVER,DBName,USERNAME,PASSWORD: String);
    Function DbExist(Server,DName,USERNAME,PASSWORD:String):Boolean;
    Function GetDataRoot:String;
  public
    { Public declarations }
    lim:Integer;
    Count:Integer;
  end;

var
  FCorp: TFCorp;

implementation

uses Routins, ProVar, FrooshDM,MakeDb,Registry, FileCtrl;

{$R *.DFM}
procedure TFCorp.AppendAcKod(Table: TTable; Ac_Name: String; Ac_Kod,Ac_Kol,
  Ac_Mah: Integer);
Var
Kol,Mo,Taf,Taf2:Integer;
begin
     Table.TableName:='AccountKod';
     Table.Open;
     Table.Append;
     Table.FieldByName('AccKod').AsFloat:=Ac_Kod*1.0e12+Ac_Kol*1.0e9;
     Table.FieldByName('KDas').AsInteger:=0;
     Table.FieldByName('Kgp').AsInteger:=Ac_Kod;
     Table.FieldByName('KMo').AsInteger:=0;
     Table.FieldByName('KGro').AsInteger:=Ac_Kol;
     Table.FieldByName('KKol').AsInteger:=0;
     Table.FieldByName('Ktaf').AsInteger:=0;
     Table.FieldByName('UseKod').AsInteger:=0;
     Table.FieldByName('Nam').AsString:=Ac_Name;
     Table.FieldByName('Mah').AsInteger:=Ac_Mah;
     Table.FieldByName('lPerm').Asboolean:=True;
     Table.Post;
     Table.Close;
end;

procedure TFCorp.AppendUser(Table: TTable; UserName, PassWord: String;lBoss:Boolean;Id:Integer);
Var
I:Integer;
Pss:String;
begin
     If Trim(UserName) = '' Then Exit;
     Table.TableName:='Users';
     Table.Open;
     Table.Append;
     Table.Fields[1].AsString:=UserName;
     Table.Fields[2].AsString:=PassWord;
     Table.Fields[3].AsBoolean:=lBoss;
     For I:=0 To 254 Do Pss:=Pss+'1';// Table.Fields[I].AsBoolean:=True;
     Table.Fields[4].AsString:=Pss;
     Table.Fields[8].AsInteger:=Id;
     Table.Post;
     Table.Close;
end;

Procedure TFCorp.ImportTable(Table:TTable;TableName,DestTable:String;Idx:Integer);
Var
Qu:TQuery;
I,J:Integer;
begin
     Qu:=TQuery.Create(Owner);
     Qu.DatabaseName:=RDir+'\DataBaseNull';
     Qu.SQL.Clear;
     Qu.SQL.Add('Select * From  '+TableName);
     Table.TableName:=DestTable;
     Qu.Open;
     Table.Open;
     For I:=1 to Qu.RecordCount Do
     Begin
      Table.Append;
      for J:=0 To Qu.FieldCount-1 Do Table.Fields[J+Idx].Value:=Qu.Fields[J].Value;
      Table.Post;
      Qu.Next;
     End;
     Qu.Close;
     Table.Close;
end;
procedure TFCorp.MakeNew(SERVER,DBName,USERNAME,PASSWORD: String);
Var
I,J:Integer;
Table:TTable;
Db:TDataBase;
TIndex:String;
IQu:TQuery;
begin
//     If DbExist(SERVER,DBNAME,USERNAME,PASSWORD) Then Exit;
     If GetDataRoot = '' Then Exit;
     Db:=TDataBase.Create(Owner);
     Db.DriverName:='MSSQL';
     Db.DatabaseName:='Parsian2';
     Db.LoginPrompt:=False;
//---------------------------------------------
     Db.Connected:=False;
     Db.Params.Clear;
     Db.Params.Add('SERVER NAME='+SERVER);
     Db.Params.Add('DATABASE NAME=MASTER');
     Db.Params.Add('USER NAME='+USERNAME);
     Db.Params.Add('PASSWORD='+PASSWORD);
//---------------------------------------------
     QDb.DatabaseName:=DB.DatabaseName;
     QDB.SQL.Strings[1]:='CREATE DATABASE '+DbName;
     QDB.Params[0].Value:=DBName+'_Data';
     QDB.Params[1].Value:=GetDataRoot+'\Data\'+DBName+'_Data.MDF';//C:\MSSQL7 C:\MSSQL7
     QDB.Params[2].Value:=DBName+'_Log';
     QDB.Params[3].Value:=GetDataRoot+'\Data\'+DBName+'_LOG.LDF';
     QDb.ExecSQL;
//---------------------------------------------
     Db.Connected:=False;
     Db.Params.Clear;
     Db.Params.Add('SERVER NAME='+SERVER);
     Db.Params.Add('DATABASE NAME='+DBNAME);
     Db.Params.Add('USER NAME='+USERNAME);
     Db.Params.Add('PASSWORD='+PASSWORD);
//---------------------------------------------
     Q.DatabaseName:=DB.DatabaseName;
     Q.ExecSQL;
     Table:=TTable.Create(Owner);
     Table.DatabaseName :=Db.DataBaseName;
     AppendUser(Table,'ÂœÌÂ —«Ì«‰Â','ÂœÌÂ',True,1);
     AppendUser(Table,'Admin','Admin',True,2);

     ImportTable(Table,'Accountkod.Db','Accountkod',1);
     ImportTable(Table,'Autobill.db','AutoBill',0);
     ImportTable(Table,'Btip.Db','Btip',0);
     Db.Close;
     Db.Destroy;
     Table.Destroy;
{     AppendAcKod(Table,'œ«—«ÌÌ Â«Ì Ã«—Ì',1,0,1);
     AppendAcKod(Table,'œ«—«ÌÌ Â«Ì €Ì— Ã«—Ì',2,0,1);
     AppendAcKod(Table,'»œÂÌ Â«Ì Ã«—Ì',3,0,-1);
     AppendAcKod(Table,'»œÂÌ Â«Ì €Ì— Ã«—Ì',4,0,-1);
     AppendAcKod(Table,'ÕﬁÊﬁ ’«Õ»«‰ ”Â«„',5,0,-1);
     AppendAcKod(Table,'œ—«„œÂ«',6,0,-1);
     AppendAcKod(Table,'œ—«„œÂ«Ì ⁄„·Ì« Ì',6,1,-1);
     AppendAcKod(Table,'œ—«„œÂ«Ì €Ì—⁄„·Ì« Ì',6,2,-1);
     AppendAcKod(Table,'Â“Ì‰Â Â«',7,0,1);
     AppendAcKod(Table,'Â“Ì‰Â Â«Ì ⁄„·Ì« Ì',7,1,1);
     AppendAcKod(Table,'Â“Ì‰Â Â«Ì €Ì—⁄„·Ì« Ì',7,2,1);}
end;

Function TFCorp.DbExist(Server,DName,USERNAME,PASSWORD:String):Boolean;
Var
Db:TDataBase;
begin
     Db:=TDataBase.Create(Application);
     Db.DriverName:='MSSQL';
     Db.DatabaseName:='Parsian2';
     Db.LoginPrompt:=False;
     Db.Connected:=False;
     Db.Params.Clear;
     Db.Params.Add('SERVER NAME='+Server);
     Db.Params.Add('DATABASE NAME='+DName);
     Db.Params.Add('USER NAME='+USERNAME);
     Db.Params.Add('PASSWORD='+PASSWORD);
     Try
     Db.Open;
     Result:=Db.Connected;
     Db.Close;
     Except On E:EDBEngineError Do Result:=False;
     End;
     Db.Destroy;
end;

Function TFCorp.GetDataRoot:String;
Var
Reg:TRegistry;
begin
     Result:='';
     Reg:=TRegistry.Create;
     Try
      Reg.RootKey:=HKEY_LOCAL_MACHINE;
      Reg.OpenKey('\SOFTWARE\Microsoft\MSSQLServer\Setup',False);
      Result:=Reg.ReadString('SQLDataRoot');
     Finally
     Reg.Free;
     End;
end;

procedure TFCorp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
     CopyFile(Pchar('ParAcc.Db'),PChar('ParAcc.Bak'),False);
end;

procedure TFCorp.FormCreate(Sender: TObject);
Var
Reg:TRegistry;
st:String;
begin
     Set_Forms(Self);
     Reg:=Tregistry.Create;
     T1.DatabaseName:=RDir;
     Try T1.Open; Except On E:EDBEngineError Do begin Exit; End; End;
     Count:=T1.RecordCount;

     FNet.Text:=NetDir;
     Try
      Reg.RootKey:=HKEY_LOCAL_MACHINE;
      Reg.OpenKey('\Software\Borland\Database Engine\Settings\SYSTEM\INIT',False);
      St:=Reg.ReadString('MAXBUFSIZE');//If KG Then
      UpDown1.Position:=StrToInt(St);
//      Reg.OpenKey('\Software\Borland\Database Engine\Settings\DRVERS\MSSQL\INIT',False);
//      If StrToInt(Reg.ReadString('MAX DBPROCESSES'))<84 Then Reg.WriteString('MAX DBPROCESSES','84');
      Reg.OpenKey('\SYSTEM\CurrentControlSet\Control\ComputerName\ActiveComputerName',False);
      cnCName.Items.Clear;
      cnCName.Items.Add('');
      cnCName.Items.Add(Reg.ReadString('ComputerName'));
      Reg.RootKey:=HKEY_CURRENT_USER;
      Reg.OpenKey('SoftWare\Hadieh Rayaneh\MParFro',False);
      Server:=Reg.ReadString('Server');
      cnCName.Text:=Server;
//      cnCName.ItemIndex:=cnCName.Items.IndexOf(Server);
//      cnCName.Enabled:=(cnCName.ItemIndex >-1)Or(Server='');
     Finally
     Reg.Free;
     End;
end;

procedure TFCorp.FormDestroy(Sender: TObject);
Var
I:Integer;
Reg:TRegistry;
begin
     T1.First;
     For I:=1 To T1.RecordCount Do
     Begin
      If Not DbExist(T1Server.AsString,T1DbName.AsString,'sa','') Then
       MakeNew(T1Server.AsString,T1DbName.AsString,'sa','');
      T1.Next;
     End;
     Server:=cnCName.Text;
     Reg:=Tregistry.Create;
     Try
      Reg.RootKey:=HKEY_LOCAL_MACHINE;
      Reg.OpenKey('\Software\Borland\Database Engine\Settings\SYSTEM\INIT',False);
      Reg.WriteString('MAXBUFSIZE',IntToStr(UpDown1.Position));//If KG Then
      Reg.RootKey:=HKEY_CURRENT_USER;
      Reg.OpenKey('SoftWare\Hadieh Rayaneh\MParFro',False);
      Reg.WriteString('NDir',FNet.Text);
      Reg.WriteString('Server',Server);
      //sNet:=Server <> '' ;
     Finally
     Reg.Free;
//     If IsServer Then
//     Begin
      DeleteFile(RDir+'\Par001.Rgs');
      RegKeyExport(HKEY_CURRENT_USER,'SoftWare\Hadieh Rayaneh\ParDs',RDir+'\Par001.Rgs');
//     End;
     End;
     NetDir:=FNet.Text;
     T1.Close;
     T1.Open;
end;

procedure TFCorp.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key = 27 Then Close;
end;

procedure TFCorp.DbgDblClick(Sender: TObject);
Const
Tit=' ⁄ÌÌ‰ „”Ì— ‰êÂœ«—Ì ›«Ì· Â«Ì »«‰ﬂ «ÿ·«⁄« Ì «‰ Œ«» ‘œÂ';
Var
St:String;
begin
     IF (SelectDirectory(Tit,'',St))and (T1.RecNo < lim)Then
     Begin
      T1.Edit;
      T1DbName.Value:=St;
      T1.Post;
     End;
end;

procedure TFCorp.DbgKeyPress(Sender: TObject; var Key: Char);

Procedure GMove(Gride:TdbGrid;Table:TTable);
Var
I,Col:Integer;
begin
     Col:=Gride.Columns.Count-1;
     I:=Gride.SelectedIndex;
     I:=I+1;
      If I < Col Then While Not((Gride.Columns[I].Visible)or(I=Col)) Do I:=I+1;
     If (I =Col) And Not(Gride.Columns[Col].Visible ) Then I:=I+1;
     If I > Col Then
     Begin
       I:=0;
       Gride.DataSource.DataSet.Next;
     End;
     Gride.SelectedIndex :=I;
end;

begin
     If Key = #13 Then
     Begin
       Key:=#0;
       GMove(Dbg,T1);
     End;
end;

procedure TFCorp.DbgKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key Of
      VK_DELETE:IF (ssCtrl In Shift ) Then T1.Delete;
      VK_RETURN:IF (ssCtrl In Shift ) Then DbgDblClick(Sender);
     End;

end;

procedure TFCorp.DbgEditButtonClick(Sender: TObject);
begin
     Case Dbg.SelectedIndex Of
     0: T1.Delete;// If (T1.RecNo <= lim)Then T1.Edit;
     1: DbgDblClick(Sender);
     End;

end;

procedure TFCorp.T1BeforeScroll(DataSet: TDataSet);
begin
     Dbg.ReadOnly:=T1.RecNo > lim;
end;

procedure TFCorp.T1BeforeInsert(DataSet: TDataSet);
begin
     Dbg.ReadOnly:=T1.RecNo > lim;
end;


procedure TFCorp.SpClick(Sender: TObject);
Const
Tit=' ⁄ÌÌ‰ œ—ê«Â « ’«· »Â ‘»òÂ';
Var
St:String;
begin
     IF (SelectDirectory(Tit,'',St))Then FNet.Text:=St;
end;

end.
