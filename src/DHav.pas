unit DHav;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Db, DBTables, ComCtrls, ExtCtrls,
  Grids, DBGrids, DBCGrids, Menus, Buttons, PopupListBox, ppDB,
  ppParameter, ppStrtch, ppMemo, ppPrnabl, ppClass, ppCtrls, ppBands,
  ppCache, ppEndUsr, ppProd, ppReport, ppComm, ppRelatv, ppDBPipe, ppDBBDE,
  ppFormWrapper, ppRptExp;

type
  TFDHav = class(TForm)
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label10: TLabel;
    FPkol: TDBEdit;
    Goods: TDBGrid;
    FNam: TDBComboBox;
    FNo: TEdit;
    GList: TPopupListBox;
    FPINo: TDBEdit;
    Panel1: TPanel;
    Bdel: TBitBtn;
    Bprev: TBitBtn;
    Bsave: TBitBtn;
    Bnext: TBitBtn;
    Bexit: TBitBtn;
    Bprint: TBitBtn;
    Bedit: TBitBtn;
    EdQu: TQuery;
    Sb1: TStatusBar;
    Dat1: TMaskEdit;
    AList: TPopupListBox;
    CList: TPopupListBox;
    Label15: TLabel;
    Label16: TLabel;
    FCost: TDBComboBox;
    FCKod: TDBLookupComboBox;
    cbPrint: TCheckBox;
    Label2: TLabel;
    FDes: TDBEdit;
    ppHavRep: TppReport;
    ppParameterList1: TppParameterList;
    ppHeaderBand1: TppHeaderBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText7: TppDBText;
    ppDBText9: TppDBText;
    ppDBText11: TppDBText;
    ppDetailBand1: TppDetailBand;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText8: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppDBText10: TppDBText;
    ppLabel1: TppLabel;
    procedure GoodsColExit(Sender: TObject);
    procedure BprevClick(Sender: TObject);
    procedure BsaveClick(Sender: TObject);
    procedure BnextClick(Sender: TObject);
    procedure BnewClick(Sender: TObject);
    procedure BexitClick(Sender: TObject);
    procedure GoodsEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BprintClick(Sender: TObject);
    procedure FtelKeyPress(Sender: TObject; var Key: Char);
    procedure GoodsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GoodsKeyPress(Sender: TObject; var Key: Char);
    procedure GListKeyPress(Sender: TObject; var Key: Char);
    procedure FNoExit(Sender: TObject);
    procedure FNoKeyPress(Sender: TObject; var Key: Char);
    procedure GoodsEditButtonClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FPINoKeyPress(Sender: TObject; var Key: Char);
    procedure FormDestroy(Sender: TObject);
    procedure GoodsColEnter(Sender: TObject);
    procedure BdelClick(Sender: TObject);
    Procedure NexTab(Sender:TObject;Var Key :Char);
    procedure FormActivate(Sender: TObject);
    procedure GoodsMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure BeditClick(Sender: TObject);
    procedure GListDblClick(Sender: TObject);
    procedure FNamDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure FNamDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure GoodsDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure GoodsDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure GoodsDblClick(Sender: TObject);
    procedure Dat1Enter(Sender: TObject);
    procedure Dat1Exit(Sender: TObject);
    procedure FNamKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CListKeyPress(Sender: TObject; var Key: Char);
    procedure AListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure AListKeyPress(Sender: TObject; var Key: Char);
    procedure FPkolEnter(Sender: TObject);
    procedure FCKodKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GoodsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);

  private
    { Private declarations }
    BesKod,BehKod:Real;
    Radif:Integer;
    State:Boolean;
    Str:String;
    Price:Currency;
    MaxQuant:Real;
    Disc:Currency;
    MoFlag:Boolean;
    CustomerKod:Real;
    New:Boolean;
    MaxNo:Integer;
    MinNo:Integer;
    NewNo:Integer;
    BNo:Integer;
    NewBNo:Integer;
    BDat:Integer;
    FacNo:String;

    Function Decode(Var S:String):String;
    Function Encode:String;
    Procedure FillGList(GoodKod:Integer);
    Procedure DrawList(List:TPopupListBox;Index:Integer);
    Procedure ColumnEnable;
    Procedure Good_Del;
    Procedure UnDepot;
    Procedure Depot;
    Function Check_Fac:Boolean;
    Procedure Close_Bill;
    Procedure InvoUpdate(IOid:Integer);
    Procedure SetImage;
    Procedure CancelEdit;
    Procedure GoodFilter(FacNo:Integer);

    Procedure Sum_SingleCurr;

    Function HasOut(InvNo:Integer):Boolean;
    Function GetOutlay(InvNo,Gkod:Integer;Color:String):Real;
  public
    { Public declarations }
    Function IsServiceOnly:Boolean;
    Procedure FillFromPI(Sender:TObject;PINo:Integer);
  end;

var
  FDHav: TFDHav;

implementation

uses FrooshDM, FactorRep,Routins, ProVar, MainForm, AcSearch,
  GSearch, Converts, XPListBox, CRoutins, FactorRep2;

{$R *.DFM}
Const
Tip='ÍæÇáå ÝÑæÔ';
FTip=23;

Procedure TFDHav.NexTab(Sender:TObject;Var Key :Char);
begin
     If Key = #13 Then
     Begin
       Key:=#0;
       SelectNext(Sender As TWinControl,True,True);
     End;
end;
//Procedure For Find Customers Kod If There is

Function TFDHav.Decode(Var S:String):String;
var
Flag:Integer;
begin
     Flag:=Pos('-',S);
     If Flag >0 Then
     Begin
       Result:=Copy(S,1,Pos('-',S)-1);
       Delete(S,1,Length(Result+'-'));
     End Else
       Result:=S;
end;

Function TFDHav.Encode:String;
begin
     Result:=Frodm.DepotNam.Value +'-'+Frodm.DepotColor.Value +'-'+
     Frodm.DepotAnbNam.Value+'-'+FloatToStr(Frodm.DepotQuant.Value);
end;

Procedure TFDHav.FillGList(GoodKod:Integer);
Var
I,Width,Len:Integer;
begin
     GList.Items.Clear;
     Case sDP Of
     True:
     Begin
      If (GoodKod >0)and (sGene ) Then
          Frodm.Depot.Filter:='Gene= '+IntToStr(GoodKod)+' and Quant > 0'
      Else
          Frodm.Depot.Filter:='Kod= '+IntToStr(GoodKod)+' and Quant > 0';
      If GoodKod = 0 Then Frodm.Depot.Filter:=' Quant > 0';
      Frodm.Depot.Filtered :=True;
      Frodm.Depot.First;
      Width:=0;
      Glist.Canvas.Font :=FFont;
      For I:=1 To FRodm.Depot.RecordCount Do
      Begin
       GList.Items.Add(Encode);
       Len:= Glist.Canvas.TextWidth(Encode);
       If Len > Width Then Width:=Len;
       Frodm.Depot.Next;
      End;
      Frodm.Depot.Filtered :=False;
      Add_Comb(Frodm.Good,'Nam',' Fdp = 1 ',GList.Items);
      If GList.Items.Count >0 Then
      Begin
       Glist.Visible :=True;
       Bexit.Cancel :=False;
       DrawList(GList,2);
      End Else Begin
       Beep;
       ShowMessage('ãæÌæÏí äÏÇÑÏ');
      End;
     End;
     False:
     Begin
      If (GoodKod >0)and (sGene ) Then
       Fill_Cond(Frodm.Good,'Nam','Gene= '+IntToStr(GoodKod),GList.Items)
      Else
       Fill_Cond(Frodm.Good,'Nam','Kod= '+IntToStr(GoodKod),GList.Items);
      If (GoodKod=0) Then GList.Items.Assign(Kala);
      //Add_Comb(Frodm.Good,'Nam',' Fdp = 1 ',GList.Items);
      DrawList(GList,2);
     End;
     End;
end;

procedure TFDHav.DrawList(List: TPopupListBox; Index: Integer);
begin
     List.Visible :=True;
     Bexit.Cancel :=False;
     List.SetFocus;
     List.ItemIndex:=-1;
     List.ItemIndex:=List.Items.IndexOf(Goods.Columns[Index].Field.AsString);
     If List.ItemIndex = -1 Then  List.ItemIndex :=0;
end;

Procedure TFDHav.ColumnEnable;
begin
     If (Frodm.HavGKod.Value > 0) And (Frodm.HavGQuant.Value > 0) Then
       Goods.Columns[1].ReadOnly :=True
     Else
       Goods.Columns[1].ReadOnly :=False;
end;

Procedure TFDHav.Good_Del;
Var
I:Integer;
begin
     Frodm.HavG.First;
     For I:= 1 To Frodm.HavG.RecordCount Do
     Begin
      IF Frodm.HavGDelikod.Value Then Frodm.HavG.Delete;
      If Frodm.HavG.Eof Then Exit;
      Frodm.HavG.Next;
     End;
     Frodm.HavG.First;
end;

Procedure TFDHav.UnDepot;
Var
I:Integer;
Gs:Boolean;
begin
     Frodm.HavG.First;
     For I:= 1 To Frodm.HavG.RecordCount Do
     Begin
      Gs:=GoodState(Frodm.HavGKod.Value);
      IF Not Gs Then
      DepotChange(Frodm.HavGKod.Value,0,
                  Frodm.HavGColor.Value,Frodm.HavGAnbNam.Value,
                  Frodm.HavGQuant.Value,dpIn);
      Frodm.HavG.Next;
     End;
     Cardex_Del(Frodm.HavNo.AsString,Tip);
end;

Procedure TFDHav.Depot;
Var
I:Integer;
GS:Boolean;
SPtotal:Currency;
begin
     SPtotal:=0;
     Frodm.HavG.First;
     For I:=1 To Frodm.HavG.RecordCount Do
     Begin
      If DepotCheck(Frodm.HavGKod.Value,0,Frodm.HavGColor.Value,
       Frodm.HavGAnbNam.Value,Frodm.HavGQuant.Value)Then
      Begin
       Frodm.HavG.Edit;
       Frodm.HavGRadif.Value:=I;
       Frodm.HavGNo.Value:=Frodm.HavNo.Value;
       Frodm.HavGDat.Value:=Frodm.HavDat.Value;
       Frodm.HavGPtotal.Value:=GetOutPrice(Frodm.HavGkod.AsString,Frodm.HavGColor.AsString,
       Frodm.HavGAnbNam.AsString,0,0,Frodm.HavDat.AsInteger,Frodm.HavGQuant.Value);
       Frodm.HavGPfee.Value:=Frodm.HavGPtotal.Value/Frodm.HavGQuant.Value;
       Frodm.HavG.Post;
       SPtotal:=SPtotal+Frodm.HavGPtotal.Value;
       Auto_GCardex(Frodm.HavGNam.Value,Frodm.HavGColor.Value,
                    Frodm.HavGAnbNam.Value,Frodm.HavGKod.Value,
                    Frodm.HavGRadif.Value,Frodm.HavGQuant.Value,
                    dpOut,Frodm.HavNo.Value,Frodm.HavDat.Value,Tip,
                    FNam.Text,Frodm.HavGPfee.Value,0);
       DepotChange(Frodm.HavGKod.Value,0,Frodm.HavGColor.Value,
         Frodm.HavGAnbNam.Value,Frodm.HavGQuant.Value,dpOut);
      End Else Begin
       FRodm.HavG.Edit;
       Frodm.HavGDelikod.Value:=True;
       Frodm.HavG.Post;
      End;
      Frodm.HavG.Next;
     End;
     Good_Del;
     Frodm.Hav.Edit;
     Frodm.HavPkol.Value:=SPtotal;
     Frodm.Hav.Post;
end;

Function TFDHav.Check_Fac:Boolean;
Var
I:Integer;
Gs:Boolean;
begin
     Result:=True;
     If Frodm.Hav.State = dsBrowse Then Exit;
     If Not sDp Then Exit;
     Frodm.HavG.First;
     For I:=1 To Frodm.HavG.RecordCount Do
     Begin
       Gs:=GoodState(Frodm.HavGKod.Value);
       If Not Gs Then
       Begin
         Result:=DepotCheck(Frodm.HavGKod.Value,0,Frodm.HavGColor.Value,
         Frodm.HavGAnbNam.Value,Frodm.HavGQuant.Value);
         MoFlag:=Result;
         If Not Result Then
         Begin
           BSave.Enabled:=True;
           ShowMessage( 'ÚÜÜÜÏã ãæÌæÏí ßÇÝí');
           Exit;
         End;
       End;
       Frodm.HavG.Next;
     End;
     Frodm.HavG.First;
end;

Procedure TFDHav.Close_Bill;
begin
//-----------------     }
     Frodm.AutoBill.FindKey(['GF']);
     State:=Frodm.AutoBillStat.Value;
     BehKod:=Frodm.AutoBillBehKod.Value;
     BesKod:=Frodm.AutoBillBesKod.Value;
     Price:=Frodm.HavPkol.Value;
     Str:='˜ÓÑÇÞáÇã ÍæÇáå ÝÑæÔ ÔãÇÑå'+' '+FNo.Text+' '+FNam.Text;
     NewBNo:=AutoBill(State,BesKod,BehKod,Price,Str,FacNo,BNo,FTip,BDat,
      Frodm.HavCost.AsString,Frodm.HavCkod.AsInteger,0,0,DefaultCurr);
//------------------
     If NewBNo = BNo Then BillUpdate(BNo) Else
      If sBill  Then MakeBill('ÓäÏ ÍæÇáå ÇäÈÇÑ  '+'  '+FNam.Text+
      ' Øí ÍæÇáå ÇäÈÇÑ  ÔãÇÑå'+FNo.Text);
end;

Procedure TFDHav.InvoUpdate(IOid:Integer);
Var
Flt:String;
I:Integer;
begin
     Frodm.InvoGood.Open;
     Flt:=Frodm.InvoGood.Filter;
     Frodm.InvoGood.Filtered:=False;
     Frodm.HavG.First;
     For I:=1 to Frodm.HavG.RecordCount Do
     Begin
      If Frodm.InvoGood.Locate('Kod;No;Color',Vararrayof([Frodm.HavGKod.AsInteger,Frodm.HavGAnbkod.AsInteger,
      Frodm.HavGColor.AsVariant]),[loCaseInsensitive]) Then
      Begin
       Frodm.InvoGood.Edit;
       Frodm.InvoGoodQout.Value:=Frodm.InvoGoodQout.Value+IOid*Frodm.HavGQuant.Value;
       Frodm.InvoGood.Post;
      End;
      Frodm.HavG.Next;
     End;
     Frodm.InvoGood.Filtered:=True;
     Frodm.InvoGood.Filter:=Flt;
     Frodm.HavG.First;
end;

Procedure TFDHav.FillFromPI(Sender:TObject;PINo:Integer);
Var
I,J:Integer;
begin
     IF PINo = 0 Then Exit;
     IF Frodm.Hav.State = dsBrowse Then Exit;
     IF Frodm.HavG.RecordCount > 0 Then Exit;
     Frodm.Invo.Open;
     Frodm.Invo.Locate('No',PINo,[loCaseInsensitive]);
     Frodm.HavNam.Value :=Frodm.InvoNam.Value;
     Frodm.HavCost.Value:=Frodm.InvoCost.Value;
     Frodm.HavCkod.Value:=Frodm.InvoCkod.Value;
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Kod,Nam,Color,Radif,AnbNam,Quant-Qout,Prop ');
     Qu.SQL.Add('From InvoGood P Where  P.No = '+IntToStr(PINo));//Quant-Qout > 0 and
     Qu.Open;
     Qu.First;
     Goods.DataSource:=nil;
     J:=0;
     For I:=1 To Qu.RecordCount Do
     Begin
      If Qu.Fields[5].AsFloat > 0 Then
      Begin
       J:=J+1;
       Frodm.HavG.Append;
       Frodm.HavGNo.Value:=Frodm.HavNo.Value;
       Frodm.HavGDelikod.Value:=False;
       Frodm.HavGkod.Value :=Qu.Fields[0].AsInteger;
       Frodm.HavGNam.Value :=Qu.Fields[1].AsString;
       Frodm.HavGDat.Value :=FRodm.HavDat.Value;
       Frodm.HavGColor.Value :=Qu.Fields[2].AsString;
       Frodm.HavGRadif.Value :=J;//Qu.Fields[3].AsInteger;
       Frodm.HavGAnbNam.Value:=Qu.Fields[4].AsString;
       Frodm.HavGAnbKod.Value :=PINo;
       Frodm.HavGQuant.Value :=Qu.Fields[5].AsFloat;
       Frodm.HavGSerial.AsString:=Qu.Fields[6].AsString;
       Frodm.HavGReject.Value:=0;
       Frodm.HavG.Post;
      End;
      Qu.Next;
     End;
     Qu.Close;
     Goods.DataSource:=Frodm.HavGDs;
     Goods.SetFocus;
     Frodm.HavG.First;
     Frodm.HavG.Edit;
end;


Procedure TFDHav.SetImage;
begin
     Main.glKey.GetBitmap(0,BPrev.Glyph);
     Main.glKey.GetBitmap(1,Bnext.Glyph);
     Main.glKey.GetBitmap(2,BPrint.Glyph);
     Main.glKey.GetBitmap(3,Bedit.Glyph);
     Main.glKey.GetBitmap(4,Bsave.Glyph);
     Main.glKey.GetBitmap(5,Bdel.Glyph);
     Main.glKey.GetBitmap(7,BExit.Glyph);
end;

Procedure TFDHav.CancelEdit;
Var
I,J:Integer;
begin
     If (Not EdQu.Active)or(EdQu.RecordCount =0) Then Exit;
     GoodFilter(Frodm.HavNo.AsInteger);
     Frodm.HavG.First;
     For I:=1 To Frodm.HavG.RecordCount Do Frodm.HavG.Delete;
     EdQu.First;
     For I:=1 To EdQu.RecordCount Do
     Begin
       Frodm.HavG.Append;
       For J:=1 To 15 Do
         Frodm.HavG.Fields[J].Value:=EdQu.Fields[J].Value;
       Frodm.HavG.Post;
       EdQu.Next;
     End;
     EdQu.Close;
     Frodm.Hav.Cancel;
     Frodm.HavG.First;
     Depot;
end;

Procedure TFDHav.GoodFilter(FAcNo:Integer);
begin
     Frodm.HavG.Filtered:=False;
     Frodm.HavG.Filter:='No = '+IntToStr(FacNo);
     Frodm.HavG.Filtered:=True;
     Dat1.Text:=IntToDate(Frodm.HavDat.Value)
End;


Function TFDHav.IsServiceOnly:Boolean;
begin
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Kod from HavG where No=:n1 ');
     Qu.SQL.Add(' and Kod in (Select Kod from Goods where FDP=0)');
     Qu.Params[0].Value:=Frodm.HavNo.Value;
     Qu.Open;
     Result:=Qu.RecordCount =0;
     Qu.Close;
end;

procedure TFDHav.Sum_singleCurr;
var
I:Integer;
Sum,Nsum,OSum:Currency;
mSum:Currency;
begin
//--------------------------------
     Hmu:=CreateMutex(nil,False,PChar(Encrypt('4.>-;S. S4,-<)S<3:',130)));
     If GetLastError() <> ERROR_ALREADY_EXISTS Then Frodm.Destroy;
     CloseHandle(Hmu);
//--------------------------------
     If FroDM.Hav.State = dsBrowse Then Exit ;
     FroDM.HavG.First;
     Sum:=0;Nsum:=0;OSum:=0;mSum:=0;
     For I:=1 to FroDM.HavG.RecordCount Do
     Begin
      Sum:=Sum+FroDM.HavGPfee.Value * Frodm.HavGQuant.Value;
      Nsum:=Nsum+FroDM.HavGPtotal.Value;
      OSum:=OSum+Frodm.HavGPtotal.AsCurrency;
      mSum:=mSum+FroDM.HavGPtotal.Value*Frodm.HavGAnbkod.Value;
      FroDM.HavG.Next;
     End;
     FroDM.HavPkol.AsCurrency:=Sum;
     Frodm.HavPnet.AsCurrency:=Nsum;
//     Frodm.HavPcheq.Value:=OSum;
//     Frodm.HavPrem.Value:=mSum;
     Disc:=0;
     If sPerc Then
     Begin
      Disc:=Sum-Nsum;
      Frodm.HavPdis.AsCurrency:=Disc;
     End;
end;


Function TFDHav.HasOut(InvNo:Integer):Boolean;
begin
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Count(RefNo) From DOut Where RefNo=:R1');
     Qu.Params[0].Value:=InvNo;
     Qu.Open;
     Result:=Qu.Fields[0].AsInteger>0;
     Qu.Close;
end;

Function TFDHav.GetOutlay(InvNo,Gkod:Integer;Color:String):Real;
begin
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Sum(Quant) From DOutg D Where D.Kod=:R1 and D.Color=:R2 and D.No in ');
     Qu.SQL.Add('(Select No From DOut Where RefNo=:R3)');
     Qu.Params[0].Value:=GKod;
     Qu.Params[1].Value:=Color;
     Qu.Params[2].Value:=InvNo;
     Qu.Open;
     Result:=Qu.Fields[0].AsFloat;
     Qu.Close;
end;

//End Of Private decaleration

procedure TFDHav.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     ppHavRep.Template.FileName:=Rdir+'\Reports\HavRep.rtm';
     ppHavRep.Template.LoadFromFile;
     Frodm.Hav.open;
     Frodm.HavG.Open;
     EdQu.DataBaseName:=CurrDb;
     SetImage;
     SetGridWidth(Goods,'Nam',GWidth);
     FPKol.Visible :=Boss;
     Bdel.Enabled :=Boss;
     Goods.Columns[7].Visible :=Boss;
     Goods.Columns[8].Visible :=Boss;
     Goods.Columns[10].Visible :=Boss;
     Goods.Columns[3].Visible :=sModel;
     Goods.Columns[7].Width:=51;
     Goods.Columns[8].Width:=51;
     Goods.Columns[10].Width:=51;
     Goods.Columns[3].Width:=51;
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Min(I.No),Max(I.No) From DHav I');
     Qu.Open;
     MinNo:=Qu.Fields[0].AsInteger;
     MaxNo:=Qu.Fields[1].AsInteger;
     Qu.Close;
     Frodm.Hav.Refresh;
     Frodm.Hav.Last;
     NewNo:=MaxNo;
     FNo.Text :=IntToStr(Frodm.HavNo.Value);
     GoodFilter(Frodm.HavNo.AsInteger);//1381-08-29
     Radif:=1;
     MoFlag:=True;
     IF sFac Then
      If MaxNo = 0 Then Exit Else BnewClick(Sender);
end;

procedure TFDHav.FormActivate(Sender: TObject);
begin
     FNam.Items.Assign(AcList);
     GList.Items.Assign(Kala);
     Goods.Columns[10].PickList.Assign(CurrList);
     FCost.Items.Assign(CostList);
     Fill_Comb(Frodm.Color,'Color',CList.Items);
     Fill_Comb(Frodm.AnbDat,'Nam',AList.Items);
end;

procedure TFDHav.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key = VK_F3 Then BsaveClick(Sender);
     If Shift = [ssAlt] Then
      Case Key Of
       VK_Left:BprevClick(Sender);
       VK_RIGHT:BnextClick(Sender);
      End;
end;

procedure TFDHav.FormDestroy(Sender: TObject);
begin
     If Frodm.Hav.State = dsBrowse Then Exit;
     Case New Of
     True  :Begin
             CancelFactor(Frodm.Hav,Frodm.HavG);// CancelOnExit(Frodm.HavG);
             GoodFilter(Frodm.HavNo.AsInteger);//1381-08-29
             FNo.Text:=IntToStr(Frodm.HavNo.Value);
             New:=False;
            End;
     False : CancelEdit; //BSaveClick(Sender);
     End;
     BSave.Enabled:=False;
     BEdit.Enabled:=True;
end;

procedure TFDHav.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Case New Of
     True : IF Check_Factor_State(Frodm.Hav,BSaveClick,FormDestroy)=idCancel Then
      Action :=caNone
     Else
      Action:=caFree;
     False: If  Check_Fac Then Action:=caFree Else Action :=caNone;
     End;
     If Action = caFree Then
     Begin
      Frodm.Hav.Close;
      Frodm.HavG.Close;
     End;
end;

procedure TFDHav.BprevClick(Sender: TObject);
begin
     If Frodm.Hav.State In [dsEdit,dsInsert] Then
     Begin
       FNo.SetFocus;
       IF Check_Factor_State(Frodm.Hav,BSaveClick,FormDestroy) = idCancel Then Exit;
       New:=False;
       Exit;
     End;
     If Not MoFlag Then Exit;
     Frodm.Hav.Refresh;
     FroDM.Hav.Prior;
     FNo.Text:=IntToStr(Frodm.HavNo.Value);
     GoodFilter(Frodm.HavNo.AsInteger);//1381-08-29
     NewNo:=Frodm.HavNo.Value+1;
end;

procedure TFDHav.BeditClick(Sender: TObject);
begin
     BEdit.Enabled:=False;
     If Not(Frodm.Hav.State=dsBrowse) Then Exit;
     IF Frodm.HavBKod.Value Then
     Begin
       BEdit.Enabled:=True;
       ShowMessage('ÍæÇáå ÏÇÆãí ÇÓÊ.ÞÇÈá ÇÕáÇÍ äãí ÈÇÔÏ');
       Exit;
     End;
     FacNo:=IntToStr(Frodm.HavNo.Value);
     BDat:=Frodm.HavDat.Value;
     EdQu.SQL.Strings[1]:='WHERE I.No ='+FNo.Text;
     EdQu.Open;
     DelBitem(FacNo,BNo,FTip);
     UNDepot;
     InvoUpdate(-1);
     FNam.SetFocus;
     Frodm.Hav.Edit;
     New:=False;
     BSave.Enabled:=True;
end;

procedure TFDHav.BsaveClick(Sender: TObject);
begin
     If FroDM.Hav.State = dsBrowse Then Exit;
     BSave.Enabled:=False;
     FNo.SetFocus;
     If Frodm.HavG.RecordCount = 0 Then
     Begin
       Frodm.Hav.Delete;
       New:=False;
       BDat:=0;
       BNo:=0;
       FacNo:='';
       GoodFilter(Frodm.HavNo.AsInteger);//1381-08-29
       FNo.Text:=IntToStr(Frodm.HavNo.Value);
       BEdit.Enabled:=True;
       Exit;
     End;
     Sum_SingleCurr;
     //Disc:=0;
     //FroDM.HavPnet.Value :=Frodm.HavPkol.Value -Frodm.HavPdis.Value;
     If Not RequierdCheck(Frodm.Hav) Then
     Begin
       Bsave.Enabled:=True;
       Exit;
     End;
     Frodm.HavBKod.Value:=sPerm;
     If Check_Fac Then Frodm.Hav.Post Else Exit;
     Depot;
     InvoUpdate(1);
     Close_Bill;
     QuickCloseOpen([61,57,1,6,24,11,27]);
     Frodm.Hav.Locate('No',StrToInt(FNo.Text),[loCaseInsensitive]);
     Radif:=1;
     EdQu.Close;
     New:=False;
     BDat:=0;
     BNo:=0;
     FacNo:='';
     BEdit.Enabled:=True;
     If cbPrint.Checked Then BprintClick(Sender);
     If sFac Then BnewClick(Sender);
end;

procedure TFDHav.BdelClick(Sender: TObject);
Var
I:Integer;
begin
     If Not (Frodm.Hav.State = dsBrowse) Then Exit;
     If MessageDlg('ÝÇßÊæÑ ÍÐÝ ÔæÏ',mtWarning,mbYesNo,0) = mrYes Then
     begin
       If Frodm.HavBKod.Value = True Then
       Begin
         ShowMessage('ÝÇßÊæÑ ÏÇÆãí ÇÓÊ');
         Exit;
       End;
       BNo:=Frodm.HavBNo.Value;
       FacNo:=IntToStr(Frodm.HavNo.Value);
       BDat:=Frodm.HavDat.Value;
       DelBitem(FacNo,BNo,FTip);
       UNDepot;
       InvoUpdate(-1);
       Billupdate(BNo);
       Frodm.HavG.First;
       For I:=1 To Frodm.HavG.RecordCount Do Frodm.HavG.Delete;
       Frodm.Hav.Delete;
       GoodFilter(Frodm.HavNo.AsInteger);//1381-08-29
       FNo.Text:=IntToStr(Frodm.HavNo.Value);
       New:=False;
     End;
end;

procedure TFDHav.BnextClick(Sender: TObject);
begin
     If Frodm.Hav.State In [dsEdit,dsInsert] Then
     Begin
       FNo.SetFocus;
       IF Check_Factor_State(Frodm.Hav,BSaveClick,FormDestroy) = idCancel Then Exit;
       New:=False;
       Exit;
     End;
     If Not MoFlag Then Exit;
     Frodm.Hav.Refresh;
     FroDM.Hav.Next;
     FNo.Text:=IntToStr(Frodm.HavNo.Value);
     GoodFilter(Frodm.HavNo.AsInteger);//1381-08-29
     NewNo:=Frodm.HavNo.Value+1;
     If Frodm.Hav.Filtered = True Then Exit;
     If Frodm.Hav.Eof Then
     Begin
       FNo.Text:=IntToStr(NewNo);
       FNo.SetFocus;
     End;
end;


procedure TFDHav.BnewClick(Sender: TObject);
begin
     If Frodm.Hav.Filtered Then Exit;
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Max(I.No) From DHAV I ');
     Qu.Open;
     MaxNo:=Qu.Fields[0].AsInteger;
     Qu.Close;
     FroDM.Hav.Append;
     Frodm.HavNam.Value:= 'äÇã ÎÑíÏÇÑ';
     If sFac Then
      Frodm.HavNo.Value :=MaxNo+1
     Else
      Frodm.HavNo.Value :=StrToInt(FNo.Text);
     Frodm.HavDat.Value:=Fardate;
     Frodm.HavBkod.Value:=False;
     FNo.Text:=IntToStr(Frodm.HavNo.Value);
     Frodm.Hav.Post;
     Frodm.Hav.Edit;
     New:=True;
     FacNo:=FNo.Text;
     BNo:=0;
     BDat:=Frodm.HavDat.Value;
     GoodFilter(Frodm.HavNo.AsInteger);//1381-08-29
     Sb1.Panels[2].Text :='ÌÏíÏ';
     BSave.Enabled:=True;
     BEdit.Enabled:=False;
end;

procedure TFDHav.BexitClick(Sender: TObject);
begin
     FNo.SetFocus;
     IF Check_Factor_State(Frodm.Hav,BSaveClick,FormDestroy)=idCancel Then Exit;
     Close;
end;

procedure TFDHav.BprintClick(Sender: TObject);
Const
Cap='æÑæÏ ÇØáÇÚÇÊ';
cap1='ÊÚÏÇÏ äÓÎå Çí';
begin
{     CreatingForm(TTahvilRep,'TahvilRep',TahvilRep);
     Set_Sys_Enviroment;
     TahvilRep.ReportTitle :='ÈÑ ÇäÈÇÑ ÝÇßÊæÑ'+FNo.Text;
     TahvilRep.Dat.Caption :=IntToDate(FarDate);
     TahvilRep.qrTit.Caption :=InvoLbl;
     TahvilRep.QrTit2.Caption:=BarNamLbl;
     TahvilRep.QInv.DatabaseName:=CurrDb;
     TahvilRep.QInvG.DatabaseName:=CurrDb;
     TahvilRep.QInv.Close;
     TahvilRep.QInvG.Close;
     TahvilRep.QInv.Params[0].Value:=Frodm.HavNo.Value;
     TahvilRep.QInvG.Params[0].Value:=Frodm.HavNo.Value;
     TahvilRep.QInv.Open;
     TahvilRep.QInvG.Open;
     If Not bmpP1.Empty Then TahvilRep.Logo.Picture.Bitmap:=bmpP1;
     TahvilRep.User.Caption :=CUser.Name;
     TahvilRep.PrinterSettings.Copies:=StrToInt(InputBox(Cap,Cap1,'1'));
     If cbPrint.Checked Then TahvilRep.Print Else TahvilRep.Preview;
     TahvilRep.Destroy; }
     
{     HQu.Close;
     HQu.Params[0].Value:=Frodm.HavCkod.Value;
     HQu.Open;}
     ppLabel1.Caption:=FCkod.Text;
     If cbPrint.Checked Then
      ppHavRep.DeviceType:='Printer'
     Else
      ppHavRep.DeviceType:='Screen';
     ppHavRep.PrintReport;

end;

procedure TFDHav.FNoKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then FNoExit(Sender);
     NexTab(Sender,Key);
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;
end;

procedure TFDHav.FPINoKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then FillFromPI(Sender,StrToInt(FPINo.Text));
     NexTab(Sender,Key);
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;
end;

procedure TFDHav.FtelKeyPress(Sender: TObject; var Key: Char);
begin
     NexTab(Sender,Key);
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
        #9,#27,#83,#46,'-']) Then Key:=#0;
end;

procedure TFDHav.GoodsColEnter(Sender: TObject);
begin
     If Frodm.Hav.State = dsBrowse Then Exit Else Frodm.HavG.Edit;
     Case Goods.SelectedField.Index Of
      1:IF Frodm.HavGRadif.Value > 0 Then Radif:=Frodm.HavGRadif.Value;
      3:If Goods.columns[1].ReadOnly Then FillGList(Frodm.HavGKod.Value);
      4:If SModel Then
        Begin
         If Goods.Columns[1].ReadOnly Then Exit;
         Fill_Cond(Frodm.Depot,'Color','Kod='+Frodm.HavGKod.AsString,CList.Items);
         DrawList(CList,3);
         CList.ItemIndex:=CList.Items.IndexOf(Frodm.HavGColor.Value);
         If CList.ItemIndex =-1 Then CList.ItemIndex:=0;
        End;
     5: Begin
         //IF (Frodm.HavGColor.Value = '')and(sModel)  Then Goods.SelectedField:= Frodm.HavGColor;
         IF Frodm.HavGNam.Value = '' Then Goods.SelectedField:= Frodm.HavGNam;
         If Not Goods.Columns[1].ReadOnly Then DrawList(AList,4);
        End;
     7:IF Frodm.HavGReject.IsNull Then Frodm.HavGReject.Value:=0;
    12:If HasOut(Frodm.HavNo.Value) Then
         Frodm.HavGReject.Value:=GetOutlay(Frodm.HavNo.Value,Frodm.HavGKod.Value,Frodm.HavGColor.AsString);
     End;
end;

// Calculating The Depot and Acount Bill For Sold Goods
procedure TFDHav.GoodsColExit(Sender: TObject);
begin
     If Frodm.Hav.State = dsBrowse Then Exit Else Frodm.HavG.Edit;
     Case Goods.SelectedField.Index Of
     1:Begin
        //ColumnEnable;
        IF Frodm.HavGRadif.Value = 0 Then Frodm.HavGRadif.Value :=Radif;
        Frodm.HavGDat.Value :=Frodm.HavDat.Value;
        Frodm.HavGNo.Value:=Frodm.HavNo.Value;
        Frodm.HavGDelikod.Value:=False;
        Frodm.HavGAnbkod.Value:=Frodm.HavRefNo.Value;
        Frodm.HavG.Post;
       End;
     2:Begin
        If Goods.columns[1].ReadOnly Then Exit;
        If {(sGene = 0) and }GoodState(Frodm.HavGKod.Value) Then
        Begin
          uGood.Code:=Frodm.HavGKod.Value;
          Frodm.HavGNam.Value:=uGood.Name;// GoodNam();
          //Frodm.HavGPfee.Value:=GoodSoldPrice(Frodm.HavGKod.Value);
          Exit;
        End;
        FillGList(Frodm.HavGKod.Value);
       End;
     6:If Goods.SelectedField.Text = Null Then Goods.SelectedField.Value :=0;
     10:Frodm.HavGPtotal.Value :=Frodm.HavGPfee.Value *Frodm.HavGQuant.Value;
     End;
     If Goods.Columns[0].Field.Value > 0 Then Radif:=Frodm.HavGRadif.Value ;
end;

procedure TFDHav.GoodsEditButtonClick(Sender: TObject);
begin
     If Frodm.Hav.State In [dsInsert,dsEdit] Then
     Begin
       Frodm.HavG.Delete;
       Frodm.HavG.Edit;
     End;
end;

procedure TFDHav.GoodsEnter(Sender: TObject);
begin
     If (FroDM.Hav.State = dsBrowse) Or (Frodm.HavBKod.Value = True) Then
       Goods.ReadOnly := True Else Goods.ReadOnly :=False;
     Goods.selectedField:=Goods.Columns[0].Field;
end;

procedure TFDHav.GoodsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Not(Frodm.Hav.State = dsBrowse) Then Frodm.HavG.Edit;
     If Shift = [ssCtrl]   Then  FPkol.SetFocus;
     If Shift = [ssCtrl]+[ssShift]  Then  FCKod.SetFocus;
     IF ((Key = VK_F4) and Not(Frodm.Hav.State = dsBrowse)and
        Not(Goods.Columns[Goods.SelectedIndex-1].ReadOnly ))  Then
      Case Goods.SelectedField.Index Of
      3: DrawList(GList,2);
      4: DrawList(Clist,3);
      5: DrawList(AList,4);
      End;
     If (Goods.SelectedIndex In [0,1,2,3])and(Key=32)and Not(Frodm.Hav.State = dsBrowse) Then
      If FindGoods(Frodm.HavG,Frodm.HavNo.AsInteger,Frodm.HavDat.AsInteger,Frodm.HavNam.AsString) Then
       Goods.SelectedField :=Frodm.HavGPfee;
     If (Goods.SelectedIndex In [8,10]) and Not(Frodm.Hav.State = dsBrowse) Then
     Case Key Of
       VK_MULTIPLY :Begin
               Frodm.HavG.Post;
               Frodm.HavG.Edit;
               Goods.SelectedField.Value := Goods.SelectedField.Value*1000;
               End;
       VK_DIVIDE   : Begin
               Frodm.HavG.Post;
               Frodm.HavG.Edit;
               Goods.SelectedField.Value := Goods.SelectedField.Value* 100;
               End;
     End;
end;

procedure TFDHav.GoodsKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
       If (Goods.SelectedField.Index = 11) and Not(Frodm.Hav.State =dsBrowse) Then
         If (Frodm.HavGPfee.Value = 0 ) Then
          Frodm.HavGPfee.Value:=Frodm.HavGPTotal.Value /Frodm.HavGQuant.Value;
       Key:=#0;
       GridMove(Goods,Frodm.Hav,Radif);
     End;
     If Not(Frodm.Hav.State = dsBrowse) Then Frodm.HavG.Edit;
end;

procedure TFDHav.GoodsMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
  Var
  coord:TGridCoord;
  rec:Integer;
begin
     rec:=Goods.DataSource.DataSet.RecNo;
     Coord:=Goods.MouseCoord(x,y);
     If Coord.X > 1 Then
     Begin
       Goods.SelectedIndex :=0;
       Goods.DataSource.DataSet.RecNo:=rec;//Coord.y;
     End;
end;

procedure TFDHav.GListKeyPress(Sender: TObject; var Key: Char);
Var
S:String;
begin
     If Key=#13 Then
     Begin
     Key:=#0;
     s:=GList.Items.Strings[GList.ItemIndex];
     Case sDP Of
     True:Begin
      Frodm.HavG.Edit;
      Frodm.HavGNam.Value :=Decode(s);
      Frodm.HavGColor.Value :=Decode(s);
      Frodm.HavGAnbNam.Value :=Decode(s);
      Frodm.HavGQuant.Value :=StrToFloat(Decode(s));
      MaxQuant:=Frodm.HavGQuant.Value;
      Frodm.HavGkod.Value :=GoodKod(Frodm.HavGNam.Value);
      Frodm.HavGPfee.Value :=GoodSoldPrice(Frodm.HavGkod.Value);
      Frodm.HavGNo.Value:=Frodm.HavNo.Value;
      Frodm.HavG.Post;
      Goods.SetFocus;
      Goods.SelectedField :=Goods.Columns[5].Field;
      GList.Visible :=False;
      Bexit.Cancel :=True;
     End;
     False:Begin
      Frodm.HavG.Edit;
      uGood.Name:=S;
      Frodm.HavGNam.Value :=s;
      Frodm.HavGkod.Value :=uGood.Code;// GoodKod(Frodm.HavGNam.Value);
      Frodm.HavGPfee.Value :=uGood.SoldPrice;// GoodSoldPrice(Frodm.HavGkod.Value);
      Frodm.HavGNo.Value:=Frodm.HavNo.Value;
      If uGood.IsService Then Frodm.HavGQuant.Value:=1;
      Frodm.HavG.Post;
      Goods.SetFocus;
      Case uGood.IsService Of
       False:If sAkod Then
              Goods.SelectedField :=Goods.Columns[4].Field
             Else
              Goods.SelectedField :=Goods.Columns[7].Field;
       True:Goods.SelectedField :=Goods.Columns[9].Field;
      End;
      GList.Visible :=False;
      Bexit.Cancel :=True;
     End;
     End;
     End;
end;

procedure TFDHav.FNoExit(Sender: TObject);
begin
     If Frodm.Hav.State In [dsEdit,dsInsert] Then
     Begin
       Fno.Text:=IntToStr(Frodm.HavNo.Value);
       Exit;
     End;
     NewNo:=StrToInt(FNo.Text);
     FacNo:=FNo.Text;
//     If  Not(Frodm.Hav.FindKey([NewNo])) Then BnewClick(Sender) Else
     If Not(Frodm.Hav.Locate('No',NewNo,[loCaseInsensitive])) Then BNewClick(Sender) Else
     Begin
      GoodFilter(Frodm.HavNo.AsInteger);//1381-08-29
      FacNo:=FNo.Text;
      BNo:=Frodm.HavBno.Value;
      BDat:=Frodm.HavDat.Value;
     End;
end;

procedure TFDHav.GListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key = 27 Then
     Begin
       Goods.SetFocus;
       Frodm.HavG.Delete;
       Frodm.HavG.Append;
       Goods.SelectedField :=Frodm.HavGRadif;
       GList.Visible :=False;
       Bexit.Cancel :=True;
     End;
end;

procedure TFDHav.GListDblClick(Sender: TObject);
Var
Key:Char;
begin
     Key:=#13;
     GListKeyPress(Sender,Key);
end;

procedure TFDHav.FNamDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
     Accept:=(Source Is TXPListBox) And ((Source As TXPListBox).Name = 'lbName')
end;

procedure TFDHav.FNamDragDrop(Sender, Source: TObject; X, Y: Integer);
Var
List:TXPListBox;
begin
     If Not(Frodm.Hav.State = dsBrowse)and (Source Is TXPListBox) Then
     Begin
       List:=(Source As TXPListBox);
       Frodm.HavNam.Value:=List.Items.Strings[List.ItemIndex];
       FAcSearch.Close;
       FNam.SetFocus;
     End;
end;

procedure TFDHav.GoodsDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
     Accept:=(Source Is TXPListBox) And ((Source As TXPListBox).Name = 'lbGName');
     Accept:=Accept and (SGene = False);
end;

procedure TFDHav.GoodsDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
     If Frodm.HavGReject.Value < Frodm.HavGQuant.Value Then
      Goods.Canvas.Font.Color:=clBlue;
     If Frodm.HavGReject.Value > Frodm.HavGQuant.Value Then
      Goods.Canvas.Brush.Color:=clRED;
     If  Frodm.HavGReject.Value = 0 Then Goods.Canvas.Font.Color:=clRed;
     Goods.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TFDHav.GoodsDragDrop(Sender, Source: TObject; X, Y: Integer);
Var
List:TXPListBox;
Key:Char;
begin
     If Not(Frodm.Hav.State = dsBrowse)and (Source Is TXPListBox) Then
     Begin
       List:=(Source As TXPListBox);
       If Frodm.HavGNam.Value = '' Then Frodm.HavG.Edit Else
        Frodm.HavG.Append;
       Frodm.HavGRadif.Value:=Frodm.HavG.RecordCount+1;
       Frodm.HavGKod.Value:=StrToInt(List.Hint);
       FGSearch.Close;
       FillGList(Frodm.HavGKod.Value);
       If GList.Items.Count = 1 Then
       Begin
        GList.ItemIndex :=0;
        Key:=#13;
        GListKeyPress(Sender,Key);
       End;
     End;
end;

procedure TFDHav.GoodsDblClick(Sender: TObject);
begin
     If Not(Frodm.Hav.State = dsBrowse) Then
      CreatingForm(TFGSearch,'FGSearch',FGSearch);
end;

procedure TFDHav.Dat1Enter(Sender: TObject);
begin
     If Frodm.Hav.State = dsBrowse Then Dat1.ReadOnly :=True Else
     Begin
        Dat1.ReadOnly :=False;
        GetMaskText(Dat1);
     End;
end;

procedure TFDHav.Dat1Exit(Sender: TObject);
begin
     If (Frodm.Hav.State = dsBrowse) Then Exit;
     SetMaskText(Dat1);
     If(Not Date_Check(Dat1.Text))And(DateToInt(Dat1.Text)>0) Then Dat1.SetFocus Else
       Frodm.HavDat.Value :=DateToInt(Dat1.Text);
end;

procedure TFDHav.FNamKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetAccountDbCombo(Sender,Key,'',0);
end;


procedure TFDHav.CListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If (Key = 27) Then
     Begin
       Goods.SetFocus;
       Goods.SelectedField :=Frodm.HavGColor;
       CList.Visible :=False;
       Bexit.Cancel :=True;
     End;
end;

procedure TFDHav.CListKeyPress(Sender: TObject; var Key: Char);
begin
     If Key =#13 Then
     Begin
       Frodm.HavG.Edit;
       Frodm.HavGColor.Value:=CList.Items.Strings[CList.ItemIndex];
       Goods.SetFocus;
       Goods.SelectedField :=Frodm.HavGColor;
       CList.Visible :=False;
       Bexit.Cancel :=True;
     End;
end;

procedure TFDHav.AListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If (Key = 27) Then
     Begin
       Goods.SetFocus;
       Goods.SelectedField :=Frodm.HavGAnbNam;
       AList.Visible :=False;
       Bexit.Cancel :=True;
     End;
end;

procedure TFDHav.AListKeyPress(Sender: TObject; var Key: Char);
begin
     If Key =#13 Then
     Begin
       Frodm.HavG.Edit;
       Frodm.HavGAnbNam.Value:=AList.Items.Strings[AList.ItemIndex];
       Goods.SetFocus;
       Goods.SelectedField :=Frodm.HavGQuant;
       AList.Visible :=False;
       Bexit.Cancel :=True;
     End;
end;

procedure TFDHav.FPkolEnter(Sender: TObject);
begin
      Sum_SingleCurr;
end;


procedure TFDHav.FCKodKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetCentLookup(Sender,Key);
end;

end.
