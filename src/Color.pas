unit Color;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, ExtCtrls;

type
  TFColor = class(TForm)
    Label1: TLabel;
    Bnext: TButton;
    Bprev: TButton;
    Bdel: TButton;
    Bexit: TButton;
    Bevel1: TBevel;
    FColors: TEdit;
    Label2: TLabel;
    DBText1: TDBText;
    Bevel2: TBevel;
    procedure BnextClick(Sender: TObject);
    procedure BprevClick(Sender: TObject);
    procedure BdelClick(Sender: TObject);
    procedure BsaveClick(Sender: TObject);
    procedure BexitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FColorsKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FColor: TFColor;

implementation

uses FrooshDM,Db, Routins, ProVar;

{$R *.DFM}

procedure TFColor.FormCreate(Sender: TObject);
begin
     Frodm.Color.Open;
     Set_Forms(Self);
     FroDM.Color.Last;
     FColors.Text:=Frodm.ColorColor.Value;
     Bnext.Enabled := Not Frodm.Color.Eof;
     BPrev.Enabled := Not Frodm.Color.Bof;
end;

procedure TFColor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFColor.FColorsKeyPress(Sender: TObject; var Key: Char);
begin
     If Key ='-' Then Key:=#0;
     If Key = #13 Then
     Begin
       Key:=#0;
       IF (FColors.Text > '') And
        Not(Frodm.Color.Locate('Color',FColors.Text,[loCaseInsensitive])) Then
       BsaveClick(Sender) Else FColors.SelectAll;
     End;
end;

procedure TFColor.BnextClick(Sender: TObject);
begin
     FroDM.Color.Next;
     FColors.Text:=Frodm.ColorColor.Value;
     Bnext.Enabled := Not Frodm.Color.Eof;
     BPrev.Enabled := Not Frodm.Color.Bof;
end;

procedure TFColor.BprevClick(Sender: TObject);
begin
     FroDM.Color.Prior;
     FColors.Text:=Frodm.ColorColor.Value;
     Bnext.Enabled := Not Frodm.Color.Eof;
     BPrev.Enabled := Not Frodm.Color.Bof;
end;

procedure TFColor.BdelClick(Sender: TObject);
begin
     IF Frodm.Color.RecordCount = 0 Then Exit;
     FroDM.Color.Delete;
     FColors.Text := Frodm.ColorColor.Value;
     Beep;
     ShowMessage('Õ–› ‘œ');
     Fcolors.SetFocus;
end;

procedure TFColor.BsaveClick(Sender: TObject);
begin
     FroDM.Color.Append;
     Frodm.ColorColor.Value :=FColors.Text;
     FroDM.Color.Post;
     QuickCloseOpen([28]);
     Windows.Beep(2500,250);
     //Saved;
     FColors.Text:='';
     Fcolors.SetFocus;
end;

procedure TFColor.BexitClick(Sender: TObject);
begin
     Check_State(Frodm.Color,BsaveClick);
     Fcolor.Close;
end;

end.
