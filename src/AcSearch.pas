unit AcSearch;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, XPListBox;

type
  TFAcSearch = class(TForm)
    Label1: TLabel;
    FNam: TEdit;
    lbName: TXPListBox;
    Bevel1: TBevel;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lbNameClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FNamKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lbNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lbNameKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    Procedure ListFill(NamePart:String);
    Procedure ListFill_En(NamePart:String);
  public
    { Public declarations }
  end;

var
  FAcSearch: TFAcSearch;

implementation

uses FrooshDM, ProVar, Routins, Converts;

{$R *.DFM}
Procedure TFAcSearch.ListFill(NamePart:String);
Var
I:Integer;
Idx:Integer;
begin
     If NamePart = '' Then Exit;
     lbName.Items.Clear;
     lbName.Hint:='';
     Screen.Cursor:=crHourGlass;
     Frodm.AcKod.IndexFieldNames:='Acckod';
     Frodm.AcKod.First;
     For I:= 1 To Frodm.AcKod.RecordCount Do
     Begin
      If (Pos(NamePart,Frodm.AcKodNam.AsString)>0)and(Frodm.AcKodUseKod.Value=1) Then
      Begin
       Idx:=lbName.Items.Add(KolName(Frodm.AcKodAcckod.AsFloat));//+'-'+Frodm.AcKodNam.AsString);
       lbName.AcCode[Idx]:=Frodm.AcKodAcckod.AsFloat;
      End;
      Frodm.AcKod.Next;
     End;
     Screen.Cursor:=crDefault;
end;

Procedure TFAcSearch.ListFill_En(NamePart:String);
Var
I:Integer;
Idx:Integer;
begin
     If NamePart = '' Then Exit;
     lbName.Items.Clear;
     lbName.Hint:='';
     Screen.Cursor:=crHourGlass;
     Frodm.AcKod.IndexFieldNames:='Acckod';
     Frodm.AcKod.First;
     For I:= 1 To Frodm.AcKod.RecordCount Do
     Begin
      If (Pos(NamePart,Frodm.AcKodEname.AsString)>0)and(Frodm.AcKodUseKod.Value=1) Then
      Begin
       Idx:=lbName.Items.Add(Frodm.AcKodEname.AsString);
       lbName.AcCode[Idx]:=Frodm.AcKodAcckod.Value;
      End;
      Frodm.AcKod.Next;
     End;
     Screen.Cursor:=crDefault;
end;

procedure TFAcSearch.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
end;

procedure TFAcSearch.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFAcSearch.lbNameClick(Sender: TObject);
Var
s:String;
begin
     IF lbName.Items.Count = 0 Then Exit;
     lbName.Hint:=AccString(lbName.AcCode[lbName.ItemIndex]);
end;

procedure TFAcSearch.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key Of
     27:  Close;
     13:  ListFill(FNam.Text);
     End;
end;

procedure TFAcSearch.FNamKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key Of
     VK_UP,VK_DOWN:
     If Not(Sender Is TComboBox)Then Begin lbName.SetFocus;lbName.ItemIndex:=0;End;
     27:  begin Key :=0;ModalResult:=mrCancel;Close;end;
     13:  begin
           Key:=0;
           If CUser.Lang = 'EN' Then
            ListFill_En(FNam.Text)
           Else
            ListFill(FNam.Text);
          End;
     End;
     If Key In[VK_ESCAPE,VK_RETURN] Then Key:=0;
end;

procedure TFAcSearch.lbNameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key Of
     VK_RETURN :If lbName.Focused Then ModalResult:=mrOK Else ModalResult:=mrNone;
     VK_ESCAPE :begin ModalResult:=mrCancel; Close; End;
     //VK_UP,VK_DOWN: Label2.Caption:=AccString(lbName.AcCode[lbName.ItemIndex]);
     End;
     If Key In[VK_ESCAPE,VK_RETURN] Then Key:=0;
end;

procedure TFAcSearch.lbNameKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key Of
     VK_UP,VK_DOWN: Label2.Caption:=AccString(lbName.AcCode[lbName.ItemIndex]);
     End;
     If Key In[VK_ESCAPE,VK_RETURN] Then Key:=0;

end;

end.
