unit GProfit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ExtCtrls, ComCtrls, Db, DBTables, Grids, DBGrids,
  XPListBox;

type
  TFGProfit = class(TForm)
    BPrint: TButton;
    BShow: TButton;
    BQu: TQuery;
    GQu: TQuery;
    Ds: TDataSource;
    GQuId: TIntegerField;
    GQuDat: TIntegerField;
    GQuNam: TStringField;
    GQuColor: TStringField;
    GQuAnb: TStringField;
    GQuAnbKod: TIntegerField;
    GQuIn: TFloatField;
    GQuOut: TFloatField;
    GQuRem: TFloatField;
    GQuNo: TIntegerField;
    GQuDes: TStringField;
    GQuFacnam: TStringField;
    GQuFee: TCurrencyField;
    GQuPerc: TFloatField;
    GQuPrem: TCurrencyField;
    GQuDiag: TFloatField;
    GQuPdiag: TCurrencyField;
    BQuId: TIntegerField;
    BQuKod: TIntegerField;
    BQuGene: TIntegerField;
    BQuNam: TStringField;
    BQuColor: TStringField;
    BQuAnbNam: TStringField;
    BQuQuant: TFloatField;
    QSum: TQuery;
    BQuAnbkod: TFloatField;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    FKod1: TEdit;
    FKod2: TEdit;
    FKod3: TEdit;
    FKod31: TEdit;
    CTree: TTreeView;
    Splitter2: TSplitter;
    SB: TStatusBar;
    GList: TXPListBox;
    Splitter1: TSplitter;
    Label2: TLabel;
    Label3: TLabel;
    Color: TComboBox;
    Anb: TComboBox;
    Panel1: TPanel;
    dbg: TDBGrid;
    Panel2: TPanel;
    PrgB: TProgressBar;
    lGname: TLabel;
    FGNam: TComboBox;
    Panel3: TPanel;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    FValue: TEdit;
    FSold: TEdit;
    FTam: TEdit;
    Fbenef: TEdit;
    Label7: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BPrintClick(Sender: TObject);
    procedure NextTab(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure BShowClick(Sender: TObject);
    procedure FGNamKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgKeyPress(Sender: TObject; var Key: Char);
    procedure CTreeClick(Sender: TObject);
  private
    { Private declarations }
    FKol:SmallInt;// Integer;
    FMo:SmallInt;
    FTaf:SmallInt;
    sPath:String;
    Function MakeFilt:String;
    Function Sold_Filt:String;
    Function Cost_Filt:String;
    Function SumFro(Filt:String):Currency;
    Function SumBuy(Filt:String):Currency;
    Function SumCost:Currency;

  public
    { Public declarations }
  end;

var
  FGProfit: TFGProfit;

implementation

uses FrooshDM, ProVar, Routins, CRoutins, RepGProf, Converts, RepGAnal;//,DbTables;

{$R *.DFM}

Function TFGProfit.MakeFilt:String;
Var
stFlt:String;
Begin
     Result:='';
     If FGNam.Text <>'' Then Result:=Result+' and Nam = '+#39+FGNam.Text+#39;
     If Glist.ItemIndex <>-1 Then Result:=Result+' and Nam = '+#39+GList.Items[Glist.itemIndex]+#39;
     If (FKod1.Text >'')or(FKod2.Text >'')or(FKod3.Text >'') Then
     Begin
      stFlt:='';
      Result:=Result+' and Kod in (Select Kod From Goods Where ';
      If FKod1.Text >''   Then stFlt:=stFlt+' and Kol = '+FKod1.Text;
      If FKod2.Text >''   Then stFlt:=stFlt+' and Mo = '+FKod2.Text;
      If FKod3.Text >''   Then stFlt:=stFlt+' and Taf >= '+FKod3.Text;
      If Fkod31.Text >''  Then stFlt:=stFlt+' and Taf <= '+FKod31.Text;
      If Pos(' and',stFlt) = 1 Then Delete(stFlt,1,4);
      Result:=Result+stFlt+')';
     End;
     If Pos(' and',Result) = 1 Then Delete(Result,1,4);
end;

Function TFGProfit.Sold_Filt:String;
Var
I:Integer;
Str:String;
begin
     Str:='';
     If Not BQu.Active Then Exit;
     I:=GoodKod(FGNam.Text);
     If BQuKod.AsInteger > 0   Then Str:='Kod = '+BQuKod.AsString;
     If BQuColor.AsString <> '' Then Str:=Str+' and Color = '+#39+BQuColor.AsString+#39;
     If BQuAnbNam.AsString <> ''   Then Str:=Str+' and AnbNam = '+#39+BQuAnbNam.AsString+#39;
     If BQuAnbKod.AsInteger >0Then Str:=Str+' and AnbKod = '+BQuAnbKod.AsString;
     If Pos(' and',Str) = 1 Then Delete(Str,1,4);
     Result:=Str;
end;

Function TFGProfit.SumFro(Filt:String):Currency;
begin
     Qu.Sql.Clear;
     Qu.Sql.Add('SELECT SUM(Ptotal)');
     Qu.Sql.Add('FROM Invogood');
     If Filt > '' Then Qu.SQL.Add('WHERE '+Filt);
     Qu.Open;
     Result:=Qu.Fields[0].AsCurrency;
     Qu.Close;
     Qu.Sql.Clear;
     Qu.Sql.Add('SELECT SUM(Ptotal)');
     Qu.Sql.Add('FROM RejInvogood');
     Qu.SQL.Add('WHERE '+Filt);//If Filt > '' Then
     Qu.Open;
     Result:=Result-Qu.Fields[0].AsCurrency;
     Qu.Close;
end;

Function TFGProfit.SumBuy(Filt:String):Currency;
begin
     Qu.Sql.Clear;
     Qu.Sql.Add('SELECT SUM(Pfee*Quant)');
     Qu.Sql.Add('FROM Binvogood');
     If Filt > '' Then Qu.SQL.Add('WHERE '+Filt);
     Qu.Open;
     Result:=Qu.Fields[0].AsCurrency;
     Qu.Close;
     Qu.Sql.Clear;
     Qu.Sql.Add('SELECT SUM(Reject*Quant)');
     Qu.Sql.Add('FROM RejBinvogood R ');
     Qu.Sql.Add('Where R.No >0  And '+Filt);
//     If Filt > '' Then Qu.SQL.Add(' And '+Filt);
     Qu.Open;
     Result:=Round(Result-Qu.Fields[0].AsCurrency);
     Qu.Close;
end;

Function TFGProfit.Cost_Filt:String;
Var
I:Integer;
Str:String;
begin
     Str:='';
     I:=GoodKod(FGNam.Text);
     If FGNam.Text > ''   Then Str:='Kod = '+IntToStr(I);
     If Color.Text <> '' Then Str:=Str+' and Color = '+#39+Color.Text+#39;
     If Anb.Text <> ''   Then Str:=Str+' and AnbNam = '+#39+Anb.Text+#39;

     If Pos(' and',Str) = 1 Then Delete(Str,1,4);
     Result:=Str;
end;

Function TFGProfit.SumCost:Currency;
Var
LastValue:Currency;
begin
     Frodm.Depot.Filter :=Cost_Filt;
     Frodm.Depot.Filtered:=True;
     Result:=Sum_Sold_Price(LastValue);;
     Frodm.Depot.Filtered:=False;
end;
//End Of Privates

procedure TFGProfit.FormCreate(Sender: TObject);
begin
     Set_Forms(FGProfit);
     BQu.DatabaseName:=CurrDb;
     GQu.DatabaseName:=CurrDb;
     QSum.DatabaseName:=CurrDb;
     MakeGoodTree(CTree);
     FGnam.Items.Assign(Kala);
     Fill_Comb(Frodm.Color,'Color',Color.Items);
     Fill_Comb(Frodm.AnbDat,'Nam',Anb.Items);
end;

procedure TFGProfit.FormActivate(Sender: TObject);
begin
     Color.Enabled :=SModel;
     Label2.Enabled :=Color.Enabled;
end;

procedure TFGProfit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action :=caFree;
end;

procedure TFGProfit.NextTab(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
       Key:=#0;
       SelectNext(Sender As TWinControl,True,True);
     End;
end;

procedure TFGProfit.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case  Key  Of
     VK_F3 :  BShowClick(Sender);
     VK_Cancel: if messageDlg('ÝÑã ÈÓÊå ÔæÏ¿',mtConfirmation,MBYESNO,-1) = mrYes Then Close;
     End;
end;

procedure TFGProfit.BShowClick(Sender: TObject);
Var
Filt:String;
J:Integer;
T1:TTable;
I,AnbKod:Integer;
GNam,GKod,Color,AnbNam:String;
Q:Real;
LastValue:Currency;
begin
     Panel3.Visible:=False;
     Filt:=MakeFilt;
     Open_g(Frodm.Cardex);
     BQu.Close;
     GQu.Close;
     T1:=TTable.Create(Owner);
     T1.DatabaseName:=CurrDb;
     T1.TableName:='CarT';
     T1.FieldDefs.Assign(Frodm.Cardex.FieldDefs);
     T1.CreateTable;
     T1.Open;
     If Filt >'' Then BQu.SQl.Strings[2]:='Where '+Filt;
     BQu.Open;
     BQu.Filter:=Cost_Filt;
     BQu.Filtered:=True;
     PrgB.Min:=0;
     Prgb.Max:=BQu.RecordCount;
     PrgB.Position:=0;
     Panel2.Visible:=True;
     For I:=1 To BQu.RecordCount Do
     Begin
       PrgB.Position:=I;
       GNam:=BQuNam.AsString;
       GKod:=BQuKod.AsString;
       Color:=BQuColor.AsString;
       AnbNam:=BQuAnbNam.AsString;
       AnbKod:=BQuAnbKod.AsInteger;
       lGname.Caption:=GNam;
       lGname.Refresh;
       Q:=0;//BQuQuant.AsFloat;
       Filt:=Sold_Filt;
       T1.Append;
       T1.FieldByName('Nam').Value:=GNam;
       T1.FieldByName('Anb').Value:=AnbNam;
       T1.FieldByName('AnbKod').Value:=AnbKod;
       T1.FieldByName('Color').Value:=Color;
       T1.FieldByName('Fee').AsCurrency:=SumFro(Filt);
       T1.FieldByName('Rem').AsCurrency:=SumBuy(Filt);
       T1.FieldByName('Out').AsFloat:=BQuQuant.AsFloat;;
       T1.FieldByName('Prem').AsCurrency:=Sold_Price(P_Rule,Qu,GKod,Color,
        AnbNam,AnbKod,0,111111111,Q,LastValue);
       T1.FieldByName('Diag').AsCurrency:=LastValue;
       If BQuQuant.AsFloat > 0 Then
       T1.FieldByName('Perc').AsCurrency:=Round(T1.FieldByName('Diag').AsCurrency/BQuQuant.AsFloat);
       T1.FieldByName('IIn').AsCurrency:=T1.FieldByName('Rem').AsCurrency-
       (T1.FieldByName('Diag').AsCurrency+T1.FieldByName('Prem').AsCurrency);
       T1.FieldByName('Pdiag').Value:=T1.FieldByName('Fee').AsCurrency - T1.FieldByName('Prem').Value;
       T1.Post;
       BQu.Next;
     End;
     BQu.Close;
     T1.First;
     Close_g(Frodm.Cardex);
     Frodm.Cardex.Open;
     T1.Close;
     T1.Open;
     For I:=1 To T1.RecordCount Do
     Begin
      Frodm.Cardex.Append;
      For J:=1 To Frodm.Cardex.Fields.Count-1 Do
      Frodm.Cardex.Fields[J].Value:=T1.Fields[J].Value;
      Frodm.Cardex.Post;
      T1.Next;
     End;
     T1.Close;
     T1.DeleteTable;
{     ShowMessage('1');
     QSum.Open;
     Frodm.Cardex.Append;
     Frodm.CardexRem.Value:=QSum.Fields[0].Value;
     Frodm.CardexPRem.Value:=QSum.Fields[1].Value;
     Frodm.CardexDiag.Value:=QSum.Fields[2].Value;
     Frodm.CardexFee.Value:=QSum.Fields[3].Value;
     Frodm.CardexPDiag.Value:=QSum.Fields[4].Value;
     ShowMessage('2');
     Frodm.CardexIn.Value:=QSum.Fields[5].Value;
     ShowMessage('3');
     Frodm.CardexNam.Value:='ÌãÚ ˜á';
     Frodm.Cardex.Post;
     QSum.Close;  }
     Qu.SQl.Clear;
     Qu.SQL.Add('Select Sum(Diag),Sum(Fee),Sum(PRem) From Cardex');
     Qu.Open;
     FValue.Text:=CurrToFar(Qu.Fields[0].AsCurrency);
     FSold.Text:=CurrToFar(Qu.Fields[1].AsCurrency);
     FTam.Text:=CurrToFar(Qu.Fields[2].AsCurrency);
     FBenef.Text:=CurrToFar(Qu.Fields[1].AsCurrency-Qu.Fields[2].AsCurrency);
     Label7.Caption:=FarsiPrice(Qu.Fields[1].AsCurrency-Qu.Fields[2].AsCurrency);
     QU.Close;
     GQu.Open;
     Panel2.Visible:=False;
     Panel3.Visible:=True;
//     Close_g(Frodm.Cardex);
end;

procedure TFGProfit.BPrintClick(Sender: TObject);
begin
     CreatingForm(TGAnalRep,'GAnalRep',GAnalRep);
     Set_Sys_Enviroment;
     GAnalRep.Page.Width:=297;
     GAnalRep.Page.Length:=210;
     GAnalRep.QrDat.Caption:=IntToDate(Fardate);
     GAnalRep.qrRule.Caption:=P_Rule;
     GAnalRep.Preview;
     GAnalRep.Destroy;
end;

procedure TFGProfit.FGNamKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetGoodCombo(Sender,Key);
end;

procedure TFGProfit.dbgKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
      Key:=#0;
      GMove(dbg,Frodm.Cardex);
     End;
end;

procedure TFGProfit.CTreeClick(Sender: TObject);
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
     GList.Items.Clear;
     For I:=1 To Qu.RecordCount Do
     Begin
      FGNam.Items.Add(Qu.Fields[0].AsString);
      Idx:=GList.Items.Add(Qu.Fields[0].AsString);
      GList.AcCode[Idx]:=Qu.Fields[1].Value;
      Qu.Next;
     End;
     Qu.Close;
end;

end.
