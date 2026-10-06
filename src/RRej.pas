unit RRej;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Mask, Grids, DBGrids, ExtCtrls, PopupListBox, Db,
  DBTables, Buttons, ComCtrls, Menus;

type
  TFRRej = class(TForm)
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
  FRRej: TFRRej;

implementation

uses ProVar, Routins, MainForm, FrooshDM, RPayRep, QrCtrls;

{$R *.DFM}

function TFRRej.Max_No: Integer;
begin
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Max(I.No) From RRej I ');
     Qu.Open;
     Result:=Qu.Fields[0].AsInteger;
     Qu.Close;
end;

procedure TFRRej.FNo_Exit;
begin
     If Not(Frodm.RRej.State =dsBrowse) Then
     Begin
       FNo.Text :=IntToStr(Frodm.RRejNo.Value);
       Exit;
     End;
     RNo:=StrToInt(FNo.Text);
     If Not(Frodm.RRej.Locate('No',RNo,[loCaseInsensitive])) Then NewRec;// Else BeditClick(Owner);
     Dat1.Text:=IntToDate(Frodm.RRejDat.AsInteger);
end;

procedure TFRRej.NewRec;
begin
     Frodm.RRej.Append;
     Frodm.RRejNo.Value:=Max_No+1;
     Frodm.RRejDat.Value:=Fardate;
     Frodm.RRejPerm.Value:=False;
     Frodm.RRejBilled.Value:=False;
     Frodm.RRej.Post;
     Frodm.RRej.Edit;
     BSave.Enabled:=True;
     BEdit.Enabled:=False;
     New:=True;
     FNo.Text:=Frodm.RRejNo.AsString;
     Dat1.Text:=IntToDate(Frodm.RRejDat.AsInteger);
     Label6.Visible:=True;
     FDNo.Visible:=True;
     RNo:=Frodm.RRejNo.Value
end;

procedure TFRRej.CancelEdit;
Var
I,J:Integer;
begin
     If (Frodm.RRI.Filtered=False)or(EDQu.RecordCount = 0)or(EDQu.Active =False) Then Exit;
     Frodm.RRI.First;
     For I:=1 To Frodm.RRI.RecordCount Do Frodm.RRI.Delete;
     EdQu.First;
     For I:=1 To EdQu.RecordCount Do
     Begin
      Frodm.RRI.Append;
      For J:=0 To 6 Do Frodm.RRI.Fields[J].Value:=EdQu.Fields[J].Value;
      Frodm.RRI.Post;
      EdQu.Next;
     End;
     EdQu.Close;
     Frodm.RRej.Cancel;
     Frodm.RRI.First;
     RepostCheqes(True);
     Make_Bill;
     Dat1.Text:=IntToDate(Frodm.RRejDat.AsInteger);
     FNo.Text:=Frodm.RRejNo.AsString;
end;

Function TFRRej.GetSum:Currency;
begin
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Sum(PBill) From RRejI R Where R.No=:g ');
     Qu.Params[0].Value:=RNo;
     Qu.Open;
     Result:=Qu.Fields[0].AsCurrency;
     Qu.Close;
end;

Procedure TFRRej.DrawList(List:TPopupListBox;Index:Integer);
begin
     List.Visible :=True;
     Bexit.Cancel :=False;
     List.SetFocus;
     List.ItemIndex :=List.Items.IndexOf(dbg.Columns[Index].Field.Text);
     If List.ItemIndex = -1 Then List.ItemIndex:=0;
end;

procedure TFRRej.SetImage;
begin
     Main.glKey.GetBitmap(0,BPrev.Glyph);
     Main.glKey.GetBitmap(1,Bnext.Glyph);
     Main.glKey.GetBitmap(2,BPrint.Glyph);
     Main.glKey.GetBitmap(3,Bedit.Glyph);
     Main.glKey.GetBitmap(8,Bsave.Glyph);
     Main.glKey.GetBitmap(7,BExit.Glyph);
     Main.glKey.GetBitmap(5,Bdel.Glyph);
end;

Procedure TFRRej.CancelFactor(Table1,Table2:TTable);
Var
I:Integer;
begin
     Table2.Cancel;
     If Not Table2.Filtered Then Exit;
     If Table2.RecordCount > 0 Then
         For I:=1 To Table2.RecordCount Do Table2.Delete;
     Table1.Delete;
end;

procedure TFRRej.RePostCheqes(State:Boolean);
Var
I:Integer;
begin
     Frodm.RRI.First;
     For I:=1 To Frodm.RRI.RecordCount Do
     Begin
      Frodm.Rcheq.Locate('BNo;BDat;PBill',VarArrayof([Frodm.RRIBNo.Value,
      Frodm.RRIBDat.Value,Frodm.RRIPBill.Value]),[loCaseInsensitive]);
      Frodm.Rcheq.Edit;
      Case State Of
      True:
      Begin
       Frodm.RcheqKeler.AsBoolean:=False;
       Frodm.RcheqReject.AsBoolean:=True;
       If sRej Then Frodm.RcheqReckod.Value:=True;
      End;
      False:
      Begin
       Frodm.RcheqKeler.AsBoolean:=True;
       Frodm.RcheqReject.AsBoolean:=True;
       If sRej Then Frodm.RcheqReckod.Value:=False;
      End;
      End;
      Frodm.Rcheq.Post;
      Frodm.RRI.Next;
     End;
end;

function TFRRej.MoveToGrid(Serial: String): boolean;
Var
I:Integer;
begin
     If Frodm.RRej.State = dsBrowse Then Exit;
     Qu.SQL.Clear;
     Qu.SQL.Add('Select BDat,BNo,Bank,PBill,AccKod From Rcheq Where BNo=:b '+
                ' and Jari=:j and RecKod = 0 and Keler=1');
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
     Frodm.RRI.Append;
     Frodm.RRIRadif.Value:=Frodm.RRI.RecordCount+1;
     Frodm.RRINo.Value:=Frodm.RRejNo.Value;
     For I:=0 To 4 Do Frodm.RRI.Fields[I+1].Value:=Qu.Fields[I].Value;
     Frodm.RRI.Post;
     Qu.Close;
end;

Procedure TFRRej.Make_Bill;
Var
I:Integer;
BesKod,BehKod:Real;
Net:Currency;
BTip,NBNo,BDat:Integer;
St:String;
begin
     BTip:=18;
     BesKod:=Def_Reject_Bes;
     BehKod:=Def_Reject;
     Frodm.RRI.First;
     For I:=1 To Frodm.RRI.RecordCount Do
     Begin
      St:='»—ê‘  çò ‘„«—Â'+' '+Frodm.RRIBno.AsString+' ÿÌ —”Ìœ ‘„«—Â '+Frodm.RRejNo.AsString;
      Net:=Frodm.RRIPbill.Value;
      BDat:=Frodm.RRejDat.Value;
      Case sRej Of
      True : BehKod:=Frodm.RRIAckod.Value;
      False: BehKod:=Def_Reject;
      End;
      NBNo:=AutoBill(True,BesKod,BehKod,Net,St,Frodm.RRejNo.AsString,BNo,BTip,BDat,
      Frodm.RRejCost.AsString,Frodm.RRejCkod.AsInteger,Net,1,DefaultCurr);
      Frodm.RRI.Next;
     End;
     Frodm.RRI.First;
     {
     St:='Ã„⁄ ò· —”Ìœ «”‰«œ œ— Ã—Ì«‰ Ê’Ê· ‘„«—Â'+' '+Frodm.RRejNo.AsString;
     Net:=Frodm.RRejPsum.Value;
     BDat:=Frodm.RRejDat.Value;
     NBNo:=AutoBill(True,BesKod,0,Net,St,Frodm.RRejNo.AsString,BNo,BTip,BDat,
     Frodm.RRejCost.AsString,Frodm.RRejCkod.AsInteger);
      }
     If NBNo = BNo Then BillUpdate(BNo) Else
      If sBill Then MakeBill('”‰œ —”Ìœ »—ê‘  çò ‘„«—Â'+Frodm.RRejNo.AsString);
     BNo:=NBNo;
end;

procedure TFRRej.NextTab(Sender: TObject; var Key: Char);
begin
     If Key=#13 Then
     Begin
      Key:=#0;
      SelectNext(Sender As TWinControl,True,True);
     End;
end;

procedure TFRRej.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Case New Of
     True : IF Check_Factor_State(Frodm.RRej,BSaveClick,FormDestroy)=idCancel Then
      Action :=caNone
     Else
      Action:=caFree;
     False:Action:=caFree;
     End;
     If Action = caFree Then
     Begin
      Frodm.RRI.Filtered:=False;
      Frodm.RRej.Close;
      Frodm.RRI.Close;
      Frodm.Rcheq.Close;
     End;
end;

procedure TFRRej.FormActivate(Sender: TObject);
begin
     Frodm.RRI.Filtered:=True;
     Frodm.Rcheq.Open;
end;

procedure TFRRej.FormCreate(Sender: TObject);
begin
     SetImage;
     Set_Forms(Self);
     EdQu.DatabaseName:=CurrDb;
     FCost.Items.Assign(CostList);
     Fill_Comb(Frodm.JariNam,'Nam',FAccNam.Items);
     Fill_Comb(Frodm.Rcheq,'Bank',BList.Items);
     Frodm.RRej.Open;
     Frodm.RRI.Open;
     Frodm.RRej.Last;
     FNo.Text:=Frodm.RRejNo.AsString;
     Dat1.Text:=IntToDate(Frodm.RRejDat.AsInteger);
//     NewRec;
end;

procedure TFRRej.FormDestroy(Sender: TObject);
begin
     If Frodm.RRej.State = dsBrowse Then Exit;
     FNo.SetFocus;
     Case New Of
     True  :Begin
             CancelFactor(Frodm.RRej,Frodm.RRI);
             FNo.Text:=IntToStr(Frodm.RRejNo.Value);
             Dat1.Text:=IntToDate(Frodm.RRejDat.AsInteger);
            End;
     False : CancelEdit;
     End;
     BSave.Enabled:=False;
     BEdit.Enabled:=True;
     Label6.Visible:=False;
     FDNo.Visible:=False;
end;

procedure TFRRej.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFRRej.FNoKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then FNo_Exit;
     NextTab(Sender,Key);
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;
end;

procedure TFRRej.Dat1Enter(Sender: TObject);
begin
     If Frodm.RRej.State = dsBrowse Then Dat1.ReadOnly :=True Else
     Begin
        Dat1.ReadOnly :=False;
        GetMaskText(Dat1);
     End;
end;

procedure TFRRej.Dat1Exit(Sender: TObject);
begin
     If (Frodm.RRej.State = dsBrowse) Then Exit;
     SetMaskText(Dat1);
     If(Not Date_Check(Dat1.Text))And(DateToInt(Dat1.Text)>0) Then
      Dat1.SetFocus
     Else
       Frodm.RRejdat.Value :=DateToInt(Dat1.Text);
end;

procedure TFRRej.FAccNamKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Frodm.RRej.State = dsBrowse Then Exit;
     If Key = 32 Then
     Begin
      Frodm.RRejAcNam.Value:=FindAccount(Frodm.RRejAcNam.Value,FindCode);
      Frodm.RrejAccKod.AsFloat:=FindCode;
     End;
end;

procedure TFRRej.FDNoKeyPress(Sender: TObject; var Key: Char);
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

procedure TFRRej.dbgEnter(Sender: TObject);
begin
     If (Frodm.RRej.State = dsBrowse)  Then
       dbg.ReadOnly := True Else dbg.ReadOnly :=False;
     dbg.selectedField:=dbg.Columns[0].Field;
end;

procedure TFRRej.dbgKeyPress(Sender: TObject; var Key: Char);
Var
Radif:Integer;
begin
     If Key = #13 Then
     Begin
      Key:=#0;
      GridMove(dbg,Frodm.RRej,Radif);
     End;
     If Not(Frodm.RRej.State = dsBrowse) Then Frodm.RRI.Edit;
end;

procedure TFRRej.dbgEditButtonClick(Sender: TObject);
begin
     If (Frodm.RRej.State In [dsInsert,dsEdit]) Then
     Begin
       Frodm.RRI.Delete;
       Frodm.RRI.Edit;
     End;
end;


procedure TFRRej.BprevClick(Sender: TObject);
begin
     If Frodm.RRej.State In [dsEdit,dsInsert] Then
     Begin
       FNo.SetFocus;
       IF Check_Factor_State(Frodm.RRej,BSaveClick,FormDestroy) = idCancel Then Exit;
       New:=False;
       Exit;
     End;
     Frodm.RRej.Refresh;
     Frodm.RRej.Prior;
     Dat1.Text:=IntToDate(Frodm.RRejDat.AsInteger);
     FNo.Text:=IntToStr(Frodm.RRejNo.Value);
     RNo:=Frodm.RRejNo.Value;
end;

procedure TFRRej.BnextClick(Sender: TObject);
begin
     If Frodm.RRej.State In [dsEdit,dsInsert] Then
     Begin
       FNo.SetFocus;
       IF Check_Factor_State(Frodm.RRej,BSaveClick,FormDestroy) = idCancel Then Exit;
       New:=False;
       Exit;
     End;
     Frodm.RRej.Refresh;
     Frodm.RRej.Next;
     Dat1.Text:=IntToDate(Frodm.RRejDat.AsInteger);
     FNo.Text:=IntToStr(Frodm.RRejNo.Value);
     RNo:=Frodm.RRejNo.Value;
end;

procedure TFRRej.BeditClick(Sender: TObject);
begin
     If Not(Frodm.RRej.State = dsBRowse) Then Exit;
     If Frodm.RRejPerm.Value Then
     Begin
      Beep;
      ShowMessage('ﬁÿ⁄Ì ‘œÂ «” ');
      Exit;
     End;
     Dat1.Text:=IntToDate(Frodm.RRejDat.AsInteger);
     FAccNam.ItemIndex:=FAccNam.Items.IndexOf(FAccNam.Text);
     RNo:=Frodm.RRejNo.AsInteger;
     BNo:=Frodm.RRejBno.Value;
     DelBitem(IntToStr(RNo),BNo,18);
     RepostCheqes(False);
     EdQu.Params[0].Value:=RNo;
     EdQu.Open;
     Frodm.RRej.Edit;
     New:=False;
     BSave.Enabled:=True;
     BEdit.Enabled:=False;
     Dat1.SetFocus;
     Label6.Visible:=True;
     FDNo.Visible:=True;
end;

procedure TFRRej.BSaveClick(Sender: TObject);
begin
     If (Frodm.RRej.State = dsBRowse) Then Exit;
     If Frodm.RRI.RecordCount = 0 Then
     Begin
      Frodm.RRej.Delete;
      FNo.Text:=Frodm.RRejNo.AsString;
      Dat1.Text:=IntToDate(Frodm.RRejDat.AsInteger);
      RNo:=Frodm.RRejNo.AsInteger;
      New:=False;
     End Else Begin
//      Frodm.RRejAccKod.Value:=AccKod(Frodm.RRejAcnam.AsString);
      Frodm.RRejPsum.Value:=GetSum;
      Frodm.RRej.Post;
      RepostCheqes(True);
      Make_Bill;
      FacBillNo(Frodm.RRej,Frodm.RRejNo.AsInteger,BNo);
     End;
     QuickCloseOpen([47,46,6,24,8]);
     EdQu.Close;
     Frodm.RRej.Locate('No',RNo,[loCaseInsensitive]);
     FNo.Text:=Frodm.RRejNo.AsString;
     Dat1.Text:=IntToDate(Frodm.RRejDat.AsInteger);
     BSave.Enabled:=False;
     BEdit.Enabled:=True;
     New:=False;
     BNo:=0;
     Label6.Visible:=False;
     FDNo.Visible:=False;
end;

procedure TFRRej.BexitClick(Sender: TObject);
begin
     If Frodm.RRej.State In [dsEdit,dsInsert] Then
     Begin
       FNo.SetFocus;
       IF Check_Factor_State(Frodm.RRej,BSaveClick,FormDestroy) = idCancel Then Exit;
       Exit;
     End;
     Close;
end;

procedure TFRRej.dbgColEnter(Sender: TObject);
begin
     If Frodm.RRej.State = dsBrowse Then Exit Else Frodm.RRI.Edit;
     Case Dbg.SelectedField.Index Of
     5: Frodm.RRINo.AsInteger:=FroDM.RRejNo.AsInteger;
     3: If BList.Items.Count > 0 Then  DrawList(BList,3);
     End;
end;

procedure TFRRej.BListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key Of
     27: Begin
          dbg.SelectedField:=Frodm.RRIBank;
          dbg.SetFocus;
          Bexit.Cancel :=True;
         End;

     13: Begin
          Key:=0;
          Frodm.RRIBank.Value:=BList.Items[BList.ItemIndex];
          dbg.SelectedField:=Frodm.RRIPBill;
          dbg.SetFocus;
          Bexit.Cancel :=True;
         End;
     End;
end;

procedure TFRRej.dbgKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key Of
     VK_F4 :If (Dbg.SelectedField.Index = 3)and Not(Frodm.RRej.State=dsBrowse) Then
              Drawlist(BList,3);
     VK_TAB: If (ssShift in Shift)and(dbg.Row=1)and(dbg.SelectedIndex=0) Then
              SelectNext(Sender As TWinControl,Not (ssShift in Shift),True) Else
             If Not(ssShift in Shift)and(dbg.Row=dbg.DataSource.DataSet.RecordCount)and
             (dbg.SelectedIndex=dbg.Columns.Count-1) Then
              SelectNext(Sender As TWinControl,Not (ssShift in Shift),True);

     End;
end;

procedure TFRRej.BNewClick(Sender: TObject);
begin
     If Frodm.RRej.State <> dsBrowse Then Exit;
     NewRec;
end;

procedure TFRRej.BDelClick(Sender: TObject);
Var
I:Integer;
begin
     If Not (Frodm.RRej.State = dsBrowse) Then Exit;
     If Frodm.RRejPerm.Value Then
     Begin
      Beep;
      ShowMessage('ﬁÿ⁄Ì ‘œÂ «” ');
      Exit;
     End;
     If MessageDlg('—”Ìœ çò Õ–› ‘Êœø',mtWarning,mbYesNo,-1) = mrYes Then
     begin
      RNo:=Frodm.RRejNo.AsInteger;
      BNo:=Frodm.RRejBno.AsInteger;
      DelBItem(IntToStr(RNo),BNo,18);
      BillUpdate(BNo);
      RepostCheqes(False);
      For I:=1 To Frodm.RRI.RecordCount Do Frodm.RRI.Delete;
      Frodm.RRej.Delete;
      FNo.Text:=Frodm.RRejNo.AsString;
      Dat1.Text:=IntToDate(Frodm.RRejDat.AsInteger);
     End;
end;

procedure TFRRej.BprintClick(Sender: TObject);
Var
I:Integer;
QDbT:TQRDbText;
begin
     If Not(Frodm.RRej.State = dsBrowse) Then Exit;
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
       If QDbT.DataSet =Frodm.RPay Then QDbT.DataSet :=Frodm.RRej;
       If QDbT.DataSet =Frodm.RPI Then QDbT.DataSet :=Frodm.RRI;
      End;
     End;
     QrRPay.QrArt.DataSet:=Frodm.RRI;
     QrRPay.Preview;
     QrRPay.Destroy;
end;


procedure TFRRej.FCKodKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetCentLookup(Sender,Key);
end;

end.
