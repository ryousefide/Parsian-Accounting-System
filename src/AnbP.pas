unit AnbP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Db, DBTables, ComCtrls, Grids, DBGrids, Buttons;

type
  TFAnbP = class(TForm)
    DepQu: TQuery;
    Panel1: TPanel;
    Label2: TLabel;
    PrgB: TProgressBar;
    Splitter1: TSplitter;
    Panel2: TPanel;
    GQu: TQuery;
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
    Ds: TDataSource;
    dbg: TDBGrid;
    Panel3: TPanel;
    Label1: TLabel;
    BShow: TSpeedButton;
    spPrint: TSpeedButton;
    cmbAnb: TComboBox;
    RG: TRadioGroup;
    Panel4: TPanel;
    Bevel1: TBevel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    FKod1: TEdit;
    FKod2: TEdit;
    FKod3: TEdit;
    FKod31: TEdit;
    CTree: TTreeView;
    QFee: TQuery;
    QFeeKod: TIntegerField;
    QFeeFee: TFloatField;
    QFeeColor: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure NextTab(Sender: TObject; var Key: Char);
    procedure BshowClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure spPrintClick(Sender: TObject);
    procedure CTreeClick(Sender: TObject);
  private
    { Private declarations }
    FKol:SmallInt;// Integer;
    FMo:SmallInt;
    FTaf:SmallInt;
    sPath:String;
    Sum_Dep:Currency;
    Sum_Fro:Currency;
    Function MakeFilt:String;
    Function Calc_AnbP(DpName:String;T1:TTable):Currency;
  public
    { Public declarations }
  end;

var
  FAnbP: TFAnbP;

implementation

uses FrooshDM, ProVar, Routins, RepAnbP, MainForm, CRoutins;

{$R *.DFM}
Function TFAnbP.MakeFilt:String;
Var
stFlt:String;
Begin
     Result:='';
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

Function TFAnbP.Calc_AnbP(DpName:String;T1:TTable):Currency;
Var
I,AnbKod:Integer;
Nam,Color,Anb,GKod:String;
Quant:Real;
Valu:Currency;
MFee:Currency;
stFilt:String;
begin
     Result:=0;
     stFilt:=MakeFilt;
     If stFilt >'' Then
     Begin
      DepQu.SQL.Strings[2]:='Where AnbNam = :Anb1 And Quant > 0 and '+stFilt;
      QFee.SQL.Strings[2]:='Where '+stFilt;
     End;
     DepQu.Params[0].Value:=DpName;
     QFee.Open;
     DepQu.Open;
     DepQu.First;
     PrgB.Min:=0;
     PrgB.Max:=DepQu.RecordCount;
     PrgB.Position:=0;
     Sum_Fro:=0;
     For I:=1 To DepQu.RecordCount Do
     Begin
       PrgB.Position:=I;
       GKod:=DepQu.Fields[1].AsString;
       Nam:=DepQu.Fields[3].AsString;
       Label2.Caption:=Nam;
       Label2.Refresh;
       Color:=DepQu.Fields[4].AsString;
       Anb:=DepQu.Fields[5].AsString;
       AnbKod:=DepQu.Fields[6].AsInteger;
       Quant:=DepQu.Fields[7].AsFloat;
       If QFee.Locate('Kod;Color',Vararrayof([GKod,Color]),[loCaseInsensitive]) Then
        MFee:=QFeeFee.AsCurrency Else MFee:=0;
       { TODO :  ‰ŸÌ„  «—ÌŒ »—«Ì „Õ«”»Â «—“‘ —Ì«·Ì «‰»«— }
       Valu:=LastValue(P_Rule,Qu,GKod,Color,Anb,AnbKod,0,111111111,Quant);
       Result:=Result+Valu;
       If RG.ItemIndex In[0,2]Then
       Begin
         T1.Append;
         T1.Fields[2].Value:=Nam;
         T1.Fields[3].Value:=Color;
         T1.Fields[4].Value:=Anb;
         T1.Fields[5].Value:=AnbKod;
         T1.Fields[8].Value:=Quant;  //Rem
         T1.Fields[12].AsCurrency:=Round(Valu/Quant);
         T1.Fields[14].Value:=Valu;
         T1.Fields[15].Value:=MFee;
         T1.Fields[16].Value:=MFee*Quant;
         T1.Post;
         Sum_Fro:=Sum_Fro+T1.Fields[16].Value;
       End;
       DepQu.Next;
     End;
     DepQu.Close;
     T1.Append;
     T1.Fields[2].Value:='Ã„⁄ «—“‘  —Ì«·Ì «‰»«—  '+DpName;
     T1.Fields[14].Value:=Result;
     T1.Fields[16].Value:=Sum_Fro;
     T1.Post;
end;

procedure TFAnbP.NextTab(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
      Key:=#0;
      SelectNext(Sender As TWinControl,True,True);
     End;
end;

procedure TFAnbP.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFAnbP.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     Main.glKey.GetBitmap(8,bShow.Glyph);
     Main.glKey.GetBitmap(2,spPrint.Glyph);
     Fill_Comb(Frodm.AnbDat,'Nam',cmbAnb.Items);
     MakeGoodTree(CTree);
     cmbAnb.ItemIndex:=0;
     DepQu.DatabaseName:=CurrDb;
     GQu.DatabaseName:=CurrDb;
     QFee.DatabaseName:=CurrDb;
end;

procedure TFAnbP.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If KEY=VK_F3 Then BshowClick(Sender);
end;

procedure TFAnbP.BshowClick(Sender: TObject);
Var
J:Integer;
T1:TTable;
begin
     If (RG.ItemIndex In[0,1]) And (cmbAnb.ItemIndex = -1) Then
     Begin
       Beep;
       ShowMessage('«‰»«— ’ÕÌÕ «‰ Œ«» ‰‘œÂ «” ');
       Exit;
     End;
     Panel1.Visible:=True;
     T1:=TTable.Create(Owner);
     T1.DatabaseName:=CurrDb;
     T1.TableName:='AnbP';
     T1.FieldDefs.Assign(Frodm.Cardex.FieldDefs);
     T1.CreateTable;
     T1.Open;
     Case RG.ItemIndex Of
     0,1: Calc_AnbP(cmbAnb.Text,T1);
     2,3: Begin
           Sum_Dep:=0;
           Sum_Fro:=0;
           For J:=0 To cmbAnb.Items.Count-1 Do Sum_Dep:=Sum_Dep+Calc_AnbP(cmbAnb.Items.Strings[J],T1);
           T1.Append;
           T1.Fields[2].Value:='Ã‹‹‹‹‹‹„⁄ ﬂ· ';
           T1.Fields[14].Value:=Sum_Dep;
           T1.Post;
          End;
     End;
     GQu.Close;
     GQu.Open;
     T1.Close;
     T1.DeleteTable;
     Panel1.Visible:=False;
end;


procedure TFAnbP.spPrintClick(Sender: TObject);
begin
     CreatingForm(TAnbPRep,'AnbPRep',AnbPRep);
     Set_Sys_Enviroment;
     AnbPRep.qrTit.Caption :=InvoLbl;
     AnbPRep.qrTit.Font.Size :=LFont.Size+5;
     AnbPRep.qrDat.Caption:=IntToDate(Fardate);
     AnbPRep.Preview;
     AnbPRep.Destroy;
end;

procedure TFAnbP.CTreeClick(Sender: TObject);
Var
I,J,Idx:Integer;
Node:TTreeNode;
Flt,KolFlt:String;
Q1:Real;
begin
     Node:=cTree.Selected;
     FKol:=0;FMo:=0;FTaf:=0;sPath:='';
     FKod1.Clear;FKod2.Clear;FKod3.Clear;FKod31.Clear;
     //If Node.Level <1 Then Exit;
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
     IF FKol>0 Then FKod1.Text:=IntToStr(FKol);
     IF FMo>0 Then FKod2.Text:=IntToStr(FMo);
     IF FTaf>0 Then FKod3.Text:=IntToStr(FTaf);
     IF FTaf>0 Then FKod31.Text:=IntToStr(FTaf);
end;

end.
