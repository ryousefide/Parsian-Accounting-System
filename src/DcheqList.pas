unit DcheqList;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, Mask, ExtCtrls, Db, DBTables, Buttons, Menus,
  DBCtrls;

type
  TFDCheqList = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Dat1: TMaskEdit;
    Dat2: TMaskEdit;
    DGrid: TDBGrid;
    Fpayed: TEdit;
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
    rgShar: TRadioGroup;
    Label4: TLabel;
    Label7: TLabel;
    AcNam: TComboBox;
    Label8: TLabel;
    Label9: TLabel;
    PAcNam: TComboBox;
    DQu: TQuery;
    DQuBdat: TIntegerField;
    DQuRecDat: TIntegerField;
    DQuBno: TStringField;
    DQuBank: TStringField;
    DQuBkod: TStringField;
    DQuPbill: TCurrencyField;
    DQuDesc: TStringField;
    DQuDpay: TStringField;
    DQuReckod: TBooleanField;
    DQuAccKod: TFloatField;
    DQuAcNam: TStringField;
    DQuPAccKod: TFloatField;
    DQuPacNam: TStringField;
    DQuKeler: TBooleanField;
    DQuJari: TStringField;
    DQuReject: TBooleanField;
    DQuShar: TBooleanField;
    Ds: TDataSource;
    RDat1: TMaskEdit;
    RDat2: TMaskEdit;
    Label10: TLabel;
    FJari: TComboBox;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    KDat: TMaskEdit;
    Label11: TLabel;
    FCnt: TEdit;
    Label12: TLabel;
    Dat: TEdit;
    DQuNo: TIntegerField;
    DQuRBno: TIntegerField;
    DQuCost: TStringField;
    DQuCkod: TIntegerField;
    Label13: TLabel;
    FCKod: TDBLookupComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BshowClick(Sender: TObject);
    procedure BexitClick(Sender: TObject);
    procedure NextTab(Sender: TObject; var Key: Char);
    procedure DGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BprintClick(Sender: TObject);
    procedure SPriceKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SPriceExit(Sender: TObject);
    procedure EPriceExit(Sender: TObject);
    procedure EPriceKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Dat1Enter(Sender: TObject);
    procedure Dat1Exit(Sender: TObject);
    procedure Dat2Enter(Sender: TObject);
    procedure Dat2Exit(Sender: TObject);
    procedure SPriceKeyPress(Sender: TObject; var Key: Char);
    procedure DGridKeyPress(Sender: TObject; var Key: Char);
    procedure DGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure RDat1Enter(Sender: TObject);
    procedure RDat1Exit(Sender: TObject);
    procedure RDat2Enter(Sender: TObject);
    procedure RDat2Exit(Sender: TObject);
    procedure KDatEnter(Sender: TObject);
    procedure KDatExit(Sender: TObject);
    procedure AcNamKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FCKodDropDown(Sender: TObject);
    procedure FCKodKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    Filt:String;
    St:String;
    Cnt:Integer;
    Function Make_Filter:String;
    Function CheqSum:Currency;
    Procedure PrintText;
    Function GetRas:String;
  public
    { Public declarations }
  end;

var
  FDCheqList: TFDCheqList;

implementation

uses Routins, FrooshDM, ProVar, DchListRep, CRoutins;

{$R *.DFM}

Function TFDCheqList.Make_Filter:String;
Var
Str:String;
I:Integer;
begin
     Str:='';
     I:=DateToInt(Dat1.Text);
     If I>0 Then Str:='Bdat >= '+IntToStr(I);
     I:=DateToInt(Dat2.Text);
     If I>0 Then Str:=Str+' and Bdat <= '+IntToStr(I);
     I:=DateToInt(RDat1.Text);
     If I>0 Then Str:=Str+' and RecDat >= '+IntToStr(I);
     I:=DateToInt(RDat2.Text);
     If I>0 Then Str:=Str+' and RecDat <= '+IntToStr(I);
     If SPrice.Text > '' Then Str:=Str+' and PBill >= '+CurrToStr(FarToCurr(SPrice.Text));
     If EPrice.Text > '' Then Str:=Str+' and PBill <= '+CurrToStr(FarToCurr(EPrice.Text));
     If AcNam.Text > ''  Then Str:=Str+' and Acckod = '+FloatToStr(AccKod(AcNam.Text));
     If PAcNam.Text > ''  Then Str:=Str+' and PAcckod = '+FloatToStr(AccKod(PAcNam.Text));
     Case rgShar.ItemIndex of
     0: Str:=Str+' and Shar = True';
     1: Str:=Str+' and Shar = False';
     End;
     Case rgCheq.ItemIndex of
     0: Str:=Str+' and Reject = 1';
     1: Str:=Str+' and RecKod = 1';
     2: Str:=Str+' and PAccKod > 0';
     3: Str:=Str+' and RecKod = 0';
     4: Str:=Str+' and Keler = 1';
     5: Str:=Str+' and RecKod = 0 and Keler = 0';
     End;
     If FJari.Text > '' Then Str:=Str+' and Jari ='+#39+FJari.Text+#39;
     I:=DateToInt(KDat.Text);
     If (I>0)And(rgCheq.ItemIndex In[2,4]) Then Str:=Str+' and Pdat = '+IntToStr(I);
     If FCkod.KeyValue <>Null Then Str:=Str+' and Ckod='+IntToStr(Fckod.KeyValue);
     If Pos(' and',Str) = 1 Then Delete(Str,1,4);
     Result:=Str;
end;

Function TFDCheqList.CheqSum:Currency;
begin
     Qu.Sql.Clear;
     Qu.Sql.Add('SELECT SUM(PBILL),Count(BNo)');
     Qu.Sql.Add('FROM RCHEQ R');
     If Filt > '' Then Qu.SQL.Add('WHERE '+Filt);
     Qu.Active :=True;
     If Qu.Fields[0].Value > 0 Then  Result:=Qu.Fields[0].Value Else Result:=0;
     Cnt:=Qu.Fields[1].AsInteger;
     FCnt.Text:=Qu.Fields[1].AsString;
     Qu.Active :=False;
     FPayed.Text :=CurrToFar(Result);
     Dat.Text:=GetRas;
end;

Procedure TFDCheqList.PrintText;
begin
     RepDchList.SDat.Caption:=Dat1.Text;
     RepDchList.EDat.Caption:=Dat2.Text;
     RepDchList.SPrice.Caption:=SPrice.Text;
     RepDchList.EPrice.Caption:=EPrice.Text;
     RepDchList.Acc.Caption:=AcNam.Text;
     RepDchList.Pacc.Caption:=PAcNam.Text;
     RepDchList.Shar.Caption:= rgShar.Items.Strings[rgShar.ItemIndex];
     RepDchList.Statue.Caption:=rgCheq.Items.Strings[rgCheq.ItemIndex];
     RepDchList.Dat.Caption :=IntToDate(Fardate);
     RepDchList.Dsum.Caption:=FPayed.Text;
end;

Function TFDCheqList.GetRas:String;
Var
BY,BM,BD,Dat:Integer;
I:Integer;
Days:Integer;
begin
 Result:='';
 If DQu.RecordCount = 0 Then Exit;
 DGrid.DataSource:=Nil;
 DQu.First;
 Dat:=DQuBDat.AsInteger;
 BY:=Dat Div 10000;
 BM:=(Dat Div 100)Mod 100;
 BD:=Dat Mod 100;
 Days:=0;
 For I:=1 To DQu.RecordCount Do
 Begin
  Days:=Days+DayDistance(DQuBDat.AsInteger,BY,BM,BD);
  DQu.Next;
 End;
 Days:=Days Div DQu.RecordCount;
 DQu.First;
 BY:=Days Div 365+BY;
 BM:=(Days Mod 365)Div 30+BM;
 BD:=(Days Mod 365)Mod 30+BD;
 If BD >30 Then
 Begin
  BD:=BD-30;
  BM:=BM+1;
 End;
 If BM >12 Then
 Begin
  BM:=BM-12;
  BY:=BY+1;
 End;
 Dat:=By*10000+BM*100+BD;
 Result:=IntToDate(Dat);
 DGrid.DataSource:=Ds;
end;

procedure TFDCheqList.FormCreate(Sender: TObject);
begin
     Set_Forms(FDCheqList);
     DQu.DataBaseName:=CurrDb;
     Fill_Comb(Frodm.RRes,'AcNam',AcNam.Items);
     Fill_Comb(Frodm.RPay,'AcNam',PAcNam.Items);
//     AcNam.Items.Assign(AcList);
//     PAcNam.Items.Assign(AcList);
     Fill_Comb(Frodm.JariNam,'Nam',FJari.Items);
end;

procedure TFDCheqList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Frodm.Rcheq.Filtered:=False;
     Action:=caFree;
end;

procedure TFDCheqList.BshowClick(Sender: TObject);
begin
     DQu.Close;
     DQu.SQL.Clear;
     Filt:=Make_Filter;
     DQu.SQL.Add('SELECT * FROM RCheq R');
     If Filt > '' Then DQu.SQL.Add('WHERE '+Filt);
     DQu.SQL.Add('ORDER BY Bdat ');
     Dqu.Open;
     CheqSum;
     Filt:='';
end;

procedure TFDCheqList.BexitClick(Sender: TObject);
begin
     FDcheqList.Close;
end;

procedure TFDCheqList.NextTab(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
       Key:=#0;
       FDcheqList.SelectNext(Sender As TWinControl,True,True);
     End;
end;

procedure TFDCheqList.DGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Shift =[ssCtrl] Then Bshow.SetFocus;
     If Shift =[ssCtrl]+[ssShift] Then rgCheq.SetFocus;
end;

procedure TFDCheqList.BprintClick(Sender: TObject);
begin
     CreatingForm(TRepDchList,'RepDchList',RepDchList);
     Set_Sys_Enviroment;
     PrintText;
     RepDchList.Preview;
     RepDchList.Destroy;
end;

procedure TFDCheqList.SPriceKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     SPrice.Text :=KeyMult2(Key,SPrice.Text);
end;

procedure TFDCheqList.SPriceKeyPress(Sender: TObject; var Key: Char);
begin
     NextTab(Sender,Key);
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;
end;

procedure TFDCheqList.SPriceExit(Sender: TObject);
begin
     SPrice.Text:=StrToFCurr(SPrice.Text);
end;

procedure TFDCheqList.EPriceExit(Sender: TObject);
begin
     EPrice.Text:=StrToFCurr(EPrice.Text);
end;

procedure TFDCheqList.EPriceKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     EPrice.Text :=KeyMult2(Key,EPrice.Text);
end;

procedure TFDCheqList.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key = VK_F3 Then BshowClick(Sender);
end;

procedure TFDCheqList.Dat1Enter(Sender: TObject);
begin
     GetMaskText(Dat1);
end;

procedure TFDCheqList.Dat1Exit(Sender: TObject);
begin
     SetMaskText(Dat1);
     If(Not Date_Check(Dat1.Text))And(DateToInt(Dat1.Text)>0)Then Dat1.SetFocus;
end;

procedure TFDCheqList.Dat2Enter(Sender: TObject);
begin
     GetMaskText(Dat2);
end;

procedure TFDCheqList.Dat2Exit(Sender: TObject);
begin
     SetMaskText(Dat2);
     If(Not Date_Check(Dat2.Text))And(DateToInt(Dat2.Text)>0)Then Dat2.SetFocus;

end;

procedure TFDCheqList.DGridKeyPress(Sender: TObject; var Key: Char);
begin
     GMove(DGrid,Frodm.RCheq);
end;

procedure TFDCheqList.DGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  DrawRect: TRect;
begin
     If DquRecKod.Value = False Then DGrid.Canvas.Font.Color := clRed;
     If DquKeler.Value = True Then DGrid.Canvas.Font.Color := clBlue;
     If DquReject.Value  Then DGrid.Canvas.Brush.Color:=clSilver;
     DGrid.DefaultDrawColumnCell(Rect,DataCol,Column,State);
    if (Column.Field.FieldName ='Ckod' ) then
    Begin
     DrawRect:=Rect;
     Dgrid.Canvas.FillRect(DrawRect);
     If Not Column.Field.IsNull Then
     Dgrid.Canvas.Textout(DrawRect.Left+4,DrawRect.Top,CentName(Column.Field.Value));
    End;
end;

procedure TFDCheqList.RDat1Enter(Sender: TObject);
begin
     GetMaskText(RDat1);
end;

procedure TFDCheqList.RDat1Exit(Sender: TObject);
begin
     SetMaskText(RDat1);
     If(Not Date_Check(RDat1.Text))And(DateToInt(RDat1.Text)>0)Then RDat1.SetFocus;

end;

procedure TFDCheqList.RDat2Enter(Sender: TObject);
begin
     GetMaskText(RDat2);
end;

procedure TFDCheqList.RDat2Exit(Sender: TObject);
begin
     SetMaskText(RDat2);
     If(Not Date_Check(RDat2.Text))And(DateToInt(RDat2.Text)>0)Then RDat2.SetFocus;
end;

procedure TFDCheqList.KDatEnter(Sender: TObject);
begin
     GetMaskText(KDat);
end;

procedure TFDCheqList.KDatExit(Sender: TObject);
begin
     SetMaskText(KDat);
     If(Not Date_Check(KDat.Text))And(DateToInt(KDat.Text)>0)Then KDat.SetFocus;
end;

procedure TFDCheqList.AcNamKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetAccountCombo(Sender,Key);
end;

procedure TFDCheqList.FCKodDropDown(Sender: TObject);
begin
     FCkod.KeyValue:=Null;
end;

procedure TFDCheqList.FCKodKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetCentLookup(Sender,Key);
     BshowClick(Sender);
end;

end.
