unit NewYear;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, FileCtrl,ExtCtrls, Mask, ComCtrls, Buttons, DbTables, Provar,
  Db, CheckLst, XPCheckListBox ;

type
  TFNewYear = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    FNam: TEdit;
    FPath: TEdit;
    Bexit: TButton;
    BMake: TButton;
    Bevel3: TBevel;
    cbAc: TCheckBox;
    cbR: TCheckBox;
    cbJari: TCheckBox;
    cbP: TCheckBox;
    cbD: TCheckBox;
    Label3: TLabel;
    RDat: TMaskEdit;
    Label4: TLabel;
    Label5: TLabel;
    PDat: TMaskEdit;
    Label6: TLabel;
    StatusBar1: TStatusBar;
    Shape1: TShape;
    Shape2: TShape;
    SpeedButton1: TSpeedButton;
    QTJ: TQuery;
    List: TXPCheckListBox;
    Label7: TLabel;
    PageControl1: TPageControl;
    TS1: TTabSheet;
    List1: TXPCheckListBox;
    TS2: TTabSheet;
    List2: TXPCheckListBox;
    TS3: TTabSheet;
    List3: TXPCheckListBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BexitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BMakeClick(Sender: TObject);
    procedure FNamExit(Sender: TObject);
    procedure NextTab(Sender: TObject; var Key: Char);
    procedure RDatEnter(Sender: TObject);
    procedure RDatExit(Sender: TObject);
    procedure PDatExit(Sender: TObject);
    procedure PDatEnter(Sender: TObject);
    procedure cbRClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure cbAcClick(Sender: TObject);
  private
    { Private declarations }
    NewDb:String;
    NewDbName:String;
    DestDb:TDatabase;
    MaxNo:Integer;
    Procedure CreateDB;
    Procedure AssignDestDb(QDB:TQDbParam);
    Procedure MoveConstData(TableName:String);
    Procedure Create_Gardesh_Table_Dest(TName:String);
    Function unMoveList(List:TXPCheckListBox):String;
    Procedure End_Remain_Cost;
    Procedure End_Remain_Cent;
    Procedure End_Remain;
    Procedure Get_Remain;

    Procedure RCheq_Move;
    Procedure RSaf_Move;
    Procedure PCheq_Move;
    Procedure Depot_Move;
    Procedure Jari_Move;
    Procedure Ac_Move;
  public
    { Public declarations }
  end;

var
  FNewYear: TFNewYear;

implementation

uses Routins, MainForm, FrooshDM, AccRem, Enviro,
  Binvoice, Corps, RRes, RKeler, CRoutins;

{$R *.DFM}

procedure TFNewYear.NextTab(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
      Key:=#0;
      SelectNext(Sender As TWinControl,True,True);
     End;
end;

//Procedure For Copy Variable Db Files
Procedure TFNewYear.CreateDB;
Begin
     CreatingForm(TFCorp,'FCorp',FCorp);
     With FCorp Do
     Begin
      T1.Last;
      T1.Append;
      T1FName.Value:=FNam.Text;
      T1DbName.Value:=FPath.Text;
      T1Server.Value:=ProVar.QDb.Server;
      T1User.Value:='SA';//Provar.QDb.User;
      T1Pass.Value:='';//Provar.QDb.PassWord;
      T1.Post;
      FormDestroy(Owner);
      Close;
     End;
End;

Procedure TFNewYear.AssignDestDb(QDB:TQDbParam);
Begin
     DestDb:=TDataBase.Create(Application);
     DestDb.DriverName:='MSSQL';
     DestDb.DatabaseName:='DSDB';
     DestDb.LoginPrompt:=False;
     DestDb.Connected:=False;
     DestDb.Params.Clear;
     DestDb.Params.Add('SERVER NAME='+QDB.Server);
     DestDb.Params.Add('DATABASE NAME='+QDB.DbName);
     DestDb.Params.Add('USER NAME=SA');//+QDB.User);
     DestDb.Params.Add('PASSWORD=');//+QDB.PassWord);
     If MessageDlg('¬Ì« «œ«„Â „ÌœÂÌœ ø',mtWarning,MBYESNO,0)=mrNo Then Close;
     DestDb.Connected:=True;
     DestDb.Connected:=False;
end;

Procedure TFNewYear.MoveConstData(TableName:String);
Var
RQu:TQuery;
Table:TTable;
I,J:Integer;
begin
     RQu:=TQuery.Create(Owner);
     RQu.DataBaseName:=CurrDb;
     Table:=TTable.Create(Owner);
     Table.DatabaseName:=DestDb.DatabaseName;//Destination
     Table.TableName:=TableName;
     Table.EmptyTable;
     Table.Open;
     RQu.SQL.Add('Select * From  '+TableName);
     RQu.Open;
     For I:=1 To RQu.RecordCount Do
     Begin
      Table.Append;
      For J:=0 To RQu.Fields.Count-1 Do
      If Table.Fields[J].DataType <> ftAutoInc Then Table.Fields[J].Value:=RQu.Fields[J].Value;
      Table.Post;
      RQu.Next;
     End;
     RQu.Close;
     Table.Close;
     RQu.Free;
     Table.Free;
end;

Procedure TFNewYear.Create_Gardesh_Table_Dest(TName:String);
const
CQ=' if exists (select * from sysobjects where id = object_id(N'+#39+'[dbo].[';
CQ1=']'+#39+') and OBJECTPROPERTY(id, N'+#39+'IsUserTable'+#39+') = 1) drop table [dbo].[';

SQ='	[Id] [int] IDENTITY (1, 1) NOT NULL ,'+
   '	[Dat] [int] NULL ,'+
   '	[Bedeh] [money] NULL ,'+
   '	[Bestan] [money] NULL ,'+
   '	[BedRem] [money] NULL ,'+
   '	[BesRem] [money] NULL ,'+
   '	[Baghi] [money] NULL ,'+
   '	[Des] [varchar] (140) NULL ,'+
   '	[No] [int] NULL ,'+
   '	[Diag] [money] NULL ,'+
   '	[Ctip] [varchar] (40) NULL '+
   ' ) ON [PRIMARY] '+
   ' ALTER TABLE [dbo].[';
SQ1='] WITH NOCHECK ADD CONSTRAINT [PK_';
SQ2='] PRIMARY KEY  NONCLUSTERED ( [Id] )  ON [PRIMARY]';

Var
PT:TTable;
BQu:TQuery;
begin
     BQu:=TQuery.Create(Application);
     BQu.DatabaseName:=DestDb.DatabaseName;
     BQU.SQL.Add(CQ+TName+CQ1+TName+']');
     BQU.SQL.Add('CREATE TABLE [dbo].['+TName+'] (');
     BQu.SQL.Add(SQ+TName+SQ1+TName+SQ2);
     BQu.ExecSQL;
     BQu.Free;
     Frodm.Gardesh.Close;
     Frodm.Gardesh.TableName:=TName;
end;

Function TFNewYear.unMoveList(List:TXPCheckListBox):String;
Var
I:Integer;
Value:String;
begin
     Value:='';
     For I:=0 To List.Items.Count-1 Do
      If List.Checked[I] Then Value:=Value+'"'+FloatToStr(List.AcCode[I])+'",';
     If Value <> '' Then Delete(Value,Length(Value),1);
     Result := Value;
end;

Procedure TFNewYear.End_Remain_Cost;
Var
I,Dat:Integer;
Rem,CRem:Currency;
Baghi:Currency;
Rqu:TQuery;
CCond:String;
begin
     Screen.Cursor:=crHourGlass;
//     Create_Gardesh_Table('Gardesh'+IntToStr(CUser.Id));
//     Open_G(Frodm.Gardesh);
     CCond:=unMoveList(List3);
     If CCond = '' Then Exit;
     Rqu:=TQuery.Create(Owner);
     Rqu.DataBaseName:=CurrDb;
     Rqu.SQL.Add('SELECT Sum(Bed) ARem,Sum(Bes) BRem,AcKod,Max(Dat),Cost,CKod,Ctip,');
     Rqu.SQL.Add('Sum(CBed) CARem,Sum(CBes) CBRem ');
     Rqu.SQL.Add('FROM AcountBill Where Tip=0 and AcKod In ('+CCond+')');
     Rqu.SQL.Add('Group By AcKod,Cost,CKod,CTip');
     Rqu.SQL.Add('Order By 3,5,6 ');
     Rqu.Open;
     Rqu.First;
     Baghi:=0;
     Dat:=Fardate;
     For I:=1 To Rqu.RecordCount Do
     Begin
       Rem:=Rqu.Fields[0].AsCurrency-Rqu.Fields[1].AsCurrency;
       CRem:=Rqu.Fields[7].AsCurrency-Rqu.Fields[8].AsCurrency;
       Baghi:=Baghi+Rem;
       If Rem <> 0 Then
       Begin
        Frodm.Gardesh.Append;
        Frodm.GardeshDesc.Value :=Rqu.Fields[4].AsString;// Cost
        Frodm.GardeshNo.Value :=Rqu.Fields[5].AsInteger; //CKod
        Frodm.GardeshDat.Value :=Rqu.Fields[3].AsInteger;//Dat
        If Rem > 0 Then Frodm.GardeshBedeh.Value :=Rem Else  Frodm.GardeshBestan.Value :=Abs(Rem);
        If CRem > 0 Then Frodm.GardeshBedRem.Value :=CRem Else  Frodm.GardeshBesRem.Value :=Abs(CRem);
        Frodm.GardeshBaghi.Value :=Baghi;
        Frodm.GardeshDiag.AsFloat:=Rqu.Fields[2].AsFloat;
        Frodm.Gardesh.FieldByName('Ctip').AsString:=Rqu.Fields[6].AsString;
        Frodm.Gardesh.Post;
       End;
       Rqu.Next;
     End;
     Rqu.Close;
     Rqu.Free;
     Screen.Cursor:=crDefault;
end;

Procedure TFNewYear.End_Remain_Cent;
Var
I,Dat:Integer;
Rem,CRem:Currency;
Baghi:Currency;
Rqu:TQuery;
CCond:String;
begin
     Screen.Cursor:=crHourGlass;
//     Create_Gardesh_Table('Gardesh'+IntToStr(CUser.Id));
//     Frodm.Gardesh.Open;
     //Open_G(Frodm.Gardesh);
     CCond:=unMoveList(List2);
     If CCond = '' Then Exit;
     Rqu:=TQuery.Create(Owner);
     Rqu.DataBaseName:=CurrDb;
     Rqu.SQL.Add('SELECT Sum(Bed) ARem,Sum(Bes) BRem,AcKod,Max(Dat),CKod,Ctip,');
     Rqu.SQL.Add('Sum(CBed) CARem,Sum(CBes) CBRem ');
     Rqu.SQL.Add('FROM AcountBill Where Tip=0 and AcKod In ('+CCond+')');
     Rqu.SQL.Add('Group By AcKod,CKod,CTip');
     Rqu.SQL.Add('Order By 3,5 ');
     Rqu.Open;
     Rqu.First;
     Baghi:=0;
     Dat:=Fardate;
     For I:=1 To Rqu.RecordCount Do
     Begin
       Rem:=Rqu.Fields[0].AsCurrency-Rqu.Fields[1].AsCurrency;
       CRem:=Rqu.Fields[6].AsCurrency-Rqu.Fields[7].AsCurrency;
       Baghi:=Baghi+Rem;
       If Rem <> 0 Then
       Begin
        Frodm.Gardesh.Append;
        //Frodm.GardeshDesc.Value :=Rqu.Fields[4].AsString;// Cost
        Frodm.GardeshNo.Value :=Rqu.Fields[4].AsInteger; //CKod
        Frodm.GardeshDat.Value :=Rqu.Fields[3].AsInteger;//Dat
        Frodm.GardeshBedeh.Value:=0;
        Frodm.GardeshBestan.Value:=0;
        Frodm.GardeshBedRem.Value:=0;
        Frodm.GardeshBesRem.Value:=0;
        If Rem > 0 Then Frodm.GardeshBedeh.Value :=Rem Else  Frodm.GardeshBestan.Value :=Abs(Rem);
        If CRem > 0 Then Frodm.GardeshBedRem.Value :=CRem Else  Frodm.GardeshBesRem.Value :=Abs(CRem);
        Frodm.GardeshBaghi.Value :=Baghi;
        Frodm.GardeshDiag.AsFloat:=Rqu.Fields[2].AsFloat;
        Frodm.Gardesh.FieldByName('Ctip').AsString:=Rqu.Fields[5].AsString;
        Frodm.Gardesh.Post;
       End;
       Rqu.Next;
     End;
     Rqu.Close;
     Rqu.Free;
//     Frodm.Gardesh.Close;
     Screen.Cursor:=crDefault;
end;

Procedure TFNewYear.End_Remain;
Var
I,Dat:Integer;
Rem,CRem:Currency;
Baghi:Currency;
Rqu:TQuery;
CCond:String;
begin
     Screen.Cursor:=crHourGlass;
     //Create_Gardesh_Table('Gardesh'+IntToStr(CUser.Id));
     //Frodm.Gardesh.Open;
     CCond:=unMoveList(List1);
     If CCond = '' Then Exit;
     Rqu:=TQuery.Create(Owner);
     Rqu.DataBaseName:=CurrDb;
     Rqu.SQL.Add('SELECT Sum(Bed) ARem,Sum(Bes) BRem,AcKod,Max(Dat),Ctip,');
     Rqu.SQL.Add('Sum(CBed) CARem,Sum(CBes) CBRem ');
     Rqu.SQL.Add('FROM AcountBill Where Tip=0 and AcKod In ('+CCond+')');
     Rqu.SQL.Add('Group By AcKod,CTip');
     Rqu.SQL.Add('Order By 3,5 ');
     Rqu.Open;
     Rqu.First;
     Baghi:=0;
     Dat:=Fardate;
     For I:=1 To Rqu.RecordCount Do
     Begin
       Rem:=Rqu.Fields[0].AsCurrency-Rqu.Fields[1].AsCurrency;
       CRem:=Rqu.Fields[5].AsCurrency-Rqu.Fields[6].AsCurrency;
       Baghi:=Baghi+Rem;
       If Rem <> 0 Then
       Begin
        Frodm.Gardesh.Append;
        //Frodm.GardeshDesc.Value :=Rqu.Fields[4].AsString;// Cost
        //Frodm.GardeshNo.Value :=Rqu.Fields[4].AsInteger; //CKod
        Frodm.GardeshDat.Value :=Rqu.Fields[3].AsInteger;//Dat
        Frodm.GardeshBedeh.Value:=0;
        Frodm.GardeshBestan.Value:=0;
        Frodm.GardeshBedRem.Value:=0;
        Frodm.GardeshBesRem.Value:=0;
        If Rem > 0 Then Frodm.GardeshBedeh.Value :=Rem Else  Frodm.GardeshBestan.Value :=Abs(Rem);
        If CRem > 0 Then Frodm.GardeshBedRem.Value :=CRem Else  Frodm.GardeshBesRem.Value :=Abs(CRem);
        Frodm.GardeshBaghi.Value :=Baghi;
        Frodm.GardeshDiag.AsFloat:=Rqu.Fields[2].AsFloat;
        Frodm.Gardesh.FieldByName('Ctip').AsString:=Rqu.Fields[4].AsString;
        Frodm.Gardesh.Post;
       End;
       Rqu.Next;
     End;
     Rqu.Close;
     Rqu.Free;
//     Frodm.Gardesh.Close;
     Screen.Cursor:=crDefault;
end;

Procedure TFNewYear.Get_Remain;
begin
     Screen.Cursor:=crHourGlass;
     Create_Gardesh_Table('Gardesh'+IntToStr(CUser.Id));
     Frodm.Gardesh.Open;
     End_Remain;
     End_Remain_Cent;
     End_Remain_Cost;
     Frodm.Gardesh.Close;
     Screen.Cursor:=crDefault;
end;

Procedure TFNewYear.RCheq_Move;
Var
Table:TTable;
I,J,K:Integer;
KNo:Integer;
BSum,Kol:Currency;
JQu:TQuery;
begin
     Table:=TTable.Create(Owner);
     Table.DatabaseName :=DestDb.DatabaseName;
     Table.TableName :='RCheq';
     Table.Active:=True;
     Frodm.Rcheq.Open;
     Frodm.Rcheq.Filter:='Reckod=False';
     Frodm.Rcheq.Filtered:=True;
     Frodm.Rcheq.First;
     BSum:=0;
     For I:=1 To Frodm.Rcheq.RecordCount Do
     Begin
       Table.Append;
       For J:=0 To Frodm.Rcheq.Fields.Count-1 Do
          Table.Fields[j+1].Value:=Frodm.Rcheq.Fields[j].Value;
       Table.FieldbyName('No').Value :=1;
       BSum:=BSum+Table.FieldByName('PBill').AsCurrency;
       Table.Post;
       Frodm.Rcheq.Next;
     End;
     Table.Active :=False;
     Table.Free;

     Frodm.RRes.Close;
     Frodm.RRes.DatabaseName:=DestDb.DatabaseName;
     Frodm.RRes.Open;
     Frodm.RRes.Append;
     Frodm.RResNo.Value:=1;
     Frodm.RResDat.Value:=Fardate;
     Frodm.RResAcckod.Value:=5007003000000;
     Frodm.RResAcnam.Value:='”—„«ÌÂ «Ê· œÊ—Â';
     Frodm.RResPerm.Value:=False;
     Frodm.RResBilled.Value:=False;
     Frodm.RResPsum.Value:=BSum;
     Frodm.RResCprice.Value:=BSum;
     Frodm.RResCtip.Value:=DefaultCurr;
     Frodm.RResDes.Value:='«‰ ﬁ«· «”‰«œ Ê’Ê· ‰‘œÂ œÊ—Â ﬁ»· ';
     Frodm.RRes.Post;
     Frodm.RRes.Close;
     Frodm.RRes.DatabaseName:=CurrDb;
     Frodm.RRes.Open;
//------------------Keler
     Frodm.Rkel.Close;
     Frodm.RKel.DatabaseName:=DestDb.DatabaseName;
     Frodm.RKel.Open;
     Frodm.RKI.Close;
     Frodm.RKI.DatabaseName:=DestDb.DatabaseName;
     Frodm.RKI.Open;

     JQu:=TQuery.Create(Owner);
     JQu.DataBaseName:=DestDb.DatabaseName;
     JQu.SQL.Clear;
     JQu.SQL.Add('Select BNo,BDat,Bank,PBill From RCheq ');
     JQu.SQL.Add('Where KELER=1 and Jari=:j ');
     Frodm.JariNam.First;
     KNo:=1;
     For I:=1 to Frodm.JariNam.RecordCount Do
     Begin
      JQu.Params[0].Value:=Frodm.JariNamNam.Value;
      JQu.Open;
      If JQu.RecordCount >0 Then
      Begin
       BSum:=0;
       For J:=1 to JQu.RecordCount Do
       Begin
        Frodm.RKI.Append;
        Frodm.RKIRadif.Value:=J;
        Frodm.RKIBno.Value:=JQu.Fields[0].Value;;
        Frodm.RKIBdat.Value:=JQu.Fields[1].Value;
        Frodm.RKIBank.Value:=JQu.Fields[2].AsString;
        Frodm.RKIPbill.Value:=JQu.Fields[3].Value;
        Frodm.RKINo.Value:=KNo;
        Frodm.RKIReject.Value:=False;
        Frodm.RKI.Post;
        BSum:=BSum+JQu.Fields[3].Value;
        JQu.Next;
       End;
       Frodm.Rkel.Append;
       Frodm.RkelNo.Value:=KNo;
       Frodm.RkelDat.Value:=Fardate;
       Frodm.RkelAcnam.Value:=Frodm.JariNamNam.Value;
       Frodm.RKelAccKod.Value:=AccKod(Frodm.RKelAcnam.AsString);
       Frodm.RkelPerm.Value:=False;
       Frodm.RkelBilled.Value:=False;
       Frodm.RkelPsum.Value:=BSum;
       Frodm.RkelDes.Value:='«”‰«œ œ—Ã—Ì«‰ Ê’Ê· «“ œÊ—Â ﬁ»·';
       Frodm.Rkel.Post;
       KNo:=KNo+1;
      End;
      JQu.Close;
      Frodm.JariNam.Next;
     End;
     Frodm.Rkel.Close;
     Frodm.RKel.DatabaseName:=CurrDb;
     Frodm.RKel.Open;
     Frodm.RKI.Close;
     Frodm.RKI.DatabaseName:=CurrDb;
     Frodm.RKI.Open;
end;

Procedure TFNewYear.RSaf_Move;
Var
I,J:Integer;
Table:TTable;
begin
     Table:=TTable.Create(Owner);
     Table.DatabaseName :=DefaultPath;
     Table.TableName :='Rsaf';
     Table.Active:=True;
     Table.Filter:='Statue ='+#39+'œ—Ã—Ì«‰'+Chr(39);
     Table.Filtered:=True;
     Table.First;
     For I:=1 To Table.RecordCount Do
     Begin
       Frodm.Pcheq.Append;
       For J:=0 To Frodm.Rsaf.FieldCount-1 Do
         Frodm.Rsaf.Fields[j].Value :=Table.Fields[j].Value;
       Frodm.Rsaf.Post;
       Table.Next;
     End;
     Table.Active :=False;
     Table.Free;
end;

Procedure TFNewYear.PCheq_Move;
Var
I,J:Integer;
Table:TTable;
begin
     Table:=TTable.Create(Owner);
     Table.DatabaseName :=DestDb.DatabaseName;
     Table.TableName :='PCheq';
     Table.Active:=True;
     Frodm.Pcheq.Open;
     Frodm.Pcheq.Filter:='Paykod=False';// or BDat >= '+IntToStr(DateToInt(PDat.Text));
     Frodm.Pcheq.Filtered:=True;
     Frodm.Pcheq.First;
     For I:=1 To Frodm.Pcheq.RecordCount Do
     Begin
       Table.Append;
       For J:=1 To Frodm.Pcheq.FieldCount-1 Do
         Table.Fields[j].Value:=Frodm.Pcheq.Fields[j].Value;
       Table.FieldByName('PBNo').Value:=-1;
       Table.Post;
       Frodm.Pcheq.Next;
     End;
     Table.Active :=False;
     Frodm.Pcheq.Close;
     Table.Free;
end;

Procedure TFNewYear.Depot_Move;
Var
I:Integer;
DQu:Tquery;
Table:TTable;
AnbKod,Kod,Dat:Integer;
Nam,Color,Anb:String;
Quant:Real;
LValue,Ptotal:Currency;
begin
     Table:=TTable.Create(Owner);
     Table.DatabaseName :=CurrDB;//DefaultPath;
     Table.TableName :=Frodm.Depot.TableName;// 'Depot';
     Table.Active:=True;
     Table.Filter:='Quant > 0 ';
     Table.Filtered:=True;
     Table.First;

     Frodm.BinvoGood.Close;
     Frodm.BinvoGood.DatabaseName:=DestDb.DatabaseName;
     Frodm.BinvoGood.Open;

     Frodm.Binvo.Close;
     Frodm.Binvo.DatabaseName:=DestDb.DatabaseName;
     Frodm.Binvo.Open;

     DQu:=TQuery.Create(Owner);
     DQu.DatabaseName :=CurrDB;//DefaultPath;
     Dat:=Fardate;
     Frodm.BInvo.Append;
     Frodm.BinvoNo.Value :=0;
     Frodm.BinvoDat.Value :=Dat;
     Frodm.BinvoNam.Value :='”—„«ÌÂ «Ê· œÊ—Â';
     Frodm.BinvoEco.Value:=DefaultCurr;
     Frodm.BinvoPpay.Value:=1;
     LValue:=0;
     For I:=1 To Table.RecordCount Do
     begin
      Kod:=Table.FieldByName('Kod').AsInteger;
      AnbKod:=Table.FieldByName('AnbKod').AsInteger;
      Nam:=Table.FieldByName('Nam').AsString;
      Anb:=Table.FieldByName('AnbNam').AsString;
      Color:=Table.FieldByName('Color').AsString;
      Quant:=Table.FieldByName('Quant').AsFloat;
      Ptotal:=LastValue(P_Rule,DQu,IntToStr(Kod),Color,Anb,AnbKod,0,111111111,Quant);
      Frodm.BinvoGood.Append;
      Frodm.BinvoGoodBkod.Value:=False;
      Frodm.BinvoGoodNo.Value :=0;
      Frodm.BinvoGoodDat.Value :=Dat;
      Frodm.BinvoGoodKod.Value :=Kod;
      Frodm.BinvoGoodNam.Value :=Nam;
      Frodm.BinvoGoodColor.Value :=Color;
      Frodm.BinvoGoodAnbNam.Value :=Anb;
      Frodm.BinvoGoodQuant.Value :=Quant;
      Frodm.BinvoGoodPtotal.Value:=Ptotal;
      Frodm.BinvoGoodGaran.Value:=DefaultCurr;
      Frodm.BinvoGoodAnbKod.Value :=1;
      Frodm.BinvoGoodReject.Value:=Frodm.BinvoGoodPtotal.Value*Frodm.BinvoGoodAnbKod.Value;
      LValue:=LValue+Ptotal;
      Frodm.BinvoGoodBfee.Value:=PTotal/Quant;
      Frodm.BinvoGoodPfee.Value:=Frodm.BinvoGoodBfee.Value;
      Frodm.BinvoGood.Post;
      Table.Next;
     End;
     Frodm.BinvoPnet.Value :=LValue;
     Frodm.Binvo.Post;
     Table.Active:=False;
     Table.Free;
     DQu.Free;
End;

Procedure TFNewYear.Jari_Move;
Const
S1='‰ﬁ· «“ œÊ—Â ﬁ»·';
Var
I:Integer;
St:String;
begin
     Frodm.JariNam.First;
     For I:=1 To Frodm.JariNam.RecordCount Do
     Begin
      St:=Frodm.JariNamNam.Value;
      QTJ.DatabaseName :=DestDb.DatabaseName;
      QTJ.SQL.Strings[0]:='CREATE TABLE [dbo].[Jari'+St+'] (';
      QTJ.SQL.Strings[10]:='ALTER TABLE [dbo].[Jari'+St+']  WITH NOCHECK ADD';
      QTJ.SQL.Strings[11]:='CONSTRAINT [PK_Jari'+St+'] PRIMARY KEY  NONCLUSTERED ';
      QTJ.ExecSQL;
      Frodm.JariNam.Next;
     End;
end;

(*Procedure TFNewYear.Ac_Move;
Var
I:Integer;
Table:TTable;
Bed,Bes:Currency;
CBed,CBes:Currency;
Kod:Real;
st:String;
Cost,Ctip:String;
Cent:Integer;
begin
{     Table:=TTable.Create(Owner);
     Table.DataBaseName:=CurrDB;
     Table.TableName:=Frodm.Gardesh.TableName;
     Table.Active :=True;
     Table.First; }
     Frodm.Acbill.Close;
     Frodm.Acbill.DatabaseName:=DestDb.DatabaseName;
     Frodm.Acbill.Open;
     St:='‰ﬁ· «“ œÊ—Â ﬁ»·';
     For I:=1 To Table.RecordCount Do
     Begin
      Bed:=Table.FieldByName('Bedeh').AsCurrency;
      Bes:=Table.FieldByName('Bestan').AsCurrency;
      CBed:=Table.FieldByName('BedRem').AsCurrency;
      CBes:=Table.FieldByName('BesRem').AsCurrency;
      Ctip:=Table.FieldByName('Ctip').AsString;
      Kod:=Table.FieldByName('Diag').AsFloat;
      Cost:=Table.FieldByName('Des').AsString;
      Cent:=Table.FieldByName('No').AsInteger;
      //Kod:=AccKod(Table.FieldByName('Desc').AsString);
      If Bed > 0 Then  BedBill(Bed,Kod,St,'',1,-1,0,Cost,Cent,CBed,0,Ctip);
      If Bes > 0 Then  BesBill(Bes,Kod,St,'',1,-1,0,Cost,Cent,CBes,0,Ctip);
      Table.Next;
     End;
     Table.Active:=False;
     Table.Free;

     Qu.DatabaseName:=DestDb.DatabaseName;
     Qu.SQL.Clear;
     Qu.SQL.Add('Delete From AcountBill  Where No = 1 and (AcKod Between'
      +' 1001002000000 and 1001002999999)');
     Qu.ExecSQL;

     Qu.SQL.Clear;
     Qu.SQL.Add('Delete From AcountBill  Where No = 1 and (AcKod Between'
      +' 1002000000000 and 1004000000000)');
     Qu.ExecSQL;

     Qu.SQL.Clear;
     Qu.SQL.Add('Delete From AcountBill  Where No = 1 and (AcKod Between'
      +' 5007003000000 and 5007003000000)');//Õ–› ”—„«ÌÂ «Ê· œÊ—Â
     Qu.ExecSQL;

     Qu.SQL.Clear;
     Qu.SQL.Add('Delete From AcountBill  Where No = 1 and (AcKod Between'
      +' 6001000000000 and 8000000000000)');//Õœ› œ—¬„œ Â« Ê Â“Ì‰Â Â«
     Qu.ExecSQL;

     Qu.SQL.Clear;
     Qu.SQL.Add('Select Sum(Bed)-Sum(Bes) From AcountBill  Where No = 1 ');
     Qu.Open;
     Bed:=Qu.Fields[0].AsCurrency;
     Qu.Close;
     Kod:=5007003000000;
     St:='«›  «ÕÌÂ Õ”«»Â«';
     If Bed < 0 Then
      BedBill(Abs(Bed),Kod,St,'',1,-1,0,'',0,0,0,DefaultCurr)
     Else
      BesBill(Abs(Bed),Kod,St,'',1,-1,0,'',0,0,0,DefaultCurr);
     Qu.DatabaseName:=CurrDb;
     Frodm.Acbill.Close;
     Frodm.Acbill.DatabaseName:=CurrDb;


     //MakeBill('”‰œ «›  «ÕÌÂ «Ê· œÊ—Â');
end;
*)
Procedure TFNewYear.Ac_Move;
Var
I:Integer;
Table:TTable;
Bed,Bes,Rate:Currency;
CBed,CBes:Currency;
Kod:Real;
st:String;
Cost,Ctip:String;
Cent,Dat:Integer;
CQu:Tquery;
begin
     //Table:=TTable.Create(Owner);
     //Table.DataBaseName:=CurrDB;
     //Table.TableName:=Frodm.Gardesh.TableName;
     //Table.Active :=True;
     //Table.First;
     Dat:=Fardate;
     CQu:=TQuery.Create(Application);
     CQu.DatabaseName:=CurrDb;
     CQu.SQL.Clear;
     CQu.SQL.Add('Select Sum(BedRem)-Sum(BesRem),Diag,No,Ctip ');
     CQu.SQL.Add('From '+Frodm.Gardesh.TableName);
     CQu.SQL.Add('Where Diag in (Select AccKod from AccountKod Where Barzi = 1 )');
     CQu.SQL.Add('Group by Diag,No,Ctip Order By Diag,No,Ctip ');
     CQu.Open;

     Frodm.Acbill.Close;
     Frodm.Acbill.DatabaseName:=DestDb.DatabaseName;
     Frodm.Acbill.Open;

     CBed:=0;CBes:=0;Bed:=0;Bes:=0;Rate:=0;
     For I:=1 To CQu.RecordCount Do
     Begin
      If CQu.Fields[0].AsCurrency > 0 Then CBed:=CQu.Fields[0].AsCurrency ;
      If CQu.Fields[0].AsCurrency < 0 Then CBes:=Abs(CQu.Fields[0].AsCurrency);
      Ctip:=CQu.Fields[3].AsString;
      Rate:=GetRateatDate(Ctip,Dat);
      IF Rate = 0  Then
      Begin
       ShowMessage('Rate = 0 ');
       Exit;
      End;
      Bed:=CBed * Rate;
      Bes:=CBes * Rate;
      Kod:=CQu.Fields[1].AsFloat;
      Cent:=CQu.Fields[2].AsInteger;
      St:='‰ﬁ· «“ œÊ—Â ﬁ»·'+' '+CentName(Cent);
      If CBed > 0 Then  BedBill(Bed,Kod,St,'',1,-1,Dat,Cost,Cent,CBed,0,Ctip);
      If CBes > 0 Then  BesBill(Bes,Kod,St,'',1,-1,Dat,Cost,Cent,CBes,0,Ctip);
      CBed:=0;CBes:=0;
      CQu.Next;
      Cent:=0;
      Kod:=0;
     End;
     CQu.Close;

     CQu.SQL.Clear;
     CQu.SQL.Add('Select Sum(Bedeh)-Sum(Bestan),Diag,No');
     CQu.SQL.Add('From '+Frodm.Gardesh.TableName);
     CQu.SQL.Add('Where Diag in (Select AccKod from AccountKod Where Barzi <> 1 )');
     CQu.SQL.Add('Group by Diag,No  Order By Diag,No ');
     CQu.Open;

     For I:=1 To CQu.RecordCount Do
     Begin
      If CQu.Fields[0].AsCurrency > 0 Then Bed:=CQu.Fields[0].AsCurrency;
      If CQu.Fields[0].AsCurrency < 0 Then Bes:=Abs(CQu.Fields[0].AsCurrency);
      Ctip:=DefaultCurr;
      //Rate:=GetRateatDate(Ctip,Dat);
      CBed:=0;
      CBes:=0;
      Kod:=CQu.Fields[1].AsFloat;
      Cent:=CQu.Fields[2].AsInteger;
      If Bed > 0 Then  BedBill(Bed,Kod,St,'',1,-1,Dat,Cost,Cent,CBed,0,Ctip);
      If Bes > 0 Then  BesBill(Bes,Kod,St,'',1,-1,Dat,Cost,Cent,CBes,0,Ctip);
      Bed:=0;Bes:=0;
      CQu.Next;
     End;
     CQu.Close;
     CQu.Free;

     //Table.Active:=False;
     //Table.Free;

     Qu.DatabaseName:=DestDb.DatabaseName;
     Qu.SQL.Clear;
     Qu.SQL.Add('Delete From AcountBill  Where No = 1 and (AcKod Between'
      +' 1001002000000 and 1001002999999)');
     Qu.ExecSQL;

     Qu.SQL.Clear;
     Qu.SQL.Add('Delete From AcountBill  Where No = 1 and (AcKod Between'
      +' 1002000000000 and 1004000000000)');
     Qu.ExecSQL;

     Qu.SQL.Clear;
     Qu.SQL.Add('Delete From AcountBill  Where No = 1 and (AcKod Between'
      +' 5007003000000 and 5007003000000)');(*Õ–› ”—„«ÌÂ «Ê· œÊ—Â*)
     Qu.ExecSQL;

     Qu.SQL.Clear;
     Qu.SQL.Add('Delete From AcountBill  Where No = 1 and (AcKod Between'
      +' 6001000000000 and 8000000000000)');(*Õœ› œ—¬„œ Â« Ê Â“Ì‰Â Â«*)
     Qu.ExecSQL;

     Qu.SQL.Clear;
     Qu.SQL.Add('Select Sum(Bed)-Sum(Bes) From AcountBill  Where No = 1 ');
     Qu.Open;
     Bed:=Qu.Fields[0].AsCurrency;
     Qu.Close;
     Kod:=5007003000000;
     St:='«›  «ÕÌÂ Õ”«»Â«';
     If Bed < 0 Then
      BedBill(Abs(Bed),Kod,St,'',1,-1,0,'',0,0,0,DefaultCurr)
     Else
      BesBill(Abs(Bed),Kod,St,'',1,-1,0,'',0,0,0,DefaultCurr);
     Qu.DatabaseName:=CurrDb;
     Frodm.Acbill.Close;
     Frodm.Acbill.DatabaseName:=CurrDb;
     Frodm.Acbill.Open;

     Frodm.Gardesh.Close;
     Frodm.Gardesh.TableName:='Gardesh';
     Frodm.Gardesh.Open;

     //MakeBill('”‰œ «›  «ÕÌÂ «Ê· œÊ—Â');
end;

//-----End of Privates
procedure TFNewYear.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFNewYear.BexitClick(Sender: TObject);
begin
     FNewYear.Close;
end;

procedure TFNewYear.FormCreate(Sender: TObject);
begin
      Set_Forms(Self);
      RDat.Text:=IntToDate(FarDate);
      PDat.Text:=RDat.Text;
      cbRClick(Sender);
      Fnam.Text :=DefaultDb+'2';
      FPath.Text :=RDir+'\'+DefaultDb+'2';
      Fill_XPCheckLists(Frodm.AcKod,'Nam','AccKod','Usekod=1',List);
      Fill_XPCheckLists(Frodm.AcKod,'Nam','AccKod','Usekod=1',List1);
      Fill_XPCheckLists(Frodm.AcKod,'Nam','AccKod','Usekod=1',List2);
      Fill_XPCheckLists(Frodm.AcKod,'Nam','AccKod','Usekod=1',List3);
end;

procedure TFNewYear.BMakeClick(Sender: TObject);
Var
sQDB:TQDbParam;
I:Integer;
begin
     Screen.Cursor:=crHourGlass;
     If FPath.Text ='' Then  Exit;
     NewDbName:=FPath.Text;
     NewDb:=FNam.Text;
     CreateDB;
     SetSQLDatabase(NewDb,sQDB);
     AssignDestDb(sQDB);
     MoveConstData('Accountkod');
     MoveConstData('Autobill');
     MoveConstData('AnbDat');
     MoveConstData('Banks');
     MoveConstData('BTip');
     MoveConstData('Cashiers');
     MoveConstData('Cent');
     MoveConstData('Colors');
     MoveConstData('CostC');
     MoveConstData('Cperm');
     MoveConstData('Ctip');
     MoveConstData('FTip');
     MoveConstData('Goods');
     MoveConstData('JariN');
     MoveConstData('Users');
     MoveConstData('UserAc');
     MoveConstData('Visitors');
     MoveConstData('GChart');
     Screen.Cursor :=crDefault;
     If cbAc.Checked Then Get_Remain;//End_Remain_Cent;


//     Setup_Database(CurrDb);
     Main.Sb1.Panels[5].Text:=CurrPath;
     Main.Sb1.Panels[4].Text :=FNam.Text;
     If cbAc.Checked Then
     Begin
      Ac_Move;
      cbAc.Enabled:=False;
     End;
     If cbJari.Checked Then
     Begin
      Jari_Move;
      cbJari.Enabled:=False;
     End;
     If cbR.Checked Then
     Begin
      Rcheq_Move;
      cbR.Enabled:=False;
     End;
     If cbP.Checked Then
     Begin
      Pcheq_Move;
      cbP.Enabled:=False;
     End;
     If cbD.Checked Then
     Begin
      Depot_Move;
      cbD.Checked:=False;
{     CreatingForm(TFBvoice,'FBvoice',FBvoice);
      FBvoice.Repaint;
      FBVoice.BeditClick(Sender);
      FBVoice.BsaveClick(Sender);
      FBVoice.Close;}
     End;
     Setup_Database(NewDb);
     Main.Sb1.Panels[5].Text:=NewDbName;
     Main.Sb1.Panels[4].Text :=NewDb;

     CreatingForm(TFRRes,'FRRes',FRRes);
     FRRes.BeditClick(Owner);
     FRRes.BSaveClick(Owner);
     FRRes.Close;
     CreatingForm(TFRKeler,'FRKeler',FRKeler);
     Frodm.Rkel.First;
     For I:=1 To Frodm.Rkel.RecordCount Do
     Begin
      FRKeler.BeditClick(Owner);
      FRKeler.BSaveClick(Owner);
      Frodm.Rkel.Next;
     End;
     Bmake.Enabled :=False;
     Screen.Cursor :=crDefault;
     DefaultDb:=GetDbName(NewDb);
     DefaultPath:=NewDbName;
     FEnviro.FormDestroy(Owner);
     Open_g(Frodm.Gardesh);
     SarMayeh:=0;
     Benefit:=0;
     Fill_Cond(Frodm.AcKod,'Nam',CCond,AcList);//' UseKod = 1 and Not KDas = 1'
      Fill_Cond(Frodm.Good,'Nam','Flock=0',Kala);
     Fill_Comb(Frodm.Costc,'Nam',CostList);
     Fill_Comb(Frodm.CTip,'Name',CurrList);
end;

procedure TFNewYear.FNamExit(Sender: TObject);
Var
NPath:String;
begin
     If Server = '' Then
      FPath.Text:=RDir+'\'+FNam.Text
     Else Begin
      NPath:=RDir;
      Delete(NPath,1,Pos(':',NPath));
      FPath.Text:='\\'+Server+NPath+FNam.Text;
     End;
end;

procedure TFNewYear.RDatEnter(Sender: TObject);
begin
     GetMaskText(RDat);
end;

procedure TFNewYear.RDatExit(Sender: TObject);
begin
     SetMaskText(RDat);
     If Not Date_Check(RDat.Text) Then RDat.SetFocus;
end;

procedure TFNewYear.PDatExit(Sender: TObject);
begin
     SetMaskText(PDat);
     If Not Date_Check(PDat.Text) Then PDat.SetFocus;
end;

procedure TFNewYear.PDatEnter(Sender: TObject);
begin
     GetMaskText(PDat);
end;

procedure TFNewYear.cbRClick(Sender: TObject);
begin
     RDat.Enabled:=cbR.Checked;
     PDat.Enabled:=cbP.Checked;
end;

procedure TFNewYear.SpeedButton1Click(Sender: TObject);
Var
St:String;
begin
     St:=Rdir;
     SelectDirectory(St,[sdAllowCreate,sdPerFormCreate,sdPrompt],0);
     FPath.Text:=St;
end;

procedure TFNewYear.cbAcClick(Sender: TObject);
begin
     List.Enabled:=cbAc.Checked;
end;

end.
