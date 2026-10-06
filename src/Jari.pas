unit Jari;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, DBCtrls, ComCtrls, ExtCtrls, DB, DBTables,
  Buttons;

type
  TFJari = class(TForm)
    JariDbg: TDBGrid;
    JariNam: TComboBox;
    Label1: TLabel;
    BExit: TButton;
    Bcash: TButton;
    Bpass: TButton;
    DBText1: TDBText;
    DBText2: TDBText;
    Label2: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    BPrint: TButton;
    BhavBill: TButton;
    BCMoz: TButton;
    Brepair: TButton;
    FSer: TEdit;
    spDouble: TSpeedButton;
    DBText3: TDBText;
    procedure JariNamExit(Sender: TObject);
    procedure BExitClick(Sender: TObject);
    procedure JariNamKeyPress(Sender: TObject; var Key: Char);
    procedure BcashClick(Sender: TObject);
    procedure BpassClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure JariDbgEnter(Sender: TObject);
    procedure JariDbgKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BPrintClick(Sender: TObject);
    procedure BhavBillClick(Sender: TObject);
    procedure JariDbgKeyPress(Sender: TObject; var Key: Char);
    procedure BCMozClick(Sender: TObject);
    procedure JariDbgEditButtonClick(Sender: TObject);
    procedure BrepairClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FSerChange(Sender: TObject);
    procedure spDoubleClick(Sender: TObject);
  private
    { Private declarations }
    JariT:TTable;
    JRem:Currency;
    Function JariRem(Jari:String):Boolean;
    Function JariUpdate:Currency;
    Procedure Update_RecJari(JAcKod:Real);
    Function PcheqFilter:String;
    Procedure SetPassBNo(BNo:Integer;Serial:String);
  public
    { Public declarations }
  end;

var
  FJari: TFJari;

implementation

uses FrooshDM,CashBill,Routins, ProVar, JariPrint,
  HavBill, CarBill;

{$R *.DFM}
Var
BesKod,BehKod:Real;
Str:String;
State:Boolean;
Price:Currency;

Function TFJari.JariRem(Jari:String):Boolean;
begin
     JariT.TableName :='Dbo.Jari'+JariNam.Text;
     JariT.Open;
     Result:=JariT.Active;
     If Not Result Then Exit;
     JariT.Last;
     JRem:=JariT.FieldByName('Rema').AsCurrency;
     JariT.Close;
end;

Function TFJari.JariUpdate:Currency;
begin
     JariT.Open;
     JariT.Append;
     JariT.FieldByName('Bedeh').AsCurrency:=Price;
     JariT.FieldByName('Bestan').AsCurrency:=0;
     JariT.FieldByName('Dat').AsInteger:=Frodm.Pcheq.FieldByName('BDat').AsInteger;// FarDate;
     JariT.FieldByName('Serial').AsString:=Frodm.Pcheq.FieldByName('BNo').AsString;
     Result:=JRem-Price;
     JariT.FieldByName('Rema').AsCurrency:=Result;
     JariT.FieldByName('Des').AsString:=Frodm.Pcheq.FieldByName('Des').AsString;
     JariT.Post;
     JariT.Close;
end;

Procedure TFJari.Update_RecJari(JAcKod:Real);
Var
Table:TTable;
Rem:Currency;
begin
     Qu.SQL.Clear;
     Qu.SQL.Add('SELECT Nam FROM JariN WHERE AccKod = '+FloatToStr(JAcKod));
     Qu.Active:=True;
     If Qu.Fields[0].AsString = '' Then
     Begin
       Qu.Active:=False;
       Exit;
     End Else
     Begin
       Table:=TTable.Create(Self);
       Table.Tag:=2;
       Table.DatabaseName :=CurrDb;
       Table.TableName := 'Dbo.Jari'+Qu.Fields[0].AsString;
       Table.Active:=True;
       Table.Last;
       Rem:=Table.FieldByName('Rema').AsCurrency;
       Table.Append;
       Table.FieldByName('Bedeh').AsCurrency:=0;
       Table.FieldByName('Bestan').AsCurrency:=Price;
       Table.FieldByName('Dat').AsInteger:=FarDate;
       Table.FieldByName('Serial').AsString:=Frodm.Pcheq.FieldByName('BNo').AsString;
       Table.FieldByName('Rema').AsCurrency:=Rem+Price;
       Table.FieldByName('Des').AsString:=Frodm.Pcheq.FieldByName('Des').AsString;
       Table.Post;
       Table.Close;
       Table.Free;
       Qu.Active:=False;
     End;
end;

Function TFJari.PcheqFilter:String;
Var
Str:String;
begin
     Str:='';
     Str:=Str+'Jari = '+#39+JariNam.Text+#39+' and Paykod = False';
     Str:=Str+' and Pbill > 0 and Bdat > 0 and Bdat <= '+IntToStr(Fardate);
     Result:=Str;
end;

Procedure TFJari.SetPassBNo(BNo:Integer;Serial:String);
begin
{     Qu.SQL.Clear;
     Qu.SQL.Add('Update PCheq P Set PaNo = '+IntToStr(BNo));
     Qu.SQL.Add('Where P.BNo = '+#39+Serial+#39);
     Qu.ExecSQL;}
     If BNo =0 Then Exit;
     If Frodm.Pcheq.Locate('BNo',Serial,[loCaseInsensitive]) Then
     Begin
      Frodm.Pcheq.Edit;
      Frodm.PcheqPaykod.Value:=True;
      Frodm.PcheqPaNo.Value:=BNo;
      Frodm.Pcheq.Post;
     End;
end;

procedure TFJari.JariNamExit(Sender: TObject);
begin
     If JariNam.ItemIndex = -1 Then Exit;
     JariT.Close;
     Frodm.Jari.Close;
//     Frodm.Jari.IndexFieldNames:='Dat;Bedeh';
     Frodm.Jari.TableName :='Dbo.Jari'+JariNam.text;
     If Not OpenTable(Frodm.Jari) Then Exit;
     FroDM.JariNam.Locate('Nam',JariNam.Text,[loCaseInsensitive]);
     Beskod:=Frodm.JariNamAccKod.Value;
end;

procedure TFJari.BExitClick(Sender: TObject);
begin
     Frodm.Jari.Active :=False;
     Frodm.Jari.TableName :='Jari';
     Fjari.Close;
end;

procedure TFJari.JariNamKeyPress(Sender: TObject; var Key: Char);
begin
     Enter_Focus(key,JariDbg);
end;

procedure TFJari.BcashClick(Sender: TObject);
begin
     CreatingForm(TFCash,'FCash',FCash);
end;

procedure TFJari.BpassClick(Sender: TObject);
Const
PHint='ÈÇäß ãæÌæÏí ßÇÝí äÏÇÑÏ.ß ÇÓ ÔæÏ¿';
Var
I:Integer;
BNo,Cost:String;
No,CKod,Pdat:Integer;
PQu:TQuery;
begin
     If Not JariRem(JariNam.Text)Then Exit;
     PQu:=TQuery.Create(Application);
     PQu.DatabaseName:=CurrDb;
     PQu.SQL.Add('Select * from Pcheq Where Paykod = 0');
     PQu.Filter:=PcheqFilter;
     PQu.Filtered:=True;
     PQu.Open;
// Pay The chequ of the current day
     Frodm.Pcheq.Open;
     For I:=1 To PQu.RecordCount Do //Frodm.Pcheq.RecordCount Do
     Begin
// Check for correct date
       If Frodm.Pcheq.Locate('BNo',PQu.FieldByName('BNo').AsString,[loCaseInsensitive]) Then
       Begin
       Str:='ß ÔãÇÑå'+Frodm.PcheqBNo.AsString+ 'ÈÊÇÑíÎ '+IntToDate(Frodm.PcheqBDat.Value)+
            'Èå ãÈáÛ'+CurrToFar(Frodm.PcheqPbill.value)+' ÇÓ ÔæÏ¿';
       If MessageDlg(Str,mtWarning,mbYesNoCancel,0) = mrYes Then
       Begin
         BehKod:=Frodm.PcheqPkod.Value;
         Price:=Frodm.PcheqPbill.Value;
         PDat:=Frodm.PcheqBdat.AsInteger;
         BNo:=Frodm.PcheqBno.AsString;
         CKod:=Frodm.PcheqCkod.AsInteger;
         Cost:=Frodm.PcheqCost.AsString;
         Str:='ÇÓ ß ÔãÇÑå'+'  '+BNo+' '+'ÌÇÑí'+'  '+JariNam.Text;
         If (Price >JRem) Then
          If MessageDlg(PHint,mtInformation,mbYESNO,-1) = idNo Then Exit;
         JRem:=JariUpdate;
         Update_RecJari(Frodm.PcheqAcckod.Value);
         Frodm.Pcheq.Edit;
         Frodm.Pcheq.FieldByName('PayKod').AsBoolean := True;
         Frodm.Pcheq.Post;
//AutoMation Part of Accounting For Passing chequ
         Frodm.AutoBill.FindKey(['JPASS']);
         State:=Frodm.AutoBillStat.Value;
         No:=AutoBill(State,BesKod,BehKod,Price,Str,BNo,0,14,PDat,Cost,CKod,0,0,DefaultCurr);
         SetPassBNo(No,BNo);
         If sBill Then MakeBill(Str);
         QuickCloseOpen([7,6,24]);
       End;
       End;
       PQu.Next;//Frodm.Pcheq.Next;
     End;
     //FRodm.Pcheq.Filtered :=False;
     PQu.Filtered:=False;
     PQu.Close;
     PQu.Free;
     FRodm.Pcheq.Filtered :=False;
     JariDbg.Refresh;
     Frodm.Jari.Last;
end;

procedure TFJari.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
//     QuickCloseOpen([7,6,24]);
end;

procedure TFJari.FormCreate(Sender: TObject);
begin
     Set_Forms(FJari);
     Jaridbg.ReadOnly := Not (CUser.Name = 'ãÏíÑíÊ ãÇáí');
     Frodm.JariDS.AutoEdit:=CUser.Name = 'ãÏíÑíÊ ãÇáí';
     Brepair.Visible:=CUser.Name = 'ãÏíÑíÊ ãÇáí';
     Fill_Comb(Frodm.JariNam,'Nam',JariNam.Items);
     JariT:=TTable.Create(Self);
     JariT.Tag:=2;
     JariT.DatabaseName :=CurrDb;
end;

procedure TFJari.FormDestroy(Sender: TObject);
begin
     Frodm.Jari.Active :=False;
     Frodm.Jari.TableName :='dbo.Jari';
     JariT.Free;
end;

procedure TFJari.JariDbgEnter(Sender: TObject);
begin
     If Frodm.Jari.Active Then Frodm.Jari.Last;
end;

procedure TFJari.JariDbgKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If  Shift = [ssCtrl] Then BPass.SetFocus;
     If  Shift = [ssCtrl]+[ssShift] Then JariNam.SetFocus;
end;

procedure TFJari.BPrintClick(Sender: TObject);
begin
     CreatingForm(TFJaPrint,'FJaPrint',FJaPrint);
end;

procedure TFJari.BhavBillClick(Sender: TObject);
begin
     CreatingForm(TFHav,'FHav',FHav);
end;

procedure TFJari.JariDbgKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
       Key :=#0;
       GMove(JariDbg,Frodm.Jari);
     End;
end;

procedure TFJari.BCMozClick(Sender: TObject);
begin
     CreatingForm(TFCar,'FCar',FCar);
end;

procedure TFJari.JariDbgEditButtonClick(Sender: TObject);
begin
     If (CUser.Name ='ãÏíÑíÊ ãÇáí')And
      (MessageDlg('ÑÏíÝ ÌÇÑí ÍÐÝ ÑÏÏ',mtWarning,mbYesNo,0)=idYes) Then
     Begin
      Frodm.Pcheq.Open;
      IF Frodm.Pcheq.Locate('BNo',Frodm.JariSerial.Value,[loCaseInsensitive])and
       (Frodm.JariBedeh.Value > 0) Then
      Begin
       Frodm.Pcheq.Edit;
       Frodm.PcheqPaykod.Value :=False;
       Frodm.Pcheq.Post;
       DelBItem(Frodm.PcheqBNo.AsString,Frodm.PcheqPaNo.Value,14);
       BillUpdate(Frodm.PcheqPaNo.Value);
      End;
      Frodm.Rcheq.Open;
      IF Frodm.Rcheq.Locate('BNo',Frodm.JariSerial.Value,[loCaseInsensitive])and
       (Frodm.JariBestan.Value > 0) Then
      Begin
       Exit;
      { Frodm.Rcheq.Edit;
       Frodm.RcheqRecKod.Value :=False;
       Frodm.RcheqKeler.Value:=True;
       Frodm.Rcheq.Post;
       DelBItem(Frodm.RcheqBNo.Value,Frodm.RcheqVBNo.Value,15);}
      End;
      JariDbg.DataSource.DataSet.Delete;
      BrepairClick(Sender);
     End;
end;

procedure TFJari.BrepairClick(Sender: TObject);
Var
Bes,
Bed,
Rem:Currency;
I:Integer;
begin
     Rem:=0;
     Frodm.Jari.Close;
     Frodm.Jari.IndexFieldNames:='Dat;Bedeh';
     Frodm.jari.Open;
     Frodm.Jari.Refresh;
     Frodm.Jari.First;
     For I:=1 To Frodm.Jari.RecordCount Do
     Begin
       Bes:=Frodm.JariBestan.Value;
       Bed:=Frodm.JariBedeh.Value;
       Rem:=Rem+Bes-Bed;
       Frodm.Jari.Edit;
       Frodm.JariRema.Value:=Rem;
       Frodm.JariId.Value:=I;
       Frodm.Jari.Post;
       Frodm.Jari.Next;
     End;
end;

procedure TFJari.FSerChange(Sender: TObject);
begin
     Frodm.Jari.Locate('Serial',FSer.Text,[loCaseInsensitive]);
end;

procedure TFJari.spDoubleClick(Sender: TObject);
begin
     Frodm.Jari.Filter:='Serial = '+#39+FSer.Text+#39;
     Frodm.Jari.FindNext;
end;

end.
