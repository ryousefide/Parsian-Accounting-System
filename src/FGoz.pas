unit FGoz;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ExtCtrls, Db, DBTables;

type
  TFFgoz = class(TForm)
    Teep: TRadioGroup;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    FNo1: TEdit;
    FNo2: TEdit;
    FDat1: TMaskEdit;
    FDat2: TMaskEdit;
    Bshow: TButton;
    Bexit: TButton;
    FNam: TComboBox;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Perm: TRadioGroup;
    BList: TButton;
    FPnet: TEdit;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TeepClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FNo1Exit(Sender: TObject);
    procedure FNo2Exit(Sender: TObject);
    procedure BshowClick(Sender: TObject);
    procedure BexitClick(Sender: TObject);
    procedure BListClick(Sender: TObject);
    procedure FDat1Exit(Sender: TObject);
    procedure FDat2Exit(Sender: TObject);
    procedure FDat1Enter(Sender: TObject);
    procedure FDat2Enter(Sender: TObject);
    procedure FNamKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    Function Make_Filt_String :String;
    Function SQL_Filt_String:String;
    Function Check_Int_Input(Edit:TEdit):Boolean;
  public
    { Public declarations }
  end;

var
  FFgoz: TFFgoz;

implementation

uses FrooshDM, Routins, ProVar, Binvoice, Invoice, PInvoice, RejInvo,
  FacSum, RejBinvo, Converts;

{$R *.DFM}

Var
Table:TTable;


Function TFFgoz.Make_Filt_String :String;
Var
Str:String;
I:Integer;
begin
     Str:='';
     If FNo1.Text <> '' Then Str:='No >='+FNo1.Text;
     If FNo2.Text <> '' Then Str:=Str+' and No <='+FNo2.Text;
     I:=DateToInt(FDat1.Text);
     If I > 0 Then Str:=Str+' and Dat >= '+IntToStr(I);
     I:=DateToInt(FDat2.Text);
     If I > 0 Then Str:=Str+' and Dat <= '+IntToStr(I);
     If FNam.Text <>'' Then Str:=Str+' and Nam ='+#39+FNam.Text+#39;
     If Teep.ItemIndex <> 2 Then
      Case Perm.ItemIndex Of
      0:Str:=Str+' and LPerm = True';
      1:Str:=Str+' and LPerm = False';
      End;
     If StrToIntDef(FPnet.Text,0) > 0 Then Str:=Str+' and Pnet>'+FPnet.Text;
     If Pos(' and',Str) = 1 Then Delete(Str,1,4);
     Result:=Str;
end;

Function TFFgoz.SQL_Filt_String:String;
Var
Str:String;
I:Integer;
begin
     Str:='';
     If FNo1.Text <> '' Then Str:='I.No >='+FNo1.Text;
     If FNo2.Text <> '' Then Str:=Str+' and I.No <='+FNo2.Text;
     I:=DateToInt(FDat1.Text);
     If I > 0 Then Str:=Str+' and Dat >= '+IntToStr(I);
     I:=DateToInt(FDat2.Text);
     If I > 0 Then Str:=Str+' and Dat <= '+IntToStr(I);
     If FNam.Text <>'' Then Str:=Str+' and Nam ='+#39+FNam.Text+#39;
     If Teep.ItemIndex <> 2 Then
      Case Perm.ItemIndex Of
      0:Str:=Str+' and LPerm = True';
      1:Str:=Str+' and LPerm = False';
      End;
     If StrToIntDef(FPnet.Text,0) > 0 Then Str:=Str+' and Pnet>'+FPnet.Text;
     If Pos(' and',Str) = 1 Then Delete(Str,1,4);
     Result:=Str;
end;


Function TFFgoz.Check_Int_Input(Edit:TEdit):Boolean;
begin
     Result:=True;
     If Edit.Text = '' Then Exit;
     Try
       StrToInt(Edit.Text);
     Except
       On EConvertError Do
       Begin
          Edit.Text :='';
          Edit.SetFocus;
          Result:=False;
       End;
     End;
end;

procedure TFFgoz.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Table.Filtered :=False;
     Frodm.Binvo.Filtered :=False;
     Frodm.Invo.Filtered :=False;
     Frodm.RejBinvo.Filtered :=False;
     Frodm.RejInvo.Filtered :=False;
     Frodm.PInvo.Filtered :=False;
     Action:=caFree;
     hOpenFac:=False;
end;

procedure TFFgoz.TeepClick(Sender: TObject);
begin
     Case Teep.ItemIndex Of
       0:Table :=Frodm.Binvo;
       1:Table :=Frodm.Invo;
       2:Table :=Frodm.PInvo;
       3:Table :=Frodm.RejInvo;
       4:Table :=Frodm.RejBinvo;
     End;
end;

procedure TFFgoz.FormKeyPress(Sender: TObject; var Key: Char);
begin
If Key = #13 Then
     Begin
       Key:=#0;
       FFgoz.SelectNext(Sender as TWinControl,True,True);
     End;
end;

procedure TFFgoz.FormCreate(Sender: TObject);
begin
     hOpenFac:=True;
     Set_Forms(Self);
     FNam.Items.Assign(AcList);
     Table:=TTable.Create(Owner);
     Table.DatabaseName :=CurrDb;
     TeepClick(Sender);
end;

procedure TFFgoz.FNo1Exit(Sender: TObject);
begin
     Check_Int_Input(FNo1);
end;

procedure TFFgoz.FNo2Exit(Sender: TObject);
begin
     Check_Int_Input(FNo2);
end;

procedure TFFgoz.BshowClick(Sender: TObject);
begin
     Table.Filter:= Make_Filt_String;
     Table.Filtered:=True;
     Case Teep.ItemIndex Of
      0: CreatingForm(TFBvoice,'FBvoice',FBvoice);
      1: CreatingForm(TFInvoice,'FInvoice',FInvoice);
      2: CreatingForm(TFPInvoice,'FPInvoice',FPInvoice);
      3: CreatingForm(TFRejInvo,'FRejInvo',FRejInvo);
      4: CreatingForm(TFRejBVoice,'FRejBVoice',FRejBVoice);
     End;
end;

procedure TFFgoz.BexitClick(Sender: TObject);
begin
     FFGoz.Close;
end;

procedure TFFgoz.BListClick(Sender: TObject);
Var
St:String;
FFSum:TFFucSum;
begin
//     CreatingForm(TFFucSum,'FFucSum',FFucSum);
     FFsum:=TFFucSum.Create(Owner);
     With FFsum Do
     Try
      FormStyle:=fsNormal;
      BorderStyle:=bsSingle;
      Repaint;
      FQu.DatabaseName:=CurrDb;
      Case Teep.ItemIndex Of
      0: Label1.Caption :='·Ì”  ›«ﬂ Ê—Â«Ì Œ—Ìœ';
      1: Label1.Caption :='·Ì”  ›«ﬂ Ê—Â«Ì ›—Ê‘';
      2: Label1.Caption :='·Ì”  ÅÌ‘ ›«ﬂ Ê— Â«Ì ›—Ê‘';
      3: Label1.Caption :='·Ì”  ›«ﬂ Ê— Â«Ì „—ÃÊ⁄Ì ›—Ê‘';
      4: Label1.Caption :='·Ì”  ›«ﬂ Ê—Â«Ì „—ÃÊ⁄Ì Œ—Ìœ';
      End;
      St:=Make_Filt_String;
      Case Teep.ItemIndex Of
      0: FQu.Fields[6].Destroy;//If FQu.Fields.Count = 10 Then
      4: Begin FQu.Fields[6].Destroy; FQu.Fields[8].Destroy; End;
      1: FQuAdd.Origin:=CurrDb+'.'+Table.TableName+'.Adr';
      2,3:Begin FQuAdd.Origin:=CurrDb+'.'+Table.TableName+'.Adr';
          FQu.Fields[9].Destroy; End;
      End;
      FQu.Close;
      FQu.SQL.Strings[1]:='From '+Table.TableName;
      FQu.Open;
      FQu.Filter:=St;
      FQu.Filtered:=True;
      If Teep.ItemIndex <> 2 Then
      Begin
      Qu.SQL.Clear;
      Qu.SQL.Add('Select Sum(Pnet)');
      Qu.SQL.Add('From '+Table.TableName+' I');
      If St >'' Then Qu.SQL.Add('Where '+SQL_Filt_String);
      Qu.Open;
      SKol.Text:=CurrToFar(Qu.Fields[0].AsCurrency);
      Dat.Text:=GetRas;
      If Teep.ItemIndex=1 Then FPayed.Text:=CurrToFar(GetPaid(SQL_Filt_String));
      Qu.Close;
      End;
      SNo:=FNo1.Text;
      ENo:=FNo2.Text;
      SDat:=FDat1.Text;
      EDat:=FDat2.Text;
      Cust:=FNam.Text;
      ShowModal;
     Finally
      Free;
     End;
end;


procedure TFFgoz.FDat1Exit(Sender: TObject);
begin
     SetMaskText(FDat1);
     If(Not Date_Check(FDat1.Text))And(DateToInt(FDat1.Text)>0) Then FDat1.SetFocus;
end;

procedure TFFgoz.FDat2Exit(Sender: TObject);
begin
     SetMaskText(FDat2);
     If(Not Date_Check(FDat2.Text))And(DateToInt(FDat2.Text)>0) Then FDat2.SetFocus;
end;

procedure TFFgoz.FDat1Enter(Sender: TObject);
begin
     GetMaskText(FDat1);
end;

procedure TFFgoz.FDat2Enter(Sender: TObject);
begin
     GetMaskText(FDat2);
end;

procedure TFFgoz.FNamKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetAccountCombo(Sender,Key);
end;

end.
