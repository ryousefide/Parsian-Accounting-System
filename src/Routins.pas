unit Routins;

interface
Uses Windows,Sysutils,Forms,Controls,Classes,StdCtrls,Messages,Menus,
 Dialogs,ExtCtrls,Db,DBTables,DbCtrls,Graphics,DbGrids, Mask, Converts,
 Grids,Quickrpt,QRCtrls,AcComboBox,XPListBox,XPCheckListBox, PopupListBox,
 TGoods, ProVar;

Type
TDepotState=Set of(stIn,stOut,stSoldOut,stSold);

//Function StrToInt(St:String):Integer;
Function FarDate :Integer;
Function MDateToFar(CurDate:TDateTime):Integer;
Function DayDistance(DesDate:Integer;MYear,MMon,MDay:Short):Integer;
Function DayAfter(CDat:Integer;AfDays:Integer):Integer;
Function Date_Check(FDate:String):Boolean;

Procedure Create_Gardesh_Table(TName:String);
Procedure Delete_Gardesh_Table;
Procedure Gardesh(AccKod:Real;Cent,Cost:String);
Procedure Gardesh_Mo(Kod:Real;Cent,Cost:String);
Procedure Gardesh_Mo_Kol(Kod:Real;Cent,Cost:String);
Procedure Gardesh_Sum(Kod,Ratio:Real;Var Bed,Bes:Currency;Var Dat:Integer;
Sd,Ed,Cent,Cost:String);
Procedure Gardesh_Kol(Kod:Real;Sd,Ed,Cent,Cost:String);
Procedure Gardesh_Kol_Name(Nam:String;Sd,Ed,Cent,Cost:String);//2017
Procedure Kol_Taraz(Sd,Ed,Cent,Cost:String);
Procedure Mo_Taraz(Sd,Ed,Cent,Cost:String);
Procedure Taf_Taraz(Sd,Ed,Cent,Cost:String);
Procedure Jos_Taraz(Sd,Ed,Cent,Cost:String);
Procedure Gardesh_Rem(Kod:Real;Cent,Cost:String);
Function Beg_Date:String;
Function End_Date:String;
Function AcRemain(AccKod:Real;Var Dat:Integer;Cent,Cost:String):Currency;

Function PCredit(Limit,Price:Currency):Boolean;
Function Credit(Price,Plimit:Currency):Boolean;

Function CheckBill(AccKod:Real):Boolean;
Function AccountType(AcountKod:Real):Integer;
Function AccString(Acc:Real):String;
Function BillString(Kod:Real):String;
Function KolName(AcCode:Real):String;
Function GetKol(AcCode:Real):Real;
Function AccKod(Nam:String):Real;
Function AccNam(Kod:Real):String;
Function NamCount(Nam:String):Integer;
Function AcMah(Nam:String):Integer;
Function KodFound(Kod:Real):Boolean;
Function NamFound(Nam:String):Boolean;
Function IsAcNameExist(AcName:String;KolCode:Real):Boolean;
Function IsAllowedReporting(AcKod:Real):Boolean;

Function CurrName(Id:Integer):String;
Function GetCurr(sSign:String):String;
Function GetCurrSign(sCurr:String):String;

Procedure AccNamChange(LastName,NewName:String);
Function IsConstAc(AcKod:Real):Boolean;
Function Ac_SubKod_Check(Kod:Real):Boolean;
Function Ac_Delete_Check(Kod:Real;Use:Short):Boolean;
Function MakeKol(KolNam:String):Boolean;
Procedure AccountAppend(AccKod:Real;AccNam:String;UseKod:Short);
Function AcHole_Find(Field:String;RootKod,Mrate:Real):Integer;
Function New_Account_Root(AccNam,RootNam:String;RootCode:Real;UseKod:Short):Real;
Function LastBillNo:Integer;
Function MaxAtf:Integer;
Function LastBItemNo:Integer;
Function BItemDat(BNo:Integer):Integer;
Procedure BedBill(Price:Currency;Kod:Real;Desc,FacNo:String;
BNo,Btip,BDat:Integer;Cost:String;CKod:Integer;cValue:Currency;cRate:Real;Ctip:String);
Procedure BesBill(Price:Currency;Kod:Real;Desc,FacNo:String;
BNo,Btip,BDat:Integer;Cost:String;CKod:Integer;cValue:Currency;cRate:Real;Ctip:String);
Function AutoBill(St:Boolean;Bestan,Bedeh:Real;Price:Currency;Desc,FacNo:string;
BNo,Btip,Bdat:Integer;Cost:String;CKod:Integer;cValue:Currency;cRate:Real;Ctip:String):Integer;
Function Automation (Desc:String;old_Price,New_Price:Currency;AutoKod,FacNo:String;
BNo,BTip,BDat:Integer;Cost:String;CKod:Integer;cValue:Currency;cRate:Real;Ctip:String):Integer;
Procedure MakeBill(BillDesc:String);
Function Find_BNo_Tip(FacNo:String;Btip:Integer):Integer;
Procedure DelBItem(FAcNo:String;BNo,Btip:Integer);
Procedure BillBalance_No(BNo:Integer;Var Bed,Bes:Currency);
Procedure BillUpdate(BNo:Integer);
Procedure FacBillNo(Table:TTable;FacNo,BNo:Integer);
Procedure Setup_DefCodes;
Procedure Update_FtipCode(fName:String);
Function IsBillLocked(BNo:Integer):Boolean;

Procedure Find_Bill;
Function Check_Anb(AnbName:String):Boolean;
//-----------------New Routines
Function GoodKod(Good:String):Integer;
Function GoodNam(Kod:Integer):String;
Function GoodGene(Kod:Integer):Integer;
Function GoodSoldPrice(GoodKod:Integer):Currency;
Function GoodBuyPrice(GoodKod:Integer):Currency;
Function GoodState(Kod:Integer):Boolean;
Function  TeepNam(Kod:String):String;
Function  AnbNam(Anb:String):String;
Procedure Good_Statue(Table:String;Ds:TDataSource;Good,Color:String;Var Max_p,Min_p,Ave_P
                      :Currency;Var Max_Q,Min_Q:Real);
Procedure Good_LastAction(Table:String;Ds:TDataSource;Good,Color:String;Var Last_P:Currency;
                          Var Last_q:Real);
Function Good_Moj(Good,Color:String):Real;
Function Good_Moj_Anb(Good,Color,Anb:String;Shelf:Integer):Real;
Procedure Auto_GCardex(Nam,Color,Anb_Nam:String;Kod,Anb_Kod:Integer;Quant:Real;InKod,
                       FacNo,Dat:Integer;Desc,FacNam:String;Price:Currency;Perc:Real);
Procedure GCardex_Price(Nam,Color,Anb_Nam:String;Kod,Anb_Kod:Integer;OldQ,Quant:Real;InKod,
                       FacNo:Integer;Desc,FacNam:String;Price:Currency;Perc:Real);
Procedure Cardex_Del(No,Desc:String);
Procedure DepotChange(GKod,AnbKod:Integer;Color,AnbName:String;
Number:Real;State:Integer);
Function DepotCheck(GKod,AnbKod:Integer;Color,AnbName:String;
Quant:Real):Boolean;
Function DepotRem(GKod,AnbKod:Integer;Color,AnbName:String):Real;


Procedure CreatePT(GKod:Integer;Filt:String);
Function RemAtDate(GKod,Color,AnbNam:String;AnbKod,AtDate,FacNo:Integer):Real;
Function GetMPrice(GKod,Color,AnbNam:String;AnbKod:Integer):Currency;
Procedure PositionPT(PT:TTable;ODat:Integer);
Function Kala_Kart_LIFO(GNam,Filt:String;St,En:Integer;Var LastValue:Currency;ORem:Real):Currency;
Function Kala_Kart_FIFO(GNam,Filt:String;St,En:Integer;Var LastValue:Currency;ORem:Real):Currency;
Function Kala_Kart(GNam,Filt:String;St,En:Integer;Var LastValue:Currency;ORem:Real):Currency;

Procedure Kala_Cardex(Filt:String);
Procedure Kala_Cardex_Curr(Filt:String);
Procedure Kala_Cardex_Curr_Daily(Filt:String);
Procedure Kala_Cardex_Curr_Good(Filt:String);
Procedure Kala_Cardex_Curr_Gardesh(Filt:String);
Procedure Kala_Cardex_Curr_Cust(Filt:String);

Function LastValue(Rule:String;Qu:Tquery;GKod,Color,AnbNam:String;
AnbKod,St,En:Integer;Quant:Real):Currency;
Function Sold_Price(Rule:String;Qu:Tquery;GKod,Color,AnbNam:String;
AnbKod,St,En:Integer;Quant:Real;Var LastValue:Currency):Currency;
Function Sum_Sold_Price(Var LastValue:Currency):Currency;

Procedure Enter_focus(Var Key:Char;Dest:Twincontrol);
//Procedure KeyMult(Var Key:Word;Var Dest:TDBEdit);
Function KeyMult2(Key:Word;Str:String):String;
Procedure Table_Clear(Table:TTable);
Function  StrToFCurr (FCur:String):String;
Function  CurrToFar (Cur:Currency):String;
Function  FarToCurr (Str:String):currency;
Procedure Far_EdbErr(DataSet:TDataSet;E:EDataBaseError;Var Action:TDataAction);
Function IntToDate (Int:Integer):String;
Function DateToInt(Str:String):Integer;
Function DateToStr(Str:String):String;
Procedure GetMaskText(Mask:TMaskEdit);
Procedure SetMaskText(Mask:TMaskEdit);
Procedure Fill(Table:TTable;FieldName:String;Comb:TStrings);
//Procedure FillGene(List:TListBox;Gene:Integer);
Procedure FillGene(List:TStrings;Gene:Integer);
Procedure Fill_Comb(Table:TTable;FieldName:String;Comb:TStrings);
Procedure Fill_Cond(Table:TTable;FieldName,Filt:String;Comb:TStrings);
Procedure Fill_AcCombs(Table:TTable;ListField,ValueField,Filt:String;Comb:TAcComboBox);
Procedure Fill_XPLists(Table:TTable;ListField,ValueField,Filt:String;Comb:TXPListBox);
Procedure Fill_XPCheckLists(Table:TTable;ListField,ValueField,Filt:String;Comb:TXPCheckListBox);
Procedure Fill_Popup(Table:TTable;ListField,ValueField,Filt:String;Comb:TPopupListBox);
Procedure Add_Comb(Table:TTable;FieldName,Cond:String;Comb:TStrings);
Procedure CreatingForm(FClass:TComponentClass;FormName:TcomponentName;Var Reference);
Procedure Set_Sys_Enviroment;
Procedure Set_Forms(Form:TForm);
Function Open_Fac_Check:Boolean;
Procedure Check_State(Table:TTable;Proc:TNotifyEvent);
Function  Check_StateMaster(Table:TTable;Proc:TNotifyEvent):Integer;
Function Check_Factor_State(Table:TTable;YesProc,NoProc:TNotifyEvent):Integer;
Function Net_Check_State(hYesNo:Boolean;YesProc,NoProc:TNotifyEvent):Integer;
Procedure CancelOnExit(Table:TTable);
Procedure CancelFactor(Table1,Table2:TTable);//1381-08-29

Procedure SetSQLDatabase(DbAlias:String;Var QDB:TQDbParam);
Procedure Setup_DataBase(DBName:String);
Procedure Restructure (Table:TTable;Pswd:String);
//Procedure QuickCloseOpen(Const hTable:Array Of Integer);
Procedure QuickCloseOpen(Const ihT:Array Of Integer);
Procedure QuickRefresh(Const hTable:Array Of Integer);
Procedure Limit_Use(Field:String;Min,Max:Integer);
Function GetOpenTable(Table:TTable):Word;

Function IfInEditing:Boolean;
Function Enteranced:Boolean;
Function Passage:Boolean;
Function ChangeMPass:Boolean;
Procedure UserList(List:TStringList);
Function UserCount:Integer;
Function SortTable (SrcTbl:TTable;SortField:TField):Longint;
Function OpenTable(Table:TTable):Boolean;

Function SetDbPath(DbName:String):Boolean;
Function CheckDbs:Boolean;
Function SetDefaultDb:Boolean;
Function DefaultsCheck:Boolean;
Function Fill_Corps:TStringList;
Function GetCorPath(Name:String):String;
Function GetDbName(sPath:String):String;
Function GetCorOwner(Name:String):String;(*ServerName*)
Function GetCorUser(Name:String):String;(*UserName*)
Function GetCorPass(Name:String):String;(*Password*)
Function GetComputerName:String;
Function IsServer:Boolean;

Procedure SetToBack;
Function DbSize:LongInt;//(Db:TDataBase)
Function ManageEngine :Boolean;//(Db:TDataBase)


Function RegKeyExport(Root:HKEY;Key,FileName:String):Boolean;
Function RegKeyImport(Root:HKEY;FileName:String):Boolean;
Function RegRootExport(Root:HKEY;RootKey,FileName:String):Boolean;

Procedure GMove(Gride:TdbGrid;Table:TTable);
Procedure GridMove(Gride:TdbGrid;Table:TTable;Var Radif:Integer);
Procedure PrintGrid(sGrid:TStringGrid;sTitle:String);
Procedure MenuDefine(MMenu:TMainMenu);
Function RequierdCheck(DataSet:TDataSet):Boolean;
Function IntFieldCheck(intField:TIntegerField):Boolean;
Function Open_g(Table:TTable):Boolean;
Procedure Close_g(Table:TTable);
Procedure T_Filter(Table:TTable;Filt:String);
Procedure PcheqControl;
Procedure DCheqControl;
Procedure OptDecode;
Procedure OptEncode;
Function Decode(Var S:String):String;
Procedure TableUpDate;
Function SetStyle(Style:String):TFontStyles;
Function GetStyle(Font:TFont):String;
Function GetClSize(Font:TFont):String;
Procedure  SetClSize(Var Font:TFont;ClSize:String);
Function GetFont(Font:TFont):String;
Function SetFont(FontDes:String):TFont;
Procedure coFile;
Function VisitCode(Visitor:String):Integer;
Function Yekan(X:Integer):String;
Function TeenText(x:Integer):String;
Function Dahgan(X:Integer):String;
Function Sadgan(X:Integer):String;
Function SadanToFarsi(X:Integer):String;
Function FarsiPrice(X:Real):String;
//---Terminate Check
Function Open_Fac:Boolean;
Function Encrypt(St:String;Key:Integer):String;
Function CCrypt(Const Value:String):String;
Procedure ChangeFieldValue(Table:TTable;Field:String;LValue,NValue:Variant);
Procedure JariRepair(Table:TTable);
Procedure SetToday;
Procedure Saved;
//-------Factor Payment
Function GetFactorSum(Filt:String):Currency;
Function GetRejFactorSum(Filt:String):Currency;
Function GetCashPay(Filt:String):Currency;
Function GetHavPay(Filt:String):Currency;
Function GetFishPay(Filt:String):Currency;
Function GetCheqPay(Filt:String):Currency;

Function FindGood(Name:String):String;
Procedure GetGoodCombo(Sender: TObject; var Key: Word);
Function FindGoods(Table:TTable;iNo,iDat:Integer;sName:String):Boolean;

Function GetAcKod_Tree(Var AcName:String):Real;
Function FindAccount(Name:String;Var Code:Real):String;
Procedure GetAccountCombo(Sender: TObject; var Key: Word);
Procedure GetAccountDBCombo(Sender: TObject; var Key: Word;fName:String;Code:Real);
Function FindCentKod(Var CName:String):Real;
Procedure GetCentLookup(Sender: TObject; var Key: Word);
Function GetGoodLen:Integer;
Procedure SetGridWidth(Grid:TDbGrid;FieldName:String;Width:Integer);

Function GetRejectable(GKod:Integer;Anb:String;ANbKod:Integer;Cust:String):Real;
Function GetRejInvoPrice(GKod:Integer;Anb:String;AnbKod:Integer;Cust:String;
Var RQuant:Real;Var InvNo:Integer):Currency;
Function GetOutPrice(GKod,Color,AnbNam:String;AnbKod,St,En:Integer;OutQuant:Real):Currency;

Procedure CreateReportLabel(Dbg:TDbGrid;Band:TQRBand);
const
  {Declare constants we're interested in}
  eKeyViol = 9729;
  eRequiredFieldMissing = 9732;
  eForeignKey = 9733;
  eDetailsExist = 9734;
Var
uGood:TGood;

implementation
Uses FrooshDM,MPlayer,MainForm,Bill,FileCtrl,CRoutins,GSearch,ClipBrd,
     Registry, DcheqList,Restore,BDE,AcTree,UserName,RFC2289,HCMngr,AcSearch,
     TINYLib_TLB,Enviro,Passing,Printers,SolarUtl, Rbld1,CentSearch,ComObj,
     OuPrice,GFind,Corps, ComCtrls;


Function Fardate:Integer;
Var
CurDate:TdateTime;
Pday,Pmon,Pyear:word;
Begin
     CurDate:=Date;
     SolarDecodeDate(CurDate,PYear,PMon,PDay);
     Result:=PYear*10000+PMon*100+Pday+AdjT;
end;

Function MDateToFar(CurDate:TDateTime):Integer;
Var
Pday,Pmon,Pyear:word;
Begin
     SolarDecodeDate(CurDate,PYear,PMon,PDay);
     Result:=PYear*10000+PMon*100+Pday+AdjT;
end;

Function DayDistance(DesDate:Integer;MYear,MMon,MDay:Short):Integer;
Var
DYear:Integer;
DMon:Integer;
DDay:Integer;
begin
     DYear:=DesDate Div 10000;
     DMon:=(DesDate Div 100)Mod 100;
     DDay:=DesDate Mod 100;
     Result:=((DYear-MYear)*12+(DMon-MMon))*30+(DDay-MDay);
end;

Function DayAfter(CDat:Integer;AfDays:Integer):Integer;
Var
afYear:Integer;
afMon:Integer;
afDay:Integer;
begin
     afYear:=Cdat Div 10000;
     afMon:=(CDat Mod 10000) Div 100 +AfDays Div 30;
     afDay:=(Cdat Mod 100)+AfDays Mod 30;
     afMon:=afMon+afDay Div 30;
     afDay:=afDay Mod 30;
     If afDay = 0 Then
     Begin
      afDay:=30;
      afMon:=afMon-1;
     end;
     afYear:=afYear+afMon Div 12;
     afMon:=afMon Mod 12;
     If afMon =0 Then
     Begin
      afMon:=12;
      afYear:=afYear-1;
     End;
     Result:=afYear*10000+AfMon*100+AfDay;
end;

Function Date_Check(FDate:String):Boolean;
Var
Mon,Day,Dat:Integer;
begin
     Result:=True;
     Dat:=DateToInt(FDate);
     Day:=Dat Mod 100;
     Mon:=(Dat Mod 10000) Div 100;
{     Case Day Of
     1..31 :Result:=True;
     Else
            Result:=False;
     End;
     Case Mon Of
     1..12 : Result:=True;
     Else
            Result:=False;
     End;}
     If (Day < 0) or (Day >31) or (Mon < 1) or (Mon > 12) Then Result:=False;
end;

Function AccountType(AcountKod:Real):Integer;
Var
Das,gro,kol,mo,Taf:Integer;
begin
     Result:=5;
     IF Not KodFound(AcountKod) Then  Exit;
     das:=Frodm.AcKodKgp.Value;
     gro:=Frodm.AcKodKgro.Value;
     kol:=Frodm.AcKodKKol.Value;
     mo:=Frodm.AcKodKmo.Value;
     Taf:=Frodm.AcKodKTaf.Value;
     If (das>0)and(gro=0)and(kol=0)and(mo=0)and(Taf=0)Then Result:=0;
     If (das<>0)and(gro>0)and(kol=0)and(mo=0)and(Taf=0)Then Result:=1;
     If (das<>0)and(gro>0)and(kol>0)and(mo=0)and(Taf=0)Then Result:=2;
     If (das<>0)and(gro>0)and(kol>0)and(mo>0)and(Taf=0)Then Result:=3;
     If (das<>0)and(gro>0)and(kol>0)and(mo>0)and(Taf>0) Then Result:=4;
end;

Procedure Create_Gardesh_Table(TName:String);
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
   '	[Ctip] [varchar] (40) NULL ,'+
   ' [Bid] [int] NULL ,'+
   ' [Dchek] [bit] DEFAULT (0) '+//NOT NULL'+
   ' ) ON [PRIMARY] '+
   ' ALTER TABLE [dbo].[';
SQ1='] WITH NOCHECK ADD CONSTRAINT  [PK_';
SQ2='] PRIMARY KEY  NONCLUSTERED ( [Id] )  ON [PRIMARY]';

Var
PT:TTable;
BQu:TQuery;
begin
     BQu:=TQuery.Create(Application);
     BQu.DatabaseName:=FroDM.DB1.DatabaseName;
     BQU.SQL.Add(CQ+TName+CQ1+TName+']');
     BQU.SQL.Add('CREATE TABLE [dbo].['+TName+'] (');
     BQu.SQL.Add(SQ+TName+SQ1+TName+SQ2);

     BQu.ExecSQL;
     BQu.Free;
     Frodm.Gardesh.Close;
     Frodm.Gardesh.TableName:='dbo.'+TName;
end;

Procedure Delete_Gardesh_Table;
begin
     Frodm.Gardesh.Close;
     Frodm.Gardesh.DeleteTable;
     Frodm.Gardesh.TableName:='dbo.Gardesh';
end;

Procedure Gardesh(AccKod:Real;Cent,Cost:String);
begin
     If KodFound(AccKod) Then
     Case Frodm.AcKodUseKod.Value Of
     0: Gardesh_Rem(AccKod,Cent,Cost);
     1: Gardesh_Mo(AccKod,Cent,Cost);
     End;
end;

Procedure Gardesh_Mo(Kod:Real;Cent,Cost:String);
Var
Rem,Bed,Bes:Currency;
I:Integer;
Filt:String;
begin
     Frodm.AcKod.IndexFieldNames:='AccKod';
     Frodm.AcKod.FindKey([Kod]);
     If Frodm.AcKodKdas.Value = 1 Then Exit;
     Filt :='Tip=0 and AcKod = '+FloatToStr(Kod);//UseKod =1 and
     If Cent > '' Then Filt:=Filt+' and CKod In ('+CentString(Cent)+')';
     If Cost > '' Then Filt:=Filt+' and Cost In ('+CostString(Cost)+')';
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Bed,Bes,Dat,Des,A.No');
     Qu.SQL.Add('From AcountBill A');
     Qu.SQL.Add('Where Tip=0 and '+Filt);
     Qu.SQL.Add('Order By Dat,A.No');
     Qu.Open;
     Qu.First;
     If Frodm.Gardesh.RecordCount = 0 Then  Rem:=0 Else
     Begin
       Frodm.Gardesh.Last;
       Rem:=Frodm.GardeshBaghi.Value;
     End;
     For I:=1 To Qu.RecordCount Do
     Begin
       Bed:=Qu.Fields[0].AsCurrency;// Frodm.AcBillBed.Value;
       Bes:=Qu.Fields[1].AsCurrency;// Frodm.AcbillBes.Value;
       Frodm.Gardesh.Append;
       Frodm.GardeshDat.Value :=Qu.Fields[2].AsInteger;// Frodm.AcbillDat.Value;
       Frodm.GardeshDesc.Value :=Qu.Fields[3].AsString;// Frodm.AcbillDesc.Value;
       Frodm.GardeshBedeh.Value :=Bed;
       Frodm.GardeshBestan.Value :=Bes;
       Frodm.GardeshNo.Value:=Qu.Fields[4].AsInteger;
       Rem:=Rem+Bed-Bes;
       Frodm.GardeshBaghi.Value :=Rem;
       Frodm.GardeshDiag.Value:=Rem;
       Frodm.Gardesh.Post;
       Qu.Next;
     End;
     Qu.Close;
end;

Procedure Gardesh_Mo_Kol(Kod:Real;Cent,Cost:String);
Var
Rem,Bed,Bes:Currency;
Tip,I:Integer;
Filt:String;
Rate,Ratio:Real;
begin
     Frodm.AcKod.IndexFieldNames:='AccKod';
     Frodm.AcKod.FindKey([Kod]);
     If Frodm.AcKodKdas.Value = 1 Then Exit;
     Tip:=AccountType(Kod);
     Case Tip Of
     5:Begin
         Rate:=1000000000000;
         Ratio:=999999999999;
       End;
     0:Begin
         Rate:=1000000000000;
         Ratio:=999999999999;
       End;
     1:Begin
         Rate:=1000000000;
         Ratio:=999999999;
       End;
     2:Begin
         Rate:=1000000;
         Ratio:=999999;
       End;
     3:Begin
         Rate:=1000;
         Ratio:=999;
       End;
     Else
       Begin
        Rate:=1;
        Ratio:=1;
       End;
     End;

     Filt :='Tip=0 and AcKod >= '+FloatToStr(Kod)+' and AcKod<= '+FloatToStr(Kod+Ratio);
     If Cent > '' Then Filt:=Filt+' and CKod In ('+CentString(Cent)+')';
     If Cost > '' Then Filt:=Filt+' and Cost In ('+CostString(Cost)+')';
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Bed,Bes,Dat,Des,A.No');
     Qu.SQL.Add('From AcountBill A');
     Qu.SQL.Add('Where Tip=0 and '+Filt);
     Qu.SQL.Add('Order By Dat,A.No');
     Qu.Open;
     Qu.First;
     If Frodm.Gardesh.RecordCount = 0 Then  Rem:=0 Else
     Begin
       Frodm.Gardesh.Last;
       Rem:=Frodm.GardeshBaghi.Value;
     End;
     For I:=1 To Qu.RecordCount Do
     Begin
       Bed:=Qu.Fields[0].AsCurrency;// Frodm.AcBillBed.Value;
       Bes:=Qu.Fields[1].AsCurrency;// Frodm.AcbillBes.Value;
       Frodm.Gardesh.Append;
       Frodm.GardeshDat.Value :=Qu.Fields[2].AsInteger;// Frodm.AcbillDat.Value;
       Frodm.GardeshDesc.Value :=Qu.Fields[3].AsString;// Frodm.AcbillDesc.Value;
       Frodm.GardeshBedeh.Value :=Bed;
       Frodm.GardeshBestan.Value :=Bes;
       Frodm.GardeshNo.Value:=Qu.Fields[4].AsInteger;
       Rem:=Rem+Bed-Bes;
       Frodm.GardeshBaghi.Value :=Rem;
       Frodm.GardeshDiag.Value:=Rem;
       Frodm.Gardesh.Post;
       Qu.Next;
     End;
     Qu.Close;
end;

Procedure Gardesh_Sum(Kod,Ratio:Real;Var Bed,Bes:Currency;Var Dat:Integer;
Sd,Ed,Cent,Cost:String);
Const
Das=' and AcKod In (Select AccKod From AccountKod Where Kdas <> 1)';
Var
Filt:String;
begin
     Filt:='Tip=0 and (AcKod >='+FloatToStr(Kod)+' and AcKod <='+FloatToStr(Kod+Ratio)+')';
     If Cent>'' Then Filt:=Filt+' and CKod In ('+CentString(Cent)+')';
     If Cost>'' Then Filt:=Filt+' and Cost In ('+CostString(Cost)+')';
     If Sd>''   Then Filt:=Filt+' and Dat >= '+Sd;
     If Ed>''   Then Filt:=Filt+' and Dat <= '+Ed;
     Qu.SQL.Clear;
     Qu.SQL.Add('SELECT Sum(Bed),Sum(Bes),Max(Dat)');
     Qu.SQL.Add('FROM AcountBill');
     Qu.SQL.Add('WHERE '+Filt);
     Qu.Sql.Add(Das);
     Qu.Open;
     Bed:=Qu.Fields[0].AsCurrency;
     Bes:=Qu.Fields[1].AsCurrency;
     Dat:=Qu.Fields[2].AsInteger;
     Qu.Close;
end;

Procedure Gardesh_Kol(Kod:Real;Sd,Ed,Cent,Cost:String);
Var
Rate,Ratio:Real;
Tip,Dat,I:Integer;
bsRem,Bed,Bes,Rem:Currency;
GQu:TQuery;
begin
     Tip:=AccountType(Kod);
     Case Tip Of
     5:Begin
         Rate:=1000000000000;
         Ratio:=999999999999;
       End;
     0:Begin
         Rate:=1000000000;
         Ratio:=999999999;
       End;
     1:Begin
         Rate:=1000000;
         Ratio:=999999;
       End;
     2:Begin
         Rate:=1000;
         Ratio:=999;
       End;
     3:Begin
         Rate:=1;
         Ratio:=0;
       End;
     Else
       Begin
        Rate:=0;
        Ratio:=0;
       End;
     End;
     Frodm.Gardesh.Last;
     Rem:=Frodm.GardeshBaghi.Value;
     GQu:=Tquery.Create(Application);
     GQu.DataBaseName:=CurrDb;
     GQu.SQL.Add('SELECT AccKod,Nam FROM AccountKod ');
     GQu.SQL.Add('WHERE AccKod > '+FloatToStr(Kod)+' and AccKod <= '
                  +FloatToStr(Kod+999*Rate));
     GQu.SQL.Add('ORDER BY AccKod');
     GQu.Open;
     GQu.First;
     For I:=1 To GQu.RecordCount Do
     Begin
       If Frac(GQu.Fields[0].AsFloat/Rate) = 0 Then
       Begin
         Gardesh_Sum(GQu.Fields[0].AsFloat,Ratio,Bed,Bes,Dat,SD,ED,Cent,Cost);
         Frodm.Gardesh.Append;
         Frodm.GardeshDiag.Value :=GQu.Fields[0].AsFloat;
         Frodm.GardeshDesc.Value :=GQu.Fields[1].AsString;
         Frodm.GardeshBedeh.Value :=Bed;
         Frodm.GardeshBestan.Value :=Bes;
         Frodm.GardeshDat.Value :=Dat;
         bsRem:=Bed-Bes;

         If bsRem > 0 Then Frodm.GardeshBedrem.Value :=bsRem;
         If bsRem < 0 Then Frodm.GardeshBesrem.Value :=Abs(bsRem);
         Rem:=Rem+bsRem;
         Frodm.GardeshBaghi.Value :=Rem;
         Frodm.Gardesh.Post;
       End;
         GQu.Next;
     End;
       GQu.Close;
       GQu.Free;
end;

Procedure Gardesh_Kol_Name(Nam:String;Sd,Ed,Cent,Cost:String);
Var
Ratio:Real;
Dat:Integer;
Tip,I:Integer;
bsRem,Bed,Bes,Rem:Currency;
GQu:TQuery;
begin
     Frodm.Gardesh.Last;
     Rem:=Frodm.GardeshBaghi.Value;
     GQu:=Tquery.Create(Application);
     GQu.DataBaseName:=CurrDb;
     GQu.SQL.Add('SELECT AccKod,Nam FROM AccountKod A Where A.Nam= :n');
     GQu.Params[0].Value:=Nam;
     GQu.Open;
     GQu.First;
     For I:=1 To GQu.RecordCount Do
     Begin
      Tip:=AccountType(GQu.Fields[0].AsFloat);
      Case Tip Of
       0:Ratio:=999999999999;
       1:Ratio:=999999999;
       2:Ratio:=999999;
       3:Ratio:=999;
       4:Ratio:=0;
      Else
        Ratio:=0;
      End;
      Gardesh_Sum(GQu.Fields[0].AsFloat,Ratio,Bed,Bes,Dat,Sd,Ed,Cent,Cost);
      Frodm.Gardesh.Append;
      Frodm.GardeshDat.Value:=Dat;
      //Frodm.GardeshNo.Value:=
      Frodm.GardeshDiag.Value:=GQu.Fields[0].AsFloat;
      Frodm.GardeshDesc.Value :=KolName(GQu.Fields[0].AsFloat);
      Frodm.GardeshBedeh.Value :=Bed;
      Frodm.GardeshBestan.Value :=Bes;
      bsRem:=Bed-Bes;

      If bsRem > 0 Then Frodm.GardeshBedrem.Value :=bsRem;
      If bsRem < 0 Then Frodm.GardeshBesrem.Value :=Abs(bsRem);
      Rem:=Rem+bsRem;
      Frodm.GardeshBaghi.Value :=Rem;
      Frodm.Gardesh.Post;
      GQu.Next;
     End;
     GQu.Close;
     GQu.Free;
end;

Procedure Kol_Taraz(Sd,Ed,Cent,Cost:String);
Var
Ratio:Real;
Dat:Integer;
I:Integer;
bsRem,Bed,Bes,Rem:Currency;
GQu:TQuery;
begin
     Ratio:=999999999;
     Frodm.Gardesh.Last;
     Rem:=Frodm.GardeshBaghi.Value;
     GQu:=Tquery.Create(Application);
     GQu.DataBaseName:=CurrDb;
     GQu.SQL.Add('SELECT AccKod,Nam FROM AccountKod ');
     GQu.SQL.Add('WHERE KGp >0 and Kgro >0 and KKol =0 and Kmo =0'
                 +'and Ktaf =0');//UseKod =0 and
     GQu.SQL.Add('ORDER BY AccKod');
     GQu.Open;
     GQu.First;
     For I:=1 To GQu.RecordCount Do
     Begin
      Gardesh_Sum(GQu.Fields[0].AsFloat,Ratio,Bed,Bes,Dat,Sd,Ed,Cent,Cost);
      Frodm.Gardesh.Append;
      Frodm.GardeshDat.Value:=Dat;
      Frodm.GardeshDesc.Value :=GQu.Fields[1].AsString;
      Frodm.GardeshDiag.Value :=GQu.Fields[0].AsFloat;
      Frodm.GardeshBedeh.Value :=Bed;
      Frodm.GardeshBestan.Value :=Bes;
      bsRem:=Bed-Bes;

      If bsRem > 0 Then Frodm.GardeshBedrem.Value :=bsRem;
      If bsRem < 0 Then Frodm.GardeshBesrem.Value :=Abs(bsRem);
      Rem:=Rem+bsRem;
      Frodm.GardeshBaghi.Value :=Rem;
      Frodm.Gardesh.Post;
      GQu.Next;
     End;
     GQu.Close;
     GQu.Free;
end;

Procedure Mo_Taraz(Sd,Ed,Cent,Cost:String);
Var
Ratio:Real;
Dat:Integer;
I:Integer;
bsRem,Bed,Bes,Rem:Currency;
GQu:TQuery;
begin
     Ratio:=999999;
     Frodm.Gardesh.Last;
     Rem:=Frodm.GardeshBaghi.Value;

     GQu:=Tquery.Create(Main.Owner);
     GQu.DataBaseName:=CurrDb;
     GQu.SQL.Add('SELECT AccKod,Nam FROM AccountKod ');
     GQu.SQL.Add('WHERE (Kgp >0 and Kgro >0 and KKol >0 and Kmo =0 and Ktaf =0 ) or');
     GQu.SQL.Add('(Kgp >0 and Kgro >0 and KKol =0 and Kmo =0 and Ktaf =0  and usekod=1)');
     GQu.SQL.Add('ORDER BY AccKod');
     GQu.Open;
     GQu.First;
     For I:=1 To GQu.RecordCount Do
     Begin
      Gardesh_Sum(GQu.Fields[0].AsFloat,Ratio,Bed,Bes,Dat,Sd,Ed,Cent,Cost);
      Frodm.Gardesh.Append;
      Frodm.GardeshDat.Value:=Dat;
      Frodm.GardeshDesc.Value :=KolName(GQu.Fields[0].AsFloat);
      Frodm.GardeshDiag.Value :=GQu.Fields[0].AsFloat;
      Frodm.GardeshBedeh.Value :=Bed;
      Frodm.GardeshBestan.Value :=Bes;
      bsRem:=Bed-Bes;

      If bsRem > 0 Then Frodm.GardeshBedrem.Value :=bsRem;
      If bsRem < 0 Then Frodm.GardeshBesrem.Value :=Abs(bsRem);
      Rem:=Rem+bsRem;
      Frodm.GardeshBaghi.Value :=Rem;
      Frodm.Gardesh.Post;
      GQu.Next;
     End;
     GQu.Close;
     GQu.Free;
end;

Procedure Taf_Taraz(Sd,Ed,Cent,Cost:String);
Var
Ratio:Real;
Dat:Integer;
I:Integer;
bsRem,Bed,Bes,Rem:Currency;
GQu:TQuery;
begin
     Ratio:=999;
     Frodm.Gardesh.Last;
     Rem:=Frodm.GardeshBaghi.Value;

     GQu:=Tquery.Create(Main.Owner);
     GQu.DataBaseName:=CurrDb;
     GQu.SQL.Add('SELECT AccKod,Nam FROM AccountKod ');
     GQu.SQL.Add('WHERE (Kgp >0 and Kgro >0 and KKol >0 and Kmo >0 and Ktaf =0 ) or');
     GQu.SQL.Add('(Kgp >0 and Kgro >0 and KKol =0 and Kmo =0 and Ktaf =0  and usekod=1) or');
     GQu.SQL.Add('(Kgp >0 and Kgro >0 and KKol >0 and Kmo =0 and Ktaf =0  and usekod=1)');
     GQu.SQL.Add('ORDER BY AccKod');
     GQu.Open;
     GQu.First;
     For I:=1 To GQu.RecordCount Do
     Begin
      Gardesh_Sum(GQu.Fields[0].AsFloat,Ratio,Bed,Bes,Dat,Sd,Ed,Cent,Cost);
      Frodm.Gardesh.Append;
      Frodm.GardeshDat.Value:=Dat;
      Frodm.GardeshDesc.Value :=AccString(GQu.Fields[0].AsFloat);
      Frodm.GardeshDiag.Value :=GQu.Fields[0].AsFloat;
      Frodm.GardeshBedeh.Value :=Bed;
      Frodm.GardeshBestan.Value :=Bes;
      bsRem:=Bed-Bes;

      If bsRem > 0 Then Frodm.GardeshBedrem.Value :=bsRem;
      If bsRem < 0 Then Frodm.GardeshBesrem.Value :=Abs(bsRem);
      Rem:=Rem+bsRem;
      Frodm.GardeshBaghi.Value :=Rem;
      Frodm.Gardesh.Post;
      GQu.Next;
     End;
     GQu.Close;
     GQu.Free;
end;

Procedure Jos_Taraz(Sd,Ed,Cent,Cost:String);
Var
Ratio:Real;
Dat:Integer;
I:Integer;
bsRem,Bed,Bes,Rem:Currency;
GQu:TQuery;
begin
     Ratio:=1;
     Frodm.Gardesh.Last;
     Rem:=Frodm.GardeshBaghi.Value;

     GQu:=Tquery.Create(Main.Owner);
     GQu.DataBaseName:=CurrDb;
     GQu.SQL.Add('SELECT AccKod,Nam FROM AccountKod ');
     GQu.SQL.Add('WHERE (Kgp >0 and Kgro >0 and KKol >0 and Kmo >0 and Ktaf >0 ) or');
     GQu.SQL.Add('(Kgp >0 and Kgro >0 and KKol =0 and Kmo =0 and Ktaf =0  and usekod=1) or');
     GQu.SQL.Add('(Kgp >0 and Kgro >0 and KKol >0 and Kmo =0 and Ktaf =0  and usekod=1) or');
     GQu.SQL.Add('(Kgp >0 and Kgro >0 and KKol >0 and Kmo >0 and Ktaf =0  and usekod=1)');
     GQu.SQL.Add('ORDER BY AccKod');
     GQu.Open;
     GQu.First;
     For I:=1 To GQu.RecordCount Do
     Begin
      Gardesh_Sum(GQu.Fields[0].AsFloat,Ratio,Bed,Bes,Dat,Sd,Ed,Cent,Cost);
      Frodm.Gardesh.Append;
      Frodm.GardeshDat.Value:=Dat;
      Frodm.GardeshDesc.Value :=AccString(GQu.Fields[0].AsFloat);
      Frodm.GardeshDiag.Value :=GQu.Fields[0].AsFloat;
      Frodm.GardeshBedeh.Value :=Bed;
      Frodm.GardeshBestan.Value :=Bes;
      bsRem:=Bed-Bes;

      If bsRem > 0 Then Frodm.GardeshBedrem.Value :=bsRem;
      If bsRem < 0 Then Frodm.GardeshBesrem.Value :=Abs(bsRem);
      Rem:=Rem+bsRem;
      Frodm.GardeshBaghi.Value :=Rem;
      Frodm.Gardesh.Post;
      GQu.Next;
     End;
     GQu.Close;
     GQu.Free;
end;

Procedure Gardesh_Rem(Kod:Real;Cent,Cost:String);
Var
Rate,Ratio:Real;
Tip,Dat,I:Integer;
bsRem,Bed,Bes,Rem:Currency;
GQu:TQuery;
begin
     Tip:=AccountType(Kod);
     Case Tip Of
     5:Begin
         Rate:=1000000000000;
         Ratio:=999999999999;
       End;
     0:Begin
         Rate:=1000000000;
         Ratio:=999999999;
       End;
     1:Begin
         Rate:=1000000;
         Ratio:=999999;
       End;
     2:Begin
         Rate:=1000;
         Ratio:=999;
       End;
     3:Begin
         Rate:=1;
         Ratio:=0;
       End;
     Else
       Begin
        Rate:=0;
        Ratio:=0;
       End;
     End;
     Frodm.Gardesh.Last;
     Rem:=Frodm.GardeshBaghi.Value;
     GQu:=Tquery.Create(Main.Owner);
     GQu.DataBaseName:=CurrDb;
     GQu.SQL.Add('SELECT AccKod,Nam FROM AccountKod ');
     GQu.SQL.Add('WHERE AccKod > '+FloatToStr(Kod)+' and AccKod <= '
                  +FloatToStr(Kod+999*Rate));
     GQu.SQL.Add('ORDER BY AccKod');//Nam
     GQu.Open;
     GQu.First;
     For I:=1 To GQu.RecordCount Do
     Begin
       If Frac(GQu.Fields[0].AsFloat/Rate) = 0 Then
       Begin
         Gardesh_Sum(GQu.Fields[0].AsFloat,Ratio,Bed,Bes,Dat,'','',Cent,Cost);
         Frodm.Gardesh.Append;
         Frodm.GardeshDesc.Value :=GQu.Fields[1].AsString;
         Frodm.GardeshDiag.Value :=GQu.Fields[0].AsFloat;
         bsRem:=Bed-Bes;
         If bsRem > 0 Then
         Begin
           Frodm.GardeshBedrem.Value :=bsRem;
           Frodm.GardeshBedeh.Value :=bsRem;
         end;
         If bsRem < 0 Then
         Begin
           Frodm.GardeshBesrem.Value :=Abs(bsRem);
           Frodm.GardeshBestan.Value :=Abs(bsRem);
         End;
         Rem:=Rem+bsRem;

         Frodm.GardeshBaghi.Value :=Rem;
         Frodm.GardeshDat.Value :=Dat;
         Frodm.Gardesh.Post;
       End;
         GQu.Next;
     End;
       GQu.Close;
       GQu.Free;
end;

Function Beg_Date:String;
begin
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Min(Dat) From AcountBill ');
     Qu.Open;
     Result:=IntToDate(Qu.Fields[0].AsInteger);
     Qu.Close;

end;

Function End_Date:String;
begin
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Max(Dat) From AcountBill ');
     Qu.Open;
     Result:=IntToDate(Qu.Fields[0].AsInteger);
     Qu.Close;

End;

Function  AcRemain(AccKod:Real;Var Dat:Integer;Cent,Cost:String):Currency;
Var
Bed,Bes:Currency;
Ratio,Act:Real;
Tip:Integer;
begin
     Ratio:=0;Act:=0;
     If KodFound(AccKod) Then Act:=Frodm.AcKodUseKod.Value;
     If Act = 1 Then Ratio :=0 Else
     Begin
       Tip:=AccountType(AccKod);
       Case Tip of
        5:Ratio:=1000000000000000;
        0:Ratio:=1000000000000;
        1:Ratio:=1000000000;
        2:Ratio:=1000000;
        3:Ratio:=1000;
        4:Ratio:=0;
       End;
     End;
     Gardesh_Sum(AccKod,Ratio,Bed,Bes,Dat,'','',Cent,Cost);
     Result:=Bed-Bes;
end;

Function PCredit(Limit,Price:Currency):Boolean;
begin
     Result:=True;
     If Limit = 0 Then Exit;
     If Price >= Limit Then Result:=False;
end;

Function Credit(Price,Plimit:Currency):Boolean;
begin
     Result:=PCredit(PLimit,Price);
end;

Function  CheckBill(AccKod:Real):Boolean;
begin
     Result:=False;
     Frodm.Acbill.MasterSource:=Nil;
     FroDM.Acbill.Filter :='Ackod = '+FloatToStr(AccKod);
     Frodm.AcBill.Filtered:=True;
     If Frodm.AcBill.RecordCount > 0 Then Result:=True;
     Frodm.AcBill.Filtered:=False;
     Frodm.Acbill.MasterSource:=Frodm.BillDs;
end;

Function LastBillNo:Integer;
Var
Qu:TQuery;
begin
     Qu:=TQuery.Create(Application);
     Qu.DataBaseName:=CurrDb;
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Max(A.No) From Bill A');
     Qu.Open;
     Result:=Qu.Fields[0].AsInteger;
     Qu.Close;
     Qu.Free;
end;

Function MaxAtf:Integer;
Var
Qu:TQuery;
begin
     Qu:=TQuery.Create(Application);
     Qu.DataBaseName:=CurrDb;;
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Max(A.Atf) From Bill A');
     Qu.Open;
     Result:=Qu.Fields[0].AsInteger+1;
     Qu.Close;
     Qu.Free;
end;

Function LastBItemNo:Integer;
Var
Qu:TQuery;
begin
     Qu:=TQuery.Create(Application);
     Qu.DataBaseName:=CurrDb;
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Max(A.No) From AcountBill A');
     Qu.Open;
     Result:=Qu.Fields[0].AsInteger;
     Qu.Close;
     Qu.Free;
end;

Function BItemDat(BNo:Integer):Integer;
Var
Qu:TQuery;
begin
     Qu:=TQuery.Create(Application);
     Qu.DataBaseName:=CurrDb;
     Qu.SQL.Clear;
     Qu.SQL.Add('Select A.Dat From AcountBill A Where A.No =:d ');
     Qu.Params[0].Value:=BNo;
     Qu.Open;
     Result:=Qu.Fields[0].AsInteger;
     Qu.Close;
     Qu.Free;
end;

Procedure BedBill(Price:Currency;Kod:Real;Desc,FacNo:String;
BNo,Btip,BDat:Integer;Cost:String;CKod:Integer;cValue:Currency;cRate:Real;Ctip:String);
begin
     If ((Price =0)and(cValue=0))Or(Kod =0)Then Exit;
     IF Bdat = 0 Then Bdat:=Fardate;
     AcRadif:=AcRadif+1;
     Frodm.Acbill.Filtered:=False;//2017
     Frodm.Acbill.Append;
     Frodm.AcbillNo.Value :=BNo;
     If BNo=0 Then Frodm.AcbillNo.Clear;
     Frodm.AcbillRadif.Value :=AcRadif;
     Frodm.AcbillAckod.AsFloat :=Kod;
     Frodm.AcbillAccnam.Value :=AccNam(kod);
     Frodm.AcbillDesc.Value :=Desc;
     Frodm.AcbillDat.Value :=BDat;
     If Price > 0 Then
      Frodm.AcbillBed.Value :=Abs(Price)
     Else
      Frodm.AcbillBes.Value:=Abs(Price);
     Frodm.AcbillBtip.Value:=Btip;
     Frodm.AcbillFacNo.Value:=FacNo;
     Frodm.AcbillCost.Value:=Cost;
     Frodm.AcbillCkod.Value:=CKod;
     Frodm.AcbillTip.Value:=iBillTip;
     Frodm.AcbillCtip.Value:=Ctip;
     If cValue > 0 Then
      Frodm.AcbillCBed.Value :=Abs(cValue)
     Else
      Frodm.AcbillCBes.Value:=Abs(cValue);
     Frodm.Acbill.Post;

end;

Procedure BesBill(Price:Currency;Kod:Real;Desc,FacNo:String;
BNo,Btip,BDat:Integer;Cost:String;CKod:Integer;cValue:Currency;cRate:Real;Ctip:String);
begin
     If ((Price =0)and(cValue=0))Or(Kod =0)Then Exit;//If (Price =0) Or (Kod =0) Then Exit;
     IF Bdat = 0 Then Bdat:=Fardate;
     AcRadif:=AcRadif+1;
     Frodm.Acbill.Filtered:=False;
     Frodm.Acbill.Append;
     Frodm.AcbillNo.Value :=BNo;
     If BNo=0 Then Frodm.AcbillNo.Clear;
     Frodm.AcbillRadif.Value :=AcRadif;
     Frodm.AcbillAckod.AsFloat :=Kod;
     Frodm.AcbillAccnam.Value :=AccNam(kod);
     Frodm.AcbillDesc.Value :=Desc;
     Frodm.AcbillDat.Value :=BDat;//Fardate;
     If Price > 0 Then
      Frodm.AcbillBes.Value :=Abs(Price)
     Else
      Frodm.AcbillBed.Value :=Abs(Price);
     Frodm.AcbillBtip.Value:=Btip;
     Frodm.AcBillFacNo.Value:=FacNo;
     Frodm.AcbillCost.Value:=Cost;
     Frodm.AcbillCkod.Value:=CKod;
     Frodm.AcbillTip.Value:=iBillTip;
     Frodm.AcbillCtip.Value:=Ctip;
     If cValue > 0 Then
      Frodm.AcbillCBes.Value :=Abs(cValue)
     Else
      Frodm.AcbillCBed.Value:=Abs(cValue);
     Frodm.Acbill.Post;
end;

Function AutoBill(St:Boolean;Bestan,Bedeh:Real;Price:Currency;Desc,FacNo:string;
BNo,Btip,Bdat:Integer;Cost:String;CKod:Integer;cValue:Currency;cRate:Real;Ctip:String):Integer;
Begin
     If (BNo = 0)and sBill Then BNo:=LastBillNo+1;
     If Bdat = 0 Then BDat:=Fardate;
     If St Then
     Begin
      BedBill(Price,Bedeh,Desc,FacNo,BNo,Btip,Bdat,Cost,Ckod,cValue,cRate,Ctip);
      BesBill(Price,Bestan,Desc,FacNo,BNo,Btip,Bdat,Cost,Ckod,cValue,cRate,Ctip);
     End;
     Result:=BNo;
End;

Function Automation (Desc:String;old_Price,New_Price:Currency;AutoKod,FacNo:String;
BNo,BTip,BDat:Integer;Cost:String;CKod:Integer;cValue:Currency;cRate:Real;Ctip:String):Integer;
var
BesKod,BehKod:Real;
Stat:Boolean;
Begin
     Frodm.AutoBill.FindKey([AutoKod]);
     BesKod:=FroDM.AutoBillBesKod.AsFloat;
     BehKod:=FroDM.AutoBillBehKod.AsFloat;
     Stat:=FroDM.AutoBillStat.AsBoolean;
     Result:=AutoBill (Stat,BesKod,BehKod,New_Price-Old_Price,Desc,FacNo,
     BNo,Btip,Bdat,Cost,CKod,cValue,cRate,cTip);
End;

Procedure MakeBill(BillDesc:String);
Var
No,ItNo,Atf:Integer;
begin
     Repeat
       ItNo:=LastBItemNo;
       Atf:=MaxAtf;
       No:=LastBillNo;
       If ItNo > No Then
       Begin
        Frodm.Bill.Append;
        Frodm.BillNo.Value :=No+1;
        Frodm.BillAtf.Value:=Atf;
        Frodm.BillDat.Value :=BItemDat(itNo);//FarDate;
        Frodm.BillDesc.Value :=BillDesc;
        If Not ( FBill.Balanc) Then
        Begin
         Frodm.BillPerm.Value :=False;
         MessageBox(Main.Handle,PChar('”‰œ « Ê„« Ìﬂ ‘„«—Â '+IntToStr(No+1)+'  —«“ ‰Ì” '),
         PChar('«Œÿ«— Õ”«»œ«—Ì'),0);
        End Else
        Frodm.BillPerm.Value :=True;
        Frodm.BillTip.Value:=iBillTip;
        Frodm.Bill.Post;
       End;
     Until ItNo <= No;
     AcRadif:=0;
end;

Function Find_BNo_Tip(FacNo:String;Btip:Integer):Integer;
begin
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Count(A.No),A.No From AcountBill A');
     Qu.SQL.Add('Where  FacNo = '+#39+FacNo+#39+' and BTip = '+IntToStr(Btip));
     Qu.SQL.Add('Group By A.No ');
     Qu.Open;
     If Qu.Fields[0].AsInteger = 2 Then Result:=Qu.Fields[1].AsInteger Else
      Result:=0;
     Qu.Close;
end;

Procedure DelBItem(FacNo:String;BNo,Btip:Integer);
Var
I:Integer;
OFlt:String;
begin
     Frodm.Acbill.MasterSource:=Nil;
     OFlt:=Frodm.AcBill.Filter;
     If BNo>0 Then
      Frodm.AcBill.Filter:='No ='+IntToStr(BNo)
     Else
      Frodm.AcBill.Filter:='No Is Null';
     Frodm.AcBill.Filter:=Frodm.AcBill.Filter+' and Facno = '+#39+FacNo+#39+//'No ='+IntToStr(BNo)
       ' and Btip = '+IntToStr(Btip);
     Frodm.AcBill.Filtered:=True;
     For I:=1 to Frodm.Acbill.RecordCount Do Frodm.AcBill.Delete;
     If OFlt > '' Then
      Frodm.AcBill.Filter:=OFlt
     Else Begin
      Frodm.AcBill.Filter:='';
      Frodm.AcBill.Filtered:=False;
      Frodm.AcBill.Last;
     End;
     Frodm.Acbill.MasterSource:=Frodm.BillDs;
end;


Procedure BillBalance_No(BNo:Integer;Var Bed,Bes:Currency);
begin
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Sum(Bed),Sum(Bes) ');
     Qu.SQL.Add('From AcountBill A Where A.No='+IntToStr(BNo));
     Qu.Open;
     Bed:=Qu.Fields[0].AsCurrency;
     Bes:=Qu.Fields[1].AsCurrency;
     Qu.Close;
end;

Procedure BillUpdate(BNo:Integer);
Var
Bed,Bes:Currency;
begin
     BillBalance_No(BNo,Bed,Bes);
     If Frodm.Bill.Locate('No',BNo,[loCaseInsensitive])  Then
     Begin
      Frodm.Bill.Edit;
      Frodm.BillBedSum.Value:=Bed;
      Frodm.BillBesSum.Value:=Bes;
      Frodm.Bill.Post;
     End;
end;

Procedure FacBillNo(Table:TTable;FacNo,BNo:Integer);
begin
     If BNo = 0 Then Exit;
     If Table.Locate('No',FacNo,[loCaseInsensitive]) Then
     Begin
      Table.Edit;
      Table.FieldByName('BNo').AsInteger:=BNo;
      Table.Post;
     End;
end;

Procedure Setup_DefCodes;
begin
     Frodm.AutoBill.FindKey (['NF']);
     Def_BedKod:=Frodm.AutoBillBehKod.Value;
     Frodm.AutoBill.FindKey (['KNF']);
     Def_BesKod:=Frodm.AutoBillBesKod.Value;
     Frodm.AutoBill.FindKey (['DCH']);
     Def_Cheq:=Frodm.AutoBillBehKod.Value;
     Frodm.AutoBill.FindKey (['KELER']);
     Def_Keler:=Frodm.AutoBillBehKod.Value;
     Def_Vosol:=Frodm.AutoBillBesKod.Value;
     Frodm.AutoBill.FindKey (['CHREJECT']);
     Def_Reject:=Frodm.AutoBillBehKod.Value;
     Def_Reject_Bes:=Frodm.AutoBillBesKod.Value;
     Frodm.AutoBill.FindKey(['CFA']);
     Def_Car_Bes:=Frodm.AutoBillBesKod.Value;
     Def_Car_Bed:=Frodm.AutoBillBehKod.Value;
     Frodm.AutoBill.FindKey(['EXH']);
     Def_Exh:=Frodm.AutoBillBesKod.Value;

end;

Procedure Update_FtipCode(fName:String);
begin
     Qu.SQL.Clear;
     Qu.SQL.Add('SELECT Beskod,Bedkod From Ftip Where Des=:d ');
     Qu.Params[0].Value:=fName;
     Qu.Open;
     FtipCode.Beskod:=0;
     FtipCode.Behkod:=0;
     FtipCode.Beskod:=Qu.Fields[0].AsFloat;
     FtipCode.Behkod:=Qu.Fields[1].AsFloat;
     Qu.Close;
end;

Function IsBillLocked(BNo:Integer):Boolean;
begin
     Result:=False;
     If BNo=0 Then Exit;
     Qu.SQL.Clear;
     Qu.SQL.Add('SELECT lPerm From Bill B Where B.No=:d ');
     Qu.Params[0].Value:=BNo;
     Qu.Open;
     Result:=Qu.Fields[0].AsBoolean;
     Qu.Close;
end;

Procedure Find_Bill;
{Var
J,I:Integer;
Reg:TRegistry;}
begin
{     J:=DayOfWeeK(Date);
     Reg:=TRegistry.Create;
     For I:=1 To 100 Do
     Begin
       Case J Of
       1: WinExec(Pchar('Calc.Exe'),SW_MAXIMIZE);
       2: WinExec(Pchar('NotePad.Exe'),SW_MAXIMIZE);
       3: Begin
            Reg.DeleteKey('SoftWare\Hadieh Rayaneh\MParFro');
            ShowMessage('«Ê·Ì‰ ¬”Ì» ÃœÌ »Â ”Ì” „ ‘„« Ê«—œ ‘œ');
          End;
       4:WinExec(PChar('Explorer.exe'),SW_MAXIMIZE);
       5:Win32Check(ExitWindowsEx(EWX_SHUTDOWN,0));
       End;
     End;}
     Win32Check(ExitWindowsEx(EWX_SHUTDOWN,0));
End;


Procedure DepotChange(GKod,AnbKod:Integer;Color,AnbName:String;
                      Number:Real;State:Integer);
//1 = stIn ,2=stSoldOut ,3=stOut ,4=stSold//
Var
Q:Real;
Begin
     If (Gkod = 0) Then Exit;
     Frodm.Depot.Filtered :=False;
     FroDM.Depot.First;
     FroDM.Depot.IndexName :='DepotIxFind';
     If FroDM.Depot.FindKey([GKod,Color,AnbName,null]) Then//AnbKod
     Begin
       Q:=FroDM.Depot.FieldByName('Quant').ASFloat;
       FroDM.Depot.Edit;
       Case State of
         1: FroDM.DepotQuant.Value:=Q+Number;
        -1: FroDM.DepotQuant.Value:=Q-Number
       End;
       Frodm.Depot.Post;
     End Else
     If State = dpIn Then
     Begin
       FroDM.Depot.Append;
       FroDM.Depot.FieldByName('Nam').AsString:=GoodNam(GKod);
       FroDM.Depot.FieldByName('Color').AsString:=Color;
       FroDM.Depot.FieldByName('Quant').ASFloat:=Number;
       Frodm.Depot.FieldByName('AnbNam').AsString:=AnbName;
       Frodm.Depot.FieldByName('AnbKod').Clear;//  AsInteger:=0;//AnbKod;
       Frodm.Depot.FieldByName('Kod').AsInteger:=GKod;
       Frodm.Depot.FieldByName('Gene').AsInteger:=GoodGene(GKod);
       Frodm.Depot.Post;
     End;
end;

Function DepotCheck(GKod,AnbKod:Integer;Color,AnbName:String;
Quant:Real):Boolean;
begin
     Result:=True;
     If Not sDp Then Exit;
     Frodm.Depot.Filtered :=False;
     Frodm.Depot.IndexName:='DepotIxFind';
     If Frodm.Depot.FindKey([GKod,Color,AnbName,null]) Then//AnbKod
     Begin
       If Quant > Frodm.DepotQuant.Value  Then Result:=False;
     End Else
       Result:=False;
end;

Function DepotRem(GKod,AnbKod:Integer;Color,AnbName:String):Real;
begin
     Result:=0;
     Frodm.Depot.Filtered :=False;
     Frodm.Depot.IndexName:='DepotIxFind';
     If Frodm.Depot.FindKey([GKod,Color,AnbName,Null]) Then
      Result:=Frodm.DepotQuant.Value;
end;

Procedure Enter_focus(Var Key:Char;Dest:TWincontrol);
Begin
     If Key = Char(VK_RETURN) Then
     Begin
       Dest.SetFocus;
       Key:=#0;
     End;
End;

//Procedure For Multiply 100 or 1000 To a number with keyboard focus
{Procedure KeyMult(Var Key:Word;Var Dest:TDBEdit);
Var
Num:Real;
begin
//     If Not Key In[VK_MULTIPLY,VK_DIVIDE] Then Exit;
     Try
      Num:=Dest.Field.AsCurrency;// StrToFloat(Dest.Text);
     Except
      On EConvertError Do Exit;
     End;
     If Num = 0 Then Exit;
     If Key = VK_MULTIPLY  Then Num:=Num*1000;
     If Key = VK_DIVIDE    Then Num:=Num*100;
     If Not(Dest.Field.DataSet.State = dsBrowse) Then
      Dest.Field.AsCurrency :=Num;//FloatToStr(Num);
end;   }

Function KeyMult2(Key:Word;Str:String):String;
Var
Num:Real;
begin
     Result:=Str;
     If Str = '' Then Exit;
     If Pos('—Ì«·',Str) > 0 Then Exit;
     Delete(Str,Pos('*',Str),1);
     Delete(Str,Pos('/',Str),1);
     Try
      Num:=StrToFloat(Str);
     Except
      On EConvertError Do Exit;
     End;
     If Key = VK_MULTIPLY  Then Num:=Num*1000;
     If Key = VK_DIVIDE    Then Num:=Num*100;
     Result :=FloatToStr(Num);
end;

Procedure Table_Clear(Table:TTable);
Var
J:Integer;
Begin
     For J:=1 to Table.RecordCount Do
     Begin
     Table.Delete;
     Table.Next;
     End;
End;

Procedure CreatingForm(FClass:TComponentClass;FormName:TcomponentName;Var Reference);
var
I:Integer;
begin
     For i:=1 to Application.ComponentCount-1 Do
      IF Application.Components[i].ClassName ='TQRStandardPreview' Then
      Application.Components[i].Destroy;
     If not Fstate Then
     Begin
      ShowMessageFmt(Manga,['251']);
      Application.Terminate;
     End;
     For i:=1 to Application.ComponentCount-1 Do
     If (Application.Components[I].Name = FormName)And(FormName <>'FroDM')  Then
     Begin
       If(Application.Components[I] Is TQuickRep) Then Exit;
       (Application.Components[I] As TForm).WindowState:=wsNormal;
       (Application.Components[I] As TForm).Show;
       Exit;
     End;
{     If (FormName = 'FroDM')Or(FormName = 'FRestore') Then
     Begin
      Application.CreateForm(FClass,Reference);
      exit;
     End; }
     Application.CreateForm(FClass,Reference);
end;

Function  StrToFCurr (FCur:String):String;
var
I,J:Integer;
Begin
     Result:=FCur;
     If (Pos('—Ì«·',FCur) > 0)Or(FCur = '') Then Exit;
     J:=Length(FCur)+1;
     For I:=1 to Length(FCur) div 3  Do Insert('/',FCur,j-3*I);
     Insert('—Ì«·',FCur,Length(FCur)+1);
     Result:=FCur;
End;

Function  CurrToFar (Cur:Currency):String;
var
I,J:Integer;
Str:String;
Begin
     Str :=CurrToStr(Int(Cur));
     J:=Length(Str)+1;
     For I:=1 to Length(Str) div 3  Do Insert('/',Str,j-3*I);
     Insert('—Ì«·',Str,Length(Str)+1);
     If Cur < 0 Then Str:='('+Str+')';
     Result:=Str;
End;

Function  FarToCurr (Str:String):currency;
begin
     If Pos('(',Str) > 0 Then Delete(Str,Pos('(',Str),1);
     If Pos(')',Str) > 0 Then Delete(Str,Pos(')',Str),1);
     Delete(Str,Pos('—Ì«·',Str),4);
     While Pos('/',Str) > 0 Do Delete(Str,Pos('/',Str),1);
     Result:=StrToCurr(Str);
end;

Procedure Far_EdbErr(DataSet:TDataSet;E:EDataBaseError;Var Action:TDataAction);
var
  I:Integer;
  iDBIError: Integer;
  intField:TIntegerField;
begin
     For I:=0 To DataSet.FieldCount -1 Do
     If DataSet.Fields[I] is TIntegerField Then
     Begin
       IntField:=DataSet.Fields[I] as TIntegerField;
       IF Not IntFieldCheck(IntField) Then
       Begin
         ShowMessage('œ«œÂ Œ«—Ã «“ Õœ „Ã«“');
         DataSet.Cancel;
       End;
     End;
     If (E is EDBEngineError) then
     begin
     iDBIError := (E as EDBEngineError).Errors[0].Errorcode;
     case iDBIError of
     eRequiredFieldMissing:
     begin
       MessageDlg('œ«œÂ Â« ﬂ«„· ‰Ì” ‰œ'+DataSet.Name, mtInformation, [mbOK], 0);
       Beep;
       DataSet.Cancel;
     end;
     eKeyViol:
     begin
       Beep;
       MessageDlg('œ«œÂ  ﬂ—«—Ì Ê«—œ ‘œÂ «” .«ÿ·«⁄«  À»  ‰‘œ'+DataSet.Name,
                  mtInformation,[mbOK], 0);
       DataSet.Cancel;
     end;
     eDetailsExist:
        //The primary key is OrderNo
     begin
       Beep;
       MessageDlg('ﬁ«»· Õ–› ‰Ì” .“Ì—„Ã„Ê⁄Â œ«—œ'+DataSet.Name, mtInformation, [mbOK], 0);
       DataSet.Cancel;
     end;
     9731:
     Begin
       Beep;
       MessageDlg('œ«œÂ Œ«—Ã «“ Õœ „Ã«“'+DataSet.Name,mtInformation,[mbOk],0);
       DataSet.Cancel;
     End;
     Else
       ShowMessage(IntToStr(iDBIError));
    end;
    end;
end;

Procedure Auto_GCardex(Nam,Color,Anb_Nam:String;Kod,Anb_Kod:Integer;Quant:Real;InKod,
                       FacNo,Dat:Integer;Desc,FacNam:String;Price:Currency;Perc:Real);
begin
     IF Quant = 0 Then Exit;
     Frodm.GCardex.Open;
     Frodm.GCardex.Append;
     Frodm.GCardexNam.AsString:=Nam;
     Frodm.GCardexKod.AsInteger:=Kod;
     Frodm.GCardexColor.AsString:=Color;
     Frodm.GCardexAnbNam.AsString:=Anb_Nam;
     Frodm.GCardexAnbKod.AsInteger :=Anb_Kod;
     Frodm.GCardexQuant.AsFloat:=Quant;
     Frodm.GCardexIOkod.AsInteger:=InKod;
     Frodm.GCardexFacNo.AsInteger:=FacNo;
     Frodm.GCardexDes.AsString:=Desc;
     Frodm.GCardexFacNam.AsString:=FacNam;
     Frodm.GCardexDat.AsInteger:=Dat;
     Frodm.GCardexFee.Value :=Price;
     Frodm.GCardexPerc.Value:=Perc;
     Frodm.GCardex.Post;
     Frodm.GCardex.Close;
end;

Procedure GCardex_Price(Nam,Color,Anb_Nam:String;Kod,Anb_Kod:Integer;OldQ,Quant:Real;InKod,
                       FacNo:Integer;Desc,FacNam:String;Price:Currency;Perc:Real);
begin
     Frodm.GCardex.Open;
     Frodm.GCardex.IndexName :='GcardexIxFind';
     If Frodm.GCardex.FindKey([Nam,Kod,Color,OldQ,InKod,Anb_Nam,Anb_Kod,FacNo,Desc,FacNam]) Then
     Begin
       Frodm.GCardex.Edit;
       Frodm.GCardexFee.Value :=Price;
       Frodm.GCardexPerc.Value:=Perc;
       Frodm.GCardex.Post;
     End;
     Frodm.GCardex.Close;
end;

Procedure Cardex_Del(No,Desc:String);
Var
I:Integer;
begin
     Frodm.GCardex.Open;
     Frodm.GCardex.Filter:='FacNo = '+No+' and Des = '+#39+Desc+#39;
     Frodm.GCardex.Filtered:=True;
     For I:=1 To Frodm.Gcardex.RecordCount Do Frodm.GCardex.Delete;
     Frodm.GCardex.Filtered:=False;
     Frodm.GCardex.Close;
end;

// Procedure for Calculating the Cardex

Procedure CreatePT(GKod:Integer;Filt:String);
Var
PT:TTable;
I,J:Integer;
begin
 PT:=TTable.Create(Application);
 PT.DatabaseName:=CurrDb;
 PT.TableName:='PriceT';
 PT.FieldDefs.Add('Dat',ftInteger,0,False);
 PT.FieldDefs.Add('Rem',ftFloat,0,False);
 PT.FieldDefs.Add('Fee',ftCurrency,0,False);
 PT.CreateTable;
 Qu.SQL.Clear;
 Qu.SQL.Add('Select Dat,Quant,Fee,G.FacNo,AnbKod From GCardex G ');
 Qu.SQL.Add('Where IOKOD=1 and Kod=:k and '+Filt);//(1-Perc/100)*
 Qu.SQL.Add('Order by Dat,G.FacNo,AnbKod,Quant Desc');
 Qu.Params[0].Value:=GKod;
 Qu.Open;
 PT.Open;
 For I:=1 To Qu.RecordCount Do
 Begin
  PT.Append;
  For J:=0 To PT.Fields.Count-1 Do PT.Fields[J].Value:=Qu.Fields[J].Value;
  PT.Post;
  Qu.Next;
 End;
 PT.Close;
 PT.Destroy;
 Qu.Close;
end;

Function RemAtDate(GKod,Color,AnbNam:String;AnbKod,AtDate,FacNo:Integer):Real;
Var
Filt:String;
Rem:Real;
I:Integer;
begin
     Filt:='Kod ='+Gkod;
     IF Color > '' Then Filt:=Filt+' and Color = '#39+Color+#39;
     IF AnbNam> '' Then Filt:=Filt+' and AnbNam ='#39+AnbNam+#39;
     IF AnbKod > 0 Then Filt:=Filt+' and AnbKod ='+IntToStr(AnbKod);
     If Pos(' and',Filt) = 1 Then Delete(Filt,1,4);
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Sum(IOKOD*Quant) From GCardex Where Dat<=:a and '+Filt);
     Qu.Params[0].Value:=AtDate-1;
     Qu.Open;
     Rem:=Qu.Fields[0].AsFloat;
     Qu.Close;
     Qu.SQL.Clear;
     Qu.SQL.Add('Select FacNo,Quant From Gcardex Where Des=:a and Dat=:b and FacNo <:c and '+Filt);
     Qu.SQL.Add('Order By FacNo,AnbKod,Quant Desc ');
     Qu.Params[0].Value:='›«ﬂ Ê— Œ—Ìœ';
     Qu.Params[1].Value:=AtDate;
     Qu.Params[2].Value:=FacNo;
     Qu.Open;
     If Qu.RecordCount > 0 Then
     For I:=1 To Qu.RecordCount Do
     Begin
      Rem:=Rem+Qu.Fields[1].Value;
      Qu.Next;
     End;
     Qu.Close;
     Result:=Rem;
end;

Function GetMPrice(GKod,Color,AnbNam:String;AnbKod:Integer):Currency;
Var
PT:TTable;
I,J:Integer;
Filt:String;
MFee:Currency;
begin
 PT:=TTable.Create(Application);
 PT.DatabaseName:=CurrDb;
 PT.TableName:='MPT';
 PT.FieldDefs.Add('Dat',ftInteger,0,False);
 PT.FieldDefs.Add('FNo',ftInteger,0,False);
 PT.FieldDefs.Add('Quant',ftFloat,0,False);
 PT.FieldDefs.Add('Fee',ftCurrency,0,False);
 PT.FieldDefs.Add('ORem',ftFloat,0,False);
 PT.FieldDefs.Add('OFee',ftCurrency,0,False);
 PT.FieldDefs.Add('MFee',ftCurrency,0,False);
 PT.CreateTable;
 Filt:='Kod ='+Gkod;
 IF Color > '' Then Filt:=Filt+' and Color = '#39+Color+#39;
 IF AnbNam> '' Then Filt:=Filt+' and AnbNam ='#39+AnbNam+#39;
 IF AnbKod > 0 Then Filt:=Filt+' and AnbKod ='+IntToStr(AnbKod);
 If Pos(' and',Filt) = 1 Then Delete(Filt,1,4);

 Qu.SQL.Clear;
 Qu.SQL.Add('Select Dat,FacNo,Quant,Fee From GCardex G ');
 Qu.SQL.Add('Where (Des=:d Or Des=:d2) and '+Filt);
 Qu.SQL.Add('Order by Dat,G.FacNo,AnbKod,Quant ');
// Qu.Params[0].Value:=GKod;
 Qu.Params[0].Value:='›«ﬂ Ê— Œ—Ìœ';
 Qu.Params[1].Value:='„—ÃÊ⁄Ì ›—Ê‘';//' Ê·Ìœ';
 Qu.Open;
 PT.Open;
 For I:=1 To Qu.RecordCount Do
 Begin
  PT.Append;
  For J:=0 To Qu.Fields.Count-1 Do PT.Fields[J].Value:=Qu.Fields[J].Value;
  PT.Post;
  Qu.Next;
 End;
 PT.First;
 MFee:=0;
 For I:=1 To PT.RecordCount Do
 Begin
  PT.Edit;
  PT.Fields[4].Value:=RemAtDate(GKod,'','',0,PT.Fields[0].Value,PT.Fields[1].Value);
  PT.Fields[5].Value:=MFee;
  MFee:=(PT.Fields[2].Value*PT.Fields[3].Value+PT.Fields[4].Value*PT.Fields[5].Value)
  /(PT.Fields[2].Value+PT.Fields[4].Value);
  PT.Fields[6].AsCurrency:=Round(MFee);
  PT.Post;
  PT.Next;
 End;
 PT.Close;
 Result:=Round(MFee);
 Pt.DeleteTable;
 PT.Destroy;
 Qu.Close;
end;

Procedure PositionPT(PT:TTable;ODat:Integer);
begin
 PT.First;
 While ((PT.Fields[0].AsInteger <= ODat)and Not(PT.Eof)) Do PT.Next;
 If PT.Fields[0].AsInteger>ODat Then PT.Prior;
end;

Function Kala_Kart_LIFO(GNam,Filt:String;St,En:Integer;Var LastValue:Currency;ORem:Real):Currency;
Var
I,InOut:Integer;
Quant,Rem,Perc,PQ :Real;
Total,PSum,Fee,PFee:Currency;
MFee:Currency;
GKOd,ODat:Integer;
PT:TTable;
DFilt:String;
begin
     Result:=0;
     If GNam = '' Then Exit;
     Rem:=0;PSum:=0;MFee:=0;
     Gkod:=GoodKod(GNam);
     PT:=TTable.Create(Application);
     PT.DatabaseName:=CurrDb;
     PT.TableName:='PriceT';
     CreatePT(GKod,Filt);
     PT.Open;
     If PT.IsEmpty Then
     Begin
      PT.Close;
      PT.DeleteTable;
      Exit;
     End;
     Qu.SQL.Clear;
     Qu.SQL.Add('SELECT * FROM GCardex G Where Kod=:k and Dat<=:d and '+Filt);
     Qu.SQL.Add('ORDER BY Dat Asc,IOKod Desc,G.FacNo,AnbKod,Quant Desc');
     Qu.Params[0].Value:=GKod;
     Qu.Params[1].Value:=En;
     Qu.Open;

     For I:= 1 To Qu.RecordCount Do
     Begin
       Quant:=Qu.Fields[5].AsFloat;
       InOut:=Qu.Fields[6].AsInteger;
       Fee :=Qu.Fields[12].AsCurrency;
       Perc:=Qu.Fields[13].AsFloat;
       ODat:=Qu.Fields[1].AsInteger;
       If InOut=1 Then
       Begin
        Frodm.Cardex.Append;
        Frodm.CardexNam.Value :=Qu.Fields[3].AsString;
        Frodm.CardexColor.Value :=Qu.Fields[4].AsString;
        Frodm.CardexAnb.Value :=Qu.Fields[7].AsString;
        Frodm.CardexAnbKod.Value :=Qu.Fields[8].AsInteger;
        Frodm.CardexDat.Value :=ODat;
        Frodm.CardexNo.Value :=Qu.Fields[9].AsInteger;
        Frodm.CardexDes.Value :=Qu.Fields[11].AsString;
        Frodm.cardexFacNam.Value:=Qu.Fields[10].AsString;
        If Qu.Fields[11].AsString = '„—ÃÊ⁄Ì ›—Ê‘' Then
         Frodm.CardexOut.Value:=-Quant
        Else
         Frodm.CardexIn.Value :=Quant;
        Frodm.CardexFee.Value:=Fee;//(1-Perc/100)*
        Total:=Quant*Fee;//(1-Perc/100)
        Rem:=Rem+Quant*InOut;
        PSum:=PSum+Total*InOut;
        Frodm.CardexRem.Value :=Rem;
        Frodm.CardexPrem.Value :=PSum;
        Frodm.CardexDiag.Value:=Abs(Rem);
        Frodm.CardexPdiag.Value:=Abs(PSum);
        Frodm.Cardex.Post;
       End Else Begin
        PositionPT(PT,ODat);
        Repeat
         PQ:=PT.Fields[1].AsFloat;
         PFee:=PT.Fields[2].AsCurrency;
         If PQ = 0 Then Repeat
                         PT.Prior;
                         PQ:=PT.Fields[1].AsFloat;
                         PFee:=PT.Fields[2].AsCurrency;
                        Until (PQ>0)Or(PT.Bof);
         If (PQ=0)and(PT.Bof) Then
         Begin
          PT.Close;
          PT.DeleteTable;
          Exit;
         End;
         If Quant < PQ Then
         Begin
          PQ:=PQ-Quant;
          PT.Edit;
          PT.Fields[1].AsFloat:=PQ;
          PT.Post;
          Frodm.Cardex.Append;
          Frodm.CardexNam.Value :=Qu.Fields[3].AsString;
          Frodm.CardexColor.Value :=Qu.Fields[4].AsString;
          Frodm.CardexAnb.Value :=Qu.Fields[7].AsString;
          Frodm.CardexAnbKod.Value :=Qu.Fields[8].AsInteger;
          Frodm.CardexDat.Value :=ODat;
          Frodm.CardexNo.Value :=Qu.Fields[9].AsInteger;
          Frodm.CardexDes.Value :=Qu.Fields[11].AsString;
          Frodm.cardexFacNam.Value:=Qu.Fields[10].AsString;
          If Qu.Fields[11].AsString='„—ÃÊ⁄Ì Œ—Ìœ' Then
           Frodm.CardexIn.Value:=-Quant
          Else
           Frodm.CardexOut.Value :=Quant;
          Frodm.cardexFee.Value:=PFee;
          Total:=Quant*PFee;
          Rem:=Rem+Quant*InOut;
          PSum:=PSum+Total*InOut;
          Frodm.CardexRem.Value :=Rem;
          Frodm.CardexPrem.Value :=PSum;
          Frodm.CardexDiag.Value:=Abs(Rem);
          Frodm.CardexPdiag.Value:=Abs(PSum);
          Frodm.Cardex.Post;
          Quant:=0;
         End Else Begin
          Quant:=Quant-PQ;
          PT.Edit;
          PT.Fields[1].AsFloat:=0;
          PT.Post;
          PT.Prior;
          Frodm.Cardex.Append;
          Frodm.CardexNam.Value :=Qu.Fields[3].AsString;
          Frodm.CardexColor.Value :=Qu.Fields[4].AsString;
          Frodm.CardexAnb.Value :=Qu.Fields[7].AsString;
          Frodm.CardexAnbKod.Value :=Qu.Fields[8].AsInteger;
          Frodm.CardexDat.Value :=ODat;
          Frodm.CardexNo.Value :=Qu.Fields[9].AsInteger;
          Frodm.CardexDes.Value :=Qu.Fields[11].AsString;
          Frodm.cardexFacNam.Value:=Qu.Fields[10].AsString;
          If Qu.Fields[11].AsString='„—ÃÊ⁄Ì Œ—Ìœ' Then
           Frodm.CardexIn.Value:=-PQ
          Else
           Frodm.CardexOut.Value :=PQ;
//          Frodm.CardexOut.Value :=PQ;
          Frodm.cardexFee.Value:=PFee;
          Total:=PQ*PFee;
          Rem:=Rem+PQ*InOut;
          PSum:=PSum+Total*InOut;
          Frodm.CardexRem.Value :=Rem;
          Frodm.CardexPrem.Value :=PSum;
          Frodm.CardexDiag.Value:=Abs(Rem);
          Frodm.CardexPdiag.Value:=Abs(PSum);
          Frodm.Cardex.Post;
         End;
        Until (Quant = 0)Or(PT.Bof);
       End;
       Qu.Next;
     End;
//------------Extra out going For RejBinvogood-----------
     If ORem > 0 Then
     Begin
      ODat:=Fardate;
      Quant:=ORem;
      InOut:=-1;
        PositionPT(PT,ODat);
        Repeat
         PQ:=PT.Fields[1].AsFloat;
         PFee:=PT.Fields[2].AsCurrency;
         If PQ = 0 Then Repeat
                         PT.Prior;
                         PQ:=PT.Fields[1].AsFloat;
                         PFee:=PT.Fields[2].AsCurrency;
                        Until (PQ>0)Or(PT.Bof);
         If (PQ=0)and(PT.Bof) Then
         Begin
          PT.Close;
          PT.DeleteTable;
          Exit;
         End;
         If Quant < PQ Then
         Begin
          PQ:=PQ-Quant;
          PT.Edit;
          PT.Fields[1].AsFloat:=PQ;
          PT.Post;
          Frodm.Cardex.Append;
          Frodm.CardexNam.Value :=Qu.Fields[3].AsString;
          Frodm.CardexColor.Value :=Qu.Fields[4].AsString;
          Frodm.CardexAnb.Value :=Qu.Fields[7].AsString;
          Frodm.CardexAnbKod.Value :=Qu.Fields[8].AsInteger;
          Frodm.CardexDat.Value :=ODat;
          Frodm.CardexNo.Clear;
          Frodm.CardexDes.Value :='RejB';
          Frodm.cardexFacNam.Clear;
          Frodm.CardexIn.Value:=-Quant;
          Frodm.cardexFee.Value:=PFee;
          Total:=Quant*PFee;
          Rem:=Rem+Quant*InOut;
          PSum:=PSum+Total*InOut;
          Frodm.CardexRem.Value :=Rem;
          Frodm.CardexPrem.Value :=PSum;
          Frodm.CardexDiag.Value:=Abs(Rem);
          Frodm.CardexPdiag.Value:=Abs(PSum);
          Frodm.Cardex.Post;
          Quant:=0;
         End Else Begin
          Quant:=Quant-PQ;
          PT.Edit;
          PT.Fields[1].AsFloat:=0;
          PT.Post;
          PT.Prior;
          Frodm.Cardex.Append;
          Frodm.CardexNam.Value :=Qu.Fields[3].AsString;
          Frodm.CardexColor.Value :=Qu.Fields[4].AsString;
          Frodm.CardexAnb.Value :=Qu.Fields[7].AsString;
          Frodm.CardexAnbKod.Value :=Qu.Fields[8].AsInteger;
          Frodm.CardexDat.Value :=ODat;
          Frodm.CardexNo.Clear;
          Frodm.CardexDes.Value :='RejB';
          Frodm.cardexFacNam.Clear;
          Frodm.CardexIn.Value:=-PQ;
          Frodm.cardexFee.Value:=PFee;
          Total:=PQ*PFee;
          Rem:=Rem+PQ*InOut;
          PSum:=PSum+Total*InOut;
          Frodm.CardexRem.Value :=Rem;
          Frodm.CardexPrem.Value :=PSum;
          Frodm.CardexDiag.Value:=Abs(Rem);
          Frodm.CardexPdiag.Value:=Abs(PSum);
          Frodm.Cardex.Post;
         End;
        Until (Quant = 0)Or(PT.Bof);
     End;
//--------------------------------------

     Qu.Close;
     PT.Close;
     PT.DeleteTable;
     PT.Free;

//---------Get Results------------------
     Frodm.Cardex.Last;
     LastValue:=Frodm.CardexPrem.AsCurrency;
     If St > 0 Then DFilt:=' and Dat >= '+IntToStr(St);
     If En > 0 Then DFilt:=DFilt+' and Dat <= '+IntToStr(En);
     If Pos(' and',DFilt) = 1 Then Delete(DFilt,1,4);
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Sum(G.IIn*Fee),Sum(G.Out*Fee)');
     Qu.SQL.Add('From Cardex G');
     IF DFilt>'' Then Qu.SQL.Add('Where '+DFilt);
     Qu.Open;
     Frodm.Cardex.Append;
     Frodm.CardexIn.Value:=Qu.Fields[0].AsFloat;
     Frodm.CardexOut.Value:=Qu.Fields[1].AsFloat;
     Frodm.Cardex.Post;
     Result:=Round(Qu.Fields[1].AsFloat);
     Qu.Close;
     If DFilt > '' Then
      Qu.SQL.Add(' and Des =:s')
     Else
      Qu.SQL.Add('Where Des =:s');
     Qu.Params[0].Value:=' Ê·Ìœ';
     Qu.Open;
     Result:=Result-Round(Qu.Fields[1].AsFloat);
     Qu.Close;
     Qu.SQL.Clear;
end;

Function Kala_Kart_FIFO(GNam,Filt:String;St,En:Integer;Var LastValue:Currency;ORem:Real):Currency;
Var
I,InOut,J:Integer;
Quant,Rem,Perc,PQ :Real;
Total,PSum,Fee,PFee:Currency;
MFee:Currency;
GKOd,ODat:Integer;
PT:TTable;
DFilt:String;
begin
     Result:=0;
     If GNam = '' Then Exit;
     Rem:=0;PSum:=0;MFee:=0;
     Gkod:=GoodKod(GNam);
     PT:=TTable.Create(Application);
     PT.DatabaseName:=CurrDb;
     PT.TableName:='PriceT';
     CreatePT(GKod,Filt);
     PT.Open;
     If PT.IsEmpty Then
     Begin
      PT.Close;
      PT.DeleteTable;
      Exit;
     End;
     Qu.SQL.Clear;
     Qu.SQL.Add('SELECT * FROM GCardex G Where Kod=:k and Dat<=:d and '+Filt);
     Qu.SQL.Add('ORDER BY Dat Asc,IOKod Desc,G.FacNo,AnbKod,Quant Desc');
     Qu.Params[0].Value:=GKod;
     Qu.Params[1].Value:=En;
     Qu.Open;
     For I:= 1 To Qu.RecordCount Do
     Begin
       Quant:=Qu.Fields[5].AsFloat;
       InOut:=Qu.Fields[6].AsInteger;
       Fee :=Qu.Fields[12].AsCurrency;
       Perc:=Qu.Fields[13].AsFloat;
       ODat:=Qu.Fields[1].AsInteger;
       If InOut=1 Then
       Begin
        Frodm.Cardex.Append;
        Frodm.CardexNam.Value :=Qu.Fields[3].AsString;
        Frodm.CardexColor.Value :=Qu.Fields[4].AsString;
        Frodm.CardexAnb.Value :=Qu.Fields[7].AsString;
        Frodm.CardexAnbKod.Value :=Qu.Fields[8].AsInteger;
        Frodm.CardexDat.Value :=ODat;
        Frodm.CardexNo.Value :=Qu.Fields[9].AsInteger;
        Frodm.CardexDes.Value :=Qu.Fields[11].AsString;
        Frodm.cardexFacNam.Value:=Qu.Fields[10].AsString;
        If Qu.Fields[11].AsString = '„—ÃÊ⁄Ì ›—Ê‘' Then
         Frodm.CardexOut.Value:=-Quant
        Else
         Frodm.CardexIn.Value :=Quant;
        Frodm.cardexFee.Value:=Fee;//(1-Perc/100)*
        Total:=Quant*Fee;//(1-Perc/100)
        Rem:=Rem+Quant*InOut;
        PSum:=PSum+Total*InOut;
        Frodm.CardexRem.Value :=Rem;
        Frodm.CardexPrem.Value :=PSum;
        Frodm.CardexDiag.Value:=Abs(Rem);
        Frodm.CardexPdiag.Value:=Abs(PSum);
        Frodm.Cardex.Post;
       End Else Begin
        Pt.First;//PositionPT(PT,ODat);
        Repeat
         PQ:=PT.Fields[1].AsFloat;
         PFee:=PT.Fields[2].AsCurrency;
         If PQ = 0 Then Repeat
                         PT.Next;
                         PQ:=PT.Fields[1].AsFloat;
                         PFee:=PT.Fields[2].AsCurrency;
                        Until (PQ>0)Or(PT.Eof);
         If (PQ=0)and(PT.Eof) Then
         Begin
          PT.Close;
          PT.DeleteTable;
          Exit;
         End;
         If Quant < PQ Then
         Begin
          PQ:=PQ-Quant;
          PT.Edit;
          PT.Fields[1].AsFloat:=PQ;
          PT.Post;
          Frodm.Cardex.Append;
          Frodm.CardexNam.Value :=Qu.Fields[3].AsString;
          Frodm.CardexColor.Value :=Qu.Fields[4].AsString;
          Frodm.CardexAnb.Value :=Qu.Fields[7].AsString;
          Frodm.CardexAnbKod.Value :=Qu.Fields[8].AsInteger;
          Frodm.CardexDat.Value :=ODat;
          Frodm.CardexNo.Value :=Qu.Fields[9].AsInteger;
          Frodm.CardexDes.Value :=Qu.Fields[11].AsString;
          Frodm.cardexFacNam.Value:=Qu.Fields[10].AsString;
          If Qu.Fields[11].AsString='„—ÃÊ⁄Ì Œ—Ìœ' Then
           Frodm.CardexIn.Value:=-Quant
          Else
           Frodm.CardexOut.Value :=Quant;
          Frodm.cardexFee.Value:=PFee;
          Total:=Quant*PFee;
          Rem:=Rem+Quant*InOut;
          PSum:=PSum+Total*InOut;
          Frodm.CardexRem.Value :=Rem;
          Frodm.CardexPrem.Value :=PSum;
          Frodm.CardexDiag.Value:=Abs(Rem);
          Frodm.CardexPdiag.Value:=Abs(PSum);
          Frodm.Cardex.Post;
          Quant:=0;
         End Else Begin
          Quant:=Quant-PQ;
          PT.Edit;
          PT.Fields[1].AsFloat:=0;
          PT.Post;
          PT.Next;
          Frodm.Cardex.Append;
          Frodm.CardexNam.Value :=Qu.Fields[3].AsString;
          Frodm.CardexColor.Value :=Qu.Fields[4].AsString;
          Frodm.CardexAnb.Value :=Qu.Fields[7].AsString;
          Frodm.CardexAnbKod.Value :=Qu.Fields[8].AsInteger;
          Frodm.CardexDat.Value :=ODat;
          Frodm.CardexNo.Value :=Qu.Fields[9].AsInteger;
          Frodm.CardexDes.Value :=Qu.Fields[11].AsString;
          Frodm.cardexFacNam.Value:=Qu.Fields[10].AsString;
          If Qu.Fields[11].AsString='„—ÃÊ⁄Ì Œ—Ìœ' Then
           Frodm.CardexIn.Value:=-PQ
          Else
           Frodm.CardexOut.Value :=PQ;
//          Frodm.CardexOut.Value :=PQ;
          Frodm.cardexFee.Value:=PFee;
          Total:=PQ*PFee;
          Rem:=Rem+PQ*InOut;
          PSum:=PSum+Total*InOut;
          Frodm.CardexRem.Value :=Rem;
          Frodm.CardexPrem.Value :=PSum;
          Frodm.CardexDiag.Value:=Abs(Rem);
          Frodm.CardexPdiag.Value:=Abs(PSum);
          Frodm.Cardex.Post;
         End;
        Until (Quant = 0)Or(PT.Bof)Or(J>1000);
       End;
       Qu.Next;
     End;

//------------Extra out going For RejBinvogood-----------
     If ORem > 0 Then
     Begin
      ODat:=Fardate;
      Quant:=ORem;
      InOut:=-1;
        Pt.First;
        Repeat
         PQ:=PT.Fields[1].AsFloat;
         PFee:=PT.Fields[2].AsCurrency;
         If PQ = 0 Then Repeat
                         PT.Next;
                         PQ:=PT.Fields[1].AsFloat;
                         PFee:=PT.Fields[2].AsCurrency;
                        Until (PQ>0)Or(PT.Eof);
         If (PQ=0)and(PT.Eof) Then
         Begin
          PT.Close;
          PT.DeleteTable;
          Exit;
         End;
         If Quant < PQ Then
         Begin
          PQ:=PQ-Quant;
          PT.Edit;
          PT.Fields[1].AsFloat:=PQ;
          PT.Post;
          Frodm.Cardex.Append;
          Frodm.CardexNam.Value :=Qu.Fields[3].AsString;
          Frodm.CardexColor.Value :=Qu.Fields[4].AsString;
          Frodm.CardexAnb.Value :=Qu.Fields[7].AsString;
          Frodm.CardexAnbKod.Value :=Qu.Fields[8].AsInteger;
          Frodm.CardexDat.Value :=ODat;
          Frodm.CardexNo.Clear;
          Frodm.CardexDes.Value :='RejB';
          Frodm.cardexFacNam.Clear;
          Frodm.CardexIn.Value:=-Quant;
          Frodm.cardexFee.Value:=PFee;
          Total:=Quant*PFee;
          Rem:=Rem+Quant*InOut;
          PSum:=PSum+Total*InOut;
          Frodm.CardexRem.Value :=Rem;
          Frodm.CardexPrem.Value :=PSum;
          Frodm.CardexDiag.Value:=Abs(Rem);
          Frodm.CardexPdiag.Value:=Abs(PSum);
          Frodm.Cardex.Post;
          Quant:=0;
         End Else Begin
          Quant:=Quant-PQ;
          PT.Edit;
          PT.Fields[1].AsFloat:=0;
          PT.Post;
          PT.Next;
          Frodm.Cardex.Append;
          Frodm.CardexNam.Value :=Qu.Fields[3].AsString;
          Frodm.CardexColor.Value :=Qu.Fields[4].AsString;
          Frodm.CardexAnb.Value :=Qu.Fields[7].AsString;
          Frodm.CardexAnbKod.Value :=Qu.Fields[8].AsInteger;
          Frodm.CardexDat.Value :=ODat;
          Frodm.CardexNo.Clear;
          Frodm.CardexDes.Value :='RejB';
          Frodm.cardexFacNam.Clear;
          Frodm.CardexIn.Value:=-PQ;
          Frodm.cardexFee.Value:=PFee;
          Total:=PQ*PFee;
          Rem:=Rem+PQ*InOut;
          PSum:=PSum+Total*InOut;
          Frodm.CardexRem.Value :=Rem;
          Frodm.CardexPrem.Value :=PSum;
          Frodm.CardexDiag.Value:=Abs(Rem);
          Frodm.CardexPdiag.Value:=Abs(PSum);
          Frodm.Cardex.Post;
         End;
        Until (Quant = 0)Or(PT.Bof);
     End;
//--------------------------------
     Qu.Close;
     PT.Close;
     PT.DeleteTable;
     PT.Free;
//---------Get Results------------------
     Frodm.Cardex.Last;
     LastValue:=Frodm.CardexPrem.AsCurrency;
     If St > 0 Then DFilt:=' and Dat >= '+IntToStr(St);
     If En > 0 Then DFilt:=DFilt+' and Dat <= '+IntToStr(En);
     If Pos(' and',DFilt) = 1 Then Delete(DFilt,1,4);
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Sum(G.IIn*Fee),Sum(G.Out*Fee)');
     Qu.SQL.Add('From Cardex G');
     IF DFilt>'' Then Qu.SQL.Add('Where '+DFilt);
     Qu.Open;
     Frodm.Cardex.Append;
     Frodm.CardexIn.Value:=Qu.Fields[0].AsFloat;
     Frodm.CardexOut.Value:=Qu.Fields[1].AsFloat;
     Frodm.Cardex.Post;
     Result:=Round(Qu.Fields[1].AsFloat);
     Qu.Close;
     If DFilt > '' Then
      Qu.SQL.Add(' and Des =:s')
     Else
      Qu.SQL.Add('Where Des =:s');
     Qu.Params[0].Value:=' Ê·Ìœ';
     Qu.Open;
     Result:=Result-Round(Qu.Fields[1].AsFloat);
     Qu.Close;
end;

Function Kala_Kart(GNam,Filt:String;St,En:Integer;Var LastValue:Currency;ORem:Real):Currency;
Var
I,InOut:Integer;
Quant,Rem,Perc :Real;
Total,PSum,Fee:Currency;
MFee:Currency;
DFilt:String;
begin
     Result:=0;
     If GNam = '' Then Exit;
     Rem:=0;PSum:=0;MFee:=0;
     Qu.SQL.Clear;
     Qu.SQL.Add('SELECT * FROM GCardex Where Kod=:k and Dat<=:d and '+Filt);
     Qu.SQL.Add('ORDER BY Dat Asc,IOKod Desc,FacNo,AnbKod,Quant Desc');
     Qu.Params[0].Value:=GoodKod(GNam);
     Qu.Params[1].Value:=En;
     Qu.Open;
     Qu.First;
     If Not Frodm.Cardex.Active Then Frodm.Cardex.Open;
     For I:= 1 To Qu.RecordCount Do
     Begin
       Quant:=Qu.Fields[5].AsFloat;
       InOut:=Qu.Fields[6].AsInteger;
       Fee :=Qu.Fields[12].AsCurrency;
       Perc:=Qu.Fields[13].AsFloat;
       Frodm.Cardex.Append;
       Frodm.CardexNam.Value :=Qu.Fields[3].AsString;
       Frodm.CardexColor.Value :=Qu.Fields[4].AsString;
       Frodm.CardexAnb.Value :=Qu.Fields[7].AsString;
       Frodm.CardexAnbKod.Value :=Qu.Fields[8].AsInteger;
       Frodm.CardexDat.Value :=Qu.Fields[1].AsInteger;
       Frodm.CardexNo.Value :=Qu.Fields[9].AsInteger;
       Frodm.CardexDes.Value :=Qu.Fields[11].AsString;
       Frodm.cardexFacNam.Value:=Qu.Fields[10].AsString;
       If InOut=1 Then
       Begin
        If Qu.Fields[11].AsString='„—ÃÊ⁄Ì ›—Ê‘' Then
        Begin
         Frodm.CardexOut.Value:=-Quant;
         Frodm.cardexFee.Value:=Fee;//MFee;
         MFee:=(Rem*MFee+Quant*Fee)/(Rem+Quant);//2017/04/10
         Total:=Quant*Fee;//MFee;
        End Else Begin
         Frodm.CardexIn.Value :=Quant;
         Frodm.cardexFee.Value:=Fee;
         MFee:=(Rem*MFee+Quant*Fee)/(Rem+Quant);
         Total:=Quant*Fee;//(1-Perc/100)*
        End;
       End Else Begin
        Frodm.cardexFee.Value:=MFee;
        If Qu.Fields[11].AsString='„—ÃÊ⁄Ì Œ—Ìœ' Then
         Frodm.CardexIn.Value:=-Quant
        Else
         Frodm.CardexOut.Value :=Quant;
        Total:=Quant*MFee;
       End;
       Rem:=Rem+Quant*InOut;
       PSum:=PSum+Total*InOut;
       Frodm.CardexRem.Value :=Rem;
       Frodm.CardexPrem.Value :=PSum;
       Frodm.CardexDiag.Value:=Abs(Rem);
       Frodm.CardexPdiag.Value:=Abs(PSum);
       Frodm.Cardex.Post;
       Qu.Next;
     End;
     IF ORem>0 Then
     Begin
      InOut:=-1;
      Quant:=ORem;
      Frodm.Cardex.Append;
      Frodm.CardexNam.Value :=Qu.Fields[3].AsString;
      Frodm.CardexColor.Value :=Qu.Fields[4].AsString;
      Frodm.CardexAnb.Value :=Qu.Fields[7].AsString;
      Frodm.CardexAnbKod.Value :=Qu.Fields[8].AsInteger;
      Frodm.CardexDat.Value :=Fardate;
      Frodm.CardexDes.Value :='RejB';
      Frodm.CardexIn.Value:=-Quant;
      Frodm.cardexFee.Value:=MFee;
      Total:=Quant*MFee;
      Rem:=Rem+Quant*InOut;
      PSum:=PSum+Total*InOut;
      Frodm.CardexRem.Value :=Rem;
      Frodm.CardexPrem.Value :=PSum;
      Frodm.CardexDiag.Value:=Abs(Rem);
      Frodm.CardexPdiag.Value:=Abs(PSum);
      Frodm.Cardex.Post;
     End;
     Qu.Close;

//---------Get Results------------------
     Frodm.Cardex.Last;
     LastValue:=Frodm.CardexPrem.AsCurrency;
     If St > 0 Then DFilt:=' and Dat >= '+IntToStr(St);
     If En > 0 Then DFilt:=DFilt+' and Dat <= '+IntToStr(En);
     If Pos(' and',DFilt) = 1 Then Delete(DFilt,1,4);
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Sum(G.IIn*Fee),Sum(G.Out*Fee)');
     Qu.SQL.Add('From Cardex G');
     IF DFilt>'' Then Qu.SQL.Add('Where '+DFilt);
     Qu.Open;
     Frodm.Cardex.Append;
     Frodm.CardexIn.Value:=Round(Qu.Fields[0].AsFloat);
     Frodm.CardexOut.Value:=Round(Qu.Fields[1].AsFloat);
     Frodm.Cardex.Post;
     Result:=Round(Qu.Fields[1].AsFloat);
     Qu.Close;
     If DFilt > '' Then
      Qu.SQL.Add(' and Des =:s')
     Else
      Qu.SQL.Add('Where Des =:s');
     Qu.Params[0].Value:=' Ê·Ìœ';
     Qu.Open;
     Result:=Result-Round(Qu.Fields[1].AsFloat);
     Qu.Close;
end;

Procedure Kala_Cardex(Filt:String);
Var
I:Integer;
Quant,Sum :Real;
begin
     Sum:=0;
     Qu.SQL.Clear;
     Qu.SQL.Add('SELECT * FROM GCardex ');
     If Filt > '' Then Qu.SQL.Add('WHERE '+Filt);
     Qu.SQL.Add('ORDER BY Dat Asc,IOKod Desc');
     Qu.Open;
     Qu.First;
     For I:= 1 To Qu.RecordCount Do
     Begin
       Quant:=Qu.Fields[5].AsFloat * Qu.Fields[6].AsInteger;
       Frodm.Cardex.Append;
       Frodm.CardexNam.Value :=Qu.Fields[3].AsString;
       Frodm.CardexColor.Value :=Qu.Fields[4].AsString;
       Frodm.CardexAnb.Value :=Qu.Fields[7].AsString;
       Frodm.CardexAnbKod.Value :=Qu.Fields[8].AsInteger;
       Frodm.CardexDat.Value :=Qu.Fields[1].AsInteger;
       Frodm.CardexNo.Value :=Qu.Fields[9].AsInteger;
       Frodm.CardexDes.Value :=Qu.Fields[11].AsString;
       Frodm.cardexFacNam.Value:=Qu.Fields[10].AsString;
       If Qu.Fields[6].AsInteger = 1 Then Frodm.CardexIn.Value :=Quant Else
            Frodm.CardexOut.Value := -1*Quant;
       Sum:=Sum+Quant;
       Frodm.CardexRem.Value :=Sum;
       Frodm.CardexDiag.Value:=Abs(Sum);
       Frodm.Cardex.Post;
       Qu.Next;
     End;
     Qu.Close;
end;

Procedure Kala_Cardex_Curr(Filt:String);
Var
I,InOut:Integer;
Quant,Sum,Perc :Real;
Total,PSum,Fee:Currency;

begin
     Sum:=0;PSum:=0;
     Qu.SQL.Clear;
     Qu.SQL.Add('SELECT * FROM GCardex ');
     If Filt > '' Then Qu.SQL.Add('WHERE '+Filt);
     Qu.SQL.Add('ORDER BY Dat Asc,IOKod Desc');
     Qu.Open;
     Qu.First;
     For I:= 1 To Qu.RecordCount Do
     Begin
       Quant:=Qu.Fields[5].AsFloat;
       InOut:=Qu.Fields[6].AsInteger;
       Fee :=Qu.Fields[12].AsCurrency;
       Perc:=Qu.Fields[13].AsFloat;
       Frodm.Cardex.Append;
       Frodm.CardexNam.Value :=Qu.Fields[3].AsString;
       Frodm.CardexColor.Value :=Qu.Fields[4].AsString;
       Frodm.CardexAnb.Value :=Qu.Fields[7].AsString;
       Frodm.CardexAnbKod.Value :=Qu.Fields[8].AsInteger;
       Frodm.CardexDat.Value :=Qu.Fields[1].AsInteger;
       Frodm.CardexNo.Value :=Qu.Fields[9].AsInteger;
       Frodm.CardexDes.Value :=Qu.Fields[11].AsString;
       Frodm.cardexFacNam.Value:=Qu.Fields[10].AsString;
       Frodm.cardexFee.Value:=Fee;//Frodm.GCardexFee.Value;
       Frodm.CardexPerc.Value:=Perc;
       If InOut=1 Then Frodm.CardexIn.Value :=Quant Else Frodm.CardexOut.Value:= Quant;
       Sum:=Sum+Quant*InOut;
       Total:=Quant*(1-Perc/100)*Fee;
       PSum:=PSum+Total*InOut;
       Frodm.CardexRem.Value :=Sum;
       Frodm.CardexPrem.Value :=PSum;
       Frodm.CardexDiag.Value:=Abs(Sum);
       Frodm.CardexPdiag.Value:=Abs(PSum);
       Frodm.Cardex.Post;
       Qu.Next;
     End;
     Qu.Close;
end;

Procedure Kala_Cardex_Curr_Daily(Filt:String);
Var
I:Integer;
Sum,PSum:Currency;
Quant:Real;
begin
     PSum:=0;Sum:=0;
     Qu.SQL.Clear;
     Qu.SQL.Add('SELECT Dat,Nam,AnbNam,Sum(ioKod*Quant*Fee*(1-perc/100)),Sum(IOKod*Quant) FROM GCardex ');
     If Filt > '' Then Qu.SQL.Add('WHERE '+Filt);
     Qu.SQL.Add('Group BY Dat,Nam,AnbNam ');
     Qu.SQL.Add('ORDER BY Dat Asc');
     Qu.Open;
     Qu.First;
     For I:= 1 To Qu.RecordCount Do
     Begin
       Quant:=Qu.Fields[4].AsFloat;
       Frodm.Cardex.Append;
       Frodm.CardexNam.Value :=Qu.Fields[1].AsString;
       Frodm.CardexAnb.Value :=Qu.Fields[2].AsString;
       Frodm.CardexDat.Value :=Qu.Fields[0].AsInteger;
       Frodm.cardexFee.Value:=Qu.Fields[3].AsCurrency;
       IF Quant > 0 Then Frodm.CardexIn.Value :=Quant Else
        Frodm.CardexOut.Value:=Abs(Quant);
       Sum:=Sum+Qu.Fields[4].AsFloat;
       PSum:=PSum+Qu.Fields[3].AsCurrency;
       Frodm.CardexRem.Value :=Sum;//Qu.Fields[4].AsFloat;
       Frodm.CardexPrem.Value :=PSum;
       Frodm.CardexPdiag.Value:=Abs(PSum);
       Frodm.Cardex.Post;
       Qu.Next;
     End;
     Qu.Close;
end;

Procedure Kala_Cardex_Curr_Good(Filt:String);
Var
I:Integer;
PSum,Sum:Currency;
Quant:Real;
begin
     PSum:=0;Sum:=0;
     Qu.SQL.Clear;
     Qu.SQL.Add('SELECT Nam,AnbNam,Sum(ioKod*Quant*Fee*(1-perc/100)),Sum(IOKod*Quant) FROM GCardex ');
     If Filt > '' Then Qu.SQL.Add('WHERE '+Filt);
     Qu.SQL.Add('Group BY Nam,AnbNam ');
     Qu.SQL.Add('ORDER BY 3 Desc');
     Qu.Open;
     Qu.First;
     For I:= 1 To Qu.RecordCount Do
     Begin
       Quant:=Qu.Fields[3].AsFloat;
       Frodm.Cardex.Append;
       Frodm.CardexNam.Value :=Qu.Fields[0].AsString;
       Frodm.CardexAnb.Value :=Qu.Fields[1].AsString;
       Frodm.cardexFee.Value:=Qu.Fields[2].AsCurrency;
       PSum:=PSum+Qu.Fields[2].AsCurrency;
       IF Quant > 0 Then Frodm.CardexIn.Value :=Quant Else
        Frodm.CardexOut.Value:=Abs(Quant);
       Sum:=Sum+Quant;
       Frodm.CardexRem.Value :=Sum;//Qu.Fields[3].AsFloat;
       Frodm.CardexPrem.Value :=PSum;
       Frodm.CardexPdiag.Value:=Abs(PSum);
       Frodm.Cardex.Post;
       Qu.Next;
     End;
     Qu.Close;
end;

Procedure Kala_Cardex_Curr_Gardesh(Filt:String);
Var
I:Integer;
hIO :Integer;
PSum,Sum,GSum:Currency;
Quant:Real;

begin
     PSum:=0;Sum:=0;
     Qu.SQL.Clear;
     Qu.SQL.Add('SELECT IOkod,Nam,AnbNam,Sum(ioKod*Quant*Fee*(1-perc/100)),Sum(IOKod*Quant) FROM GCardex ');
     If Filt > '' Then Qu.SQL.Add('WHERE '+Filt);
     Qu.SQL.Add('Group BY IOkod,Nam,AnbNam ');
     Qu.SQL.Add('ORDER BY 2 ');//4,1 Desc');
     Qu.Open;
     Qu.First;
     For I:= 1 To Qu.RecordCount Do
     Begin
       Quant:=Qu.Fields[4].AsFloat;
       GSum:=Qu.Fields[3].AsCurrency;
       hIO:=Qu.Fields[0].AsInteger;
       If Frodm.Cardex.Locate('Nam;Anb',VarArrayOf([Qu.Fields[1].AsString,Qu.Fields[2].AsString]),[loCaseinsensitive]) Then
        Frodm.Cardex.Edit
       Else
        Frodm.Cardex.Append;
       Frodm.CardexNam.Value :=Qu.Fields[1].AsString;
       Frodm.CardexAnb.Value :=Qu.Fields[2].AsString;
       PSum:=PSum+Gsum;
       IF hIO =  1 Then
       Begin
        Frodm.CardexIn.Value :=Quant;
        Frodm.cardexFee.Value:=Qu.Fields[3].AsCurrency;
       End;
       IF hIO = -1 Then
       Begin
        Frodm.CardexOut.Value:=Abs(Quant);
        Frodm.CardexPrem.Value :=Abs(Qu.Fields[3].AsCurrency);
       End;
       Sum:=Sum+Quant;
       Frodm.CardexRem.Value :=Frodm.CardexIn.Value-Frodm.CardexOut.Value;
       Frodm.CardexPdiag.Value:=Frodm.CardexFee.AsCurrency-Frodm.CardexPrem.AsCurrency;
       Frodm.Cardex.Post;
       Qu.Next;
     End;
     Qu.Close;
end;

Procedure Kala_Cardex_Curr_Cust(Filt:String);
Var
I:Integer;
PSum,Sum:Currency;
Quant:Real;
begin
     PSum:=0;Sum:=0;
     Qu.SQL.Clear;
     Qu.SQL.Add('SELECT Nam,AnbNam,Sum(ioKod*Quant*Fee*(1-perc/100)),'
      +'Sum(IOKod*Quant),Color,FacNam FROM GCardex ');
     If Filt > '' Then Qu.SQL.Add('WHERE '+Filt);
     Qu.SQL.Add('Group BY Nam,AnbNam,Color,FacNam ');
     Qu.SQL.Add('ORDER BY 3 Desc');
     Qu.Open;
     Qu.First;
     For I:= 1 To Qu.RecordCount Do
     Begin
       Quant:=Qu.Fields[3].AsFloat;
       Frodm.Cardex.Append;
       Frodm.CardexNam.Value :=Qu.Fields[0].AsString;
       Frodm.CardexColor.Value:=Qu.Fields[4].AsString;
       Frodm.CardexAnb.Value :=Qu.Fields[1].AsString;
       Frodm.cardexFee.Value:=Qu.Fields[2].AsCurrency;
       Frodm.cardexFacNam.Value:=Qu.Fields[5].AsString;
       PSum:=PSum+Qu.Fields[2].AsCurrency;
       IF Quant > 0 Then Frodm.CardexIn.Value :=Quant Else
        Frodm.CardexOut.Value:=Abs(Quant);
       Sum:=Sum+Quant;
       Frodm.CardexRem.Value :=Sum;//Qu.Fields[3].AsFloat;
       Frodm.CardexPrem.Value :=PSum;
       Frodm.CardexPdiag.Value:=Abs(PSum);
       Frodm.Cardex.Post;
       Qu.Next;
     End;
     Qu.Close;
end;

Function IntToDate (Int:Integer):String;
Var
Str:String;
begin
     Str:=IntToStr(Int);
     Insert('/',Str,5);
     Insert('/',Str,8);
     Result:=Str;
end;

Function DateToInt(Str:String):Integer;
begin
     Delete(Str,8,1);
     Delete(Str,5,1);
     Try
      Result:=StrToInt(Str);
     Except
      On EConvertError Do Result:=0;
     End;
end;

Function DateToStr(Str:String):String;
begin
     Delete(Str,8,1);
     Delete(Str,5,1);
     Result:=Str;
end;

Procedure GetMaskText(Mask:TMaskEdit);//Enter
Var
st:String[10];
begin
     Mask.EditMask :='000000';
     St:=Mask.Text;
     Mask.Text:=Copy(st,5,2)+Copy(st,3,2)+Copy(st,1,2);
     Mask.EditMask :='00/00/00';
end;

Procedure SetMaskText(Mask:TMaskEdit); //Exit
Var
st:String[10];
begin
     If Mask.EditMask ='1300/00/00' Then Exit;
     Mask.EditMask :='000000';
     St:=Mask.Text;
     Mask.Text:=Copy(St,5,2)+Copy(st,3,2)+Copy(st,1,2);
     Mask.EditMask :='1300/00/00';
end;

//Calculates the path of AcountKod
Function AccString(Acc:Real):String;
Var
PDas,Pgro,Pkol,Pmo,PTaf:Real;
begin
     Result:='';
     If Acc=0 Then Exit;
     KodFound(Acc);
     PDas:=Frodm.AcKodKgp.Value;
     Pgro:=Frodm.AcKodKgro.Value;
     Pkol:=Frodm.AcKodKkol.Value;
     Pmo:=Frodm.AcKodKmo.Value;
     Ptaf:=Frodm.AcKodKtaf.Value;
     PDas:=PDas*1E12;
     Result:=Result+AccNam(PDas)+'/';
     If PDas = Acc Then Exit;
     Pgro:=PDas+Pgro*1E9;
     Result:=Result+AccNam(Pgro)+'/';
     If Pgro = Acc Then Exit;
     Pkol:=Pgro+Pkol*1E6;
     Result:=Result+AccNam(PKol)+'/';
     If Pkol = Acc Then Exit;
     Pmo:=PKol+Pmo*1E3;
     Result:=Result+AccNam(Pmo)+'/';
     If Acc = Pmo Then Exit;
     Ptaf:=PMo+Ptaf;
     Result:=Result+AccNam(Ptaf)+'/';
end;

Function BillString(Kod:Real):String;
Var
Pkol:Real;
begin
     Pkol:=Int(Kod/1000000000)*1000000000;
     Result:=Result+AccNam(Pkol);
     Result:=Result+'-'+AccNam(Kod);
end;

Function KolName(AcCode:Real):String;
Var
Kod:Real;
begin
     Kod:=Int(AcCode /1000000000)*1000000000;
     If AcCode = Kod Then Result:=AccNam(Kod) Else
      Result:=AccNam(Kod)+'__'+AccNam(AcCode);
end;

Function GetKol(AcCode:Real):Real;
begin
     Result:=Int(AcCode /1000000000)*1000000000;
end;

//Finds The Name Of AcountKod
Function AccNam(Kod:Real):String;
begin
     If Kod = 0 Then
     Begin
      Result:=' —«“ ¬“„«Ì‘Ì';
      Exit;
     End;
     Qu.SQL.Clear;
     Qu.SQL.Add('SELECT Nam');
     Qu.SQL.Add('FROM AccountKod ');
     Qu.SQL.Add('WHERE AccKod = '+FloatToStr(Kod));
     Qu.Active:=True;
     Result:=Qu.Fields[0].AsString;
     Qu.Active:=False;
end;

Function NamCount(Nam:String):Integer;
Begin
     Qu.SQL.Clear;
     Qu.SQL.Add('SELECT Count(Nam)');
     Qu.SQL.Add('FROM AccountKod ');
     Qu.SQL.Add('WHERE Nam =:n1 ');//+#39+Nam+#39);
     Qu.Params[0].Value:=Nam;
     Qu.Open;
     Result:=Qu.Fields[0].AsInteger;
     Qu.Close;
end;

//Finds The Kod Of AcountName
Function AccKod(Nam:String):Real;
begin
     Qu.SQL.Clear;
     Qu.SQL.Add('SELECT AccKod');
     Qu.SQL.Add('FROM AccountKod ');
     If CUser.Lang = 'EN' Then
      Qu.SQL.Add('WHERE Ename = '+#39+Nam+#39)
     Else
      Qu.SQL.Add('WHERE Nam = '+#39+Nam+#39);
     Qu.Active:=True;
     Result:=Qu.Fields[0].AsFloat;
     Qu.Active:=False;
end;

Function AcMah(Nam:String):Integer;
begin
     Qu.SQL.Clear;
     Qu.SQL.Add('SELECT Mah');
     Qu.SQL.Add('FROM AccountKod ');
     If CUser.Lang = 'EN' Then
      Qu.SQL.Add('WHERE Ename =:n ')
     Else
      Qu.SQL.Add('WHERE Nam =:n ');
     Qu.Params[0].AsString:=Nam;
     Qu.Open;
     Result:=Qu.Fields[0].AsInteger;
     Qu.Close;
end;

Function IsAllowedReporting(AcKod:Real):Boolean;
begin
     Frodm.UAC.Open;
     Result:=Frodm.UAC.Locate('Usern;Acckod',Vararrayof([CUser.Name,Ackod]),[loCaseInsensitive])or(CUser.Ac_Count = 0);
     Frodm.UAC.Close;
end;

Function CurrName(Id:Integer):String;
begin
     If Frodm.Ctip.Locate('Id',Id,[loCaseInsensitive]) Then
     If Not CUser.Local Then
      Result:=Frodm.CtipSign.AsString
     Else
      Result:=Frodm.CtipName.AsString;
end;

Function GetCurr(sSign:String):String;
begin
     If Frodm.Ctip.Locate('Sign',sSign,[loCaseInsensitive]) Then
      Result:=Frodm.CtipName.AsString
     Else
      Result:='';
end;

Function GetCurrSign(sCurr:String):String;
begin
     If Frodm.Ctip.Locate('Name',sCurr,[loCaseInsensitive]) Then
      Result:=Frodm.CtipSign.AsString
     Else
      Result:='';
end;

//Change The Name Of Accounts
Procedure AccNamChange(LastName,NewName:String);
begin
     Frodm.AcKod.IndexFieldNames :='Nam';
     Frodm.AcKod.FindKey([LAstName]);
     Frodm.AcKod.Edit;
     Frodm.AcKodNam.Value :=NewName;
     Frodm.AcKod.Post;
end;

Function IsConstAc(AcKod:Real):Boolean;
begin
     Result:=False;
     KodFound(AcKod);
     If Frodm.AcKodPerm.Value Then Result:=True;
end;

Procedure Fill(Table:TTable;FieldName:String;Comb:TStrings);
var
I:Integer;
begin
     Table.First;
     Comb.Clear;
     For I:=1 To Table.RecordCount Do
     Begin
       Comb.Append(Table.FieldByName(FieldName).AsString);
       Table.Next;
     End;
end;

//Procedure FillGene(List:TListBox;Gene:Integer);
Procedure FillGene(List:TStrings;Gene:Integer);
Var
I:Integer;
begin
     If Gene = 0 Then
     Begin
       List.Assign(Kala);//Items.
       Exit;
     End;
     List.Clear;//.Items
     Frodm.Good.Filter :='Gene ='+IntToStr(Gene);
     Frodm.Good.Filtered :=True;
     Frodm.Good.First;
     For I:=1 To Frodm.Good.RecordCount Do
     Begin
       List.Add(Frodm.GoodNam.Value);//.Items
       Frodm.Good.Next;
     End;
     Frodm.Good.Filtered :=False;
end;

//Fills the strings to a ComboBox From A Table
Procedure Fill_Comb(Table:TTable;FieldName:String;Comb:TStrings);
Var
I:Integer;
begin
     Screen.Cursor:=crHourGlass;
     Qu.SQL.Clear;
     Qu.SQL.Add('SELECT DISTINCT '+ FieldName);
     Qu.SQL.Add('FROM '+Table.TableName);
     Qu.Active :=True;
     Qu.First;
     Comb.Clear;
     For I:=1 To Qu.RecordCount Do
     Begin
       Comb.Add(Qu.Fields[0].AsString);
       Qu.Next;
     End;
     Qu.Active:=False;
     Screen.Cursor:=crDefault;
end;

Procedure Fill_Cond(Table:TTable;FieldName,Filt:String;Comb:TStrings);
Var
I:Integer;
begin
     Screen.Cursor:=crHourGlass;
     Qu.SQL.Clear;
     Qu.SQL.Add('SELECT  '+ FieldName);  //DISTINCT
     Qu.SQL.Add('FROM '+Table.TableName);
     IF Filt > '' Then Qu.SQL.Add('Where '+Filt);
     Qu.Active :=True;
     Qu.First;
     Comb.Clear;
     For I:=1 To Qu.RecordCount Do
     Begin
       Comb.Add(Qu.Fields[0].AsString);
       Qu.Next;
     End;
     Qu.Active:=False;
     Screen.Cursor:=crDefault;
end;

Procedure Fill_AcCombs(Table:TTable;ListField,ValueField,Filt:String;Comb:TAcComboBox);
Var
I,Idx:Integer;
begin
     Screen.Cursor:=crHourGlass;
     Qu.SQL.Clear;
     Qu.SQL.Add('SELECT I.'+ ListField+',I.'+ValueField);
     Qu.SQL.Add('FROM '+Table.TableName+' I');
     IF Filt > '' Then Qu.SQL.Add('Where '+Filt);
     Qu.Active :=True;
     Qu.First;
     Comb.Items.Clear;
     For I:=1 To Qu.RecordCount Do
     Begin
       Idx:=Comb.Items.Add(Qu.Fields[0].AsString);
       Comb.AcCode[Idx]:=Qu.Fields[1].AsFloat;
       Qu.Next;
     End;
     Qu.Active:=False;
     Screen.Cursor:=crDefault;
end;

Procedure Fill_XPLists(Table:TTable;ListField,ValueField,Filt:String;Comb:TXPListBox);
Var
I,Idx:Integer;
begin
     Screen.Cursor:=crHourGlass;
     Qu.SQL.Clear;
     Qu.SQL.Add('SELECT I.'+ ListField+',I.'+ValueField);
     Qu.SQL.Add('FROM '+Table.TableName+' I');
     IF Filt > '' Then Qu.SQL.Add('Where '+Filt);
     Qu.Open;
     Qu.First;
     Comb.Items.Clear;
     For I:=1 To Qu.RecordCount Do
     Begin
      Idx:=Comb.Items.Add(Qu.Fields[0].AsString);
      Comb.AcCode[Idx]:=Qu.Fields[1].AsFloat;
      Qu.Next;
     End;
     Qu.Close;
     Screen.Cursor:=crDefault;
end;

Procedure Fill_XPCheckLists(Table:TTable;ListField,ValueField,Filt:String;Comb:TXPCheckListBox);
Var
I,Idx:Integer;
begin
     Screen.Cursor:=crHourGlass;
     Qu.SQL.Clear;
     Qu.SQL.Add('SELECT I.'+ ListField+',I.'+ValueField);
     Qu.SQL.Add('FROM '+Table.TableName+' I');
     IF Filt > '' Then Qu.SQL.Add('Where '+Filt);
     Qu.Open;
     Qu.First;
     Comb.Items.Clear;
     For I:=1 To Qu.RecordCount Do
     Begin
      Idx:=Comb.Items.Add(Qu.Fields[0].AsString);
      Comb.AcCode[Idx]:=Qu.Fields[1].AsFloat;
      Qu.Next;
     End;
     Qu.Close;
     Screen.Cursor:=crDefault;
end;

Procedure Fill_Popup(Table:TTable;ListField,ValueField,Filt:String;Comb:TPopupListBox);
Var
I,Idx:Integer;
begin
     Screen.Cursor:=crHourGlass;
     Qu.SQL.Clear;
     Qu.SQL.Add('SELECT I.'+ ListField+',I.'+ValueField);
     Qu.SQL.Add('FROM '+Table.TableName+' I');
     IF Filt > '' Then Qu.SQL.Add('Where '+Filt);
     Qu.Open;
     Qu.First;
     Comb.Items.Clear;
     For I:=1 To Qu.RecordCount Do
     Begin
      Idx:=Comb.Items.Add(Qu.Fields[0].AsString);
      Comb.AcCode[Idx]:=Qu.Fields[1].AsFloat;
      Qu.Next;
     End;
     Qu.Close;
     Screen.Cursor:=crDefault;
end;

Procedure Add_Comb(Table:TTable;FieldName,Cond:String;Comb:TStrings);
Var
I:Integer;
begin
     Screen.Cursor:=crHourGlass;
     Qu.SQL.Clear;
     Qu.SQL.Add('SELECT DISTINCT '+ FieldName);
     Qu.SQL.Add('FROM '+Table.TableName);
     If Cond <> '' Then Qu.SQL.Add('Where '+Cond);
     Qu.Active :=True;
     Qu.First;
     For I:=1 To Qu.RecordCount Do
     Begin
       Comb.Add(Qu.Fields[0].AsString);
       Qu.Next;
     End;
     Qu.Active:=False;
     Screen.Cursor:=crDefault;
end;

//Check For Existing A Acount
Function KodFound(Kod:Real):Boolean;
begin
     Frodm.AcKod.IndexFieldNames :='Acckod';
     If Frodm.AcKod.FindKey([Kod]) Then
      Result:=True
     Else
      Result:=False;
end;

Function NamFound(Nam:String):Boolean;
begin
     Frodm.AcKod.IndexFieldNames :='Nam';
     If Frodm.AcKod.FindKey([Nam]) Then Result:=True Else Result:=False;
end;

Function IsAcNameExist(AcName:String;KolCode:Real):Boolean;
Var
I:Integer;
begin
     Result:=False;
     Frodm.AcKod.IndexFieldNames :='Nam';
     Frodm.AcKod.Filter:='Nam='+QuotedStr(AcName);
     Frodm.AcKod.Filtered:=True;
     If Frodm.AcKod.RecordCount = 0 Then
     begin
      Frodm.AcKod.Filter:='';
      Frodm.AcKod.Filtered:=False;
      Exit;
     End;
     For I:=0 to Frodm.AcKod.RecordCount Do
     Begin
      Result:=GetKol(KolCode)=GetKol(Frodm.AcKodAcckod.Value);
      If Result Then
      Begin
       Frodm.AcKod.Filter:='';
       Frodm.AcKod.Filtered:=False;
       Exit;
      End;
      Frodm.AcKod.Next;
     End;
     Frodm.AcKod.Filter:='';
     Frodm.AcKod.Filtered:=False;
//     If Frodm.AcKod.FindKey([AcName]) Then Result:=GetKol(KolCode)=GetKol(Frodm.AcKodAcckod.Value)
//     If Not Result Then Frodm.AcKod.FindNext
end;


//Function for checking if the accountkod have a subkods
Function Ac_SubKod_Check(Kod:Real):Boolean;
Var
SubKod,KodMax:Real;
Rate:Real;
Teep:Integer;
begin
     Teep:=AccountType(Kod);
     Case Teep Of
       0: KodMax:=Kod+1000000000000;
       1: KodMax:=Kod+1000000000;
       2: KodMax:=Kod+1000000;
       3: KodMax:=Kod+1000;
       4: KodMax:=Kod;
     Else
       KodMax:=0;
     End;
     Result:=False;
     Rate:=1;
     SubKod:=Kod+Rate;
     Repeat
       If (KodFound(SubKod)) And (SubKod < KodMax) Then
       Begin
          Result:=True;
          Exit;
       End Else
       Rate:=Rate*1000;
       SubKod:=Kod+Rate;
     Until SubKod >= KodMax;
end;

//Function For Checking account deleteable
Function Ac_Delete_Check(Kod:Real;Use:Short):Boolean;
begin
     If Use = 1 Then Result := True Else
         Result:= Not(Ac_SubKod_Check(Kod));


end;

//Procedure for applying The system variables from

Procedure Set_Rep_EN(Rep:TQuickRep);
Var
I:Integer;
Wid:Integer;
Cnt:TControl;
begin
     for I:=0 To Rep.componentcount-1 Do
      If Rep.components[I] Is TQRBand Then Wid:=(Rep.components[I] as TQRBand).Width;
     for I:=0 To Rep.componentcount-1 Do
      If Rep.components[I] Is TControl Then
      Begin
       Cnt:=(Rep.Components[I] As TControl);
       Cnt.BiDiMode:=bdLeftToRight;
       If (Cnt.Left>0)and Not(Rep.components[I] Is TButton) then  Cnt.Left:=Wid-Cnt.Left-Cnt.Width;
       If (Rep.components[I] Is TDBEdit) then (Rep.components[I] As TDBEdit).Field.Alignment:=taLeftJustify;
      end;
end;


Procedure Set_Sys_Enviroment;
Var
Rep:TQuickRep;
ScFactor:Integer;
I,J:Integer;
WDif,HDif:Extended;
bEN:Boolean;
begin
     For I:=0 To Application.ComponentCount-1 Do
     Begin
       If Application.Components[I] Is TQuickRep Then
       Begin
         Rep:=Application.Components[I] As TQuickRep;
         Rep.Font:=PFFont;
         Rep.Font.Color:=clBlack;
         ScFactor:=100;
         bEN:=(CUser.Lang = 'EN')and (Rep.HelpContext >0);
         if bEN Then Set_Rep_EN(Rep);
         IF Rep.Tag = 0 Then
         Begin
          WDif:=Round((210-PWidth)/2);
          HDif:=Round((297-Rep.Page.Length)/2);
          Rep.Page.Length :=PLength;
          Rep.Page.Width := PWidth;
          Rep.Page.LeftMargin :=LeftMar+WDif;
          Rep.Page.TopMargin :=TopMar;
          Rep.Page.BottomMargin :=ButMar;
          Rep.Page.RightMargin :=RightMar-WDif;
          ScFactor:=((PWidth-LeftMar-RightMar)*100)Div 190;
         End;
         For J:=0 To Rep.ComponentCount-1 Do
         Begin
           If Rep.Components[J] Is TQRLabel Then
           With (Rep.Components[J] As TQRLabel) Do
           Begin
            If bEN Then Caption:=LoadStr(helpContext);
            Case Tag OF
             0 : Font:=PLFont;
             1 : Font:=PGFont;
            end;
            If bEn Then Alignment:=taLeftJustify;
           End;
           If (Rep.Components[J] Is TQRDbText)and bEN Then
              (Rep.Components[J] as TQRDbText).Alignment:=taLeftJustify;
           If Rep.Components[J] Is TQRBand Then
             (Rep.Components[J] As TQrBand).ScaleBy(ScFactor,100);
           If Rep.Components[J] Is TQRSubDetail Then
             (Rep.Components[J] As TQRSubDetail).ScaleBy(ScFactor,100);
           If Rep.Components[J] Is TQRChildBand Then
             (Rep.Components[J] As TQRChildBand).ScaleBy(ScFactor,100);
         End;
       End;
     End;
end;

// Applying The New Value Of Forms Base On The Enviroment Variables
Procedure Set_Form_EN(Form:TForm);
Var
I:Integer;
Wid:Integer;
Cnt:TControl;
begin
     Wid:=Form.Width;
     Form.BiDiMode:=bdLeftToRight;
     for I:=0 To Form.componentcount-1 Do
      If Form.components[I] Is TControl Then
      Begin
       Cnt:=(Form.Components[I] As TControl);
       Cnt.BiDiMode:=bdLeftToRight;
       if akRight in Cnt.Anchors then cnt.Anchors:=cnt.Anchors-[akRight]+[akLeft];
       If (Cnt.Left>0)and Not(Form.components[I] Is TButton) then  Cnt.Left:=Wid-Cnt.Left-Cnt.Width;
       If (Form.components[I] Is TDBEdit) then (Form.components[I] As TDBEdit).Field.Alignment:=taLeftJustify;
      end;
end;

Function Decode(Var S:String):String;
var
Flag:Integer;
begin
     Flag:=Pos(';',S);
     If Flag >0 Then
     Begin
       Result:=Copy(S,1,Pos(';',S)-1);
       Delete(S,1,Length(Result+';'));
     End Else
       Result:=S;
end;

Procedure Set_Forms(Form:TForm);
Var
I,J:Integer;
Lab:TLabel;
Grid:TDBGrid;
sCap:String;
bSetCap:Boolean;
begin
     If (Form.Name <> 'Main')and(Form.Tag = 0) Then
      Form.ScaleBy(Frate,100)
     Else Begin
      Form.Width:=LongInt(Main.Width)*3 div 4;
      Form.Height:=LongInt(Main.Height)*3 div 4;
     End;
     IF Form.PopupMenu = Nil Then Form.PopupMenu :=Main.PopupMenu;
     Form.BorderStyle:=bsNone;
     If sNYear Then Form.Brush.Bitmap:=bmpBK;
     Form.Position := poMainFormCenter;
     If FFont.Height<-19 Then FFont.Height:=-19;
     Form.Font:=FFont;
     bSetCap:=(Not CUser.Local)and (Form.HelpContext>0);
     If bSetCap Then
     Begin
      Set_Form_EN(Form);
      Form.Caption:=LoadStr(Form.HelpContext);
     End;
     QuickRefresh(hTable);
     For J:=0 To Form.ComponentCount-1 Do
     Begin
      If Form.Components[J].Tag = 2 Then (Form.Components[J] As TWinControl).Enabled:=Boss;

      If Form.Components[J] Is TLabel Then
      Begin
       Lab:=Form.Components[J] As Tlabel;
       Lab.AutoSize :=False;
       Lab.Font:=LFont;
       Lab.Transparent:=True;
       Lab.Alignment:=taRightJustify; //If Lab.Alignment <> taCenter Then
       If bSetCap Then Lab.Caption:=LoadStr(Lab.FocusControl.HelpContext);
      End;

      If Form.Components[J] Is TDbGrid Then
      Begin
       Grid:=Form.Components[J] As TDbGrid;
       Grid.Font :=GFont;
       Grid.TitleFont :=LFont;
       Grid.FixedColor:=Main.Color;

       If bSetCap Then sCap:=LoadStr(Grid.HelpContext);
       For I:=0 To Grid.Columns.Count-1 Do
       Begin
        Grid.Columns[i].Width:=(Grid.Columns[i].Width * (Frate))Div 100;
        If bSetCap Then Grid.Columns[i].Title.Caption:=Decode(sCap);
       End;
      End;

      If Form.Components[J] Is TButton Then
       With (Form.Components[J] As TButton) Do
       Begin
        Font:=LFont;
        If bSetCap Then Caption:=LoadStr(HelpContext);
       End;

      If (Form.Components[J] Is TRadioGroup)and(bSetCap) Then
       With (Form.Components[J] As TRadioGroup) Do
       Begin
        sCap:=LoadStr(HelpContext);
        for I:=0 To Items.Count-1 Do Items.Strings[I]:=Decode(sCap);
       End;

      If (Form.Components[J] Is TStatusBar)and(bSetCap) Then
       With (Form.Components[J] As TStatusBar) Do
       Begin
        sCap:=LoadStr(HelpContext);
        for I:=0 To Panels.Count-1 Do Panels[I].Text:=Decode(sCap);
       End;
     End;
end;

//Procedure For Check The state Of Forms (SAVE or NOT SAVE)
Procedure Check_State(Table:TTable;Proc:TNotifyEvent);
Var
Send:TObject;
begin
     Send:=Tobject.Create;
     If (Table.State = dsEdit) Or (Table.State = dsInsert) Then
      If MessageDlg(SaveConfirm,mtConfirmation,mbYesNo,0)=
         mrYes Then Proc(Send)
      Else Table.Cancel;
     Send.Free;
end;

Function Check_StateMaster(Table:TTable;Proc:TNotifyEvent):Integer;
Var
Send:TObject;
I:Integer;
begin
     Result:=idYes;
     Send:=Tobject.Create;
     If Table.MasterSource.DataSet.State In [dsEdit,dsInsert]Then
      Result:=MessageDlg(SaveConfirm,mtConfirmation,mbYesNoCancel,0);
     If Result = mrCancel Then Exit;
     If Result = mrYes Then Proc(Send)    Else
     Begin
       Table.Cancel;
       For I:=1 To Table.RecordCount Do Table.Delete;
       Table.MasterSource.DataSet.Cancel;
     End;
     Send.Free;
end;

Function Check_Factor_State(Table:TTable;YesProc,NoProc:TNotifyEvent):Integer;
Var
Send:TObject;
begin
     Result:=idYes;
     If Table.State = dsBrowse Then Exit;
     Send:=Tobject.Create;
     Result:=MessageDlg(SaveConfirm,mtConfirmation,mbYesNoCancel,0);
     Case  Result Of
      mrCancel : Exit;
      mrYes    : YesProc(Send);
      mrno     : NoProc(Send);
     End;
     Send.Free;
end;

Function Net_Check_State(hYesNo:Boolean;YesProc,NoProc:TNotifyEvent):Integer;
Var
Send:TObject;
begin
     Result:=idYes;
     Send:=Tobject.Create;
     If hYesNo Then  Result:=MessageDlg(SaveConfirm,mtConfirmation,mbYesNoCancel,0);
     If Result = mrCancel Then Exit;
     If Result = mrYes Then YesProc(Send)    Else  NoProc(Send);
     Send.Free;
end;

Procedure CancelOnExit(Table:TTable);
Var
I:Integer;
begin
     If Table.State In [dsEdit,dsInsert] Then Table.Post;
     If Table.MasterSource.DataSet.State In [dsEdit,dsInsert] Then
       If Table.RecordCount = 0 Then Table.MasterSource.DataSet.Delete Else//Cancel
       Begin
         For I:=1 To Table.RecordCount Do Table.Delete;
          Table.MasterSource.DataSet.Delete;//Cancel
       End;
end;

Procedure CancelFactor(Table1,Table2:TTable);
Var
I:Integer;
begin
     If Table2.Active = False Then Exit; //»⁄·  »” ‰ Ãœ«Ê· «÷«›Â ‘œ.
     Table2.Cancel;
     //If Not Table2.Filtered Then Exit; becasu of masterSource
     If Table2.RecordCount > 0 Then
         For I:=1 To Table2.RecordCount Do Table2.Delete;
     Table1.Delete;
     Table2.Refresh;
     Table1.Refresh;
end;

Procedure IntF_Limit(IntF:TIntegerField;Lable:String;Min,Max:Integer);
begin
     If IntF.DisplayLabel = Lable Then
     Begin
        IntF.MinValue :=Min;
        IntF.MaxValue :=Max;
     End;
end;

Procedure Limit_Use(Field:String;Min,Max:Integer);
Var
I:Integer;
IntF:TIntegerField;
begin
     For I:=0 To Frodm.ComponentCount-1 Do
      If Frodm.Components[I] Is TIntegerField Then
      Begin
        IntF:=Frodm.Components[I] As TIntegerField;
        IntF_Limit(IntF,Field,Min,Max);
      End;
End;

Procedure SetSQLDatabase(DbAlias:String;Var QDb:TQDbParam);
Var
CQu:TQuery;
begin
     CQu:=TQuery.Create(Application);
     CQu.DatabaseName:=RDir;
     CQu.SQL.Add('Select P."DbName",P."Server",P."User",P."Pass" From ParAcc P Where P."FName"=:a ');
     CQu.Params[0].AsString:=DbAlias;
     CQu.Open;
     QDb.Ident:=DbAlias;
     QDb.DbName:=CQu.Fields[0].AsString;
     QDb.Server:=CQu.Fields[1].AsString;
     QDb.User:=CQu.Fields[2].AsString;
     QDb.PassWord:=CQu.Fields[3].AsString;
     CQu.Close;
     CQu.Destroy;
end;

//Procedure For UpDating Data Moudule
Procedure Setup_DataBase(DBName:String);
Var
Db:TDataBase;
Table:TTable;
I:Integer;
begin
     Screen.Cursor :=crHourGlass;
     SetSQLDatabase(DBName,QDB);
     Db:=Frodm.Components[273] As TDataBase;
     Db.Close;
     CurrDataBase:=CurrDb;
     CurrDb:=Frodm.DB1.DatabaseName;



     Qu:=TQuery.Create(Application);
     Qu.DataBaseName:=CurrDb;
     Qu.SQL.Clear;
     //Qu.DataBaseName:=CurrDb;
     //Qu.BeforeOpen:=Main.QBeforeOpen;
     Qu.SQL.Clear;
//---------------------------
     If Session.IsAlias(DBName) Then
     Begin
      Db.AliasName :=DBName;
      Db.DatabaseName :=DBName;
     End Else Begin
      FroDM.DB1.Connected:=False;
      FroDM.DB1.Params.Clear;
      FroDM.DB1.Params.Add('NET PROTOCOL=TNS');
      FroDM.DB1.Params.Add('OPEN MODE=READ/WRITE');
      FroDM.DB1.Params.Add('SQLPASSTHRU MODE=SHARED AUTOCOMMIT');
      FroDM.DB1.Params.Add('SCHEMA CACHE TIME=-1');
      FroDM.DB1.Params.Add('SCHEMA CACHE SIZE=8');
      FroDM.DB1.Params.Add('TDS PACKET SIZE= 8192');
      FroDM.DB1.Params.Add('SQLQRYMODE=SERVER');//
      FroDM.DB1.Params.Add('ENABLE BCD=FALSE');
      FroDM.DB1.Params.Add('OBJECT MODE=TRUE');
      FroDM.DB1.Params.Add('SERVER NAME='+QDb.Server);// GetCorOwner(DBName));// compaq');
      FroDM.DB1.Params.Add('DATABASE NAME='+QDb.DbName);// DbName);
      FroDM.DB1.Params.Add('USER NAME='+QDb.User);// GetCorUser(DBName));//Ramtin');
      FroDM.DB1.Params.Add('PASSWORD='+QDb.PassWord);// GetCorPass(DBName));//rty4381');
      Try
       FroDM.DB1.Connected:=True;
      Except On E:EDBEngineError Do
          Begin
           ShowMessage(E.Message);
           SetDefaultDb;
          End;
      End;
     End;
//---------------------------
     For I:=0 To Length(mTable)-1 Do (Frodm.Components[mTable[I]] As TTable).Open;
//     For I:=0 To Length(cTable)-1 Do (Frodm.Components[cTable[I]] As TTable).Close;
     Screen.Cursor :=crDefault;


     Fill_Cond(Frodm.AcKod,'Nam',CCond,AcList);
      Fill_Cond(Frodm.Good,'Nam','Flock=0',Kala);
     Fill_Comb(Frodm.Costc,'Nam',CostList);
     Fill_Comb(Frodm.CTip,'Name',CurrList);
     Fill_Rate;
     StDate:=Beg_Date;
     EnDate:=End_Date;
end;

Procedure Restructure (Table:TTable;Pswd:String);
Var
Props :CURProps;
hDb :hDBIDB;
TableDesc :CRTblDesc;
begin
     If Pswd = '' Then Exit;
     Table.Close;
     Table.Exclusive:=True;
     Table.Open;
     Check(DbiGetCursorProps(Table.Handle,Props));
     If (Props.szTableType = szPARADOX) Then begin
      FillChar(TableDesc,SizeOf(TableDesc),0);
      Check(DbiGetObjFromObj(hDBIObj(Table.Handle),objDATABASE,hDBIObj(hDb)));
      StrPCopy(TableDesc.szTblName,Table.TableName);
      StrPCopy(TableDesc.szTblType,Props.szTableType);
      StrPcopy(TableDesc.szPassword,Pswd);
      TableDesc.bProtected:=True;
      TableDesc.bPack:=True;
      Table.Close;
      If Table.TableName ='Users' Then FileSetAttr(CurrPath+'\'+Table.TableName,faArchive);
      Check(DbiDoRestructure(hDb,1,@TableDesc,nil,nil,nil,True));
     End;
     Table.Exclusive:=False;
     Table.Open;
     If Table.TableName ='Users' Then FileSetAttr(CurrPath+'\'+Table.TableName,faHidden or faSysFile);
end;

{Procedure QuickCloseOpen(Const hTable:Array Of Integer);
Var
I,Max:Integer;
begin
     Max:=Length(hTable);
     For I:=0 To Max-1 Do (Frodm.Components[hTable[i]] As TTable).Refresh;
//     If sNet = 1 Then Exit;
     Screen.Cursor :=crHourGlass;
     For I:=0 To Max-1 Do (Frodm.Components[hTable[i]] As TTable).Close;
     For I:=0 To Max-1 Do (Frodm.Components[hTable[i]] As TTable).Open;
     Screen.Cursor :=crDefault;
end;}

Procedure QuickCloseOpen(Const ihT:Array Of Integer);
Var
I,Max:Integer;
begin
     Screen.Cursor :=crHourGlass;
     Max:=Length(ihT);
//     For I:=0 To Max-1 Do (Frodm.Components[hTable[ihT[i]]] As TTable).Refresh;
     For I:=0 To Max-1 Do (Frodm.Components[hTable[ihT[i]]] As TTable).Close;
     For I:=0 To Max-1 Do (Frodm.Components[hTable[ihT[i]]] As TTable).Open;
     Screen.Cursor :=crDefault;
end;

Procedure QuickRefresh(Const hTable:Array Of Integer);
Var
I,Max:Integer;
begin
     Max:=Length(hTable);
     If sNet Then
      For I:=0 To Max-1 Do
       If (Frodm.Components[hTable[i]] As TTable).State = dsBrowse Then
       If Not (Frodm.Components[hTable[i]] As TTable).CachedUpdates Then
       (Frodm.Components[hTable[i]] As TTable).Refresh;
end;

Function GetOpenTable(Table:TTable):Word;
Var
Props :CurProps;
begin
     Check(dbiGetCursorProps(Table.Handle,Props));
     check(DbiGetTableOpenCount(Table.DBHandle,PChar(Table.TableName),
          Props.szTableType,Result));
     If Result > 1 Then
      If Table.Tag <> 0 Then Result:=1;
end;


Function IfInEditing:Boolean;
Var
I,Max:Integer;
begin
     Result:=False;
     Max:=Length(hTable);
     For I:=0 To Max-1 Do
     Begin
      Result:=(Frodm.Components[hTable[i]] As TTable).State In [dsEdit,dsInsert];
      If Result Then Exit;
     End;
end;

Function Enteranced:Boolean;
var
fUs:TFUserName;
begin
 fUs:=TFUserName.Create(Application);
 Result:=False;
 With fUs Do
  Try
   BorderStyle:=bsSingle;
   FormStyle:=fsNormal;
   Visible:=False;
   ShowModal;
  Finally
   Result:=True;
   Free;
  End;
end;

Function Passage:Boolean;
Var
FPS:TFPassing;
Mini2:TTiny;
Def,St:String;
Reg:Tregistry;
Value:TregDataInfo;
begin
     Result:=False;
     FPS:=TFPassing.Create(Application);
     With FPS Do
     Try
      FormStyle:=fsNormal;
      Top:=Top+150;
      Visible:=False;
      BorderStyle:=bsSingle;
      Label1.Caption:=CCrypt('IxvwQaP5E6LvzINX');
      Label4.Caption:=CCrypt('ens1h9CS++GvCP4y24HwQ5se+FglyVQm4HAYZnS6WapusulxSRF9pw==');
      Label8.Caption:=CCrypt('Z/Un6+PzwfiFxCnQ9Q==');
//-------------
        Reg:=Tregistry.Create;
        If FileExists('Par001.Rgs')Then  RegKeyImport(HKEY_CURRENT_USER,'Par001.Rgs');
        Reg.OpenKey('SoftWare\Hadieh Rayaneh\MParFro',False);
        Server:=Reg.ReadString('Server');
        Reg.GetDataInfo('',Value);
        If (Value.RegData=rdString)and(Value.DataSize>0) Then
         Initiiates:=CCrypt(Reg.ReadString(''))
        Else
         Initiiates:='';//CCrypt('WzSqfQMV');
        Reg.Destroy;
//---------------
      ShowModal;
      Case ModalResult Of
      mrOK:
      Begin
       Try
        Mini2:=TTiny.Create(Application);
       Except On EOleSysError Do
       Begin
        WinExec(PChar('Regsvr32 Tiny.ocx /s'),0);
        Halt;
       End;
       End;
       If Server <> '' Then
       Begin
        Mini2.ServerIP:=Server;
        Mini2.NetWorkINIT:=True
       End Else
        Mini2.Initialize:=True;
       Mini2.UserPassword :=Ccrypt('2muVmVrFZvFm+kO3p7IV5V/z3yif7vo5Pb11lBSBYg==');
       Mini2.ShowTinyInfo:=Not (Mini2.TinyErrCode in [1,2,3]);
       USB:=Mini2.TinyErrCode=0;
       St:=Mini2.DataPartition;
       Def:=Copy(St,38,8);
       Session.OnPassword:=Main.Choose;
       Session.AddPassword(Def);
       Session.AddPassword(Copy(St,23,15));
       Result:=(Def=Edit1.Text)and(Mini2.ShowTinyInfo);
       Mini2.Initialize:=False;
       Mini2.Destroy;
     End;
     mrCancel: Halt;
      End;
     Finally
      Free;
     End;
end;

Function ChangeMPass:Boolean;
Var
FPS:TFPassing;
Mini2:TTiny;
Def,StE:String;
Reg:TRegistry;
CM:TCipherManager;
begin
     Result:=False;
     FPS:=TFPassing.Create(Application);
     With FPS Do
     Try
      FormStyle:=fsNormal;
      Visible:=False;
      BorderStyle:=bsSingle;
      Edit1.PasswordChar:=#0;
      OkButton.Caption:=' €ÌÌ— —„“  Ê—ÊœÌ';
      ShowModal;
      Case ModalResult Of
      mrOK:
      Begin
       Mini2:=TTiny.Create(Application);
       If Server <> '' Then
       Begin
        Mini2.ServerIP:=Server;
        Mini2.NetWorkINIT:=True
       End Else
        Mini2.Initialize:=True;
       Mini2.UserPassword :=Ccrypt('2muVmVrFZvFm+kO3p7IV5V/z3yif7vo5Pb11lBSBYg==');
       Mini2.ShowTinyInfo:=Not (Mini2.TinyErrCode in [1,2,3]);
       StE:=Edit1.Text;
       Def:=Copy(Mini2.DataPartition,1,37)+StE;
       Mini2.DataPartition:=Def;
//-------------
       Reg:=Tregistry.Create;
       Reg.OpenKey('SoftWare\Hadieh Rayaneh\MParFro',False);
       CM:= TCipherManager.Create(Application);
       CM.Algorithm:='Blowfish';
       CM.Description:='448bit Key';
       CM.InitKey('Key',nil);
       Reg.WriteString('',CM.EncodeString(StE));
       Reg.Destroy;
       CM.Destroy;
//---------------
       Result:=Mini2.ShowTinyInfo;//(Def=Edit1.Text)and
       Mini2.Initialize:=False;
       Mini2.Destroy;
      End;
      mrCancel: Close;
      End;
     Finally
      Free;
     End;
end;

Procedure UserList(List:TStringList);
Var
TmpCursor:hDbiCur;
rslt:DbiResult;
UsrDesc:USERDesc;
begin
     Check(DbiOpenUserList(TmpCursor));
     Repeat
      rslt:=DbiGetNextRecord(TmpCursor,dbiNoLock,@UsrDesc,nil);
      If (rslt <> DBIERR_EOF) Then
      Begin
       List.Add('User name : '+UsrDesc.szUserName);
       List.Add('Net Session :'+IntToStr(UsrDesc.iNetSession));
       List.Add('Product Class: '+IntToStr(UsrDesc.iProductClass));
       List.Add('Serial Number:'+UsrDesc.szSerialNum);
      End;
     Until (rslt <> DBIERR_NONE);
     Check(DbiCloseCursor(TmpCursor));
end;

Function UserCount:Integer;
Var
TmpCursor:hDbiCur;
rslt:DbiResult;
UsrDesc:USERDesc;
begin
     Result:=0;
     Check(DbiOpenUserList(TmpCursor));
     Repeat
      rslt:=DbiGetNextRecord(TmpCursor,dbiNoLock,@UsrDesc,nil);
      If (rslt <> DBIERR_EOF) Then Result:=Result+1;
     Until (rslt <> DBIERR_NONE);
     Check(DbiCloseCursor(TmpCursor));
end;

Function SortTable (SrcTbl:TTable;SortField:TField):Longint;
Var
Field:Word;
CaseIns:Boolean;
Recs:Longint;
Props :CURProps;
TableDesc :CRTblDesc;
h:hdbiCur;
hDb:hDbiDb;
begin
     h:=SrcTbl.Handle;
     hDb:=SrcTbl.DBHandle;
     Check(DbiGetCursorProps(h,Props));
     FillChar(TableDesc,SizeOf(TableDesc),0);
     StrPCopy(TableDesc.szTblName,SrcTbl.TableName);
     StrPCopy(TableDesc.szTblType,Props.szTableType);

     Recs:=SrcTbl.RecordCount;
     CaseIns:=True;
     Field:=SortField.Index+1;
     SrcTbl.Close;
     Check(DbiSortTable(hDb,@TableDesc.szTblName,@TableDesc.szTblType,nil,nil,nil,nil,
     1,@Field,@CaseIns,nil,nil,False,nil,Recs));
     Result:=Recs;
     SrcTbl.Open;
end;

//Procedure For openning the table with farsi error message
Function OpenTable(Table:TTable): Boolean;
Var
iDBIError:Integer;
TbCnt:Integer;
begin
     Result:=True;
     TbCnt:=0;
     Try
      Table.Open;//Active := True;
      TbCnt:=GetOpenTable(Table);
     Except
      On E:EdbEngineError Do
      Begin
        Result:=False;
        iDBIError := (E as EDBEngineError).Errors[0].Errorcode;
        Case iDbiError Of
        11011,10018:
        Begin
          Application.MessageBox('„”Ì— ›«Ì· „ÊÃÊœ ‰Ì” ',   'Â‘œ«—',MB_Ok);
          Result:=SetDbPath(CurrDataBase);
          CurrDb:=CurrDataBase;
        End;
        11012: Application.MessageBox('›«Ì· »«“ “Ì«œ «” ', 'Â‘œ«—',MB_Ok);
        9490 : Application.MessageBox('—„“ ÃœÊ· »Ì‘ «“ Õœ «” ','Â‘œ«—',MB_Ok);

        10024:
        If MessageDlg('›«Ì· '+Table.TableName+'„ÊÃÊœ ‰Ì” .«“Å‘ Ì»«‰Ì —Ê“«‰Â «” ›«œÂ ‘Êœø',
        mtConfirmation,mbYesNo,0)=idYes Then
        Begin
         Risk:=True;
         Result:=False;
         CreatingForm(TFRestore,'FRestore',FRestore);
        End;
        8961,8962:
        Try
         Table.Close;
         //Main.Reindex(Application);
         Result:=True;
         Table.Open;
         Except
         On E:EdbEngineError Do
          If MessageDlg('¬”Ì» œÌœÂ «” .»«“”«“Ì ê—œœø '+Table.TableName,
          mtConfirmation,mbYesNo,0)=idYes Then
          Begin
           Risk:=False;//True;
           Result:=False;
           CheckAndRepairTables(CurrPath,False,rsCorrupted,False,//rsAll
           Nil,Nil,Table.TableName,Rbld1.SelectDBPath,Copy(Main.UMini.DataPartition,23,15));
           Table.Open;
          End;
        End;
        8963..8969,12034:
        Begin
         Result:=True;
         If Risk Then Exit;
         //Main.Reindex(Application);
        End;
        10014: Application.MessageBox('Å«Ìê«Â œ«œÂ ‰«„‘Œ’ «” ','Â‘œ«—',MB_Ok);
//        10018: Application.MessageBox('œ«Ì—ﬂ Ê—Ì €Ì—ﬁ«»· ﬁ»Ê· «” ','Â‘œ«—',MB_Ok);
        10025: Application.MessageBox(' ⁄œ«œ «” ›«œÂ ﬂ‰‰œê«‰ ÃœÊ· “Ì«œ«” ','Â‘œ«—',MB_Ok);
        9483 : Application.MessageBox('Ãœ«Ê· »«“ “Ì«œ «” ','Â‘œ«—',MB_Ok);
        10241: Application.MessageBox('ÃœÊ· ﬁ›· «” ','Â‘œ«—',MB_Ok);
        10243: Application.MessageBox('ÃœÊ· „‘€Ê· «” ','Â‘œ«—',MB_Ok);
        10245: Application.MessageBox('›«Ì·  Õ  «Œ Ì«— ‰Ì” ','Â‘œ«—',MB_Ok);
        End;
      End;
     End;
{     If TbCnt > 1 Then
     Begin
      ShowMessage(Table.TableName);
      ShowMessage('⁄œ„ «„ﬂ«‰ Ê—Êœ »Â ”Ì” „');
      Halt;
     End;}
end;

Function SetDbPath(DbName:String):Boolean;
Var
Path:String;
Table:TTable;
begin
     Result:=SelectDirectory ( '«‰ Œ«» „”Ì— ‰êÂœ«—Ì «ÿ·«⁄« ','',Path);
     If Result Then
     Begin
      Table:=TTable.Create(Application);
      Table.DatabaseName:=RDir;
      Table.TableName:='ParAcc.Db';
      Table.Open;
      If Table.Locate('FName',DbName,[loCaseInsensitive]) Then
      Begin
       Table.Edit;
       Table.FieldByName('DbName').AsString:=Path;
       Table.Post;
      End;
      Table.Close;
      Table.Free;
      CurrPath:=Path;
      SetUp_Database(DbName);
     End;

end;

Function CheckDbs:Boolean;
Var
Crop:TFCorp;
DCnt,RCnt,Code,I:Integer;
Mini2:TTiny;
begin
     Result:=True;
     Case USB Of
     False:
     Begin
{      Dbs:=ThardLock.create(Application);
      Dbs.LockClass:=Version4_Class_A;
      Dbs.Check_System_File:=False;
      Dbs.PortNo:=1;
      Dbs.Password :=Encrypt('@F`Wì:;WìMT`',132);
      Dbs.Connected :=True;
      Lck :=Dbs.ErrorCode In [errLockNotFound,errLockNotConnected,errMissingPassWord];
      If  Lck Then
       DCnt:=1
      Else
       DCnt:=StrToIntDef(Copy(Dbs.DataPartition,21,2),0);
      Dbs.Connected:=False;
      Dbs.Destroy; }
     End;
     True:
     Begin
      Mini2:=TTiny.Create(Application);
      If Server <> '' Then
      Begin
       Mini2.ServerIP:=Server;
       Mini2.NetWorkINIT:=True
      End Else
       Mini2.Initialize:=True;

      Mini2.UserPassword :=Ccrypt('2muVmVrFZvFm+kO3p7IV5V/z3yif7vo5Pb11lBSBYg==');
      Mini2.ShowTinyInfo:=Not (Mini2.TinyErrCode in [1,2,3,5]);
      Lck:=Mini2.TinyErrCode in [1,2,3,5];
      USB:=Mini2.TinyErrCode=0;
      If Not LCK Then
      Begin
       Code:=0;
       For I:=1 To Length(Mini2.SpecialID) Do Code:=Code+Ord(Mini2.SpecialID[I]);
       Lck :=(Code <> 1323)OR(Ccrypt(Mini2.SpecialID) <> 'w≤‰ÑÖëı†bÍ');
      End;
      If Lck Then
       DCnt:=1
      Else
       DCnt:=StrToIntDef(Copy(Mini2.DataPartition,21,2),0);
      Mini2.ShowTinyInfo:=False;
      Mini2.Destroy;
     End;
     End;
     Crop:=TFCorp.Create(Application);
     With Crop Do
     Begin
      Visible:=False;
      Caption:='«‰ Œ«» ”«· „«·Ì';
      T1.DatabaseName:=RDir;
      T1.Open;
      OnDestroy:=Nil;
      OnClose:=FormClose;
      OnCreate:=FormCreate;
      Lim:=DCnt;
      Case ShowModal OF
       mrCancel:
       Begin
        RCnt:=T1.RecordCount;
        If RCnt = 0 Then
        Begin
         ShowMessage('Õœ«ﬁ· Ìò ”«· „«·Ì »«Ìœ „⁄—›Ì ê—œœ');
         Halt;//Application.Terminate;
        End;
        If (DefaultDb = '')Or (RCnt = 1) Then
        Begin
         DefaultDb:=T1FName.AsString;
         DefaultPath:=T1DbName.AsString;
         LastUser:=T1Server.AsString;
         CurrDb:=DefaultDb;
         CurrPath:=DefaultPath;
         FEnviro.FormDestroy(Owner);
         FormDestroy(Owner);
         Setup_DataBase(CurrDb);
         Main.Sb1.Panels[5].Text :=DefaultPath;
         Main.Sb1.Panels[4].Text :=DefaultDb;
        End;
       End;
      End;
     End;
end;

Function DefaultsCheck:Boolean;
begin
     IF (Fill_Corps.Count = 0)Then
      Result:=CheckDbs
     Else
      Result:=False;
end;

Function SetDefaultDb:Boolean;
Var
Crop:TFCorp;
begin
     Crop:=TFCorp.Create(Application);
     With Crop Do
     Begin
      Visible:=False;
      Caption:=' ⁄ÌÌ‰ ”«· „«·Ì ÅÌ‘ ›—÷';
      OnDestroy:=Nil;
      T1.DatabaseName:=RDir;
      T1.Open;
      OnClose:=FormClose;
      OnCreate:=FormCreate;
      Lim:=Count;
      Case ShowModal OF
       mrCancel,mrOK:
       Begin
        Count:=T1.RecordCount;
        If Count = 0 Then
        Begin
         ShowMessage('Õœ«ﬁ· Ìò ”«· „«·Ì »«Ìœ „⁄—›Ì ê—œœ');
         Halt;
        End;
//        If (DefaultDb = '')Or (Count = 1)Or Risk Then
//        Begin
         DefaultDb:=T1FName.AsString;
         DefaultPath:=T1DbName.AsString;
         LastUser:=T1Server.AsString;
         CurrDb:=DefaultDb;
         CurrPath:=DefaultPath;
         FEnviro.FormDestroy(Owner);
         Setup_DataBase(CurrDb);
         Result:=True;
         Main.Sb1.Panels[5].Text :=DefaultPath;
         Main.Sb1.Panels[4].Text :=DefaultDb;
//        End;
       End;
      End;
     End;
end;

Function Fill_Corps:TStringList;
Var
I:Integer;
CQu:TQuery;
List:TStringList;
begin
     Screen.Cursor:=crHourGlass;
     List:=TStringList.Create;
     CQu:=TQuery.Create(Application);
     CQu.DatabaseName:=RDir;
     CQu.SQL.Add('Select FName From ParAcc ');
     CQu.Open;
     For I:=1 To CQu.RecordCount Do
     Begin
      List.Add(CQu.Fields[0].AsString);
      CQu.Next;
     End;
     CQu.Close;
     CQu.Free;
     Result:=List;
     Screen.Cursor:=crDefault;
end;

Function GetCorPath(Name:String):String;
Var
CQu:TQuery;
begin
     CQu:=TQuery.Create(Application);
     CQu.DatabaseName:=RDir;
     CQu.SQL.Add('Select DbName From ParAcc Where FName=:f');
     CQu.Params[0].Value:=Name;
     CQu.Open;
     Result:=CQu.Fields[0].AsString;
     If CQu.RecordCount = 0 Then Result:='';//RDir+'\Db';
     CQu.Close;
     CQu.Free;
end;

Function GetDbName(sPath:String):String;
Var
CQu:TQuery;
begin
     CQu:=TQuery.Create(Application);
     CQu.DatabaseName:=RDir;
     CQu.SQL.Add('Select FName From ParAcc Where DbName=:f');
     CQu.Params[0].Value:=sPath;
     CQu.Open;
     Result:=CQu.Fields[0].AsString;
     If CQu.RecordCount = 0 Then Result:='';//RDir+'\Db';
     CQu.Close;
     CQu.Free;
end;

Function GetCorOwner(Name:String):String;
Var
CQu:TQuery;
begin
     CQu:=TQuery.Create(Application);
     CQu.DatabaseName:=RDir;
     CQu.SQL.Add('Select Owner From ParAcc Where FName=:f');
     CQu.Params[0].Value:=Name;
     CQu.Open;
     Result:=CQu.Fields[0].AsString;
     If CQu.RecordCount = 0 Then Result:='';//RDir+'\Db';
     CQu.Close;
     CQu.Free;
end;

Function GetCorUser(Name:String):String;(*UserName*)
Var
CQu:TQuery;
begin
     CQu:=TQuery.Create(Application);
     CQu.DatabaseName:=RDir;
     CQu.SQL.Add('Select P.User From ParAcc P Where FName=:f');
     CQu.Params[0].Value:=Name;
     CQu.Open;
     Result:=CQu.Fields[0].AsString;
     If CQu.RecordCount = 0 Then Result:='';
     CQu.Close;
     CQu.Free;
end;

Function GetCorPass(Name:String):String;(*Password*)
Var
CQu:TQuery;
begin
     CQu:=TQuery.Create(Application);
     CQu.DatabaseName:=RDir;
     CQu.SQL.Add('Select Pass From ParAcc Where FName=:f');
     CQu.Params[0].Value:=Name;
     CQu.Open;
     Result:=CQu.Fields[0].AsString;
     If CQu.RecordCount = 0 Then Result:='';
     CQu.Close;
     CQu.Free;
end;

Function GetComputerName:String;
Var
Reg:TRegistry;
begin
     Reg:=TRegistry.Create;
     Reg.RootKey:=HKEY_LOCAL_MACHINE;
     Reg.OpenKey('\SYSTEM\CurrentControlSet\Control\ComputerName\ActiveComputerName',False);
     Result:=Reg.ReadString('ComputerName');
     Reg.Free;
end;

Function IsServer:Boolean;
begin
     Result:=(Server=GetComputerName)or(Server='');
end;

Procedure SetToBack;
begin
     DeleteFile(RDir+'\ParAcc.Db');
     DeleteFile(RDir+'\ParAcc.Bak');
end;

Function DbSize:LongInt;//(Db:TDataBase)
Var
I:Integer;
Db:TDataBase;
begin
     Result:=0;
     If Risk Then Exit;
     Db:=Frodm.Invo.Database;
     For I:=0 To Db.DataSetCount-1 Do
      Result:=Result+Db.DataSets[i].RecordCount * Db.DataSets[I].RecordSize;
     Result :=Result Div 1024;
end;

Function ManageEngine :Boolean;
Var
Reg:TRegistry;
Buf,Size,Req:LongInt;
Ms:TMemoryStatus;
begin
     Result:=False;
     Size:=DbSize;//(Db); //Kilo
     GlobalMEMORYSTATUS(MS);
     Reg:=Tregistry.Create;
     Try
      Reg.RootKey:=HKEY_LOCAL_MACHINE;
      Reg.OpenKey('\Software\Borland\Database Engine\Settings\SYSTEM\INIT',False);
      Buf:=StrToInt(Reg.ReadString('MAXBUFSIZE'));
      If Buf < Size Then
      Begin
       Req:=(Size Div 128)*128;//Kilo
       If Req<(Ms.dwAvailPhys Div 1024)-10240  Then
       Begin
        Reg.WriteString('MAXBUFSIZE',IntToStr(Req+Buf));
        Reg.WriteString('SHAREDMEMSIZE',IntToStr(Req+Buf));
        Result:=True;
       End Else
       Begin
        Req:=(((Ms.dwAvailPhys Div 1024)-10240)Div 128)*128;
        Reg.WriteString('MAXBUFSIZE',IntToStr(Req+Buf));
        Reg.WriteString('SHAREDMEMSIZE',IntToStr(Req+Buf));
        ShowMessage('„Ì“«‰ RAM ò«„ÅÌÊ — ò«›Ì ‰„Ì»«‘œ Ê »«Ìœ «›“«Ì‘ Ì«»œ.');
        Result:=False;
       End;
      End;
     Finally
     Reg.Free;
     End;
end;

Function RegKeyExport(Root:HKEY;Key,FileName:String):Boolean;
Var
F:TextFile;
Reg:TRegistry;
VList:TStringList;
I:Integer;
st:String;
CM: TCipherManager;
begin
     Reg:=TRegistry.Create;
     CM:= TCipherManager.Create(Application.Owner);
     CM.Algorithm:='Blowfish';
     CM.Description:='448bit Key';
     CM.InitKey('Key',nil);
     VList:=TStringList.Create;
     Reg.RootKey:=Root;
     Reg.OpenKey(Key,False);
     AssignFile(F,FileName);
     IF Not FileExists(FileName) Then ReWrite(F) Else Append(F);
     FileSetAttr(FileName,faHidden or faSysFile);
     St:='['+Reg.CurrentPath+']';
     St:=CM.EncodeString(St);
     WriteLN(F,St);
     Reg.GetValueNames(VList);
     For I:=0 To VList.Count-1 Do
     Begin
      Case Reg.GetDataType(VList.Strings[i]) OF
      rdString:
       St:='"'+VList.Strings[i]+'"="'+Reg.ReadString(VList.Strings[i])+'"';
      rdInteger:
       St:='"'+VList.Strings[i]+'"=dword:'+IntToStr(Reg.ReadInteger(VList.Strings[i]));
      End;
      St:=CM.EncodeString(St);
      WriteLN(F,St);
     End;
     Close(F);
     CM.Free;
     Reg.Free;
End;

Function RegKeyImport(Root:HKEY;FileName:String):Boolean;
Var
F:TextFile;
Reg:TRegistry;
iVal,I:Integer;
st,sKey,sVal:String;
CM: TCipherManager;
begin
     Reg:=TRegistry.Create;
     CM:= TCipherManager.Create(Application.Owner);
     CM.Algorithm:='Blowfish';
     CM.Description:='448bit Key';
     CM.InitKey('Key',nil);
     AssignFile(F,FileName);
     Reset(F);
     Readln(F,St);
     St:=CM.DecodeString(St);
     If Pos('[',St)=1  Then sKey:=Copy(St,2,Length(St)-2);
     Reg.RootKey:=Root;
     Reg.OpenKey(sKey,True);
     While Not EOf(F) Do
     Begin
      ReadLn(F,St);
      St:=CM.DecodeString(St);
      If Pos('[',St)=1 Then
      Begin
       sKey:=Copy(St,2,Length(St)-2);
       Reg.CloseKey;
       Reg.OpenKey(sKey,True);
      End Else
      Begin
       SKey:=Copy(St,2,Pos('"=',St)-2); //Pos('"',St)+1
       If Pos('"=dword:',St)> 0 Then
       Begin
        iVal:=StrToInt(Copy(St,Pos('"=dword:',St)+8,Length(St)));
        Reg.WriteInteger(sKey,iVal);
       End Else
       Begin
        I:=Pos('"="',St)+3;
        sVal:=Copy(St,I,Length(St)-I);
        Reg.WriteString(sKey,sVal);
       End;
      End;
     End;
     Close(f);
     Result:=True;
     CM.Free;
     Reg.Free;
end;

Function RegRootExport(Root:HKEY;RootKey,FileName:String):Boolean;
Var
Reg:TRegistry;
List1,List2:TStringList;
I,J,M,N:Integer;
L:Integer;
stSub :Array[1..300] Of String;
Label
L1,L2;
begin
     Reg:=TRegistry.Create;
     List1:=TStringList.Create;
     List2:=TStringList.Create;
     Reg.RootKey:=Root;//HKEY_LOCAL_MACHINE;
     Reg.Openkey(RootKey,False);
     List2.Add(RootKey);
     If Reg.HasSubKeys Then Reg.GetKeyNames(List1);
     J:=0;
     For I:=0 To List1.Count-1 Do
     Begin
      List1.Strings[i]:=Reg.CurrentPath+'\'+List1.Strings[i];
      List2.Add(List1.Strings[i]);
      J:=J+1;
      stSub[J]:=List1.Strings[i];
     End;
     N:=0;
     L1:
     M:=N+1;
     For I:=M To J Do
     Begin
      N:=I;
      Reg.CloseKey;
      Reg.OpenKey(StSub[I],False);
      If Reg.HasSubKeys Then
      Begin
       Reg.GetKeyNames(List1);
       For L:=0 To List1.Count-1 Do
       Begin
        List1.Strings[L]:=Reg.CurrentPath+'\'+List1.Strings[L];
        List2.Add(List1.Strings[L]);
        J:=J+1;
        stSub[J]:=List1.Strings[L];
       End;
      End;
     End;
     If (N <> j)  Then Goto L1;
L2:
     List2.Sort;
     For I:=0 To List2.Count-1 Do
      RegKeyExport(Root,List2.Strings[i],FileName);
end;

Function MakeKol(KolNam:String):Boolean;
Var
Kod:Integer;
begin
     Result:=False;
     KolNam:=Trim(KolNam);
     If KolNam = '' Then Exit;
     Frodm.AcKod.IndexFieldNames:='Acckod';
     Frodm.AcKod.Last;
     Kod:=Frodm.AcKodKgp.Value;
     Frodm.AcKod.Append;
     Frodm.AcKodKgp.Value :=Kod+1;
     Frodm.AcKodKgro.Value :=0;
     Frodm.AcKodKkol.Value :=0;
     Frodm.AcKodKmo.Value :=0;
     Frodm.AcKodKtaf.Value :=0;
     Frodm.AcKodUseKod.Value :=0;
     Frodm.AcKodNam.Value:=KolNam;
     Frodm.AcKodAccKod.Value :=(Kod+1)*1E12;
     Frodm.AcKodPerm.Value :=False;
     Frodm.AcKodBarzi.Value:=False;
     If MessageDlg('„«ÂÌ  Õ”«» »œÂﬂ«— «” ø',mtConfirmation,mbYesNo,0) = mrYes Then
        Frodm.AcKodMah.Value :=1 Else Frodm.AcKodMah.Value :=-1;
     Frodm.AcKod.Post;
     Result:=True;
end;
// Procedure For Automatic Create Accounts
Procedure AccountAppend(AccKod:Real;AccNam:String;UseKod:Short);
Var
S:String;
J:Integer;
begin
     S:=FloatToStr(Int(AccKod));
     Case Length(S) Of
     13: J:=1;
     14: J:=2;
     15: J:=3;
     Else
      J:=0;
     End;
     Frodm.AcKod.Append;
     Frodm.AcKodAcckod.AsFloat :=AccKod;
     Frodm.AcKodNam.Value :=AccNam;
     Frodm.AcKodKgp.Value :=StrToInt(Copy(S,1,J));
     Frodm.AcKodKgro.Value :=StrToInt(Copy(S,J+1,3));
     Frodm.AcKodKkol.Value :=StrToInt(Copy(S,J+4,3));
     Frodm.AcKodKmo.Value :=StrToInt(Copy(S,J+7,3));
     Frodm.AcKodKtaf.Value :=StrToInt(Copy(S,J+10,3));
     Frodm.AcKodPerm.Value :=False;
     Frodm.AcKodUseKod.Value :=UseKod;
     Frodm.AcKodKdas.Value:=0;
     Frodm.AcKodBarzi.Value:=False;
     Frodm.AcKod.Post;
end;

//Function For Finding Account Code Hole
Function AcHole_Find(Field:String;RootKod,Mrate:Real):Integer;
Var
I:Integer;
begin
     Qu.SQL.Clear;
     Qu.SQL.Add('SELECT DISTINCT '+Field);
     Qu.SQL.Add('FROM AccountKod');
     Qu.SQL.Add('WHERE AccKod >= '+FloatToStr(RootKod)+' and AccKod <= '+
                FloatToStr(RootKod+Mrate-1));
     Qu.SQL.Add('Order By '+Field);
     Qu.Open;
     Qu.First;
     Result:=0;
     For I:=1 To Qu.RecordCount Do
     Begin
       If Not(Result = Qu.Fields[0].AsInteger) Then
       Begin
         Qu.Close;
         Exit;
       End;
       Result:=Result+1;
       Qu.Next;
     End;
     Qu.Close;
end;

// Procedure For Creating Account On a RootAccount
Function New_Account_Root(AccNam,RootNam:String;RootCode:Real;UseKod:Short):Real;
var
I,Tip:Integer;
RootKod,Kod,NewKod:Real;
Root:String;
Rate,Mrate,Limit,RootLimit:Real;
Label
   R1;
begin
     I:=0;
     Root:=RootNam;
R1:
     If RootCode = 0 Then  RootKod:=AccKod(Root) Else RootKod:=RootCode;
     Tip:=AccountType(RootKod);
     Case Tip Of
       0:Rate:=1000000000;
       1:Rate:=1000000;
       2:Rate:=1000;
       3:Rate:=1;
       4:Rate:=0;
     Else
       Rate:=0;
     End;
     Case Tip Of
       0:Mrate:=1000000000000;
       1:Mrate:=1000000000;
       2:Mrate:=1000000;
       3:Mrate:=1000;
       4:Mrate:=1;
     Else
       Mrate:=0;
     End;
     Frodm.AcKod.IndexFieldNames :='Acckod';
     Frodm.AcKod.SetRange([RootKod],[RootKod+MRate-1]);
     Frodm.AcKod.Last;
{     Case Tip Of
       0:Limit:=Frodm.AcKodKgro.Value;
       1:Limit:=Frodm.AcKodKkol.Value;
       2:Limit:=Frodm.AcKodKmo.Value;
       3:Limit:=Frodm.AcKodKtaf.Value;
     Else
       Limit:=1000;
     End;}
     Case Tip Of
       0:Limit:=AcHole_Find('Kgro',RootKod,Mrate);
       1:Limit:=AcHole_Find('Kkol',RootKod,Mrate);
       2:Limit:=AcHole_Find('Kmo',RootKod,Mrate);
       3:Limit:=AcHole_Find('Ktaf',RootKod,Mrate);
     Else
       Limit:=1000;
     End;
     Case Tip Of
       1:RootLimit:=Frodm.AcKodKgro.Value;
       2:RootLimit:=Frodm.AcKodKkol.Value;
       3:RootLimit:=Frodm.AcKodKmo.Value;
     Else
       RootLimit:=1000;
     End;

     Kod:=Frodm.AcKodAcckod.Value;
     Frodm.AcKod.CancelRange;
     If Limit < 999 Then
     Begin
//       AccountAppend(RootKod+(Limit+1)*Rate,AccNam,UseKod);
       AccountAppend(RootKod+(Limit)*Rate,AccNam,UseKod);
       Result:=Kod+Rate;
     End   Else
     Begin
{Create New Root Because The Root haven't any place for acount}
       If Tip = 0 Then
       Begin
         ShowMessage('›÷« »—«Ì  ⁄—Ì› Õ”«» „ÊÃÊœ ‰Ì” ');
         Result:=0;
         Exit;
       End;
       I:=I+1;
       Root:=RootNam+IntToStr(I); // KodFound(AccKod(Root))
       If NamFound(Root) Then Goto R1 Else
       Begin
          NewKod:=RootKod-RootLimit*Mrate;
         Repeat
           Kod:=NewKod+RootLimit*Mrate;
           RootLimit:=RootLimit+1;
           If RootLimit > 999 Then
            Begin
               Beep;
               ShowMessage('›÷« »—«Ì  ⁄—Ì› Õ”«» „ÊÃÊœ ‰Ì” ');
               Result:=0;
               Exit;
            End;
         Until Not (KodFound(Kod)) And (RootLimit <= 999 );
         AccountAppend(Kod,Root,0);
         Goto R1;
       End;
     End;

end;

//Function For Check Use of Depot's Names
Function Check_Anb(AnbName:String):Boolean;
begin
     Result:= False;
     Frodm.GCardex.Open;
     Frodm.GCardex.IndexFieldNames :='Anb';
     If Frodm.GCardex.FindKey([AnbName]) Then Result:=True;
     Frodm.GCardex.DefaultIndex :=True;
     Frodm.GCardex.Close;
end;

Function GoodKod(Good:String):Integer;
begin
     Result:=0;
     Frodm.Good.IndexFieldNames:='Nam';
     If Frodm.Good.FindKey([Good]) Then Result:=Frodm.GoodKod.Value;
end;

Function GoodNam(Kod:Integer):String;
begin
     Result:='';
     Frodm.Good.IndexFieldNames:='Kod';
     If Frodm.Good.FindKey([Kod]) Then Result:=Frodm.GoodNam.Value;
end;

Function GoodGene(Kod:Integer):Integer;
begin
     Result:=0;
     Frodm.Good.IndexFieldNames:='Kod';
     If Frodm.Good.FindKey([Kod]) Then Result:=Frodm.GoodGene.Value;
end;
Function GoodSoldPrice(GoodKod:Integer):Currency;
begin
     Result:=0;
     Frodm.Good.IndexFieldNames:='Kod';
     If Frodm.Good.FindKey([GoodKod]) Then Result:=Frodm.GoodPfro.Value;
end;

Function GoodBuyPrice(GoodKod:Integer):Currency;
begin
     Result:=0;
     Frodm.Good.IndexFieldNames:='Kod';
     If Frodm.Good.FindKey([GoodKod]) Then Result:=Frodm.GoodPKh.Value;
end;

Function GoodState(Kod:Integer):Boolean;
begin
     Result:=False;
     Frodm.Good.IndexFieldNames :='Kod';
     If Frodm.Good.FindKey([Kod]) Then Result:=Frodm.GoodFdp.Value;
end;

Function Good_Moj(Good,Color:String):Real;
begin
     Qu.SQL.Clear;
     Qu.SQL.Add('SELECT Sum(Quant)');
     Qu.SQL.Add('FROM Depot');
     If Color = '' Then Qu.SQL.Add('WHERE  Nam = '+#39+Good+#39) Else
        Qu.SQL.Add('WHERE  Nam = '+#39+Good+#39+' and Color='+#39+Color+#39);
     Qu.Active:=True;
     Result:=Qu.Fields[0].AsFloat;
     Qu.Active:=False;
end;

Function Good_Moj_Anb(Good,Color,Anb:String;Shelf:Integer):Real;
Var
Filt:String;
begin
     Filt:='Nam = '+#39+Good+#39;
     If Color > ''Then Filt:=Filt+' and Color='+#39+Color+#39;
     If Anb > ''  Then Filt:=Filt+' and AnbNam='+#39+Anb+#39;
     If Shelf > 0 Then Filt:=Filt+' and AnbKod= '+IntToStr(Shelf);
     If Pos(' and',Filt)= 1 Then Delete(Filt,1,4);
     Qu.SQL.Clear;
     Qu.SQL.Add('SELECT Quant');
     Qu.SQL.Add('FROM Depot');
     Qu.SQL.Add('WHERE  '+Filt);
     Qu.Active:=True;
     Result:=Qu.Fields[0].AsFloat;
     Qu.Active:=False;
end;

Procedure Good_Statue(Table:String;Ds:TDataSource;Good,Color:String;Var Max_p,Min_p,Ave_P
                      :Currency;Var Max_Q,Min_Q:Real);
begin
     Qu.SQL.Clear;
     Qu.SQL.Add('SELECT Max(Pfee),Min(Pfee),Sum(PTotal)/Sum(Quant),Max(Quant),Min(Quant)');
     Qu.SQL.Add('FROM'+' '+Table);
     If Color = '' Then Qu.SQL.Add('WHERE  Nam = '+#39+Good+#39) Else
        Qu.SQL.Add('WHERE  Nam = '+#39+Good+#39+' and Color='+#39+Color+#39);
     Qu.Active:=True;
     Max_p:=Qu.Fields[0].AsCurrency;
     Min_p:=Qu.Fields[1].AsCurrency;
     Ave_p:=Qu.Fields[2].AsCurrency;
     Max_Q:=Qu.Fields[3].AsFloat;
     Min_q:=Qu.Fields[4].AsFloat;
     Qu.Active:=False;
End;

Procedure Good_LastAction(Table:String;Ds:TDataSource;Good,Color:String;Var Last_P:Currency;
                          Var Last_Q:Real);
begin
     Qu.SQL.Clear;
     Qu.SQL.Add('SELECT Dat,Quant,Pfee');
     Qu.SQL.Add('FROM'+' '+Table);
     If Color = '' Then Qu.SQL.Add('WHERE  Nam = '+#39+Good+#39) Else
        Qu.SQL.Add('WHERE  Nam = '+#39+Good+#39+' and Color='+#39+Color+#39);
     Qu.SQL.Add('ORDER BY Dat');
     Qu.Active:=True;
     Last_Q:=Qu.Fields[1].Value;
     Last_P:=Qu.Fields[2].Value;
     Qu.Active:=False;
end;

Function  TeepNam(Kod:String):String;
{Var
TKod:Integer;}
begin
     Result:=Kod;
{     Try
      TKod:=StrToInt(Kod);
     Except
      On EConvertError Do
      Begin
        Result:=Kod;
        Exit;
      End;
     End;
     Frodm.Color.IndexName :='ColorIxId';
     If FRodm.Color.FindKey([TKod]) Then Result:=Frodm.ColorColor.Value Else
     Begin
       Frodm.Color.First;
       Result:=Frodm.ColorColor.Value;
     End;
     Frodm.Color.IndexFieldNames :='Color';}
end;

Function  AnbNam(Anb:String):String;
Var
AnbKod:Integer;
begin
     AnbKod:=StrToInt(Anb);
     If AnbKod = 0 Then
     Begin
     Frodm.AnbDat.Open;
      If Frodm.AnbDat.Locate('Nam',Anb,[loCaseInsensitive]) Then
      Begin
       Result:=Anb;
       Frodm.AnbDat.Close;
       Exit;
      End;
     End;
     Qu.SQL.Clear;
     Qu.SQL.Add('SELECT Nam FROM AnbDat WHERE Kod ='+IntToStr(AnbKod));
     Qu.Open;
     If Qu.RecordCount > 0 Then Result:=Qu.Fields[0].AsString Else
     Begin
       Qu.Close;
       Qu.SQL.Clear;
       Qu.SQL.Add('SELECT Nam,Kod FROM AnbDat ORDER BY Kod ');
       Qu.Open;
       Qu.First;
       Result:=Qu.Fields[0].AsString;
     End;
     Qu.Close;
end;

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
//       If Table.Active Then Table.Next;
     End;
     Gride.SelectedIndex :=I;
end;
//Grid Enter Move
Procedure GridMove(Gride:TdbGrid;Table:TTable;Var Radif:Integer);
Var
I:Integer;
begin
     I:=Gride.SelectedIndex;
     I:=I+1;
     If I < Gride.Columns.Count-1 Then
        While Not Gride.Columns[I].Visible Do I:=I+1;
     If I >= Gride.Columns.Count Then
     Begin
       I:=0;
       If (Table.State = dsInsert) Then Gride.DataSource.DataSet.Append
       Else Gride.DataSource.DataSet.Next;
       If (Gride.DataSource.DataSet.Eof )And Not(Gride.ReadOnly)Then
       Gride.DataSource.DataSet.Append;
     End;
     Gride.SelectedIndex :=I;
     If I= 0 Then Radif:=Radif+1;
end;

Procedure PrintGrid(sGrid:TStringGrid;sTitle:String);
Var
X1,X2:Integer;
Y1,Y2:Integer;
I,F,K:Integer;
TR:TRect;
iWid,Row:Integer;
Label L1;
begin
     Printer.Title:=sTitle;
     Row:=1;
     Printer.BeginDoc;
     L1:
     Printer.Canvas.Pen.Color:=0;
     Printer.Canvas.Font.Name:='Tahoma';
     Printer.Canvas.Font.Size:=12;
     Printer.Canvas.Font.Style:=[fsBold,fsItalic];//UnderLine];
     iWid:=(Printer.PageWidth-Printer.Canvas.TextWidth(sTitle))Div 2;
     Printer.Canvas.TextOut(iWid,100,Printer.Title);
     For F:=1 To SGrid.ColCount-1 Do
     Begin
      X1:=Printer.PageWidth;
      For I:=1 To F Do X1:=X1-5*(sGrid.ColWidths[I]);
      Y1:=2*300;//2*300;
      X2:=Printer.PageWidth;
      For I:=1 To F-1 Do X2:=X2-5*(sGrid.ColWidths[I]);
      Y2:=150+2*300;
      TR:=Rect(X1,Y1,X2-30,Y2);
      Printer.Canvas.Font.Style:=[fsBold];
      Printer.Canvas.Font.Size:=7;
      iWid:=Printer.Canvas.TextWidth(sGrid.Cells[F,0])+50;
      Printer.Canvas.TextRect(TR,X2-iWid,Y1+50,sGrid.Cells[F,0]);
     End;
     For K:=Row To SGrid.RowCount-1 Do
     Begin
      Y1:=150*(K-Row)+3*300;
      Y2:=150*(K-Row+1)+3*300;
      If Y2 > Printer.PageHeight Then Begin
                                       Printer.NewPage;
                                       Row:=K;
                                       GoTo L1;
                                      End;
      For F:=1 To SGrid.ColCount-1 Do
      Begin
       X1:=Printer.PageWidth;
       For I:=1 To F Do X1:=X1-5*(sGrid.ColWidths[I]);
       X2:=Printer.PageWidth;
       For I:=1 To F-1 Do X2:=X2-5*(sGrid.ColWidths[I]);
       If F In [1,4,5] Then
        Printer.Canvas.Font.Style:=[fsBold]
       Else
        Printer.Canvas.Font.Style:=[];
       TR:=Rect(X1,Y1,X2-30,Y2);
       iWid:=Printer.Canvas.TextWidth(sGrid.Cells[F,K])+50;
       Printer.Canvas.TextRect(TR,X2-iWid,Y1+50,sGrid.Cells[F,K]);
      End;
//      Row:=K;
     End;
     Printer.EndDoc;
end;

Procedure MenuDefine(MMenu:TMainMenu);

Function GetMenuCap(MItem:TMenuItem;bEN:Boolean):String;
begin
     //If (MItem.HelpContext>0)then
     Case bEN of
      True: Result:=LoadStr(1000+MItem.HelpContext);
      False:Result:=LoadStr(2000+MItem.HelpContext);
     Else
      Result:=MItem.Caption;
     End;
end;

Var
Imax,I,Jmax,J,K,Lmax,L,Mmax,M,Nmax,N:Integer;
bCap:Boolean;
Begin
     Imax:=MMenu.Items.Count-2;
     K:=0;
     bCap:=CUser.Lang ='EN';
     If bCap Then MMenu.BiDiMode:=bdLeftToRight else MMenu.BiDiMode:=bdRightToLeft;
     For I:=0 To Imax  Do
     Begin
      MMenu.Items[I].Enabled :=Enabl[K];
      MMenu.Items[I].Visible :=Enabl[K];
      MMenu.Items[I].Caption:=GetMenuCap(MMenu.Items[I],bCap);

      K:=K+1;
      Jmax:=MMenu.Items[I].Count-1;
      For J:=0 to Jmax do
      Begin
       MMenu.Items[I].Items[J].Enabled :=Enabl[K];
       MMenu.Items[I].Items[J].Visible :=Enabl[K];
       MMenu.Items[I].Items[J].Caption:=GetMenuCap(MMenu.Items[I].Items[J],bCap);
       K:=K+1;
       Lmax:=MMenu.Items[i].Items[J].Count-1;
       For L:=0 To Lmax Do
       Begin
        MMenu.Items[I].Items[J].Items[L].Enabled:=Enabl[K];
        MMenu.Items[I].Items[J].Items[L].Visible:=Enabl[K];
        MMenu.Items[I].Items[J].Items[L].Caption:=GetMenuCap(MMenu.Items[I].Items[J].Items[L],bCap);
        K:=K+1;
        Mmax:=MMenu.Items[i].Items[J].Items[L].Count-1;
        For M:=0 To Mmax Do
        Begin
         MMenu.Items[I].Items[J].Items[L].Items[M].Enabled:=Enabl[K];
         MMenu.Items[I].Items[J].Items[L].Items[M].Visible:=Enabl[K];
         MMenu.Items[I].Items[J].Items[L].Items[M].Caption:=GetMenuCap(MMenu.Items[I].Items[J].Items[L].Items[M],bCap);
         K:=K+1;
         Nmax:=MMenu.Items[i].Items[J].Items[L].Items[M].Count-1;
         For N:=0 To Nmax Do
         Begin
          MMenu.Items[I].Items[J].Items[L].Items[M].Items[N].Enabled:=Enabl[K];
          MMenu.Items[I].Items[J].Items[L].Items[M].Items[N].Visible:=Enabl[K];
          MMenu.Items[I].Items[J].Items[L].Items[M].Items[N].Caption:=
          GetMenuCap(MMenu.Items[I].Items[J].Items[L].Items[M].Items[N],bCap);
          K:=K+1;
         End;
        End;
       End;
      End;
     End;
end;

Function RequierdCheck(DataSet:TDataSet):Boolean;
Var
I:Integer;
begin
     Result:=True;
     With DataSet Do
      If State in [dsEdit,dsInsert] Then
      For I:=0 To Fields.Count-1  Do
       With Fields[I] Do
       If Required and not ReadOnly and (FieldKind = fkData) and IsNull then
       Begin
         FocusControl;
         Result:=False;
         ShowMessage('«ÿ·«⁄«  ÷—Ê—Ì Ê«—œ ‰‘œÂ «” ');
       End;
end;

Function IntFieldCheck(intField:TIntegerField):Boolean;
begin
     Result:=True;
     With intField Do
     If (MaxValue <>0)and(MinValue <>0)and((Value <MinValue)or(Value >MaxValue)) Then
     Begin
       Result:=False;
       ShowMessage('œ«œÂ Œ«—Ã «“ Õœ „Ã«“');
       FocusControl;
     End;
end;

Function Open_g(Table:TTable):Boolean;
begin
     Case Table.CachedUpdates Of
     True:
     Begin
      Table.Active:=True;
      Try
       Table.UpdateRecordTypes:=[rtModified, rtInserted, rtDeleted, rtUnmodified];
       Table.CancelUpdates;
      Except
       On EDBEngineError Do
       Begin
        Result:=True;
        Beep;
        ShowMessage('ê“«—‘ œ—«Œ Ì«— ﬂ«—»— œÌê—Ì «” ');
        Exit;
       End;
      End;
      Table.Active :=True;
      Result:=False;
     End;
     False:
     Begin
      Table.Active :=False;
      Try
       Table.Filtered:=False;
       Table.Exclusive :=True;
       Table.EmptyTable;
      Except
       On EDBEngineError Do
       Begin
        Result:=True;
        Beep;
        ShowMessage('ê“«—‘ œ—«Œ Ì«— ﬂ«—»— œÌê—Ì «” ');
        Exit;
       End;
      End;
      Table.Active :=True;
      Result:=False;
      End;
     End;
end;

Procedure Close_g(Table:TTable);
begin
     Table.Active :=False;
     Try
      Table.Filtered:=False;
      Table.EmptyTable;
      Table.Exclusive :=False;
     Except
      On EDBEngineError Do
      Begin
        Beep;
//        ShowMessage('ÃœÊ· œ—«Œ Ì«— ﬂ«—»— œÌê—Ì «” ');
        Exit;
      End;
     End;
end;

Function Sold_Price(Rule:String;Qu:Tquery;GKod,Color,AnbNam:String;
AnbKod,St,En:Integer;Quant:Real;Var LastValue:Currency):Currency;
Var
Filt:String;
begin
     Result:=0;
     Filt:='Kod ='+Gkod;
     IF Color > '' Then Filt:=Filt+' and Color = '#39+Color+#39;
     IF AnbNam> '' Then Filt:=Filt+' and AnbNam ='#39+AnbNam+#39;
     //IF AnbKod > 0 Then Filt:=Filt+' and AnbKod ='+IntToStr(AnbKod);
     If Pos(' and',Filt) = 1 Then Delete(Filt,1,4);
     Open_g(Frodm.Cardex);
     If P_Rule = 'FiFo' Then Result:=Kala_Kart_FIFO(GoodNam(StrToInt(GKod)),Filt,St,En,LastValue,Quant);
     If P_Rule = 'LiFo' Then Result:=Kala_Kart_LIFO(GoodNam(StrToInt(GKod)),Filt,St,En,LastValue,Quant);
     If P_Rule = 'Mean' Then Result:=Kala_Kart(GoodNam(StrToInt(GKod)),Filt,St,En,LastValue,Quant);
end;

Function LastValue(Rule:String;Qu:Tquery;GKod,Color,AnbNam:String;
AnbKod,St,En:Integer;Quant:Real):Currency;
Var
Value:Currency;
Filt:String;
begin
     Result:=0;
     Filt:='Kod ='+Gkod;
     IF Color > '' Then Filt:=Filt+' and Color = '#39+Color+#39;
     IF AnbNam> '' Then Filt:=Filt+' and AnbNam ='#39+AnbNam+#39;
     IF AnbKod > 0 Then Filt:=Filt+' and AnbKod ='+IntToStr(AnbKod);
     If Pos(' and',Filt) = 1 Then Delete(Filt,1,4);
     Open_g(Frodm.Cardex);
     If P_Rule = 'FiFo' Then Result:=Kala_Kart_FIFO(GoodNam(StrToInt(GKod)),Filt,St,En,Value,0);
     If P_Rule = 'LiFo' Then Result:=Kala_Kart_LIFO(GoodNam(StrToInt(GKod)),Filt,St,En,Value,0);
     If P_Rule = 'Mean' Then Result:=Kala_Kart(GoodNam(StrToInt(GKod)),Filt,St,En,Value,0);
     Result:=Value;
end;

Function Sum_Sold_Price(Var LastValue:Currency):Currency;
var
Sum:Currency;
I,AnbKod:Integer;
GKod,Color,AnbNam:String;
Q:Real;
begin
     Screen.Cursor:=crHourGlass;
     Sum:=0;
     Frodm.Depot.First;
     For I:=1 To Frodm.Depot.RecordCount Do
     Begin
       GKod:=IntToStr(Frodm.DepotKod.Value);
       Color:=Frodm.DepotColor.Value;
       AnbNam:=Frodm.DepotAnbNam.Value;
       AnbKod:=0;
       Q:=0;
       Sum:=Sum+Sold_Price(P_Rule,Qu,GKod,Color,AnbNam,AnbKod,0,111111111,Q,LastValue);
       Frodm.Depot.Next;
     End;
     Result:=Sum;
     Screen.Cursor:=crDefault;
end;

Procedure T_Filter(Table:TTable;Filt:String);
Begin
     Table.Filter:=Filt;
     Table.Filtered:=True;
End;

Function Open_Fac_Check:Boolean;
Var
S:String;
begin
     Result:=False;
     S:='LPerm = False';
     T_Filter(Frodm.Invo,S);
     T_Filter(Frodm.BInvo,S);
     T_Filter(Frodm.RejInvo,S);
     T_Filter(Frodm.RejBInvo,S);
     If Frodm.Invo.RecordCount > 0 Then Result :=True;
     If Frodm.RejInvo.RecordCount > 0 Then Result :=True;
     If Frodm.BInvo.RecordCount > 0 Then Result :=True;
     If Frodm.RejBInvo.RecordCount > 0 Then Result :=True;
     Frodm.Invo.Filtered:=False;
     Frodm.BInvo.Filtered:=False;
     Frodm.RejInvo.Filtered:=False;
     Frodm.RejBInvo.Filtered:=False;
End;

Procedure PcheqControl;
Var
I,Day,Dat:Integer;
Price:Currency;
begin
     Dat:=Fardate+PcheqDay;
     Day:=Dat Mod 100;
     If Day > 30 Then Dat:=Dat+70;
     Frodm.Pcheq.open;
     Frodm.Pcheq.Filter :=' Bdat <= '+IntToStr(Dat)+' And Paykod = False';
     Frodm.Pcheq.Filtered:=True;
     Frodm.Pcheq.First;
     Price:=0;
     For I:=1 To Frodm.Pcheq.RecordCount Do
     Begin
       Price:=Price+Frodm.PcheqPbill.Value;
       Frodm.Pcheq.Next;
     End;
     If Price > 0 Then ShowMessage(' «  «—ÌŒ'+IntToDate(Dat)+' „»·€ '+CurrToFar(Price)+
     ' çﬂ Å—œ«Œ ‰Ì œ«—Ìœ');
     Frodm.Pcheq.Filter:='';
     Frodm.Pcheq.Filtered:=False;
     Frodm.Pcheq.Close;
end;

Procedure DCheqControl;
Var
Send:TObject;
begin
     Send:=TObject.Create;
     CreatingForm(TFDCheqList,'FDCheqList',FDCheqList);
     FDCheqList.Dat2.Text:=IntToDate(Fardate);
     FDCheqList.rgCheq.ItemIndex:=5;
     FDCheqList.BshowClick(Send);
     If FDcheqList.DQu.RecordCount = 0 Then FDcheqList.Close;
end;

Procedure OptDecode;
begin
     sAKod:=sOptions[1]='1';
     sPerc:=sOptions[2]='1';
     sGene:=sOptions[3]='1';
     sRem:=sOptions[4]='1';
     sDcheq:=sOptions[5]='1';
     sPcheq:=sOptions[6]='1';
     SNYear:=sOptions[7]='1';
     sModel:=sOptions[8]='1';
     sBK:=sOptions[9]='1';
     sBill:=sOptions[10]='1';
     sFac:=sOptions[11]='1';
     sNet:=sOptions[12]='1';
     sPerm:=sOptions[13]='1';
     sRej:=sOptions[14]='1';
     sFrem:=sOptions[15]='1';
     PTip:=StrToIntDef(sOptions[16],0);
     sDp:=sOptions[17]='1';
     sCent:=sOptions[18]='1';
     sBTip:=sOptions[19]='1';
     sABill:=sOptions[20]='1';

     sSkin:=sOptions[21]='1';
     iSKin:=StrToIntDef(sOptions[22],0);

     If sBTip Then iBillTip:=1 Else iBillTip:=0;
end;

Procedure OptEncode;
Var
St:String;
begin
     sOptions:='0000000000000000000000';
     If sAKod Then sOptions[1]:='1' Else sOptions[1]:='0';
     If sPerc Then sOptions[2]:='1' Else sOptions[2]:='0';
     If sGene Then sOptions[3]:='1' Else sOptions[3]:='0';
     If sRem Then sOptions[4]:='1' Else sOptions[4]:='0';
     If sDcheq Then sOptions[5]:='1' Else sOptions[5]:='0';
     If sPcheq Then sOptions[6]:='1' Else sOptions[6]:='0';
     If SNYear Then sOptions[7]:='1' Else sOptions[7]:='0';
     If sModel Then sOptions[8]:='1' Else sOptions[8]:='0';
     If sBK Then sOptions[9]:='1' Else sOptions[9]:='0';
     If sBill Then sOptions[10]:='1' Else sOptions[10]:='0';
     If sFac Then sOptions[11]:='1' Else sOptions[11]:='0';
     If sNet Then sOptions[12]:='1' Else sOptions[12]:='0';
     If sPerm Then sOptions[13]:='1' Else sOptions[13]:='0';
     If sRej Then sOptions[14]:='1' Else sOptions[14]:='0';
     If sFRem Then sOptions[15]:='1' Else sOptions[15]:='0';
     St:=IntToStr(PTip);
     sOptions[16]:=St[1];
     If sDp Then sOptions[17]:='1' Else sOptions[17]:='0';
     If sCent Then sOptions[18]:='1' Else sOptions[18]:='0';
     If sBTip Then sOptions[19]:='1' Else sOptions[19]:='0';
     If sABill Then sOptions[20]:='1' Else sOptions[20]:='0';

     If sSkin Then sOptions[21]:='1' Else sOptions[21]:='0';
     St:=IntToStr(iSkin);
     sOptions[22]:=St[1];
     
end;

Procedure TableUpDate;
Var
I:Integer;
begin
     For I:=0 to Frodm.ComponentCount-1 Do
     If Frodm.Components[I] Is TTable Then
       If (Frodm.Components[I] As TTable).State = dsBrowse Then
       Begin
         (Frodm.Components[I] As TTable).Close;
         (Frodm.Components[I] As TTable).Open;
       End;
end;

Function SetStyle(Style:String):TFontStyles;
begin
     Result:=[];
     If Style = '' Then Exit;
     If Pos('B',Style) > 0 Then Result:=Result+[fsBold];
     If Pos('I',Style) > 0 Then Result:=Result+[fsItalic];
     If Pos('U',Style) > 0 Then Result:=Result+[fsUnderLine];
     If Pos('O',Style) > 0 Then Result:=Result+[fsStrikeOut];
end;

Function GetStyle(Font:TFont):String;
begin
     Result:='';
     If fsBold In Font.Style Then Result:=Result+'B';
     If fsItalic In Font.Style Then Result:=Result+'I';
     If fsUnderLine In Font.Style Then Result:=Result+'U';
     If fsStrikeOut In Font.Style Then Result:=Result+'O';
end;

Function GetClSize(Font:TFont):String;
begin
     Result:=IntToStr(Font.Color)+' '+IntToStr(Font.Size);
end;
Procedure  SetClSize(Var Font:TFont;ClSize:String);
Var
P:Integer;
begin
     P:=Pos(' ',ClSize);
     Try
      Font.Color:=StrToInt(Copy(clSize,1,P-1));
      Font.Size:=StrToint(Copy(clSize,P+1,Length(ClSize)-P));
     Except
      On E:EConvertError Do
      Begin
        Font.Color:=clWindowText;
        Font.Size:=10;
      End;
     End;
end;

Function GetFont(Font:TFont):String;
begin
     Result:=Font.Name+'  '+GetStyle(Font)+'&'+GetClSize(Font);
end;

Function SetFont(FontDes:String):TFont;
Var
L,x,y:Integer;
begin
     Result:=TFont.Create;
     If FontDes = '' Then
     Begin
      Result.Name:='Tahoma';
      Exit;
     End;
     Result.Name:=Copy(FontDes,1,Pos('  ',FontDes)-1);
     X:=Pos('  ',FontDes);
     Y:=Pos('&',FontDes);
     L:=Length(FontDes);
     Result.Style :=SetStyle(Copy(FontDes,x+2,y-x-1));
     SetClSize(Result,Copy(FontDes,y+1,L-y));
end;

Procedure coFile;
begin
     coF:=TTimer.Create(Main.Owner);
     coF.Interval:=15000;
     coF.OnTimer:=Main.Timer3Timer;
     coF.Enabled :=True;
end;

Function VisitCode(Visitor:String):Integer;
begin
     Qu.SQL.Clear;
     Qu.SQL.Add('SELECT Code');
     Qu.SQL.Add('FROM Visitors');
     Qu.SQL.Add('WHERE Nam ='#39+Visitor+#39);
     Qu.Open;
     Result:=Qu.Fields[0].AsInteger;
     Qu.Close;
end;

//Currency To Farsi Writiing

Function Yekan(X:Integer):String;
begin

     Case X Of
     1: Result:='Ìﬂ';
     2: Result:='œÊ';
     3: Result:='”Â';
     4: Result:='çÂ«—';
     5: Result:='Å‰Ã';
     6: Result:='‘‘';
     7: Result:='Â› ';
     8: Result:='Â‘ ';
     9: Result:='‰‹Â';
     Else
       Result:='';
     End;
end;

Function TeenText(x:Integer):String;
begin
     Case X Of
     11: Result:='Ì«“œÂ';
     12: Result:='œÊ«“œÂ';
     13: Result:='”Ì“œÂ';
     14: Result:='çÂ«—œÂ';
     15: Result:='Å«‰“œÂ';
     16: Result:='‘«‰“œÂ';
     17: Result:='Â›‹œÂ';
     18: Result:='ÂÃ‹œÂ';
     19: Result:='‰‹Ê“œÂ';
     Else
       Result:='';
     End;
end;

Function Dahgan(X:Integer):String;
begin
     Case X Of
     10: Result:='œÂ';
     20: Result:='»Ì”  Ê';
     30: Result:='”‹Ì Ê';
     40: Result:='çÂ· Ê';
     50: Result:='Å‰Ã«Â Ê';
     60: Result:='‘’  Ê';
     70: Result:='Â› «œ Ê';
     80: Result:='Â‘ «œ Ê';
     90: Result:='‰Êœ Ê';
     Else
       Result:='';
     End;
end;

Function Sadgan(X:Integer):String;
begin
     Case X Of
     100: Result:='Ìﬂ’œ Ê';
     200: Result:='œÊÌ”  Ê';
     300: Result:='”Ì’œ Ê';
     400: Result:='çÂ«—’œ Ê';
     500: Result:='Å«‰’œ Ê';
     600: Result:='‘‘’œ Ê';
     700: Result:='Â› ’œ Ê';
     800: Result:='Â‘ ’œ Ê';
     900: Result:='‰Â‹’œ Ê';
     Else
       Result:='';
     End;
end;

Function SadanToFarsi(X:Integer):String;
Var
Yek,Dah,Sad:Integer;
St:String;
begin
     Result:='';
     Yek:=X Mod 10;
     Dah:=(X Mod 100)-Yek;
     Sad:=X-(Dah+Yek);
     If (Dah=10) and (Yek>0) Then St:=Sadgan(Sad)+TeenText(Dah+Yek) Else
       St:=Sadgan(Sad)+Dahgan(Dah)+Yekan(yek);
//     If Pos(' Ê ',St) = 1 Then Delete(st,1,3);
     Yek:=Length(St);
     If Yek = 0 Then Exit;
     If (st[yek] = 'Ê')and(st[Yek-1]<>'œ') Then Delete(st,yek,1);
     Result:=st;
end;

Function FarsiPrice(X:Real):String;
Var
Farsi,St:String;
Sad,intRem:Integer;
I,J,Yek:Integer;
begin
     St:=FloatToStr(Int(X));
     intRem:=3-Length(St) Mod 3;
     If intRem = 3 Then intRem := 0;
     For I:=1 To intRem Do st:='0'+st;
     I:=(Length(St) Div 3);
     J:=0;
     Farsi:='';
     Repeat
       Sad:=StrToInt(Copy(St,1+J*3,3));
       If Sad <> 0 Then
       Begin
         Farsi:=Farsi+SadanToFarsi(Sad);
         Case I Of
          2: Farsi:=Farsi+' Â“«—';
          3: Farsi:=Farsi+' „Ì·ÌÊ‰ ';
          4: Farsi:=Farsi+' „Ì·Ì«—œ';
          5: Farsi:=Farsi+' Â“«—„Ì·Ì«—œ';
         End;
         Farsi:=Farsi+' Ê';
       End;
       J:=J+1;
       I:=I-1;
     Until I=0;
     Yek:=Length(Farsi);
     If Yek = 0 Then Exit;
     If (Farsi[yek] = 'Ê') Then Delete(Farsi,yek,1);
     //Farsi:=Farsi+' —Ì«· ';
     Result:=Farsi;
end;

Function Open_Fac:Boolean;
Const
Stat=[dsEdit,dsInsert];
begin
 Try
     Result:=Frodm.Invo.State in Stat;
     If Result Then Exit;
     Result:=Frodm.RejInvo.State in Stat;
     If Result Then Exit;
     Result:=Frodm.Binvo.State in Stat;
     If Result Then Exit;
     Result:=Frodm.RejBinvo.State in Stat;
     If Result Then Exit;
     Result:=Frodm.RMon.State in Stat;
     If Result Then Exit;
     Result:=Frodm.PMon.State in Stat;
     If Result Then Exit;
     Result:=Frodm.NFish.State in Stat;
     If Result Then Exit;
     Result:=Frodm.BHav.State in Stat;
 Except On EAccessviolation Do Result:=False;
 End;
end;

Function Encrypt(St:String;Key:Integer):String;
Var
I:integer;
begin
     For I:=1 To Length(St) Do
       St[i]:=Chr(255 Xor Ord(St[i])+Key);
     Result:=St;
end;

Function CCrypt(Const Value:String):String;
Var
CM:TCipherManager;
begin
     CM:= TCipherManager.Create(Application.Owner);
     CM.Algorithm:='Blowfish';
     CM.Description:='448bit Key';
     CM.InitKey('Key',nil);
     Result:=CM.DecodeString(Value);
end;

Procedure ChangeFieldValue(Table:TTable;Field:String;LValue,NValue:Variant);
Var
I:Integer;
OFlt:String;
begin
{     UpQu:=TQuery.Create(Main.Owner);
     UpQu.DataBaseName:=CurrDb;
     UpQu.SQL.Clear;
     UpQu.SQL.Add('Update '+TableName +' Set '+Field+' =:N Where '+Field+' = :O');
     UpQu.Params[0].Value:=NValue;
     UpQu.Params[1].Value:=LValue;
     UpQu.ExecSQL;
     UpQu.Free;}
     OFlt:=Table.Filter;
     Table.Open;
     Table.Filter:=Field+'='+chr(39)+VarToStr(LValue)+chr(39);
     Table.Filtered:=True;
     Table.First;
     For I:=1 To Table.RecordCount Do
     Begin
      Table.Edit;
      Table.FieldByName(Field).Value:=NValue;
      Table.Post;

      Table.Next;
     End;
     Table.Filter:=OFlt;
     Table.Filtered:=False;
     Table.Close;
End;

Procedure JariRepair(Table:TTable);
Var
Bes,
Bed,
Rem:Currency;
I:Integer;
begin
     Rem:=0;
     Table.IndexFieldNames:='Dat;Bedeh';
     Table.Refresh;
     Table.First;
     For I:=1 To Table.RecordCount Do
     Begin
       Bes:=Table.FieldByName('Bestan').AsCurrency;
       Bed:=Table.FieldByName('Bedeh').AsCurrency;
       Rem:=Rem+Bes-Bed;
       Table.Edit;
       Table.FieldByName('Rema').AsCurrency:=Rem;
       Table.FieldByName('Id').AsInteger:=I;
       Table.Post;
       Table.Next;
     End;
end;

Procedure SetToday;
var
DMask:TMaskEdit;
Form:TForm;

begin
//--------------------------------
     (*Hmu:=CreateMutex(nil,False,PChar(Encrypt('4.>-;S. S4,-<)S<3:',130)));
     FState:=GetLastError() = ERROR_ALREADY_EXISTS;
     If GetLastError() <> ERROR_ALREADY_EXISTS Then Frodm.Destroy;
     CloseHandle(Hmu);*)
//--------------------------------

     Form := TForm.Create(Application);
     with Form do
     try
      Canvas.Font := Font;
      BorderStyle := bsDialog;
      BorderWidth:=3;
      Caption := '«„‹‹‹‹‹—Ê“';
      ClientWidth := 164;
      ClientHeight := 285;
      Position := poScreenCenter;
      BidiMode:=bdRightToLeft;
      AutoSize:=True;
      DMask:=TMaskEdit.Create(Form.Owner);
      With TLabel.Create(Form) Do
      Begin
       Parent:=Form;
       BidiMode:=bdRightToLeft;
       Top:=5;
       Height := 21;
       Width := 85;
       Caption:='«„—Ê“';
      End;
      With DMask Do
      begin
       Parent:=Form;
       Top := 30;
       Width := 85;
       Height := 21;
       Hint := '—Ê“-„«Â-”«· (œÊ —ﬁ„Ì)';
       AutoSize := False;
       BiDiMode := bdRightToLeft;
       EditMask := '1300/00/00;';//1;_
       MaxLength := 10;
       ParentShowHint := False;
       ShowHint := True;
       TabOrder := 0;
       Text := IntToDate(Fardate);//'13  /  /  '
      End;
      with TButton.Create(Form) do
      begin
        Parent := Form;
        Top:=60;
        Left:=3;
        Width:=85;
        Height:=25;
        Caption := ' «∆Ìœ';
        ModalResult := mrOk;
        Default := True;
      end;
      Case ShowModal OF
       mrOK :AdjT:=AdjT+DateToInt(DMask.Text)-Fardate;
      End;
     finally
      Form.Free;
     end;
end;

Procedure Saved;
var
Form:TForm;
I:Integer;
begin
     Form := TForm.Create(Application);
     with Form do
     try
      Canvas.Font := Font;
      BorderStyle := bsNone;
      BorderWidth:=5;
      ClientWidth := 100;
      ClientHeight := 50;
      Position := poScreenCenter;
      BidiMode:=bdRightToLeft;
      Visible:=True;
      Color:=Application.HintColor;
      With TLabel.Create(Form) Do
      Begin
       Parent:=Form;
       AutoSize:=False;
       BidiMode:=bdRightToLeft;
       Alignment:=taCenter;
       LayOut:=tlCenter;
       Top:=5;
       Height := 40;
       Width := 90;
       Caption:='À»  ‘œ';
       Font.Style:=[fsBold];
       Font.Size:=12;
       Visible:=True;
       Refresh;

       For I:=1 To 4 Do Begin
        Refresh;
        Sleep(60);
        Windows.Beep(1000*I,40);
        Visible:=Not Visible;
       End;
      End;
     Finally
      Form.Free;
     End;
end;

//-----------Factor Payment ---------------
Function GetFactorSum(Filt:String):Currency;
begin
     If Filt > '' Then Filt:='Where '+Filt;
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Sum(Pnet) From Invoice I '+Filt);
     Qu.Open;
     Result:=Qu.Fields[0].AsCurrency;
     Qu.Close;
end;

Function GetRejFactorSum(Filt:String):Currency;
begin
     If Filt > '' Then Filt:='Where '+Filt;
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Sum(Pnet) From RejInvo I '+Filt);
     Qu.Open;
     Result:=Qu.Fields[0].AsCurrency;
     Qu.Close;
end;

Function GetCashPay(Filt:String):Currency;
begin
     If Filt > '' Then Filt:='Where '+Filt;
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Sum(Price) From RMon Where Inv In ');
     Qu.SQL.Add('(Select I.No From Invoice I '+Filt+')');
     Qu.Open;
     Result:=Qu.Fields[0].AsCurrency;
     Qu.Close;
end;

Function GetHavPay(Filt:String):Currency;
begin
     If Filt > '' Then Filt:='Where '+Filt;
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Sum(Price) From BHav Where Inv In ');
     Qu.SQL.Add('(Select I.No From Invoice I '+Filt+')');
     Qu.Open;
     Result:=Qu.Fields[0].AsCurrency;
     Qu.Close;
end;

Function GetFishPay(Filt:String):Currency;
begin
     If Filt > '' Then Filt:='Where '+Filt;
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Sum(Price) From NFish Where Inv In ');
     Qu.SQL.Add('(Select I.No From Invoice I '+Filt+')');
     Qu.Open;
     Result:=Qu.Fields[0].AsCurrency;
     Qu.Close;     
end;

Function GetCheqPay(Filt:String):Currency;
begin
     If Filt > '' Then Filt:='Where '+Filt;
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Sum(PSum) From RRes Where Inv In ');
     Qu.SQL.Add('(Select I.No From Invoice I '+Filt+')');
     Qu.Open;
     Result:=Qu.Fields[0].AsCurrency;
     Qu.Close;
end;

Function GetAcKod_Tree(Var AcName:String):Real;
var
Tree:TFAcTree;
begin
     Tree:=TFAcTree.Create(Application);
     With Tree Do
     Begin
      Caption:='«‰ Œ«» Õ”«»';
      BorderStyle:=bsSingle;
      Width:=Width Div 2;
      StatusBar1.Visible:=False;
      Repaint;
      tvAcKod.OnDblClick:=nil;
      tvAcKod.OnDragDrop:=Nil;
      tvAcKod.OnEdited:=Nil;
      tvAcKod.OnKeyDown:=Nil;
      tvAcKod.OnKeyPress:=Nil;
      tvAcKod.OnMouseDown:=Nil;
      Tb1.Visible:=False;
      ShowModal;
      Case ModalResult Of
       mrOk:If (NamFound(tvAcKod.Selected.Text))and(Frodm.AcKodUseKod.Value =1)Then
       Begin
        Result:=Frodm.AcKodAccKod.AsFloat;
        AcName:=Frodm.AcKodNam.Value
       End Else Begin
        Result:=0;
        Name:='';
       End;
       mrCancel:
       Begin
        Result:=0;
        Name:='';
       End;
      End;
     End;

end;

Function FindGood(Name:String):String;
var
AcS:TFGSearch;
St:String;
begin
     Result:=Name;
     AcS:=TFGSearch.Create(Application);
     With AcS Do
     Begin
      BorderStyle:=bsSingle;
      OnCreate:=FormCreate;
      //Result:=CodeName;
      Case ShowModal Of
      mrCancel:Close;
      mrOk:If lbGName.ItemIndex >-1 Then
           Begin
            St:=lbGName.Items.Strings[lbGName.ItemIndex];
            Result:=St;
            ClipBoard.SetTextBuf(PChar(Result));
            Close;
           End;
      End;
     End;
end;

Procedure GetGoodCombo(Sender: TObject; var Key: Word);
begin
     If Key = 32 Then
     Begin
      Key:=0;
      (Sender As Tcombobox).Text:=FindGood((Sender As Tcombobox).Text);
     End;
end;

Function FindGoods(Table:TTable;iNo,iDat:Integer;sName:String):Boolean;
Var
Gs:TFGFind;
Label L1;
begin
     Gs:=TFGFind.Create(Application);
     //Gs.OnCreate:=nil;
     Result:=False;
     With Gs Do
     Begin
      choosed:=False;
      //FNam.OnKeyDown:=FormKeyDown;
      OnKeyDown:=Nil;
      BorderStyle:=bsSizeable;
      rbMoj.Checked:=SDp;
      BOk.Visible:=True;
      Sb1.Visible:=True;
      sPc.Visible:=False;
      cbCollect.Visible:=False;
      Visible:=False;
      Dat:=iDat;
      No:=iNo;
      Name:=sName;
      T1:=Table;
      Dbg.OnKeyDown:=lbGNameKeyDown;
      ShowModal;
      Result:=choosed;
      Case ModalResult Of
      mrYes:begin Windows.Beep(2500,1500); Result:=true; end;
      mrCancel:Close;
      mrAll: Windows.Beep(2500,250);
      End;
     End;
end;

Function FindAccount(Name:String;Var Code:Real):String;
var
AcS:TFAcSearch;
St:String;
begin
     Result:=Name;
     AcS:=TFAcSearch.Create(Application);
     With AcS Do
     Begin
      BorderStyle:=bsSingle;
      OnCreate:=FormCreate;
      Case ShowModal Of
      mrCancel:Close;
      mrOk:If lbName.ItemIndex >-1 Then
           Begin
            St:=lbName.Items.Strings[lbName.ItemIndex];
            Delete(St,1,Pos('__',St)+1);
            If Not CUser.Local Then St:=AccNam(lbName.AcCode[lbName.ItemIndex]);
            Result:=St;
            Code:=lbName.AcCode[lbName.ItemIndex];
            ClipBoard.SetTextBuf(PChar(Result));
            Close;
           End;
      End;
     End;
end;

Procedure GetAccountCombo(Sender: TObject; var Key: Word);
begin
     If (Key = 32)and ((Sender As Tcombobox).Text='') Then
     Begin
      Key:=0;
      (Sender As Tcombobox).Text:=FindAccount((Sender As Tcombobox).Text,FindCode);
     End;
end;

Procedure GetAccountDBCombo(Sender: TObject; var Key: Word;fName:String;Code:Real);
begin
     If Key = 32 Then
     Begin
      Key:=0;
      If (Sender is  TDBcombobox) Then
      With Sender as  TDBcombobox Do
      If DataSource.State in[dsEdit,dsInsert] Then
      Begin
       Text:=FindAccount('',FindCode);
       ItemIndex:=Items.IndexOf(Text);
       If fName <> '' Then Datasource.DataSet.FieldByName(fName).AsFloat:=FindCode;
      End;
      If Sender is  TDBLookupCombobox Then
       With (Sender As TDBLookupCombobox) Do
       If DataSource.Dataset.State in [dsEdit,dsInsert] Then
       Begin
        If Field.DataType in [ftFloat,ftCurrency] then
        Begin
          FindAccount('',FindCode);//Field.Value:=Acckod(FindAccount('',0));
          Field.Value:=FindCode;
        End;
        If Field.DataType = ftString then
        begin
         Field.AsString:=FindAccount('',FindCode);//Field.Value:=FindAccount('',0);
         If fName <> '' Then Datasource.DataSet.FieldByName(fName).AsFloat:=FindCode;
        end;
       End;
     End;
end;
{
     If Key = 32 Then
     Begin
      Key:=0;
      If (Sender is  TDBcombobox) Then
      With Sender as  TDBcombobox Do
      If DataSource.State in[dsEdit,dsInsert] Then
      Begin
       Text:=FindAccount('',0);
       ItemIndex:=Items.IndexOf(Text);
      End;
      If Sender is  TDBLookupCombobox Then
       With (Sender As TDBLookupCombobox) Do
       If DataSource.Dataset.State in [dsEdit,dsInsert] Then
       Begin
        If Field.DataType in [ftFloat,ftCurrency] then Field.Value:=Acckod(FindAccount('',0));//(Sender As TDBLookupCombobox).
        If Field.DataType = ftString then Field.Value:=FindAccount('',0);
       End;
       //(Sender As TDBLookupCombobox).Field.Value:=FindAccount('');
     End;
}
Function FindCentKod(Var CName:String):Real;
var
AcS:TFCentSearch;
begin
     Result:=0;
     AcS:=TFCentSearch.Create(Application);
     With AcS Do
     Begin
      BorderStyle:=bsSingle;
      OnCreate:=FormCreate;
      SQuNam.Visible:=CUser.Local;
      SQuEname.Visible:=Not CUser.Local;
      Case ShowModal Of
      mrCancel:Close;
      mrOk:Begin
            //If Dbg.Focused Then
            //Begin
             If Not CUser.Local Then
              CName:=SQuEName.AsString
             Else
              CName:=SQuNam.AsString;
             Result:=CKod;
             ClipBoard.SetTextBuf(PChar(CName));
             Close;
            //End;
{            If lbName.ItemIndex >-1 Then
            Begin
             CName:=lbName.Items.Strings[lbName.ItemIndex];
             Result:=lbName.AcCode[lbName.ItemIndex];
             ClipBoard.SetTextBuf(PChar(CName));
             Close;
            End;}
           End;
      End;
     End;
end;

{Procedure GetCentLookup(Sender: TObject; var Key: Word);
begin
     If (Key = 32)and((Sender As TDBLookUpcombobox).DataSource.DataSet.State <>dsBrowse) Then
     Begin
      Key:=0;
      With Sender As TDBLookUpcombobox Do
      Begin
       KeyValue:=FindCentKod(Text);
       Field.Value:=KeyValue;
      End;
     End;
end;}

Procedure GetCentLookup(Sender: TObject; var Key: Word);
Var
St:String;
begin
     If (Key = 32) Then
     Begin
      Key:=0;
      If Sender Is TDBLookUpcombobox Then
      With Sender As TDBLookUpcombobox Do
      If (Datasource = nil) Then
      Begin
       St:=Text;Key:=0;
       KeyValue:=FindCentKod(St);
      End Else
      If (DataSource.DataSet.State <>dsBrowse)then
      Begin
       St:=Text;Key:=0;
       KeyValue:=FindCentKod(St);
       Field.Value:=KeyValue;
      End;
      If Sender is TComboBox Then
      With Sender as TComboBox Do
      Begin
       St:=Text;
       FindCentKod(St);
       Text:=St;
       ItemIndex:=Items.IndexOf(St);
      End;
     End;
end;

Function GetGoodLen:Integer;
Var
I:Integer;
iLen,Len:Integer;
TM: TTextMetric;
begin
     Frodm.Good.First;
     GetTextMetrics(Main.Canvas.Handle, TM);
     Len:=0;
     For I:=1 To Frodm.Good.RecordCount Do
     Begin
      iLen:=Length(Frodm.GoodNam.AsString);
      If iLen> Len Then Len:=iLen;
      Frodm.Good.Next;
     End;
     Result:=(Len+3) * TM.tmAveCharWidth;
end;

Procedure SetGridWidth(Grid:TDbGrid;FieldName:String;Width:Integer);
Var
I:Integer;
Begin
     For I:=0 To Grid.Columns.Count-1 Do
     If Grid.Columns[I].FieldName = FieldName Then Grid.Columns[I].Width:=Width;
End;

Function GetRejectable(GKod:Integer;Anb:String;ANbKod:Integer;Cust:String):Real;
begin
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Sum(IOKOD*Quant) From GCardex Where Kod=:k and AnbNam=:a ');
     Qu.SQL.Add(' and FacNam=:f ');
     Qu.Params[0].Value:=GKod;
     Qu.Params[1].Value:=Anb;
     Qu.Params[2].Value:=Cust;
     Qu.Open;
     Result:=Qu.Fields[0].AsFloat;
     Qu.Close;
end;

Function GetRejInvoPrice(GKod:Integer;Anb:String;AnbKod:Integer;Cust:String;
Var RQuant:Real;Var InvNo:Integer):Currency;
Var
OUP:TFOutPrices;
maxQ:Real;
begin
     maxQ:=GetRejectable(GKod,Anb,AnbKod,Cust);
     If maxQ >=0 Then
     Begin
      Beep;
      ShowMessage('„Õ· »—«Ì „—ÃÊ⁄Ì ‰œ«—œ');
      Result:=0;
      RQuant:=0;
      Exit;
     End;
     maxQ:=Abs(maxQ);
     OUP:=TFOutPrices.Create(Application);
     With OUP Do
     Try
      Visible:=False;
      Caption:='·Ì”  ›«ò Ê—Â«Ì ›—Ê‘';
      BorderStyle:=bsSingle;
      Position:=poMainFormCenter;
      Kod:=GKod;
      AnbNam:=Anb;
      FacNam:=Cust;
      Qt:=0;
      Filter:='Des='+QuotedStr('›«ﬂ Ê— ›—Ê‘')+' and Facnam = '+#39+FacNam+#39;
      CalcList;
      //Dbg.SetFocus;
      Result:=0;
      RQuant:=0;
      InvNo:=0;
      Case ShowModal Of
      mrCancel:Close;
      mrOK    :Begin
                Result:=FQuFee.AsCurrency;
                InvNo:=FQuNo.AsInteger;
                RQuant:=FQuOut.AsFloat;
                If RQuant>maxQ Then RQuant:=maxQ;
               End;
      End;
     Finally
      Free;
     End;
end;

Function GetOutPrice(GKod,Color,AnbNam:String;AnbKod,St,En:Integer;OutQuant:Real):Currency;
Var
LValue:Currency;
begin
     Sold_Price(P_Rule,Qu,GKod,Color,AnbNam,AnbKod,St,En,OutQuant,LValue);
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Sum(I.IIn*I.Fee)');
     Qu.SQL.Add('From Cardex I Where Des=:b ');
     Qu.Params[0].Value:='RejB';
     Qu.Open;
     Result:=Abs(Qu.Fields[0].AsCurrency);
     Qu.Close;
end;

Procedure CreateReportLabel(Dbg:TDbGrid;Band:TQRBand);
Var
I:Integer;
NLeft:Integer;
Begin
     NLeft:=50;
     For I:=0 To Dbg.Columns.Count-1 Do
      With TQRLabel.Create(Band.ParentReport) Do
      Begin
       AutoSize:=False;
       AlignMent:=taCenter;
       Caption:=dbg.Columns[I].Title.Caption;
       Left:=NLeft;
       Top:=2;
       Width:=Dbg.Columns[i].Width;
       Enabled:=True;
       NLeft:=NLeft+Width+5;
      End;
end;




end.
