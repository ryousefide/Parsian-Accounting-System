unit Tolid;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, Grids, DBGrids, Db, DBTables, PopupListBox, ExtCtrls,
  Mask, Buttons;

type
  TFTolid = class(TForm)
    Goods: TDBGrid;
    Label4: TLabel;
    FNo: TEdit;
    GList: TPopupListBox;
    Label3: TLabel;
    BQu: TQuery;
    Goods_In: TDBGrid;
    GList_In: TPopupListBox;
    CList: TPopupListBox;
    AList: TPopupListBox;
    EdQu: TQuery;
    EdQu2: TQuery;
    lbSum: TDBText;
    Label1: TLabel;
    Label2: TLabel;
    lbIn: TDBText;
    Dat1: TMaskEdit;
    Bevel1: TBevel;
    Panel1: TPanel;
    BPrev: TBitBtn;
    Bnext: TBitBtn;
    Bedit: TBitBtn;
    Bsave: TBitBtn;
    Bdel: TBitBtn;
    BCalc: TBitBtn;
    Bexit: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FNoKeyPress(Sender: TObject; var Key: Char);
    procedure NexTab(Sender: TObject; var Key: Char);
    procedure FNoExit(Sender: TObject);
    procedure GoodsColEnter(Sender: TObject);
    procedure GoodsColExit(Sender: TObject);
    procedure GoodsEditButtonClick(Sender: TObject);
    procedure GoodsEnter(Sender: TObject);
    procedure GoodsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GoodsKeyPress(Sender: TObject; var Key: Char);
    procedure GListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GListKeyPress(Sender: TObject; var Key: Char);
    procedure Goods_InColEnter(Sender: TObject);
    procedure Goods_InColExit(Sender: TObject);
    procedure Goods_InEditButtonClick(Sender: TObject);
    procedure Goods_InEnter(Sender: TObject);
    procedure Goods_InKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Goods_InKeyPress(Sender: TObject; var Key: Char);
    procedure GList_InKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GList_InKeyPress(Sender: TObject; var Key: Char);
    procedure CListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CListKeyPress(Sender: TObject; var Key: Char);
    procedure AListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure AListKeyPress(Sender: TObject; var Key: Char);
    procedure BPrevClick(Sender: TObject);
    procedure BnextClick(Sender: TObject);
    procedure BeditClick(Sender: TObject);
    procedure BsaveClick(Sender: TObject);
    procedure BdelClick(Sender: TObject);
    procedure BexitClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure Dat1Enter(Sender: TObject);
    procedure Dat1Exit(Sender: TObject);
    procedure BCalcClick(Sender: TObject);
  private
    { Private declarations }
    MoFlag:Boolean;
    Radif:Integer;
    NewNo:Integer;
    Max_No:Integer;
    New:Boolean;
    Procedure SetImage;
    Function Decode(Var S:String):String;
    Function Encode:String;
    Procedure FillGList(GoodKod:Integer);
    Procedure Good_Del;
    Procedure UnDepot;
    Procedure Depot;
    Function Check_Fac:Boolean;
    Procedure DrawList(List:TPopupListBox;Index:Integer);
    Function DeleteCheck:Boolean;
    Function GoodSum(Kod:Integer;BNo,Color,Anb:String;Shelf:Integer):Real;
    Function NegDep:Boolean;
    Procedure UnDepot_In;
    Procedure Depot_In;
//---------------------------
    Function MaxNo:Integer;
    Procedure GoodFilter(FacNo:Integer);
    Function Out_Sum:Currency;
    Function In_Sum:Currency;
    Function BuyPrice(Dat,Kod:Integer;Color,Anb:String):Currency;
    Procedure CancelEdit;
    Procedure CancelFactor;
    //------------------
    Function GetTolCount:Real;
    Function GetBFeeSum:Currency;
    Function CalcPCost(Cost:Currency):Currency;
    Function IsPriced:Boolean;
  public
    { Public declarations }
  end;

var
  FTolid: TFTolid;

implementation

uses FrooshDM, ProVar, Routins, MainForm;
Const
Tip='ÊæáíÏ';
Tip_In ='ÊæáíÏ';
{$R *.DFM}

procedure TFTolid.NexTab(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
       Key:=#0;
       SelectNext(Sender As TWinControl,True,True);
     End;
end;

procedure TFTolid.SetImage;
begin
     Main.glKey.GetBitmap(0,BPrev.Glyph);
     Main.glKey.GetBitmap(1,Bnext.Glyph);
     Main.glBut.GetBitmap(14,BCalc.Glyph);
     Main.glKey.GetBitmap(3,Bedit.Glyph);
     Main.glKey.GetBitmap(4,Bsave.Glyph);
     Main.glKey.GetBitmap(5,Bdel.Glyph);
     Main.glKey.GetBitmap(7,BExit.Glyph);
end;

Function TFTolid.Decode(Var S:String):String;
var
Flag:Integer;
begin
     Flag:=Pos('-',S);
     If Flag >0 Then
     Begin
       Result:=Copy(S,1,Pos('-',S)-1);
       Delete(S,1,Length(Result+'-'));
     End Else
       Result:='0';//S;
end;

Function TFTolid.Encode:String;
begin
     Result:=Frodm.DepotNam.Value +'-'+Frodm.DepotColor.Value +'-'+
     Frodm.DepotAnbNam.Value+'-'+FloatToStr(Frodm.DepotQuant.Value);
end;

Procedure TFTolid.FillGList(GoodKod:Integer);
Var
I,Width,Len:Integer;
begin
     GList.Items.Clear;
     If (GoodKod >0)and (sGene ) Then Frodm.Depot.Filter:='Gene= '+IntToStr(GoodKod)+' and Quant > 0'
     Else Frodm.Depot.Filter:='Kod= '+IntToStr(GoodKod)+' and Quant > 0';
     If GoodKod = 0 Then Frodm.Depot.Filter:=' Quant > 0';
     Frodm.Depot.Filtered :=True;
     Frodm.Depot.First;
     Width:=0;
     Glist.Canvas.Font :=FFont;//Label1.Font;
     For I:=1 To FRodm.Depot.RecordCount Do
     Begin
       GList.Items.Add(Encode);
       Len:= Glist.Canvas.TextWidth(Encode);
       If Len > Width Then Width:=Len;
       Frodm.Depot.Next;
     End;
     Frodm.Depot.Filtered :=False;
     Add_Comb(Frodm.Good,'Nam+"-"',' Fdp = True ',GList.Items);
     If GList.Items.Count >0 Then
     Begin
     Glist.Visible :=True;
     Bexit.Cancel :=False;
     End Else
     Begin
       Beep;
       ShowMessage('ãæÌæÏí ßÇáÇ ÕÝÑ ÇÓÊ');
     End;
end;

Procedure TFTolid.DrawList(List:TPopupListBox;Index:Integer);
begin
     List.Visible :=True;
     Bexit.Cancel :=False;
     List.SetFocus;
     List.ItemIndex :=0;
end;

Procedure TFTolid.Good_Del;
Var
I:Integer;
begin
     Frodm.RejBinvoGood.First;
     For I:= 1 To Frodm.RejBinvoGood.RecordCount Do
     Begin
      IF Frodm.RejBinvoGoodBkod.Value Then Frodm.RejBinvoGood.Delete;
      If Frodm.RejBinvoGood.Eof Then Exit;
      Frodm.RejBinvoGood.Next;
     End;
     Frodm.RejBinvoGood.First;
end;

Procedure TFTolid.UnDepot;
Var
I:Integer;
begin
     Frodm.RejBinvoGood.First;
     For I:= 1 To Frodm.RejBinvoGood.RecordCount Do
     Begin
      DepotChange(Frodm.RejBinvoGoodKod.Value,Frodm.RejBinvoGoodAnbKod.Value,
                  Frodm.RejBinvoGoodColor.Value,Frodm.RejBinvoGoodAnbNam.Value,
                  Frodm.RejBinvoGoodQuant.Value,dpIn);
      Frodm.RejBinvogood.Next;
     End;
     Cardex_Del(FNo.Text,Tip);
end;

Procedure TFTolid.Depot;
Var
I:Integer;
GS:Boolean;
begin
     For I:=1 To Frodm.RejBinvoGood.RecordCount Do
     Begin
       Gs:=GoodState(Frodm.RejBinvoGoodKod.Value);
       If DepotCheck(Frodm.RejBinvoGoodKod.Value,Frodm.RejBinvoGoodAnbKod.Value,
                     Frodm.RejBinvoGoodColor.Value,Frodm.RejBinvoGoodAnbNam.Value,
                     Frodm.RejBinvoGoodQuant.Value) or Gs Then
       Begin
       Auto_GCardex(Frodm.RejBinvoGoodNam.Value,Frodm.RejBinvoGoodColor.Value,
                    Frodm.RejBinvoGoodAnbNam.Value,Frodm.RejBinvoGoodKod.Value,
                    Frodm.RejBinvoGoodAnbKod.Value,Frodm.RejBinvoGoodQuant.Value,
                    dpOut,Abs(NewNo),Frodm.RejBinvoGoodDat.Value,Tip,'ÊæáíÏ',
                    Frodm.RejBinvoGoodPfee.Value,Frodm.RejBinvoGoodPerc.Value);//FNam.Text
       If Not Gs Then
       DepotChange(Frodm.RejBinvoGoodKod.Value,Frodm.RejBinvoGoodAnbKod.Value,
                   Frodm.RejBinvoGoodColor.Value,Frodm.RejBinvoGoodAnbNam.Value,
                   Frodm.RejBinvoGoodQuant.Value,dpOut);
       End Else
       Begin
         Frodm.RejBinvoGood.Edit;
         Frodm.RejBinvoGoodBKod.Value:=True;
         Frodm.RejBinvoGood.Post;
       End;
       Frodm.RejBinvoGood.Next;
     End;
     Good_Del;
end;

Function TFTolid.Check_Fac:Boolean;
Var
I:Integer;
begin
     Result:=True;
     If Not sDp Then Exit;
     Frodm.RejBinvoGood.First;
     For I:=1 To Frodm.RejBinvoGood.RecordCount Do
     Begin
       Result:=DepotCheck(Frodm.RejBinvoGoodKod.Value,Frodm.RejBinvoGoodAnbKod.Value,
                          Frodm.RejBinvoGoodColor.Value,Frodm.RejBinvoGoodAnbNam.Value,
                          Frodm.RejBinvoGoodQuant.Value);
       Result:= Result Or GoodState(Frodm.RejBinvoGoodKod.Value);
       MoFlag:=Result;
       If Not Result Then
       Begin
         ShowMessage( 'ÚÜÜÜÏã ãæÌæÏí ßÇÝí');
         Goods.SetFocus;
         Exit;
       End;
       Frodm.RejBinvoGood.Next;
     End;
     Frodm.RejBinvoGood.First;
end;

Function TFTolid.DeleteCheck:Boolean;
Var
I:Integer;
begin
     Result:=True;
     Frodm.BinvoGood.First;
     For I:=1 To Frodm.BinvoGood.RecordCount Do
     Begin
       Result :=DepotCheck(Frodm.BinvoGoodKod.Value,0,
                   Frodm.BinvoGoodColor.Value,Frodm.BinvoGoodAnbNam.Value,
                   Frodm.BinvoGoodQuant.Value);
       If Not Result Then Exit;
       Frodm.BinvoGood.Next;
     End;
end;

Function TFTolid.GoodSum(Kod:Integer;BNo,Color,Anb:String;Shelf:Integer):Real;
Var
Filt:String;
begin
     Filt:='';
     Filt:='D.Kod = '+IntToStr(Kod);
     If Color > ''Then Filt:=Filt+' and D.Color='+#39+Color+#39;
     If Anb > ''  Then Filt:=Filt+' and D.AnbNam='+#39+Anb+#39;
     If Shelf > 0 Then Filt:=Filt+' and D.AnbKod= '+IntToStr(Shelf);
     If Pos(' and',Filt)= 1 Then Delete(Filt,1,4);

     If Color > ''Then Filt:=Filt+' and B.Color='+#39+Color+#39;
     If Anb > ''  Then Filt:=Filt+' and B.AnbNam='+#39+Anb+#39;
     If Shelf > 0 Then Filt:=Filt+' and B.AnbKod= '+IntToStr(Shelf);
     If Pos(' and',Filt)= 1 Then Delete(Filt,1,4);
     BQu.SQL.Strings[2]:='WHERE '+Filt+' and B.Kod='+IntToStr(Kod)+' and B.No = -'+BNo;
     BQu.Open;
     Result:=BQu.Fields[0].AsFloat+BQu.Fields[1].AsFloat;
     BQu.Close;
end;

Function TFTolid.NegDep:Boolean;
Var
I:Integer;
Dbl:Boolean;
begin
     Result:=True;
     MoFlag:=True;
     If Not sDp Then Exit;
     Screen.Cursor:=crSQLWait;
     Qu.SQL.Clear;
     Qu.SQL.Add('SELECT Distinct Kod From BinvoGood B Where B.No= -'+FNo.Text);
     Qu.Open;
     Dbl:=Qu.RecordCount = Frodm.BinvoGood.RecordCount;
     Qu.Close;
     Frodm.BinvoGood.First;
//-----------
     IF dbl Then

     For I:=1 To Frodm.BinvoGood.RecordCount Do //
     Begin
        If Good_Moj_Anb(Frodm.BinvoGoodNam.Value,Frodm.BinvoGoodColor.Value,
                     Frodm.BinvoGoodAnbNam.Value,0)+
                     Frodm.BinvoGoodQuant.Value < 0 Then
       Begin
         Result:=False;
         MoFlag:=False;
         ShowMessage('ãÞÏÇÑ ÇÒ ÍÏÇÞá ããßä ßãÊÑ ÇÓÊ-ÎØÇí ÇäÈÇÑ ãäÝí');
         Goods_In.SetFocus;
         Exit;
       End;
       Frodm.BinvoGood.Next;
     End
      ELse  //----
     For I:=1 To Frodm.BinvoGood.RecordCount Do
     Begin
       If GoodSum(Frodm.BinvoGoodKod.Value,FNo.Text,Frodm.BinvoGoodColor.Value,
                  Frodm.BinvoGoodAnbNam.Value,0) < 0 Then
       Begin
         Result:=False;
         MoFlag:=False;
         ShowMessage('ãÞÏÇÑ ÇÒ ÍÏÇÞá ããßä ßãÊÑ ÇÓÊ-ÎØÇí ÇäÈÇÑ ãäÝí');
         Goods_In.SetFocus;
         Exit;
       End;
       Frodm.BinvoGood.Next;
     End;
     Screen.Cursor:=crDefault;
     Frodm.BinvoGood.First;
end;

Procedure TFTolid.UnDepot_In;
Var
I:Integer;
begin
     Frodm.BinvoGood.First;
     For I:=1 To Frodm.BinvoGood.RecordCount Do
     begin
       DepotChange (Frodm.BinvoGoodKod.Value,0,
                    Frodm.BinvoGoodColor.Value,Frodm.BinvoGoodAnbNam.Value,
                    Frodm.BinvoGoodQuant.Value,dpOut);
       Frodm.BinvoGood.Next;
     End;
     Cardex_Del(FNo.Text,Tip_In);
End;

Procedure TFTolid.Depot_In;
Var
I:Integer;
begin
       For I:=1 To Frodm.BinvoGood.RecordCount Do
       Begin
         Auto_GCardex(Frodm.BinvoGoodNam.Value,Frodm.BinvoGoodColor.Value,
                      Frodm.BinvoGoodAnbNam.Value,Frodm.BinvoGoodKod.Value,
                      0,Frodm.BinvoGoodQuant.Value,
                      dpIn,Abs(NewNo),Frodm.BinvoGoodDat.Value,Tip_In,'ÊæáíÏ',
                      Frodm.BinvoGoodPfee.Value,Frodm.BinvoGoodPerc.Value);//FNam.Text
         DepotChange (Frodm.BinvoGoodKod.Value,0,
                      Frodm.BinvoGoodColor.Value,Frodm.BinvoGoodAnbNam.Value,
                      Frodm.BinvoGoodQuant.Value,dpIn);
         Frodm.BinvoGood.Next;
       End;
end;

{Function TFTolid.MaxNo:Integer;
begin
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Min(B.No) From Binvogood B ');
     Qu.Open;
     Result:=Qu.Fields[0].AsInteger;
     If Result >= 0 Then Result:=-1;
     Qu.Close;
end;}
Function TFTolid.MaxNo:Integer;
begin
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Max(B.No) From Tolids B ');
     Qu.Open;
     Result:=Qu.Fields[0].AsInteger;
     If Result = 0 Then Result:=1;
     Qu.Close;
end;


Procedure TFTolid.GoodFilter(FacNo:Integer);
Begin
     Frodm.RejBinvoGood.Filtered:=False;
     Frodm.RejBinvoGood.Filter:='No = '+IntToStr(-FacNo);
     Frodm.RejBinvoGood.Filtered:=True;
     Frodm.BinvoGood.Filtered:=False;
     Frodm.BinvoGood.Filter:='No = '+IntToStr(-FacNo);
     Frodm.BinvoGood.Filtered:=True;
     Dat1.Text:=IntToDate(Frodm.TolDat.Value)
end;

Function TFTolid.Out_Sum:Currency;
begin
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Sum(Ptotal) From RejBinvoGood B Where B.No ='+IntToStr(-NewNo));
     Qu.Open;
     Result:=Qu.Fields[0].AsCurrency;
     Qu.Close;
end;

Function TFTolid.In_Sum:Currency;
begin
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Sum(Ptotal) From BinvoGood B Where B.No ='+IntToStr(-NewNo));
     Qu.Open;
     Result:=Qu.Fields[0].AsCurrency;
     Qu.Close;
end;

Function TFTolid.BuyPrice(Dat,Kod:Integer;Color,Anb:String):Currency;
Var
st:String;
begin
     St:='Kod = '+IntToStr(Kod)+' and Dat <='+IntToStr(Dat);
     If Color >'' Then St:=St+' and Color = '+#39+Color+#39;
     If Anb > ''  Then St:=St+' and AnbNam = '+#39+Anb+#39;
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Pfee,Dat From BinvoGood ');
     Qu.SQL.Add(' Where '+St);
     Qu.SQL.Add(' Order By Dat,Pfee ');
     Qu.Open;
     Qu.Last;
     Result:=Qu.Fields[0].AsCurrency;
     Qu.Close;
end;

procedure TFTolid.CancelFactor;
Var
I:Integer;
begin
     If Not Frodm.BinvoGood.Filtered Then Exit;
     If Not Frodm.RejBinvoGood.Filtered Then Exit;
     Frodm.BinvoGood.First;
     For I:=1 To Frodm.BinvoGood.RecordCount Do Frodm.BinvoGood.Delete;
     Frodm.RejBinvoGood.First;
     For I:=1 To Frodm.RejBinvoGood.RecordCount Do Frodm.RejBinvoGood.Delete;
     Frodm.Tol.Delete;
end;

procedure TFTolid.CancelEdit;
Var
I,J:Integer;
begin
     Frodm.BinvoGood.First;
     For I:=1 To Frodm.BinvoGood.RecordCount Do Frodm.BinvoGood.Delete;
     EdQu.First;
     For I:=1 To EdQu.RecordCount Do
     Begin
       Frodm.BinvoGood.Append;
       For J:=1 To 15 Do
         Frodm.BinvoGood.Fields[J].Value:=EdQu.Fields[J].Value;
       Frodm.BinvoGood.Post;
       EdQu.Next;
     End;
     EdQu.Close;

     Frodm.RejBinvoGood.First;
     For I:=1 To Frodm.RejBinvoGood.RecordCount Do Frodm.RejBinvoGood.Delete;
     EdQu2.First;
     For I:=1 To EdQu2.RecordCount Do
     Begin
       Frodm.RejBinvoGood.Append;
       For J:=1 To 15 Do
         Frodm.RejBinvoGood.Fields[J].Value:=EdQu2.Fields[J].Value;
       Frodm.RejBinvoGood.Post;
       EdQu2.Next;
     End;
     EdQu2.Close;
     Frodm.Tol.Cancel;
     Frodm.BinvoGood.First;
     Frodm.RejBinvoGood.First;
     Depot;
     Depot_In;
end;

Function TFTolid.GetTolCount:Real;
begin
     Qu.SQL.Clear;
     Qu.SQL.ADD('SELECT SUM(D.Quant)');
     Qu.SQL.ADD('FROM BInvoGood D');
     QU.SQL.ADD('WHERE D.No =:d ');
     Qu.Params[0].Value:=-NewNo;
     Qu.Open;
     Result:=Qu.Fields[0].AsFloat;
     Qu.Close;
end;

Function TFTolid.GetBFeeSum:Currency;
begin
     Qu.SQL.Clear;
     Qu.SQL.ADD('SELECT SUM(D.BFee)');
     Qu.SQL.ADD('FROM BInvoGood D');
     QU.SQL.ADD('WHERE D.No =:d ');
     Qu.Params[0].Value:=-NewNo;
     Qu.Open;
     Result:=Qu.Fields[0].AsCurrency;
     Qu.Close;
     If Result=0 Then Result:=1;
end;

Function TFTolid.CalcPCost(Cost:Currency):Currency;
Var
I:Integer;
sFee:Currency;
sQuant:Real;
begin
     Frodm.BinvoGood.First;
     sFee:=GetBfeeSum;
     sQuant:=GetTolCount;
     For I:=1 To Frodm.BinvoGood.RecordCount Do
     Begin
      Frodm.BinvoGood.Edit;
      Frodm.BinvoGoodPTotal.Value:=(Frodm.BinvoGoodBfee.Value/sFee)*Cost;
      Frodm.BinvoGoodPFee.Value:=Frodm.BinvoGoodPTotal.Value/Frodm.BinvoGoodQuant.Value;
      Frodm.BinvoGood.Post;
      Frodm.BinvoGood.Next;
     End;
     Frodm.BinvoGood.First;
end;

Function TFTolid.IsPriced:Boolean;
Var
I:Integer;
begin
     Frodm.BinvoGood.First;
     Result:=True;
     Result:=Frodm.TolOutp.Value = Frodm.TolInp.Value;
     If Not Result Then Exit;
     For I:=1 To Frodm.BinvoGood.RecordCount Do
     Begin
      Result:=Frodm.BinvoGoodPFee.AsCurrency<>0;
      If Not Result Then Exit;
      Frodm.BinvoGood.Next;
     End;
end;

//End Of Private

procedure TFTolid.FormClose(Sender: TObject; var Action: TCloseAction);
begin
{     IF Frodm.RejBinvoGood.RecordCount = 0 Then
      If Frodm.BinvoGood.RecordCount = 0 Then hBrowse :=True;
     Case hBrowse Of
      True : Action:=caFree;
      False: Action:=caNone;
     End;                   }
     Action:=caFree;
end;

procedure TFTolid.FormActivate(Sender: TObject);
begin
     GList_In.Items.Assign(Kala);
     Fill_Comb(Frodm.Color,'Color',CList.Items);
     Fill_Comb(Frodm.AnbDat,'Nam',AList.Items);
end;

procedure TFTolid.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     EdQu.DatabaseName:=CurrDb;
     EdQu2.DatabaseName:=CurrDb;
     GList_In.Items.Assign(Kala);
     Goods_In.Columns[5].Visible :=sAKod;
     Goods_In.Columns[3].Visible :=sModel;
     Goods_In.Columns[9].Width:=31;
     Goods_In.Columns[5].Width:=31;
     Goods_In.Columns[3].Width:=81;

     Goods.Columns[5].Visible :=sAKod;
     Goods.Columns[3].Visible :=sModel;
     Goods.Columns[9].Width:=31;
     Goods.Columns[5].Width:=31;
     Goods.Columns[3].Width:=81;
     New:=False;
     NewNo:=MaxNo;
     Max_No:=NewNo;
     Frodm.Tol.Locate('No',NewNo,[loCaseInsenSitive]);
     FNo.Text:=IntToStr(NewNo);
     GoodFilter(NewNo);
end;

procedure TFTolid.FormDestroy(Sender: TObject);
begin
     If Frodm.Tol.State = dsBrowse Then Exit;
     Case New Of
     True :Begin
            CancelFactor;
            GoodFilter(Frodm.TolNo.AsInteger);//1381-08-29
            FNo.Text:=IntToStr(Frodm.TolNo.AsInteger);
           End;
     False: CancelEdit;
     End;
end;

procedure TFTolid.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     IF Key = VK_F3 Then BsaveClick(Sender);
     If Shift = [ssAlt] Then
      Case Key Of
       VK_LEFT : BprevClick(Sender);
       VK_RIGHT: BnextClick(Sender);
      End;
end;

procedure TFTolid.FNoKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then FNoExit(Sender);
     NexTab(Sender,Key);
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;
end;

procedure TFTolid.FNoExit(Sender: TObject);
begin
     IF Not(Frodm.Tol.State = dsBrowse)  Then //hBrowse
     Begin
       FNo.Text:=IntToStr(NewNo);
       Exit;
     end;
     NewNo:=StrToInt(FNo.Text);
     If Not Frodm.Tol.Locate('No',NewNo,[loCaseInsensitive]) Then
     Begin
      Frodm.Tol.Append;
      Frodm.TolNo.Value:=NewNo;
      Frodm.TolDat.Value:=Fardate;
      Frodm.TolPerm.Value:=False;
      Frodm.Tol.Post;
      Frodm.Tol.Edit;
      New:=True;
      GoodFilter(Frodm.TolNo.AsInteger);
     End Else
      GoodFilter(NewNo);
end;

procedure TFTolid.GoodsColEnter(Sender: TObject);
begin
     If Frodm.Tol.State = dsBrowse Then Exit Else Frodm.RejBinvoGood.Edit;
     Case Goods.SelectedField.Index Of
      1:  IF Frodm.RejBinvoGoodRadif.Value > 0 Then Radif:=Frodm.RejBinvoGoodRadif.Value;
      5:  IF Frodm.RejBinvoGoodNam.Value = '' Then Goods.SelectedField:=
          Frodm.InvoGoodNam;
      6:  IF (Frodm.RejBinvoGoodAnbNam.Value = '')and Not(GoodState(Frodm.RejBinvoGoodKod.Value))
          Then Goods.SelectedField:=Frodm.RejBinvoGoodAnbNam;
     11: Frodm.RejBinvoGoodPtotal.Value :=(1-Frodm.RejBinvoGoodPerc.Value /100)*
           Frodm.RejBinvoGoodPfee.Value *Frodm.RejBinvoGoodQuant.Value;
     End;

end;

procedure TFTolid.GoodsColExit(Sender: TObject);
begin
     If Frodm.Tol.State = dsBrowse Then Exit Else Frodm.RejBinvoGood.Edit;
     Case Goods.SelectedField.Index Of
     1:Begin
       IF Frodm.RejBinvoGoodRadif.Value = 0 Then Frodm.RejBinvoGoodRadif.Value :=Radif;
       End;
     2:Begin
        Frodm.RejBinvoGoodDat.Value :=Frodm.TolDat.Value;
        Frodm.RejBinvoGoodNo.Value:=-1*NewNo;
        If Goods.columns[1].ReadOnly Then Exit;
        If (sGene = False) and GoodState(Frodm.RejBinvoGoodKod.Value) Then
        Begin
          Frodm.RejBinvoGoodNam.Value:=GoodNam(Frodm.RejBinvoGoodKod.Value);
          Frodm.RejBinvoGoodPfee.Value:=BuyPrice(Frodm.RejBinvoGoodDat.Value,
           Frodm.RejBinvoGoodKod.Value,Frodm.RejBinvoGoodColor.Value,Frodm.RejBinvoGoodAnbNam.Value);
          Exit;
        End;
        FillGList(Frodm.RejBinvoGoodKod.Value);
        If GList.Items.Count = 0 Then Exit;
        GList.SetFocus;
        GList.ItemIndex:=0;
       End;
     6:If Goods.SelectedField.Text = Null Then Goods.SelectedField.Value :=0;
     7: Begin
         Frodm.RejBinvoGoodPtotal.Value :=GetOutPrice(Frodm.RejBinvoGoodKod.AsString,
         Frodm.RejBinvoGoodColor.Value,Frodm.RejBinvoGoodAnbNam.Value,
         Frodm.RejBinvoGoodAnbKod.Value,0,Frodm.TolDat.AsInteger,Frodm.RejBinvoGoodQuant.Value);
         Frodm.RejBinvoGoodPfee.Value:= Frodm.RejBinvoGoodPtotal.Value/Frodm.RejBinvoGoodQuant.Value;
         Frodm.RejBinvoGoodReject.Value:=Frodm.RejBinvoGoodQuant.Value;
        End;
     10:Frodm.RejBinvoGoodPtotal.Value :=(1-Frodm.RejBinvoGoodPerc.Value /100)*
       Frodm.RejBinvoGoodPfee.Value *Frodm.RejBinvoGoodQuant.Value;
     End;
     If Goods.Columns[0].Field.Value > 0 Then Radif:=Frodm.RejBinvoGoodRadif.Value ;
end;

procedure TFTolid.GoodsEditButtonClick(Sender: TObject);
begin
     If Not (Frodm.Tol.State = dsBrowse) Then
     Begin
       Frodm.RejBinvoGood.Delete;
       Frodm.RejBinvoGood.Edit;
     End;
end;

procedure TFTolid.GoodsEnter(Sender: TObject);
begin
     If (Frodm.Tol.State = dsBrowse) Then
      Goods.ReadOnly := True
     Else
      Goods.ReadOnly :=False;
     Goods.selectedField:=Goods.Columns[0].Field;
end;

procedure TFTolid.GoodsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Not(Frodm.Tol.State = dsBrowse) Then Frodm.RejBinvoGood.Edit;
     If Shift =[ssCtrl] Then Goods_In.SetFocus;
     If (Goods.SelectedIndex In [8,10]) and Not(Frodm.Tol.State = dsBrowse ) Then
     Case Key Of
       VK_MULTIPLY :Begin
               Frodm.RejBinvoGood.Edit;
               Goods.SelectedField.Value := Goods.SelectedField.Value*1000;
               Frodm.RejBinvoGood.Post;
               End;
       VK_DIVIDE   : Begin
               Frodm.RejBinvoGood.Edit;
               Goods.SelectedField.Value := Goods.SelectedField.Value* 100;
               Frodm.RejBinvoGood.Post;
               End;
     End;
end;

procedure TFTolid.GoodsKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
       Key:=#0;
       GridMove(Goods,Frodm.RejBinvoGood,Radif);
     End;

end;

procedure TFTolid.GListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key = 27 Then
     Begin
       Goods.SetFocus;
       Frodm.RejBinvoGood.Delete;
       Frodm.RejBinvoGood.Append;
       Goods.SelectedField :=Frodm.RejBinvoGoodRadif;
       GList.Visible :=False;
       Bexit.Cancel :=True;
     End;
end;

procedure TFTolid.GListKeyPress(Sender: TObject; var Key: Char);
Var
S:String;
begin
     If Key=#13 Then
     Begin
     Key:=#0;
     s:=GList.Items.Strings[GList.ItemIndex];
     Frodm.RejBinvoGood.Edit;
     Frodm.RejBinvoGoodNam.Value :=Decode(s);
     Frodm.RejBinvoGoodColor.Value :=Decode(s);
     Frodm.RejBinvoGoodAnbNam.Value :=Decode(s);
     Frodm.RejBinvoGoodQuant.Value :=StrToFloat(Decode(s));
     Frodm.RejBinvoGoodkod.Value :=GoodKod(Frodm.RejBinvoGoodNam.Value);
     Frodm.RejBinvoGoodPfee.Value :=BuyPrice(Frodm.RejBinvoGoodDat.Value,
      Frodm.RejBinvoGoodKod.Value,Frodm.RejBinvoGoodColor.Value,Frodm.RejBinvoGoodAnbNam.Value);
     Frodm.RejBinvoGoodNo.Value:=-1*NewNo;
     Frodm.RejBinvoGoodDat.Value :=Frodm.TolDat.Value;
     Frodm.RejBinvoGood.Post;
     Goods.SetFocus;
     Goods.SelectedField :=Goods.Columns[6].Field;
     GList.Visible :=False;
     Bexit.Cancel :=True;
     End;
end;
{ Binvogood Processing Parts}

procedure TFTolid.Goods_InColEnter(Sender: TObject);
begin
     If Frodm.Tol.State = dsBrowse Then Exit;
     Case Goods_In.SelectedField.Index Of
     1:If Frodm.BinvoGoodRadif.Value > 0 Then Radif:=Frodm.BinvoGoodRadif.Value;
     3: If (Frodm.BinvoGoodKod.Value = 0 ) Then
       Case sGene Of
        False:Begin
            If Goods_In.Columns[1].ReadOnly Then Exit;
            DrawList(GList_In,2);
          End;
        True:Begin
            If Goods_In.columns[1].ReadOnly Then Exit;
            GList_In.Items.Assign(Kala);
            DrawList(GList_In,2);
          End;
       End;
     4: DrawList(CList,3);
     5: Begin
        IF (Frodm.BinvoGoodColor.Value = '')and(sModel)  Then
          Goods_In.SelectedField:= Frodm.BinvoGoodColor;
        IF Frodm.BinvoGoodNam.Value = '' Then Goods_In.SelectedField:= Frodm.BinvoGoodNam;
        DrawList(AList,4);
        End;
     6: IF Frodm.BinvoGoodAnbNam.Value = '' Then Goods_In.SelectedField:=
        Frodm.BinvoGoodAnbNam;
     11: Begin
         Frodm.BinvoGoodPtotal.Value :=(1-Frodm.BinvoGoodPerc.Value /100)*
          Frodm.BinvoGoodQuant.Value * Frodm.BinvoGoodBfee.Value;//Frodm.BinvoGoodPfee.Value;
         End;
     End;
end;

procedure TFTolid.Goods_InColExit(Sender: TObject);
begin
     If Frodm.Tol.State = dsBrowse  Then Exit Else Frodm.BinvoGood.Edit;
     Case Goods_In.SelectedField.Index Of
     1: Begin
//          ColumnEnable;
          If Frodm.BinvoGoodRadif.Value = 0 Then Frodm.BinvoGoodRadif.Value :=Radif;
          Frodm.BinvoGoodDat.Value :=Frodm.TolDat.Value;
          Frodm.BinvoGoodNo.Value:=-1*NewNo;
          Frodm.BinvoGood.Post;
        End;
     2: If Goods_In.SelectedField.Value > 0 Then
        case sGene Of
          False:Begin
             If Goods_In.Columns[1].ReadOnly Then Exit;
             Frodm.BinvoGoodNam.Value :=GoodNam(Goods_In.SelectedField.Value);
//             Frodm.BinvoGoodPfee.Value :=GoodBuyPrice(Goods_In.SelectedField.Value);
            End;
          True :Begin
             If Goods_In.columns[1].ReadOnly Then Exit;
             FillGene(GList_In.Items,Goods_In.SelectedField.Value);
             DrawList(GList_In,2);
            End;
        End;
     4: If Goods_In.SelectedField.Value > '' Then Frodm.BinvoGoodColor.Value :=
           TeepNam(Goods_In.SelectedField.Value);
     5: Frodm.BinvoGoodAnbNam.Value :=AnbNam(Frodm.BinvoGoodAnbNam.Value);
     7: Begin
         Frodm.BinvoGoodPtotal.Value :=Frodm.BinvoGoodQuant.Value *
         Frodm.BinvoGoodPfee.Value;
        End;
     6:If Goods_In.SelectedField.Text = Null Then Frodm.BinvoGoodAnbKod.Value :=0;
     10: Frodm.BinvoGoodPtotal.Value :=(1-Frodm.BInvoGoodPerc.Value /100)*
      Frodm.BinvoGoodQuant.Value * Frodm.BinvoGoodPfee.Value;
     End;
     If Goods_In.Columns[0].Field.Value > 0 Then Radif:=Frodm.BinvoGoodRadif.Value ;
end;

procedure TFTolid.Goods_InEditButtonClick(Sender: TObject);
begin
     If Not (Frodm.Tol.State = dsBrowse)   Then
     Begin
//       If Good_Moj_Anb(Frodm.BinvoGoodNam.Value,Frodm.BinvoGoodColor.Value,
//       Frodm.BinvoGoodAnbNam.Value,0)< 0 Then Exit;
       Frodm.BinvoGood.Delete;
       Frodm.BinvoGood.Edit;
     End;
end;

procedure TFTolid.Goods_InEnter(Sender: TObject);
begin
     If Frodm.Tol.State = dsBrowse  Then
      Goods_In.ReadOnly :=True
     Else Begin
      Goods_In.ReadOnly :=False;
      Frodm.TolOutp.Value:=Out_Sum;//87-08-17
     End;
     Goods_In.selectedField:=Goods_In.Columns[0].Field;
end;

procedure TFTolid.Goods_InKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Not(Frodm.Tol.State = dsBrowse ) Then Frodm.BInvoGood.Edit;
     If Shift = [ssCtrl] Then BPrev.SetFocus;
     IF ((Key = VK_F4) and Not(Frodm.Tol.State = dsBrowse )) Then
//       and Not(Goods_In.Columns[Goods_In.SelectedIndex-1].ReadOnly ))
     Case Goods_In.SelectedField.Index Of
     3: DrawList(GList_In,2);
     4: DrawList(Clist,3);
     5: DrawList(AList,4);
     End;
     If (Goods_In.SelectedIndex In [8,10]) and Not(Frodm.Tol.State = dsBrowse ) Then
     Case Key Of
       VK_MULTIPLY :Begin
               Frodm.BInvoGood.Post;
               Frodm.BInvoGood.Edit;
               Goods_In.SelectedField.Value := Goods_In.SelectedField.Value*1000;
               Frodm.BInvoGood.Post;
               End;
       VK_DIVIDE   : Begin
               Frodm.BInvoGood.Post;
               Frodm.BInvoGood.Edit;
               Goods_In.SelectedField.Value := Goods_In.SelectedField.Value* 100;
               Frodm.BInvoGood.Post;
               End;
     End;
end;

procedure TFTolid.Goods_InKeyPress(Sender: TObject; var Key: Char);
begin
     If Not(Frodm.Tol.State = dsBrowse) Then Frodm.BInvoGood.Edit;
     If Key = #13 Then
     Begin
       Key:=#0;
       GridMove(Goods_In,Frodm.BInvo,Radif);
     End;

end;

procedure TFTolid.GList_InKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If (Key = 27) Then
     Begin
       Goods_In.SetFocus;
       Goods_In.SelectedField :=Goods_In.Columns[1].Field;
       GList_In.Visible :=False;
       Bexit.Cancel :=True;
     End;
end;

procedure TFTolid.GList_InKeyPress(Sender: TObject; var Key: Char);
begin
     If Key =#13 Then
     Begin
       Frodm.BinvoGood.Edit;
       Frodm.BinvoGoodNo.Value:=-1*NewNo;
       Frodm.BinvoGoodNam.Value:=GList_In.Items.Strings[GList_In.ItemIndex];
       Frodm.BinvoGoodKod.Value :=GoodKod(Frodm.BinvoGoodNam.Value);
       Frodm.BinvoGoodBFee.Value:=GoodBuyPrice(Frodm.BinvoGoodKod.Value);//GoodSoldPrice(Frodm.BinvoGoodKod.Value);
       Frodm.BinvoGoodQuant.Value :=0;
       Goods_In.SetFocus;
       Goods_In.SelectedField :=Frodm.BinvoGoodNam;
       GList_In.Visible :=False;
       Bexit.Cancel :=True;
     End;
end;

procedure TFTolid.CListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If (Key = 27) Then
     Begin
       Goods_In.SetFocus;
       Goods_In.SelectedField :=Goods_In.Columns[2].Field;// Frodm.BinvoGoodColor;
       CList.Visible :=False;
       Bexit.Cancel :=True;
     End;
end;

procedure TFTolid.CListKeyPress(Sender: TObject; var Key: Char);
begin
     If Key =#13 Then
     Begin
       Frodm.BinvoGood.Edit;
       Frodm.BinvoGoodColor.Value:=CList.Items.Strings[CList.ItemIndex];
       Goods_In.SetFocus;
       Goods_In.SelectedField :=Frodm.BinvoGoodAnbNam;
       CList.Visible :=False;
       Bexit.Cancel :=True;
     End;
end;

procedure TFTolid.AListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If (Key = 27) Then
     Begin
       Goods_In.SetFocus;
       Goods_In.SelectedField :=Goods_In.Columns[2].Field;//Frodm.BinvoGoodAnbNam;
       AList.Visible :=False;
       Bexit.Cancel :=True;
     End;
end;

procedure TFTolid.AListKeyPress(Sender: TObject; var Key: Char);
begin
     If Key =#13 Then
     Begin
       Frodm.BinvoGood.Edit;
       Frodm.BinvoGoodAnbNam.Value:=AList.Items.Strings[AList.ItemIndex];
       Goods_In.SetFocus;
       Goods_In.SelectedField :=Frodm.BinvoGoodQuant;
       AList.Visible :=False;
       Bexit.Cancel :=True;
     End;
end;

procedure TFTolid.BPrevClick(Sender: TObject);
begin
     If Frodm.Tol.State In [dsEdit,dsInsert] Then
     Begin
      Check_Factor_State(Frodm.Tol,BSaveClick,FormDestroy);
      New:=False;
      Exit;
     End;
     FroDM.Tol.Prior;
     FNo.Text:=IntToStr(Frodm.TolNo.Value);
     GoodFilter(Frodm.TolNo.AsInteger);
     NewNo:=Frodm.TolNo.Value+1;
end;

procedure TFTolid.BnextClick(Sender: TObject);
begin
     If Frodm.Tol.State In [dsEdit,dsInsert] Then
     Begin
      Check_Factor_State(Frodm.Tol,BSaveClick,FormDestroy);
      New:=False;
      Exit;
     End;
     FroDM.Tol.Next;
     FNo.Text:=IntToStr(Frodm.TolNo.Value);
     GoodFilter(Frodm.TolNo.AsInteger);
     NewNo:=Frodm.TolNo.Value+1;
     If Frodm.Tol.Eof Then
     Begin
       FNo.Text:=IntToStr(NewNo);
       FNo.SetFocus;
     End;
end;

procedure TFTolid.BeditClick(Sender: TObject);
begin
     If Not(Frodm.Tol.State = dsBrowse) Then Exit;
     If MessageDlg('ÝÑã ÌÇÑí ÊÛííÑ ÏÇÏå ãíÔæÏ¿',mtWarning,mbYesNo,0)= idYes Then
     Begin
      EdQu.SQL.Strings[1]:='WHERE I.no =-'+FNo.Text;
      EdQu.Open;
      EdQu2.SQL.Strings[1]:='WHERE I.no =-'+FNo.Text;
      EdQu2.Open;
      UnDepot;
      UnDepot_In;
      Frodm.Tol.Edit;
      New:=False;
      FNo.SetFocus;
     End;
end;

procedure TFTolid.BCalcClick(Sender: TObject);
begin
     If Frodm.Tol.State=dsBrowse Then Exit;
     If Frodm.RejBinvogood.RecordCount = 0 Then
     Begin
       ShowMessage('ãæÇÏ Çæáíå ÇäÊÎÇÈ äÔÏå ÇäÏ');
       Exit;
     End;
     If Frodm.Binvogood.RecordCount = 0 Then
     Begin
       ShowMessage('ãÍÕæá ÊæáíÏ ÔÏå ÇäÊÎÇÈ äÔÏå ÇÓÊ');
       Exit;
     End;
     Frodm.TolOutp.Value:=Out_Sum;
     Frodm.TolInp.Value:=Frodm.TolOutp.Value;//In_Sum;
     If Frodm.TolOutp.Value <> Frodm.TolInp.Value Then
     Begin
       ShowMessage('ÊÑÇÒ ãÇáí ÊÈÏíá ÈÑÇÈÑ äíÓÊ');
       Exit;
     End;
     Goods.DataSource:=Nil;
     Goods_In.DataSource:=Nil;
     Frodm.BinvoGood.BeforePost:=Nil;
     CalcPCost(Frodm.TolOutp.Value);
     Goods.DataSource:=Frodm.RejBinvoGoodDs;
     Goods_In.DataSource:=Frodm.BinvoGoodDs;
     Frodm.BinvoGood.BeforePost:=Frodm.BinvoGoodBeforePost;
end;

procedure TFTolid.BsaveClick(Sender: TObject);
begin
     If (Frodm.Tol.State = dsBrowse) Then Exit;
{     If Frodm.RejBinvogood.RecordCount = 0 Then
     Begin
       ShowMessage('ãæÇÏ Çæáíå ÇäÊÎÇÈ äÔÏå ÇäÏ');
       Exit;
     End;
     If Frodm.Binvogood.RecordCount = 0 Then
     Begin
       ShowMessage('ãÍÕæá ÊæáíÏ ÔÏå ÇäÊÎÇÈ äÔÏå ÇÓÊ');
       Exit;
     End;
//     Frodm.TolOutp.Value:=Out_Sum;
//     CalcPCost(Frodm.TolOutp.Value);
//     Frodm.TolInp.Value:=In_Sum;
}
     BCalcClick(Sender);
     If Not IsPriced Then
     Begin
      MessageBeep(MB_ICONASTERISK);
      ShowMessage('ÞíãÊ ãÍÕæáÇÊ ÊæáíÏí ãÔÎÕ äÔÏå ÇÓÊ');
      Exit;
     End;
     If Not(Frodm.RejBinvoGood.State =dsBrowse) Then Frodm.RejBinvoGood.Post;
     If Not(Frodm.BinvoGood.State =dsBrowse) Then Frodm.BinvoGood.Post;
     If Not Check_Fac Then Exit;
     If Not NegDep    Then Exit;
     Goods.DataSource:=Nil;
     Goods_In.DataSource:=Nil;
     Frodm.BinvoGood.BeforePost:=Nil;
     Depot;
     Depot_In;
     Frodm.Tol.Post;
     QuickCloseOpen([37,5,23,27,11]);
     Goods.DataSource:=Frodm.RejBinvoGoodDs;
     Goods_In.DataSource:=Frodm.BinvoGoodDs;
     Frodm.BinvoGood.BeforePost:=Frodm.BinvoGoodBeforePost;
     New:=False;
     Frodm.Tol.Locate('No',NewNo,[loCaseInsensitive]);
     GoodFilter(NewNo);
     FNo.SetFocus;
end;

procedure TFTolid.BdelClick(Sender: TObject);
Var
I:Integer;
begin
     If Not (Frodm.Tol.State = dsBrowse) Then Exit;
     If MessageDlg('ÝÑã ÌÇÑí ÍÐÝ ãíÔæÏ¿',mtWarning,mbYesNo,0) = idYes Then
     Begin
       If Not DeleteCheck Then
       Begin
         Beep;
         ShowMessage('ãÍÕæá ÊæáíÏ ÔÏå Èå ãÕÑÝ ÑÓíÏå ÇÓÊ .ÞÇÈá ÍÐÝ äãí ÈÇÔÏ');
         Exit;
       End;
       UnDepot;
       UnDepot_In;
       Frodm.RejBinvoGood.First;
       For I:=1 To Frodm.RejBinvoGood.RecordCount Do
        Frodm.RejBinvoGood.Delete;
       Frodm.BinvoGood.First;
       For I:=1 To Frodm.BinvoGood.RecordCount Do
        Frodm.BinvoGood.Delete;
       Frodm.Tol.Delete;
       GoodFilter(Frodm.TolNo.AsInteger);//1381-08-29
       FNo.Text:=IntToStr(Frodm.TolNo.Value);
       New:=False;
       Max_No:=MaxNo;
     End;
end;

procedure TFTolid.BexitClick(Sender: TObject);
begin
     IF Check_Factor_State(Frodm.Tol,BSaveClick,FormDestroy) = idCancel Then Exit;
     Close;
end;

procedure TFTolid.Dat1Enter(Sender: TObject);
begin
     If Frodm.Tol.State = dsBrowse Then Dat1.ReadOnly :=True Else
     Begin
        Dat1.ReadOnly :=False;
        GetMaskText(Dat1);
     End;
end;

procedure TFTolid.Dat1Exit(Sender: TObject);
begin
     If (Frodm.Tol.State = dsBrowse) Then Exit;
     SetMaskText(Dat1);
     If(Not Date_Check(Dat1.Text))And(DateToInt(Dat1.Text)>0) Then Dat1.SetFocus Else
       Frodm.TolDat.Value :=DateToInt(Dat1.Text);
end;



end.
