unit Accounts;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, AcComboBox;

type
  TFAcount = class(TForm)
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    cbRoot: TAcComboBox;
    FNam: TEdit;
    FAdd: TEdit;
    FTel: TEdit;
    Fename: TEdit;
    F: TEdit;
    Bmake: TButton;
    Label2: TLabel;
    cbState: TComboBox;
    Label5: TLabel;
    cbCity: TComboBox;
    Label9: TLabel;
    cbRegon: TComboBox;
    Bevel1: TBevel;
    cbFdp: TCheckBox;
    LPath: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure NextTab(Sender: TObject; var Key: Char);
    procedure BmakeClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure cbRootChange(Sender: TObject);
  private
    { Private declarations }
    Function IsNameExist(AcName:String):Boolean;
    Function Saved:Boolean;
    Function Cleared:Boolean;
  public
    { Public declarations }
  end;

var
  FAcount: TFAcount;

implementation

uses Routins, ProVar, FrooshDM;

{$R *.DFM}

Function TFAcount.IsNameExist(AcName:String):Boolean;
begin
     Result:=NamFound(AcName) Or (AcName = '');
end;

Function TFAcount.Saved:Boolean;
begin
     FNam.Text:=Trim(FNam.Text);
     If FNam.Text = '' Then Exit;
     //Result:=Not IsNameExist(FNam.Text);
     Result:=Not IsAcNameExist(FNam.Text,GetKol(cbRoot.AcCode[cbRoot.ItemIndex]));
     If Result And (cbRoot.ItemIndex > -1) Then
     Begin
      New_Account_Root(FNam.Text,cbRoot.Text,cbRoot.AcCode[cbRoot.ItemIndex],1);
      Frodm.AcKod.IndexFieldNames:='Nam';
      Frodm.AcKod.FindKey([FNam.Text]);
      Frodm.AcKod.Edit;
      Frodm.AcKodState.Value:=cbState.Text;
      Frodm.AcKodCity.Value:=cbCity.Text;
      Frodm.AcKodRegon.Value:=cbRegon.Text;
      Frodm.AcKodAdd.Value:=FAdd.Text;
      Frodm.AcKodTel.Value:=FTel.Text;
      Frodm.AcKodEname.Value:=Fename.Text;
      Frodm.AcKodPcred.Value:=FarToCurr(F.Text);
      Frodm.AcKodBarzi.Value:=cbFdp.Checked;
      Frodm.AcKodKdas.Value:=0;
      Frodm.AcKod.Post;
      QuickCloseOpen([26]);
       If cUser.Boss Then  Fill_Cond(Frodm.AcKod,'Nam',CCond,AcList);//' UseKod = 1 and Not KDas = 1'
      Cleared;
     End Else
     Begin
      MessageBeep(MB_ICONEXCLAMATION);
      ShowMessage('ÈÇ Çíä äÇã ÍÓÇÈ ãÚÑÝí ÔÏå ÇÓÊ');
      FNam.SetFocus;
     End;
end;

Function TFAcount.Cleared:Boolean;
begin
     Try
      FNam.Clear;
      FTel.Clear;
      FAdd.Clear;
      Fename.Clear;
      F.Clear;
      Result:=True;
     Except
      Result:=False;
     End;
end;

procedure TFAcount.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFAcount.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
{     If Boss Then
      Fill_Cond(Frodm.AcKod,'Nam','(UseKod = 0 and AccKod > 0)',cbRoot.Items)
     Else}
     Fill_AcCombs(Frodm.AcKod,'Nam','Acckod','(UseKod = 0 and AccKod > 0) and (Kdas = 0 Or KDas Is Null)',cbRoot);
     cbRoot.ItemIndex:=0;
     Fill_Comb(Frodm.AcKod,'State',cbState.Items);
     Fill_Cond(Frodm.AcKod,'City','',cbCity.Items);
     Fill_Cond(Frodm.AcKod,'Regon','',cbRegon.Items);
end;

procedure TFAcount.NextTab(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
      Key:=#0;
      SelectNext(Sender As TWinControl,True,True);
     End;
end;

procedure TFAcount.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key = 27 Then Close;
end;

procedure TFAcount.BmakeClick(Sender: TObject);
begin
     If Saved Then FNam.SetFocus;
end;


procedure TFAcount.FormDestroy(Sender: TObject);
begin
     Frodm.AcKod.Refresh;
     If cUser.Boss Then Fill_Cond(Frodm.AcKod,'Nam',CCond,AcList);
     QuickCloseOpen([26]);
end;

procedure TFAcount.cbRootChange(Sender: TObject);
begin
     lPath.Caption:=AccString(cbRoot.AcCode[cbRoot.ItemIndex]);
end;

end.
