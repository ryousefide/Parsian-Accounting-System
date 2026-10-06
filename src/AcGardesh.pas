unit AcGardesh;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, Db, DBTables, StdCtrls, Mask, ExtCtrls, ComCtrls,
  Buttons;


type
  TFGardesh = class(TForm)
    Gdbg: TDBGrid;
    FAccNam: TComboBox;
    Bevel1: TBevel;
    Label1: TLabel;
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
    Bdiag: TButton;
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
    spUp: TSpeedButton;
    GQuId: TAutoIncField;
    Splitter1: TSplitter;
    tvAckod: TTreeView;
    procedure BexitClick(Sender: TObject);
    procedure FAccNamChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BShowClick(Sender: TObject);
    procedure BdiagClick(Sender: TObject);
    procedure GdbgKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GdbgKeyPress(Sender: TObject; var Key: Char);
    procedure SDatExit(Sender: TObject);
    procedure EDatExit(Sender: TObject);
    procedure NextTab(Sender: TObject; var Key: Char);
    procedure SDatEnter(Sender: TObject);
    procedure EDatEnter(Sender: TObject);
    procedure GdbgDblClick(Sender: TObject);
    procedure btUpClick(Sender: TObject);
    procedure FAccNamDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure FAccNamDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure GdbgDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BprintClick(Sender: TObject);
    procedure FAccNamKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpCenClick(Sender: TObject);
    procedure SpClick(Sender: TObject);
    procedure FCentNKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tvAckodKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tvAckodClick(Sender: TObject);
    procedure tvAckodDblClick(Sender: TObject);
  private
    { Private declarations }
//    Procedure open_G;
    Kod:Real;
    UseTip:Integer;
    BedSum:Currency;
    BesSum:Currency;
    SbedRem:Currency;
    SbesRem:Currency;
    Procedure Gardesh_Date(Kod:Real;Sdate,Edate:Integer;Cent,Cost:String);
    Procedure Gardesh_Mont(Kod:Real;Cent,Cost:String);
    Function Mon_Name(Mon:Integer):String;
    Procedure Gardesh_Cent(Kod:Real;Sdate,Edate:Integer);
    Function Up_Ac_Gardesh(AcNam:String):Real;
    Procedure ThreeColReport;
    Procedure FourColReport;
    Procedure GetSums;
  public
    { Public declarations }
  end;

var
  FGardesh: TFGardesh;

implementation

uses Routins, FrooshDM, GardeshRep, ProVar, Diag, DiagMo, AcSearch,
  Converts, Bill, TarazReport,XPListBox, CRoutins, Math, MainForm, AcTree;

{$R *.DFM}
var
  ColumnWidthHelper : TColumnWidthHelper;

procedure TFGardesh.NextTab(Sender: TObject; var Key: Char);
begin
     If Key=#13 Then
     Begin
      Key:=#0;
      SelectNext(Sender As TWinControl,True,True);
     End;
end;

Procedure TFGardesh.Gardesh_Date(Kod:Real;Sdate,Edate:Integer;Cent,Cost:String);
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

Procedure TFGardesh.Gardesh_Mont(Kod:Real;Cent,Cost:String);
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

Function TFGardesh.Mon_Name(Mon:Integer):String;
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

Procedure TFGardesh.Gardesh_Cent(Kod:Real;Sdate,Edate:Integer);
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
     If FCentN.Text > '' Then Filt:=Filt+' and CKod In ('+CentString(FCentN.Text)+')';
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
//-----------
       Frodm.GardeshBedeh.Value:=Bed;
       Frodm.GardeshBestan.Value:=Bes;
       BRem:=Bed-Bes;
       IF BRem>=0 Then
        Frodm.GardeshBedRem.Value :=BRem
       Else
        Frodm.GardeshBesRem.Value :=Abs(BRem);
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
end;

Function TFGardesh.Up_Ac_Gardesh(AcNam:String):Real;
begin

     If Kod=0 Then Kod:=AccKod(AcNam);
     Case AccountType(Kod) Of
     0: Kod:=0;
     1: Kod:=Int(Kod/1000000000000)*1000000000000;
     2: Kod:=Int(Kod/1000000000)*1000000000;
     3: Kod:=Int(Kod/1000000)*1000000;
     4: Kod:=Int(Kod/1000)*1000;
     Else
        Kod:=0;
     End;
     Result:=Kod;//AccNam(Kod);
end;

Procedure TFGardesh.ThreeColReport;
begin
     CreatingForm(TGReport,'GReport',GReport);
     Set_Sys_Enviroment;
     GReport.AccNam.Caption :=AccNam(Kod);//FAccNam.Text;
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

Procedure TFGardesh.FourColReport;
begin
     CreatingForm(TTarazRep,'TarazRep',TarazRep);
     Set_Sys_Enviroment;
     TarazRep.qrTit.Caption:=InvoLbl;
     TarazRep.qrCost.Caption:=FCostN.Text;
     TarazRep.qrCent.Caption:=FCentN.Text;
     Tarazrep.Cap:=DefaultCurr;

     TarazRep.QRLabel1.Caption :=' —«“ çÂ«— ” Ê‰Ì «“ '+AccNam(Kod)+' «“ '+SDat.Text
      +' «·Ì '+EDat.Text;

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

Procedure TFGardesh.GetSums;
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
procedure TFGardesh.BexitClick(Sender: TObject);
begin
     Frodm.Gardesh.Active :=False;
     Frodm.Gardesh.Exclusive :=False;
     FGardesh.Close;
end;

procedure TFGardesh.FAccNamChange(Sender: TObject);
Var
AcTip:Integer;
AcName:String;
AcCount:Integer;
begin
     AcName:=AccNam(Kod);
     If (AcName = FAccNam.Text)and(Kod>0) Then Kod:=Kod;
     AcCount:=NamCount(FAccNam.Text);
     If (Acname <> FAccNam.Text)and (AcCount>1)Then Kod:=0;
      If (Acname<> FAccNam.Text)and (AcCount=1)Then Kod:=AccKod(FAccNam.Text);
     AcTip:=AccountType(Kod);
     Case AcTip of
      0:Sb1.Panels[1].Text:='ê—ÊÂ';
      1:Sb1.Panels[1].Text:='ﬂ·';
      2:Sb1.Panels[1].Text:='„⁄Ì‰';
      3:Sb1.Panels[1].Text:=' ›’Ì·Ì';
      4:Sb1.Panels[1].Text:=' ›’Ì·Ì œÊ„';
     End;
     UseTip:= Frodm.AcKodUseKod.Value;
     //If (NamCount(FAccNam.Text)>1)Then Kod:=0;
     If Kod = 0 Then UseTip:=0;
     Case UseTip Of
     0:Begin
        Sb1.Panels[0].Text:='”—›’·';
        Sb1.Panels[2].Text :=AccString(Kod);
        Gdbg.Columns[5].Visible:=(UseTip=0) and(Rg.ItemIndex in [0,1]) ;
        Gdbg.Columns[6].Visible:=(UseTip=0) and(Rg.ItemIndex in [0,1]) ;
       End;
     1:Begin
        Sb1.Panels[0].Text:='⁄„·Ì« Ì';
        Sb1.Panels[2].Text :=AccString(Kod);
        Gdbg.Columns[5].Visible:=(UseTip=1) and(Rg.ItemIndex=3) ;
        Gdbg.Columns[6].Visible:=(UseTip=1) and(Rg.ItemIndex=3) ;
       End;
     End;
end;

procedure TFGardesh.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Open_G(Frodm.Gardesh);
     Frodm.Gardesh.Active :=False;
     Frodm.Gardesh.Exclusive :=False;
     Action:=caFree;
end;

procedure TFGardesh.FormCreate(Sender: TObject);
Var
I:Integer;
St:String[10];
Stream:TStream;
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
     If CUser.Master Then
      Fill_Comb(Frodm.AcKod,'Nam',FAccNam.Items)
     else
      FAccNam.Items.Assign(AcList);
     If CUser.Boss Then
     Begin
      FAccNam.Items.Add(' —«“ ò·');
      FAccNam.Items.Add(' —«“ „⁄Ì‰');
     End;
     St:=IntToDate(Fardate);
     st[9]:='0';
     St[10]:='1';
     SDat.Text:=Beg_Date;
     EDat.Text:=End_Date;
     ColumnWidthHelper.Index := -1;
     ColumnWidthHelper.MaxWidth := -1;

     FAcTree.SaveToFile(RDir+'\'+'AcTree.dat');
     tvAcKod.LoadFromFile(Rdir+'\'+'AcTree.dat');


{Update Image}
     tvAcKod.Images:=Main.TreeImage;
     tvAcKod.StateImages:=Main.TreeImage;
     For I:=0 To tvAcKod.Items.Count-1 Do
     Begin
      IF tvAcKod.Items[i].Count > 0 Then
       tvAcKod.Items[i].ImageIndex :=1
      Else
       tvAcKod.Items[i].ImageIndex :=2;
      tvAcKod.Items[i].StateIndex:=tvAcKod.Items[i].Level+3;
     End;
end;

procedure TFGardesh.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     IF Key = VK_F3 Then BShowClick(Sender);
end;

procedure TFGardesh.BShowClick(Sender: TObject);
begin
     Screen.Cursor:=crHourGlass;

     FAccNamChange(sender);
     If not IsAllowedReporting(Kod) Then
     Begin
      ShowMessage('«„ò«‰  ÂÌÂ ê“«—‘ ‰Ì” . Õ”«» »—«Ì ‘„« „Ã«“ ‰Ì” ');
      Exit;
     End;
     Create_Gardesh_Table('Gardesh'+IntToStr(CUser.Id));
     GQu.SQL.Clear;
     GQu.SQL.Add('Select * From '+Frodm.Gardesh.TableName+' order by Id');
     Open_g(Frodm.Gardesh);

     If FAccNam.Text =' —«“ ò·' Then
     Begin
      Case Rg.ItemIndex of
         0:Kol_Taraz(DateToStr(SDat.Text),DateToStr(EDat.Text),FCentN.Text,FCostN.Text);
       2,1:Kol_Taraz('','',FCentN.Text,FCostN.Text);
      End;
      UseTip:=2;
     End;
     If FAccNam.Text =' —«“ „⁄Ì‰' Then
     Begin
      Case Rg.ItemIndex of
         0:Mo_Taraz(DateToStr(SDat.Text),DateToStr(EDat.Text),FCentN.Text,FCostN.Text);
       2,1:Mo_Taraz('','',FCentN.Text,FCostN.Text);
      End;
      UseTip:=2;
     End;

     If (NamCount(FAccNam.Text)>1) and (Kod=0)Then
     Begin
      Gardesh_Kol_Name(FAccNam.Text,DateToStr(SDat.Text),DateToStr(EDat.Text),FCentN.Text,FCostN.Text);
      GQu.Close;
      GQu.Open;
      GQu.Last;
      GetSums;
      Close_g(Frodm.Gardesh);
      Delete_Gardesh_Table;
      Screen.Cursor:=crDefault;
      Exit;
     End;
     Case UseTip Of
       0: Case Rg.ItemIndex of
      3,2,1:Gardesh_Kol(Kod,'','',FCentN.Text,FCostN.Text);
          0:Gardesh_Kol(Kod,DateToStr(SDat.Text),DateToStr(EDat.Text),FCentN.Text,FCostN.Text);
          4:Gardesh_Mo_Kol(Kod,FCentN.Text,FCostN.Text);
          End;
       1: Case Rg.ItemIndex of
          0: Gardesh_Date(Kod,DateToInt(Sdat.Text),DateToInt(Edat.Text),FCentN.Text,FCostN.Text);
          1: Gardesh_Mo(Kod,FCentN.Text,FCostN.Text);
          2: Gardesh_Mont(Kod,FCentN.Text,FCostN.Text);
          3: Gardesh_Cent(Kod,DateToInt(Sdat.Text),DateToInt(Edat.Text));
          4: Gardesh_Mo_Kol(Kod,FCentN.Text,FCostN.Text);
          End;
     End;
     GQu.Close;
     GQu.Open;
     GQu.Last;
     GetSums;
     Close_g(Frodm.Gardesh);
     Delete_Gardesh_Table;
     Screen.Cursor:=crDefault;
end;

procedure TFGardesh.BdiagClick(Sender: TObject);
begin
     Case UseTip Of
     0:Begin
        CreatingForm(TFDiag,'FDiag',FDiag);
        FDiag.Series1.DataSource:=GQu;
       End;
     1: Begin
          If GQu.RecordCount <=1 Then Exit;// Frodm.Gardesh
          CreatingForm(TFDiagMo,'FDiagMo',FDiagMo);
          FDiagMo.Series1.DataSource:=GQu;
        End;
     End;
end;

procedure TFGardesh.GdbgKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Shift =[ssCtrl] Then BShow.SetFocus;
     If Shift =[ssCtrl]+[ssShift] Then FAccNam.SetFocus;
end;

procedure TFGardesh.GdbgKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
       Key:=#0;
       GMove(Gdbg,Frodm.Gardesh);
     End;
end;

procedure TFGardesh.SDatEnter(Sender: TObject);
begin
     GetMaskText(SDat);
end;

procedure TFGardesh.SDatExit(Sender: TObject);
begin
     SetMaskText(SDat);
     If (Not Date_Check(SDat.Text))and(DateToInt(SDat.Text)>0) Then SDat.SetFocus;
end;

procedure TFGardesh.EDatEnter(Sender: TObject);
begin
     GetMaskText(EDat);
end;

procedure TFGardesh.EDatExit(Sender: TObject);
begin
     SetMaskText(EDat);
     If (Not Date_Check(EDat.Text))and(DateToInt(EDat.Text)>0) Then EDat.SetFocus;
end;

procedure TFGardesh.GdbgDblClick(Sender: TObject);
Var
NO:Integer;
mouseInGrid : TPoint;
gridCoord: TGridCoord;
begin
     mouseInGrid := gDbg.ScreenToClient(Mouse.CursorPos);
     gridCoord := gDbg.MouseCoord(mouseInGrid.X, mouseInGrid.Y);
     if not (dgTitles in gDbg.Options) then Exit;
     if gridCoord.Y <> 0 then
     Begin
      No:=GQuNo.AsInteger;
      If NO=-2 Then
      Begin
       FCentN.Text:=GQu.fieldByName('Des').AsString;
       Rg.ItemIndex:=0;
       BShowClick(Sender);
       Exit;
      End;
      Kod:=GQu.FieldByName('Diag').AsFloat;
      If ((Kod >0)and(KodFound(Kod))and(CUser.Boss)) Then
      Begin
       FAccNAm.Text:=Frodm.AcKodNam.AsString;
       If (Frodm.AcKodUseKod.AsInteger=1) and FCentN.Enabled Then Rg.ItemIndex:=3;
       BShowClick(Sender);
      End Else Begin
       Frodm.Bill.Filter:='';
       If (GQuNo.Value = 0)or(GQUNo.IsNull) Then Exit;
       Frodm.Bill.Filtered:=True;
       CreatingForm(TFBill,'FBill',FBill);
       FBill.FNo.Text:=GQuNo.AsString;
       FBill.FNoExit(Sender);
      End;
      Exit;
     end;
//find Column index
     if dgIndicator in gDbg.Options then
      ColumnWidthHelper.Index :=  -1 + gridCoord.x
     else
      ColumnWidthHelper.Index := gridCoord.x;
     if ColumnWidthHelper.Index < 0 then Exit;
     ColumnWidthHelper.MaxWidth := -1;
     gDbg.Repaint;
//"auto size" Column width
     gDbg.Columns[ColumnWidthHelper.Index].Width := 4 + ColumnWidthHelper.MaxWidth;
end;

procedure TFGardesh.btUpClick(Sender: TObject);
begin
     If (UseTip = 1) and (FCentN.Text > '') Then
     Begin
      FCentN.Text:='';
      Rg.ItemIndex:=3;
      BShowClick(Sender);
      Exit;
     End;
     If (UseTip = 1) and (Rg.ItemIndex=3) Then Rg.ItemIndex:=0;
     FAccNam.Text:=AccNam(Up_Ac_Gardesh(FAccNam.Text));
     //FAccNamChange(Sender);
     BShowClick(Sender);

end;

procedure TFGardesh.FAccNamDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
     Accept:=(Source Is TXPListBox) And ((Source As TXPListBox).Name = 'lbName');
end;

procedure TFGardesh.FAccNamDragDrop(Sender, Source: TObject; X,
  Y: Integer);
Var
List:TXPListBox;
begin
     If (Source Is TXPListBox) Then
     Begin
       List:=(Source As TXPListBox);
       FAccNam.Text:=List.Items.Strings[List.ItemIndex];
       FAccNam.SetFocus;
     End;
     FAccNamChange(Sender);
     BShowClick(Sender);
end;

procedure TFGardesh.GdbgDrawColumnCell(Sender: TObject; const Rect: TRect;
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

procedure TFGardesh.BprintClick(Sender: TObject);
begin
     Case UseTip Of
     2,0: If Rg.ItemIndex=4 Then ThreeColReport  Else  FourColReport;
       1: If Rg.ItemIndex=3 Then FourColReport   Else ThreeColReport;
     End;
end;

procedure TFGardesh.FAccNamKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetAccountCombo(Sender,Key);
end;

procedure TFGardesh.SpCenClick(Sender: TObject);
begin
     FCentN.Text:=A_Choose;
end;

procedure TFGardesh.SpClick(Sender: TObject);
begin
     FCostN.ItemIndex:=-1;
     FCostN.Text:=C_Choose;
end;

procedure TFGardesh.FCentNKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetCentLookup(Sender,Key);
end;

procedure TFGardesh.tvAckodKeyUp(Sender: TObject; var Key: Word;
 Shift: TShiftState);
begin
     Case Key Of
      VK_UP,VK_DOWN,VK_LEFT,VK_RIGHT :
      Begin
       //FAccnam.Text:=tvAcKod.Selected.Text;
       //FAccNamChange(Owner);
      End;
      VK_RETURN :
      Begin
       FAccnam.Text:=tvAcKod.Selected.Text;
       Kod:=tvAcKod.Selected.AcCode;
       BShowClick(Owner);
      End;
     End;
end;

procedure TFGardesh.tvAckodClick(Sender: TObject);
begin
      FAccnam.Text:=tvAcKod.Selected.Text;
      Kod:=tvAcKod.Selected.AcCode;
      //FAccNamChange(Owner);
      //BShowClick(Owner);
end;

procedure TFGardesh.tvAckodDblClick(Sender: TObject);
begin
      FAccnam.Text:=tvAcKod.Selected.Text;
      Kod:=tvAcKod.Selected.AcCode;
      BShowClick(Owner);
end;

end.

