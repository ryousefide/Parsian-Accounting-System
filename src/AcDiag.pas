unit AcDiag;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls,DbTables, TeEngine, Series, TeeProcs, Chart, Mask;

type
  TFAcDiag = class(TForm)
    Label1: TLabel;
    FNam: TComboBox;
    Bprint: TButton;
    Bexit: TButton;
    Bevel1: TBevel;
    Bevel2: TBevel;
    BShow: TButton;
    Rg1: TRadioGroup;
    Label2: TLabel;
    Label3: TLabel;
    SDat: TMaskEdit;
    EDat: TMaskEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BprintClick(Sender: TObject);
    procedure BexitClick(Sender: TObject);
    procedure BShowClick(Sender: TObject);
    procedure SDatEnter(Sender: TObject);
    procedure SDatExit(Sender: TObject);
    procedure EDatEnter(Sender: TObject);
    procedure EDatExit(Sender: TObject);
    procedure Rg1Click(Sender: TObject);
    procedure NextTab(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    Year:Integer;
    Procedure Open_g;
    Procedure Calc_Year(Kod:Real);
    Procedure Calc_Daily(Kod:Real);
    Function KolSum(Kol:Integer;Sd,Ed:Integer):Currency;
    Function Mon_Name(Mon:Integer):String;
  public
    { Public declarations }
  end;

var
  FAcDiag: TFAcDiag;

implementation

uses FrooshDM, ProVar, Routins, RepAcDiag, Diag, AcGardesh;

{$R *.DFM}

procedure TFAcDiag.NextTab(Sender: TObject; var Key: Char);
begin
     IF Key = #13 Then
     Begin
      Key:=#0;
      SelectNext(Sender As TWinControl,True,True);
     End;
end;

Procedure TFAcDiag.open_G;
begin
     Frodm.Gardesh.Active :=False;
     Try
      Frodm.Gardesh.Exclusive :=True;
      Frodm.Gardesh.EmptyTable;
     Except
      On EDBEngineError Do
      Begin
        Beep;
        ShowMessage('ÃœÊ· œ—«Œ Ì«— ﬂ«—»— œÌê—Ì «” ');
        Exit;
      End;
     End;
     Frodm.Gardesh.Active :=True;
end;

Function TFAcDiag.Mon_Name(Mon:Integer):String;
begin
     Case Mon of
     1 :Result:='›—Ê—œÌ‰';
     2 :Result:='«—œÌ»Â‘ ';
     3 :Result:='Œ—œ«œ';
     4 :Result:=' Ì—';
     5 :Result:='„—œ«œ';
     6 :Result:='‘Â—ÌÊ—';
     7 :Result:='„Â—';
     8 :Result:='¬»«‰';
     9 :Result:='¬–—';
     10:Result:='œÌ';
     11:Result:='»Â„‰';
     12:Result:='«”›‰œ';
     End;
end;

Function TFAcDiag.KolSum(Kol:Integer;Sd,Ed:Integer):Currency;
Var
SQu:TQuery;
begin
     SQu:=TQuery.Create(Owner);
     SQu.DatabaseName:=CurrDb;
     SQu.SQL.Add('Select Sum(Bed),Sum(Bes) From AcountBill ');
     SQu.SQL.Add('Where Dat Between '+IntToStr(Sd)+' and '+IntToStr(Ed));
     SQu.SQL.Add(' and AcKod In(Select AccKod From AccountKod Where Kgro ='+IntToStr(Kol)+')');
     SQu.Open;
     Result:=SQu.Fields[0].AsCurrency-SQu.Fields[1].AsCurrency;
     SQu.Close;
end;

Procedure TFAcDiag.Calc_Year(Kod:Real);
Var
I:Integer;
Kol:Integer;
SDat,Edat:Integer;// ,Dat
Rem:Currency;
begin
     IF Not KodFound(Kod) Then ShowMessage('Õ”«» Ì«›  ‰‘œ');
     Kol:=Frodm.AcKodKgro.Value;
     Open_g;
     Year:=Fardate;
     Year:=Year-(Year Mod 10000);
     For I:=1 To 12 Do
     Begin
       Sdat:=Year+I*100+1;
       Edat:=Year+I*100+31;
       Rem:=KolSum(Kol,Sdat,EDat);
       Frodm.Gardesh.Append;
       Frodm.GardeshDat.Value :=Edat;
       Frodm.GardeshDiag.Value :=Rem;
       Frodm.GardeshBaghi.Value :=Rem;
       Frodm.GardeshDesc.Value:=Mon_Name(I);
       Frodm.Gardesh.Post;
     End;
end;

Procedure TFAcDiag.Calc_Daily(Kod:Real);
Var
Sd,Ed,Dat:Integer;
Kol,I:Integer;
Rem:Currency;
begin
     Sd:=DateToInt(SDat.Text);
     Ed:=DateToInt(EDat.Text);
     IF Not KodFound(Kod) Then ShowMessage('Õ”«» Ì«›  ‰‘œ');
     Kol:=Frodm.AcKodKgro.Value;
     Open_g;
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Distinct Dat From AcountBill ');
     Qu.SQl.Add('Where Dat Between '+IntToStr(Sd)+' and '+IntToStr(Ed));
     Qu.SQL.Add('Order By Dat');
     Qu.Open;
     For I:=1 To Qu.RecordCount Do
     Begin
       Dat:=Qu.Fields[0].AsInteger;
       Rem:=KolSum(Kol,Dat,Dat);
       Frodm.Gardesh.Append;
       Frodm.GardeshDat.Value :=Dat;
       Frodm.GardeshDiag.Value :=Rem;
       Frodm.GardeshBaghi.Value :=Rem;
       Frodm.GardeshDesc.Value:=IntToDate(Dat);
       Frodm.Gardesh.Post;
       Qu.Next;
     End;
     Qu.Close;
end;

procedure TFAcDiag.FormCreate(Sender: TObject);
Var
I:Integer;
begin
     Set_Forms(FAcDiag);
//     Fill_Comb(Frodm.AcKod,'Nam',FNam.Items);
     Frodm.AcKod.Filter:='KKol = 0 and Kmo = 0 and Ktaf = 0 and AccKod > 0';
     Frodm.AcKod.Filtered :=True;
     For I:=1 To Frodm.AcKod.RecordCount Do
     Begin
        FNam.Items.Add(Frodm.AcKodNam.Value);
        Frodm.AcKod.Next;
     End;
     Frodm.AcKod.Filtered:=False;
end;

procedure TFAcDiag.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;
{Var
Kod:Real;
begin
     Kod:=AccKod(FNam.Text);
     If (FNam.ItemIndex=-1) or (Kod = 0) Then
     Begin
       Beep;
       ShowMessage('Õ”«» „‘Œ’ ‰Ì” ');
       Exit;
     End;
     Calc_Year(Kod);
     CreatingForm(TAcDiagRep,'AcDiagRep',AcDiagRep);
     AcDiagRep.chYear.Chart.BottomAxis.Maximum :=Year+1231;
     AcDiagRep.chYear.Chart.BottomAxis.Minimum :=Year+131;
     AcDiagRep.chYear.Chart.BottomAxis.Increment :=100;
     AcDiagRep.chYear.Chart.AutoRefresh :=True;
     AcDiagRep.chYear.Chart.PrintProportional :=True;
     AcDiagRep.chYear.Chart.Foot.Text.Add(FDesc.Text);
     AcDiagRep.chYear.Chart.Title.Text.Add(FNam.Text);
     AcDiagRep.chYear.Chart.Print;
}
procedure TFAcDiag.BprintClick(Sender: TObject);
begin
     Case Rg1.ItemIndex Of
     0: Calc_Year(AccKod(FNam.Text));
     1: Calc_Daily(AccKod(FNam.Text));
     End;
     CreatingForm(TFGardesh,'FGardesh',FGardesh);
end;

procedure TFAcDiag.BexitClick(Sender: TObject);
begin
     Frodm.Gardesh.Active :=False;
     Frodm.Gardesh.Exclusive :=False;
     FAcDiag.Close;
end;

procedure TFAcDiag.BShowClick(Sender: TObject);
begin
     Case Rg1.ItemIndex Of
     0: Calc_Year(AccKod(FNam.Text));
     1: Calc_Daily(AccKod(FNam.Text));
     End;
     CreatingForm(TFDiag,'FDiag',FDiag);
     FDiag.Caption:=FDiag.Caption+' '+FNam.Text;
end;

procedure TFAcDiag.SDatEnter(Sender: TObject);
begin
     GetMaskText(SDat);
end;

procedure TFAcDiag.SDatExit(Sender: TObject);
begin
     SetMaskText(SDat);
     If Not Date_Check(SDat.Text) Then SDat.SetFocus;
end;

procedure TFAcDiag.EDatEnter(Sender: TObject);
begin
     GetMaskText(EDat);
end;

procedure TFAcDiag.EDatExit(Sender: TObject);
begin
     SetMaskText(EDat);
     If Not Date_Check(EDat.Text) Then EDat.SetFocus;
end;

procedure TFAcDiag.Rg1Click(Sender: TObject);
begin
     Label2.Enabled:= Rg1.ItemIndex = 1;
     Label3.Enabled:= Rg1.ItemIndex = 1;
     Sdat.Enabled  := Rg1.ItemIndex = 1;
     EDat.Enabled  := Rg1.ItemIndex = 1;
end;

end.
