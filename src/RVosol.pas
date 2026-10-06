unit RVosol;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Mask, Grids, DBGrids, ExtCtrls, PopupListBox, Db,
  DBTables, Buttons, ComCtrls, Menus;

type
  TFRVosol = class(TForm)
    Label1: TLabel;
    FNo: TEdit;
    Label2: TLabel;
    Dat1: TMaskEdit;
    Label4: TLabel;
    FAccNam: TDBComboBox;
    dbg: TDBGrid;
    Bevel2: TBevel;
    BSave: TBitBtn;
    Bexit: TBitBtn;
    Bedit: TBitBtn;
    Bprev: TBitBtn;
    Bnext: TBitBtn;
    Bprint: TBitBtn;
    BList: TPopupListBox;
    EdQu: TQuery;
    FSum: TDBEdit;
    Label5: TLabel;
    BNew: TBitBtn;
    BDel: TBitBtn;
    Sb: TStatusBar;
    DBCheckBox1: TDBCheckBox;
    Label3: TLabel;
    FDes: TDBEdit;
    Label6: TLabel;
    FDNo: TEdit;
    Label7: TLabel;
    FRNo: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    FCost: TDBComboBox;
    FCKod: TDBLookupComboBox;
    procedure NextTab(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FNoKeyPress(Sender: TObject; var Key: Char);
    procedure BeditClick(Sender: TObject);
    procedure Dat1Enter(Sender: TObject);
    procedure Dat1Exit(Sender: TObject);
    procedure dbgEnter(Sender: TObject);
    procedure dbgKeyPress(Sender: TObject; var Key: Char);
    procedure dbgEditButtonClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BprevClick(Sender: TObject);
    procedure BnextClick(Sender: TObject);
    procedure BSaveClick(Sender: TObject);
    procedure BexitClick(Sender: TObject);
    procedure dbgColEnter(Sender: TObject);
    procedure BListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FAccNamKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BNewClick(Sender: TObject);
    procedure BDelClick(Sender: TObject);
    procedure BprintClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FDNoKeyPress(Sender: TObject; var Key: Char);
    procedure FRNoKeyPress(Sender: TObject; var Key: Char);
    procedure FCKodKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    RNo:Integer;
    BNo:Integer;
    New:Boolean;
    Function Max_No:Integer;
    Procedure FNo_Exit;
    Procedure NewRec;
    Procedure CancelEdit;
    Function GetSum:Currency;
    Procedure DrawList(List:TPopupListBox;Index:Integer);
    Procedure SetImage;
    Procedure CancelFactor(Table1,Table2:TTable);
    Procedure RePostCheqes(State:Boolean);
    Function FindJariKod(Jari:String):Real;
    Function MoveToGrid(Serial:String):boolean;
    Function MoveFromResid(No:Integer):Boolean;
    Procedure MoveToJari;
    Procedure RemoveFromJari;
    Procedure Make_Bill;
  public
    { Public declarations }
    SNo:Integer;
    Name:String;
  end;

var
  FRVosol: TFRVosol;

implementation

uses ProVar, Routins, MainForm, FrooshDM, RPayRep, QrCtrls;

{$R *.DFM}

function TFRVosol.Max_No: Integer;
begin
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Max(I.No) From RVos I ');
     Qu.Open;
     Result:=Qu.Fields[0].AsInteger;
     Qu.Close;
end;

procedure TFRVosol.FNo_Exit;
begin
     If Not(Frodm.RVos.State =dsBrowse) Then
     Begin
       FNo.Text :=IntToStr(Frodm.RVosNo.Value);
       Exit;
     End;
     RNo:=StrToInt(FNo.Text);
     If Not(Frodm.RVos.Locate('No',RNo,[loCaseInsensitive])) Then NewRec;// Else BeditClick(Owner);
     Dat1.Text:=IntToDate(Frodm.RVosDat.AsInteger);
end;

procedure TFRVosol.NewRec;
begin
     Frodm.RVos.Append;
     Frodm.RVosNo.Value:=Max_No+1;
     Frodm.RVosDat.Value:=Fardate;
     Frodm.RVosPerm.Value:=False;
     Frodm.RvosBilled.Value:=False;
     Frodm.RVos.Post;
     Frodm.RVos.Edit;
     BSave.Enabled:=True;
     BEdit.Enabled:=False;
     New:=True;
     FNo.Text:=Frodm.RVosNo.AsString;
     Dat1.Text:=IntToDate(Frodm.RVosDat.AsInteger);
     Label6.Visible:=True;
     FDNo.Visible:=True;
     Label7.Visible:=True;
     FRNo.Visible:=True;
     RNo:=Frodm.RVosNo.Value
end;

procedure TFRVosol.CancelEdit;
Var
I,J:Integer;
begin
     If (Frodm.RVI.Filtered=False)or(EDQu.RecordCount = 0)or(EDQu.Active =False) Then Exit;
     Frodm.RVI.First;
     For I:=1 To Frodm.RVI.RecordCount Do Frodm.RVI.Delete;
     EdQu.First;
     For I:=1 To EdQu.RecordCount Do
     Begin
      Frodm.RVI.Append;
      For J:=0 To 5 Do Frodm.RVI.Fields[J].Value:=EdQu.Fields[J].Value;
      Frodm.RVI.Post;
      EdQu.Next;
     End;
     EdQu.Close;
     Frodm.RVos.Cancel;
     Frodm.RVI.First;
     RepostCheqes(True);
     Make_Bill;
     MoveToJari;
     Dat1.Text:=IntToDate(Frodm.RVosDat.AsInteger);
     FNo.Text:=Frodm.RVosNo.AsString;
end;

Function TFRVosol.GetSum:Currency;
begin
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Sum(PBill) From RVosI R Where R.No=:g ');
     Qu.Params[0].Value:=RNo;
     Qu.Open;
     Result:=Qu.Fields[0].AsCurrency;
     Qu.Close;
end;

Procedure TFRVosol.DrawList(List:TPopupListBox;Index:Integer);
begin
     List.Visible :=True;
     Bexit.Cancel :=False;
     List.SetFocus;
     List.ItemIndex :=List.Items.IndexOf(dbg.Columns[Index].Field.Text);
     If List.ItemIndex = -1 Then List.ItemIndex:=0;
end;

procedure TFRVosol.SetImage;
begin
     Main.glKey.GetBitmap(0,BPrev.Glyph);
     Main.glKey.GetBitmap(1,Bnext.Glyph);
     Main.glKey.GetBitmap(2,BPrint.Glyph);
     Main.glKey.GetBitmap(3,Bedit.Glyph);
     Main.glKey.GetBitmap(8,Bsave.Glyph);
     Main.glKey.GetBitmap(7,BExit.Glyph);
     Main.glKey.GetBitmap(5,Bdel.Glyph);
end;

Procedure TFRVosol.CancelFactor(Table1,Table2:TTable);
Var
I:Integer;
begin
     Table2.Cancel;
     If Not Table2.Filtered Then Exit;
     If Table2.RecordCount > 0 Then
         For I:=1 To Table2.RecordCount Do Table2.Delete;
     Table1.Delete;
end;

procedure TFRVosol.RePostCheqes(State:Boolean);
Var
I:Integer;
begin
     Frodm.RVI.First;
     For I:=1 To Frodm.RVI.RecordCount Do
     Begin
      Frodm.Rcheq.Locate('BNo;BDat;PBill',VarArrayof([Frodm.RVIBNo.Value,
      Frodm.RVIBDat.Value,Frodm.RVIPBill.Value]),[loCaseInsensitive]);
      Frodm.Rcheq.Edit;
      Case State Of
      True:
      Begin
       Frodm.RcheqKeler.AsBoolean:=False;
       Frodm.RcheqReckod.Value:=True;
       Frodm.RcheqVBNo.AsInteger:=FroDM.RVosNo.AsInteger;
      End;
      False:
      Begin
       Frodm.RcheqKeler.AsBoolean:=True;
       Frodm.RcheqReckod.Value:=False;
       Frodm.RcheqVBNo.Clear;
      End;
      End;
      Frodm.Rcheq.Post;
      Frodm.RVI.Next;
     End;
end;

Function TFRVosol.FindJariKod(Jari:String):Real;
begin
   Result:=0;
   If Frodm.JariNam.FindKey([Jari]) Then Result :=Frodm.JariNamAccKod.Value;
end;

function TFRVosol.MoveToGrid(Serial: String): boolean;
Var
I:Integer;
begin
     If Frodm.RVos.State = dsBrowse Then Exit;
     Qu.SQL.Clear;
     Qu.SQL.Add('Select BDat,BNo,Bank,PBill From Rcheq Where BNo=:b '+
                ' and RecKod = 0 and Keler=1 and Jari=:j');
     Qu.Params[0].Value:=Serial;
     Qu.Params[1].Value:=FAccNam.Text;
     Qu.Open;
     If Qu.RecordCount = 0 Then
     Begin
      Result:=False;
      Qu.Close;
      Exit;
     End;
     Result:=True;
     Frodm.RVI.Append;
     Frodm.RVIRadif.Value:=Frodm.RVI.RecordCount+1;
     Frodm.RVINo.Value:=Frodm.RVosNo.Value;
     For I:=0 To 3 Do Frodm.RVI.Fields[I+1].Value:=Qu.Fields[I].Value;
     Frodm.RVI.Post;
     Qu.Close;
end;

Function TFRVosol.MoveFromResid(No:Integer):Boolean;
Var
I,J:Integer;
begin
     If Frodm.RVos.State = dsBrowse Then Exit;
     If Frodm.RVI.RecordCount > 0 Then Exit;
     Qu.SQL.Clear;
     Qu.SQL.Add('Select BDat,BNo,Bank,PBill From RKeli R Where R.No=:b ');
     Qu.Params[0].Value:=No;
     Qu.Open;
     If Qu.RecordCount = 0 Then
     Begin
      Result:=False;
      Qu.Close;
      Exit;
     End;
     Result:=True;
     For I:=1 To Qu.RecordCount Do
     Begin
      Frodm.RVI.Append;
      Frodm.RVIRadif.Value:=Frodm.RVI.RecordCount+1;
      Frodm.RVINo.Value:=Frodm.RVosNo.Value;
      For J:=0 To 3 Do Frodm.RVI.Fields[J+1].Value:=Qu.Fields[J].Value;
      Frodm.RVI.Post;
      Qu.Next;
     End;
     Qu.Close;
     Qu.SQL.Clear;
     Qu.SQL.Add('Select AcNam From RKel R Where R.No=:b ');
     Qu.Params[0].Value:=No;
     Qu.Open;
     Frodm.RvosAcnam.Value:=Qu.Fields[0].AsString;
     Qu.Close;
end;

Procedure TFRVosol.MoveToJari;
Var
Table:TTable;
I:Integer;
begin
     Table:=TTable.Create(Owner);
     Table.DatabaseName :=CurrDb;
     Table.TableName :='dbo.Jari'+FAccNam.Text;
     Table.Active:=True;
     Table.Refresh;
     Table.Last;
     Frodm.RVI.First;
     For I:=1 To Frodm.RVI.RecordCount Do
     Begin
      Table.Append;
      Table.FieldByName('Bestan').AsCurrency:=Frodm.RVIPbill.Value;
      Table.FieldByName('Bedeh').AsCurrency:=0;
      Table.FieldByName('Dat').AsInteger:=Frodm.RvosDat.Value;
      Table.FieldByName('Serial').AsString:=Frodm.RVIBno.AsString;
      //Table.FieldByName('Rema').AsCurrency:=Rem+Price;
      Table.FieldByName('Des').AsString:='Ê’Ê· çﬂ ‘„«—Â'+Frodm.RVIBno.AsString;
      Table.Post;
      Frodm.RVI.Next;
     End;
     JariRepair(Table);
     Table.Close;
     Table.Free;
end;

Procedure TFRVosol.RemoveFromJari;
Var
Table:TTable;
I:Integer;
jDat:Integer;
jSerial:String;
jPBill:Currency;
begin
     Table:=TTable.Create(Owner);
     Table.DatabaseName :=CurrDb;
     Table.TableName :='dbo.Jari'+FAccNam.Text;
     Table.Active:=True;
     Frodm.RVI.First;
     For I:=1 To Frodm.RVI.RecordCount Do
     Begin
      jDat:=Frodm.RvosDat.Value;
      jSerial:=Frodm.RVIBno.AsString;
      jPBill:=Frodm.RVIPbill.Value;
      If Table.Locate('Dat;Serial;Bestan',VarArrayOf([jDat,jSerial,jPBill]),
      [loCaseInsensitive]) Then Table.Delete;
      Frodm.RVI.Next;
     End;
     JariRepair(Table);
     Table.Close;
     Table.Free;
end;

Procedure TFRVosol.Make_Bill;
Var
I:Integer;
BesKod,BehKod:Real;
Net:Currency;
BTip,NBNo,BDat:Integer;
St:String;
begin
     BTip:=15;
     Frodm.AutoBill.FindKey(['VCD']);
     BesKod:=Frodm.AutoBillBesKod.Value;
     BehKod:=FindJariKod(FAccNam.Text);
     Frodm.RVI.First;
     For I:=1 To Frodm.RVI.RecordCount Do
     Begin
      St:='Ê’Ê· çò ‘„«—Â'+' '+Frodm.RVIBno.AsString+' ÿÌ —”Ìœ ‘„«—Â '+Frodm.RVosNo.AsString;
      BDat:=Frodm.RVosDat.Value;
      Net:=Frodm.RVIPbill.Value;
      NBNo:=AutoBill(True,0,BehKod,Net,St,Frodm.RVosNo.AsString,BNo,BTip,BDat,
      Frodm.RVosCost.AsString,Frodm.RVosCkod.AsInteger,Net,1,DefaultCurr);
      Frodm.RVI.Next;
     End;
     Frodm.RVI.First;

     St:='Ã„⁄ ò· —”Ìœ Ê’Ê· «”‰«œ ‘„«—Â'+' '+Frodm.RVosNo.AsString;
     Net:=Frodm.RVosPsum.Value;
     BDat:=Frodm.RVosDat.Value;
     NBNo:=AutoBill(True,BesKod,0,Net,St,Frodm.RVosNo.AsString,BNo,BTip,BDat,
     Frodm.RVosCost.AsString,Frodm.RVosCkod.AsInteger,Net,1,DefaultCurr);

     If NBNo = BNo Then BillUpdate(BNo) Else
      If sBill Then MakeBill(' ”‰œ —”Ìœ Ê’Ê· «”‰«œ ‘„«—Â '+Frodm.RVosNo.AsString);
     BNo:=NBNo;
end;

procedure TFRVosol.NextTab(Sender: TObject; var Key: Char);
begin
     If Key=#13 Then
     Begin
      Key:=#0;
      SelectNext(Sender As TWinControl,True,True);
     End;
end;

procedure TFRVosol.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Case New Of
     True : IF Check_Factor_State(Frodm.RVos,BSaveClick,FormDestroy)=idCancel Then
      Action :=caNone
     Else
      Action:=caFree;
     False:Action:=caFree;
     End;
     If Action = caFree Then
     Begin
      Frodm.RVI.Filtered:=False;
      frodm.RVI.Close;
      Frodm.Rvos.Close;
      Frodm.Rcheq.Close;
     End;
end;

procedure TFRVosol.FormActivate(Sender: TObject);
begin
     Frodm.RVI.Filtered:=True;
     Frodm.Rcheq.Open;
end;

procedure TFRVosol.FormCreate(Sender: TObject);
begin
     SetImage;
     Set_Forms(Self);
     EdQu.DatabaseName:=CurrDb;
     FCost.Items.Assign(CostList);
     Fill_Comb(Frodm.JariNam,'Nam',FAccNam.Items);
     Fill_Comb(Frodm.Rcheq,'Bank',BList.Items);
     Frodm.RVos.Open;
     Frodm.RVI.Open;
     Frodm.RVos.Last;
     FNo.Text:=Frodm.RVosNo.AsString;
     Dat1.Text:=IntToDate(Frodm.RVosDat.AsInteger);
//     NewRec;
end;

procedure TFRVosol.FormDestroy(Sender: TObject);
begin
     If Frodm.RVos.State = dsBrowse Then Exit;
     FNo.SetFocus;
     Case New Of
     True  :Begin
             CancelFactor(Frodm.RVos,Frodm.RVI);
             FNo.Text:=IntToStr(Frodm.RVosNo.Value);
             Dat1.Text:=IntToDate(Frodm.RVosDat.AsInteger);
            End;
     False : CancelEdit;
     End;
     BSave.Enabled:=False;
     BEdit.Enabled:=True;
     Label6.Visible:=False;
     FDNo.Visible:=False;
     Label7.Visible:=False;
     FRNo.Visible:=False;
end;

procedure TFRVosol.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key Of
      VK_F3: BsaveClick(Sender);
      VK_INSERT: BNewClick(Sender);
      VK_DELETE:If Shift = [ssCtrl] Then BDelClick(Sender);
      VK_RETURN:If Shift = [ssAlt] Then BEditClick(Sender);
      VK_Left:If Shift = [ssAlt] Then BprevClick(Sender);
      VK_RIGHT:If Shift = [ssAlt] Then BnextClick(Sender);
      End;
end;

procedure TFRVosol.FNoKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then FNo_Exit;
     NextTab(Sender,Key);
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;
end;

procedure TFRVosol.Dat1Enter(Sender: TObject);
begin
     If Frodm.RVos.State = dsBrowse Then Dat1.ReadOnly :=True Else
     Begin
        Dat1.ReadOnly :=False;
        GetMaskText(Dat1);
     End;
end;

procedure TFRVosol.Dat1Exit(Sender: TObject);
begin
     If (Frodm.RVos.State = dsBrowse) Then Exit;
     SetMaskText(Dat1);
     If(Not Date_Check(Dat1.Text))And(DateToInt(Dat1.Text)>0) Then
      Dat1.SetFocus
     Else
       Frodm.RVosdat.Value :=DateToInt(Dat1.Text);
end;

procedure TFRVosol.FAccNamKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Frodm.RVos.State = dsBrowse Then Exit;
     If Key = 32 Then
     Begin
      Frodm.RVosAcNam.Value:=FindAccount(Frodm.RVosAcNam.Value,FindCode);
      Frodm.RvosAccKod.AsFloat:=FindCode;
     End;
end;

procedure TFRVosol.FDNoKeyPress(Sender: TObject; var Key: Char);
begin
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0','/',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;
     If (Key =#13)and (FDNo.Text <>'')Then
     Begin
      Key:=#0;
      If Not MoveToGrid(FDNo.Text) Then ShowMessage('»« «Ì‰ ”—Ì«· çò „ÊÃÊœ ‰Ì” ');
      FDNo.SelectAll;
     End Else
      NextTab(Sender,Key);
end;

procedure TFRVosol.FRNoKeyPress(Sender: TObject; var Key: Char);
begin
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0','/',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;
     If (Key =#13)and (FRNo.Text <>'')Then
     Begin
      Key:=#0;
      If Not MoveFromResid(StrToInt(FRNo.Text)) Then ShowMessage('»« «Ì‰ ‘„«—Â —”Ìœ „ÊÃÊœ ‰Ì” ');
     End Else
      NextTab(Sender,Key);
end;

procedure TFRVosol.dbgEnter(Sender: TObject);
begin
     If (Frodm.RVos.State = dsBrowse)  Then
       dbg.ReadOnly := True Else dbg.ReadOnly :=False;
     dbg.selectedField:=dbg.Columns[0].Field;
end;

procedure TFRVosol.dbgKeyPress(Sender: TObject; var Key: Char);
Var
Radif:Integer;
begin
     If Key = #13 Then
     Begin
      Key:=#0;
      GridMove(dbg,Frodm.RVos,Radif);
     End;
     If Not(Frodm.RVos.State = dsBrowse) Then Frodm.RVI.Edit;
end;

procedure TFRVosol.dbgEditButtonClick(Sender: TObject);
begin
     If (Frodm.RVos.State In [dsInsert,dsEdit]) Then
     Begin
       Frodm.RVI.Delete;
       Frodm.RVI.Edit;
     End;
end;


procedure TFRVosol.BprevClick(Sender: TObject);
begin
     If Frodm.RVos.State In [dsEdit,dsInsert] Then
     Begin
       FNo.SetFocus;
       IF Check_Factor_State(Frodm.RVos,BSaveClick,FormDestroy) = idCancel Then Exit;
       New:=False;
       Exit;
     End;
     Frodm.RVos.Refresh;
     Frodm.RVos.Prior;
     Dat1.Text:=IntToDate(Frodm.RVosDat.AsInteger);
     FNo.Text:=IntToStr(Frodm.RVosNo.Value);
     RNo:=Frodm.RVosNo.Value;
end;

procedure TFRVosol.BnextClick(Sender: TObject);
begin
     If Frodm.RVos.State In [dsEdit,dsInsert] Then
     Begin
       FNo.SetFocus;
       IF Check_Factor_State(Frodm.RVos,BSaveClick,FormDestroy) = idCancel Then Exit;
       New:=False;
       Exit;
     End;
     Frodm.RVos.Refresh;
     Frodm.RVos.Next;
     Dat1.Text:=IntToDate(Frodm.RVosDat.AsInteger);
     FNo.Text:=IntToStr(Frodm.RVosNo.Value);
     RNo:=Frodm.RVosNo.Value;
end;

procedure TFRVosol.BeditClick(Sender: TObject);
begin
     If Not(Frodm.RVos.State = dsBRowse) Then Exit;
     If Frodm.RVosPerm.Value Then
     Begin
      Beep;
      ShowMessage('ﬁÿ⁄Ì ‘œÂ «” ');
      Exit;
     End;
     Dat1.Text:=IntToDate(Frodm.RVosDat.AsInteger);
     FAccNam.ItemIndex:=FAccNam.Items.IndexOf(FAccNam.Text);
     RNo:=Frodm.RVosNo.AsInteger;
     BNo:=Frodm.RVosBno.Value;
     DelBitem(IntToStr(RNo),BNo,15);
     RepostCheqes(False);
     RemoveFromJari;
     EdQu.Params[0].Value:=RNo;
     EdQu.Open;
     Frodm.RVos.Edit;
     New:=False;
     BSave.Enabled:=True;
     BEdit.Enabled:=False;
     Dat1.SetFocus;
     Label6.Visible:=True;
     FDNo.Visible:=True;
     Label7.Visible:=True;
     FRNo.Visible:=True;
end;

procedure TFRVosol.BSaveClick(Sender: TObject);
begin
     If (Frodm.RVos.State = dsBRowse) Then Exit;
     If Frodm.RVI.RecordCount = 0 Then
     Begin
      Frodm.RVos.Delete;
      FNo.Text:=Frodm.RVosNo.AsString;
      Dat1.Text:=IntToDate(Frodm.RVosDat.AsInteger);
      RNo:=Frodm.RVosNo.AsInteger;
      New:=False;
     End Else Begin
//      Frodm.RVosAccKod.Value:=AccKod(Frodm.RVosAcnam.AsString);
      Frodm.RVosPsum.Value:=GetSum;
      Frodm.RVos.Post;
      RepostCheqes(True);
      Make_Bill;
      FacBillNo(Frodm.RVos,Frodm.RVosNo.AsInteger,BNo);
      MoveToJari;
     End;
     QuickCloseOpen([47,46,6,24,8]);
     EdQu.Close;
     Frodm.RVos.Locate('No',RNo,[loCaseInsensitive]);
     FNo.Text:=Frodm.RVosNo.AsString;
     Dat1.Text:=IntToDate(Frodm.RVosDat.AsInteger);
     BSave.Enabled:=False;
     BEdit.Enabled:=True;
     New:=False;
     BNo:=0;
     Label6.Visible:=False;
     FDNo.Visible:=False;
     Label7.Visible:=False;
     FRNo.Visible:=False;
end;

procedure TFRVosol.BexitClick(Sender: TObject);
begin
     If Frodm.RVos.State In [dsEdit,dsInsert] Then
     Begin
       FNo.SetFocus;
       IF Check_Factor_State(Frodm.RVos,BSaveClick,FormDestroy) = idCancel Then Exit;
       Exit;
     End;
     Close;
end;

procedure TFRVosol.dbgColEnter(Sender: TObject);
begin
     If Frodm.RVos.State = dsBrowse Then Exit Else Frodm.RVI.Edit;
     Case Dbg.SelectedField.Index Of
     5: Frodm.RVINo.AsInteger:=FroDM.RVosNo.AsInteger;
     3: If BList.Items.Count > 0 Then  DrawList(BList,3);
     End;
end;

procedure TFRVosol.BListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key Of
     27: Begin
          dbg.SelectedField:=Frodm.RVIBank;
          dbg.SetFocus;
          Bexit.Cancel :=True;
         End;

     13: Begin
          Key:=0;
          Frodm.RVIBank.Value:=BList.Items[BList.ItemIndex];
          dbg.SelectedField:=Frodm.RVIPBill;
          dbg.SetFocus;
          Bexit.Cancel :=True;
         End;
     End;
end;

procedure TFRVosol.dbgKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key Of
     VK_F4 :If (Dbg.SelectedField.Index = 3)and Not(Frodm.RVos.State=dsBrowse) Then
              Drawlist(BList,3);
     VK_TAB: If (ssShift in Shift)and(dbg.Row=1)and(dbg.SelectedIndex=0) Then
              SelectNext(Sender As TWinControl,Not (ssShift in Shift),True) Else
             If Not(ssShift in Shift)and(dbg.Row=dbg.DataSource.DataSet.RecordCount)and
             (dbg.SelectedIndex=dbg.Columns.Count-1) Then
              SelectNext(Sender As TWinControl,Not (ssShift in Shift),True);

     End;
end;

procedure TFRVosol.BNewClick(Sender: TObject);
begin
     If Frodm.RVos.State <> dsBrowse Then Exit;
     NewRec;
end;

procedure TFRVosol.BDelClick(Sender: TObject);
Var
I:Integer;
begin
     If Not (Frodm.RVos.State = dsBrowse) Then Exit;
     If Frodm.RVosPerm.Value Then
     Begin
      Beep;
      ShowMessage('ﬁÿ⁄Ì ‘œÂ «” ');
      Exit;
     End;
     If MessageDlg('—”Ìœ çò Õ–› ‘Êœø',mtWarning,mbYesNo,-1) = mrYes Then
     begin
      RNo:=Frodm.RVosNo.AsInteger;
      BNo:=Frodm.RVosBno.AsInteger;
      DelBItem(IntToStr(RNo),BNo,15);
      BillUpdate(BNo);
      RepostCheqes(False);
      RemoveFromJari;
      For I:=1 To Frodm.RVI.RecordCount Do Frodm.RVI.Delete;
      Frodm.RVos.Delete;
      FNo.Text:=Frodm.RVosNo.AsString;
      Dat1.Text:=IntToDate(Frodm.RVosDat.AsInteger);
     End;
end;

procedure TFRVosol.BprintClick(Sender: TObject);
Var
I:Integer;
QDbT:TQRDbText;
begin
     If Not(Frodm.RVos.State = dsBrowse) Then Exit;
     CreatingForm(TQrRPay,'QrRPay',QrRPay);
     Set_Sys_Enviroment;
     QrRPay.ShowProgress:=True;
     QrRPay.qrTit.Caption:=InvoLbl;
     //QrRPay.qrAdd.Caption:=Master;
     QrRPay.QRLabel3.Caption:=Caption;
     //QrRPay.QRLabel6.Caption:=Label4.Caption;
     For I:=0 To QrRPay.ComponentCount-1 Do
     Begin
      If QrRPay.Components[I] is TQRDbText Then
      Begin
       QDbT:=(QrRPay.Components[I] As TQRDbText);
       If QDbT.DataSet =Frodm.RPay Then QDbT.DataSet :=Frodm.Rvos;
       If QDbT.DataSet =Frodm.RPI Then QDbT.DataSet :=Frodm.RVI;
      End;
     End;
     QrRPay.QrArt.DataSet:=Frodm.RVI;
     QrRPay.Preview;
     QrRPay.Destroy;
end;


procedure TFRVosol.FCKodKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetCentLookup(Sender,Key);
end;

end.
