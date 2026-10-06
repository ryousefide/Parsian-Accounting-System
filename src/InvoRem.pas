unit InvoRem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls;

type
  TFFacRem = class(TForm)
    Label1: TLabel;
    FNo: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    FPrice: TEdit;
    Sb1: TStatusBar;
    Bsave: TButton;
    Bexit: TButton;
    Bevel1: TBevel;
    Bevel2: TBevel;
    cbPrint: TCheckBox;
    procedure FNoKeyPress(Sender: TObject; var Key: Char);
    procedure FPriceKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FNoExit(Sender: TObject);
    procedure FPriceExit(Sender: TObject);
    procedure BsaveClick(Sender: TObject);
    procedure BexitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BprintClick(Sender: TObject);
  private
    { Private declarations }
    No:Integer;
    Kod,bedKod:Real;
    Nam:String;
    Perm:Boolean;
    FacRem,AcRem,Price:Currency;
    Function InvoRem(InvoNo:Integer):Currency;
    Procedure Statue;
    Procedure InvoUpDate;
    Procedure InvoAcBill;

  public
    { Public declarations }
  end;

var
  FFacRem: TFFacRem;

implementation

uses FrooshDM, Routins, ProVar, Invoice, RepResid,Db;

{$R *.DFM}

//Privates
Function TFFacRem.InvoRem(InvoNo:Integer):Currency;
Var
Dat:Integer;
begin
     Result:=0;
     IF Frodm.Invo.Locate('No',InvoNo,[loCaseInsensitive]) Then
     Begin
       Perm:=Frodm.InvoPerm.Value;
       Nam:=Frodm.InvoNam.Value;
       Result:=Frodm.InvoPrem.Value;
       Kod:=AccKod(Nam);
       IF Kod >0 Then AcRem:=AcRemain(Kod,Dat);
     End Else
     Begin
       Beep;
       ShowMessage('»« «Ì‰ ‘„«—Â ›«ﬂ Ê— „ÊÃÊœ ‰Ì” ');
       FNo.SetFocus;
       Exit;
     End;
     If Not Perm Then
     Begin
       Beep;
       ShowMessage('›«ﬂ Ê— »” Â ‰‘œÂ «” ');
       FNo.SetFocus;
       CreatingForm(TFInvoice,'FInvoice',FInvoice);
     End;
end;

Procedure TFFacRem.Statue;
begin
     Sb1.Panels[3].Text :=Nam;
     Sb1.Panels[1].Text:=CurrToFar(AcRem);
     Sb1.Panels[0].Text:=CurrToFar(FacRem);
     IF Kod = 0 Then
     Begin
       Frodm.AutoBill.FindKey (['CF']);
       Sb1.Panels[2].Text:=AccNam(Frodm.AutoBillBesKod.Value);
     End Else
       Sb1.Panels[2].Text:=AccNam(Kod);
end;

Procedure TFFacRem.InvoUpDate;
begin
     If Frodm.Invo.Locate('No',No,[loCaseInsensitive]) Then
     Begin
       Frodm.Invo.Edit;
       Frodm.InvoPpay.Value:=Frodm.InvoPpay.Value +Price;
       Frodm.InvoPrem.Value:=Frodm.InvoPrem.Value -Price;
       Frodm.Invo.Post;
     End;
end;

Procedure TFFacRem.InvoAcBill;
Var
BesKod:Real;
Str:String;
begin
     Str:=' œ—Ì«›  „«‰œÂ ›«ﬂ Ê— ‘„«—Â '+FNo.Text+' »‰«„ '+Nam;
     Frodm.AutoBill.FindKey(['CF']);
     BedKod:=Frodm.AutoBillBehKod.Value;
     BesKod:=Frodm.AutoBillBesKod.Value;
     If Kod > 0 Then
        AutoBill(True,Kod,BedKod,Price,Str,'',0,2,0)
     Else
        AutoBill(True,BesKod,BedKod,Price,Str,'',0,2,0);
end;
//Privates Ended

procedure TFFacRem.FormCreate(Sender: TObject);
begin
     Set_Forms(FFacRem);
     cbPrint.Checked:=True;
end;

procedure TFFacRem.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFFacRem.FormKeyPress(Sender: TObject; var Key: Char);
begin
     IF Key = #13 Then
     Begin
       Key :=#0;
       FFacRem.SelectNext(Sender As TWinControl,True,True);
     End;
end;


procedure TFFacRem.FNoKeyPress(Sender: TObject; var Key: Char);
begin
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;
     FormKeyPress(Sender,Key);
end;

procedure TFFacRem.FNoExit(Sender: TObject);
begin
     If FNo.Text = '' Then Exit;
     No:=StrToInt(FNo.Text);
     FacRem:=InvoRem(No);
     Statue;
end;

procedure TFFacRem.FPriceKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     FPrice.Text:=KeyMult2(Key,FPrice.Text);
end;

procedure TFFacRem.FPriceExit(Sender: TObject);
begin
     FPrice.Text:=StrToFCurr(FPrice.Text);
     Price:=FarToCurr(FPrice.Text);
     If Price > FacRem Then
     Begin
       Beep;
       ShowMessage('„«‰œÂ ›«ﬂ Ê— ﬂ„ — «” ');
       Price:=FacRem;
       FPrice.Text:=CurrToFar(Price);
       FPrice.SetFocus;
     End;
end;

procedure TFFacRem.BsaveClick(Sender: TObject);
begin
     If (FNo.Text='')Or(FPrice.Text='') Then
     Begin
       Beep;
       ShowMessage('«ÿ·«⁄«  ﬂ«›Ì ‰Ì” ‰œ');
       Exit;
     End;
     Screen.Cursor:=crHourGlass;
     InvoAcBill;
     InvoUpDate;
     Beep;
     Screen.Cursor:=crDefault;
     QuickCloseOpen([89,331,0]);
     If cbPrint.Checked Then BprintClick(Sender);
     FNo.Text:='';
     FPrice.Text:='';
end;

procedure TFFacRem.BexitClick(Sender: TObject);
begin
     FFacRem.Close;
end;

procedure TFFacRem.BprintClick(Sender: TObject);
begin
     CreatingForm(TqrResid,'qrResid',qrResid);
     Set_Sys_Enviroment;
     qrResid.qrTitle.Caption:='ﬁ»÷ œ—Ì«›  ‰ﬁ‹‹‹‹œÌ';
     qrResid.qrDat.Caption:=IntToDate(Fardate);
     qrResid.qrNo.Caption:=IntToStr(LastBillNo+1);
     qrResid.qrPrice.Caption:=FPrice.Text;
     qrResid.qrBes.Caption:=Sb1.Panels[2].Text;
     qrResid.qrBed.Caption:=AccNam(BedKod);//BedKod.Text;
     qrResid.qrDesc.Caption:='œ—Ì«›  »«»  „«‰œÂ ›«ﬂ Ê—‘„«—Â '+FNo.Text+' »‰«„ '+Nam;
     qrResid.Preview;
     qrResid.Destroy;

end;

end.
