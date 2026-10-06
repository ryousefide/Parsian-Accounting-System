unit DConvert;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ExtCtrls;

type
  TFDConvert = class(TForm)
    Label1: TLabel;
    Bevel1: TBevel;
    SDat: TMaskEdit;
    Label2: TLabel;
    Mdat: TMaskEdit;
    procedure SDatEnter(Sender: TObject);
    procedure SDatKeyPress(Sender: TObject; var Key: Char);
    procedure SDatExit(Sender: TObject);
    procedure MdatKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    iDate:Integer;
    Year:Word;
    Mon:Word;
    Day:Word;
  public
    { Public declarations }
  end;

var
  FDConvert: TFDConvert;

implementation

uses ProVar, Routins, SolarUtl;

{$R *.DFM}

procedure TFDConvert.SDatEnter(Sender: TObject);
begin
     GetMaskText(SDat);
     //SDat.SelStart:=2;
end;

procedure TFDConvert.SDatKeyPress(Sender: TObject; var Key: Char);
begin
     If key=#13 Then
     Begin
      Key:=#0;
      iDate:=StrToInt(SDat.Text);
      Year:=iDate Div 10000;
      Mon :=(iDate Mod 10000)  Div 100;
      Day :=iDate Mod 100;
      SolarToGregorian(Year,Mon,Day);
      MDat.Text:=IntToStr(Year*10000+Mon*100+Day);
     End;
end;

procedure TFDConvert.SDatExit(Sender: TObject);
begin
     SetMaskText(SDat);
     If (Not Date_Check(SDat.Text))and(DateToInt(SDat.Text)>0) Then SDat.SetFocus;
end;

procedure TFDConvert.MdatKeyPress(Sender: TObject; var Key: Char);
begin
     If key=#13 Then
     Begin
      Key:=#0;
      iDate:=StrToInt(MDat.Text);
      Year:=iDate Div 10000;
      Mon :=(iDate Mod 10000)  Div 100;
      Day :=iDate Mod 100;
      GregorianToSolar(Year,Mon,Day);
      SDat.Text:=IntToStr(Year*10000+Mon*100+Day);
     End;
end;

procedure TFDConvert.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFDConvert.FormCreate(Sender: TObject);
begin
     Set_forms(Self);
end;

end.
