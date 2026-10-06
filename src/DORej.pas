unit DORej;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Db, DBTables, ComCtrls, ExtCtrls,
  Grids, DBGrids, DBCGrids, Menus, Buttons, PopupListBox, ppDB,
  ppParameter, ppStrtch, ppMemo, ppPrnabl, ppClass, ppCtrls, ppBands,
  ppCache, ppEndUsr, ppProd, ppReport, ppComm, ppRelatv, ppDBPipe, ppDBBDE,
  ppFormWrapper, ppRptExp;

type
  TFDORej = class(TForm)
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

  public
    { Public declarations }
    Function IsServiceOnly:Boolean;
    Procedure FillFromPI(Sender:TObject;PINo:Integer);
  end;

var
  FDORej: TFDORej;

implementation

uses FrooshDM, FactorRep,Routins, ProVar, MainForm, AcSearch,
  GSearch, Converts, XPListBox, CRoutins, FactorRep2;

{$R *.DFM}
Const
Tip='ÈÑÔÊ ÇÒ ÇäÈÇÑ';
FTip=26;

Procedure TFDORej.NexTab(Sender:TObject;Var Key :Char);
begin
     If Key = #13 Then
     Begin
       Key:=#0;
       SelectNext(Sender As TWinControl,True,True);
     End;
end;
//Procedure For Find Customers Kod If There is

Function TFDORej.Decode(Var S:String):String;
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

Function TFDORej.Encode:String;
begin
     Result:=Frodm.DepotNam.Value +'-'+Frodm.DepotColor.Value +'-'+
     Frodm.DepotAnbNam.Value+'-'+FloatToStr(Frodm.DepotQuant.Value);
end;

Procedure TFDORej.FillGList(GoodKod:Integer);
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

procedure TFDORej.DrawList(List: TPopupListBox; Index: Integer);
begin
     List.Visible :=True;
     Bexit.Cancel :=False;
     List.SetFocus;
     List.ItemIndex:=-1;
     List.ItemIndex:=List.Items.IndexOf(Goods.Columns[Index].Field.AsString);
     If List.ItemIndex = -1 Then  List.ItemIndex :=0;
end;

Procedure TFDORej.Good_Del;
Var
I:Integer;
begin
     Frodm.ORejG.First;
     For I:= 1 To Frodm.ORejG.RecordCount Do
     Begin
      IF Frodm.ORejGDelikod.Value Then Frodm.ORejG.Delete;
      If Frodm.ORejG.Eof Then Exit;
      Frodm.ORejG.Next;
     End;
     Frodm.ORejG.First;
end;

Procedure TFDORej.UnDepot;
Var
I:Integer;
Gs:Boolean;
begin
     Frodm.ORejG.First;
     For I:= 1 To Frodm.ORejG.RecordCount Do
     Begin
      Gs:=GoodState(Frodm.ORejGKod.Value);
      IF Not Gs Then
      DepotChange(Frodm.ORejGKod.Value,0,
                  Frodm.ORejGColor.Value,Frodm.ORejGAnbNam.Value,
                  Frodm.ORejGQuant.Value,dpIn);
      Frodm.ORejG.Next;
     End;
     Cardex_Del(Frodm.ORejNo.AsString,Tip);
end;

Procedure TFDORej.Depot;
Var
I:Integer;
GS:Boolean;
SPtotal:Currency;
begin
     SPtotal:=0;
     Frodm.ORejG.First;
     For I:=1 To Frodm.ORejG.RecordCount Do
     Begin
      If DepotCheck(Frodm.ORejGKod.Value,0,Frodm.ORejGColor.Value,
       Frodm.ORejGAnbNam.Value,Frodm.ORejGQuant.Value)Then
      Begin
       Frodm.ORejG.Edit;
       Frodm.ORejGRadif.Value:=I;
       Frodm.ORejGNo.Value:=Frodm.ORejNo.Value;
       Frodm.ORejGDat.Value:=Frodm.ORejDat.Value;
       Frodm.ORejGPtotal.Value:=GetOutPrice(Frodm.ORejGkod.AsString,Frodm.ORejGColor.AsString,
       Frodm.ORejGAnbNam.AsString,0,0,Frodm.ORejDat.AsInteger,Frodm.ORejGQuant.Value);
       Frodm.ORejGPfee.Value:=Frodm.ORejGPtotal.Value/Frodm.ORejGQuant.Value;
       Frodm.ORejG.Post;
       SPtotal:=SPtotal+Frodm.ORejGPtotal.Value;
       Auto_GCardex(Frodm.ORejGNam.Value,Frodm.ORejGColor.Value,
                    Frodm.ORejGAnbNam.Value,Frodm.ORejGKod.Value,
                    Frodm.ORejGRadif.Value,Frodm.ORejGQuant.Value,
                    dpOut,Frodm.ORejNo.Value,Frodm.ORejDat.Value,Tip,
                    FNam.Text,Frodm.ORejGPfee.Value,0);
       DepotChange(Frodm.ORejGKod.Value,0,Frodm.ORejGColor.Value,
         Frodm.ORejGAnbNam.Value,Frodm.ORejGQuant.Value,dpOut);
      End Else Begin
       FRodm.ORejG.Edit;
       Frodm.ORejGDelikod.Value:=True;
       Frodm.ORejG.Post;
      End;
      Frodm.ORejG.Next;
     End;
     Good_Del;
     Frodm.ORej.Edit;
     Frodm.ORejPkol.Value:=SPtotal;
     Frodm.ORej.Post;
end;

Function TFDORej.Check_Fac:Boolean;
Var
I:Integer;
Gs:Boolean;
begin
     Result:=True;
     If Frodm.ORej.State = dsBrowse Then Exit;
     If Not sDp Then Exit;
     Frodm.ORejG.First;
     For I:=1 To Frodm.ORejG.RecordCount Do
     Begin
       Gs:=GoodState(Frodm.ORejGKod.Value);
       If Not Gs Then
       Begin
         Result:=DepotCheck(Frodm.ORejGKod.Value,0,Frodm.ORejGColor.Value,
         Frodm.ORejGAnbNam.Value,Frodm.ORejGQuant.Value);
         MoFlag:=Result;
         If Not Result Then
         Begin
           BSave.Enabled:=True;
           ShowMessage( 'ÚÜÜÜÏã ãæÌæÏí ßÇÝí');
           Exit;
         End;
       End;
       Frodm.ORejG.Next;
     End;
     Frodm.ORejG.First;
end;

Procedure TFDORej.Close_Bill;
begin
//-----------------     }
     Frodm.AutoBill.FindKey(['GF']);
     State:=Frodm.AutoBillStat.Value;
     BehKod:=Frodm.AutoBillBehKod.Value;
     BesKod:=Frodm.AutoBillBesKod.Value;
     Price:=Frodm.ORejPkol.Value;
     Str:='ÌãÚ ÇÞáÇã ÈÑÔÊ ÇÒ ÇäÈÇÑÔãÇÑå'+' '+FNo.Text+' '+FNam.Text;
     NewBNo:=AutoBill(State,BesKod,BehKod,Price,Str,FacNo,BNo,FTip,BDat,
      Frodm.ORejCost.AsString,Frodm.ORejCkod.AsInteger,0,0,DefaultCurr);
//------------------
     If NewBNo = BNo Then BillUpdate(BNo) Else
      If sBill  Then MakeBill('ÓäÏ ÈÑÔÊ ÇÒ ÇäÈÇÑ  '+'  '+FNam.Text+
      ' Øí ÈÑÔÊ ÇÒ ÇäÈÇÑ ÔãÇÑå'+FNo.Text);
end;

Procedure TFDORej.InvoUpdate(IOid:Integer);
Var
Flt:String;
I:Integer;
begin
     Frodm.InvoGood.Open;
     Flt:=Frodm.InvoGood.Filter;
     Frodm.InvoGood.Filtered:=False;
     Frodm.ORejG.First;
     For I:=1 to Frodm.ORejG.RecordCount Do
     Begin
      If Frodm.InvoGood.Locate('Kod;No;Color',Vararrayof([Frodm.ORejGKod.AsInteger,Frodm.ORejGAnbkod.AsInteger,
      Frodm.ORejGColor.AsVariant]),[loCaseInsensitive]) Then
      Begin
       Frodm.InvoGood.Edit;
       Frodm.InvoGoodQout.Value:=Frodm.InvoGoodQout.Value+IOid*Frodm.ORejGQuant.Value;
       Frodm.InvoGood.Post;
      End;
      Frodm.ORejG.Next;
     End;
     Frodm.InvoGood.Filtered:=True;
     Frodm.InvoGood.Filter:=Flt;
     Frodm.ORejG.First;
end;

Procedure TFDORej.FillFromPI(Sender:TObject;PINo:Integer);
Var
I,J:Integer;
begin
     IF PINo = 0 Then Exit;
     IF Frodm.ORej.State = dsBrowse Then Exit;
     IF Frodm.ORejG.RecordCount > 0 Then Exit;
     Frodm.Res.Open;
     Frodm.Res.Locate('No',PINo,[loCaseInsensitive]);
     Frodm.ORejNam.Value :=Frodm.ResNam.Value;
     Frodm.ORejCost.Value:=Frodm.ResCost.Value;
     Frodm.ORejCkod.Value:=Frodm.ResCkod.Value;
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Kod,Nam,Color,Radif,AnbNam,Quant,Serial ');
     Qu.SQL.Add('From DResG P Where  P.No = '+IntToStr(PINo));//Quant-Qout > 0 and
     Qu.Open;
     Qu.First;
     Goods.DataSource:=nil;
     J:=0;
     For I:=1 To Qu.RecordCount Do
     Begin
      If Qu.Fields[5].AsFloat > 0 Then
      Begin
       J:=J+1;
       Frodm.ORejG.Append;
       Frodm.ORejGNo.Value:=Frodm.ORejNo.Value;
       Frodm.ORejGDelikod.Value:=False;
       Frodm.ORejGkod.Value :=Qu.Fields[0].AsInteger;
       Frodm.ORejGNam.Value :=Qu.Fields[1].AsString;
       Frodm.ORejGDat.Value :=FRodm.ORejDat.Value;
       Frodm.ORejGColor.Value :=Qu.Fields[2].AsString;
       Frodm.ORejGRadif.Value :=J;//Qu.Fields[3].AsInteger;
       Frodm.ORejGAnbNam.Value:=Qu.Fields[4].AsString;
       Frodm.ORejGAnbKod.Value :=PINo;
       Frodm.ORejGQuant.Value :=Qu.Fields[5].AsFloat;
       Frodm.ORejGSerial.AsString:=Qu.Fields[6].AsString;
       Frodm.ORejGReject.Value:=0;
       Frodm.ORejG.Post;
      End;
      Qu.Next;
     End;
     Qu.Close;
     Goods.DataSource:=Frodm.ORejGDs;
     Goods.SetFocus;
     Frodm.ORejG.First;
     Frodm.ORejG.Edit;
end;


Procedure TFDORej.SetImage;
begin
     Main.glKey.GetBitmap(0,BPrev.Glyph);
     Main.glKey.GetBitmap(1,Bnext.Glyph);
     Main.glKey.GetBitmap(2,BPrint.Glyph);
     Main.glKey.GetBitmap(3,Bedit.Glyph);
     Main.glKey.GetBitmap(4,Bsave.Glyph);
     Main.glKey.GetBitmap(5,Bdel.Glyph);
     Main.glKey.GetBitmap(7,BExit.Glyph);
end;

Procedure TFDORej.CancelEdit;
Var
I,J:Integer;
begin
     If (Not EdQu.Active)or(EdQu.RecordCount =0) Then Exit;
     GoodFilter(Frodm.ORejNo.AsInteger);
     Frodm.ORejG.First;
     For I:=1 To Frodm.ORejG.RecordCount Do Frodm.ORejG.Delete;
     EdQu.First;
     For I:=1 To EdQu.RecordCount Do
     Begin
       Frodm.ORejG.Append;
       For J:=1 To 15 Do
         Frodm.ORejG.Fields[J].Value:=EdQu.Fields[J].Value;
       Frodm.ORejG.Post;
       EdQu.Next;
     End;
     EdQu.Close;
     Frodm.ORej.Cancel;
     Frodm.ORejG.First;
     Depot;
end;

Procedure TFDORej.GoodFilter(FAcNo:Integer);
begin
     Frodm.ORejG.Filtered:=False;
     Frodm.ORejG.Filter:='No = '+IntToStr(FacNo);
     Frodm.ORejG.Filtered:=True;
     Dat1.Text:=IntToDate(Frodm.ORejDat.Value)
End;


Function TFDORej.IsServiceOnly:Boolean;
begin
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Kod from DORejG where No=:n1 ');
     Qu.SQL.Add(' and Kod in (Select Kod from Goods where FDP=0)');
     Qu.Params[0].Value:=Frodm.ORejNo.Value;
     Qu.Open;
     Result:=Qu.RecordCount =0;
     Qu.Close;
end;

procedure TFDORej.Sum_singleCurr;
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
     If FroDM.ORej.State = dsBrowse Then Exit ;
     FroDM.ORejG.First;
     Sum:=0;Nsum:=0;OSum:=0;mSum:=0;
     For I:=1 to FroDM.ORejG.RecordCount Do
     Begin
      Sum:=Sum+FroDM.ORejGPfee.Value * Frodm.ORejGQuant.Value;
      Nsum:=Nsum+FroDM.ORejGPtotal.Value;
      OSum:=OSum+Frodm.ORejGPtotal.AsCurrency;
      mSum:=mSum+FroDM.ORejGPtotal.Value*Frodm.ORejGAnbkod.Value;
      FroDM.ORejG.Next;
     End;
     FroDM.ORejPkol.AsCurrency:=Sum;
     Frodm.ORejPnet.AsCurrency:=Nsum;
//     Frodm.ORejPcheq.Value:=OSum;
//     Frodm.ORejPrem.Value:=mSum;
     Disc:=0;
     If sPerc Then
     Begin
      Disc:=Sum-Nsum;
      Frodm.ORejPdis.AsCurrency:=Disc;
     End;
end;



//End Of Private decaleration

procedure TFDORej.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     Frodm.ORej.open;
     Frodm.ORejG.Open;
     EdQu.DataBaseName:=CurrDb;
     SetImage;
     SetGridWidth(Goods,'Nam',GWidth);
     FPKol.Visible :=Boss;
     Bdel.Enabled :=Boss;
     Goods.Columns[7].Visible :=Boss;
     Goods.Columns[8].Visible :=Boss;
     Goods.Columns[3].Visible :=sModel;
     Goods.Columns[7].Width:=51;
     Goods.Columns[8].Width:=51;
     Goods.Columns[3].Width:=51;
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Min(I.No),Max(I.No) From DORej I');
     Qu.Open;
     MinNo:=Qu.Fields[0].AsInteger;
     MaxNo:=Qu.Fields[1].AsInteger;
     Qu.Close;
     Frodm.ORej.Refresh;
     Frodm.ORej.Last;
     NewNo:=MaxNo;
     FNo.Text :=IntToStr(Frodm.ORejNo.Value);
     GoodFilter(Frodm.ORejNo.AsInteger);//1381-08-29
     Radif:=1;
     MoFlag:=True;
     IF sFac Then
      If MaxNo = 0 Then Exit Else BnewClick(Sender);
end;

procedure TFDORej.FormActivate(Sender: TObject);
begin
     FNam.Items.Assign(AcList);
     GList.Items.Assign(Kala);
     Goods.Columns[10].PickList.Assign(CurrList);
     FCost.Items.Assign(CostList);
     Fill_Comb(Frodm.Color,'Color',CList.Items);
     Fill_Comb(Frodm.AnbDat,'Nam',AList.Items);
end;

procedure TFDORej.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key = VK_F3 Then BsaveClick(Sender);
     If Shift = [ssAlt] Then
      Case Key Of
       VK_Left:BprevClick(Sender);
       VK_RIGHT:BnextClick(Sender);
      End;
end;

procedure TFDORej.FormDestroy(Sender: TObject);
begin
     If Frodm.ORej.State = dsBrowse Then Exit;
     Case New Of
     True  :Begin
             CancelFactor(Frodm.ORej,Frodm.ORejG);// CancelOnExit(Frodm.ORejG);
             GoodFilter(Frodm.ORejNo.AsInteger);//1381-08-29
             FNo.Text:=IntToStr(Frodm.ORejNo.Value);
             New:=False;
            End;
     False : CancelEdit; //BSaveClick(Sender);
     End;
     BSave.Enabled:=False;
     BEdit.Enabled:=True;
end;

procedure TFDORej.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Case New Of
     True : IF Check_Factor_State(Frodm.ORej,BSaveClick,FormDestroy)=idCancel Then
      Action :=caNone
     Else
      Action:=caFree;
     False: If  Check_Fac Then Action:=caFree Else Action :=caNone;
     End;
     If Action = caFree Then
     Begin
      Frodm.ORej.Close;
      Frodm.ORejG.Close;
     End;
end;

procedure TFDORej.BprevClick(Sender: TObject);
begin
     If Frodm.ORej.State In [dsEdit,dsInsert] Then
     Begin
       FNo.SetFocus;
       IF Check_Factor_State(Frodm.ORej,BSaveClick,FormDestroy) = idCancel Then Exit;
       New:=False;
       Exit;
     End;
     If Not MoFlag Then Exit;
     Frodm.ORej.Refresh;
     FroDM.ORej.Prior;
     FNo.Text:=IntToStr(Frodm.ORejNo.Value);
     GoodFilter(Frodm.ORejNo.AsInteger);//1381-08-29
     NewNo:=Frodm.ORejNo.Value+1;
end;

procedure TFDORej.BeditClick(Sender: TObject);
begin
     BEdit.Enabled:=False;
     If Not(Frodm.ORej.State=dsBrowse) Then Exit;
     IF Frodm.ORejBKod.Value Then
     Begin
       BEdit.Enabled:=True;
       ShowMessage('ÍæÇáå ÏÇÆãí ÇÓÊ.ÞÇÈá ÇÕáÇÍ äãí ÈÇÔÏ');
       Exit;
     End;
     FacNo:=IntToStr(Frodm.ORejNo.Value);
     BDat:=Frodm.ORejDat.Value;
     EdQu.SQL.Strings[1]:='WHERE I.No ='+FNo.Text;
     EdQu.Open;
     DelBitem(FacNo,BNo,FTip);
     UNDepot;
     InvoUpdate(-1);
     FNam.SetFocus;
     Frodm.ORej.Edit;
     New:=False;
     BSave.Enabled:=True;
end;

procedure TFDORej.BsaveClick(Sender: TObject);
begin
     If FroDM.ORej.State = dsBrowse Then Exit;
     BSave.Enabled:=False;
     FNo.SetFocus;
     If Frodm.ORejG.RecordCount = 0 Then
     Begin
       Frodm.ORej.Delete;
       New:=False;
       BDat:=0;
       BNo:=0;
       FacNo:='';
       GoodFilter(Frodm.ORejNo.AsInteger);//1381-08-29
       FNo.Text:=IntToStr(Frodm.ORejNo.Value);
       BEdit.Enabled:=True;
       Exit;
     End;
     Sum_SingleCurr;
     //Disc:=0;
     //FroDM.ORejPnet.Value :=Frodm.ORejPkol.Value -Frodm.ORejPdis.Value;
     If Not RequierdCheck(Frodm.ORej) Then
     Begin
       Bsave.Enabled:=True;
       Exit;
     End;
     Frodm.ORejBKod.Value:=sPerm;
     If Check_Fac Then Frodm.ORej.Post Else Exit;
     Depot;
     InvoUpdate(1);
     Close_Bill;
     QuickCloseOpen([64,60,6,24,11,27]);
     Frodm.ORej.Locate('No',StrToInt(FNo.Text),[loCaseInsensitive]);
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

procedure TFDORej.BdelClick(Sender: TObject);
Var
I:Integer;
begin
     If Not (Frodm.ORej.State = dsBrowse) Then Exit;
     If MessageDlg('ÝÇßÊæÑ ÍÐÝ ÔæÏ',mtWarning,mbYesNo,0) = mrYes Then
     begin
       If Frodm.ORejBKod.Value = True Then
       Begin
         ShowMessage('ÝÇßÊæÑ ÏÇÆãí ÇÓÊ');
         Exit;
       End;
       BNo:=Frodm.ORejBNo.Value;
       FacNo:=IntToStr(Frodm.ORejNo.Value);
       BDat:=Frodm.ORejDat.Value;
       DelBitem(FacNo,BNo,FTip);
       UNDepot;
       InvoUpdate(-1);
       Billupdate(BNo);
       Frodm.ORejG.First;
       For I:=1 To Frodm.ORejG.RecordCount Do Frodm.ORejG.Delete;
       Frodm.ORej.Delete;
       GoodFilter(Frodm.ORejNo.AsInteger);//1381-08-29
       FNo.Text:=IntToStr(Frodm.ORejNo.Value);
       New:=False;
     End;
end;

procedure TFDORej.BnextClick(Sender: TObject);
begin
     If Frodm.ORej.State In [dsEdit,dsInsert] Then
     Begin
       FNo.SetFocus;
       IF Check_Factor_State(Frodm.ORej,BSaveClick,FormDestroy) = idCancel Then Exit;
       New:=False;
       Exit;
     End;
     If Not MoFlag Then Exit;
     Frodm.ORej.Refresh;
     FroDM.ORej.Next;
     FNo.Text:=IntToStr(Frodm.ORejNo.Value);
     GoodFilter(Frodm.ORejNo.AsInteger);//1381-08-29
     NewNo:=Frodm.ORejNo.Value+1;
     If Frodm.ORej.Filtered = True Then Exit;
     If Frodm.ORej.Eof Then
     Begin
       FNo.Text:=IntToStr(NewNo);
       FNo.SetFocus;
     End;
end;


procedure TFDORej.BnewClick(Sender: TObject);
begin
     If Frodm.ORej.Filtered Then Exit;
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Max(I.No) From DORej I ');
     Qu.Open;
     MaxNo:=Qu.Fields[0].AsInteger;
     Qu.Close;
     FroDM.ORej.Append;
     Frodm.ORejNam.Value:= 'äÇã ÎÑíÏÇÑ';
     If sFac Then
      Frodm.ORejNo.Value :=MaxNo+1
     Else
      Frodm.ORejNo.Value :=StrToInt(FNo.Text);
     Frodm.ORejDat.Value:=Fardate;
     Frodm.ORejBkod.Value:=False;
     FNo.Text:=IntToStr(Frodm.ORejNo.Value);
     Frodm.ORej.Post;
     Frodm.ORej.Edit;
     New:=True;
     FacNo:=FNo.Text;
     BNo:=0;
     BDat:=Frodm.ORejDat.Value;
     GoodFilter(Frodm.ORejNo.AsInteger);//1381-08-29
     Sb1.Panels[2].Text :='ÌÏíÏ';
     BSave.Enabled:=True;
     BEdit.Enabled:=False;
end;

procedure TFDORej.BexitClick(Sender: TObject);
begin
     FNo.SetFocus;
     IF Check_Factor_State(Frodm.ORej,BSaveClick,FormDestroy)=idCancel Then Exit;
     Close;
end;

procedure TFDORej.BprintClick(Sender: TObject);
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
     TahvilRep.QInv.Params[0].Value:=Frodm.ORejNo.Value;
     TahvilRep.QInvG.Params[0].Value:=Frodm.ORejNo.Value;
     TahvilRep.QInv.Open;
     TahvilRep.QInvG.Open;
     If Not bmpP1.Empty Then TahvilRep.Logo.Picture.Bitmap:=bmpP1;
     TahvilRep.User.Caption :=CUser.Name;
     TahvilRep.PrinterSettings.Copies:=StrToInt(InputBox(Cap,Cap1,'1'));
     If cbPrint.Checked Then TahvilRep.Print Else TahvilRep.Preview;
     TahvilRep.Destroy; }

end;

procedure TFDORej.FNoKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then FNoExit(Sender);
     NexTab(Sender,Key);
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;
end;

procedure TFDORej.FPINoKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then FillFromPI(Sender,StrToInt(FPINo.Text));
     NexTab(Sender,Key);
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;
end;

procedure TFDORej.FtelKeyPress(Sender: TObject; var Key: Char);
begin
     NexTab(Sender,Key);
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
        #9,#27,#83,#46,'-']) Then Key:=#0;
end;

procedure TFDORej.GoodsColEnter(Sender: TObject);
begin
     If Frodm.ORej.State = dsBrowse Then Exit Else Frodm.ORejG.Edit;
     Case Goods.SelectedField.Index Of
      1:IF Frodm.ORejGRadif.Value > 0 Then Radif:=Frodm.ORejGRadif.Value;
      3:If Goods.columns[1].ReadOnly Then FillGList(Frodm.ORejGKod.Value);
      4:If SModel Then
        Begin
         If Goods.Columns[1].ReadOnly Then Exit;
         Fill_Cond(Frodm.Depot,'Color','Kod='+Frodm.ORejGKod.AsString,CList.Items);
         DrawList(CList,3);
         CList.ItemIndex:=CList.Items.IndexOf(Frodm.ORejGColor.Value);
         If CList.ItemIndex =-1 Then CList.ItemIndex:=0;
        End;
     5: Begin
         //IF (Frodm.ORejGColor.Value = '')and(sModel)  Then Goods.SelectedField:= Frodm.ORejGColor;
         IF Frodm.ORejGNam.Value = '' Then Goods.SelectedField:= Frodm.ORejGNam;
         If Not Goods.Columns[1].ReadOnly Then DrawList(AList,4);
        End;
     7:IF Frodm.ORejGReject.IsNull Then Frodm.ORejGReject.Value:=0;
     End;
end;

// Calculating The Depot and Acount Bill For Sold Goods
procedure TFDORej.GoodsColExit(Sender: TObject);
begin
     If Frodm.ORej.State = dsBrowse Then Exit Else Frodm.ORejG.Edit;
     Case Goods.SelectedField.Index Of
     1:Begin
        //ColumnEnable;
        IF Frodm.ORejGRadif.Value = 0 Then Frodm.ORejGRadif.Value :=Radif;
        Frodm.ORejGDat.Value :=Frodm.ORejDat.Value;
        Frodm.ORejGNo.Value:=Frodm.ORejNo.Value;
        Frodm.ORejGDelikod.Value:=False;
        Frodm.ORejGAnbkod.Value:=Frodm.ORejRefNo.Value;
        Frodm.ORejG.Post;
       End;
     2:Begin
        If Goods.columns[1].ReadOnly Then Exit;
        If {(sGene = 0) and }GoodState(Frodm.ORejGKod.Value) Then
        Begin
          uGood.Code:=Frodm.ORejGKod.Value;
          Frodm.ORejGNam.Value:=uGood.Name;// GoodNam();
          //Frodm.ORejGPfee.Value:=GoodSoldPrice(Frodm.ORejGKod.Value);
          Exit;
        End;
        FillGList(Frodm.ORejGKod.Value);
       End;
     6:If Goods.SelectedField.Text = Null Then Goods.SelectedField.Value :=0;
     10:Frodm.ORejGPtotal.Value :=Frodm.ORejGPfee.Value *Frodm.ORejGQuant.Value;
     End;
     If Goods.Columns[0].Field.Value > 0 Then Radif:=Frodm.ORejGRadif.Value ;
end;

procedure TFDORej.GoodsEditButtonClick(Sender: TObject);
begin
     If Frodm.ORej.State In [dsInsert,dsEdit] Then
     Begin
       Frodm.ORejG.Delete;
       Frodm.ORejG.Edit;
     End;
end;

procedure TFDORej.GoodsEnter(Sender: TObject);
begin
     If (FroDM.ORej.State = dsBrowse) Or (Frodm.ORejBKod.Value = True) Then
       Goods.ReadOnly := True Else Goods.ReadOnly :=False;
     Goods.selectedField:=Goods.Columns[0].Field;
end;

procedure TFDORej.GoodsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Not(Frodm.ORej.State = dsBrowse) Then Frodm.ORejG.Edit;
     If Shift = [ssCtrl]   Then  FPkol.SetFocus;
     If Shift = [ssCtrl]+[ssShift]  Then  FCKod.SetFocus;
     IF ((Key = VK_F4) and Not(Frodm.ORej.State = dsBrowse)and
        Not(Goods.Columns[Goods.SelectedIndex-1].ReadOnly ))  Then
      Case Goods.SelectedField.Index Of
      3: DrawList(GList,2);
      4: DrawList(Clist,3);
      5: DrawList(AList,4);
      End;
     If (Goods.SelectedIndex In [0,1,2,3])and(Key=32)and Not(Frodm.ORej.State = dsBrowse) Then
      If FindGoods(Frodm.ORejG,Frodm.ORejNo.AsInteger,Frodm.ORejDat.AsInteger,Frodm.ORejNam.AsString) Then
       Goods.SelectedField :=Frodm.ORejGPfee;
     If (Goods.SelectedIndex In [8,10]) and Not(Frodm.ORej.State = dsBrowse) Then
     Case Key Of
       VK_MULTIPLY :Begin
               Frodm.ORejG.Post;
               Frodm.ORejG.Edit;
               Goods.SelectedField.Value := Goods.SelectedField.Value*1000;
               End;
       VK_DIVIDE   : Begin
               Frodm.ORejG.Post;
               Frodm.ORejG.Edit;
               Goods.SelectedField.Value := Goods.SelectedField.Value* 100;
               End;
     End;
end;

procedure TFDORej.GoodsKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
       If (Goods.SelectedField.Index = 11) and Not(Frodm.ORej.State =dsBrowse) Then
         If (Frodm.ORejGPfee.Value = 0 ) Then
          Frodm.ORejGPfee.Value:=Frodm.ORejGPTotal.Value /Frodm.ORejGQuant.Value;
       Key:=#0;
       GridMove(Goods,Frodm.ORej,Radif);
     End;
     If Not(Frodm.ORej.State = dsBrowse) Then Frodm.ORejG.Edit;
end;

procedure TFDORej.GoodsMouseMove(Sender: TObject; Shift: TShiftState; X,
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

procedure TFDORej.GListKeyPress(Sender: TObject; var Key: Char);
Var
S:String;
begin
     If Key=#13 Then
     Begin
     Key:=#0;
     s:=GList.Items.Strings[GList.ItemIndex];
     Case sDP Of
     True:Begin
      Frodm.ORejG.Edit;
      Frodm.ORejGNam.Value :=Decode(s);
      Frodm.ORejGColor.Value :=Decode(s);
      Frodm.ORejGAnbNam.Value :=Decode(s);
      Frodm.ORejGQuant.Value :=StrToFloat(Decode(s));
      MaxQuant:=Frodm.ORejGQuant.Value;
      Frodm.ORejGkod.Value :=GoodKod(Frodm.ORejGNam.Value);
      Frodm.ORejGPfee.Value :=GoodSoldPrice(Frodm.ORejGkod.Value);
      Frodm.ORejGNo.Value:=Frodm.ORejNo.Value;
      Frodm.ORejG.Post;
      Goods.SetFocus;
      Goods.SelectedField :=Goods.Columns[5].Field;
      GList.Visible :=False;
      Bexit.Cancel :=True;
     End;
     False:Begin
      Frodm.ORejG.Edit;
      uGood.Name:=S;
      Frodm.ORejGNam.Value :=s;
      Frodm.ORejGkod.Value :=uGood.Code;// GoodKod(Frodm.ORejGNam.Value);
      Frodm.ORejGPfee.Value :=uGood.SoldPrice;// GoodSoldPrice(Frodm.ORejGkod.Value);
      Frodm.ORejGNo.Value:=Frodm.ORejNo.Value;
      If uGood.IsService Then Frodm.ORejGQuant.Value:=1;
      Frodm.ORejG.Post;
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

procedure TFDORej.FNoExit(Sender: TObject);
begin
     If Frodm.ORej.State In [dsEdit,dsInsert] Then
     Begin
       Fno.Text:=IntToStr(Frodm.ORejNo.Value);
       Exit;
     End;
     NewNo:=StrToInt(FNo.Text);
     FacNo:=FNo.Text;
//     If  Not(Frodm.ORej.FindKey([NewNo])) Then BnewClick(Sender) Else
     If Not(Frodm.ORej.Locate('No',NewNo,[loCaseInsensitive])) Then BNewClick(Sender) Else
     Begin
      GoodFilter(Frodm.ORejNo.AsInteger);//1381-08-29
      FacNo:=FNo.Text;
      BNo:=Frodm.ORejBno.Value;
      BDat:=Frodm.ORejDat.Value;
     End;
end;

procedure TFDORej.GListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key = 27 Then
     Begin
       Goods.SetFocus;
       Frodm.ORejG.Delete;
       Frodm.ORejG.Append;
       Goods.SelectedField :=Frodm.ORejGRadif;
       GList.Visible :=False;
       Bexit.Cancel :=True;
     End;
end;

procedure TFDORej.GListDblClick(Sender: TObject);
Var
Key:Char;
begin
     Key:=#13;
     GListKeyPress(Sender,Key);
end;

procedure TFDORej.FNamDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
     Accept:=(Source Is TXPListBox) And ((Source As TXPListBox).Name = 'lbName')
end;

procedure TFDORej.FNamDragDrop(Sender, Source: TObject; X, Y: Integer);
Var
List:TXPListBox;
begin
     If Not(Frodm.ORej.State = dsBrowse)and (Source Is TXPListBox) Then
     Begin
       List:=(Source As TXPListBox);
       Frodm.ORejNam.Value:=List.Items.Strings[List.ItemIndex];
       FAcSearch.Close;
       FNam.SetFocus;
     End;
end;

procedure TFDORej.GoodsDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
     Accept:=(Source Is TXPListBox) And ((Source As TXPListBox).Name = 'lbGName');
     Accept:=Accept and (SGene = False);
end;

procedure TFDORej.GoodsDragDrop(Sender, Source: TObject; X, Y: Integer);
Var
List:TXPListBox;
Key:Char;
begin
     If Not(Frodm.ORej.State = dsBrowse)and (Source Is TXPListBox) Then
     Begin
       List:=(Source As TXPListBox);
       If Frodm.ORejGNam.Value = '' Then Frodm.ORejG.Edit Else
        Frodm.ORejG.Append;
       Frodm.ORejGRadif.Value:=Frodm.ORejG.RecordCount+1;
       Frodm.ORejGKod.Value:=StrToInt(List.Hint);
       FGSearch.Close;
       FillGList(Frodm.ORejGKod.Value);
       If GList.Items.Count = 1 Then
       Begin
        GList.ItemIndex :=0;
        Key:=#13;
        GListKeyPress(Sender,Key);
       End;
     End;
end;

procedure TFDORej.GoodsDblClick(Sender: TObject);
begin
     If Not(Frodm.ORej.State = dsBrowse) Then
      CreatingForm(TFGSearch,'FGSearch',FGSearch);
end;

procedure TFDORej.Dat1Enter(Sender: TObject);
begin
     If Frodm.ORej.State = dsBrowse Then Dat1.ReadOnly :=True Else
     Begin
        Dat1.ReadOnly :=False;
        GetMaskText(Dat1);
     End;
end;

procedure TFDORej.Dat1Exit(Sender: TObject);
begin
     If (Frodm.ORej.State = dsBrowse) Then Exit;
     SetMaskText(Dat1);
     If(Not Date_Check(Dat1.Text))And(DateToInt(Dat1.Text)>0) Then Dat1.SetFocus Else
       Frodm.ORejDat.Value :=DateToInt(Dat1.Text);
end;

procedure TFDORej.FNamKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetAccountDbCombo(Sender,Key,'',0);
end;


procedure TFDORej.CListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If (Key = 27) Then
     Begin
       Goods.SetFocus;
       Goods.SelectedField :=Frodm.ORejGColor;
       CList.Visible :=False;
       Bexit.Cancel :=True;
     End;
end;

procedure TFDORej.CListKeyPress(Sender: TObject; var Key: Char);
begin
     If Key =#13 Then
     Begin
       Frodm.ORejG.Edit;
       Frodm.ORejGColor.Value:=CList.Items.Strings[CList.ItemIndex];
       Goods.SetFocus;
       Goods.SelectedField :=Frodm.ORejGColor;
       CList.Visible :=False;
       Bexit.Cancel :=True;
     End;
end;

procedure TFDORej.AListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If (Key = 27) Then
     Begin
       Goods.SetFocus;
       Goods.SelectedField :=Frodm.ORejGAnbNam;
       AList.Visible :=False;
       Bexit.Cancel :=True;
     End;
end;

procedure TFDORej.AListKeyPress(Sender: TObject; var Key: Char);
begin
     If Key =#13 Then
     Begin
       Frodm.ORejG.Edit;
       Frodm.ORejGAnbNam.Value:=AList.Items.Strings[AList.ItemIndex];
       Goods.SetFocus;
       Goods.SelectedField :=Frodm.ORejGQuant;
       AList.Visible :=False;
       Bexit.Cancel :=True;
     End;
end;

procedure TFDORej.FPkolEnter(Sender: TObject);
begin
      Sum_SingleCurr;
end;


procedure TFDORej.FCKodKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetCentLookup(Sender,Key);
end;

end.
