unit AnbDat;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, ExtCtrls, MPlayer;

type
  TFAnbDat = class(TForm)
    Label1: TLabel;
    FNam: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    FAdmin: TDBEdit;
    FAdr: TDBEdit;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label4: TLabel;
    FKod: TDBEdit;
    Panel1: TPanel;
    Bexit: TButton;
    Bnext: TButton;
    Bprev: TButton;
    Bnew: TButton;
    Bsave: TButton;
    Bedit: TButton;
    Bdel: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BexitClick(Sender: TObject);
    procedure BnextClick(Sender: TObject);
    procedure BprevClick(Sender: TObject);
    procedure BnewClick(Sender: TObject);
    procedure BsaveClick(Sender: TObject);
    procedure FNamKeyPress(Sender: TObject; var Key: Char);
    procedure FAdminKeyPress(Sender: TObject; var Key: Char);
    procedure FAdrKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure BeditClick(Sender: TObject);
    procedure FNamEnter(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FKodKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BdelClick(Sender: TObject);
    procedure FNamExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAnbDat: TFAnbDat;

implementation

uses FrooshDM, ProVar, Routins, Db, Converts;



{$R *.DFM}

procedure TFAnbDat.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     Frodm.AnbDat.Open;
     Frodm.AnbDat.Last;
     Bnext.Enabled := Not Frodm.AnbDat.Eof;
     BPrev.Enabled := Not Frodm.AnbDat.Bof;
end;

procedure TFAnbDat.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Shift = [ssCtrl] Then
      Case Key Of
       VK_RIGHT:BprevClick(Sender);
       VK_Left:BnextClick(Sender);
      End;
end;

procedure TFAnbDat.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
     Frodm.AnbDat.Close;
end;

procedure TFAnbDat.FormDestroy(Sender: TObject);
begin
     Check_State(Frodm.AnbDat,BsaveClick);
     QuickCloseOpen([12]);
end;

procedure TFAnbDat.FNamKeyPress(Sender: TObject; var Key: Char);
begin
     If Key ='-' Then Key:=#0;
     Enter_Focus(Key,FAdmin);
end;

procedure TFAnbDat.FNamEnter(Sender: TObject);
begin
     If Frodm.AnbDat.State = dsEdit Then
     Begin
      Frodm.GCardex.Open;
      Frodm.GCardex.Filter:='AnbNam = '+#39+FNam.Text+#39;
      Frodm.GCardex.Filtered:=True;
      If Frodm.GCardex.RecordCount > 0 Then
      Begin
       ShowMessage('«‰»«— œ«—«Ì ”«»ﬁÂ «” .‰«„ «‰»«— €Ì— ﬁ«»·  €ÌÌ— «” ');
       Frodm.GCardex.Filtered:=False;;
       FAdmin.SetFocus;
      End;
      Frodm.GCardex.Close;
     End;
end;

procedure TFAnbDat.FNamExit(Sender: TObject);
begin
     If Frodm.AnbDat.State =dsBrowse Then Exit;
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Nam From AnbDat Where Nam ='+#39+FNam.Text+#39);
     Qu.Open;
     IF Qu.RecordCount > 0  Then
     Begin
       ShowMessage('‰«„ «‰»«—  ﬂ—«—Ì «” ');
       Qu.Close;
       FNam.SetFocus;
     End;
     Qu.Close;
end;

procedure TFAnbDat.FAdminKeyPress(Sender: TObject; var Key: Char);
begin
     Enter_Focus(Key,FKod);
end;

procedure TFAnbDat.FKodKeyPress(Sender: TObject; var Key: Char);
begin
     Enter_Focus(Key,FAdr);
end;

procedure TFAnbDat.FAdrKeyPress(Sender: TObject; var Key: Char);
begin
      If Frodm.AnbDat.State = dsBrowse Then  Enter_Focus(Key,Bnext) Else
         Enter_Focus(Key,Bsave);
end;

procedure TFAnbDat.BprevClick(Sender: TObject);
begin
     Frodm.AnbDat.Refresh;
     If Not(Frodm.AnbDat.State = dsBrowse) Then Check_State(Frodm.AnbDat,BsaveClick)
     Else Frodm.AnbDat.Prior;
     Bnext.Enabled := Not Frodm.AnbDat.Eof;
     BPrev.Enabled := Not Frodm.AnbDat.Bof;
end;

procedure TFAnbDat.BnextClick(Sender: TObject);
begin
     Frodm.AnbDat.Refresh;
     If Frodm.AnbDat.State <> dsBrowse Then Check_State(Frodm.AnbDat,BsaveClick);
     Frodm.AnbDat.Next;
{     If Frodm.AnbDat.Eof Then
     Begin
       Frodm.AnbDat.Append;
       FNAm.SetFocus;
     End;}
     Bnext.Enabled := Not Frodm.AnbDat.Eof;
     BPrev.Enabled := Not Frodm.AnbDat.Bof;
end;

procedure TFAnbDat.BeditClick(Sender: TObject);
begin
     Frodm.AnbDat.Edit;
     FNamEnter(Sender);
end;

procedure TFAnbDat.BnewClick(Sender: TObject);
begin
     Frodm.AnbDat.Append;
     FNam.SetFocus;
end;

procedure TFAnbDat.BsaveClick(Sender: TObject);
begin
     If Frodm.AnbDat.State = dsBrowse Then Exit;
     RequierdCheck(Frodm.AnbDat);
     If IntFieldCheck(Frodm.AnbDatKod) Then
     Begin
       Frodm.AnbDat.Post;
       Saved;
       QuickCloseOpen([12]);
     End Else
       Frodm.AnbDat.Cancel;
end;

procedure TFAnbDat.BexitClick(Sender: TObject);
begin
     Check_State(Frodm.AnbDat,BsaveClick);
     FAnbDat.Close;
end;

procedure TFAnbDat.BdelClick(Sender: TObject);
begin
     IF Frodm.AnbDat.RecordCount = 0 Then Exit;
     Frodm.GCardex.Open;
     Frodm.GCardex.Filter:='AnbNam = '+#39+FNam.Text+#39;
     Frodm.GCardex.Filtered:=True;
     If Frodm.GCardex.RecordCount > 0 Then ShowMessage('«‰»«— ”«»ﬁÂ œ«—œ') Else
        Frodm.AnbDat.Delete;
     Frodm.GCardex.Filtered:=False;
     Frodm.GCardex.Close;
end;

end.
