unit AccList;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls;

type
  TFAccList = class(TForm)
    AcBox: TListBox;
    Bok: TButton;
    Sb1: TStatusBar;
    Bevel1: TBevel;
    procedure BokClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AcBoxClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAccList: TFAccList;

implementation

uses FrooshDM, Routins, ProVar;

{$R *.DFM}

procedure TFAccList.BokClick(Sender: TObject);
begin
{     Frodm.AcKod.Active :=False;}
     FAccList.Close;
end;

procedure TFAccList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      Action:=caFree;
end;

procedure TFAccList.AcBoxClick(Sender: TObject);
begin
      Sb1.Panels[0].Text:=AccString(AccKod(AcBox.Items[Acbox.ItemIndex]));
      Sb1.Hint:=Sb1.Panels[0].Text;
end;

procedure TFAccList.FormCreate(Sender: TObject);
Var
I:Integer;
S:String;
begin
        Set_Forms(FAccList);
        FroDM.AcKod.IndexFieldNames :='Nam';
        FroDM.AcKod.First;
        For I:=1 To FroDM.AcKod.RecordCount Do
        Begin
        S:=FroDM.AcKod.FieldByName('Nam').AsString;
        AcBox.Items.Append(S);
        FroDm.AcKod.Next;
        End;
end;

end.
