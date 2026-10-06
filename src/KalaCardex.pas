unit KalaCardex;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, ExtCtrls, MPlayer, Mask, Db, DBTables, Buttons;

type
  TFKCardex = class(TForm)
    KCardex: TDBGrid;
    Panel1: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    GNam: TComboBox;
    FColor: TComboBox;
    FAnb: TComboBox;
    Label6: TLabel;
    FAnbKod: TEdit;
    FM1: TEdit;
    FD1: TEdit;
    FY1: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    FM2: TEdit;
    FY2: TEdit;
    FD2: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    cbB: TCheckBox;
    cbRB: TCheckBox;
    cbI: TCheckBox;
    cbRI: TCheckBox;
    FNam: TComboBox;
    Label11: TLabel;
    Panel2: TPanel;
    Bexit: TButton;
    Bprint: TButton;
    Bshow: TBitBtn;
    Cb1: TCheckBox;
    Cb2: TCheckBox;
    Cb3: TCheckBox;
    Cb4: TCheckBox;
    cb5: TCheckBox;
    cb6: TCheckBox;
    Bdiag: TButton;
    cbIn: TCheckBox;
    cbOut: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BexitClick(Sender: TObject);
    procedure KCardexKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BshowClick(Sender: TObject);
    procedure FColorKeyPress(Sender: TObject; var Key: Char);
    procedure FAnbKeyPress(Sender: TObject; var Key: Char);
    procedure KCardexDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FAnbKodKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FD1Change(Sender: TObject);
    procedure FM1Change(Sender: TObject);
    procedure FY1Change(Sender: TObject);
    procedure FD2Change(Sender: TObject);
    procedure FM2Change(Sender: TObject);
    procedure FY2Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure KCardexKeyPress(Sender: TObject; var Key: Char);
    Procedure NexTab(Sender:TObject;Var Key :Char);
    Procedure cbCheck(Sender:TObject);
    procedure BprintClick(Sender: TObject);
    procedure BdiagClick(Sender: TObject);
    procedure GNamDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure GNamDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure GNamDropDown(Sender: TObject);
    procedure GNamKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    Function Make_Filt_String :String;
    Function Factor_Filt_String :String;
//    Procedure CRep;
    Procedure GoodRep;
  public
    { Public declarations }
  end;

var
  FKCardex: TFKCardex;

implementation

uses Routins, ProVar, FrooshDM, CGoodRep, GDiag, Converts, XPListBox;//CardexRep, 

{$R *.DFM}
Procedure TFKCardex.NexTab(Sender:TObject;Var Key :Char);
begin
     If Key = #13 Then
     Begin
       Key:=#0;
       FKCardex.SelectNext(Sender As TWinControl,True,True);
     End;
end;

Procedure TFKCardex.cbCheck(Sender:TObject);
begin
     KCardex.Columns[1].Visible :=cb1.Checked;
     KCardex.Columns[2].Visible :=cb2.Checked;
     KCardex.Columns[3].Visible :=cb3.Checked;
     KCardex.Columns[4].Visible :=cb4.Checked;
     KCardex.Columns[9].Visible :=cb5.Checked;
     KCardex.Columns[10].Visible :=cb6.Checked;
end;

Function TFKCardex.Make_Filt_String :String;
Var
Str,FStr:String;
I:Integer;
begin
     Str:='';
     If GNam.Text <> '' Then Str:='Kod= '+IntToStr(GoodKod(GNam.Text));
     If FColor.Text <> '' Then Str:=Str+' and Color = '+#39+FColor.Text+#39;
     If FAnb.Text <> '' Then Str:=Str+' and Anbnam ='+#39+FAnb.Text+#39;
     If FAnbKod.Text <> '' Then Str:=Str+' and Anbkod ='+FAnbKod.Text;
     I:=StrToInt(FY1.Text+FM1.Text+FD1.Text);
     If I > 0 Then Str:=Str+' and Dat >= '+IntToStr(I);
     I:=StrToInt(FY2.Text+FM2.Text+FD2.Text);
     If I > 0 Then Str:=Str+' and Dat <= '+IntToStr(I);
     FStr :=Factor_Filt_String;
     If FStr <>'' Then Str:=Str+' and ('+Fstr+')';
     If FNam.Text >'' Then Str:=Str+' and Facnam = '+#39+FNam.Text+#39;
     If Pos(' and',Str) = 1 Then Delete(Str,1,4);
     Result:=Str;
end;

Function TFKCardex.Factor_Filt_String :String;
Var
Str:String;
begin
     Str:='';
     If cbB.Checked Then Str:='Des = '+#39+'›«ﬂ Ê— Œ—Ìœ'+#39;
     If cbI.Checked Then Str:=Str+' or Des = '+#39+'›«ﬂ Ê— ›—Ê‘'+#39;
     If cbRB.Checked Then Str:=Str+' or Des = '+#39+'„—ÃÊ⁄Ì Œ—Ìœ'+#39;
     If cbRI.Checked Then Str:=Str+' or Des = '+#39+'„—ÃÊ⁄Ì ›—Ê‘'+#39;
     If cbIn.Checked Then Str:=Str+' or Des = '+#39+'Ê—Êœ ﬂ«·«'+#39;
     If cbOut.Checked Then Str:=Str+' or Des = '+#39+'Œ—ÊÃ ﬂ«·«'+#39;
//     If cbMove.Checked Then Str:=Str+' or FacNo= -1';
     If Pos(' or',Str) = 1 Then Delete(Str,1,3);
     Result:=Str;
end;

{Procedure TFKCardex.CRep;
begin
     CreatingForm(TKCardexRep,'KCardexRep',KCardexRep);
     Set_Sys_Enviroment;
     KCardexRep.Kala.Caption :=GNam.Text;
     KCardexRep.color.Caption :=FColor.Text;
     KCardexRep.Anb.Caption :=FAnb.Text;
     KCardexRep.Ndat.Caption :=IntToDate(FarDate);
     KCardexRep.Preview;
     KCardexrep.Destroy;
end;}

Procedure TFKCardex.GoodRep;
begin
     CreatingForm(TRepCGood,'RepCGood',RepCGood);
     Set_Sys_Enviroment;
     RepCGood.Kala.Caption :=GNam.Text;
     RepCGood.color.Caption :=FColor.Text;
     RepCGood.Anb.Caption :=FAnb.Text;
     RepCGood.Ndat.Caption :=IntToDate(FarDate);
     RepCGood.Preview;
     RepCGood.Destroy;
end;

procedure TFKCardex.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Open_G(Frodm.Cardex);
     Frodm.Cardex.Active :=False;
     Frodm.Cardex.Exclusive :=False;
     Action:=caFree;
end;

procedure TFKCardex.FormCreate(Sender: TObject);
begin
     Set_Forms(FKCardex);
     Gnam.Items.Assign(Kala);
     FNam.Items.Assign(AcList);
     FColor.Enabled :=SModel;
     FAnbKod.Enabled :=sAKod;
     cbCheck(Sender);
     Fill_Comb(Frodm.AnbDat,'Nam',FAnb.Items);
     Fill_Comb(Frodm.Color,'Color',FColor.Items);
     Frodm.Cardex.Active :=False;
     Try
      Frodm.Cardex.Exclusive :=True;
      Frodm.Cardex.EmptyTable;
     Except
      On EDbEngineError Do
      Begin
        Beep;
        ShowMessage('ÃœÊ· œ— «Œ Ì«— ﬂ«—»— œÌê—Ì «” ');
        Exit;
      End;
     End;
     Frodm.Cardex.Active :=False;
     Frodm.Cardex.Exclusive :=False;
     Frodm.Cardex.Active :=True;

end;

procedure TFKCardex.FormShow(Sender: TObject);
Var
   Dat,M:Integer;
begin
     Dat:=FarDate;
     FY1.Text:=IntToStr(Dat Div 10000);
     FM1.Text:='01';
     FD1.Text:='01';
     M:=Dat Mod 100;
     If M < 10 Then FD2.Text :='0'+IntToStr(M)Else FD2.Text:=IntToStr(M);
     M:= (Dat Div 100) Mod 100;
     If M < 10 Then FM2.Text:='0'+IntToStr(M)Else FM2.Text:=IntToStr(M);
     FY2.Text :=FY1.Text;
     GNam.SetFocus;
end;

procedure TFKCardex.BexitClick(Sender: TObject);
begin
     Frodm.Cardex.Active :=False;
     Frodm.Cardex.Exclusive :=False;
     FKCardex.Close;
end;

procedure TFKCardex.KCardexKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
      If Shift = [ssCtrl] Then Bshow.SetFocus;
end;

procedure TFKCardex.BshowClick(Sender: TObject);
begin
     KCardex.Columns[1].Visible :=GNam.ItemIndex = -1;
     KCardex.Columns[2].Visible :=(FColor.ItemIndex = -1)And(SModel);
     KCardex.Columns[3].Visible :=FAnb.ItemIndex = -1;
     KCardex.Columns[10].Visible:=FNam.ItemIndex = -1;
     Open_g(Frodm.Cardex);
     Screen.Cursor:=crHourGlass;
     KCardex.DataSource:=nil;
     Kala_Cardex(Make_Filt_String);
     Screen.Cursor:=crDefault;
     KCardex.DataSource:=Frodm.CardexDs;
end;

procedure TFKCardex.FColorKeyPress(Sender: TObject; var Key: Char);
begin
     Enter_Focus(Key,FAnb);
end;

procedure TFKCardex.FAnbKeyPress(Sender: TObject; var Key: Char);
begin
     Enter_Focus(Key,FAnbKod);
end;

procedure TFKCardex.KCardexDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
     If Frodm.CardexRem.Value = 0 Then KCardex.Canvas.Font.Color:=clRed;
      KCardex.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;


procedure TFKCardex.FAnbKodKeyPress(Sender: TObject; var Key: Char);
begin
     NexTab(Sender,Key);
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
                     #9,#27,#83,#46]) Then Key:=#0;
end;

procedure TFKCardex.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key = VK_F3 Then BshowClick(Sender);
end;

procedure TFKCardex.FD1Change(Sender: TObject);
begin
     If Length(FD1.Text) = FD1.MaxLength Then FM1.SetFocus;
end;

procedure TFKCardex.FM1Change(Sender: TObject);
begin
     If Length(FM1.Text) = FM1.MaxLength Then FY1.SetFocus;
end;

procedure TFKCardex.FY1Change(Sender: TObject);
begin
     If Length(FY1.Text) = FY1.MaxLength Then FD2.SetFocus;
end;

procedure TFKCardex.FD2Change(Sender: TObject);
begin
     If Length(FD2.Text) = FD2.MaxLength Then FM2.SetFocus;
end;

procedure TFKCardex.FM2Change(Sender: TObject);
begin
     If Length(FM2.Text) = FM2.MaxLength Then FY2.SetFocus;
end;

procedure TFKCardex.FY2Change(Sender: TObject);
begin
     If Length(FY2.Text) = FY2.MaxLength Then BShow.SetFocus;
end;

procedure TFKCardex.KCardexKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
       Key:=#0;
       GMove(KCardex,Frodm.Cardex);
     End;
end;

procedure TFKCardex.BprintClick(Sender: TObject);
begin
     //If GNam.Text > '' Then Crep Else
     GoodRep;
end;

procedure TFKCardex.BdiagClick(Sender: TObject);
begin
     If Frodm.Cardex.RecordCount <= 1 Then Exit;
     CreatingForm(TFGDiag,'FGDiag',FGDiag);
end;

procedure TFKCardex.GNamDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
     Accept:=(Source Is TXPListBox) And ((Source As TXPListBox).Name = 'lbGName')
end;

procedure TFKCardex.GNamDragDrop(Sender, Source: TObject; X, Y: Integer);
Var
List:TXPListBox;
begin
     If (Source Is TXPListBox) Then
     Begin
       List:=(Source As TXPListBox);
       GNam.Text:=List.Items.Strings[List.ItemIndex];
       GNam.SetFocus;
     End;

end;

procedure TFKCardex.GNamDropDown(Sender: TObject);
Var
Gene:Integer;
begin
     Gene:=StrToInt(GNam.Text);
     IF sGene Then
       FillGene(GNam.Items,Gene)
     Else
       GNam.Items.Assign(Kala);
end;

procedure TFKCardex.GNamKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetGoodCombo(Sender,Key);
end;

end.
