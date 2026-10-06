unit CentSearch;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, XPListBox, Db, DBTables, Grids, DBGrids;

type
  TFCentSearch = class(TForm)
    Label1: TLabel;
    FNam: TEdit;
    lbName: TXPListBox;
    Bevel1: TBevel;
    SQu: TQuery;
    SQuRadif: TIntegerField;
    SQuNam: TStringField;
    SQuEName: TStringField;
    SQuKod: TIntegerField;
    Ds: TDataSource;
    Dbg: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure lbNameClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FNamKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lbNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DbgKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    Procedure ListFill(NamePart:String);
    //Procedure ListFill_En(NamePart:String);
  public
    { Public declarations }
    Ckod:Real;
  end;

var
  FCentSearch: TFCentSearch;

implementation

uses FrooshDM, ProVar, Routins, Converts;
Const
 SearchCond: Array [1..2] of String=(
 ('Where Nam Like '),
 ('Where EName Like '));

{$R *.DFM}

Procedure TFCentSearch.ListFill(NamePart:String);
Var
I,Idx:Integer;
begin
     If NamePart = '' Then Exit;
     lbName.Items.Clear;
     lbName.Hint:='';
     Screen.Cursor:=crHourGlass;
     SQu.Close;
     If CUser.Lang = 'EN' Then
      SQu.SQL.Strings[2]:=SearchCond[2]+QuotedStr('%'+NamePart+'%')
     Else
      SQu.SQL.Strings[2]:=SearchCond[1]+QuotedStr('%'+NamePart+'%');
     SQu.Open;
     Screen.Cursor:=crDefault;
end;

{Procedure TFCentSearch.ListFill_En(NamePart:String);
Var
I,Idx:Integer;
begin
     If NamePart = '' Then Exit;
     lbName.Items.Clear;
     lbName.Hint:='';
     Qu.SQL.Clear;
     Qu.SQL.Add('Select EName,Kod From Cent Where EName Like '+QuotedStr('%'+NamePart+'%'));
     Screen.Cursor:=crHourGlass;
     Qu.Open;
     For I:=1 To Qu.RecordCount Do
     Begin
      Idx:=lbName.Items.Add(Qu.Fields[0].AsString);
      lbName.AcCode[Idx]:=Qu.Fields[1].Value;
      Qu.Next;
     End;
     Qu.Close;
     Screen.Cursor:=crDefault;
end; }

procedure TFCentSearch.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     SQu.DataBaseName:=CurrDb;
end;

procedure TFCentSearch.lbNameClick(Sender: TObject);
Var
s:String;
begin
     IF lbName.Items.Count = 0 Then Exit;
     S:=lbName.Items.Strings[lbName.ItemIndex];
     FNam.Text:=S;
end;

procedure TFCentSearch.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key Of
     27:  Close;
     13:  If FNam.Focused Then ListFill(FNam.Text);
     End;
end;

procedure TFCentSearch.FNamKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key Of
     VK_UP,VK_DOWN: If SQu.Active Then Dbg.SetFocus;
     27:  begin Key :=0;ModalResult:=mrCancel;Close;end;
     13:  begin
           Key:=0;
           ListFill(FNam.Text);
          End;
     End;
     If Key In[VK_ESCAPE,VK_RETURN] Then Key:=0;
end;

procedure TFCentSearch.lbNameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key Of
     VK_RETURN :If lbName.Focused Then ModalResult:=mrOK Else ModalResult:=mrNone;
     VK_ESCAPE :begin ModalResult:=mrCancel; Close; End;
     End;
     If Key In[VK_ESCAPE,VK_RETURN] Then Key:=0;
end;

procedure TFCentSearch.DbgKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key Of
     VK_RETURN :If Dbg.Focused Then
                Begin
                 CKod:=SQuKod.Value;
                 ModalResult:=mrOK;
                End Else
                 ModalResult:=mrNone;
     VK_ESCAPE :begin ModalResult:=mrCancel; Close; End;
     End;
     If Key In[VK_ESCAPE,VK_RETURN] Then Key:=0;
end;

end.
