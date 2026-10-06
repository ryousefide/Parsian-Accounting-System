unit GoodList;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, ExtCtrls, MPlayer,Db,DbTables, Buttons;

type
  TFGoodList = class(TForm)
    Goods: TDBGrid;
    Panel1: TPanel;
    Label10: TLabel;
    FGood: TEdit;
    BNext: TBitBtn;
    BPrev: TBitBtn;
    BRet: TBitBtn;
    BFirst: TBitBtn;
    BLast: TBitBtn;
    Bevel3: TBevel;
    Bevel5: TBevel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label5: TLabel;
    FKod1: TEdit;
    FKod2: TEdit;
    FKod3: TEdit;
    FKod31: TEdit;
    SKod: TEdit;
    Ekod: TEdit;
    Gene: TEdit;
    Gene1: TEdit;
    Panel2: TPanel;
    bFilter: TBitBtn;
    Bprint: TBitBtn;
    BSearch: TBitBtn;
    BNew: TBitBtn;
    BEdit: TBitBtn;
    BDel: TBitBtn;
    Bexit: TBitBtn;
    Cb: TCheckBox;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Sp2: TSpeedButton;
    Sp1: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BexitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BprintClick(Sender: TObject);
    procedure GoodsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GoodsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GoodsColEnter(Sender: TObject);
    procedure GoodsColExit(Sender: TObject);
    procedure GoodsKeyPress(Sender: TObject; var Key: Char);
    procedure FMquantKeyPress(Sender: TObject; var Key: Char);
    procedure GoodsTitleClick(Column: TColumn);
    procedure FGoodChange(Sender: TObject);
    procedure NextTab(Sender: TObject; var Key: Char);
    procedure GoodsColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure FGoodKeyPress(Sender: TObject; var Key: Char);
    procedure FGoodKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bFilterClick(Sender: TObject);
    procedure BSearchClick(Sender: TObject);
    procedure BNewClick(Sender: TObject);
    procedure BDelClick(Sender: TObject);
    procedure BEditClick(Sender: TObject);
    procedure BFirstClick(Sender: TObject);
    procedure BLastClick(Sender: TObject);
    procedure BNextClick(Sender: TObject);
    procedure BPrevClick(Sender: TObject);
    procedure BRetClick(Sender: TObject);
    procedure Sp2Click(Sender: TObject);
    procedure Sp1Click(Sender: TObject);
  private
    { Private declarations }
    NewGene:Integer;
    OldGene:Integer;
    NName:String;
    OName:String;
    Procedure SetImage;
    Function KodCheck:Boolean;
    Function MakeFilt:String;
    Procedure KalaList;
    Procedure GeneChange(GKod,Gene:Integer);
    Procedure NameUpDate(TName:TTable;NewName:String;Kod:Integer);
  public
    { Public declarations }
  end;

var
  FGoodList: TFGoodList;

implementation

uses FrooshDM, Routins, ProVar, RepGoods, MainForm, Goods, GoodsEdit;

{$R *.DFM}

procedure TFGoodList.SetImage;
begin
     Main.glKey.GetBitmap(0,BPrev.Glyph);
     Main.glKey.GetBitmap(1,Bnext.Glyph);
     Main.glKey.GetBitmap(0,BFirst.Glyph);
     Main.glKey.GetBitmap(1,BLast.Glyph);
     Main.glKey.GetBitmap(2,BPrint.Glyph);
     Main.glKey.GetBitmap(9,BSearch.Glyph);
     Main.glKey.GetBitmap(10,BFilter.Glyph);
     Main.glKey.GetBitmap(7,BRet.Glyph);
     Main.glKey.GetBitmap(7,BExit.Glyph);
     Main.glKey.GetBitmap(11,BNew.Glyph);
     Main.glKey.GetBitmap(3,Bedit.Glyph);
     Main.glKey.GetBitmap(5,BDel.Glyph);
     Main.glKey.GetBitmap(12,sp1.Glyph);
     Main.glKey.GetBitmap(13,sp2.Glyph);

end;

Function TFGoodList.KodCheck:Boolean;
Var
I:Integer;
FKod,NeKod:Integer;
begin
     Result:=True;
     Frodm.Good.IndexFieldNames :='Kod';
     Frodm.Good.First;
     FKod:=Frodm.GoodKod.Value;
     For I:=1 To Frodm.Good.RecordCount-1 Do
     Begin
       Frodm.Good.Next;
       NeKod:= Frodm.GoodKod.Value;
       If FKod = NeKod Then Goods.Columns[2].Font.Color:=clRed Else
          FKod:=NeKod;
     End;
     If Goods.Columns[2].Font.Color = clRed Then
     Begin
       Beep;
       ShowMessage ('ﬂœ ﬂ«·«  ﬂ—«—Ì œ«—Ìœ');
       Result:=False;
     End;
end;

Function TFGoodList.MakeFilt:String;
Begin
     Result:='';
     If FGood.Text <>'' Then Result:=Result+' and Nam = '+#39+FGood.Text+'*'+#39;
//     If FMquant.Text >'' Then Result:=Result+'Rquant >= '+FMquant.Text;
//     If FRquant.Text >'' Then Result:=Result+' and Bquant >= '+FRquant.Text;
     If FKod1.Text >''   Then Result:=Result+' and Kol = '+FKod1.Text;
     If FKod2.Text >''   Then Result:=Result+' and Mo = '+FKod2.Text;
     If FKod3.Text >''   Then Result:=Result+' and Taf >= '+FKod3.Text;
     If Fkod31.Text >''  Then Result:=Result+' and Taf <= '+FKod31.Text;
     If Skod.Text >''    Then Result:=Result+' and Kod >= '+SKod.Text;
     If Ekod.Text >''    Then Result:=Result+' and Kod <= '+EKod.Text;
//     If Gene.Text >''    Then Result:=Result+' and Gene = '+Gene.Text;
     If Gene.Text >''    Then Result:=Result+' and Gene >= '+Gene.Text;
     If Gene1.Text >''    Then Result:=Result+' and Gene <= '+Gene1.Text;

     If Pos(' and',Result) = 1 Then Delete(Result,1,4);
end;

Procedure TFGoodList.KalaList;
Var
I:Integer;
St:String;
begin
     Screen.Cursor:=crHourGlass;
     Qu.SQL.Clear;
     Qu.SQL.Add('SELECT Nam');
     Qu.SQL.Add('FROM Goods');
     St:=MakeFilt;
     If St > '' Then QU.SQL.ADD('WHERE '+St);
     Qu.Active :=True;
     Qu.First;
     Kala.Clear;
     For I:=1 To Qu.RecordCount Do
     Begin
       kala.Add(Qu.Fields[0].Value);
       Qu.Next;
     End;
     Qu.Active:=False;
     Screen.Cursor:=crDefault;
end;

Procedure TFGoodList.GeneChange(GKod,Gene:Integer);
Var
I:Integer;
begin
     Frodm.Depot.Filter :='Kod = '+IntToStr(GKod);
     Frodm.Depot.Filtered :=True;
     Frodm.Depot.First;
     For I:=1 To Frodm.Depot.RecordCount Do
     Begin
       Frodm.Depot.Edit;
       Frodm.DepotGene.Value:=Gene;
       Frodm.Depot.Post;
       Frodm.Depot.Next;
     End;
     Frodm.Depot.Filtered:=False;
end;

Procedure TFGoodList.NameUpDate(TName:TTable;NewName:String;Kod:Integer);
Var
I:Integer;
OFlt:String;
begin
{     Qu.SQL.Clear;
     Qu.SQL.Add('Update '+TName+' Set Nam = '+#39+NewName+#39);
     Qu.SQL.Add('Where Kod = '+IntToStr(Kod));
     Qu.ExecSQL;}
     OFlt:=TName.Filter;
     TName.Open;
     TName.Filter:='Kod='+IntToStr(Kod);
     TName.Filtered:=True;
     TName.First;
     For I:=1 To TName.RecordCount Do
     Begin
      TName.Edit;
      TName.FieldByName('Nam').AsString:=NewName;
      TName.Post;
      TName.Next;
     End;
     TName.Filter:=OFlt;
     TName.Close;
end;

procedure TFGoodList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;


procedure TFGoodList.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     SetImage;
     SetGridWidth(Goods,'Nam',GWidth);
     //If KodCheck Then  Frodm.Good.IndexFieldNames :='Nam';
     If Boss Then Goods.ReadOnly := False;
     Frodm.Good.IndexFieldNames:='Id';
     Frodm.Good.First;
     sp1.Enabled:=CUser.Master;
     sp2.Enabled:=CUser.Master;
end;


procedure TFGoodList.GoodsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     IF Frodm.Good.State = dsInsert Then Frodm.Good.Cancel;
     If Shift = [ssCtrl]+[ssShift] Then FGood.SetFocus;
end;

procedure TFGoodList.GoodsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
     If Frodm.GoodFdp.Value Then Goods.Canvas.Font.Color:=clGray;
     If Frodm.GoodFlock.Value Then Goods.Canvas.Font.Color:=clRed;
      Goods.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TFGoodList.GoodsColEnter(Sender: TObject);
Var
 FIndex:Set of 0..10;
begin
     FIndex:=[5];
     If Boss And Not(Goods.SelectedField.Index  In FIndex) Then Frodm.Good.Edit;
     Case Goods.SelectedField.Index OF
      0:  OName:=Frodm.GoodNam.Value;
      8:  OldGene:=Frodm.GoodGene.Value;
     End;

end;

procedure TFGoodList.GoodsColExit(Sender: TObject);
Var
Kod:Integer;
begin
     IF Frodm.Good.State = dsBrowse Then Exit Else  Frodm.Good.Post;
     Case Goods.SelectedField.Index OF
      8: Begin
          NewGene:=Frodm.GoodGene.Value;
          If NewGene <> OldGene Then GeneChange(Frodm.GoodKod.Value,NewGene);
         End;
      0: Begin
         NName:=Frodm.GoodNam.Value;
         IF NName <> OName Then
          If MessageDlg('‰«„ ﬂ«·«  €ÌÌ— ﬂ—œÂ «”  .‰«„ ÃœÌœ  «∆Ìœ „Ì‘Êœ',mtWarning,mbYesNo,0)
          = idYes Then
          Begin
           Kod:=Frodm.GoodKod.Value;
           NameUpdate(Frodm.InvoGood,NName,Kod);
           NameUpdate(Frodm.BinvoGood,NName,Kod);
           NameUpdate(Frodm.RejInvoGood,NName,Kod);
           NameUpdate(Frodm.RejBinvoGood,NName,Kod);
           NameUpdate(Frodm.PInvoGood,NName,Kod);
           NameUpdate(Frodm.GCardex,NName,Kod);
           NameUpdate(Frodm.Depot,NName,Kod);
          End Else
          Begin
           Frodm.Good.Edit;
           Frodm.GoodNam.Value:=OName;
           Frodm.Good.Post;
          End;
         End;
     End;
end;

procedure TFGoodList.GoodsColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
     Goods.Columns[Toindex].Index:=FromIndex;
end;

procedure TFGoodList.GoodsKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
       Key:=#0;
       GMove(Goods,Frodm.Good);
     End;
end;

procedure TFGoodList.FMquantKeyPress(Sender: TObject; var Key: Char);
begin
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;
     NextTab(Sender,Key);
end;

procedure TFGoodList.GoodsTitleClick(Column: TColumn);
begin
     If ((Column.Field = FRodm.GoodNam) Or (Column.Field = FRodm.GoodKod)) Then
         Frodm.Good.IndexFieldNames :=Column.Field.FieldName;
end;

procedure TFGoodList.FGoodChange(Sender: TObject);
begin
//     Frodm.Good.IndexFieldNames :='Nam';
//     Frodm.Good.FindNearest([FGood.Text]);
     Frodm.Good.Filter:=MakeFilt;
end;

procedure TFGoodList.NextTab(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
       Key:=#0;
       FGoodList.SelectNext(Sender As TWinControl,True,True);
     End;
end;

procedure TFGoodList.FGoodKeyPress(Sender: TObject; var Key: Char);
begin
     IF Key = #13 Then
     Begin
      Key:=#0;
      Goods.SetFocus;
     End;
end;

procedure TFGoodList.FGoodKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key = 32 Then
     Begin
      Key:=0;
      (Sender As TEdit).Text:=FindGood((Sender As TEdit).Text);
     End;
end;

procedure TFGoodList.bFilterClick(Sender: TObject);
begin
    Panel1.Visible:=True;
    Frodm.Good.Filter:=MakeFilt;
    Frodm.Good.Filtered:=True;
    FGood.SetFocus;
end;

procedure TFGoodList.BSearchClick(Sender: TObject);
begin
    Panel1.Visible:=True;
    Frodm.Good.Filtered:=False;
    Frodm.Good.Filter:=MakeFilt;
    FGood.SetFocus;
end;

procedure TFGoodList.BprintClick(Sender: TObject);
begin
     CreatingForm(TGoodRep,'GoodRep',GoodRep);
     Set_Sys_Enviroment;
     GoodRep.Preview;
     GoodRep.Destroy;
end;

procedure TFGoodList.BexitClick(Sender: TObject);
begin
     If Cb.Checked  Then
     Begin
       Frodm.Good.Filtered:=False;//True;
       KalaList;
     End Else
     Begin
       Frodm.Good.Filtered:=False;
       Fill_Cond(Frodm.Good,'Nam','Flock=0',Kala);
     End;
     Close;
end;

procedure TFGoodList.BNewClick(Sender: TObject);
Var
DG:TFgoods;
begin
     DG:=TFgoods.Create(Application);
      With DG Do
      Try
       Hmu:=CreateMutex(nil,False,PChar(CCrypt('8OYK0v+1nH6o0RJYCYyhHoHkoevTug==')));
       //If GetLastError() <> ERROR_ALREADY_EXISTS Then Frodm.Destroy;;
       CloseHandle(Hmu);
       FormStyle:=fsNormal;
       Visible:=False;
       BorderStyle:=bsSingle;
       ShowModal;
      Finally
       Free;
      End;
end;

procedure TFGoodList.BEditClick(Sender: TObject);
Var
DG:TFgoodsEdit;
iRec:Integer;
begin
     DG:=TFgoodsEdit.Create(Application);
     With DG Do
     Try
      Hmu:=CreateMutex(nil,False,PChar(CCrypt('8OYK0v+1nH6o0RJYCYyhHoHkoevTug==')));
      If GetLastError() <> ERROR_ALREADY_EXISTS Then SetToBack;
      CloseHandle(Hmu);
      FormStyle:=fsNormal;
      Visible:=False;
      BorderStyle:=bsSingle;
      FieldShow;
      iRec:=Frodm.Good.RecNo;
      ShowModal;
     Finally
      Free;
      Frodm.Good.RecNo:=iRec;
     End;
end;


procedure TFGoodList.BDelClick(Sender: TObject);
begin
     If MessageDlg(Frodm.GoodNam.AsString+' '+'Õ–› ê—œœø',mtWarning,mbYESNO,-1)=mrYes Then
     Begin
      Frodm.GCardex.Open;
      Frodm.GCardex.Filter:='Nam = '+#39+Frodm.GoodNam.AsString+#39;
      Frodm.GCardex.Filtered:=True;
      If Frodm.Gcardex.RecordCount >0 Then
       ShowMessage('ﬂ«·« œ«—«Ì ”«»ﬁÂ „Ì »«‘œ.ﬁ«»· Õ–› ‰Ì” ')
      Else
       Frodm.Good.Delete;
      Frodm.GCardex.Filtered:=False;
      Frodm.GCardex.Close;
     End;
end;


procedure TFGoodList.BFirstClick(Sender: TObject);
begin
     Frodm.Good.FindFirst;
end;

procedure TFGoodList.BLastClick(Sender: TObject);
begin
     Frodm.Good.FindLast;
end;

procedure TFGoodList.BNextClick(Sender: TObject);
begin
     Frodm.Good.FindNext;
end;

procedure TFGoodList.BPrevClick(Sender: TObject);
begin
     Frodm.Good.FindPrior;
end;

procedure TFGoodList.BRetClick(Sender: TObject);
begin
     Frodm.Good.Filter:='';
     Frodm.Good.Filtered:=False;
     Panel1.Visible:=False;
end;

procedure TFGoodList.Sp2Click(Sender: TObject);
Var
I:Integer;
begin
     If Not Sp2.Enabled Then Exit;
     If Goods.SelectedRows.Count > 0 Then
      For I:=0 To Goods.SelectedRows.Count-1 Do
      Begin
        Frodm.Good.GotoBookmark(Pointer(Goods.SelectedRows.items[I]));
        Frodm.Good.Edit;
        Frodm.GoodFlock.Value:=False;
        Frodm.Good.Post;
      End
     Else
     Begin
        Frodm.Good.Edit;
        Frodm.GoodFlock.Value:=False;
        Frodm.Good.Post;
     End;
end;

procedure TFGoodList.Sp1Click(Sender: TObject);
Var
I:Integer;
begin
     If Goods.SelectedRows.Count > 0 Then
      For I:=0 To Goods.SelectedRows.Count-1 Do
      Begin
        Frodm.Good.GotoBookmark(Pointer(Goods.SelectedRows.items[I]));
        Frodm.Good.Edit;
        Frodm.GoodFlock.Value:=True;
        Frodm.Good.Post;
      End
     Else
     Begin
        Frodm.Good.Edit;
        Frodm.GoodFlock.Value:=True;
        Frodm.Good.Post;
     End;

end;

end.
