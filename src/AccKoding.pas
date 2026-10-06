unit AccKoding;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, ExtCtrls, ComCtrls;

type
  TFAccKoding = class(TForm)
    Panel1: TPanel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    FKgroCmb: TComboBox;
    FkolCmb: TComboBox;
    FkmoCmb: TComboBox;
    Fktafcmb: TComboBox;
    Panel2: TPanel;
    Bdel: TButton;
    Bexit: TButton;
    Sb1: TStatusBar;
    procedure FKgroCmbChange(Sender: TObject);
    procedure FkolCmbChange(Sender: TObject);
    procedure FkmoCmbChange(Sender: TObject);
    procedure BeditClick(Sender: TObject);
    procedure BdelClick(Sender: TObject);
    procedure BexitClick(Sender: TObject);
    procedure FktafcmbChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FKgroCmbExit(Sender: TObject);
    procedure FkolCmbExit(Sender: TObject);
    procedure FkmoCmbExit(Sender: TObject);
    procedure FktafcmbExit(Sender: TObject);
    Procedure BSaveClick(Sender:Tobject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    procedure PanelTex(Sender: TObject);
    Procedure AcMake(Sender:Tobject;M_cmb,Cmb:TcomboBox;AccNam:String);
    Procedure FillCombo;
  public
    { Public declarations }
    Function  AcTip(AcKod:Real):Integer;
  end;

var
  FAccKoding: TFAccKoding;

implementation

uses FrooshDM,DbTables,Db, Routins, ProVar;

{$R *.DFM}

Procedure TFAccKoding.BSaveClick(Sender:Tobject);
begin
     ShowMessage('Õ«·  ê—› Â ‘œ.');
end;

Function  TFAccKoding.AcTip(AcKod:Real):Integer;
Var
gro,kol,mo,Taf:Integer;
begin
     Result:=0;
     gro:=Frodm.AcKodKgro.Value;
     kol:=Frodm.AcKodKKol.Value;
     mo:=Frodm.AcKodKmo.Value;
     Taf:=Frodm.AcKodKTaf.Value;
     If (gro=0)and(kol=0)and(mo=0)and(Taf=0)Then Result:=0;
     If (gro>0)and(kol=0)and(mo=0)and(Taf=0)Then Result:=1;
     If (gro>0)and(kol>0)and(mo=0)and(Taf=0)Then Result:=2;
     If (gro>0)and(kol>0)and(mo>0)and(Taf=0)Then Result:=3;
     If (gro>0)and(kol>0)and(mo>0)and(Taf>0) Then Result:=4;
end;

procedure TFAccKoding.PanelTex(Sender: TObject);
Var
Kod:Real;
begin
     Kod:=Frodm.AcKodAccKod.Value;
     Sb1.Panels[0].Text:=FloatToStr(Kod);
     Case Frodm.AcKodUseKod.Value Of
     0:Sb1.Panels[1].Text:='”—›’·';
     1:Sb1.Panels[1].Text:='⁄„·Ì« Ì';
     End;
     Sb1.Panels[2].Text:=AccString(Kod);
end;

Procedure TFAccKoding.AcMake(Sender:Tobject;M_cmb,Cmb:TcomboBox;AccNam:String);
Var
Id,Use:Integer;
begin
     If Cmb.Items.Count >998 Then
     Begin
       ShowMessage('›÷« »—«Ì  ⁄—Ì› Õ”«» „ÊÃÊœ ‰Ì” ');
       Exit;
     End;
     If (AccNam = '') Then Exit;
     Use:=0;
     If Cmb.Items.IndexOf(AccNam) = -1 Then
      If MessageDlg('Õ”«» „ÊÃÊœ ‰Ì”  .«ÌÃ«œ ‘Êœø',mtWarning,mbYesNo,0) = mrYes Then
      Begin
        Cmb.SetFocus;
        IF (NamFound(AccNam)) Then
        Begin
          ShowMessage('‰«„ Õ”«»  ﬂ—«—Ì «” ');
          Exit;
        End;
        If M_cmb.Text = '' Then
        Begin
          ShowMessage('Õ”«» »«·«œ”  —« „‘Œ’ ﬂ‰Ìœ');
          Exit;
        End;
        NamFound(M_cmb.Text);
        If Frodm.AcKodUseKod.Value = 1 Then
        Begin
          Beep;
          ShowMessage('Õ”«» »«·«œ”  »«Ìœ ”— ›’· »«‘œ');
          M_cmb.OnChange(Sender);
          Exit;
        End;

        Id:=MessageDlg('Õ”«» ”— ›’· «” ø',mtInformation,mbYesNo,0);
        Case Id Of
         mrYes: Use:=0;
         mrNo : Use:=1;
        End;
        New_Account_Root(AccNam,M_cmb.Text,0,Use);
        M_cmb.OnChange(Sender);
        cmb.OnChange(Sender);
        Cmb.Text:='';
      End;

end;

Procedure TFAccKoding.FillCombo;
Var
I:Integer;
Str:String;
begin
     FKgroCmb.Items.Clear;
     FkolCmb.Items.Clear;
     FKmoCmb.Items.Clear;
     FKtafCmb.Items.Clear;
     Frodm.AcKod.IndexFieldNames :='AccKod';
     Frodm.AcKod.First;
     For I:=1 To Frodm.AcKod.RecordCount Do
     Begin
       Str:=Frodm.AcKodNam.Value;
       Case AcTip(Frodm.AcKodAccKod.Value) Of
       1:  FKgroCmb.Items.Add(Str);
       2:  FkolCmb.Items.Add(Str);
       3:  FKmoCmb.Items.Add(Str);
       4:  FKtafCmb.Items.Add(Str);
       End;
       Frodm.AcKod.Next;
     End;
end;
procedure TFAccKoding.FKgroCmbChange(Sender: TObject);
var
I:integer;
Fkod,Pgro,Rem:Real;
begin
     If Fkgrocmb.Text = '' Then
     Begin
       FillCombo;
       Exit;
     End;
     FkolCmb.Items.Clear;
     If Fkgrocmb.ItemIndex = -1 Then Exit;
     Pgro:=AccKod(Fkgrocmb.Text);
     FroDM.AcKod.IndexFieldNames :='Acckod';
     FroDM.AcKod.SetRange([Pgro+1000000],[Pgro+999000000]);
     For I:=1 To FroDM.AcKod.RecordCount DO
     Begin
       Fkod:=FroDM.AcKodAcckod.Value;
       Rem:=Frac(Fkod/1000000);
       If Rem=0Then FkolCmb.Items.Add(FroDM.AcKodNam.Value);
       FroDM.AcKod.Next;
     End;
     FroDM.AcKod.IndexFieldNames:='Nam';
     FroDM.AcKod.FindKey([Fkgrocmb.Text]);
     PanelTex(sender);
end;

procedure TFAccKoding.FkolCmbChange(Sender: TObject);
var
I:Integer;
Fkod,Pgro,Rem:Real;
begin
{     If Fkolcmb.Text = '' Then
     Begin
       FillCombo;
       Exit;
     End;}
     Fkmocmb.Items.Clear;
     If Fkolcmb.ItemIndex = -1 Then Exit;
     Pgro:=Acckod(Fkolcmb.Text);
     FroDM.AcKod.IndexFieldNames :='Acckod';
     FroDM.AcKod.SetRange([Pgro+1000],[Pgro+999000]);
     For I:=1 To FroDM.AcKod.RecordCount DO
     Begin
       Fkod:=FroDM.AcKodAcckod.Value;
       Rem:=Frac(Fkod/1000);
       If Rem=0 Then FkmoCmb.Items.Add(FroDM.AcKodNam.Value);
       FroDM.AcKod.Next;
     End;
     FroDM.AcKod.IndexFieldNames:='Nam';
     FroDM.AcKod.FindKey([Fkolcmb.Text]);
     panelTex(sender);
end;

procedure TFAccKoding.FkmoCmbChange(Sender: TObject);
var
I:integer;
Rem:Real;
Fkod,Pgro:Real;
begin
{     If Fkmocmb.Text = '' Then
     Begin
       FillCombo;
       Exit;
     End;}
     FkTafcmb.Items.Clear;
     If Fkmocmb.ItemIndex = -1 Then Exit;
     Pgro:=Acckod(Fkmocmb.Text);
     FroDM.AcKod.IndexFieldNames :='Acckod';
     FroDM.AcKod.SetRange([Pgro+1],[Pgro+999]);
     For I:=1 To FroDM.AcKod.RecordCount DO
     Begin
       Fkod:=FroDM.AcKodAcckod.Value;
       Rem:=Frac(Fkod/1);
       If Rem=0 Then FktafCmb.Items.Add(FroDM.AcKodNam.Value);
       FroDM.AcKod.Next;
     End;
     FroDM.AcKod.IndexFieldNames:='Nam';
     FroDM.AcKod.FindKey([Fkmocmb.Text]);
     PanelTex(sender);
end;



procedure TFAccKoding.BeditClick(Sender: TObject);
begin
     FroDM.AcKod.Edit;
end;

procedure TFAccKoding.BdelClick(Sender: TObject);
Var
Str:String;
Kod:Real;
begin
     Str:='Õ”«»'+' '+Frodm.AcKodNam.Value+' '+'Õ–› ê—œœø';
     Kod:=Frodm.AcKodAcckod.Value;
     If MessageDlg(Str,mtWarning,mbYesNo,0) = idYes Then
     Begin
       If (CheckBill(Kod)) or (IsConstAc(Kod)) Then
       Begin
         Beep;
         ShowMessage('Õ”«» ”«»ﬁÂ œ«—œ .ﬁ«»· Õ–› ‰„Ì »«‘œ');
         Exit;
       End;
       If Ac_Delete_Check(Kod,Frodm.AcKodUseKod.Value) Then
           FroDM.AcKod.Delete Else
       Begin
         Beep;
         ShowMessage('Õ”«» “Ì— „Ã„Ê⁄Â œ«—œ .ﬁ«»· Õ–› ‰„Ì »«‘œ');
         Exit;
       End;
       Beep;
       ShowMessage('Õ”«» „Ê—œ ‰Ÿ— Õ–› ê—œÌœ');
//       FillCombo;
//       FdasCmbChange(Sender);
       FKgroCmbChange(Sender);
       FKolCmbChange(Sender);
       FKmoCmbChange(Sender);
       FKtafCmbChange(Sender);
     End;
end;

procedure TFAccKoding.BexitClick(Sender: TObject);
begin
        Check_State(Frodm.AcKod,BSaveClick);
        FAccKoding.Close;
end;

procedure TFAccKoding.FktafcmbChange(Sender: TObject);
begin
     FroDM.AcKod.IndexFieldNames:='Nam';
     FroDM.AcKod.FindKey([Fktafcmb.Text]);
     PanelTex(sender);
end;

procedure TFAccKoding.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      Action:=caFree;
end;

procedure TFAccKoding.FormCreate(Sender: TObject);
begin
     Set_Forms(FAccKoding);
     Frodm.AcKod.CancelRange;
     Frodm.AcKod.Filtered :=False;
     FillCombo;
     IF Boss Then  Bdel.Enabled :=True;
end;

procedure TFAccKoding.FormKeyPress(Sender: TObject; var Key: Char);
begin
     IF Key =#13 Then
     Begin
       Key:=#0;
       FAccKoding.SelectNext(Sender As TWinControl,True,True);
     End;
end;

procedure TFAccKoding.FKgroCmbExit(Sender: TObject);
Var
AccNam:String;
begin
     AccNam:=FKgrocmb.Text;
     If  AccNam= '' Then Exit;
     If FKgrocmb.Items.IndexOf(AccNam) = -1 Then
      If MessageDlg('Õ”«» ﬂ· „ÊÃÊœ ‰Ì”  .«ÌÃ«œ ‘Êœø',mtWarning,mbYesNo,0) = mrYes Then
      Begin
        IF (NamFound(AccNam)) Then
        Begin
          ShowMessage('‰«„ Õ”«»  ﬂ—«—Ì «” ');
          Exit;
        End;
        MakeKol(AccNam);
        FKgrocmb.Text:='';
        FKgroCmbChange(Sender);
      End;
end;

procedure TFAccKoding.FkolCmbExit(Sender: TObject);
begin
     AcMake(Sender,FkgroCmb,FKolcmb,FKolcmb.Text);
end;

procedure TFAccKoding.FkmoCmbExit(Sender: TObject);
begin
     AcMake(Sender,FKolcmb,FKmocmb,FKmocmb.Text);
end;

procedure TFAccKoding.FktafcmbExit(Sender: TObject);
begin
     AcMake(Sender,FKmocmb,FKtafcmb,FKtafcmb.Text);
end;

procedure TFAccKoding.FormDestroy(Sender: TObject);
begin
//     Fill_Cond(Frodm.AcKod,'Nam',' UseKod = 1 ',AcList);
     Fill_Cond(Frodm.AcKod,'Nam',ACond,AcList);//' UseKod = 1 and Not KDas = 1'     
     QuickCloseOpen([26]);
end;

end.
