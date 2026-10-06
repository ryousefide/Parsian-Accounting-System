unit About;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, WinSkinData;

type
  TAboutBox = class(TForm)
    Panel1: TPanel;
    ProgramIcon: TImage;
    Version: TLabel;
    Copyright: TLabel;
    OKButton: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Panel2: TPanel;
    SkinData1: TSkinData;
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
  AboutBox: TAboutBox;

implementation

uses MainForm, Routins;

{$R *.DFM}

procedure TAboutBox.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      Action:=caFree;  
end;

procedure TAboutBox.OKButtonClick(Sender: TObject);
begin
      ABoutBox.Close;
end;

procedure TAboutBox.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key = 27 Then
     Begin
       OKButtonClick(Sender);
     End;
end;

procedure TAboutBox.FormCreate(Sender: TObject);
begin
//     Set_Forms(AboutBox);
     Label1.Caption:=Encrypt('ˆB86B%é,8#5',10);
     Label7.Caption:=Encrypt('#!"73æ5?#<"æ 3)',7);
     Label4.Caption:=Encrypt('‚g_g,f,‚fk_},x}g,‚fyt,igh}y,{…i‚_h,_fyo_',77);
//     Panel2.Caption:=Encrypt('~{_}…{,x{´‚,}h…k…´,,,igh}y,´f{fx,i{}…h',77);
end;

end.
 
