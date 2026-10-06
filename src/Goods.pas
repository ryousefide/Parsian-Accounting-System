unit Goods;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Db, DBTables, Mask, ExtCtrls, Menus, ComCtrls;

type
  TFgoods = class(TForm)
    Bexit: TButton;
    Bsave: TButton;
    Bnext: TButton;
    Bprev: TButton;
    Bdel: TButton;
    Pop1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Bevel2: TBevel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label11: TLabel;
    FNam: TEdit;
    FUnit: TComboBox;
    FKod: TEdit;
    FPkh: TEdit;
    Fpfro: TEdit;
    FGene: TEdit;
    cbFdp: TCheckBox;
    TabSheet2: TTabSheet;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    FNashr: TEdit;
    FWriter: TEdit;
    FMot: TEdit;
    FPrint: TEdit;
    FIsbn: TEdit;
    Label4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Fkol: TEdit;
    Ftaf: TEdit;
    Fmo: TEdit;
    Label9: TLabel;
    FQreq: TEdit;
    Label10: TLabel;
    FBreq: TEdit;
    Label17: TLabel;
    PRule: TComboBox;
    procedure BsaveClick(Sender: TObject);
    procedure BnextClick(Sender: TObject);
    procedure BprevClick(Sender: TObject);
    procedure BexitClick(Sender: TObject);
    procedure BdelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure Fpfro1KeyPress(Sender: TObject; var Key: Char);
    procedure FkolKeyPress(Sender: TObject; var Key: Char);
    procedure FKodEnter(Sender: TObject);
    procedure FKodExit(Sender: TObject);
    procedure FNamExit(Sender: TObject);
    procedure FtafEnter(Sender: TObject);
    procedure FPkhKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FpfroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FpfroExit(Sender: TObject);
    procedure FPkhExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    Procedure FieldShow;
    Procedure FieldSave;
    Function DoublKod:Boolean;
  public
    { Public declarations }
  end;

var
  Fgoods: TFgoods;

implementation

uses FrooshDM, Routins, ProVar;


Var
Flag:Boolean;


{$R *.DFM}

Procedure TFgoods.FieldShow;
begin
     FNam.Text:=FroDM.GoodNam.Value;
     FUnit.Text:=Frodm.GoodUnit.Value;
     FKol.Text:=IntToStr(Frodm.GoodKol.Value);
     Fmo.Text :=IntToStr(Frodm.GoodMo.Value);
     Ftaf.Text :=IntToStr(Frodm.Goodtaf.Value);
     FKod.Text :=IntToStr(FroDM.GoodKod.Value);
     FQreq.Text:=FloatToStr(Frodm.GoodRquant.Value);
     FBreq.Text:=FloatToStr(Frodm.GoodBquant.Value);
     PRule.Text:=Frodm.GoodPrule.Value;
     FPkh.Text:= CurrToFar(Frodm.GoodPkh.Value);
     FPfro.Text:=CurrToFar(Frodm.GoodPfro.Value);
     FGene.Text :=IntToStr(Frodm.GoodGene.Value);
     FNashr.Text:=Frodm.GoodProp1.Value;
     Fwriter.Text:=Frodm.GoodProp2.Value;
     Fmot.Text:=Frodm.GoodProp3.Value;
     Fprint.Text:=Frodm.GoodProp4.Value;
     FIsbn.Text:=Frodm.GoodISBN.Value;
     cbFdp.Checked :=Frodm.GoodFdp.Value;
end;

Procedure TFgoods.FieldSave;
begin
     If FGene.Text = '' Then FGene.Text:='0';
     Frodm.Good.Append;
     Frodm.GoodNam.Value :=FNam.Text;
     Frodm.GoodUnit.Value :=Funit.Text;
     Frodm.GoodKol.Value :=StrToInt(Fkol.Text);
     Frodm.GoodMo.Value :=StrToInt(Fmo.Text);
     Frodm.GoodTaf.Value:=StrToInt(Ftaf.Text);
     Frodm.GoodKod.Value :=StrToInt(FKod.Text);
     Frodm.GoodRquant.Value :=StrToFloat(FQreq.Text);
     Frodm.GoodBquant.Value :=StrToInt(FBreq.Text);
     Frodm.GoodGene.Value :=StrToInt(FGene.Text);
     Frodm.GoodPrule.Value:=PRule.Text;
     Frodm.GoodPkh.Value :=FarToCurr(Fpkh.Text);
     Frodm.GoodPfro.Value :=FarToCurr(Fpfro.Text);
     Frodm.GoodFdp.Value :=cbFdp.Checked;
     Frodm.GoodProp1.Value:=FNashr.Text;
     Frodm.GoodProp2.Value:=Fwriter.Text;
     Frodm.GoodProp3.Value:=Fmot.Text;
     Frodm.GoodProp4.Value:=Fprint.Text;
     Frodm.GoodISBN.Value:=FIsbn.Text;
     Frodm.GoodFlock.Value:=False;
     Frodm.Good.Post;
     //-------------------
     FNam.Text:='';
     Fkod.Text:='';
     FGene.Text:='0';
     FQreq.Text:='0';
     FBreq.Text:='0';
     FPkh.Text:='0';
     FPfro.Text:='0';
     cbFdp.Checked:=False;
     //--------------------

end;

Function TFgoods.DoublKod:Boolean;
begin
     Result:=False;
     Frodm.Good.Filtered:=False;
     Frodm.Good.IndexFieldNames:='Kod';
     If Frodm.Good.FindKey([StrToInt(FKod.Text)]) Then Result :=True;
     Frodm.Good.IndexFieldNames :='Nam';
end;
procedure TFgoods.BsaveClick(Sender: TObject);
begin
     If Flag Then Exit;
     If FKod.Text = '' Then
     Begin
       Beep;
       ShowMessage('ﬂœ ﬂ«·« „‘Œ’ ‰Ì” ');
       Fkod.SetFocus;
       Exit;
     End;
     FieldSave;
     QuickCloseOpen([2]);
     Bsave.Enabled :=False;
     FNam.SetFocus;
end;

procedure TFgoods.BnextClick(Sender: TObject);
begin
     Frodm.Good.Next;
     Flag:=True;
     FieldShow;
end;

procedure TFgoods.BprevClick(Sender: TObject);
begin
     Frodm.Good.Prior;
     Flag:=True;
     FieldShow;
end;

procedure TFgoods.BexitClick(Sender: TObject);
begin
     Close;
end;

procedure TFgoods.BdelClick(Sender: TObject);
begin
     IF (Frodm.Good.RecordCount = 0)Or(FNam.Text <>Frodm.GoodNam.Value)Then Exit;
     Frodm.GCardex.Filter:='Nam = '+#39+Frodm.GoodNam.AsString+#39;
     Frodm.GCardex.Filtered:=True;
     If Frodm.Gcardex.RecordCount >0 Then
       ShowMessage('ﬂ«·« œ«—«Ì ”«»ﬁÂ „Ì »«‘œ.ﬁ«»· Õ–› ‰Ì” ')
     Else
       Frodm.Good.Delete;
     Frodm.GCardex.Filtered:=False;
     QuickCloseOpen([2]);
     FieldShow;
end;

procedure TFgoods.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      Action:=caFree;
end;

procedure TFgoods.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     Flag:=False;
     cbFdp.Font :=Label1.Font;
     If sPerc Then FPFro.Text:=FPkh.Text;
//     FPFro.ReadOnly:= (Sperc = 1) And True; 
end;

procedure TFgoods.N1Click(Sender: TObject);
begin
      BsaveClick(Sender);
end;

procedure TFgoods.N2Click(Sender: TObject);
begin
     BnextClick(Sender);
end;

procedure TFgoods.N3Click(Sender: TObject);
begin
      BPrevClick(Sender);
end;

procedure TFgoods.Fpfro1KeyPress(Sender: TObject; var Key: Char);
begin
//     If Flag Then Enter_Focus(Key,Bnext) Else Enter_Focus(Key,Bsave);
end;

procedure TFgoods.FkolKeyPress(Sender: TObject; var Key: Char);
begin
     FormKeyPress(Sender,Key);
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;
end;

procedure TFgoods.FKodEnter(Sender: TObject);
begin
     If (FKod.Text >'') Then Exit;
     Frodm.Good.Filtered:=False;
     Frodm.Good.IndexFieldNames :='Kod';
     Frodm.Good.Last;
     FKod.Text :=IntToStr(Frodm.GoodKod.Value+1);
{    If (FTaf.Text = '0') Then
     Begin
       Frodm.Good.Filtered:=False;
       Frodm.Good.IndexFieldNames :='Kod';
       Frodm.Good.Last;
       FKod.Text :=IntToStr(Frodm.GoodKod.Value+1);
     End Else
       FKod.Text :=Fkol.Text+FMo.Text+Ftaf.Text;}
end;

procedure TFgoods.FKodExit(Sender: TObject);
begin
      If (Not Flag) and (DoublKod) Then
      Begin
        Beep;
        ShowMessage('ﬂœ ﬂ«·«Ì  ﬂ—«—Ì ');
        FKod.SetFocus;
        Exit;
      End;
      Bsave.Enabled :=Not Flag;
end;

procedure TFgoods.FNamExit(Sender: TObject);
begin
     If FNam.Text = '' Then FNam.SetFocus;
     Frodm.Good.Filtered:=False;
     Frodm.Good.IndexFieldNames :=  'Nam';
     If Frodm.Good.FindKey([FNam.Text]) Then
     Begin
       FieldShow;
       Flag:=True;
     End Else
     Begin
       Flag:=False;
//       FUnit.Text :='';
//       FTaf.Text :='';
       FKod.Text :='';
       FQreq.Text :='0';
       FBreq.Text :='0';
       FPkh.Text :='0';
       FPFro.Text :='0';
       FGene.Text :='0';
     End;

end;

procedure TFgoods.FtafEnter(Sender: TObject);
begin
     If Fkol.Text <> '0' Then
     Begin
       Frodm.Good.IndexFieldNames :='Kod';
       Frodm.Good.Filter :='Kol='+Fkol.Text +' And Mo='+FMo.Text;
       Frodm.Good.Filtered :=True;
       FRodm.Good.Last;
       FTaf.Text :=IntToStr(Frodm.GoodTaf.Value+1);
       Frodm.Good.Filtered :=False;
     End;
end;

procedure TFgoods.FPkhKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     FPkh.Text :=KeyMult2(Key,FPkh.Text);
end;

procedure TFgoods.FpfroKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     FPfro.Text :=KeyMult2(Key,FPfro.Text);
end;

procedure TFgoods.FpfroExit(Sender: TObject);
begin
     FPfro.Text:=StrToFCurr(FPfro.Text);
end;

procedure TFgoods.FPkhExit(Sender: TObject);
begin
     FPkh.Text:=StrToFCurr(FPkh.Text);
     If sPerc Then FPFro.Text:=FPkh.Text; 
end;

procedure TFgoods.FormKeyPress(Sender: TObject; var Key: Char);
begin
     If Key ='-' Then Key:=#0;
     If Key = #13 Then
     Begin
      Key:=#0;
      SelectNext(Sender As TWinControl,True,True);
     End;
end;

procedure TFgoods.FormDestroy(Sender: TObject);
begin
      Fill_Cond(Frodm.Good,'Nam','Flock=0',Kala);
end;

end.
