unit Anb_moj;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, ExtCtrls, Buttons, ComCtrls, Db, DBTables,
  Menus, XPListBox;

type
  TFAnb_Moj = class(TForm)
    dbg: TDBGrid;
    Label1: TLabel;
    FKala: TComboBox;
    Label2: TLabel;
    FAnb: TComboBox;
    Label3: TLabel;
    FColor: TComboBox;
    Label4: TLabel;
    Label5: TLabel;
    Gene: TEdit;
    Panel1: TPanel;
    Bexit: TButton;
    BPrint: TButton;
    BShow: TBitBtn;
    BCheck: TButton;
    Brepair: TButton;
    qIns: TQuery;
    qDel: TQuery;
    qRem: TQuery;
    qInv: TQuery;
    qIns2: TQuery;
    qRem2: TQuery;
    Pb: TProgressBar;
    qGene: TQuery;
    qUpdate: TQuery;
    rgMoj: TRadioGroup;
    QSort: TQuery;
    QSortId: TIntegerField;
    QSortKod: TIntegerField;
    QSortGene: TIntegerField;
    QSortNam: TStringField;
    QSortColor: TStringField;
    QSortAnbNam: TStringField;
    QSortQuant: TFloatField;
    SortDs: TDataSource;
    kPop: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    QSortAnbkod: TFloatField;
    Bevel2: TBevel;
    CTree: TTreeView;
    Splitter2: TSplitter;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    FKod1: TEdit;
    FKod2: TEdit;
    FKod3: TEdit;
    FKod31: TEdit;
    DepQu: TQuery;
    DS: TDataSource;
    DepQuId: TAutoIncField;
    DepQuKod: TIntegerField;
    DepQuGene: TIntegerField;
    DepQuNam: TStringField;
    DepQuColor: TStringField;
    DepQuAnbnam: TStringField;
    DepQuAnbkod: TFloatField;
    DepQuQuant: TFloatField;
    GList: TXPListBox;
    Splitter1: TSplitter;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BexitClick(Sender: TObject);
    procedure BPrintClick(Sender: TObject);
    procedure dbgKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure BShowClick(Sender: TObject);
    procedure NextTab(Sender: TObject; var Key: Char);
    procedure dbgKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FKalaDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure FKalaDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure dbgEnter(Sender: TObject);
    procedure FKalaDropDown(Sender: TObject);
    procedure dbgEditButtonClick(Sender: TObject);
    procedure BCheckClick(Sender: TObject);
    procedure BrepairClick(Sender: TObject);
    procedure dbgTitleClick(Column: TColumn);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure FKalaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CTreeClick(Sender: TObject);
    procedure GListClick(Sender: TObject);
  private
    { Private declarations }
    FKol:SmallInt;// Integer;
    FMo:SmallInt;
    FTaf:SmallInt;
    sPath:String;
    Function Make_Filter:String;
    Function Kol_Filter:String;
    Procedure RepairCardex;
  public
    { Public declarations }
    FacRepair:Boolean;
  end;

var
  FAnb_Moj: TFAnb_Moj;

implementation

uses FrooshDM, Routins, AnbGRep, ProVar, Converts, Car_Repair, CheckData,
  KalaCardex, CurrCardex, MainForm, CRoutins;

{$R *.DFM}

Function TFAnb_Moj.Make_Filter:String;
Var
Str:String;
begin
     Str:='';
     If FKala.Text <>'' Then Str:='Nam = '+#39+FKala.Text+#39;
     If FColor.Text<>'' Then Str:=Str+' and Color = '+#39+FColor.Text+#39;
     If FAnb.Text  <>'' Then Str:=Str+' and Anbnam = '+#39+FAnb.Text+#39;
     If Gene.Text >''   Then Str:=' Gene = '+Gene.Text;
     If Glist.ItemIndex <>-1 Then Result:=Result+' and Nam = '+#39+GList.Items[Glist.itemIndex]+#39;
     Case rgMoj.ItemIndex Of
      0: Str:=Str+' and Quant > 0 ';
      1: Str:=Str+' and Quant < 0 ';
      2: Str:=Str+' and Quant = 0 ';
     End;
     If Pos(' and',Str) = 1 Then Delete(Str,1,4);
     Result:=Str;
end;

Function TFAnb_Moj.Kol_Filter:String;
Begin
     Result:='';
     //If GNam.Text <>'' Then Result:=Result+' and Nam = '+#39+FGNam.Text+#39;
     If FKod1.Text >''   Then Result:=Result+' and Kol = '+FKod1.Text;
     If FKod2.Text >''   Then Result:=Result+' and Mo = '+FKod2.Text;
     If FKod3.Text >''   Then Result:=Result+' and Taf >= '+FKod3.Text;
     If Fkod31.Text >''  Then Result:=Result+' and Taf <= '+FKod31.Text;

     If Pos(' and',Result) = 1 Then Delete(Result,1,4);
end;

Procedure TFAnb_Moj.RepairCardex;
Var
CR:TFCarRepair;
begin
     CR:=TFCarRepair.Create(Application.Owner);
     With CR Do
     Try
      Position:=poMainFormCenter;
      BorderStyle:=bsSingle;
      Brepair.Enabled:=False;
      Visible:=True;
      BrepairClick(Owner);
     Finally
      CR.Free;
     End;
end;


procedure TFAnb_Moj.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      Frodm.Depot.Filter:='';
      Frodm.Depot.Filtered :=False;
      Action:=caFree;
end;

procedure TFAnb_Moj.BexitClick(Sender: TObject);
begin
     Frodm.Depot.Filtered :=False;
     Close;
end;

procedure TFAnb_Moj.BPrintClick(Sender: TObject);
begin
     CreatingForm(TFAnbGRep,'FAnbGRep',FAnbGRep);
     Set_Sys_Enviroment;
     FAnbGRep.qrTit.Caption:=InvoLbl;
     FAnbGRep.Ndat.Caption :=IntToDate(FarDate);
     FAnbGRep.DQu.DataBaseName:=CurrDb;
     Case rgMoj.ItemIndex Of
      0: FAnbGRep.DQu.SQL.Strings[2]:='Where Quant > 0 ';
      1: FAnbGRep.DQu.SQL.Strings[2]:='Where Quant < 0 ';
      2: FAnbGRep.DQu.SQL.Strings[2]:='Where Quant = 0 ';
     Else
         FAnbGRep.DQu.SQL.Strings[2]:='Where Quant > -200000 ';
     End;
//     FAnbGRep.DQu.SQL.Strings[2]:='Where Quant <> 0 ';
     If Frodm.Depot.Filter >'' Then FAnbGRep.DQu.SQL.Strings[2]:=
      FAnbGRep.DQu.SQL.Strings[2]+' and '+Frodm.Depot.Filter;
     FAnbGRep.DQu.Open;
     FAnbGRep.Preview;
     FAnbGrep.Destroy;
end;

procedure TFAnb_Moj.FormCreate(Sender: TObject);
Var
I:Integer;
begin
     Set_Forms(Self);
     Frodm.Depot.Open;
     Label4.ParentFont :=True;
     FacRepair:=False;
     dbg.Columns[3].Visible :=sAKod;
     dbg.Columns[2].Visible :=sModel;
     FColor.Enabled :=SModel;
     FKala.Items.Assign(Kala);
     Fill_Comb(Frodm.Color,'Color',FColor.Items);
     Fill_Comb(Frodm.AnbDat,'Nam',FAnb.Items);
     qDel.DatabaseName:=CurrDb;
     QUpdate.DatabaseName:=CurrDb;
     QInv.DatabaseName:=CurrDb;
     qGene.DatabaseName:=CurrDb;
     qSort.DatabaseName:=CurrDb;
     qIns.DatabaseName:=CurrDb;
     qIns2.DatabaseName:=CurrDb;
     qRem.DatabaseName:=CurrDb;
     qRem2.DatabaseName:=CurrDb;
     
     MakeGoodTree(CTree);
     dbg.DataSource:=Frodm.DepotDs;
end;

procedure TFAnb_Moj.BShowClick(Sender: TObject);
Var
I:Integer;
Sum:Real;
begin
     dbg.DataSource:=Frodm.DepotDs;
     Frodm.Depot.Filtered :=False;
     Frodm.Depot.Filter :=Make_Filter;
     Frodm.Depot.Filtered :=True;
     If FKala.Text <> '' Then
     Begin
       Sum:=0;
       For I:=1 To Frodm.Depot.RecordCount Do
       Begin
         Sum:=Sum+Frodm.DepotQuant.Value;
         Frodm.Depot.Next;
       End;
       Label4.Caption :='„ÊÃÊœÌ ='+FloatToStr(Sum);
     End Else
       Label4.Caption:='';
end;

procedure TFAnb_Moj.NextTab(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
      Key:=#0;
      SelectNext(Sender As TWinControl,True,True);
     End;
end;

procedure TFAnb_Moj.dbgEditButtonClick(Sender: TObject);
begin
     If (CUser.Name = '„œÌ—Ì  „«·Ì')And
       (MessageDlg('—ﬂÊ—œ Ã«—Ì Õ–› ‘Êœø',mtWarning,mbYesNo,0) = IdYes) Then
     Frodm.Depot.Delete;
end;

procedure TFAnb_Moj.dbgEnter(Sender: TObject);
begin
     If CUser.Name = '„œÌ—Ì  „«·Ì' Then dbg.ReadOnly:=False;
end;

procedure TFAnb_Moj.dbgKeyPress(Sender: TObject; var Key: Char);
begin
     If CUser.Name = '„œÌ—Ì  „«·Ì' Then Frodm.Depot.Edit;
     If Key = #13 Then
     Begin
       Key:=#0;
       GMove(dbg,Frodm.Depot);
     End;
end;

procedure TFAnb_Moj.dbgKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
       If key = VK_CONTROL Then Bshow.SetFocus;
end;

procedure TFAnb_Moj.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key = VK_F3 Then BshowClick(Sender);
end;

procedure TFAnb_Moj.FKalaDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
     Accept:=(Source Is TXPListBox) And ((Source As TXPListBox).Name = 'lbGName')
end;

procedure TFAnb_Moj.FKalaDragDrop(Sender, Source: TObject; X, Y: Integer);
Var
List:TXPListBox;
begin
     If (Source Is TXPListBox) Then
     Begin
       List:=(Source As TXPListBox);
       FKala.Text:=List.Items.Strings[List.ItemIndex];
       FKala.SetFocus;
     End;
end;

procedure TFAnb_Moj.FKalaDropDown(Sender: TObject);
Var
Gene:Integer;
begin
     Gene:=StrToInt(FKala.Text);
     IF sGene Then
       FillGene(FKala.Items,Gene)
     Else
       FKala.Items.Assign(Kala);
end;

procedure TFAnb_Moj.BCheckClick(Sender: TObject);
begin
     CreatingForm(TFAnbGRep,'FAnbGRep',FAnbGRep);
     Set_Sys_Enviroment;
     FAnbGRep.qrTit.Caption:=InvoLbl;
     FAnbGRep.Ndat.Caption :=IntToDate(FarDate);
     FAnbGRep.QRLabel4.Caption:='ﬂ‰ —· Õœ«ﬁ· „ÊÃÊœÌ «‰»«—';
     FAnbGRep.QRLabel9.Caption:='Õœ«ﬁ·';
     FAnbGRep.DQu.DataBaseName:=CurrDb;
     FAnbGRep.DQu.SQL.Clear;
     FAnbGRep.QRDBText6.DataField:='RQuant';
     FAnbGRep.DQu.SQL.Add('Select D.*,G.RQuant From Goods G,Depot D'+
' Where G.Kod = D.Kod and D.Quant <= G.RQuant And G.RQuant > 0');
     FAnbGRep.DQu.Open;
     FAnbGRep.Preview;
     FAnbGrep.Destroy;
end;

procedure TFAnb_Moj.BrepairClick(Sender: TObject);
Const
Qs='«ﬁ·«„ ›«ò Ê— Â« »«“”«“Ì ê—œœø';
Label
L1;
begin
{     IF UserCount > 1 Then
     Begin
      MessageBeep(1);
      ShowMessage('»Ì‘ «“ Ìﬂ ﬂ«—»— œ— Õ«· «” ›«œÂ «“ ‰—„ «›“«— „Ì »«‘œ');
      Exit;
     End; }
     Pb.Position:=0;
     dbg.DataSource:=Frodm.DepotDs;
     Frodm.Depot.Close;
     If FacRepair Then Goto L1;
     If MessageDlg(Qs,mtInformation,mbYESNO,-1) = idYes Then
     Begin
      SCreen.Cursor:=crHelp;
      qUpdate.ExecSQL;
      Pb.Position:=1;
      qUpdate.SQL.Text:='Update BinvoGood   Set BinvoGood.Nam = (Select G.Nam From Goods G Where G.Kod=BinvoGood.Kod) ';
      qUpdate.ExecSQL;
      Pb.Position:=2;
      qUpdate.SQL.Text:='Update RejInvoGood   Set RejInvoGood.Nam = (Select G.Nam From Goods G Where G.Kod=RejInvoGood.Kod) ';
      qUpdate.ExecSQL;
      Pb.Position:=3;
      qUpdate.SQL.Text:='Update RejBinvoGood   Set RejBinvoGood.Nam = (Select G.Nam From Goods G Where G.Kod=RejBinvoGood.Kod) ';
      qUpdate.ExecSQL;
     End;
     L1:
     Pb.Position:=4;
     qUpdate.SQL.Text:='Update Invogood  SET Qout =(SELECT SUM(H.Quant)FROM DHavG H  '+
                       'WHERE  Invogood.No = H.AnbKod AND Invogood.Kod = H.Kod)';
     qUpdate.ExecSQL;
     qUpdate.SQL.Text:='Update Invogood  SET Qout =0 WHERE  Qout Is Null';
     qUpdate.ExecSQL;
     SCreen.Cursor:=crAppStart;
     RepairCardex;
     Pb.Position:=5;
     SCreen.Cursor:=crNone;
     qDel.ExecSQL;
     Pb.Position:=6;
     FAnb_Moj.RePaint;
     SCreen.Cursor:=crMultiDrag;
     qInv.ExecSQL;
     Pb.Position:=7;
     qGene.ExecSQL;
     Pb.Position:=8;
     Frodm.Depot.Open;
     Frodm.Depot.Refresh;
     Pb.Position:=0;
     SCreen.Cursor:=crDefault;
     If Not FacRepair Then CreatingForm(TDataCheck,'DataCheck',DataCheck);
end;

procedure TFAnb_Moj.dbgTitleClick(Column: TColumn);
Var
Field:Word;
I,J:Integer;
OrdSt:String;
begin
     SCreen.Cursor:=crHourGlass;
     Field:=Column.Field.Index;//+1;
     Case Field Of
     3:OrdSt:='4,5';
     4:OrdSt:='5,4';
     5:OrdSt:='6,5,4';
     7:OrdSt:='8 Desc';
     Else
      OrdSt:='5,4';
     End;
     QSort.Close;
     Qsort.SQL.Clear;
     QSort.SQL.Add('Select * From Depot Order By '+OrdSt);//IntToStr(Field));
     QSort.Open;
     dbg.DataSource:=Nil;//SortDs;
     QSort.First;
     qDel.ExecSQL;
     For I:=1 To QSort.RecordCount Do
     Begin
      Frodm.Depot.Append;
      For J:=1 to 7 Do
       Frodm.Depot.Fields[J].Value:=QSort.Fields[J].Value;
      Frodm.Depot.Post;
      QSort.Next;
     End;
     QSort.Close;
     dbg.DataSource:=Frodm.DepotDs;
     Frodm.Depot.First;
     Frodm.Depot.IndexFieldNames:='Id';
     Screen.Cursor:=crDefault;
end;

procedure TFAnb_Moj.N1Click(Sender: TObject);
begin
     CreatingForm(TFKCardex,'FKCardex',FKCardex);
     FKCardex.GNam.Text:=dbg.Columns[1].Field.Value;// Frodm.DepotNam.Value;
     FKCardex.FColor.Text:=dbg.Columns[2].Field.Value;// Frodm.DepotColor.AsString;
     FKCardex.FAnb.Text:=dbg.Columns[3].Field.Value;// Frodm.DepotAnbNam.AsString;
     FKCardex.BshowClick(Sender);
end;

procedure TFAnb_Moj.N2Click(Sender: TObject);
begin
     CreatingForm(TFCurrCardex,'FCurrCardex',FCurrCardex);
     FCurrCardex.GNam.Text:=dbg.Columns[1].Field.Value;//Frodm.DepotNam.Value;
     FCurrCardex.FColor.Text:=dbg.Columns[2].Field.Value;//Frodm.DepotColor.AsString;
     FCurrCardex.FAnb.Text:=dbg.Columns[3].Field.Value;//Frodm.DepotAnbNam.AsString;
     If P_Rule = 'Mean' Then FCurrCardex.rgTip.ItemIndex:=4 Else
      If P_Rule = 'LiFo' Then FCurrCardex.rgTip.ItemIndex:=5 Else
       FCurrCardex.rgTip.ItemIndex:=6;
     FCurrCardex.BshowClick(Sender);
end;

procedure TFAnb_Moj.FKalaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetGoodCombo(Sender,Key);
end;

procedure TFAnb_Moj.CTreeClick(Sender: TObject);
Var
I,J,Idx:Integer;
Node:TTreeNode;
Flt,KolFlt:String;
Q1:Real;
begin
     Node:=cTree.Selected;
     FKol:=0;FMo:=0;FTaf:=0;sPath:='';
     FKod1.Clear;FKod2.Clear;FKod3.Clear;FKod31.Clear;
     dbg.DataSource:=Frodm.DepotDs;
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
     //-------------------------------
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
     Qu.Open;
     GList.Items.Clear;
     FKala.Clear;
     For I:=1 To Qu.RecordCount Do
     Begin
      Idx:=GList.Items.Add(Qu.Fields[0].AsString);
      GList.AcCode[Idx]:=Qu.Fields[1].Value;
      Qu.Next;
     End;
     Qu.Close;
     //--------------------------
     Flt:=Make_Filter;
     KolFlt:=Kol_Filter;
     If KolFlt >'' Then Flt:=Flt+' and Kod in (Select Kod From Goods Where'+KolFlt+')';
     If Pos(' and',Flt) = 1 Then Delete(Flt,1,4);
     DepQu.Close;
     Ds.DataSet:=Nil;
     DepQu.SQL.Clear;
     DepQu.SQL.Add('Select * From Depot ');
     If Flt >'' Then  DepQu.SQL.Add('Where '+Flt);
     DepQu.Open;
     DepQu.First;
     Q1:=0;
     For I:=1 To DepQu.RecordCount Do
     Begin
      Q1:=Q1+DepQuQuant.AsFloat;
      DepQu.Next;
     End;
     DepQu.First;
     Ds.DataSet:=DepQu;
     dbg.DataSource:=Ds;
     Label4.Caption :='„ÊÃÊœÌ ='+FloatToStr(Q1);
end;

procedure TFAnb_Moj.GListClick(Sender: TObject);
begin
     FKala.Text:=GList.Items[Glist.itemIndex];
     BShowClick(Sender);
end;

end.
