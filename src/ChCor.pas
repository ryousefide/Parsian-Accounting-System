unit ChCor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, DBCtrls, Mask;

type
  TFChCor = class(TForm)
    rgDataSet: TRadioGroup;
    Label1: TLabel;
    FNo: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    FBNo: TDBText;
    FPBill: TDBText;
    FBDat: TDBText;
    Bevel1: TBevel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Bevel2: TBevel;
    NBNo: TEdit;
    NPrice: TEdit;
    Bsave: TButton;
    Bexit: TButton;
    SDat: TMaskEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure rgDataSetClick(Sender: TObject);
    procedure FNoKeyPress(Sender: TObject; var Key: Char);
    procedure NextTab(Sender: TObject; var Key: Char);
    procedure SDatEnter(Sender: TObject);
    procedure SDatExit(Sender: TObject);
    procedure NPriceExit(Sender: TObject);
    procedure NPriceKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure NPriceKeyPress(Sender: TObject; var Key: Char);
    procedure BsaveClick(Sender: TObject);
    procedure BexitClick(Sender: TObject);
  private
    { Private declarations }
    Price:Currency;
//    Dat:Integer;
    Procedure RCheqUpdate;
    Procedure PCheqUpdate;
  public
    { Public declarations }
  end;

var
  FChCor: TFChCor;

implementation

uses ProVar, Routins, FrooshDM, Converts, Db;

{$R *.DFM}

procedure TFChCor.NextTab(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
       Key:=#0;
       SelectNext(Sender As TWinControl,True,True);
     End;
end;

Procedure TFChCor.RCheqUpdate;
Var
BNo:Integer;
Rec:Boolean;
ChP:Currency;
begin
     Price:=FarToCurr(NPrice.Text);
     BNo:=Frodm.RcheqRBno.Value;
     Rec:=Frodm.RcheqReckod.Value;
     ChP:=Frodm.RcheqPbill.Value;
     If (BNo > 0)Or Rec Then
     Begin
       ShowMessage('ß ÇÒ Çíä ÞÓãÊ ÞÇÈá ÊÛííÑ äíÓÊ');
       Exit;
     End;
     Frodm.Rcheq.Edit;
     If NBNo.Text >'' Then Frodm.RcheqBno.Value:=NBNo.Text;
     If DateToInt(Sdat.Text) > 0 Then Frodm.RcheqBdat.Value:=DateToInt(Sdat.Text);
     If (Price > 0) and (Price <> ChP) Then
     Begin
       Frodm.RcheqPbill.Value:=Price;
       AutoBill(True,7003000000,2001000000,Price-ChP,'ÊÕÍíÍ ß '+Frodm.RcheqBNo.Value,
       Frodm.RcheqBNo.Value,0,10,0,'',0,0,0,DefaultCurr);
       If sBill Then MakeBill('ÓäÏ ÇÕáÇÍ ß ÏÑíÇÝÊí Çæá ÏæÑå');
     end;
    Frodm.Rcheq.Post;
end;

Procedure TFChCor.PCheqUpdate;
Var
BNo:Integer;
Rec:Boolean;
ChP:Currency;
begin
     Price:=FarToCurr(NPrice.Text);
     BNo:=Frodm.PcheqPBno.Value;
     Rec:=Frodm.PcheqPaykod.Value;
     ChP:=Frodm.PcheqPbill.Value;
     If ChP = 0 Then Exit;
     If (BNo > 0)Or Rec Then
     Begin
       ShowMessage('ß ÇÒ Çíä ÞÓãÊ ÞÇÈá ÊÛííÑ äíÓÊ');
       Exit;
     End;
     Frodm.Pcheq.Edit;
//     If NBNo.Text >'' Then Frodm.RcheqBno.Value:=NBNo.Text;
     If DateToInt(Sdat.Text) > 0 Then Frodm.PcheqBdat.Value:=DateToInt(Sdat.Text);
     If (Price > 0) and (Price <> ChP) Then
     Begin
       Frodm.PcheqPbill.Value:=Price;
       AutoBill(True,Frodm.PcheqPkod.Value,7003000000,Price-ChP,'ÊÕÍíÍ ß '+Frodm.PcheqBNo.Value,
       Frodm.PcheqBNo.Value,0,10,0,'',0,0,0,DefaultCurr);
       If sBill Then MakeBill('ÓäÏ ÇÕáÇÍ ß ÑÏÇÎÊí Çæá ÏæÑå');
     end;
    Frodm.Pcheq.Post;
end;

procedure TFChCor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFChCor.FormCreate(Sender: TObject);
begin
     Set_Forms(FChCor);
end;

procedure TFChCor.rgDataSetClick(Sender: TObject);
begin
     Case rgDataSet.ItemIndex of
      0:
        Begin
          FBNo.DataSource:=Frodm.RcheqDs;
          FPBill.DataSource:=Frodm.RcheqDs;
          FBDat.DataSource:=Frodm.RcheqDs;
        End;
      1:
        Begin
          FBNo.DataSource:=Frodm.PcheqDs;
          FPBill.DataSource:=Frodm.PcheqDs;
          FBDat.DataSource:=Frodm.PcheqDs;
        End;
     End;
end;

procedure TFChCor.FNoKeyPress(Sender: TObject; var Key: Char);
begin
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0','/',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;
     IF Key = #13 Then
     Begin
      Key :=#0;
      Case rgDataSet.ItemIndex Of
      0: FroDM.Rcheq.Locate('BNo',FNo.Text,[loCaseInsensitive]);
      1: FroDM.Pcheq.Locate('BNo',FNo.Text,[loCaseInsensitive])
      End;
     End;
end;

procedure TFChCor.SDatEnter(Sender: TObject);
begin
     GetMaskText(SDat);
end;

procedure TFChCor.SDatExit(Sender: TObject);
begin
     SetMaskText(SDat);
     If (Not Date_Check(SDat.Text)) And(DateToInt(SDat.Text)>0) Then SDat.SetFocus;
end;

procedure TFChCor.NPriceExit(Sender: TObject);
begin
     NPrice.Text:=StrToFCurr(NPrice.Text);
end;

procedure TFChCor.NPriceKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     NPrice.Text :=KeyMult2(Key,NPrice.Text);
end;

procedure TFChCor.NPriceKeyPress(Sender: TObject; var Key: Char);
begin
     NextTab(Sender,Key);
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;

end;

procedure TFChCor.BsaveClick(Sender: TObject);
begin
     Case rgDataSet.ItemIndex OF
     0: RcheqUpdate;
     1: PCheqUpdate;
     End;
     NbNo.Text:='';
     NPrice.Text:='';
     Sdat.Text:='13  /  /  ';
end;

procedure TFChCor.BexitClick(Sender: TObject);
begin
     FChCor.Close;
end;

end.
