unit CarBill;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ExtCtrls, ComCtrls, DBCtrls;

type
  TFCar = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    FNo: TEdit;
    Label3: TLabel;
    FPbill: TDBEdit;
    BDo: TButton;
    Bexit: TButton;
    Label4: TLabel;
    FDesc: TDBEdit;
    Bevel1: TBevel;
    JariKod: TDBComboBox;
    Sb1: TStatusBar;
    Bevel2: TBevel;
    lbFar: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Bprev: TButton;
    Bnext: TButton;
    Bedit: TButton;
    Bdel: TButton;
    Label5: TLabel;
    Dat1: TMaskEdit;
    Label6: TLabel;
    Label7: TLabel;
    FCost: TDBComboBox;
    FCKod: TDBLookupComboBox;
    Label8: TLabel;
    FCtip: TDBComboBox;
    lCurr: TStaticText;
    FEQ: TDBEdit;
    Label13: TLabel;
    procedure BDoClick(Sender: TObject);
    procedure BexitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FPbillKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    Procedure NextTab(Sender:TObject;Var Key:Char);
    procedure FNoKeyPress(Sender: TObject; var Key: Char);
    procedure FPbillChange(Sender: TObject);
    procedure BprevClick(Sender: TObject);
    procedure BnextClick(Sender: TObject);
    procedure BeditClick(Sender: TObject);
    procedure BdelClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Dat1Enter(Sender: TObject);
    procedure Dat1Exit(Sender: TObject);
    procedure FAccNamDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure FEQEnter(Sender: TObject);
    procedure FCKodKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    No:Integer;
    Price:Currency;

    RNo:Integer;
    BNo:Integer;
    BDat:Integer;
    OPrice:Currency;
    CPrice:Currency;
    Rate:Currency;
    MoFlag:Boolean;

    Procedure SetBNo(BNo,No:Integer);
    Procedure FNo_Exit;
    Procedure MakeNew;
  public
    { Public declarations }
  end;

var
  FCar: TFCar;

implementation

uses DbTables,Db, FrooshDM, Routins, ProVar, Invoice, Converts, AcSearch, XPListBox,
  CRoutins;
Const
FTip = 11;
{$R *.DFM}
Procedure TFCar.NextTab(Sender:TObject;Var Key:Char);
begin
     If Key =#13 Then
     Begin
      Key:=#0;
      SelectNext(Sender As TWinControl,True,True);
     End;
end;

Procedure TFCar.FNo_Exit;
begin
     If Not(Frodm.NCar.State =dsBrowse) Then
     Begin
       FNo.Text :=IntToStr(Frodm.NCarNo.Value);
       Exit;
     End;
     RNo:=StrToInt(FNo.Text);
     If Not(Frodm.NCar.Locate('No',RNo,[loCaseInsensitive])) Then MakeNew;
     Dat1.Text:=IntToDate(Frodm.NCarDat.Value);
end;

Procedure TFCar.MakeNew;
begin
     Frodm.NCar.Append;
     Frodm.NCarNo.Value:=RNo;
     Frodm.NCarDat.Value:=Fardate;
     Frodm.NCarCtip.AsString:=DefaultCurr;
     Dat1.Text:=IntToDate(Frodm.NCarDat.Value);
     BNo:=0;
     BDat:=Frodm.NCarDat.Value;
     MoFlag:=True;
end;

Procedure TFCar.SetBNo(BNo,No:Integer);
begin
{     Qu.SQL.Clear;
     Qu.SQl.Add('Update NCar B Set BNo = '+IntToStr(BNo));
     Qu.SQL.Add('Where B.No = '+IntToStr(No));
     Qu.ExecSQL;}
     If BNo = 0 Then Exit;
     If Frodm.NCar.Locate('No',No,[locaseInsensitive]) Then
     Begin
      Frodm.NCar.Edit;
      Frodm.NCarBNo.Value:=BNo;
      Frodm.NCar.Post;
     End;
end;

//End Of Privates
procedure TFCar.BDoClick(Sender: TObject);
Var
Table:TTable;
Rem:Currency;
BesKod,BehKod:Real;
Str:String;
State:Boolean;
NBNo:Integer;
mPrice:Currency;
begin
     If Frodm.NCar.State =dsBrowse Then Exit;
     FNo.SetFocus;
     Price:=Frodm.NCarPrice.Value;
     CPrice:=Frodm.NCarCPrice.Value;
     If (Price = 0)or(JariKod.ItemIndex=-1) and (No = 0)Then
     Begin
       ShowMessage('ÇØáÇÚÇÊ ßÇÝí äíÓÊäÏ');
       MoFlag:=False;
       Exit;
     End;
     Table:=TTable.Create(Self);
     Table.Tag:=2;
     Table.DatabaseName :=CurrDb;
     Table.TableName :='dbo.Jari'+JariKod.Text;
     If Not OpenTable(Table) Then
     Begin
       ShowMessage('ÌÇÑí íÇÝÊ äÔÏ');
       MoFlag:=False;
       Exit;
     End;
     If Frodm.JariNam.FindKey([JariKod.Text]) Then
      If DefaultCurr = Frodm.JariNamBkod.Value Then
       mPrice:=Price Else mPrice:=CPrice;
     Case Frodm.NCar.State Of
     dsInsert:
      Begin
      Table.Last;
      Rem:=Table.FieldByName('Rema').AsCurrency;
      Table.Append;
      Table.FieldByName('Bestan').AsCurrency:=0;
      Table.FieldByName('Bedeh').AsCurrency:=mPrice;
      Table.FieldByName('Dat').AsInteger:=Frodm.NCarDat.Value;//FarDate;
      Table.FieldByName('Serial').AsString:=FNo.Text;
      Table.FieldByName('Rema').AsCurrency:=Rem-mPrice;
      Table.FieldByName('Des').AsString:='˜ÇÑãÒÏ ÈÇä˜í'+'-'+FDesc.Text;
      Table.Post;
      JariRepair(Table);
      End;
     dsEdit:
      Begin
      Table.Filter:='Dat = '+Frodm.NCarDat.AsString+' and Serial ='+Frodm.NCarNo.AsString+
       ' and Bedeh = '+CurrToStr(OPrice);
      Table.Filtered:=True;
      Table.Edit;
      Table.FieldByName('Bestan').AsCurrency:=0;
      Table.FieldByName('Bedeh').AsCurrency:=mPrice;
      Table.FieldByName('Serial').AsString:=FNo.Text;
      Table.FieldByName('Des').AsString:='˜ÇÑãÒÏ ÈÇä˜í'+'-'+FDesc.Text;
      Table.Post;
      Table.Filtered:=False;
      JariRepair(Table);
      End;
     End;
// Accounting Automation Part
     BDat:=Frodm.NCarDat.Value;
     If Frodm.JariNam.FindKey([JariKod.Text]) Then
     Begin
      Frodm.NCar.Post;
      BesKod:=Frodm.JariNamAccKod.Value;
      Frodm.AutoBill.FindKey(['CARMOZ']);
      State:=Frodm.AutoBillStat.Value;
      Behkod:=Frodm.AutoBillBehKod.Value;
      Str:='ßÇÑãÒÏ ÈÇäßí ÇÒ ÌÇÑí'+'  '+JariKod.Text;
      NBNo:=AutoBill(State,BesKod,Behkod,Price,Str,IntToStr(RNo),BNo,FTip,BDat,
      Frodm.NCarCost.AsString,Frodm.NCarCkod.AsInteger,Cprice,Rate,Frodm.NCarCtip.Value);
      If NBNo = BNo Then BillUpdate(BNo) Else
       If sBill Then MakeBill('ÓäÏ ˜ÇÑãÒÏ ÈÇä˜í');
      BNo:=NBNo;
      SetBNO(BNo,RNO);
     End Else
     Begin
      Application.MessageBox('ÇØáÇÚÇÊ ÌÇÑí íÇÝÊ äÔÏ','åÔÏÇÑ',mb_Ok);
      Application.MessageBox('ÇÓäÇÏ ÍÓÇÈÏÇÑí ËÈÊ äÑÏíÏå ÇÓÊ','åÔÏÇÑ',mb_Ok);
      Exit;
     End;
     QuickCloseOpen([6,24,50]);
     Frodm.NCar.Locate('No',RNo,[loCaseInsensitive]);
// End of Accounting Automation Part
     FNo.Text :=IntToStr(RNo);
     Dat1.Text:=IntToDate(Frodm.NCarDat.Value);
     BNo:=0;
     BDat:=0;
     RNo:=0;
     FNo.SetFocus;
     JariKod.Enabled:=True;
     Dat1.Enabled:=True;
     Table.Free;
end;

procedure TFCar.BexitClick(Sender: TObject);
begin
     If Frodm.NCar.State =dsEdit Then Exit;
     Check_State(Frodm.NCar,BDoClick);
     FNo.SetFocus;
     If Not MoFLag Then Exit;
     Close;
end;

procedure TFCar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     FNo.SetFocus;
     Action:=caFree;
     IF Frodm.NCar.State = dsInsert Then Check_State(Frodm.NCar,BDoClick);
     MoFlag:=Frodm.NCar.State = dsBRowse;
     If (Frodm.NCar.State = dsEdit) Or Not MoFlag Then Action :=caNone;
     If Action = caFree Then Frodm.NCar.Close;
end;

procedure TFCar.FPbillKeyPress(Sender: TObject; var Key: Char);
begin
     NextTab(Sender,Key);
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0','-',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;
end;

procedure TFCar.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     Frodm.NCar.Open;
     lbFar.Font:=FFont;
     Label9.Font:=FFont;
     Fill_Comb(Frodm.JariNam,'Nam',JariKod.Items);
     FCost.Items.Assign(CostList);
     FCtip.Items.Assign(CurrList);
     MoFlag:=True;
     Frodm.NCar.Last;
     FNo.Text:=IntToStr(Frodm.NCarNo.Value);
     Dat1.Text:=IntToDate(Frodm.NCarDat.Value);
end;

procedure TFCar.FPbillChange(Sender: TObject);
begin
     lbFar.Caption:=FarsiPrice(Frodm.NCarPrice.Value);
end;

procedure TFCar.FNoKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then FNo_Exit;
     NextTab(Sender,Key);
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;
end;

procedure TFCar.BprevClick(Sender: TObject);
begin
     IF Frodm.NCar.State = dsEdit Then Exit;
     IF Frodm.NCar.State = dsInsert Then
     Begin
      FNo.SetFocus;
      Check_State(Frodm.NCar,BDoClick);
      MoFlag:=Frodm.NCar.State =dsBrowse;
      FNo.Text:=IntToStr(Frodm.NCarNo.Value);
      Dat1.Text:=IntToDate(Frodm.NCarDat.Value);
      Exit;
     End;
     MoFlag:=Frodm.NCar.State =dsBrowse;
     If Not MoFLag Then Exit;
     Frodm.NCar.Prior;
     FNo.Text:=IntToStr(Frodm.NCarNo.Value);
     Dat1.Text:=IntToDate(Frodm.NCarDat.Value);
end;

procedure TFCar.BnextClick(Sender: TObject);
begin
     IF Frodm.NCar.State = dsEdit Then Exit;
     IF Frodm.NCar.State = dsInsert Then
     Begin
      FNo.SetFocus;
      Check_State(Frodm.NCar,BDoClick);
      MoFlag:=Frodm.NCar.State =dsBrowse;
      FNo.Text:=IntToStr(Frodm.NCarNo.Value);
      Dat1.Text:=IntToDate(Frodm.NCarDat.Value);
      Exit;
     End;
     MoFlag:=Frodm.NCar.State =dsBrowse;
     If Not MoFLag Then Exit;
     Frodm.NCar.Next;
     FNo.Text:=IntToStr(Frodm.NCarNo.Value);
     Dat1.Text:=IntToDate(Frodm.NCarDat.Value);
end;

procedure TFCar.BeditClick(Sender: TObject);
begin
     If Not(Frodm.NCar.State = dsBRowse) Then Exit;
     BNo:=Frodm.NCarBNo.Value;
     BDat:=Frodm.NCarDat.Value;
     RNo :=Frodm.NCarNo.Value;
     If Frodm.JariNam.FindKey([JariKod.Text]) Then
      If DefaultCurr = Frodm.JariNamBkod.Value Then
       OPrice:=Frodm.NCarPrice.AsCurrency Else OPrice:=Frodm.NCarCPrice.AsCurrency;
//     OPrice:=Frodm.NCarCPrice.Value;
     JariKod.ItemIndex:=JariKod.Items.IndexOf(JariKod.Text);
     DelBitem(IntToStr(RNo),BNo,FTip);
     Frodm.NCar.Edit;
     FPBill.SetFocus;
     JariKod.Enabled:=False;
     Dat1.Enabled:=False;
end;

procedure TFCar.BdelClick(Sender: TObject);
Var
Table:TTable;
mPrice:Currency;
begin
     If Not(Frodm.NCar.State = dsBRowse) Then Exit;
     If MessageDlg('˜ÇÑãÒÏ ÍÐÝ ÔæÏ¿',mtWarning,mbYesNo,0) = idYes Then
     Begin
      BNo:=Frodm.NCarBNo.Value;
      BDat:=Frodm.NCarDat.Value;
      RNo :=Frodm.NCarNo.Value;
      DelBitem(IntToStr(RNo),BNo,FTip);
      BillUpdate(BNo);
{ Delete Jari Article }
      Table:=TTable.Create(Self);
      Table.Tag:=2;
      Table.DatabaseName :=CurrDb;
      Table.TableName :='dbo.Jari'+JariKod.Text;
      If Not OpenTable(Table) Then
      Begin
       ShowMessage('ÌÇÑí íÇÝÊ äÔÏ');
       MoFlag:=False;
       Exit;
      End;
     If Frodm.JariNam.FindKey([JariKod.Text]) Then
      If DefaultCurr = Frodm.JariNamBkod.Value Then
       mPrice:=Frodm.NCarPrice.AsCurrency Else mPrice:=Frodm.NCarCPrice.AsCurrency;
      Table.Filter:='Dat = '+Frodm.NCarDat.AsString+' and Serial ='+Frodm.NCarNo.AsString+
       ' and Bedeh = '+CurrToStr(mPrice);
      Table.Filtered:=True;
      Table.Delete;
      Table.Filtered:=False;
      JariRepair(Table);
      Table.Free;
      Frodm.NCar.Delete;
      FNo.Text:=IntToStr(Frodm.NCarNo.Value);
      Dat1.Text:=IntToDate(Frodm.NCarDat.Value);
     End;
end;

procedure TFCar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key = VK_F3 Then BDoClick(Sender);
     If Shift = [ssAlt] Then
      Case Key Of
       VK_Left:BprevClick(Sender);
       VK_RIGHT:BnextClick(Sender);
      End;
end;

procedure TFCar.Dat1Enter(Sender: TObject);
begin
     If Frodm.NCar.State = dsBrowse Then Dat1.ReadOnly :=True Else
     Begin
        Dat1.ReadOnly :=False;
        GetMaskText(Dat1);
     End;
end;

procedure TFCar.Dat1Exit(Sender: TObject);
begin
     If (Frodm.NCar.State = dsBrowse) Then Exit;
     SetMaskText(Dat1);
     If(Not Date_Check(Dat1.Text))And(DateToInt(Dat1.Text)>0) Then Dat1.SetFocus Else
       Frodm.NCarDat.Value :=DateToInt(Dat1.Text);
end;


procedure TFCar.FAccNamDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
     Accept:=(Source Is TXPListBox) And ((Source As TXPListBox).Name = 'lbName');
     Accept:=Accept and Not(Frodm.NCar.State =dsBrowse);
end;

procedure TFCar.FEQEnter(Sender: TObject);
begin
     If (Frodm.NCar.State = dsBrowse)or(Frodm.NCarPrice.Value>0) Then Exit;
     If Frodm.NCarCtip.AsString = DefaultCurr Then
      Rate := 1
     Else
      Rate:=GetRateatDate(Frodm.NCarCtip.AsString,Frodm.NCarDat.AsInteger);
     Frodm.NCarPrice.Value:=Frodm.NCarCprice.Value*Rate;
end;

procedure TFCar.FCKodKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetCentLookup(Sender,Key);
end;

end.
