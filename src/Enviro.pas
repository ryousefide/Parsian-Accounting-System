unit Enviro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls, Registry, ExtDlgs, Buttons;

type
  TFEnviro = class(TForm)
    FD1: TFontDialog;
    FD2: TFontDialog;
    FD3: TFontDialog;
    Bexit: TButton;
    Pgc: TPageControl;
    TabSheet1: TTabSheet;
    Label15: TLabel;
    Label13: TLabel;
    Label18: TLabel;
    FDefaultDb: TEdit;
    FPath: TEdit;
    FCurrDb: TComboBox;
    Cb1: TCheckBox;
    Bevel4: TBevel;
    TabSheet2: TTabSheet;
    Label17: TLabel;
    FormRate: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Font1: TEdit;
    Font2: TEdit;
    Bevel1: TBevel;
    Font3: TEdit;
    B1: TButton;
    B2: TButton;
    B3: TButton;
    TabSheet3: TTabSheet;
    Label14: TLabel;
    Label16: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    RMar: TEdit;
    TopM: TEdit;
    LMar: TEdit;
    ButM: TEdit;
    PLen: TEdit;
    Pwid: TEdit;
    TabSheet4: TTabSheet;
    Label7: TLabel;
    PRule: TComboBox;
    Label8: TLabel;
    FInvoLbl: TEdit;
    Label9: TLabel;
    FBarNamLbl: TEdit;
    Label10: TLabel;
    FMaster: TEdit;
    Label5: TLabel;
    Dat: TEdit;
    UpDown1: TUpDown;
    Lb6: TLabel;
    Bevel3: TBevel;
    Bevel2: TBevel;
    TabSheet5: TTabSheet;
    cbAKod: TCheckBox;
    cbPerc: TCheckBox;
    cbGene: TCheckBox;
    cbRem: TCheckBox;
    cbDcheq: TCheckBox;
    cbPcheq: TCheckBox;
    Fdays: TEdit;
    Label24: TLabel;
    cbModel: TCheckBox;
    cbNYear: TCheckBox;
    cbBK: TCheckBox;
    FMin: TEdit;
    Label25: TLabel;
    cbBill: TCheckBox;
    FCom: TEdit;
    Label6: TLabel;
    Mon: TEdit;
    UpDown2: TUpDown;
    Bevel5: TBevel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label26: TLabel;
    PFont1: TEdit;
    PFont2: TEdit;
    PFont3: TEdit;
    B4: TButton;
    B5: TButton;
    B6: TButton;
    cbFac: TCheckBox;
    cbPerm: TCheckBox;
    cbRej: TCheckBox;
    cbNet: TCheckBox;
    cbFRem: TCheckBox;
    Label27: TLabel;
    FCopy: TEdit;
    UpDown3: TUpDown;
    Barm: TButton;
    OPD: TOpenPictureDialog;
    cbPas: TComboBox;
    Sp1: TSpeedButton;
    cbDp: TCheckBox;
    cbCent: TCheckBox;
    cbBTip: TCheckBox;
    Label11: TLabel;
    cbCurr: TComboBox;
    PLog: TImage;
    cbABill: TCheckBox;
    Label12: TLabel;
    FTax: TEdit;
    cbSkin: TCheckBox;
    cSkin: TComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure B1Click(Sender: TObject);
    procedure B2Click(Sender: TObject);
    procedure B3Click(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure FormCreate(Sender: TObject);
    procedure BexitClick(Sender: TObject);
    procedure FCurrDbEnter(Sender: TObject);
    procedure FCurrDbExit(Sender: TObject);
    procedure Cb1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormRateExit(Sender: TObject);
    procedure PLenKeyPress(Sender: TObject; var Key: Char);
    procedure PwidKeyPress(Sender: TObject; var Key: Char);
    procedure TopMKeyPress(Sender: TObject; var Key: Char);
    procedure LMarKeyPress(Sender: TObject; var Key: Char);
    procedure ButMKeyPress(Sender: TObject; var Key: Char);
    procedure RMarKeyPress(Sender: TObject; var Key: Char);
    procedure PRuleChange(Sender: TObject);
    procedure TabSheet5Show(Sender: TObject);
    procedure TabSheet5Hide(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure UpDown2Click(Sender: TObject; Button: TUDBtnType);
    procedure B4Click(Sender: TObject);
    procedure B5Click(Sender: TObject);
    procedure B6Click(Sender: TObject);
    procedure FCopyChange(Sender: TObject);
    procedure BarmClick(Sender: TObject);
    procedure cbNYearClick(Sender: TObject);
    procedure cbPasChange(Sender: TObject);
    procedure Sp1Click(Sender: TObject);
    procedure cbCurrChange(Sender: TObject);
    procedure cbABillClick(Sender: TObject);
    procedure cSkinChange(Sender: TObject);
    procedure cbSkinClick(Sender: TObject);
  private
    { Private declarations }
    Procedure Alias_Update;
    Procedure OptWrite;
    Procedure OptRead;
  public
    { Public declarations }
  end;

var
  FEnviro: TFEnviro;

implementation

uses ProVar, Routins,DbTables, MainForm, FileCtrl, FrooshDM, UserName, WinSkinData;

{$R *.DFM}

Procedure TFEnviro.Alias_Update;
var
List1,List2:TStringList;
I:Integer;
Spath:String;
begin
     List1:=TStringList.Create;
     List2:=TStringList.Create;
     Session.GetAliasNames (List1);
     For I:=0 To List1.Count-1 Do
     Begin
       Session.GetAliasParams( List1.Strings[I],List2);
       Spath:=Copy(List2.Strings[0],6,255);
       If Not DirectoryExists(Spath) Then Session.DeleteAlias(List1.Strings[I]);
     End;
     Session.SaveConfigFile;
     List1.Free;
     List2.Free;
end;

Procedure TFEnviro.OptWrite;
begin
     cbAKod.Checked := sAKod;
     cbPerc.Checked := sPerc;
     cbGene.Checked := sGene;
     cbRem.Checked := sRem;
     cbDcheq.Checked := sDcheq;
     cbPcheq.Checked := sPcheq;
     cbModel.Checked := sModel;
     cbNYear.Checked := sNYear;
     cbBK.Checked := sBk;
     cbABill.Checked:=sABill;
     cbBill.Enabled:=sABill;
     cbBill.Checked := sBill;
     cbFac.Checked := sFac;
     cbNet.Checked:=sNet;
     cbRej.Checked:=sRej;
     cbPerm.Checked:=sPerm;
     cbFrem.Checked := sFrem;
     cbDp.Checked:=sDp;
     cbCent.Checked:=sCent;
     cbBTip.Checked:=sBTip;
     cbSKin.Checked:=sSkin;
     cSkin.Enabled:=sSkin;
     cSkin.ItemIndex:=iSKin;
end;

Procedure TFEnviro.OptRead;
begin
     sAKod:=cbAKod.Checked;
     sPerc:=cbPerc.Checked;
     sGene:=cbGene.Checked;
     sRem :=cbRem.Checked;
     sDcheq :=cbDcheq.Checked;
     sPcheq :=cbPcheq.Checked;
     sModel :=cbModel.Checked;
     sNYear :=cbNYear.Checked;
     sBK :=cbBK.Checked;
     sABill:=cbABill.Checked;
     sBill :=cbBill.Checked;
     sFac :=cbFac.Checked;
     sNet :=cbNet.Checked;
     sRej:=cbRej.Checked;
     sPerm:=cbPerm.Checked;
     sFrem :=cbFrem.Checked;
     sDp :=cbDp.Checked;
     sCent:=cbCent.Checked;
     sBTip:=cbBTip.Checked;
     sSkin:=cbSkin.Checked;
     iSkin:=cSkin.ItemIndex;
     If sBTip Then iBillTip:=1 Else iBillTip:=0;
end;

procedure TFEnviro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
     OptRead;
     InvoLbl:=FInvoLbl.Text;
     BarNamLbl:=FBarNamLbl.Text;
     Master:=FMaster.Text;
     Comm:=FCom.Text;
     PrnCnt:=StrToIntDef(FCopy.Text,1);
     Frate:=StrToInt(FormRate.Text);
     PLength:=StrToInt(PLen.Text);
     Pwidth:=StrToInt(Pwid.Text);
     TopMar:=StrToInt(TopM.Text);
     ButMar:=StrToInt(ButM.Text);
     LeftMar:=StrToInt(LMar.Text);
     RightMar:=StrToInt(RMar.Text);
     PcheqDay:=StrToInt(FDays.Text);
     BKTime:=StrToInt(FMin.Text);
     PTip:=cbPas.ItemIndex;
     RTax:=StrToFloat(FTax.Text);
     Main.tmBk.Interval :=BKTime*60*1000;
     If BkTime > 0 Then Main.Timer2.Interval :=BKTime*60*1000;
     Main.tmBk.Enabled := sBK;
     If FCurrDb.Focused  Then FCurrDbExit(Sender);
     If (DefaultDb = '') Then Application.CreateForm(TFEnviro,FEnviro);
     If Main.Menu=Main.MainMenu1 Then Enteranced;
end;

procedure TFEnviro.B1Click(Sender: TObject);
begin
     Fd1.Font:=LFont;
     If Fd1.Execute Then
     Begin
       Font1.Font :=Fd1.Font;
       Font1.Text :=Fd1.Font.Name+' '+IntToStr(Fd1.Font.Size);
       LFont.Assign(Fd1.Font);
       LFontName:=GetFont(LFont);
     End Else
     Begin
       LFontName:='';
       Font1.Text:='';
       LFont:=SetFont(LFontName);
     End;
end;

procedure TFEnviro.B2Click(Sender: TObject);
begin
     Fd2.Font:=FFont;
     If Fd2.Execute Then
     Begin
       Font2.Font:=Fd2.Font;
       Font2.Text :=Fd2.Font.Name+' '+IntToStr(Fd2.Font.Size);
       FFont.Assign( Fd2.Font);
       FFontName:=GetFont(FFont);
     End Else
     Begin
       FFontName:='';
       Font2.Text:='';
       FFont:=SetFont(FFontName);
     End;
end;

procedure TFEnviro.B3Click(Sender: TObject);
begin
     Fd3.Font:=GFont;
     If Fd3.Execute Then
     Begin
       Font3.Font:=Fd3.Font;
       Font3.Text :=Fd3.Font.Name+' '+IntToStr(Fd3.Font.Size);
       GFont.Assign(Fd3.Font);
       GFontName:=GetFont(GFont);
     End Else
     Begin
       GFontName:='';
       Font3.Text:='';
       GFont:=SetFont(GFontName);
     End;
end;

procedure TFEnviro.UpDown1Click(Sender: TObject; Button: TUDBtnType);
begin
      AdjT:=StrToInt(Mon.Text)*100+StrToInt(Dat.Text);
      Lb6.Caption:=IntToDate(Fardate);
end;

procedure TFEnviro.FormCreate(Sender: TObject);
Var
I:Integer;
begin
     Set_Forms(Self);
     cbCurr.Items.Assign(CurrList);
     For I:=0 To ComponentCount-1 Do
      If Components[I].Tag = 3 Then (Components[I] as TControl).Enabled:=Cuser.Master;

{     For I:=0 To ComponentCount-1 Do
      If Components[I] is TCheckbox Then If (Components[I] as Tcheckbox).Tag=1 Then
      (Components[I] as Tcheckbox).Enabled:=Cuser.Master;

     For I:=0 To ComponentCount-1 Do
      If Components[I] is TButton Then If (Components[I] as TButton).Tag=1 Then
      (Components[I] as TButton).Enabled:=Cuser.Master;   }

     UpDown1.Position:=AdjT Mod 100;
     UpDown2.Position:=AdjT Div 100;
     FCopy.Text:=IntToStr(PrnCnt);
     optWrite;
     Lb6.Caption :=IntToDate(Fardate);
     Font3.Text :=GFontName;
     Font2.Text :=FFontName;
     Font1.Text :=LFontName;
     PFont3.Text :=PGFontName;
     PFont2.Text :=PFFontName;
     PFont1.Text :=PLFontName;
     PRule.Text :=P_Rule;
     cbCurr.Text:=DefaultCurr;
     FTax.Text:=FloatToStr(RTax);
     FDays.Text :=IntToStr(PcheqDay);
     FMin.Text:=IntToStr(BKTime);
     FMaster.Text :=Master;
     FCom.Text:=Comm;
     FInvoLbl.Text :=InvoLbl;
     FBarNamLbl.Text :=BarNamLbl;
     FDefaultDb.Text :=DefaultDb;
     FPath.Text :=DefaultPath;
     FormRate.Text :=IntToStr(Frate);
     PLen.Text:=IntToStr(PLength);
     Pwid.Text:=IntToStr(Pwidth);
     TopM.Text:=IntToStr(TopMar);
     ButM.Text:=IntToStr(ButMar);
     LMar.Text:=IntToStr(LeftMar);
     RMar.Text:=IntToStr(RightMar);
     cbPas.Enabled:=cbNYear.Checked;
     cbPas.ItemIndex:=PTip;
     Sp1.Enabled:=Cuser.Master;
//     FCurrDb.Enabled :=(FState)or(DefaultDB = '');
end;



procedure TFEnviro.BexitClick(Sender: TObject);
begin
     FEnviro.Close;
end;

procedure TFEnviro.FCurrDbEnter(Sender: TObject);
begin
//     Alias_Update;
     FCurrDb.Items.Clear;
     FCurrDb.Items:=Fill_Corps;
end;

procedure TFEnviro.FCurrDbExit(Sender: TObject);
begin
     If FCurrDb.Text > '' Then
     Begin
      CurrPath:=GetCorPath(FCurrDb.Text);// Copy(List.Strings[0],6,255);
      CurrDb:=FCurrDb.Text;
      Main.Sb1.Panels[5].Text:=CurrPath;
      Main.Sb1.Panels[4].Text :=CurrDb;
      Setup_DataBase(CurrDb);
      Main.Menu:=Main.MainMenu1;
      Main.Tb.Enabled:=False;
      Main.PopupMenu:=Nil;
     End;
end;

procedure TFEnviro.Cb1Click(Sender: TObject);
begin
      If Cb1.Checked Then
      Begin
       DefaultPath:=CurrPath;
       DefaultDb:=CurrDataBase;
       FDefaultDb.Text :=GetDbName(CurrPath);
       FPath.Text :=CurrPath;
      End;
end;

procedure TFEnviro.FormKeyPress(Sender: TObject; var Key: Char);
begin
     IF Key = #13 Then
     Begin
       Key:=#0;
       FEnviro.SelectNext(Sender As TWinControl,True,True);
     End;
end;

procedure TFEnviro.FormRateExit(Sender: TObject);
begin
     Frate:=StrToInt(FormRate.Text);
end;

procedure TFEnviro.PLenKeyPress(Sender: TObject; var Key: Char);
begin
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;
     FormKeyPress(Sender,Key);
end;

procedure TFEnviro.PwidKeyPress(Sender: TObject; var Key: Char);
begin
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;
     FormKeyPress(Sender,Key);
end;

procedure TFEnviro.TopMKeyPress(Sender: TObject; var Key: Char);
begin
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;
     FormKeyPress(Sender,Key);
end;

procedure TFEnviro.LMarKeyPress(Sender: TObject; var Key: Char);
begin
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;
     FormKeyPress(Sender,Key);
end;

procedure TFEnviro.ButMKeyPress(Sender: TObject; var Key: Char);
begin
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;
     FormKeyPress(Sender,Key);
end;

procedure TFEnviro.RMarKeyPress(Sender: TObject; var Key: Char);
begin
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;
     FormKeyPress(Sender,Key);
end;

procedure TFEnviro.PRuleChange(Sender: TObject);
begin
     P_Rule:=PRule.Text;
     Main.Sb1.Panels[3].Text :=P_Rule;
end;

procedure TFEnviro.TabSheet5Show(Sender: TObject);
begin
     optWrite;
end;

procedure TFEnviro.TabSheet5Hide(Sender: TObject);
begin
     OptRead;
end;

procedure TFEnviro.FormDestroy(Sender: TObject);
Var
Reg:TRegistry;
begin
     Reg:=Tregistry.Create;
     LastAccess:=IntToDate(FarDate);
     OptEncode;
     Try
      Reg.OpenKey('SoftWare\Hadieh Rayaneh\MParFro',True);
      Reg.WriteInteger('AdjT',AdjT);
      Reg.WriteString('LFontName',LFontName);
      Reg.WriteString('GFontName',GFontName);
      Reg.WriteString('FFontName',FFontName);
      Reg.WriteString('PLFontName',PLFontName);
      Reg.WriteString('PGFontName',PGFontName);
      Reg.WriteString('PFFontName',PFFontName);
      Reg.WriteString('InvoLbl',InvoLbl);
      Reg.WriteString('BarNamLbl',BarNamLbl);
      Reg.WriteString('LastUser',CUser.Name);
      Reg.WriteString('Master',Master);
      Reg.WriteString('Com',Comm);
      Reg.WriteString('DefaultAlias',DefaultPath);
      Reg.WriteString('DefaultDb',DefaultDb);
      Reg.WriteString('Options',sOptions);
      Reg.WriteString('P_Rule',P_Rule);
      Reg.WriteString('DefCurr',DefaultCurr);
      Reg.WriteString('Avarez',FloatToStr(RTax));
      Reg.WriteInteger('Frate',Frate);
      Reg.WriteInteger('PCn',PrnCnt);
      Reg.WriteInteger('TM',TopMar);
      Reg.WriteInteger('BM',ButMar);
      Reg.WriteInteger('LM',LeftMar);
      Reg.WriteInteger('RM',RightMar);
      Reg.WriteInteger('PL',Plength);
      Reg.WriteInteger('PW',PWidth);
      Reg.WriteInteger('Pdays',PcheqDay);
      Reg.WriteInteger('DailyBk',BKTime);
//      Reg.WriteInteger('Power',Power);
    Finally
      Reg.Free;
    End;
//    If IsServer Then
//    Begin
     DeleteFile('Par001.Rgs');
     RegKeyExport(HKEY_CURRENT_USER,'SoftWare\Hadieh Rayaneh\MParFro','Par001.Rgs');
//    End;
end;

procedure TFEnviro.UpDown2Click(Sender: TObject; Button: TUDBtnType);
begin
      AdjT:=StrToInt(Mon.Text)*100+StrToInt(Dat.Text);
      Lb6.Caption:=IntToDate(Fardate);

end;

procedure TFEnviro.B4Click(Sender: TObject);
begin
     Fd1.Font:=PLFont;
     If Fd1.Execute Then
     Begin
       PFont1.Font :=Fd1.Font;
       PFont1.Text :=Fd1.Font.Name+' '+IntToStr(Fd1.Font.Size);
       PLFont.Assign(Fd1.Font);
       PLFontName:=GetFont(PLFont);
     End Else
     Begin
       PLFontName:='';
       PFont1.Text:='';
       PLFont:=SetFont(PLFontName);
     End;
end;

procedure TFEnviro.B5Click(Sender: TObject);
begin
     Fd2.Font:=PFFont;
     If Fd2.Execute Then
     Begin
       PFont2.Font:=Fd2.Font;
       PFont2.Text :=Fd2.Font.Name+' '+IntToStr(Fd2.Font.Size);
       PFFont.Assign( Fd2.Font);
       PFFontName:=GetFont(PFFont);
     End Else
     Begin
       PFFontName:='';
       PFont2.Text:='';
       PFFont:=SetFont(PFFontName);
     End;
end;

procedure TFEnviro.B6Click(Sender: TObject);
begin
     Fd3.Font:=PGFont;
     If Fd3.Execute Then
     Begin
       PFont3.Font:=Fd3.Font;
       PFont3.Text :=Fd3.Font.Name+' '+IntToStr(Fd3.Font.Size);
       PGFont.Assign(Fd3.Font);
       PGFontName:=GetFont(PGFont);
     End Else
     Begin
       PGFontName:='';
       PFont3.Text:='';
       PGFont:=SetFont(PGFontName);
     End;
end;

procedure TFEnviro.FCopyChange(Sender: TObject);
begin
     PrnCnt:=StrToInt(FCopy.Text);
end;

procedure TFEnviro.BarmClick(Sender: TObject);
Var
pPic:TPicture;
begin
     IF OPD.Execute Then
     Begin
      pPic:=TPicture.Create;
      OPD.Filter:=GraphicFileMask(TGraphic);
      pPic.LoadFromFile(OPD.FileName);
      pPic.Graphic.SaveToFile(RDir+'\Logos\PLogo1.bmp');
      bmpP1.Assign(pPic.Graphic);
      bmpP1.SaveToFile(RDir+'\Logos\PLogo1.bmp');
      pPic.Free;
     End Else
     If MessageDlg('ÂÑã ÍÐÝ ÔæÏ¿',mtWarning,mbYESNO,-1)=idYES Then
     Begin
      pPic:=TPicture.Create;
      bmpP1.Assign(pPic.Graphic);
      bmpP1.SaveToFile(RDir+'\Logos\PLogo1.bmp');
     End;
     PLog.Picture.Bitmap:=bmpP1;
     PLog.Parent.Refresh;
end;

procedure TFEnviro.cbNYearClick(Sender: TObject);
begin
     cbPas.Enabled:=cbNYear.Checked;
     sNYear :=cbNYear.Checked;
     Main.mmiTileClick(Sender);
end;

procedure TFEnviro.cbPasChange(Sender: TObject);
begin
     PTip:=cbPas.ItemIndex;
     Main.mmiTileClick(Sender);
end;

procedure TFEnviro.Sp1Click(Sender: TObject);
begin
     ChangeMPass;
end;

procedure TFEnviro.cbCurrChange(Sender: TObject);
begin
     DefaultCurr:=cbCurr.Text;
end;

procedure TFEnviro.cbABillClick(Sender: TObject);
begin
     cbBill.Enabled:=cbABill.Checked;
end;

procedure TFEnviro.cbSkinClick(Sender: TObject);
begin
     cSkin.Enabled:=cbSKin.Checked;
     Main.SkinData1.Active:=cbSKin.Checked;
end;

procedure TFEnviro.cSkinChange(Sender: TObject);
begin
     iSkin:=cSKin.ItemIndex;
     Main.SkinData1.LoadFromCollection(Main.SkinStore,iSKin);
     Main.SkinData1.Colors[csButtonFace]:=Main.Color;
end;


end.
