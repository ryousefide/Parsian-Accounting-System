unit GoodStatue;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls;

type
  TFGStatue = class(TForm)
    Bexit: TButton;
    Bevel6: TBevel;
    PG: TPageControl;
    BuyTab: TTabSheet;
    FroTab: TTabSheet;
    BRejTab: TTabSheet;
    IRejTab: TTabSheet;
    Bnext: TButton;
    MaxBp: TEdit;
    Bevel1: TBevel;
    MaxBq: TEdit;
    MinBp: TEdit;
    MinBq: TEdit;
    AvBp: TEdit;
    Bevel2: TBevel;
    MaxSp: TEdit;
    MaxSq: TEdit;
    MinSp: TEdit;
    MinSq: TEdit;
    AvSp: TEdit;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Bevel3: TBevel;
    MaxRBp: TEdit;
    MaxRBq: TEdit;
    MinRBp: TEdit;
    MinRBq: TEdit;
    AvRBp: TEdit;
    Bevel4: TBevel;
    MaxRSp: TEdit;
    MaxRSq: TEdit;
    MinRSp: TEdit;
    MinRSq: TEdit;
    AvRSp: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Panel1: TPanel;
    Label11: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    GNam: TComboBox;
    FColor: TComboBox;
    FMoj: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BexitClick(Sender: TObject);
    procedure BnextClick(Sender: TObject);
    Procedure NextTab(Sender: TObJect;Var Key :Char);
    procedure GNamDropDown(Sender: TObject);
    procedure GNamChange(Sender: TObject);
    procedure GNamKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    Max_P,Min_P,Ave_P:Currency;
    Max_Q,Min_Q,Moj_Q:Real;
    Procedure Binvo_Update;
    Procedure RejBinvo_Update;
    Procedure Invo_Update;
    Procedure RejInvo_Update;
    Procedure Calc;
  public
    { Public declarations }
  end;

var
  FGStatue: TFGStatue;

implementation

uses FrooshDM, Routins, ProVar, Converts;

{$R *.DFM}
Procedure TFGStatue.NextTab(Sender: TObJect;Var Key :Char);
begin
     If Key = #13 Then
     Begin
       Key:=#0;
       FGStatue.SelectNext(Sender As TWinControl,True,True);
     End;
end;

Procedure TFGStatue.Binvo_Update;
begin
     Good_Statue('BinvoGood',Frodm.BinvoGoodDs,GNam.Text,FColor.Text,Max_p,Min_p,
                  Ave_p,Max_q,Min_q);
     MaxBp.Text :=CurrToFar(Max_p);
     MinBp.Text:=CurrToFar(Min_p);
     AvBp.Text :=CurrToFar(Ave_p);
     MaxBq.Text:=FloatToStr(Max_q);
     MinBq.Text:=FloatToStr(Min_q);
end;

Procedure TFGStatue.RejBinvo_Update ;
begin
     Good_Statue('RejBinvogood',Frodm.RejBinvoGoodDs,GNam.Text,FColor.Text,Max_p,Min_p,
                  Ave_p,Max_q,Min_q);
     MaxRBp.Text :=CurrToFar(Max_p);
     MinRBp.Text:=CurrToFar(Min_p);
     AvRBp.Text :=CurrToFar(Ave_p);
     MaxRBq.Text:=FloatToStr(Max_q);
     MinRBq.Text:=FloatToStr(Min_q);
end;

Procedure TFGStatue.Invo_Update;
begin
     Good_Statue('Invogood',Frodm.InvoGoodDs,GNam.Text,FColor.Text,Max_p,Min_p,
                  Ave_p,Max_q,Min_q);
     MaxSp.Text :=CurrToFar(Max_p);
     MinSp.Text:=CurrToFar(Min_p);
     AvSp.Text :=CurrToFar(Ave_p);
     MaxSq.Text:=FloatToStr(Max_q);
     MinSq.Text:=FloatToStr(Min_q);
end;

Procedure TFGStatue.RejInvo_Update;
begin
     Good_Statue('RejInvogood',Frodm.RejInvoGoodDs,GNam.Text,FColor.Text,Max_p,Min_p,
                  Ave_p,Max_q,Min_q);
     MaxRSp.Text :=CurrToFar(Max_p);
     MinRSp.Text:=CurrToFar(Min_p);
     AvRSp.Text :=CurrToFar(Ave_p);
     MaxRSq.Text:=FloatToStr(Max_q);
     MinRSq.Text:=FloatToStr(Min_q);
end;

Procedure TFGStatue.Calc;
begin
     Binvo_Update;
     RejBinvo_Update;
     Invo_Update;
     RejInvo_Update;
     Moj_q:=Good_Moj(GNam.Text,FColor.Text);
     FMoj.Text:=FloatToStr(Moj_q);
end;

procedure TFGStatue.FormCreate(Sender: TObject);
begin
     Set_Forms(FGStatue);
     Gnam.Items.Assign(Kala);
     FColor.Enabled :=SModel;
     Fill_Comb(Frodm.Color,'Color',FColor.Items);
end;

procedure TFGStatue.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    If Key = VK_F3 Then
    Begin
      Calc;
      Bnext.SetFocus;
    End;
end;

procedure TFGStatue.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action :=caFree;
end;

procedure TFGStatue.BexitClick(Sender: TObject);
begin
     FGStatue.Close;
end;

procedure TFGStatue.BnextClick(Sender: TObject);
begin
//     PG.ActivePageIndex := PG.ActivePageIndex+1;
     Calc;
end;

procedure TFGStatue.GNamDropDown(Sender: TObject);
Var
Gene:Integer;
begin
     Gene:=StrToInt(GNam.Text);
     IF sGene Then
       FillGene(GNam.Items,Gene)
     Else
       GNam.Items.Assign(Kala);
end;

procedure TFGStatue.GNamChange(Sender: TObject);
begin
     Calc;
end;

procedure TFGStatue.GNamKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetGoodCombo(Sender,Key);
end;

end.
