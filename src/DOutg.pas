unit DOutg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Db, DBTables, ComCtrls, ExtCtrls,
  Grids, DBGrids, DBCGrids, Menus, Buttons, PopupListBox, ppDB,
  ppParameter, ppStrtch, ppMemo, ppPrnabl, ppClass, ppCtrls, ppBands,
  ppCache, ppEndUsr, ppProd, ppReport, ppComm, ppRelatv, ppDBPipe, ppDBBDE,
  ppFormWrapper, ppRptExp;

type
  TFDout = class(TForm)
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
    DS: TDataSource;
    ppHavRep: TppReport;
    ppDesigner1: TppDesigner;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppHav: TppBDEPipeline;
    ppHavg: TppBDEPipeline;
    ppDBText7: TppDBText;
    ppParameterList1: TppParameterList;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppBDEPipeline1: TppBDEPipeline;
    BtnRep: TBitBtn;
    HQu: TQuery;
    ppReportExplorer1: TppReportExplorer;
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
    procedure FCKodKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnRepClick(Sender: TObject);

  private
    { Private declarations }
    Radif:Integer;
    MaxQuant:Real;
    MoFlag:Boolean;
    New:Boolean;
    MaxNo:Integer;
    MinNo:Integer;
    NewNo:Integer;
    BNo:Integer;
    BDat:Integer;
    FacNo:String;

    Function Decode(Var S:String):String;
    Function Encode:String;
    Procedure FillGList(GoodKod:Integer);
    Procedure DrawList(List:TPopupListBox;Index:Integer);
    Procedure InvoUpdate(IOid:Integer);
    Procedure SetImage;
    Procedure CancelEdit;
    Procedure GoodFilter(FacNo:Integer);

  public
    { Public declarations }
    Procedure FillFromPI(Sender:TObject;PINo:Integer);
  end;

var
  FDout: TFDout;

implementation

uses FrooshDM, FactorRep,Routins, ProVar, MainForm, AcSearch,
  GSearch, Converts, XPListBox, CRoutins, FactorRep2;

{$R *.DFM}
Const
Tip='ÍæÇáå ÝÑæÔ';
FTip=23;

Procedure TFDout.NexTab(Sender:TObject;Var Key :Char);
begin
     If Key = #13 Then
     Begin
       Key:=#0;
       SelectNext(Sender As TWinControl,True,True);
     End;
end;
//Procedure For Find Customers Kod If There is

Function TFDout.Decode(Var S:String):String;
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

Function TFDout.Encode:String;
begin
     Result:=Frodm.DepotNam.Value +'-'+Frodm.DepotColor.Value +'-'+
     Frodm.DepotAnbNam.Value+'-'+FloatToStr(Frodm.DepotQuant.Value);
end;

Procedure TFDout.FillGList(GoodKod:Integer);
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

procedure TFDout.DrawList(List: TPopupListBox; Index: Integer);
begin
     List.Visible :=True;
     Bexit.Cancel :=False;
     List.SetFocus;
     List.ItemIndex:=-1;
     List.ItemIndex:=List.Items.IndexOf(Goods.Columns[Index].Field.AsString);
     If List.ItemIndex = -1 Then  List.ItemIndex :=0;
end;

Procedure TFDout.InvoUpdate(IOid:Integer);
Var
Flt:String;
I:Integer;
begin
     Frodm.HavG.Open;
     Flt:=Frodm.HavG.Filter;
     Frodm.HavG.Filtered:=False;
     Frodm.DOutG.First;
     For I:=1 to Frodm.DOutG.RecordCount Do
     Begin
      If Frodm.HavG.Locate('Kod;No;Color',Vararrayof([Frodm.DOutGKod.AsInteger,Frodm.DOutGAnbkod.AsInteger,
      Frodm.DOutGColor.AsVariant]),[loCaseInsensitive]) Then
      Begin
       Frodm.HavG.Edit;
       Frodm.HavGReject.Value:=Frodm.HavGReject.Value+IOid*Frodm.DOutGQuant.Value;
       Frodm.HavG.Post;
      End;
      Frodm.DOutG.Next;
     End;
     Frodm.HavG.Filtered:=True;
     Frodm.HavG.Filter:=Flt;
     Frodm.DOutG.First;
end;

Procedure TFDout.FillFromPI(Sender:TObject;PINo:Integer);
Var
I,J:Integer;
begin
     IF PINo = 0 Then Exit;
     IF Frodm.DOut.State = dsBrowse Then Exit;
     IF Frodm.DOutG.RecordCount > 0 Then Exit;
     Frodm.Hav.Open;
     Frodm.Hav.Locate('No',PINo,[loCaseInsensitive]);
     Frodm.DOutNam.Value :=Frodm.HavNam.Value;
     Frodm.DOutCost.Value:=Frodm.HavCost.Value;
     Frodm.DOutCkod.Value:=Frodm.HavCkod.Value;
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Kod,Nam,Color,Radif,AnbNam,Quant,Reject,Serial ');
     Qu.SQL.Add('From DHavG P Where  P.No = '+IntToStr(PINo));//Quant-Qout > 0 and
     Qu.Open;
     Qu.First;
     //Goods.DataSource:=nil;
     J:=0;
     For I:=1 To Qu.RecordCount Do
     Begin
      If (Qu.Fields[5].AsFloat-Qu.Fields[6].AsFloat) > 0 Then
      Begin
       J:=J+1;
       Frodm.DOutG.Append;
       Frodm.DOutGNo.Value:=Frodm.DOutNo.Value;
       Frodm.DOutGDelikod.Value:=False;
       Frodm.DOutGkod.Value :=Qu.Fields[0].AsInteger;
       Frodm.DOutGNam.Value :=Qu.Fields[1].AsString;
       Frodm.DOutGDat.Value :=FRodm.DOutDat.Value;
       Frodm.DOutGColor.Value :=Qu.Fields[2].AsString;
       Frodm.DOutGRadif.Value :=J;//Qu.Fields[3].AsInteger;
       Frodm.DOutGAnbNam.Value:=Qu.Fields[4].AsString;
       Frodm.DOutGAnbKod.Value :=PINo;
       Frodm.DOutGQuant.Value :=Qu.Fields[5].AsFloat-Qu.Fields[6].AsFloat;
       Frodm.DOutGSerial.AsString:=Qu.Fields[7].AsString;
      //Frodm.DOutGReject.Value:=Qu.Fields[5].AsFloat;
       Frodm.DOutG.Post;
      End;
      Qu.Next;
     End;
     Qu.Close;
     //Goods.DataSource:=Frodm.DOutGDs;
     Goods.SetFocus;
     Frodm.DOutG.First;
     Frodm.DOutG.Edit;
end;


Procedure TFDout.SetImage;
begin
     Main.glKey.GetBitmap(0,BPrev.Glyph);
     Main.glKey.GetBitmap(1,Bnext.Glyph);
     Main.glKey.GetBitmap(2,BPrint.Glyph);
     Main.glKey.GetBitmap(3,Bedit.Glyph);
     Main.glKey.GetBitmap(4,Bsave.Glyph);
     Main.glKey.GetBitmap(5,Bdel.Glyph);
     Main.glKey.GetBitmap(7,BExit.Glyph);
end;

Procedure TFDout.CancelEdit;
Var
I,J:Integer;
begin
     If (Not EdQu.Active)or(EdQu.RecordCount =0) Then Exit;
     GoodFilter(Frodm.DOutNo.AsInteger);
     Frodm.DOutG.First;
     For I:=1 To Frodm.DOutG.RecordCount Do Frodm.DOutG.Delete;
     EdQu.First;
     For I:=1 To EdQu.RecordCount Do
     Begin
       Frodm.DOutG.Append;
       For J:=1 To 15 Do
         Frodm.DOutG.Fields[J].Value:=EdQu.Fields[J].Value;
       Frodm.DOutG.Post;
       EdQu.Next;
     End;
     EdQu.Close;
     Frodm.DOut.Cancel;
     Frodm.DOutG.First;
end;

Procedure TFDout.GoodFilter(FAcNo:Integer);
begin
     Frodm.DOutG.Filtered:=False;
     Frodm.DOutG.Filter:='No = '+IntToStr(FacNo);
     Frodm.DOutG.Filtered:=True;
     Dat1.Text:=IntToDate(Frodm.DOutDat.Value)
End;



//End Of Private decaleration

procedure TFDout.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     ppHavRep.Template.FileName:=Rdir+'\Reports\HavRep.rtm';
     ppHavRep.Template.LoadFromFile;
     Frodm.DOut.open;
     Frodm.DOutG.Open;
     EdQu.DataBaseName:=CurrDb;
     SetImage;
     SetGridWidth(Goods,'Nam',GWidth);
     Bdel.Enabled :=Boss;
     BtnRep.Visible:=Boss;
     Goods.Columns[3].Visible :=sModel;
     Goods.Columns[3].Width:=51;
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Min(I.No),Max(I.No) From DOut I');
     Qu.Open;
     MinNo:=Qu.Fields[0].AsInteger;
     MaxNo:=Qu.Fields[1].AsInteger;
     Qu.Close;
     Frodm.DOut.Refresh;
     Frodm.DOut.Last;
     NewNo:=MaxNo;
     FNo.Text :=IntToStr(Frodm.DOutNo.Value);
     GoodFilter(Frodm.DOutNo.AsInteger);//1381-08-29
     Radif:=1;
     MoFlag:=True;
     IF sFac Then
      If MaxNo = 0 Then Exit Else BnewClick(Sender);
end;

procedure TFDout.FormActivate(Sender: TObject);
begin
     FNam.Items.Assign(AcList);
     GList.Items.Assign(Kala);
     Goods.Columns[10].PickList.Assign(CurrList);
     FCost.Items.Assign(CostList);
     Fill_Comb(Frodm.Color,'Color',CList.Items);
     Fill_Comb(Frodm.AnbDat,'Nam',AList.Items);
end;

procedure TFDout.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key = VK_F3 Then BsaveClick(Sender);
     If Shift = [ssAlt] Then
      Case Key Of
       VK_Left:BprevClick(Sender);
       VK_RIGHT:BnextClick(Sender);
      End;
end;

procedure TFDout.FormDestroy(Sender: TObject);
begin
     If Frodm.DOut.State = dsBrowse Then Exit;
     Case New Of
     True  :Begin
             CancelFactor(Frodm.DOut,Frodm.DOutG);// CancelOnExit(Frodm.DOutG);
             GoodFilter(Frodm.DOutNo.AsInteger);//1381-08-29
             FNo.Text:=IntToStr(Frodm.DOutNo.Value);
             New:=False;
            End;
     False : CancelEdit; //BSaveClick(Sender);
     End;
     BSave.Enabled:=False;
     BEdit.Enabled:=True;
end;

procedure TFDout.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Case New Of
     True : IF Check_Factor_State(Frodm.DOut,BSaveClick,FormDestroy)=idCancel Then
      Action :=caNone
     Else
      Action:=caFree;
     False: If  Frodm.DOut.State =dsBrowse Then Action:=caFree Else Action :=caNone;
     End;
     If Action = caFree Then
     Begin
      Frodm.DOut.Close;
      Frodm.DOutG.Close;
     End;
end;

procedure TFDout.BprevClick(Sender: TObject);
begin
     If Frodm.DOut.State In [dsEdit,dsInsert] Then
     Begin
       FNo.SetFocus;
       IF Check_Factor_State(Frodm.DOut,BSaveClick,FormDestroy) = idCancel Then Exit;
       New:=False;
       Exit;
     End;
     If Not MoFlag Then Exit;
     Frodm.DOut.Refresh;
     FroDM.DOut.Prior;
     FNo.Text:=IntToStr(Frodm.DOutNo.Value);
     GoodFilter(Frodm.DOutNo.AsInteger);//1381-08-29
     NewNo:=Frodm.DOutNo.Value+1;
end;

procedure TFDout.BeditClick(Sender: TObject);
begin
     BEdit.Enabled:=False;
     If Not(Frodm.DOut.State=dsBrowse) Then Exit;
     IF Frodm.DOutBKod.Value Then
     Begin
       BEdit.Enabled:=True;
       ShowMessage('ÍæÇáå ÏÇÆãí ÇÓÊ.ÞÇÈá ÇÕáÇÍ äãí ÈÇÔÏ');
       Exit;
     End;
     FacNo:=IntToStr(Frodm.DOutNo.Value);
     BDat:=Frodm.DOutDat.Value;
     EdQu.SQL.Strings[1]:='WHERE I.No ='+FNo.Text;
     EdQu.Open;
     InvoUpdate(-1);
     FNam.SetFocus;
     Frodm.DOut.Edit;
     New:=False;
     BSave.Enabled:=True;
end;

procedure TFDout.BsaveClick(Sender: TObject);
begin
     If FroDM.DOut.State = dsBrowse Then Exit;
     BSave.Enabled:=False;
     FNo.SetFocus;
     If Frodm.DOutG.RecordCount = 0 Then
     Begin
       Frodm.DOut.Delete;
       New:=False;
       BDat:=0;
       BNo:=0;
       FacNo:='';
       GoodFilter(Frodm.DOutNo.AsInteger);//1381-08-29
       FNo.Text:=IntToStr(Frodm.DOutNo.Value);
       BEdit.Enabled:=True;
       Exit;
     End;
     If Not RequierdCheck(Frodm.DOut) Then
     Begin
       Bsave.Enabled:=True;
       Exit;
     End;
     Frodm.DOutBKod.Value:=sPerm;
     Frodm.DOut.Post;
     InvoUpdate(1);
     QuickCloseOpen([61,80,81]);
     Frodm.DOut.Locate('No',StrToInt(FNo.Text),[loCaseInsensitive]);
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

procedure TFDout.BdelClick(Sender: TObject);
Var
I:Integer;
begin
     If Not (Frodm.DOut.State = dsBrowse) Then Exit;
     If MessageDlg('ÝÇßÊæÑ ÍÐÝ ÔæÏ',mtWarning,mbYesNo,0) = mrYes Then
     begin
       If Frodm.DOutBKod.Value = True Then
       Begin
         ShowMessage('ÝÇßÊæÑ ÏÇÆãí ÇÓÊ');
         Exit;
       End;
       BNo:=Frodm.DOutBNo.Value;
       FacNo:=IntToStr(Frodm.DOutNo.Value);
       BDat:=Frodm.DOutDat.Value;
       InvoUpdate(-1);
       Frodm.DOutG.First;
       For I:=1 To Frodm.DOutG.RecordCount Do Frodm.DOutG.Delete;
       Frodm.DOut.Delete;
       GoodFilter(Frodm.DOutNo.AsInteger);//1381-08-29
       FNo.Text:=IntToStr(Frodm.DOutNo.Value);
       New:=False;
     End;
end;

procedure TFDout.BnextClick(Sender: TObject);
begin
     If Frodm.DOut.State In [dsEdit,dsInsert] Then
     Begin
       FNo.SetFocus;
       IF Check_Factor_State(Frodm.DOut,BSaveClick,FormDestroy) = idCancel Then Exit;
       New:=False;
       Exit;
     End;
     If Not MoFlag Then Exit;
     Frodm.DOut.Refresh;
     FroDM.DOut.Next;
     FNo.Text:=IntToStr(Frodm.DOutNo.Value);
     GoodFilter(Frodm.DOutNo.AsInteger);//1381-08-29
     NewNo:=Frodm.DOutNo.Value+1;
     If Frodm.DOut.Filtered = True Then Exit;
     If Frodm.DOut.Eof Then
     Begin
       FNo.Text:=IntToStr(NewNo);
       FNo.SetFocus;
     End;
end;


procedure TFDout.BnewClick(Sender: TObject);
begin
     If Frodm.DOut.Filtered Then Exit;
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Max(I.No) From DOut I ');
     Qu.Open;
     MaxNo:=Qu.Fields[0].AsInteger;
     Qu.Close;
     FroDM.DOut.Append;
     Frodm.DOutNam.Value:= 'äÇã ÎÑíÏÇÑ';
     If sFac Then
      Frodm.DOutNo.Value :=MaxNo+1
     Else
      Frodm.DOutNo.Value :=StrToInt(FNo.Text);
     Frodm.DOutDat.Value:=Fardate;
     Frodm.DOutBkod.Value:=False;
     FNo.Text:=IntToStr(Frodm.DOutNo.Value);
     Frodm.DOut.Post;
     Frodm.DOut.Edit;
     New:=True;
     FacNo:=FNo.Text;
     BNo:=0;
     BDat:=Frodm.DOutDat.Value;
     GoodFilter(Frodm.DOutNo.AsInteger);//1381-08-29
     Sb1.Panels[2].Text :='ÌÏíÏ';
     BSave.Enabled:=True;
     BEdit.Enabled:=False;
end;

procedure TFDout.BexitClick(Sender: TObject);
begin
     FNo.SetFocus;
     IF Check_Factor_State(Frodm.DOut,BSaveClick,FormDestroy)=idCancel Then Exit;
     Close;
end;

procedure TFDout.BprintClick(Sender: TObject);
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
     TahvilRep.QInv.Params[0].Value:=Frodm.DOutNo.Value;
     TahvilRep.QInvG.Params[0].Value:=Frodm.DOutNo.Value;
     TahvilRep.QInv.Open;
     TahvilRep.QInvG.Open;
     If Not bmpP1.Empty Then TahvilRep.Logo.Picture.Bitmap:=bmpP1;
     TahvilRep.User.Caption :=CUser.Name;
     TahvilRep.PrinterSettings.Copies:=StrToInt(InputBox(Cap,Cap1,'1'));
     If cbPrint.Checked Then TahvilRep.Print Else TahvilRep.Preview;
     TahvilRep.Destroy; }
     HQu.Close;
     HQu.Params[0].Value:=Frodm.DOutCkod.Value;
     HQu.Open;
     If cbPrint.Checked Then
      pphavRep.DeviceType:='Printer'
     Else
      ppHavRep.DeviceType:='Screen';
     ppHavRep.PrintReport;

end;

procedure TFDout.FNoKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then FNoExit(Sender);
     NexTab(Sender,Key);
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;
end;

procedure TFDout.FPINoKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then FillFromPI(Sender,StrToInt(FPINo.Text));
     NexTab(Sender,Key);
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;
end;

procedure TFDout.FtelKeyPress(Sender: TObject; var Key: Char);
begin
     NexTab(Sender,Key);
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
        #9,#27,#83,#46,'-']) Then Key:=#0;
end;

procedure TFDout.GoodsColEnter(Sender: TObject);
begin
     If Frodm.DOut.State = dsBrowse Then Exit Else Frodm.DOutG.Edit;
     Case Goods.SelectedField.Index Of
      1:IF Frodm.DOutGRadif.Value > 0 Then Radif:=Frodm.DOutGRadif.Value;
      3:If Goods.columns[1].ReadOnly Then FillGList(Frodm.DOutGKod.Value);
      4:If SModel Then
        Begin
         If Goods.Columns[1].ReadOnly Then Exit;
         Fill_Cond(Frodm.Depot,'Color','Kod='+Frodm.DOutGKod.AsString,CList.Items);
         DrawList(CList,3);
         CList.ItemIndex:=CList.Items.IndexOf(Frodm.DOutGColor.Value);
         If CList.ItemIndex =-1 Then CList.ItemIndex:=0;
        End;
     5: Begin
         IF (Frodm.DOutGColor.Value = '')and(sModel)  Then
           Goods.SelectedField:= Frodm.DOutGColor;
         IF Frodm.DOutGNam.Value = '' Then Goods.SelectedField:= Frodm.DOutGNam;
         If Not Goods.Columns[1].ReadOnly Then DrawList(AList,4);
        End;
     End;
end;

// Calculating The Depot and Acount Bill For Sold Goods
procedure TFDout.GoodsColExit(Sender: TObject);
begin
     If Frodm.DOut.State = dsBrowse Then Exit Else Frodm.DOutG.Edit;
     Case Goods.SelectedField.Index Of
     1:Begin
        IF Frodm.DOutGRadif.Value = 0 Then Frodm.DOutGRadif.Value :=Radif;
        Frodm.DOutGDat.Value :=Frodm.DOutDat.Value;
        Frodm.DOutGNo.Value:=Frodm.DOutNo.Value;
        Frodm.DOutGDelikod.Value:=False;
        Frodm.DOutGAnbkod.Value:=Frodm.DOutRefNo.Value;
        Frodm.DOutG.Post;
       End;
     2:Begin
        If Goods.columns[1].ReadOnly Then Exit;
        If {(sGene = 0) and }GoodState(Frodm.DOutGKod.Value) Then
        Begin
          uGood.Code:=Frodm.DOutGKod.Value;
          Frodm.DOutGNam.Value:=uGood.Name;// GoodNam();
          Exit;
        End;
        FillGList(Frodm.DOutGKod.Value);
       End;
     6:If Goods.SelectedField.Text = Null Then Goods.SelectedField.Value :=0;
     End;
     If Goods.Columns[0].Field.Value > 0 Then Radif:=Frodm.DOutGRadif.Value ;
end;

procedure TFDout.GoodsEditButtonClick(Sender: TObject);
begin
     If Frodm.DOut.State In [dsInsert,dsEdit] Then
     Begin
      Frodm.DOutG.Delete;
      Frodm.DOutG.Edit;
     End;
end;

procedure TFDout.GoodsEnter(Sender: TObject);
begin
     If (FroDM.DOut.State = dsBrowse) Or (Frodm.DOutBKod.Value = True) Then
       Goods.ReadOnly := True Else Goods.ReadOnly :=False;
     Goods.selectedField:=Goods.Columns[0].Field;
end;

procedure TFDout.GoodsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Not(Frodm.DOut.State = dsBrowse) Then Frodm.DOutG.Edit;
     If Shift = [ssCtrl]   Then  FPkol.SetFocus;
     If Shift = [ssCtrl]+[ssShift]  Then  FCKod.SetFocus;
     IF ((Key = VK_F4) and Not(Frodm.DOut.State = dsBrowse)and
        Not(Goods.Columns[Goods.SelectedIndex-1].ReadOnly ))  Then
      Case Goods.SelectedField.Index Of
      3: DrawList(GList,2);
      4: DrawList(Clist,3);
      5: DrawList(AList,4);
      End;
     If (Goods.SelectedIndex In [0,1,2,3])and(Key=32)and Not(Frodm.DOut.State = dsBrowse) Then
      If FindGoods(Frodm.DOutG,Frodm.DOutNo.AsInteger,Frodm.DOutDat.AsInteger,Frodm.DOutNam.AsString) Then
       Goods.SelectedField :=Frodm.DOutGPfee;
     If (Goods.SelectedIndex In [8,10]) and Not(Frodm.DOut.State = dsBrowse) Then
     Case Key Of
       VK_MULTIPLY :Begin
               Frodm.DOutG.Post;
               Frodm.DOutG.Edit;
               Goods.SelectedField.Value := Goods.SelectedField.Value*1000;
               End;
       VK_DIVIDE   : Begin
               Frodm.DOutG.Post;
               Frodm.DOutG.Edit;
               Goods.SelectedField.Value := Goods.SelectedField.Value* 100;
               End;
     End;
end;

procedure TFDout.GoodsKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
       If (Goods.SelectedField.Index = 11) and Not(Frodm.DOut.State =dsBrowse) Then
         If (Frodm.DOutGPfee.Value = 0 ) Then
          Frodm.DOutGPfee.Value:=Frodm.DOutGPTotal.Value /Frodm.DOutGQuant.Value;
       Key:=#0;
       GridMove(Goods,Frodm.DOut,Radif);
     End;
     If Not(Frodm.DOut.State = dsBrowse) Then Frodm.DOutG.Edit;
end;

procedure TFDout.GoodsMouseMove(Sender: TObject; Shift: TShiftState; X,
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

procedure TFDout.GListKeyPress(Sender: TObject; var Key: Char);
Var
S:String;
begin
     If Key=#13 Then
     Begin
     Key:=#0;
     s:=GList.Items.Strings[GList.ItemIndex];
     Case sDP Of
     True:Begin
      Frodm.DOutG.Edit;
      Frodm.DOutGNam.Value :=Decode(s);
      Frodm.DOutGColor.Value :=Decode(s);
      Frodm.DOutGAnbNam.Value :=Decode(s);
      Frodm.DOutGQuant.Value :=StrToFloat(Decode(s));
      MaxQuant:=Frodm.DOutGQuant.Value;
      Frodm.DOutGkod.Value :=GoodKod(Frodm.DOutGNam.Value);
      Frodm.DOutGPfee.Value :=GoodSoldPrice(Frodm.DOutGkod.Value);
      Frodm.DOutGNo.Value:=Frodm.DOutNo.Value;
      Frodm.DOutG.Post;
      Goods.SetFocus;
      Goods.SelectedField :=Goods.Columns[5].Field;
      GList.Visible :=False;
      Bexit.Cancel :=True;
     End;
     False:Begin
      Frodm.DOutG.Edit;
      uGood.Name:=S;
      Frodm.DOutGNam.Value :=s;
      Frodm.DOutGkod.Value :=uGood.Code;// GoodKod(Frodm.DOutGNam.Value);
      Frodm.DOutGPfee.Value :=uGood.SoldPrice;// GoodSoldPrice(Frodm.DOutGkod.Value);
      Frodm.DOutGNo.Value:=Frodm.DOutNo.Value;
      If uGood.IsService Then Frodm.DOutGQuant.Value:=1;
      Frodm.DOutG.Post;
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

procedure TFDout.FNoExit(Sender: TObject);
begin
     If Frodm.DOut.State In [dsEdit,dsInsert] Then
     Begin
       Fno.Text:=IntToStr(Frodm.DOutNo.Value);
       Exit;
     End;
     NewNo:=StrToInt(FNo.Text);
     FacNo:=FNo.Text;
//     If  Not(Frodm.DOut.FindKey([NewNo])) Then BnewClick(Sender) Else
     If Not(Frodm.DOut.Locate('No',NewNo,[loCaseInsensitive])) Then BNewClick(Sender) Else
     Begin
      GoodFilter(Frodm.DOutNo.AsInteger);//1381-08-29
      FacNo:=FNo.Text;
      BNo:=Frodm.DOutBno.Value;
      BDat:=Frodm.DOutDat.Value;
     End;
end;

procedure TFDout.GListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key = 27 Then
     Begin
       Goods.SetFocus;
       Frodm.DOutG.Delete;
       Frodm.DOutG.Append;
       Goods.SelectedField :=Frodm.DOutGRadif;
       GList.Visible :=False;
       Bexit.Cancel :=True;
     End;
end;

procedure TFDout.GListDblClick(Sender: TObject);
Var
Key:Char;
begin
     Key:=#13;
     GListKeyPress(Sender,Key);
end;

procedure TFDout.FNamDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
     Accept:=(Source Is TXPListBox) And ((Source As TXPListBox).Name = 'lbName')
end;

procedure TFDout.FNamDragDrop(Sender, Source: TObject; X, Y: Integer);
Var
List:TXPListBox;
begin
     If Not(Frodm.DOut.State = dsBrowse)and (Source Is TXPListBox) Then
     Begin
       List:=(Source As TXPListBox);
       Frodm.DOutNam.Value:=List.Items.Strings[List.ItemIndex];
       FAcSearch.Close;
       FNam.SetFocus;
     End;
end;

procedure TFDout.GoodsDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
     Accept:=(Source Is TXPListBox) And ((Source As TXPListBox).Name = 'lbGName');
     Accept:=Accept and (SGene = False);
end;

procedure TFDout.GoodsDragDrop(Sender, Source: TObject; X, Y: Integer);
Var
List:TXPListBox;
Key:Char;
begin
     If Not(Frodm.DOut.State = dsBrowse)and (Source Is TXPListBox) Then
     Begin
       List:=(Source As TXPListBox);
       If Frodm.DOutGNam.Value = '' Then Frodm.DOutG.Edit Else
        Frodm.DOutG.Append;
       Frodm.DOutGRadif.Value:=Frodm.DOutG.RecordCount+1;
       Frodm.DOutGKod.Value:=StrToInt(List.Hint);
       FGSearch.Close;
       FillGList(Frodm.DOutGKod.Value);
       If GList.Items.Count = 1 Then
       Begin
        GList.ItemIndex :=0;
        Key:=#13;
        GListKeyPress(Sender,Key);
       End;
     End;
end;

procedure TFDout.GoodsDblClick(Sender: TObject);
begin
     If Not(Frodm.DOut.State = dsBrowse) Then
      CreatingForm(TFGSearch,'FGSearch',FGSearch);
end;

procedure TFDout.Dat1Enter(Sender: TObject);
begin
     If Frodm.DOut.State = dsBrowse Then Dat1.ReadOnly :=True Else
     Begin
        Dat1.ReadOnly :=False;
        GetMaskText(Dat1);
     End;
end;

procedure TFDout.Dat1Exit(Sender: TObject);
begin
     If (Frodm.DOut.State = dsBrowse) Then Exit;
     SetMaskText(Dat1);
     If(Not Date_Check(Dat1.Text))And(DateToInt(Dat1.Text)>0) Then Dat1.SetFocus Else
       Frodm.DOutDat.Value :=DateToInt(Dat1.Text);
end;

procedure TFDout.FNamKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetAccountDbCombo(Sender,Key,'',0);
end;


procedure TFDout.CListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If (Key = 27) Then
     Begin
       Goods.SetFocus;
       Goods.SelectedField :=Frodm.DOutGColor;
       CList.Visible :=False;
       Bexit.Cancel :=True;
     End;
end;

procedure TFDout.CListKeyPress(Sender: TObject; var Key: Char);
begin
     If Key =#13 Then
     Begin
       Frodm.DOutG.Edit;
       Frodm.DOutGColor.Value:=CList.Items.Strings[CList.ItemIndex];
       Goods.SetFocus;
       Goods.SelectedField :=Frodm.DOutGColor;
       CList.Visible :=False;
       Bexit.Cancel :=True;
     End;
end;

procedure TFDout.AListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If (Key = 27) Then
     Begin
       Goods.SetFocus;
       Goods.SelectedField :=Frodm.DOutGAnbNam;
       AList.Visible :=False;
       Bexit.Cancel :=True;
     End;
end;

procedure TFDout.AListKeyPress(Sender: TObject; var Key: Char);
begin
     If Key =#13 Then
     Begin
       Frodm.DOutG.Edit;
       Frodm.DOutGAnbNam.Value:=AList.Items.Strings[AList.ItemIndex];
       Goods.SetFocus;
       Goods.SelectedField :=Frodm.DOutGQuant;
       AList.Visible :=False;
       Bexit.Cancel :=True;
     End;
end;

procedure TFDout.FCKodKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetCentLookup(Sender,Key);
end;

procedure TFDout.BtnRepClick(Sender: TObject);
begin
     ppDesigner1.Show;
end;

end.
