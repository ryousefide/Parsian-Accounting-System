unit DBMake;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, KBL,FileCtrl, ExtCtrls;

type
  TFDBMake = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    FDBNam: TEdit;
    FDBPath: TEdit;
    Bexit: TButton;
    Bmake: TButton;
    Kbl: TKeyboardLanguage;
    FileListBox1: TFileListBox;
    Bevel1: TBevel;
    Bevel2: TBevel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BexitClick(Sender: TObject);
    procedure BmakeClick(Sender: TObject);
    procedure FDBPathChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FDBNamKeyPress(Sender: TObject; var Key: Char);
    procedure FDBPathKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDBMake: TFDBMake;

implementation

uses DbTables, ProVar, Routins;

{$R *.DFM}

procedure TFDBMake.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFDBMake.BexitClick(Sender: TObject);
begin
      Kbl.Language :=ksFarsi;
      FDBMake.Close;
end;

procedure TFDBMake.BmakeClick(Sender: TObject);
Var
I:Integer;
Source,Dest:String;
sPath:String;
Session:TSession;
List,List2:TStringList;
begin
      If Not DirectoryExists(FDBpath.Text) Then CreateDir(FDBpath.Text);
      List:=TStringList.Create;
      List2:=TStringList.Create;
      Session:=TSession.Create(owner);
      Try
       Session.SessionName :='S1';
       Session.GetAliasNames (List);
       For I:=0 To List.Count-1 Do
          If List.Strings[I] = 'Data' Then
            Session.GetAliasParams( List.Strings[I],List2);
       Spath:=Copy(List2.Strings[0],6,255);
       FileListBox1.ApplyFilePath(Spath);
       FileListBox1.Mask:='*.*';
       For I:=0 To FileListBox1.Items.Count-1 Do
       Begin
          Source:=Spath+'\'+(FileListBox1.Items.Strings[I]);
          Dest:=FDBPath.Text+'\'+FileListBox1.Items.Strings[I];
          CopyFile(Pchar(Source),Pchar(Dest),True)
       End;
       Session.AddStandardAlias( FDBNam.Text,FDBpath.Text,'PARADOX');
       Session.SaveConfigFile;
       DefaultPath:=FDBpath.Text;
       DefaultDb:=FDBNam.Text;
      Finally
       Session.Free;
       List.Free;
       List2.Free;
       Bmake.Enabled :=False;
      End;
end;

procedure TFDBMake.FDBPathChange(Sender: TObject);
begin
      Bmake.Enabled :=True;
end;

procedure TFDBMake.FormCreate(Sender: TObject);
begin
      Set_Forms(FDBmake);  
end;

procedure TFDBMake.FDBNamKeyPress(Sender: TObject; var Key: Char);
begin
     Enter_Focus(Key,FDBpath);   
end;

procedure TFDBMake.FDBPathKeyPress(Sender: TObject; var Key: Char);
begin
     Enter_Focus(Key,FDBNam);   
end;

end.
