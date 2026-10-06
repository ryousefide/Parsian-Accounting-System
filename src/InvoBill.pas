unit InvoBill;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, DBCtrls, Mask;

type
  TFInvoBill = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    FBno: TDBEdit;
    Label3: TLabel;
    FBbank: TDBComboBox;
    Label4: TLabel;
    FBkod: TDBEdit;
    Label5: TLabel;
    FPbill: TDBEdit;
    Bevel1: TBevel;
    Bsave: TButton;
    Bprev: TButton;
    Bexit: TButton;
    Bevel2: TBevel;
    Dat: TMaskEdit;
    FShar: TDBCheckBox;
    BNext: TButton;
    Bdel: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BsaveClick(Sender: TObject);
    procedure FPbillKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BprevClick(Sender: TObject);
    procedure BexitClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FSharKeyPress(Sender: TObject; var Key: Char);
    procedure DatExit(Sender: TObject);
    procedure DatEnter(Sender: TObject);
    procedure FPbillEnter(Sender: TObject);
    procedure BNextClick(Sender: TObject);
    procedure BdelClick(Sender: TObject);
  private
    { Private declarations }
    Function BillSum(No:Integer):Currency;
  public
    { Public declarations }
    Price:Currency;
    AccKod:Real;
  end;

var
  FInvoBill: TFInvoBill;

implementation

uses FrooshDM, ProVar, Routins, Db;

{$R *.DFM}

Function TFInvoBill.BillSum(No:Integer):Currency;
begin
     Qu.SQL.Clear;
     Qu.SQL.Add('SELECT Sum(PBill) FROM Rcheq R WHERE R."No" = '+IntToStr(No));
     Qu.Open;
     Result:=Qu.Fields[0].AsCurrency;
     Qu.Close;
end;

procedure TFInvoBill.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFInvoBill.FormCreate(Sender: TObject);
begin
     Set_Forms(FInvoBill);
     Fill_Comb(Frodm.Banks,'BNam',FBBank.Items);
     Price:=0;
     Frodm.Rcheq.Filter:=' No = '+IntToStr(Frodm.InvoNo.Value);
     Frodm.Rcheq.Filtered:=True;
     Frodm.Rcheq.Last;
     Dat.Text:=IntToDate(Fardate);
     Frodm.Rcheq.Append;
end;

procedure TFInvoBill.BsaveClick(Sender: TObject);
begin
     Frodm.RcheqBdat.Value :=DateToInt(Dat.Text);
     Frodm.RcheqReckod.Value :=False;
     Frodm.RcheqKeler.Value :=False;
     Frodm.RcheqReject.Value :=False;
     Frodm.RcheqAccKod.Value :=AccKod;
     FroDM.RcheqRecDat.Value:=FarDate;
     FroDM.RcheqNo.Value:=Frodm.InvoNo.Value;
     FroDM.RcheqDesc.Value:='ÏÑíÇÝÊí ÇÒÝÇßÊæÑÔãÇÑå'+IntToStr(Frodm.InvoNo.Value);
     FroDM.Rcheq.Post;
     Price:=Price+Frodm.RcheqPbill.Value;
     Frodm.Rcheq.Append;
     Dat.SetFocus;
end;

procedure TFInvoBill.FPbillEnter(Sender: TObject);
begin
     Frodm.RcheqShar.Value:=False;
end;

procedure TFInvoBill.FPbillKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     KeyMult(Key,FPbill);
end;

procedure TFInvoBill.BprevClick(Sender: TObject);
begin
     If Frodm.Rcheq.State = dsInsert Then Frodm.Rcheq.Cancel Else Frodm.Rcheq.Prior;
     BPrev.Enabled :=Not(Frodm.Rcheq.Bof);
     Dat.Text:=IntToDate(Frodm.RcheqBdat.Value);
     Frodm.Rcheq.Edit;
end;

procedure TFInvoBill.BNextClick(Sender: TObject);
begin
     Frodm.Rcheq.Next;
     Dat.Text:=IntToDate(Frodm.RcheqBdat.Value);
     If Frodm.Rcheq.Eof Then
     Begin
      Frodm.Rcheq.Append;
      Dat.SetFocus;
     End Else
      Frodm.Rcheq.Edit;
     BPrev.Enabled :=Not(Frodm.Rcheq.Bof);
end;

procedure TFInvoBill.BexitClick(Sender: TObject);
begin
     Frodm.Rcheq.Cancel;
     Frodm.Rcheq.Filtered:=False;
     Price:=0;
     FroDM.InvoPCheq.Value:=BillSum(Frodm.InvoNo.Value);
     FroDM.InvoPrem.Value  :=FroDM.InvoPnet.Value -FroDM.InvoPpay.Value -
     FroDM.InvoPCheq.Value;
     FInvoBill.Close;
end;

procedure TFInvoBill.FormKeyPress(Sender: TObject; var Key: Char);
begin
     If Key= #13 Then
     Begin
       Key:=#0;
       FInvoBill.SelectNext(Sender as TWinControl,True,True);
     End;
end;

procedure TFInvoBill.FSharKeyPress(Sender: TObject; var Key: Char);
begin
     If Frodm.Rcheq.State = dsInsert Then Enter_Focus(Key,Bsave) Else
      FormKeyPress(Sender,Key);
end;

procedure TFInvoBill.DatExit(Sender: TObject);
begin
     SetMaskText(Dat);
     If(Not Date_Check(Dat.Text))And(DateToInt(Dat.Text)>0) Then Dat.SetFocus;
end;

procedure TFInvoBill.DatEnter(Sender: TObject);
begin
     GetMaskText(Dat);
end;

procedure TFInvoBill.BdelClick(Sender: TObject);
begin
     Frodm.Rcheq.Delete;
     Frodm.Rcheq.Edit;
     Dat.SetFocus;
end;

end.
