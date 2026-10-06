unit LinkCent;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, CheckLst, XPCheckListBox, ComCtrls, Db, DBTables,
  Buttons;

type
  TFLinkCent = class(TForm)
    tvAckod: TTreeView;
    lCGroup: TXPCheckListBox;
    Bevel1: TBevel;
    Splitter1: TSplitter;
    CQu: TQuery;
    bEdit: TSpeedButton;
    bSave: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure tvAckodKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bEditClick(Sender: TObject);
    procedure bSaveClick(Sender: TObject);
  private
    { Private declarations }
    Procedure RemoveFromTable;
    Procedure AddToTable;
  public
    { Public declarations }
  end;

var
  FLinkCent: TFLinkCent;

implementation

uses Routins, FrooshDM, ProVar, MainForm;

{$R *.DFM}

Procedure TFLinkCent.RemoveFromTable;
Var
Qu:TQuery;
begin
     Qu:=TQuery.Create(Application);
     Qu.DatabaseName:=CurrDb;
     Qu.SQL.Clear;
     Qu.SQL.Add('Delete From Cperm where Ackod=:a');
     Qu.Params[0].Value:=AccKod(tvAcKod.Selected.Text);
     Qu.ExecSQL;
end;

Procedure TFLinkCent.AddToTable;
Var
I:Integer;
J:Integer;
Kod:Real;
begin
     J:=1;
     Kod:=AccKod(tvAcKod.Selected.Text);
     Frodm.Cperm.Open;
     For I:=0 to lcGroup.Items.Count-1 Do
     If lcGroup.Checked[I] Then
     Begin
      Frodm.Cperm.Append;
      Frodm.CpermAckod.Value:=Kod;
      Frodm.CpermAcnam.Value:=tvAcKod.Selected.Text;
      Frodm.CpermGrop.Value:=lcGroup.Items.Strings[I];
      Frodm.CpermRadif.value:=J;
      Frodm.Cperm.Post;
      J:=J+1;
     End;
     Frodm.Cperm.Close;
end;

procedure TFLinkCent.FormCreate(Sender: TObject);
Var
I:Integer;
begin
     Set_Forms(Self);
     Main.glKey.GetBitmap(3,Bedit.Glyph);
     Main.glKey.GetBitmap(4,Bsave.Glyph);
     Fill_Comb(Frodm.Cent,'Grop',lCGroup.Items);
     CQu.DatabaseName:=CurrDb;
     If FileExists(Rdir+'\'+'AcTree.dat')Then
      tvAcKod.LoadFromFile(Rdir+'\'+'AcTree.dat');
{Update Image}
     tvAcKod.Images:=Main.TreeImage;
     tvAcKod.StateImages:=Main.TreeImage;
     For I:=0 To tvAcKod.Items.Count-1 Do
     Begin
      IF tvAcKod.Items[i].Count > 0 Then
       tvAcKod.Items[i].ImageIndex :=1
      Else
       tvAcKod.Items[i].ImageIndex :=2;
      tvAcKod.Items[i].StateIndex:=tvAcKod.Items[i].Level+3;
     End;     
end;

procedure TFLinkCent.tvAckodKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Var
Kod:Real;
I,Idx:Integer;
begin
     Case Key of
     VK_UP,VK_DOWN,VK_LBUTTON,VK_RBUTTON:
      Begin
       For I:=0 To lcGroup.Items.Count-1 Do lcGroup.Checked[I]:=False;
       Kod:=AccKod(tvAcKod.Selected.Text);
       CQu.Close;
       CQu.Params[0].Value:=Kod;
       CQu.Open;
       For I:=1 To CQu.RecordCount Do
       Begin
        Idx:=lcGroup.Items.IndexOf(CQu.Fields[0].AsString);
        If Idx > -1 Then lcGroup.Checked[Idx]:=True;
        CQu.Next;
       End;
       CQu.Close;
      End;
     End;
end;

procedure TFLinkCent.bEditClick(Sender: TObject);
begin
     lcGroup.Enabled:=True;
end;

procedure TFLinkCent.bSaveClick(Sender: TObject);
begin
     If Not lcGroup.Enabled Then Exit;
     RemoveFromTable;
     AddToTable;
     lcGroup.Enabled:=False;
end;

end.
