unit CustEst;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ExtCtrls, Db, Grids, DBGrids, DBTables, ComCtrls, Buttons;

type
  TFCustEst = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    FAccNam: TComboBox;
    SDat: TMaskEdit;
    EDat: TMaskEdit;
    FCentN: TComboBox;
    GQu: TQuery;
    GDs: TDataSource;
    Bevel1: TBevel;
    GQuKod: TIntegerField;
    GQuNam: TStringField;
    GQuCOLUMN3: TFloatField;
    GQuCOLUMN4: TCurrencyField;
    KQu: TQuery;
    KDs: TDataSource;
    KQuPSum: TCurrencyField;
    KQuQSum: TFloatField;
    KQuKol: TSmallintField;
    KQuDes: TStringField;
    Bevel4: TBevel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    FKod1: TEdit;
    FKod2: TEdit;
    FKod3: TEdit;
    FKod31: TEdit;
    RKQu: TQuery;
    StringField1: TStringField;
    FloatField1: TFloatField;
    CurrencyField1: TCurrencyField;
    RKQuKol: TSmallintField;
    RKDs: TDataSource;
    KQuMo: TSmallintField;
    KQuTaf: TSmallintField;
    RKQuMo: TSmallintField;
    RKQuTaf: TSmallintField;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel1: TPanel;
    Splitter2: TSplitter;
    Panel2: TPanel;
    Label5: TLabel;
    Splitter3: TSplitter;
    Label10: TLabel;
    rdbg: TDBGrid;
    kdbg: TDBGrid;
    Panel3: TPanel;
    Gdbg: TDBGrid;
    RGdbg: TDBGrid;
    Splitter4: TSplitter;
    RGQu: TQuery;
    StringField2: TStringField;
    FloatField2: TFloatField;
    CurrencyField2: TCurrencyField;
    RGDs: TDataSource;
    Label11: TLabel;
    TabSheet2: TTabSheet;
    Label12: TLabel;
    FRem: TEdit;
    RQu3: TQuery;
    RDs3: TDataSource;
    Rdbg3: TDBGrid;
    RQu3RecDat: TIntegerField;
    RQu3BDat: TIntegerField;
    RQu3BNo: TStringField;
    RQu3Pbill: TCurrencyField;
    RQu3Bank: TStringField;
    Rdbg4: TDBGrid;
    RQu4: TQuery;
    RQu4RecDat: TIntegerField;
    RQu4BDat: TIntegerField;
    RQu4BNo: TStringField;
    RQu4Pbill: TCurrencyField;
    RQu4Bank: TStringField;
    RDs4: TDataSource;
    RQu4Reject: TBooleanField;
    RQu3Reject: TBooleanField;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    Rdbg1: TDBGrid;
    StaticText4: TStaticText;
    Rdbg2: TDBGrid;
    RQu1: TQuery;
    RQu1RecDat: TIntegerField;
    RQu1BDat: TIntegerField;
    RQu1BNo: TStringField;
    RQu1PBill: TCurrencyField;
    RQu1Bank: TStringField;
    RQu1Reject: TBooleanField;
    RDs1: TDataSource;
    RQu2: TQuery;
    RQu2RecDat: TIntegerField;
    RQu2BDat: TIntegerField;
    RQu2BNo: TStringField;
    RQu2PBill: TCurrencyField;
    RQu2Bank: TStringField;
    RQu2Reject: TBooleanField;
    RDs2: TDataSource;
    RQu3Acnam: TStringField;
    RQu3Ckod: TIntegerField;
    RQu4Acnam: TStringField;
    RQu4Ckod: TIntegerField;
    RQu1Acnam: TStringField;
    RQu1Ckod: TIntegerField;
    Label13: TLabel;
    FRSum1: TEdit;
    Label14: TLabel;
    FRSum2: TEdit;
    RQu2Acnam: TStringField;
    RQu2Ckod: TIntegerField;
    Label15: TLabel;
    FRsum3: TEdit;
    Label16: TLabel;
    TabSheet3: TTabSheet;
    dbg: TDBGrid;
    HVQu: TQuery;
    HVQuNo: TIntegerField;
    HVQuDat: TIntegerField;
    HVQuNam: TStringField;
    HVQuPkol: TCurrencyField;
    HVQuPdis: TCurrencyField;
    HVQuPnet: TCurrencyField;
    HVQuBkod: TBooleanField;
    HVQuBno: TIntegerField;
    HVQuCost: TStringField;
    HVQuCkod: TIntegerField;
    HVQuRefno: TIntegerField;
    HVQuDes: TStringField;
    HDs1: TDataSource;
    Splitter5: TSplitter;
    Panel4: TPanel;
    Goods: TDBGrid;
    HGQu: TQuery;
    HGQuRadif: TIntegerField;
    HGQuKod: TIntegerField;
    HGQuNam: TStringField;
    HGQuColor: TStringField;
    HGQuAnbnam: TStringField;
    HGQuAnbkod: TIntegerField;
    HGQuQuant: TFloatField;
    HGQuUnit: TStringField;
    HGQuReject: TFloatField;
    HGDs: TDataSource;
    Label17: TLabel;
    dbg2: TDBGrid;
    Splitter6: TSplitter;
    HG2Qu: TQuery;
    GQuDat: TIntegerField;
    GQuNo: TIntegerField;
    StringField3: TStringField;
    GQuCkod: TIntegerField;
    GQuNam_1: TStringField;
    GQuQuant: TFloatField;
    GQuUnit: TStringField;
    GQuReject: TFloatField;
    IntegerField1: TIntegerField;
    HG2Ds: TDataSource;
    CTree: TTreeView;
    Splitter1: TSplitter;
    HG2QuRefNo: TIntegerField;
    HG2QuPfee: TCurrencyField;
    HG2QuRemain: TFloatField;
    HG2QuRemFee: TFloatField;
    Label18: TLabel;
    FRGSum: TEdit;
    spCalc: TSpeedButton;
    procedure NextTab(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SDatExit(Sender: TObject);
    procedure EDatExit(Sender: TObject);
    procedure SDatEnter(Sender: TObject);
    procedure EDatEnter(Sender: TObject);
    procedure CTreeClick(Sender: TObject);
    procedure KQuAfterOpen(DataSet: TDataSet);
    procedure RKQuAfterOpen(DataSet: TDataSet);
    procedure spCalcClick(Sender: TObject);
    procedure HVQuAfterScroll(DataSet: TDataSet);
    procedure dbgDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbg2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FAccNamKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FCentNKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    FKol:SmallInt;// Integer;
    FMo:SmallInt;
    FTaf:SmallInt;
    sPath:String;
    Function MakeGQuFilter(Kol,Mo,Taf :Integer):String;
    Function MakeKQuFilter:String;
    Function MakeRKQuFilter:String;
    Function MakeCheqFilter:String;
    Function MakeHavFilter:String;
  public
    { Public declarations }
  end;

var
  FCustEst: TFCustEst;

implementation

uses CRoutins, FrooshDM, ProVar, Routins, MainForm;

{$R *.DFM}

{ TFCustEst }

Function TFCustEst.MakeGQuFilter(Kol,Mo,Taf :Integer):String;
Var
St:String;
Be,En:Integer;
begin
     St:='Where  I.No=G.No ';
     Be:=DateToInt(SDat.Text);
     En:=DateToInt(EDat.Text);
     If Be=0 Then Be:=0;
     If En=0 Then En:=111111111;
     St:=St+' and I.Dat >= '+IntToStr(Be)+' and I.Dat <= '+IntToStr(En);
     If FAccNam.Text <>'' Then St:=St+' and I.Nam = '+QuotedStr(FAccNam.Text);
     If FCentN.Text <> ''  Then St:=St+' and I.Ckod = '+IntToStr(CentKod(FCentN.Text));
     If Kol >0 Then St:=St+' and G.Kod in (Select kod from Goods G where G.Kol='+IntToStr(Kol);
     If Mo >0 Then St:=St+' and G.Mo= '+IntToStr(Mo);
     If Taf >0 Then St:=St+' and G.Taf='+IntToStr(Taf);
     If Kol >0 Then St:=St+')';
     Result:=St;
end;

Function TFCustEst.MakeKQuFilter:String;
Var
St:String;
iSt:String;
Be,En:Integer;
begin
     St:='WHERE I.Kod IN (SELECT Kod FROM  Goods G  ';
     If Fkol > 0  Then St:=St+'WHERE G.Kol = H.Kol and G.Mo=H.Mo ' else St:=St+'WHERE G.Kol = H.Kol';
     If FMo  > 0  Then St:=St+'  AND G.Taf = H.Taf';
     //If FTaf > 0  Then St:=St+'  AND G.taf = H.taf ';
     St:=St+')';

     If Fkol > 0  Then St:=St+' and H.Kol='+FKod1.Text else St:=St+' and H.Kol>0 and H.Mo=0 and H.Taf=0 ';
     If FMo  > 0  Then St:=St+' and H.Mo='+FKod2.Text+' and H.Taf>0 ' else If Fkol > 0  Then St:=St+' and H.Mo>0 and H.Taf=0 ';
     If FTaf > 0  Then St:=St+' and H.Taf='+FKod3.Text;
     iSt:='';//I.No in (Select No From Invoice  ';
     If FAccNam.Text <>'' Then iSt:=iSt+' and V.Nam = '+QuotedStr(FAccNam.Text);
     If FCentN.Text <> ''  Then iSt:=iSt+' and V.Ckod = '+IntToStr(CentKod(FCentN.Text));
     If Pos(' and',iSt) = 1 Then Delete(iSt,1,4);
     If iSt <> '' Then iSt:='and I.No in (Select No From Invoice V Where '+iSt+')';
     St:=St+iSt;

     Be:=DateToInt(SDat.Text);
     En:=DateToInt(EDat.Text);
     If Be=0 Then Be:=0;
     If En=0 Then En:=111111111;
     St:=St+' and I.Dat >= '+IntToStr(Be)+' and I.Dat <= '+IntToStr(En);
     Result:=St;
end;

Function TFCustEst.MakeRKQuFilter:String;
Var
St:String;
iSt:String;
Be,En:Integer;
begin
     St:='WHERE I.Kod IN (SELECT Kod FROM  Goods G  ';//WHERE  G.Kol = H.Kol AND G.Mo = H.Mo AND G.taf = H.taf ';
     If Fkol > 0  Then St:=St+'WHERE G.Kol = H.Kol and G.Mo=H.Mo ' else St:=St+'WHERE G.Kol = H.Kol';
     If FMo  > 0  Then St:=St+'  AND G.Taf = H.Taf';
     //If FTaf > 0  Then St:=St+'  AND G.taf = H.taf ';
     St:=St+')';

     If Fkol > 0  Then St:=St+' and H.Kol='+FKod1.Text else St:=St+' and H.Kol>0 and H.Mo=0 and H.Taf=0 ';
     If FMo  > 0  Then St:=St+' and H.Mo='+FKod2.Text+' and H.Taf>0 ' else If Fkol > 0  Then St:=St+' and H.Mo>0 and H.Taf=0 ';
     If FTaf > 0  Then St:=St+' and H.Taf='+FKod3.Text;
     iSt:='';//I.No in (Select No From Invoice  ';
     If FAccNam.Text <>'' Then iSt:=iSt+' and V.Nam = '+QuotedStr(FAccNam.Text);
     If FCentN.Text <> ''  Then iSt:=iSt+' and V.Ckod = '+IntToStr(CentKod(FCentN.Text));
     If Pos(' and',iSt) = 1 Then Delete(iSt,1,4);
     If iSt <> '' Then iSt:='and I.No in (Select No From RejInvo V Where '+iSt+')';
     St:=St+iSt;

     Be:=DateToInt(SDat.Text);
     En:=DateToInt(EDat.Text);
     If Be=0 Then Be:=0;
     If En=0 Then En:=111111111;
     St:=St+' and I.Dat >= '+IntToStr(Be)+' and I.Dat <= '+IntToStr(En);
     Result:=St;
end;

Function TFCustEst.MakeCheqFilter:String;
Var
St:String;
begin
     St:='';
     If FAccNam.Text <>'' Then St:=St+' and Acnam = '+QuotedStr(FAccNam.Text);
     If FCentN.Text <> ''  Then St:=St+' and Ckod = '+IntToStr(CentKod(FCentN.Text));
     If Pos(' and',St) = 1 Then Delete(St,1,4);
     Result:=St;
end;

Function TFCustEst.MakeHavFilter:String;
Var
St:String;
begin
     St:='';
     If FAccNam.Text <>'' Then St:=St+' and Nam = '+QuotedStr(FAccNam.Text);
     If FCentN.Text <> ''  Then St:=St+' and Ckod = '+IntToStr(CentKod(FCentN.Text));
     If Pos(' and',St) = 1 Then Delete(St,1,4);
     Result:=St;
end;

procedure TFCustEst.NextTab(Sender: TObject; var Key: Char);
begin
     If Key=#13 Then
     Begin
      Key:=#0;
      SelectNext(Sender As TWinControl,True,True);
     End;
end;

procedure TFCustEst.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFCustEst.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     Main.glKey.GetBitmap(8,spCalc.Glyph);
     Fill_Comb(Frodm.Invo,'Nam',FAccNam.Items);
     Fill_Comb(Frodm.Cent,CUser.CentField,FCentN.Items);
     MakeGoodTree(CTree);
     CTree.Selected:=Ctree.Items[0];
     KQu.DatabaseName:=CurrDb;
     RKQu.DatabaseName:=CurrDb;
     GQu.DatabaseName:=CurrDb;
     RGQu.DatabaseName:=CurrDb;
     RQu1.DatabaseName:=CurrDb;
     RQu2.DatabaseName:=CurrDb;
     RQu3.DatabaseName:=CurrDb;
     RQu4.DatabaseName:=CurrDb;
     HVQu.DatabaseName:=CurrDb;
     HGQu.DatabaseName:=CurrDb;
     HG2Qu.DatabaseName:=CurrDb;
end;

procedure TFCustEst.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key of
     VK_F3: spCalcClick(Sender);
     VK_ESCAPE:Close;
     End;
end;

procedure TFCustEst.SDatEnter(Sender: TObject);
begin
     GetMaskText(SDat);
end;

procedure TFCustEst.SDatExit(Sender: TObject);
begin
     SetMaskText(SDat);
     If (Not Date_Check(SDat.Text))and(DateToInt(SDat.Text)>0) Then SDat.SetFocus;
end;

procedure TFCustEst.EDatEnter(Sender: TObject);
begin
     GetMaskText(EDat);
end;

procedure TFCustEst.EDatExit(Sender: TObject);
begin
     SetMaskText(EDat);
     If (Not Date_Check(EDat.Text))and(DateToInt(EDat.Text)>0) Then EDat.SetFocus;
end;


procedure TFCustEst.CTreeClick(Sender: TObject);
Var
I,J,Idx:Integer;
Node:TTreeNode;
Flt,KolFlt:String;
Q1:Real;
begin
     Node:=cTree.Selected;
     FKol:=0;FMo:=0;FTaf:=0;sPath:='';
     FKod1.Clear;FKod2.Clear;FKod3.Clear;FKod31.Clear;
     //If Node.Level <1 Then Exit;
     For I:=ctree.Selected.Level DownTo 0 Do
     Begin
      Case Node.Level Of
      3: FTaf:=Node.OverlayIndex;
      2: FMo :=Node.OverlayIndex;
      1: FKol:=Node.OverlayIndex;
      End;
      Case Node.Level Of
      3: sPath:=Node.Text;//sPath+'<--'+
      2: sPath:=sPath+'<--'+Node.Text;
      1: sPath:=sPath+'<--'+Node.Text;
      End;
      Node:=Node.Parent;
     End;
     IF FKol>0 Then FKod1.Text:=IntToStr(FKol);
     IF FMo>0 Then FKod2.Text:=IntToStr(FMo);
     IF FTaf>0 Then FKod3.Text:=IntToStr(FTaf);
     IF FTaf>0 Then FKod31.Text:=IntToStr(FTaf);
     KQu.Close;
     KQu.SQL.Strings[2]:=MakeKQuFilter;
     RKQu.Close;
     RKQu.SQL.Strings[2]:=MakeRKQuFilter;

     KQu.Open;
     RKQu.Open;
end;

procedure TFCustEst.KQuAfterOpen(DataSet: TDataSet);
begin
     GQu.Close;
     GQu.SQL.Strings[2]:=MakeGQuFilter(KQuKol.AsInteger,KQuMo.AsInteger,KQuTaf.AsInteger);
     GQu.Open;
end;

procedure TFCustEst.RKQuAfterOpen(DataSet: TDataSet);
begin
     RGQu.Close;
     RGQu.SQL.Strings[2]:=MakeGQuFilter(RKQuKol.AsInteger,RKQuMo.AsInteger,RKQuTaf.AsInteger);
     RGQu.Open;
end;

procedure TFCustEst.spCalcClick(Sender: TObject);
Var
Dat:Integer;
CFilt,HFilt:String;
Rem,Sum:Real;
begin
     CTreeClick(Sender);
     Rem:=AcRemain(AccKod(FAccNam.Text),Dat,FCentN.Text,'');
     FRem.Text:=CurrToFar(Rem);
     CFilt:=MakeCheqFilter;
     HFilt:=MakeHavFilter;
     RQu1.Close;
     RQu2.Close;
     RQu3.Close;
     RQu4.Close;
     RQu1.Filter:=CFilt;
     RQu1.Filtered:=True;
     RQu2.Filter:=CFilt;
     RQu2.Filtered:=True;
     RQu3.Filter:=CFilt;
     RQu3.Filtered:=True;
     RQu4.Filter:=CFilt;
     RQu4.Filtered:=True;
     RQu1.Open;
     RQu2.Open;
     RQu3.Open;
     RQu4.Open;
     HvQu.Close;
     HGQu.Close;
     HG2Qu.Close;
     HvQu.Filter:=HFilt;
     HvQu.Filtered:=True;
     HG2Qu.Filter:=HFilt;
     HG2Qu.Filtered:=True;
     HVQu.Open;
     HG2Qu.Open;

     Sum:=0;
     For Dat:=1 To RQu1.RecordCount Do
     Begin
      Sum:=Sum+RQu1PBill.AsCurrency;
      RQu1.Next;
     End;
     RQu1.First;
     FRSum1.Text:=CurrToFar(Sum);
     Rem:=Rem+Sum;
     Sum:=0;

     For Dat:=1 To RQu2.RecordCount Do
     Begin
      Sum:=Sum+RQu2PBill.AsCurrency;
      RQu2.Next;
     End;
     RQu2.First;
     FRSum2.Text:=CurrToFar(Sum);
     Rem:=Rem+Sum;
     Sum:=0;
     FRSum3.Text:=CurrToFar(Rem);

     For Dat:=1 To HG2Qu.RecordCount Do
     Begin
      Sum:=Sum+HG2QuRemfee.AsCurrency;
      HG2Qu.Next;
     End;
     HG2Qu.First;
     FRGSum.Text:=CurrToFar(Sum);
     Sum:=0;

{     For Dat:=1 To RQu3.RecordCount Do
     Begin
      Sum:=Sum+RQu3PBill.AsCurrency;
      RQu3.Next;
     End;
     RQu3.First;
     FRSum3.Text:=CurrToFar(Sum);
     Sum:=0;

     For Dat:=1 To RQu4.RecordCount Do
     Begin
      Sum:=Sum+RQu4PBill.AsCurrency;
      RQu4.Next;
     End;
     RQu4.First;
     FRSum4.Text:=CurrToFar(Sum); }

end;

procedure TFCustEst.HVQuAfterScroll(DataSet: TDataSet);
begin
     HGQu.Close;
     HGQu.Params[0].Value:=HVQuNo.Value;
     HgQu.open;
end;

procedure TFCustEst.dbgDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
Var
DrawRect: TRect;
begin
    if (Column.Field.FieldName ='Ckod' ) then
    Begin
     DrawRect:=Rect;
     dbg.Canvas.FillRect(DrawRect);
     If Not Column.Field.IsNull Then
     dbg.Canvas.Textout(DrawRect.Left+4,DrawRect.Top,CentName(Column.Field.Value));
    End;
end;

procedure TFCustEst.dbg2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
Var
DrawRect: TRect;
begin
    if (Column.Field.FieldName ='Ckod' ) then
    Begin
     DrawRect:=Rect;
     dbg2.Canvas.FillRect(DrawRect);
     If Not Column.Field.IsNull Then
     dbg2.Canvas.Textout(DrawRect.Left+4,DrawRect.Top,CentName(Column.Field.Value));
    End;
end;


procedure TFCustEst.FAccNamKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetAccountCombo(Sender,Key);
end;

procedure TFCustEst.FCentNKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetCentLookup(Sender,Key);
end;

end.
