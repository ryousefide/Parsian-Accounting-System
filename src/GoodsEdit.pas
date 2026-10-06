unit GoodsEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Db, DBTables, Mask, ExtCtrls, Menus, ComCtrls;

type
  TFgoodsEdit = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label11: TLabel;
    FNAm: TEdit;
    FUnit: TComboBox;
    FKod: TEdit;
    FPkh: TEdit;
    Fpfro: TEdit;
    FGene: TEdit;
    cbFdp: TCheckBox;
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
    Bsave: TButton;
    Label9: TLabel;
    FQreq: TEdit;
    Label10: TLabel;
    FBreq: TEdit;
    procedure BsaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure Fpfro1KeyPress(Sender: TObject; var Key: Char);
    procedure FkolKeyPress(Sender: TObject; var Key: Char);
    procedure FKodEnter(Sender: TObject);
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
    NewGene:Integer;
    OldGene:Integer;
    Kod:Integer;
    NName:String;
    OName:String;
    Procedure FieldSave;
    Function DoublKod:Boolean;
    Procedure GeneChange(GKod,Gene:Integer);
    Procedure NameUpDate(TName:TTable;NewName:String;Kod:Integer);
  public
    { Public declarations }
    Procedure FieldShow;
  end;

var
  FgoodsEdit: TFgoodsEdit;

implementation

uses FrooshDM, Routins, ProVar;


Var
Flag:Boolean;


{$R *.DFM}

Procedure TFgoodsEdit.FieldShow;
begin
     OName:=FroDM.GoodNam.Value;
     OldGene:=Frodm.GoodGene.Value;
     FNam.Text:=FroDM.GoodNam.Value;
     FUnit.Text:=Frodm.GoodUnit.Value;
     FKol.Text:=IntToStr(Frodm.GoodKol.Value);
     Fmo.Text :=IntToStr(Frodm.GoodMo.Value);
     Ftaf.Text :=IntToStr(Frodm.Goodtaf.Value);
     FKod.Text :=IntToStr(FroDM.GoodKod.Value);
     FQreq.Text:=FloatToStr(Frodm.GoodRquant.Value);
     FBreq.Text:=FloatToStr(Frodm.GoodBquant.Value);
     FPkh.Text:= CurrToFar(Frodm.GoodPkh.Value);
     FPfro.Text:=CurrToFar(Frodm.GoodPfro.Value);
     FGene.Text :=IntToStr(Frodm.GoodGene.Value);
     cbFdp.Checked :=Frodm.GoodFdp.Value;
     FNashr.Text:=Frodm.GoodProp1.Value;
     Fwriter.Text:=Frodm.GoodProp2.Value;
     Fmot.Text:=Frodm.GoodProp3.Value;
     Fprint.Text:=Frodm.GoodProp4.Value;
     FIsbn.Text:=Frodm.GoodISBN.Value;
end;

Procedure TFgoodsEdit.FieldSave;
begin
     If FGene.Text = '' Then FGene.Text:='0';
     Frodm.Good.Edit;
     Frodm.GoodNam.Value :=FNam.Text;
     Frodm.GoodUnit.Value :=Funit.Text;
     Frodm.GoodKol.Value :=StrToInt(Fkol.Text);
     Frodm.GoodMo.Value :=StrToInt(Fmo.Text);
     Frodm.GoodTaf.Value:=StrToInt(Ftaf.Text);
     Frodm.GoodKod.Value :=StrToInt(FKod.Text);
     Frodm.GoodRquant.AsFloat :=StrToFloat(FQreq.Text);
     Frodm.GoodBquant.AsFloat :=StrToInt(FBreq.Text);
     Frodm.GoodGene.Value :=StrToInt(FGene.Text);
     Frodm.GoodPkh.Value :=FarToCurr(Fpkh.Text);
     Frodm.GoodPfro.Value :=FarToCurr(Fpfro.Text);
     Frodm.GoodFdp.Value :=cbFdp.Checked;
     Frodm.GoodProp1.Value:=FNashr.Text;
     Frodm.GoodProp2.Value:=Fwriter.Text;
     Frodm.GoodProp3.Value:=Fmot.Text;
     Frodm.GoodProp4.Value:=Fprint.Text;
     Frodm.GoodISBN.Value:=FIsbn.Text;
     Frodm.Good.Post;
     //-------------------
     FNAm.Text:='';
     FTaf.Text:='0';
     Fkod.Text:='';
     FGene.Text:='0';
     FQreq.Text:='0';
     FBreq.Text:='0';
     FPkh.Text:='0';
     FPfro.Text:='0';
     cbFdp.Checked:=False;
     //--------------------

end;

Function TFgoodsEdit.DoublKod:Boolean;
begin
     Result:=False;
     Frodm.Good.Filtered:=False;
     Frodm.Good.IndexFieldNames:='Kod';
     If Frodm.Good.FindKey([StrToInt(FKod.Text)]) Then Result :=True;
     Frodm.Good.IndexFieldNames :='Nam';
end;

Procedure TFgoodsEdit.GeneChange(GKod,Gene:Integer);
Var
I:Integer;
begin
     Frodm.Depot.Filter :='Kod = '+IntToStr(GKod);
     Frodm.Depot.Filtered :=True;
     Frodm.Depot.First;
     For I:=1 To Frodm.Depot.RecordCount Do
     Begin
       Frodm.Depot.Edit;
       Frodm.DepotGene.Value:=Gene;
       Frodm.Depot.Post;
       Frodm.Depot.Next;
     End;
     Frodm.Depot.Filtered:=False;
end;

Procedure TFgoodsEdit.NameUpDate(TName:TTable;NewName:String;Kod:Integer);
Var
I:Integer;
OFlt:String;
begin
     OFlt:=TName.Filter;
     TName.Open;
     TName.Filter:='Kod='+IntToStr(Kod);
     TName.Filtered:=True;
     TName.First;
     For I:=1 To TName.RecordCount Do
     Begin
      TName.Edit;
      TName.FieldByName('Nam').AsString:=NewName;
      TName.Post;
      TName.Next;
     End;
     TName.Filter:=OFlt;
     TName.Close;
end;

procedure TFgoodsEdit.BsaveClick(Sender: TObject);
Const
edConfirm='‰«„ ﬂ«·«  €ÌÌ— ﬂ—œÂ «”  .‰«„ ÃœÌœ  «∆Ìœ „Ì‘Êœø';
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
      NewGene:=Frodm.GoodGene.Value;
      If NewGene <> OldGene Then GeneChange(Frodm.GoodKod.Value,NewGene);
//-------
      NName:=Frodm.GoodNam.Value;
      IF NName <> OName Then
      If MessageDlg(edConfirm,mtWarning,mbYesNo,0) = idYes Then
      Begin
       Kod:=Frodm.GoodKod.Value;
       NameUpdate(Frodm.InvoGood,NName,Kod);
       NameUpdate(Frodm.BinvoGood,NName,Kod);
       NameUpdate(Frodm.RejInvoGood,NName,Kod);
       NameUpdate(Frodm.RejBinvoGood,NName,Kod);
       NameUpdate(Frodm.PInvoGood,NName,Kod);
       NameUpdate(Frodm.HavG,NName,Kod);
       NameUpdate(Frodm.ResG,NName,Kod);
       NameUpdate(Frodm.IRejG,NName,Kod);
       NameUpdate(Frodm.ORejG,NName,Kod);
       NameUpdate(Frodm.DOutG,NName,Kod);
       NameUpdate(Frodm.GCardex,NName,Kod);
       NameUpdate(Frodm.Depot,NName,Kod);
      End Else
      Begin
       Frodm.Good.Edit;
       Frodm.GoodNam.Value:=OName;
       Frodm.Good.Post;
      End;
     QuickCloseOpen([2]);
     Bsave.Enabled :=False;
     Close;
end;

procedure TFgoodsEdit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      Action:=caFree;
end;

procedure TFgoodsEdit.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     Flag:=False;
     cbFdp.Font :=Label1.Font;
     Top:=10;
     If sPerc Then FPFro.Text:=FPkh.Text;
//     FPFro.ReadOnly:= (Sperc = 1) And True; 
end;

procedure TFgoodsEdit.N1Click(Sender: TObject);
begin
      BsaveClick(Sender);
end;

procedure TFgoodsEdit.Fpfro1KeyPress(Sender: TObject; var Key: Char);
begin
//     If Flag Then Enter_Focus(Key,Bnext) Else Enter_Focus(Key,Bsave);
end;

procedure TFgoodsEdit.FkolKeyPress(Sender: TObject; var Key: Char);
begin
     FormKeyPress(Sender,Key);
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;
end;

procedure TFgoodsEdit.FKodEnter(Sender: TObject);
begin
     If (FKod.Text >'') Then Exit;
     If (FTaf.Text = '0') Then
     Begin
       Frodm.Good.Filtered:=False;
       Frodm.Good.IndexFieldNames :='Kod';
       Frodm.Good.Last;
       FKod.Text :=IntToStr(Frodm.GoodKod.Value+1);
     End Else
       FKod.Text :=Fkol.Text+FMo.Text+Ftaf.Text;
end;

procedure TFgoodsEdit.FtafEnter(Sender: TObject);
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

procedure TFgoodsEdit.FPkhKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     FPkh.Text :=KeyMult2(Key,FPkh.Text);
end;

procedure TFgoodsEdit.FpfroKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     FPfro.Text :=KeyMult2(Key,FPfro.Text);
end;

procedure TFgoodsEdit.FpfroExit(Sender: TObject);
begin
     FPfro.Text:=StrToFCurr(FPfro.Text);
end;

procedure TFgoodsEdit.FPkhExit(Sender: TObject);
begin
     FPkh.Text:=StrToFCurr(FPkh.Text);
     If sPerc Then FPFro.Text:=FPkh.Text; 
end;

procedure TFgoodsEdit.FormKeyPress(Sender: TObject; var Key: Char);
begin
     If Key ='-' Then Key:=#0;
     If Key = #13 Then
     Begin
       Key:=#0;
       SelectNext(Sender As TWinControl,True,True);
     End;
end;

procedure TFgoodsEdit.FormDestroy(Sender: TObject);
begin
      Fill_Cond(Frodm.Good,'Nam','Flock=0',Kala);
end;

end.
