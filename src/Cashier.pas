unit Cashier;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, Grids, DBGrids, StdCtrls, Mask, ComCtrls, ExtCtrls;

type
  TFCashier = class(TForm)
    Label2: TLabel;
    Label1: TLabel;
    FName: TDBEdit;
    FOwner: TDBEdit;
    Label3: TLabel;
    FCtip: TDBComboBox;
    dbg: TDBGrid;
    FBehKod: TDBLookupComboBox;
    Label4: TLabel;
    dbn: TDBNavigator;
    Sb: TStatusBar;
    Procedure NextTab(Sender:TObject;Var Key:Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FBehKodKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCashier: TFCashier;

implementation

uses ProVar, Routins, FrooshDM, Db;

{$R *.DFM}

{ TFCashier }

procedure TFCashier.NextTab(Sender: TObject; var Key: Char);
begin
     If Key =#13 Then
     Begin
      Key:=#0;
      SelectNext(Sender As TWinControl,True,True);
     End;
end;

procedure TFCashier.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
     If FroDM.Cashier.State In[dsEdit,dsInsert] Then
     If RequierdCheck(FroDM.Cashier) Then
      Action :=caFree
     Else
      Action:=caNone;
     If Action=caFree Then Frodm.Cashier.Close;
end;

procedure TFCashier.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     Frodm.Cashier.Open;
     FCtip.Items.Assign(CurrList);
end;

procedure TFCashier.FBehKodKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetAccountDbCombo(Sender,Key,'',0);
end;

procedure TFCashier.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Var
St:String;
begin
     Case Key Of
     VK_Insert :If (ssCtrl in Shift)and (FroDM.Cashier.State = dsBrowse) Then
                Begin
                 FroDM.Cashier.Append;
                 FName.SetFocus;
                End;
     VK_Delete :If ssCtrl in Shift Then
      If (MessageDlg('ÑßæÑÏ ÌÇÑí ÍÐÝ ÔæÏ¿',mtWarning,mbYesNo,-1)= idYes)and Boss Then
       FroDM.Cashier.Delete;
     VK_F3     :If FroDM.Cashier.State In [dsEdit,dsInsert] Then
                Begin
                 FroDM.Cashier.Post;
                 St:=FroDM.CashierName.Value;
                 QuickCloseOpen([69]);
                 FroDM.Cashier.Locate('Name',St,[loCaseInsensitive]);
                End;
     VK_Escape : Close;
     End;
end;

end.
