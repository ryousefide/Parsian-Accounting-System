unit Anb_check;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, Grids, DBGrids, ExtCtrls, ComCtrls, XPListBox,
  Buttons;

type
  TFAnb_Check = class(TForm)
    tbTally: TTable;
    DS: TDataSource;
    tbTallyId: TIntegerField;
    tbTallyKod: TIntegerField;
    tbTallyGene: TIntegerField;
    tbTallyNam: TStringField;
    tbTallyColor: TStringField;
    tbTallyAnbnam: TStringField;
    tbTallyAnbkod: TFloatField;
    tbTallyQuant: TFloatField;
    tbTallyTally: TFloatField;
    tbTallyQsum: TFloatField;
    Label4: TLabel;
    GNam: TComboBox;
    Bevel1: TBevel;
    CTree: TTreeView;
    Splitter1: TSplitter;
    DepQu: TQuery;
    DepQuId: TIntegerField;
    DepQuKod: TIntegerField;
    DepQuGene: TIntegerField;
    DepQuNam: TStringField;
    DepQuColor: TStringField;
    DepQuAnbnam: TStringField;
    DepQuAnbkod: TFloatField;
    DepQuQuant: TFloatField;
    DepQuTally: TFloatField;
    DepQuQsum: TFloatField;
    Bevel3: TBevel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    FKod1: TEdit;
    FKod2: TEdit;
    FKod3: TEdit;
    FKod31: TEdit;
    Panel1: TPanel;
    Bevel2: TBevel;
    dbg: TDBGrid;
    Label1: TLabel;
    FQ3: TEdit;
    FQ2: TEdit;
    FQ1: TEdit;
    bShow: TSpeedButton;
    procedure NextTab(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BShowClick(Sender: TObject);
    procedure CTreeClick(Sender: TObject);
    procedure GNamKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CTreeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    FKol:SmallInt;// Integer;
    FMo:SmallInt;
    FTaf:SmallInt;
    sPath:String;
    Function MakeFilt:String;
  public
    { Public declarations }
    Procedure HaveUpdate;
    Procedure Make_CheckTable;
    Procedure Update_Depot;
  end;

var
  FAnb_Check: TFAnb_Check;

implementation

uses ProVar, FrooshDM, Routins, CRoutins, MainForm;

{$R *.DFM}

{ TFDepCheck }
Const
HavUpdate='update Dhavg '+
 'Set Reject =(Select Sum(G.Quant) From DoutG G Where G.Kod=Dhavg.kod '+
 'and G.Color=Dhavg.color and G.No in(Select K.No From Dout K where K.RefNo=Dhavg.No))';
InvUpdate='update InvoGood '+
 'Set Qout =(Select Sum(G.Quant) From DHavG G Where G.Kod=InvoGood.kod '+
 'and G.Color=InvoGood.color and G.No in(Select K.No From Dhav K where K.RefNo=InvoGood.No))';

Procedure TFAnb_Check.HaveUpdate;
Var
AcQu:TQuery;
begin
     AcQu:=TQuery.Create(Application);
     ACQu.DataBaseName:=CurrDb;
     AcQu.SQL.Clear;
     AcQu.SQL.Text:=HavUpdate;
     AcQu.ExecSQL;
     AcQu.SQL.Clear;
     AcQu.SQL.Text:=InvUpdate;
     AcQu.ExecSQL;
end;

procedure TFAnb_Check.Make_CheckTable;
Var
I,J:Integer;
T1:TTable;
DepQu:TQuery;
begin
     T1:=TTable.Create(Owner);
     T1.DatabaseName:=CurrDb;
     T1.TableName:='Anb_Check';
     T1.FieldDefs.Assign(Frodm.Depot.FieldDefs);
     T1.FieldDefs.Add('Tally',ftFloat,0,False);
     T1.FieldDefs.Add('Qsum',ftFloat,0,False);
     T1.CreateTable;
     T1.Open;

     DepQu:=TQuery.Create(Owner);
     DepQu.DatabaseName:=CurrDb;
     DepQu.SQL.Clear;
     DepQu.SQL.Add('Select * From Depot Order by Nam');
     DepQu.Open;
     DepQu.First;
     For I:=1 to DepQu.RecordCount Do
     Begin
      T1.Append;
      For J:=1 to DepQu.Fields.Count-1 Do
       T1.Fields[J].Value:=DepQu.Fields[J].Value;
      T1.FieldByName('Qsum').AsFloat:=T1.FieldByName('Quant').AsFloat+T1.FieldByName('AnbKod').AsFloat;
      T1.Post;
      DepQu.Next;
     End;
     T1.Close;
     DepQu.Close;
     DepQu.Destroy;
end;

Procedure TFAnb_Check.Update_Depot;
Var
I:Integer;
DepQu:TQuery;
iKod:Integer;
cColor:string;
begin
     DepQu:=TQuery.Create(Owner);
     DepQu.DatabaseName:=CurrDb;
     DepQu.SQL.Clear;
     DepQu.SQL.Add('Select Kod,Color,Sum(Quant)-Sum(Reject)');
     DepQu.SQL.Add('From Dhavg Group by Kod,Color');
     DepQu.SQL.Add('Having Sum(Quant)-Sum(Reject) >0 ');
     DepQu.SQL.Add('Order by Kod');
     DepQu.Open;
     For I:=1 To DepQu.RecordCount Do
     Begin
      iKod:=DepQu.Fields[0].AsInteger;
      cColor:=DepQu.Fields[1].AsString;
      If Frodm.Depot.Locate('Kod;Color',VarArrayof([iKod,cColor]),[loCaseInsensitive]) Then
      Begin
       Frodm.Depot.Edit;
       Frodm.DepotAnbkod.AsFloat:=DepQu.Fields[2].AsFloat;
       Frodm.Depot.Post;
      End;
      DepQu.Next;
     End;
     DepQu.Close;
     DepQu.Destroy;
End;

Function TFAnb_Check.MakeFilt:String;
Begin
     Result:='';
     //If GNam.Text <>'' Then Result:=Result+' and Nam = '+#39+FGNam.Text+#39;
     If FKod1.Text >''   Then Result:=Result+' and Kol = '+FKod1.Text;
     If FKod2.Text >''   Then Result:=Result+' and Mo = '+FKod2.Text;
     If FKod3.Text >''   Then Result:=Result+' and Taf >= '+FKod3.Text;
     If Fkod31.Text >''  Then Result:=Result+' and Taf <= '+FKod31.Text;

     If Pos(' and',Result) = 1 Then Delete(Result,1,4);
end;

procedure TFAnb_Check.NextTab(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
      Key:=#0;
      SelectNext(Sender As TWinControl,True,True);
     End;
end;

procedure TFAnb_Check.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFAnb_Check.FormCreate(Sender: TObject);
Var
I:Integer;
begin
     Set_Forms(Self);
     Main.glKey.GetBitmap(8,bShow.Glyph);
     tbTally.DatabaseName:=CurrDb;
     MakeGoodTree(CTree);
     GNam.Items.Assign(Kala);
end;


procedure TFAnb_Check.BShowClick(Sender: TObject);
begin
     tbTally.Close;
     FQ1.Clear;
     FQ2.Clear;
     FQ3.Clear;
     HaveUpdate;
     Update_Depot;
     Make_CheckTable;
     tbTally.Open;
     Ds.DataSet:=tbTally;
end;

procedure TFAnb_Check.CTreeClick(Sender: TObject);
Var
I,J,Idx:Integer;
Node:TTreeNode;
Flt:String;
Q1,Q2,Q3:Real;
begin
     Node:=cTree.Selected;
     GNam.Items.Assign(Kala);
     FKol:=0;FMo:=0;FTaf:=0;sPath:='';
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
     Flt:=MakeFilt;
     DepQu.Close;
     Ds.DataSet:=Nil;
     DepQu.SQL.Clear;
     DepQu.SQL.Add('Select * From Anb_Check ');
     If Flt >'' Then  DepQu.SQL.Add('Where Kod in (Select Kod From Goods Where '+Flt+')');
     DepQu.Open;
     DepQu.First;
     Q1:=0;Q2:=0;Q3:=0;
     For I:=1 To DepQu.RecordCount Do
     Begin
      Q1:=Q1+DepQuQuant.AsFloat;
      Q2:=Q2+DepQuAnbKod.AsFloat;
      Q3:=Q3+DepQuQSum.AsFloat;
      DepQu.Next;
     End;
     DepQu.First;
     FQ1.Text:=FloatToStr(Q1);
     FQ2.Text:=FloatToStr(Q2);
     FQ3.Text:=FloatToStr(Q3);
     Ds.DataSet:=DepQu;
end;

procedure TFAnb_Check.GNamKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetGoodCombo(Sender,Key);
end;

procedure TFAnb_Check.CTreeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key = VK_F3 Then BshowClick(Sender);
end;

end.
