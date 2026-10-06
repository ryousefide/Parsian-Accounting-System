unit Tip;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Mask, Db, DBTables, Grids, DBGrids, ExtCtrls, ComCtrls;

type
  TFTip = class(TForm)
    Label1: TLabel;
    FDes: TDBEdit;
    Dbg: TDBGrid;
    dbn: TDBNavigator;
    Sb: TStatusBar;
    Label2: TLabel;
    Label3: TLabel;
    FBedKod: TDBLookupComboBox;
    FBeskod: TDBLookupComboBox;
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
  FTip: TFTip;

implementation

uses Routins, ProVar, FrooshDM;

{$R *.DFM}

procedure TFTip.NextTab(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
      Key:=#0;
      SelectNext(Sender As TWinControl,True,True);
     End;
end;

procedure TFTip.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
     If FroDM.FTip.State In[dsEdit,dsInsert] Then
      If RequierdCheck(FroDM.FTip) Then Action :=caFree Else
       Action:=caNone;
     If Action=caFree Then FroDM.FTip.Close;
end;

procedure TFTip.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     FroDM.FTip.Open;
end;

procedure TFTip.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Var
St:String;
begin
     Case Key Of
     VK_Insert :If (ssCtrl in Shift)and (FroDM.FTip.State = dsBrowse) Then
                Begin
                 FroDM.FTip.Append;
                 FDes.SetFocus;
                End;
     VK_Delete :If ssCtrl in Shift Then//If FroDM.Tar.State = dsBrowse Then
      If (MessageDlg('—ﬂÊ—œ Ã«—Ì Õ–› ‘Êœø',mtWarning,mbYesNo,-1)= idYes)and Boss Then
       FroDM.FTip.Delete;
     VK_F3     :If FroDM.FTip.State In [dsEdit,dsInsert] Then
                Begin
                 FroDM.FTip.Post;
                 St:=FroDM.FTipDes.Value;
                 QuickCloseOpen([27]);
                 FroDM.FTip.Locate('Des',St,[loCaseInsensitive]);
                End;
     VK_Escape : Close;
     End;
end;

procedure TFTip.FormDestroy(Sender: TObject);
begin
     If FroDM.FTip.State In[dsEdit,dsInsert] Then
      Case MessageDlg('«ÿ·«⁄«  À»  ‘Êœø',mtConfirmation,mbYesNo,0)Of
       mrYes: FroDM.FTip.Post;
       mrNo : FroDM.FTip.Cancel;
      End;
      QuickCloseOpen([27]);
end;

end.
