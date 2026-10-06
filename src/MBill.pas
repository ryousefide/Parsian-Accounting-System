unit MBill;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, Db, DBTables, Buttons, ComCtrls, Mask, ExtCtrls;

type
  TFMakeBill = class(TForm)
    Label3: TLabel;
    cbDat: TComboBox;
    dbg: TDBGrid;
    Label1: TLabel;
    cbTip: TComboBox;
    DBGrid2: TDBGrid;
    Ds: TDataSource;
    T1: TTable;
    BitBtn1: TBitBtn;
    StatusBar1: TStatusBar;
    RG: TRadioGroup;
    NDat: TMaskEdit;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    SDat: TMaskEdit;
    EDat: TMaskEdit;
    Label6: TLabel;
    Label7: TLabel;
    FBed: TEdit;
    FBes: TEdit;
    procedure NextTab(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure cbDatChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure dbgEditButtonClick(Sender: TObject);
    procedure NDatEnter(Sender: TObject);
    procedure NDatExit(Sender: TObject);
    procedure SDatEnter(Sender: TObject);
    procedure SDatExit(Sender: TObject);
    procedure EDatEnter(Sender: TObject);
    procedure EDatExit(Sender: TObject);
    procedure RGClick(Sender: TObject);
  private
    { Private declarations }
    Procedure EnablingItems(Idx:Integer);
    Procedure Makebill_Daily_Item(Dat,TipId:Integer;TipDes:String);
    Procedure Makebill_Daily(Dat:Integer);
    Procedure Makebill_Period(SDat,EDat:Integer);
  public
    { Public declarations }
  end;

var
  FMakeBill: TFMakeBill;

implementation

uses ProVar, Routins, FrooshDM, MainForm;

{$R *.DFM}
const
TipRef   :Array[0..25] of String=('›—Ê‘',
                                  '„—ÃÊ⁄Ì ›—Ê‘',
                                  'Œ—Ìœ',
                                  '„—ÃÊ⁄Ì Œ—Ìœ',
                                  'ﬁ»÷ œ—Ì«› ',
                                  'ﬁ»÷ Å—œ«Œ ',
                                  'œ—Ì«›  çò',
                                  'Ê«ê–«—Ì çò',
                                  '’œÊ— çò',
                                  '”‰œ —Ê“‰«„Â',
                                  'ò«—„“œ »«‰òÌ',
                                  '»—œ«‘  »«‰òÌ',
                                  'Ê«—Ì“ »«‰òÌ',
                                  'Å«” çò',
                                  'Ê’Ê· çò',
                                  '⁄Êœ  çò',
                                  '«—”«· »Â ò·—',
                                  '«⁄·«„ »—ê‘ Ì ò·—',
                                  '⁄Êœ  «“ ò·—',
                                  '—„Ì «‰” ’—«›Ì',
                                  ' »œÌ· «—“Ì',
                                  '’Ê—   ‰ŒÊ«Â',
                                  ' ÕÊ«·Â ›—Ê‘ ',
                                  '—”Ìœ „” ﬁÌ„',
                                  '»—ê‘  »Â «‰»«—',
                                  '»—ê‘  «“ «‰»«—'
                                  );

TableRef :Array[0..25] of Integer=(0,335,74,376,504,522,604,623,145,967,742,
                                   558,540,145,670,623,693,646,718,1000,1053,1069,
                                   818,832,846,860);
FieldRef :Array[0..25] of String=('BNo','BNo','BNo','BNo','BNo','BNo','BNo','BNo',
                                  'PBNo','BNo','BNo','BNo','BNo','PaNo','BNo','BNo',
                                  'BNo','BNo','BNo','BNo','BNo','BNo','BNo','BNo',
                                  'BNo','BNo');
FilterRef:Array[0..25] of String=('Dat','Dat','Dat','Dat','Dat','Dat','Dat','Dat',
                                   'Paydat','Dat','Dat','Dat','Dat','Bdat','Dat','Dat',
                                   'Dat','Dat','Dat','Dat','Dat','Dat','Dat','Dat',
                                   'Dat','Dat');
//-------------------------------

Procedure TFMakeBill.EnablingItems(Idx:Integer);
Var
I:Integer;
TWin:TControl;
begin
     For I:=0 to ComponentCount-1 do
     If (Components[I] Is  TControl) Then
     Begin
      TWin:=(Components[I] As TControl);
      TWin.Enabled:=True;
      If TWin.Tag >0 Then
       If (TWin.Tag = Idx) Then TWin.Enabled:=True else TWin.Enabled:=False;
     End;
end;

Procedure TFMakeBill.Makebill_Daily_Item(Dat,TipId:Integer;TipDes:String);
Var
BNo,I:Integer;
Des,FRef,sFld:String;
Atf:Integer;
begin
     //Dat:=StrToInt(cbDat.Text);
     Frodm.Acbill.BeforePost:=Nil;
     Frodm.Acbill.IndexFieldNames:='Id';
     Frodm.Acbill.Filter:='No Is Null and Dat='+IntToStr(Dat)+' and Btip='+IntToStr(TipId+1);
     Frodm.Acbill.Filtered:=True;
     If Frodm.Acbill.RecordCount = 0 Then Exit;
     Des:=' ”‰œ '+TipDes+' „Ê—ŒÂ '+IntTodate(Dat);
     Atf:=MaxAtf;
     BNo:=LastBillNo+1;

     Frodm.Acbill.First;
     For I:=1 To Frodm.Acbill.RecordCount Do
     Begin
      Frodm.AcBill.Edit;
      Frodm.AcBillNo.Value:=BNo;
      Frodm.Acbill.Post;
      Frodm.Acbill.Next;
     End;

     Frodm.Bill.Append;
     Frodm.BillNo.Value :=BNo;
     Frodm.BillAtf.Value:=Atf;
     Frodm.BillDat.Value :=Dat;
     Frodm.BillPerm.Value :=True;
     Frodm.BillTip.Value:=iBillTip;
     Frodm.BillDesc.Value:=Des;
     Frodm.Bill.Post;

     T1.Filtered:=False;
     T1.Close;
     T1.TableName:=(Frodm.Components[TableRef[TipId]]As TTable).TableName;
     sFld:=FilterRef[TipId];
     T1.Filter:=sFld+'='+IntToStr(Dat);
     T1.Filtered:=True;
     T1.Open;

     fRef:=FieldRef[TipId];
     For I:=1 To T1.RecordCount Do
     Begin
      T1.Edit;
      T1.FieldByName(fRef).AsInteger:=BNo;
      T1.Post;
      T1.Next;
     End;
     Fill_Cond(Frodm.AcBill,'Dat','No Is Null',cbDat.Items);
     Frodm.Acbill.IndexFieldNames:='No';
     Frodm.Acbill.BeforePost:=Frodm.AcbillBeforePost;
end;

Procedure TFMakeBill.Makebill_Daily(Dat:Integer);
Var
I:Integer;
begin
     If Dat <= 0 Then Exit;
     For I:=0 to 22 Do
      Makebill_Daily_Item(Dat,I,TipRef[I]);
     Fill_Cond(Frodm.AcBill,'Dat','No Is Null ',cbDat.Items);
end;

Procedure TFMakeBill.Makebill_Period(SDat,EDat:Integer);
Var
DatList:TStringlist;
I:Integer;
Flt:String;
begin
     DatList:=TStringList.Create;
     Flt:='No Is Null and Dat >='+IntToStr(Sdat)+' and Dat<= '+IntToStr(EDat);
     Fill_Cond(Frodm.AcBill,'Dat',Flt,DatList);
     Datlist.Sort;
     For I:=0 to DatList.Count-1 Do
      Makebill_Daily(StrToInt(DatList.Strings[I]));
     Fill_Cond(Frodm.AcBill,'Dat','No Is Null',cbDat.Items);
end;
procedure TFMakeBill.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     T1.Filtered:=False;
     T1.Close;
     Frodm.Acbill.Filter:='';
     Frodm.Acbill.Filtered:=False;
     Frodm.Acbill.MasterSource:=Frodm.BillDs;
     Action:=caFree;
end;

procedure TFMakeBill.NextTab(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
      Key:=#0;
      SelectNext(Sender As TwinControl,True,True);
     End;
end;

procedure TFMakeBill.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     Main.glKey.GetBitmap(4,BitBtn1.Glyph);
     Fill_Cond(Frodm.AcBill,'Dat','No Is Null',cbDat.Items);
     Frodm.Acbill.MasterSource:=Nil;
     T1.DatabaseName:=CurrDb;
end;

procedure TFMakeBill.cbDatChange(Sender: TObject);
Var
sFld:String;
I:Integer;
Bed,Bes:Currency;
begin
     Dbg.DataSource:=nil;
     Frodm.Acbill.Filter:='No Is Null and Dat='+cbDat.Text+' and Btip='+IntToStr(cbTip.ItemIndex+1);
     Frodm.Acbill.Filtered:=True;
     If cbTip.ItemIndex=-1 Then Exit;
     T1.Filtered:=False;
     T1.Close;
     T1.TableName:=(Frodm.Components[TableRef[cbTip.ItemIndex]]As TTable).TableName;
     sFld:=FilterRef[cbTip.ItemIndex];
     T1.Filter:=sFld+'='+cbDat.Text;
     T1.Filtered:=True;
     T1.Open;
     Frodm.Acbill.First;
     Bed:=0;Bes:=0;
     For I:=1 To Frodm.Acbill.RecordCount Do
     Begin
      Bed:=Bed+Frodm.AcbillBed.Value;
      Bes:=Bes+Frodm.AcbillBes.Value;
      Frodm.Acbill.Next;
     End;
     FBed.Text:=CurrtoFar(Bed);
     FBes.Text:=CurrtoFar(Bes);
     dbg.DataSource:=Frodm.AcBillDs;
end;

{procedure TFMakeBill.BitBtn1Click(Sender: TObject);
Var
BNo,Dat,I:Integer;
Des,FRef:String;
Atf:Integer;
begin
     BNo:=LastBillNo+1;
     Dat:=StrToInt(cbDat.Text);
     Des:=' ”‰œ '+cbTip.Text+' „Ê—ŒÂ '+IntTodate(Dat);
     Atf:=MaxAtf;
     Frodm.Acbill.First;
     For I:=1 To Frodm.Acbill.RecordCount Do
     Begin
      Frodm.AcBill.Edit;
      Frodm.AcBillNo.Value:=BNo;
      Frodm.Acbill.Post;
      Frodm.Acbill.Next;
     End;

     Frodm.Bill.Append;
     Frodm.BillNo.Value :=BNo;
     Frodm.BillAtf.Value:=Atf;
     Frodm.BillDat.Value :=Dat;
     Frodm.BillPerm.Value :=True;
     Frodm.BillTip.Value:=iBillTip;
     Frodm.BillDesc.Value:=Des;
     Frodm.Bill.Post;

     fRef:=FieldRef[cbTip.ItemIndex];
     For I:=1 To T1.RecordCount Do
     Begin
      T1.Edit;
      T1.FieldByName(fRef).AsInteger:=BNo;
      T1.Post;
      T1.Next;
     End;
     Fill_Cond(Frodm.AcBill,'Dat','No Is Null',cbDat.Items);
end;  }

procedure TFMakeBill.dbgEditButtonClick(Sender: TObject);
begin
     If MessageDlg(DelConfirm,mtInformation,mbYESNO,-1) = mrYes Then
     Begin
      Frodm.Acbill.Delete;
     End;

end;

procedure TFMakeBill.NDatEnter(Sender: TObject);
begin
     GetMaskText(NDat);
end;

procedure TFMakeBill.NDatExit(Sender: TObject);
begin
     SetMaskText(NDat);
     If (Not Date_Check(NDat.Text))and(DateToInt(NDat.Text)>0) Then NDat.SetFocus;
end;

procedure TFMakeBill.SDatEnter(Sender: TObject);
begin
     GetMaskText(SDat);
end;

procedure TFMakeBill.SDatExit(Sender: TObject);
begin
     SetMaskText(SDat);
     If (Not Date_Check(SDat.Text))and(DateToInt(SDat.Text)>0) Then SDat.SetFocus;
end;

procedure TFMakeBill.EDatEnter(Sender: TObject);
begin
     GetMaskText(EDat);
end;

procedure TFMakeBill.EDatExit(Sender: TObject);
begin
     SetMaskText(EDat);
     If (Not Date_Check(EDat.Text))and(DateToInt(EDat.Text)>0) Then EDat.SetFocus;
end;

procedure TFMakeBill.RGClick(Sender: TObject);
begin
     If Rg.ItemIndex= -1 Then Exit;
     EnablingItems(Rg.ItemIndex+10);
end;

procedure TFMakeBill.BitBtn1Click(Sender: TObject);
begin
     Case Rg.ItemIndex of
     0: If cbTip.ItemIndex <> -1 Then
         Makebill_Daily_Item(StrToInt(cbDat.Text),cbTip.ItemIndex,cbTip.Text);
     1: MakeBill_Daily(DatetoInt(NDat.Text));
     2: Makebill_Period(DatetoInt(SDat.Text),DatetoInt(EDat.Text));
     End;
end;

end.
