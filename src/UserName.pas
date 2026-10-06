unit UserName;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, MPlayer, Db, DBTables;

type
  TFUserName = class(TForm)
    Nam: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Pass1: TEdit;
    Bevel1: TBevel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BOkClick(Sender: TObject);
    procedure Pass1Enter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure NamKeyPress(Sender: TObject; var Key: Char);
    procedure Pass1KeyPress(Sender: TObject; var Key: Char);
    Procedure WMsysComand(Var Message:TWMsysCommand); Message WM_SYSCOMMAND;
  private
    { Private declarations }
    Pass:String;
    Cont:Integer;
    CentFlt:String;
    CashFlt:String;
    AcFlt:String;
    Procedure RegCheck;
    Procedure LoadConstMessages;
    Procedure SetFiltering;
  public
    { Public declarations }
  end;

var
  FUserName: TFUserName;

implementation

uses Routins,FrooshDM, MainForm, ProVar, About, Enviro, CheckData;

{$R *.DFM}
Procedure TFUserName.LoadConstMessages;
begin
     If CUser.Lang = 'EN' Then
     Begin
      Manga:='Error No:  %s'+#13+ 'the hardlock not founded. Pls contact with software vendor.';
      SaveConfirm:=LoadStr(12);
      DelConfirm:=LoadStr(13);
      ExitConfirm:=LoadStr(14);
      BackupConfirm:=LoadStr(15);
      sOpenFac:=LoadStr(16);
      sFGozConfirm:=LoadStr(17);
      sInvSave:=LoadStr(18);
      sBillSave:=LoadStr(19);
      SaveAllConfirm:=LoadStr(20);
      sDr:=LoadStr(21);
      sCr:=LoadStr(22);
      sDouble:=LoadStr(23);
     End Else Begin
      Manga:='Œÿ«Ì ‘„«—Â:  %s'+#13+ 'ﬁ›· ”Œ  «›“«—Ì ‰’» ‰‘œÂ «”  ';
      SaveConfirm:='«ÿ·«⁄«  À»  ‘Êœø';
      DelConfirm:='—òÊ—œ Ã«—Ì Õ–› ê—œœø';
      ExitConfirm:='¬Ì« «“ »—‰«„Â Œ«—Ã „Ì‘ÊÌœø';
      BackupConfirm:='«“ «ÿ·«⁄«  ﬂÅÌ  ÂÌÂ ‘Êœø';
      sOpenFac:='›«ﬂ Ê— œ— Õ«·  €ÌÌ— „Ì »«‘œ.«» œ« ›«ﬂ Ê— —« À»  ﬂ‰Ìœ';
      sFGozConfirm:='›—„ ÅÌêÌ—Ì ›«ﬂ Ê— Â« —« »»‰œÌœ';
      sInvSave:='«» œ« ›«ﬂ Ê— ›—Ê‘ Ã«—Ì —« À»  ﬂ‰Ìœ';
      sBillSave:='«» œ« ”‰œ Õ”«»œ«—Ì —« À»  ﬂ‰Ìœ';
      SaveAllConfirm:='«» œ« ›—„ Â«Ì À»  ‰‘œÂ —« À»  ﬂ‰Ìœ ';
      sDr:='»œ';
      sCr:='»”';
      sDouble:='„ﬁœ«— Ê«—œ ‘œÂ  ò—«—Ì «” ';
     End;
end;

Procedure TFUserName.SetFiltering;
Var
I:Integer;
St:String;
begin
     Frodm.Users.Open;
     If Frodm.Users.Locate('UserN',Nam.Text,[loCaseInsensitive])Then
     Begin
      CashFlt:='';
      St:=Frodm.Users.Fields[7].AsString;
      If St>'' Then
       Repeat
        CashFlt:=CashFlt+' or Id='+Decode(St);
       Until St='';
      CentFlt:='';
      St:=Frodm.Users.Fields[6].AsString;
      If St>'' Then
       Repeat
        CentFlt:=CentFlt+' or Grop='+QuotedStr(Decode(St));
       Until St='';

      AcFlt:='';
      If CUser.Ac_Count > 0 Then
       If CUser.Lang = 'EN' Then
        For I:=0 To CUser.AcList.Count-1 Do
         AcFlt:=AcFlt+' or Ename ='+QuotedStr(CUser.AcList.Strings[I])
       Else
        For I:=0 To CUser.AcList.Count-1 Do
         AcFlt:=AcFlt+' or Nam ='+QuotedStr(CUser.AcList.Strings[I]);

      If Pos(' or',CashFlt) =1  Then Delete(CashFlt,1,3);
      If Pos(' or',CentFlt) =1  Then Delete(CentFlt,1,3);
      If Pos(' or',AcFlt) =1  Then Delete(AcFlt,1,3);

      CUser.CashFilter:=CashFlt;
      CUser.CentFilter:=CentFlt;
      CUser.AcFilter:=AcFlt;
      Frodm.Cashier.Filter:=CashFlt;
      Frodm.Cashier.Filtered:=True;
      Frodm.Cent.Filter:=CentFlt;
      Frodm.Cent.Filtered:=True;
      Frodm.AcKod.Filter:=AcFlt;
      Frodm.AcKod.Filtered:=True;
     End;
     Frodm.Users.Close;
end;

Procedure TFUserName.RegCheck;
begin
     If ((P_Rule = '')Or(DefaultDb = '')) and (Boss) Then
     Begin
       If P_Rule = ''Then ShowMessage('—Ê‘ „Õ«”»Â »Â«Ì  „«„ ‘œÂ „‘Œ’ ‰Ì” ');
       If DefaultDb = ''Then ShowMessage('Å«Ìê«Â œ«œÂ „‘Œ’ ‰Ì” ');
       CreatingForm(TFEnviro,'FEnviro',FEnviro);
       If DefaultDb = ''Then FEnviro.FCurrDb.SetFocus Else
           FEnviro.PRule.SetFocus;
     End;
     If ((P_Rule = '')Or(DefaultDb = '')) and Not(Boss) Then
     Begin
       If P_Rule = ''Then ShowMessage('—Ê‘ „Õ«”»Â »Â«Ì  „«„ ‘œÂ „‘Œ’ ‰Ì” ');
       If DefaultDb = ''Then ShowMessage('Å«Ìê«Â œ«œÂ „‘Œ’ ‰Ì” ');
       ShowMessage('»Â „œÌ— ”Ì” „ „—«Ã⁄Â ›—„«∆Ìœ');
       Application.Terminate;
     End;
end;

procedure TFUserName.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
     Main.SB1.Panels[0].Text :=CUser.Name;
     LoadConstMessages;
     RegCheck;
End;

procedure TFUserName.BOkClick(Sender: TObject);
Const
ArziAc=' Acckod in (Select Acckod from Accountkod where Barzi=1)';
Var
Table:TTable;
I:Integer;
Pss:String;
begin
     Table:=TTable.Create(owner);
     Table.DatabaseName :=Frodm.Users.DatabaseName;
     Table.TableName :=Frodm.Users.TableName;
     Table.Active :=True;
     If Table.Locate('UserN',Nam.Text,[loCaseInsensitive])Then
     Begin
      Pass:=Table.Fields[2].AsString;

      CUser.AcList:=TStringList.Create;
      CUser.ArziAcList:=TStringList.Create;//2017
      CUser.CurrList:=TStringList.Create;
      CUser.Name:= Nam.Text;
      CUser.Id:=Table.Fields[0].AsInteger;
      Fill_Cond(Frodm.UAC,'Acname','Userid='+Table.Fields[0].AsString,CUser.AcList);
      Fill_Cond(Frodm.UAC,'Acname','Userid='+Table.Fields[0].AsString+' and '+ArziAc,CUser.ArziAcList);
      CUser.Ac_Count:=CUser.AcList.Count;
      If CUser.Ac_Count = 0 Then
      Begin
         Fill_Cond(Frodm.AcKod,'Nam',CCond,CUser.AcList);
         Fill_Cond(Frodm.AcKod,'Nam',CCond+' and BArzi = 1',CUser.ArziAcList);
      End;
      AcList:=CUser.AcList;
      CUser.Boss:=Table.Fields[3].AsBoolean;
      CUser.Master:=CUser.Name = '„œÌ—Ì  „«·Ì';
      CUser.Lang:=Table.Fields[5].AsString;
      CUser.Local:=CUser.Lang='FA';
      If Not CUser.Local Then
      Begin
       Fill_Comb(Frodm.CTip,'Sign',CUser.CurrList);
       CUser.CurrField:='Sign';
       CUser.CentField:='Ename';
       CUser.CashierField:='Owner';
       CUser.AcField:='EName';
       Application.BiDiKeyboard:='0000409';
      End Else Begin
       Fill_Comb(Frodm.CTip,'Name',CUser.CurrList);
       CUser.CurrField:='Name';
       CUser.CentField:='Nam';
       CUser.CashierField:='Name';
       CUser.AcField:='Nam';
       Application.BiDiKeyboard:='00000429';
      end;
      Boss:=CUser.Boss;
     End;
     If (Pass = Pass1.Text)And(Pass <>'') Then
     Begin
       Pss:=Table.Fields[4].AsString;
       For I:=0 To 254 Do Enabl[I]:=Pss[I+1]='1';//Table.Fields[I+3].AsBoolean;
       GWidth:=GetGoodLen;
       SetToday;
       Setup_DefCodes;
       SetFiltering;
       MenuDefine(Main.MMenu);
       Main.About2.Enabled:=True;
       Main.Menu :=Main.MMenu;
       Main.TbDefine;
       Main.PopDefine;
       Main.PopupMenu :=Main.Pop1;
       Table.Active :=False;
       Table.Free;
       If PowerCut Then
       Begin
        //Main.Reindex(Sender);
        CreatingForm(TDataCheck,'DataCheck',DataCheck);
       End;
       If sPcheq Then PcheqControl;
       If sDcheq Then DCheqControl;
       Close;
       Exit;
     End;
     If Cont >= 3 Then Application.Terminate;
     Table.Active :=False;
     Table.Free;
end;

procedure TFUserName.Pass1Enter(Sender: TObject);
begin
     Cont:=Cont+1;
end;

procedure TFUserName.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     Frodm.Users.Open;
     Nam.Text:=LastUser;
     Nam.SelectAll;
     Cont:=0;
end;

procedure TFUserName.NamKeyPress(Sender: TObject; var Key: Char);
begin
     Enter_Focus(Key,Pass1);
end;

procedure TFUserName.Pass1KeyPress(Sender: TObject; var Key: Char);
begin
      Enter_Focus(Key,NAm);
end;

procedure TFUserName.WMsysComand(var Message: TWMsysCommand);
begin
     If (Message.cmdType and $FFF0 = SC_MINIMIZE) Then
      Application.Minimize
     Else
      Inherited;
end;

end.
