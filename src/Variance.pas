unit Variance;

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
  TFVariance = class(TForm)
    Gdbg: TDBGrid;
    FAccNam: TComboBox;
    Bevel1: TBevel;
    Label1: TLabel;
    Sb1: TStatusBar;
    Label2: TLabel;
    SDat: TMaskEdit;
    Label3: TLabel;
    EDat: TMaskEdit;
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
    GQuBid: TIntegerField;
    GQuDchek: TBooleanField;
    tvAckod: TTreeView;
    Splitter1: TSplitter;
    GQuId: TAutoIncField;
    Panel2: TPanel;
    SP6: TSpeedButton;
    spCalc: TSpeedButton;
    sp5: TSpeedButton;
    BShow: TBitBtn;
    Bexit: TButton;
    procedure BexitClick(Sender: TObject);
    procedure FAccNamChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BShowClick(Sender: TObject);
    procedure GdbgKeyPress(Sender: TObject; var Key: Char);
    procedure SDatExit(Sender: TObject);
    procedure EDatExit(Sender: TObject);
    procedure NextTab(Sender: TObject; var Key: Char);
    procedure SDatEnter(Sender: TObject);
    procedure EDatEnter(Sender: TObject);
    procedure GdbgDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FAccNamKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpCenClick(Sender: TObject);
    procedure SpClick(Sender: TObject);
    procedure FCentNKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SP6Click(Sender: TObject);
    procedure sp5Click(Sender: TObject);
    procedure tvAckodKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    Kod:Real;
    UseTip:Integer;
    AcTip:Integer;
    BedSum:Currency;
    BesSum:Currency;
    SbedRem:Currency;
    SbesRem:Currency;
    Procedure Gardesh_Date(Kod:Real;Sdate,Edate:Integer;Cent,Cost:String);
    Procedure Gardesh_Cent(Kod:Real;Sdate,Edate:Integer);
    Function Up_Ac_Gardesh(AcNam:String):String;
    Procedure ThreeColReport;
    Procedure FourColReport;
    Procedure GetSums;
  public
    { Public declarations }
  end;

var
  FVariance: TFVariance;

var
  ColumnWidthHelper : TColumnWidthHelper;

implementation

uses Routins, FrooshDM, GardeshRep, ProVar, Diag, DiagMo, AcSearch,
  Converts, Bill, TarazReport,XPListBox, CRoutins, Math, MainForm, AcTree;

{$R *.DFM}

procedure TFVariance.NextTab(Sender: TObject; var Key: Char);
begin
     If Key=#13 Then
     Begin
      Key:=#0;
      SelectNext(Sender As TWinControl,True,True);
     End;
end;

Procedure TFVariance.Gardesh_Date(Kod:Real;Sdate,Edate:Integer;Cent,Cost:String);
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
     Qu.SQL.Add('SELECT Bed,Bes,Dat,Des,B.No,B.Id,Dchek');
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
      Frodm.GardeshBid.Value:=Qu.Fields[5].AsInteger;
      Frodm.GardeshDchek.Value:=Qu.Fields[6].AsBoolean;
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


Procedure TFVariance.Gardesh_Cent(Kod:Real;Sdate,Edate:Integer);
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
end;

Function TFVariance.Up_Ac_Gardesh(AcNam:String):String;
Var
Kod:Real;
begin
     Kod:=AccKod(AcNam);
     Case AccountType(Kod) Of
     0: Kod:=0;
     1: Kod:=Int(Kod/1000000000000)*1000000000000;
     2: Kod:=Int(Kod/1000000000)*1000000000;
     3: Kod:=Int(Kod/1000000)*1000000;
     4: Kod:=Int(Kod/1000)*1000;
     Else
        Kod:=0;
     End;
     Result:=AccNam(Kod);
end;

Procedure TFVariance.ThreeColReport;
begin
end;

Procedure TFVariance.FourColReport;
begin
end;

Procedure TFVariance.GetSums;
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
procedure TFVariance.BexitClick(Sender: TObject);
begin
     Frodm.Gardesh.Active :=False;
     Frodm.Gardesh.Exclusive :=False;
     Close;
end;

procedure TFVariance.FAccNamChange(Sender: TObject);
Var
Kod:Real;
AcTip:Integer;
begin
     Kod:=AccKod(FAccNam.Text);
     AcTip:=AccountType(Kod);
     Case AcTip of
      0:Sb1.Panels[1].Text:='ê—ÊÂ';
      1:Sb1.Panels[1].Text:='ﬂ·';
      2:Sb1.Panels[1].Text:='„⁄Ì‰';
      3:Sb1.Panels[1].Text:=' ›’Ì·Ì';
      4:Sb1.Panels[1].Text:=' ›’Ì·Ì œÊ„';
     End;
     UseTip:= Frodm.AcKodUseKod.Value;
     Case UseTip Of
     0:Begin
        Sb1.Panels[0].Text:='”—›’·';
        Sb1.Panels[2].Text :=AccString(Kod);
       End;
     1:Begin
        Sb1.Panels[0].Text:='⁄„·Ì« Ì';
        Sb1.Panels[2].Text :=AccString(Kod);
       End;
     End;
end;

procedure TFVariance.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Open_G(Frodm.Gardesh);
     Frodm.Gardesh.Active :=False;
     Frodm.Gardesh.Exclusive :=False;
     Action:=caFree;
end;

procedure TFVariance.FormCreate(Sender: TObject);
Var
St:String[10];
I:Integer;
begin
     Set_Forms(Self);
     GQu.DatabaseName:=CurrDb;
     Bexit.OnClick :=BexitClick;
     BShow.OnClick :=BShowClick;
     Main.glKey.GetBitmap(8,spCalc.Glyph);
     FCostN.Items.Assign(CostList);
     Fill_Comb(Frodm.Cent,CUser.CentField,FCentN.Items);
     FCentN.Enabled:=Frodm.Cent.RecordCount > 0;
     spCen.Enabled:=FcentN.Enabled;
     FCostN.Enabled:=CostList.Count > 0;
     sp.Enabled:=FCostN.Enabled;
     If CUser.Master Then
      Fill_Cond(Frodm.AcKod,'Nam','Usekod =1',FAccNam.Items)
     else
      FAccNam.Items.Assign(AcList);
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

procedure TFVariance.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     IF Key = VK_F3 Then BShowClick(Sender);
end;

procedure TFVariance.BShowClick(Sender: TObject);
//Var
//Acount:Real;
begin
     Screen.Cursor:=crHourGlass;
     Kod:=Acckod(FAccNam.Text);
     Create_Gardesh_Table('Gardesh'+IntToStr(CUser.Id));
     GQu.SQL.Clear;
     GQu.SQL.Add('Select * From '+Frodm.Gardesh.TableName+' order by Id');
     Open_g(Frodm.Gardesh);

     Gardesh_Date(Kod,DateToInt(Sdat.Text),DateToInt(Edat.Text),FCentN.Text,FCostN.Text);

     GQu.Close;
     GQu.Open;
     GQu.Last;
     GetSums;
     Close_g(Frodm.Gardesh);
     Delete_Gardesh_Table;
     Screen.Cursor:=crDefault;
end;

procedure TFVariance.GdbgKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
       Key:=#0;
       GMove(Gdbg,Frodm.Gardesh);
     End;
end;

procedure TFVariance.SDatEnter(Sender: TObject);
begin
     GetMaskText(SDat);
end;

procedure TFVariance.SDatExit(Sender: TObject);
begin
     SetMaskText(SDat);
     If (Not Date_Check(SDat.Text))and(DateToInt(SDat.Text)>0) Then SDat.SetFocus;
end;

procedure TFVariance.EDatEnter(Sender: TObject);
begin
     GetMaskText(EDat);
end;

procedure TFVariance.EDatExit(Sender: TObject);
begin
     SetMaskText(EDat);
     If (Not Date_Check(EDat.Text))and(DateToInt(EDat.Text)>0) Then EDat.SetFocus;
end;

procedure TFVariance.GdbgDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if DataCol = ColumnWidthHelper.Index then
  begin
   if Assigned(Column.Field) then
   ColumnWidthHelper.MaxWidth := Max(ColumnWidthHelper.MaxWidth, gDbg.Canvas.TextWidth(Column.Field.DisplayText));
  end;
     If (GQuDesc.Value = '„«‰œÂ ﬁ»·Ì')Or(GQuDesc.Value = 'Ã„⁄') Then Gdbg.Canvas.Font.Color:=clRed;

     If ( GQuDchek.Value ) and Not (gdSelected in State)  Then
      If (GQuId.AsInteger Mod 2 =1)Then
       Gdbg.Canvas.Brush.Color:=$00AACBA5
      else
       Gdbg.Canvas.Brush.Color:=$00C8DDCB;

     Gdbg.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TFVariance.FAccNamKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetAccountCombo(Sender,Key);
     FAccNamChange(Owner);
end;

procedure TFVariance.SpCenClick(Sender: TObject);
begin
     FCentN.Text:=A_Choose;
end;

procedure TFVariance.SpClick(Sender: TObject);
begin
     FCostN.ItemIndex:=-1;
     FCostN.Text:=C_Choose;
end;

procedure TFVariance.FCentNKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetCentLookup(Sender,Key);
end;

procedure TFVariance.SP6Click(Sender: TObject);
Var
I:Integer;
iBid:Integer;
begin
     If Gdbg.SelectedRows.Count > 0 Then
     Begin
      For I:=0 To Gdbg.SelectedRows.Count-1 Do
      Begin
        GQu.GotoBookmark(Pointer(Gdbg.SelectedRows.items[I]));
        iBid:=GQuBid.AsInteger;
        Frodm.Acbill.Locate('Id',iBid,[loCaseInsensitive]);
        Frodm.Acbill.Edit;
        Frodm.AcbillDchek.Value:=True;
        Frodm.Acbill.Post;
      End;
      BShowClick(owner);
      GQu.Locate('Bid',iBid,[loCaseInsensitive]);
     End;
{     Else
     Begin
        iBid:=GQuBid.AsInteger;
        Frodm.Acbill.Locate('Id',iBid,[loCaseInsensitive]);
        Frodm.Acbill.Edit;
        Frodm.AcbillDchek.Value:=True;
        Frodm.Acbill.Post;
     End;  }
end;

procedure TFVariance.sp5Click(Sender: TObject);
Var
I:Integer;
iBid:Integer;
begin
     If Gdbg.SelectedRows.Count > 0 Then
     Begin
      For I:=0 To Gdbg.SelectedRows.Count-1 Do
      Begin
        GQu.GotoBookmark(Pointer(Gdbg.SelectedRows.items[I]));
        iBid:=GQuBid.AsInteger;
        Frodm.Acbill.Locate('Id',iBid,[loCaseInsensitive]);
        Frodm.Acbill.Edit;
        Frodm.AcbillDchek.Value:=False;
        Frodm.Acbill.Post;
      End;
      BShowClick(owner);
      GQu.Locate('Bid',iBid,[loCaseInsensitive]);
     End;
{     Else
     Begin
        iBid:=GQuBid.AsInteger;
        Frodm.Acbill.Locate('Id',iBid,[loCaseInsensitive]);
        Frodm.Acbill.Edit;
        Frodm.AcbillDchek.Value:=False;
        Frodm.Acbill.Post;
     End;   }
end;

procedure TFVariance.tvAckodKeyPress(Sender: TObject; var Key: Char);
begin
     IF Key = #13 Then
     Begin
      Key:=#0;
      Kod:=tvAcKod.Selected.AcCode;
      If tvAcKod.Selected.Count >0 Then Exit;
      AcTip:=AccountType(Kod);
      Case AcTip of
       0:Sb1.Panels[1].Text:='ê—ÊÂ';
       1:Sb1.Panels[1].Text:='ﬂ·';
       2:Sb1.Panels[1].Text:='„⁄Ì‰';
       3:Sb1.Panels[1].Text:=' ›’Ì·Ì';
       4:Sb1.Panels[1].Text:=' ›’Ì·Ì œÊ„';
      End;
      UseTip:= Frodm.AcKodUseKod.Value;
      Case UseTip Of
      0:Begin
        Sb1.Panels[0].Text:='”—›’·';
        Sb1.Panels[2].Text :=AccString(Kod);
        End;
      1:Begin
        Sb1.Panels[0].Text:='⁄„·Ì« Ì';
        Sb1.Panels[2].Text :=AccString(Kod);
        End;
      End;
//---------
     Screen.Cursor:=crHourGlass;
     Create_Gardesh_Table('Gardesh'+IntToStr(CUser.Id));
     GQu.SQL.Clear;
     GQu.SQL.Add('Select * From '+Frodm.Gardesh.TableName+' order by Id');
     Open_g(Frodm.Gardesh);
     FAccNam.Text:=tvAcKod.Selected.Text;
     Gardesh_Date(Kod,DateToInt(Sdat.Text),DateToInt(Edat.Text),FCentN.Text,FCostN.Text);

     GQu.Close;
     GQu.Open;
     GQu.Last;
     Close_g(Frodm.Gardesh);
     Delete_Gardesh_Table;
     Screen.Cursor:=crDefault;
//---------
     End;
end;

end.
