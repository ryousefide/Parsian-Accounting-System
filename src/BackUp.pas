unit BackUp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, FileCtrl, ComCtrls, ExtCtrls, Db, DbTables, Buttons;

type
  TFBackUp = class(TForm)
    Files: TFileListBox;
    BPath: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    FMask: TEdit;
    Pb: TProgressBar;
    Bcopy: TButton;
    Bexit: TButton;
    Bevel2: TBevel;
    Label4: TLabel;
    CPath: TEdit;
    Bevel1: TBevel;
    Label5: TLabel;
    sp1: TSpeedButton;
    sp2: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FMaskExit(Sender: TObject);
    procedure BPathExit(Sender: TObject);
    procedure BexitClick(Sender: TObject);
    procedure BcopyClick(Sender: TObject);
    procedure DrivChange(Sender: TObject);
    procedure NextTab(Sender: TObject; var Key: Char);
    procedure sp1Click(Sender: TObject);
    procedure sp2Click(Sender: TObject);
  private
    { Private declarations }
    Function File_Size(FileNam:String):Int64;
    Function Space(FileNam:String;Driv:Byte):Boolean;
    Procedure BackUp;

  public
    { Public declarations }
    Procedure DailyBackUp;
    Procedure Close_DataBase;
  end;

var
  FBackUp: TFBackUp;

implementation

uses Routins, ProVar, MainForm, FrooshDM;

{$R *.DFM}

Var
DriNo:Byte;

procedure TFBackUp.NextTab(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
       Key :=#0;
       SelectNext(Sender As TWinControl,True,True);
     End;
end;

Function TFBackUp.File_Size(FileNam:String):Int64;
Var
f:File of Byte;
begin
     AssignFile(f,FileNam);
     Reset(f);
     Result:=FileSize(f);
     CloseFile(f);
End;

Function TFBackUp.Space(FileNam:String;Driv:Byte):Boolean;
begin
     Result:=True;
     If File_Size(FileNam) > DiskFree(Driv) Then Result:=False;
end;

Procedure TFBackUp.BackUp;
Var
FStr:String;
Source,Dest:String;
I,ID:Integer;
CId:Boolean;
Label
 SpCheck;

begin
     If Not DirectoryExists(CPath.Text) Then CreateDir(CPath.Text);
     Pb.Max :=Files.Items.Count;
     For I:=0 To Files.Items.Count-1 Do
     Begin
        FStr:=Files.Items.Strings[I];
SpCheck:
        If Space(BPath.Text+'\'+Fstr,DriNo) Then
        Begin
         Source:=BPath.Text+'\'+Fstr;
         Dest:=CPath.Text+'\'+Fstr;
         Label5.Caption:=Source;
         Label5.Refresh;
         If Pos('.LCK',Source) = 0 Then
          CId:=CopyFile(Pchar(Source),Pchar(Dest),False)
         Else
          CId:=True;
         If Not Cid Then
         Begin
          ShowMessage('Œÿ«Ì ﬂÅÌ ›«Ì·.œÌ”ﬂ  —« ﬂ‰ —· ﬂ‰Ìœ');
          Pb.Position :=0;
          Exit;
         End;
         Pb.Position :=I;
        End Else
        Begin
         ID:=MessageDlg('œÌ”ﬂ  ›÷«Ì ﬂ«›Ì ‰œ«—œ.œÌ”ﬂ  »⁄œÌ —« œ— œ—«ÌÊ ﬁ—«— œÂÌœ',
          mtWarning,mbOkCancel,0);
         If ID = mrCancel Then Exit;
         If ID = mrOk Then Goto SpCheck;
        End;
     End;
     Pb.Position :=0;
end;

Procedure TFBackUp.DailyBackUp;
Var
Str:String;
I:Integer;
Source,Dest:String;
Cid:Boolean;
begin
     //Close_Database;
     If Not DirectoryExists(CPath.Text) Then CreateDir(CPath.Text);
     Pb.Max :=Files.Items.Count;
     For I:=0 To Files.Items.Count-1 Do
     Begin
      Str:=Files.Items.Strings[I];
      Source:=BPath.Text+'\'+str;
      Dest:=CPath.Text+'\'+str;
      If Pos('.LCK',Source) = 0 Then
       CId:=CopyFile(Pchar(Source),Pchar(Dest),False)
      Else
       CId:=True;
      If Not CId Then
      Begin
       ShowMessage('«Œÿ«—!⁄„·Ì«    ÂÌÂ Å‘ Ì»«‰ ’Ê—  ‰ê—› Â «” ');
       Exit;
      End;
      Pb.Position :=I;
     End;
end;

Procedure TFBackUp.Close_Database;
begin
     Frodm.DB1.CloseDataSets;
end;

procedure TFBackUp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     //Setup_DataBase(CurrDb);
     Action:=caFree;
end;

procedure TFBackUp.FormCreate(Sender: TObject);
begin
     Set_Forms(FBackUp);
     //Close_DataBase;
     BPath.Text := CurrPath;
     FMask.Text :='*.*';
     Files.ApplyFilePath(BPath.Text);
     Files.Mask :=FMask.Text;
end;

procedure TFBackUp.FMaskExit(Sender: TObject);
begin
     Files.Mask :=FMask.Text;
end;

procedure TFBackUp.BPathExit(Sender: TObject);
begin
     Files.ApplyFilePath(BPath.Text);
end;

procedure TFBackUp.BexitClick(Sender: TObject);
begin
     Close;
end;

procedure TFBackUp.BcopyClick(Sender: TObject);
begin
     If CPath.Text = '' Then Exit;
     BackUp;
     Close;
     BPath.SetFocus;
end;

procedure TFBackUp.DrivChange(Sender: TObject);
begin
{     CPath.Text :=Driv.Drive+':';
     Case Driv.Drive of
      'A':DriNo:=1;
      'B':DriNo:=2;
      'C':DriNo:=3;
      'D':DriNo:=4;
      'E':DriNo:=5;
      'F':DriNo:=6;
      'G':DriNo:=7;
      'H':DriNo:=8;
      'I':DriNo:=9;
      'J':DriNo:=10;
      'K':DriNo:=11;
      'L':DriNo:=12;
      'M':DriNo:=13;
     End;}
end;

procedure TFBackUp.sp1Click(Sender: TObject);
Var
Dir:String;
begin
     SelectDirectory('«‰ Œ«» ÅÊ‘Â „»œ«¡','',Dir);
     BPath.Text:=Dir;
end;

procedure TFBackUp.sp2Click(Sender: TObject);
Var
Dir:String;
begin
     SelectDirectory(Dir,[sdAllowCreate,sdPerformCreate,sdPrompt],0);
     CPath.Text:=Dir;
end;

end.
