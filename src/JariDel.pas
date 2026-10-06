unit JariDel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TFJariDel = class(TForm)
    Label4: TLabel;
    FJari: TComboBox;
    Bdel: TButton;
    Bexit: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BdelClick(Sender: TObject);
    procedure BexitClick(Sender: TObject);
    procedure FJariKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FJariDel: TFJariDel;

implementation

uses FrooshDM, Routins, ProVar;

{$R *.DFM}

procedure TFJariDel.FormCreate(Sender: TObject);
begin
     Set_Forms(FJariDel);
     Fill_Comb(Frodm.JariNam,'Nam',FJari.Items)
end;

procedure TFJariDel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFJariDel.BdelClick(Sender: TObject);
begin
     If MessageDlg('Ã«—Ì «‰ Œ«» ‘œÂ Õ–› ê—œœ',mtWarning,mbYesNo,0) = mrNo Then Exit;
     If Frodm.JariNam.FindKey([FJari.Text]) Then Frodm.JariNam.Delete;
     Fill_Comb(Frodm.JariNam,'Nam',FJari.Items)
end;

procedure TFJariDel.BexitClick(Sender: TObject);
begin
     FJariDel.Close;
end;

procedure TFJariDel.FJariKeyPress(Sender: TObject; var Key: Char);
begin
     Enter_Focus(Key,Bdel);
end;

end.
