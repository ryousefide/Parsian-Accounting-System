unit DatedCopy;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,Db,
  StdCtrls,
  DbTables, ExtCtrls, ComCtrls;

type
  TMonCopy = class(TForm)
    BCopy: TButton;
    BM1: TBatchMove;
    Table: TTable;
    BRestore: TButton;
    rgMon: TRadioGroup;
    GroupBox1: TGroupBox;
    cbFac: TCheckBox;
    cbBill: TCheckBox;
    cbRch: TCheckBox;
    cbPch: TCheckBox;
    cbSaf: TCheckBox;
    cbConst: TCheckBox;
    Pb: TProgressBar;
    Label1: TLabel;
    cbCar: TCheckBox;
    Path: TEdit;
    Label2: TLabel;
    cbJari: TCheckBox;
    Bexit: TButton;
    cbGa: TCheckBox;
    cbFish: TCheckBox;
    cbAghs: TCheckBox;
    procedure BRestoreClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BCopyClick(Sender: TObject);
    procedure BexitClick(Sender: TObject);
  private
    { Private declarations }
    Year:Integer;
    Mon:Integer;
    Pass:String;
    Procedure DateCopy(CTable:TTable;Year,Mon:Integer;Field:String);
    Procedure DatedRestore(RTable:TTable;Field:String;FBlanace:Integer);
    Procedure JariCopy;
    Procedure JariRestore;
    Function DepotDataUpdate:Boolean;
  public
    { Public declarations }
  end;

var
  MonCopy: TMonCopy;

implementation

uses FrooshDM, ProVar, Routins, FileCtrl, Anb_moj;

{$R *.DFM}
Procedure TMonCopy.DateCopy(CTable:TTable;Year,Mon:Integer;Field:String);
begin
     Table.DatabaseName:=Pass;// 'A:\';
     Table.TableName:=CTable.TableName;
     CTable.LockTable(ltWriteLock);
     BM1.Source:=CTable;
     BM1.Destination:=Table;
     BM1.Mode:=batCopy;
     IF Field >'' Then
     Begin
       CTable.Filter:=Field+' >='+IntToStr(Year*10000+Mon*100+1)+' and '+Field+
       '<= '+IntToStr(Year*10000+Mon*100+31);
       CTable.Filtered:=True;
     End;
     BM1.Execute;
     CTable.Filtered:=False;
     CTable.UnlockTable(ltWriteLock);
end;

Procedure TMonCopy.DatedRestore(RTable:TTable;Field:String;FBlanace:Integer);
Var
MaxF,MinF:Integer;
I,J:Integer;
begin
     IF Field >'' Then
     Begin
      Qu.DatabaseName:=Pass;//'A:\';
      Qu.SQL.Clear;
      Qu.SQL.Add('Select Min('+Field+'),Max('+Field+')');
      Qu.SQL.Add('From '+RTable.TableName);
      Qu.Open;
      Minf:=Qu.Fields[0].AsInteger;
      Maxf:=Qu.Fields[1].AsInteger;
      Qu.Close;
      Qu.DatabaseName:=CurrDb;
      Qu.SQL.Clear;
      Qu.SQL.Add('Delete From '+RTable.TableName);
      Qu.SQL.Add('Where '+Field+' Between '+IntToStr(Minf)+' and '+IntToStr(Maxf));
      Qu.ExecSQL;
     End Else
     Begin
      RTable.Close;
      RTable.EmptyTable;
      Rtable.Open;
     End;
     Table.DatabaseName:=Pass;//'A:\';
     Table.TableName:=RTable.TableName;
     Table.Open;
     Table.First;
     PB.Max:=Table.RecordCount;
     Pb.Min:=0;
     Pb.Position:=0;
     Label1.Caption:=Table.TableName;
     Label1.Refresh;
     For I:=1 To Table.RecordCount Do
     Begin
      Pb.Position:=I;
      Pb.Refresh;
      RTable.Append;
      For J:=0 To RTable.FieldCount-1 Do//+FBlanace
       If Not (RTable.FieldDefs[j].DataType = ftAutoInc) Then
        RTable.Fields[J].Value:=TAble.Fields[J].Value;
      Rtable.Post;
      Table.Next;
     End;
     Table.Close;
end;

Function TMonCopy.DepotDataUpdate:Boolean;
Var
I:Integer;
Rem:Real;
Filt:String;
begin
     CreatingForm(TFAnb_Moj,'FAnb_Moj',FAnb_Moj);
     FAnb_Moj.dbg.SetFocus;
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Sum(Quant*IOKod)');
     Qu.SQL.Add('FROM Gcardex');
     Qu.SQL.Add('WHERE ');
     Frodm.Depot.First;
     For I:=1 To Frodm.Depot.RecordCount Do
     Begin
       Filt:='Kod = '+IntToStr(Frodm.DepotKod.Value);
       If Frodm.DepotColor.AsString >'' Then Filt:=Filt+' and Color = '+#39+Frodm.DepotColor.AsString+#39;
       If Frodm.DepotAnbNam.AsString>'' Then Filt:=Filt+' and Anb ='+#39+Frodm.DepotAnbNam.AsString+#39;
       Rem:=Frodm.DepotQuant.Value;
       Qu.SQL.Strings[2]:='WHERE '+Filt;
       Qu.Active:=True;
       IF Qu.Fields[0].AsFloat <> Rem Then
       Begin
         ShowMessage(' ’ÕÌÕ „ÊÃÊœÌ');
         Frodm.Depot.Edit;
         Frodm.DepotQuant.AsFloat:=Qu.Fields[0].AsFloat;
         Frodm.Depot.Post;
         Qu.Close;
       End;
       Frodm.Depot.Next;
       Qu.Close;
     End;
     Result:=True;
     FAnb_Moj.Close;
end;

Procedure TMonCopy.JariCopy;
Var
JTable:TTable;
I:Integer;
begin
     JTable:=TTable.Create(Owner);
     Jtable.DatabaseName:=CurrDb;
     Frodm.JariNam.First;
     For I:=1 To Frodm.JariNam.RecordCount Do
     Begin
       JTable.TableName:=Frodm.JariNamNam.AsString;
       JTable.Open;
       DateCopy(JTable,Year,rgMon.ItemIndex+1,'');
       JTable.Close;
       Frodm.JariNam.Next;
     End;
     JTable.Free;
end;

Procedure TMonCopy.JariRestore;
Var
JTable:TTable;
I:Integer;
begin
     JTable:=TTable.Create(Owner);
     Jtable.DatabaseName:=CurrDb;
     Frodm.JariNam.First;
     For I:=1 To Frodm.JariNam.RecordCount Do
     Begin
       JTable.TableName:=Frodm.JariNamNam.AsString;
       JTable.Open;
       DatedRestore(JTable,'',0);
       JTable.Close;
       Frodm.JariNam.Next;
     End;
     JTable.Free;
end;

procedure TMonCopy.FormCreate(Sender: TObject);
begin
     Set_Forms(MonCopy);
     Year:=Fardate Div 10000;
     Mon:=(Fardate Mod 10000) Div 100;
     rgMon.ItemIndex:=Mon-1;
end;

procedure TMonCopy.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TMonCopy.BCopyClick(Sender: TObject);
begin
     If Path.Text = '' Then
      Pass:=CurrPath+'\DbMon'+IntToStr(rgMon.ItemIndex+1)
     Else
      Pass:=Path.Text;
     IF not DirectoryExists(Pass) Then CreateDir(Pass);
//     Pass:=Path.Text+'\DbMon'+IntToStr(rgMon.ItemIndex+1);
     If cbFac.Checked Then
     Begin
      cbFac.Color:=clRed;
      cbFac.Refresh;
      DateCopy(Frodm.Invo,Year,rgMon.ItemIndex+1,'Dat');
      DateCopy(Frodm.InvoGood,Year,rgMon.ItemIndex+1,'Dat');
      DateCopy(Frodm.Binvo,Year,rgMon.ItemIndex+1,'Dat');
      DateCopy(Frodm.BinvoGood,Year,rgMon.ItemIndex+1,'Dat');
      DateCopy(Frodm.RejInvo,Year,rgMon.ItemIndex+1,'Dat');
      DateCopy(Frodm.RejInvoGood,Year,rgMon.ItemIndex+1,'Dat');
      DateCopy(Frodm.RejBinvo,Year,rgMon.ItemIndex+1,'Dat');
      DateCopy(Frodm.RejBinvoGood,Year,rgMon.ItemIndex+1,'Dat');
      DateCopy(Frodm.PInvo,Year,rgMon.ItemIndex+1,'Dat');
      DateCopy(Frodm.PInvoGood,Year,rgMon.ItemIndex+1,'Dat');
      cbFac.Color:=clBtnFace;
     End;
     IF cbBill.Checked Then
     Begin
      cbBill.Color:=clRed;
      cbBill.Refresh;
      DateCopy(Frodm.Bill,Year,rgMon.ItemIndex+1,'Dat');
      DateCopy(Frodm.AcBill,Year,rgMon.ItemIndex+1,'Dat');
      cbBill.Color:=clBtnFace;
     End;
     IF cbGa.Checked Then
     Begin
      cbGa.Color:=clRed;
      cbGa.Refresh;
      DateCopy(Frodm.RMon,Year,rgMon.ItemIndex+1,'Dat');
      DateCopy(Frodm.PMon,Year,rgMon.ItemIndex+1,'Dat');
      cbGa.Color:=clBtnFace;
     End;
     IF cbRch.Checked Then
     Begin
      cbRch.Color:=clRed;
      cbRch.Refresh;
      DateCopy(Frodm.Rcheq,Year,rgMon.ItemIndex+1,'RecDat');
      cbRch.Color:=clBtnFace;
     End;
     IF cbPch.Checked Then
     Begin
      cbPch.Color:=clRed;
      cbPch.Refresh;
      DateCopy(Frodm.Pcheq,Year,rgMon.ItemIndex+1,'PayDat');
      cbPch.Color:=clBtnFace;
     End;
     IF cbFish.Checked Then
     Begin
      cbFish.Color:=clRed;
      cbFish.Refresh;
      DateCopy(Frodm.NFish,Year,rgMon.ItemIndex+1,'Dat');
      DateCopy(Frodm.BHav,Year,rgMon.ItemIndex+1,'Dat');
      cbFish.Color:=clBtnFace;
     End;
     IF cbSaf.Checked Then
     Begin
      cbSaf.Color:=clRed;
      cbSaf.Refresh;
      DateCopy(Frodm.Rsaf,Year,rgMon.ItemIndex+1,'Dat');
      cbSaf.Color:=clBtnFace;
     End;
     IF cbAghs.Checked Then
     Begin
      cbAghs.Color:=clRed;
      cbAghs.Refresh;
      DateCopy(Frodm.Aghs,Year,rgMon.ItemIndex+1,'Dat');
      cbAghs.Color:=clBtnFace;
     End;
     If cbConst.Checked Then
     Begin
      cbConst.Color:=clRed;
      cbConst.Refresh;
      DateCopy(Frodm.AcKod,Year,rgMon.ItemIndex+1,'');
      DateCopy(Frodm.Good,Year,rgMon.ItemIndex+1,'');
      DateCopy(Frodm.Color,Year,rgMon.ItemIndex+1,'');
      DateCopy(Frodm.AnbDat,Year,rgMon.ItemIndex+1,'');
      DateCopy(Frodm.Visit,Year,rgMon.ItemIndex+1,'');
      DateCopy(Frodm.banks,Year,rgMon.ItemIndex+1,'');
      DateCopy(Frodm.JariNam,Year,rgMon.ItemIndex+1,'');
      DateCopy(Frodm.AutoBill,Year,rgMon.ItemIndex+1,'');
      cbConst.Color:=clBtnFace;
     End;
     IF cbCar.Checked Then
     Begin
      cbCar.Color:=clRed;
      cbCar.Refresh;
      DateCopy(Frodm.GCardex,Year,rgMon.ItemIndex+1,'Dat');
      cbCar.Color:=clBtnFace;
     End;
     IF cbJari.Checked Then
     Begin
      cbJari.Color:=clRed;
      cbJari.Refresh;
      JariCopy;
      cbJari.Color:=clBtnFace;
     End;
end;

procedure TMonCopy.BRestoreClick(Sender: TObject);
Var
msg:String;
begin
     If Path.Text = '' Then
      Pass:=CurrPath+'\DbMon'+IntToStr(rgMon.ItemIndex+1)
     Else
      Pass:=Path.Text;
     msg:='«ÿ·«⁄«  «“ „«Â '+rgMon.Items.Strings[rgMon.ItemIndex]+' »«“Ì«»Ì „Ì‘Êœø';
     If MessageDlg(msg,mtConfirmation,mbYesNo,0) = idNo Then Exit;
     If cbFac.Checked Then
     Begin
      cbFac.Color:=clGreen;
      cbFac.Refresh;
      DatedRestore(Frodm.Invo,'Dat',0);
      DatedRestore(Frodm.InvoGood,'Dat',1);
      DatedRestore(Frodm.Binvo,'Dat',0);
      DatedRestore(Frodm.BinvoGood,'Dat',1);
      DatedRestore(Frodm.RejInvo,'Dat',0);
      DatedRestore(Frodm.RejInvoGood,'Dat',1);
      DatedRestore(Frodm.RejBinvo,'Dat',0);
      DatedRestore(Frodm.RejBinvoGood,'Dat',1);
      DatedRestore(Frodm.PInvo,'Dat',0);
      DatedRestore(Frodm.PInvoGood,'Dat',1);
      cbFac.Color:=clBtnFace;
     End;
     IF cbBill.Checked Then
     Begin
      cbBill.Color:=clGreen;
      cbBill.Refresh;
      DatedRestore(Frodm.Bill,'Dat',0);
      DatedRestore(Frodm.AcBill,'Dat',0);
      cbBill.Color:=clBtnFace;
      cbBill.Refresh;
     End;
     IF cbGa.Checked Then
     Begin
      cbGa.Color:=clGreen;
      cbGa.Refresh;
      DatedRestore(Frodm.RMon,'Dat',0);
      DatedRestore(Frodm.PMon,'Dat',0);
      cbGa.Color:=clBtnFace;
      cbGa.Refresh;
     End;
     IF cbRch.Checked Then
     Begin
      cbRch.Color:=clGreen;
      cbRch.Refresh;
      DatedRestore(Frodm.Rcheq,'RecDat',0);
      cbRch.Color:=clBtnFace;
     End;
     IF cbPch.Checked Then
     Begin
      cbPch.Color:=clGreen;
      cbPch.Refresh;
      DatedRestore(Frodm.Pcheq,'PayDat',0);
      cbPch.Color:=clBtnFace;
     End;
     IF cbFish.Checked Then
     Begin
      cbFish.Color:=clGreen;
      cbFish.Refresh;
      DatedRestore(Frodm.NFish,'Dat',0);
      DatedRestore(Frodm.BHav,'Dat',0);
      cbFish.Color:=clBtnFace;
      cbFish.Refresh;
     End;
     IF cbSaf.Checked Then
     Begin
      cbSaf.Color:=clGreen;
      cbSaf.Refresh;
      DatedRestore(Frodm.Rsaf,'Dat',0);
      cbSaf.Color:=clBtnFace;
     End;
     IF cbAghs.Checked Then
     Begin
      cbAghs.Color:=clGreen;
      cbAghs.Refresh;
      DatedRestore(Frodm.Aghs,'Dat',0);
      cbAghs.Color:=clBtnFace;
     End;
     If cbConst.Checked Then
     Begin
      cbConst.Color:=clGreen;
      cbConst.Refresh;
      DatedRestore(Frodm.AcKod,'',0);
      DatedRestore(Frodm.Good,'',0);
      DatedRestore(Frodm.Color,'',0);
      DatedRestore(Frodm.AnbDat,'',0);
      DatedRestore(Frodm.Visit,'',0);
      DatedRestore(Frodm.banks,'',0);
      DatedRestore(Frodm.JariNam,'',0);
      DatedRestore(Frodm.AutoBill,'',0);
      cbConst.Color:=clBtnFace;
     End;
     IF cbCar.Checked Then
     Begin
      cbCar.Color:=clGreen;
      cbCar.Refresh;
      DatedRestore(Frodm.GCardex,'Dat',1);
      cbCar.Color:=clBtnFace;
      DepotDataUpdate;
     End;
     IF cbJari.Checked Then
     Begin
      cbJari.Color:=clRed;
      cbJari.Refresh;
      JariRestore;
      cbJari.Color:=clBtnFace;
     End;
end;

procedure TMonCopy.BexitClick(Sender: TObject);
begin
     MonCopy.Close;
end;

end.
