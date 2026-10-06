unit Aghs;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ExtCtrls;

type
  TFAghs = class(TForm)
    SPrice: TEdit;
    Label3: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Bevel1: TBevel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    FRate: TEdit;
    FQt: TEdit;
    FGP: TEdit;
    SDat: TMaskEdit;
    FAccNam: TComboBox;
    Bevel2: TBevel;
    Bsave: TButton;
    Bexit: TButton;
    Bevel3: TBevel;
    FSum: TEdit;
    Label7: TLabel;
    FDif: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    KPrice: TEdit;
    Label10: TLabel;
    CPrice: TEdit;
    FPrice: TEdit;
    Label11: TLabel;
    BShow: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    Procedure NextTab(Sender:TObject;Var Key:Char);
    procedure SPriceExit(Sender: TObject);
    procedure SPriceKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SPriceKeyPress(Sender: TObject; var Key: Char);
    procedure SDatEnter(Sender: TObject);
    procedure SDatExit(Sender: TObject);
    procedure FGPEnter(Sender: TObject);
    procedure BexitClick(Sender: TObject);
    procedure BsaveClick(Sender: TObject);
    procedure FGPKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FGPExit(Sender: TObject);
    procedure KPriceExit(Sender: TObject);
    procedure KPriceKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CPriceExit(Sender: TObject);
    procedure CPriceKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BShowClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAghs: TFAghs;

implementation

uses FrooshDM, ProVar, Routins;

{$R *.DFM}
Procedure TFAghs.NextTab(Sender:TObject;Var Key:Char);
begin
     If Key = #13 Then
     Begin
       Key:=#0;
       SelectNext(Sender As TWinControl,True,True);
     End;
end;

procedure TFAghs.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key = VK_F3 Then BShowClick(Sender);
end;

procedure TFAghs.FormActivate(Sender: TObject);
begin
     FAccNam.Items.Assign(AcList);
end;

procedure TFAghs.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFAghs.FormCreate(Sender: TObject);
begin
     Set_Forms(FAghs);
     FAccNam.Items.Assign(AcList);
end;

procedure TFAghs.SPriceExit(Sender: TObject);
begin
     SPrice.Text:=StrToFCurr(SPrice.Text);
end;

procedure TFAghs.SPriceKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     SPrice.Text :=KeyMult2(Key,SPrice.Text);
end;

procedure TFAghs.SPriceKeyPress(Sender: TObject; var Key: Char);
begin
     NextTab(Sender,Key);
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;
end;

procedure TFAghs.SDatEnter(Sender: TObject);
begin
     GetMaskText(SDat);
end;

procedure TFAghs.SDatExit(Sender: TObject);
begin
     SetMaskText(SDat);
     If(Not Date_Check(SDat.Text)) Then SDat.SetFocus;
end;

procedure TFAghs.FGPEnter(Sender: TObject);
Var
P,Gp:Currency;
Gc:Integer;
Per:Real;
begin
     P:=FarToCurr(SPrice.Text);
     Gc:=StrToInt(FQt.Text);
     Per:=StrToFloat(FRate.Text)/100;
     Gp:=P*(1+Gc*Per)/Gc;
     FGp.Text:=CurrToFar(Gp);
     FGP.SelectAll;
end;

procedure TFAghs.BexitClick(Sender: TObject);
begin
     FAghs.Close;
end;

procedure TFAghs.BsaveClick(Sender: TObject);
Var
BMon:Integer;
BDat:Integer;
MQt:Integer;
I:Integer;
GP:Currency;
YQt:Integer;
Day:Integer;
begin
     BDat:=DateToInt(Sdat.Text);
     BMon:=(BDat Mod 10000) Div 100-1;
     YQt:=BDat Div 10000;
     Day:=(BDat Mod 100);
     MQt:=StrToInt(FQt.Text);
     GP:=FarToCurr(FGP.Text);
     IF (Gp = 0)Or(BDat = 0) Then
     Begin
       ShowMessage('„»·€ Ì«  «—ÌŒ ‘—Ê⁄ ﬁ”ÿ „‘Œ’ ‰Ì” ');
       Exit;
     End;
     For I:=1 To MQt Do
     Begin
       Frodm.Aghs.Append;
       Frodm.AghsGprice.Value:=Gp;
       Frodm.AghsNam.Value:=FAccNam.Text;
       Frodm.AghsPayed.Value:=False;
       Frodm.AghsRNo.Value:=0;
       Frodm.AghsRDat.Value:=Fardate;
       BMon:=BMon+1;
       Frodm.AghsDat.Value:=YQt*10000+BMon*100+Day;
       Frodm.Aghs.Post;
       IF BMon = 12 Then
       Begin
         BMon:=0;
         YQt:=YQt+1;
       End;
     End;
     QuickCloseOpen([36]);
     SDat.Text:='13  /  /  ';
end;

procedure TFAghs.FGPKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     FGP.Text :=KeyMult2(Key,FGP.Text);
end;

procedure TFAghs.FGPExit(Sender: TObject);
Var
GP:Currency;
begin
     FGP.Text:=StrToFCurr(FGP.Text);
     Gp:=FarToCurr(FGP.Text);
     FSum.Text:=CurrToFar(Gp*StrToInt(FQt.Text));
     FDif.Text:=CurrToFar(FarToCurr(FSum.Text)-FarToCurr(SPrice.Text));
     FPrice.Text:=CurrToFar(FarToCurr(FSum.Text)+FarToCurr(CPrice.Text));
end;

procedure TFAghs.KPriceExit(Sender: TObject);
begin
     KPrice.Text:=StrToFCurr(KPrice.Text);
end;

procedure TFAghs.KPriceKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     KPrice.Text :=KeyMult2(Key,KPrice.Text);
end;

procedure TFAghs.CPriceExit(Sender: TObject);
begin
     CPrice.Text:=StrToFCurr(CPrice.Text);
     SPrice.Text:=CurrToFar(FarToCurr(KPrice.Text)-FarToCurr(CPrice.Text));
end;

procedure TFAghs.CPriceKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     CPrice.Text :=KeyMult2(Key,CPrice.Text);
end;

procedure TFAghs.BShowClick(Sender: TObject);
begin
     SPrice.Text:=CurrToFar(FarToCurr(KPrice.Text)-FarToCurr(CPrice.Text));
     If FQt.Text = '' Then
     Begin
      FQt.SetFocus;
      Exit;
     End;
     If FRate.Text = '' Then
     Begin
      FRate.SetFocus;
      Exit;
     End;
     FGPEnter(Sender);
     FGPExit(Sender);
end;

end.
