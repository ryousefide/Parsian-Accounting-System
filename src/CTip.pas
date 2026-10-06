unit CTip;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Mask, Db, DBTables, Grids, DBGrids, ExtCtrls, ComCtrls;

type
  TFCTip = class(TForm)
    Label1: TLabel;
    FDes: TDBEdit;
    Dbg: TDBGrid;
    dbn: TDBNavigator;
    Sb: TStatusBar;
    Label2: TLabel;
    FSign: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure NextTab(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCTip: TFCTip;

implementation

uses Routins, ProVar, FrooshDM;

{$R *.DFM}

procedure TFCTip.NextTab(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
      Key:=#0;
      SelectNext(Sender As TWinControl,True,True);
     End;
end;

procedure TFCTip.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
     If FroDM.CTip.State In[dsEdit,dsInsert] Then
      If RequierdCheck(FroDM.CTip) Then Action :=caFree Else
       Action:=caNone;
end;

procedure TFCTip.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
end;

procedure TFCTip.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Var
St:String;
begin
     Case Key Of
     VK_Insert :If (ssCtrl in Shift)and (FroDM.CTip.State = dsBrowse) Then
                Begin
                 FroDM.CTip.Append;
                 FDes.SetFocus;
                End;
     VK_Delete :If ssCtrl in Shift Then//If FroDM.Tar.State = dsBrowse Then
      If (MessageDlg('—ﬂÊ—œ Ã«—Ì Õ–› ‘Êœø',mtWarning,mbYesNo,-1)= idYes)and Boss Then
       FroDM.CTip.Delete;
     VK_F3     :If FroDM.CTip.State In [dsEdit,dsInsert] Then
                Begin
                 FroDM.CTip.Post;
                 St:=FroDM.CTipName.Value;
                 QuickCloseOpen([66]);
                 FroDM.CTip.Locate('Name',St,[loCaseInsensitive]);
                End;
     VK_Escape : Close;
     End;
end;

procedure TFCTip.FormDestroy(Sender: TObject);
begin
     If FroDM.CTip.State In[dsEdit,dsInsert] Then
      Case MessageDlg('«ÿ·«⁄«  À»  ‘Êœø',mtConfirmation,mbYesNo,0)Of
       mrYes: FroDM.CTip.Post;
       mrNo : FroDM.CTip.Cancel;
      End;
      QuickCloseOpen([66]);
      Fill_Comb(Frodm.CTip,'Name',CurrList);
end;

end.
