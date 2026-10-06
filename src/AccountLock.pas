unit AccountLock;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, CheckLst, ComCtrls, Buttons, ExtCtrls, XPListBox;

type
  TFAcLock = class(TForm)
    FAcList: TXPListBox;
    Sb1: TStatusBar;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Panel2: TPanel;
    Sp1: TSpeedButton;
    Sp2: TSpeedButton;
    locked: TXPListBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FAcListClick(Sender: TObject);
    procedure lockedClick(Sender: TObject);
    procedure Sp1Click(Sender: TObject);
    procedure Sp2Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAcLock: TFAcLock;

implementation

uses ProVar, Routins, FrooshDM, AccList;

{$R *.DFM}

procedure TFAcLock.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action :=caFree;
end;

procedure TFAcLock.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     Fill_XPLists(Frodm.AcKod,'Nam','Acckod','KDas = 0 Or KDas Is Null ',FAcList);
     Fill_XPLists(Frodm.AcKod,'Nam','Acckod','KDas = 1 ',Locked);
end;

procedure TFAcLock.FAcListClick(Sender: TObject);
Var
Str:String;
I:Real;
begin
     Sp1.Enabled:=FacList.Focused;
     Sp2.Enabled:=Locked.Focused;
     I:= AccKod(FacList.Items.Strings[FacList.ItemIndex]);
     Str:=AccString(I);
     Sb1.Panels[0].Text:=Str;
     Sb1.Hint:=Str;
end;

procedure TFAcLock.lockedClick(Sender: TObject);
Var
Str:String;
I:Real;
begin
     Sp1.Enabled:=FacList.Focused;
     Sp2.Enabled:=Locked.Focused;
     I:= AccKod(Locked.Items.Strings[Locked.ItemIndex]);
     Str:=AccString(I);
     Sb1.Panels[0].Text:=Str;
     Sb1.Hint:=Str;
end;

procedure TFAcLock.Sp1Click(Sender: TObject);
Var
I:Integer;
begin
     I:=FAcList.ItemIndex;
     Locked.Items.Add(FAcList.Items.Strings[I]);
     Locked.AcCode[Locked.Items.IndexOf(FAcList.Items.Strings[I])]:=FAcList.AcCode[I];
     FAcList.Items.Delete(I);
     FAcList.ItemIndex:=I;
end;

procedure TFAcLock.Sp2Click(Sender: TObject);
Var
I:Integer;
begin
     I:=Locked.ItemIndex;
     FAcList.Items.Add(Locked.Items.Strings[I]);
     FAcList.AcCode[FAcList.Items.IndexOf(Locked.Items.Strings[I])]:=Locked.AcCode[I];
     Locked.Items.Delete(I);
     Locked.ItemIndex:=I-1;

end;

procedure TFAcLock.FormDestroy(Sender: TObject);
Var
I:Integer;
begin
     Frodm.AcKod.IndexFieldNames:='Acckod';
     For I:=0 To FAcList.Items.Count-1 Do
     Begin
      Frodm.AcKod.FindKey([FAclist.AcCode[I]]);
      Frodm.AcKod.Edit;
      Frodm.AcKodKDas.Value:=0;
      Frodm.AcKod.Post;
     End;
     For I:=0 To Locked.Items.Count-1 Do
     Begin
      Frodm.AcKod.FindKey([Locked.AcCode[I]]);
      Frodm.AcKod.Edit;
      Frodm.AcKodKDas.Value:=1;
      Frodm.AcKod.Post;
     End;
     QuickCloseOpen([26]);
     If cUser.Boss Then  Fill_Cond(Frodm.AcKod,'Nam',CCond,AcList);//
end;

procedure TFAcLock.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key = 27 Then Close;
end;

end.
