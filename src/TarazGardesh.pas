unit TarazGardesh;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, Db, DBTables, StdCtrls, Mask, ExtCtrls, ComCtrls,
  Buttons;

type
  TColumnWidthHelper = record
    Index : integer;
    MaxWidth : integer;
  end;

type
  TFTGardesh = class(TForm)
    Gdbg: TDBGrid;
    Bevel1: TBevel;
    Sb1: TStatusBar;
    Label2: TLabel;
    SDat: TMaskEdit;
    Label3: TLabel;
    EDat: TMaskEdit;
    Panel1: TPanel;
    RG: TRadioGroup;
    Panel2: TPanel;
    BShow: TBitBtn;
    Bprint: TButton;
    Bexit: TButton;
    GQu: TQuery;
    GQuDs: TDataSource;
    GQuDat: TIntegerField;
    GQuBedeh: TCurrencyField;
    GQuBestan: TCurrencyField;
    GQuBedRem: TCurrencyField;
    GQuBesRem: TCurrencyField;
    GQuBaghi: TCurrencyField;
    GQuDesc: TStringField;
    GQuNo: TIntegerField;
    GQuDiag: TCurrencyField;
    Label4: TLabel;
    Sp: TSpeedButton;
    Label6: TLabel;
    SpCen: TSpeedButton;
    FCostN: TComboBox;
    FCentN: TComboBox;
    RGT: TRadioGroup;
    procedure BexitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BShowClick(Sender: TObject);
    procedure GdbgKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GdbgKeyPress(Sender: TObject; var Key: Char);
    procedure SDatExit(Sender: TObject);
    procedure EDatExit(Sender: TObject);
    procedure NextTab(Sender: TObject; var Key: Char);
    procedure SDatEnter(Sender: TObject);
    procedure EDatEnter(Sender: TObject);
    procedure GdbgDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BprintClick(Sender: TObject);
    procedure SpCenClick(Sender: TObject);
    procedure SpClick(Sender: TObject);
    procedure FCentNKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
//    Procedure open_G;
    UseTip:Integer;
    BedSum:Currency;
    BesSum:Currency;
    SbedRem:Currency;
    SbesRem:Currency;
//    Procedure Gardesh_Date(Kod:Real;Sdate,Edate:Integer;Cent,Cost:String);
//    Procedure Gardesh_Mont(Kod:Real;Cent,Cost:String);
//    Function Mon_Name(Mon:Integer):String;
//    Procedure Gardesh_Cent(Kod:Real;Sdate,Edate:Integer);
    Procedure ThreeColReport;
    Procedure FourColReport;
    Procedure GetSums;
  public
    { Public declarations }
  end;

var
  FTGardesh: TFTGardesh;

var
  ColumnWidthHelper : TColumnWidthHelper;

implementation

uses Routins, FrooshDM, GardeshRep, ProVar, Diag, DiagMo, AcSearch,
  Converts, Bill, TarazReport,XPListBox, CRoutins, Math;

{$R *.DFM}

procedure TFTGardesh.NextTab(Sender: TObject; var Key: Char);
begin
     If Key=#13 Then
     Begin
      Key:=#0;
      SelectNext(Sender As TWinControl,True,True);
     End;
end;

{Procedure TFTGardesh.Gardesh_Date(Kod:Real;Sdate,Edate:Integer;Cent,Cost:String);
Var
Filt:String;
I:Integer;
Bed,Bes,Rem:Currency;
begin
     Frodm.AcKod.IndexFieldNames:='AccKod';
     Frodm.AcKod.FindKey([Kod]);
     If Frodm.AcKodKdas.Value = 1 Then Exit;
     Filt:='Tip=0 and  AcKod = '+FloatToStr(Kod)+' and Dat >= 0 and Dat < '+IntToStr(SDate);
     If Cent > '' Then Filt:=Filt+' and CKod In ('+CentString(Cent)+')';
     If Cost > '' Then Filt:=Filt+' and Cost In ('+CostString(Cost)+')';
     Qu.SQL.Clear;
     Qu.SQL.Add('SELECT Sum(Bed),Sum(Bes)');
     Qu.SQL.Add('FROM AcountBill');
     Qu.SQL.Add('WHERE '+Filt);
     Qu.Active:=True;
     Frodm.Gardesh.Append;
     Frodm.GardeshBaghi.AsCurrency :=Qu.Fields[0].AsCurrency-Qu.Fields[1].AsCurrency;
     Frodm.GardeshDiag.Value:=Frodm.GardeshBaghi.Value;
     Frodm.GardeshDesc.Value :='„«‰œÂ ﬁ»·Ì';
     Frodm.Gardesh.Post;
     Qu.Active:=False;
//New
     Filt:='Tip=0 and  AcKod = '+FloatToStr(Kod)+' and Dat >='+IntToStr(SDate)
           +' and Dat <= '+IntToStr(EDate);
     If Cent > '' Then Filt:=Filt+' and CKod In ('+CentString(Cent)+')';
     If Cost > '' Then Filt:=Filt+' and Cost In ('+CostString(Cost)+')';
     Qu.SQL.Clear;
     Qu.SQL.Add('SELECT Bed,Bes,Dat,Des,B.No');
     Qu.SQL.Add('FROM AcountBill B');
     Qu.SQL.Add('WHERE '+Filt);
     Qu.SQL.Add('Order By Dat,B.No');
     Qu.Open;
     Qu.First;
     If Frodm.Gardesh.RecordCount = 0 Then  Rem:=0 Else
     Begin
      Frodm.Gardesh.Last;
      Rem:=Frodm.GardeshBaghi.Value;
     End;
     For I:=1 To Qu.RecordCount Do
     Begin
      Bed:=Qu.Fields[0].AsCurrency;
      Bes:=Qu.Fields[1].AsCurrency;
      Frodm.Gardesh.Append;
      Frodm.GardeshDat.Value :=Qu.Fields[2].AsInteger;
      Frodm.GardeshDesc.Value :=Qu.Fields[3].AsString;
      Frodm.GardeshBedeh.Value :=Bed;
      Frodm.GardeshBestan.Value :=Bes;
      Frodm.GardeshNo.Value:=Qu.Fields[4].AsInteger;
      Rem:=Rem+Bed-Bes;
      Frodm.GardeshBaghi.Value :=Rem;
      Frodm.GardeshDiag.Value:=Rem;
      Frodm.Gardesh.Post;
      Qu.Next;
     End;
     Qu.Close;
     Qu.SQL.Clear;
     Qu.SQL.Add('SELECT Sum(Bedeh),Sum(Bestan)');
     Qu.SQL.Add('FROM '+Frodm.Gardesh.TableName);
     Qu.Open;
     Bed:=Qu.Fields[0].AsCurrency;
     Bes:=Qu.Fields[1].AsCurrency;
     Frodm.Gardesh.Append;
     Frodm.GardeshDat.Value :=EDate;
     Frodm.GardeshDesc.Value :='Ã„⁄';
     Frodm.GardeshBedeh.Value :=Bed;
     Frodm.GardeshBestan.Value :=Bes;
     Frodm.GardeshBaghi.Value :=Rem;
     Frodm.GardeshNo.Value:=-1;
     Frodm.Gardesh.Post;
     Qu.Close;
end;

Procedure TFTGardesh.Gardesh_Mont(Kod:Real;Cent,Cost:String);
Var
Filt:String;
Dat,I,SMon,EMon:Integer;
begin
     Open_g(Frodm.Gardesh);
     Frodm.AcKod.IndexFieldNames:='AccKod';
     Frodm.AcKod.FindKey([Kod]);
     If Frodm.AcKodKdas.Value = 1 Then Exit;
     SMon:=(DateToInt(SDat.Text)Mod 10000)Div 100;
     EMon:=(DateToInt(EDat.Text)Mod 10000)Div 100;
     Dat:=DateToInt(SDat.Text);
     Dat:=Dat-(Dat Mod 10000);
     For I:=SMon To EMon Do
     Begin
      Filt:='Tip=0 and AcKod ='+FloatToStr(Kod)+' and Dat >= '+IntToStr(Dat+I*100)+
      ' and Dat <= '+IntToStr(Dat+I*100+32);
      If Cent > '' Then Filt:=Filt+' and CKod In ('+CentString(Cent)+')';
      If Cost > '' Then Filt:=Filt+' and Cost In ('+CostString(Cost)+')';
      Qu.SQL.Clear;
      Qu.SQL.Add('SELECT Sum(Bed),Sum(Bes)');
      Qu.SQL.Add('FROM AcountBill');
      Qu.SQL.Add('WHERE '+Filt);
      Qu.Active:=True;
      Frodm.Gardesh.Append;
      Frodm.GardeshBedeh.AsCurrency :=Qu.Fields[0].AsCurrency;
      Frodm.GardeshBestan.AsCurrency :=Qu.Fields[1].AsCurrency;
      Frodm.GardeshBaghi.AsCurrency :=Qu.Fields[0].AsCurrency - Qu.Fields[1].AsCurrency;
      Frodm.GardeshDat.AsInteger :=Dat+I*100;
      Frodm.GardeshDesc.AsString :='ê—œ‘ Õ”«» œ—'+Mon_Name(I);
      Frodm.Gardesh.Post;
      Qu.Active:=False;
     End;
end;

Function TFTGardesh.Mon_Name(Mon:Integer):String;
begin
     Case Mon of
     1 :Result:='›—Ê—œÌ‰';
     2 :Result:='«—œÌ»Â‘ ';
     3 :Result:='Œ—œ«œ';
     4 :Result:=' Ì—';
     5 :Result:='„—œ«œ';
     6 :Result:='‘Â—ÌÊ—';
     7 :Result:='„Â—';
     8 :Result:='¬»«‰';
     9 :Result:='¬–—';
     10:Result:='œÌ';
     11:Result:='»Â„‰';
     12:Result:='«”›‰œ';
     End;
end;

Procedure TFTGardesh.Gardesh_Cent(Kod:Real;Sdate,Edate:Integer);
Var
Filt:String;
I,BKod:Integer;
Bed,Bes,Rem,BRem:Currency;
Qu:TQuery;
begin
     Frodm.AcKod.IndexFieldNames:='AccKod';
     Frodm.AcKod.FindKey([Kod]);
     If Frodm.AcKodKdas.Value = 1 Then Exit;
     Filt:='Tip=0 and  AcKod = '+FloatToStr(Kod)+' and Dat >='+IntToStr(SDate)+
     ' and Dat <= '+IntToStr(EDate);
     If FCostN.Text > '' Then Filt:=Filt+' and Cost In ('+CostString(FCostN.Text)+')';
     If Pos(' and',Filt) = 1 Then Delete(Filt,1,4);
//New  1381-08-21
     Qu:=TQuery.Create(Owner);
     Qu.DatabaseName:=CurrDb;
     Qu.SQL.Clear;
     Qu.SQL.Add('SELECT C.Nam,Sum(A.Bed),Sum(A.Bes),Max(A.Dat)');
     Qu.SQL.Add('FROM AcountBill A, Cent C');
     Qu.SQL.Add('Where C.Kod=A.Ckod and '+Filt);
     Qu.SQL.Add('Group By C.Nam');
     Qu.SQL.Add('Order By C.Nam');
     If Open_g(Frodm.Gardesh) Then Exit;
     Qu.Open;
     Rem:=0;
     For I:=1 To Qu.RecordCount Do
     Begin
       Bed:=Qu.Fields[1].AsCurrency;
       Bes:=Qu.Fields[2].AsCurrency;
       Frodm.Gardesh.Append;
       Frodm.GardeshDat.Value :=Qu.Fields[3].AsInteger;
       Frodm.GardeshDesc.Value :=Qu.Fields[0].AsString;
       BRem:=Bed-Bes;
       IF BRem>=0 Then
        Frodm.GardeshBedeh.Value :=BRem
       Else
        Frodm.GardeshBestan.Value :=Abs(BRem);
       Rem:=Rem+BRem;
       Frodm.GardeshBaghi.Value :=Rem;
       Frodm.GardeshDiag.Value:=Rem;
       Frodm.GardeshNo.AsFloat:=-2;
       Frodm.Gardesh.Post;
       Qu.Next;
     End;
     Qu.Close;
     Qu.SQL.Clear;
//     Qu.SQL.Add('Select Dat,Des,Bedeh,Bestan
     Qu.Free;
end; }

Procedure TFTGardesh.ThreeColReport;
begin
     CreatingForm(TGReport,'GReport',GReport);
     Set_Sys_Enviroment;
     GReport.AccNam.Caption :='';
     GReport.qrCost.Caption:=FCostN.Text;
     GReport.qrCent.Caption:=FCentN.Text;
     GReport.SBed:=0;
     GReport.SBes:=0;
     GReport.qrTit.Caption:=InvoLbl;
     GReport.QRDBText1.DataSet:=GQu;
     GReport.QRDBText2.DataSet:=GQu;
     GReport.QRDBText3.DataSet:=GQu;
     GReport.QRDBText4.DataSet:=GQu;
     GReport.QRDBText5.DataSet:=GQu;
     GReport.QRDBText6.DataSet:=GQu;
     GReport.QRDBText7.DataSet:=GQu;
     GReport.QRSubDetail1.DataSet:=GQu;
     If Rg.ItemIndex = 0 Then
     Begin
      GReport.SDat.Caption:=SDat.Text;
      GReport.EDat.Caption:=EDat.Text;
     End;
     GQu.Filter:='No<>-1';
     GQu.Filtered:=True;
     GReport.Preview;
     GQu.Filter:='';
     GQu.Filtered:=False;
     GReport.Destroy;//new
end;

Procedure TFTGardesh.FourColReport;
begin
     CreatingForm(TTarazRep,'TarazRep',TarazRep);
     Set_Sys_Enviroment;
     TarazRep.qrTit.Caption:=InvoLbl;
     TarazRep.qrCost.Caption:=FCostN.Text;
     TarazRep.qrCent.Caption:=FCentN.Text;
     Tarazrep.Cap:=DefaultCurr;

     TarazRep.QRLabel1.Caption :=' —«“ çÂ«— ” Ê‰Ì «“ '+'AAAAAAA'
     +' «“ '+SDat.Text+' «·Ì '+EDat.Text;

     TarazRep.QRSubDetail1.DataSet:=GQu;
     TarazRep.QRDBText1.DataSet:=GQu;
     TarazRep.QRDBText2.DataSet:=GQu;
     TarazRep.QRDBText3.DataSet:=GQu;
     TarazRep.QRDBText4.DataSet:=GQu;
     TarazRep.QRDBText5.DataSet:=GQu;
     TarazRep.QRDBText6.DataSet:=GQu;

     TarazRep.BedSum.Caption :=CurrToFar_Arzi(BedSum,DefaultCurr);
     TarazRep.BesSum.Caption :=CurrToFar_Arzi(BesSum,DefaultCurr);
     TarazRep.SbedRem.Caption :=CurrToFar_Arzi(SbedRem,DefaultCurr);
     TarazRep.SBesRem.Caption :=CurrToFar_Arzi(SbesRem,DefaultCurr);

     TarazRep.Preview;
     TarazRep.Destroy;
end;

Procedure TFTGardesh.GetSums;
begin
     Qu.SQL.Clear;
     Qu.SQL.Add('SELECT SUM(Bedeh),SUM(Bestan),SUM(BedRem),SUM(BesRem)');
     Qu.Sql.Add('FROM '+Frodm.GarDesh.TableName);
     Qu.Active :=True;
     BedSum:=Qu.Fields[0].AsCurrency;
     BesSum:=Qu.Fields[1].AsCurrency;
     SbedRem :=Qu.Fields[2].AsCurrency;
     SBesRem :=Qu.Fields[3].AsCurrency;
     Qu.Close;
end;

//End Of Private
procedure TFTGardesh.BexitClick(Sender: TObject);
begin
     Frodm.Gardesh.Active :=False;
     Frodm.Gardesh.Exclusive :=False;
     Close;
end;

procedure TFTGardesh.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Open_G(Frodm.Gardesh);
     Frodm.Gardesh.Active :=False;
     Frodm.Gardesh.Exclusive :=False;
     Action:=caFree;
end;

procedure TFTGardesh.FormCreate(Sender: TObject);
Var
St:String[10];
begin
     Set_Forms(Self);
     GQu.DatabaseName:=CurrDb;
     Bexit.OnClick :=BexitClick;
     BShow.OnClick :=BShowClick;
     FCostN.Items.Assign(CostList);
     Fill_Comb(Frodm.Cent,CUser.CentField,FCentN.Items);
     FCentN.Enabled:=Frodm.Cent.RecordCount > 0;
     spCen.Enabled:=FcentN.Enabled;
     FCostN.Enabled:=CostList.Count > 0;
     sp.Enabled:=FCostN.Enabled;
     St:=IntToDate(Fardate);
     st[9]:='0';
     St[10]:='1';
     SDat.Text:=Beg_Date;
     EDat.Text:=End_Date;
     ColumnWidthHelper.Index := -1;
     ColumnWidthHelper.MaxWidth := -1;
end;

procedure TFTGardesh.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     IF Key = VK_F3 Then BShowClick(Sender);
end;

procedure TFTGardesh.BShowClick(Sender: TObject);
begin
     Screen.Cursor:=crHourGlass;
     Create_Gardesh_Table('Gardesh'+IntToStr(CUser.Id));
     GQu.SQL.Clear;
     GQu.SQL.Add('Select * From '+Frodm.Gardesh.TableName+' order by Id');
     Open_g(Frodm.Gardesh);
     If RGT.ItemIndex=0 Then
      Case Rg.ItemIndex of
         0:Gardesh_Kol(-1.00,DateToStr(SDat.Text),DateToStr(EDat.Text),FCentN.Text,FCostN.Text);
         1:Gardesh_Kol(-1.00,'','',FCentN.Text,FCostN.Text);
      End;
     If RGT.ItemIndex=1 Then
      Case Rg.ItemIndex of
         0:Kol_Taraz(DateToStr(SDat.Text),DateToStr(EDat.Text),FCentN.Text,FCostN.Text);
         1:Kol_Taraz('','',FCentN.Text,FCostN.Text);
      End;
     If RGT.ItemIndex=2 Then
      Case Rg.ItemIndex of
         0:Mo_Taraz(DateToStr(SDat.Text),DateToStr(EDat.Text),FCentN.Text,FCostN.Text);
         1:Mo_Taraz('','',FCentN.Text,FCostN.Text);
      End;
     If RGT.ItemIndex=3 Then
      Case Rg.ItemIndex of
         0:Taf_Taraz(DateToStr(SDat.Text),DateToStr(EDat.Text),FCentN.Text,FCostN.Text);
         1:Taf_Taraz('','',FCentN.Text,FCostN.Text);
      End;
     If RGT.ItemIndex=4 Then
      Case Rg.ItemIndex of
         0:Jos_Taraz(DateToStr(SDat.Text),DateToStr(EDat.Text),FCentN.Text,FCostN.Text);
         1:Jos_Taraz('','',FCentN.Text,FCostN.Text);
      End;

     GQu.Close;
     GQu.Open;
     GQu.Last;
     GetSums;
     Close_g(Frodm.Gardesh);
     Delete_Gardesh_Table;
     Screen.Cursor:=crDefault;
end;

procedure TFTGardesh.GdbgKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Shift =[ssCtrl] Then BShow.SetFocus;
     If Shift =[ssCtrl]+[ssShift] Then RGT.SetFocus;
end;

procedure TFTGardesh.GdbgKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
       Key:=#0;
       GMove(Gdbg,Frodm.Gardesh);
     End;
end;

procedure TFTGardesh.SDatEnter(Sender: TObject);
begin
     GetMaskText(SDat);
end;

procedure TFTGardesh.SDatExit(Sender: TObject);
begin
     SetMaskText(SDat);
     If (Not Date_Check(SDat.Text))and(DateToInt(SDat.Text)>0) Then SDat.SetFocus;
end;

procedure TFTGardesh.EDatEnter(Sender: TObject);
begin
     GetMaskText(EDat);
end;

procedure TFTGardesh.EDatExit(Sender: TObject);
begin
     SetMaskText(EDat);
     If (Not Date_Check(EDat.Text))and(DateToInt(EDat.Text)>0) Then EDat.SetFocus;
end;

procedure TFTGardesh.GdbgDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if DataCol = ColumnWidthHelper.Index then
  begin
   if Assigned(Column.Field) then
   ColumnWidthHelper.MaxWidth := Max(ColumnWidthHelper.MaxWidth, gDbg.Canvas.TextWidth(Column.Field.DisplayText));
  end;
     If (GQuDesc.Value = '„«‰œÂ ﬁ»·Ì')Or(GQuDesc.Value = 'Ã„⁄') Then Gdbg.Canvas.Font.Color:=clRed;
     Gdbg.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TFTGardesh.BprintClick(Sender: TObject);
begin
      FourColReport;
end;

procedure TFTGardesh.SpCenClick(Sender: TObject);
begin
     FCentN.Text:=A_Choose;
end;

procedure TFTGardesh.SpClick(Sender: TObject);
begin
     FCostN.ItemIndex:=-1;
     FCostN.Text:=C_Choose;
end;

procedure TFTGardesh.FCentNKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetCentLookup(Sender,Key);
end;

end.
