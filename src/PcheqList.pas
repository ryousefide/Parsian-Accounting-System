unit PcheqList;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, Mask, ExtCtrls, Db, DBTables, Buttons;

type
  TFPCheqList = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Dat1: TMaskEdit;
    Dat2: TMaskEdit;
    PGrid: TDBGrid;
    Fpayed: TEdit;
    Jari: TComboBox;
    Label4: TLabel;
    Bshow: TBitBtn;
    Bexit: TButton;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bprint: TButton;
    Label5: TLabel;
    Label6: TLabel;
    SPrice: TEdit;
    EPrice: TEdit;
    rgCheq: TRadioGroup;
    Label7: TLabel;
    Label8: TLabel;
    Sserial: TEdit;
    Eserial: TEdit;
    AcNam: TComboBox;
    Label9: TLabel;
    PQu: TQuery;
    Ds: TDataSource;
    PQuBno: TStringField;
    PQuBdat: TIntegerField;
    PQuPaydat: TIntegerField;
    PQuBank: TStringField;
    PQuBkod: TStringField;
    PQuJari: TStringField;
    PQuPbill: TCurrencyField;
    PQuPaykod: TBooleanField;
    PQuDesc: TStringField;
    PQuAcckod: TFloatField;
    PQuAcnam: TStringField;
    PQuPkod: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BshowClick(Sender: TObject);
    procedure BexitClick(Sender: TObject);
    procedure NextTab(Sender: TObject; var Key: Char);
    procedure PGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BprintClick(Sender: TObject);
    procedure SPriceKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EPriceKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SPriceExit(Sender: TObject);
    procedure EPriceExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Dat1Enter(Sender: TObject);
    procedure Dat1Exit(Sender: TObject);
    procedure Dat2Enter(Sender: TObject);
    procedure Dat2Exit(Sender: TObject);
    procedure PGridKeyPress(Sender: TObject; var Key: Char);
    procedure PGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure AcNamKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    Filt:String;
    Function Make_Filter:String;
    Function CheqSum:Currency;
    Procedure PrintText;
  public
    { Public declarations }
  end;

var
  FPCheqList: TFPCheqList;

implementation

uses Routins, FrooshDM, ProVar, PchListRep;

{$R *.DFM}

Function TFPCheqList.Make_Filter:String;
Var
Str:String;
I:Integer;
begin
     Str:='';
     I:=DateToInt(Dat1.Text);
     If I>0 Then Str:='Bdat >= '+IntToStr(I);
     I:=DateToInt(Dat2.Text);
     If I>0 Then Str:=Str+' and Bdat <= '+IntToStr(I);
     If Jari.Text >'' Then Str:=Str+' and Jari ='+#39+Jari.Text+#39;
     If SPrice.Text > '' Then Str:=Str+' and Pbill >= '+CurrToStr(FarToCurr(SPrice.Text));
     If EPrice.Text > '' Then Str:=Str+' and Pbill <= '+CurrToStr(FarToCurr(EPrice.Text));
     If Sserial.Text >'' Then Str:=Str+' and Bno >= '+#39+Sserial.Text+#39;
     If Eserial.Text >'' Then Str:=Str+' and Bno <= '+#39+Eserial.Text+#39;
     If AcNam.Text > ''  Then Str:=Str+' and Acckod = '+FloatToStr(AccKod(AcNam.Text));
     Case rgCheq.ItemIndex of
      0: Str:=Str+' and PayKod = 1';
      1: Str:=Str+' and PayKod = 0 and PBill > 0 ';
     End;
     If Pos(' and',Str) = 1 Then Delete(Str,1,4);
     Result:=Str;
end;

Function TFPCheqList.CheqSum:Currency;
begin
     Qu.Sql.Clear;
     Qu.Sql.Add('SELECT SUM(PBILL)');
     Qu.Sql.Add('FROM PCHEQ');
     If Filt >'' Then Qu.SQL.Add('WHERE '+Filt);
     Qu.Active :=True;
     If Qu.Fields[0].Value > 0 Then  Result:=Qu.Fields[0].AsCurrency Else Result:=0;
     Qu.Active :=False;
     FPayed.Text :=CurrToFar(Result);
end;

Procedure TFPCheqList.PrintText;
begin
     RepPchList.SDat.Caption:=Dat1.Text;
     RepPchList.EDat.Caption:=Dat2.Text;
     RepPchList.Sserial.Caption:=Sserial.Text;
     RepPchList.ESerial.Caption:=Eserial.Text;
     RepPchList.Jari.Caption:=Jari.Text;
     RepPchList.Acc.Caption:=AcNam.Text;
     RepPchList.Statue.Caption:=rgCheq.Items.Strings[rgCheq.ItemIndex];
     RepPchList.SPrice.Caption:=SPrice.Text;
     RepPchList.EPrice.Caption:=EPrice.Text;
     RepPchList.Dat.Caption :=IntToDate(Fardate);
     RepPchList.Dsum.Caption:=FPayed.Text;
end;

procedure TFPCheqList.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     Fill_Comb(Frodm.JariNam,'Nam',Jari.Items);
     AcNam.Items.Assign(AcList);
     PQu.DataBaseName:=CurrDb;
end;

procedure TFPCheqList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFPCheqList.BshowClick(Sender: TObject);
begin
     PQu.Close;
     PQu.SQL.Clear;
     Filt:=Make_Filter;
     PQu.SQL.Add('SELECT * FROM PCheq');
     If Filt >'' Then PQu.SQL.Add('WHERE '+Filt);
     PQu.SQL.Add('ORDER BY Bdat');
     PQu.Open;
     CheqSum;
end;

procedure TFPCheqList.BexitClick(Sender: TObject);
begin
     FPcheqList.Close;
end;

procedure TFPCheqList.NextTab(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
       Key:=#0;
       FPcheqList.SelectNext(Sender As TWinControl,True,True);
     End;
end;

procedure TFPCheqList.PGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Shift =[ssCtrl] Then Bshow.SetFocus;
     If Shift =[ssCtrl]+[ssShift] Then rgCheq.SetFocus;
end;

procedure TFPCheqList.BprintClick(Sender: TObject);
begin
     CreatingForm(TRepPchList,'RepPchList',RepPchList);
     Set_Sys_Enviroment;
     PrintText;
     RepPchList.Preview;
     RepPchList.Destroy;
end;

procedure TFPCheqList.SPriceKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     SPrice.Text :=KeyMult2(Key,SPrice.Text);
end;

procedure TFPCheqList.EPriceKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     EPrice.Text :=KeyMult2(Key,EPrice.Text);
end;

procedure TFPCheqList.SPriceExit(Sender: TObject);
begin
     SPrice.Text:=StrToFCurr(SPrice.Text);
end;

procedure TFPCheqList.EPriceExit(Sender: TObject);
begin
     EPrice.Text:=StrToFCurr(EPrice.Text);
end;

procedure TFPCheqList.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key = VK_F3 Then BshowClick(Sender);
end;

procedure TFPCheqList.Dat1Enter(Sender: TObject);
begin
     GetMaskText(Dat1);
end;

procedure TFPCheqList.Dat1Exit(Sender: TObject);
begin
     SetMaskText(Dat1);
     IF (Not Date_Check(Dat1.Text))And (DateToInt(Dat1.Text)>0) Then Dat1.SetFocus;
end;

procedure TFPCheqList.Dat2Enter(Sender: TObject);
begin
     GetMaskText(Dat2);
end;

procedure TFPCheqList.Dat2Exit(Sender: TObject);
begin
     SetMaskText(Dat2);
     IF (Not Date_Check(Dat2.Text))And(DateToInt(Dat2.Text)>0) Then Dat2.SetFocus;
end;

procedure TFPCheqList.PGridKeyPress(Sender: TObject; var Key: Char);
begin
     GMove(PGrid,Frodm.Pcheq);
end;

procedure TFPCheqList.PGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
     IF PQuPaykod.Value = False Then PGrid.Canvas.Font.Color := clRed;//Frodm.Pcheq
     PGrid.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TFPCheqList.AcNamKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetAccountCombo(Sender,Key);
end;

end.
