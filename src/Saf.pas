unit Saf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, ComCtrls, Mask, Buttons, ExtCtrls, Db, DBTables;

type
  TFSaf = class(TForm)
    Bevel2: TBevel;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label8: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Bevel3: TBevel;
    FPBill: TDBEdit;
    Bprev: TButton;
    Bnext: TButton;
    Bedit: TButton;
    Bexit: TButton;
    Fno: TEdit;
    FAdd: TDBEdit;
    FDno: TDBEdit;
    Bsave: TBitBtn;
    FSp: TDBEdit;
    Dat1: TMaskEdit;
    FacNo: TDBEdit;
    Label13: TLabel;
    FStatue: TDBComboBox;
    Label3: TLabel;
    Label5: TLabel;
    FNam: TDBComboBox;
    Label6: TLabel;
    FQt: TDBEdit;
    Label9: TLabel;
    FPp: TDBEdit;
    AddQu: TQuery;
    Label12: TLabel;
    FDaf: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FnoKeyPress(Sender: TObject; var Key: Char);
    procedure NextTab(Sender: TObject; var Key: Char);
    procedure Dat1Enter(Sender: TObject);
    procedure Dat1Exit(Sender: TObject);
    procedure FPpEnter(Sender: TObject);
    procedure BprevClick(Sender: TObject);
    procedure BnextClick(Sender: TObject);
    procedure BeditClick(Sender: TObject);
    procedure BsaveClick(Sender: TObject);
    procedure BexitClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FNamExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSaf: TFSaf;

implementation

uses Routins, FrooshDM, ProVar;

{$R *.DFM}

procedure TFSaf.NextTab(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
       Key :=#0;
       SelectNext(Sender As TWinControl,True,True);
     End;
end;

procedure TFSaf.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFSaf.FormCreate(Sender: TObject);
begin
     Set_Forms(Fsaf);
     AddQu.DataBaseName:=CurrDb;
     FNam.Items.Assign(AcList);
     Bedit.Enabled:=Boss;
end;

procedure TFSaf.FnoKeyPress(Sender: TObject; var Key: Char);
Var
Id:Integer;
begin
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0','/',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;
     If (Key =#13)And(FNo.Text <> '') Then
//     If (FroDM.Rsaf.FindKey([Fno.Text])) Then
     If FroDM.Rsaf.Locate('BNo',FNo.Text,[loCaseInsensitive]) Then
     Begin
       Dat1.Text:=IntToDate(Frodm.RSafDat.Value);
     End  Else
     Begin
       ID:=MessageDlg('”› Â „ÊÃÊœ ‰Ì”  .À»  „Ì‘Êœø',mtConfirmation,mbYesNoCancel,0);
       Case Id of
       mrYes    : Begin
                    Frodm.Rsaf.Append;
                    Dat1.Text:='';
                    FDNo.Field.Value :=FNo.Text;
                    Dat1.SetFocus;
                  End;
       mrCancel : FNo.SelectAll;
       mrNo     : Begin
                    FNo.SetFocus;
                    FNo.Clear;
                  End;
       End;
     End;
end;

procedure TFSaf.Dat1Enter(Sender: TObject);
begin
     If Frodm.Rsaf.State = dsBrowse Then Dat1.ReadOnly :=True Else
     Begin
        Dat1.ReadOnly :=False;
        GetMaskText(Dat1);
     End;
end;

procedure TFSaf.Dat1Exit(Sender: TObject);
begin
     If (Frodm.Rsaf.State = dsBrowse) Then Exit;
     SetMaskText(Dat1);
     If(Not Date_Check(Dat1.Text))And(DateToInt(Dat1.Text)>0) Then Dat1.SetFocus Else
     Begin
       Frodm.RsafDat.Value :=DateToInt(Dat1.Text);
     End;
end;

procedure TFSaf.FPpEnter(Sender: TObject);
begin
     If Frodm.Rsaf.State = dsBrowse Then Exit;
     If Frodm.RsafQt.Value > 0  Then
      Frodm.RsafPprice.Value:=Frodm.RsafSprice.Value / Frodm.RsafQt.Value
     Else
      Frodm.RsafPprice.Value:=Frodm.RsafSprice.Value;

end;

procedure TFSaf.BprevClick(Sender: TObject);
begin
     If Frodm.Rsaf.State = dsBrowse Then Frodm.Rsaf.Prior;
end;

procedure TFSaf.BnextClick(Sender: TObject);
begin
     If Frodm.Rsaf.State = dsBrowse Then Frodm.Rsaf.Next;
end;

procedure TFSaf.BeditClick(Sender: TObject);
begin
     Frodm.Rsaf.Edit;
end;

procedure TFSaf.BsaveClick(Sender: TObject);
begin
     If Frodm.Rsaf.State = dsBrowse Then Exit;
     Frodm.Rsaf.Post;
     QuickCloseOpen([31]);
//     Frodm.Rsaf.FindKey([FNo.Text]);
     FroDM.Rsaf.Locate('BNo',FNo.Text,[loCaseInsensitive]);
end;

procedure TFSaf.BexitClick(Sender: TObject);
begin
     FSaf.Close;
end;

procedure TFSaf.FormDestroy(Sender: TObject);
begin
     Check_State(Frodm.Rsaf,BsaveClick);
end;

procedure TFSaf.FNamExit(Sender: TObject);
begin
     If Frodm.Rsaf.State = dsBrowse Then Exit;
     AddQu.Params[0].Value:=FNam.Text;
     AddQu.Open;
     FAdd.Field.Value:=AddQu.Fields[0].AsString+'  ·›‰'+AddQu.Fields[1].AsString;
     AddQu.Close;
end;

procedure TFSaf.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key = VK_F3 Then BsaveClick(Sender);
end;

end.
