unit Cheq;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask,Menus;

type
  TCheqSerial = class(TForm)
    Label1: TLabel;
    SSerial: TMaskEdit;
    Label2: TLabel;
    ESerial: TMaskEdit;
    Label3: TLabel;
    Bexit: TButton;
    Bsave: TButton;
    Bevel1: TBevel;
    Bevel2: TBevel;
    FJari: TComboBox;
    procedure BexitClick(Sender: TObject);
    procedure BsaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    Function Availabel(BegNo,EndNo:String):Boolean;
    Procedure InsertCheq(BNo,Jari,Bank,Ctip:String;PKod:Real);
  public
    { Public declarations }
  end;

var
  CheqSerial: TCheqSerial;

implementation

uses FrooshDM, Routins, ProVar;

{$R *.DFM}
Function TCheqSerial.Availabel(BegNo,EndNo:String):Boolean;
begin
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Count(I.BNo) From PCheq I Where I.BNo Between :N1 and :N2');
     Qu.Params[0].Value:=BegNo;
     Qu.Params[1].Value:=EndNo;
     Qu.Open;
     Result:=Qu.Fields[0].Value = 0 ;
     Qu.Close;
end;

Procedure TCheqSerial.InsertCheq(BNo,Jari,Bank,Ctip:String;PKod:Real);
begin
     Qu.SQL.Clear;
     Qu.SQL.Add('Insert into Pcheq(BNo,Jari,Bank,BKod,PKod,PayKod) ');
     Qu.SQL.Add('Values(:n1,:n2,:n3,:n4,:n5,0)');
     Qu.Params[0].Value:=BNo;
     Qu.Params[1].Value:=Jari;
     Qu.Params[2].Value:=Bank;
     Qu.Params[3].Value:=Ctip;
     Qu.Params[4].Value:=PKod;
     Qu.ExecSQL;
end;

procedure TCheqSerial.BexitClick(Sender: TObject);
begin
        cheqSerial.Close;
end;

procedure TCheqSerial.BsaveClick(Sender: TObject);
Const
Warn=' ⁄œ«œ çﬂ Â« »Ì‘ — «“ 50 »—ê «” .«œ«„Â „ÌœÂÌœø';
Var
I,St,En:Integer;
Kod:Real;
Bank,Bkod:String;
begin
     Try
      St:=StrToInt(SSerial.Text);
      En:=StrToInt(ESerial.Text);
    Except
     On EConvertError Do
     Begin
       Beep;
       Application.MessageBox('„›œ«— Ê—ÊœÌ ’ÕÌÕ ‰Ì” ','Â‘œ«—',mb_Ok);
       SSerial.SetFocus;
       Exit;
     End;
    End;
    If (St > En) or (FJari.ItemIndex = -1) Then
    Begin
      Beep;
      ShowMessage('«ÿ·«⁄«  Ê«—œ ‘œÂ ’ÕÌÕ ‰„Ì »«‘œ');
      Exit;
    End;
    If Not Availabel(IntToStr(St),IntToStr(En)) Then
    Begin
     Beep;
     ShowMessage('œ— «Ì‰ „ÕœÊœÂ ﬁ»·« çﬂ „⁄—›Ì ‘œÂ «” ');
     Exit;
    End;
    IF En-St > 50 Then  //
     If MessageDlg(Warn,mtCustom,mbYESNO,-1) = idNo Then Exit;
    Frodm.JariNam.IndexFieldNames:='Nam';
    If Frodm.JariNam.FindKey([Fjari.Text]) Then
    Begin
      Kod:=Frodm.JariNamCheqKod.Value;
      Bank:=Frodm.JariNamBnam.Value;
      BKod:=Frodm.JariNamBkod.Value;
    End Else
    Begin
      Application.MessageBox('Ã«—Ì Ì«›  ‰‘œ','Â‘œ«—',mb_Ok);
      Exit;
    End;
    Frodm.Pcheq.Filter:='';
    Frodm.Pcheq.filtered:=False;
//     InsertCheq(IntToStr(I),FJari.Text,Bank,BKod,Kod);
    For I:=St To En Do
    Begin
     InsertCheq(IntToStr(I),FJari.Text,Bank,BKod,Kod);
    End;
    QuickCloseOpen([7]);
    Sserial.Clear;
    Eserial.Clear;
    Beep;
end;

procedure TCheqSerial.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
     Frodm.Pcheq.Close;
end;

procedure TCheqSerial.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     Frodm.Pcheq.open;
     Fill_Comb(Frodm.JariNam,'Nam',FJari.Items);
end;

procedure TCheqSerial.FormKeyPress(Sender: TObject; var Key: Char);
begin
     IF Key = #13 Then
     Begin
      Key:=#0;
      SelectNext(Sender As TWinControl,True,True);
     End;
end;

end.
