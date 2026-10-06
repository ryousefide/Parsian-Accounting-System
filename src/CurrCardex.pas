unit CurrCardex;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, ExtCtrls, MPlayer, Mask, Db, DBTables, ComCtrls;

type
  TFCurrCardex = class(TForm)
    KCardex: TDBGrid;
    Panel1: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Bevel1: TBevel;
    Cb1: TCheckBox;
    Cb2: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    GNam: TComboBox;
    FColor: TComboBox;
    FAnb: TComboBox;
    Cb3: TCheckBox;
    Label6: TLabel;
    Cb4: TCheckBox;
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
    cb5: TCheckBox;
    cb6: TCheckBox;
    Panel2: TPanel;
    Bexit: TButton;
    Bprint: TButton;
    Bshow: TButton;
    Bdiag: TButton;
    cbOut: TCheckBox;
    cbIn: TCheckBox;
    rgTip: TComboBox;
    Sb: TStatusBar;
    Label12: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BexitClick(Sender: TObject);
    procedure KCardexKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BprintClick(Sender: TObject);
    procedure BshowClick(Sender: TObject);
    procedure FColorKeyPress(Sender: TObject; var Key: Char);
    procedure FAnbKeyPress(Sender: TObject; var Key: Char);
    procedure KCardexDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FAnbKodKeyPress(Sender: TObject; var Key: Char);
    procedure FD1KeyPress(Sender: TObject; var Key: Char);
    procedure FM1KeyPress(Sender: TObject; var Key: Char);
    procedure FY1KeyPress(Sender: TObject; var Key: Char);
    procedure FD2KeyPress(Sender: TObject; var Key: Char);
    procedure FM2KeyPress(Sender: TObject; var Key: Char);
    procedure FY2KeyPress(Sender: TObject; var Key: Char);
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
    procedure BdiagClick(Sender: TObject);
    procedure GNamDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure GNamDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure GNamDropDown(Sender: TObject);
    procedure GNamKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    Function Make_Filt_String :String;
    Function Make_Filt_Kart :String;
    Function Factor_Filt_String :String;
    Procedure CRep;
//    Procedure GoodRep;
  public
    { Public declarations }
  end;

var
  FCurrCardex: TFCurrCardex;

implementation

uses Routins, ProVar, FrooshDM, CurCardexRep, GCDiag, Converts, XPListBox;//CurrCGoodRep,

{$R *.DFM}
Procedure TFCurrCardex.NexTab(Sender:TObject;Var Key :Char);
begin
     If Key = #13 Then
     Begin
       Key:=#0;
       FCurrCardex.SelectNext(Sender As TWinControl,True,True);
     End;
end;

Procedure TFCurrCardex.cbCheck(Sender:TObject);
begin
     KCardex.Columns[0].Visible :=rgTip.ItemIndex <> 1 ;
     KCardex.Columns[13].Visible :=rgTip.ItemIndex = 2 ;
     KCardex.Columns[12].Visible :=rgTip.ItemIndex = 2 ;
     KCardex.Columns[9].Visible :=rgTip.ItemIndex  In [2,4,5,6] ;
     KCardex.Columns[11].Visible :=rgTip.ItemIndex In [2,4,5,6] ;
     KCardex.Columns[1].Visible :=cb1.Checked;
     KCardex.Columns[2].Visible :=cb2.Checked;
     KCardex.Columns[3].Visible :=cb3.Checked;
     KCardex.Columns[11].Visible :=cb4.Checked;
     KCardex.Columns[12].Visible :=cb5.Checked;
     KCardex.Columns[13].Visible :=cb6.Checked;
end;

Function TFCurrCardex.Make_Filt_Kart :String;
Var
Str,FStr:String;
I:Integer;
begin
     Str:='';//'Fee > 0';
//     If GNam.Text <> '' Then Str:=Str+' and Nam= '+QuotedStr(GNam.Text);
     If FColor.Text <> '' Then Str:=Str+' and Color = '+#39+FColor.Text+#39;
     If FAnb.Text <> '' Then Str:=Str+' and Anb ='+#39+FAnb.Text+#39;
//     If FAnbKod.Text <> '' Then Str:=Str+' and AnbKod ='+FAnbKod.Text;
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

Function TFCurrCardex.Make_Filt_String :String;
Var
Str,FStr:String;
I:Integer;
begin
     Str:='';//'Fee > 0';
     If GNam.Text <> '' Then Str:=Str+' and Kod= '+IntToStr(GoodKod(GNam.Text));
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

Function TFCurrCardex.Factor_Filt_String :String;
Var
Str:String;
begin
     Str:='';
     If cbB.Checked Then Str:='Des = '+#39+'›«ﬂ Ê— Œ—Ìœ'+#39;
     If cbI.Checked Then Str:=Str+' or Des = '+#39+'ÕÊ«·Â ›—Ê‘'+#39;
     If cbRB.Checked Then Str:=Str+' or Des = '+#39+'„—ÃÊ⁄Ì Œ—Ìœ'+#39;
     If cbRI.Checked Then Str:=Str+' or Des = '+#39+'„—ÃÊ⁄Ì ›—Ê‘'+#39;
     If cbIn.Checked Then Str:=Str+' or Des = '+#39+'Ê—Êœ ﬂ«·«'+#39;
     If cbOut.Checked Then Str:=Str+' or Des = '+#39+'Œ—ÊÃ ﬂ«·«'+#39;
     If Pos(' or',Str) = 1 Then Delete(Str,1,3);
     Result:=Str;
end;

Procedure TFCurrCardex.CRep;
begin
     CreatingForm(TRepCurrCardex,'RepCurrCardex',RepCurrCardex);
     Set_Sys_Enviroment;
     RepCurrCardex.Kala.Caption :=GNam.Text;
     RepCurrCardex.color.Caption :=FColor.Text;
     RepCurrCardex.Anb.Caption :=FAnb.Text;
     RepCurrCardex.Ndat.Caption :=IntToDate(FarDate);
     RepCurrCardex.Preview;
     RepCurrCardex.Destroy;
end;

procedure TFCurrCardex.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Open_g(Frodm.Cardex);
     Frodm.Cardex.Active :=False;
     Frodm.Cardex.Exclusive :=False;
     Frodm.Cardex.Filter:='';
     Frodm.Cardex.Filtered:=False;
     Action:=caFree;
end;

procedure TFCurrCardex.FormCreate(Sender: TObject);
begin
     Set_Forms(FCurrCardex);
     Sb.Font:=Font;
     RgTip.ItemIndex:=3;
     Gnam.Items.Assign(Kala);
     FNam.Items.Assign(AcList);
     cbCheck(Sender);
     FColor.Enabled :=SModel;
     FAnbKod.Enabled :=sAKod;
     Kcardex.Columns[9].Visible := sPerc;
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
     Frodm.Cardex.Filter:='';
     Frodm.Cardex.Filtered:=False;
end;

procedure TFCurrCardex.FormShow(Sender: TObject);
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

procedure TFCurrCardex.BexitClick(Sender: TObject);
begin
     Frodm.Cardex.Active :=False;
     Frodm.Cardex.Exclusive :=False;
     FCurrCardex.Close;
end;

procedure TFCurrCardex.KCardexKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Var
Nkey:Char;
begin
      Nkey:=#13;
      If (Shift = [ssCtrl])   Then Enter_focus(Nkey,Bshow);
end;

procedure TFCurrCardex.BprintClick(Sender: TObject);
begin
//     If GNam.Text > '' Then Crep Else GoodRep;
     Crep;
end;

procedure TFCurrCardex.BshowClick(Sender: TObject);
Var
LastValue:Currency;
St,En:Integer;
begin
     cbCheck(Sender);
     KCardex.Columns[1].Visible :=GNam.ItemIndex = -1;
     KCardex.Columns[2].Visible :=(FColor.ItemIndex = -1)And(SModel);
     KCardex.Columns[3].Visible :=FAnb.ItemIndex = -1;
//     KCardex.Columns[13].Visible :=FNam.ItemIndex = -1;
     Open_g(Frodm.Cardex);
     Screen.Cursor:=crHourGlass;
     KCardex.DataSource:=nil;
     Case rgTip.ItemIndex Of
      7 : Kala_Kart_FIFO(GNam.Text,Make_Filt_String,0,111111111,LastValue,0);
      6 : Kala_Kart_LIFO(GNam.Text,Make_Filt_String,0,111111111,LastValue,0);
      5 : Kala_Kart(GNam.Text,Make_Filt_String,0,111111111,LastValue,0);
      4 : Kala_Cardex_Curr_Cust(Make_Filt_String);
      3 : Kala_Cardex_Curr(Make_Filt_String);
      2 : Kala_Cardex_Curr_Gardesh(Make_Filt_String);
      1 : Kala_Cardex_Curr_Good(Make_Filt_String);
      0 : Kala_Cardex_Curr_Daily(Make_Filt_String);
     End;
     Screen.Cursor:=crDefault;
     KCardex.DataSource:=Frodm.CardexDs;
end;

procedure TFCurrCardex.FColorKeyPress(Sender: TObject; var Key: Char);
begin
     Enter_Focus(Key,FAnb);
end;

procedure TFCurrCardex.FAnbKeyPress(Sender: TObject; var Key: Char);
begin
     Enter_Focus(Key,FAnbKod);
end;

procedure TFCurrCardex.KCardexDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
     If Frodm.CardexRem.Value = 0 Then KCardex.Canvas.Font.Color:=clRed;
     KCardex.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;


procedure TFCurrCardex.FAnbKodKeyPress(Sender: TObject; var Key: Char);
begin
     NexTab(Sender,Key);
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
                     #9,#27,#83,#46]) Then Key:=#0;
end;

procedure TFCurrCardex.FD1KeyPress(Sender: TObject; var Key: Char);
begin
     Enter_Focus(Key,FM1);
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
                     #9,#27,#83,#46]) Then Key:=#0;

end;

procedure TFCurrCardex.FM1KeyPress(Sender: TObject; var Key: Char);
begin
     Enter_Focus(Key,FY1);
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
                     #9,#27,#83,#46]) Then Key:=#0;
end;

procedure TFCurrCardex.FY1KeyPress(Sender: TObject; var Key: Char);
begin
     Enter_Focus(Key,FD2);
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
                     #9,#27,#83,#46]) Then Key:=#0;
end;

procedure TFCurrCardex.FD2KeyPress(Sender: TObject; var Key: Char);
begin
     Enter_Focus(Key,FM2);
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
                     #9,#27,#83,#46]) Then Key:=#0;
end;

procedure TFCurrCardex.FM2KeyPress(Sender: TObject; var Key: Char);
begin
     Enter_Focus(Key,FY2);
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
                     #9,#27,#83,#46]) Then Key:=#0;
end;

procedure TFCurrCardex.FY2KeyPress(Sender: TObject; var Key: Char);
begin
     Enter_Focus(Key,BShow);
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
                     #9,#27,#83,#46]) Then Key:=#0;
end;

procedure TFCurrCardex.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key = VK_F3 Then BshowClick(Sender);
end;

procedure TFCurrCardex.FD1Change(Sender: TObject);
begin
     If Length(FD1.Text) = FD1.MaxLength Then FM1.SetFocus;
end;

procedure TFCurrCardex.FM1Change(Sender: TObject);
begin
     If Length(FM1.Text) = FM1.MaxLength Then FY1.SetFocus;
end;

procedure TFCurrCardex.FY1Change(Sender: TObject);
begin
     If Length(FY1.Text) = FY1.MaxLength Then FD2.SetFocus;
end;

procedure TFCurrCardex.FD2Change(Sender: TObject);
begin
     If Length(FD2.Text) = FD2.MaxLength Then FM2.SetFocus;
end;

procedure TFCurrCardex.FM2Change(Sender: TObject);
begin
     If Length(FM2.Text) = FM2.MaxLength Then FY2.SetFocus;
end;

procedure TFCurrCardex.FY2Change(Sender: TObject);
begin
     If Length(FY2.Text) = FY2.MaxLength Then BShow.SetFocus;
end;

procedure TFCurrCardex.KCardexKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
       Key:=#0;
       GMove(KCardex,Frodm.Cardex);
     End;
end;

procedure TFCurrCardex.BdiagClick(Sender: TObject);
begin
     If Frodm.Cardex.RecordCount <= 1 Then Exit;
     CreatingForm(TFGCDiag,'FGCDiag',FGCDiag);
end;

procedure TFCurrCardex.GNamDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
     Accept:=(Source Is TXPListBox) And ((Source As TXPListBox).Name = 'lbGName')
end;

procedure TFCurrCardex.GNamDragDrop(Sender, Source: TObject; X,
  Y: Integer);
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

procedure TFCurrCardex.GNamDropDown(Sender: TObject);
Var
Gene:Integer;
begin
     Gene:=StrToInt(GNam.Text);
     IF sGene Then
       FillGene(GNam.Items,Gene)
     Else
       GNam.Items.Assign(Kala);
end;

procedure TFCurrCardex.GNamKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetGoodCombo(Sender,Key);
end;

end.
