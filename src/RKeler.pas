unit RKeler;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Mask, Grids, DBGrids, ExtCtrls, PopupListBox, Db,
  DBTables, Buttons, ComCtrls, Menus, ppEndUsr, ppProd, ppClass, ppReport,
  ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, ppBands, ppCache, ppCtrls,
  ppPrnabl, ppParameter;

type
  TFRKeler = class(TForm)
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
    Label8: TLabel;
    FCost: TDBComboBox;
    FCKod: TDBLookupComboBox;
    ppBDEPipeline1: TppBDEPipeline;
    ppKelerRep: TppReport;
    ppDesigner1: TppDesigner;
    PQu: TQuery;
    DS: TDataSource;
    ppParameterList1: TppParameterList;
    PQuBDEDesigner: TIntegerField;
    PQuBDEDesigner2: TIntegerField;
    PQuBDEDesigner3: TCurrencyField;
    PQuBDEDesigner4: TStringField;
    PQuBDEDesigner5: TStringField;
    PQuBDEDesigner6: TIntegerField;
    PQuBDEDesigner7: TStringField;
    PQuBDEDesigner8: TCurrencyField;
    PQuBDEDesigner9: TStringField;
    ppHeaderBand1: TppHeaderBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppLabel1: TppLabel;
    ppDBText6: TppDBText;
    ppDBText9: TppDBText;
    ppDetailBand1: TppDetailBand;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText7: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppDBText8: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
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
    Function MoveToGrid(Serial:String):boolean;
    Procedure Make_Bill;
    Function IsEditable:Boolean;
  public
    { Public declarations }
    SNo:Integer;
    Name:String;
  end;

var
  FRKeler: TFRKeler;

implementation

uses ProVar, Routins, MainForm, FrooshDM, RPayRep,QrCtrls;

{$R *.DFM}

function TFRKeler.Max_No: Integer;
begin
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Max(I.No) From RKel I ');
     Qu.Open;
     Result:=Qu.Fields[0].AsInteger;
     Qu.Close;
end;

procedure TFRKeler.FNo_Exit;
begin
     If Not(Frodm.RKel.State =dsBrowse) Then
     Begin
       FNo.Text :=IntToStr(Frodm.RKelNo.Value);
       Exit;
     End;
     RNo:=StrToInt(FNo.Text);
     If Not(Frodm.RKel.Locate('No',RNo,[loCaseInsensitive])) Then NewRec;// Else BeditClick(Owner);
     Dat1.Text:=IntToDate(Frodm.RKelDat.AsInteger);
end;

procedure TFRKeler.NewRec;
begin
     Frodm.RKel.Append;
     Frodm.RKelNo.Value:=Max_No+1;
     Frodm.RKelDat.Value:=Fardate;
     Frodm.RKelPerm.Value:=False;
     Frodm.RkelBilled.Value:=False;
     Frodm.RKel.Post;
     Frodm.RKel.Edit;
     BSave.Enabled:=True;
     BEdit.Enabled:=False;
     New:=True;
     FNo.Text:=Frodm.RKelNo.AsString;
     Dat1.Text:=IntToDate(Frodm.RKelDat.AsInteger);
     Label6.Visible:=True;
     FDNo.Visible:=True;
     RNo:=Frodm.RKelNo.Value
end;

procedure TFRKeler.CancelEdit;
Var
I,J:Integer;
begin
     If (Frodm.RKI.Filtered=False)or(EDQu.RecordCount = 0)or(EDQu.Active =False) Then Exit;
     Frodm.RKI.First;
     For I:=1 To Frodm.RKI.RecordCount Do Frodm.RKI.Delete;
     EdQu.First;
     For I:=1 To EdQu.RecordCount Do
     Begin
      Frodm.RKI.Append;
      For J:=0 To 6 Do Frodm.RKI.Fields[J].Value:=EdQu.Fields[J].Value;
      Frodm.RKI.Post;
      EdQu.Next;
     End;
     EdQu.Close;
     Frodm.RKel.Cancel;
     Frodm.RKI.First;
     RepostCheqes(True);
     Make_Bill;
     Dat1.Text:=IntToDate(Frodm.RKelDat.AsInteger);
     FNo.Text:=Frodm.RKelNo.AsString;
end;

Function TFRKeler.GetSum:Currency;
begin
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Sum(PBill) From RKelI R Where R.No=:g ');
     Qu.Params[0].Value:=RNo;
     Qu.Open;
     Result:=Qu.Fields[0].AsCurrency;
     Qu.Close;
end;

Procedure TFRKeler.DrawList(List:TPopupListBox;Index:Integer);
begin
     List.Visible :=True;
     Bexit.Cancel :=False;
     List.SetFocus;
     List.ItemIndex :=List.Items.IndexOf(dbg.Columns[Index].Field.Text);
     If List.ItemIndex = -1 Then List.ItemIndex:=0;
end;

procedure TFRKeler.SetImage;
begin
     Main.glKey.GetBitmap(0,BPrev.Glyph);
     Main.glKey.GetBitmap(1,Bnext.Glyph);
     Main.glKey.GetBitmap(2,BPrint.Glyph);
     Main.glKey.GetBitmap(3,Bedit.Glyph);
     Main.glKey.GetBitmap(8,Bsave.Glyph);
     Main.glKey.GetBitmap(7,BExit.Glyph);
     Main.glKey.GetBitmap(5,Bdel.Glyph);
end;

Procedure TFRKeler.CancelFactor(Table1,Table2:TTable);
Var
I:Integer;
begin
     Table2.Cancel;
     If Not Table2.Filtered Then Exit;
     If Table2.RecordCount > 0 Then
         For I:=1 To Table2.RecordCount Do Table2.Delete;
     Table1.Delete;
end;

procedure TFRKeler.RePostCheqes(State:Boolean);
Var
I:Integer;
begin
     Frodm.RKI.First;
     For I:=1 To Frodm.RKI.RecordCount Do
     Begin
      Frodm.Rcheq.Locate('BNo;BDat;PBill',VarArrayof([Frodm.RKIBNo.Value,
      Frodm.RKIBDat.Value,Frodm.RKIPBill.Value]),[loCaseInsensitive]);
      Frodm.Rcheq.Edit;
      Case State Of
      True:
      Begin
       Frodm.RcheqKeler.AsBoolean:=True;
       Frodm.RcheqPBNo.AsInteger:=FroDM.RKelNo.AsInteger;
       Frodm.RcheqJari.Value:=FroDM.RKelAcNam.Value;
      End;
      False:
      Begin
       Frodm.RcheqKeler.AsBoolean:=False;
       Frodm.RcheqPBNo.Clear;
       Frodm.RcheqJari.Clear;
      End;
      End;
      Frodm.Rcheq.Post;
      Frodm.RKI.Next;
     End;

end;

function TFRKeler.MoveToGrid(Serial: String): boolean;
Var
I:Integer;
begin
     If Frodm.RKel.State = dsBrowse Then Exit;
     Qu.SQL.Clear;
     Qu.SQL.Add('Select BDat,BNo,Bank,PBill,Reject From Rcheq Where BNo=:b '+
                ' and RecKod = 0 and Keler=0');
     Qu.Params[0].Value:=Serial;
     Qu.Open;
     If Qu.RecordCount = 0 Then
     Begin
      Result:=False;
      Qu.Close;
      Exit;
     End;
     Result:=True;
     Frodm.RKI.Append;
     Frodm.RKIRadif.Value:=Frodm.RKI.RecordCount+1;
     Frodm.RKINo.Value:=Frodm.RKelNo.Value;
     Frodm.RKIReject.Value:=Qu.Fields[4].Value;
     For I:=0 To 3 Do Frodm.RKI.Fields[I+2].Value:=Qu.Fields[I].Value;
     Frodm.RKI.Post;
     Qu.Close;

end;

Procedure TFRKeler.Make_Bill;
Var
I:Integer;
BesKod,BehKod:Real;
Net:Currency;
BTip,NBNo,BDat:Integer;
St:String;
begin
     BTip:=17;
     BesKod:=Def_Vosol;
     BehKod:=Def_Keler;
     Frodm.RKI.First;
     For I:=1 To Frodm.RKI.RecordCount Do
     Begin
      St:='ò·—Ì‰ê çò ‘„«—Â'+' '+Frodm.RKIBno.AsString+' ÿÌ —”Ìœ ‘„«—Â '+Frodm.RKelNo.AsString;
      Net:=Frodm.RKIPbill.Value;
      BDat:=Frodm.RKelDat.Value;
      NBNo:=AutoBill(True,0,BehKod,Net,St,Frodm.RKelNo.AsString,BNo,BTip,BDat,
      Frodm.RKelCost.AsString,Frodm.RKelCkod.AsInteger,Net,1,DefaultCurr);
      Frodm.RKI.Next;
     End;
     Frodm.RKI.First;

     St:='Ã„⁄ ò· —”Ìœ «”‰«œ œ— Ã—Ì«‰ Ê’Ê· ‘„«—Â'+' '+Frodm.RKelNo.AsString;
     Net:=Frodm.RKelPsum.Value;
     BDat:=Frodm.RKelDat.Value;
     NBNo:=AutoBill(True,BesKod,0,Net,St,Frodm.RKelNo.AsString,BNo,BTip,BDat,
     Frodm.RKelCost.AsString,Frodm.RKelCkod.AsInteger,Net,1,DefaultCurr);

     If NBNo = BNo Then BillUpdate(BNo) Else
      If sBill Then MakeBill('”‰œ —”Ìœ«”‰«œ œ— Ã—Ì«‰ Ê’Ê· ‘„«—Â'+Frodm.RKelNo.AsString);
     BNo:=NBNo;
end;

Function TFRKeler.IsEditable:Boolean;
Var
I:Integer;
begin
     Result:=False;
     Frodm.RKI.First;
     For I:=1 To Frodm.RKI.RecordCount Do
     Begin
      Frodm.Rcheq.Locate('BNo;BDat;PBill',VarArrayof([Frodm.RKIBNo.Value,
      Frodm.RKIBDat.Value,Frodm.RKIPBill.Value]),[loCaseInsensitive]);
      Result:=Not Frodm.RcheqReckod.Value;
      If Not Result Then Exit;
      Frodm.RKI.Next;
     End;
     Frodm.RKI.First;
end;

procedure TFRKeler.NextTab(Sender: TObject; var Key: Char);
begin
     If Key=#13 Then
     Begin
      Key:=#0;
      SelectNext(Sender As TWinControl,True,True);
     End;
end;

procedure TFRKeler.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Case New Of
     True : IF Check_Factor_State(Frodm.RKel,BSaveClick,FormDestroy)=idCancel Then
      Action :=caNone
     Else
      Action:=caFree;
     False:Action:=caFree;
     End;

     If Action=caFree Then
     Begin
      Frodm.RKI.Filtered:=False;
      Frodm.Rkel.Close;
      Frodm.RKI.Close;
      Frodm.Rcheq.Close;
     End;

end;
procedure TFRKeler.FormActivate(Sender: TObject);
begin
     Frodm.RKI.Filtered:=True;
     Frodm.Rcheq.Open;
end;

procedure TFRKeler.FormCreate(Sender: TObject);
begin
     SetImage;
     Set_Forms(Self);
     Frodm.Rkel.Open;
     Frodm.RKI.Open;
     EdQu.DatabaseName:=CurrDb;
     PQu.DatabaseName:=CurrDb;
     FCost.Items.Assign(CostList);
     Fill_Comb(Frodm.JariNam,'Nam',FAccNam.Items);
     Fill_Comb(Frodm.Rcheq,'Bank',BList.Items);
     Frodm.RKel.Last;
     FNo.Text:=Frodm.RKelNo.AsString;
     Dat1.Text:=IntToDate(Frodm.RKelDat.AsInteger);
//     NewRec;
end;

procedure TFRKeler.FormDestroy(Sender: TObject);
begin
     If Frodm.RKel.State = dsBrowse Then Exit;
     FNo.SetFocus;
     Case New Of
     True  :Begin
             CancelFactor(Frodm.RKel,Frodm.RKI);
             FNo.Text:=IntToStr(Frodm.RKelNo.Value);
             Dat1.Text:=IntToDate(Frodm.RKelDat.AsInteger);
            End;
     False : CancelEdit;
     End;
     BSave.Enabled:=False;
     BEdit.Enabled:=True;
     Label6.Visible:=False;
     FDNo.Visible:=False;
end;

procedure TFRKeler.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFRKeler.FNoKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then FNo_Exit;
     NextTab(Sender,Key);
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;
end;

procedure TFRKeler.Dat1Enter(Sender: TObject);
begin
     If Frodm.RKel.State = dsBrowse Then Dat1.ReadOnly :=True Else
     Begin
        Dat1.ReadOnly :=False;
        GetMaskText(Dat1);
     End;
end;

procedure TFRKeler.Dat1Exit(Sender: TObject);
begin
     If (Frodm.RKel.State = dsBrowse) Then Exit;
     SetMaskText(Dat1);
     If(Not Date_Check(Dat1.Text))And(DateToInt(Dat1.Text)>0) Then
      Dat1.SetFocus
     Else
       Frodm.RKeldat.Value :=DateToInt(Dat1.Text);
end;

procedure TFRKeler.FAccNamKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Frodm.RKel.State = dsBrowse Then Exit;
     If Key = 32 Then
     Begin
      Frodm.RKelAcNam.Value:=FindAccount(Frodm.RKelAcNam.Value,FindCode);
      Frodm.RkelAccKod.AsFloat:=FindCode;
     End;
end;

procedure TFRKeler.FDNoKeyPress(Sender: TObject; var Key: Char);
begin
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0','/',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;
     If (Key =#13)and (FNo.Text <>'')Then
     Begin
      Key:=#0;
      If Not MoveToGrid(FDNo.Text) Then ShowMessage('»« «Ì‰ ”—Ì«· çò „ÊÃÊœ ‰Ì” ');
      FDNo.SelectAll;
     End Else
      NextTab(Sender,Key);
end;

procedure TFRKeler.dbgEnter(Sender: TObject);
begin
     If (Frodm.RKel.State = dsBrowse)  Then
       dbg.ReadOnly := True Else dbg.ReadOnly :=False;
     dbg.selectedField:=dbg.Columns[0].Field;
end;

procedure TFRKeler.dbgKeyPress(Sender: TObject; var Key: Char);
Var
Radif:Integer;
begin
     If Key = #13 Then
     Begin
      Key:=#0;
      GridMove(dbg,Frodm.RKel,Radif);
     End;
     If Not(Frodm.RKel.State = dsBrowse) Then Frodm.RKI.Edit;
end;

procedure TFRKeler.dbgEditButtonClick(Sender: TObject);
begin
     If (Frodm.RKel.State In [dsInsert,dsEdit]) Then
     Begin
       Frodm.RKI.Delete;
       Frodm.RKI.Edit;
     End;
end;


procedure TFRKeler.BprevClick(Sender: TObject);
begin
     If Frodm.RKel.State In [dsEdit,dsInsert] Then
     Begin
       FNo.SetFocus;
       IF Check_Factor_State(Frodm.RKel,BSaveClick,FormDestroy) = idCancel Then Exit;
       New:=False;
       Exit;
     End;
     Frodm.RKel.Refresh;
     Frodm.RKel.Prior;
     Dat1.Text:=IntToDate(Frodm.RKelDat.AsInteger);
     FNo.Text:=IntToStr(Frodm.RKelNo.Value);
     RNo:=Frodm.RKelNo.Value;
end;

procedure TFRKeler.BnextClick(Sender: TObject);
begin
     If Frodm.RKel.State In [dsEdit,dsInsert] Then
     Begin
       FNo.SetFocus;
       IF Check_Factor_State(Frodm.RKel,BSaveClick,FormDestroy) = idCancel Then Exit;
       New:=False;
       Exit;
     End;
     Frodm.RKel.Refresh;
     Frodm.RKel.Next;
     Dat1.Text:=IntToDate(Frodm.RKelDat.AsInteger);
     FNo.Text:=IntToStr(Frodm.RKelNo.Value);
     RNo:=Frodm.RKelNo.Value;
end;

procedure TFRKeler.BeditClick(Sender: TObject);
begin
     If Not(Frodm.RKel.State = dsBRowse) Then Exit;
     If Frodm.RKelPerm.Value Then
     Begin
      Beep;
      ShowMessage('ﬁÿ⁄Ì ‘œÂ «” ');
      Exit;
     End;
     If Not IsEditable Then
     Begin
      Beep;
      ShowMessage('«„ò«‰  ’ÕÌÕ ‰„Ì »«‘œ.—”Ìœ Ê’Ê·Ì ’«œ— ‘œÂ «” ');
      Exit;
     End;
     Dat1.Text:=IntToDate(Frodm.RKelDat.AsInteger);
     FAccNam.ItemIndex:=FAccNam.Items.IndexOf(FAccNam.Text);
     RNo:=Frodm.RKelNo.AsInteger;
     BNo:=Frodm.RKelBno.Value;
     DelBitem(IntToStr(RNo),BNo,17);
     RepostCheqes(False);
     EdQu.Params[0].Value:=RNo;
     EdQu.Open;
     Frodm.RKel.Edit;
     New:=False;
     BSave.Enabled:=True;
     BEdit.Enabled:=False;
     Dat1.SetFocus;
     Label6.Visible:=True;
     FDNo.Visible:=True;
end;

procedure TFRKeler.BSaveClick(Sender: TObject);
begin
     If (Frodm.RKel.State = dsBRowse) Then Exit;
     If Frodm.RKI.RecordCount = 0 Then
     Begin
      Frodm.RKel.Delete;
      FNo.Text:=Frodm.RKelNo.AsString;
      Dat1.Text:=IntToDate(Frodm.RKelDat.AsInteger);
      RNo:=Frodm.RKelNo.AsInteger;
      New:=False;
     End Else Begin
      //Frodm.RKelAccKod.Value:=AccKod(Frodm.RKelAcnam.AsString);
      Frodm.RKelPsum.Value:=GetSum;
      Frodm.RKel.Post;
      RepostCheqes(True);
      Make_Bill;
      FacBillNo(Frodm.RKel,Frodm.RKelNo.AsInteger,BNo);
     End;
     QuickCloseOpen([47,46,6,24,8]);
     EdQu.Close;
     Frodm.RKel.Locate('No',RNo,[loCaseInsensitive]);
     FNo.Text:=Frodm.RKelNo.AsString;
     Dat1.Text:=IntToDate(Frodm.RKelDat.AsInteger);
     BSave.Enabled:=False;
     BEdit.Enabled:=True;
     New:=False;
     BNo:=0;
     Label6.Visible:=False;
     FDNo.Visible:=False;
end;

procedure TFRKeler.BexitClick(Sender: TObject);
begin
     If Frodm.RKel.State In [dsEdit,dsInsert] Then
     Begin
       FNo.SetFocus;
       IF Check_Factor_State(Frodm.RKel,BSaveClick,FormDestroy) = idCancel Then Exit;
       Exit;
     End;
     Close;
end;

procedure TFRKeler.dbgColEnter(Sender: TObject);
begin
     If Frodm.RKel.State = dsBrowse Then Exit Else Frodm.RKI.Edit;
     Case Dbg.SelectedField.Index Of
     5: Frodm.RKINo.AsInteger:=FroDM.RKelNo.AsInteger;
     3: If BList.Items.Count > 0 Then  DrawList(BList,3);
     End;
end;

procedure TFRKeler.BListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key Of
     27: Begin
          dbg.SelectedField:=Frodm.RKIBank;
          dbg.SetFocus;
          Bexit.Cancel :=True;
         End;

     13: Begin
          Key:=0;
          Frodm.RKIBank.Value:=BList.Items[BList.ItemIndex];
          dbg.SelectedField:=Frodm.RKIPBill;
          dbg.SetFocus;
          Bexit.Cancel :=True;
         End;
     End;
end;

procedure TFRKeler.dbgKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key Of
     VK_F4 :If (Dbg.SelectedField.Index = 3)and Not(Frodm.RKel.State=dsBrowse) Then
              Drawlist(BList,3);
     VK_TAB: If (ssShift in Shift)and(dbg.Row=1)and(dbg.SelectedIndex=0) Then
              SelectNext(Sender As TWinControl,Not (ssShift in Shift),True) Else
             If Not(ssShift in Shift)and(dbg.Row=dbg.DataSource.DataSet.RecordCount)and
             (dbg.SelectedIndex=dbg.Columns.Count-1) Then
              SelectNext(Sender As TWinControl,Not (ssShift in Shift),True);

     End;
end;

procedure TFRKeler.BNewClick(Sender: TObject);
begin
     If Frodm.RKel.State <> dsBrowse Then Exit;
     NewRec;
end;

procedure TFRKeler.BDelClick(Sender: TObject);
Var
I:Integer;
begin
     If Not (Frodm.RKel.State = dsBrowse) Then Exit;
     If Frodm.RKelPerm.Value Then
     Begin
      Beep;
      ShowMessage('ﬁÿ⁄Ì ‘œÂ «” ');
      Exit;
     End;
     If Not IsEditable Then
     Begin
      Beep;
      ShowMessage('«„ò«‰ Õ–› ‰„Ì »«‘œ.—”Ìœ Ê’Ê·Ì ’«œ— ‘œÂ «” ');
      Exit;
     End;
     If MessageDlg('—”Ìœ çò Õ–› ‘Êœø',mtWarning,mbYesNo,-1) = mrYes Then
     begin
      RNo:=Frodm.RKelNo.AsInteger;
      BNo:=Frodm.RKelBno.AsInteger;
      DelBItem(IntToStr(RNo),BNo,17);
      BillUpdate(BNo);
      RepostCheqes(False);
      For I:=1 To Frodm.RKI.RecordCount Do Frodm.RKI.Delete;
      Frodm.RKel.Delete;
      FNo.Text:=Frodm.RKelNo.AsString;
      Dat1.Text:=IntToDate(Frodm.RKelDat.AsInteger);
     End;
end;

procedure TFRKeler.BprintClick(Sender: TObject);
Var
I:Integer;
QDbT:TQRDbText;
begin
{     If Not(Frodm.RKel.State = dsBrowse) Then Exit;
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
       If QDbT.DataSet =Frodm.RPay Then QDbT.DataSet :=Frodm.Rkel;
       If QDbT.DataSet =Frodm.RPI Then QDbT.DataSet :=Frodm.RKI;
      End;
     End;
     QrRPay.QrArt.DataSet:=Frodm.RKI;
     QrRPay.Preview;
     QrRPay.Destroy; }
     PQu.Close;
     PQu.SQL.Strings[6]:='Where Rkel.No ='+Frodm.RkelNo.AsString;
     PQu.Open;
     ppKelerRep.PrintReport;
end;


procedure TFRKeler.FCKodKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetCentLookup(Sender,Key);
end;

end.
