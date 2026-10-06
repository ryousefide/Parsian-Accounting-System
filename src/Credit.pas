unit Credit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Mask, ExtCtrls;

type
  TFCredit = class(TForm)
    FNam: TComboBox;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    FTel: TDBEdit;
    FAdd: TDBEdit;
    FPCred: TDBEdit;
    FTCred: TDBEdit;
    Bsave: TButton;
    BExit: TButton;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label6: TLabel;
    cbState: TDBComboBox;
    Label7: TLabel;
    cbCity: TDBComboBox;
    Label2: TLabel;
    Label12: TLabel;
    cbRegon: TDBComboBox;
    Label3: TLabel;
    FName: TDBEdit;
    DBText1: TDBText;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FNamChange(Sender: TObject);
    procedure FNamExit(Sender: TObject);
    procedure BsaveClick(Sender: TObject);
    procedure BExitClick(Sender: TObject);
    Procedure NexTab(Sender:TObject;Var Key :Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCredit: TFCredit;

implementation

uses FrooshDM, Routins, ProVar, Db, Converts;

{$R *.DFM}
Procedure TFCredit.NexTab(Sender:TObject;Var Key :Char);
begin
     If Key = #13 Then
     Begin
       Key:=#0;
       FCredit.SelectNext(Sender As TWinControl,True,True);
     End;
end;

procedure TFCredit.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     Frodm.AcKod.IndexFieldNames :='Nam';
     Frodm.AcKod.Filter:=' Usekod = 1';
     Frodm.AcKod.Filtered :=True;
     Fill(Frodm.AcKod,'Nam',FNam.Items);
     Fill_Comb(Frodm.AcKod,'State',cbState.Items);
     Fill_Cond(Frodm.AcKod,'City','',cbCity.Items);
     Fill_Cond(Frodm.AcKod,'Regon','',cbRegon.Items);
     Frodm.AcKod.Filtered :=False;
end;

procedure TFCredit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
     QuickCloseOpen([26]);
end;

procedure TFCredit.FNamChange(Sender: TObject);
begin
     Frodm.AcKod.FindKey([FNam.Text]);
end;

procedure TFCredit.FNamExit(Sender: TObject);
begin
     Frodm.AcKod.Edit;
end;

procedure TFCredit.BsaveClick(Sender: TObject);
begin
     IF Frodm.AcKod.State = dsBrowse Then Exit;
     Frodm.AcKod.Post;
     Saved;
end;

procedure TFCredit.BExitClick(Sender: TObject);
begin
     Check_State(Frodm.AcKod,BSaveClick);
     FCredit.Close;
end;

end.
