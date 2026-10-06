unit GoodEst;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, XPListBox, ExtCtrls, ComCtrls, Grids, DBGrids, Db, DBTables,
  Buttons, TeEngine, TeeFunci, Series, TeeProcs, Chart, DBChart;

type
  TFGoodEst = class(TForm)
    Bevel1: TBevel;
    CTree: TTreeView;
    Splitter1: TSplitter;
    GList: TXPListBox;
    Label1: TLabel;
    FGNam: TComboBox;
    Bevel3: TBevel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    FKod1: TEdit;
    FKod2: TEdit;
    FKod3: TEdit;
    FKod31: TEdit;
    SB: TStatusBar;
    Splitter2: TSplitter;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label2: TLabel;
    Bevel2: TBevel;
    FAccNam: TComboBox;
    Label4: TLabel;
    FCentN: TComboBox;
    Pdbg: TDBGrid;
    Bevel4: TBevel;
    TabSheet2: TTabSheet;
    QFee: TQuery;
    FeeDs: TDataSource;
    QFeeKod: TIntegerField;
    QFeeNam: TStringField;
    QFeeQuant: TFloatField;
    QFeeUnit: TStringField;
    QFeePfee: TCurrencyField;
    QFeePerc: TFloatField;
    QFeePtotal: TCurrencyField;
    QFeeNo: TIntegerField;
    QFeeDat: TIntegerField;
    QFeeAcnam: TStringField;
    QFeeCkod: TIntegerField;
    Label3: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    FMFee: TEdit;
    FMaxFee: TEdit;
    FMinFee: TEdit;
    Label11: TLabel;
    FMaxQt: TEdit;
    Label12: TLabel;
    FMinQt: TEdit;
    spCalc: TSpeedButton;
    MfDbg: TDBGrid;
    QMFee: TQuery;
    QMFeePfee: TCurrencyField;
    QMFeeQuant: TFloatField;
    MFeeDs: TDataSource;
    QMFeeNam: TStringField;
    Dbc: TDBChart;
    Series3: TBarSeries;
    TeeFunction1: TSubtractTeeFunction;
    Bevel5: TBevel;
    TabSheet3: TTabSheet;
    Label14: TLabel;
    FTotQt: TEdit;
    Label15: TLabel;
    Label13: TLabel;
    FMoj: TEdit;
    FBFee: TEdit;
    Bevel6: TBevel;
    DBChart1: TDBChart;
    SubtractTeeFunction1: TSubtractTeeFunction;
    BarSeries1: TLineSeries;
    QDFee: TQuery;
    QDFeeDat: TIntegerField;
    QDFeeFee: TFloatField;
    QDFeeQuant: TFloatField;
    Series1: TLineSeries;
    TeeFunction2: TAverageTeeFunction;
    TabSheet4: TTabSheet;
    QCust: TQuery;
    Bevel7: TBevel;
    DBChart2: TDBChart;
    SubtractTeeFunction2: TSubtractTeeFunction;
    QCustNam: TStringField;
    QCustQuant: TFloatField;
    LineSeries1: TBarSeries;
    QCent: TQuery;
    StringField1: TStringField;
    FloatField1: TFloatField;
    sbPrev: TSpeedButton;
    sbNext: TSpeedButton;
    bPrint: TSpeedButton;
    UpDown1: TUpDown;
    Cnt: TEdit;
    RG: TRadioGroup;
    Qdis: TQuery;
    StringField2: TStringField;
    FloatField2: TFloatField;
    procedure NextTab(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CTreeClick(Sender: TObject);
    procedure FGNamKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FAccNamKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FCentNKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure spCalcClick(Sender: TObject);
    procedure GListClick(Sender: TObject);
    procedure PdbgDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure CntChange(Sender: TObject);
    procedure sbPrevClick(Sender: TObject);
    procedure sbNextClick(Sender: TObject);
    procedure bPrintClick(Sender: TObject);
    procedure RGClick(Sender: TObject);
  private
    { Private declarations }
    FKol:SmallInt;// Integer;
    FMo:SmallInt;
    FTaf:SmallInt;
    sPath:String;
    FGKod:Real;
    GName:String;
    Function GetBuyFee (GKod:Real):Currency;
    Function MakePriceFilter:String;
  public
    { Public declarations }
  end;

var
  FGoodEst: TFGoodEst;

implementation

uses CRoutins, FrooshDM, ProVar, Routins;

{$R *.DFM}

{ TFGoodEst }
Function TFGoodEst.GetBuyFee (GKod:Real):Currency;
begin
 Qu.SQL.Clear;
 Qu.SQL.Add('Select Sum(Ptotal)/Sum(Quant) From Binvogood Where kod=:a ');
 Qu.Params[0].Value:=Gkod;
 Qu.Open;
 Result:=Qu.Fields[0].AsCurrency;
 Qu.Close;
end;


Function TFGoodEst.MakePriceFilter: String;
Var
St:String;
begin
     St:='';
     If FGNam.Text <> ''  Then St:=St+' and Nam = '+QuotedStr(FGNam.Text);
     If Glist.ItemIndex <>-1 Then St:=St+' and Nam = '+#39+GList.Items[Glist.itemIndex]+#39;
     If FAccNam.Text <>'' Then St:=St+' and AcNam = '+QuotedStr(FAccNam.Text);
     If FCentN.Text <> ''  Then St:=St+' and Ckod = '+IntToStr(CentKod(FCentN.Text));
     If Pos(' and',St) = 1 Then Delete(St,1,4);
     Result:=St;
end;

procedure TFGoodEst.NextTab(Sender: TObject; var Key: Char);
begin
     If Key=#13 Then
     Begin
      Key:=#0;
      SelectNext(Sender As TWinControl,True,True);
     End;
end;

procedure TFGoodEst.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFGoodEst.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     QFee.DatabaseName:=CurrDb;
     QMFee.DatabaseName:=CurrDb;
     QDFee.DatabaseName:=CurrDb;
     QDis.DatabaseName:=CurrDb;
     MakeGoodTree(CTree);
     FGNam.Items.Assign(Kala);
     Fill_Comb(Frodm.Invo,'Nam',FAccNam.Items);
     Fill_Comb(Frodm.Cent,CUser.CentField,FCentN.Items);
end;

procedure TFGoodEst.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     //888888888
end;


procedure TFGoodEst.CTreeClick(Sender: TObject);
Var
I,J,Idx:Integer;
Node:TTreeNode;
begin
     Node:=cTree.Selected;
     FGNam.Items.Assign(Kala);
     FKol:=0;FMo:=0;FTaf:=0;sPath:='';
     FGNam.Clear;
     FKod1.Clear;FKod2.Clear;FKod3.Clear;FKod31.Clear;
     If Node.Level <1 Then Exit;
     For I:=ctree.Selected.Level DownTo 0 Do
     Begin
      Case Node.Level Of
      3: FTaf:=Node.OverlayIndex;
      2: FMo :=Node.OverlayIndex;
      1: FKol:=Node.OverlayIndex;
      End;
      Case Node.Level Of
      3: sPath:=Node.Text;//sPath+'<--'+
      2: sPath:=sPath+'<--'+Node.Text;
      1: sPath:=sPath+'<--'+Node.Text;
      End;
      Node:=Node.Parent;
     End;
     FKod1.Text:=IntToStr(FKol);
     IF FMo>0 Then FKod2.Text:=IntToStr(FMo);
     IF FTaf>0 Then FKod3.Text:=IntToStr(FTaf);
     IF FTaf>0 Then FKod31.Text:=IntToStr(FTaf);
     Qu.SQL.Clear;
     Qu.SQL.Add('Select I.Nam,I.Kod From Goods I ');
     Case cTree.Selected.Level of
     1:Begin
        Qu.SQL.Add('Where I.Kol=:t');
        Qu.Params[0].Value:=FKol;
       End;
     2:Begin
       Qu.SQL.Add('Where I.Kol=:t and I.Mo=:s');
       Qu.Params[0].Value:=FKol;
       Qu.Params[1].Value:=FMo;
       End;
     3:Begin
       Qu.SQL.Add('Where I.Kol=:t and I.Mo=:s  and I.Taf=:g ');
       Qu.Params[0].Value:=FKol;
       Qu.Params[1].Value:=FMo;
       Qu.Params[2].Value:=FTaf;
       End;
     End;
     sPath:=IntToStr(FTaf)+'<--'+IntToStr(FMo)+'<--'+IntToStr(FKol)+'       '+sPath;
     Sb.Panels[2].Text:=sPath;
     Qu.Open;
     FGNam.Items.Clear;
     GList.Items.Clear;
     For I:=1 To Qu.RecordCount Do
     Begin
      FGNam.Items.Add(Qu.Fields[0].AsString);
      Idx:=GList.Items.Add(Qu.Fields[0].AsString);
      GList.AcCode[Idx]:=Qu.Fields[1].Value;
      //GList.AcCode[Idx]:=Qu.Fields[1].Value;
      Qu.Next;
     End;
     Qu.Close;
end;

procedure TFGoodEst.FGNamKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetGoodCombo(Sender,Key);
end;

procedure TFGoodEst.FAccNamKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetAccountCombo(Sender,Key);
end;

procedure TFGoodEst.FCentNKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetCentLookup(Sender,Key);
end;


procedure TFGoodEst.spCalcClick(Sender: TObject);
Var
I:Integer;
QSum:Real;
PSum:Currency;
begin
     Pdbg.DataSource:=nil;
     If GList.Selected[GList.ItemIndex] Then
     Begin
      GName:=GList.Items[GList.ItemIndex];
      FGKod:=GList.AcCode[GList.ItemIndex];
     End Else Begin
      FGKod:=GoodKod(FGNam.Text);
      GName:=FGNam.Text;
     End;
     FMoj.Text:=FloatToStr(Good_Moj(GName,''));
     FBFee.Text:=CurrToFar(GetBuyFee(FGKod));
     QFee.Close;
     QFee.Filter:=MakePriceFilter;
     QFee.Filtered:=QFee.Filter <>'';
     QFee.Open;
     QSum:=0;PSum:=0;
     For I:=1 To QFee.RecordCount Do
     Begin
      QSum:=QSum+QFeeQuant.AsFloat;
      PSum:=PSum+QFeePtotal.AsCurrency;
      QFee.Next
     End;
     QFee.First;
     FMFee.Text:=CurrToFar(PSum/QSum);
     FTotQt.Text:=FloatToStr(QSum);
     QFee.Close;
     QFee.SQL.Strings[3]:='Order by PFee Desc,Quant Desc';
     QFee.Open;
     QFee.First;
     FMaxFee.Text:=CurrToFar(QFeePFee.AsCurrency);
     FMaxQt.Text:=QFeeQuant.AsString;
     QFee.Close;
     QFee.SQL.Strings[3]:='Order by PFee,Quant';
     QFee.Open;
     QFee.First;
     FMinFee.Text:=CurrToFar(QFeePFee.AsCurrency);
     FMinQt.Text:=QFeeQuant.AsString;
     QFee.Close;
     QFee.SQL.Strings[3]:='Order by I.Dat';
     QFee.Open;
     QFee.First;
     Pdbg.DataSource:=FeeDs;
     QMFee.Close;
     QMFee.Filter:='Nam = '+QuotedStr(GName);
     QMFee.Filtered:=True;
     QMFee.Open;
     QDFee.Close;
     QDFee.Params[0].Value:=FGKod;
     QDFee.Open;
     QDis.Open;
end;

procedure TFGoodEst.GListClick(Sender: TObject);
begin
     FGNam.Clear;
     spCalcClick(Sender);
end;

procedure TFGoodEst.PdbgDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
Var
DrawRect: TRect;
begin
    if (Column.Field.FieldName ='Ckod' ) then
    Begin
     DrawRect:=Rect;
     Pdbg.Canvas.FillRect(DrawRect);
     If Not Column.Field.IsNull Then
     Pdbg.Canvas.Textout(DrawRect.Left+4,DrawRect.Top,CentName(Column.Field.Value));
    End;
end;

procedure TFGoodEst.CntChange(Sender: TObject);
begin
     Dbc.MaxPointsPerPage:=StrToIntDef(Cnt.Text,10);
end;

procedure TFGoodEst.sbPrevClick(Sender: TObject);
begin
     (Sender as TDBChart).PreviousPage;
end;

procedure TFGoodEst.sbNextClick(Sender: TObject);
begin
     (Sender as TDBChart).NextPage;
end;

procedure TFGoodEst.bPrintClick(Sender: TObject);
begin
     With Sender as TDBChart Do
     Begin
      PrintMargins.Top:=5;
      PrintMargins.Bottom:=0;
      PrintMargins.Left:=0;
      PrintMargins.Right:=5;
      PrintLandscape;
     End;

end;

procedure TFGoodEst.RGClick(Sender: TObject);
begin
     QDis.Close;
     Case Rg.ItemIndex Of
     0:QDis.SQL:=QCust.SQL;
     1:QDis.SQL:=QCent.SQL;
     End;
     QDis.Open
end;

end.
