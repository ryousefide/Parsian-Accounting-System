unit PInvoice;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Db, DBTables, ComCtrls, ExtCtrls, Grids, DBGrids,
  DBCGrids, PopupListBox;

type
  TFPInvoice = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    FNam: TDBComboBox;
    Ftel: TDBEdit;
    FAdd: TDBEdit;
    Bprev: TButton;
    Bsave: TButton;
    Bnext: TButton;
    Bnew: TButton;
    Bexit: TButton;
    Bprint: TButton;
    DBText1: TDBText;
    Goods: TDBGrid;
    GList: TPopupListBox;
    Label6: TLabel;
    Label12: TLabel;
    Label19: TLabel;
    FPkol: TDBEdit;
    FPdis: TDBEdit;
    FPnet: TDBEdit;
    FNo: TEdit;
    Bevel1: TBevel;
    Bdel: TButton;
    GoodList: TPopupListBox;
    CList: TPopupListBox;
    AList: TPopupListBox;
    Label10: TLabel;
    FEco: TDBEdit;
    Label7: TLabel;
    dblVisit: TDBLookupComboBox;
    Bedit: TButton;
    Dat1: TMaskEdit;
    procedure GoodsColExit(Sender: TObject);
    procedure BprevClick(Sender: TObject);
    procedure BsaveClick(Sender: TObject);
    procedure BnextClick(Sender: TObject);
    procedure GoodsExit(Sender: TObject);
    procedure FPdisExit(Sender: TObject);
    procedure BnewClick(Sender: TObject);
    procedure BexitClick(Sender: TObject);
    procedure FNamExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BprintClick(Sender: TObject);
    procedure FDatEnter(Sender: TObject);
    procedure GoodsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FPcheqExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GNamKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GoodsKeyPress(Sender: TObject; var Key: Char);
    procedure GListKeyPress(Sender: TObject; var Key: Char);
    procedure FNoExit(Sender: TObject);
    procedure FNoKeyPress(Sender: TObject; var Key: Char);
    procedure GoodsEditButtonClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BdelClick(Sender: TObject);
    procedure GoodListKeyPress(Sender: TObject; var Key: Char);
    procedure GoodListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CListKeyPress(Sender: TObject; var Key: Char);
    procedure AListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure AListKeyPress(Sender: TObject; var Key: Char);
    procedure FormDestroy(Sender: TObject);
    procedure GoodsEnter(Sender: TObject);
    procedure GoodsColEnter(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FPnetEnter(Sender: TObject);
    procedure FNoEnter(Sender: TObject);
    procedure dblVisitEnter(Sender: TObject);
    procedure NextTab(Sender: TObject; var Key: Char);
    procedure FPdisEnter(Sender: TObject);
    procedure BeditClick(Sender: TObject);
    procedure FNamKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Dat1Enter(Sender: TObject);
    procedure Dat1Exit(Sender: TObject);
  private
    { Private declarations }
    SumQ,SumP:Real;
    Disc:Currency;
    procedure Find_CustomerKod;
    Function Decode(Var S:String):String;
    Function Encode:String;
    Procedure FillGList(GoodKod:Integer);
    Procedure DrawList(List:TPopupListBox;Index:Integer);
    Procedure QPSums;
    Procedure GoodFilter(FacNo:Integer);
  public
    { Public declarations }
  end;

var
  FPInvoice: TFPInvoice;

implementation

uses FrooshDM, FactorRep,Routins, ProVar, QRCtrls, Converts;

Var
Radif:Integer;
NewNo:Integer;

{$R *.DFM}
procedure TFPInvoice.Find_CustomerKod;
Var
Dat:Integer;
Str:String;
begin
     Str:=Frodm.InvoNam.Value;
     Frodm.AcKod.IndexFieldNames :='Nam';
     If Frodm.AcKod.FindKey([Str]) Then
     Begin
       If Not(Frodm.PInvo.State In[dsInsert,dsEdit]) Then Exit;
       Frodm.PInvoTel.Value :=Frodm.AcKodTel.Value;
       Frodm.PInvoAdd.Value :=Frodm.AcKodAdd.Value;
     End;
end;

Function TFPInvoice.Decode(Var S:String):String;
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

Function TFPInvoice.Encode:String;
begin
     Result:=Frodm.DepotNam.Value +'-'+Frodm.DepotColor.Value +'-'+
     Frodm.DepotAnbNam.Value+'-'+FloatToStr(Frodm.DepotQuant.Value);
end;

Procedure TFPInvoice.FillGList(GoodKod:Integer);
Var
I,Width,Len:Integer;
begin
     GList.Items.Clear;
     If (GoodKod >0) and (sGene)  Then
          Frodm.Depot.Filter :='Gene= '+IntToStr(GoodKod)+' and Quant > 0'
     Else
          Frodm.Depot.Filter :='Kod= '+IntToStr(GoodKod)+' and Quant > 0';
     If GoodKod = 0 Then  Frodm.Depot.Filter :=' Quant > 0';
     Frodm.Depot.Filtered :=True;
     Frodm.Depot.First;
     Width:=0;
     For I:=1 To FRodm.Depot.RecordCount Do
     Begin
       GList.Items.Add(Encode);
       Len:= Glist.Canvas.TextWidth(Encode);
       If Len > Width Then Width:=Len;
       Frodm.Depot.Next;
     End;
     Frodm.Depot.Filtered :=False;
     GList.Width :=Width+50;
     GList.Left :=FPInvoice.Width -(GList.Width +50);
     If GList.Items.Count >0 Then
     Begin
       Glist.Visible :=True;
       GList.SetFocus;
       Bexit.Cancel :=False;
       GList.ItemIndex :=0;
     End Else
     Begin
       Beep;
       ShowMessage('ßÇáÇ ãæÌæÏí äÏÇÑÏ');
//       Goods.SelectedField.Index :=Goods.SelectedField.Index+1;
       Goods.SelectedField :=Frodm.PInvoGoodNam;
     End;
end;

Procedure TFPInvoice.DrawList(List:TPopupListBox;Index:Integer);
begin
{     List.Width :=Goods.Columns[Index].Width;
     List.Left :=300-List.Width DIV 2;
     List.Top:=130+Radif*20;
     If GList.Top > 205 Then GList.Top:=205;}
     List.Visible :=True;
     List.SetFocus;
     Bexit.Cancel :=False;
     List.ItemIndex :=0;
end;

Procedure TFPInvoice.QPSums;
begin
     Qu.SQL.Clear;
     Qu.SQL.ADD('SELECT SUM(D.Quant),SUM(D.Perc)');
     Qu.SQL.ADD('FROM PInvoGood D');
     QU.SQL.ADD('WHERE D.No = '+FNo.Text);
     Qu.Open;
     SumQ:=Qu.Fields[0].AsFloat;
     SumP:=Qu.Fields[1].AsFloat;
     Qu.Close;
end;

Procedure TFPInvoice.GoodFilter(FacNo:Integer);
begin
     Frodm.PInvoGood.Filtered:=False;
     Frodm.PInvoGood.Filter:='No = '+IntToStr(FacNo);
     Frodm.PInvoGood.Filtered:=True;
     Dat1.Text:=IntToDate(Frodm.PInvoDat.Value)
end;
//End Of Private decaleration

procedure TFPInvoice.FormCreate(Sender: TObject);
begin
     Set_Forms(FPInvoice);
     Frodm.PInvo.Open;
     Frodm.PInvoGood.open;
     Frodm.PInvo.Last;
     GoodFilter(Frodm.PinvoNo.AsInteger);//1381-08-29
     FNo.Text :=IntToStr(Frodm.PInvoNo.Value);
     Goods.Columns[5].Visible :=sAKod;
     If sPerc Then
     Begin
       Goods.Columns[9].Visible :=True;;
       Goods.Columns[8].ReadOnly:=True;
       Fpdis.ReadOnly:=True;
     End;
     If sModel Then Goods.Columns[3].Visible :=True;
     Goods.Columns[9].Width:=31;
     Goods.Columns[5].Width:=31;
     Goods.Columns[3].Width:=81;
     Radif:=1;
end;

procedure TFPInvoice.FormActivate(Sender: TObject);
begin
     FNam.Items.Assign(AcList);
     GoodList.Items.Assign(Kala);
     Fill_Comb(Frodm.Color,'Color',CList.Items);
     Fill_Comb(Frodm.AnbDat,'Nam',AList.Items);
end;

// Calculating The Depot and Acount Bill For Sold Goods
procedure TFPInvoice.GoodsColExit(Sender: TObject);
begin
     If Frodm.PInvo.State = dsBrowse Then Exit Else Frodm.PInvoGood.Edit;
     Frodm.PinvoGoodDat.Value :=Frodm.PinvoDat.Value;
     Case Goods.SelectedField.Index Of
     1:Begin
        If Frodm.PInvoGoodRadif.Value =  0 Then Frodm.PInvoGoodRadif.Value :=Radif;
        Frodm.PinvoGoodNo.Value:=Frodm.PinvoNo.Value;
        Frodm.PInvoGoodDelikod.Value:=False;
//        Frodm.PinvoGood.Post;
       End; 
     2: If Frodm.PinvoGoodKod.Value > 0 Then FillGList(Frodm.PinvoGoodKod.Value);
     5: Frodm.PInvoGoodAnbNam.Value := AnbNam(Frodm.PInvoGoodAnbNam.Value);
     10:Frodm.PInvoGoodPtotal.Value :=(1-Frodm.PInvoGoodPerc.Value /100)*
        Frodm.PInvoGoodPfee.Value * Frodm.PInvoGoodQuant.Value;
     End;
end;

procedure TFPInvoice.GoodsExit(Sender: TObject);
var
I:Integer;
Sum,Nsum:Currency;
begin
     If FroDM.PInvo.State = dsBrowse Then Exit ;
     FroDM.PInvoGood.First;
     Sum:=0;Nsum:=0;
     For I:=1 to FroDM.PInvoGood.RecordCount Do
     Begin
       Sum:=Sum+FroDM.PInvoGoodPFee.Value * Frodm.PInvoGoodQuant.Value;
       Nsum:=Nsum+FroDM.PInvoGoodPtotal.Value;
       FroDM.PInvoGood.Next;
     End;
     FroDM.PInvoPkol.AsCurrency:=Sum;
     Frodm.PInvoPnet.AsCurrency:=Nsum;
     If SPerc Then
     Begin
      Disc:=Sum-Nsum;
      Frodm.PInvoPdis.AsCurrency:=Disc;
     End;
end;

procedure TFPInvoice.GoodsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Not(Frodm.PInvo.State = dsBrowse) Then Frodm.PInvoGood.Edit;
     If (Shift = [ssCtrl])   Then  FPkol.SetFocus;
     IF ((Key = VK_F4) and Not(Frodm.PInvo.State = dsBrowse)) Then
     Case Goods.SelectedField.Index Of           //Frodm.PInvoGoodKod.Value
//     2: FillGList(Frodm.PInvoGoodKod.Value);
     3: DrawList(GoodList,2);
     4: DrawList(Clist,3);
     5: DrawList(AList,4);
     End;
     If (Goods.SelectedIndex In [0,1,2,3])and(Key=32)and Not(Frodm.PInvo.State = dsBrowse) Then
      If FindGoods(Frodm.PInvoGood,Frodm.PInvoNo.AsInteger,Frodm.PInvoDat.AsInteger,Frodm.PInvoNam.AsString) Then
       Goods.SelectedField :=Frodm.PInvoGoodPfee;
     If (Goods.SelectedIndex In [8,10]) and Not(Frodm.PInvo.State = dsBrowse) Then
     Case Key Of
       VK_MULTIPLY :
       Begin
         Frodm.PInvoGood.Post;
         Frodm.PInvoGood.Edit;
         Goods.SelectedField.Value := Goods.SelectedField.Value*1000;
       End;
       VK_DIVIDE   :
       Begin
         Frodm.PInvoGood.Post;
         Frodm.PInvoGood.Edit;
         Goods.SelectedField.Value := Goods.SelectedField.Value* 100;
       End;
     End;

end;

procedure TFPInvoice.FPdisExit(Sender: TObject);
begin
     FroDM.PInvo.FieldByName('Pnet').AsCurrency :=Frodm.PInvoPkol.Value -Frodm.PInvoPdis.Value;
end;

procedure TFPInvoice.BprevClick(Sender: TObject);
begin
//     IF Check_StateMaster(Frodm.PInvoGood,BSaveClick) = idCancel Then Exit;
     IF Check_Factor_State(Frodm.PInvo,BSaveClick,FormDestroy) = idCancel Then Exit;
     FroDM.PInvo.Prior;
     GoodFilter(Frodm.PinvoNo.AsInteger);//1381-08-29
     FNo.Text:=IntToStr(Frodm.PInvoNo.Value);
     NewNo:=Frodm.PInvoNo.Value+1;
end;

procedure TFPInvoice.BsaveClick(Sender: TObject);
begin
     If FroDM.PInvo.State = dsBrowse Then Exit;
     If Frodm.PInvoGood.RecordCount = 0 Then
     Begin
      Frodm.PInvo.Cancel;
      FNo.Text:=IntToStr(Frodm.PinvoNo.Value);
      GoodFilter(Frodm.PinvoNo.AsInteger);//1381-08-29
      Exit;
     End;
     GoodsExit(Sender);
     FPdisExit(Sender);
     FroDM.PInvo.Post;
       QuickCloseOpen([19,18]);
//       Frodm.PInvo.FindKey([StrToInt(FNo.Text)]);
       Frodm.PInvo.Locate('No',StrToInt(FNo.Text),[loCaseInsensitive]);
       FNo.SetFocus;
     Radif:=1;
end;

procedure TFPInvoice.BnextClick(Sender: TObject);
begin
     IF Check_Factor_State(Frodm.PInvo,BSaveClick,FormDestroy)=idCancel Then Exit;
     FroDM.PInvo.Next;
     GoodFilter(Frodm.PinvoNo.AsInteger);//1381-08-29
     FNo.Text:=IntToStr(Frodm.PInvoNo.Value);
     NewNo:=Frodm.PInvoNo.Value+1;
     If Frodm.PInvo.Filtered = True Then Exit;
     If Frodm.PInvo.Eof = True Then
     Begin
       FNo.Text:=IntToStr(NewNo);
       FNo.SetFocus;
     End;
end;


procedure TFPInvoice.BnewClick(Sender: TObject);
begin
     FroDM.PInvo.Append;
     Frodm.PInvoNo.Value :=StrToInt(FNo.Text);
     Frodm.PInvoBkod.Value:=False;
     Frodm.PInvoDeliKod.Value:=False;
     Frodm.PInvoPerm.Value:=False;
     Frodm.PInvoDat.Value:=Fardate;
     GoodFilter(Frodm.PinvoNo.AsInteger);
     FNam.SetFocus;
end;

procedure TFPInvoice.BexitClick(Sender: TObject);
begin
//     IF Check_StateMaster(Frodm.PInvoGood,BSaveClick) = idCancel Then Exit;
     IF Check_Factor_State(Frodm.PInvo,BSaveClick,FormDestroy) = idCancel Then Exit;
     FPInvoice.Close;
end;

procedure TFPInvoice.BprintClick(Sender: TObject);
Var
QDbT:TQRDbText;
I:Integer;
RowCnt:Integer;
FreeP:Real;
LesMar:Real;
CnHeight:Real;
SubH:Real;
BRow:Integer;

begin
     If Not(Frodm.PInvo.State = dsBrowse) Then Exit;
     QPSums;
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
     BRow:=Frodm.PInvoGood.RecordCount Mod RowCnt;
     If BRow > 0 Then
      FacQr.GFB.Size.Height:=(SubH)*(RowCnt-BRow)
     Else
      FacQr.GFB.Size.Height:=0;

     FacQr.QRSubDetail3.DataSet :=Frodm.PInvoGood;
     FacQr.QrAdd.Caption:=Master;
     FacQr.QRLabel3.Caption:=FNam.Text;

     FacQr.qrTit.Caption :=InvoLbl;
     FacQr.qrTit.Font.Size :=LFont.Size+4;
     FacQr.qrLabel1.Caption :='íÔ ÝÇßÊæÑ ';
     FacQr.qrLabel1.Font.Size :=LFont.Size+4;
     FacQr.qrPSum.Caption:=FloatToStr(SumP);
     FacQr.qrQsum.Caption:=FloatToStr(SumQ);
     FacQr.qrCom.Caption:=Comm;
     FacQr.PrinterSettings.Copies:=PrnCnt;
     FacQr.qrFRem.Caption:=FarsiPrice(Frodm.PInvoPnet.Value);

     FacQr.QRDBText21.DataField:='Adr';
     For I:=0 To FacQr.ComponentCount-1 Do
     Begin
       If FacQr.Components[I] is TQRDbText Then
       Begin
        QDbT:=(FacQr.Components[I] As TQRDbText);
        If QDbT.DataSet =Frodm.Invo Then QDbT.DataSet :=Frodm.PInvo;
        If QDbT.DataSet =Frodm.InvoGood Then QDbT.DataSet :=Frodm.PInvoGood;
       End;
     End;
     FacQr.Preview;
     FacQr.Destroy;
     FroDM.PInvoGood.Filtered :=True;
end;

procedure TFPInvoice.FNamExit(Sender: TObject);
begin
     If (FroDM.PInvo.State = dsBrowse) Then Exit;
     Find_CustomerKod;
     If FroDM.PInvo.State = dsEdit Then Exit;
     FroDM.PInvo.FieldByName('Dat').AsInteger:=FarDate;
end;


procedure TFPInvoice.FDatEnter(Sender: TObject);
begin
     If FroDM.PInvo.State = dsBrowse Then Exit;
     FroDM.PInvo.FieldByName('Dat').AsInteger:=FarDate;
end;

procedure TFPInvoice.FPcheqExit(Sender: TObject);
begin
     FroDM.PInvoPrem.Value :=FroDM.PInvoPnet.Value -
                              (FroDM.PInvoPpay.Value +FroDM.PInvoPCheq.Value);
end;

procedure TFPInvoice.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
     Frodm.PInvo.Close;
     Frodm.PInvoGood.Close;
end;

procedure TFPInvoice.GNamKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key = 13 Then
     Begin
       Key:=0;
       FPInvoice.SelectNext(Sender As TWinControl,True,True);
     End;
end;

procedure TFPInvoice.GoodsKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
       If (Goods.SelectedField.Index = 11) and Not(Frodm.PInvo.State =dsBrowse) Then
         If (Frodm.PInvoGoodPfee.Value = 0 ) Then
          Frodm.PInvoGoodPfee.Value:=Frodm.PInvoGoodPTotal.Value /
                  (Frodm.PInvoGoodQuant.Value/(1-Frodm.PInvoGoodPerc.Value/100));
       Key:=#0;
       GridMove(Goods,Frodm.PInvo,Radif);
     End;
end;

procedure TFPInvoice.GListKeyPress(Sender: TObject; var Key: Char);
Var
S:String;
begin
     If Key=#13 Then
     Begin
     Key:=#0;
     s:=GList.Items.Strings[GList.ItemIndex];
     Frodm.PInvoGood.Edit;
     Frodm.PinvoGoodNo.Value:=Frodm.PinvoNo.Value;
     Frodm.PInvoGoodNam.Value :=Decode(s);
     Frodm.PInvoGoodColor.Value :=Decode(s);
     Frodm.PInvoGoodAnbNam.Value :=Decode(s);
     Frodm.PInvoGoodQuant.Value :=StrToFloat(Decode(s));
     Frodm.PInvoGoodkod.Value :=GoodKod(Frodm.PInvoGoodNam.Value);
     Frodm.PInvoGoodPfee.Value :=GoodSoldPrice(Frodm.PInvoGoodkod.Value);
     Frodm.PinvoGood.Post;
     Goods.SetFocus;
     Goods.SelectedField :=Frodm.PInvoGoodQuant;
     GList.Visible :=False;
     Frodm.PInvoGood.Last;
     Bexit.Cancel :=True;
     End;
end;

procedure TFPInvoice.FNoExit(Sender: TObject);
begin
//     If  Not(Frodm.PInvo.FindKey([StrToInt(FNo.Text)])) Then
     If  Not(Frodm.PInvo.Locate('No',StrToInt(FNo.Text),[loCaseInsensitive])) Then
      BnewClick(Sender)
     Else
      GoodFilter(Frodm.PinvoNo.AsInteger);//1381-08-29
end;

procedure TFPInvoice.FNoKeyPress(Sender: TObject; var Key: Char);
begin
     NextTab(Sender,Key);
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;
end;

procedure TFPInvoice.GoodsEditButtonClick(Sender: TObject);
begin
     If Frodm.PInvo.State In [dsInsert,dsEdit] Then Frodm.PInvoGood.Delete;
end;

procedure TFPInvoice.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key = VK_F3 Then BsaveClick(Sender);
     If Shift = [ssAlt] Then
      Case Key Of
       VK_Left:BprevClick(Sender);
       VK_RIGHT:BnextClick(Sender);
      End;
end;

procedure TFPInvoice.GListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key = 27 Then
     Begin
       Goods.SetFocus;
       Goods.SelectedField :=Frodm.PInvoGoodNam;
       GList.Visible :=False;
       Bexit.Cancel :=True;
     End;
end;

procedure TFPInvoice.BdelClick(Sender: TObject);
Var
I:Integer;
begin
     If Frodm.PInvo.RecordCount = 0 Then Exit;
     If MessageDlg('íÔ ÝÇßÊæÑ ÌÇÑí ÍÐÝ ÔæÏ',mtWarning,mbYesNo,0) = mrYes Then
     Begin
       For I:=1 To Frodm.PInvoGood.RecordCount Do Frodm.PInvoGood.Delete;
       Frodm.PInvo.Delete;
       FNo.Text:=IntToStr(Frodm.PInvoNo.Value);
       GoodFilter(Frodm.PinvoNo.AsInteger)//1381-08-29
     End;
end;

procedure TFPInvoice.GoodListKeyPress(Sender: TObject; var Key: Char);
begin
     If Key =#13 Then
     Begin
       Frodm.PInvoGood.Edit;
       Frodm.PinvoGoodNo.Value:=Frodm.PinvoNo.Value;
       Frodm.PInvoGoodNam.Value:=GoodList.Items.Strings[GoodList.ItemIndex];
       Frodm.PInvoGoodKod.Value :=GoodKod(Frodm.PInvoGoodNam.Value);
       Frodm.PInvoGoodPfee.Value :=GoodSoldPrice(Frodm.PInvoGoodKod.Value);
       Frodm.PinvoGood.Post;
       Goods.SetFocus;
       Goods.SelectedField :=Frodm.PInvoGoodNam;
       GoodList.Visible :=False;
       Frodm.PInvoGood.Last;
       Bexit.Cancel :=True;
     End;
end;

procedure TFPInvoice.GoodListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key = 27 Then
     Begin
       GoodList.Visible :=False;
       Goods.SetFocus;
       Goods.SelectedField :=Frodm.PInvoGoodNam;
       Bexit.Cancel :=True;
     End;
end;

procedure TFPInvoice.CListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key = 27 Then
     Begin
       CList.Visible :=False;
       Goods.SetFocus;
       Goods.SelectedField :=Frodm.PInvoGoodColor;
       Bexit.Cancel :=True;
     End;
end;

procedure TFPInvoice.CListKeyPress(Sender: TObject; var Key: Char);
begin
     If Key =#13 Then
     Begin
       Frodm.PInvoGood.Edit;
       Frodm.PInvoGoodColor.Value:=CList.Items.Strings[CList.ItemIndex];
       Goods.SetFocus;
       Goods.SelectedField :=Frodm.PInvoGoodColor;
       CList.Visible :=False;
       Bexit.Cancel :=True;
     End;
end;

procedure TFPInvoice.AListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key = 27 Then
     Begin
       Goods.SetFocus;
       Goods.SelectedField :=Frodm.PInvoGoodAnbNam;
       AList.Visible :=False;
       Bexit.Cancel :=True;
     End;
end;

procedure TFPInvoice.AListKeyPress(Sender: TObject; var Key: Char);
begin
     If Key =#13 Then
     Begin
       Frodm.PInvoGood.Edit;
       Frodm.PInvoGoodAnbNam.Value:=AList.Items.Strings[AList.ItemIndex];
       Goods.SetFocus;
       Goods.SelectedField :=Frodm.PInvoGoodAnbNam;
       AList.Visible :=False;
       Bexit.Cancel :=True;
     End;
end;

procedure TFPInvoice.FormDestroy(Sender: TObject);
begin
//     CancelOnExit(FRodm.PInvoGood);
     If Frodm.PInvo.state = dsBrowse Then Exit;
     CancelFactor(Frodm.Pinvo,Frodm.PinvoGood);
end;

procedure TFPInvoice.GoodsEnter(Sender: TObject);
begin
     If (FroDM.PInvo.State = dsBrowse) Then Goods.ReadOnly := True Else
       Goods.ReadOnly :=False;
     Goods.SelectedIndex :=0;
end;

procedure TFPInvoice.GoodsColEnter(Sender: TObject);
begin
     If Frodm.PInvo.State = dsBrowse Then Exit Else Frodm.PInvoGood.Edit;
     Case Goods.SelectedField.Index Of
     1: If Frodm.PInvoGoodRadif.Value >0 Then Radif:=Frodm.PInvoGoodRadif.Value;
     5: Begin
          //IF (Frodm.PInvoGoodColor.Value = '')And(sModel) Then Goods.SelectedField:=Frodm.PInvoGoodColor;
          IF Frodm.PInvoGoodNam.Value = '' Then Goods.SelectedField:=
          Frodm.PInvoGoodNam;

        End;
     //6: IF Frodm.PInvoGoodAnbNam.Value = '' Then Goods.SelectedField:=Frodm.PInvoGoodAnbNam;
     11: Frodm.PInvoGoodPtotal.Value :=(1-Frodm.PInvoGoodPerc.Value /100)*
           Frodm.PInvoGoodPfee.Value *Frodm.PInvoGoodQuant.Value;
     End;
end;

procedure TFPInvoice.FPdisEnter(Sender: TObject);
begin
     If Frodm.PInvo.State = dsBrowse Then Exit;
     Frodm.PInvoPdis.AsCurrency:=0;
     FPDis.SelectAll;
end;

procedure TFPInvoice.FPnetEnter(Sender: TObject);
begin
     If Frodm.PInvo.State = dsBrowse Then Exit;
     Frodm.PInvoPdis.AsCurrency:=Frodm.PInvoPdis.AsCurrency+Disc;
     Frodm.PInvoPnet.Value:=Frodm.PinvoPKol.Value-Frodm.PInvoPdis.Value;
end;

procedure TFPInvoice.FNoEnter(Sender: TObject);
begin
     If Frodm.PInvo.State = dsInsert Then Frodm.PInvo.Cancel;
end;

procedure TFPInvoice.dblVisitEnter(Sender: TObject);
begin
     If Frodm.PInvo.State <> dsBrowse Then dblVisit.DropDown;
end;

procedure TFPInvoice.NextTab(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
       Key:=#0;
       FPInvoice.SelectNext(Sender As TWinControl,True,True);
     End;
end;

procedure TFPInvoice.BeditClick(Sender: TObject);
begin
     Frodm.PInvo.Edit;
     FNam.SetFocus;
end;


procedure TFPInvoice.FNamKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetAccountDBCombo(Sender,Key,'',0);
end;

procedure TFPInvoice.Dat1Enter(Sender: TObject);
begin
     If Frodm.PInvo.State = dsBrowse Then Dat1.ReadOnly :=True Else
     Begin
        Dat1.ReadOnly :=False;
        GetMaskText(Dat1);
     End;
end;

procedure TFPInvoice.Dat1Exit(Sender: TObject);
begin
     If (Frodm.PInvo.State = dsBrowse) Then Exit;
     SetMaskText(Dat1);
     If(Not Date_Check(Dat1.Text))And(DateToInt(Dat1.Text)>0) Then Dat1.SetFocus Else
       Frodm.PInvoDat.Value :=DateToInt(Dat1.Text);
end;

end.
