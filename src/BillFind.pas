unit BillFind;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Mask, ExtCtrls, Db;

type
  TFBFind = class(TForm)
    Bevel1: TBevel;
    Label4: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Bevel3: TBevel;
    SDat: TMaskEdit;
    EDat: TMaskEdit;
    SNo: TEdit;
    ENo: TEdit;
    BDo: TButton;
    BExit: TButton;
    Fdesc: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    Scurr: TEdit;
    Ecurr: TEdit;
    rgPerm: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SNoKeyPress(Sender: TObject; var Key: Char);
    procedure ScurrKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EcurrKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BDoClick(Sender: TObject);
    procedure BExitClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SDatExit(Sender: TObject);
    procedure EDatExit(Sender: TObject);
    procedure SDatEnter(Sender: TObject);
    procedure EDatEnter(Sender: TObject);
  private
    { Private declarations }
    Function Make_Filt_String:String;
    Function UnBlanceNo:String;
  public
    { Public declarations }
  end;

var
  FBFind: TFBFind;

implementation

uses FrooshDM, ProVar, Routins, Bill, Converts, Arshiv;

{$R *.DFM}

Function TFBFind.Make_Filt_String :String;
Var
Str:String;
I:Integer;
begin
     Str:='';
     If SNo.Text <> '' Then Str:='No >='+SNo.Text;
     If ENo.Text <> '' Then Str:=Str+' and No <='+ENo.Text;
     I:=DateToInt(SDat.Text);
     If I > 0 Then Str:=Str+' and Dat >= '+IntToStr(I);
     I:=DateToInt(EDat.Text);
     If I > 0 Then Str:=Str+' and Dat <= '+IntToStr(I);
     If SCurr.Text <> '' Then Str:=Str+' and BedSum >='+SCurr.Text;
     If ECurr.Text <> '' Then Str:=Str+' and BedSum <='+ECurr.Text;
     If Fdesc.Text <>'' Then Str:=Str+' and Desc ='+#39+Fdesc.Text+#39;
     Case rgPerm.ItemIndex Of
     0: Str:=Str+' and LPerm = True';
     1: Str:=Str+' and LPerm = False';
     2: Str:=UnBlanceNo;
     End;
     If Pos(' and',Str) = 1 Then Delete(Str,1,4);
     Result:=Str;
end;

Function TFBFind.UnBlanceNo:String;
Var
I:Integer;
begin
     Result:='';
     Qu.SQL.Clear;
     Qu.SQL.Add('SELECT B.No ');
     Qu.SQL.Add('FROM Bill B');
     Qu.SQL.Add('WHERE BedSum <> BesSum');
     Qu.Active :=True;
     Qu.First;
     If Qu.RecordCount = 0 Then
     Begin
      Result:='No = -35000';
      Qu.Close;
      Exit;
     End;
     For I:=1 To Qu.RecordCount Do
     Begin
       Result :=Result+'or No ='+IntToStr(Qu.Fields[0].AsInteger);
       Qu.Next;
     End;
     Qu.Active :=False;
     Delete(Result,1,2);
     If Result = '' Then Result:='No = 0 ';
end;

procedure TFBFind.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     SDat.Text:=Stdate;
     EDat.Text:=EnDate;
end;

procedure TFBFind.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action :=caFree;
end;

procedure TFBFind.FormKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
       Key:=#0;
       FBFind.SelectNext(Sender As TWinControl,True,True);
     End;

end;

procedure TFBFind.SNoKeyPress(Sender: TObject; var Key: Char);
begin
    If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;
     FormKeyPress(Sender,Key);

end;

procedure TFBFind.ScurrKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Scurr.Text:=KeyMult2(Key,Scurr.Text);
end;

procedure TFBFind.EcurrKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Ecurr.Text:=KeyMult2(Key,Ecurr.Text);
end;

procedure TFBFind.BDoClick(Sender: TObject);
begin
     Frodm.Bill.Filtered := False;
     Frodm.Bill.Filter :=Make_Filt_String;
     Frodm.Bill.Filtered :=True;
     If Frodm.Bill.RecordCount > 0 Then
     Begin
      CreatingForm(TFArsh,'FArsh',FArsh);
      FArsh.tvDay.Visible:=False;
      FArsh.Panel1.Visible:=False;
     End;
{
Var
Arsh:TFArsh;
     Begin
      Arsh:=TFArsh.Create(Application);
      With Arsh Do
      Try
       FormStyle:=fsNormal;
       Visible:=False;
       BorderStyle:=bsSizeAble;
       tvDay.Visible:=False;
       Repaint;
       ShowModal;
      Finally
       Frodm.Bill.Filter :='';
       Frodm.Bill.Filtered :=False;
       Frodm.Bill.Last;
       Free;
      End;
      //
     End; CreatingForm(TFBill,'FBill',FBill);}
end;

procedure TFBFind.BExitClick(Sender: TObject);
begin
     Frodm.Bill.Filtered := False;
     FBFind.Close;
end;

procedure TFBFind.FormDestroy(Sender: TObject);
begin
     Frodm.Bill.Filtered := False;
end;

procedure TFBFind.SDatEnter(Sender: TObject);
begin
     GetMaskText(SDat);
end;

procedure TFBFind.SDatExit(Sender: TObject);
begin
     SetMaskText(SDat);
     If(Not Date_Check(SDat.Text))And(DateToInt(SDat.Text)>0)Then SDat.SetFocus;
end;

procedure TFBFind.EDatEnter(Sender: TObject);
begin
     GetMaskText(EDat);
end;

procedure TFBFind.EDatExit(Sender: TObject);
begin
     SetMaskText(EDat);
     If(Not Date_Check(EDat.Text))And(DateToInt(EDat.Text)>0)Then EDat.SetFocus;
end;

end.
