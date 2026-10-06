unit CostList;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, CheckLst, Buttons;

type
  TFCList = class(TForm)
    cbCost: TCheckListBox;
    Sp1: TSpeedButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Sp1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Function ConvertChoose:String;
  end;

var
  FCList: TFCList;

implementation

uses Routins, ProVar, FrooshDM;

{$R *.DFM}

Function TFCList.ConvertChoose:String;
Var
I:Integer;
begin
     Result:='';
     For I:=0 To cbCost.Items.Count-1  Do
     If cbCost.Checked[I] Then
      Result:=Result+'"'+cbCost.Items.Strings[I]+'",';
     If Result <> '' Then Delete(Result,Length(Result),1);
end;

procedure TFCList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFCList.FormCreate(Sender: TObject);
begin
     Set_Forms(FCList);
     Fill_Comb(Frodm.Costc,'Nam','',cbCost.Items);
end;

procedure TFCList.Sp1Click(Sender: TObject);
Var
I:Integer;
begin
     For I:=0 To cbCost.Items.Count-1 Do
     cbCost.Checked[I]:=Not cbCost.Checked[I];
end;

end.
