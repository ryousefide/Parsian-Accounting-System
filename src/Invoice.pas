unit Invoice;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Db, DBTables, ComCtrls, ExtCtrls,
  Grids, DBGrids, DBCGrids, Menus, Buttons, PopupListBox, ppDB, ppDBPipe,
  ppDBBDE, ppEndUsr, ppBands, ppClass, ppCtrls, ppPrnabl, ppCache, ppComm,
  ppRelatv, ppProd, ppReport, ppParameter, ppModule, raCodMod, daDataModule,
  ppStrtch, ppMemo;

type
  TFInvoice = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label12: TLabel;
    Label19: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    FPkol: TDBEdit;
    FPdis: TDBEdit;
    Goods: TDBGrid;
    FNam: TDBComboBox;
    Ftel: TDBEdit;
    FAdd: TDBEdit;
    FPnet: TDBEdit;
    FPpay: TDBEdit;
    FPrem: TDBEdit;
    FNo: TEdit;
    GList: TPopupListBox;
    FPINo: TEdit;
    Panel1: TPanel;
    Bdel: TBitBtn;
    Bprev: TBitBtn;
    Bsave: TBitBtn;
    Bnext: TBitBtn;
    Bexit: TBitBtn;
    Bprint: TBitBtn;
    Label11: TLabel;
    FEco: TDBComboBox;
    dblVisit: TDBLookupComboBox;
    Label13: TLabel;
    Bedit: TBitBtn;
    EdQu: TQuery;
    Sb1: TStatusBar;
    Dat1: TMaskEdit;
    Label14: TLabel;
    FPrule: TDBComboBox;
    AList: TPopupListBox;
    CList: TPopupListBox;
    Label15: TLabel;
    Label16: TLabel;
    FCost: TDBComboBox;
    FCKod: TDBLookupComboBox;
    Deli: TDBCheckBox;
    cbPrint: TCheckBox;
    BHav: TBitBtn;
    Label8: TLabel;
    FPtax: TDBEdit;
    ppInvRep: TppReport;
    ppParameterList1: TppParameterList;
    ppHeaderBand1: TppHeaderBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppLabel1: TppLabel;
    ppDBText16: TppDBText;
    ppDetailBand1: TppDetailBand;
    ppDBText6: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppMemo1: TppMemo;
    ppLabel2: TppLabel;
    procedure GoodsColExit(Sender: TObject);
    procedure BprevClick(Sender: TObject);
    procedure BsaveClick(Sender: TObject);
    procedure BnextClick(Sender: TObject);
    procedure BnewClick(Sender: TObject);
    procedure BexitClick(Sender: TObject);
    procedure FNamExit(Sender: TObject);
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
    procedure FPnetEnter(Sender: TObject);
    procedure FPINoKeyPress(Sender: TObject; var Key: Char);
    procedure FormDestroy(Sender: TObject);
    procedure GoodsColEnter(Sender: TObject);
    procedure BdelClick(Sender: TObject);
    Procedure NexTab(Sender:TObject;Var Key :Char);
    procedure FNoChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dblVisitEnter(Sender: TObject);
    procedure FPdisEnter(Sender: TObject);
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
    procedure FPpayEnter(Sender: TObject);
    procedure FPkolEnter(Sender: TObject);
    procedure FCKodKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GoodsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BHavClick(Sender: TObject);
    procedure FPtaxEnter(Sender: TObject);

  private
    { Private declarations }
    BesKod,BehKod:Real;
    Radif:Integer;
    State:Boolean;
    Str:String;
    Price:Currency;
    MaxQuant:Real;
    TCredit:Integer;
    PCredit:Currency;
    Disc:Currency;
    Permit:Boolean;
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
    Rate:Currency;
    MultiCurr:Boolean;
    procedure Find_CustomerKod;
    Function Decode(Var S:String):String;
    Function Encode:String;
    Procedure FillGList(GoodKod:Integer);
    Procedure DrawList(List:TPopupListBox;Index:Integer);
    Procedure ColumnEnable;
    Procedure Good_Del;
    Procedure UnDepot;
    Procedure Depot;
    Function Check_Fac:Boolean;
    Function Candelete:Boolean;
    Procedure FillFromPI(Sender:TObject;PINo:Integer);
    //Procedure FillFromHAV(Sender:TObject;PINo:Integer);
    Procedure Close_Bill_Single;
    Procedure Close_Bill_Multi;
    Procedure Close_Bill;
    Procedure SetImage;
    Procedure CancelEdit;
    Procedure GoodFilter(FacNo:Integer);

    Procedure Sum_SingleCurr;
    Procedure Sum_MultiCurr;

    Procedure Invoice_Print_Goods;
    Procedure Invoice_Print_Service;

    Function IsDoubleChose(iBId:Integer):Boolean;
    Function Hashavaleh(InvNo:Integer):Boolean;
    Function GetOutlay(InvNo,Gkod:Integer;Color:String):Real;
  public
    { Public declarations }
    Function IsMultiCurrency:Boolean;
    Function IsServiceOnly:Boolean;
  end;

var
  FInvoice: TFInvoice;

implementation

uses FrooshDM, FactorRep,Routins, ProVar, MainForm, AcSearch,
  GSearch, Converts, XPListBox, CRoutins, FactorRep2,DHav;// InvoBill,

{$R *.DFM}
Const
Tip='›«ﬂ Ê— ›—Ê‘';
FTip=1;

Procedure TFInvoice.NexTab(Sender:TObject;Var Key :Char);
begin
     If Key = #13 Then
     Begin
       Key:=#0;
       SelectNext(Sender As TWinControl,True,True);
     End;
end;
//Procedure For Find Customers Kod If There is
procedure TFInvoice.Find_CustomerKod;
Var
Dat:Integer;
begin
     Str:=Frodm.InvoNam.Value;
     CustomerKod:=AccKod(Str);
     Frodm.AcKod.IndexFieldNames :='Nam';
     If Frodm.AcKod.FindKey([Str]) Then
     Begin
       If Frodm.AcKodUseKod.Value = 0 Then
       Begin
        ShowMessage('Õ”«» ⁄„·Ì« Ì ‰Ì” ');
        FNam.SetFocus;
        Exit;
       End;
       PCredit:=Frodm.AcKodPcred.Value;
       CustomerKod:=Frodm.AcKodAcckod.Value;
       If Frodm.Invo.State In[dsInsert,dsEdit] Then
       Begin
         Frodm.InvoTel.Value :=Frodm.AcKodTel.Value;
         Frodm.InvoAdd.Value :=Frodm.AcKodAdd.Value;
       End;
       If sFrem Then
       Begin
        Price:= AcRemain(CustomerKod,Dat,Frodm.InvoCkod.AsString,Frodm.InvoCost.AsString);
        If Dat = 0 Then Dat:=Fardate;
        Permit:=Credit(Price,PCredit);
        Sb1.Panels[0].Text :=CurrToFar(Price);
       End Else
        Permit:=True;
       Sb1.Panels[2].Text :='Œ—Ìœ«— À«» ';
       Sb1.Panels[1].Text := AccString(CustomerKod);
     End Else
     Begin
       Frodm.AutoBill.FindKey (['NF']);
       BehKod:=Frodm.AutoBillBehKod.Value;
       Str:=AccNam(BehKod);
       If Frodm.AcKod.FindKey([Str]) Then
       Begin
         PCredit:=Frodm.AcKodPcred.Value;
         If sFrem Then
         Begin
          Price:= AcRemain(BehKod,Dat,Frodm.InvoCkod.AsString,Frodm.InvoCost.AsString);
          If Dat = 0 Then Dat:=Fardate;
          Permit:=Credit(Price,Pcredit);
          Sb1.Panels[0].Text :=CurrToFar(Price);
         End Else
          Permit:=True;
         Sb1.Panels[1].Text:=AccString(BehKod);
         Sb1.Panels[2].Text :='Œ—Ìœ«— „ ›—ﬁÂ';
       End;
     End;
end;

Function TFInvoice.Decode(Var S:String):String;
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

Function TFInvoice.Encode:String;
begin
     Result:=Frodm.DepotNam.Value +'-'+Frodm.DepotColor.Value +'-'+
     Frodm.DepotAnbNam.Value+'-'+FloatToStr(Frodm.DepotQuant.Value);
end;

Procedure TFInvoice.FillGList(GoodKod:Integer);
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
       ShowMessage('„ÊÃÊœÌ ‰œ«—œ');
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

procedure TFInvoice.DrawList(List: TPopupListBox; Index: Integer);
begin
     If List.Items.Count = 0 Then Exit;
     List.Visible :=True;
     Bexit.Cancel :=False;
     List.SetFocus;
     List.ItemIndex:=-1;
     List.ItemIndex:=List.Items.IndexOf(Goods.Columns[Index].Field.AsString);
     If List.ItemIndex = -1 Then  List.ItemIndex :=0;
end;

Procedure TFInvoice.ColumnEnable;
begin
     If (Frodm.InvoGoodKod.Value > 0) And (Frodm.InvoGoodQuant.Value > 0) Then
       Goods.Columns[1].ReadOnly :=True
     Else
       Goods.Columns[1].ReadOnly :=False;
end;

Procedure TFInvoice.Good_Del;
Var
I:Integer;
begin
     Frodm.InvoGood.First;
     For I:= 1 To Frodm.InvoGood.RecordCount Do
     Begin
      IF Frodm.InvoGoodDelikod.Value Then Frodm.InvoGood.Delete;
      If Frodm.InvoGood.Eof Then Exit;
      Frodm.InvoGood.Next;
     End;
     Frodm.InvoGood.First;
end;

Procedure TFInvoice.UnDepot;
Var
I:Integer;
Gs:Boolean;
begin
     Exit;
     Frodm.InvoGood.First;
     For I:= 1 To Frodm.InvoGood.RecordCount Do
     Begin
      Gs:=GoodState(Frodm.InvoGoodKod.Value);
      IF Not Gs Then
      DepotChange(Frodm.InvoGoodKod.Value,0,
                  Frodm.InvoGoodColor.Value,Frodm.InvoGoodAnbNam.Value,
                  Frodm.InvoGoodQuant.Value,dpIn);
      Frodm.Invogood.Next;
     End;
     Cardex_Del(FNo.Text,Tip);
end;

Procedure TFInvoice.Depot;
Var
I:Integer;
GS:Boolean;
begin
     Exit;
     For I:=1 To Frodm.InvoGood.RecordCount Do
     Begin
       Frodm.InvoGood.Edit;
       Frodm.InvoGoodRadif.Value:=I;
       Frodm.InvoGoodNo.Value:=Frodm.InvoNo.Value;
       Frodm.InvoGoodDat.Value:=Frodm.InvoDat.Value;
       Frodm.InvoGood.Post;
       Gs:=GoodState(Frodm.InvoGoodKod.Value);
       If DepotCheck(Frodm.InvoGoodKod.Value,0,Frodm.InvoGoodColor.Value,
       Frodm.InvoGoodAnbNam.Value,Frodm.InvoGoodQuant.Value) Or GS Then
       Begin
        Auto_GCardex(Frodm.InvoGoodNam.Value,Frodm.InvoGoodColor.Value,
                     Frodm.InvoGoodAnbNam.Value,Frodm.InvoGoodKod.Value,
                     Frodm.InvoGoodRadif.Value,Frodm.InvoGoodQuant.Value,
                     dpOut,Frodm.InvoNo.Value,Frodm.InvoDat.Value,Tip,
                     FNam.Text,Frodm.InvoGoodOPfee.Value,Frodm.InvoGoodPerc.Value);
        If Not GS Then
         DepotChange(Frodm.InvoGoodKod.Value,0,Frodm.InvoGoodColor.Value,
          Frodm.InvoGoodAnbNam.Value,Frodm.InvoGoodQuant.Value,dpOut);
       End Else
       Begin
        FRodm.InvoGood.Edit;
        Frodm.InvoGoodDelikod.Value:=True;
        Frodm.InvoGood.Post;
       End;
       Frodm.InvoGood.Next;
     End;
     Good_Del;
end;

Function TFInvoice.Check_Fac:Boolean;
Var
I:Integer;
Gs:Boolean;
begin
     Result:=True;
     Exit;
     If Frodm.Invo.State = dsBrowse Then Exit;
     If Not sDp Then Exit;
     Frodm.InvoGood.First;
     For I:=1 To Frodm.InvoGood.RecordCount Do
     Begin
       Gs:=GoodState(Frodm.InvoGoodKod.Value);
       If Not Gs Then
       Begin
         Result:=DepotCheck(Frodm.InvoGoodKod.Value,0,Frodm.InvoGoodColor.Value,
         Frodm.InvoGoodAnbNam.Value,Frodm.InvoGoodQuant.Value);
         MoFlag:=Result;
         If Not Result Then
         Begin
           BSave.Enabled:=True;
           ShowMessage( '⁄‹‹‹œ„ „ÊÃÊœÌ ﬂ«›Ì');
           Exit;
         End;
       End;
       Frodm.InvoGood.Next;
     End;
     Frodm.InvoGood.First;
end;

Function TFInvoice.Candelete:Boolean;
Var
I:Integer;
begin
     Result:=True;
     Frodm.InvoGood.First;
     For I:=1 to Frodm.InvoGood.RecordCount Do
     Begin
      If Frodm.InvoGoodQout.AsFloat > 0 Then
      Begin
       Result:=False;
       Exit;
      End;
      Frodm.InvoGood.Next;
     End;
end;

{Procedure TFInvoice.FillFromHAV(Sender:TObject;PINo:Integer);
Var
I:Integer;
begin
     IF PINo = 0 Then Exit;
     IF Frodm.Invo.State = dsBrowse Then Exit;
     IF Frodm.InvoGood.RecordCount > 0 Then Exit;
//     Frodm.PInvo.FindKey([PINo]);
     Frodm.Hav.Locate('No',PINo,[loCaseInsensitive]);
     Frodm.InvoNam.Value :=Frodm.HavNam.Value;
     Frodm.InvoCost.Value :=Frodm.Havcost.Value;
     Frodm.InvoCent.Value :=Frodm.HavCent.Value;
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Kod,Nam,Color,Radif,AnbNam,AnbKod,Quant,Pfee,Perc,Ptotal');
     Qu.SQL.Add('From PinvoGood P Where P.No = '+IntToStr(PINo));
     Qu.Open;
     Qu.First;
     For I:=1 To Qu.RecordCount Do
     Begin
       Frodm.InvoGood.Append;
       Frodm.InvoGoodNo.Value:=Frodm.InvoNo.Value;
       Frodm.InvoGoodkod.Value :=Qu.Fields[0].AsInteger;
       Frodm.InvoGoodNam.Value :=Qu.Fields[1].AsString;
       Frodm.InvoGoodDat.Value :=FRodm.InvoDat.Value;
       Frodm.InvoGoodColor.Value :=Qu.Fields[2].AsString;
       Frodm.InvoGoodRadif.Value :=Qu.Fields[3].AsInteger;
       Frodm.InvoGoodAnbNam.Value:=Qu.Fields[4].AsString;
       Frodm.InvoGoodAnbKod.Value :=Qu.Fields[5].AsInteger;
       Frodm.InvoGoodQuant.Value :=Qu.Fields[6].AsFloat;
       Frodm.InvoGoodPfee.Value :=Qu.Fields[7].AsCurrency;
       Frodm.InvoGoodPerc.Value :=Qu.Fields[8].AsFloat;
       Frodm.InvoGoodPtotal.Value :=Qu.Fields[9].AsCurrency;
       Frodm.InvoGood.Post;
       Qu.Next;
     End;
     Qu.Close;
     FNamExit(Sender);
     Goods.SetFocus;
     Frodm.InvoGood.First;
     Frodm.InvoGood.Edit;
end;  }

Procedure TFInvoice.FillFromPI(Sender:TObject;PINo:Integer);
Var
I:Integer;
begin
     IF PINo = 0 Then Exit;
     IF Frodm.Invo.State = dsBrowse Then Exit;
     IF Frodm.InvoGood.RecordCount > 0 Then Exit;
     Frodm.PInvo.Open;
     Frodm.PInvo.Locate('No',PINo,[loCaseInsensitive]);
     Frodm.InvoNam.Value :=Frodm.PInvoNam.Value;
     Frodm.InvoTel.Value :=Frodm.PInvoTel.Value;
     Frodm.InvoAdd.Value :=Frodm.PInvoAdd.Value;
     Frodm.InvoPkol.Value:=Frodm.PInvoPkol.Value;
     Frodm.InvoPdis.Value :=Frodm.PInvoPdis.Value;
     Frodm.InvoPnet.Value :=Frodm.PInvoPnet.Value;
     Frodm.InvoEco.Value:=Frodm.PInvoEco.Value;
     Frodm.InvoVisit.Value:=Frodm.PInvoVisit.Value;
     Frodm.PInvo.Close;
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Kod,Nam,Color,Radif,AnbNam,AnbKod,Quant,Pfee,Perc,Ptotal');
     Qu.SQL.Add('From PinvoGood P Where P.No = '+IntToStr(PINo));
     Qu.Open;
     Qu.First;
     For I:=1 To Qu.RecordCount Do
     Begin
       Frodm.InvoGood.Append;
       Frodm.InvoGoodNo.Value:=Frodm.InvoNo.Value;
       Frodm.InvoGoodkod.Value :=Qu.Fields[0].AsInteger;
       Frodm.InvoGoodNam.Value :=Qu.Fields[1].AsString;
       Frodm.InvoGoodDat.Value :=FRodm.InvoDat.Value;
       Frodm.InvoGoodColor.Value :=Qu.Fields[2].AsString;
       Frodm.InvoGoodRadif.Value :=Qu.Fields[3].AsInteger;
       Frodm.InvoGoodAnbNam.Value:=Qu.Fields[4].AsString;
       Frodm.InvoGoodAnbKod.Value :=Qu.Fields[5].AsInteger;
       Frodm.InvoGoodQuant.Value :=Qu.Fields[6].AsFloat;
       Frodm.InvoGoodPfee.Value :=Qu.Fields[7].AsCurrency;
       Frodm.InvoGoodPerc.Value :=Qu.Fields[8].AsFloat;
       Frodm.InvoGoodPtotal.Value :=Qu.Fields[9].AsCurrency;
       Frodm.InvoGood.Post;
       Qu.Next;
     End;
     Qu.Close;
     FNamExit(Sender);
     Goods.SetFocus;
     Frodm.InvoGood.First;
     Frodm.InvoGood.Edit;
end;

Procedure TFInvoice.Close_Bill_Single;
Var
Sum:Currency;
Begin
     BDat:=Frodm.InvoDat.Value;
     Rate:=Frodm.InvoPpay.Value;// GetRateatDate(Frodm.InvoEco.AsString,Frodm.InvoDat.AsInteger);
     Sum:=FroDM.InvoPkol.AsCurrency*Rate;
     Update_FtipCode(Frodm.InvoPRule.Value);
       Frodm.AutoBill.FindKey(['JK']);
       State:=Frodm.AutoBillStat.Value;
       BehKod:=Frodm.AutoBillBehKod.Value;
       Beskod:=Frodm.AutoBillBesKod.Value;
       If FtipCode.Beskod > 0 Then BesKod:=FtipCode.Beskod;
       NewBNo:=AutoBill(State,BesKod,BehKod,Sum,'œ—¬„œ ›«ﬂ Ê—'+FNo.Text,
         FacNo,BNo,FTip,BDat,Frodm.InvoCost.AsString,Frodm.InvoCkod.AsInteger,
         FroDM.InvoPkol.AsCurrency,Rate,Frodm.InvoEco.AsString);
//---------------------------------------
     Str:=' Œ›Ì› ›«ﬂ Ê— '+FNo.Text;
     Price:=FroDM.InvoPdis.AsCurrency*Rate;
       Frodm.AutoBill.FindKey(['DF']);
       State:=Frodm.AutoBillStat.Value;
       BesKod:=Frodm.AutoBillBesKod.Value;
       BehKod:=Frodm.AutoBillBehKod.Value;
       If FtipCode.Behkod > 0 Then BehKod:=FtipCode.Behkod;
       NewBNo:=Autobill(State,BesKod,BehKod,Price,Str,FacNo,BNo,FTip,BDat,
        Frodm.InvoCost.AsString,Frodm.InvoCkod.AsInteger,FroDM.InvoPdis.AsCurrency,
        Rate,Frodm.InvoEco.AsString);
//----------------------------------

     Str:='⁄Ê«—÷ ›«ﬂ Ê— '+FNo.Text;
     Price:=FroDM.InvoPtax.AsCurrency*Rate;
     If CustomerKod > 0 Then
     Begin
      Frodm.AutoBill.FindKey(['CF2']);
      State:=Frodm.AutoBillStat.Value;
      BesKod:=Frodm.AutoBillBesKod.Value;
      BehKod:=Frodm.AutoBillBehKod.Value;
      NewBNo:=Autobill(State,BesKod,BehKod,Price,Str,FacNo,BNo,FTip,BDat,
      Frodm.InvoCost.AsString,Frodm.InvoCkod.AsInteger,FroDM.InvoPtax.AsCurrency,
      Rate,Frodm.InvoEco.AsString);
     End Else
       NewBNo:=AutoMation(Str,0,Price,'CF2',FacNo,BNo,FTip,BDat,
       Frodm.InvoCost.AsString,Frodm.InvoCkod.AsInteger,FroDM.InvoPtax.AsCurrency,
       Rate,Frodm.InvoEco.AsString);
//----------------------------------

     Str:='ﬁ«»· Å—œ«Œ  ›«ﬂ Ê— '+FNo.Text;
     Price:=FroDM.InvoPnet.AsCurrency*Rate;
     If CustomerKod > 0 Then
     Begin
       Frodm.AutoBill.FindKey(['NF']);
       State:=Frodm.AutoBillStat.Value;
       BesKod:=Frodm.AutoBillBesKod.Value;
       BehKod:=CustomerKod;
       NewBNo:=AutoBill(State,BesKod,BehKod,Price,Str,FacNo,BNo,FTip,BDat,
       Frodm.InvoCost.AsString,Frodm.InvoCkod.AsInteger,FroDM.InvoPnet.AsCurrency,
        Rate,Frodm.InvoEco.AsString);
     End Else
       NewBNo:=AutoMation(Str,0,Price,'NF',FacNo,BNo,FTip,BDat,
       Frodm.InvoCost.AsString,Frodm.InvoCkod.AsInteger,FroDM.InvoPnet.AsCurrency,
       Rate,Frodm.InvoEco.AsString);
//-----------------------


     If NewBNo = BNo Then BillUpdate(BNo) Else
      If sBill  Then MakeBill('”‰œ ›—Ê‘ »Â '+'  '+FNam.Text+
      ' ÿÌ ›«ﬂ Ê— ›—Ê‘ ‘„«—Â'+FNo.Text);
     BNo:=NewBNo;
     Bprint.Enabled:=True;
end;

procedure TFInvoice.Close_Bill_Multi;
Var
Sum:Currency;
CTip:String;
Begin
     BDat:=Frodm.InvoDat.Value;
     Rate:=1;
     Sum:=FroDM.InvoPkol.AsCurrency*Rate;
     CTip:=DefaultCurr;
     Update_FtipCode(Frodm.InvoPRule.Value);
       Frodm.AutoBill.FindKey(['JK']);
       State:=Frodm.AutoBillStat.Value;
       BehKod:=Frodm.AutoBillBehKod.Value;
       Beskod:=Frodm.AutoBillBesKod.Value;
       If FtipCode.Beskod > 0 Then BesKod:=FtipCode.Beskod;
       NewBNo:=AutoBill(State,BesKod,BehKod,Sum,'œ—¬„œ ›«ﬂ Ê—'+FNo.Text,
        FacNo,BNo,FTip,BDat,Frodm.InvoCost.AsString,Frodm.InvoCkod.AsInteger,
        FroDM.InvoPkol.AsCurrency,Rate,CTip);
//----------------------------------

     Str:=' Œ›Ì› ›«ﬂ Ê— '+FNo.Text;
     Price:=FroDM.InvoPdis.AsCurrency*Rate;
       Frodm.AutoBill.FindKey(['DF']);
       State:=Frodm.AutoBillStat.Value;
       BesKod:=Frodm.AutoBillBesKod.Value;
       BehKod:=Frodm.AutoBillBehKod.Value;
       If FtipCode.Behkod > 0 Then BehKod:=FtipCode.Behkod;
       NewBNo:=Autobill(State,BesKod,BehKod,Price,Str,FacNo,BNo,FTip,BDat,
        Frodm.InvoCost.AsString,Frodm.InvoCkod.AsInteger,FroDM.InvoPdis.AsCurrency,
        Rate,CTip);
//----------------------------------

     Str:='⁄Ê«—÷ ›«ﬂ Ê— '+FNo.Text;
     Price:=FroDM.InvoPtax.AsCurrency*Rate;
     If CustomerKod > 0 Then
     Begin
      Frodm.AutoBill.FindKey(['CF2']);
      State:=Frodm.AutoBillStat.Value;
      BesKod:=Frodm.AutoBillBesKod.Value;
      BehKod:=Frodm.AutoBillBehKod.Value;
      NewBNo:=Autobill(State,BesKod,BehKod,Price,Str,FacNo,BNo,FTip,BDat,
      Frodm.InvoCost.AsString,Frodm.InvoCkod.AsInteger,FroDM.InvoPtax.AsCurrency,
      Rate,CTip);
     End Else
       NewBNo:=AutoMation(Str,0,Price,'CF2',FacNo,BNo,FTip,BDat,
       Frodm.InvoCost.AsString,Frodm.InvoCkod.AsInteger,FroDM.InvoPtax.AsCurrency,
       Rate,CTip);
//----------------------------------

     Str:='ﬁ«»· Å—œ«Œ  ›«ﬂ Ê— '+FNo.Text;
     Price:=FroDM.InvoPnet.AsCurrency*Rate;
     If CustomerKod > 0 Then
     Begin
       Frodm.AutoBill.FindKey(['NF']);
       State:=Frodm.AutoBillStat.Value;
       BesKod:=Frodm.AutoBillBesKod.Value;
       BehKod:=CustomerKod;
       NewBNo:=AutoBill(State,BesKod,BehKod,Price,Str,FacNo,BNo,FTip,BDat,
       Frodm.InvoCost.AsString,Frodm.InvoCkod.AsInteger,FroDM.InvoPnet.AsCurrency,
        Rate,CTip);
     End Else
       NewBNo:=AutoMation(Str,0,Price,'NF',FacNo,BNo,FTip,BDat,
       Frodm.InvoCost.AsString,Frodm.InvoCkod.AsInteger,FroDM.InvoPnet.AsCurrency,
       Rate,CTip);
//-----------------------

     If NewBNo = BNo Then BillUpdate(BNo) Else
      If sBill  Then MakeBill('”‰œ œ—¬„‹‹‹œ «“ '+'  '+FNam.Text+
      ' ÿÌ ›«ﬂ Ê—  ‘„«—Â'+FNo.Text);
     BNo:=NewBNo;
     Bprint.Enabled:=True;
end;

procedure TFInvoice.Close_Bill;
begin
     If MultiCurr Then
      Close_Bill_Multi
     Else
      Close_Bill_Single;
end;


Procedure TFInvoice.SetImage;
begin
     Main.glKey.GetBitmap(0,BPrev.Glyph);
     Main.glKey.GetBitmap(1,Bnext.Glyph);
     Main.glKey.GetBitmap(2,BPrint.Glyph);
     Main.glKey.GetBitmap(3,Bedit.Glyph);
     Main.glKey.GetBitmap(4,Bsave.Glyph);
     Main.glKey.GetBitmap(5,Bdel.Glyph);
     Main.glKey.GetBitmap(7,BExit.Glyph);
end;

Procedure TFInvoice.CancelEdit;
Var
I,J:Integer;
begin
     If (Not EdQu.Active)or(EdQu.RecordCount =0) Then Exit;
     GoodFilter(Frodm.InvoNo.AsInteger);
     Frodm.InvoGood.First;
     For I:=1 To Frodm.InvoGood.RecordCount Do Frodm.InvoGood.Delete;
     EdQu.First;
     For I:=1 To EdQu.RecordCount Do
     Begin
       Frodm.InvoGood.Append;
       For J:=1 To 20 Do
         Frodm.InvoGood.Fields[J].Value:=EdQu.Fields[J].Value;
       Frodm.InvoGood.Post;
       EdQu.Next;
     End;
     EdQu.Close;
     Frodm.Invo.Cancel;
     Frodm.InvoGood.First;
     MultiCurr:=IsMultiCurrency;
     Close_Bill;
     Depot;
end;

Procedure TFInvoice.GoodFilter(FAcNo:Integer);
begin
     Frodm.InvoGood.Filtered:=False;
     Frodm.InvoGood.Filter:='No = '+IntToStr(FacNo);
     Frodm.InvoGood.Filtered:=True;
     Dat1.Text:=IntToDate(Frodm.InvoDat.Value)
End;

Function TFInvoice.IsMultiCurrency:Boolean;
Begin
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Garan from Invogood where No=:n1 Group by Garan');
     Qu.Params[0].Value:=Frodm.InvoNo.Value;
     Qu.Open;
     Result:=Qu.RecordCount >1;
     Qu.Close;
end;

Function TFInvoice.IsServiceOnly:Boolean;
begin
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Kod from Invogood where No=:n1 ');
     Qu.SQL.Add(' and Kod in (Select Kod from Goods where FDP=0)');
     Qu.Params[0].Value:=Frodm.InvoNo.Value;
     Qu.Open;
     Result:=Qu.RecordCount =0;
     Qu.Close;
end;

procedure TFInvoice.Sum_singleCurr;
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
     If FroDM.Invo.State = dsBrowse Then Exit ;
     FroDM.InvoGood.First;
     Sum:=0;Nsum:=0;OSum:=0;mSum:=0;
     For I:=1 to FroDM.InvoGood.RecordCount Do
     Begin
      Sum:=Sum+FroDM.InvoGoodPfee.Value * Frodm.InvoGoodQuant.Value;
      Nsum:=Nsum+FroDM.InvoGoodPtotal.Value;
      OSum:=OSum+Frodm.InvoGoodOPSum.AsCurrency;
      mSum:=mSum+FroDM.InvoGoodPtotal.Value*Frodm.InvoGoodAnbkod.Value;
      FroDM.InvoGood.Next;
     End;
     FroDM.InvoPkol.AsCurrency:=Sum;
     Frodm.InvoPnet.AsCurrency:=Nsum;
     Frodm.InvoPcheq.Value:=OSum;
     Frodm.InvoPrem.Value:=mSum;
     Disc:=0;
     If sPerc Then
     Begin
      Disc:=Sum-Nsum;
      Frodm.InvoPdis.AsCurrency:=Disc;
     End;
end;

procedure TFInvoice.Sum_MultiCurr;
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
     If FroDM.Invo.State = dsBrowse Then Exit ;
     FroDM.InvoGood.First;
     Sum:=0;Nsum:=0;OSum:=0;mSum:=0;
     For I:=1 to FroDM.InvoGood.RecordCount Do
     Begin
      Sum:=Sum+FroDM.InvoGoodPfee.Value * Frodm.InvoGoodQuant.Value*Frodm.InvoGoodAnbkod.Value;
      Nsum:=Nsum+FroDM.InvoGoodPtotal.Value;
      OSum:=OSum+Frodm.InvoGoodOPSum.AsCurrency;
      mSum:=mSum+FroDM.InvoGoodPtotal.Value*Frodm.InvoGoodAnbkod.Value;
      FroDM.InvoGood.Next;
     End;
     FroDM.InvoPkol.AsCurrency:=Sum;
     Frodm.InvoPnet.AsCurrency:=mSum;
     Frodm.InvoPcheq.Value:=OSum;
     Frodm.InvoPrem.Value:=mSum;
     Disc:=0;
     If sPerc Then
     Begin
      Disc:=Sum-mSum;
      Frodm.InvoPdis.AsCurrency:=Disc;
     End;
end;

Procedure TFInvoice.Invoice_Print_Goods;
Var
RowCnt:Integer;
FreeP:Real;
LesMar:Real;
CnHeight:Real;
SubH:Real;
BRow:Integer;
begin
     If Not (Frodm.Invo.state = dsBrowse) Then Exit;
     CreatingForm(TFacQr,'FacQr',FacQr);
     Set_Sys_Enviroment;
     CnHeight:=FacQr.QRBand1.Size.Height+FacQr.QRBand2.Size.Height+
     FacQr.QRChildBand2.Size.Height+FacQr.ChildBand3.Size.Height+
     FacQr.ChildBand1.Size.Height+FacQr.PageFooterBand1.Size.Height;
     FacQr.QRSubDetail3.Size.Height:=12;
     SubH:=FacQr.QRSubDetail3.Size.Height;
     FreeP:=(PLength-CnHeight-TopMar-ButMar);
     RowCnt:=Trunc((FreeP/SubH));
     LesMar:=FreeP-RowCnt*SubH;
     If Int(LesMar) = Int(SubH) Then LesMar:=LesMar-1;
     FacQr.ChildBand1.Size.Height:=FacQr.ChildBand1.Size.Height+Int(LesMar);//PageFooterBand1
     BRow:=Frodm.InvoGood.RecordCount Mod RowCnt;
     If BRow > 0 Then
      FacQr.GFB.Size.Height:=(SubH)*(RowCnt-BRow)
     Else
      FacQr.GFB.Size.Height:=0;
//     FacQr.GFB.Size.Height:=(SubH)*(RowCnt-Frodm.InvoGood.RecordCount Mod RowCnt);

//     Freep:=(297-PLength)+(10-TopMar)+(10-ButMar);
//     FacQr.GFB.Size.Height:=FacQr.GFB.Size.Height-Freep;

     FacQr.ReportTitle:='›«ﬂ Ê— ›—Ê‘ ò«·«'+FNo.Text;
     FacQr.qrTit.Caption :=InvoLbl;
     FacQr.QrAdd.Caption:=Master;
     FacQr.PrinterSettings.Copies:=PrnCnt;
     FacQr.qrCom.Caption:=Comm;
     If FCkod.Text <> '' Then
      FacQr.QRLabel3.Caption:=FCkod.Text
     Else
      FacQr.QRLabel3.Caption:=Frodm.InvoNam.AsString;

     FacQr.qrFRem.Caption:=FarsiPrice(Frodm.InvoPNet.Value);
     If CustomerKod > 0 Then FacQr.qrlRem.Caption :=Sb1.Panels[0].Text;
     If Price < 0 Then FacQr2.qrlRem.Caption:=FacQr2.qrlRem.Caption+'   »” «‰ﬂ«—';
     FacQr.qrlRem.Enabled :=sRem;
     If cbPrint.Checked Then FacQr.Print Else FacQr.Preview;
     FacQr.Destroy;
end;

Procedure TFInvoice.Invoice_Print_Service;
Var
RowCnt:Integer;
FreeP:Real;
LesMar:Real;
CnHeight:Real;
SubH:Real;
BRow:Integer;
begin
     If Not (Frodm.Invo.state = dsBrowse) Then Exit;
     CreatingForm(TFacQr2,'FacQr2',FacQr2);
     Set_Sys_Enviroment;
     CnHeight:=FacQr2.QRBand1.Size.Height+FacQr2.QRBand2.Size.Height+
     FacQr2.QRChildBand2.Size.Height+FacQr2.ChildBand3.Size.Height+
     FacQr2.ChildBand1.Size.Height+FacQr2.PageFooterBand1.Size.Height;
     //FacQr.QRSubDetail3.Size.Height:=5.8;
     SubH:=FacQr2.QRSubDetail3.Size.Height;
     FreeP:=(PLength-CnHeight-TopMar-ButMar);
     RowCnt:=Trunc((FreeP/SubH));
     LesMar:=FreeP-RowCnt*SubH;
     If Int(LesMar) = Int(SubH) Then LesMar:=LesMar-1;
     FacQr2.ChildBand1.Size.Height:=FacQr2.ChildBand1.Size.Height+Int(LesMar);//PageFooterBand1
     BRow:=Frodm.InvoGood.RecordCount Mod RowCnt;
     If BRow > 0 Then
      FacQr2.GFB.Size.Height:=(SubH)*(RowCnt-BRow)
     Else
      FacQr2.GFB.Size.Height:=0;
//     FacQr.GFB.Size.Height:=(SubH)*(RowCnt-Frodm.InvoGood.RecordCount Mod RowCnt);
//     Freep:=(297-PLength)+(10-TopMar)+(10-ButMar);
//     FacQr2.GFB.Size.Height:=FacQr2.GFB.Size.Height-Freep;

     FacQr2.ReportTitle:='›«ﬂ Ê— ›—Ê‘ Œœ„« '+FNo.Text;
     FacQr2.qrTit.Caption :=InvoLbl;
     FacQr2.QrAdd.Caption:=Master;
     FacQr2.PrinterSettings.Copies:=PrnCnt;
     FacQr2.qrCom.Caption:=Comm;
     If FCkod.Text = '' Then
      FacQr2.QRLabel3.Caption:=Frodm.InvoNam.AsString
     Else
      FacQr2.QRLabel3.Caption:=FCkod.Text;
     FacQr2.qrFRem.Caption:=FarsiPrice(Frodm.InvoPNet.Value);
     If CustomerKod > 0 Then FacQr2.qrlRem.Caption :=Sb1.Panels[0].Text;
     If Price < 0 Then FacQr2.qrlRem.Caption:=FacQr2.qrlRem.Caption+'   »” «‰ﬂ«—';
     FacQr2.qrlRem.Enabled :=sRem;
     If cbPrint.Checked Then FacQr2.Print Else FacQr2.Preview;
     FacQr2.Destroy;
end;

Function TFInvoice.IsDoubleChose(iBId:Integer):Boolean;
begin
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Count(Kod) From InvoGood G Where G.No=:n and G.Kod=:g ');
     Qu.Params[0].Value:=Frodm.InvoNo.Value;
     Qu.Params[1].Value:=iBId;
     Qu.Open;
     Result:=Qu.Fields[0].AsInteger > 0;
     Qu.Close;
end;

Function TFInvoice.Hashavaleh(InvNo:Integer):Boolean;
begin
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Count(RefNo) From DHav Where RefNo=:R1');
     Qu.Params[0].Value:=InvNo;
     Qu.Open;
     Result:=Qu.Fields[0].AsInteger>0;
     Qu.Close;
end;

Function TFInvoice.GetOutlay(InvNo,Gkod:Integer;Color:String):Real;
begin
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Sum(Quant) From DHavg D Where D.Kod=:R1 and D.Color=:R2 and D.No in ');
     Qu.SQL.Add('(Select No From DHav Where RefNo=:R3)');
     Qu.Params[0].Value:=GKod;
     Qu.Params[1].Value:=Color;
     Qu.Params[2].Value:=InvNo;
     Qu.Open;
     Result:=Qu.Fields[0].AsFloat;
     Qu.Close;
end;
//End Of Private decaleration

procedure TFInvoice.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     Frodm.Invo.Open;
     Frodm.InvoGood.Open;
     EdQu.DataBaseName:=CurrDb;
     ppInvRep.Template.FileName:=RDir+'\Reports\Factor.rtm';
     ppInvRep.Template.LoadFromFile;
     SetImage;
     SetGridWidth(Goods,'Nam',GWidth);
     Fill_Comb(Frodm.FTip,'Des',FPrule.Items);
     FPrule.Items.Add('');
     Deli.Visible :=Boss;
     Bdel.Enabled :=Boss;
     Goods.Columns[4].Visible :=sAKod;
     Goods.Columns[8].Visible :=sPerc;
     Goods.Columns[3].Visible :=sModel;
     Goods.Columns[8].Width:=31;
     Goods.Columns[3].Width:=31;
     Goods.Columns[4].Width:=31;
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Min(I.No),Max(I.No) From Invoice I');
     Qu.Open;
     MinNo:=Qu.Fields[0].AsInteger;
     MaxNo:=Qu.Fields[1].AsInteger;
     Qu.Close;
     Frodm.Invo.Refresh;
     Frodm.Invo.Last;
     NewNo:=MaxNo;
     Find_CustomerKod;
     FNo.Text :=IntToStr(Frodm.InvoNo.Value);
     GoodFilter(Frodm.InvoNo.AsInteger);//1381-08-29
     Radif:=1;
     MoFlag:=True;
     IF sFac Then
      If MaxNo = 0 Then Exit Else BnewClick(Sender);
end;

procedure TFInvoice.FormActivate(Sender: TObject);
begin
     GoodFilter(Frodm.InvoNo.AsInteger);//1381-08-29
     Frodm.InvoGood.Last;//1393
     FNam.Items.Assign(AcList);
     GList.Items.Assign(Kala);
     FEco.Items.Assign(CurrList);
     Goods.Columns[10].PickList.Assign(CurrList);
     FCost.Items.Assign(CostList);
     Fill_Comb(Frodm.Color,'Color',CList.Items);
     Fill_Comb(Frodm.AnbDat,'Nam',AList.Items);
end;

procedure TFInvoice.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key = VK_F3 Then BsaveClick(Sender);
     If Shift = [ssAlt] Then
      Case Key Of
       VK_Left:BprevClick(Sender);
       VK_RIGHT:BnextClick(Sender);
      End;
end;

procedure TFInvoice.FormDestroy(Sender: TObject);
begin
     If Frodm.Invo.State = dsBrowse Then Exit;
     Case New Of
     True  :Begin
             CancelFactor(Frodm.Invo,Frodm.InvoGood);// CancelOnExit(Frodm.InvoGood);
             GoodFilter(Frodm.InvoNo.AsInteger);//1381-08-29
             FNo.Text:=IntToStr(Frodm.InvoNo.Value);
            End;
     False : CancelEdit; //BSaveClick(Sender);
     End;
     BSave.Enabled:=False;
     BEdit.Enabled:=True;
end;

procedure TFInvoice.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Case New Of
     True : IF Check_Factor_State(Frodm.Invo,BSaveClick,FormDestroy)=idCancel Then
      Action :=caNone
     Else
      Action:=caFree;
//     True : Action:=caFree;
     False: If  Check_Fac Then Action:=caFree Else Action :=caNone;
     End;
     If Action= caFree Then
     Begin
      Frodm.Invo.Close;
      Frodm.InvoGood.Close;
     End;
end;

procedure TFInvoice.BprevClick(Sender: TObject);
begin
     If Frodm.Invo.State In [dsEdit,dsInsert] Then
     Begin
       FNo.SetFocus;
       IF Check_Factor_State(Frodm.Invo,BSaveClick,FormDestroy) = idCancel Then Exit;
       New:=False;
       Exit;
     End;
     If Not MoFlag Then Exit;
     Frodm.Invo.Refresh;
     FroDM.Invo.Prior;
     FNo.Text:=IntToStr(Frodm.InvoNo.Value);
     GoodFilter(Frodm.InvoNo.AsInteger);//1381-08-29
     NewNo:=Frodm.InvoNo.Value+1;
     Find_CustomerKod;
end;

procedure TFInvoice.BeditClick(Sender: TObject);
begin
     BEdit.Enabled:=False;
     If Not(Frodm.Invo.State=dsBrowse) Then Exit;
     BNo:=Frodm.InvoBNo.Value;
     IF (Frodm.InvoPerm.Value)or(IsBillLocked(BNO)) Then
     Begin
       BEdit.Enabled:=True;
       ShowMessage(sLocked);//'›«ﬂ Ê— œ«∆„Ì «” .ﬁ«»· «’·«Õ ‰„Ì »«‘œ');
       Exit;
     End;
     Find_CustomerKod;
     If Not Permit Then
     Begin
       BEdit.Enabled:=True;
       Beep;
       ShowMessage('Õ”«» «⁄ »«— ‰œ«—œ.ﬁ«»·  €ÌÌ— ‰Ì” ');
       Exit;
     End;
     //BNo:=Frodm.InvoBNo.Value;
     FacNo:=IntToStr(Frodm.InvoNo.Value);
     BDat:=Frodm.InvoDat.Value;
     EdQu.SQL.Strings[1]:='WHERE I.No ='+FNo.Text;
     EdQu.Open;
     DelBitem(FacNo,BNo,FTip);
     UNDepot;
     FNam.SetFocus;
     Frodm.Invo.Edit;
     New:=False;
     BSave.Enabled:=True;
end;

procedure TFInvoice.BsaveClick(Sender: TObject);
begin
     If FroDM.Invo.State = dsBrowse Then Exit;
     BSave.Enabled:=False;
     FNo.SetFocus;
     If Frodm.InvoGood.RecordCount = 0 Then
     Begin
       Frodm.Invo.Delete;
       New:=False;
       BDat:=0;
       BNo:=0;
       FacNo:='';
       GoodFilter(Frodm.InvoNo.AsInteger);//1381-08-29
       FNo.Text:=IntToStr(Frodm.InvoNo.Value);
       Find_CustomerKod;
       BEdit.Enabled:=True;
       Exit;
     End;
     MultiCurr:=IsMultiCurrency;
     If MultiCurr Then
      Sum_MultiCurr
     Else
      Sum_SingleCurr;
     Disc:=0;
     Frodm.InvoPtax.Value:=Round((Frodm.InvoPkol.Value -Frodm.InvoPdis.Value)*RTax/100);
     FroDM.InvoPnet.Value :=Frodm.InvoPkol.Value -Frodm.InvoPdis.Value+Frodm.InvoPtax.Value;
     Frodm.InvoBKod.Value:=MultiCurr;
     If Not RequierdCheck(Frodm.Invo) Then
     Begin
       Bsave.Enabled:=True;
       Exit;
     End;
     Frodm.InvoPerm.Value:=sPerm;
     If Check_Fac Then Frodm.Invo.Post Else Exit;
     Depot;
     Close_Bill;
     FacBillNo(Frodm.Invo,Frodm.InvoNo.AsInteger,BNo);
     QuickCloseOpen([1,0,6,24,11,27]);
     Frodm.Invo.Locate('No',StrToInt(FNo.Text),[loCaseInsensitive]);
     Find_CustomerKod;
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

procedure TFInvoice.BdelClick(Sender: TObject);
Var
I:Integer;
begin
     If Not (Frodm.Invo.State = dsBrowse) Then Exit;
     If MessageDlg('›«ﬂ Ê— Õ–› ‘Êœ',mtWarning,mbYesNo,0) = mrYes Then
     begin
       If Frodm.InvoPerm.Value = True Then
       Begin
         ShowMessage('›«ﬂ Ê— œ«∆„Ì «” ');
         Exit;
       End;
       If Not Candelete Then
       Begin
        ShowMessage('ÕÊ«·Â ’«œ— ‘œÂ ﬁ«»· Õ–› ‰Ì” ');
        Exit;
       End;
       BNo:=Frodm.InvoBNo.Value;
       FacNo:=IntToStr(Frodm.InvoNo.Value);
       BDat:=Frodm.InvoDat.Value;
       DelBitem(FacNo,BNo,FTip);
       BillUpdate(BNo);
       UnDepot;
       Frodm.InvoGood.First;
       For I:=1 To Frodm.InvoGood.RecordCount Do Frodm.InvoGood.Delete;
       Frodm.Invo.Delete;
       GoodFilter(Frodm.InvoNo.AsInteger);//1381-08-29
       FNo.Text:=IntToStr(Frodm.InvoNo.Value);
       New:=False;
     End;
end;

procedure TFInvoice.BnextClick(Sender: TObject);
begin
     If Frodm.Invo.State In [dsEdit,dsInsert] Then
     Begin
       FNo.SetFocus;     
       IF Check_Factor_State(Frodm.Invo,BSaveClick,FormDestroy) = idCancel Then Exit;
       New:=False;
       Exit;
     End;
     If Not MoFlag Then Exit;
     Frodm.Invo.Refresh;
     FroDM.Invo.Next;
     FNo.Text:=IntToStr(Frodm.InvoNo.Value);
     GoodFilter(Frodm.InvoNo.AsInteger);//1381-08-29
     NewNo:=Frodm.InvoNo.Value+1;
     Find_CustomerKod;
     If Frodm.Invo.Filtered = True Then Exit;
     If Frodm.Invo.Eof Then
     Begin
       FNo.Text:=IntToStr(NewNo);
       FNo.SetFocus;
     End;
end;


procedure TFInvoice.BnewClick(Sender: TObject);
begin
     If Frodm.Invo.Filtered Then Exit;
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Max(I.No) From Invoice I ');
     Qu.Open;
     MaxNo:=Qu.Fields[0].AsInteger;
     Qu.Close;
     FroDM.Invo.Append;
     Frodm.InvoNam.Value:= '‰«„ Œ—Ìœ«—';
     If sFac Then
      Frodm.InvoNo.Value :=MaxNo+1
     Else
      Frodm.InvoNo.Value :=StrToInt(FNo.Text);
     Frodm.InvoDat.Value:=Fardate;
     Frodm.InvoPerm.Value:=False;
     Frodm.InvoBkod.Value:=False;
     FNo.Text:=IntToStr(Frodm.InvoNo.Value);
     Frodm.Invo.Post;
     Frodm.Invo.Edit;
     New:=True;
     FacNo:=FNo.Text;
     BNo:=0;
     BDat:=Frodm.InvoDat.Value;
     GoodFilter(Frodm.InvoNo.AsInteger);//1381-08-29
     Sb1.Panels[2].Text :='ÃœÌœ';
     BSave.Enabled:=True;
     BEdit.Enabled:=False;
     FNoChange(Sender);
end;

procedure TFInvoice.BexitClick(Sender: TObject);
begin
     FNo.SetFocus;
     IF Check_Factor_State(Frodm.Invo,BSaveClick,FormDestroy)=idCancel Then Exit;
     Close;
end;

procedure TFInvoice.BprintClick(Sender: TObject);
begin
     If Not (Frodm.Invo.state = dsBrowse) Then Exit;
{     Case IsServiceOnly of
     True : Invoice_Print_Service;
     False: Invoice_Print_Goods;
     End;}
     pplabel1.Caption:=FCKod.Text;
     ppLabel2.Caption:=FarsiPrice(Frodm.InvoPnet.AsCurrency);
     ppMemo1.Lines.Clear;
     ppMemo1.Lines.Text:=Comm;
     ppInvRep.DeviceType:='Screen';
     ppInvRep.PrintReport;
end;

procedure TFInvoice.FNoKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then FNoExit(Sender);
     NexTab(Sender,Key);
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;
end;

procedure TFInvoice.FPINoKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then FillFromPI(Sender,StrToInt(FPINo.Text));
     NexTab(Sender,Key);
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;
end;

procedure TFInvoice.FNamExit(Sender: TObject);
begin
     Find_CustomerKod;
     If Not(Permit)And(Frodm.Invo.State In[dsInsert,dsEdit]) Then
     Begin
       Beep;
       ShowMessage('Õ”«» «⁄ »«— ‰œ«—œ');
       FormDestroy(Sender);
       FNo.Text:=IntToStr(Frodm.InvoNo.Value);
       Exit;
     End;
     If FroDM.Invo.State In [dsBrowse,dsEdit] Then Exit;
     FroDM.InvoDat.AsInteger:=FarDate;
end;

procedure TFInvoice.FtelKeyPress(Sender: TObject; var Key: Char);
begin
     NexTab(Sender,Key);
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
        #9,#27,#83,#46,'-']) Then Key:=#0;
end;

procedure TFInvoice.GoodsColEnter(Sender: TObject);
Var
GName:String;
begin
     If Frodm.Invo.State = dsBrowse Then Exit Else Frodm.InvoGood.Edit;
     Case Goods.SelectedField.Index Of
      1:IF Frodm.InvoGoodRadif.Value > 0 Then Radif:=Frodm.InvoGoodRadif.Value;
      3:If Goods.columns[1].ReadOnly Then FillGList(Frodm.InvoGoodKod.Value);
      4:If SModel Then
        Begin
         If Goods.Columns[1].ReadOnly Then Exit;
         Fill_Cond(Frodm.Depot,'Color','Kod='+Frodm.invoGoodKod.AsString,CList.Items);
         DrawList(CList,3);
         CList.ItemIndex:=CList.Items.IndexOf(Frodm.InvoGoodColor.Value);
         If CList.ItemIndex =-1 Then CList.ItemIndex:=0;
        End;
      5: Begin
{IF (Frodm.InvoGoodColor.Value = '')and(sModel) Then Goods.SelectedField:= Frodm.InvoGoodColor;}
         IF Frodm.InvoGoodNam.Value = '' Then Goods.SelectedField:= Frodm.InvoGoodNam;
         If Not Goods.Columns[1].ReadOnly Then DrawList(AList,4);
        End;
      6:IF (Frodm.InvoGoodGaran.Value = Frodm.InvoEco.Value)Then  Frodm.InvoGoodAnbKod.Value:=Frodm.InvoPpay.Value;
      7:If IsFormula(Frodm.InvoGoodKod.AsInteger) Then
        Begin
         GName:=Frodm.InvoGoodNam.AsString;
         Goods.SelectedField :=Frodm.InvogoodKod;
         Frodm.InvoGood.Delete;
         Good_Choose(Frodm.InvoGood,Frodm.InvoNo.AsInteger,Frodm.InvoDat.AsInteger,GName);
        End; 
     11: Frodm.InvoGoodPtotal.Value :=(1-Frodm.InvoGoodPerc.Value /100)*
           Frodm.InvoGoodPfee.Value *Frodm.InvoGoodQuant.Value;
     13: Frodm.InvoGoodReject.Value:=Frodm.InvoGoodPtotal.Value*Frodm.InvoGoodAnbKod.Value;
     21: If Hashavaleh(Frodm.InvoNo.Value) Then
         Frodm.InvoGoodQout.Value:=GetOutlay(Frodm.InvoNo.Value,Frodm.InvoGoodKod.Value,Frodm.InvoGoodColor.AsString);
     End;
end;

// Calculating The Depot and Acount Bill For Sold Goods
procedure TFInvoice.GoodsColExit(Sender: TObject);
begin
     If Frodm.Invo.State = dsBrowse Then Exit Else Frodm.InvoGood.Edit;
     Case Goods.SelectedField.Index Of
     1:Begin
        //ColumnEnable;
        IF Frodm.InvoGoodRadif.Value = 0 Then Frodm.InvoGoodRadif.Value :=Radif;
        Frodm.InvoGoodDat.Value :=Frodm.InvoDat.Value;
        Frodm.InvoGoodNo.Value:=Frodm.InvoNo.Value;
        Frodm.InvoGoodDelikod.Value:=False;
        If Frodm.InvoGoodGaran.IsNull Then Frodm.InvoGoodGaran.Value:=Frodm.InvoEco.Value;
        If Frodm.InvoGoodAnbKod.AsFloat=0 Then Frodm.InvoGoodAnbKod.Value:=Frodm.InvoPpay.Value;
        Frodm.InvoGood.Post;
       End;
     2:Begin
        If Goods.columns[1].ReadOnly Then Exit;
        If {(sGene = 0) and }GoodState(Frodm.InvoGoodKod.Value) Then
        Begin
          Frodm.InvoGoodNam.Value:=GoodNam(Frodm.InvoGoodKod.Value);
          Frodm.InvoGoodPfee.Value:=GoodSoldPrice(Frodm.InvoGoodKod.Value);
          Exit;
        End;
        FillGList(Frodm.InvoGoodKod.Value);
       End;
     6:If Goods.SelectedField.Text = Null Then Goods.SelectedField.Value :=0;
     7: Begin
         //ColumnEnable;
         Frodm.InvoGoodPtotal.Value :=(1-Frodm.InvoGoodPerc.AsFloat /100)*
         Frodm.InvoGoodPfee.Value *Frodm.InvoGoodQuant.Value;
         Frodm.InvoGoodOPSum.Value:=GetOutPrice(Frodm.InvoGoodkod.AsString,
         Frodm.InvoGoodColor.AsString,Frodm.InvoGoodAnbNam.AsString,
         0,0,Frodm.InvoDat.AsInteger,Frodm.InvoGoodQuant.Value);
         If Frodm.InvoGoodQuant.AsFloat > 0 Then Frodm.InvoGoodOPfee.Value:=Frodm.InvoGoodOPSum.Value/
          Frodm.InvoGoodQuant.Value;
         Frodm.InvoGoodReject.Value:=Frodm.InvoGoodPtotal.Value*Frodm.InvoPpay.Value;
        End;
     10:Frodm.InvoGoodPtotal.Value :=(1-Frodm.InvoGoodPerc.Value /100)*
       Frodm.InvoGoodPfee.Value *Frodm.InvoGoodQuant.Value;
     End;
     If Goods.Columns[0].Field.Value > 0 Then Radif:=Frodm.InvoGoodRadif.Value ;
end;

procedure TFInvoice.GoodsEditButtonClick(Sender: TObject);
begin
     If (Frodm.Invo.State In [dsInsert,dsEdit])and (Frodm.InvoGoodQout.Value =0) Then
     Begin
       Frodm.InvoGood.Delete;
       Frodm.InvoGood.Edit;
     End;
end;

procedure TFInvoice.GoodsEnter(Sender: TObject);
begin
     If (FroDM.Invo.State = dsBrowse) Or (Frodm.InvoPerm.Value = True) Then
       Goods.ReadOnly := True Else Goods.ReadOnly :=False;
     Goods.selectedField:=Goods.Columns[0].Field;
end;

procedure TFInvoice.GoodsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Not(Frodm.Invo.State = dsBrowse) Then Frodm.InvoGood.Edit;
     If Shift = [ssCtrl]   Then  FPkol.SetFocus;
     If Shift = [ssCtrl]+[ssShift]  Then  FAdd.SetFocus;
     IF ((Key = VK_F4) and Not(Frodm.Invo.State = dsBrowse)and
        Not(Goods.Columns[Goods.SelectedIndex-1].ReadOnly ))  Then
      Case Goods.SelectedField.Index Of
      3: DrawList(GList,2);
      4: DrawList(Clist,3);
      5: DrawList(AList,4);
      End;
     If (Goods.SelectedIndex In [0,1,2,3])and(Key=32)and Not(Frodm.Invo.State = dsBrowse) Then
      Begin
       //OnActivate:=nil;
       If FindGoods(Frodm.InvoGood,Frodm.InvoNo.AsInteger,Frodm.InvoDat.AsInteger,Frodm.InvoNam.AsString) Then
       Goods.SelectedIndex :=7;
       //onActivate:=FormActivate;
      End;
     If (Goods.SelectedIndex In [8,10]) and Not(Frodm.Invo.State = dsBrowse) Then
     Case Key Of
       VK_MULTIPLY :Begin
               Frodm.InvoGood.Post;
               Frodm.InvoGood.Edit;
               Goods.SelectedField.Value := Goods.SelectedField.Value*1000;
               End;
       VK_DIVIDE   : Begin
               Frodm.InvoGood.Post;
               Frodm.InvoGood.Edit;
               Goods.SelectedField.Value := Goods.SelectedField.Value* 100;
               End;
     End;
end;

procedure TFInvoice.GoodsKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
       If (Goods.SelectedField.Index = 11) and Not(Frodm.Invo.State =dsBrowse) Then
         If (Frodm.InvoGoodPfee.Value = 0 ) Then
          Frodm.InvoGoodPfee.Value:=Frodm.InvoGoodPTotal.Value /
                  (Frodm.InvoGoodQuant.Value/(1-Frodm.InvoGoodPerc.Value/100));
       Key:=#0;
       GridMove(Goods,Frodm.Invo,Radif);
     End;
     If Not(Frodm.Invo.State = dsBrowse) Then Frodm.InvoGood.Edit;
end;

procedure TFInvoice.GoodsMouseMove(Sender: TObject; Shift: TShiftState; X,
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

procedure TFInvoice.FPdisEnter(Sender: TObject);
begin
     If(Frodm.Invo.State = dsBrowse)Or(sPerc = False) Then Exit;
     Frodm.InvoPdis.Clear;
end;

procedure TFInvoice.FPnetEnter(Sender: TObject);
begin
     IF Frodm.Invo.State = dsBrowse Then Exit;
     Frodm.InvoPdis.Value:=Frodm.InvoPdis.Value+Disc;
     FroDM.InvoPnet.Value :=Frodm.InvoPkol.Value -Frodm.InvoPdis.Value+Frodm.InvoPtax.Value;
end;

procedure TFInvoice.FPtaxEnter(Sender: TObject);
begin
     IF Frodm.Invo.State = dsBrowse Then Exit;
     Frodm.InvoPtax.Value:=Round((Frodm.InvoPkol.Value -Frodm.InvoPdis.Value)*0.05);
     FroDM.InvoPnet.Value :=Frodm.InvoPkol.Value -Frodm.InvoPdis.Value+Frodm.InvoPtax.Value;
end;

procedure TFInvoice.GListKeyPress(Sender: TObject; var Key: Char);
Const
Dmsg='ò«·« ﬁ»·« œ— «Ì‰ ›«ò Ê— À»  ‘œÂ «” .«œ«„Â „ÌœÂÌœø';
Var
S:String;
begin
     If Key=#13 Then
     Begin
      Key:=#0;
      s:=GList.Items.Strings[GList.ItemIndex];
      Case sDP Of
      True:
      Begin
       Frodm.InvoGood.Edit;
       Frodm.InvoGoodNam.Value :=Decode(s);
       Frodm.InvoGoodColor.Value :=Decode(s);
       Frodm.InvoGoodAnbNam.Value :=Decode(s);
       Frodm.InvoGoodQuant.Value :=StrToFloat(Decode(s));
       MaxQuant:=Frodm.InvoGoodQuant.Value;
       Frodm.InvoGoodkod.Value :=GoodKod(Frodm.InvoGoodNam.Value);
       Frodm.InvoGoodPfee.Value :=GoodSoldPrice(Frodm.InvoGoodkod.Value);
       Frodm.InvoGoodNo.Value:=Frodm.InvoNo.Value;
       Frodm.InvoGood.Post;
       Goods.SetFocus;
       Goods.SelectedField :=Goods.Columns[5].Field;
       GList.Visible :=False;
       Bexit.Cancel :=True;
      End;
      False:
      Begin
       Frodm.InvoGood.Edit;
       uGood.Name:=S;
       Frodm.InvoGoodNam.Value :=s;
       Frodm.InvoGoodkod.Value :=uGood.Code;
       Frodm.InvoGoodPfee.Value :=uGood.SoldPrice;
       Frodm.InvoGoodNo.Value:=Frodm.InvoNo.Value;
       If uGood.IsService Then Frodm.InvoGoodQuant.Value:=1;
       IF (IsDoubleChose(Frodm.InvoGoodKod.AsInteger)and
       (MessageDlg(Dmsg,mtWarning,mbYESNO,-1)=idNo)) Then
       Goods.SelectedField :=Frodm.InvogoodKod;
       Frodm.InvoGood.Post;
       Goods.SetFocus;
       Case uGood.IsService Of
        False:
              Begin
               If sModel Then Begin Goods.SelectedField :=Goods.Columns[3].Field; Exit; End;
               If sAkod Then
                Goods.SelectedField :=Goods.Columns[4].Field
               Else
                Goods.SelectedField :=Goods.Columns[7].Field;
              End;
        True: Goods.SelectedField :=Goods.Columns[9].Field;
       End;
       GList.Visible :=False;
       Bexit.Cancel :=True;
     End;
     End;
     End;
end;

procedure TFInvoice.FNoExit(Sender: TObject);
begin
     If Frodm.Invo.State In [dsEdit,dsInsert] Then
     Begin
       Fno.Text:=IntToStr(Frodm.InvoNo.Value);
       Exit;
     End;
     NewNo:=StrToInt(FNo.Text);
     FacNo:=FNo.Text;
//     If  Not(Frodm.Invo.FindKey([NewNo])) Then BnewClick(Sender) Else
     If Not(Frodm.Invo.Locate('No',NewNo,[loCaseInsensitive])) Then BNewClick(Sender) Else
     Begin
      GoodFilter(Frodm.InvoNo.AsInteger);//1381-08-29
      FacNo:=FNo.Text;
      BNo:=Frodm.InvoBno.Value;
      BDat:=Frodm.InvoDat.Value;
     End;
     Find_CustomerKod;
end;

procedure TFInvoice.GListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key = 27 Then
     Begin
       Goods.SetFocus;
       Frodm.InvoGood.Delete;
       Frodm.InvoGood.Append;
       Goods.SelectedField :=Frodm.InvoGoodRadif;
       GList.Visible :=False;
       Bexit.Cancel :=True;
     End;
end;

procedure TFInvoice.FNoChange(Sender: TObject);
begin
     {IF (Boss) Or (Frodm.InvoPerm.Value) Then Bprint.Enabled :=True Else
       Bprint.Enabled :=False;}
end;

procedure TFInvoice.dblVisitEnter(Sender: TObject);
begin
     If Frodm.Invo.State <> dsBrowse Then dblVisit.DropDown;
end;

procedure TFInvoice.GListDblClick(Sender: TObject);
Var
Key:Char;
begin
     Key:=#13;
     GListKeyPress(Sender,Key);
end;

procedure TFInvoice.FNamDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
     Accept:=(Source Is TXPListBox) And ((Source As TXPListBox).Name = 'lbName')
end;

procedure TFInvoice.FNamDragDrop(Sender, Source: TObject; X, Y: Integer);
Var
List:TXPListBox;
begin
     If Not(Frodm.Invo.State = dsBrowse)and (Source Is TXPListBox) Then
     Begin
       List:=(Source As TXPListBox);
       Frodm.InvoNam.Value:=List.Items.Strings[List.ItemIndex];
       FAcSearch.Close;
       FNam.SetFocus;
     End;
end;

procedure TFInvoice.GoodsDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
     Accept:=(Source Is TXPListBox) And ((Source As TXPListBox).Name = 'lbGName');
     Accept:=Accept and (SGene = False);
end;

procedure TFInvoice.GoodsDragDrop(Sender, Source: TObject; X, Y: Integer);
Var
List:TXPListBox;
Key:Char;
begin
     If Not(Frodm.Invo.State = dsBrowse)and (Source Is TXPListBox) Then
     Begin
       List:=(Source As TXPListBox);
       If Frodm.InvoGoodNam.Value = '' Then Frodm.InvoGood.Edit Else
        Frodm.InvoGood.Append;
       Frodm.InvoGoodRadif.Value:=Frodm.InvoGood.RecordCount+1;
       Frodm.InvoGoodKod.Value:=StrToInt(List.Hint);
       FGSearch.Close;
       FillGList(Frodm.InvoGoodKod.Value);
       If GList.Items.Count = 1 Then
       Begin
        GList.ItemIndex :=0;
        Key:=#13;
        GListKeyPress(Sender,Key);
       End;
     End;
end;

procedure TFInvoice.GoodsDblClick(Sender: TObject);
begin
     If Not(Frodm.Invo.State = dsBrowse) Then
      CreatingForm(TFGSearch,'FGSearch',FGSearch);
end;

procedure TFInvoice.Dat1Enter(Sender: TObject);
begin
     If Frodm.Invo.State = dsBrowse Then Dat1.ReadOnly :=True Else
     Begin
        Dat1.ReadOnly :=False;
        GetMaskText(Dat1);
     End;
end;

procedure TFInvoice.Dat1Exit(Sender: TObject);
begin
     If (Frodm.Invo.State = dsBrowse) Then Exit;
     SetMaskText(Dat1);
     If(Not Date_Check(Dat1.Text))And(DateToInt(Dat1.Text)>0) Then Dat1.SetFocus Else
       Frodm.InvoDat.Value :=DateToInt(Dat1.Text);
end;

procedure TFInvoice.FNamKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetAccountDbCombo(Sender,Key,'',0);
end;


procedure TFInvoice.CListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If (Key = 27) Then
     Begin
       Goods.SetFocus;
       Goods.SelectedField :=Frodm.InvoGoodColor;
       CList.Visible :=False;
       Bexit.Cancel :=True;
     End;
end;

procedure TFInvoice.CListKeyPress(Sender: TObject; var Key: Char);
begin
     If Key =#13 Then
     Begin
       Frodm.InvoGood.Edit;
       Frodm.InvoGoodColor.Value:=CList.Items.Strings[CList.ItemIndex];
       Goods.SetFocus;
       Goods.SelectedField :=Frodm.InvoGoodColor;
       CList.Visible :=False;
       Bexit.Cancel :=True;
     End;
end;

procedure TFInvoice.AListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If (Key = 27) Then
     Begin
       Goods.SetFocus;
       Goods.SelectedField :=Frodm.InvoGoodAnbNam;
       AList.Visible :=False;
       Bexit.Cancel :=True;
     End;
end;

procedure TFInvoice.AListKeyPress(Sender: TObject; var Key: Char);
begin
     If Key =#13 Then
     Begin
       Frodm.InvoGood.Edit;
       Frodm.InvoGoodAnbNam.Value:=AList.Items.Strings[AList.ItemIndex];
       Goods.SetFocus;
       Goods.SelectedField :=Frodm.InvoGoodQuant;
       AList.Visible :=False;
       Bexit.Cancel :=True;
     End;
end;

procedure TFInvoice.FPpayEnter(Sender: TObject);
begin
     If Frodm.InvoEco.AsString = DefaultCurr Then
      Rate := 1
     Else
      If Frodm.InvoPpay.AsCurrency = 0 Then
       Rate:=GetRateatDate(Frodm.InvoEco.AsString,Frodm.InvoDat.AsInteger)
      Else
       Rate:=Frodm.InvoPpay.AsCurrency;

end;


procedure TFInvoice.FPkolEnter(Sender: TObject);
begin
     If IsMultiCurrency Then
      Sum_MultiCurr
     Else
      Sum_SingleCurr;
end;


procedure TFInvoice.FCKodKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetCentLookup(Sender,Key);
end;

procedure TFInvoice.GoodsDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
     If Frodm.InvoGoodQout.Value < Frodm.InvoGoodQuant.Value Then
      Goods.Canvas.Font.Color:=clBlue;
     If  Frodm.InvoGoodQout.Value = 0 Then Goods.Canvas.Font.Color:=clRed;
     Goods.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TFInvoice.BHavClick(Sender: TObject);
Var
FDH:TFDHav;
begin
     If Not (FroDM.Invo.State = dsBrowse) Then Exit;
     //CreatingForm(TFDHav,'FDHav',FDHav);
     If Not sFac Then sFac:=True;
     IF Not HasHavaleh(Frodm.InvoNo.AsInteger) Then
     Begin
      FDH:=TFDHav.Create(Application);
      With FDH Do
      Try
       FormStyle:=fsNormal;
       Visible:=False;
       BorderStyle:=bsSingle;
       FPINo.Field.Value:=Frodm.InvoNo.Value;
       FillFromPI(Sender,Frodm.InvoNo.Value);
       Goods.SetFocus;
       ShowModal;
      Finally
       Free;
      End;
     End;
end;


end.
