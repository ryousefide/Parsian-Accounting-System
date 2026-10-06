unit AcTree;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ImgList, ToolWin, Menus, Db, DBTables, XPListBox;

type
  TFAcTree = class(TForm)
    tvAckod: TTreeView;
    TB1: TToolBar;
    tbPrint: TToolButton;
    ToolButton1: TToolButton;
    tbAdd: TToolButton;
    tbUpdate: TToolButton;
    StatusBar1: TStatusBar;
    ToolButton2: TToolButton;
    Label1: TStaticText;
    lb: TXPListBox;
    PopupMenu1: TPopupMenu;
    tbKol: TToolButton;
    glKey: TImageList;
    ToolButton3: TToolButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure tvAckodDblClick(Sender: TObject);
    procedure tvAckodEdited(Sender: TObject; Node: TTreeNode;
      var S: String);
    procedure tvAckodDeletion(Sender: TObject; Node: TTreeNode);
    procedure tvAckodKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tvAckodKeyPress(Sender: TObject; var Key: Char);
    procedure tvAckodEditing(Sender: TObject; Node: TTreeNode;
      var AllowEdit: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure tbPrintClick(Sender: TObject);
    procedure tbAddClick(Sender: TObject);
    procedure tbUpdateClick(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure tvAckodChange(Sender: TObject; Node: TTreeNode);
    procedure tvAckodDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure tvAckodDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure tvAckodMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tbKolClick(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
  private
    { Private declarations }
    Root:String;
    RootKod:Real;
    Old_Name:String;
    EditKod :Boolean;
    Function GroKod(AcKod:Real):String;
    Function KolKod(AcKod:Real):String;
    Function MoKod(AcKod:Real):String;
    Procedure MakeRoot;
    Procedure TreeUpDate;
    Procedure AcListPrint;
    Procedure AcKod_Update_Acbill(Nam:String;Code:Real);
    Procedure AcNam_Update_Acbill(OldName,NewName:String);
    Procedure Cheq_Update(OCode,NCode:Real);
    Procedure ChangeName(OName,NewName:Variant);
  public
    { Public declarations }
    procedure SaveToFile(const FileName: string);
    procedure SaveToStream(Stream: TStream);
  end;

var
  FAcTree: TFAcTree;

implementation

uses FrooshDM, ProVar, Routins, AcountReport, Credit, Converts, Accounts,
  MainForm;

{$R *.DFM}
Function TFAcTree.GroKod(AcKod:Real):String;
Var
Ac:Real;
begin
     Ac:=Int(AcKod/1e9);
     Result:=FloatTostr(Ac-Int(Ac/1e3)*1e3);
end;

Function TFAcTree.KolKod(AcKod:Real):String;
Var
Ac:Real;
begin
     Ac:=Int(AcKod/1e6);
     Result:=FloatToStr(Ac-Int(Ac/1e3)*1e3);
end;

Function TFAcTree.MoKod(AcKod:Real):String;
Var
Ac:Real;
begin
     Ac:=Int(AcKod/1e3);
     Result:=FloatToStr(Ac-Int(Ac/1e3)*1e3);
end;

Procedure TFAcTree.MakeRoot;
Var
I:Integer;
begin
     tvAcKod.Items.Clear;
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Nam,Acckod From AccountKod');
     Qu.SQL.Add('Where AccKod>0 and Kgro=0 and KKol=0 and Kmo=0 and Ktaf=0');
     Qu.SQL.Add('Order By AccKod');
     Qu.Open;
     For I:=1 To Qu.RecordCount Do
     Begin
      tvAcKod.Items.Add(Nil,Qu.Fields[0].AsString);
      Qu.Next;
     End;
     Qu.Close;
end;

procedure TFAcTree.SaveToFile(const FileName: string);
var
  Stream: TStream;
begin
  Stream := TFileStream.Create(FileName, fmCreate);
  try
    SaveToStream(Stream);
  finally
    Stream.Free;
  end;
end;

procedure TFAcTree.SaveToStream(Stream: TStream);
const
  TabChar = #9;
  EndOfLine = #13#10;
var
  i: Integer;
  tip:Integer;
  NodeStr: string;
  Kdas,Kgro,Kkol,Kmo,KTaf:Integer;
  AcountKod:Integer;
begin
    Frodm.AcKod.Filtered:=False;
    Frodm.AcKod.IndexFieldNames:='AccKod';
    Frodm.AcKod.First;
    while Not Frodm.AcKod.Eof do
    begin
     Kdas:=Frodm.AcKodKgp.Value;
     Kgro:=Frodm.AcKodKgro.Value;
     Kkol:=Frodm.AcKodKKol.Value;
     Kmo:=Frodm.AcKodKmo.Value;
     KTaf:=Frodm.AcKodKTaf.Value;
     If (Kdas>0)and(Kgro=0)and(Kkol=0)and(Kmo=0)and(Ktaf=0)Then tip:=0;//1e12
     If (Kdas<>0)and(Kgro<>0)and(Kkol=0)and(Kmo=0)and(Ktaf=0)Then tip:=1;
     If (Kdas<>0)and(Kgro<>0)and(Kkol<>0)and(Kmo=0)and(Ktaf=0)Then tip:=2;
     If (Kdas<>0)and(Kgro<>0)and(Kkol<>0)and(Kmo<>0)and(Ktaf=0)Then tip:=3;
     If (Kdas<>0)and(Kgro<>0)and(Kkol<>0)and(Kmo<>0)and(Ktaf<>0)Then tip:=4;
     NodeStr := '';
     for i := 0 to tip-1 do NodeStr := NodeStr + TabChar;
     NodeStr := NodeStr + Frodm.AcKodNam.AsString+'='+ Frodm.AcKodAccKod.AsString + EndOfLine;
     Stream.Write(Pointer(NodeStr)^, Length(NodeStr));
     Frodm.AcKod.Next;
    end;
    Frodm.AcKod.Filtered:=True;
end;

Procedure TFAcTree.TreeUpDate;
begin
     Screen.Cursor:=crHourGlass;
     SaveToFile(RDir+'\'+'AcTree.dat');
     tvAcKod.LoadFromFile(RDir+'\'+'AcTree.dat');
     Screen.Cursor:=crDefault;
end;

Procedure TFAcTree.AcListPrint;
Var
BAc,EAc:String;
begin
     BAc:=FloatTostr(tvAcKod.Selected.AcCode);
     EAc:=FloatToStr(tvAcKod.Selected.getNextSibling.AcCode);
     Frodm.AcKod.IndexFieldNames:='Acckod';
     Frodm.AcKod.Filter:='Acckod >='+BAc+' and Acckod <'+EAc;//Usekod = 1 and
     Frodm.AcKod.Filtered:=True;
     CreatingForm(TAcountRep,'AcountRep',AcountRep);
     Set_Sys_Enviroment;
     AcountRep.qrAcName.Caption:=tvAcKod.Selected.Text;
     AcountRep.Preview;
     AcountRep.Destroy;
     Frodm.AcKod.Filtered:=False;
end;

Procedure TFAcTree.AcKod_Update_Acbill(Nam:String;Code:Real);
Var
I:Integer;
begin
{     Frodm.Bill.Close;
     Frodm.Acbill.MasterSource:=Nil;
     Frodm.Acbill.BeforePost:=Nil;
     Frodm.Acbill.Filter :=' Accnam = '+chr(39)+Nam+chr(39);
     Frodm.Acbill.Filtered:=True;
     Frodm.Acbill.First;
     For I:= 1 To Frodm.Acbill.RecordCount Do
     Begin
       Frodm.Acbill.Edit;
       Frodm.AcbillAcKod.AsFloat:=Code;
       Frodm.Acbill.Post;
       Frodm.Acbill.Next;
     End;
     Frodm.Acbill.Filtered:=False;
     Frodm.Acbill.BeforePost:=Frodm.AcbillBeforePost;
     Frodm.Acbill.MasterSource:=Frodm.BillDs;
     Frodm.Bill.Open;  }
     Frodm.Bill.Close;
     Frodm.Acbill.Close;
     Qu.SQL.Clear;
     Qu.SQL.Add('Update AcountBill  Set Ackod=:c Where Accnam=:n ');
     Qu.Params[0].Value:=Code;
     Qu.Params[1].Value:=Nam;
     Qu.ExecSQL;
     Frodm.Bill.Open;
     Frodm.Acbill.Open;

end;

Procedure TFAcTree.AcNam_Update_Acbill(OldName,NewName:String);
begin
     Frodm.Bill.Close;
     Frodm.Acbill.Close;
     Qu.SQL.Clear;
     Qu.SQL.Add('Update AcountBill  Set Accnam=:c Where Accnam=:n ');
     Qu.Params[0].Value:=NewName;
     Qu.Params[1].Value:=OldName;
     Qu.ExecSQL;
     Frodm.Bill.Open;
     Frodm.Acbill.Open;
end;

Procedure TFAcTree.Cheq_Update(OCode,NCode:Real);
Var
I:Integer;
begin
     Frodm.Rcheq.open;
     Frodm.Rcheq.Filter:='Acckod ='+FloatTostr(OCode);
     Frodm.Rcheq.Filtered:=True;
     Frodm.Rcheq.First;
     For I:=1 To Frodm.Rcheq.RecordCount Do
     Begin
       Frodm.Rcheq.Edit;
       Frodm.RcheqAccKod.Value:=NCode;
       Frodm.Rcheq.Post;
       Frodm.Rcheq.Next;
     End;
     Frodm.Rcheq.Filtered:=False;

     Frodm.Rcheq.Filter:='Pacckod ='+FloatTostr(OCode);
     Frodm.Rcheq.Filtered:=True;
     Frodm.Rcheq.First;
     For I:=1 To Frodm.Rcheq.RecordCount Do
     Begin
       Frodm.Rcheq.Edit;
       Frodm.RcheqPAccKod.Value:=NCode;
       Frodm.Rcheq.Post;
       Frodm.Rcheq.Next;
     End;
     Frodm.Rcheq.Filtered:=False;
     Frodm.Rcheq.Close;

     Frodm.Pcheq.Open;
     Frodm.Pcheq.Filter:='Acckod ='+FloatTostr(OCode);
     Frodm.Pcheq.Filtered:=True;
     Frodm.Pcheq.First;
     For I:=1 To Frodm.Pcheq.RecordCount Do
     Begin
       Frodm.Pcheq.Edit;
       Frodm.PcheqAccKod.Value:=NCode;
       Frodm.Pcheq.Post;
       Frodm.Pcheq.Next;
     End;
     Frodm.Pcheq.Filtered:=False;
     Frodm.Pcheq.Filter:='Pkod ='+FloatTostr(OCode);
     Frodm.Pcheq.Filtered:=True;
     Frodm.Pcheq.First;
     For I:=1 To Frodm.Pcheq.RecordCount Do
     Begin
       Frodm.Pcheq.Edit;
       Frodm.PcheqAccKod.Value:=NCode;
       Frodm.Pcheq.Post;
       Frodm.Pcheq.Next;
     End;
     Frodm.Pcheq.Filtered:=False;
     Frodm.Pcheq.Close;

     Frodm.JariNam.Filter:='AccKod ='+FloatTostr(OCode);
     Frodm.JariNam.Filtered:=True;
     Frodm.JariNam.First;
     For I:=1 To Frodm.JariNam.RecordCount Do
     Begin
       Frodm.JariNam.Edit;
       Frodm.JariNamAccKod.Value:=NCode;
       Frodm.JariNam.Post;
       Frodm.JariNam.Next;
     End;
     Frodm.JariNam.Filtered:=False;

     Frodm.JariNam.Filter:='CheqKod ='+FloatTostr(OCode);
     Frodm.JariNam.Filtered:=True;
     Frodm.JariNam.First;
     For I:=1 To Frodm.JariNam.RecordCount Do
     Begin
       Frodm.JariNam.Edit;
       Frodm.JariNamCheqKod.Value:=NCode;
       Frodm.JariNam.Post;
       Frodm.JariNam.Next;
     End;
     Frodm.JariNam.Filtered:=False;

     Frodm.AutoBill.Filter:='BesKod='+FloatTostr(OCode);
     Frodm.AutoBill.Filtered:=True;
     Frodm.AutoBill.First;
     For I:=1 To Frodm.AutoBill.RecordCount Do
     Begin
       Frodm.AutoBill.Edit;
       Frodm.AutoBillbesKod.Value:=NCode;
       Frodm.AutoBill.Post;
       Frodm.AutoBill.Next;
     End;
     Frodm.AutoBill.Filtered:=False;

     Frodm.AutoBill.Filter:='BehKod='+FloatTostr(OCode);
     Frodm.AutoBill.Filtered:=True;
     Frodm.AutoBill.First;
     For I:=1 To Frodm.AutoBill.RecordCount Do
     Begin
       Frodm.AutoBill.Edit;
       Frodm.AutoBillbehKod.Value:=NCode;
       Frodm.AutoBill.Post;
       Frodm.AutoBill.Next;
     End;
     Frodm.AutoBill.Filtered:=False;
end;

Procedure TFAcTree.ChangeName(OName,NewName:Variant);
Var
I:Integer;
Begin
     //ChangeFieldValue(Frodm.Ackod,'Nam',OName,NewName);

     Frodm.AcKod.IndexFieldNames:='Nam';
     IF Frodm.AcKod.Locate('Nam',OName,[loCaseInsensitive]) Then
     Begin
      Frodm.AcKod.Edit;
      Frodm.AcKodNam.Value:=NewName;
      Frodm.AcKod.Post;
     End Else
      Exit;

//     Frodm.Bill.Close;
//     Frodm.Acbill.Close;
//     ChangeFieldValue(Frodm.Acbill,'Accnam',OName,NewName);

     ChangeFieldValue(Frodm.RMon,'Accnam',OName,NewName);
     ChangeFieldValue(Frodm.PMon,'Accnam',OName,NewName);
     ChangeFieldValue(Frodm.BHav,'Accnam',OName,NewName);
     ChangeFieldValue(Frodm.NFish,'Accnam',OName,NewName);

     ChangeFieldValue(Frodm.Binvo,'Nam',OName,NewName);
     ChangeFieldValue(Frodm.Invo,'Nam',OName,NewName);
     ChangeFieldValue(Frodm.RejBinvo,'Nam',OName,NewName);
     ChangeFieldValue(Frodm.RejInvo,'Nam',OName,NewName);

     ChangeFieldValue(Frodm.Hav,'Nam',OName,NewName);
     ChangeFieldValue(Frodm.Res,'Nam',OName,NewName);
     ChangeFieldValue(Frodm.IRej,'Nam',OName,NewName);
     ChangeFieldValue(Frodm.ORej,'Nam',OName,NewName);
     ChangeFieldValue(Frodm.Dout,'Nam',OName,NewName);

     ChangeFieldValue(Frodm.Acpay,'Bednam',OName,NewName);
     ChangeFieldValue(Frodm.Acpay,'Besnam',OName,NewName);
     ChangeFieldValue(Frodm.Exch,'Acnam',OName,NewName);
     ChangeFieldValue(Frodm.Cperm,'Acnam',OName,NewName);
     ChangeFieldValue(Frodm.Exp,'Accnam',OName,NewName);
     ChangeFieldValue(Frodm.ExpD,'Acnam',OName,NewName);

     ChangeFieldValue(Frodm.Pcheq,'Acnam',OName,NewName);
     ChangeFieldValue(Frodm.RCheq,'Acnam',OName,NewName);
     ChangeFieldValue(Frodm.Rcheq,'Pacnam',OName,NewName);

     ChangeFieldValue(Frodm.RM,'Acnam',OName,NewName);
     ChangeFieldValue(Frodm.RMin,'Acnam',OName,NewName);
     ChangeFieldValue(Frodm.RMOut,'Acnam',OName,NewName);

     ChangeFieldValue(Frodm.RPay,'Acnam',OName,NewName);
     ChangeFieldValue(Frodm.RRes,'Acnam',OName,NewName);
     ChangeFieldValue(Frodm.UAC,'Acname',OName,NewName);

     AcNam_Update_Acbill(OName,NewName);

     For I:=0 To Length(mTable)-1 Do (Frodm.Components[mTable[I]] As TTable).Open;
End;

//End Of Privates

procedure TFAcTree.FormClose(Sender: TObject; var Action: TCloseAction);
Var
I:Integer;
Label
1;
begin
1:
     For I:=0 To tvAcKod.Items.Count-1 Do
      If tvAcKod.Items[I].Text = 'Õ”«» ÃœÌœ' Then
      Begin
        tvAcKod.Items[I].Delete;
        Goto 1;
      End;
     tvAcKod.Refresh;
     SaveToFile(RDir+'\'+'AcTree.dat');
     Action:=caFree;
end;

procedure TFAcTree.FormCreate(Sender: TObject);
Var
I:Integer;
begin
     Set_Forms(Self);
     PopUpMenu:=Nil;
     Frodm.AcKod.Refresh;
     tvAcKod.Font :=Self.Font;
     If FileExists(RDir+'\'+'AcTree.dat')Then  tvAcKod.LoadFromFile(RDir+'\'+'AcTree.dat');
     If tvAcKod.Items.Count <> Frodm.AcKod.RecordCount Then
     Begin
      MakeRoot;
      TreeUpDate;
     End;
{Update Image }
     tvAcKod.Images:=Main.TreeImage;
     tvAcKod.StateImages:=Main.TreeImage;
     For I:=0 To tvAcKod.Items.Count-1 Do
     Begin
      IF tvAcKod.Items[i].Count > 0 Then
       tvAcKod.Items[i].ImageIndex :=1
      Else
       tvAcKod.Items[i].ImageIndex :=2;//-1
      tvAcKod.Items[i].StateIndex:=tvAcKod.Items[i].Level+3;
     End;
end;

procedure TFAcTree.FormKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #27 Then
     Begin
      Key:=#0;
      Close;
     End;
     If Key = #13 Then
     Begin
      Key:=#0;
      If FormStyle = fsNormal Then ModalResult:=mrOk;
     End;
end;

procedure TFAcTree.tvAckodDblClick(Sender: TObject);
begin
     IF tvAcKod.Selected.Count  > 998 Then
     Begin
      ShowMessage ('›÷«Ì Œ«·Ì »—«Ì  ⁄—Ì› Õ”«» ‰„Ì »«‘œ');
      Exit;
     End;
     If tvAcKod.Selected.Level > 3 Then Exit;
     Frodm.AcKod.IndexFieldNames :='Acckod';
     Frodm.AcKod.Filtered :=False;
     If Frodm.AcKod.FindKey([tvAcKod.Selected.AcCode]) Then
      If Frodm.AcKodUseKod.Value = 0 Then
      Begin
       Root:=tvAcKod.Selected.Text;
       RootKod:=tvAcKod.Selected.AcCode;
       tvAckod.Items.AddChild(tvAcKod.Selected,'Õ”«» ÃœÌœ');
       tvAcKod.Selected.Expand(False);
       tvAcKod.ReadOnly :=False;
       tvAcKod.Selected.GetLastChild.EditText;
     End;
end;

procedure TFAcTree.tvAckodEdited(Sender: TObject; Node: TTreeNode;
  var S: String);
Var
Id,I:Integer;
begin
     s:=Trim(s);
     If S = '' Then Exit;

     IF IsAcNameExist(S,RootKod) Then   // NamFound(S)
     Begin
      ShowMessage('‰«„ Õ”«»  ﬂ—«—Ì «” ');
      Case EditKod Of
       True : S:=Old_Name;
       False: S:='';
      End;
      tvAckod.ReadOnly:=True;
      Exit;
     End;

     If EditKod Then
     Begin
      //Update Routine
      ChangeName(Old_Name,S);
      tvAcKod.Selected.Text:=S;
      EditKod:=False;
      Old_Name:='';
      tvAckod.ReadOnly:=True;
      Exit;
     End;

     If Node.Level < 4 Then
     Begin
      New_Account_Root(S,Root,Rootkod,0);
      Id:=mrYes;
     End Else
      Id:=mrNo;

{     If Node.Level < 3 Then
     Begin
       Id:=MessageDlg('Õ”«» ”— ›’· «” ø',mtInformation,mbYesNo,0);
       Case Id Of
       mrYes: New_Account_Root(S,Root,0);
       mrNo : New_Account_Root(S,Root,1);
       End;
     End Else
       New_Account_Root(S,Root,1);}


     Node.Text:=S;
     tvAckod.ReadOnly:=True;
     tvAcKod.Selected:=Node;
     tvAcKod.Selected:=Node.Parent;
     If Id = mrYes Then
     Begin
      CreatingForm(TFAcount,'FAcount',FAcount);
      With FAcount Do
      begin
       cbRoot.ItemIndex:=cbRoot.Items.IndexOf(S); //tvAcKod.Selected.Text
       If  cbRoot.AcCode[cbRoot.ItemIndex] <> tvAcKod.Selected.AcCode Then
        For I:=0 to cbRoot.Items.Count-1 Do
         If cbRoot.AcCode[I]=tvAcKod.Selected.AcCode then cbRoot.ItemIndex:=I;
       cbRootChange(owner);
      end;
     End;
end;

procedure TFAcTree.tvAckodDeletion(Sender: TObject; Node: TTreeNode);
Var
Str:String;
Kod:Real;
begin
     If Not KodFound(tvAcKod.Selected.AcCode) Then
     Begin
       tvAcKod.Selected.Delete;
       Exit;
     End;
     Str:='Õ”«»'+' '+tvAcKod.Selected.Text+' »« òœ Õ”«»œ«—Ì '+ FloatToStr(tvAckod.Selected.AcCode)+' Õ–› ê—œœø';
     Kod:=tvAcKod.Selected.AcCode;  // AccKod(tvAcKod.Selected.Text);
     If MessageDlg(Str,mtWarning,mbYesNo,0) = idYes Then
     Begin
       If (CheckBill(Kod)) or (IsConstAc(Kod)) Then
       Begin
         Beep;
         ShowMessage('Õ”«» ”«»ﬁÂ œ«—œ .ﬁ«»· Õ–› ‰„Ì »«‘œ');
         Exit;
       End;
       If Ac_Delete_Check(Kod,Frodm.AcKodUseKod.Value) Then
        FroDM.AcKod.Delete 
       Else Begin
        Beep;
        ShowMessage('Õ”«» “Ì— „Ã„Ê⁄Â œ«—œ .ﬁ«»· Õ–› ‰„Ì »«‘œ');
        Exit;
       End;
       tvAcKod.Selected.Delete;
     End;
end;

procedure TFAcTree.tvAckodKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key Of
      VK_INSERT : If MessageDlg('¬Ì« Õ”«» “Ì— „Ã„Ê⁄Â œ«—œø',mtConfirmation,mbYesNO,-1)=mrYes Then
                    tvAckodDblClick(Sender)
                  Else
                    ToolButton3Click(Sender);
      80,112    :  If Shift = [ssAlt] Then AcListPrint;//
      VK_DELETE: If Shift = [ssCtrl] Then tvAckodDeletion(Sender,tvAcKod.Selected);
     End;
end;

procedure TFAcTree.tvAckodKeyPress(Sender: TObject; var Key: Char);
begin
     IF Key In [#13,#27] Then tvAcKod.ReadOnly :=True;
end;

procedure TFAcTree.tvAckodEditing(Sender: TObject; Node: TTreeNode;
  var AllowEdit: Boolean);
begin
     AllowEdit:=Not EditKod;
end;

procedure TFAcTree.FormDestroy(Sender: TObject);
begin
     Frodm.AcKod.Refresh;
     If cUser.Master Then  Fill_Cond(Frodm.AcKod,'Nam',CCond,AcList);
     QuickCloseOpen([26]);
end;

procedure TFAcTree.tbPrintClick(Sender: TObject);
begin
     AcListPrint;
end;

procedure TFAcTree.tbAddClick(Sender: TObject);
begin
     If tvAcKod.Selected = Nil Then Exit;
     Frodm.AcKod.Refresh;
     CreatingForm(TFCredit,'FCredit',FCredit);
     FCredit.FNam.Text:=tvAcKod.Selected.Text;
     FCredit.FNamChange(Sender);
end;

procedure TFAcTree.tbUpdateClick(Sender: TObject);
Var
I:Integer;
begin
     MakeRoot;
     TreeUpDate;
{Update Image }
     For I:=0 To tvAcKod.Items.Count-1 Do
     Begin
      IF tvAcKod.Items[i].Count > 0 Then
       tvAcKod.Items[i].ImageIndex :=1
      Else
       tvAcKod.Items[i].ImageIndex :=2;//-1
      tvAcKod.Items[i].StateIndex:=tvAcKod.Items[i].Level+3;
     End;
     tvAcKod.Selected
end;

procedure TFAcTree.ToolButton2Click(Sender: TObject);
Var
I:Integer;
begin
     lb.Items.Clear;
     For I:=0 To tvAcKod.Selected.Count-1 Do
       IF tvAckod.Selected.Item[I].HasChildren Then
        tvAckod.Selected.Item[I].ImageIndex:=1 Else
       Begin
        tvAckod.Selected.Item[I].ImageIndex:=2;
        lb.Items.Add(tvAcKod.Selected.Item[i].Text);
       End;
     lb.Visible:=Not lb.Visible;
end;

procedure TFAcTree.tvAckodChange(Sender: TObject; Node: TTreeNode);
Var
I:Integer;
begin
     tvAcKod.Hint:=IntToStr(tvAcKod.Selected.Count)+#13+' ﬂœ Õ”«»œ«—Ì ';
     Label1.Caption:=AccString(AccKod(tvAcKod.Selected.Text));
     lb.Visible:=False;
     ToolButton2.Down:=False;
end;

procedure TFAcTree.tvAckodDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
Var
Ac1,Ac2:Boolean;
AcN:String;
begin
     Accept:=False;
     If Source Is TListBox Then
     With (Source As TListBox ) Do AcN:=Items.Strings[itemindex]
     Else
      AcN:=tvAcKod.Selected.Text;
     IF NamFound(AcN) Then
     Begin
      Ac1 :=Frodm.AcKodUseKod.Value =1 ;
      Ac2:=Not Frodm.AckodPerm.Value;
      Accept:=(Ac1 = True)and(Ac1=Ac2);
     End;
end;

procedure TFAcTree.tvAckodDragDrop(Sender, Source: TObject; X, Y: Integer);
Var
St,En:string;
OCode,NCode,EnCode:Real;
begin
//Check is Destination Available
     En:=tvAcKod.DropTarget.Text;
     EnCode:=tvAcKod.DropTarget.AcCode;
     Frodm.AcKod.IndexFieldNames :='Acckod';
     If Frodm.AcKod.FindKey([EnCode]) Then
      If Frodm.AcKodUseKod.Value=1 Then Exit;
//Check is Destination Available

     If Source Is TListBox Then
     Begin
      tvAcKod.Selected.Item[lb.itemindex].Delete;
      St:= lb.Items.Strings[lb.itemindex];
      OCode:=lb.AcCode[lb.itemindex];
     End Else
     Begin
      St:=tvAcKod.Selected.Text;
      OCode:=tvAcKod.Selected.AcCode;
      tvAcKod.Selected.Delete;
     End;

     KodFound(OCode);
     Frodm.AcKod.Delete;
     SCreen.Cursor:=crHourGlass;
     NCode:=New_Account_Root(St,En,EnCode,1);
     tvAckod.Items.AddChild(tvAcKod.DropTarget,St);

     AcKod_Update_Acbill(St,NCode);
     Cheq_Update(OCode,NCode);
     QuickCloseOpen([26,7,6,8,10]);
     SCreen.Cursor:=crDefault;
     tvAckodChange(Sender,tvAcKod.Selected);
end;

procedure TFAcTree.tvAckodMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
     If Button = mbRight Then
     Begin
      Old_Name:=tvAcKod.Selected.Text;
      tvAcKod.ReadOnly :=False;
      EditKod:=False;
      tvAcKod.Selected.EditText;
      EditKod:=True;
     End;
end;

procedure TFAcTree.tbKolClick(Sender: TObject);
begin
     IF MakeKol(InPutBox('„⁄—›Ì ê—ÊÂ ','‰«„ ê—ÊÂ ÃœÌœ','')) Then
      tbUpdateClick(Sender);
end;

procedure TFAcTree.ToolButton3Click(Sender: TObject);
Var
i:Integer;
begin
      KodFound(tvAcKod.Selected.AcCode);
      If Frodm.AcKodUseKod.Value = 1 Then Exit;
      CreatingForm(TFAcount,'FAcount',FAcount);
      With FAcount Do
      begin
       cbRoot.ItemIndex:=cbRoot.Items.IndexOf(tvAcKod.Selected.Text);
       If  cbRoot.AcCode[cbRoot.ItemIndex] <> tvAcKod.Selected.AcCode Then
        For I:=0 to cbRoot.Items.Count-1 Do
         If cbRoot.AcCode[i]=tvAcKod.Selected.AcCode then cbRoot.ItemIndex:=I;
       cbRootChange(owner);
      end;
end;

end.

