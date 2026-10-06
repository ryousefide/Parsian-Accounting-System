unit GSearch;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, XPListBox;

type
  TFGSearch = class(TForm)
    Label1: TLabel;
    FNam: TEdit;
    lbGName: TXPListBox;
    Bevel1: TBevel;
    rbMoj: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lbGNameClick(Sender: TObject);
    procedure rbMojClick(Sender: TObject);
    procedure lbGNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FNamKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    Procedure ListFill(NamePart:String);
  public
    { Public declarations }
  end;

var
  FGSearch: TFGSearch;

implementation

uses FrooshDM, ProVar, Routins,DbGrids;

{$R *.DFM}
Procedure TFGSearch.ListFill(NamePart:String);
Var
I:Integer;
begin
     If NamePart = '' Then Exit;
     lbGName.Items.Clear;
     lbGName.Hint:='';
     Screen.Cursor:=crHourGlass;
     Frodm.Good.IndexFieldNames:='Nam';
     Frodm.Good.First;
     For I:= 1 To Frodm.Good.RecordCount Do
     Begin
       If (Pos(NamePart,Frodm.GoodNam.AsString)>0)and(Frodm.GoodFlock.Value = False) Then
         lbGName.Items.Add(Frodm.GoodNam.AsString);
       Frodm.Good.Next;
     End;
     Screen.Cursor:=crDefault;
end;

procedure TFGSearch.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
end;

procedure TFGSearch.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFGSearch.lbGNameClick(Sender: TObject);
Var
s:String;
begin
     IF lbGName.Items.Count = 0 Then Exit;
     S:=lbGName.Items.Strings[lbGName.ItemIndex];
     lbGName.Hint:=IntToStr(GoodKod(S));
end;

procedure TFGSearch.rbMojClick(Sender: TObject);
Var
I:Integer;
begin
     lbGName.Items.Clear;
     If rbMoj.Checked Then
     Begin
       Qu.SQL.Clear;
       Qu.SQL.Add('SELECT DISTINCT Nam  FROM Depot WHERE Quant > 0 ');
       Qu.Open;
       Qu.First;
       For I:=1 To Qu.RecordCount Do
       Begin
        If Pos(FNam.Text,Qu.Fields[0].AsString) > 0 Then
         lbGName.Items.Add(Qu.Fields[0].AsString);
        Qu.Next;
       End;
       Qu.Close;
     End;
end;

procedure TFGSearch.lbGNameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key Of
     VK_RETURN :If lbGName.Focused Then ModalResult:=mrOK Else ModalResult:=mrNone;
     VK_ESCAPE :begin ModalResult:=mrCancel; Close; End;
     End;
     If Key In[VK_ESCAPE,VK_RETURN] Then Key:=0;
end;

procedure TFGSearch.FNamKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key Of
     VK_UP,VK_DOWN:
     If Not(Sender Is TComboBox)Then Begin lbGName.SetFocus;lbGName.ItemIndex:=0;End;
     27:  begin ModalResult:=mrCancel;Close;end;
     13:  begin
           //Key:=0;
           If rbMoj.Checked Then rbMojClick(Sender) Else ListFill(FNam.Text);
          End;
     End;
     If Key In[VK_ESCAPE,VK_RETURN] Then Key:=0;
end;

end.
