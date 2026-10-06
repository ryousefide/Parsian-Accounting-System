unit Cperm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, StdCtrls, PopupListBox, Buttons;

type
  TFCperm = class(TForm)
    Cdbg: TDBGrid;
    Pdbg: TDBGrid;
    GKod: TPopupListBox;
    Splitter1: TSplitter;
    BnewLast: TBitBtn;
    BeditLast: TBitBtn;
    Bsave: TBitBtn;
    Panel3: TPanel;
    BNew: TBitBtn;
    BEdit: TBitBtn;
    BDel: TBitBtn;
    BPrint: TBitBtn;
    Bexit: TBitBtn;
    bFilter: TBitBtn;
    BSearch: TBitBtn;
    Panel1: TPanel;
    BNext: TBitBtn;
    BPrev: TBitBtn;
    BRet: TBitBtn;
    BFirst: TBitBtn;
    BLast: TBitBtn;
    FCen: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    FGro: TComboBox;
    bLink: TBitBtn;
    procedure NextTab(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CdbgKeyPress(Sender: TObject; var Key: Char);
    procedure CdbgEditButtonClick(Sender: TObject);
    procedure PdbgEnter(Sender: TObject);
    procedure PdbgKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure GKodKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GKodKeyPress(Sender: TObject; var Key: Char);
    procedure PdbgColEnter(Sender: TObject);
    procedure PdbgColExit(Sender: TObject);
    procedure BnewLastClick(Sender: TObject);
    procedure BeditLastClick(Sender: TObject);
    procedure BexitClick(Sender: TObject);
    procedure BsaveClick(Sender: TObject);
    procedure PdbgEditButtonClick(Sender: TObject);
    procedure FCenChange(Sender: TObject);
    procedure FGroChange(Sender: TObject);
    procedure CdbgColEnter(Sender: TObject);
    procedure CdbgKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BPrintClick(Sender: TObject);
    procedure BNewClick(Sender: TObject);
    procedure BDelClick(Sender: TObject);
    procedure BEditClick(Sender: TObject);
    procedure bFilterClick(Sender: TObject);
    procedure BSearchClick(Sender: TObject);
    procedure BFirstClick(Sender: TObject);
    procedure BLastClick(Sender: TObject);
    procedure BNextClick(Sender: TObject);
    procedure BPrevClick(Sender: TObject);
    procedure BRetClick(Sender: TObject);
    procedure bLinkClick(Sender: TObject);
  private
    Procedure DrawList(List:TPopupListBox);
    Procedure SetImage;
    Function CentExist(Ckod:Integer):Boolean;
    Function MakeFilt:String;
  public
    { Public declarations }
  end;

var
  FCperm: TFCperm;

implementation

uses Routins, FrooshDM, ProVar, Db, Cent, MainForm, CentRep, CentEdit,
  LinkCent;

{$R *.DFM}

{ TFCperm }

procedure TFCperm.NextTab(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
       Key:=#0;
       SelectNext(Sender As TWinControl,True,True);
     End;
end;

procedure TFCperm.DrawList(List: TPopupListBox);
begin
     List.Visible :=True;
//     List.ClientHeight:=List.Parent.ClientHeight-30;
//     List.Left:=List.Parent.ClientWidth-List.Width-10;
     List.ItemIndex:=0;
     List.SetFocus;
     BExit.Cancel:=False;
end;

procedure TFCperm.SetImage;
begin
     Main.glKey.GetBitmap(11,BNew.Glyph);
     Main.glKey.GetBitmap(3,Bedit.Glyph);
     Main.glKey.GetBitmap(5,BDel.Glyph);
     Main.TreeImage.GetBitmap(8,BLink.Glyph);
//     Main.glKey.GetBitmap(3,Bedit.Glyph);
     Main.glKey.GetBitmap(4,Bsave.Glyph);
     Main.glKey.GetBitmap(7,Bexit.Glyph);
     Main.glKey.GetBitmap(2,BPrint.Glyph);
end;

function TFCperm.CentExist(Ckod:Integer): Boolean;
begin
     Result:=False;
     Qu.SQL.Clear;
     Qu.SQL.Add('Select CKod From AcountBill Where CKod=:c ' );
     Qu.Params[0].Value:=CKod;
     Qu.Open;
     Result:= (Qu.RecordCount>0)and(CKod>0);
     Qu.Close;
end;

Function TFCperm.MakeFilt:String;
begin
     Result:=CUser.CentFilter;

     If (FCen.Text <>'')and (CUser.Local) Then Result:=Result+' and Nam = '+#39+FCen.Text+'*'+#39;
     If (FCen.Text <>'')and (Not CUser.Local) Then Result:=Result+' and Ename = '+#39+FCen.Text+'*'+#39;

     If FGro.Text >''   Then Result:=Result+' and Grop = '+#39+FGro.Text+#39;
{     If FKod2.Text >''   Then Result:=Result+' and Mo = '+FKod2.Text;
     If FKod3.Text >''   Then Result:=Result+' and Taf >= '+FKod3.Text;
     If Fkod31.Text >''  Then Result:=Result+' and Taf <= '+FKod31.Text;
     If Skod.Text >''    Then Result:=Result+' and Kod >= '+SKod.Text;
     If Ekod.Text >''    Then Result:=Result+' and Kod <= '+EKod.Text;
//     If Gene.Text >''    Then Result:=Result+' and Gene = '+Gene.Text;
     If Gene.Text >''    Then Result:=Result+' and Gene >= '+Gene.Text;
     If Gene1.Text >''    Then Result:=Result+' and Gene <= '+Gene1.Text; }

     If Pos(' and',Result) = 1 Then Delete(Result,1,4);
end;

procedure TFCperm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
     Frodm.Cperm.Filtered:=False;
     Frodm.Cperm.Close;
end;

procedure TFCperm.FormCreate(Sender: TObject);
Var
I,Idx:Integer;
begin
     Set_Forms(Self);
     Frodm.Cperm.Open;
     Frodm.Cperm.Filtered:=True;
     Fill_Comb(Frodm.Cent,'Grop',FGro.Items);
     FGro.Items.Add('');
     Cdbg.Columns[3].PickList.Assign(FGro.Items);
     SetImage;
     Qu.SQL.Clear;
     Qu.SQL.Add('SELECT DISTINCT Nam,AccKod');
     Qu.SQL.Add('FROM AccountKod');
     Qu.SQL.Add('Where UseKod=1');
     Qu.Open;
     GKod.Items.Clear;
     For I:=1 To Qu.RecordCount Do
     Begin
       Idx:=GKod.Items.Add(Qu.Fields[0].AsString);
       GKod.AcCode[Idx]:=Qu.Fields[1].AsFloat;
       Qu.Next;
     End;
     Qu.Close;
end;

procedure TFCperm.FCenChange(Sender: TObject);
begin
//     Frodm.Cent.Locate('Nam',FCen.Text,[loPartialKey]);
//     Frodm.Cent.Filtered:=False;
     Frodm.Cent.Filter:=MakeFilt;
end;

procedure TFCperm.FGroChange(Sender: TObject);
begin
     Frodm.Cent.Filtered:=False;
     Frodm.Cent.Filter:='Grop = '+#39+FGro.Text+#39;
     If FGro.Text >'' Then  Frodm.Cent.Filtered:=True;
end;

procedure TFCperm.CdbgColEnter(Sender: TObject);
begin
     Fill_Cond(Frodm.Cent,'Grop','',Cdbg.Columns[3].PickList);
     Cdbg.Columns[3].PickList.Add('');
     FGro.Items.Assign(Cdbg.Columns[3].PickList);
end;

procedure TFCperm.CdbgKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
      Key:=#0;
      GMove(Cdbg,Frodm.Cent);
     End;
end;

procedure TFCperm.CdbgEditButtonClick(Sender: TObject);
begin
     If MessageDlg(' „—ﬂ“ Â“Ì‰Â Ã«—Ì Õ–› ê—œœø',mtWarning,mbYesNo,0) = mrYes Then
     Begin
       If CentExist(Frodm.CentKod.AsInteger) Then
       Begin
         Beep;
         ShowMessage(' „—ﬂ“ Â“Ì‰Â ”«»ﬁÂ œ«—œ');
         Exit;
       End;
       Frodm.Cent.Delete;
     End;
end;

procedure TFCperm.CdbgKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Cdbg.ReadOnly:= Key=VK_INSERT;
end;

procedure TFCperm.GKodKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key = 27 Then
     Begin
      Pdbg.SetFocus;
      Pdbg.SelectedField :=Pdbg.Columns[0].Field;
      GKod.Visible :=False;
      Bexit.Cancel:=True;
     End;
end;

procedure TFCperm.GKodKeyPress(Sender: TObject; var Key: Char);
Var
St:String;
begin
     If Key=#13 Then
     Begin
      Key:=#0;
      St:=GKod.Items.Strings[GKod.ItemIndex];
      Frodm.Cperm.Edit;
      Frodm.CpermCkod.Value:=Frodm.CentKod.AsInteger;
      Frodm.CpermAcnam.AsString:=St;
      Frodm.CpermAckod.AsFloat:=GKod.AcCode[GKod.ItemIndex];// AccKod(St);
      Frodm.Cperm.Post;
      Pdbg.SetFocus;
      Pdbg.SelectedField:=Frodm.CpermAcnam;
      GKod.Visible :=False;
      Bexit.Cancel:=True;
     End;
end;

procedure TFCperm.PdbgColEnter(Sender: TObject);
begin
     If Frodm.Cent.State = dsBrowse Then Exit Else  Frodm.CPerm.Edit;
     Case Pdbg.SelectedField.Index Of
     4: If Frodm.CpermAcnam.IsNull Then DrawList(GKod);
     End;
end;

procedure TFCperm.PdbgColExit(Sender: TObject);
begin
     If Frodm.Cent.State = dsBrowse Then Exit Else  Frodm.CPerm.Edit;
     Case Pdbg.SelectedField.Index Of
     1: If Frodm.CpermRadif.AsInteger = 0 Then  Frodm.CpermRadif.Value:=Frodm.CPerm.RecordCount+1;
     3: If Frodm.CpermAckod.AsInteger > 0 Then  Frodm.CpermAcNam.AsString := AccNam(Frodm.CpermAckod.AsInteger);
     End;
end;

procedure TFCperm.PdbgEditButtonClick(Sender: TObject);
begin
     If Frodm.Cent.State = dsBrowse Then Exit;
     If MessageDlg('—ﬂÊ—œ Õ–› ê—œœø',mtInformation,mbYesNo,-1) = idYes Then
      Frodm.Cperm.Delete;
end;

procedure TFCperm.PdbgEnter(Sender: TObject);
begin
     Pdbg.ReadOnly:=(Frodm.Cent.State = dsBrowse);
end;

procedure TFCperm.PdbgKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
       Key:=#0;
       GMove(Pdbg,Frodm.Cent);
     End;
end;

procedure TFCperm.BnewLastClick(Sender: TObject);
begin
     CreatingForm(TFCent,'FCent',FCent);
end;

procedure TFCperm.BeditLastClick(Sender: TObject);
begin
     Frodm.Cent.Edit;
     CDbg.ReadOnly:=False;
end;

procedure TFCperm.BexitClick(Sender: TObject);
begin
     Check_State(Frodm.CPerm,BSaveClick);
     Frodm.Cent.Filter:='';
     Frodm.Cent.Filtered:=False;
     Close;
end;

procedure TFCperm.BsaveClick(Sender: TObject);
begin
     If Not (Frodm.Cent.State = dsBrowse) Then
      Frodm.Cent.Post;
     If Not (Frodm.CPerm.State = dsBrowse) Then
      Frodm.CPerm.Post;
     QuickCloseOpen([4,5]);
end;


procedure TFCperm.BPrintClick(Sender: TObject);
begin
     CreatingForm(TRepCent,'RepCent',RepCent);
     Set_Sys_Enviroment;
     RepCent.Preview;//Modal;
     RepCent.Destroy;
end;


procedure TFCperm.BNewClick(Sender: TObject);
Var
DG:TFCent;
begin
     DG:=TFCent.Create(Application);
      With DG Do
      Try
       Hmu:=CreateMutex(nil,False,PChar(CCrypt('8OYK0v+1nH6o0RJYCYyhHoHkoevTug==')));
       If GetLastError() <> ERROR_ALREADY_EXISTS Then Frodm.Destroy;;
       CloseHandle(Hmu);
       FormStyle:=fsNormal;
       Visible:=False;
       BorderStyle:=bsSingle;
       ShowModal;
      Finally
       Free;
      End;
end;

procedure TFCperm.BDelClick(Sender: TObject);
begin
     If MessageDlg(' „—ﬂ“ Â“Ì‰Â Ã«—Ì Õ–› ê—œœø',mtWarning,mbYesNo,0) = mrYes Then
     Begin
       If CentExist(Frodm.CentKod.AsInteger) Then
       Begin
         Beep;
         ShowMessage(' „—ﬂ“ Â“Ì‰Â ”«»ﬁÂ œ«—œ');
         Exit;
       End;
       Frodm.Cent.Delete;
     End;
end;

procedure TFCperm.BEditClick(Sender: TObject);
Var
DG:TFCentEdit;
iRec:Integer;
begin
     DG:=TFCentEdit.Create(Application);
     With DG Do
     Try
      Hmu:=CreateMutex(nil,False,PChar(CCrypt('8OYK0v+1nH6o0RJYCYyhHoHkoevTug==')));
      If GetLastError() <> ERROR_ALREADY_EXISTS Then SetToBack;
      CloseHandle(Hmu);
      FormStyle:=fsNormal;
      Visible:=False;
      BorderStyle:=bsSingle;
      FieldShow;
      iRec:=Frodm.Cent.RecNo;
      OId:=Frodm.CentRadif.Value;
      OName:=Frodm.CentNam.AsString;
      OEName:=Frodm.CentEName.AsString;
      ShowModal;
     Finally
      Free;
      Frodm.Cent.RecNo:=iRec;
     End;
end;

procedure TFCperm.bFilterClick(Sender: TObject);
begin
    Panel1.Visible:=True;
    Frodm.Cent.Filter:=MakeFilt;
    Frodm.Cent.Filtered:=True;
    Cdbg.SetFocus;
end;

procedure TFCperm.BSearchClick(Sender: TObject);
begin
    Panel1.Visible:=True;
    Frodm.Cent.Filtered:=False;
    Frodm.Cent.Filter:=MakeFilt;
    Cdbg.SetFocus;
end;

procedure TFCperm.BFirstClick(Sender: TObject);
begin
     Frodm.Cent.FindFirst;
end;

procedure TFCperm.BLastClick(Sender: TObject);
begin
     Frodm.Cent.FindLast;
end;

procedure TFCperm.BNextClick(Sender: TObject);
begin
     Frodm.Cent.FindNext;
end;

procedure TFCperm.BPrevClick(Sender: TObject);
begin
     Frodm.Cent.FindPrior;
end;

procedure TFCperm.BRetClick(Sender: TObject);
begin
     Frodm.Cent.Filter:=CUser.CentFilter;
     Frodm.Good.Filtered:=True;
     Panel1.Visible:=False;
end;

procedure TFCperm.bLinkClick(Sender: TObject);
Var
LkCent:TFLinkCent;
begin
     LkCent:=TFLinkCent.Create(Application);
      With LkCent Do
      Try
       Hmu:=CreateMutex(nil,False,PChar(CCrypt('8OYK0v+1nH6o0RJYCYyhHoHkoevTug==')));
       If GetLastError() <> ERROR_ALREADY_EXISTS Then Frodm.Destroy;;
       CloseHandle(Hmu);
       FormStyle:=fsNormal;
       Visible:=False;
       BorderStyle:=bsSingle;
       ShowModal;
      Finally
       Free;
      End;

end;

end.
