unit CentEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TFCentEdit = class(TForm)
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label8: TLabel;
    FNam: TEdit;
    FGro: TComboBox;
    FKod: TEdit;
    Bsave: TButton;
    Bexit: TButton;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label5: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    FAdd: TEdit;
    FTel: TEdit;
    FPerc: TEdit;
    F: TEdit;
    cbState: TComboBox;
    cbCity: TComboBox;
    cbRegon: TComboBox;
    Label3: TLabel;
    FEnam: TEdit;
    Label12: TLabel;
    FShM: TEdit;
    FId: TEdit;
    Label13: TLabel;
    procedure NextTab(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FKodKeyPress(Sender: TObject; var Key: Char);
    procedure BsaveClick(Sender: TObject);
    procedure BexitClick(Sender: TObject);
    procedure FIdExit(Sender: TObject);
    procedure FIdEnter(Sender: TObject);
    procedure FNamExit(Sender: TObject);
    procedure FEnamExit(Sender: TObject);
  private
    Procedure FieldSave;
    Function MaxKod:Integer;
    Function MaxID:Integer;
  public
    OId:Integer;
    OName:String;
    OEName:String;
    Procedure FieldShow;
  end;

var
  FCentEdit: TFCentEdit;

implementation

uses Routins, ProVar, FrooshDM, Db;

{$R *.DFM}

{ TForm1 }

procedure TFCentEdit.NextTab(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
      Key:=#0;
      SelectNext(Sender As TWinControl,True,True);
     End;
end;

procedure TFCentEdit.FieldSave;
begin
     Frodm.Cent.Edit;
     Frodm.CentNam.AsString:=FNam.Text;
     Frodm.CentEName.AsString:=FENam.Text;
     Frodm.CentShMark.AsString:=FShM.Text;
     Frodm.CentRadif.AsInteger:=StrToIntDef(FID.Text,0);;
     //Frodm.CentKod.AsInteger:=StrToIntDef(FKod.Text,0);//FKod.Text;
     Frodm.CentGrop.AsString:=FGro.Text;
     Frodm.CentState.Value:=cbState.Text;
     Frodm.CentCity.Value:=cbCity.Text;
     Frodm.CentRegon.Value:=cbRegon.Text;
     Frodm.CentAdr.Value:=FAdd.Text;
     Frodm.CentTel.Value:=FTel.Text;
     Frodm.CentTcred.Value:=StrToIntDef(FPerc.Text,0);
     Frodm.CentPcred.Value:=FarToCurr(F.Text);
     Frodm.Cent.Post;
     QuickCloseopen([4]);
     Fill_Comb(Frodm.Cent,'Grop',FGro.Items);
     FNam.Text:='';
     FKod.Clear;
     FENam.Clear;
     FShM.Clear;

end;

procedure TFCentEdit.FieldShow;
begin
     FNam.Text:=Frodm.CentNam.AsString;
     FENam.Text:=Frodm.CentEName.AsString;
     FShM.Text:=Frodm.CentShMark.AsString;
     FKod.Text:=Frodm.CentKod.AsString;
     FID.Text:=Frodm.CentRadif.AsString;
     FGro.Text:=Frodm.CentGrop.AsString;
     FGro.ItemIndex:=FGro.Items.IndexOf(Frodm.CentGrop.AsString);
     cbState.Text:=Frodm.CentState.Value;
     cbCity.Text:=Frodm.CentCity.Value;
     cbRegon.Text:=Frodm.CentRegon.Value;
     FAdd.Text:=Frodm.CentAdr.Value;
     FTel.Text:=Frodm.CentTel.Value;
     FPerc.Text:=Frodm.CentTcred.AsString;
     F.Text:=Frodm.CentPcred.AsString;
end;

function TFCentEdit.MaxKod: Integer;
begin
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Max(Kod) From Cent ');
     Qu.Open;
     Result:=Qu.Fields[0].AsInteger;
     Qu.Close;
end;

Function TFCentEdit.MaxID:Integer;
begin
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Max(Radif) From Cent ');
     Qu.Open;
     Result:=Qu.Fields[0].AsInteger;
     Qu.Close;
end;

procedure TFCentEdit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
     DeleteFile(RDir+'\B1.Cln');
     DeleteFile(RDir+'\B2.Cln');
     DeleteFile(RDir+'\B3.Cln');
end;

procedure TFCentEdit.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     Fill_Comb(Frodm.Cent,'Grop',FGro.Items);
     Fill_Comb(Frodm.Cent,'State',cbState.Items);
     Fill_Cond(Frodm.Cent,'City','',cbCity.Items);
     Fill_Cond(Frodm.Cent,'Regon','',cbRegon.Items);
end;

procedure TFCentEdit.FKodKeyPress(Sender: TObject; var Key: Char);
begin
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0','-',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;
     NextTab(Sender,Key);
end;

procedure TFCentEdit.BsaveClick(Sender: TObject);
begin
{     If Frodm.Cent.Locate('Nam',FNam.Text,[loCaseInsensitive]) Then
     Begin
      Beep;
      ShowMessage('‰«„ „—ﬂ“  ﬂ—«—Ì «” ');
      FNam.SetFocus;
      Exit;
     End;
     Frodm.Cent.IndexFieldNames:='Kod';
     If Frodm.Cent.FindKey([StrToIntDef(FKod.Text,0)]) Then
     Begin
      Beep;
      ShowMessage('ﬂœ „—ﬂ“  ﬂ—«—Ì «” ');
      FKod.SetFocus;
      Exit;
     End;  }
     FieldSave;
     FNam.SetFocus;
end;

procedure TFCentEdit.BexitClick(Sender: TObject);
begin
     Close;
end;


procedure TFCentEdit.FIdExit(Sender: TObject);
begin
     If (Frodm.Cent.Locate('Radif',StrToIntDef(FId.Text,0),[loCaseInsensitive]))and
     (OId<>StrToInt(FId.Text)) Then
     Begin
      ShowMessage(sDouble);
      FId.SetFocus;
     End;
end;

procedure TFCentEdit.FIdEnter(Sender: TObject);
begin
     If FId.Text = '' Then
      FId.Text:=IntToStr(MaxId+1);
end;

procedure TFCentEdit.FNamExit(Sender: TObject);
begin
     If (Frodm.Cent.Locate('Nam',FNam.Text,[loCaseInsensitive]))and
     (OName<>FNam.Text) Then
     Begin
      ShowMessage(sDouble);
      FNam.SetFocus;
     End;
end;

procedure TFCentEdit.FEnamExit(Sender: TObject);
begin
     If (Frodm.Cent.Locate('Nam',FENam.Text,[loCaseInsensitive]))and
     (OEName<>FENam.Text) Then
     Begin
      ShowMessage(sDouble);
      FNam.SetFocus;
     End;
end;

end.
