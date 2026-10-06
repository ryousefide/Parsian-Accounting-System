unit CRoutins;

interface
Uses Windows,Sysutils,Forms,Controls,Classes,StdCtrls,ComCtrls,Messages,Db,DbTables,
XPCheckListBox,Dialogs;

Procedure Fill_ChLists(Table:TTable;ListField,ValueField,Filt:String;Comb:TXPCheckListBox);
Function C_Choose:String;
Function A_Choose:String;
Function CentKod(CName:String):Integer;
Function CentName(CKod:Integer):String;
Function CentHint(CKod:Integer):String;
Function Get_CFilt_Account(AcName:String):String;
Function CentString(CName:String):String;
Function CostString(CName:String):String;

Function GetTaf2(Kod:Real):Integer;
Function GetTaf(Kod:Real):Integer;
Function GetMo(Kod:Real):Integer;
Function GetKol(Kod:Real):Integer;
Function GetDas(Kod:Real):Integer;
Function GetGro(Kod:Real):Integer;

Procedure CreateTempBill;
Procedure MoveBillToTemp(Dated:Boolean;BNo:Integer);


Procedure GetTodayRates(atDate:Integer);
Function GetRate(CTip:String):Currency;
Procedure Fill_Rate;
Function GetRateatDate(CTip:String;inDate:Integer):Currency;



//Multi Currency reports
Function CurrToFar_Arzi (Cur:Currency;Cap:String):String;
Procedure Gardesh_Arzi(AccKod:Real;Cent,Cost,Curr:String);
Procedure Gardesh_Mo_Arzi(Kod:Real;Cent,Cost,Curr:String);
Procedure Gardesh_Sum_Arzi(Kod,Ratio:Real;Var Bed,Bes:Currency;Var Dat:Integer;
Sd,Ed,Cent,Cost,Curr:String);
Procedure Gardesh_Kol_Arzi(Kod:Real;Sd,Ed,Cent,Cost,Curr:String);
Procedure Gardesh_Kol_Arzi_Name(Nam:String;Sd,Ed,Cent,Cost,Curr:String);
Procedure Kol_Taraz_Arzi(Sd,Ed,Cent,Cost,Curr:String);
Procedure Mo_Taraz_Arzi(Sd,Ed,Cent,Cost,Curr:String);
Procedure Taf_Taraz_Arzi(Sd,Ed,Cent,Cost,Curr:String);
Procedure Jos_Taraz_Arzi(Sd,Ed,Cent,Cost,Curr:String);
Procedure Gardesh_Rem_Arzi(Kod:Real;Cent,Cost,Curr:String);

Function Good_Choose(Table:TTable;iNo,iDat:Integer;GName:String):Boolean;
Function IsFormula (GKod:Integer):Boolean;

Procedure MakeGoodTree(CTree: TTreeView);

implementation

uses Provar,AcComboBox,Routins,FrooshDM,AForm,GFSelect,MainForm;

Procedure Fill_ChLists(Table:TTable;ListField,ValueField,Filt:String;Comb:TXPCheckListBox);
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

Function C_Choose:String;//(Var Value :String)
Var
Form:TForm;
cbCost:TXPCheckListBox;
I:Integer;
Value:String;
begin
  Value:='';
  Form := TForm.Create(Application);
  with Form do
    try
      Canvas.Font := Font;
      BorderStyle := bsDialog;
      Caption := '·Ì”  Å—ÊéÂ Â«';
      ClientWidth := 164;
      ClientHeight := 285;
      Position := poScreenCenter;
      BidiMode:=bdRightToLeft;
      AutoSize:=True;
      cbCost := TXPCheckListBox.Create(Form);
      with cbCost do
      begin
        Parent := Form;
        ParentBidiMode:=True;
        Left := 0;
        Top := 0;
        Width:=164;
        Height:=232;
        Sorted:=True;
        Fill_Comb(Frodm.Costc,'Nam',Items);
      end;
      with TButton.Create(Form) do
      begin
        Parent := Form;
        Top:=260;
        Left:=3;
        Width:=75;
        Height:=25;
        Caption := ' «∆Ìœ';
        ModalResult := mrOk;
        Default := True;
      end;
      with TButton.Create(Form) do
      begin
        Parent := Form;
        Top:=260;
        Left:=87;
        Width:=75;
        Height:=25;
        Caption := '«‰’—«›';
        ModalResult := mrCancel;
        Cancel := True;
      end;
      with TButton.Create(Form) do
      begin
        Parent := Form;
        Top:=235;
        Left:=0;
        Width:=164;
        Height:=22;
        Caption := '«‰ Œ«» ‰‘œÂ Â«';
        ModalResult := mrAll;
        Cancel := False;
      end;
      Case ShowModal OF
       mrOK :
         begin
           For I:=0 To cbCost.Items.Count-1 Do
           If cbCost.Checked[I] Then
           Value:=Value+'"'+cbCost.Items.Strings[I]+'",';
           If Value <> '' Then Delete(Value,Length(Value),1);
           Result := Value;
         end;
       mrAll:
         begin
           For I:=0 To cbCost.Items.Count-1 Do
           If Not cbCost.Checked[I] Then
           Value:=Value+'"'+cbCost.Items.Strings[I]+'",';
           If Value <> '' Then Delete(Value,Length(Value),1);
           Result := Value;
         end;
      End;
    finally
      Form.Free;
    end;
end;

Function A_Choose:String;
Var
Form:TFAForm;
I:Integer;
Value:String;
begin
  Value:='';
  Form := TFAForm.Create(Application);
  with Form do
   Try
    BorderStyle:=bsDialog;
    Visible:=False;
    Fill_ChLists(Frodm.Cent,'Nam','Kod','',CList);
    Case ShowModal OF
     mrOK :
     begin
      For I:=0 To CList.Items.Count-1 Do
       If CList.Checked[I] Then
        Value:=Value+'"'+FloatToStr(CList.AcCode[I])+'",';
         If Value <> '' Then Delete(Value,Length(Value),1);
         Result := Value;
       end;
     mrAll:
     begin
      For I:=0 To CList.Items.Count-1 Do
       If Not CList.Checked[I] Then
       Value:=Value+'"'+FloatToStr(CList.AcCode[I])+'",';
       If Value <> '' Then Delete(Value,Length(Value),1);
       Result := Value;
      end;
    End;
   finally
    Form.Free;
   end;
end;

Function CentKod(CName:String):Integer;
begin
     Qu.Sql.Clear;
     If Not CUser.Local Then
      Qu.Sql.Add('Select Kod From Cent C Where C.EName =:a ')
     Else
      Qu.Sql.Add('Select Kod From Cent C Where C.Nam =:a ');
     Qu.Params[0].AsString:=CName;
     Qu.Open;
     Result:=Qu.Fields[0].AsInteger;
     Qu.Close;
end;

Function CentName(CKod:Integer):String;
begin
     Qu.Sql.Clear;
     If Not CUser.Local Then
      Qu.Sql.Add('Select Ename From Cent C Where C.Kod =:a ')
     Else
      Qu.Sql.Add('Select Nam From Cent C Where C.Kod =:a ');
     Qu.Params[0].AsInteger:=CKod;
     Qu.Open;
     Result:=Qu.Fields[0].AsString;
     Qu.Close;
end;

Function CentHint(CKod:Integer):String;
begin
     Qu.Sql.Clear;
     Qu.Sql.Add('Select Nam,Grop From Cent C Where C.Kod =:a ');
     Qu.Params[0].AsInteger:=CKod;
     Qu.Open;
     Result:=Qu.Fields[0].AsString+chr(13)+Qu.Fields[1].AsString;
     Qu.Close;
end;

Function Get_CFilt_Account(AcName:String):String;
var
I:Integer;
begin
     Result:='';
     Frodm.Cperm.Filter:='Acnam='+QuotedStr(Acname);
     Frodm.Cperm.Filtered:=True;
     Frodm.Cperm.First;
     Case Frodm.Cperm.RecordCount of
     0     : Result:='Grop='+QuotedStr('XXYXYXXZX');
     1..100: Begin
              If cUser.CentFilter = '' Then
              For I:=1 to Frodm.Cperm.RecordCount Do
              Begin
               Result:=Result+' or Grop'+QuotedStr(Frodm.CPermGrop.AsString);
               Frodm.CPerm.Next;
              End;
              If CUser.CentFilter > '' Then
              For I:=1 to Frodm.Cperm.RecordCount Do
              Begin
               If Pos(Frodm.CpermGrop.AsString,CUser.CentFilter)>0 Then
                Result:=Result+' or Grop'+QuotedStr(Frodm.CPermGrop.AsString);
               Frodm.CPerm.Next;
              End;
             End;
     End;
     Frodm.Cperm.Filter:='Acnam='+QuotedStr(Acname);
     Frodm.Cperm.Filtered:=True;
     If Pos(' or',Result) =1  Then Delete(Result,1,3);
end;

Function CentString(CName:String):String;
begin
     If Pos('"',CName) = 0 Then
      Result:='"'+IntToStr(CentKod(CName))+'"'
     Else
      Result:=CName;
end;

Function CostString(CName:String):String;
begin
     If Pos('"',CName) = 0 Then
      Result:='"'+CName+'"'
     Else
      Result:=CName;
end;

Function GetTaf2(Kod:Real):Integer;
Var
S:String;
begin
 S:=FloatToStr(Kod);
 Result:=StrToInt(Copy(S,Length(S)-2,3));
end;

Function GetTaf(Kod:Real):Integer;
Var
S:String;
begin
 S:=FloatToStr(Kod);
 Result:=StrToInt(Copy(S,Length(S)-5,3));
end;

Function GetMo(Kod:Real):Integer;
Var
S:String;
begin
 S:=FloatToStr(Kod);
 Result:=StrToInt(Copy(S,Length(S)-8,3));
end;

Function GetKol(Kod:Real):Integer;
Var
S:String;
begin
 S:=FloatToStr(Kod);
 Result:=StrToInt(Copy(S,1,Length(S)-9));
 If Kod = 0 Then Result:=0;
end;

Function GetDas(Kod:Real):Integer;
Var
S:String;
begin
 S:=FloatToStr(Kod);
 Result:=StrToInt(Copy(S,1,Length(S)-12));
end;

Function GetGro(Kod:Real):Integer;
Var
S:String;
begin
 S:=FloatToStr(Kod);
 Result:=StrToInt(Copy(S,Length(S)-11,3));
end;

Procedure CreateTempBill;
Const
SQ='if exists (select * from sysobjects where id = object_id(N'+#39+'[dbo].[TempAc]'+#39+') '+
   ' and OBJECTPROPERTY(id, N'+#39+'IsUserTable'+#39+') = 1) drop table [dbo].[TempAc] '+
   ' CREATE TABLE [dbo].[TempAc] ('+
   '	[Id] [int] IDENTITY (1, 1) NOT NULL ,'+
   '	[Radif] [int] NULL ,       '+
   '	[Kol] [int] NULL ,       '+
   '	[AcKod] [Decimal] NULL , '+
   '	[CKod] [int] NULL ,  '+
   '	[CName] [varchar] (45) NULL ,  '+
   '	[Cost] [varchar] (45) NULL ,    '+
   '	[AcName] [varchar] (45) NULL ,   '+
   '	[Des] [varchar] (200) NULL ,   '+
   '	[Price] [money] NULL ,       '+
   '	[Bed] [money] NULL ,       '+
   '	[Bes] [money] NULL ,     '+
   '	[BKod] [int] NULL ,    '+
   '	[No] [int] NULL ,     '+
   '	[Mo] [int] NULL ,   '+
   '	[Taf] [int] NULL ,'+
   '	[Jos] [int] NULL'+
   ') ON [PRIMARY]'+
   'ALTER TABLE [dbo].[TempAc] WITH NOCHECK ADD'+
   '	CONSTRAINT [PK_TempAc] PRIMARY KEY  NONCLUSTERED'+
   '	('+
   '		[Id]'+
   '	)  ON [PRIMARY]';
Var
Table:TTable;
BQu:TQuery;
begin
     BQu:=TQuery.Create(Application);
     BQu.DatabaseName:=FroDM.DB1.DatabaseName;
     BQu.SQL.Add(SQ);
     BQu.ExecSQL;
     BQu.Free;
end;

Procedure MoveBillToTemp(Dated:Boolean;BNo:Integer);
Var
I,J,K:Integer;
BQu:TQuery;
T1:TTable;
Price:Currency;
begin
     T1:=TTable.Create(Application);
     T1.DatabaseName:=Frodm.DB1.DatabaseName;
     T1.TableName :='TempAc';
     BQu:=TQuery.Create(Application);
     BQu.DatabaseName:=FroDM.DB1.DatabaseName;
     If Dated Then
      BQu.SQL.Add('Select * From AcountBill A Where A.Dat=:n')
     Else
      BQu.SQL.Add('Select * From AcountBill A Where A.No=:n');
     BQu.Params[0].Value:=BNo;
     BQu.Open;
     CreateTempBill;
     T1.Open;
     For I:=1 To BQu.RecordCount Do
     Begin
      T1.Append;
      T1.Fields[2].AsInteger:=GetKol(BQu.Fields[5].AsFloat);
      T1.Fields[14].AsInteger:=GetMo(BQu.Fields[5].AsFloat);//T1.Fields[1].AsInteger*1000+
      T1.Fields[15].AsInteger:=GetTaf(BQu.Fields[5].AsFloat);
      T1.Fields[16].AsInteger:=GetTaf2(BQu.Fields[5].AsFloat);
      T1.Fields[3].AsFloat:=BQu.Fields[5].AsFloat;
      T1.Fields[4].AsInteger:=BQu.Fields[12].AsInteger;
      T1.Fields[5].AsString:=CentName(T1.Fields[4].AsInteger);
      T1.Fields[6].AsString:=BQu.Fields[11].AsString;
      T1.Fields[7].AsString:=BQu.Fields[6].AsString;
      T1.Fields[8].AsString:=BQu.Fields[7].AsString;
      Price:=BQu.Fields[3].AsCurrency;
      If Price > 0 Then
      Begin
       T1.Fields[9].AsCurrency:=Price;
       T1.Fields[12].AsInteger:=1;
       Price:=0;
      End;
      Price:=BQu.Fields[4].AsCurrency;
      If Price > 0 Then
      Begin
       T1.Fields[9].AsCurrency:=Price;
       T1.Fields[12].AsInteger:=-1;
       Price:=0;
      End;
      T1.Fields[13].AsInteger:=BNo;
      T1.Post;
      BQu.Next;
     End;
     BQu.Close;
     BQu.SQL.Clear;
     BQu.SQL.Add('Select Kol,BKod,Sum(Price) From TempAc  Group By Kol,BKod');
     BQu.SQL.Add(' Order by BKod Desc,Kol Desc');
     BQu.Open;
     For I:=1 To BQu.RecordCount Do
     Begin
      T1.Append;
      T1.Fields[1].AsInteger:=I;
      T1.Fields[2].AsInteger:=BQu.Fields[0].AsInteger;
      T1.Fields[7].AsString:=AccNam(BQu.Fields[0].AsInteger*1e9);
      T1.Fields[12].AsInteger:=BQu.Fields[1].AsInteger;
      If BQu.Fields[1].AsInteger > 0 Then
       T1.Fields[10].AsCurrency:=BQu.Fields[2].AsCurrency
      Else
       T1.Fields[11].AsCurrency:=BQu.Fields[2].AsCurrency;
      T1.Post;
      BQu.Next;
     End;
     BQu.Close;
(*//-------------------------
     BQu.SQL.Clear;
     BQu.SQL.Add('Select Mo,BKod,Kol,Sum(Price) From TempAc Where Not Mo Is Null ');
     BQu.SQL.Add('Group By Mo,BKod,Kol Order by Mo,BKod');
     BQu.Open;
     For I:=1 To BQu.RecordCount Do
     Begin
      T1.Append;
      T1.Fields[3].AsInteger:=-1;
      T1.Fields[13].AsInteger:=BQu.Fields[0].AsInteger;
      T1.Fields[1].AsInteger:=BQu.Fields[2].AsInteger;// GetKol(BQu.Fields[0].AsFloat*1e6);
      T1.Fields[6].AsString:=AccNam(BQu.Fields[2].AsInteger*1e9+BQu.Fields[0].AsFloat*1e6);
      T1.Fields[11].AsInteger:=BQu.Fields[1].AsInteger;
      T1.Fields[8].AsCurrency:=BQu.Fields[3].AsCurrency;
      T1.Post;
      BQu.Next;
     End;
     BQu.Close; *)
//----------Sorting
     BQu.SQL.Clear;
     BQu.SQL.Add('Select * From TempAc Order by BKod Desc,Kol Desc,Mo,CKod,Price');
     BQu.Open;
     T1.Close;
     T1.EmptyTable;
     T1.Open;
     K:=1;
     For I:=1 To BQu.RecordCount Do
     Begin
      T1.Append;
      For J:=1 To BQu.FieldCount-1 Do T1.Fields[J].Value:=BQu.Fields[J].Value;
      If BQu.Fields[9].IsNull then begin T1.Fields[1].Value:=K;K:=K+1; end;
      T1.Post;
      BQu.Next;
     End;
     BQu.Close;
     BQu.Free;
     T1.Close;
     T1.Free;
end;

Procedure GetTodayRates(atDate:Integer);
var
I:Integer;
begin
     If atDate=0 Then Exit;
     Frodm.Crate.Open;
     Frodm.Crate.Filter:=' Dat = '+IntToStr(atDate);
     Frodm.Crate.Filtered:=True;
     TodayRates.Clear;
     For I:=1 To Frodm.Crate.RecordCount Do
     Begin
      TodayRates.Add(Frodm.CrateCName.AsString+'='+Frodm.CrateFee.AsString);
      Frodm.Crate.Next;
     End;
     Frodm.Crate.Filtered:=False;
     Frodm.Crate.Filter:='';
     Frodm.Crate.Last;
     Frodm.Crate.Close;
end;

Function GetRate(CTip:String):Currency;
begin
     Result:=StrToFloat(TodayRates.Values[Ctip]);
end;

Procedure Fill_Rate;
Var
I:Integer;
begin
     Frodm.Crate.Open;
     Frodm.Crate.Filtered:=False;
     Frodm.Crate.Filter:='';
     TodayRates.Clear;
     Frodm.Crate.First;
     For I:=1 To Frodm.Crate.RecordCount Do
     Begin
      TodayRates.Add(Frodm.CrateCName.AsString+Frodm.CrateDat.AsString+'='+Frodm.CrateFee.AsString);
      Frodm.Crate.Next;
     End;
     Frodm.Crate.Last;
     Frodm.Crate.Close;
end;

Function GetRateatDate(CTip:String;inDate:Integer):Currency;
Var
St:String;
begin
     Result:=0;
     If Ctip = DefaultCurr Then
     Begin
      Result:=1;
      Exit;
     End;
     St:=TodayRates.Values[Ctip+IntToStr(InDate)];
     If St ='' Then St:=TodayRates.Values[Ctip+IntToStr(0)];
     If St <>'' Then Result:=StrToFloat(St);
end;

//Multi Currency reports
Function CurrToFar_Arzi (Cur:Currency;Cap:String):String;
var
I,J:Integer;
Str:String;
Begin
     Str :=CurrToStr(Int(Cur));
     J:=Length(Str)+1;
     For I:=1 to Length(Str) div 3  Do Insert('/',Str,j-3*I);
     Insert(Cap,Str,Length(Str)+1);
     If Cur < 0 Then Str:='('+Str+')';
     Result:=Str;
End;

Procedure Gardesh_Arzi(AccKod:Real;Cent,Cost,Curr:String);
begin
     If KodFound(AccKod) Then
     Case Frodm.AcKodUseKod.Value Of
     0: Gardesh_Rem_Arzi(AccKod,Cent,Cost,Curr);
     1: Gardesh_Mo_Arzi(AccKod,Cent,Cost,Curr);
     End;
end;

Procedure Gardesh_Mo_Arzi(Kod:Real;Cent,Cost,Curr:String);
Var
Rem,Bed,Bes:Currency;
I:Integer;
Filt:String;
begin
     Frodm.AcKod.IndexFieldNames:='AccKod';
     Frodm.AcKod.FindKey([Kod]);
     If (Frodm.AcKodKdas.Value = 1) or (Frodm.Ackodbarzi.Value=False) Then Exit;
     Filt :='Tip=0  and Ctip='+QuotedStr(Curr)+' and AcKod = '+FloatToStr(Kod);
     //If Sd>''   Then Filt:=Filt+' and Dat >= '+Sd;//1381-03-24
     //If Ed>''   Then Filt:=Filt+' and Dat <= '+Ed;//1381-03-24
     If Cent > '' Then Filt:=Filt+' and CKod In ('+CentString(Cent)+')';
     If Cost > '' Then Filt:=Filt+' and Cost In ('+CostString(Cost)+')';
     Qu.SQL.Clear;
     Qu.SQL.Add('Select CBed,CBes,Dat,Des,A.No');
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

Procedure Gardesh_Sum_Arzi(Kod,Ratio:Real;Var Bed,Bes:Currency;Var Dat:Integer;
Sd,Ed,Cent,Cost,Curr:String);
Const
Das=' and AcKod In (Select AccKod From AccountKod Where Kdas <> 1)';
Var
Filt:String;
begin
     Frodm.AcKod.IndexFieldNames:='AccKod';
     Frodm.AcKod.FindKey([Kod]);
     If (Frodm.AcKodKdas.Value = 1) or (Frodm.Ackodbarzi.Value=False) Then Exit;
     Filt:='Tip=0  and Ctip='+QuotedStr(Curr)+' and  (AcKod >='+FloatToStr(Kod)+' and AcKod <='+FloatToStr(Kod+Ratio)+')';
     If Cent>'' Then Filt:=Filt+' and CKod In ('+CentString(Cent)+')';
     If Cost>'' Then Filt:=Filt+' and Cost In ('+CostString(Cost)+')';
     If Sd>''   Then Filt:=Filt+' and Dat >= '+Sd;
     If Ed>''   Then Filt:=Filt+' and Dat <= '+Ed;
     Qu.SQL.Clear;
     Qu.SQL.Add('SELECT Sum(CBed),Sum(CBes),Max(Dat)');
     Qu.SQL.Add('FROM AcountBill');
     Qu.SQL.Add('WHERE '+Filt);
     Qu.Sql.Add(Das);
     Qu.Open;
     Bed:=Qu.Fields[0].AsCurrency;
     Bes:=Qu.Fields[1].AsCurrency;
     Dat:=Qu.Fields[2].AsInteger;
     Qu.Close;
end;

Procedure Gardesh_Kol_Arzi(Kod:Real;Sd,Ed,Cent,Cost,Curr:String);
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
     GQu.SQL.Add('WHERE Barzi=1 and AccKod > '+FloatToStr(Kod)+' and AccKod <= '
                  +FloatToStr(Kod+999*Rate));
     GQu.SQL.Add('ORDER BY AccKod');
     GQu.Open;
     GQu.First;
     For I:=1 To GQu.RecordCount Do
     Begin
       If Frac(GQu.Fields[0].AsFloat/Rate) = 0 Then
       Begin
         Gardesh_Sum_Arzi(GQu.Fields[0].AsFloat,Ratio,Bed,Bes,Dat,SD,ED,Cent,Cost,Curr);
         Frodm.Gardesh.Append;
         Frodm.GardeshDesc.Value :=GQu.Fields[1].AsString;
         Frodm.GardeshDiag.Value :=GQu.Fields[0].AsFloat;
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

Procedure Gardesh_Kol_Arzi_Name(Nam:String;Sd,Ed,Cent,Cost,Curr:String);
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
     GQu.SQL.Add('SELECT AccKod,Nam FROM AccountKod A Where  A.Barzi=1 and A.Nam= :n');
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
      Gardesh_Sum_Arzi(GQu.Fields[0].AsFloat,Ratio,Bed,Bes,Dat,Sd,Ed,Cent,Cost,Curr);
      Frodm.Gardesh.Append;
      Frodm.GardeshDat.Value:=Dat;
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

Procedure Kol_Taraz_Arzi(Sd,Ed,Cent,Cost,Curr:String);
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
     GQu.SQL.Add('WHERE Barzi=1 and UseKod =0 and KGp >0 and Kgro >0 and KKol =0 and Kmo =0'
                 +'and Ktaf =0');
     GQu.SQL.Add('ORDER BY AccKod');
     GQu.Open;
     GQu.First;
     For I:=1 To GQu.RecordCount Do
     Begin
      Gardesh_Sum_Arzi(GQu.Fields[0].AsFloat,Ratio,Bed,Bes,Dat,Sd,Ed,Cent,Cost,Curr);
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

Procedure Mo_Taraz_Arzi(Sd,Ed,Cent,Cost,Curr:String);
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

     GQu:=Tquery.Create(Application);
     GQu.DataBaseName:=CurrDb;
     GQu.SQL.Add('SELECT AccKod,Nam FROM AccountKod ');
     GQu.SQL.Add('WHERE ((Kgp >0 and Kgro >0 and KKol >0 and Kmo =0 and Ktaf =0 ) or');
     GQu.SQL.Add('(Kgp >0 and Kgro >0 and KKol =0 and Kmo =0 and Ktaf =0  and usekod=1))and Barzi=1');
     GQu.SQL.Add('ORDER BY AccKod');
     GQu.Open;
     GQu.First;
     For I:=1 To GQu.RecordCount Do
     Begin
      Gardesh_Sum_Arzi(GQu.Fields[0].AsFloat,Ratio,Bed,Bes,Dat,Sd,Ed,Cent,Cost,Curr);
      Frodm.Gardesh.Append;
      Frodm.GardeshDat.Value:=Dat;
      Frodm.GardeshDesc.Value :=KolName(GQu.Fields[0].AsFloat);
      Frodm.GardeshBedeh.Value :=Bed;
      Frodm.GardeshBestan.Value :=Bes;
      bsRem:=Bed-Bes;
      Frodm.GardeshDiag.Value :=GQu.Fields[0].AsFloat;
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

Procedure Taf_Taraz_Arzi(Sd,Ed,Cent,Cost,Curr:String);
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

     GQu:=Tquery.Create(Application);
     GQu.DataBaseName:=CurrDb;
     GQu.SQL.Add('SELECT AccKod,Nam FROM AccountKod ');
     GQu.SQL.Add('WHERE ((Kgp >0 and Kgro >0 and KKol >0 and Kmo >0 and Ktaf =0 ) or');
     GQu.SQL.Add('(Kgp >0 and Kgro >0 and KKol =0 and Kmo =0 and Ktaf =0  and usekod=1)or');
     GQu.SQL.Add('(Kgp >0 and Kgro >0 and KKol >0 and Kmo =0 and Ktaf =0  and usekod=1))and Barzi=1');
     GQu.SQL.Add('ORDER BY AccKod');
     GQu.Open;
     GQu.First;
     For I:=1 To GQu.RecordCount Do
     Begin
      Gardesh_Sum_Arzi(GQu.Fields[0].AsFloat,Ratio,Bed,Bes,Dat,Sd,Ed,Cent,Cost,Curr);
      Frodm.Gardesh.Append;
      Frodm.GardeshDat.Value:=Dat;
      Frodm.GardeshDesc.Value :=AccString(GQu.Fields[0].AsFloat);
      Frodm.GardeshBedeh.Value :=Bed;
      Frodm.GardeshBestan.Value :=Bes;
      bsRem:=Bed-Bes;
      Frodm.GardeshDiag.Value :=bsRem;
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

Procedure Jos_Taraz_Arzi(Sd,Ed,Cent,Cost,Curr:String);
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

     GQu:=Tquery.Create(Application);
     GQu.DataBaseName:=CurrDb;
     GQu.SQL.Add('SELECT AccKod,Nam FROM AccountKod ');
     GQu.SQL.Add('WHERE ((Kgp >0 and Kgro >0 and KKol >0 and Kmo >0 and Ktaf >0 ) or');
     GQu.SQL.Add('(Kgp >0 and Kgro >0 and KKol =0 and Kmo =0 and Ktaf =0  and usekod=1)or');
     GQu.SQL.Add('(Kgp >0 and Kgro >0 and KKol >0 and Kmo =0 and Ktaf =0  and usekod=1)or');
     GQu.SQL.Add('(Kgp >0 and Kgro >0 and KKol >0 and Kmo >0 and Ktaf =0  and usekod=1))and Barzi=1');
     GQu.SQL.Add('ORDER BY AccKod');
     GQu.Open;
     GQu.First;
     For I:=1 To GQu.RecordCount Do
     Begin
      Gardesh_Sum_Arzi(GQu.Fields[0].AsFloat,Ratio,Bed,Bes,Dat,Sd,Ed,Cent,Cost,Curr);
      Frodm.Gardesh.Append;
      Frodm.GardeshDat.Value:=Dat;
      Frodm.GardeshDesc.Value :=AccString(GQu.Fields[0].AsFloat);
      Frodm.GardeshBedeh.Value :=Bed;
      Frodm.GardeshBestan.Value :=Bes;
      bsRem:=Bed-Bes;
      Frodm.GardeshDiag.Value :=GQu.Fields[0].AsFloat;
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

Procedure Gardesh_Rem_Arzi(Kod:Real;Cent,Cost,Curr:String);
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
     GQu.SQL.Add('WHERE Barzi=1 and AccKod > '+FloatToStr(Kod)+' and AccKod <= '
                  +FloatToStr(Kod+999*Rate));
     GQu.SQL.Add('ORDER BY AccKod');//Nam
     GQu.Open;
     GQu.First;
     For I:=1 To GQu.RecordCount Do
     Begin
       If Frac(GQu.Fields[0].AsFloat/Rate) = 0 Then
       Begin
         Gardesh_Sum_Arzi(GQu.Fields[0].AsFloat,Ratio,Bed,Bes,Dat,'','',Cent,Cost,Curr);
         Frodm.Gardesh.Append;
         Frodm.GardeshDesc.Value :=GQu.Fields[1].AsString;
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
         Frodm.GardeshDiag.Value :=GQu.Fields[0].AsFloat;
         Frodm.GardeshBaghi.Value :=Rem;
         Frodm.GardeshDat.Value :=Dat;
         Frodm.Gardesh.Post;
       End;
         GQu.Next;
     End;
       GQu.Close;
       GQu.Free;
end;

Function Good_Choose(Table:TTable;iNo,iDat:Integer;GName:String):Boolean;
Var
Form:TFGFSelect;
I:Integer;
begin
  Form := TFGFSelect.Create(Application);
  with Form do
   Try
    BorderStyle:=bsDialog;
    Visible:=False;
    Dat:=iDat;
    No:=iNo;
    Name:=GName;
    T1:=Table;
    GFName.ItemIndex:=GFName.Items.IndexOf(Name);
    Case ShowModal OF
     mrOK :begin Windows.Beep(2500,1500); Result:=true; end;
     mrAll:begin Windows.Beep(2500,1500); Result:=true; end;
     mrCancel:Close;
    End;
   finally
    Form.Free;
   end;
end;

Function IsFormula (GKod:Integer):Boolean;
Var
GQu:TQuery;
begin
     GQu:=Tquery.Create(Application);
     GQu.DataBaseName:=CurrDb;
     GQu.SQL.Add('Select Count(MKod) From GForm Where MKod=:m');
     GQu.Params[0].Value:=GKod;
     GQu.Open;
     Result:=GQu.Fields[0].AsInteger >0 ;
     GQu.Close;
     GQu.Destroy;
end;

procedure MakeGoodTree(CTree: TTreeView);
Var
I,J,K,L,M:Integer;
Node,LNode:TTreeNode;
FKol,FMo:Integer;
begin
     ctree.Items.Clear;
     Ctree.Items.AddFirst(Nil,'œ—Œ  ò«·« ');
     Node:=Ctree.Items.GetFirstNode;
//-----Adding Kols-----
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Des,Kol From GChart Where Kol>0 and Mo=0 and Taf=0 Order By Des');
     Qu.Open;
     For I:=1 To Qu.RecordCount Do
     Begin
      Ctree.Items.AddChild(Node,Qu.Fields[0].AsString).OverlayIndex:=Qu.Fields[1].AsInteger;
      Qu.Next;
     End;
     Qu.Close;
//-----Adding Kols-----
     Node:=Ctree.Items[0].getFirstChild;
//------Adding Mo----
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Des,Mo From GChart Where Kol=:k and Mo>0 and Taf=0 Order By Des');
     For J:=0 to ctree.Items[0].Count-1 Do
     Begin
      Node:=Ctree.Items[0].Item[j];
      Qu.Params[0].Value:=Node.OverlayIndex;
      Qu.Open;
      Qu.First;
      For I:=1 To Qu.RecordCount Do
      Begin
       Ctree.Items.AddChild(Node,Qu.Fields[0].AsString).OverlayIndex:=Qu.Fields[1].AsInteger;
       Qu.Next;
      End;
      Qu.Close;
     End;

//------Adding Taf----
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Des,Taf From GChart Where Kol=:k and Mo=:m and Taf > 0 Order By Des');
     For J:=0 to ctree.Items[0].Count-1 Do
     Begin
      Node:=Ctree.Items[0].Item[j];
      FKol:=Node.OverlayIndex;
      For K:=0 To Ctree.Items[0].Item[j].Count-1 Do
      Begin
       Node:=Ctree.Items[0].Item[j].Item[K];
       FMo:=Node.OverlayIndex;
       Qu.Params[0].Value:=FKol;
       Qu.Params[1].Value:=FMo;
       Qu.Open;
       Qu.First;
       For I:=1 To Qu.RecordCount Do
       Begin
        Ctree.Items.AddChild(Node,Qu.Fields[0].AsString).OverlayIndex:=Qu.Fields[1].AsInteger;
        Qu.Next;
       End;
       Qu.Close;
      End;
     End;
//------Adding Taf----
     Ctree.Items[0].Expand(False);
//--------------------
     cTree.Images:=Main.TreeImage;
     CTree.StateImages:=Main.TreeImage;
     For I:=0 To CTree.Items.Count-1 Do
     Begin
      IF CTree.Items[i].Count > 0 Then
       CTree.Items[i].ImageIndex :=1
      Else
       CTree.Items[i].ImageIndex :=2;//-1
      CTree.Items[i].StateIndex:=CTree.Items[i].Level+3;
     End;

end;

end.
