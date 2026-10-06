unit Goodbenef;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ExtCtrls, Db, Grids, DBGrids, DBTables, ComCtrls, Buttons;

type
  TFGoodBenef = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    FAccNam: TComboBox;
    SDat: TMaskEdit;
    EDat: TMaskEdit;
    FCentN: TComboBox;
    Bevel1: TBevel;
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
    RKQuPsum: TCurrencyField;
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
    rdbg: TDBGrid;
    kdbg: TDBGrid;
    Panel3: TPanel;
    CTree: TTreeView;
    Splitter1: TSplitter;
    spCalc: TSpeedButton;
    Splitter4: TSplitter;
    Panel4: TPanel;
    Label10: TLabel;
    Panel5: TPanel;
    Label5: TLabel;
    HQu: TQuery;
    StringField2: TStringField;
    FloatField2: TFloatField;
    HQuPsum: TCurrencyField;
    SmallintField1: TSmallintField;
    SmallintField2: TSmallintField;
    SmallintField3: TSmallintField;
    HDs: TDataSource;
    Panel6: TPanel;
    Label11: TLabel;
    Hdbg: TDBGrid;
    Splitter3: TSplitter;
    Splitter5: TSplitter;
    Panel7: TPanel;
    Panel8: TPanel;
    Label12: TLabel;
    RHQu: TQuery;
    StringField3: TStringField;
    FloatField3: TFloatField;
    RHQuPsum: TCurrencyField;
    SmallintField4: TSmallintField;
    SmallintField5: TSmallintField;
    SmallintField6: TSmallintField;
    RHDs: TDataSource;
    Rhdbg: TDBGrid;
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
    FSum:Currency;
    RSum:Currency;
    HSum:Currency;
    RHSum:Currency;
    Function MakeKQuFilter:String;
    Function MakeHQuFilter:String;
    Function MakeRKQuFilter:String;
  public
    { Public declarations }
  end;

var
  FGoodBenef: TFGoodBenef;

implementation

uses CRoutins, FrooshDM, ProVar, Routins, MainForm;

{$R *.DFM}

{ TFGoodBenef }

Function TFGoodBenef.MakeKQuFilter:String;
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

Function TFGoodBenef.MakeHQuFilter:String;
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
     If iSt <> '' Then iSt:='and I.No in (Select No From DHav V Where '+iSt+')';
     St:=St+iSt;

     Be:=DateToInt(SDat.Text);
     En:=DateToInt(EDat.Text);
     If Be=0 Then Be:=0;
     If En=0 Then En:=111111111;
     St:=St+' and I.Dat >= '+IntToStr(Be)+' and I.Dat <= '+IntToStr(En);
     Result:=St;
end;

Function TFGoodBenef.MakeRKQuFilter:String;
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


procedure TFGoodBenef.NextTab(Sender: TObject; var Key: Char);
begin
     If Key=#13 Then
     Begin
      Key:=#0;
      SelectNext(Sender As TWinControl,True,True);
     End;
end;

procedure TFGoodBenef.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFGoodBenef.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     Main.glKey.GetBitmap(8,spCalc.Glyph);
     Fill_Comb(Frodm.Invo,'Nam',FAccNam.Items);
     Fill_Comb(Frodm.Cent,CUser.CentField,FCentN.Items);
     MakeGoodTree(CTree);
     CTree.Selected:=Ctree.Items[0];
     KQu.DatabaseName:=CurrDb;
     RKQu.DatabaseName:=CurrDb;
     HQu.DatabaseName:=CurrDb;
     RHQu.DatabaseName:=CurrDb;
end;

procedure TFGoodBenef.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key of
     VK_F3: CTreeClick(Sender);
     VK_ESCAPE:Close;
     End;
end;

procedure TFGoodBenef.SDatEnter(Sender: TObject);
begin
     GetMaskText(SDat);
end;

procedure TFGoodBenef.SDatExit(Sender: TObject);
begin
     SetMaskText(SDat);
     If (Not Date_Check(SDat.Text))and(DateToInt(SDat.Text)>0) Then SDat.SetFocus;
end;

procedure TFGoodBenef.EDatEnter(Sender: TObject);
begin
     GetMaskText(EDat);
end;

procedure TFGoodBenef.EDatExit(Sender: TObject);
begin
     SetMaskText(EDat);
     If (Not Date_Check(EDat.Text))and(DateToInt(EDat.Text)>0) Then EDat.SetFocus;
end;


procedure TFGoodBenef.CTreeClick(Sender: TObject);
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
     HQu.Close;
     HQu.SQL.Strings[2]:=MakeHQuFilter;
     RHQu.Close;
     RHQu.SQL.Strings[2]:=MakeRKQuFilter;

     KQu.Open;
     RKQu.Open;
     HQu.Open;
     RHQu.Open;
     FSum:=0;
     For I:=1 To KQu.RecordCount Do
     Begin
      FSum:=FSum+KQuPsum.AsCurrency;
      KQu.Next;
     End;
     Panel5.Caption:=CurrToFar(FSum);
     KQu.First;
     KDbg.DataSource:=KDs;

     RSum:=0;
     For I:=1 To RKQu.RecordCount Do
     Begin
      RSum:=RSum+RKQuPsum.AsCurrency;
      RKQu.Next;
     End;
     Panel4.Caption:=CurrToFar(RSum);
     RKQu.First;
     RDbg.DataSource:=RKDs;

     HSum:=0;
     For I:=1 To HQu.RecordCount Do
     Begin
      HSum:=HSum+HQuPsum.AsCurrency;
      HQu.Next;
     End;
     Panel6.Caption:=CurrToFar(HSum);
     HQu.First;
     HDbg.DataSource:=HDs;

     RHSum:=0;
     For I:=1 To RHQu.RecordCount Do
     Begin
      RHSum:=RHSum+RHQuPsum.AsCurrency;
      RHQu.Next;
     End;
     Panel8.Caption:=CurrToFar(RHSum);
     RHQu.First;
     RHDbg.DataSource:=RHDs;

end;

procedure TFGoodBenef.FAccNamKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetAccountCombo(Sender,Key);
end;

procedure TFGoodBenef.FCentNKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetCentLookup(Sender,Key);
end;

end.
