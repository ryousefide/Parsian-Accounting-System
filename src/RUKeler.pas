unit RUKeler;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Mask, Grids, DBGrids, ExtCtrls, PopupListBox, Db,
  DBTables, Buttons, ComCtrls, Menus;

type
  TFRUKeler = class(TForm)
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
  FRUKeler: TFRUKeler;

implementation

uses ProVar, Routins, MainForm, FrooshDM, RPayRep, QrCtrls;

{$R *.DFM}

function TFRUKeler.Max_No: Integer;
begin
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Max(I.No) From RUKel I ');
     Qu.Open;
     Result:=Qu.Fields[0].AsInteger;
     Qu.Close;
end;

procedure TFRUKeler.FNo_Exit;
begin
     If Not(Frodm.RUKel.State =dsBrowse) Then
     Begin
       FNo.Text :=IntToStr(Frodm.RUKelNo.Value);
       Exit;
     End;
     RNo:=StrToInt(FNo.Text);
     If Not(Frodm.RUKel.Locate('No',RNo,[loCaseInsensitive])) Then NewRec;// Else BeditClick(Owner);
     Dat1.Text:=IntToDate(Frodm.RUKelDat.AsInteger);
end;

procedure TFRUKeler.NewRec;
begin
     Frodm.RUKel.Append;
     Frodm.RUKelNo.Value:=Max_No+1;
     Frodm.RUKelDat.Value:=Fardate;
     Frodm.RUKelPerm.Value:=False;
     Frodm.RukelBilled.Value:=False;
     Frodm.RUKel.Post;
     Frodm.RUKel.Edit;
     BSave.Enabled:=True;
     BEdit.Enabled:=False;
     New:=True;
     FNo.Text:=Frodm.RUKelNo.AsString;
     Dat1.Text:=IntToDate(Frodm.RUKelDat.AsInteger);
     Label6.Visible:=True;
     FDNo.Visible:=True;
     RNo:=Frodm.RUKelNo.Value
end;

procedure TFRUKeler.CancelEdit;
Var
I,J:Integer;
begin
     If (Frodm.RUKI.Filtered=False)or(EDQu.RecordCount = 0)or(EDQu.Active =False) Then Exit;
     Frodm.RUKI.First;
     For I:=1 To Frodm.RUKI.RecordCount Do Frodm.RUKI.Delete;
     EdQu.First;
     For I:=1 To EdQu.RecordCount Do
     Begin
      Frodm.RUKI.Append;
      For J:=0 To 6 Do Frodm.RUKI.Fields[J].Value:=EdQu.Fields[J].Value;
      Frodm.RUKI.Post;
      EdQu.Next;
     End;
     EdQu.Close;
     Frodm.RUKel.Cancel;
     Frodm.RUKI.First;
     RepostCheqes(True);
     Make_Bill;
     Dat1.Text:=IntToDate(Frodm.RUKelDat.AsInteger);
     FNo.Text:=Frodm.RUKelNo.AsString;
end;

Function TFRUKeler.GetSum:Currency;
begin
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Sum(PBill) From RUKelI R Where R.No=:g ');
     Qu.Params[0].Value:=RNo;
     Qu.Open;
     Result:=Qu.Fields[0].AsCurrency;
     Qu.Close;
end;

Procedure TFRUKeler.DrawList(List:TPopupListBox;Index:Integer);
begin
     List.Visible :=True;
     Bexit.Cancel :=False;
     List.SetFocus;
     List.ItemIndex :=List.Items.IndexOf(dbg.Columns[Index].Field.Text);
     If List.ItemIndex = -1 Then List.ItemIndex:=0;
end;

procedure TFRUKeler.SetImage;
begin
     Main.glKey.GetBitmap(0,BPrev.Glyph);
     Main.glKey.GetBitmap(1,Bnext.Glyph);
     Main.glKey.GetBitmap(2,BPrint.Glyph);
     Main.glKey.GetBitmap(3,Bedit.Glyph);
     Main.glKey.GetBitmap(8,Bsave.Glyph);
     Main.glKey.GetBitmap(7,BExit.Glyph);
     Main.glKey.GetBitmap(5,Bdel.Glyph);
end;

Procedure TFRUKeler.CancelFactor(Table1,Table2:TTable);
Var
I:Integer;
begin
     Table2.Cancel;
     If Not Table2.Filtered Then Exit;
     If Table2.RecordCount > 0 Then
         For I:=1 To Table2.RecordCount Do Table2.Delete;
     Table1.Delete;
end;

procedure TFRUKeler.RePostCheqes(State:Boolean);
Var
I:Integer;
begin
     Frodm.RUKI.First;
     For I:=1 To Frodm.RUKI.RecordCount Do
     Begin
      Frodm.Rcheq.Locate('BNo;BDat;PBill',VarArrayof([Frodm.RUKIBNo.Value,
      Frodm.RUKIBDat.Value,Frodm.RUKIPBill.Value]),[loCaseInsensitive]);
      Frodm.Rcheq.Edit;
      Case State Of
      True:
      Begin
       Frodm.RcheqKeler.AsBoolean:=False;
       Frodm.RcheqPBNo.Clear;
       Frodm.RcheqJari.Clear;
      End;
      False:
      Begin
       Frodm.RcheqKeler.AsBoolean:=True;
       Frodm.RcheqPBNo.AsInteger:=FroDM.RUKelNo.AsInteger;
       Frodm.RcheqJari.Value:=FroDM.RUKelAcNam.Value;
      End;
      End;
      Frodm.Rcheq.Post;
      Frodm.RUKI.Next;
     End;
end;

function TFRUKeler.MoveToGrid(Serial: String): boolean;
Var
I:Integer;
begin
     If Frodm.RUKel.State = dsBrowse Then Exit;
     Qu.SQL.Clear;
     Qu.SQL.Add('Select BDat,BNo,Bank,PBill,Reject From Rcheq Where BNo=:b '+
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
     Frodm.RUKI.Append;
     Frodm.RUKIRadif.Value:=Frodm.RUKI.RecordCount+1;
     Frodm.RUKINo.Value:=Frodm.RUKelNo.Value;
     Frodm.RUKIReject.Value:=Qu.Fields[4].Value;
     For I:=0 To 3 Do Frodm.RUKI.Fields[I+1].Value:=Qu.Fields[I].Value;
     Frodm.RUKI.Post;
     Qu.Close;
end;

Procedure TFRUKeler.Make_Bill;
Var
I:Integer;
BesKod,BehKod:Real;
Net:Currency;
BTip,NBNo,BDat:Integer;
St:String;
begin
     BTip:=19;
     BehKod:=Def_Vosol;
     BesKod:=Def_Keler;

     St:='Ã„⁄ ò· —”Ìœ ⁄Êœ  «“ ò·— ‘„«—Â'+' '+Frodm.RUKelNo.AsString;
     Net:=Frodm.RUKelPsum.Value;
     BDat:=Frodm.RUKelDat.Value;
     NBNo:=AutoBill(True,0,BehKod,Net,St,Frodm.RUKelNo.AsString,BNo,BTip,BDat,
     Frodm.RKelCost.AsString,Frodm.RKelCkod.AsInteger,Net,1,DefaultCurr);

     Frodm.RUKI.First;
     For I:=1 To Frodm.RUKI.RecordCount Do
     Begin
      St:='⁄Êœ  «“ ò·— çò ‘„«—Â'+' '+Frodm.RUKIBno.AsString+' ÿÌ —”Ìœ ‘„«—Â '+Frodm.RUKelNo.AsString;
      Net:=Frodm.RUKIPbill.Value;
      NBNo:=AutoBill(True,BesKod,0,Net,St,Frodm.RUKelNo.AsString,BNo,BTip,BDat,
      Frodm.RKelCost.AsString,Frodm.RKelCkod.AsInteger,Net,1,DefaultCurr);
      Frodm.RUKI.Next;
     End;
     Frodm.RUKI.First;

     If NBNo = BNo Then BillUpdate(BNo) Else
      If sBill Then MakeBill('”‰œ ⁄Êœ  «”‰«œ œ— Ã—Ì«‰ Ê’Ê· ‘„«—Â'+Frodm.RUKelNo.AsString);
     BNo:=NBNo;
end;

procedure TFRUKeler.NextTab(Sender: TObject; var Key: Char);
begin
     If Key=#13 Then
     Begin
      Key:=#0;
      SelectNext(Sender As TWinControl,True,True);
     End;
end;

procedure TFRUKeler.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Case New Of
     True : IF Check_Factor_State(Frodm.Rukel,BSaveClick,FormDestroy)=idCancel Then
      Action :=caNone
     Else
      Action:=caFree;
     False:Action:=caFree;
     End;
     If Action=caFree Then
     Begin
      Frodm.RUKI.Filtered:=False;
      Frodm.Rukel.Close;
      Frodm.RUKI.Close;
      Frodm.Rcheq.Close;
     End;
end;

procedure TFRUKeler.FormActivate(Sender: TObject);
begin
     Frodm.RUKI.Filtered:=True;
     Frodm.Rcheq.Open;
end;

procedure TFRUKeler.FormCreate(Sender: TObject);
begin
     SetImage;
     Set_Forms(Self);
     EdQu.DatabaseName:=CurrDb;
     FCost.Items.Assign(CostList);
     Fill_Comb(Frodm.JariNam,'Nam',FAccNam.Items);
     Fill_Comb(Frodm.Rcheq,'Bank',BList.Items);
     Frodm.Rukel.open;
     Frodm.RUKI.Open;
     Frodm.RUKel.Last;
     FNo.Text:=Frodm.RUKelNo.AsString;
     Dat1.Text:=IntToDate(Frodm.RUKelDat.AsInteger);
//     NewRec;
end;

procedure TFRUKeler.FormDestroy(Sender: TObject);
begin
     If Frodm.RUKel.State = dsBrowse Then Exit;
     FNo.SetFocus;
     Case New Of
     True  :Begin
             CancelFactor(Frodm.RUKel,Frodm.RUKI);
             FNo.Text:=IntToStr(Frodm.RUKelNo.Value);
             Dat1.Text:=IntToDate(Frodm.RUKelDat.AsInteger);
            End;
     False : CancelEdit;
     End;
     BSave.Enabled:=False;
     BEdit.Enabled:=True;
     Label6.Visible:=False;
     FDNo.Visible:=False;
end;

procedure TFRUKeler.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFRUKeler.FNoKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then FNo_Exit;
     NextTab(Sender,Key);
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;
end;

procedure TFRUKeler.Dat1Enter(Sender: TObject);
begin
     If Frodm.RUKel.State = dsBrowse Then Dat1.ReadOnly :=True Else
     Begin
        Dat1.ReadOnly :=False;
        GetMaskText(Dat1);
     End;
end;

procedure TFRUKeler.Dat1Exit(Sender: TObject);
begin
     If (Frodm.RUKel.State = dsBrowse) Then Exit;
     SetMaskText(Dat1);
     If(Not Date_Check(Dat1.Text))And(DateToInt(Dat1.Text)>0) Then
      Dat1.SetFocus
     Else
       Frodm.RUKeldat.Value :=DateToInt(Dat1.Text);
end;

procedure TFRUKeler.FDNoKeyPress(Sender: TObject; var Key: Char);
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

procedure TFRUKeler.dbgEnter(Sender: TObject);
begin
     If (Frodm.RUKel.State = dsBrowse)  Then
       dbg.ReadOnly := True Else dbg.ReadOnly :=False;
     dbg.selectedField:=dbg.Columns[0].Field;
end;

procedure TFRUKeler.dbgKeyPress(Sender: TObject; var Key: Char);
Var
Radif:Integer;
begin
     If Key = #13 Then
     Begin
      Key:=#0;
      GridMove(dbg,Frodm.RUKel,Radif);
     End;
     If Not(Frodm.RUKel.State = dsBrowse) Then Frodm.RUKI.Edit;
end;

procedure TFRUKeler.dbgEditButtonClick(Sender: TObject);
begin
     If (Frodm.RUKel.State In [dsInsert,dsEdit]) Then
     Begin
       Frodm.RUKI.Delete;
       Frodm.RUKI.Edit;
     End;
end;


procedure TFRUKeler.BprevClick(Sender: TObject);
begin
     If Frodm.RUKel.State In [dsEdit,dsInsert] Then
     Begin
       FNo.SetFocus;
       IF Check_Factor_State(Frodm.RUKel,BSaveClick,FormDestroy) = idCancel Then Exit;
       New:=False;
       Exit;
     End;
     Frodm.RUKel.Refresh;
     Frodm.RUKel.Prior;
     Dat1.Text:=IntToDate(Frodm.RUKelDat.AsInteger);
     FNo.Text:=IntToStr(Frodm.RUKelNo.Value);
     RNo:=Frodm.RUKelNo.Value;
end;

procedure TFRUKeler.BnextClick(Sender: TObject);
begin
     If Frodm.RUKel.State In [dsEdit,dsInsert] Then
     Begin
       FNo.SetFocus;
       IF Check_Factor_State(Frodm.RUKel,BSaveClick,FormDestroy) = idCancel Then Exit;
       New:=False;
       Exit;
     End;
     Frodm.RUKel.Refresh;
     Frodm.RUKel.Next;
     Dat1.Text:=IntToDate(Frodm.RUKelDat.AsInteger);
     FNo.Text:=IntToStr(Frodm.RUKelNo.Value);
     RNo:=Frodm.RUKelNo.Value;
end;

procedure TFRUKeler.BeditClick(Sender: TObject);
begin
     If Not(Frodm.RUKel.State = dsBRowse) Then Exit;
     If Frodm.RUKelPerm.Value Then
     Begin
      Beep;
      ShowMessage('ﬁÿ⁄Ì ‘œÂ «” ');
      Exit;
     End;
     Dat1.Text:=IntToDate(Frodm.RUKelDat.AsInteger);
     FAccNam.ItemIndex:=FAccNam.Items.IndexOf(FAccNam.Text);
     RNo:=Frodm.RUKelNo.AsInteger;
     BNo:=Frodm.RUKelBno.Value;
     DelBitem(IntToStr(RNo),BNo,19);
     RepostCheqes(False);
     EdQu.Params[0].Value:=RNo;
     EdQu.Open;
     Frodm.RUKel.Edit;
     New:=False;
     BSave.Enabled:=True;
     BEdit.Enabled:=False;
     Dat1.SetFocus;
     Label6.Visible:=True;
     FDNo.Visible:=True;
end;

procedure TFRUKeler.BSaveClick(Sender: TObject);
begin
     If (Frodm.RUKel.State = dsBRowse) Then Exit;
     If Frodm.RUKI.RecordCount = 0 Then
     Begin
      Frodm.RUKel.Delete;
      FNo.Text:=Frodm.RUKelNo.AsString;
      Dat1.Text:=IntToDate(Frodm.RUKelDat.AsInteger);
      RNo:=Frodm.RUKelNo.AsInteger;
      New:=False;
     End Else Begin
      Frodm.RUKelAccKod.Value:=AccKod(Frodm.RUKelAcnam.AsString);
      Frodm.RUKelPsum.Value:=GetSum;
      Frodm.RUKel.Post;
      RepostCheqes(True);
      Make_Bill;
      FacBillNo(Frodm.RUKel,Frodm.RUKelNo.AsInteger,BNo);
     End;
     QuickCloseOpen([47,46,6,24,8]);
     EdQu.Close;
     Frodm.RUKel.Locate('No',RNo,[loCaseInsensitive]);
     FNo.Text:=Frodm.RUKelNo.AsString;
     Dat1.Text:=IntToDate(Frodm.RUKelDat.AsInteger);
     BSave.Enabled:=False;
     BEdit.Enabled:=True;
     New:=False;
     BNo:=0;
     Label6.Visible:=False;
     FDNo.Visible:=False;
end;

procedure TFRUKeler.BexitClick(Sender: TObject);
begin
     If Frodm.RUKel.State In [dsEdit,dsInsert] Then
     Begin
       FNo.SetFocus;
       IF Check_Factor_State(Frodm.RUKel,BSaveClick,FormDestroy) = idCancel Then Exit;
       Exit;
     End;
     Close;
end;

procedure TFRUKeler.dbgColEnter(Sender: TObject);
begin
     If Frodm.RUKel.State = dsBrowse Then Exit Else Frodm.RUKI.Edit;
     Case Dbg.SelectedField.Index Of
     5: Frodm.RUKINo.AsInteger:=FroDM.RUKelNo.AsInteger;
     3: If BList.Items.Count > 0 Then  DrawList(BList,3);
     End;
end;

procedure TFRUKeler.BListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key Of
     27: Begin
          dbg.SelectedField:=Frodm.RUKIBank;
          dbg.SetFocus;
          Bexit.Cancel :=True;
         End;

     13: Begin
          Key:=0;
          Frodm.RUKIBank.Value:=BList.Items[BList.ItemIndex];
          dbg.SelectedField:=Frodm.RUKIPBill;
          dbg.SetFocus;
          Bexit.Cancel :=True;
         End;
     End;
end;

procedure TFRUKeler.dbgKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key Of
     VK_F4 :If (Dbg.SelectedField.Index = 3)and Not(Frodm.RUKel.State=dsBrowse) Then
              Drawlist(BList,3);
     VK_TAB: If (ssShift in Shift)and(dbg.Row=1)and(dbg.SelectedIndex=0) Then
              SelectNext(Sender As TWinControl,Not (ssShift in Shift),True) Else
             If Not(ssShift in Shift)and(dbg.Row=dbg.DataSource.DataSet.RecordCount)and
             (dbg.SelectedIndex=dbg.Columns.Count-1) Then
              SelectNext(Sender As TWinControl,Not (ssShift in Shift),True);

     End;
end;

procedure TFRUKeler.BNewClick(Sender: TObject);
begin
     If Frodm.RUKel.State <> dsBrowse Then Exit;
     NewRec;
end;

procedure TFRUKeler.BDelClick(Sender: TObject);
Var
I:Integer;
begin
     If Not (Frodm.RUKel.State = dsBrowse) Then Exit;
     If Frodm.RUKelPerm.Value Then
     Begin
      Beep;
      ShowMessage('ﬁÿ⁄Ì ‘œÂ «” ');
      Exit;
     End;
     If MessageDlg('—”Ìœ çò Õ–› ‘Êœø',mtWarning,mbYesNo,-1) = mrYes Then
     begin
      RNo:=Frodm.RUKelNo.AsInteger;
      BNo:=Frodm.RUKelBno.AsInteger;
      DelBItem(IntToStr(RNo),BNo,19);
      BillUpdate(BNo);
      RepostCheqes(False);
      For I:=1 To Frodm.RUKI.RecordCount Do Frodm.RUKI.Delete;
      Frodm.RUKel.Delete;
      FNo.Text:=Frodm.RUKelNo.AsString;
      Dat1.Text:=IntToDate(Frodm.RUKelDat.AsInteger);
     End;
end;

procedure TFRUKeler.BprintClick(Sender: TObject);
Var
I:Integer;
QDbT:TQRDbText;
begin
     If Not(Frodm.RUKel.State = dsBrowse) Then Exit;
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
       If QDbT.DataSet =Frodm.RPay Then QDbT.DataSet :=Frodm.RUkel;
       If QDbT.DataSet =Frodm.RPI Then QDbT.DataSet :=Frodm.RUKI;
      End;
     End;
     QrRPay.QrArt.DataSet:=Frodm.RUKI;
     QrRPay.Preview;
     QrRPay.Destroy;
end;


procedure TFRUKeler.FCKodKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetCentLookup(Sender,Key);
end;

end.
