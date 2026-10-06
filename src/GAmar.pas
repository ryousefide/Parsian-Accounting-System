unit GAmar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Db, DBTables, ExtCtrls, Mask;

type
  TFGAmar = class(TForm)
    DQu: TQuery;
    DataSource1: TDataSource;
    BShow: TButton;
    dbg: TDBGrid;
    Label2: TLabel;
    Label3: TLabel;
    SDat: TMaskEdit;
    EDat: TMaskEdit;
    Rg: TRadioGroup;
    Bexit: TButton;
    Bevel1: TBevel;
    FSum: TEdit;
    FQuant: TEdit;
    procedure BShowClick(Sender: TObject);
    procedure RgClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure NextTab(Sender: TObject; var Key: Char);
    procedure SDatEnter(Sender: TObject);
    procedure SDatExit(Sender: TObject);
    procedure EDatEnter(Sender: TObject);
    procedure EDatExit(Sender: TObject);
    procedure BexitClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FGAmar: TFGAmar;

implementation

uses FrooshDM, Routins, ProVar;

{$R *.DFM}
procedure TFGAmar.NextTab(Sender: TObject; var Key: Char);
begin
     If Key=#13 Then
     Begin
       Key:=#0;
       SelectNext(Sender As TWinControl,True,True);
     End;
end;

procedure TFGAmar.RgClick(Sender: TObject);
begin
     DQu.Close;
     Case Rg.ItemIndex Of
     0 : DQu.SQL.Strings[1]:='From '+Frodm.InvoGood.TableName;
     1 : DQu.SQL.Strings[1]:='From '+Frodm.BinvoGood.TableName;
     2 : DQu.SQL.Strings[1]:='From '+Frodm.RejInvoGood.TableName;
     3 : DQu.SQL.Strings[1]:='From '+Frodm.RejBinvoGood.TableName;
     End;
     BshowClick(Sender);     
end;

procedure TFGAmar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFGAmar.FormCreate(Sender: TObject);
begin
     Set_Forms(FGAmar);
     SDat.Text:=Beg_Date;
     EDat.Text:=End_Date;
     DQu.DatabaseName:=CurrDb;
end;
procedure TFGAmar.SDatEnter(Sender: TObject);
begin
     GetMaskText(SDat);
end;

procedure TFGAmar.SDatExit(Sender: TObject);
begin
     SetMaskText(SDat);
     If Not Date_Check(SDat.Text) Then SDat.SetFocus;
end;

procedure TFGAmar.EDatEnter(Sender: TObject);
begin
     GetMaskText(EDat);
end;

procedure TFGAmar.EDatExit(Sender: TObject);
begin
     SetMaskText(EDat);
     If Not Date_Check(EDat.Text) Then EDat.SetFocus;
end;

procedure TFGAmar.BShowClick(Sender: TObject);
Var
I:Integer;
Sum:Currency;
QSum:Real;
begin
     DQu.Params[0].Value:=DateToInt(Sdat.Text);
     DQu.Params[1].Value:=DateToInt(Edat.Text);
     DQu.Close;
     DQu.Open;
     Sum:=0;QSum:=0;
     Dbg.DataSource:=Nil;
     For I:=1 To DQu.RecordCount Do
     Begin
      Sum:=Sum+Dqu.Fields[2].AsCurrency;
      QSum:=QSum+Dqu.Fields[1].AsCurrency;
      DQu.Next;
     End;
     FSum.Text:=CurrToFar(Sum);
     FQuant.Text:=FloatToStr(QSum);
     Dbg.DataSource:=DataSource1;
end;

procedure TFGAmar.BexitClick(Sender: TObject);
begin
     FGAmar.Close;
end;

end.
