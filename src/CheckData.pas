unit CheckData;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ComCtrls, StdCtrls;

type
  TDataCheck = class(TForm)
    Bevel1: TBevel;
    Label1: TLabel;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure HaveUpdate;
    Function AcountingCheck:Boolean;
    Function DepotDataCheck:Boolean;
  end;

var
  DataCheck: TDataCheck;

implementation

uses FrooshDM, Routins, ProVar, Anb_moj, MainForm,Db,DbTables,TINYLib_TLB;

{$R *.DFM}
Const
HavUpdate='update Dhavg '+
 'Set Reject =(Select Sum(G.Quant) From DoutG G Where G.Kod=Dhavg.kod '+
 'and G.Color=Dhavg.color and G.No in(Select K.No From Dout K where K.RefNo=Dhavg.No))';
InvUpdate='update InvoGood '+
 'Set Qout =(Select Sum(G.Quant) From DHavG G Where G.Kod=InvoGood.kod '+
 'and G.Color=InvoGood.color and G.No in(Select K.No From Dhav K where K.RefNo=InvoGood.No))';

Procedure TDataCheck.HaveUpdate;
Var
AcQu:TQuery;
begin
     AcQu:=TQuery.Create(Application);
     ACQu.DataBaseName:=CurrDb;
     AcQu.SQL.Clear;
     AcQu.SQL.Text:=HavUpdate;
     AcQu.ExecSQL;
     AcQu.SQL.Clear;
     AcQu.SQL.Text:=InvUpdate;
     AcQu.ExecSQL;
end;

Function TDataCheck.AcountingCheck:Boolean;
Var
ULCK:TTiny;
Code,I:Integer;
AcQu:TQuery;
Str:String;
begin
     Case USB Of
     False:
     Begin
{      Lck:=ThardLock.create(Application);
      Lck.LockClass:=Version4_Class_A;
      Lck.PortNo:=1;
      Lck.Check_System_File:=False;
      Code:=0;
      Lck.Password :=Encrypt('ha\U[XÄq"xU◊“{\',67);
      Lck.Connected :=True;
      For I:=1 To Length(Lck.SpecialID) Do Code:=Code+Ord(Lck.SpecialID[I]);
      If (Code <> 1323)OR(Encrypt(Lck.SpecialID,3) <> '∫°ûôùö‚∞°â°îùö')
       Then FState:=False;
      Lck.Connected:=False;
      LCK.Free;   }
     End;
     True:
     Begin
      ULCK:=TTiny.Create(Application);
      If Server <> '' Then
      Begin
       ULCK.ServerIP:=Server;
       ULCK.NetWorkINIT:=True
      End Else
       ULCK.Initialize:=True;
      ULCK.UserPassword :=Ccrypt('2muVmVrFZvFm+kO3p7IV5V/z3yif7vo5Pb11lBSBYg==');
      ULCK.ShowTinyInfo:=Not (ULCK.TinyErrCode in [1,2,3]);
      Code:=0;
      Str:=ULCK.SpecialID;
      For I:=1 To Length(Str) Do Code:=Code+Ord(Str[I]);
      If (Code <> 1323)OR(Encrypt(Str,3) <> '∫°ûôùö‚∞°â°îùö')Then  FState:=False;
      // Limit_Use('No',-1,20) Else Limit_Use('No',0,0);
      ULCK.ShowTinyInfo:=False;
      ULCK.Free;
     End;
     End;
     AcQu:=TQuery.Create(Application);
     ACQu.DataBaseName:=CurrDb;
     AcQu.SQL.Clear;
     AcQu.SQL.Add('SELECT Sum(Bed),Sum(Bes)');
     AcQu.SQL.Add('FROM AcountBill');
     AcQu.Active :=True;
     If AcQu.Fields[0].AsCurrency-AcQu.Fields[1].AsCurrency = 0 Then Result:=True Else
       Result:=False;
     AcQu.Active:=False;
     AcQu.Free;
end;

Function TDataCheck.DepotDataCheck:Boolean;
Var
I:Integer;
Rem:Real;
Filt:String;
DpQu:TQuery;
Label L1;
begin
     CreatingForm(TFAnb_Moj,'FAnb_Moj',FAnb_Moj);
     L1:
     FAnb_Moj.dbg.SetFocus;
     DpQu:=TQuery.Create(Application);
     DpQu.DataBaseName:=CurrDb;
     DpQu.SQL.Clear;
     DpQu.SQL.Add('Select Round(Sum(Quant*IOKod),2),Kod,Color,AnbNam');//,AnbKod');
     DpQu.SQL.Add('FROM Gcardex');
     DpQu.SQL.Add('Group By Kod,Color,AnbNam');//,AnbKod');
     DpQu.Open;
     Frodm.Depot.First;
     For I:=1 To Frodm.Depot.RecordCount Do
     Begin
       Filt:='Kod = '+IntToStr(Frodm.DepotKod.Value);
       If Frodm.DepotColor.AsString >'' Then Filt:=Filt+' and Color = '+#39+Frodm.DepotColor.AsString+#39;
       If Frodm.DepotAnbNam.AsString>'' Then Filt:=Filt+' and Anbnam ='+#39+Frodm.DepotAnbNam.AsString+#39;
       Rem:=Frodm.DepotQuant.AsFloat;
       DpQu.Filter:=Filt;
       DpQu.Filtered:=True;
       IF DpQu.Fields[0].AsFloat <> Rem Then
       Begin
         Result:=False;
         DpQu.Close;
         DpQu.Filter:='';
         DpQu.Free;

         FAnb_Moj.FacRepair:=True;
         FAnb_Moj.BrepairClick(FAnb_Moj.Owner);
         Goto L1;

         //Exit;
       End;
       Frodm.Depot.Next;
       DpQu.Filtered:=False;
     End;
     Result:=True;
     DpQu.Filter:='';
     DpQu.Close;
     DpQu.Free;
end;

procedure TDataCheck.FormCreate(Sender: TObject);
begin
     Set_Forms(DataCheck);
end;

procedure TDataCheck.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TDataCheck.FormActivate(Sender: TObject);
begin
     HaveUpdate;
     If Not AcountingCheck Then  ShowMessage('«”‰«œ Õ”«»œ«—Ì  —«“ ‰„Ì »«‘œ');
     If DepotDataCheck Then
     Begin
       FAnb_Moj.Close;
       DataCheck.Close;
     End Else
     Begin
       FAnb_Moj.FacRepair:=True;
       FAnb_Moj.BrepairClick(Sender);
       DepotDataCheck;
       DataCheck.Close;
       FAnb_Moj.Close;
     End;
end;

procedure TDataCheck.Button1Click(Sender: TObject);
begin
     Close;
end;

end.
