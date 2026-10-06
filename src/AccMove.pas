unit AccMove;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ExtCtrls;

type
  TFAccMove = class(TForm)
    Label1: TLabel;
    FirstAc: TComboBox;
    NextAc: TComboBox;
    Label2: TLabel;
    Bevel1: TBevel;
    Panel1: TPanel;
    BDo: TButton;
    Bexit: TButton;
    Memo1: TMemo;
    cb1: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FirstAcKeyPress(Sender: TObject; var Key: Char);
    procedure NextAcKeyPress(Sender: TObject; var Key: Char);
    procedure BDoClick(Sender: TObject);
    procedure BexitClick(Sender: TObject);
    procedure FirstAcKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cb1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAccMove: TFAccMove;

implementation

uses FrooshDM, Routins, ProVar, Converts;

{$R *.DFM}

procedure TFAccMove.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     Fill_Cond(Frodm.AcKod,'Nam',' Usekod = 1',FirstAc.Items);
     Fill_Cond(Frodm.AcKod,'Nam',' Usekod = 1',NextAc.Items);
end;

procedure TFAccMove.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFAccMove.FirstAcKeyPress(Sender: TObject; var Key: Char);
begin
     Enter_Focus(Key,NextAc);
end;

procedure TFAccMove.NextAcKeyPress(Sender: TObject; var Key: Char);
begin
     Enter_Focus(Key,BDo);
end;

procedure TFAccMove.BDoClick(Sender: TObject);
Var
I:Integer;
begin
     If (FirstAc.ItemIndex=-1)or (NextAc.ItemIndex=-1)Then Exit;
     Screen.Cursor :=crHourGlass;
     Frodm.Acbill.MasterSource:=Nil;
     Frodm.Acbill.Filter :=' Accnam = '+#39+FirstAc.Text+#39;
     Frodm.Acbill.Filtered :=True;
     Frodm.Acbill.First;
     For I:=1 To Frodm.AcBill.RecordCount Do
     Begin
       Frodm.Acbill.Edit;
       Frodm.AcbillAccnam.Value :=NextAc.Text;
       Frodm.AcbillAckod.Value :=AccKod(NextAc.Text);
       Frodm.Acbill.Post;
       Frodm.Acbill.Next;
     End;
     Frodm.Acbill.Filtered :=False;
//     Frodm.Bill.Active :=True;
     Screen.Cursor :=crDefault;
     ShowMessage('Õ”«» „‰ ﬁ· ‘œ');
end;

procedure TFAccMove.BexitClick(Sender: TObject);
begin
     FAccMove.Close;
end;

procedure TFAccMove.FirstAcKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetAccountCombo(Sender,Key);
end;

procedure TFAccMove.cb1Click(Sender: TObject);
begin
     BDo.Enabled:=Cb1.Checked;
end;

end.
