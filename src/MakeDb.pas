unit MakeDb;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, FileCtrl, ExtCtrls, Db;

type
  TFNewDb = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    FNam: TEdit;
    FPath: TEdit;
    Bexit: TButton;
    BMake: TButton;
    FileListBox1:TFileListBox;
    Bevel1: TBevel;
    Bevel3: TBevel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BexitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FNamKeyPress(Sender: TObject; var Key: Char);
    procedure FPathKeyPress(Sender: TObject; var Key: Char);
    procedure BMakeClick(Sender: TObject);
  private
    { Private declarations }
    Procedure Copy_Const_File(mask:String);
    Function Copy_Var_File(Path:String):Boolean;
  public
    { Public declarations }
    Function Copy_Db:Boolean;
  end;

var
  FNewDb: TFNewDb;

implementation

uses ProVar, Routins,DbTables, MainForm, FrooshDM;// AccRem, BegTaraz,
//  EndTaraz;

{$R *.DFM}

//Procedure For Copy Constant Db Files
Procedure TFNewDb.Copy_Const_File(mask:String);
Var
I:Integer;
Source,Dest:String;
begin
     FileListBox1.ApplyFilePath(DefaultPath);
     FileListBox1.Mask :=Mask;
     For I:=0 To FileListBox1.Items.Count-1 Do
      Begin
         Source:=DefaultPath+'\'+(FileListBox1.Items.Strings[I]);
         Dest:=FPath.Text+'\'+FileListBox1.Items.Strings[I];
         CopyFile(Pchar(Source),Pchar(Dest),False)
      End;
end;

//Procedure For Copy Variable Db Files
Function TFNewDb.Copy_Var_File(Path:String):Boolean;
Var
I:Integer;
Dest,Source:String;
begin
     Result:=True;
     FileListBox1.ApplyFilePath(Path);
     FileListBox1.Mask :='*.*';
     For I:=0 To FileListBox1.Items.Count-1 Do
      Begin
         Source:=Path+'\'+(FileListBox1.Items.Strings[I]);
         Dest:=FPath.Text+'\'+FileListBox1.Items.Strings[I];
         Result:=CopyFile(Pchar(Source),Pchar(Dest),True);
         If Not Result Then Exit;
      End;
end;

Function TFNewDb.Copy_Db:Boolean;
Var
List,List2:TStringList;
I:Integer;
SPath:String;
begin
//     Result:=True;
     If Not DirectoryExists(Fpath.Text) Then CreateDir(Fpath.Text);
     List:=TStringList.Create;
     List2:=TStringList.Create;
     Try
      Session.GetAliasNames (List);
      For I:=0 To List.Count-1 Do
          If List.Strings[I] = 'FroData' Then
            Session.GetAliasParams( List.Strings[I],List2);
      If List2.Count > 0 Then
      Spath:=Copy(List2.Strings[0],6,255) Else
      Begin
        Beep;
        ShowMessage('«„ﬂ«‰  ⁄—Ì› œÊ—Â ÃœÌœ ‰„Ì »«‘œ');
        Result:=False;
        Exit;
      End;
      Result:=Copy_Var_File(SPath);
//End Of Copying Files
     Finally
      List.Free;
      List2.Free;
     End;
end;

//End Of Privates

procedure TFNewDb.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFNewDb.BexitClick(Sender: TObject);
begin
     FNewDb.Close;
end;

procedure TFNewDb.FormCreate(Sender: TObject);
begin
      Set_Forms(FNewDb);
//      Fnam.Text :=DefaultDb+'2';
//      FPath.Text :='C:\'+DefaultDb+'2';
//      FileListBox1.ApplyFilePath(DefaultPath);
//      FileListBox1.Mask :='AccountKod.*';
end;
procedure TFNewDb.FNamKeyPress(Sender: TObject; var Key: Char);
begin
     Enter_Focus(Key,FPath);
end;

procedure TFNewDb.FPathKeyPress(Sender: TObject; var Key: Char);
begin
     Enter_Focus(Key,FNam);
end;

procedure TFNewDb.BMakeClick(Sender: TObject);
begin
     Screen.Cursor:=crHourGlass;
     If Not DirectoryExists(Fpath.Text) Then CreateDir(Fpath.Text);
     If Not Copy_Db Then
     Begin
       Screen.Cursor :=crDefault;
       FNewDb.Close;
     End;
     Session.AddStandardAlias(FNam.Text,Fpath.Text,'PARADOX');
     Session.SaveConfigFile;
     FNewDb.Close;
     Screen.Cursor :=crDefault;
end;

end.
