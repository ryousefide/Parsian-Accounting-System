unit Binvoice;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Mask, Grids, DBGrids,DB, ExtCtrls, DBCGrids,
  DBTables, ComCtrls, Buttons, PopupListBox;

type
  TFBvoice = class(TForm)
    Sb1: TStatusBar;
    Panel1: TPanel;
    Bprev: TBitBtn;
    Bsave: TBitBtn;
    Bnext: TBitBtn;
    Bnew: TBitBtn;
    Bexit: TBitBtn;
    Bdel: TBitBtn;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    FNam: TDBComboBox;
    Ftel: TDBEdit;
    Goods: TDBGrid;
    Fkol: TDBEdit;
    Fdis: TDBEdit;
    Fnet: TDBEdit;
    FNo: TEdit;
    Bprint: TBitBtn;
    GList: TPopupListBox;
    CList: TPopupListBox;
    AList: TPopupListBox;
    Bedit: TBitBtn;
    BQu: TQuery;
    EdQu: TQuery;
    FBK: TDBCheckBox;
    Dat1: TMaskEdit;
    Label14: TLabel;
    FPrule: TDBComboBox;
    Label2: TLabel;
    FPpay: TDBEdit;
    Label9: TLabel;
    DBEdit1: TDBEdit;
    Label10: TLabel;
    DBEdit2: TDBEdit;
    Label11: TLabel;
    Label12: TLabel;
    DBEdit4: TDBEdit;
    Label13: TLabel;
    DBEdit5: TDBEdit;
    Label15: TLabel;
    DBEdit6: TDBEdit;
    Label16: TLabel;
    FCost: TDBEdit;
    DBEdit3: TDBEdit;
    Bevel1: TBevel;
    Label17: TLabel;
    Label18: TLabel;
    FDCost: TDBComboBox;
    FCKod: TDBLookupComboBox;
    Label19: TLabel;
    FEco: TDBComboBox;
    Label20: TLabel;
    DBEdit7: TDBEdit;
    procedure GoodsEnter(Sender: TObject);
    procedure GoodsExit(Sender: TObject);
    procedure BprevClick(Sender: TObject);
    procedure BnextClick(Sender: TObject);
    procedure BnewClick(Sender: TObject);
    procedure BsaveClick(Sender: TObject);
    procedure BexitClick(Sender: TObject);
    procedure GoodsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FdisExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FtelKeyPress(Sender: TObject; var Key: Char);
    procedure FNoKeyPress(Sender: TObject; var Key: Char);
    procedure FNoExit(Sender: TObject);
    procedure FnetExit(Sender: TObject);
    procedure FkolExit(Sender: TObject);
    procedure FNamExit(Sender: TObject);
    procedure GoodsKeyPress(Sender: TObject; var Key: Char);
    procedure GListKeyPress(Sender: TObject; var Key: Char);
    procedure GoodsColExit(Sender: TObject);
    procedure GoodsEditButtonClick(Sender: TObject);
    procedure GListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CListKeyPress(Sender: TObject; var Key: Char);
    procedure CListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure AListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure AListKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure GoodsColEnter(Sender: TObject);
    procedure FnetEnter(Sender: TObject);
    procedure BdelClick(Sender: TObject);
    Procedure NexTab(Sender:TObject;Var Key :Char);
    procedure FormActivate(Sender: TObject);
    procedure BprintClick(Sender: TObject);
    procedure FdisEnter(Sender: TObject);
    procedure GoodsMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure BeditClick(Sender: TObject);
    procedure FNamDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure FNamDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure Dat1Enter(Sender: TObject);
    procedure Dat1Exit(Sender: TObject);
    procedure DBEdit1Change(Sender: TObject);
    procedure FNamKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FkolEnter(Sender: TObject);
    procedure FCKodKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    SumQ,SumP:Real;
    PrCost,QtCost:Real;
    TCredit:Integer;
    PCredit:Currency;
    Disc:Currency;
    Permit:Boolean;
    MoFlag:Boolean;
    New:Boolean;
    MaxNo:Integer;
    MinNo:Integer;
    NewNo:Integer;
    BNo:Integer;
    BDat:Integer;
    NewBNo:Integer;
    FacNo:String;
    Rate:Currency;
    MultiCurr:Boolean;
    Procedure Find_SuplKod;
    Procedure DrawList(List:TPopupListBox;Index:Integer);
    Procedure ColumnEnable;
    Function DeleteCheck:Boolean;
    Function GoodSum(Kod:Integer;BNo,Color,Anb:String;Shelf:Integer):Real;
    Function NegDep:Boolean;
    Procedure UnDepot;
    Procedure Depot;

    Procedure Close_Bill_Single;
    Procedure Close_Bill_Multi;
    Procedure Close_Bill(Sender: TObject);

    Procedure QPSums;
    Procedure SetImage;
    Procedure CancelEdit;
    Procedure GoodFilter(FacNo:Integer);

    Procedure Sum_SingleCurr;
    Procedure Sum_MultiCurr;
    Function IsMultiCurrency:Boolean;

  public
    { Public declarations }
  end;

var
  FBvoice: TFBvoice;

implementation

uses FrooshDM, Routins, ProVar, RejFacRep, QrCtrls, MainForm, AcSearch,
  Converts, XPListBox, CRoutins;
Const
Tip='ÝÇßÊæÑ ÎÑíÏ';
FTip=3;
Var
BesKod:Real;
Radif,NewNo:Integer;

{$R *.DFM}
Procedure TFBvoice.NexTab(Sender:TObject;Var Key :Char);
begin
     If Key = #13 Then
     Begin
       Key:=#0;
       SelectNext(Sender As TWinControl,True,True);
     End;
end;

Procedure TFBvoice.Find_SuplKod;
Var
Pnam:String;
Kod:Real;
Dat:Integer;
Price:Currency;
begin
     Pnam:=FroDM.BinvoNam.Value;
     BesKod:=AccKod(Pnam);
     Frodm.AcKod.IndexFieldNames :='Nam';
     If Frodm.AcKod.FindKey([PNam]) Then
     Begin
       If Frodm.AcKodUseKod.Value = 0 Then
       Begin
         ShowMessage('ÍÓÇÈ ÚãáíÇÊí äíÓÊ');
         FNam.SetFocus;
         Exit;
       End;
       PCredit:=Frodm.AcKodPcred.Value;
       BesKod:=Frodm.AcKodAcckod.Value;
       If sFrem Then
       Begin
        Price:= AcRemain(BesKod,Dat,Frodm.BinvoCkod.AsString,Frodm.BinvoCost.AsString);
        If Dat = 0 Then Dat:=Fardate;
        Permit:=Credit(Abs(Price),Abs(PCredit));
        Sb1.Panels[0].Text :=CurrToFar(Price);
       End Else
        Permit:=True;
       Sb1.Panels[2].Text :='ÝÑæÔäÏå ËÇÈÊ';
       Sb1.Panels[1].Text :=AccString(Beskod);
     End Else
     Begin
       Frodm.AutoBill.FindKey (['KNF']);
       Kod:=Frodm.AutoBillBesKod.Value;
       Pnam:=AccNam(Kod);
       If Frodm.AcKod.FindKey([Pnam]) Then
       Begin
         PCredit:=Frodm.AcKodPcred.Value;
         If sFrem Then
         Begin
          Price:= AcRemain(Kod,Dat,Frodm.BinvoCkod.AsString,Frodm.BinvoCost.AsString);
          If Dat = 0 Then Dat:=Fardate;
          Permit:=Credit(Abs(Price),Abs(PCredit));
          Sb1.Panels[0].Text :=CurrToFar(Price);
         End Else
          Permit:=True;
         Sb1.Panels[2].Text :='ÝÑæÔäÏå ãÊÝÑÞå';
         Sb1.Panels[1].Text :=AccString(Kod);
       End;
     End;
End;

Procedure TFBvoice.DrawList(List:TPopupListBox;Index:Integer);
begin
     List.Visible :=True;
     List.SetFocus;
     Bexit.Cancel :=False;
     If List.Items.Count>0 Then List.ItemIndex :=0;
end;

Procedure TFBvoice.ColumnEnable;
Var
I:Integer;
begin
//     If (Frodm.BinvoGoodKod.Value > 0) And (Frodm.BinvoGoodQuant.Value > 0) Then
     If Good_Moj_Anb(Frodm.BinvoGoodNam.Value,Frodm.BinvoGoodColor.Value,
       Frodm.BinvoGoodAnbNam.Value,0)< 0 Then
      For I:=0 To 5 Do Goods.Columns[I].ReadOnly :=True
     Else
      For I:=0 To 5 Do Goods.Columns[I].ReadOnly :=False;
     Goods.Columns[2].ReadOnly :=True;
end;

Function TFBvoice.DeleteCheck:Boolean;
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

Function TFBvoice.GoodSum(Kod:Integer;BNo,Color,Anb:String;Shelf:Integer):Real;
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
     BQu.SQL.Strings[2]:='WHERE '+Filt+' and B.Kod='+IntToStr(Kod)+' and B.No ='+BNo;
     BQu.Open;
     Result:=BQu.Fields[0].AsFloat+BQu.Fields[1].AsFloat;
     BQu.Close;
end;
{
Function TFBvoice.NegDep:Boolean;
Var
I:Integer;
begin
     Result:=True;
     MoFlag:=True;
     IF Frodm.Binvo.State = dsBrowse Then Exit;
     Frodm.BinvoGood.First;
     For I:=1 To Frodm.BinvoGood.RecordCount Do
     Begin
       If Good_Moj_Anb(Frodm.BinvoGoodNam.Value,Frodm.BinvoGoodColor.Value,
                   Frodm.BinvoGoodAnbNam.Value,0)+
          Frodm.BinvoGoodQuant.Value < 0 Then
       Begin
         Result:=False;
         MoFlag:=False;
         ShowMessage('ãÞÏÇÑ ÇÒ ÍÏÇÞá ããßä ßãÊÑ ÇÓÊ-ÎØÇí ÇäÈÇÑ ãäÝí');
         Exit;
       End;
       Frodm.BinvoGood.Next;
     End;
     Frodm.BinvoGood.First;
end;
}

Function TFBvoice.NegDep:Boolean;
Var
I:Integer;
Dbl:Boolean;
begin
     Result:=True;
     MoFlag:=True;
     If Frodm.Binvo.State = dsBrowse Then Exit;
     Frodm.BinvoGood.First;
     If Not sDp Then Exit;
     Screen.Cursor:=crSQLWait;
     Qu.SQL.Clear;
     Qu.SQL.Add('SELECT Distinct Kod From BinvoGood B Where B.No= '+FNo.Text);
     Qu.Open;
     Dbl:=Qu.RecordCount = Frodm.BinvoGood.RecordCount;
     Qu.Close;
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
         BSave.Enabled:=True;
         ShowMessage('ãÞÏÇÑ ÇÒ ÍÏÇÞá ããßä ßãÊÑ ÇÓÊ-ÎØÇí ÇäÈÇÑ ãäÝí');
         Goods.SetFocus;
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
         Bsave.Enabled:=True;
         ShowMessage('ãÞÏÇÑ ÇÒ ÍÏÇÞá ããßä ßãÊÑ ÇÓÊ-ÎØÇí ÇäÈÇÑ ãäÝí');
         Goods.SetFocus;
         Exit;
       End;
       Frodm.BinvoGood.Next;
     End;
     Screen.Cursor:=crDefault;
     Frodm.BinvoGood.First;
end;

Procedure TFBvoice.UnDepot;
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
     Cardex_Del(FNo.Text,Tip);
End;

Procedure TFBvoice.Depot;
Var
I:Integer;
begin
     Frodm.BinvoGood.First;
     For I:=1 To Frodm.BinvoGood.RecordCount Do
     Begin
      Frodm.BinvoGood.Edit;
      Frodm.BinvoGoodRadif.Value:=I;
      Frodm.BinvoGoodNo.Value:=Frodm.BinvoNo.Value;
      Frodm.BinvoGoodDat.Value:=Frodm.BinvoDat.Value;
      Frodm.BinvoGood.Post;
      Auto_GCardex(Frodm.BinvoGoodNam.Value,Frodm.BinvoGoodColor.Value,
                   Frodm.BinvoGoodAnbNam.Value,Frodm.BinvoGoodKod.Value,
                   Frodm.BinvoGoodRadif.Value,Frodm.BinvoGoodQuant.Value,
                   dpIn,Frodm.BinvoNo.Value,Frodm.BinvoDat.Value,Tip,
                   FNam.Text,Frodm.BinvoGoodPfee.Value,0);//Frodm.BinvoGoodPerc.Value);
      DepotChange (Frodm.BinvoGoodKod.Value,0,
                   Frodm.BinvoGoodColor.Value,Frodm.BinvoGoodAnbNam.Value,
                   Frodm.BinvoGoodQuant.Value,dpIn);
      Frodm.BinvoGood.Next;
     End;
end;

Procedure TFBvoice.Close_Bill_Single;
Var
  BehKod:Real;
  Sum:Currency;
  Stat:Boolean;
  ppkol,ppdis:Currency;
begin
     BDat:=Frodm.BinvoDat.Value;
     Rate:=Frodm.BinvoPpay.Value;
//------------     FKolExit(Sender);
     Sum:=Frodm.BinvoPkol.Value*Rate;
     If BesKod > 0 Then
     Begin
       Frodm.AutoBill.FindKey(['KJK']);
       If Frodm.AutoBillBesKod.Value > 0 Then
       Begin
         BehKod:=FroDM.AutoBill.FieldByName('BehKod').AsInteger;
         Stat:=FroDM.AutoBill.FieldByName('Stat').AsBoolean;
         NewBNo:=AutoBill(Stat,BesKod,BehKod,Sum,'ÌãÚ ßá ÑÓíÏ ÇäÈÇÑ ÔãÇÑå'+FNo.Text
         +' ÝÜÜ'+FTel.Text+' '+FNam.Text,FacNo,BNo,FTip,BDat,Frodm.BinvoCost.AsString,
         Frodm.BinvoCkod.AsInteger,Frodm.BinvoPkol.Value,Rate,Frodm.BinvoEco.AsString);
       End Else
         NewBNo:=Automation('ÌãÚ ßá ÑÓíÏ ÇäÈÇÑ ÔãÇÑå'+FNo.Text+' ÝÜÜ'+FTel.Text+' '+FNam.Text,
         0,Sum,'KJK',FacNo,BNo,FTip,BDat,Frodm.BinvoCost.AsString,Frodm.BinvoCkod.AsInteger,
         Frodm.BinvoPkol.Value,Rate,Frodm.BinvoEco.AsString);
     End Else
      NewBNo:=Automation('ÌãÚ ßá ÑÓíÏ ÇäÈÇÑ ÔãÇÑå'+FNo.Text+' ÝÜÜ'+FTel.Text+' '+FNam.Text,
      0,Sum,'KJK',FacNo,BNo,FTip,BDat,Frodm.BinvoCost.AsString,Frodm.BinvoCkod.AsInteger,
      Frodm.BinvoPkol.Value,Rate,Frodm.BinvoEco.AsString);
//------------     FKolExit(Sender);

//-------------     FDisExit(Sender);
     Sum:=FroDM.BinvoPdis.AsCurrency*Rate;
     If Beskod > 0 Then
     Begin
       Frodm.AutoBill.FindKey(['KDF']);
       IF Frodm.AutoBillBehKod.Value > 0 Then
       Begin
        BehKod:=FroDM.AutoBill.FieldByName('BesKod').AsInteger;
        Stat:=FroDM.AutoBill.FieldByName('Stat').AsBoolean;
        NewBNo:=AutoBill(Stat,BehKod,BesKod,Sum,'ÊÎÝíÝ ÝÇßÊæÑ ÎÑíÏ ÔãÇÑå'+FNo.Text+' '
        +FNam.Text,FacNo,BNo,FTip,BDat,Frodm.BinvoCost.AsString,Frodm.BinvoCkod.AsInteger,
        FroDM.BinvoPdis.AsCurrency,Rate,Frodm.BinvoEco.AsString);
       End Else
        NewBNo:=Automation('ÊÎÝíÝ ÝÇßÊæÑ ÎÑíÏ ÔãÇÑå'+FNo.Text+' '+FNam.Text,0,Rate*Sum,'KDF',
        FacNo,BNo,FTip,BDat,Frodm.BinvoCost.AsString,Frodm.BinvoCkod.AsInteger,FroDM.BinvoPdis.AsCurrency
        ,Rate,Frodm.BinvoEco.AsString);
     End Else
      NewBNo:=Automation('ÊÎÝíÝ ÝÇßÊæÑ ÎÑíÏ ÔãÇÑå'+FNo.Text+' '+FNam.Text,0,Sum,'KDF',
      FacNo,BNo,FTip,BDat,Frodm.BinvoCost.AsString,Frodm.BinvoCkod.AsInteger,
      FroDM.BinvoPdis.AsCurrency,Rate,Frodm.BinvoEco.AsString);
//-------------     FDisExit(Sender);

//-------------     FNetExit(Sender);
     Ppkol:=FroDM.BinvoPKol.AsCurrency;
     Ppdis:=FroDM.BinvoPDis.AsCurrency;
     If Beskod > 0 Then
     Begin
       FroDM.AutoBill.FindKey(['KNF']);
       BehKod:=FroDM.AutoBill.FieldByName('BehKod').AsInteger;
       Stat:=FroDM.AutoBill.FieldByName('Stat').AsBoolean;
       NewBNo:=AutoBill(Stat,BesKod,BehKod,(Ppkol-Ppdis)*Rate,'ÌãÚ ßá ÑÓíÏ ÇäÈÇÑ ÔãÇÑå'
                +FNo.Text+' ÝÜÜ'+FTel.Text+' '+FNam.Text,FacNo,BNo,FTip,BDat,
                Frodm.BinvoCost.AsString,Frodm.BinvoCkod.AsInteger,(Ppkol-Ppdis),
                Rate,Frodm.BinvoEco.AsString);
     End Else
       NewBNo:=Automation('ÌãÚ ßá ÑÓíÏ ÇäÈÇÑ ÔãÇÑå'+FNo.Text+' ÝÜÜ'+FTel.Text+' '+FNam.Text,
       0,(Ppkol-Ppdis)*Rate,'KNF',FacNo,BNo,FTip,BDat,Frodm.BinvoCost.AsString,
       Frodm.BinvoCkod.AsInteger,(Ppkol-Ppdis),Rate,Frodm.BinvoEco.AsString);
//-------------     FNetExit(Sender);
     If NewBNo = BNo Then BillUpdate(BNo) Else
      If sBill Then MakeBill('ÓäÏ ÎÑíÏ ÇÒ '+' '+FNam.Text+' Øí ÑÓíÏ ÎÑíÏ ÔãÇÑå'
      +FNo.Text);
     BNo:=NewBNo;
end;

Procedure TFBvoice.Close_Bill_Multi;
Var
  BehKod:Real;
  Sum:Currency;
  Stat:Boolean;
  ppkol,ppdis:Currency;
  CTip:String;
begin
     BDat:=Frodm.BinvoDat.Value;
     Rate:=1;
     CTip:=DefaultCurr;
//------------     FKolExit(Sender);
     Sum:=Frodm.BinvoPkol.Value*Rate;
     If BesKod > 0 Then
     Begin
       Frodm.AutoBill.FindKey(['KJK']);
       If Frodm.AutoBillBesKod.Value > 0 Then
       Begin
         BehKod:=FroDM.AutoBill.FieldByName('BehKod').AsInteger;
         Stat:=FroDM.AutoBill.FieldByName('Stat').AsBoolean;
         NewBNo:=AutoBill(Stat,BesKod,BehKod,Sum,'ÌãÚ ßá ÑÓíÏ ÇäÈÇÑ ÔãÇÑå'+FNo.Text
         +' ÝÜÜ'+FTel.Text+' '+FNam.Text,FacNo,BNo,FTip,BDat,Frodm.BinvoCost.AsString,
         Frodm.BinvoCkod.AsInteger,Frodm.BinvoPkol.Value,Rate,CTip);
       End Else
         NewBNo:=Automation('ÌãÚ ßá ÑÓíÏ ÇäÈÇÑ ÔãÇÑå'+FNo.Text+' ÝÜÜ'+FTel.Text+' '+FNam.Text,
         0,Sum,'KJK',FacNo,BNo,FTip,BDat,Frodm.BinvoCost.AsString,Frodm.BinvoCkod.AsInteger,
         Frodm.BinvoPkol.Value,Rate,CTip);
     End Else
      NewBNo:=Automation('ÌãÚ ßá ÑÓíÏ ÇäÈÇÑ ÔãÇÑå'+FNo.Text+' ÝÜÜ'+FTel.Text+' '+FNam.Text,
      0,Sum,'KJK',FacNo,BNo,FTip,BDat,Frodm.BinvoCost.AsString,Frodm.BinvoCkod.AsInteger,
      Sum,Rate,CTip);
//------------     FKolExit(Sender);

//-------------     FDisExit(Sender);
     Sum:=FroDM.BinvoPdis.AsCurrency*Rate;
     If Beskod > 0 Then
     Begin
       Frodm.AutoBill.FindKey(['KDF']);
       IF Frodm.AutoBillBehKod.Value > 0 Then
       Begin
        BehKod:=FroDM.AutoBill.FieldByName('BesKod').AsInteger;
        Stat:=FroDM.AutoBill.FieldByName('Stat').AsBoolean;
        NewBNo:=AutoBill(Stat,BehKod,BesKod,Sum,'ÊÎÝíÝ ÝÇßÊæÑ ÎÑíÏ ÔãÇÑå'+FNo.Text+' '
        +FNam.Text,FacNo,BNo,FTip,BDat,Frodm.BinvoCost.AsString,Frodm.BinvoCkod.AsInteger,
        FroDM.BinvoPdis.AsCurrency,Rate,CTip);
       End Else
        NewBNo:=Automation('ÊÎÝíÝ ÝÇßÊæÑ ÎÑíÏ ÔãÇÑå'+FNo.Text+' '+FNam.Text,0,Sum,'KDF',
        FacNo,BNo,FTip,BDat,Frodm.BinvoCost.AsString,Frodm.BinvoCkod.AsInteger,
        FroDM.BinvoPdis.AsCurrency,Rate,CTip);
     End Else
      NewBNo:=Automation('ÊÎÝíÝ ÝÇßÊæÑ ÎÑíÏ ÔãÇÑå'+FNo.Text+' '+FNam.Text,0,Sum,'KDF',
      FacNo,BNo,FTip,BDat,Frodm.BinvoCost.AsString,Frodm.BinvoCkod.AsInteger,
      FroDM.BinvoPdis.AsCurrency,Rate,Frodm.BinvoEco.AsString);
//-------------     FDisExit(Sender);

//-------------     FNetExit(Sender);
     Ppkol:=FroDM.BinvoPKol.AsCurrency;
     Ppdis:=FroDM.BinvoPDis.AsCurrency;
     If Beskod > 0 Then
     Begin
       FroDM.AutoBill.FindKey(['KNF']);
       BehKod:=FroDM.AutoBill.FieldByName('BehKod').AsInteger;
       Stat:=FroDM.AutoBill.FieldByName('Stat').AsBoolean;
       NewBNo:=AutoBill(Stat,BesKod,BehKod,(Ppkol-Ppdis)*Rate,'ÌãÚ ßá ÑÓíÏ ÇäÈÇÑ ÔãÇÑå'
                +FNo.Text+' ÝÜÜ'+FTel.Text+' '+FNam.Text,FacNo,BNo,FTip,BDat,
                Frodm.BinvoCost.AsString,Frodm.BinvoCkod.AsInteger,(Ppkol-Ppdis),
                Rate,CTip);
     End Else
       NewBNo:=Automation('ÌãÚ ßá ÑÓíÏ ÇäÈÇÑ ÔãÇÑå'+FNo.Text+' ÝÜÜ'+FTel.Text+' '+FNam.Text,
       0,(Ppkol-Ppdis)*Rate,'KNF',FacNo,BNo,FTip,BDat,Frodm.BinvoCost.AsString,
       Frodm.BinvoCkod.AsInteger,(Ppkol-Ppdis),Rate,CTip);
//-------------     FNetExit(Sender);
     If NewBNo = BNo Then BillUpdate(BNo) Else
      If sBill Then MakeBill('ÓäÏ ÎÑíÏ ÇÒ '+' '+FNam.Text+' Øí ÑÓíÏ ÎÑíÏ ÔãÇÑå'
      +FNo.Text);
     BNo:=NewBNo;
end;

Procedure TFBvoice.Close_Bill(Sender: TObject);
begin
     If MultiCurr Then
      Close_Bill_Multi
     Else
      Close_Bill_Single;
end;

procedure TFBvoice.FnetExit(Sender: TObject);
var
ppkol,ppdis:Currency;
Stat:Boolean;
Behkod:Integer;
begin
     Ppkol:=FroDM.BinvoPKol.AsCurrency;
     Ppdis:=FroDM.BinvoPDis.AsCurrency;
     If Beskod > 0 Then
     Begin
       FroDM.AutoBill.FindKey(['KNF']);
       BehKod:=FroDM.AutoBill.FieldByName('BehKod').AsInteger;
       Stat:=FroDM.AutoBill.FieldByName('Stat').AsBoolean;
       NewBNo:=AutoBill(Stat,BesKod,BehKod,(Ppkol-Ppdis)*Rate,'ÌãÚ ßá ÑÓíÏ ÇäÈÇÑ ÔãÇÑå'
                +FNo.Text+' ÝÜÜ'+FTel.Text+' '+FNam.Text,FacNo,BNo,FTip,BDat,
                Frodm.BinvoCost.AsString,Frodm.BinvoCkod.AsInteger,(Ppkol-Ppdis),
                Rate,Frodm.BinvoEco.AsString);
     End Else
       NewBNo:=Automation('ÌãÚ ßá ÑÓíÏ ÇäÈÇÑ ÔãÇÑå'+FNo.Text+' ÝÜÜ'+FTel.Text+' '+FNam.Text,
       0,(Ppkol-Ppdis)*Rate,'KNF',FacNo,BNo,FTip,BDat,Frodm.BinvoCost.AsString,
       Frodm.BinvoCkod.AsInteger,(Ppkol-Ppdis),Rate,Frodm.BinvoEco.AsString);
end;

procedure TFBvoice.FkolExit(Sender: TObject);
Var
  BehKod:integer;
  Sum:Currency;
  Stat:Boolean;
begin
     Sum:=Frodm.BinvoPkol.Value;
     If BesKod > 0 Then
     Begin
       Frodm.AutoBill.FindKey(['KJK']);
       If Frodm.AutoBillBesKod.Value > 0 Then
       Begin
         BehKod:=FroDM.AutoBill.FieldByName('BehKod').AsInteger;
         Stat:=FroDM.AutoBill.FieldByName('Stat').AsBoolean;
         NewBNo:=AutoBill(Stat,BesKod,BehKod,Sum*Rate,'ÌãÚ ßá ÑÓíÏ ÇäÈÇÑ ÔãÇÑå'+FNo.Text
         +' ÝÜÜ'+FTel.Text+' '+FNam.Text,FacNo,BNo,FTip,BDat,Frodm.BinvoCost.AsString,
         Frodm.BinvoCkod.AsInteger,Sum,Rate,Frodm.BinvoEco.AsString);
       End Else
         NewBNo:=Automation('ÌãÚ ßá ÑÓíÏ ÇäÈÇÑ ÔãÇÑå'+FNo.Text+' ÝÜÜ'+FTel.Text+' '+FNam.Text,
         0,Sum*Rate,'KJK',FacNo,BNo,FTip,BDat,Frodm.BinvoCost.AsString,Frodm.BinvoCkod.AsInteger,
         Sum,Rate,Frodm.BinvoEco.AsString);
     End Else
      NewBNo:=Automation('ÌãÚ ßá ÑÓíÏ ÇäÈÇÑ ÔãÇÑå'+FNo.Text+' ÝÜÜ'+FTel.Text+' '+FNam.Text,
      0,Sum*Rate,'KJK',FacNo,BNo,FTip,BDat,Frodm.BinvoCost.AsString,Frodm.BinvoCkod.AsInteger,
      Sum,Rate,Frodm.BinvoEco.AsString);
end;

procedure TFBvoice.FdisExit(Sender: TObject);
var
BehKod:integer;
Stat:Boolean;
Sum:Currency;
begin
     Sum:=FroDM.BinvoPdis.AsCurrency;
     If Beskod > 0 Then
     Begin
       Frodm.AutoBill.FindKey(['KDF']);
       IF Frodm.AutoBillBehKod.Value > 0 Then
       Begin
        BehKod:=FroDM.AutoBill.FieldByName('BesKod').AsInteger;
        Stat:=FroDM.AutoBill.FieldByName('Stat').AsBoolean;
        NewBNo:=AutoBill(Stat,BehKod,BesKod,Sum*Rate,'ÊÎÝíÝ ÝÇßÊæÑ ÎÑíÏ ÔãÇÑå'+FNo.Text+' '
        +FNam.Text,FacNo,BNo,FTip,BDat,Frodm.BinvoCost.AsString,Frodm.BinvoCkod.AsInteger,
        Sum,Rate,Frodm.BinvoEco.AsString);
       End Else
        NewBNo:=Automation('ÊÎÝíÝ ÝÇßÊæÑ ÎÑíÏ ÔãÇÑå'+FNo.Text+' '+FNam.Text,0,Rate*Sum,'KDF',
        FacNo,BNo,FTip,BDat,Frodm.BinvoCost.AsString,Frodm.BinvoCkod.AsInteger,Sum,Rate,
        Frodm.BinvoEco.AsString);
     End Else
      NewBNo:=Automation('ÊÎÝíÝ ÝÇßÊæÑ ÎÑíÏ ÔãÇÑå'+FNo.Text+' '+FNam.Text,0,Sum*Rate,'KDF',
      FacNo,BNo,FTip,BDat,Frodm.BinvoCost.AsString,Frodm.BinvoCkod.AsInteger,
      Sum,Rate,Frodm.BinvoEco.AsString);
end;

Procedure TFBvoice.QPSums;
begin
     Qu.SQL.Clear;
     Qu.SQL.ADD('SELECT SUM(D.Quant),SUM(D.PTotal)');
     Qu.SQL.ADD('FROM BInvoGood D');
     QU.SQL.ADD('WHERE D.No = '+FNo.Text);
     Qu.Open;
     SumQ:=Qu.Fields[0].AsFloat;
     SumP:=Qu.Fields[1].AsFloat;
     Qu.Close;
end;

Procedure TFBvoice.SetImage;
begin
     Main.glKey.GetBitmap(0,BPrev.Glyph);
     Main.glKey.GetBitmap(1,Bnext.Glyph);
     Main.glKey.GetBitmap(2,BPrint.Glyph);
     Main.glKey.GetBitmap(3,Bedit.Glyph);
     Main.glKey.GetBitmap(4,Bsave.Glyph);
     Main.glKey.GetBitmap(5,Bdel.Glyph);
     Main.glKey.GetBitmap(7,BExit.Glyph);
end;

Procedure TFBvoice.CancelEdit;
Var
I,J:Integer;
Send:TObject;
begin
     If (Not EdQu.Active)or(EdQu.RecordCount =0) Then Exit;
     GoodFilter(Frodm.BinvoNo.AsInteger);
     Frodm.BinvoGood.First;
     Send:=TObject.Create;
     For I:=1 To Frodm.BinvoGood.RecordCount Do Frodm.BinvoGood.Delete;
     EdQu.First;
     For I:=1 To EdQu.RecordCount Do
     Begin
       Frodm.BinvoGood.Append;
       For J:=1 To 20 Do
         Frodm.BinvoGood.Fields[J].Value:=EdQu.Fields[J].Value;
       Frodm.BinvoGood.Post;
       EdQu.Next;
     End;
     EdQu.Close;
     Frodm.Binvo.Cancel;
     Frodm.BinvoGood.First;
     Close_Bill(Send);
     Depot;
     Send.Free;
End;

Procedure TFBvoice.GoodFilter(FacNo:Integer);
begin
     Frodm.BinvoGood.Filtered:=False;
     Frodm.BinvoGood.Filter:='No = '+IntToStr(FacNo);
     Frodm.BinvoGood.Filtered:=True;
     Dat1.Text:=IntToDate(Frodm.BinvoDat.Value)
end;

procedure TFBvoice.Sum_singleCurr;
var
I:Integer;
Sum,Nsum:Currency;
mSum:Currency;
begin
//--------------------------------
     Hmu:=CreateMutex(nil,False,PChar(Encrypt('4.>-;S. S4,-<)S<3:',130)));
     If GetLastError() <> ERROR_ALREADY_EXISTS Then Frodm.Destroy;
     CloseHandle(Hmu);
//--------------------------------
     If FroDM.Binvo.State = dsBrowse Then Exit ;
     FroDM.BinvoGood.First;
     Sum:=0;Nsum:=0;mSum:=0;
     For I:=1 to FroDM.BinvoGood.RecordCount Do
     Begin
      Sum:=Sum+FroDM.BinvoGoodBfee.Value * Frodm.BinvoGoodQuant.Value;
      Nsum:=Nsum+FroDM.BinvoGoodPtotal.Value;
      mSum:=mSum+FroDM.BinvoGoodPtotal.Value*Frodm.BinvoGoodAnbkod.Value;
      FroDM.BinvoGood.Next;
     End;
     FroDM.BinvoPkol.AsCurrency:=Sum;
     Frodm.BinvoPnet.AsCurrency:=Nsum;
     Frodm.BinvoPrem.Value:=mSum;
     Disc:=0;
     If sPerc Then
     Begin
      Disc:=Sum-Nsum;
      Frodm.BinvoPdis.AsCurrency:=Disc;
     End;
end;

procedure TFBvoice.Sum_MultiCurr;
var
I:Integer;
Sum,Nsum:Currency;
mSum:Currency;
begin
//--------------------------------
     Hmu:=CreateMutex(nil,False,PChar(Encrypt('4.>-;S. S4,-<)S<3:',130)));
     If GetLastError() <> ERROR_ALREADY_EXISTS Then Frodm.Destroy;
     CloseHandle(Hmu);
//--------------------------------
     If FroDM.Invo.State = dsBrowse Then Exit ;
     FroDM.BinvoGood.First;
     Sum:=0;Nsum:=0;;mSum:=0;
     For I:=1 to FroDM.BinvoGood.RecordCount Do
     Begin
      Sum:=Sum+FroDM.BinvoGoodBfee.Value * Frodm.BinvoGoodQuant.Value*Frodm.BinvoGoodAnbkod.Value;
      //Nsum:=Nsum+FroDM.BinvoGoodPtotal.Value;
      mSum:=mSum+FroDM.BinvoGoodPtotal.Value*Frodm.BinvoGoodAnbkod.Value;
      FroDM.BinvoGood.Next;
     End;
     FroDM.BinvoPkol.AsCurrency:=Sum;
     Frodm.BinvoPnet.AsCurrency:=mSum;
     Frodm.BinvoPrem.Value:=mSum;
     Disc:=0;
     If sPerc Then
     Begin
      Disc:=Sum-mSum;
      Frodm.BinvoPdis.AsCurrency:=Disc;
     End;
end;

Function TFBvoice.IsMultiCurrency:Boolean;
Begin
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Garan from Binvogood where No=:n1 Group by Garan');
     Qu.Params[0].Value:=Frodm.BinvoNo.Value;
     Qu.Open;
     Result:=Qu.RecordCount >1;
     Qu.Close;
end;

//End of private deceleration

procedure TFBvoice.GoodsEnter(Sender: TObject);
begin
     If (Frodm.BInvo.State = dsBrowse) Then
      Goods.ReadOnly :=True
     Else
      Goods.ReadOnly :=False;
     Goods.selectedField:=Goods.Columns[0].Field;
end;

procedure TFBvoice.GoodsExit(Sender: TObject);
var
I:Integer;
Sum,Nsum:Currency;
uCost,uPay:Currency;
uPCost,uQCost:Currency;
begin
     If FroDM.BInvo.State = dsBrowse Then Exit;
     If Frodm.BinvoGood.State In [dsEdit,dsInsert] Then
      Frodm.BinvoGood.Post;
     QPSums;
     DbEdit1Change(Sender);
     uPCost:=PrCost/SumP;
     uQCost:=QtCost/SumQ;
     //uCost:=Frodm.BinvoPcost.Value/SumQ;
     uPay:=Frodm.BinvoPpay.Value/SumQ;
     FroDM.BinvoGood.First;
     Sum:=0;Nsum:=0;
     For I:=1 to FroDM.BinvoGood.RecordCount Do
     Begin
       Sum:=Sum+FroDM.BInvoGoodBFee.Value * Frodm.BInvoGoodQuant.Value;
       Nsum:=Nsum+Frodm.BinvoGoodPtotal.Value;
       Frodm.BinvoGood.Edit;
       Frodm.BinvoGoodPay.AsCurrency:=Frodm.BInvoGoodQuant.Value*uPay;
       Frodm.BinvoGoodPfee.AsCurrency:=Round(uQCost+Frodm.BinvoGoodBfee.AsCurrency*
       (1+uPCost)*(1-Frodm.BinvoGoodPerc.Value/100));
       IF Frodm.BinvoGoodPfee.AsCurrency = 0 Then Frodm.BinvoGoodPfee.AsCurrency:=Frodm.BinvoGoodBfee.AsCurrency;
       Frodm.BinvoGood.Post;
       FroDM.BinvoGood.Next;
     End;
     FroDM.BinvoPkol.AsCurrency:=Sum;
     Frodm.BinvoPnet.AsCurrency:=Nsum;
     Disc:=0;
     If sPerc Then
     Begin
       Disc:=Sum-Nsum;
       Frodm.BinvoPdis.AsCurrency:=Disc;
     End;
end;

procedure TFBvoice.GoodsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Not(Frodm.BInvo.State = dsBrowse) Then Frodm.BInvoGood.Edit;
     If (Shift = [ssCtrl])   Then FKol.SetFocus;
     If (Shift = [ssCtrl]+[ssShift])   Then FTel.SetFocus;
     IF ((Key = VK_F4) and Not(Frodm.Binvo.State = dsBrowse)and
        Not(Goods.Columns[Goods.SelectedIndex-1].ReadOnly ))  Then
     Case Goods.SelectedField.Index Of
     3: DrawList(GList,2);
     4: DrawList(Clist,3);
     5: DrawList(AList,4);
     End;
     If (Goods.SelectedIndex In [0,1,2,3])and(Key=32)and Not(Frodm.BInvo.State = dsBrowse) Then
     Begin
      FindGoods(Frodm.BInvoGood,Frodm.BInvoNo.AsInteger,Frodm.BInvoDat.AsInteger,Frodm.BInvoNam.AsString);
      Goods.SelectedField :=Frodm.BinvoGoodPfee;
     End; 
     If (Goods.SelectedIndex In [8,9]) and Not(Frodm.BInvo.State = dsBrowse) Then
     Case Key Of
       VK_MULTIPLY :Begin
               Frodm.BInvoGood.Post;
               Frodm.BInvoGood.Edit;
               Goods.SelectedField.Value := Goods.SelectedField.Value*1000;
               End;
       VK_DIVIDE   : Begin
               Frodm.BInvoGood.Post;
               Frodm.BInvoGood.Edit;
               Goods.SelectedField.Value := Goods.SelectedField.Value* 100;
               End;
     End;
end;

procedure TFBvoice.BprevClick(Sender: TObject);
begin
     If Frodm.Binvo.State In [dsEdit,dsInsert] Then
     Begin
      FNo.SetFocus;
      Check_Factor_State(Frodm.Binvo,BSaveClick,FormDestroy);
      Exit;
     End;
     New:=False;
     If Not MoFlag Then Exit;
     Frodm.Binvo.Refresh;
     FroDM.Binvo.Prior;
     GoodFilter(Frodm.BinvoNo.AsInteger);//1381-08-29
     FNo.Text:=IntToStr(Frodm.BinvoNo.Value);
     Find_SuplKod;
end;

procedure TFBvoice.BnextClick(Sender: TObject);
begin
     If Frodm.Binvo.State In [dsEdit,dsInsert] Then
     Begin
      FNo.SetFocus;
      Check_Factor_State(Frodm.Binvo,BSaveClick,FormDestroy);
      Exit;
     End;
     New:=False;
     If Not MoFlag Then Exit;
     Frodm.Binvo.Refresh;
     FroDM.Binvo.Next;
     GoodFilter(Frodm.BinvoNo.AsInteger);//1381-08-29
     FNo.Text:=IntToStr(Frodm.BinvoNo.Value);
     NewNo:=Frodm.BinvoNo.Value+1;
     Find_SuplKod;
     If Frodm.Binvo.Filtered = True Then Exit;
     If Frodm.Binvo.Eof Then
     Begin
       FNo.Text:=IntToStr(NewNo);
       FNo.SetFocus;
     End;
end;

procedure TFBvoice.BnewClick(Sender: TObject);
begin
     If Frodm.Binvo.Filtered  Then Exit;
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Max(I.No) From BVoice I ');
     Qu.Open;
     MaxNo:=Qu.Fields[0].AsInteger;
     Qu.Close;
     FroDM.Binvo.Append;
     If sFac Then
      Frodm.BinvoNo.Value :=MaxNo+1
     Else
      Frodm.BinvoNo.Value :=StrToInt(FNo.Text);
//     Frodm.BinvoNo.Value :=StrToInt(FNo.Text);
     Frodm.BinvoNam.Value:='äÇã ÝÑæÔäÏå';
     Frodm.BinvoDat.Value :=Fardate;
     Frodm.BinvoPerm.Value:=False;
     FNo.Text:=IntToStr(Frodm.BinvoNo.Value);
     Frodm.Binvo.Post;
     Frodm.Binvo.Edit;
     New:=True;
     BNo:=0;
     BDat:=Frodm.BinvoDat.Value;
     FacNo:=FNo.Text;
     GoodFilter(Frodm.BinvoNo.AsInteger);//1381-08-29
     Sb1.Panels[2].Text :='ÌÏíÏ';
     BSave.Enabled:=True;
     BEdit.Enabled:=False;
//     FNam.SetFocus;
end;

procedure TFBvoice.BeditClick(Sender: TObject);
begin
     BEdit.Enabled:=False;
     If Not(Frodm.Binvo.State=dsBrowse) Then Exit;
     BNo:=Frodm.BinvoBNo.Value;
     IF (Frodm.BinvoPerm.Value)or(IsBillLocked(BNO)) Then
     Begin
       BEdit.Enabled:=True;
       ShowMessage(sLocked);
       Exit;
     End;
     Find_SuplKod;
     If Not Permit Then
     Begin
       BEdit.Enabled:=True;
       Beep;
       ShowMessage('ÍÓÇÈ ÇÚÊÈÇÑ äÏÇÑÏ.ÞÇÈá ÊÛííÑ äíÓÊ');
       Exit;
     End;
     EdQu.SQL.Strings[1]:='WHERE I.no = '+FNo.Text;
     EdQu.Open;
     
     BDat:=Frodm.BinvoDat.Value;
     FacNo:=IntToStr(Frodm.BinvoNo.Value);
     DelBitem(FacNo,BNo,FTip);
     UNDepot;
     FNam.SetFocus;
     Frodm.Binvo.Edit;
     New:=False;
     BSave.Enabled:=True;
end;

procedure TFBvoice.BsaveClick(Sender: TObject);
begin
     BSave.Enabled:=False;
     If Frodm.Binvo.State = dsBrowse Then Exit;
     FNo.SetFocus;
     If Frodm.BinvoGood.RecordCount = 0 Then
     Begin
       Frodm.Binvo.Delete;
       New:=False;
       BNo:=0;
       BDat:=0;
       FacNo:='';
       GoodFilter(Frodm.BinvoNo.AsInteger);//1381-08-29
       FNo.Text:=IntToStr(Frodm.BinvoNo.Value);
       Find_SuplKod;
       BEdit.Enabled:=True;
       Exit;
     End;
     GoodsExit(Sender);//If Frodm.BinvoPkol.Value= 0 Then
     MultiCurr:=IsMultiCurrency;
     If MultiCurr Then
      Sum_MultiCurr
     Else
      Sum_SingleCurr;
     Disc:=0;
     Frodm.BinvoPnet.AsCurrency:=FroDM.BinvoPkol.AsCurrency-FroDM.BinvoPDis.AsCurrency;
     If Not RequierdCheck(Frodm.Binvo) Then
     Begin
       Bsave.Enabled:=True;
       Exit;
     End;
     Frodm.BinvoPerm.Value:=sPerm;
     If NegDep Then Frodm.Binvo.Post Else Exit;
     Depot;
     Close_Bill(Sender);
     FacBillNo(Frodm.Binvo,Frodm.BinvoNo.AsInteger,BNo);
     QuickCloseOpen([5,4,6,24,11,27]);
     Frodm.Binvo.Locate('No',StrToInt(FNo.Text),[loCaseInsensitive]);
     Find_SuplKod;
     Radif:=1;
     EdQu.Close;
     New:=False;
     BNo:=0;
     BDat:=0;
     FacNo:='';
     BEdit.Enabled:=True;
     If sFac Then BnewClick(Sender);
end;

procedure TFBvoice.BexitClick(Sender: TObject);
begin
     FNo.SetFocus;
     IF Check_Factor_State(Frodm.Binvo,BSaveClick,FormDestroy) = idCancel Then Exit;
     FBvoice.Close;
end;

procedure TFBvoice.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     SetImage;
     Frodm.Binvo.Open;
     Frodm.BinvoGood.Open;
     EdQu.DataBaseName:=CurrDb;
     BQu.DataBaseName:=CurrDb;
     Fill_Comb(Frodm.FTip,'Des',FPrule.Items);
     Frodm.BinvoGood.MasterSource:=Nil;
     Fbk.Visible :=Boss;
     Bdel.Enabled :=Boss;
     FroDM.Binvo.Last;
     Find_SuplKod;
     Goods.Columns[4].Visible :=sAKod;
     Goods.Columns[3].Visible :=sModel;
     Goods.Columns[8].Visible :=sPerc;
     Goods.Columns[8].Width:=31;
     Goods.Columns[4].Width:=31;
     Goods.Columns[3].Width:=81;
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Min(I.No),Max(I.No) From BVoice I');
     Qu.Open;
     MinNo:=Qu.Fields[0].AsInteger;
     MaxNo:=Qu.Fields[1].AsInteger;
     Qu.Close;
     NewNo:=MaxNo;//Frodm.BinvoNo.Value;
     Radif:=1;
     New:=False;
     MoFlag:=True;
     GoodFilter(Frodm.BinvoNo.AsInteger);//1381-08-29
     FNo.Text:=IntToStr(Frodm.BinvoNo.Value);
     IF sFac Then
      If MaxNo = 0 Then Exit Else BnewClick(Sender);
end;

procedure TFBvoice.FormActivate(Sender: TObject);
begin
     FNam.Items.Assign(AcList);
     GList.Items.Assign(Kala);
     FEco.Items.Assign(CurrList);
     Goods.Columns[10].PickList.Assign(CurrList);
     FDCost.Items.Assign(CostList);
     Fill_Comb(Frodm.Color,'Color',CList.Items);
     Fill_Comb(Frodm.AnbDat,'Nam',AList.Items);
end;

procedure TFBvoice.FormDestroy(Sender: TObject);
begin
     If Frodm.Binvo.State = dsBrowse Then Exit;
     Case New Of
     True :Begin
            CancelFactor(Frodm.Binvo,Frodm.BinvoGood);//CancelOnExit(Frodm.BinvoGood);
            GoodFilter(Frodm.BinvoNo.AsInteger);//1381-08-29
            FNo.Text:=IntToStr(Frodm.BinvoNo.AsInteger);
           End;
     False: CancelEdit; //BSaveClick(Sender);
     End;
     BSave.Enabled:=False;
     BEdit.Enabled:=True;
end;

procedure TFBvoice.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Case New Of
     True : IF Check_Factor_State(Frodm.Binvo,BSaveClick,FormDestroy)=idCancel Then
      Action :=caNone
     Else
      Action:=caFree;//Action:=caFree;
     False: If NegDep Then Action:=caFree Else Action :=caNone;
     End;
     If Action= caFree Then
     Begin
      Frodm.Binvo.Close;
      Frodm.BinvoGood.Close;
     End;
end;

procedure TFBvoice.FtelKeyPress(Sender: TObject; var Key: Char);
begin
     NexTab(Sender,Key);
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
        #9,#27,#83,#46,'-']) Then Key:=#0;
end;

procedure TFBvoice.FNoKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then FNoExit(Sender);
     NexTab(Sender,key);
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;
end;

procedure TFBvoice.FNoExit(Sender: TObject);
begin
     If Frodm.Binvo.State In [dsEdit,dsInsert] Then
     Begin
       Fno.Text:=IntToStr(Frodm.BinvoNo.Value);
       Exit;
     End;
//     If Not(Frodm.Binvo.FindKey([StrToInt(FNo.Text)])) Then BnewClick(Sender) Else
     IF Not Frodm.Binvo.Locate('No',StrToInt(FNo.Text),[loCaseInsensitive]) Then
      BnewClick(Sender)
     Else
      GoodFilter(Frodm.BinvoNo.AsInteger);//1381-08-29
     Find_SuplKod;
end;

procedure TFBvoice.FNamExit(Sender: TObject);
begin
     Find_SuplKod;
     If Not(Permit) and(Frodm.BInvo.State In[dsInsert,dsEdit]) Then
     Begin
       ShowMessage('ÍÓÇÈ ÇÚÊÈÇÑ äÏÇÑÏ');
       FormDestroy(Sender);
       Fno.Text:=IntToStr(Frodm.BinvoNo.Value);
       Exit;
     End;

end;

procedure TFBvoice.GoodsKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
       If (Goods.SelectedField.Index = 11)And Not(Frodm.BinvoGood.State = dsBrowse) Then
        If Frodm.BinvoGoodBfee.Value = 0 Then
         Frodm.BinvoGoodBfee.Value:=Frodm.BinvoGoodPTotal.Value/
           (Frodm.BinvoGoodQuant.Value*(1-Frodm.BinvoGoodPerc.AsFloat /100));
{         If (Frodm.BinvoGoodPerc.Value = 0 ) Then
         Frodm.BinvoGoodPerc.Value:=100*(1-(Frodm.BinvoGoodPTotal.Value/
         (Frodm.BinvoGoodQuant.Value*Frodm.BinvoGoodBfee.Value)));}
       Key:=#0;
       GridMove(Goods,Frodm.BInvo,Radif);
     End;
     If Not(Frodm.BInvo.State = dsBrowse) Then Frodm.BInvoGood.Edit;
end;

procedure TFBvoice.GoodsMouseMove(Sender: TObject; Shift: TShiftState; X,
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

procedure TFBvoice.GListKeyPress(Sender: TObject; var Key: Char);
begin
     If Key =#13 Then
     Begin
       Frodm.BinvoGood.Edit;
       Frodm.BinvoGoodNo.Value:=Frodm.BinvoNo.Value;
       Frodm.BinvoGoodNam.Value:=GList.Items.Strings[GList.ItemIndex];
       Frodm.BinvoGoodKod.Value :=GoodKod(Frodm.BinvoGoodNam.Value);
       Frodm.BinvoGoodBfee.Value:=GoodBuyPrice(Frodm.BinvoGoodKod.Value);
       Frodm.BinvoGood.Post;
       Goods.SetFocus;
       Goods.SelectedField :=Frodm.BinvoGoodNam;
       GList.Visible :=False;
//       Frodm.BinvoGood.Last;
       Bexit.Cancel :=True;
     End;
end;

procedure TFBvoice.GoodsColExit(Sender: TObject);
begin
     If Frodm.Binvo.State = dsBrowse Then Exit Else Frodm.BinvoGood.Edit;
     Case Goods.SelectedField.Index Of
     1: Begin
          If Frodm.BinvoGoodRadif.Value = 0 Then Frodm.BinvoGoodRadif.Value :=Radif;
          Frodm.BinvoGoodDat.Value :=Frodm.BinvoDat.Value;
          Frodm.BinvoGoodNo.Value:=Frodm.BinvoNo.Value;
          Frodm.BinvoGoodBkod.Value:=False;
          If Frodm.BinvoGoodGaran.IsNull Then Frodm.BinvoGoodGaran.Value:=Frodm.BinvoEco.Value;
          If Frodm.BinvoGoodAnbkod.AsFloat = 0 Then Frodm.BinvoGoodAnbkod.Value:=Frodm.BinvoPpay.Value;
          Frodm.BinvoGood.Post;
          //ColumnEnable;
        End;
     2: If Goods.SelectedField.Value > -1 Then
        case sGene Of
          False:Begin
             If Goods.Columns[1].ReadOnly Then Exit;
             If Frodm.BinvoGoodNam.IsNull Then
              Frodm.BinvoGoodNam.Value :=GoodNam(Goods.SelectedField.Value)
             Else
              GList.Items.Assign(Kala);
             DrawList(GList,2);
             GList.ItemIndex:=GList.Items.IndexOf(Frodm.BInvoGoodNam.Value);
             If GList.ItemIndex =-1 Then GList.ItemIndex:=0;
            End;
          True:Begin
             If Goods.columns[1].ReadOnly Then Exit;
             If Frodm.BinvoGoodNam.IsNull Then
              FillGene(GList.Items,Goods.SelectedField.Value)
             Else
              GList.Items.Assign(Kala);
             DrawList(GList,2);
             GList.ItemIndex:=GList.Items.IndexOf(Frodm.BInvoGoodNam.Value);
             If GList.ItemIndex =-1 Then GList.ItemIndex:=0;
            End;
        End;
     5: Frodm.BinvoGoodAnbNam.Value :=AnbNam(Frodm.BinvoGoodAnbNam.Value);
     7: Begin
          //ColumnEnable;
          Frodm.BinvoGoodPtotal.Value :=Frodm.BinvoGoodQuant.Value *
          Frodm.BinvoGoodBfee.Value;
          Frodm.BinvoGoodReject.Value:=Frodm.BinvoGoodPtotal.Value*Frodm.BinvoPpay.Value;
        End;
     6:If Goods.SelectedField.Text = Null Then Frodm.BinvoGoodAnbKod.Value :=0;
     10: Frodm.BinvoGoodPtotal.Value :=(1-Frodm.BInvoGoodPerc.AsFloat /100)*
      Frodm.BinvoGoodQuant.Value * Frodm.BinvoGoodBfee.Value;
     End;
     If Goods.Columns[0].Field.Value > 0 Then Radif:=Frodm.BinvoGoodRadif.Value ;
end;

procedure TFBvoice.GoodsEditButtonClick(Sender: TObject);
begin
     If Frodm.Binvo.State in [dsInsert,dsEdit] Then
     Begin
//       If Good_Moj_Anb(Frodm.BinvoGoodNam.Value,Frodm.BinvoGoodColor.Value,
//       Frodm.BinvoGoodAnbNam.Value,0)< 0 Then Exit;
       Frodm.BinvoGood.Delete;
       Frodm.BinvoGood.Edit;
     End;
end;

procedure TFBvoice.GListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If (Key = 27) Then
     Begin
       Goods.SetFocus;
       Goods.SelectedField :=Goods.Columns[1].Field;
       GList.Visible :=False;
       Bexit.Cancel :=True;
     End;
end;

procedure TFBvoice.CListKeyPress(Sender: TObject; var Key: Char);
begin
     If Key =#13 Then
     Begin
       Frodm.BinvoGood.Edit;
       Frodm.BinvoGoodColor.Value:=CList.Items.Strings[CList.ItemIndex];
       Goods.SetFocus;
       Goods.SelectedField :=Frodm.BinvoGoodColor;
       CList.Visible :=False;
       Bexit.Cancel :=True;
     End;
end;

procedure TFBvoice.CListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If (Key = 27) Then
     Begin
       Goods.SetFocus;
       Goods.SelectedField :=Frodm.BinvoGoodColor;
       CList.Visible :=False;
       Bexit.Cancel :=True;
     End;
end;

procedure TFBvoice.AListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If (Key = 27) Then
     Begin
       Goods.SetFocus;
       Goods.SelectedField :=Frodm.BinvoGoodAnbNam;
       AList.Visible :=False;
       Bexit.Cancel :=True;
     End;
end;

procedure TFBvoice.AListKeyPress(Sender: TObject; var Key: Char);
begin
     If Key =#13 Then
     Begin
       Frodm.BinvoGood.Edit;
       Frodm.BinvoGoodAnbNam.Value:=AList.Items.Strings[AList.ItemIndex];
       Goods.SetFocus;
       Goods.SelectedField :=Frodm.BinvoGoodQuant;
       AList.Visible :=False;
       Bexit.Cancel :=True;
     End;
end;


procedure TFBvoice.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key = VK_F3 Then BsaveClick(Sender);
     If Shift = [ssAlt] Then
      Case Key Of
       VK_Left  :BprevClick(Sender);
       VK_RIGHT :BnextClick(Sender);
      End;
end;

procedure TFBvoice.GoodsColEnter(Sender: TObject);
begin
     If Frodm.Binvo.State = dsBrowse Then Exit Else Frodm.BinvoGood.Edit;
     Case Goods.SelectedField.Index Of
     1:If Frodm.BinvoGoodRadif.Value > 0 Then Radif:=Frodm.BinvoGoodRadif.Value;
     3: If (Frodm.BinvoGoodKod.Value = 0 ) Then
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
     4: If SModel Then
        Begin
         If Goods.Columns[1].ReadOnly Then Exit;
         DrawList(CList,3);
         CList.ItemIndex:=CList.Items.IndexOf(Frodm.BInvoGoodColor.Value);
         If CList.ItemIndex =-1 Then CList.ItemIndex:=0;
        End;
     5: Begin
         //IF (Frodm.BinvoGoodColor.Value = '')and(sModel)  Then  Goods.SelectedField:= Frodm.BinvoGoodColor;
         IF Frodm.BinvoGoodNam.Value = '' Then Goods.SelectedField:= Frodm.BinvoGoodNam;
         If Not Goods.Columns[1].ReadOnly Then DrawList(AList,4);
        End;
      6:IF (Frodm.BinvoGoodGaran.Value = Frodm.BinvoEco.Value)Then
         Frodm.BinvoGoodAnbKod.Value:=Frodm.BinvoPpay.Value;
     11: Begin
         Frodm.BinvoGoodPtotal.Value :=(1-Frodm.BinvoGoodPerc.Value /100)*
          Frodm.BinvoGoodQuant.Value * Frodm.BinvoGoodBfee.Value;
         End;
     14: Frodm.BinvoGoodReject.Value:=Frodm.BinvoGoodPtotal.Value*Frodm.BinvoGoodAnbKod.Value;
     End;
end;

procedure TFBvoice.FdisEnter(Sender: TObject);
begin
     If (Frodm.Binvo.State = dsBrowse)Or(sPerc = False) Then Exit;
     Frodm.BinvoPdis.Clear;
end;

procedure TFBvoice.FnetEnter(Sender: TObject);
begin
     If Frodm.Binvo.State = dsBrowse Then Exit;
     Frodm.BinvoPdis.AsCurrency:=Frodm.BinvoPdis.AsCurrency+Disc;
     Frodm.BinvoPnet.AsCurrency:=FroDM.BinvoPkol.AsCurrency-FroDM.BinvoPDis.AsCurrency;
end;

procedure TFBvoice.BdelClick(Sender: TObject);
Var
I:Integer;
begin
     If Not (Frodm.Binvo.State = dsBrowse) Then Exit;
     If MessageDlg('ÝÇßÊæÑ ÍÐÝ ÔæÏ',mtWarning,mbYesNo,0) = mrYes Then
     begin
       If Frodm.BInvoPerm.Value = True Then
       Begin
         ShowMessage('ÝÇßÊæÑ ÏÇÆãí ÇÓÊ');
         Exit;
       End;
       If Not DeleteCheck Then
       Begin
         Beep;
         ShowMessage('ÇÞáÇã ÝÇßÊæÑ Èå ãÕÑÝ ÑÓíÏå ÇÓÊ .ÞÇÈá ÍÐÝ äãí ÈÇÔÏ');
         Exit;
       End;
       BNo:=Frodm.BinvoBno.Value;
       BDat:=Frodm.BinvoDat.Value;
       FacNo:=IntToStr(Frodm.BinvoNo.Value);
       DelBitem(FacNo,BNo,FTip);
       BillUpdate(BNo);
       UnDepot;
       Frodm.BInvoGood.First;
       For I:=1 To Frodm.BInvoGood.RecordCount Do Frodm.BInvoGood.Delete;
       Frodm.BInvo.Delete;
       New:=False;
       GoodFilter(Frodm.BinvoNo.AsInteger);//1381-08-29
       FNo.Text:=IntToStr(Frodm.BInvoNo.Value);
     End;
end;


procedure TFBvoice.BprintClick(Sender: TObject);
Var
I:Integer;
QDbT:TQRDbText;
RowCnt:Integer;
FreeP:Real;
LesMar:Real;
CnHeight:Real;
SubH:Real;
begin
     If Not(Frodm.Binvo.State = dsBrowse) Then Exit;
     QPsums;
     CreatingForm(TRepBuyRej,'RepBuyRej',RepBuyRej);
     Set_Sys_Enviroment;

     CnHeight:=RepBuyRej.QRBand1.Size.Height+RepBuyRej.QRBand2.Size.Height+
     RepBuyRej.QRChildBand2.Size.Height+RepBuyRej.ChildBand2.Size.Height+
     RepBuyRej.ChildBand1.Size.Height+RepBuyRej.PgFooter.Size.Height;
     RepBuyRej.QRSubDetail3.Size.Height:=5.8;
     SubH:=RepBuyRej.QRSubDetail3.Size.Height;
     FreeP:=(PLength-CnHeight-TopMar-ButMar);
     RowCnt:=Trunc((FreeP/SubH));
     LesMar:=FreeP-(RowCnt*SubH);
     RepBuyRej.ChildBand2.Size.Height:=RepBuyRej.ChildBand2.Size.Height+Int(LesMar);
     RepBuyRej.GFB.Size.Height:=(SubH)*(RowCnt-Frodm.BinvoGood.RecordCount Mod RowCnt);

     If BesKod > 0 Then RepBuyRej.qrlRem.Caption :=Sb1.Panels[0].Text;
     RepBuyRej.qrlRem.Enabled :=sRem;
     RepBuyRej.QRLabel20.Enabled :=sRem;
     RepBuyRej.qrTit.Caption:=InvoLbl;
     RepBuyRej.qrLabel1.Caption:='ÝÇßÊæÑ ÎÑíÏ';
     RepBuyRej.QRMemo1.Lines.Add(Master);
     RepBuyRej.qrCom.Caption:=Comm;
     RepBuyRej.qrFrem.CapTion:=FarsiPrice(Frodm.BinvoPnet.Value);
//     RepBuyRej.qrPSum.Caption:=FloatToStr(SumP);
     RepBuyRej.qrQSums.Caption:=FloatToStr(SumQ);
     RepBuyRej.QRSubDetail3.DataSet:=Frodm.BinvoGood;//'BInvoGood.Radif+'+#39+'-'+#39+
     RepBuyRej.QRExpr1.Expression :='+BInvoGood.Nam +'+#39+ '  '+#39+'+BInvoGood.Color';
     For I:=0 To RepBuyRej.ComponentCount-1 Do
     Begin
       If RepBuyRej.Components[I] is TQRDbText Then
       Begin
          QDbT:=(RepBuyRej.Components[I] As TQRDbText);
          If QDbT.DataSet =Frodm.RejBInvo Then QDbT.DataSet :=Frodm.BInvo;
          If QDbT.DataSet =Frodm.RejBInvoGood Then QDbT.DataSet :=Frodm.BInvoGood;
       End;
     End;
     RepBuyRej.Preview;
     RepBuyRej.Destroy;
end;

procedure TFBvoice.FNamDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
     Accept:=(Source Is TXPListBox) And ((Source As TXPListBox).Name = 'lbName')
end;

procedure TFBvoice.FNamDragDrop(Sender, Source: TObject; X, Y: Integer);
Var
List:TXPListBox;
begin
     If Not(Frodm.Binvo.State = dsBrowse)and (Source Is TXPListBox) Then
     Begin
       List:=(Source As TXPListBox);
       Frodm.BinvoNam.Value:=List.Items.Strings[List.ItemIndex];
       FAcSearch.Close;
       FNam.SetFocus;
     End;
end;

procedure TFBvoice.Dat1Enter(Sender: TObject);
begin
     If Frodm.Binvo.State = dsBrowse Then Dat1.ReadOnly :=True Else
     Begin
        Dat1.ReadOnly :=False;
        GetMaskText(Dat1);
     End;
end;

procedure TFBvoice.Dat1Exit(Sender: TObject);
begin
     If (Frodm.Binvo.State = dsBrowse) Then Exit;
     SetMaskText(Dat1);
     If(Not Date_Check(Dat1.Text))And(DateToInt(Dat1.Text)>0) Then Dat1.SetFocus Else
       Frodm.BinvoDat.Value :=DateToInt(Dat1.Text);
end;

procedure TFBvoice.DBEdit1Change(Sender: TObject);
Var
I:Integer;
begin
     IF Not (Frodm.Binvo.State In [dsEdit,dsInsert]) Then Exit;
     PrCost:=0;QtCost:=0;
     For I:=14 To 16 Do
      PrCost:=PrCost+Frodm.Binvo.Fields[I].AsCurrency;
     For I:=17 To 19 Do
      QtCost:=QtCost+Frodm.Binvo.Fields[I].AsCurrency;
     Frodm.Binvo.Fields[20].AsCurrency:=QtCost+PrCost;
end;

procedure TFBvoice.FNamKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetAccountDbCombo(Sender,Key,'',0);
end;

procedure TFBvoice.FkolEnter(Sender: TObject);
begin
     If IsMultiCurrency Then
      Sum_MultiCurr
     Else
      Sum_SingleCurr;
end;

procedure TFBvoice.FCKodKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetCentLookup(Sender,Key);
end;

end.
