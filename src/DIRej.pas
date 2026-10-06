unit DIRej;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Db, DBTables, ComCtrls, ExtCtrls,
  Grids, DBGrids, DBCGrids, Menus, Buttons, PopupListBox, ppDB,
  ppParameter, ppStrtch, ppMemo, ppPrnabl, ppClass, ppCtrls, ppBands,
  ppCache, ppEndUsr, ppProd, ppReport, ppComm, ppRelatv, ppDBPipe, ppDBBDE,
  ppFormWrapper, ppRptExp;

type
  TFDIRej = class(TForm)
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

    Procedure DrawList(List:TPopupListBox;Index:Integer);
    Procedure UnDepot;
    Procedure Depot;
    Procedure Close_Bill;
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
  FDIRej: TFDIRej;

implementation

uses FrooshDM, FactorRep,Routins, ProVar, MainForm, AcSearch,
  GSearch, Converts, XPListBox, CRoutins, FactorRep2;

{$R *.DFM}
Const
Tip='ÈÑÔÊ Èå ÇäÈÇÑ';
FTip=25;

Procedure TFDIRej.NexTab(Sender:TObject;Var Key :Char);
begin
     If Key = #13 Then
     Begin
      Key:=#0;
      SelectNext(Sender As TWinControl,True,True);
     End;
end;
//Procedure For Find Customers Kod If There is

procedure TFDIRej.DrawList(List: TPopupListBox; Index: Integer);
begin
     List.Visible :=True;
     Bexit.Cancel :=False;
     List.SetFocus;
     List.ItemIndex:=-1;
     List.ItemIndex:=List.Items.IndexOf(Goods.Columns[Index].Field.AsString);
     If List.ItemIndex = -1 Then  List.ItemIndex :=0;
end;

Procedure TFDIRej.UnDepot;
Var
I:Integer;
Gs:Boolean;
begin
     Frodm.IRejG.First;
     For I:= 1 To Frodm.IRejG.RecordCount Do
     Begin
      DepotChange(Frodm.IRejGKod.Value,0,
                  Frodm.IRejGColor.Value,Frodm.IRejGAnbNam.Value,
                  Frodm.IRejGQuant.Value,dpOut);
      Frodm.IRejG.Next;
     End;
     Cardex_Del(Frodm.IRejNo.AsString,Tip);
end;

Procedure TFDIRej.Depot;
Var
I:Integer;
GS:Boolean;
SPtotal:Currency;
begin
     SPtotal:=0;
     Frodm.IRejG.First;
     For I:=1 To Frodm.IRejG.RecordCount Do
     Begin
       Frodm.IRejG.Edit;
       Frodm.IRejGRadif.Value:=I;
       Frodm.IRejGNo.Value:=Frodm.IRejNo.Value;
       Frodm.IRejGDat.Value:=Frodm.IRejDat.Value;
       Frodm.IRejG.Post;
       SPtotal:=SPtotal+Frodm.IRejGPtotal.Value;
       Auto_GCardex(Frodm.IRejGNam.Value,Frodm.IRejGColor.Value,
                    Frodm.IRejGAnbNam.Value,Frodm.IRejGKod.Value,
                    Frodm.IRejGRadif.Value,Frodm.IRejGQuant.Value,
                    dpIn,Frodm.IRejNo.Value,Frodm.IRejDat.Value,Tip,
                    FNam.Text,Frodm.IRejGPfee.Value,0);
       DepotChange(Frodm.IRejGKod.Value,0,Frodm.IRejGColor.Value,
         Frodm.IRejGAnbNam.Value,Frodm.IRejGQuant.Value,dpIn);
      Frodm.IRejG.Next;
     End;
end;


Procedure TFDIRej.Close_Bill;
begin
//-----------------     }
     Frodm.AutoBill.FindKey(['GF']);
     State:=Frodm.AutoBillStat.Value;
     BehKod:=Frodm.AutoBillBehKod.Value;
     BesKod:=Frodm.AutoBillBesKod.Value;
     Price:=Frodm.IRejPkol.Value;
     Str:='ÌãÚ ÇÞáÇã ÈÑÔÊ Èå ÇäÈÇÑ'+' '+FNo.Text+' '+FNam.Text;
     NewBNo:=AutoBill(State,BehKod,BesKod,Price,Str,FacNo,BNo,FTip,BDat,
      Frodm.IRejCost.AsString,Frodm.IRejCkod.AsInteger,0,0,DefaultCurr);
//------------------
     If NewBNo = BNo Then BillUpdate(BNo) Else
      If sBill  Then MakeBill('ÓäÏ ÈÑÔÊ Èå  ÇäÈÇÑ  '+'  '+FNam.Text+
      ' Øí ÍæÇáå ÇäÈÇÑ  ÔãÇÑå'+FNo.Text);
end;

Procedure TFDIRej.FillFromPI(Sender:TObject;PINo:Integer);
Var
I,J:Integer;
begin
     IF PINo = 0 Then Exit;
     IF Frodm.IRej.State = dsBrowse Then Exit;
     IF Frodm.IRejG.RecordCount > 0 Then Exit;
     Frodm.Hav.Open;
     Frodm.Hav.Locate('No',PINo,[loCaseInsensitive]);
     Frodm.IRejNam.Value :=Frodm.HavNam.Value;
     Frodm.IRejCost.Value:=Frodm.HavCost.Value;
     Frodm.IRejCkod.Value:=Frodm.HavCkod.Value;
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Kod,Nam,Color,Radif,AnbNam,Quant,Serial,Pfee ');
     Qu.SQL.Add('From DHavG P Where  P.No = '+IntToStr(PINo));//Quant-Qout > 0 and
     Qu.Open;
     Qu.First;
     Goods.DataSource:=nil;
     J:=0;
     For I:=1 To Qu.RecordCount Do
     Begin
      If Qu.Fields[5].AsFloat > 0 Then
      Begin
       J:=J+1;
       Frodm.IRejG.Append;
       Frodm.IRejGNo.Value:=Frodm.IRejNo.Value;
       Frodm.IRejGDelikod.Value:=False;
       Frodm.IRejGkod.Value :=Qu.Fields[0].AsInteger;
       Frodm.IRejGNam.Value :=Qu.Fields[1].AsString;
       Frodm.IRejGDat.Value :=FRodm.IRejDat.Value;
       Frodm.IRejGColor.Value :=Qu.Fields[2].AsString;
       Frodm.IRejGRadif.Value :=J;//Qu.Fields[3].AsInteger;
       Frodm.IRejGAnbNam.Value:=Qu.Fields[4].AsString;
       Frodm.IRejGAnbKod.Value :=PINo;
       Frodm.IRejGQuant.Value :=Qu.Fields[5].AsFloat;
       Frodm.IRejGSerial.AsString:=Qu.Fields[6].AsString;
       Frodm.IRejGPfee.Value:=Qu.Fields[7].AsCurrency;
       Frodm.IRejG.Post;
      End;
      Qu.Next;
     End;
     Qu.Close;
     Goods.DataSource:=Frodm.IRejGDs;
     Goods.SetFocus;
     Frodm.IRejG.First;
     Frodm.IRejG.Edit;
end;


Procedure TFDIRej.SetImage;
begin
     Main.glKey.GetBitmap(0,BPrev.Glyph);
     Main.glKey.GetBitmap(1,Bnext.Glyph);
     Main.glKey.GetBitmap(2,BPrint.Glyph);
     Main.glKey.GetBitmap(3,Bedit.Glyph);
     Main.glKey.GetBitmap(4,Bsave.Glyph);
     Main.glKey.GetBitmap(5,Bdel.Glyph);
     Main.glKey.GetBitmap(7,BExit.Glyph);
end;

Procedure TFDIRej.CancelEdit;
Var
I,J:Integer;
begin
     If (Not EdQu.Active)or(EdQu.RecordCount =0) Then Exit;
     GoodFilter(Frodm.IRejNo.AsInteger);
     Frodm.IRejG.First;
     For I:=1 To Frodm.IRejG.RecordCount Do Frodm.IRejG.Delete;
     EdQu.First;
     For I:=1 To EdQu.RecordCount Do
     Begin
       Frodm.IRejG.Append;
       For J:=1 To 15 Do
         Frodm.IRejG.Fields[J].Value:=EdQu.Fields[J].Value;
       Frodm.IRejG.Post;
       EdQu.Next;
     End;
     EdQu.Close;
     Frodm.IRej.Cancel;
     Frodm.IRejG.First;
     Depot;
end;

Procedure TFDIRej.GoodFilter(FAcNo:Integer);
begin
     Frodm.IRejG.Filtered:=False;
     Frodm.IRejG.Filter:='No = '+IntToStr(FacNo);
     Frodm.IRejG.Filtered:=True;
     Dat1.Text:=IntToDate(Frodm.IRejDat.Value)
End;


Function TFDIRej.IsServiceOnly:Boolean;
begin
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Kod from DIRejG where No=:n1 ');
     Qu.SQL.Add(' and Kod in (Select Kod from Goods where FDP=0)');
     Qu.Params[0].Value:=Frodm.IRejNo.Value;
     Qu.Open;
     Result:=Qu.RecordCount =0;
     Qu.Close;
end;

procedure TFDIRej.Sum_singleCurr;
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
     If FroDM.IRej.State = dsBrowse Then Exit ;
     FroDM.IRejG.First;
     Sum:=0;Nsum:=0;OSum:=0;mSum:=0;
     For I:=1 to FroDM.IRejG.RecordCount Do
     Begin
      Sum:=Sum+FroDM.IRejGPfee.Value * Frodm.IRejGQuant.Value;
      Nsum:=Nsum+FroDM.IRejGPtotal.Value;
      OSum:=OSum+Frodm.IRejGPtotal.AsCurrency;
      mSum:=mSum+FroDM.IRejGPtotal.Value*Frodm.IRejGAnbkod.Value;
      FroDM.IRejG.Next;
     End;
     FroDM.IRejPkol.AsCurrency:=Sum;
     Frodm.IRejPnet.AsCurrency:=Nsum;
     Disc:=0;
     If sPerc Then
     Begin
      Disc:=Sum-Nsum;
      Frodm.IRejPdis.AsCurrency:=Disc;
     End;
end;

//End Of Private decaleration

procedure TFDIRej.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     Frodm.IRej.open;
     Frodm.IRejG.Open;
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
     Qu.SQL.Add('Select Min(I.No),Max(I.No) From DIRej I');
     Qu.Open;
     MinNo:=Qu.Fields[0].AsInteger;
     MaxNo:=Qu.Fields[1].AsInteger;
     Qu.Close;
     Frodm.IRej.Refresh;
     Frodm.IRej.Last;
     NewNo:=MaxNo;
     FNo.Text :=IntToStr(Frodm.IRejNo.Value);
     GoodFilter(Frodm.IRejNo.AsInteger);//1381-08-29
     Radif:=1;
     MoFlag:=True;
     IF sFac Then
      If MaxNo = 0 Then Exit Else BnewClick(Sender);
end;

procedure TFDIRej.FormActivate(Sender: TObject);
begin
     FNam.Items.Assign(AcList);
     GList.Items.Assign(Kala);
     Goods.Columns[10].PickList.Assign(CurrList);
     FCost.Items.Assign(CostList);
     Fill_Comb(Frodm.Color,'Color',CList.Items);
     Fill_Comb(Frodm.AnbDat,'Nam',AList.Items);
end;

procedure TFDIRej.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key = VK_F3 Then BsaveClick(Sender);
     If Shift = [ssAlt] Then
      Case Key Of
       VK_Left:BprevClick(Sender);
       VK_RIGHT:BnextClick(Sender);
      End;
end;

procedure TFDIRej.FormDestroy(Sender: TObject);
begin
     If Frodm.IRej.State = dsBrowse Then Exit;
     Case New Of
     True  :Begin
             CancelFactor(Frodm.IRej,Frodm.IRejG);// CancelOnExit(Frodm.IRejG);
             GoodFilter(Frodm.IRejNo.AsInteger);//1381-08-29
             FNo.Text:=IntToStr(Frodm.IRejNo.Value);
             New:=False;
            End;
     False : CancelEdit; //BSaveClick(Sender);
     End;
     BSave.Enabled:=False;
     BEdit.Enabled:=True;
end;

procedure TFDIRej.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Case New Of
     True : IF Check_Factor_State(Frodm.IRej,BSaveClick,FormDestroy)=idCancel Then
      Action :=caNone
     Else
      Action:=caFree;
     False: Action:=caFree;//If  Check_Fac Then Action:=caFree Else Action :=caNone;
     End;
     If Action = caFree Then
     Begin
      Frodm.IRej.Close;
      Frodm.IRejG.Close;
     End;
end;

procedure TFDIRej.BprevClick(Sender: TObject);
begin
     If Frodm.IRej.State In [dsEdit,dsInsert] Then
     Begin
       FNo.SetFocus;
       IF Check_Factor_State(Frodm.IRej,BSaveClick,FormDestroy) = idCancel Then Exit;
       New:=False;
       Exit;
     End;
     If Not MoFlag Then Exit;
     Frodm.IRej.Refresh;
     FroDM.IRej.Prior;
     FNo.Text:=IntToStr(Frodm.IRejNo.Value);
     GoodFilter(Frodm.IRejNo.AsInteger);//1381-08-29
     NewNo:=Frodm.IRejNo.Value+1;
end;

procedure TFDIRej.BeditClick(Sender: TObject);
begin
     BEdit.Enabled:=False;
     If Not(Frodm.IRej.State=dsBrowse) Then Exit;
     IF Frodm.IRejBKod.Value Then
     Begin
       BEdit.Enabled:=True;
       ShowMessage('ÍæÇáå ÏÇÆãí ÇÓÊ.ÞÇÈá ÇÕáÇÍ äãí ÈÇÔÏ');
       Exit;
     End;
     FacNo:=IntToStr(Frodm.IRejNo.Value);
     BDat:=Frodm.IRejDat.Value;
     EdQu.SQL.Strings[1]:='WHERE I.No ='+FNo.Text;
     EdQu.Open;
     DelBitem(FacNo,BNo,FTip);
     UNDepot;
//     InvoUpdate(-1);
     FNam.SetFocus;
     Frodm.IRej.Edit;
     New:=False;
     BSave.Enabled:=True;
end;

procedure TFDIRej.BsaveClick(Sender: TObject);
begin
     If FroDM.IRej.State = dsBrowse Then Exit;
     BSave.Enabled:=False;
     FNo.SetFocus;
     If Frodm.IRejG.RecordCount = 0 Then
     Begin
       Frodm.IRej.Delete;
       New:=False;
       BDat:=0;
       BNo:=0;
       FacNo:='';
       GoodFilter(Frodm.IRejNo.AsInteger);//1381-08-29
       FNo.Text:=IntToStr(Frodm.IRejNo.Value);
       BEdit.Enabled:=True;
       Exit;
     End;
     Sum_SingleCurr;
     //Disc:=0;
     //FroDM.IRejPnet.Value :=Frodm.IRejPkol.Value -Frodm.IRejPdis.Value;
     If Not RequierdCheck(Frodm.IRej) Then
     Begin
       Bsave.Enabled:=True;
       Exit;
     End;
     Frodm.IRejBKod.Value:=sPerm;
     //If Check_Fac Then  Else Exit;
     Frodm.IRej.Post;
     Depot;
     Close_Bill;
     QuickCloseOpen([63,59,6,24,11,27]);
     Frodm.IRej.Locate('No',StrToInt(FNo.Text),[loCaseInsensitive]);
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

procedure TFDIRej.BdelClick(Sender: TObject);
Var
I:Integer;
begin
     If Not (Frodm.IRej.State = dsBrowse) Then Exit;
     If MessageDlg('ÝÇßÊæÑ ÍÐÝ ÔæÏ',mtWarning,mbYesNo,0) = mrYes Then
     begin
       If Frodm.IRejBKod.Value = True Then
       Begin
         ShowMessage('ÝÇßÊæÑ ÏÇÆãí ÇÓÊ');
         Exit;
       End;
       BNo:=Frodm.IRejBNo.Value;
       FacNo:=IntToStr(Frodm.IRejNo.Value);
       BDat:=Frodm.IRejDat.Value;
       DelBitem(FacNo,BNo,FTip);
       UNDepot;
       Billupdate(BNo);
       Frodm.IRejG.First;
       For I:=1 To Frodm.IRejG.RecordCount Do Frodm.IRejG.Delete;
       Frodm.IRej.Delete;
       GoodFilter(Frodm.IRejNo.AsInteger);//1381-08-29
       FNo.Text:=IntToStr(Frodm.IRejNo.Value);
       New:=False;
     End;
end;

procedure TFDIRej.BnextClick(Sender: TObject);
begin
     If Frodm.IRej.State In [dsEdit,dsInsert] Then
     Begin
       FNo.SetFocus;
       IF Check_Factor_State(Frodm.IRej,BSaveClick,FormDestroy) = idCancel Then Exit;
       New:=False;
       Exit;
     End;
     If Not MoFlag Then Exit;
     Frodm.IRej.Refresh;
     FroDM.IRej.Next;
     FNo.Text:=IntToStr(Frodm.IRejNo.Value);
     GoodFilter(Frodm.IRejNo.AsInteger);//1381-08-29
     NewNo:=Frodm.IRejNo.Value+1;
     If Frodm.IRej.Filtered = True Then Exit;
     If Frodm.IRej.Eof Then
     Begin
       FNo.Text:=IntToStr(NewNo);
       FNo.SetFocus;
     End;
end;


procedure TFDIRej.BnewClick(Sender: TObject);
begin
     If Frodm.IRej.Filtered Then Exit;
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Max(I.No) From DIRej I ');
     Qu.Open;
     MaxNo:=Qu.Fields[0].AsInteger;
     Qu.Close;
     FroDM.IRej.Append;
     Frodm.IRejNam.Value:= 'ÇäÊÎÇÈ ˜äíÏ';
     If sFac Then
      Frodm.IRejNo.Value :=MaxNo+1
     Else
      Frodm.IRejNo.Value :=StrToInt(FNo.Text);
     Frodm.IRejDat.Value:=Fardate;
     Frodm.IRejBkod.Value:=False;
     FNo.Text:=IntToStr(Frodm.IRejNo.Value);
     Frodm.IRej.Post;
     Frodm.IRej.Edit;
     New:=True;
     FacNo:=FNo.Text;
     BNo:=0;
     BDat:=Frodm.IRejDat.Value;
     GoodFilter(Frodm.IRejNo.AsInteger);//1381-08-29
     Sb1.Panels[2].Text :='ÌÏíÏ';
     BSave.Enabled:=True;
     BEdit.Enabled:=False;
end;

procedure TFDIRej.BexitClick(Sender: TObject);
begin
     FNo.SetFocus;
     IF Check_Factor_State(Frodm.IRej,BSaveClick,FormDestroy)=idCancel Then Exit;
     Close;
end;

procedure TFDIRej.BprintClick(Sender: TObject);
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
     TahvilRep.QInv.Params[0].Value:=Frodm.IRejNo.Value;
     TahvilRep.QInvG.Params[0].Value:=Frodm.IRejNo.Value;
     TahvilRep.QInv.Open;
     TahvilRep.QInvG.Open;
     If Not bmpP1.Empty Then TahvilRep.Logo.Picture.Bitmap:=bmpP1;
     TahvilRep.User.Caption :=CUser.Name;
     TahvilRep.PrinterSettings.Copies:=StrToInt(InputBox(Cap,Cap1,'1'));
     If cbPrint.Checked Then TahvilRep.Print Else TahvilRep.Preview;
     TahvilRep.Destroy; }
end;

procedure TFDIRej.FNoKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then FNoExit(Sender);
     NexTab(Sender,Key);
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;
end;

procedure TFDIRej.FPINoKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then FillFromPI(Sender,StrToInt(FPINo.Text));
     NexTab(Sender,Key);
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;
end;

procedure TFDIRej.FtelKeyPress(Sender: TObject; var Key: Char);
begin
     NexTab(Sender,Key);
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
        #9,#27,#83,#46,'-']) Then Key:=#0;
end;

procedure TFDIRej.GoodsColEnter(Sender: TObject);
begin
     If Frodm.IRej.State = dsBrowse Then Exit Else Frodm.IRejG.Edit;
     Case Goods.SelectedField.Index Of
      1:IF Frodm.IRejGRadif.Value > 0 Then Radif:=Frodm.IRejGRadif.Value;
      //3:If Goods.columns[1].ReadOnly Then FillGList(Frodm.IRejGKod.Value);
      3:If (Frodm.IRejGKod.Value = 0 ) Then
        Case sGene Of
        False:Begin
               If Goods.Columns[1].ReadOnly Then Exit;
               DrawList(GList,2);
              End;
        True:Begin
              If Goods.columns[1].ReadOnly Then Exit;
              GList.Items.Assign(Kala);
              DrawList(GList,2);
             End;
       End;
      4:If SModel Then
        Begin
         If Goods.Columns[1].ReadOnly Then Exit;
         Fill_Cond(Frodm.Depot,'Color','Kod='+Frodm.IRejGKod.AsString,CList.Items);
         DrawList(CList,3);
         CList.ItemIndex:=CList.Items.IndexOf(Frodm.IRejGColor.Value);
         If CList.ItemIndex =-1 Then CList.ItemIndex:=0;
        End;
     5: Begin
         //IF (Frodm.IRejGColor.Value = '')and(sModel)  Then  Goods.SelectedField:= Frodm.IRejGColor;
         IF Frodm.IRejGNam.Value = '' Then Goods.SelectedField:= Frodm.IRejGNam;
         If Not Goods.Columns[1].ReadOnly Then DrawList(AList,4);
        End;
     End;
end;

// Calculating The Depot and Acount Bill For Sold Goods
procedure TFDIRej.GoodsColExit(Sender: TObject);
begin
     If Frodm.IRej.State = dsBrowse Then Exit Else Frodm.IRejG.Edit;
     Case Goods.SelectedField.Index Of
     1:Begin
        IF Frodm.IRejGRadif.Value = 0 Then Frodm.IRejGRadif.Value :=Radif;
        Frodm.IRejGDat.Value :=Frodm.IRejDat.Value;
        Frodm.IRejGNo.Value:=Frodm.IRejNo.Value;
        Frodm.IRejGDelikod.Value:=False;
        Frodm.IRejGAnbkod.Value:=Frodm.IRejRefNo.Value;
        Frodm.IRejG.Post;
       End;
     2:If Goods.SelectedField.Value > -1 Then
        case sGene Of
          False:Begin
             If Goods.Columns[1].ReadOnly Then Exit;
             If Frodm.IRejGNam.IsNull Then
              Frodm.IRejGNam.Value :=GoodNam(Goods.SelectedField.Value)
             Else
              GList.Items.Assign(Kala);
             DrawList(GList,2);
             GList.ItemIndex:=GList.Items.IndexOf(Frodm.IRejGNam.Value);
             If GList.ItemIndex =-1 Then GList.ItemIndex:=0;
            End;
          True:Begin
             If Goods.columns[1].ReadOnly Then Exit;
             If Frodm.IRejGNam.IsNull Then
              FillGene(GList.Items,Goods.SelectedField.Value)
             Else
              GList.Items.Assign(Kala);
             DrawList(GList,2);
             GList.ItemIndex:=GList.Items.IndexOf(Frodm.IRejGNam.Value);
             If GList.ItemIndex =-1 Then GList.ItemIndex:=0;
            End;
       End;
     6:If Goods.SelectedField.Text = Null Then Goods.SelectedField.Value :=0;
    10:Frodm.IRejGPtotal.Value :=Frodm.IRejGPfee.Value *Frodm.IRejGQuant.Value;
     End;
     If Goods.Columns[0].Field.Value > 0 Then Radif:=Frodm.IRejGRadif.Value ;
end;

procedure TFDIRej.GoodsEditButtonClick(Sender: TObject);
begin
     If Frodm.IRej.State In [dsInsert,dsEdit] Then
     Begin
       Frodm.IRejG.Delete;
       Frodm.IRejG.Edit;
     End;
end;

procedure TFDIRej.GoodsEnter(Sender: TObject);
begin
     If (FroDM.IRej.State = dsBrowse) Or (Frodm.IRejBKod.Value = True) Then
       Goods.ReadOnly := True Else Goods.ReadOnly :=False;
     Goods.selectedField:=Goods.Columns[0].Field;
end;

procedure TFDIRej.GoodsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Not(Frodm.IRej.State = dsBrowse) Then Frodm.IRejG.Edit;
     If Shift = [ssCtrl]   Then  FPkol.SetFocus;
     If Shift = [ssCtrl]+[ssShift]  Then  FCKod.SetFocus;
     IF ((Key = VK_F4) and Not(Frodm.IRej.State = dsBrowse)and
        Not(Goods.Columns[Goods.SelectedIndex-1].ReadOnly ))  Then
      Case Goods.SelectedField.Index Of
      3: DrawList(GList,2);
      4: DrawList(Clist,3);
      5: DrawList(AList,4);
      End;
     If (Goods.SelectedIndex In [0,1,2,3])and(Key=32)and Not(Frodm.IRej.State = dsBrowse) Then
      If FindGoods(Frodm.IRejG,Frodm.IRejNo.AsInteger,Frodm.IRejDat.AsInteger,Frodm.IRejNam.AsString) Then
       Goods.SelectedField :=Frodm.IRejGPfee;
     If (Goods.SelectedIndex In [8,10]) and Not(Frodm.IRej.State = dsBrowse) Then
     Case Key Of
       VK_MULTIPLY :Begin
               Frodm.IRejG.Post;
               Frodm.IRejG.Edit;
               Goods.SelectedField.Value := Goods.SelectedField.Value*1000;
               End;
       VK_DIVIDE   : Begin
               Frodm.IRejG.Post;
               Frodm.IRejG.Edit;
               Goods.SelectedField.Value := Goods.SelectedField.Value* 100;
               End;
     End;
end;

procedure TFDIRej.GoodsKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
       If (Goods.SelectedField.Index = 11) and Not(Frodm.IRej.State =dsBrowse) Then
         If (Frodm.IRejGPfee.Value = 0 ) Then
          Frodm.IRejGPfee.Value:=Frodm.IRejGPTotal.Value /Frodm.IRejGQuant.Value;
       Key:=#0;
       GridMove(Goods,Frodm.IRej,Radif);
     End;
     If Not(Frodm.IRej.State = dsBrowse) Then Frodm.IRejG.Edit;
end;

procedure TFDIRej.GoodsMouseMove(Sender: TObject; Shift: TShiftState; X,
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

procedure TFDIRej.GListKeyPress(Sender: TObject; var Key: Char);
Var
S:String;
begin
     If Key=#13 Then
     Begin
     Key:=#0;
     s:=GList.Items.Strings[GList.ItemIndex];
     Case sDP Of
     True:Begin
      Frodm.IRejG.Edit;
      Frodm.IRejGNam.Value :=Decode(s);
      Frodm.IRejGColor.Value :=Decode(s);
      Frodm.IRejGAnbNam.Value :=Decode(s);
      Frodm.IRejGAnbKod.Value :=StrToInt(Decode(s));
      Frodm.IRejGQuant.Value :=StrToFloat(Decode(s));
      MaxQuant:=Frodm.IRejGQuant.Value;
      Frodm.IRejGkod.Value :=GoodKod(Frodm.IRejGNam.Value);
      Frodm.IRejGPfee.Value :=GoodSoldPrice(Frodm.IRejGkod.Value);
      Frodm.IRejGNo.Value:=Frodm.IRejNo.Value;
      Frodm.IRejG.Post;
      Goods.SetFocus;
      Goods.SelectedField :=Goods.Columns[5].Field;
      GList.Visible :=False;
      Bexit.Cancel :=True;
     End;
     False:Begin
      Frodm.IRejG.Edit;
      uGood.Name:=S;
      Frodm.IRejGNam.Value :=s;
      Frodm.IRejGkod.Value :=uGood.Code;// GoodKod(Frodm.IRejGNam.Value);
      Frodm.IRejGPfee.Value :=uGood.SoldPrice;// GoodSoldPrice(Frodm.IRejGkod.Value);
      Frodm.IRejGNo.Value:=Frodm.IRejNo.Value;
      If uGood.IsService Then Frodm.IRejGQuant.Value:=1;
      Frodm.IRejG.Post;
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

procedure TFDIRej.FNoExit(Sender: TObject);
begin
     If Frodm.IRej.State In [dsEdit,dsInsert] Then
     Begin
       Fno.Text:=IntToStr(Frodm.IRejNo.Value);
       Exit;
     End;
     NewNo:=StrToInt(FNo.Text);
     FacNo:=FNo.Text;
     If Not(Frodm.IRej.Locate('No',NewNo,[loCaseInsensitive])) Then BNewClick(Sender) Else
     Begin
      GoodFilter(Frodm.IRejNo.AsInteger);//1381-08-29
      FacNo:=FNo.Text;
      BNo:=Frodm.IRejBno.Value;
      BDat:=Frodm.IRejDat.Value;
     End;
end;

procedure TFDIRej.GListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key = 27 Then
     Begin
       Goods.SetFocus;
       Frodm.IRejG.Delete;
       Frodm.IRejG.Append;
       Goods.SelectedField :=Frodm.IRejGRadif;
       GList.Visible :=False;
       Bexit.Cancel :=True;
     End;
end;

procedure TFDIRej.GListDblClick(Sender: TObject);
Var
Key:Char;
begin
     Key:=#13;
     GListKeyPress(Sender,Key);
end;

procedure TFDIRej.FNamDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
     Accept:=(Source Is TXPListBox) And ((Source As TXPListBox).Name = 'lbName')
end;

procedure TFDIRej.FNamDragDrop(Sender, Source: TObject; X, Y: Integer);
Var
List:TXPListBox;
begin
     If Not(Frodm.IRej.State = dsBrowse)and (Source Is TXPListBox) Then
     Begin
       List:=(Source As TXPListBox);
       Frodm.IRejNam.Value:=List.Items.Strings[List.ItemIndex];
       FAcSearch.Close;
       FNam.SetFocus;
     End;
end;

procedure TFDIRej.GoodsDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
     Accept:=(Source Is TXPListBox) And ((Source As TXPListBox).Name = 'lbGName');
     Accept:=Accept and (SGene = False);
end;

procedure TFDIRej.GoodsDragDrop(Sender, Source: TObject; X, Y: Integer);
Var
List:TXPListBox;
Key:Char;
begin
     If Not(Frodm.IRej.State = dsBrowse)and (Source Is TXPListBox) Then
     Begin
       List:=(Source As TXPListBox);
       If Frodm.IRejGNam.Value = '' Then Frodm.IRejG.Edit Else
        Frodm.IRejG.Append;
       Frodm.IRejGRadif.Value:=Frodm.IRejG.RecordCount+1;
       Frodm.IRejGKod.Value:=StrToInt(List.Hint);
       FGSearch.Close;
       //FillGList(Frodm.IRejGKod.Value);
       If GList.Items.Count = 1 Then
       Begin
        GList.ItemIndex :=0;
        Key:=#13;
        GListKeyPress(Sender,Key);
       End;
     End;
end;

procedure TFDIRej.GoodsDblClick(Sender: TObject);
begin
     If Not(Frodm.IRej.State = dsBrowse) Then
      CreatingForm(TFGSearch,'FGSearch',FGSearch);
end;

procedure TFDIRej.Dat1Enter(Sender: TObject);
begin
     If Frodm.IRej.State = dsBrowse Then Dat1.ReadOnly :=True Else
     Begin
        Dat1.ReadOnly :=False;
        GetMaskText(Dat1);
     End;
end;

procedure TFDIRej.Dat1Exit(Sender: TObject);
begin
     If (Frodm.IRej.State = dsBrowse) Then Exit;
     SetMaskText(Dat1);
     If(Not Date_Check(Dat1.Text))And(DateToInt(Dat1.Text)>0) Then Dat1.SetFocus Else
       Frodm.IRejDat.Value :=DateToInt(Dat1.Text);
end;

procedure TFDIRej.FNamKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetAccountDbCombo(Sender,Key,'',0);
end;


procedure TFDIRej.CListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If (Key = 27) Then
     Begin
       Goods.SetFocus;
       Goods.SelectedField :=Frodm.IRejGColor;
       CList.Visible :=False;
       Bexit.Cancel :=True;
     End;
end;

procedure TFDIRej.CListKeyPress(Sender: TObject; var Key: Char);
begin
     If Key =#13 Then
     Begin
       Frodm.IRejG.Edit;
       Frodm.IRejGColor.Value:=CList.Items.Strings[CList.ItemIndex];
       Goods.SetFocus;
       Goods.SelectedField :=Frodm.IRejGColor;
       CList.Visible :=False;
       Bexit.Cancel :=True;
     End;
end;

procedure TFDIRej.AListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If (Key = 27) Then
     Begin
       Goods.SetFocus;
       Goods.SelectedField :=Frodm.IRejGAnbNam;
       AList.Visible :=False;
       Bexit.Cancel :=True;
     End;
end;

procedure TFDIRej.AListKeyPress(Sender: TObject; var Key: Char);
begin
     If Key =#13 Then
     Begin
       Frodm.IRejG.Edit;
       Frodm.IRejGAnbNam.Value:=AList.Items.Strings[AList.ItemIndex];
       Goods.SetFocus;
       Goods.SelectedField :=Frodm.IRejGQuant;
       AList.Visible :=False;
       Bexit.Cancel :=True;
     End;
end;

procedure TFDIRej.FPkolEnter(Sender: TObject);
begin
      Sum_SingleCurr;
end;


procedure TFDIRej.FCKodKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetCentLookup(Sender,Key);
end;

end.
