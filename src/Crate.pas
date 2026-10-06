unit Crate;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ComCtrls, Grids, DBGrids, ExtCtrls, Buttons, DBCtrls;

type
  TFCrate = class(TForm)
    Bevel1: TBevel;
    dbg: TDBGrid;
    PG: TPageControl;
    TabSheet1: TTabSheet;
    Label2: TLabel;
    Dat1: TMaskEdit;
    Label11: TLabel;
    FCname: TDBComboBox;
    FPnet: TDBEdit;
    Label1: TLabel;
    Bexit: TBitBtn;
    Bnew: TBitBtn;
    Bsave: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    Bdel: TBitBtn;
    procedure NextTab(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Dat1Exit(Sender: TObject);
    procedure Dat1Enter(Sender: TObject);
    procedure BsaveClick(Sender: TObject);
    procedure BnewClick(Sender: TObject);
    procedure BexitClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BdelClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCrate: TFCrate;

implementation

uses ProVar, Routins, FrooshDM, Db, CRoutins;

{$R *.DFM}

procedure TFCrate.NextTab(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
      Key:=#0;
      SelectNext(Sender As TWinControl,True,True);
     End;
end;

procedure TFCrate.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Check_State(Frodm.Crate,BSaveClick);
     QuickCloseOpen([67]);
     Fill_Rate;
     Action:=caFree;
     Frodm.Crate.Close;
end;

procedure TFCrate.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     Frodm.Crate.Open;
     FCname.Items.Assign(CurrList);
end;

procedure TFCrate.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key Of
     VK_ESCAPE: If Not Pg.Visible Then Close;
     End;
end;

procedure TFCrate.Dat1Enter(Sender: TObject);
begin
     If Frodm.Crate.State = dsBrowse Then Dat1.ReadOnly :=True Else
     Begin
      Dat1.ReadOnly :=False;
      GetMaskText(Dat1);
     End;
end;

procedure TFCrate.Dat1Exit(Sender: TObject);
begin
     If (Frodm.Crate.State = dsBrowse) Then Exit;
     SetMaskText(Dat1);
     If(Not Date_Check(Dat1.Text))And(DateToInt(Dat1.Text)>0) Then
      Dat1.SetFocus
     Else
       Frodm.Cratedat.Value :=DateToInt(Dat1.Text);
end;


procedure TFCrate.BsaveClick(Sender: TObject);
begin
     If Frodm.Crate.State = dsBrowse Then Exit;
     Frodm.Crate.Post;
end;

procedure TFCrate.BnewClick(Sender: TObject);
begin
     If Frodm.Crate.State <> dsBrowse Then Exit;
     Frodm.Crate.Append;
     Frodm.CrateDat.Value:=0;//Fardate;
     //Dat1.Text:=IntToDate(Frodm.CrateDat.Value);
     Dat1.SetFocus;
end;

procedure TFCrate.BexitClick(Sender: TObject);
begin
     Check_State(Frodm.Crate,BSaveClick);
     Pg.Visible:=False;
end;


procedure TFCrate.BitBtn1Click(Sender: TObject);
begin
     If Frodm.Crate.State <> dsBrowse Then Exit;
     PG.Visible:=True;
     PG.ActivePageIndex:=0;
     Frodm.Crate.Append;
     Frodm.CrateDat.Value:=0;//Fardate;
     //Dat1.Text:=IntToDate(Frodm.CrateDat.Value);
     Dat1.SetFocus;
end;

procedure TFCrate.BdelClick(Sender: TObject);
begin
     If MessageDlg('—òÊ—œ Ã«—Ì Õ–› ê—œœø',mtWarning,mbYESNO,-1) = mrYes Then
      Frodm.Crate.Delete;
end;

procedure TFCrate.BitBtn4Click(Sender: TObject);
begin
     If Frodm.Crate.State <> dsBrowse Then Exit;
     PG.Visible:=True;
     PG.ActivePageIndex:=0;
     Frodm.Crate.Edit;
     Dat1.Text:=IntToDate(Frodm.CrateDat.Value);
     FPNet.SetFocus;
end;

end.
