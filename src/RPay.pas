unit RPay;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Mask, Grids, DBGrids, ExtCtrls, PopupListBox, Db,
  DBTables, Buttons, ComCtrls, Menus;

type
  TFRPay = class(TForm)
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
  public
    { Public declarations }
    SNo:Integer;
    Name:String;
  end;

var
  FRPay: TFRPay;

implementation

uses ProVar, Routins, MainForm, FrooshDM, RPayRep;

{$R *.DFM}

{ TFRPay }
function TFRPay.Max_No: Integer;
begin
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Max(I.No) From RPay I ');
     Qu.Open;
     Result:=Qu.Fields[0].AsInteger;
     Qu.Close;
end;

procedure TFRPay.FNo_Exit;
begin
     If Not(Frodm.RPay.State =dsBrowse) Then
     Begin
       FNo.Text :=IntToStr(Frodm.RPayNo.Value);
       Exit;
     End;
     RNo:=StrToInt(FNo.Text);
     If Not(Frodm.RPay.Locate('No',RNo,[loCaseInsensitive])) Then NewRec;// Else BeditClick(Owner);
     Dat1.Text:=IntToDate(Frodm.RPayDat.AsInteger);
end;

procedure TFRPay.NewRec;
begin
     Frodm.RPay.Append;
     Frodm.RPayNo.Value:=Max_No+1;
     Frodm.RPayDat.Value:=Fardate;
     Frodm.RPayPerm.Value:=False;
     Frodm.RPayBilled.Value:=False;
     Frodm.RPay.Post;
     Frodm.RPay.Edit;
     BSave.Enabled:=True;
     BEdit.Enabled:=False;
     New:=True;
     FNo.Text:=Frodm.RPayNo.AsString;
     Dat1.Text:=IntToDate(Frodm.RPayDat.AsInteger);
     Label6.Visible:=True;
     FDNo.Visible:=True;
     RNo:=Frodm.RPayNo.Value
end;

procedure TFRPay.CancelEdit;
Var
I,J:Integer;
begin
     If (Frodm.RPI.Filtered=False)or(EDQu.RecordCount = 0)or(EDQu.Active =False) Then Exit;
     Frodm.RPI.First;
     For I:=1 To Frodm.RPI.RecordCount Do Frodm.RPI.Delete;
     EdQu.First;
     For I:=1 To EdQu.RecordCount Do
     Begin
      Frodm.RPI.Append;
      For J:=0 To 5 Do Frodm.RPI.Fields[J].Value:=EdQu.Fields[J].Value;
      Frodm.RPI.Post;
      EdQu.Next;
     End;
     EdQu.Close;
     Frodm.RPay.Cancel;
     Frodm.RPI.First;
     RepostCheqes(True);
     Make_Bill;
     Dat1.Text:=IntToDate(Frodm.RPayDat.AsInteger);
     FNo.Text:=Frodm.RPayNo.AsString;
end;

Function TFRPay.GetSum:Currency;
begin
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Sum(PBill) From RPayI R Where R.No=:g ');
     Qu.Params[0].Value:=RNo;
     Qu.Open;
     Result:=Qu.Fields[0].AsCurrency;
     Qu.Close;
end;

Procedure TFRPay.DrawList(List:TPopupListBox;Index:Integer);
begin
     List.Visible :=True;
     Bexit.Cancel :=False;
     List.SetFocus;
     List.ItemIndex :=List.Items.IndexOf(dbg.Columns[Index].Field.Text);
     If List.ItemIndex = -1 Then List.ItemIndex:=0;
end;

procedure TFRPay.SetImage;
begin
     Main.glKey.GetBitmap(0,BPrev.Glyph);
     Main.glKey.GetBitmap(1,Bnext.Glyph);
     Main.glKey.GetBitmap(2,BPrint.Glyph);
     Main.glKey.GetBitmap(3,Bedit.Glyph);
     Main.glKey.GetBitmap(8,Bsave.Glyph);
     Main.glKey.GetBitmap(7,BExit.Glyph);
     Main.glKey.GetBitmap(5,Bdel.Glyph);
end;

Procedure TFRPay.CancelFactor(Table1,Table2:TTable);
Var
I:Integer;
begin
     Table2.Cancel;
     If Not Table2.Filtered Then Exit;
     If Table2.RecordCount > 0 Then
         For I:=1 To Table2.RecordCount Do Table2.Delete;
     Table1.Delete;
end;

procedure TFRPay.RePostCheqes(State:Boolean);
Var
I:Integer;
begin
     Frodm.RPI.First;
     For I:=1 To Frodm.RPI.RecordCount Do
     Begin
      Frodm.Rcheq.Locate('BNo;BDat;PBill',VarArrayof([Frodm.RPIBNo.Value,
      Frodm.RPIBDat.Value,Frodm.RPIPBill.Value]),[loCaseInsensitive]);
      Frodm.Rcheq.Edit;
      Case State Of
      True:
      Begin
       Frodm.RcheqRecKod.AsBoolean:=True;
       Frodm.RcheqPBNo.AsInteger:=FroDM.RPayNo.AsInteger;
       Frodm.RcheqPAccKod.Value:=FroDM.RPayAccKod.Value;
      End;
      False:
      Begin
       Frodm.RcheqRecKod.AsBoolean:=False;
       Frodm.RcheqPBNo.Clear;
       Frodm.RcheqPAccKod.Clear;
      End;
      End;
      Frodm.Rcheq.Post;
      Frodm.RPI.Next;
     End;
end;

function TFRPay.MoveToGrid(Serial: String): boolean;
Var
I:Integer;
begin
     If Frodm.RPay.State = dsBrowse Then Exit;
     Qu.SQL.Clear;
     Qu.SQL.Add('Select BDat,BNo,Bank,PBill From Rcheq Where BNo=:b '+
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
     Frodm.RPI.Append;
     Frodm.RPiRadif.Value:=Frodm.RPI.RecordCount+1;
     Frodm.RPINo.Value:=Frodm.RPayNo.Value;
     For I:=0 To 3 Do Frodm.RPI.Fields[I+1].Value:=Qu.Fields[I].Value;
     Frodm.RPI.Post;
     Qu.Close;
end;

Procedure TFRPay.Make_Bill;
Var
I:Integer;
BesKod,BehKod:Real;
Net:Currency;
BTip,NBNo,BDat:Integer;
St:String;
begin
     BTip:=8;
     BesKod:=Def_Vosol;
     BehKod:=Frodm.RPayAccKod.Value;
     Frodm.RPI.First;
     For I:=1 To Frodm.RPI.RecordCount Do
     Begin
      St:='Ê«ê–«—Ì  çò ‘„«—Â'+' '+Frodm.RPIBno.AsString+' ÿÌ —”Ìœ ‘„«—Â '+Frodm.RPayNo.AsString;
      Net:=Frodm.RPIPbill.Value;
      BDat:=Frodm.RPayDat.Value;
      NBNo:=AutoBill(True,0,BehKod,Net,St,Frodm.RPayNo.AsString,BNo,BTip,BDat,
      Frodm.RPayCost.AsString,Frodm.RPayCkod.AsInteger,Net,1,DefaultCurr);
      Frodm.RPI.Next;
     End;
     Frodm.RPI.First;

     St:='Ã„⁄ ò· —”Ìœ Ê«ê–«—Ì «”‰«œ œ—Ì«› ‰Ì ‘„«—Â'+' '+Frodm.RPayNo.AsString;
     Net:=Frodm.RPayPsum.Value;
     BDat:=Frodm.RPayDat.Value;
     NBNo:=AutoBill(True,BesKod,0,Net,St,Frodm.RPayNo.AsString,BNo,BTip,BDat,
     Frodm.RPayCost.AsString,Frodm.RPayCkod.AsInteger,Net,1,DefaultCurr);

     If NBNo = BNo Then BillUpdate(BNo) Else
      If sBill Then MakeBill('”‰œ —”Ìœ Ê«ê–«—Ì «”‰«œ ‘„«—Â'+Frodm.RPayNo.AsString);
     BNo:=NBNo;
end;

procedure TFRPay.NextTab(Sender: TObject; var Key: Char);
begin
     If Key=#13 Then
     Begin
      Key:=#0;
      SelectNext(Sender As TWinControl,True,True);
     End;
end;

procedure TFRPay.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Case New Of
     True : IF Check_Factor_State(Frodm.RPay,BSaveClick,FormDestroy)=idCancel Then
      Action :=caNone
     Else
      Action:=caFree;
     False:Action:=caFree;
     End;

     If Action=caFree Then
     Begin
      Frodm.RPI.Filtered:=False;
      Frodm.RPay.Close;
      Frodm.RPI.Close;
      Frodm.Rcheq.Close;
     End;

end;
procedure TFRPay.FormActivate(Sender: TObject);
begin
     Frodm.RPI.Filtered:=True;
     Frodm.Rcheq.Open;
end;

procedure TFRPay.FormCreate(Sender: TObject);
begin
     SetImage;
     Set_Forms(Self);
     EdQu.DatabaseName:=CurrDb;
     FAccNam.Items.Assign(AcList);
     FCost.Items.Assign(CostList);
     Fill_Comb(Frodm.Rcheq,'Bank',BList.Items);
     Frodm.RPay.Open;
     Frodm.RPI.Open;
     Frodm.RPay.Last;
     FNo.Text:=Frodm.RPayNo.AsString;
     Dat1.Text:=IntToDate(Frodm.RPayDat.AsInteger);
//     NewRec;
end;

procedure TFRPay.FormDestroy(Sender: TObject);
begin
     If Frodm.RPay.State = dsBrowse Then Exit;
     FNo.SetFocus;
     Case New Of
     True  :Begin
             CancelFactor(Frodm.RPay,Frodm.RPI);
             FNo.Text:=IntToStr(Frodm.RPayNo.Value);
             Dat1.Text:=IntToDate(Frodm.RPayDat.AsInteger);
            End;
     False : CancelEdit;
     End;
     BSave.Enabled:=False;
     BEdit.Enabled:=True;
     Label6.Visible:=False;
     FDNo.Visible:=False;
end;

procedure TFRPay.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFRPay.FNoKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then FNo_Exit;
     NextTab(Sender,Key);
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;
end;

procedure TFRPay.Dat1Enter(Sender: TObject);
begin
     If Frodm.RPay.State = dsBrowse Then Dat1.ReadOnly :=True Else
     Begin
        Dat1.ReadOnly :=False;
        GetMaskText(Dat1);
     End;
end;

procedure TFRPay.Dat1Exit(Sender: TObject);
begin
     If (Frodm.RPay.State = dsBrowse) Then Exit;
     SetMaskText(Dat1);
     If(Not Date_Check(Dat1.Text))And(DateToInt(Dat1.Text)>0) Then
      Dat1.SetFocus
     Else
       Frodm.RPaydat.Value :=DateToInt(Dat1.Text);
end;

procedure TFRPay.FAccNamKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Frodm.RPay.State = dsBrowse Then Exit;
     If Key = 32 Then
     Begin
      Frodm.RPayAcNam.Value:=FindAccount(Frodm.RPayAcNam.Value,FindCode);
      Frodm.RPayAcckod.AsFloat:=FindCode;
     End;
end;

procedure TFRPay.FDNoKeyPress(Sender: TObject; var Key: Char);
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

procedure TFRPay.dbgEnter(Sender: TObject);
begin
     If (Frodm.RPay.State = dsBrowse)  Then
       dbg.ReadOnly := True Else dbg.ReadOnly :=False;
     dbg.selectedField:=dbg.Columns[0].Field;
end;

procedure TFRPay.dbgKeyPress(Sender: TObject; var Key: Char);
Var
Radif:Integer;
begin
     If Key = #13 Then
     Begin
      Key:=#0;
      GridMove(dbg,Frodm.RPay,Radif);
     End;
     If Not(Frodm.RPay.State = dsBrowse) Then Frodm.RPI.Edit;
end;

procedure TFRPay.dbgEditButtonClick(Sender: TObject);
begin
     If (Frodm.RPay.State In [dsInsert,dsEdit]) Then
     Begin
       Frodm.RPI.Delete;
       Frodm.RPI.Edit;
     End;
end;


procedure TFRPay.BprevClick(Sender: TObject);
begin
     If Frodm.RPay.State In [dsEdit,dsInsert] Then
     Begin
       FNo.SetFocus;
       IF Check_Factor_State(Frodm.RPay,BSaveClick,FormDestroy) = idCancel Then Exit;
       New:=False;
       Exit;
     End;
     Frodm.RPay.Refresh;
     Frodm.RPay.Prior;
     Dat1.Text:=IntToDate(Frodm.RPayDat.AsInteger);
     FNo.Text:=IntToStr(Frodm.RPayNo.Value);
     RNo:=Frodm.RPayNo.Value;
end;

procedure TFRPay.BnextClick(Sender: TObject);
begin
     If Frodm.RPay.State In [dsEdit,dsInsert] Then
     Begin
       FNo.SetFocus;
       IF Check_Factor_State(Frodm.RPay,BSaveClick,FormDestroy) = idCancel Then Exit;
       New:=False;
       Exit;
     End;
     Frodm.RPay.Refresh;
     Frodm.RPay.Next;
     Dat1.Text:=IntToDate(Frodm.RPayDat.AsInteger);
     FNo.Text:=IntToStr(Frodm.RPayNo.Value);
     RNo:=Frodm.RPayNo.Value;
end;

procedure TFRPay.BeditClick(Sender: TObject);
begin
     If Not(Frodm.RPay.State = dsBRowse) Then Exit;
     If Frodm.RPayPerm.Value Then
     Begin
      Beep;
      ShowMessage('ﬁÿ⁄Ì ‘œÂ «” ');
      Exit;
     End;
     Dat1.Text:=IntToDate(Frodm.RPayDat.AsInteger);
     FAccNam.ItemIndex:=FAccNam.Items.IndexOf(FAccNam.Text);
     RNo:=Frodm.RPayNo.AsInteger;
     BNo:=Frodm.RPayBno.Value;
     DelBitem(IntToStr(RNo),BNo,8);
     RepostCheqes(False);
     EdQu.Params[0].Value:=RNo;
     EdQu.Open;
     Frodm.RPay.Edit;
     New:=False;
     BSave.Enabled:=True;
     BEdit.Enabled:=False;
     Dat1.SetFocus;
     Label6.Visible:=True;
     FDNo.Visible:=True;
end;

procedure TFRPay.BSaveClick(Sender: TObject);
begin
     If (Frodm.RPay.State = dsBRowse) Then Exit;
     If Frodm.RPI.RecordCount = 0 Then
     Begin
      Frodm.RPay.Delete;
      FNo.Text:=Frodm.RPayNo.AsString;
      Dat1.Text:=IntToDate(Frodm.RPayDat.AsInteger);
      RNo:=Frodm.RPayNo.AsInteger;
      New:=False;
     End Else Begin
//      Frodm.RPayAccKod.Value:=AccKod(Frodm.RPayAcnam.AsString);
      Frodm.RPayPsum.Value:=GetSum;
      Frodm.RPay.Post;
      RepostCheqes(True);
      Make_Bill;
      FacBillNo(Frodm.RPay,Frodm.RPayNo.AsInteger,BNo);
     End;
     QuickCloseOpen([41,40,6,24,8]);
     EdQu.Close;
     Frodm.RPay.Locate('No',RNo,[loCaseInsensitive]);
     FNo.Text:=Frodm.RPayNo.AsString;
     Dat1.Text:=IntToDate(Frodm.RPayDat.AsInteger);
     BSave.Enabled:=False;
     BEdit.Enabled:=True;
     New:=False;
     BNo:=0;
     Label6.Visible:=False;
     FDNo.Visible:=False;
end;

procedure TFRPay.BexitClick(Sender: TObject);
begin
     If Frodm.RPay.State In [dsEdit,dsInsert] Then
     Begin
       FNo.SetFocus;
       IF Check_Factor_State(Frodm.RPay,BSaveClick,FormDestroy) = idCancel Then Exit;
       Exit;
     End;
     Close;
end;

procedure TFRPay.dbgColEnter(Sender: TObject);
begin
     If Frodm.RPay.State = dsBrowse Then Exit Else Frodm.RPI.Edit;
     Case Dbg.SelectedField.Index Of
     5: Frodm.RPINo.AsInteger:=FroDM.RPayNo.AsInteger;
     3: If BList.Items.Count > 0 Then  DrawList(BList,3);
     End;
end;

procedure TFRPay.BListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key Of
     27: Begin
          dbg.SelectedField:=Frodm.RPIBank;
          dbg.SetFocus;
          Bexit.Cancel :=True;
         End;

     13: Begin
          Key:=0;
          Frodm.RPIBank.Value:=BList.Items[BList.ItemIndex];
          dbg.SelectedField:=Frodm.RPIPBill;
          dbg.SetFocus;
          Bexit.Cancel :=True;
         End;
     End;
end;

procedure TFRPay.dbgKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key Of
     VK_F4 :If (Dbg.SelectedField.Index = 3)and Not(Frodm.RPay.State=dsBrowse) Then
              Drawlist(BList,3);
     VK_TAB: If (ssShift in Shift)and(dbg.Row=1)and(dbg.SelectedIndex=0) Then
              SelectNext(Sender As TWinControl,Not (ssShift in Shift),True) Else
             If Not(ssShift in Shift)and(dbg.Row=dbg.DataSource.DataSet.RecordCount)and
             (dbg.SelectedIndex=dbg.Columns.Count-1) Then
              SelectNext(Sender As TWinControl,Not (ssShift in Shift),True);

     End;
end;

procedure TFRPay.BNewClick(Sender: TObject);
begin
     If Frodm.RPay.State <> dsBrowse Then Exit;
     NewRec;
end;

procedure TFRPay.BDelClick(Sender: TObject);
Var
I:Integer;
begin
     If Not (Frodm.RPay.State = dsBrowse) Then Exit;
     If Frodm.RPayPerm.Value Then
     Begin
      Beep;
      ShowMessage('ﬁÿ⁄Ì ‘œÂ «” ');
      Exit;
     End;
     If MessageDlg('—”Ìœ çò Õ–› ‘Êœø',mtWarning,mbYesNo,-1) = mrYes Then
     begin
      RNo:=Frodm.RPayNo.AsInteger;
      BNo:=Frodm.RPayBno.AsInteger;
      DelBItem(IntToStr(RNo),BNo,8);
      BillUpdate(BNo);
      RepostCheqes(False);
      For I:=1 To Frodm.RPI.RecordCount Do Frodm.RPI.Delete;
      Frodm.RPay.Delete;
      FNo.Text:=Frodm.RPayNo.AsString;
      Dat1.Text:=IntToDate(Frodm.RPayDat.AsInteger);
     End;
end;

procedure TFRPay.BprintClick(Sender: TObject);
begin
     If Not(Frodm.RPay.State = dsBrowse) Then Exit;
     CreatingForm(TQrRPay,'QrRPay',QrRPay);
     Set_Sys_Enviroment;
     QrRPay.ShowProgress:=True;
     QrRPay.qrTit.Caption:=InvoLbl;
     //QrRPay.qrAdd.Caption:=Master;
     //QrRPay.QRLabel6.Caption:=Label4.Caption;
     QrRPay.Preview;
     QrRPay.Destroy;
end;


procedure TFRPay.FCKodKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetCentLookup(Sender,Key);
end;

end.
