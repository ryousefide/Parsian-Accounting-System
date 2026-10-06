unit AutoMation;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Mask, ExtCtrls, ComCtrls, Grids, DBGrids;

type
  TFAutoAcc = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Stat: TDBCheckBox;
    Bexit: TButton;
    Bedit: TButton;
    Bnext: TButton;
    Bprev: TButton;
    Bsave: TButton;
    Bevel1: TBevel;
    Bevel2: TBevel;
    FBesKod: TDBLookupComboBox;
    FBehKod: TDBLookupComboBox;
    Sb: TStatusBar;
    dbg: TDBGrid;
    procedure BexitClick(Sender: TObject);
    procedure BprevClick(Sender: TObject);
    procedure BnextClick(Sender: TObject);
    procedure BeditClick(Sender: TObject);
    procedure BsaveClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BesKodKeyPress(Sender: TObject; var Key: Char);
    procedure BehKodKeyPress(Sender: TObject; var Key: Char);
    procedure StatKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure dbgDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FBehKodKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FBesKodKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAutoAcc: TFAutoAcc;

implementation

uses FrooshDM, Routins,Db, ProVar, Converts;

{$R *.DFM}
procedure TFAutoAcc.BexitClick(Sender: TObject);
begin
     Check_State(Frodm.AutoBill,BsaveClick);
     Frodm.AcKod.Filtered:=False;
     FAutoAcc.Close;
end;

procedure TFAutoAcc.BprevClick(Sender: TObject);
begin
     FroDM.AutoBill.Prior;
     Sb.Panels[0].Text :=Frodm.AutoBillVar.Value;
     Sb.Panels[1].Text :=Frodm.AutoBillCaption.Value;
     Bnext.Enabled := Not Frodm.AutoBill.Eof;
     BPrev.Enabled := Not Frodm.AutoBill.Bof;
end;

procedure TFAutoAcc.BnextClick(Sender: TObject);
begin
     FroDM.AutoBill.Next;
     Sb.Panels[0].Text :=Frodm.AutoBillVar.Value;
     Sb.Panels[1].Text :=Frodm.AutoBillCaption.Value;
     Bnext.Enabled := Not Frodm.AutoBill.Eof;
     BPrev.Enabled := Not Frodm.AutoBill.Bof;
end;

procedure TFAutoAcc.BeditClick(Sender: TObject);
begin
     FroDM.AutoBill.Edit;
end;

procedure TFAutoAcc.BsaveClick(Sender: TObject);
begin
     If Frodm.AutoBill.State = dsBrowse Then Exit;
     FroDM.AutoBill.Post;
end;

procedure TFAutoAcc.FormActivate(Sender: TObject);
begin
     Bprev.Enabled:=False;
end;

procedure TFAutoAcc.BesKodKeyPress(Sender: TObject; var Key: Char);
begin
     Enter_focus(key,FBehkod);
end;

procedure TFAutoAcc.BehKodKeyPress(Sender: TObject; var Key: Char);
begin
     Enter_focus(key,Bprev);
end;

procedure TFAutoAcc.StatKeyPress(Sender: TObject; var Key: Char);
begin
     Enter_focus(key,FBeskod);
end;

procedure TFAutoAcc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
        Action:=caFree;
end;

procedure TFAutoAcc.FormCreate(Sender: TObject);
begin
     Set_Forms(FAutoAcc);
     Sb.Panels[0].Text :=Frodm.AutoBillVar.Value;
     Sb.Panels[1].Text :=Frodm.AutoBillCaption.Value;
     Frodm.AcKod.IndexFieldNames:='Nam';
     Frodm.AcKod.Filter :='Usekod =  1 ';
     Frodm.AcKod.Filtered:=True;

end;

procedure TFAutoAcc.dbgDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
     If Frodm.AutoBillStat.Value Then
      Dbg.Canvas.Font.Color :=clBlack
     Else
      Dbg.Canvas.Font.Color :=clGray;
     Dbg.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TFAutoAcc.dbgKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Sb.Panels[0].Text :=Frodm.AutoBillVar.Value;
     Sb.Panels[1].Text :=Frodm.AutoBillCaption.Value;
end;

procedure TFAutoAcc.FBehKodKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Frodm.AutoBill.State = dsBrowse then Exit;
     If Key = VK_DELETE Then
      With (Sender as TDBlookupCOmboBox) Do
      Datasource.DataSet.FieldByName(DataField).Clear;

end;

procedure TFAutoAcc.FBesKodKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetAccountDbCombo(Sender,Key,'',0);
end;

end.
