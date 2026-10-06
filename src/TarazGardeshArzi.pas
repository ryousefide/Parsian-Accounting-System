unit TarazGardeshArzi;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, Db, DBTables, StdCtrls, Mask, ExtCtrls, ComCtrls,
  Buttons;

type
  TFTGardeshArzi = class(TForm)
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
    Label5: TLabel;
    cbCurr: TComboBox;
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
    procedure GdbgDblClick(Sender: TObject);
    procedure GdbgDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BprintClick(Sender: TObject);
    procedure SpCenClick(Sender: TObject);
    procedure SpClick(Sender: TObject);
    procedure FCentNKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    UseTip:Integer;
    sCurr:String;
    BedSum:Currency;
    BesSum:Currency;
    SbedRem:Currency;
    SbesRem:Currency;
    Procedure FourColReport;
    Procedure GetSums;
  public
    { Public declarations }
  end;

var
  FTGardeshArzi: TFTGardeshArzi;

implementation

uses Routins, FrooshDM, GardeshRep, ProVar, Diag, DiagMo, AcSearch,
  Converts, Bill, TarazReport,XPListBox, CRoutins,Math, SolarUtl;
var
  ColumnWidthHelper : TColumnWidthHelper;
{$R *.DFM}

procedure TFTGardeshArzi.NextTab(Sender: TObject; var Key: Char);
begin
     If Key=#13 Then
     Begin
      Key:=#0;
      SelectNext(Sender As TWinControl,True,True);
     End;
end;

Procedure TFTGardeshArzi.FourColReport;
begin
     CreatingForm(TTarazRep,'TarazRep',TarazRep);
     Set_Sys_Enviroment;
     TarazRep.qrTit.Caption:=InvoLbl;
     TarazRep.qrCost.Caption:=FCostN.Text;
     TarazRep.qrCent.Caption:=FCentN.Text;
     TarazRep.Cap:=CbCurr.Text;

     TarazRep.QRLabel1.Caption :=' —«“ çÂ«— ” Ê‰Ì «“ '+Rgt.Items.Strings[Rgt.ItemIndex]+
     ' «“ '+SDat.Text+' «·Ì '+EDat.Text;

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

Procedure TFTGardeshArzi.GetSums;
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
procedure TFTGardeshArzi.BexitClick(Sender: TObject);
begin
     Frodm.Gardesh.Active :=False;
     Frodm.Gardesh.Exclusive :=False;
     Close;
end;

procedure TFTGardeshArzi.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Open_G(Frodm.Gardesh);
     Frodm.Gardesh.Active :=False;
     Frodm.Gardesh.Exclusive :=False;
     Action:=caFree;
end;

procedure TFTGardeshArzi.FormCreate(Sender: TObject);
Var
St:String[10];
begin
     Set_Forms(Self);
     GQu.DatabaseName:=CurrDb;
     Bexit.OnClick :=BexitClick;
     BShow.OnClick :=BShowClick;

     Fill_Comb(Frodm.Cent,CUser.CentField,FCentN.Items);
     FCentN.Enabled:=Frodm.Cent.RecordCount > 0;
     spCen.Enabled:=FcentN.Enabled;

     FCostN.Items.Assign(CostList);
     FCostN.Enabled:=CostList.Count > 0;
     sp.Enabled:=FCostN.Enabled;
     cbCurr.Items.Assign(cUser.CurrList);
     
     St:=IntToDate(Fardate);
     st[9]:='0';
     St[10]:='1';
     SDat.Text:=Beg_Date;
     EDat.Text:=End_Date;
     GQu.SQL.Clear;
     GQu.SQL.Add('Select * From '+Frodm.Gardesh.TableName);
end;

procedure TFTGardeshArzi.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     IF Key = VK_F3 Then BShowClick(Sender);
end;

procedure TFTGardeshArzi.BShowClick(Sender: TObject);
Begin
     Screen.Cursor:=crHourGlass;
     Create_Gardesh_Table('Gardesh'+IntToStr(CUser.Id));
     GQu.SQL.Clear;
     GQu.SQL.Add('Select * From '+Frodm.Gardesh.TableName+' order by Id');
     Open_g(Frodm.Gardesh);
     If RGT.ItemIndex=0 Then
      Case Rg.ItemIndex of
         0:Gardesh_Kol_Arzi(-1.00,DateToStr(SDat.Text),DateToStr(EDat.Text),FCentN.Text,FCostN.Text,cbCurr.Text);
         1:Gardesh_Kol_Arzi(-1.00,'','',FCentN.Text,FCostN.Text,cbCurr.Text);
      End;
     If RGT.ItemIndex=1 Then
      Case Rg.ItemIndex of
         0:Kol_Taraz_Arzi(DateToStr(SDat.Text),DateToStr(EDat.Text),FCentN.Text,FCostN.Text,cbCurr.Text);
         1:Kol_Taraz_Arzi('','',FCentN.Text,FCostN.Text,cbCurr.Text);
      End;
     If RGT.ItemIndex=2 Then
      Case Rg.ItemIndex of
         0:Mo_Taraz_Arzi(DateToStr(SDat.Text),DateToStr(EDat.Text),FCentN.Text,FCostN.Text,cbCurr.Text);
         1:Mo_Taraz_Arzi('','',FCentN.Text,FCostN.Text,cbCurr.Text);
      End;
     If RGT.ItemIndex=3 Then
      Case Rg.ItemIndex of
         0:Taf_Taraz_Arzi(DateToStr(SDat.Text),DateToStr(EDat.Text),FCentN.Text,FCostN.Text,cbCurr.Text);
         1:Taf_Taraz_Arzi('','',FCentN.Text,FCostN.Text,cbCurr.Text);
      End;
     If RGT.ItemIndex=4 Then
      Case Rg.ItemIndex of
         0:Jos_Taraz_Arzi(DateToStr(SDat.Text),DateToStr(EDat.Text),FCentN.Text,FCostN.Text,cbCurr.Text);
         1:Jos_Taraz_Arzi('','',FCentN.Text,FCostN.Text,cbCurr.Text);
      End;

     GQu.Close;
     GQu.Open;
     GQu.Last;
     GetSums;
     Close_g(Frodm.Gardesh);
     Delete_Gardesh_Table;
     Screen.Cursor:=crDefault;
end;

procedure TFTGardeshArzi.GdbgKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Shift =[ssCtrl] Then BShow.SetFocus;
     If Shift =[ssCtrl]+[ssShift] Then RgT.SetFocus;
end;

procedure TFTGardeshArzi.GdbgKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
      Key:=#0;
      GMove(Gdbg,Frodm.Gardesh);
     End;
end;

procedure TFTGardeshArzi.SDatEnter(Sender: TObject);
begin
     GetMaskText(SDat);
end;

procedure TFTGardeshArzi.SDatExit(Sender: TObject);
begin
     SetMaskText(SDat);
     If (Not Date_Check(SDat.Text))and(DateToInt(SDat.Text)>0) Then SDat.SetFocus;
end;

procedure TFTGardeshArzi.EDatEnter(Sender: TObject);
begin
     GetMaskText(EDat);
end;

procedure TFTGardeshArzi.EDatExit(Sender: TObject);
begin
     SetMaskText(EDat);
     If (Not Date_Check(EDat.Text))and(DateToInt(EDat.Text)>0) Then EDat.SetFocus;
end;

procedure TFTGardeshArzi.GdbgDblClick(Sender: TObject);
Var
Kod:Real;
NO:Integer;
mouseInGrid : TPoint;
gridCoord: TGridCoord;
begin
end;

procedure TFTGardeshArzi.GdbgDrawColumnCell(Sender: TObject; const Rect: TRect;
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

procedure TFTGardeshArzi.BprintClick(Sender: TObject);
begin
     FourColReport;
end;

procedure TFTGardeshArzi.SpCenClick(Sender: TObject);
begin
     FCentN.Text:=A_Choose;
end;

procedure TFTGardeshArzi.SpClick(Sender: TObject);
begin
     FCostN.ItemIndex:=-1;
     FCostN.Text:=C_Choose;
end;



procedure TFTGardeshArzi.FCentNKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetCentLookup(Sender,Key);
end;

end.
