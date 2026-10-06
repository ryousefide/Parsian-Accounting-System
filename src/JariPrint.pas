unit JariPrint;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask;

type
  TFJaPrint = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    SDat: TMaskEdit;
    EDat: TMaskEdit;
    Bprint: TButton;
    Bevel1: TBevel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure SDatKeyPress(Sender: TObject; var Key: Char);
    procedure EDatKeyPress(Sender: TObject; var Key: Char);
    procedure BprintClick(Sender: TObject);
    procedure SDatExit(Sender: TObject);
    procedure EDatExit(Sender: TObject);
    procedure SDatEnter(Sender: TObject);
    procedure EDatEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FJaPrint: TFJaPrint;

implementation

uses FrooshDM, Routins, ProVar, PCheq, RepJari, Jari;

{$R *.DFM}

procedure TFJaPrint.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFJaPrint.FormCreate(Sender: TObject);
begin
     Set_Forms(FJaPrint);
end;

procedure TFJaPrint.SDatKeyPress(Sender: TObject; var Key: Char);
begin
     Enter_Focus(Key,Edat);
end;

procedure TFJaPrint.EDatKeyPress(Sender: TObject; var Key: Char);
begin
     Enter_Focus(Key,Bprint);
end;

procedure TFJaPrint.BprintClick(Sender: TObject);
begin
     Frodm.Jari.Filter :='Dat >= '+IntToStr(DateToInt(Sdat.Text))+' and Dat <= '
          +IntToStr(DateToInt(Edat.Text));
     Frodm.Jari.Filtered :=True;
     CreatingForm(TJariRep,'JariRep',JariRep);
     Set_Sys_Enviroment;
     JariRep.Sdat.Caption :=Sdat.Text;
     JariRep.Edat.Caption :=Edat.Text;
     JariRep.Jari.Caption := FJari.JariNam.Text;
     JariRep.Bank.Caption :=FJari.DBText2.Field.Text;
     JariRep.Nam.Caption  :=FJari.DBText1.Field.Text;
     JariRep.Preview;
     JariRep.Destroy;
     Frodm.Jari.Filtered :=False;
     FJaprint.Close;
end;

procedure TFJaPrint.SDatExit(Sender: TObject);
begin
     SetMaskText(SDat);
     If Not Date_Check(SDat.Text) Then SDat.SetFocus;
end;

procedure TFJaPrint.EDatExit(Sender: TObject);
begin
     SetMaskText(EDat);
     If Not Date_Check(EDat.Text) Then EDat.SetFocus;
end;

procedure TFJaPrint.SDatEnter(Sender: TObject);
begin
     GetMaskText(SDat);
end;

procedure TFJaPrint.EDatEnter(Sender: TObject);
begin
     GetMaskText(EDat);
end;

end.
