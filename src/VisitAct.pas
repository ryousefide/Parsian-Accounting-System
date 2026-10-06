unit VisitAct;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ExtCtrls, Db, DBTables, Grids, DBGrids;

type
  TFVisitAct = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    FVisitor: TComboBox;
    Dat1: TMaskEdit;
    Dat2: TMaskEdit;
    Bshow: TButton;
    Bevel1: TBevel;
    Bexit: TButton;
    DS: TDataSource;
    DBGrid1: TDBGrid;
    DS2: TDataSource;
    DBGrid2: TDBGrid;
    QuFroDes: TStringField;
    QuFroPSum: TCurrencyField;
    QuFroQSum: TFloatField;
    QuFroKol: TSmallintField;
    QuFroMo: TSmallintField;
    QuFroTaf: TSmallintField;
    QuFroQTCommision: TFloatField;
    QuFroPriceCommision: TFloatField;
    QuRej: TQuery;
    QuFro: TQuery;
    Panel1: TPanel;
    Label9: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    LQtSum: TLabel;
    LPsum: TLabel;
    LQtCom: TLabel;
    LPCom: TLabel;
    LCSum: TLabel;
    Label4: TLabel;
    Inv: TEdit;
    Panel2: TPanel;
    Label7: TLabel;
    Label12: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    LRQtSum: TLabel;
    LRPsum: TLabel;
    LRQtCom: TLabel;
    LRPCom: TLabel;
    LRCSum: TLabel;
    Label24: TLabel;
    Rej: TEdit;
    Frem: TEdit;
    QuRejDes: TStringField;
    QuRejQSum: TFloatField;
    QuRejPSum: TCurrencyField;
    QuRejQTCommision: TFloatField;
    QuRejPriceCommision: TFloatField;
    QuRejKol: TSmallintField;
    QuRejMo: TSmallintField;
    QuRejTaf: TSmallintField;
    LNet: TLabel;
    Label6: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Dat1Enter(Sender: TObject);
    procedure Dat1Exit(Sender: TObject);
    procedure Dat2Enter(Sender: TObject);
    procedure Dat2Exit(Sender: TObject);
    procedure NextTab(Sender: TObject; var Key: Char);
    procedure BshowClick(Sender: TObject);
    procedure BexitClick(Sender: TObject);
  private
    { Private declarations }
    InvSum,RejSum,Rem,Pay :Currency;
    InvQt,InvP,IQtC,IPC,InvC:Currency;
    RInvQt,RInvP,RIQtC,RIPC,RInvC:Currency;
    VCode:Integer;
    Perc:Real;
    SDat,Edat:Integer;
    Function Cal(Visitor:String):Currency;
  public
    { Public declarations }
  end;

var
  FVisitAct: TFVisitAct;

implementation

uses FrooshDM, Routins, ProVar;

{$R *.DFM}

procedure TFVisitAct.NextTab(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
       Key:=#0;
       FVisitAct.SelectNext(Sender As TWinControl ,True,True);
     End;
end;

Function TFVisitAct.Cal(Visitor:String):Currency;
begin
     VCode:=VisitCode(Visitor);
     Sdat:=DateToInt(Dat1.Text);
     Edat:=DateToInt(Dat2.Text);
     //If Frodm.Visit.FindKey([VCode]) Then Perc:=Frodm.VisitPerc.Value;
     Qu.SQL.Clear;
     Qu.SQL.Add('SELECT Sum(Pnet)');
     Qu.SQL.Add('FROM Invoice');
     Qu.SQL.Add('WHERE Visit ='+IntToStr(VCode)+' and Dat >= '+IntToStr(Sdat)+
                 ' and Dat <= '+IntToStr(EDat));
     Qu.Open;
     InvSum:=Qu.Fields[0].AsCurrency;
     Qu.Close;
     Qu.SQL.Strings[1]:='FROM RejInvo';
     Qu.Open;
     RejSum:=Qu.Fields[0].AsCurrency;
     Qu.Close;
     Rem:=InvSum-RejSum;
     Result:=Rem*Perc/100;
End;

procedure TFVisitAct.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     Fill_Comb(Frodm.Visit,'Nam',FVisitor.Items);
     QuFro.DatabaseName:=CurrDb;
     QuRej.DatabaseName:=CurrDb;
end;

procedure TFVisitAct.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFVisitAct.Dat1Enter(Sender: TObject);
begin
     GetMaskText(Dat1);
end;

procedure TFVisitAct.Dat1Exit(Sender: TObject);
begin
     SetMaskText(Dat1);
     If Not Date_Check(Dat1.Text) Then Dat1.SetFocus;

end;

procedure TFVisitAct.Dat2Enter(Sender: TObject);
begin
     GetMaskText(Dat2);
end;

procedure TFVisitAct.Dat2Exit(Sender: TObject);
begin
     SetMaskText(Dat2);
     If Not Date_Check(Dat2.Text) Then Dat2.SetFocus;

end;

procedure TFVisitAct.BshowClick(Sender: TObject);
Var
I:Integer;
Be,En:Integer;
begin
     QuFro.Close;
     QuRej.Close;
     Pay:=Cal(FVisitor.Text);
     Inv.Text:=CurrToFar(InvSum);
     Rej.Text:=CurrToFar(RejSum);
     FRem.Text:=CurrToFar(Rem);
     Be:=DateToInt(Dat1.Text);
     En:=DateToInt(Dat2.Text);
     If Be=0 Then Be:=0;
     If En=0 Then En:=111111111;
     QuFro.Params[0].Value:=Be;
     QuFro.Params[1].Value:=En;
     QuFro.Params[2].Value:=VCode;
     QuFro.Open;
     QuRej.Params[0].Value:=Be;
     QuRej.Params[1].Value:=En;
     QuRej.Params[2].Value:=VCode;
     QuRej.OPen;
     QuFro.First;
     InvQt:=0;InvP:=0;IQtC:=0;IPC:=0;InvC:=0;
     RInvQt:=0;RInvP:=0;RIQtC:=0;RIPC:=0;RInvC:=0;
     For I:=1 to QuFro.RecordCount Do
     Begin
      InvQt:=InvQt+QuFroQSum.Value;
      InvP:=InvP+QuFroPSum.Value;
      IQtC:=IQtC+QuFroQTCommision.Value;
      IPC:=IPC+QuFroPriceCommision.Value;
      QuFro.Next;
     End;
     QuFro.First;
     InvC:=IQtC+IPC;
     LQtsum.Caption:=FloatToStr(InvQt);
     LPSum.Caption:=CurrToFar(InvP);
     LQtCom.Caption:=CurrToFar(IQtC);
     LPCom.Caption:=CurrToFar(IPC);
     LCSum.Caption:=CurrToFar(Invc);

     QuFro.First;
     RInvQt:=0;RInvP:=0;RIQtC:=0;RIPC:=0;RInvC:=0;
     For I:=1 to QuRej.RecordCount Do
     Begin
      RInvQt:=RInvQt+QuRejQSum.Value;
      RInvP:=RInvP+QuRejPSum.Value;
      RIQtC:=RIQtC+QuRejQTCommision.Value;
      RIPC:=RIPC+QuRejPriceCommision.Value;
      QuRej.Next;
     End;
     QuRej.First;
     RInvC:=RIQtC+RIPC;
     LRQtsum.Caption:=FloatToStr(RInvQt);
     LRPSum.Caption:=CurrToFar(RInvP);
     LRQtCom.Caption:=CurrToFar(RIQtC);
     LRPCom.Caption:=CurrToFar(RIPC);
     LRCSum.Caption:=CurrToFar(RInvc);
     LNet.Caption:=CurrToFar(Invc-RInvc);
end;

procedure TFVisitAct.BexitClick(Sender: TObject);
begin
     FVisitAct.Close;
end;

end.
