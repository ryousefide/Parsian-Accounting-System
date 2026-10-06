unit Passing;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls;

type
  TFPassing = class(TForm)
    Panel1: TPanel;
    ProgramIcon: TImage;
    Version: TLabel;
    Copyright: TLabel;
    OKButton: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Panel2: TPanel;
    Label6: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OKButtonClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPassing: TFPassing;

implementation

uses MainForm, Routins,ProVar;

{$R *.DFM}

procedure TFPassing.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      Action:=caFree;
end;

procedure TFPassing.OKButtonClick(Sender: TObject);
begin
//     Close;
end;

procedure TFPassing.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key = 27 Then
     Begin
       OKButtonClick(Sender);
     End;
end;

procedure TFPassing.FormCreate(Sender: TObject);
begin
     Label1.Caption:=Encrypt('ˆB86B%é,8#5',10);
     Label7.Caption:=Encrypt('#!"73æ5?#<"æ 3)',7);
     Label4.Caption:=Encrypt('‚g_g,f,‚fk_},x}g,‚fyt,igh}y,{…i‚_h,_fyo_',77);
     Panel2.Caption:=Ccrypt('5ZnNQLblA5ngnwXUZtTPae0rFxABFR5gLQX7');
     Panel2.Caption:=Panel2.Caption+#13+'Please enter Passing code:';
end;

end.

