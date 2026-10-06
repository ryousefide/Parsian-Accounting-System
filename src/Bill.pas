unit Bill;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Mask, DBCtrls, StdCtrls, Grids, DBGrids, ExtCtrls, Db, DBTables,
  PopupListBox;

type
  TFBill = class(TForm)
    FNo: TEdit;
    Label4: TLabel;
    Label3: TLabel;
    Bprev: TButton;
    Bsave: TButton;
    Bnext: TButton;
    Bexit: TButton;
    Bprint: TButton;
    BedSum: TDBEdit;
    Dat: TMaskEdit;
    Label1: TLabel;
    FDesc: TDBEdit;
    BItems: TDBGrid;
    Bedit: TButton;
    Label2: TLabel;
    Label5: TLabel;
    BesSum: TDBEdit;
    Bdel: TButton;
    GList: TPopupListBox;
    FPerm: TDBCheckBox;
    EdQu: TQuery;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Dif: TLabel;
    FTaf: TDBEdit;
    CList: TPopupListBox;
    AList: TPopupListBox;
    Label7: TLabel;
    FBTip: TDBLookupComboBox;
    Label8: TLabel;
    CuList: TPopupListBox;
    procedure NextTab(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BprevClick(Sender: TObject);
    procedure BnextClick(Sender: TObject);
    procedure BsaveClick(Sender: TObject);
    procedure BprintClick(Sender: TObject);
    procedure BnewClick(Sender: TObject);
    procedure BexitClick(Sender: TObject);
    procedure BItemsKeyPress(Sender: TObject; var Key: Char);
    procedure FNoExit(Sender: TObject);
    procedure FNoKeyPress(Sender: TObject; var Key: Char);
    procedure DatEnter(Sender: TObject);
    procedure DatExit(Sender: TObject);
    procedure BItemsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BeditClick(Sender: TObject);
    procedure BItemsEnter(Sender: TObject);
    procedure BItemsExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure BItemsEditButtonClick(Sender: TObject);
    procedure BdelClick(Sender: TObject);
    procedure GListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GListKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure BItemsColExit(Sender: TObject);
    procedure BItemsColEnter(Sender: TObject);
    procedure CListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CListKeyPress(Sender: TObject; var Key: Char);
    procedure AListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure AListKeyPress(Sender: TObject; var Key: Char);
    procedure BItemsMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure CuListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CuListKeyPress(Sender: TObject; var Key: Char);
    procedure BItemsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BItemsDblClick(Sender: TObject);
  private
    { Private declarations }
    NewNo:Integer;
    ODat:Integer;
    MaxNo:Integer;
    Radif:Integer;
    New:Boolean;
    DDes:String;
    Procedure DrawList(List:TPopupListBox);
    Procedure CancelEdit;
    Procedure BFilt(BNo:Integer);
  public
    { Public declarations }
    Function Balanc :Boolean;
  end;

var
  FBill: TFBill;


implementation

uses FrooshDM, ProVar, Routins, AutoMation, BillRep, Converts, CRoutins,
  BillRep2,Math;// DbTables, Db
Var
  ColumnWidthHelper : TColumnWidthHelper;
{$R *.DFM}

//Private Decelaration
Procedure TFBill.DrawList(List:TPopupListBox);
begin
     If List.Items.Count > 0 Then
     Begin
      List.Visible :=True;
      List.SetFocus;
      Bexit.Cancel :=False;
     End;
end;

Function TFBill.Balanc :Boolean;
Var
Tbed,Tbes:Currency;
begin
     Result:=False;
     If Frodm.Bill.State = dsBrowse Then Exit;
     If Not (Frodm.AcBill.State = dsBrowse) Then Frodm.AcBill.Post;
     Qu.Sql.Clear;
     Qu.SQl.Add('Select Sum(C.Bed),Sum(C.Bes)');
     Qu.Sql.Add('From AcountBill C');
     Qu.Sql.Add('Where C.No = '+IntToStr(Frodm.BillNo.Value));
     Qu.Open;
     TBed:=Qu.Fields[0].AsCurrency;
     TBes:=Qu.Fields[1].AsCurrency;
//     If Visible Then Dif.Caption:=CurrToFar(Qu.Fields[0].AsCurrency-Qu.Fields[1].AsCurrency);
     Qu.Close;
     If TBed <> TBes Then Result:=False Else Result:=True;
     Frodm.BillBedSum.AsCurrency :=TBed;
     Frodm.BillBesSum.AsCurrency :=TBes;
end;

Procedure TFBill.BFilt(BNo:Integer);
begin
     Frodm.Acbill.Filtered:=False;
     Frodm.Acbill.Filter:='No = '+IntToStr(BNo);
     Frodm.Acbill.Filtered:=True;
end;

Procedure TFBill.CancelEdit;
Var
I,J:Integer;
begin
     If (EdQu.RecordCount = 0 )or(Frodm.Acbill.Filtered = False) Then Exit;
     Frodm.AcBill.First;
     For I:=1 To Frodm.Acbill.RecordCount Do Frodm.Acbill.Delete;
     EdQu.First;
     For I:=1 To EdQu.RecordCount Do
     Begin
       Frodm.Acbill.Append;
       For J:=1 To 13 Do
        Frodm.Acbill.Fields[J].Value:=EDQu.Fields[J].Value;
       Frodm.Acbill.Post;
       EDQu.Next;
     End;
     EDQu.Close;
     Frodm.Bill.Cancel;
     Frodm.Acbill.First;
End;
//End Of Private Decaleration
procedure TFBill.NextTab(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
       Key:=#0;
       SelectNext(Sender As TwinControl,True,True);
     End;
end;

procedure TFBill.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Frodm.Acbill.Filtered:=False;
     Frodm.Acbill.BeforePost:=Nil;
     Frodm.Btip.Close;
     Action:=caFree;
end;

procedure TFBill.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     Frodm.Acbill.Open;
     Frodm.Btip.Open;
     //Frodm.Acbill.MasterSource:=Frodm.BillDs;
     Bitems.Columns[3].Visible:=CostList.Count > 0;
     Bitems.Columns[4].Visible:=Frodm.Cent.RecordCount > 0;
     EDQu.DatabaseName:=CurrDb;
     Frodm.Acbill.BeforePost:=Frodm.AcbillBeforePost;
     Radif:=1;
     If Frodm.Bill.Filtered Then Exit;
     Frodm.Bill.Last;
     MaxNo:=Frodm.BillNo.Value+1;
     FNo.Text:=IntToStr(Frodm.BillNo.Value);
     Dat.Text:=IntToDate(Frodm.BillDat.Value);
end;

procedure TFBill.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key = VK_F3 Then BsaveClick(Sender);
     If Shift = [ssAlt] Then
     Case Key Of
      VK_RIGHT :BnextClick(Sender);
      VK_LEFT  :BprevClick(Sender);
     End;
     If (Shift = [ssAlt]+[ssShift]+[ssCtrl]) and (Key = VK_F12) Then
           CreatingForm(TFAutoAcc,'FAutoAcc',FAutoAcc);
end;

procedure TFBill.FormDestroy(Sender: TObject);
begin
     If Frodm.Bill.State = dsBrowse Then Exit;
     Case New Of     //Frodm.Bill.State
     {dsInsert}True :Begin
                CancelFactor(Frodm.Bill,Frodm.Acbill);
                BFilt(Frodm.BillNo.Value);//1381-09-01
                FNo.Enabled:=True;
               End;
     {dsEdit}False   : CancelEdit;
     End;
end;

procedure TFBill.BprevClick(Sender: TObject);
begin
     If Frodm.Bill.State In [dsEdit,dsInsert] Then
     Begin
      FNo.SetFocus;
      If Check_Factor_State(Frodm.Bill,BsaveClick,FormDestroy)= idCancel Then Exit;
      New:=False;
      Exit;
     End;
     FroDM.Bill.Prior;
     BFilt(Frodm.BillNo.Value);//1381-09-01
     FNo.Text:=IntToStr(Frodm.BillNo.Value);
     Dat.Text:=IntToDate(Frodm.BillDat.Value);
     NewNo:=Frodm.BillNo.Value+1;
end;

procedure TFBill.BnextClick(Sender: TObject);
begin
     If Frodm.Bill.State In [dsEdit,dsInsert] Then
     Begin
      FNo.SetFocus;
      If Check_Factor_State(Frodm.Bill,BsaveClick,FormDestroy)= idCancel Then Exit;
      New:=False;
      Exit;
     End;
     FroDM.Bill.Next;
     BFilt(Frodm.BillNo.Value);//1381-09-01
     FNo.Text:=IntToStr(Frodm.BillNo.Value);
     Dat.Text:=IntToDate(Frodm.BillDat.Value);
     NewNo:=Frodm.BillNo.Value+1;
     If Frodm.Bill.Filtered = True Then Exit;
     If Frodm.Bill.Eof = True Then
     Begin
       FNo.Text:=IntToStr(NewNo);
       FNo.SetFocus;
     End;
end;

procedure TFBill.BsaveClick(Sender: TObject);
Var
idMsg:Integer;
begin
     If FroDM.Bill.State = dsBrowse Then Exit;
     If Frodm.AcBill.RecordCount = 0 Then
     Begin
       Frodm.Bill.Delete;//Cancel;
       BFilt(Frodm.BillNo.Value);
       FNo.Text:=IntToStr(Frodm.BillNo.Value);
       Fno.Enabled:=True;
       Exit;
     End;
     If Not Balanc Then
     Begin
       Beep;
       ShowMessage('”‰œ  —«“ ‰Ì” ');
       Dif.Caption:=CurrToFar(Frodm.BillBedSum.Value-Frodm.BillBesSum.Value);
       BItems.SetFocus;
       Exit;
     End;
     idMsg:=MessageDlg('”‰œ »” Â „Ì‘Êœø',mtInformation,mbYesNo,0);
     Case idMsg of
     mrYes: Frodm.BillPerm.Value :=True;
     mrNo : Frodm.BillPerm.Value :=False;
     End;
     Try
      Frodm.Bill.Post;
      Saved;
      New:=False;
      MaxNo:=MaxNo+1;
      Radif:=1;
     Except
      Beep;
      ShowMessage('     ”‰œ À»  ‰‘‹‹‹‹‹œ     ');
     End;
     FNo.Enabled:=True;
     FNo.SetFocus;
     EDQu.Close;
     idMsg:=Frodm.BillNo.Value;
     QuickCloseOpen([6,24]);
     Frodm.Bill.Locate('No',idMsg,[loCaseInsensitive]);
     BFilt(idMsg);
     Bitems.Columns[5].PickList.Clear;
end;


procedure TFBill.BeditClick(Sender: TObject);
begin
     If Frodm.BillPerm.Value Then
     Begin
       ShowMessage('”‰œ œ«∆„Ì «” ');
       Exit;
     End;
     EdQu.SQL.Strings[2]:='WHERE I.No ='+FNo.Text;
     EdQu.Open;
     Frodm.Bill.Edit;
     New:=False;
     Fill_Cond(Frodm.AcBill,'Des','AcountBill.No='+Frodm.BillNo.AsString,Bitems.Columns[5].PickList);
     Dat.SetFocus;
end;

procedure TFBill.BprintClick(Sender: TObject);
begin
     MoveBillToTemp(False,Frodm.BillNo.AsInteger);
     CreatingForm(TRepBill2,'RepBill2',RepBill2);
     Set_Sys_Enviroment;
     RepBill2.TAC.DatabaseName:=CurrDb;
     RepBill2.TAC.Open;
     RepBill2.QRLabel1.Caption :=InvoLbl;
     //RepBill2.QRLabel1.Font.Size :=LFont.Size+4;
     RepBill2.Preview;
     RepBill2.Destroy;
end;

procedure TFBill.BnewClick(Sender: TObject);
var
No:Integer;
begin
// Write Codes There
     If Frodm.Bill.Filtered Then Exit;
     No:= StrToInt(FNo.Text);
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Max(I.No) From Bill I ');
     Qu.Open;
     MaxNo:=Qu.Fields[0].AsInteger+1;
     Qu.Close;
     Frodm.Bill.Append;
     Frodm.BillTip.Value:=0;
     Frodm.BillPerm.Value:=False;
     If No > MaxNo Then No:=MaxNo;
     Frodm.BillNo.Value := No;
     Frodm.BillAtf.Value:=MaxAtf;
     BFilt(Frodm.BillNo.Value);//1381-09-01
     FNo.Text:=IntToStr(No);
     Dat.Text:=IntToDate(Fardate);
     //FNo.Enabled :=False;
     Frodm.Bill.Post;
     Frodm.Bill.Edit;
     New:=True;
end;

procedure TFBill.BexitClick(Sender: TObject);
begin
     IF Check_Factor_State(Frodm.Bill,BSaveClick,FormDestroy) = idCancel Then Exit;
     Close;
end;

procedure TFBill.BdelClick(Sender: TObject);
Var
I:Integer;
begin
     If Frodm.BillPerm.Value Then
     Begin
       ShowMessage('”‰œ œ«∆„Ì «”  ');
       Exit;
     End;
     If MessageDlg('”‰œ Ã«—Ì Õ–› ‘Êœø',mtWarning,mbYesNo,0) = idYes Then
     Begin
       For I:=1 To Frodm.AcBill.RecordCount Do Frodm.AcBill.Delete;
       Frodm.Bill.Delete;
       New:=False;
       I:=Frodm.BillNo.Value;
       QuickCloseOpen([6,24]);
       Frodm.Bill.Locate('No',I,[loCaseInsensitive]);
       BFilt(I);
       //BFilt(Frodm.BillNo.Value);//1381-09-01
       FNo.Enabled:=True;
       FNo.Text:=IntToStr(Frodm.BillNo.Value);
       Dat.Text:=IntToDate(Frodm.BillDat.Value);
     End;
end;

procedure TFBill.FNoExit(Sender: TObject);
Var
No:Integer;
begin
     No:= StrToInt(FNo.Text);
     If Frodm.Bill.Filtered = True Then
     Begin
        Frodm.Bill.Locate('No',No,[loCaseInsensitive]);
        Dat.Text:=IntToDate(Frodm.BillDat.Value);
        BFilt(Frodm.BillNo.Value);
        Exit;
     End;
     IF Frodm.Bill.Locate('No',No,[loCaseInsensitive]) Then
     Begin
       Dat.Text:=IntToDate(Frodm.BillDat.Value);
       BFilt(Frodm.BillNo.Value);//1381-09-01
     End Else
       BnewClick(Sender);
{     IF Frodm.Bill.State = dsInsert Then
     Begin
       If No > MaxNo Then No:=MaxNo;
       Frodm.BillNo.Value := No;
       Frodm.BillAtf.Value:=MaxAtf;
       BFilt(Frodm.BillNo.Value);//1381-09-01
       FNo.Text:=IntToStr(No);
       Dat.Text:=IntToDate(Fardate);
       FNo.Enabled :=False;
     End; }
end;

procedure TFBill.FNoKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then FNoExit(Sender);
     NextTab(Sender,Key);
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;
end;

procedure TFBill.DatEnter(Sender: TObject);
begin
     Odat:=DateToInt(Dat.Text);
     If Frodm.Bill.State = dsBrowse Then Dat.ReadOnly :=True Else
     Begin
       Dat.ReadOnly :=False;
       GetMaskText(Dat);
     End;
end;

procedure TFBill.DatExit(Sender: TObject);
Var
I:Integer;
begin
     If Frodm.Bill.State In [dsEdit,dsInsert] Then
     Begin
       SetMaskText(Dat);
       If Date_Check(Dat.Text) Then
       Begin
         Frodm.BillDat.Value :=DateToInt(Dat.Text);
         If (Odat >0)and(Odat <> Frodm.BillDat.Value)and(Frodm.AcBill.RecordCount >0) Then
         Begin
           Frodm.AcBill.First;
           For I:=1 To Frodm.AcBill.RecordCount Do
           Begin
             Frodm.AcBill.Edit;
             Frodm.AcBillDat.Value :=Frodm.BillDat.Value;
             Frodm.AcBill.Post;
             Frodm.AcBill.Next;
           End;
           Frodm.AcBill.First;
         End;
       End Else
         Dat.SetFocus;
     End;
end;

procedure TFBill.BItemsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Var
AcName:String;
Kod:Real;
begin
     If Shift = [ssCtrl]+[ssShift] Then FDesc.SetFocus;
     If Shift = [ssCtrl] Then BedSum.SetFocus;
     If Frodm.Bill.State = dsBrowse Then Exit;
     If Frodm.Bill.State In [dsEdit,dsInsert] Then Frodm.AcBill.Edit;
     Case BItems.SelectedField.Index of
       5: If Key =VK_F4 Then
          Begin
           Kod:=GetAcKod_Tree(AcName);
           Frodm.Acbill.Edit;
           Frodm.AcbillAckod.AsFloat:=Kod;
           Frodm.AcbillAccnam.AsString:=AcName;
           BItems.SelectedField :=Frodm.AcbillDesc;
          End;
       6: If Key =32 Then DrawList(GList);
      11: If Key =32 Then DrawList(CList);
      17: If Key =32 Then DrawList(CuList);
      12: If Key =32 Then
          Begin
           If sCent Then
           Fill_Popup(Frodm.Cent,'Nam','Kod',' Grop In (Select Grop From CPerm Where AcKod='+Frodm.AcbillAckod.AsString+')',Alist);
           DrawList(AList);
          End;
     3,4: Case Key Of
     VK_MULTIPLY :Begin
                  Frodm.AcBill.Post;
                  Frodm.AcBill.Edit;
                  BItems.SelectedField.Value := BItems.SelectedField.Value*1000;
                  End;
       VK_DIVIDE :Begin
                  Frodm.AcBill.Post;
                  Frodm.AcBill.Edit;
                  BItems.SelectedField.Value := BItems.SelectedField.Value* 100;
                  End;
               End;
     End;

end;

procedure TFBill.BItemsKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
      Key:=#0;
      If BItems.SelectedField.Index = 7 Then DDes:=Frodm.AcBillDesc.Value;
      GridMove(BItems,Frodm.Bill,Radif);
     End;
end;

procedure TFBill.BItemsEnter(Sender: TObject);
begin
     If Not(Frodm.Bill.State = dsBrowse) Then
     Begin
       BItems.ReadOnly :=False;
       Frodm.AcBill.Edit;
     End Else
       BItems.ReadOnly :=True;
     BItems.SelectedField:= BItems.Columns[0].Field;
end;

procedure TFBill.BItemsExit(Sender: TObject);
begin
     If Frodm.Bill.State = dsBrowse Then Exit;
     If Balanc Then Bsave.Enabled :=True Else Bsave.Enabled :=False;
     Dif.Caption:=CurrToFar(Frodm.BillBedSum.Value-Frodm.BillBesSum.Value);
end;

procedure TFBill.BItemsEditButtonClick(Sender: TObject);
begin
     If Frodm.Bill.State = dsBrowse Then Exit;
     Frodm.AcBill.Delete;
     Frodm.AcBill.Edit;
end;

procedure TFBill.GListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key = 27 Then
     Begin
       BItems.SetFocus;
       BItems.SelectedField :=BItems.Columns[1].Field;
       GList.Visible :=False;
       Bexit.Cancel :=True;
     End;
end;

procedure TFBill.GListKeyPress(Sender: TObject; var Key: Char);
Var
Str:String;
Kod:Real;
begin
     If Key=#13 Then
     Begin
     Key:=#0;
     Str:=Glist.Items.Strings[Glist.ItemIndex];
     Kod:=GList.AcCode[Glist.ItemIndex];// AccKod(Str);
     Frodm.AcBill.Edit;
     Frodm.AcBillAccNam.Value :=Str;
     Frodm.AcBillAckod.AsFloat :=Kod;
     Frodm.AcbillDat.Value :=Frodm.BillDat.Value;
     Frodm.AcBillNo.Value:=Frodm.BillNo.Value;
     Frodm.AcBill.Post;
     BItems.SetFocus;
     BItems.SelectedField := BItems.Columns[2].Field;
     GList.Visible :=False;
     Bexit.Cancel:=True;
     End;
end;

procedure TFBill.FormActivate(Sender: TObject);
begin
     Fill_Popup(Frodm.Ackod,'Nam','AccKod',' Usekod=1',GList);
     Fill_Popup(Frodm.Costc,'Nam','Kod','',Clist);
     Fill_Popup(Frodm.Cent,'Nam','Kod','',AList);
     CuList.Items.Assign(CurrList);
     FNo.Text:=IntToStr(Frodm.BillNo.Value);
     Dat.Text:=IntToDate(Frodm.BillDat.Value);
end;

procedure TFBill.BItemsColEnter(Sender: TObject);
begin
     IF Frodm.Bill.State = dsBrowse Then Exit Else Frodm.Acbill.Edit;
     Case BItems.SelectedField.Index Of
{     5:IF Frodm.AcbillAcKod.AsFloat =0 Then
       Begin
        Kod:=GetAcKod_Tree(AcName);
        Frodm.Acbill.Edit;
        Frodm.AcbillAckod.AsFloat:=Kod;
        Frodm.AcbillAccnam.AsString:=AcName;
        BItems.SelectedField :=Frodm.AcbillDesc;
       End; }
     7:Begin
        If (DDes >'')and Frodm.AcbillDesc.IsNull Then Frodm.AcbillDesc.Value:=DDes;
        If Bitems.Columns[5].PickList.IndexOf(DDes) = -1 Then Bitems.Columns[5].PickList.Add(DDes);
       End;   
    17:DrawList(CuList);
     //7:Fill_Cond(Frodm.Acbill,'Des',' AcountBill.No ='+Frodm.BillNo.AsString,Bitems.Columns[3].PickList);
     End;
end;

procedure TFBill.BItemsColExit(Sender: TObject);
begin
     IF Frodm.Bill.State = dsBrowse Then Exit Else Frodm.Acbill.Edit;
     Case BItems.SelectedField.Index Of
     8:Begin
        If Frodm.AcBillRadif.Value = 0 Then
         Frodm.AcBillRadif.Value :=Radif
        Else
         Radif:=Frodm.AcBillRadif.Value;
        Frodm.AcBillNo.Value:=Frodm.BillNo.Value;
        Frodm.AcbillTip.Value:=Frodm.BillTip.Value;
        Frodm.AcbillDat.Value :=Frodm.BillDat.Value;
        Frodm.Acbill.Post;//Refresh;
        Balanc;
        //Frodm.Acbill.Post;
       End;
     5:IF Frodm.AcbillAcKod.Value >0 Then
        Frodm.AcbillAccnam.Value:=AccNam(Frodm.AcbillAckod.Value)
       Else
        DrawList(GList);
     End;
     If BItems.Columns[0].Field.Value > 0 Then Radif:=Frodm.AcBillRadif.Value ;
end;

procedure TFBill.CListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key = 27 Then
     Begin
      BItems.SetFocus;
      BItems.SelectedField :=BItems.Columns[3].Field;
      CList.Visible :=False;
      BExit.Cancel:=True;
     End;
end;

procedure TFBill.CListKeyPress(Sender: TObject; var Key: Char);
Var
St:String;
begin
     If Key = #13 Then
     begin
      St:=Clist.Items.Strings[Clist.ItemIndex];
      Frodm.AcBill.Edit;
      Frodm.AcBillCost.Value:=St;
      BItems.SetFocus;
      BItems.SelectedField :=BItems.Columns[4].Field;
      CList.Visible :=False;
      Bexit.Cancel:=True;
     End;
end;

procedure TFBill.AListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key = 27 Then
     Begin
      BItems.SetFocus;
      BItems.SelectedField :=BItems.Columns[4].Field;
      AList.Visible :=False;
      BExit.Cancel:=True;
     End;
end;

procedure TFBill.AListKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     begin
      Frodm.AcBill.Edit;
      Frodm.AcBillCKod.AsFloat:=Alist.AcCode[Alist.ItemIndex];//CentKod(Str);
      Frodm.AcBill.Post;
      BItems.SetFocus;
      BItems.SelectedField :=BItems.Columns[5].Field;
      AList.Visible :=False;
      Bexit.Cancel:=True;
     End;
end;

procedure TFBill.CuListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key = 27 Then
     Begin
      BItems.SetFocus;
      BItems.SelectedField :=BItems.Columns[8].Field;
      CuList.Visible :=False;
      BExit.Cancel:=True;
     End;
end;

procedure TFBill.CuListKeyPress(Sender: TObject; var Key: Char);
Var
St:String;
begin
     If Key = #13 Then
     begin
      St:=Culist.Items.Strings[Culist.ItemIndex];
      Frodm.AcBill.Edit;
      Frodm.AcBillCtip.Value:=St;
      BItems.SetFocus;
      BItems.SelectedField :=BItems.Columns[8].Field;
      CuList.Visible :=False;
      Bexit.Cancel:=True;
     End;
end;

procedure TFBill.BItemsMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
MCord:TGridCoord;
begin
     MCord:=Bitems.MouseCoord(X,Y);
     Case MCord.X Of
     1,2,3:Bitems.Hint:='ÃÂ  ‰„«Ì‘ ·Ì”  ﬂ„ﬂÌ «‰ Œ«» Õ”«» ﬂ·Ìœ Space ›‘—œÂ ‘Êœ';
     //4,5:Bitems.Hint:=CentHint(Frodm.AcBillCKod.AsInteger);
     End;
     BItems.ShowHint:=True;
end;

procedure TFBill.BItemsDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  DrawRect: TRect;
begin
     if DataCol = ColumnWidthHelper.Index then
     begin
      if Assigned(Column.Field) then
      ColumnWidthHelper.MaxWidth := Max(ColumnWidthHelper.MaxWidth, Bitems.Canvas.TextWidth(Column.Field.DisplayText));
     end;
     Bitems.DefaultDrawColumnCell(Rect,DataCol,Column,State);
     if (Column.Field.FieldName ='Ckod' ) then
     Begin
      DrawRect:=Rect;
      Bitems.Canvas.FillRect(DrawRect);
      If Not Column.Field.IsNull Then
      Bitems.Canvas.Textout(DrawRect.Left+4,DrawRect.Top,CentName(Column.Field.Value));
     End;
end;

procedure TFBill.BItemsDblClick(Sender: TObject);
Var
mouseInGrid : TPoint;
gridCoord: TGridCoord;
begin
     mouseInGrid := Bitems.ScreenToClient(Mouse.CursorPos);
     gridCoord := Bitems.MouseCoord(mouseInGrid.X, mouseInGrid.Y);
     if not (dgTitles in Bitems.Options) then Exit;
     if gridCoord.Y <> 0 then Exit;
//find Column index
     if dgIndicator in Bitems.Options then
      ColumnWidthHelper.Index :=  -1 + gridCoord.x
     else
      ColumnWidthHelper.Index := gridCoord.x;
     if ColumnWidthHelper.Index < 0 then Exit;
     ColumnWidthHelper.MaxWidth := -1;
     Bitems.Repaint;
//"auto size" Column width
     Bitems.Columns[ColumnWidthHelper.Index].Width := 4 + ColumnWidthHelper.MaxWidth;
end;

end.
