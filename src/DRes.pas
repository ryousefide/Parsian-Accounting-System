unit DRes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Db, DBTables, ComCtrls, ExtCtrls,
  Grids, DBGrids, DBCGrids, Menus, Buttons, PopupListBox, ppDB,
  ppParameter, ppStrtch, ppMemo, ppPrnabl, ppClass, ppCtrls, ppBands,
  ppCache, ppEndUsr, ppProd, ppReport, ppComm, ppRelatv, ppDBPipe, ppDBBDE,
  ppFormWrapper, ppRptExp;

type
  TFDRes = class(TForm)
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
  end;

var
  FDRes: TFDRes;

implementation

uses FrooshDM, FactorRep,Routins, ProVar, MainForm, AcSearch,
  GSearch, Converts, XPListBox, CRoutins, FactorRep2;

{$R *.DFM}
Const
Tip='ÑÓíÏ ÇäÈÇÑ';
FTip=24;

Procedure TFDRes.NexTab(Sender:TObject;Var Key :Char);
begin
     If Key = #13 Then
     Begin
      Key:=#0;
      SelectNext(Sender As TWinControl,True,True);
     End;
end;
//Procedure For Find Customers Kod If There is

procedure TFDRes.DrawList(List: TPopupListBox; Index: Integer);
begin
     List.Visible :=True;
     Bexit.Cancel :=False;
     List.SetFocus;
     List.ItemIndex:=-1;
     List.ItemIndex:=List.Items.IndexOf(Goods.Columns[Index].Field.AsString);
     If List.ItemIndex = -1 Then  List.ItemIndex :=0;
end;



Procedure TFDRes.UnDepot;
Var
I:Integer;
Gs:Boolean;
begin
     Frodm.ResG.First;
     For I:= 1 To Frodm.ResG.RecordCount Do
     Begin
      DepotChange(Frodm.ResGKod.Value,0,
                  Frodm.ResGColor.Value,Frodm.ResGAnbNam.Value,
                  Frodm.ResGQuant.Value,dpOut);
      Frodm.ResG.Next;
     End;
     Cardex_Del(Frodm.ResNo.AsString,Tip);
end;

Procedure TFDRes.Depot;
Var
I:Integer;
GS:Boolean;
SPtotal:Currency;
begin
     SPtotal:=0;
     Frodm.ResG.First;
     For I:=1 To Frodm.ResG.RecordCount Do
     Begin
       Frodm.ResG.Edit;
       Frodm.ResGRadif.Value:=I;
       Frodm.ResGNo.Value:=Frodm.ResNo.Value;
       Frodm.ResGDat.Value:=Frodm.ResDat.Value;
       {Frodm.ResGPtotal.Value:=Frodm.ResGPfee.Value*Frodm.ResGQuant.Value;  }
       Frodm.ResG.Post;
       SPtotal:=SPtotal+Frodm.ResGPtotal.Value;
       Auto_GCardex(Frodm.ResGNam.Value,Frodm.ResGColor.Value,
                    Frodm.ResGAnbNam.Value,Frodm.ResGKod.Value,
                    Frodm.ResGRadif.Value,Frodm.ResGQuant.Value,
                    dpIn,Frodm.ResNo.Value,Frodm.ResDat.Value,Tip,
                    FNam.Text,Frodm.ResGPfee.Value,0);
       DepotChange(Frodm.ResGKod.Value,0,Frodm.ResGColor.Value,
         Frodm.ResGAnbNam.Value,Frodm.ResGQuant.Value,dpIn);
      Frodm.ResG.Next;
     End;
end;


Procedure TFDRes.Close_Bill;
begin
//-----------------     }
     Frodm.AutoBill.FindKey(['GF']);
     State:=Frodm.AutoBillStat.Value;
     BehKod:=Frodm.AutoBillBehKod.Value;
     BesKod:=Frodm.AutoBillBesKod.Value;
     Price:=Frodm.ResPkol.Value;
     Str:='ÑÓíÏ ãÓÊÞíã ÇäÈÇÑ Èå ÔãÇÑå '+' '+FNo.Text+' '+FNam.Text;
     NewBNo:=AutoBill(State,BehKod,BesKod,Price,Str,FacNo,BNo,FTip,BDat,
      Frodm.ResCost.AsString,Frodm.ResCkod.AsInteger,0,0,DefaultCurr);
//------------------
     If NewBNo = BNo Then BillUpdate(BNo) Else
      If sBill  Then MakeBill('ÓäÏ ÑÓíÏ ãÓÊÞíã ÇäÈÇÑ  '+'  '+FNam.Text+
      ' Øí ÍæÇáå ÇäÈÇÑ  ÔãÇÑå'+FNo.Text);
end;

Procedure TFDRes.SetImage;
begin
     Main.glKey.GetBitmap(0,BPrev.Glyph);
     Main.glKey.GetBitmap(1,Bnext.Glyph);
     Main.glKey.GetBitmap(2,BPrint.Glyph);
     Main.glKey.GetBitmap(3,Bedit.Glyph);
     Main.glKey.GetBitmap(4,Bsave.Glyph);
     Main.glKey.GetBitmap(5,Bdel.Glyph);
     Main.glKey.GetBitmap(7,BExit.Glyph);
end;

Procedure TFDRes.CancelEdit;
Var
I,J:Integer;
begin
     If (Not EdQu.Active)or(EdQu.RecordCount =0) Then Exit;
     GoodFilter(Frodm.ResNo.AsInteger);
     Frodm.ResG.First;
     For I:=1 To Frodm.ResG.RecordCount Do Frodm.ResG.Delete;
     EdQu.First;
     For I:=1 To EdQu.RecordCount Do
     Begin
       Frodm.ResG.Append;
       For J:=1 To 15 Do
         Frodm.ResG.Fields[J].Value:=EdQu.Fields[J].Value;
       Frodm.ResG.Post;
       EdQu.Next;
     End;
     EdQu.Close;
     Frodm.Res.Cancel;
     Frodm.ResG.First;
     Depot;
end;

Procedure TFDRes.GoodFilter(FAcNo:Integer);
begin
     Frodm.ResG.Filtered:=False;
     Frodm.ResG.Filter:='No = '+IntToStr(FacNo);
     Frodm.ResG.Filtered:=True;
     Dat1.Text:=IntToDate(Frodm.ResDat.Value)
End;


Function TFDRes.IsServiceOnly:Boolean;
begin
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Kod from ResG where No=:n1 ');
     Qu.SQL.Add(' and Kod in (Select Kod from Goods where FDP=0)');
     Qu.Params[0].Value:=Frodm.ResNo.Value;
     Qu.Open;
     Result:=Qu.RecordCount =0;
     Qu.Close;
end;

procedure TFDRes.Sum_singleCurr;
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
     If FroDM.Res.State = dsBrowse Then Exit ;
     FroDM.ResG.First;
     Sum:=0;Nsum:=0;OSum:=0;mSum:=0;
     For I:=1 to FroDM.ResG.RecordCount Do
     Begin
      Sum:=Sum+FroDM.ResGPfee.Value * Frodm.ResGQuant.Value;
      Nsum:=Nsum+FroDM.ResGPtotal.Value;
      OSum:=OSum+Frodm.ResGPtotal.AsCurrency;
      mSum:=mSum+FroDM.ResGPtotal.Value*Frodm.ResGAnbkod.Value;
      FroDM.ResG.Next;
     End;
     FroDM.ResPkol.AsCurrency:=Sum;
     Frodm.ResPnet.AsCurrency:=Nsum;
     Disc:=0;
     If sPerc Then
     Begin
      Disc:=Sum-Nsum;
      Frodm.ResPdis.AsCurrency:=Disc;
     End;
end;


//End Of Private decaleration

procedure TFDRes.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     Frodm.Res.open;
     Frodm.ResG.Open;
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
     Qu.SQL.Add('Select Min(I.No),Max(I.No) From DRes I');
     Qu.Open;
     MinNo:=Qu.Fields[0].AsInteger;
     MaxNo:=Qu.Fields[1].AsInteger;
     Qu.Close;
     Frodm.Res.Refresh;
     Frodm.Res.Last;
     NewNo:=MaxNo;
     FNo.Text :=IntToStr(Frodm.ResNo.Value);
     GoodFilter(Frodm.ResNo.AsInteger);//1381-08-29
     Radif:=1;
     MoFlag:=True;
     IF sFac Then
      If MaxNo = 0 Then Exit Else BnewClick(Sender);
end;

procedure TFDRes.FormActivate(Sender: TObject);
begin
     FNam.Items.Assign(AcList);
     GList.Items.Assign(Kala);
     Goods.Columns[10].PickList.Assign(CurrList);
     FCost.Items.Assign(CostList);
     Fill_Comb(Frodm.Color,'Color',CList.Items);
     Fill_Comb(Frodm.AnbDat,'Nam',AList.Items);
end;

procedure TFDRes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key = VK_F3 Then BsaveClick(Sender);
     If Shift = [ssAlt] Then
      Case Key Of
       VK_Left:BprevClick(Sender);
       VK_RIGHT:BnextClick(Sender);
      End;
end;

procedure TFDRes.FormDestroy(Sender: TObject);
begin
     If Frodm.Res.State = dsBrowse Then Exit;
     Case New Of
     True  :Begin
             CancelFactor(Frodm.Res,Frodm.ResG);// CancelOnExit(Frodm.ResG);
             GoodFilter(Frodm.ResNo.AsInteger);//1381-08-29
             FNo.Text:=IntToStr(Frodm.ResNo.Value);
             New:=False;
            End;
     False : CancelEdit; //BSaveClick(Sender);
     End;
     BSave.Enabled:=False;
     BEdit.Enabled:=True;
end;

procedure TFDRes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Case New Of
     True : IF Check_Factor_State(Frodm.Res,BSaveClick,FormDestroy)=idCancel Then
      Action :=caNone
     Else
      Action:=caFree;
     False: Action:=caFree ;
     End;
     If Action = caFree Then
     Begin
      Frodm.Res.Close;
      Frodm.ResG.Close;
     End;
end;

procedure TFDRes.BprevClick(Sender: TObject);
begin
     If Frodm.Res.State In [dsEdit,dsInsert] Then
     Begin
       FNo.SetFocus;
       IF Check_Factor_State(Frodm.Res,BSaveClick,FormDestroy) = idCancel Then Exit;
       New:=False;
       Exit;
     End;
     If Not MoFlag Then Exit;
     Frodm.Res.Refresh;
     FroDM.Res.Prior;
     FNo.Text:=IntToStr(Frodm.ResNo.Value);
     GoodFilter(Frodm.ResNo.AsInteger);//1381-08-29
     NewNo:=Frodm.ResNo.Value+1;
end;

procedure TFDRes.BeditClick(Sender: TObject);
begin
     BEdit.Enabled:=False;
     If Not(Frodm.Res.State=dsBrowse) Then Exit;
     IF Frodm.ResBKod.Value Then
     Begin
       BEdit.Enabled:=True;
       ShowMessage('ÍæÇáå ÏÇÆãí ÇÓÊ.ÞÇÈá ÇÕáÇÍ äãí ÈÇÔÏ');
       Exit;
     End;
     FacNo:=IntToStr(Frodm.ResNo.Value);
     BDat:=Frodm.ResDat.Value;
     EdQu.SQL.Strings[1]:='WHERE I.No ='+FNo.Text;
     EdQu.Open;
     DelBitem(FacNo,BNo,FTip);
     UNDepot;
//     InvoUpdate(-1);
     FNam.SetFocus;
     Frodm.Res.Edit;
     New:=False;
     BSave.Enabled:=True;
end;

procedure TFDRes.BsaveClick(Sender: TObject);
begin
     If FroDM.Res.State = dsBrowse Then Exit;
     BSave.Enabled:=False;
     FNo.SetFocus;
     If Frodm.ResG.RecordCount = 0 Then
     Begin
       Frodm.Res.Delete;
       New:=False;
       BDat:=0;
       BNo:=0;
       FacNo:='';
       GoodFilter(Frodm.ResNo.AsInteger);//1381-08-29
       FNo.Text:=IntToStr(Frodm.ResNo.Value);
       BEdit.Enabled:=True;
       Exit;
     End;
     Sum_SingleCurr;
     If Not RequierdCheck(Frodm.Res) Then
     Begin
       Bsave.Enabled:=True;
       Exit;
     End;
     Frodm.ResBKod.Value:=sPerm;
     Frodm.Res.Post;
     Depot;
     Close_Bill;
     QuickCloseOpen([62,58,6,24,11,27]);
     Frodm.Res.Locate('No',StrToInt(FNo.Text),[loCaseInsensitive]);
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

procedure TFDRes.BdelClick(Sender: TObject);
Var
I:Integer;
begin
     If Not (Frodm.Res.State = dsBrowse) Then Exit;
     If MessageDlg('ÝÇßÊæÑ ÍÐÝ ÔæÏ',mtWarning,mbYesNo,0) = mrYes Then
     begin
       If Frodm.ResBKod.Value = True Then
       Begin
         ShowMessage('ÝÇßÊæÑ ÏÇÆãí ÇÓÊ');
         Exit;
       End;
       BNo:=Frodm.ResBNo.Value;
       FacNo:=IntToStr(Frodm.ResNo.Value);
       BDat:=Frodm.ResDat.Value;
       DelBitem(FacNo,BNo,FTip);
       UNDepot;
       Billupdate(BNo);
       Frodm.ResG.First;
       For I:=1 To Frodm.ResG.RecordCount Do Frodm.ResG.Delete;
       Frodm.Res.Delete;
       GoodFilter(Frodm.ResNo.AsInteger);//1381-08-29
       FNo.Text:=IntToStr(Frodm.ResNo.Value);
       New:=False;
     End;
end;

procedure TFDRes.BnextClick(Sender: TObject);
begin
     If Frodm.Res.State In [dsEdit,dsInsert] Then
     Begin
       FNo.SetFocus;
       IF Check_Factor_State(Frodm.Res,BSaveClick,FormDestroy) = idCancel Then Exit;
       New:=False;
       Exit;
     End;
     If Not MoFlag Then Exit;
     Frodm.Res.Refresh;
     FroDM.Res.Next;
     FNo.Text:=IntToStr(Frodm.ResNo.Value);
     GoodFilter(Frodm.ResNo.AsInteger);//1381-08-29
     NewNo:=Frodm.ResNo.Value+1;
     If Frodm.Res.Filtered = True Then Exit;
     If Frodm.Res.Eof Then
     Begin
       FNo.Text:=IntToStr(NewNo);
       FNo.SetFocus;
     End;
end;


procedure TFDRes.BnewClick(Sender: TObject);
begin
     If Frodm.Res.Filtered Then Exit;
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Max(I.No) From DRes I ');
     Qu.Open;
     MaxNo:=Qu.Fields[0].AsInteger;
     Qu.Close;
     FroDM.Res.Append;
     Frodm.ResNam.Value:= 'ÇäÊÎÇÈ ˜äíÏ';
     If sFac Then
      Frodm.ResNo.Value :=MaxNo+1
     Else
      Frodm.ResNo.Value :=StrToInt(FNo.Text);
     Frodm.ResDat.Value:=Fardate;
     Frodm.ResBkod.Value:=False;
     FNo.Text:=IntToStr(Frodm.ResNo.Value);
     Frodm.Res.Post;
     Frodm.Res.Edit;
     New:=True;
     FacNo:=FNo.Text;
     BNo:=0;
     BDat:=Frodm.ResDat.Value;
     GoodFilter(Frodm.ResNo.AsInteger);//1381-08-29
     Sb1.Panels[2].Text :='ÌÏíÏ';
     BSave.Enabled:=True;
     BEdit.Enabled:=False;
end;

procedure TFDRes.BexitClick(Sender: TObject);
begin
     FNo.SetFocus;
     IF Check_Factor_State(Frodm.Res,BSaveClick,FormDestroy)=idCancel Then Exit;
     Close;
end;

procedure TFDRes.BprintClick(Sender: TObject);
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
     TahvilRep.QInv.Params[0].Value:=Frodm.ResNo.Value;
     TahvilRep.QInvG.Params[0].Value:=Frodm.ResNo.Value;
     TahvilRep.QInv.Open;
     TahvilRep.QInvG.Open;
     If Not bmpP1.Empty Then TahvilRep.Logo.Picture.Bitmap:=bmpP1;
     TahvilRep.User.Caption :=CUser.Name;
     TahvilRep.PrinterSettings.Copies:=StrToInt(InputBox(Cap,Cap1,'1'));
     If cbPrint.Checked Then TahvilRep.Print Else TahvilRep.Preview;
     TahvilRep.Destroy; }
end;

procedure TFDRes.FNoKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then FNoExit(Sender);
     NexTab(Sender,Key);
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;
end;

procedure TFDRes.FPINoKeyPress(Sender: TObject; var Key: Char);
begin
     NexTab(Sender,Key);
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;
end;

procedure TFDRes.FtelKeyPress(Sender: TObject; var Key: Char);
begin
     NexTab(Sender,Key);
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
        #9,#27,#83,#46,'-']) Then Key:=#0;
end;

procedure TFDRes.GoodsColEnter(Sender: TObject);
begin
     If Frodm.Res.State = dsBrowse Then Exit Else Frodm.ResG.Edit;
     Case Goods.SelectedField.Index Of
      1:IF Frodm.ResGRadif.Value > 0 Then Radif:=Frodm.ResGRadif.Value;
      //3:If Goods.columns[1].ReadOnly Then FillGList(Frodm.ResGKod.Value);
      3:If (Frodm.ResGKod.Value = 0 ) Then
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
         Fill_Cond(Frodm.Depot,'Color','Kod='+Frodm.ResGKod.AsString,CList.Items);
         DrawList(CList,3);
         CList.ItemIndex:=CList.Items.IndexOf(Frodm.ResGColor.Value);
         If CList.ItemIndex =-1 Then CList.ItemIndex:=0;
        End;
     5: Begin
         //IF (Frodm.ResGColor.Value = '')and(sModel)  Then  Goods.SelectedField:= Frodm.ResGColor;
         IF Frodm.ResGNam.Value = '' Then Goods.SelectedField:= Frodm.ResGNam;
         If Not Goods.Columns[1].ReadOnly Then DrawList(AList,4);
        End;
     End;
end;

// Calculating The Depot and Acount Bill For Sold Goods
procedure TFDRes.GoodsColExit(Sender: TObject);
begin
     If Frodm.Res.State = dsBrowse Then Exit Else Frodm.ResG.Edit;
     Case Goods.SelectedField.Index Of
     1:Begin
        IF Frodm.ResGRadif.Value = 0 Then Frodm.ResGRadif.Value :=Radif;
        Frodm.ResGDat.Value :=Frodm.ResDat.Value;
        Frodm.ResGNo.Value:=Frodm.ResNo.Value;
        Frodm.ResGDelikod.Value:=False;
        Frodm.ResGAnbkod.Value:=Frodm.ResRefNo.Value;
        Frodm.ResG.Post;
       End;
     2:If Goods.SelectedField.Value > -1 Then
        case sGene Of
          False:Begin
             If Goods.Columns[1].ReadOnly Then Exit;
             If Frodm.ResGNam.IsNull Then
              Frodm.ResGNam.Value :=GoodNam(Goods.SelectedField.Value)
             Else
              GList.Items.Assign(Kala);
             DrawList(GList,2);
             GList.ItemIndex:=GList.Items.IndexOf(Frodm.ResGNam.Value);
             If GList.ItemIndex =-1 Then GList.ItemIndex:=0;
            End;
          True:Begin
             If Goods.columns[1].ReadOnly Then Exit;
             If Frodm.ResGNam.IsNull Then
              FillGene(GList.Items,Goods.SelectedField.Value)
             Else
              GList.Items.Assign(Kala);
             DrawList(GList,2);
             GList.ItemIndex:=GList.Items.IndexOf(Frodm.ResGNam.Value);
             If GList.ItemIndex =-1 Then GList.ItemIndex:=0;
            End;
       End;
     6:If Goods.SelectedField.Text = Null Then Goods.SelectedField.Value :=0;
    10:Frodm.ResGPtotal.Value :=Frodm.ResGPfee.Value *Frodm.ResGQuant.Value;
     End;
     If Goods.Columns[0].Field.Value > 0 Then Radif:=Frodm.ResGRadif.Value ;
end;

procedure TFDRes.GoodsEditButtonClick(Sender: TObject);
begin
     If Frodm.Res.State In [dsInsert,dsEdit] Then
     Begin
       Frodm.ResG.Delete;
       Frodm.ResG.Edit;
     End;
end;

procedure TFDRes.GoodsEnter(Sender: TObject);
begin
     If (FroDM.Res.State = dsBrowse) Or (Frodm.ResBKod.Value = True) Then
       Goods.ReadOnly := True Else Goods.ReadOnly :=False;
     Goods.selectedField:=Goods.Columns[0].Field;
end;

procedure TFDRes.GoodsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Not(Frodm.Res.State = dsBrowse) Then Frodm.ResG.Edit;
     If Shift = [ssCtrl]   Then  FPkol.SetFocus;
     If Shift = [ssCtrl]+[ssShift]  Then  FCKod.SetFocus;
     IF ((Key = VK_F4) and Not(Frodm.Res.State = dsBrowse)and
        Not(Goods.Columns[Goods.SelectedIndex-1].ReadOnly ))  Then
      Case Goods.SelectedField.Index Of
      3: DrawList(GList,2);
      4: DrawList(Clist,3);
      5: DrawList(AList,4);
      End;
     If (Goods.SelectedIndex In [0,1,2,3])and(Key=32)and Not(Frodm.Res.State = dsBrowse) Then
      If FindGoods(Frodm.ResG,Frodm.ResNo.AsInteger,Frodm.ResDat.AsInteger,Frodm.ResNam.AsString) Then
       Goods.SelectedField :=Frodm.ResGPfee;
     If (Goods.SelectedIndex In [8,10]) and Not(Frodm.Res.State = dsBrowse) Then
     Case Key Of
       VK_MULTIPLY :Begin
               Frodm.ResG.Post;
               Frodm.ResG.Edit;
               Goods.SelectedField.Value := Goods.SelectedField.Value*1000;
               End;
       VK_DIVIDE   : Begin
               Frodm.ResG.Post;
               Frodm.ResG.Edit;
               Goods.SelectedField.Value := Goods.SelectedField.Value* 100;
               End;
     End;
end;

procedure TFDRes.GoodsKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
       If (Goods.SelectedField.Index = 11) and Not(Frodm.Res.State =dsBrowse) Then
         If (Frodm.ResGPfee.Value = 0 ) Then
          Frodm.ResGPfee.Value:=Frodm.ResGPTotal.Value /Frodm.ResGQuant.Value;
       Key:=#0;
       GridMove(Goods,Frodm.Res,Radif);
     End;
     If Not(Frodm.Res.State = dsBrowse) Then Frodm.ResG.Edit;
end;

procedure TFDRes.GoodsMouseMove(Sender: TObject; Shift: TShiftState; X,
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

procedure TFDRes.GListKeyPress(Sender: TObject; var Key: Char);
Var
S:String;
begin
     If Key=#13 Then
     Begin
     Key:=#0;
     s:=GList.Items.Strings[GList.ItemIndex];
     Case sDP Of
     True:Begin
      Frodm.ResG.Edit;
      Frodm.ResGNam.Value :=Decode(s);
      Frodm.ResGColor.Value :=Decode(s);
      Frodm.ResGAnbNam.Value :=Decode(s);
      Frodm.ResGAnbKod.Value :=StrToInt(Decode(s));
      Frodm.ResGQuant.Value :=StrToFloat(Decode(s));
      MaxQuant:=Frodm.ResGQuant.Value;
      Frodm.ResGkod.Value :=GoodKod(Frodm.ResGNam.Value);
      Frodm.ResGPfee.Value :=GoodSoldPrice(Frodm.ResGkod.Value);
      Frodm.ResGNo.Value:=Frodm.ResNo.Value;
      Frodm.ResG.Post;
      Goods.SetFocus;
      Goods.SelectedField :=Goods.Columns[5].Field;
      GList.Visible :=False;
      Bexit.Cancel :=True;
     End;
     False:Begin
      Frodm.ResG.Edit;
      uGood.Name:=S;
      Frodm.ResGNam.Value :=s;
      Frodm.ResGkod.Value :=uGood.Code;// GoodKod(Frodm.ResGNam.Value);
      Frodm.ResGPfee.Value :=uGood.SoldPrice;// GoodSoldPrice(Frodm.ResGkod.Value);
      Frodm.ResGNo.Value:=Frodm.ResNo.Value;
      If uGood.IsService Then Frodm.ResGQuant.Value:=1;
      Frodm.ResG.Post;
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

procedure TFDRes.FNoExit(Sender: TObject);
begin
     If Frodm.Res.State In [dsEdit,dsInsert] Then
     Begin
       Fno.Text:=IntToStr(Frodm.ResNo.Value);
       Exit;
     End;
     NewNo:=StrToInt(FNo.Text);
     FacNo:=FNo.Text;
     If Not(Frodm.Res.Locate('No',NewNo,[loCaseInsensitive])) Then BNewClick(Sender) Else
     Begin
      GoodFilter(Frodm.ResNo.AsInteger);//1381-08-29
      FacNo:=FNo.Text;
      BNo:=Frodm.ResBno.Value;
      BDat:=Frodm.ResDat.Value;
     End;
end;

procedure TFDRes.GListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key = 27 Then
     Begin
       Goods.SetFocus;
       Frodm.ResG.Delete;
       Frodm.ResG.Append;
       Goods.SelectedField :=Frodm.ResGRadif;
       GList.Visible :=False;
       Bexit.Cancel :=True;
     End;
end;

procedure TFDRes.GListDblClick(Sender: TObject);
Var
Key:Char;
begin
     Key:=#13;
     GListKeyPress(Sender,Key);
end;

procedure TFDRes.FNamDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
     Accept:=(Source Is TXPListBox) And ((Source As TXPListBox).Name = 'lbName')
end;

procedure TFDRes.FNamDragDrop(Sender, Source: TObject; X, Y: Integer);
Var
List:TXPListBox;
begin
     If Not(Frodm.Res.State = dsBrowse)and (Source Is TXPListBox) Then
     Begin
       List:=(Source As TXPListBox);
       Frodm.ResNam.Value:=List.Items.Strings[List.ItemIndex];
       FAcSearch.Close;
       FNam.SetFocus;
     End;
end;

procedure TFDRes.GoodsDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
     Accept:=(Source Is TXPListBox) And ((Source As TXPListBox).Name = 'lbGName');
     Accept:=Accept and (SGene = False);
end;

procedure TFDRes.GoodsDragDrop(Sender, Source: TObject; X, Y: Integer);
Var
List:TXPListBox;
Key:Char;
begin
     If Not(Frodm.Res.State = dsBrowse)and (Source Is TXPListBox) Then
     Begin
       List:=(Source As TXPListBox);
       If Frodm.ResGNam.Value = '' Then Frodm.ResG.Edit Else
        Frodm.ResG.Append;
       Frodm.ResGRadif.Value:=Frodm.ResG.RecordCount+1;
       Frodm.ResGKod.Value:=StrToInt(List.Hint);
       FGSearch.Close;
       //FillGList(Frodm.ResGKod.Value);
       If GList.Items.Count = 1 Then
       Begin
        GList.ItemIndex :=0;
        Key:=#13;
        GListKeyPress(Sender,Key);
       End;
     End;
end;

procedure TFDRes.GoodsDblClick(Sender: TObject);
begin
     If Not(Frodm.Res.State = dsBrowse) Then
      CreatingForm(TFGSearch,'FGSearch',FGSearch);
end;

procedure TFDRes.Dat1Enter(Sender: TObject);
begin
     If Frodm.Res.State = dsBrowse Then Dat1.ReadOnly :=True Else
     Begin
        Dat1.ReadOnly :=False;
        GetMaskText(Dat1);
     End;
end;

procedure TFDRes.Dat1Exit(Sender: TObject);
begin
     If (Frodm.Res.State = dsBrowse) Then Exit;
     SetMaskText(Dat1);
     If(Not Date_Check(Dat1.Text))And(DateToInt(Dat1.Text)>0) Then Dat1.SetFocus Else
       Frodm.ResDat.Value :=DateToInt(Dat1.Text);
end;

procedure TFDRes.FNamKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetAccountDbCombo(Sender,Key,'',0);
end;


procedure TFDRes.CListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If (Key = 27) Then
     Begin
       Goods.SetFocus;
       Goods.SelectedField :=Frodm.ResGColor;
       CList.Visible :=False;
       Bexit.Cancel :=True;
     End;
end;

procedure TFDRes.CListKeyPress(Sender: TObject; var Key: Char);
begin
     If Key =#13 Then
     Begin
       Frodm.ResG.Edit;
       Frodm.ResGColor.Value:=CList.Items.Strings[CList.ItemIndex];
       Goods.SetFocus;
       Goods.SelectedField :=Frodm.ResGColor;
       CList.Visible :=False;
       Bexit.Cancel :=True;
     End;
end;

procedure TFDRes.AListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If (Key = 27) Then
     Begin
       Goods.SetFocus;
       Goods.SelectedField :=Frodm.ResGAnbNam;
       AList.Visible :=False;
       Bexit.Cancel :=True;
     End;
end;

procedure TFDRes.AListKeyPress(Sender: TObject; var Key: Char);
begin
     If Key =#13 Then
     Begin
       Frodm.ResG.Edit;
       Frodm.ResGAnbNam.Value:=AList.Items.Strings[AList.ItemIndex];
       Goods.SetFocus;
       Goods.SelectedField :=Frodm.ResGQuant;
       AList.Visible :=False;
       Bexit.Cancel :=True;
     End;
end;

procedure TFDRes.FPkolEnter(Sender: TObject);
begin
      Sum_SingleCurr;
end;


procedure TFDRes.FCKodKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetCentLookup(Sender,Key);
end;

end.
