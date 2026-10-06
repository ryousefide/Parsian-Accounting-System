unit RRes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Mask, Grids, DBGrids, ExtCtrls, PopupListBox, Db,
  DBTables, Buttons, ComCtrls, Menus;

type
  TFRRes = class(TForm)
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
    Label10: TLabel;
    FacNo: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    FCost: TDBComboBox;
    FCKod: TDBLookupComboBox;
    lCurr: TStaticText;
    Label12: TLabel;
    FCtip: TDBComboBox;
    Label13: TLabel;
    FPbill: TDBEdit;
    Label15: TLabel;
    FCw: TDBEdit;
    Label8: TLabel;
    FCRate: TDBEdit;
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
    procedure FPbillEnter(Sender: TObject);
    procedure FSumEnter(Sender: TObject);
    procedure FCKodKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgColExit(Sender: TObject);
  private
    { Private declarations }
    RNo:Integer;
    BNo:Integer;
    New:Boolean;
    Rate:Currency;
    Function Max_No:Integer;
    Procedure FNo_Exit;
    Procedure NewRec;
    Procedure CancelEdit;
    Function GetSum:Currency;
    Procedure DrawList(List:TPopupListBox;Index:Integer);
    Procedure SetImage;
    Procedure CancelFactor(Table1,Table2:TTable);
    Function RowDeleteable:Boolean;
    Function Deleteable:Boolean;
    Procedure RePostCheqes;
    Procedure Make_Bill;
  public
    { Public declarations }
    SNo:Integer;
    Name:String;
  end;

var
  FRRes: TFRRes;

implementation

uses ProVar, Routins, MainForm, FrooshDM, RcheqRep, CRoutins;

{$R *.DFM}

{ TFRRes }
function TFRRes.Max_No: Integer;
begin
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Max(I.No) From RRes I ');
     Qu.Open;
     Result:=Qu.Fields[0].AsInteger;
     Qu.Close;
end;

procedure TFRRes.FNo_Exit;
begin
     If Not(Frodm.RRes.State =dsBrowse) Then
     Begin
       FNo.Text :=IntToStr(Frodm.RResNo.Value);
       Exit;
     End;
     RNo:=StrToInt(FNo.Text);
     If Not(Frodm.RRes.Locate('No',RNo,[loCaseInsensitive])) Then NewRec;// Else BeditClick(Owner);
     Dat1.Text:=IntToDate(Frodm.RResDat.AsInteger);
end;

procedure TFRRes.NewRec;
begin
     Frodm.RRes.Append;
     Frodm.RResNo.Value:=Max_No+1;
     Frodm.RResDat.Value:=Fardate;
     Frodm.RResPerm.Value:=False;
     Frodm.RResBilled.Value:=False;
     Frodm.RRes.Post;
     Frodm.RRes.Edit;
     BSave.Enabled:=True;
     BEdit.Enabled:=False;
     New:=True;
     FNo.Text:=Frodm.RResNo.AsString;
     Dat1.Text:=IntToDate(Frodm.RResDat.AsInteger);
     RNo:=Frodm.RResNo.Value
end;

procedure TFRRes.CancelEdit;
Var
I,J:Integer;
begin
     If (Frodm.Rcheq.Filtered=False)or(EDQu.RecordCount = 0)or(EDQu.Active =False) Then Exit;
     Frodm.Rcheq.First;
     For I:=1 To Frodm.Rcheq.RecordCount Do Frodm.Rcheq.Delete;
     EdQu.First;
     For I:=1 To EdQu.RecordCount Do
     Begin
      Frodm.Rcheq.Append;
      For J:=1 To 26 Do Frodm.Rcheq.Fields[J].Value:=EdQu.Fields[J].Value;
      Frodm.Rcheq.Post;
      EdQu.Next;
     End;
     EdQu.Close;
     Frodm.RRes.Cancel;
     Frodm.Rcheq.First;
     Make_Bill;
     Dat1.Text:=IntToDate(Frodm.RResDat.AsInteger);
     FNo.Text:=Frodm.RResNo.AsString;
end;

Function TFRRes.GetSum:Currency;
begin
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Sum(PBill) From RCheq R Where R.No=:g ');
     Qu.Params[0].Value:=RNo;
     Qu.Open;
     Result:=Qu.Fields[0].AsCurrency;
     Qu.Close;
end;

Procedure TFRRes.DrawList(List:TPopupListBox;Index:Integer);
begin
     List.Visible :=True;
     Bexit.Cancel :=False;
     List.SetFocus;
     List.ItemIndex :=List.Items.IndexOf(dbg.Columns[Index].Field.Text);
     If List.ItemIndex = -1 Then List.ItemIndex:=0;
end;

procedure TFRRes.SetImage;
begin
     Main.glKey.GetBitmap(0,BPrev.Glyph);
     Main.glKey.GetBitmap(1,Bnext.Glyph);
     Main.glKey.GetBitmap(2,BPrint.Glyph);
     Main.glKey.GetBitmap(3,Bedit.Glyph);
     Main.glKey.GetBitmap(8,Bsave.Glyph);
     Main.glKey.GetBitmap(7,BExit.Glyph);
     Main.glKey.GetBitmap(5,Bdel.Glyph);
end;

Procedure TFRRes.CancelFactor(Table1,Table2:TTable);
Var
I:Integer;
begin
     Table2.Cancel;
     If Not Table2.Filtered Then Exit;
     If Table2.RecordCount > 0 Then
         For I:=1 To Table2.RecordCount Do Table2.Delete;
     Table1.Delete;
end;

function TFRRes.RowDeleteable: Boolean;
begin
     Result:=Not(Frodm.RcheqReckod.Value or Frodm.RcheqKeler.Value or Frodm.RcheqReject.Value);
end;

Function TFRRes.Deleteable:Boolean;
Var
I:Integer;
begin
     Frodm.Rcheq.First;
     Result:=False;
     For I:=1 To Frodm.Rcheq.RecordCount Do
     Begin
      Result:=RowDeleteable;
      If Not Result Then Exit;
      Frodm.Rcheq.Next;
     End;
     Frodm.Rcheq.First;
end;

procedure TFRRes.RePostCheqes;
Var
I:Integer;
begin
     Frodm.Rcheq.First;
     For I:=1 To Frodm.Rcheq.RecordCount Do
     Begin
      Frodm.Rcheq.Edit;
      Frodm.RcheqRecDat.AsInteger:=FroDM.RResDat.AsInteger;
      Frodm.RcheqNo.AsInteger:=FroDM.RResNo.AsInteger;
      Frodm.RcheqAccKod.Value:=FroDM.RResAccKod.Value;
      Frodm.RcheqAcNam.Value:=Frodm.RResAcnam.Value;
      Frodm.Rcheq.Post;
      Frodm.Rcheq.Next;
     End;
end;

Procedure TFRRes.Make_Bill;
Var
I:Integer;
BesKod,BehKod:Real;
Net,Rate:Currency;
BTip,NBNo,BDat:Integer;
St:String;
CPrice:Currency;
CWage:Currency;
begin
     BTip:=7;
     BehKod:=Def_Cheq;
     St:='ÌãÚ ˜á ÑÓíÏ ÇÓäÇÏ ÏÑíÇÝÊäí ÔãÇÑå'+' '+Frodm.RResNo.AsString;
     Net:=Frodm.RResPsum.Value;
     Rate:=Int(Frodm.RResRate.Value);
     BDat:=Frodm.RResDat.Value;
     NBNo:=AutoBill(True,0,BehKod,Net,St,Frodm.RResNo.AsString,BNo,BTip,BDat,
     Frodm.RResCost.AsString,Frodm.RResCkod.AsInteger,Frodm.RResCprice.Value+
     Frodm.RResCwage.Value,Rate,Frodm.RResCtip.Value);
//˜ÇÑãÒÏ ÍæÇáå
      Frodm.AutoBill.FindKey(['CFA']);
      Beskod:=Frodm.AutoBillBesKod.Value;
      St:='˜ÇÑãÒÏ ÇÑÓÇá ÍæÇáå ÑÓíÏ ˜ ÔãÇÑå'+Frodm.RResNo.AsString;
      Net:=Frodm.RResCwage.Value*Rate;
      NBNo:=AutoBill(True,BesKod,0,Net,St,Frodm.RResNo.AsString,BNo,BTip,BDat,
      Frodm.RResCost.AsString,Frodm.RResCkod.AsInteger,Frodm.RResCwage.Value,Rate,
      Frodm.RResCtip.Value);

     BesKod:=Frodm.RResAccKod.Value;
     Frodm.Rcheq.First;
     CWage:=Frodm.RResCwage.Value / Frodm.Rcheq.RecordCount;
     For I:=1 To Frodm.Rcheq.RecordCount Do
     Begin
      St:='ÏÑíÇÝÊ ˜ ÔãÇÑå'+' '+Frodm.RcheqBno.AsString+' Øí ÑÓíÏ ÔãÇÑå '+Frodm.RResNo.AsString;
      Net:=Frodm.RcheqPbill.Value-Int(CWage*Rate);
      If Rate > 0 Then CPrice:=Net/Rate Else CPrice:=0;
      NBNo:=AutoBill(True,BesKod,0,Net,St,Frodm.RResNo.AsString,BNo,BTip,BDat,
      Frodm.RResCost.AsString,Frodm.RResCkod.AsInteger,Cprice,Rate,Frodm.RResCtip.Value);
      Frodm.Rcheq.Next;
     End;
     Frodm.Rcheq.First;
     If NBNo = BNo Then BillUpdate(BNo) Else
      If sBill Then MakeBill('ÓäÏ ÑÓíÏ ÏÑíÇÝÊ ˜ ÔãÇÑå'+Frodm.RResNo.AsString);
     BNo:=NBNo;
end;

procedure TFRRes.NextTab(Sender: TObject; var Key: Char);
begin
     If Key=#13 Then
     Begin
      Key:=#0;
      SelectNext(Sender As TWinControl,True,True);
     End;
end;

procedure TFRRes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Case New Of
     True : IF Check_Factor_State(Frodm.RRes,BSaveClick,FormDestroy)=idCancel Then
      Action :=caNone
     Else
      Action:=caFree;
     False:Action:=caFree;
     End;

     If Action = caFree Then
     Begin
      Frodm.Rcheq.Filtered:=False;
      Frodm.RRes.Close;
      Frodm.RCheq.Close;
     End;
end;

procedure TFRRes.FormActivate(Sender: TObject);
begin
     Frodm.Rcheq.Filtered:=True;
     Frodm.RCheq.Open;
end;

procedure TFRRes.FormCreate(Sender: TObject);
begin
     SetImage;
     Set_Forms(Self);
     lCurr.Caption:=DefaultCurr;
     EdQu.DatabaseName:=CurrDb;
     FAccNam.Items.Assign(AcList);
     FCost.Items.Assign(CostList);
     FCtip.Items.Assign(CurrList);
     Fill_Comb(Frodm.Rcheq,'Bank',BList.Items);
     Frodm.RRes.Open;
     Frodm.RCheq.Open;
     Frodm.RRes.Last;
     FNo.Text:=Frodm.RResNo.AsString;
     Dat1.Text:=IntToDate(Frodm.RResDat.AsInteger);
end;

procedure TFRRes.FormDestroy(Sender: TObject);
begin
     If Frodm.RRes.State = dsBrowse Then Exit;
     FNo.SetFocus;
     Case New Of
     True  :Begin
             CancelFactor(Frodm.RRes,Frodm.Rcheq);
             FNo.Text:=IntToStr(Frodm.RResNo.Value);
             Dat1.Text:=IntToDate(Frodm.RResDat.AsInteger);
            End;
     False : CancelEdit;
     End;
     BSave.Enabled:=False;
     BEdit.Enabled:=True;
end;

procedure TFRRes.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFRRes.FNoKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then FNo_Exit;
     NextTab(Sender,Key);
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;
end;

procedure TFRRes.Dat1Enter(Sender: TObject);
begin
     If Frodm.RRes.State = dsBrowse Then Dat1.ReadOnly :=True Else
     Begin
        Dat1.ReadOnly :=False;
        GetMaskText(Dat1);
     End;
end;

procedure TFRRes.Dat1Exit(Sender: TObject);
begin
     If (Frodm.RRes.State = dsBrowse) Then Exit;
     SetMaskText(Dat1);
     If(Not Date_Check(Dat1.Text))And(DateToInt(Dat1.Text)>0) Then
      Dat1.SetFocus
     Else
       Frodm.RResdat.Value :=DateToInt(Dat1.Text);
end;

procedure TFRRes.dbgEnter(Sender: TObject);
begin
     If (Frodm.RRes.State = dsBrowse)  Then
      dbg.ReadOnly := True
     Else
      dbg.ReadOnly :=False;
     dbg.selectedField:=dbg.Columns[0].Field;
end;

procedure TFRRes.dbgKeyPress(Sender: TObject; var Key: Char);
Var
Radif:Integer;
begin
     If Key = #13 Then
     Begin
       Key:=#0;
       GridMove(dbg,Frodm.RRes,Radif);
     End;
     If Not(Frodm.RRes.State = dsBrowse) Then Frodm.RCheq.Edit;
end;

procedure TFRRes.dbgEditButtonClick(Sender: TObject);
begin
     If (Frodm.RRes.State In [dsInsert,dsEdit])and RowDeleteable Then
     Begin
       Frodm.RCheq.Delete;
       Frodm.RCheq.Edit;
     End;
end;


procedure TFRRes.BprevClick(Sender: TObject);
begin
     If Frodm.RRes.State In [dsEdit,dsInsert] Then
     Begin
       FNo.SetFocus;
       IF Check_Factor_State(Frodm.RRes,BSaveClick,FormDestroy) = idCancel Then Exit;
       New:=False;
       Exit;
     End;
     Frodm.RRes.Refresh;
     Frodm.RRes.Prior;
     Dat1.Text:=IntToDate(Frodm.RResDat.AsInteger);
     FNo.Text:=IntToStr(Frodm.RResNo.Value);
     RNo:=Frodm.RResNo.Value;
end;

procedure TFRRes.BnextClick(Sender: TObject);
begin
     If Frodm.RRes.State In [dsEdit,dsInsert] Then
     Begin
       FNo.SetFocus;
       IF Check_Factor_State(Frodm.RRes,BSaveClick,FormDestroy) = idCancel Then Exit;
       New:=False;
       Exit;
     End;
     Frodm.RRes.Refresh;
     Frodm.RRes.Next;
     Dat1.Text:=IntToDate(Frodm.RResDat.AsInteger);
     FNo.Text:=IntToStr(Frodm.RResNo.Value);
     RNo:=Frodm.RResNo.Value;
end;

procedure TFRRes.BeditClick(Sender: TObject);
begin
     If Not(Frodm.RRes.State = dsBRowse) Then Exit;
     BNo:=Frodm.RResBno.Value;
     If (Frodm.RResPerm.Value)or(IsBillLocked(BNO)) Then
     Begin
      Beep;
      ShowMessage(sLocked);
      Exit;
     End;
     Dat1.Text:=IntToDate(Frodm.RResDat.AsInteger);
     FAccNam.ItemIndex:=FAccNam.Items.IndexOf(FAccNam.Text);
     RNo:=Frodm.RResNo.AsInteger;
     DelBitem(IntToStr(RNo),BNo,7);
     EdQu.Params[0].Value:=RNo;
     EdQu.Open;
     Frodm.RRes.Edit;
     New:=False;
     BSave.Enabled:=True;
     BEdit.Enabled:=False;
     Dat1.SetFocus;
end;

procedure TFRRes.BSaveClick(Sender: TObject);
begin
     If (Frodm.RRes.State = dsBRowse) Then Exit;
     If Frodm.Rcheq.RecordCount = 0 Then
     Begin
      Frodm.RRes.Delete;
      FNo.Text:=Frodm.RResNo.AsString;
      Dat1.Text:=IntToDate(Frodm.RResDat.AsInteger);
      RNo:=Frodm.RResNo.AsInteger;
      New:=False;
     End Else Begin
      //Frodm.RResAccKod.Value:=AccKod(Frodm.RResAcnam.AsString);
      RePostCheqes;
      Frodm.RResPsum.Value:=GetSum;
      Frodm.RResRate.Value:=Frodm.RResPsum.Value/(Frodm.RResCprice.Value+Frodm.RResCwage.Value);
      Frodm.RRes.Post;
      Make_Bill;
      FacBillNo(Frodm.RRes,Frodm.RResNo.AsInteger,BNo);
     End;
     QuickCloseOpen([8,39,6,24]);
     EdQu.Close;
     Frodm.RRes.Locate('No',RNo,[loCaseInsensitive]);
     FNo.Text:=Frodm.RResNo.AsString;
     Dat1.Text:=IntToDate(Frodm.RResDat.AsInteger);
     BSave.Enabled:=False;
     BEdit.Enabled:=True;
     New:=False;
     BNo:=0;
end;

procedure TFRRes.BexitClick(Sender: TObject);
begin
     If Frodm.RRes.State In [dsEdit,dsInsert] Then
     Begin
       FNo.SetFocus;
       IF Check_Factor_State(Frodm.RRes,BSaveClick,FormDestroy) = idCancel Then Exit;
       Exit;
     End;
     Close;
end;

procedure TFRRes.dbgColEnter(Sender: TObject);
begin
     If Frodm.RRes.State = dsBrowse Then Exit Else Frodm.RCheq.Edit;
     If Not RowDeleteable Then
     Begin
      dbg.ReadOnly:=True;
      Exit;
     End Else
      dbg.ReadOnly:=False;
     Case Dbg.SelectedField.Index Of
     1: If Frodm.RcheqBNo.AsString = '' Then
        Begin
        ShowMessage('ÓÑíÇá ˜ æÇÑÏ äÔÏå ÇÓÊ');
        Dbg.SelectedField:=Frodm.RcheqBno;
        end;
     4: If BList.Items.Count > 0 Then  DrawList(BList,3);
     End;
end;

procedure TFRRes.dbgColExit(Sender: TObject);
begin
     If Frodm.RRes.State = dsBrowse Then Exit Else Frodm.RCheq.Edit;
     Case Dbg.SelectedField.Index Of
     6: begin
        Frodm.RcheqReckod.Value:=False;
        Frodm.RcheqKeler.Value:=False;
        Frodm.RcheqReject.Value:=False;
        Frodm.RcheqShar.Value:=False;
        Frodm.RcheqRecDat.AsInteger:=FroDM.RResDat.AsInteger;
        Frodm.RcheqNo.AsInteger:=FroDM.RResNo.AsInteger;
        Frodm.RcheqAcNam.AsString:=FroDM.RResAcnam.AsString;
        Frodm.RcheqAccKod.Value:=FroDM.RResAccKod.Value;
        Frodm.RcheqCkod.Value:=Frodm.RResCkod.Value;
        Frodm.RcheqCost.Value:=Frodm.RResCost.Value;
//        Frodm.Rcheq.Post;
        end;
     End;

end;

procedure TFRRes.BListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key Of
     27: Begin
          dbg.SelectedField:=Frodm.RCheqBkod;
          dbg.SetFocus;
          Bexit.Cancel :=True;
         End;

     13: Begin
          Key:=0;
          Frodm.RCheqBank.Value:=BList.Items[BList.ItemIndex];
          dbg.SelectedField:=Frodm.RCheqPBill;
          dbg.SetFocus;
          Bexit.Cancel :=True;
         End;
     End;
end;

procedure TFRRes.dbgKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key Of
     VK_F4 :If (Dbg.SelectedField.Index = 4)and Not(Frodm.RRes.State=dsBrowse) Then
              Drawlist(BList,4);
     VK_TAB: If (ssShift in Shift)and(dbg.Row=1)and(dbg.SelectedIndex=0) Then
              SelectNext(Sender As TWinControl,Not (ssShift in Shift),True) Else
             If Not(ssShift in Shift)and(dbg.Row=dbg.DataSource.DataSet.RecordCount)and
             (dbg.SelectedIndex=dbg.Columns.Count-1) Then
              SelectNext(Sender As TWinControl,Not (ssShift in Shift),True);

     End;
end;

procedure TFRRes.FAccNamKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Frodm.RRes.State = dsBrowse Then Exit;
{     If Key = 32 Then
     Begin
      Frodm.RResAcNam.Value:=FindAccount(Frodm.RResAcNam.Value,FindCode);
      Frodm.RResAcckod.asFloat:=FindCode;
     End;}
     GetAccountDBCombo(Sender,Key,'Acckod',0);
end;

procedure TFRRes.BNewClick(Sender: TObject);
begin
     If Frodm.RRes.State <> dsBrowse Then Exit;
     NewRec;
end;

procedure TFRRes.BDelClick(Sender: TObject);
Var
I:Integer;
begin
     If Not (Frodm.RRes.State = dsBrowse) Then Exit;
     If Frodm.RResPerm.Value Then
     Begin
      Beep;
      ShowMessage('ÞØÚí ÔÏå ÇÓÊ');
      Exit;
     End;
     If MessageDlg('ÑÓíÏ ˜ ÍÐÝ ÔæÏ¿',mtWarning,mbYesNo,-1) = mrYes Then
      If Deleteable Then
      begin
       RNo:=Frodm.RResNo.AsInteger;
       BNo:=Frodm.RResBno.AsInteger;
       DelBItem(IntToStr(RNo),BNo,7);
       BillUpdate(BNo);
       For I:=1 To Frodm.Rcheq.RecordCount Do Frodm.Rcheq.Delete;
       Frodm.RRes.Delete;
       FNo.Text:=Frodm.RResNo.AsString;
       Dat1.Text:=IntToDate(Frodm.RResDat.AsInteger);
     End;
end;

procedure TFRRes.BprintClick(Sender: TObject);
begin
     If Not(Frodm.RRes.State = dsBrowse) Then Exit;
     CreatingForm(TQrRcheq,'QrRcheq',QrRcheq);
     Set_Sys_Enviroment;
     QrRcheq.ShowProgress:=True;
     QrRcheq.qrTit.Caption:=InvoLbl;
     //QrRcheq.qrAdd.Caption:=Master;
     QrRcheq.Preview;
//     QrRcheq.Destroy;
end;

procedure TFRRes.FPbillEnter(Sender: TObject);
begin
     If (Frodm.RRes.State = dsBrowse)or(Frodm.RResCPrice.Value>0) Then Exit;
     Rate:=GetRateatDate(Frodm.RResCtip.AsString,Frodm.RResDat.AsInteger);
     If Rate > 0 Then Frodm.RResCPrice.Value:=Frodm.RResPSum.Value/Rate;
end;

procedure TFRRes.FSumEnter(Sender: TObject);
begin
     If (Frodm.RRes.State = dsBRowse) Then Exit;
     Frodm.RResPsum.Value:=GetSum;
end;

procedure TFRRes.FCKodKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetCentLookup(Sender,Key);
end;


end.
