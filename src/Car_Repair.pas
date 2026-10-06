unit Car_Repair;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Grids, DBGrids, ExtCtrls, StdCtrls, ComCtrls;

type
  TFCarRepair = class(TForm)
    Del: TQuery;
    Pb: TProgressBar;
    Brepair: TButton;
    sel: TQuery;
    Label1: TLabel;
    Bevel1: TBevel;
    QTol: TQuery;
    Hav: TQuery;
    procedure BrepairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    Procedure ReCardex(Table,Master:TTable;Des:String;IO:Integer);
    Procedure ReHav(Table,Master:TTable;Des:String;IO:Integer);
    Procedure ReTolid(Table:TTable;Des:String;IO:Integer);
    Procedure MoveReCardex;
    Function Fac_Name(Table:TTable;FacNo:Integer):String;
  public
    { Public declarations }
  end;

var
  FCarRepair: TFCarRepair;

implementation

uses FrooshDM, Routins, ProVar, CheckData;

{$R *.DFM}
Function TFCarRepair.Fac_Name(Table:TTable;FacNo:Integer):String;
begin
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Nam From '+Table.TableName+' I Where I.No=:n');
     Qu.Params[0].Value:=FacNo;
     Qu.Open;
     Result:=Qu.Fields[0].AsString;
     Qu.Close;
end;

Procedure TFCarRepair.ReCardex(Table,Master:TTable;Des:String;IO:Integer);
Var
I:Integer;
Nam,Color,AnbNam,FacNam:String;
Kod,AnbKod,Dat,FacNo:Integer;
Fee:Currency;
Perc,Quant:Real;
begin
     Pb.Position:=0;
     Label1.Caption:=Des;
     Label1.Refresh;
     Sel.SQL.Strings[1]:='From '+Table.TableName+' I,'+Master.TableName+' J ';
     Sel.Open;
     Pb.Max:=Sel.RecordCount;
     Sel.First;
     For I:=1 To Sel.RecordCount Do
     Begin
      Dat:=Sel.Fields[0].AsInteger;
      Kod:=Sel.Fields[1].AsInteger;
      Nam:=Sel.Fields[2].AsString;
      Color:=Sel.Fields[3].AsString;
      Quant:=Sel.Fields[4].AsFloat;
      AnbNam:=Sel.Fields[5].AsString;
      AnbKod:=Sel.Fields[6].AsInteger;
      FacNo:=Sel.Fields[7].AsInteger;
      FacNam:=Sel.Fields[10].AsString;
      
      IF (Des='„—ÃÊ⁄Ì ›—Ê‘')or(Des='„—ÃÊ⁄Ì Œ—Ìœ') Then
       Fee:=Sel.Fields[11].AsCurrency
      Else
       Fee:=Sel.Fields[8].AsCurrency;


      IF Des='›«ﬂ Ê— Œ—Ìœ' Then
       Perc:=0
      Else
       Perc:=Sel.Fields[9].AsFloat;
      Auto_GCardex(Nam,Color,AnbNam,Kod,AnbKod,Quant,IO,FacNo,Dat,Des,FacNam,Fee,Perc);
      Pb.Position:=I;
      Pb.Refresh;
      Sel.Next;
     End;
     Sel.Close;
     Pb.Position:=0;
     Label1.Caption:='';
     Label1.Refresh;
end;

Procedure TFCarRepair.ReHav(Table,Master:TTable;Des:String;IO:Integer);
Var
I:Integer;
Nam,Color,AnbNam,FacNam:String;
Kod,AnbKod,Dat,FacNo:Integer;
Fee:Currency;
Perc,Quant:Real;
begin
     Pb.Position:=0;
     Label1.Caption:=Des;
     Label1.Refresh;
     Hav.SQL.Strings[1]:='From '+Table.TableName+' I,'+Master.TableName+' J ';
     Hav.Open;
     Pb.Max:=Hav.RecordCount;
     Hav.First;
     For I:=1 To Hav.RecordCount Do
     Begin
      Dat:=Hav.Fields[0].AsInteger;
      Kod:=Hav.Fields[1].AsInteger;
      Nam:=Hav.Fields[2].AsString;
      Color:=Hav.Fields[3].AsString;
      Quant:=Hav.Fields[4].AsFloat;
      AnbNam:=Hav.Fields[5].AsString;
      AnbKod:=Hav.Fields[6].AsInteger;
      FacNo:=Hav.Fields[7].AsInteger;
      FacNam:=Hav.Fields[9].AsString;
      Fee:=Hav.Fields[8].AsCurrency;
      Perc:=0;
      Auto_GCardex(Nam,Color,AnbNam,Kod,AnbKod,Quant,IO,FacNo,Dat,Des,FacNam,Fee,Perc);
      Pb.Position:=I;
      Pb.Refresh;
      Hav.Next;
     End;
     Hav.Close;
     Pb.Position:=0;
     Label1.Caption:='';
     Label1.Refresh;
end;

Procedure TFCarRepair.ReTolid(Table:TTable;Des:String;IO:Integer);
Var
I:Integer;
Nam,Color,AnbNam:String;
Kod,AnbKod,Dat,FacNo:Integer;
Fee:Currency;
Perc,Quant:Real;
begin
     Label1.Caption:=Des;
     Label1.Refresh;
     QTol.SQL.Strings[1]:='From '+Table.TableName+' I';
     QTol.Open;
     QTol.First;
     Pb.Max:=QTol.RecordCount;
     Pb.Position:=0;
     For I:=1 To QTol.RecordCount Do
     Begin
      Dat:=QTol.Fields[0].AsInteger;
      Kod:=QTol.Fields[1].AsInteger;
      Nam:=QTol.Fields[2].AsString;
      Color:=QTol.Fields[3].AsString;
      Quant:=QTol.Fields[4].AsFloat;
      AnbNam:=QTol.Fields[5].AsString;
      AnbKod:=QTol.Fields[6].AsInteger;
      FacNo:=QTol.Fields[7].AsInteger;
      Fee:=QTol.Fields[8].AsCurrency;
      Perc:=QTol.Fields[9].AsFloat;
      Auto_GCardex(Nam,Color,AnbNam,Kod,AnbKod,Quant,IO,-FacNo,Dat,Des,Des,Fee,Perc);
      Pb.Position:=I;
      Pb.Refresh;
      QTol.Next;
     End;
     QTol.Close;
     Pb.Position:=0;
     Label1.Caption:='';
     Label1.Refresh;
end;

Procedure TFCarRepair.MoveReCardex;
Var
I:Integer;
OFlt:String;
begin
     Label1.Caption:='«‰ ﬁ«· ò«·«';
     Label1.Refresh;
     Frodm.MVG.Open;
     OFlt:=Frodm.MVG.Filter;
     Frodm.MVG.Filter:='';
     Frodm.MVG.Filtered:=False;
     Frodm.MVG.First;
     For I:=1 To Frodm.MVG.RecordCount Do
     Begin
      //OutGoing Good From Depots
      Auto_GCardex(Frodm.MVGNam.Value,Frodm.MVGColor.Value,
                   Frodm.MVGOAnbNam.Value,Frodm.MVGKod.Value,
                   Frodm.MVGRadif.Value,Frodm.MVGQuant.Value,
                   dpOut,Frodm.MVGNo.Value,Frodm.MVGDat.Value,'Œ—ÊÃ ﬂ«·«',
                   '',Frodm.MVGPfee.Value,0);
      //Incomming Good To Depots
      Auto_GCardex(Frodm.MVGNam.Value,Frodm.MVGColor.Value,
                   Frodm.MVGIAnbNam.Value,Frodm.MVGKod.Value,
                   Frodm.MVGRadif.Value,Frodm.MVGQuant.Value,
                   dpIn,Frodm.MVGNo.Value,Frodm.MVGDat.Value,'Ê—Êœ ﬂ«·«',
                   '',Frodm.MVGPfee.Value,0);
      Frodm.MVG.Next;
     End;
     Frodm.MVG.Filter:=OFlt;
     Frodm.MVG.Filtered:=True;
     Frodm.MVG.First;
     Frodm.MVG.Close;
end;

procedure TFCarRepair.BrepairClick(Sender: TObject);
Var
I,J:Integer;
begin
     Del.ExecSQL;

     ReHav(Frodm.ResG,Frodm.Res,'—”Ìœ «‰»«—',dpIn);
     Label1.Refresh;
     ReHav(Frodm.HavG,Frodm.Hav,'ÕÊ«·Â ›—Ê‘',dpOut);
     Label1.Refresh;
     ReHav(Frodm.IRejG,Frodm.IRej,'»—ê‘  »Â «‰»«—',dpIn);
     Label1.Refresh;
     ReHav(Frodm.ORejG,Frodm.ORej,'»—ê‘  «“ «‰»«—',dpOut);
     Label1.Refresh;


     ReCardex(Frodm.BinvoGood,Frodm.Binvo,'›«ﬂ Ê— Œ—Ìœ',dpIn);
     Label1.Refresh;
     ReCardex(Frodm.RejInvoGood,Frodm.RejInvo,'„—ÃÊ⁄Ì ›—Ê‘',dpIn);
     Label1.Refresh;
     ReCardex(Frodm.RejBinvoGood,Frodm.RejBinvo,'„—ÃÊ⁄Ì Œ—Ìœ',dpOut);
     ReTolid(Frodm.BinvoGood,' Ê·Ìœ',dpIn);
     Label1.Refresh;
     ReTolid(Frodm.RejBinvoGood,' Ê·Ìœ',dpOut);
     Label1.Refresh;
     MoveReCardex;
     Label1.Refresh;
     Close;
end;

procedure TFCarRepair.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFCarRepair.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     Del.DatabaseName:=CurrDb;
     Sel.DatabaseName:=CurrDb;
     QTol.DatabaseName:=CurrDb;
     Hav.DatabaseName:=CurrDb;
end;

end.
