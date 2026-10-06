unit Users;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, CheckLst, Menus, ExtCtrls, MPlayer, DbTables, Grids,
  DBGrids, ComCtrls, XPListBox, XPCheckListBox;

type
  TFUsers = class(TForm)
    Bsave: TButton;
    Bexit: TButton;
    Bdel: TButton;
    Bevel2: TBevel;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Nam: TEdit;
    Pass1: TEdit;
    Pass2: TEdit;
    User: TComboBox;
    DBCheckBox1: TDBCheckBox;
    PgC1: TPageControl;
    TS1: TTabSheet;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Splitter3: TSplitter;
    Splitter4: TSplitter;
    CB1: TCheckListBox;
    cb2: TCheckListBox;
    cb3: TCheckListBox;
    cb4: TCheckListBox;
    cb5: TCheckListBox;
    TS2: TTabSheet;
    tvAckod: TTreeView;
    Splitter5: TSplitter;
    Bevel1: TBevel;
    Bevel3: TBevel;
    cbAll: TCheckBox;
    ListAc: TXPListBox;
    Label4: TLabel;
    cbLan: TDBComboBox;
    TS3: TTabSheet;
    lCashier: TXPCheckListBox;
    lCGroup: TXPCheckListBox;
    Label5: TLabel;
    Label6: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure CB1Click(Sender: TObject);
    procedure cb2Click(Sender: TObject);
    procedure cb4Click(Sender: TObject);
    procedure NamExit(Sender: TObject);
    procedure BexitClick(Sender: TObject);
    procedure BsaveClick(Sender: TObject);
    procedure Pass2Change(Sender: TObject);
    procedure Pass1Exit(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure UserEnter(Sender: TObject);
    procedure BdelClick(Sender: TObject);
    procedure NextTab(Sender: TObject; var Key: Char);
    procedure cb3Click(Sender: TObject);
    procedure cbAllClick(Sender: TObject);
    procedure cb5Click(Sender: TObject);
    procedure tvAckodKeyPress(Sender: TObject; var Key: Char);
    procedure ListAcDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    Names:Array[0..254] of String;
    Pass:String;
    CentFlt:String;
    CashFlt:String;
    Procedure SaveAccounts;
    Procedure DeleteAccounts;
    Procedure SetCentCode;
    Procedure ReadCentCode;
    Function MaxUserId:Integer;

  public
    { Public declarations }
  end;

var
  FUsers: TFUsers;

implementation

uses MainForm,FrooshDM,Db, Routins, ProVar, UserLog;

{$R *.DFM}
Procedure TFUsers.SaveAccounts;
Var
I:Integer;
begin
     //If ListAc.Items.Count=0 Then Exit;
     Frodm.UAC.Filter:='Userid='+Frodm.Users.Fields[8].AsString;
     Frodm.UAC.Filtered:=True;
     For I:=1 To Frodm.UAC.Recordcount Do Frodm.UAC.Delete;

     For I:=0 To ListAc.Items.Count-1 Do
     Begin
      Frodm.UAC.Append;
      Frodm.UACUserid.Value:=Frodm.Users.Fields[8].Value;
      Frodm.UACUsern.Value:=Frodm.Users.Fields[1].AsString;
      Frodm.UACAcname.Value:=ListAc.Items.Strings[I];
      Frodm.UACAcckod.Value:=ListAc.AcCode[I];
      Frodm.UAC.Post;
     end;
     ListAc.Clear;
end;

Procedure TFUsers.DeleteAccounts;
Var
I:Integer;
begin
     Frodm.UAC.Filter:='Userid='+Frodm.Users.Fields[8].AsString;
     Frodm.UAC.Filtered:=True;
     For I:=1 To Frodm.UAC.Recordcount Do Frodm.UAC.Delete;
end;

Procedure TFUsers.SetCentCode;
Var
I:Integer;
begin
     CentFlt:='';CashFlt:='';
     For I:=0 to lCashier.Items.Count-1 Do
     If lCashier.Checked[I] Then CashFlt:=CashFlt+FloatToStr(lCashier.AcCode[I])+';';
     For I:=0 to lCGroup.Items.Count-1 Do
     If lCGroup.Checked[I] Then CentFlt:=CentFlt+lCGroup.Items[I]+';';
     Frodm.Users.Fields[6].AsString:=CentFlt;
     Frodm.Users.Fields[7].AsString:=CashFlt;
     For I:=0 to lCashier.Items.Count-1 Do lCashier.Checked[I]:=False;
     For I:=0 to lCGroup.Items.Count-1 Do lCGroup.Checked[I]:=False;
end;

Procedure TFUsers.ReadCentCode;
Var
I:Integer;
CCode:Real;
sGroup:String;
begin
     CentFlt:=Frodm.Users.Fields[6].AsString;
     CashFlt:=Frodm.Users.Fields[7].AsString;
     For I:=0 to lCashier.Items.Count-1 Do lCashier.Checked[I]:=False;
     For I:=0 to lCGroup.Items.Count-1 Do lCGroup.Checked[I]:=False;
     If CashFlt <>'' Then
      Repeat
       CCode:=StrToFloat(Decode(CashFlt));
       For I:=0 to lCashier.Items.Count-1 Do
       If lCashier.AcCode[I]=CCode Then lCashier.Checked[I]:=True;
      Until CashFlt='';

     Repeat
      sGroup:=Decode(CentFlt);
      For I:=0 to lCGroup.Items.Count-1 Do
      If lCGroup.Items[I]=sGroup Then lCGroup.Checked[I]:=True;
     Until CentFlt='';
end;

Function TFUsers.MaxUserId:Integer;
begin
     Qu.Close;
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Max(Idd) From Users ');
     Qu.Open;
     Result:=Qu.Fields[0].AsInteger;
     Qu.Close;
end;

procedure TFUsers.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
     Frodm.Users.Close;
     Frodm.UAC.Close;
end;

procedure TFUsers.FormCreate(Sender: TObject);
var
I,Imax,J,Jmax,K:Integer;
L,Lmax,M,Mmax:Integer;
N,Nmax:Integer;
Str1,Str2,Str3,str4,Str5:String;
begin
     Set_Forms(Self);
     Frodm.Users.Open;
     Frodm.UAC.Open;
     Fill(Frodm.Users,'UserN',User.Items);
     Fill_XPCheckLists(Frodm.Cashier,'Name','Id','',lCashier);
     Fill_Comb(Frodm.Cent,'Grop',lCGroup.Items);
     If CUser.Boss Then
     Begin
       Pass1.PasswordChar :=#0;
       Pass2.PasswordChar :=#0;
     End;
     For I:=0 To 254 Do Enabl[I]:=False;
     Imax:=Main.MMenu.Items.Count-2;
     K:=0;
     For I:=0 To Imax  Do
     Begin
        Str1:=Main.MMenu.Items[i].Caption;
        cb1.Items.Append(Str1);
        Names[K]:=Str1;
        K:=K+1;
        Jmax:=Main.MMenu.Items[I].Count-1;
        For J:=0 to Jmax do
        Begin
          Str2:=Str1+' '+Main.MMenu.Items[i].Items[J].Caption;
          Names[K]:=Str2;
          K:=K+1;
          Lmax:=Main.MMenu.Items[i].Items[J].Count-1;
          For L:=0 To Lmax Do
          Begin
            Str3:=Str2+' '+Main.MMenu.Items[i].Items[J].Items[L].Caption;
            Names[K]:=Str3;
            K:=K+1;
            Mmax:=Main.MMenu.Items[i].Items[J].Items[L].Count-1;
            For M:=0 To Mmax Do
            Begin
              Str4:=Str3+' '+Main.MMenu.Items[i].Items[J].Items[L].Items[M].Caption;
              Names[K]:=Str4;
              K:=K+1;
              Nmax:=Main.MMenu.Items[i].Items[J].Items[L].Items[M].Count-1;
              For N:=0 To Nmax Do
              Begin
                Str5:=Str4+' '+Main.MMenu.Items[i].Items[J].Items[L].Items[M].Items[N].Caption;
                Names[K]:=Str5;
                K:=K+1;
              End;
            End;
          End;
        End;
     End;
     If FileExists(Rdir+'\'+'AcTree.dat')Then
      tvAcKod.LoadFromFile(Rdir+'\'+'AcTree.dat');
{Update Image}
     tvAcKod.Images:=Main.TreeImage;
     tvAcKod.StateImages:=Main.TreeImage;
     For I:=0 To tvAcKod.Items.Count-1 Do
     Begin
      IF tvAcKod.Items[i].Count > 0 Then
       tvAcKod.Items[i].ImageIndex :=1
      Else
       tvAcKod.Items[i].ImageIndex :=2;
      tvAcKod.Items[i].StateIndex:=tvAcKod.Items[i].Level+3;
     End;

end;

procedure TFUsers.CB1Click(Sender: TObject);
Var
Str,St:String;
I,Imax,J:Integer;
begin
      Cb2.Items.Clear;
      Cb3.Items.Clear;
      Cb4.Items.Clear;
      Cb5.Items.Clear;
      Imax:=Main.MMenu.Items[Cb1.ItemIndex].Count-1;
      St:=Cb1.Items.Strings[Cb1.ItemIndex];
      For I:=0 To 254 Do
        If Names[I] = St  Then Enabl[I]:=cb1.Checked[Cb1.ItemIndex];
      For I:=0 To Imax Do
      Begin
        Str:=Main.MMenu.Items[Cb1.ItemIndex].Items[I].Caption;
        If Cb1.Checked[Cb1.ItemIndex] = True Then Cb2.Items.Append(Str);
        For J:=0 To 254 Do
          If Names[J] = St+' '+Str Then If Cb1.Checked[Cb1.ItemIndex] = True Then
            Cb2.Checked[I]:=Enabl[J];
      End;


end;

procedure TFUsers.cb2Click(Sender: TObject);
Var
Str,St:String;
I,Imax,J:Integer;
begin
      Cb3.Items.Clear;
      Cb4.Items.Clear;
      Cb5.Items.Clear;
      Imax:=Main.MMenu.Items[Cb1.ItemIndex].Items[Cb2.ItemIndex].Count-1;
      St:=Cb1.Items.Strings[Cb1.ItemIndex]+' '+Cb2.Items.Strings[Cb2.ItemIndex];
      For I:=0 To 254 Do
        If Names[I] = St  Then Enabl[I]:=cb2.Checked[Cb2.ItemIndex];

      For I:=0 To Imax Do
      Begin
        Str:=Main.MMenu.Items[Cb1.ItemIndex].Items[Cb2.ItemIndex].Items[I].Caption;
        If Cb2.Checked[Cb2.ItemIndex] = True Then Cb3.Items.Append(Str);
        For J:=0 To 254 Do
          If Names[J] = St+' '+Str Then If Cb2.Checked[Cb2.ItemIndex] = True Then
            Cb3.Checked[I]:=Enabl[J];
      End;
end;

procedure TFUsers.cb3Click(Sender: TObject);
Var
Str,St:String;
I,Imax,J:Integer;
begin
      Cb4.Items.Clear;
      Cb5.Items.Clear;
      Imax:=Main.MMenu.Items[Cb1.ItemIndex].Items[Cb2.ItemIndex].Items[Cb3.ItemIndex].Count-1;
      St:=Cb1.Items.Strings[Cb1.ItemIndex]+' '+Cb2.Items.Strings[Cb2.ItemIndex]
          +' '+Cb3.Items.Strings[Cb3.ItemIndex];
      For I:=0 To 254 Do
        If Names[I] = St  Then Enabl[I]:=cb3.Checked[Cb3.ItemIndex];

      For I:=0 To Imax Do
      Begin
        Str:=Main.MMenu.Items[Cb1.ItemIndex].Items[Cb2.ItemIndex].Items[Cb3.ItemIndex].Items[I].Caption;
        If Cb3.Checked[Cb3.ItemIndex] Then Cb4.Items.Append(Str);
        For J:=0 To 254 Do
          If Names[J] = St+' '+Str Then If Cb3.Checked[Cb3.ItemIndex] = True Then
            Cb4.Checked[I]:=Enabl[J];
      End;
end;

procedure TFUsers.cb4Click(Sender: TObject);
Var
Str,St:String;
I,Imax,J:Integer;
begin
      Cb5.Items.Clear;
      Imax:=Main.MMenu.Items[Cb1.ItemIndex].Items[Cb2.ItemIndex].Items[Cb3.ItemIndex].Items[Cb4.ItemIndex].Count-1;
      St:=Cb1.Items.Strings[Cb1.ItemIndex]+' '+Cb2.Items.Strings[Cb2.ItemIndex]
          +' '+Cb3.Items.Strings[Cb3.ItemIndex]+' '+Cb4.Items.Strings[Cb4.ItemIndex];
      For I:=0 To 254 Do
        If Names[I] = St  Then Enabl[I]:=cb4.Checked[Cb4.ItemIndex];

      For I:=0 To Imax Do
      Begin
        Str:=Main.MMenu.Items[Cb1.ItemIndex].Items[Cb2.ItemIndex].Items[Cb3.ItemIndex].Items[Cb4.ItemIndex].Items[I].Caption;
        If Cb4.Checked[Cb4.ItemIndex] Then Cb5.Items.Append(Str);
        For J:=0 To 254 Do
          If Names[J] = St+' '+Str Then If Cb4.Checked[Cb4.ItemIndex] = True Then
            Cb5.Checked[I]:=Enabl[J];
      End;
end;

procedure TFUsers.cb5Click(Sender: TObject);
Var
I:Integer;
Str:String;
begin
      Str:=Cb1.Items.Strings[Cb1.ItemIndex]+' '+Cb2.Items.Strings[Cb2.ItemIndex]+
      ' '+Cb3.Items.Strings[Cb3.ItemIndex]+' '+Cb4.Items.Strings[Cb4.ItemIndex]+
      ' '+Cb5.Items.Strings[Cb5.ItemIndex];
      For I:=0 To 254 Do
        If Names[I] = Str  Then  Enabl[I]:=cb5.Checked[Cb5.ItemIndex];
end;

procedure TFUsers.NamExit(Sender: TObject);
Var
I,J:Integer;
Str,Pss:String;
begin
     If User.Text='' Then Exit;
     If Frodm.Users.Locate('UserN',User.Text,[loCaseInsensitive])Then
     Begin
      Pss:=FroDM.Users.Fields[4].AsString;
      For I:=0 To 254 Do Enabl[I]:=Pss[I+1]='1';
      Pass:=Frodm.Users.Fields[2].AsString;
      Frodm.UAC.Filter:='Userid='+Frodm.Users.Fields[8].AsString;
      Frodm.UAC.Filtered:=True;
      If (Boss) Then
      Begin
       Frodm.Users.Edit;
       Pass1.Text :=Pass;
       Pass2.Text :=Pass;
       Fill_XPLists(Frodm.UAC,'Acname','Acckod','Userid='+Frodm.Users.Fields[8].AsString,ListAc);
       ReadCentCode;
       Bsave.Enabled :=True;
       BDel.Enabled :=True;
      End;
     End Else If (Boss) Then
     Begin
      Cb1.Enabled :=True;
      Cb2.Enabled :=True;
      Cb3.Enabled :=True;
      Cb4.Enabled :=True;
      Cb5.Enabled :=True;
      TS2.Enabled:=True;
      TS3.Enabled:=True;
      Bsave.Enabled :=True;
      BDel.Enabled :=True;
      Frodm.Users.Append;
      For I:=0 To Cb1.Items.Count-1 Do
      Begin
       Str:=Cb1.Items.Strings[I];
       For J:=0 To 254 Do
        If Names[J] = Str Then Cb1.Checked[I]:=Enabl[J];
      End;
      Frodm.UAC.Filter:='Usern='+#39+Frodm.Users.Fields[1].AsString+#39;
      Frodm.UAC.Filtered:=True;
     End;
end;

procedure TFUsers.BexitClick(Sender: TObject);
begin
     Check_State(Frodm.Users,BsaveClick);
     Fusers.Close;
end;

procedure TFUsers.BsaveClick(Sender: TObject);
Var
I:Integer;
Pss:String;
begin
     Frodm.Users.Fields[1].AsString :=User.Text;
     Frodm.Users.Fields[2].AsString :=Pass2.Text;
     For I:=0 To 254 Do Pss:=Pss+IntToStr(Ord(Enabl[I]));
     Frodm.Users.Fields[4].Value:=Pss;
     IF Frodm.Users.Fields[8].IsNull Then Frodm.Users.Fields[8].Value:=MaxUserId+1;
     SetCentCode;
     Frodm.Users.Post;
     SaveAccounts;
     QuickCloseOpen([16,70]);
     For I:=0 to 254 Do Enabl[I]:=False;
     Cb2.Items.Clear;
     Cb3.Items.Clear;
     Cb4.Items.Clear;
     Cb5.Items.Clear;
     Bsave.Enabled :=False;
     BDel.Enabled :=False;
     Nam.Clear;
     Pass1.Clear;
     Pass2.Clear;
     Cb1.Enabled :=False;
     Cb2.Enabled :=False;
     Cb3.Enabled :=False;
     Cb4.Enabled :=False;
     Cb5.Enabled :=False;
     TS2.Enabled:=False;
     TS3.Enabled:=False;
     Fill(Frodm.Users,'UserN',User.Items);
end;

procedure TFUsers.BdelClick(Sender: TObject);
begin
      DeleteAccounts;
      Frodm.Users.Delete;
      BDel.Enabled :=False;
      Bsave.Enabled :=False;
      Fill(Frodm.Users,'UserN',User.Items);
end;

procedure TFUsers.Pass2Change(Sender: TObject);
Var
I,m:Integer;
Str:String;
begin
     If Pass1.Text = Pass2.Text Then If Pass = Pass2.Text Then
     Begin
       Cb1.Enabled :=True;
       Cb2.Enabled :=True;
       Cb3.Enabled :=True;
       Cb4.Enabled :=True;
       Cb5.Enabled :=True;
       TS2.Enabled:=True;
       TS3.Enabled:=True;
//----------------------------------
       For I:=0 To Cb1.Items.Count-1 Do
       Begin
         Str:=Cb1.Items.Strings[I];
         For m:=0 To 254 Do If Names[m] = Str  Then cb1.Checked[I]:=Enabl[m];
       End;
//----------------------------------
     End;
end;

procedure TFUsers.Pass1Exit(Sender: TObject);
begin
     If Frodm.Users.State = dsInsert Then Pass:=Pass1.Text;
end;

procedure TFUsers.FormDestroy(Sender: TObject);
begin
     Check_State(Frodm.Users,BsaveClick);
end;

procedure TFUsers.UserEnter(Sender: TObject);
begin
     If Not(Frodm.Users.State = dsBrowse) Then BsaveClick(Sender);
     User.Items.Delete(User.Items.IndexOf('ÂœÌÂ —«Ì«‰Â'));
     User.Items.Delete(User.Items.IndexOf('—«„ Ì‰'));
end;



procedure TFUsers.NextTab(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
       Key :=#0;
       SelectNext(Sender As TWinControl,True,True);
     End;
end;

procedure TFUsers.cbAllClick(Sender: TObject);
Var
I:Integer;
begin
     For I:=0 To 254 Do Enabl[I]:=cbAll.Checked;
     Cb2.Items.Clear;
     Cb3.Items.Clear;
     Cb4.Items.Clear;
     Cb5.Items.Clear;
     For I:= 0 To Cb1.Items.Count-1 Do Cb1.Checked[I]:=cbAll.Checked;
end;


procedure TFUsers.tvAckodKeyPress(Sender: TObject; var Key: Char);
Var
Kod:Real;
idx:Integer;
sAcname:String;
begin
     IF Key = #13 Then
     Begin
      Key:=#0;
      Kod:=tvAcKod.Selected.AcCode;
      KodFound(Kod);
      If Frodm.Users.Fields[5].Value = 'EN' Then
       sAcname:=Frodm.AcKodEname.AsString
      Else
       sAcname:=tvAcKod.Selected.Text;
      If ListAc.Items.IndexOf(sAcname)=-1 Then
      Begin
       Idx:=ListAc.Items.Add(sAcname);
       ListAc.AcCode[Idx]:=Kod;
      End;
     End;
end;

procedure TFUsers.ListAcDblClick(Sender: TObject);
Var
I:Integer;
begin
     I:=ListAc.ItemIndex;
     ListAc.Items.Delete(I);
     ListAc.ItemIndex:=I-1;
end;

procedure TFUsers.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If (Shift = [ssAlt]+[ssShift]+[ssCtrl]) and (Key = VK_F12) Then
           CreatingForm(TFUserLog,'FUserLog',FUserLog);
end;

end.
