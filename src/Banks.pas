unit Banks;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, ExtCtrls;

type
  TFbank = class(TForm)
    Label1: TLabel;
    Bnext: TButton;
    Bprev: TButton;
    Bsave: TButton;
    Bexit: TButton;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bdel: TButton;
    Bank: TEdit;
    procedure BnextClick(Sender: TObject);
    procedure BprevClick(Sender: TObject);
    procedure BsaveClick(Sender: TObject);
    procedure BexitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BdelClick(Sender: TObject);
    procedure BankKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fbank: TFbank;

implementation

uses FrooshDM, Routins, ProVar,Db;

{$R *.DFM}

procedure TFbank.BnextClick(Sender: TObject);
begin
     If Not (Frodm.banks.State = dsBrowse) Then Exit;
     FRoDM.banks.Next;
     Bnext.Enabled := Not Frodm.banks.Eof;
     BPrev.Enabled := Not Frodm.banks.Bof;
     If Frodm.banks.Eof Then
     Begin
       Frodm.banks.Append;
       Bank.SetFocus;
     End;
     Bank.Text :=Frodm.banksBnam.Value;
     Bank.SetFocus;
end;

procedure TFbank.BprevClick(Sender: TObject);
begin
     Check_State(Frodm.banks,BsaveClick);
     FRoDM.banks.Prior;
     Bnext.Enabled := Not Frodm.banks.Eof;
     BPrev.Enabled := Not Frodm.banks.Bof;
     Bank.Text :=Frodm.banksBnam.Value;
     Bank.SetFocus;
end;

procedure TFbank.BsaveClick(Sender: TObject);
Var
Str:String;
begin
     If Frodm.banks.State = dsBrowse Then Exit;
     If Frodm.banks.State = dsInsert Then
     Begin
       Str:='ÈÇäß';
       If Not (NamFound(Bank.Text))Then
       New_Account_Root(Bank.Text,Str,0,0);
       Str:='ß ÑÏÇÎÊäí';
       If Not (NamFound('ß'+' '+Bank.Text))Then
       New_Account_Root('ß'+' '+Bank.Text,Str,0,0);
     End;
     Frodm.banksBnam.Value:=Bank.Text;
     Frodm.banks.Post;
     Saved;
     Bank.Text :='';
     Bank.SetFocus;
end;

procedure TFbank.BexitClick(Sender: TObject);
begin
        Check_State(Frodm.banks,BsaveClick);
        Fbank.Close;
end;

procedure TFbank.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      Action:=caFree;
      Frodm.banks.Close;
      QuickCloseOpen([3]);
end;

procedure TFbank.FormCreate(Sender: TObject);
begin
     Set_Forms(self);
     Frodm.banks.Open;
     Frodm.banks.Last;
     Bank.Text :=Frodm.banksBnam.Value;
end;

procedure TFbank.BdelClick(Sender: TObject);
begin
     IF Frodm.banks.RecordCount = 0 Then Exit;
     Frodm.banks.Delete;
     Bank.Text :=Frodm.banksBnam.Value;
end;

procedure TFbank.BankKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
      If (Bank.Text > '') And Not(Frodm.banks.Locate('BNam',Bank.Text,[loCaseInsensitive]))
      Then  Begin
        Frodm.banks.Append;
        BsaveClick(Sender);
      End;
end;

end.
