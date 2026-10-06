unit AForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, CheckLst, XPCheckListBox, Buttons;

type
  TFAForm = class(TForm)
    cbGRP: TComboBox;
    CList: TXPCheckListBox;
    Button1: TBitBtn;
    Button2: TBitBtn;
    BitBtn1: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure cbGRPChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAForm: TFAForm;

implementation

uses Routins, ProVar, FrooshDM, CRoutins;

{$R *.DFM}

procedure TFAForm.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     Fill_Comb(Frodm.Cent,'Grop',cbGrp.Items);
     cbGrp.Items.Add('');
     //Fill_ChLists(Frodm.Cent,'Nam','Kod','',CList);
end;

procedure TFAForm.cbGRPChange(Sender: TObject);
begin
     If cbGRP.Text > '' Then
      Fill_ChLists(Frodm.Cent,'Nam','Kod','Grop='+QuotedStr(cbGrp.Text),CList)
     Else
      Fill_ChLists(Frodm.Cent,'Nam','Kod','',CList);
end;

end.
