unit AccSet;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, CheckLst, ComCtrls, Buttons, ExtCtrls, XPListBox;

type
  TFAccSet = class(TForm)
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
  FAccSet: TFAccSet;

implementation

uses ProVar, Routins, FrooshDM, AccList;

{$R *.DFM}

procedure TFAccSet.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action :=caFree;
end;

procedure TFAccSet.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     //Fill_Cond
     Fill_XPLists(Frodm.AcKod,'Nam','AccKod','Barzi = 0 Or Barzi Is Null ',FAcList);//UseKod = 1 and
     Fill_XPLists(Frodm.AcKod,'Nam','AccKod','Barzi = 1 ',Locked);//UseKod = 1 and
end;

procedure TFAccSet.FAcListClick(Sender: TObject);
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

procedure TFAccSet.lockedClick(Sender: TObject);
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

procedure TFAccSet.Sp1Click(Sender: TObject);
Var
I:Integer;
begin
     I:=FAcList.ItemIndex;
     Locked.Items.Add(FAcList.Items.Strings[I]);
     Locked.AcCode[Locked.Items.IndexOf(FAcList.Items.Strings[I])]:=FAcList.AcCode[I];
     FAcList.Items.Delete(I);
     FAcList.ItemIndex:=I;
end;

procedure TFAccSet.Sp2Click(Sender: TObject);
Var
I:Integer;
begin
     I:=Locked.ItemIndex;
     FAcList.Items.Add(Locked.Items.Strings[I]);
     FAcList.AcCode[FAcList.Items.IndexOf(Locked.Items.Strings[I])]:=Locked.AcCode[I];
     Locked.Items.Delete(I);
     Locked.ItemIndex:=I-1;

end;

procedure TFAccSet.FormDestroy(Sender: TObject);
Var
I:Integer;
St:String;
Code:Real;
begin
     Frodm.AcKod.IndexFieldNames:='AccKod';
     For I:=0 To FAcList.Items.Count-1 Do
     Begin
      Frodm.AcKod.FindKey([FacList.AcCode[I]]);
      Frodm.AcKod.Edit;
      Frodm.AcKodBarzi.Value:=False;
      Frodm.AcKod.Post;
     End;
     For I:=0 To Locked.Items.Count-1 Do
     Begin
      //Code:=;
      Frodm.AcKod.FindKey([Locked.AcCode[I]]);
      Frodm.AcKod.Edit;
      Frodm.AcKodBarzi.Value:=True;
      Frodm.AcKod.Post;
     End;
     QuickCloseOpen([26]);

end;

procedure TFAccSet.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key = 27 Then Close;
end;

end.
