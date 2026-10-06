unit JariEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBCtrls, Grids, DBGrids, StdCtrls, Mask;

type
  TFJariEdit = class(TForm)
    dbg: TDBGrid;
    dbn: TDBNavigator;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Fjarinam: TDBEdit;
    FDjari: TDBEdit;
    FBkod: TDBComboBox;
    FBank: TDBComboBox;
    Label4: TLabel;
    Label6: TLabel;
    FBehKod: TDBLookupComboBox;
    FBesKod: TDBLookupComboBox;
    Bevel1: TBevel;
    Procedure NextTab(Sender:TObject;Var Key:Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FJariEdit: TFJariEdit;

implementation

uses ProVar, FrooshDM, Routins,Db;

{$R *.DFM}

procedure TFJariEdit.NextTab(Sender: TObject; var Key: Char);
begin
     If Key =#13 Then
     Begin
        Key:=#0;
        SelectNext(Sender As TWinControl,True,True);
     End;
end;

procedure TFJariEdit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFJariEdit.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     FBKod.Items.Assign(CurrList);
     Fill_Comb(Frodm.Banks,'BNam',FBank.Items);
end;

procedure TFJariEdit.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Var
St:String;
begin
     Case Key Of
     VK_Delete :If ssCtrl in Shift Then//If FroDM.Tar.State = dsBrowse Then
      If (MessageDlg('ÑßæÑÏ ÌÇÑí ÍÐÝ ÔæÏ¿',mtWarning,mbYesNo,-1)= idYes)and Boss Then
       FroDM.JariNam.Delete;
     VK_F3     :If FroDM.JariNam.State In [dsEdit,dsInsert] Then
                Begin
                 FroDM.JariNam.Post;
                 St:=FroDM.JariNamNam.Value;
                 QuickCloseOpen([10]);
                 FroDM.JariNam.Locate('Nam',St,[loCaseInsensitive]);
                End;
     VK_Escape : Close;
     End;
end;

end.
