unit MakeBill;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TFMakeBill = class(TForm)
    Label3: TLabel;
    cbDat: TComboBox;
    procedure NextTab(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMakeBill: TFMakeBill;

implementation

uses ProVar, Routins, FrooshDM;

{$R *.DFM}

procedure TFMakeBill.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caNone;    
end;

procedure TFMakeBill.NextTab(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
       Key:=#0;
       SelectNext(Sender As TwinControl,True,True);
     End;
end;

procedure TFMakeBill.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     Fill_Cond(Frodm.AcBill,'Dat','No Is Null',cbDat);
end;

end.
