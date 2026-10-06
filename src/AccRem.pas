unit AccRem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls;

type
  TFAcRem = class(TForm)
    Rems: TDBGrid;
    rgAcc: TRadioGroup;
    Panel1: TPanel;
    Bexit: TButton;
    Bprint: TButton;
    rgFilt: TRadioGroup;
    PrgB: TProgressBar;
    Bshow: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BexitClick(Sender: TObject);
    procedure BprintClick(Sender: TObject);
    procedure RemsKeyPress(Sender: TObject; var Key: Char);
    procedure RemsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure rgAccClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BedBes(Sender: TObject);
    procedure EBedBes(Sender: TObject);
  private
    { Private declarations }
    Permit:Boolean;
    Procedure CreditCheck;
    Function Make_Filter:String;
  public
    { Public declarations }
  end;

var
  FAcRem: TFAcRem;

implementation

uses FrooshDM, ProVar, Routins, GardeshRep, DbTables, Converts, CRoutins;

{$R *.DFM}
Function TFAcRem.Make_Filter:String;
Var
Str:String;
begin
     Str:='';
     Case rgFilt.ItemIndex of
     0: Str:=Str+' and Arem > 0';
     1: Str:=Str+' and Brem > 0';
     2: Str:=Str+' and Arem > 0 Or BRem > 0';
     End;
     If Pos(' and',Str) = 1 Then Delete(Str,1,4);
     Result:=Str;
end;

Procedure TFAcRem.CreditCheck;
Var
I,Dat:Integer;
Rem,Baghi:Currency;

begin
//---Begin of AccRem
     Screen.Cursor:=crHourGlass;
     Rems.DataSource:=Nil;
     Frodm.AcKod.First;
     Open_G(Frodm.Gardesh);
     Frodm.AcKod.Filter :='Pcred <> 0';//  Or Tcred > 0';
     Frodm.AcKod.Filtered :=True;
     Frodm.AcKod.First;
     PrgB.Position:=0;
     PrgB.Max:=Frodm.AcKod.RecordCount;
     Baghi:=0;
     For I:=1 To Frodm.AcKod.RecordCount Do
     Begin
       { TODO :  ⁄ÌÌ‰ „—ò“ Ê Å—ÊéÂ »—«Ì „«‰œÂ êÌ—Ì }
       Rem:=AcRemain(Frodm.AckodAccKod.Value,Dat,'','');
       Permit:=Credit(Abs(Rem),Frodm.AcKodPCred.Value);
       PrgB.Position:=I;
       Frodm.Gardesh.Append;
       Frodm.GardeshDesc.Value :=Frodm.AcKodNam.Value;
       Frodm.GardeshDat.Value :=Dat;
       Baghi:=Baghi+Rem;
       If Rem > 0 Then Frodm.GardeshBedeh.Value :=Rem Else
          Frodm.GardeshBestan.Value :=Abs(Rem);
       If Permit Then Frodm.GardeshNo.Value :=1 Else Frodm.GardeshNo.Value :=0;
       Frodm.GardeshBaghi.Value :=Baghi;
       Frodm.Gardesh.Post;
       Frodm.AcKod.Next;
     End;
     Frodm.AcKod.Filtered :=False;
     Rems.DataSource:=Frodm.GardeshDs;
     Screen.Cursor:=crDefault;
end;


procedure TFAcRem.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Frodm.Gardesh.Filtered:=False;
     Open_G(Frodm.Gardesh);
     Action:=caFree;
end;

procedure TFAcRem.FormCreate(Sender: TObject);
begin
     Set_Forms(FAcRem);
end;

procedure TFAcRem.BedBes(Sender: TObject);
Var
I,Dat:Integer;
Rem,Baghi:Currency;
Rqu:TQuery;
begin
//---Begin of AccRem
//     Rems.DataSource:=Nil;
     Screen.Cursor:=crHourGlass;
     Open_G(Frodm.Gardesh);
     Rqu:=TQuery.Create(Owner);
     Rqu.DataBaseName:=CurrDb;
     Rqu.SQL.Add('SELECT Sum(Bed) ARem,Sum(Bes) BRem,AccNam,Max(Dat) FROM AcountBill ');//,AcKod
     Rqu.SQL.Add('WHERE Tip=0 and (AcKod Between 1004000000000 and 1005000000000) ');
     Rqu.SQL.Add('Or (AcKod Between 2006000000000 and 2007000000000) ');
     //Rqu.SQL.Add('Or (AcKod >10000000000) ');
     Rqu.SQL.Add('Group By AccNam');
     Rqu.SQL.Add('Order By 3 ');
     Rqu.Open;
     RQu.Filter:=Make_Filter;
     RQu.Filtered:=True;
     PrgB.Position:=0;
     PrgB.Max:=Rqu.RecordCount;
     Rqu.First;
     Baghi:=0;
     Dat:=Fardate;
     For I:=1 To Rqu.RecordCount Do
     Begin
       PrgB.Position:=Rqu.RecNo;
       Rem:=Rqu.Fields[0].AsCurrency-Rqu.Fields[1].AsCurrency; //AcRemain(Rqu.Fields[1].AsFloat,Dat);
       Case rgFilt.ItemIndex of
        0: If Rem > 0 Then Rem:=Rem Else Rem:=0;
        1: If Rem < 0 Then Rem:=Rem Else Rem:=0;
       End;
       Baghi:=Baghi+Rem;
       If Rem <> 0 Then
       Begin
        Frodm.Gardesh.Append;
        Frodm.GardeshDesc.Value :=Rqu.Fields[2].AsString;// AccNam(Rqu.Fields[1].AsFloat);
        Frodm.GardeshNo.Value :=-1;
        Frodm.GardeshDat.Value :=Rqu.Fields[3].AsInteger;//Dat
        Case rgFilt.ItemIndex of
         0: If Rem > 0 Then Frodm.GardeshBedeh.Value :=Rem Else Rem:=0;
         1: If Rem < 0 Then Frodm.GardeshBestan.Value :=Abs(Rem) Else Rem:=0;
         2: If Rem > 0 Then Frodm.GardeshBedeh.Value :=Rem Else
             Frodm.GardeshBestan.Value :=Abs(Rem);
        End;
{       If Rem > 0 Then Frodm.GardeshBedeh.Value :=Rem Else
          Frodm.GardeshBestan.Value :=Abs(Rem);}
        Frodm.GardeshBaghi.Value :=Baghi;
        Frodm.GardeshDiag.Value:=Rem;
        Frodm.Gardesh.Post;
       End;
       Rqu.Next;
     End;
     Rqu.Close;
     Rqu.Free;
//     Rems.DataSource:=Frodm.GardeshDs;
     Screen.Cursor:=crDefault;
end;

procedure TFAcRem.EBedBes(Sender: TObject);
Var
I,Dat:Integer;
Rem,Baghi:Currency;
Rqu:TQuery;
begin
     Screen.Cursor:=crHourGlass;
     Open_G(Frodm.Gardesh);
     Rqu:=TQuery.Create(Owner);
     Rqu.DataBaseName:=CurrDb;
     Rqu.SQL.Add('SELECT Sum(Bed) ARem,Sum(Bes) BRem,AcKod,Max(Dat),Cost,CKod FROM AcountBill ');//,AcKod
     Rqu.SQL.Add('Where Tip=0 ');
     Rqu.SQL.Add('Group By AcKod,Cost,CKod');
     Rqu.SQL.Add('Order By 3,5,6 ');
     Rqu.Open;
     RQu.Filter:=Make_Filter;
     RQu.Filtered:=True;
     PrgB.Position:=0;
     PrgB.Max:=Rqu.RecordCount;
     Rqu.First;
     Baghi:=0;
     Dat:=Fardate;
     For I:=1 To Rqu.RecordCount Do
     Begin
       PrgB.Position:=Rqu.RecNo;
       Rem:=Rqu.Fields[0].AsCurrency-Rqu.Fields[1].AsCurrency;
       Case rgFilt.ItemIndex of
        0: If Rem > 0 Then Rem:=Rem Else Rem:=0;
        1: If Rem < 0 Then Rem:=Rem Else Rem:=0;
       End;
       Baghi:=Baghi+Rem;
       If Rem <> 0 Then
       Begin
        Frodm.Gardesh.Append;
        Frodm.GardeshDesc.Value :=AccNam(Rqu.Fields[2].AsFloat)+'-'+CentName(Rqu.Fields[5].AsInteger)+
        '-'+Rqu.Fields[4].AsString;// Cost AccNam(Rqu.Fields[2].AsFloat);
        Frodm.GardeshNo.Value :=Rqu.Fields[5].AsInteger;
        Frodm.GardeshDat.Value :=Rqu.Fields[3].AsInteger;//Dat
        Case rgFilt.ItemIndex of
         0: If Rem > 0 Then Frodm.GardeshBedeh.Value :=Rem Else Rem:=0;
         1: If Rem < 0 Then Frodm.GardeshBestan.Value :=Abs(Rem) Else Rem:=0;
         2: If Rem > 0 Then
             Frodm.GardeshBedeh.Value :=Rem
            Else
             Frodm.GardeshBestan.Value :=Abs(Rem);
        End;
        Frodm.GardeshBaghi.Value :=Baghi;
        Frodm.GardeshDiag.AsFloat:=Rqu.Fields[2].AsFloat;
        Frodm.Gardesh.Post;
       End;
       Rqu.Next;
     End;
     Rqu.Close;
     Rqu.Free;
     Screen.Cursor:=crDefault;
end;

procedure TFAcRem.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key = VK_F3 Then RgAccClick(Sender)
end;

procedure TFAcRem.BexitClick(Sender: TObject);
begin
     Frodm.Gardesh.Filtered:=False;
     Frodm.Gardesh.Active :=False;
     Frodm.Gardesh.Exclusive :=False;
     FAcRem.Close;
end;

procedure TFAcRem.BprintClick(Sender: TObject);
begin
     CreatingForm(TGReport,'GReport',GReport);
     Set_Sys_Enviroment;
     GReport.AccNam.Caption :='„«‰œÂ êÌ—Ì Õ”«» Â«';
     GReport.SBed:=0;
     GReport.SBes:=0;
     GReport.Preview;
     Greport.Destroy;
end;

procedure TFAcRem.RemsKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
       Key:=#0;
       GMove(Rems,Frodm.Gardesh);
     End;
end;

procedure TFAcRem.RemsDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
     If Frodm.GardeshNo.Value = 0 Then Rems.Canvas.Font.Color:=clRed;
      Rems.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TFAcRem.rgAccClick(Sender: TObject);
begin
     Case rgAcc.ItemIndex Of
     0: EBedBes(Sender);
     1: CreditCheck;
     2: BedBes(Sender);
     End;
end;

procedure TFAcRem.FormActivate(Sender: TObject);
begin
     CreditCheck;
end;

end.
