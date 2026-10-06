unit AcBillList;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, ExtCtrls, Grids, DBGrids, Buttons;

type
  TFABillList = class(TForm)
    Label1: TLabel;
    SDat: TMaskEdit;
    Label2: TLabel;
    EDat: TMaskEdit;
    ABillDbg: TDBGrid;
    Bevel1: TBevel;
    Chb1: TCheckBox;
    Chb3: TCheckBox;
    Chb4: TCheckBox;
    Label3: TLabel;
    Label4: TLabel;
    FAccNam: TComboBox;
    SPrice: TEdit;
    Rem: TEdit;
    Label5: TLabel;
    Panel1: TPanel;
    BExit: TButton;
    Bprint: TButton;
    Bshow: TBitBtn;
    Bevel3: TBevel;
    procedure BExitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BprintClick(Sender: TObject);
    procedure SDatExit(Sender: TObject);
    procedure Chb1Click(Sender: TObject);
    procedure Chb2Click(Sender: TObject);
    procedure Chb3Click(Sender: TObject);
    procedure Chb4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BshowClick(Sender: TObject);
    procedure ABillDbgKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ABillDbgKeyPress(Sender: TObject; var Key: Char);
    procedure EDatExit(Sender: TObject);
    procedure SPriceExit(Sender: TObject);
    procedure SPriceKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    Procedure NextTab(Sender:TObject;Var Key:Char);
    procedure SPriceKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SDatEnter(Sender: TObject);
    procedure EDatEnter(Sender: TObject);
  private
    { Private declarations }
    Function OpenGride:Boolean;
    Procedure FillGride;
    Function Filt_String:String;
    Function BillRem:Currency;
  public
    { Public declarations }
  end;

var
  FABillList: TFABillList;

implementation

uses FrooshDM, Routins,DbTables,Db, AcBillRep, ProVar, Converts;

{$R *.DFM}
Procedure TFABillList.NextTab(Sender:TObject;Var Key:Char);
begin
     If Key = #13 Then
     Begin
       Key:=#0;
       SelectNext(Sender As TWinControl,True,True);
     End;
end;

Function TFABillList.OpenGride:Boolean;
begin
     Result:=True;
     Frodm.AcBList.Active :=False;
     Try
       Frodm.AcBList.Exclusive :=True;
       Frodm.AcBList.EmptyTable;
     Except
       On EDBEngineError Do
       Begin
         Beep;
         ShowMessage('ÌÏæá ÏÑ ÇÎÊíÇÑ ßÇÑÈÑ ÏíÑ ÇÓÊ');
         Result:=False;
         Exit;
       End;
     End;
     Frodm.AcBList.Active :=True;
end;

Function TFABillList.Filt_String:String;
Var
I:Integer;
Str:String;
begin
     Str:='';
     I:=DateToInt(SDat.Text);
     If I>0 Then Str:='Dat >= '+IntToStr(I);
     I:=DateToInt(EDat.Text);
     If I>0 Then Str:=Str+' and Dat <= '+IntToStr(I);
     If SPrice.Text > '' Then Str:=Str+' and (Bed = '+CurrToStr(FarToCurr(SPrice.Text))+
        ' or Bes = '+CurrToStr(FarToCurr(SPrice.Text))+')';
     If FAccNam.Text > '' Then Str:=Str+' and Ackod = '+FloatToStr(AccKod(FAccNam.Text));
     If Pos(' and',Str) = 1 Then Delete(Str,1,4);
     Result:=Str;
end;

Function TFABillList.BillRem:Currency;
begin
     Qu.SQL.Clear;
     Qu.SQL.Add('SELECT Sum(Bedeh),Sum(Bestan)');
     Qu.SQl.Add('FROM AcBillList');
     Qu.Active:=True;
     Result:=Qu.Fields[0].AsCurrency - Qu.Fields[1].AsCurrency;
     Qu.Active:=False;
end;

Procedure TFABillList.FillGride;
Var
   I:Integer;
begin
     Frodm.Acbill.MasterSource:=Nil;
     Frodm.Acbill.Filter :=Filt_String;
     Frodm.Acbill.Filtered:=True;
     Frodm.Acbill.First;
     For I:=1 To frodm.Acbill.RecordCount Do
     Begin
       Frodm.AcBList.Append;
       Frodm.AcBListDat.Value :=Frodm.AcbillDat.Value;
       Frodm.AcBListNo.Value :=Frodm.AcbillNo.Value ;
       Frodm.AcBListAcKod.Value :=Frodm.AcbillAcKod.Value ;
       Frodm.AcBListAccNam.Value :=Frodm.AcbillAccNam.Value ;
       Frodm.AcBListDesc.Value :=Frodm.AcbillDesc.Value ;
       Frodm.AcBListBedeh.Value :=Frodm.AcbillBed.Value;
       Frodm.AcBListBestan.Value :=Frodm.AcbillBes.Value ;
       Frodm.AcBList.Post;
       Frodm.Acbill.Next;
     End;
     Frodm.Acbill.Filtered:=False;
     Frodm.Acbill.MasterSource:=Frodm.BillDs;
     Rem.Text :=CurrToFar(BillRem);
end;

procedure TFABillList.BExitClick(Sender: TObject);
begin
     Frodm.Acbill.Filtered :=False;
     Frodm.AcBList.Active :=False;
     Frodm.AcBList.Exclusive :=False;
     FABillList.Close;
end;

procedure TFABillList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFABillList.BprintClick(Sender: TObject);
begin
     CreatingForm(TAbillRep,'AbillRep',AbillRep);
     Set_Sys_Enviroment;
     ABillRep.Sdat.Caption :=SDat.Text;
     ABillRep.Send.Caption :=EDat.Text;
     ABillRep.Dat.Caption :=IntToDate(FarDate);
     AbillRep.QRL5.Enabled :=Chb1.Checked;
     AbillRep.QRD5.Enabled :=Chb1.Checked;
     AbillRep.QRL6.Enabled :=Chb3.Checked;
     AbillRep.QRD6.Enabled :=Chb3.Checked;
     AbillRep.QRL4.Enabled :=Chb4.Checked;
     AbillRep.QRD4.Enabled :=Chb4.Checked;
     ABillRep.Preview;
     ABillRep.Destroy;

end;

procedure TFABillList.SDatEnter(Sender: TObject);
begin
     GetMaskText(SDat);
end;

procedure TFABillList.SDatExit(Sender: TObject);
begin
     SetMaskText(SDat);
     If(Not Date_Check(SDat.Text))and(DateToInt(SDat.Text) > 0) Then SDat.SetFocus;
end;

procedure TFABillList.Chb1Click(Sender: TObject);
begin
      AbillDbg.Columns[3].Visible  := Not(AbillDbg.Columns[3].Visible);
end;

procedure TFABillList.Chb2Click(Sender: TObject);
begin
     AbillDbg.Columns[6].Visible  := Not(AbillDbg.Columns[6].Visible);
end;

procedure TFABillList.Chb3Click(Sender: TObject);
begin
     AbillDbg.Columns[6].Visible  := Not(AbillDbg.Columns[6].Visible);
end;

procedure TFABillList.Chb4Click(Sender: TObject);
begin
     AbillDbg.Columns[2].Visible  := Not(AbillDbg.Columns[2].Visible);
end;

procedure TFABillList.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     Frodm.AcKod.Filter:=' Usekod = 1';
     Frodm.AcKod.Filtered :=True;
     Fill(Frodm.AcKod,'Nam',FAccNam.Items);
     Frodm.AcKod.Filtered :=False;
//     BShowClick(Sender);
end;

procedure TFABillList.BshowClick(Sender: TObject);
Var
Sd,Ed:Integer;
begin
     Sd:=DateToInt(Sdat.Text);
     Ed:=DateToInt(Edat.Text);
     If Sd > Ed Then
     Begin
       Beep;
       MessageDlg('ÊÇÑíÎ ÔÑæÚ ßæßÊÑ ÇÓÊ', mtInformation, [mbOK], 0);
       Sdat.SetFocus;
       Exit;
     End;
//     FroDM.Acbill.SetRange([Sd],[Ed]);
     If OpenGride Then FillGride;
//     Frodm.Acbill.CancelRange;
end;

procedure TFABillList.ABillDbgKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Shift =[ssCtrl] Then BShow.SetFocus;
     If Shift =[ssCtrl]+[ssShift] Then EDat.SetFocus;
end;

procedure TFABillList.ABillDbgKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
       Key:=#0;
       GMove(AbillDbg,Frodm.AcBList);
     End;
end;

procedure TFABillList.EDatEnter(Sender: TObject);
begin
     GetMaskText(EDat);
end;

procedure TFABillList.EDatExit(Sender: TObject);
begin
     SetMaskText(EDat);
     If(Not Date_Check(EDat.Text))And(DateToInt(EDat.Text)>0) Then EDat.SetFocus;
end;

procedure TFABillList.SPriceExit(Sender: TObject);
begin
     SPrice.Text:=StrToFCurr(SPrice.Text);
end;

procedure TFABillList.SPriceKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     SPrice.Text :=KeyMult2(Key,SPrice.Text);
end;

procedure TFABillList.SPriceKeyPress(Sender: TObject; var Key: Char);
begin
     NextTab(Sender,Key);
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;
end;

procedure TFABillList.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key =VK_F3 Then BshowClick(Sender);
end;

end.
