unit AghsEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Grids, DBGrids, Menus;

type
  TFAgsEdit = class(TForm)
    FNam: TComboBox;
    Rg: TRadioGroup;
    dbg1: TDBGrid;
    BShow: TButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Bexit: TButton;
    Bevel2: TBevel;
    procedure FormCreate(Sender: TObject);
    Procedure NextTab(Sender:TObject;Var Key:Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbg1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbg1KeyPress(Sender: TObject; var Key: Char);
    procedure dbg1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure BShowClick(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BexitClick(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
  private
    { Private declarations }
    Procedure Recieve;
    Function MakeFilt:String;
  public
    { Public declarations }
    ORNo:Integer;
  end;

var
  FAgsEdit: TFAgsEdit;

implementation

uses ProVar, FrooshDM, Routins, Db, CashMoney;

{$R *.DFM}
Procedure TFAgsEdit.Recieve;
begin
     If Frodm.AghsPayed.Value Then Exit;
     CreatingForm(TFCashBill,'FCashBill',FCashBill);
     FCashBill.BDo.OnClick:=FCashBill.AghBDoClick;
     FCashBill.FPbill.Field.AsCurrency:=Frodm.AghsGprice.Value;
     IF AccKod(Frodm.AghsNam.Value) > 0 Then
       FCashBill.FAccNam.Field.AsString:=Frodm.AghsNam.Value
     Else
       FCashBill.FAccNam.Field.AsString:='Œ—Ìœ«— €Ì—Â';
     FCashBill.FDesc.Field.Value:='œ—Ì«›  ﬁ”ÿ ‘„«—Â'+IntToStr(Frodm.AghsNo.Value)+
      ' «“ '+Frodm.AghsNam.Value;
     FCashBill.BDo.SetFocus;
end;

Function TFAgsEdit.MakeFilt:String;
Var
St:String;
begin
     If FNam.Text > '' Then St:=St+' Nam = '+#39+FNAm.Text+#39;
     Case Rg.ItemIndex Of
     0 : St:=St +' and Payed = False';
     1 : St:=St +' and Payed = True';
     2 : St:=st +' and Dat = '+IntToStr(Fardate);
     End;
     If Pos(' and',St) = 1 Then Delete(St,1,4);
     Result:=St;
end;

Procedure TFAgsEdit.NextTab(Sender:TObject;Var Key:Char);
begin
     If Key = #13 Then
     Begin
       Key:=#0;
       SelectNext(Sender As TWinControl,True,True);
     End;
end;

procedure TFAgsEdit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action :=caFree;
     Frodm.Aghs.Filtered:=False;
      QuickCloseOpen([36]);
end;

procedure TFAgsEdit.FormCreate(Sender: TObject);
begin
     Set_Forms(FAgsEdit);
     Fill_Comb(Frodm.Aghs,'Nam',FNam.Items);
     FNam.Items.Add('');
end;

procedure TFAgsEdit.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key = VK_F3 Then BShowClick(Sender);
end;

procedure TFAgsEdit.dbg1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
     IF Not(Frodm.AghsPayed.Value) Then dbg1.Canvas.Font.Color :=clRed
     Else dbg1.Canvas.Font.Color :=clBlack;
     dbg1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TFAgsEdit.dbg1KeyPress(Sender: TObject; var Key: Char);
begin
     If Key =#13 Then
     Begin
      Key:=#0;
      GMove(Dbg1,Frodm.Aghs);
     End;
end;

procedure TFAgsEdit.dbg1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Frodm.Aghs.State = dsInsert Then Frodm.Aghs.Cancel;
//     IF (Not (dbg1.SelectedField.Index In [0,4])) Then Frodm.Aghs.Edit;
     IF Not(Frodm.AghsPayed.Value) Then Frodm.Aghs.Edit;
     IF Shift =[ssCtrl] Then BShow.SetFocus;
end;

procedure TFAgsEdit.N1Click(Sender: TObject);
begin
     Recieve;
end;

procedure TFAgsEdit.N2Click(Sender: TObject);
begin
     If MessageDlg('ﬁ”ÿ Õ–› „Ì‘Êœ',mtWarning,mbYesNo,0) =idYes Then
       Frodm.Aghs.Delete;
end;

procedure TFAgsEdit.N3Click(Sender: TObject);
begin
     If MessageDlg('ﬁ”ÿ  €ÌÌ— Ê÷⁄Ì  œ«œÂ „Ì‘Êœø',mtConfirmation,mbYesNo,0) =idYes Then
     Begin
       Frodm.Aghs.Edit;
       Frodm.AghsPayed.Value:=Not Frodm.AghsPayed.Value;
       Frodm.Aghs.Post;
     End;
end;

procedure TFAgsEdit.PopupMenu1Popup(Sender: TObject);
begin
     N1.Enabled:=Not Frodm.AghsPayed.Value;
     N3.Enabled:= CUser.Name = '„œÌ—Ì  „«·Ì';
end;

procedure TFAgsEdit.BShowClick(Sender: TObject);
begin
     Frodm.Aghs.Filtered:=False;
     Frodm.Aghs.Filter:=MakeFilt;
     Frodm.Aghs.Filtered:=True;
end;

procedure TFAgsEdit.BexitClick(Sender: TObject);
begin
     FAgsEdit.Close;
end;

end.
