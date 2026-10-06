unit Comb;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ImgList, StdCtrls, Mask, Buttons, ComCtrls, Grids, DBGrids, Db,
  DBTables;
Type
 TCombRep=record
 Name:String[255];
 SD:Integer;
 ED:Integer;
 Cent:String[255];
 Projects:String[255];
 Title:String[255];
 ReportType:Short;
 PrintType:Short;
 CodeList:String[255];//TStrings;
 Curr:String[255];
End;

type
  TFComb = class(TForm)
    Bevel1: TBevel;
    Bevel2: TBevel;
    tvAckod: TTreeView;
    Splitter1: TSplitter;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Sp: TSpeedButton;
    Label5: TLabel;
    SpCen: TSpeedButton;
    FCap: TEdit;
    SDat: TMaskEdit;
    EDat: TMaskEdit;
    FCostN: TComboBox;
    FCentN: TComboBox;
    Panel1: TPanel;
    Splitter2: TSplitter;
    Gdbg: TDBGrid;
    KodList: TListBox;
    cDel: TSpeedButton;
    rgTip: TRadioGroup;
    BShow: TButton;
    GQu: TQuery;
    GQuDs: TDataSource;
    Bevel3: TBevel;
    cUp: TSpeedButton;
    cDown: TSpeedButton;
    rgPrint: TRadioGroup;
    BPrint: TButton;
    Bexit: TButton;
    cbReps: TComboBox;
    spIns: TSpeedButton;
    spDel: TSpeedButton;
    spEdit: TSpeedButton;
    Label6: TLabel;
    cbCurr: TComboBox;
    GQuDat: TIntegerField;
    GQuBedeh: TCurrencyField;
    GQuBestan: TCurrencyField;
    GQuBedRem: TCurrencyField;
    GQuBesRem: TCurrencyField;
    GQuBaghi: TCurrencyField;
    GQuDes: TStringField;
    GQuNo: TIntegerField;
    GQuDiag: TCurrencyField;
    procedure NextTab(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure SDatEnter(Sender: TObject);
    procedure SDatExit(Sender: TObject);
    procedure EDatEnter(Sender: TObject);
    procedure EDatExit(Sender: TObject);
    procedure SpCenClick(Sender: TObject);
    procedure SpClick(Sender: TObject);
    procedure tvAckodKeyPress(Sender: TObject; var Key: Char);
    procedure cDelClick(Sender: TObject);
    procedure KodListClick(Sender: TObject);
    procedure BShowClick(Sender: TObject);
    procedure BPrintClick(Sender: TObject);
    procedure cUpClick(Sender: TObject);
    procedure cDownClick(Sender: TObject);
    procedure tvAckodDblClick(Sender: TObject);
    procedure BexitClick(Sender: TObject);
    procedure spInsClick(Sender: TObject);
    procedure cbRepsChange(Sender: TObject);
    procedure spDelClick(Sender: TObject);
    procedure spEditClick(Sender: TObject);
  private
    { Private declarations }
    RepList:Array[0..256] Of TCombRep;
    Col8:Boolean;
    Procedure Gardesh_Tal(AcCode:Real);
    procedure Gardesh_Tal_Arzi(AcCode: Real;Curr:String);
    Procedure Gardesh_Taraz(AcCode:Real);
    procedure ThreeCol;
    procedure FourCol;
    //procedure FourCol2;
  public
    { Public declarations }
    Procedure LoadSavedReports;
    Procedure SaveReports;
    Procedure LoadReport(Index:Integer);
  end;


var
  FComb: TFComb;

implementation

uses ProVar, Routins, FrooshDM, TarazReport, GardeshRep, QRCtrls, MainForm,
  CRoutins, AcTree;
  //TarazReport8;
{$R *.DFM}
Procedure TFComb.LoadSavedReports;
Var
f: File Of TCombRep;
I:Integer;
Crep:TCombRep;
begin
     If not FileExists(Rdir+'\Reports') Then Exit;
     CRep.Name:='';
     For I:=0 To 256 Do RepList[I]:=Crep;
     AssignFile(f,Rdir+'\Reports');
     Reset(f);
     I:=0;
     If FileSize(f) = 0 Then
     Begin
      CloseFile(f);
      Exit;
     End;
     Repeat
      Read(f,RepList[I]);
      I:=I+1;
     Until (I>=256)Or(Eof(f));
     CloseFile(f);
     cbReps.Items.Clear;
     For I:=0 To Length(RepList) Do
     If (RepList[I].Name <>'Delete')and(RepList[I].Name <>'') Then
     cbReps.Items.Add(RepList[I].Name);
end;

Procedure TFComb.SaveReports;
Var
f: File Of TCombRep;
I:Integer;
begin
     AssignFile(f,Rdir+'\Reports');
     Rewrite(f);
     I:=0;
     Repeat
      If (RepList[I].Name <>'Delete')and(RepList[I].Name <>'') Then
       Write(f,RepList[I]);
      I:=I+1;
     Until I>=Length(RepList);
     CloseFile(f);
     cbReps.Items.Clear;
end;

Procedure TFComb.LoadReport(Index:Integer);
begin
     If RepList[Index].Name = '' Then Exit;
     FCap.Text:=RepList[Index].Title;
     SDat.Text:=IntToDate(RepList[Index].SD);
     EDat.Text:=IntToDate(RepList[Index].ED);
     FCentN.Text:=RepList[Index].Cent;
     FCostN.Text:=RepList[Index].Projects;
     rgTip.ItemIndex:=RepList[Index].ReportType;
     rgPrint.ItemIndex:=RepList[Index].PrintType;
     KodList.Items.CommaText:=RepList[Index].CodeList;
     cbCurr.Text:=RepList[Index].Curr;
     BshowClick(Owner);
end;

{ TFComb }
procedure TFComb.Gardesh_Tal(AcCode: Real);
Var
Rem,bsRem:Currency;
Bed,Bes:Currency;
Ratio:Real;
Dat:Integer;
Sd,Ed:String;
begin
     Sd:=IntToStr(DateToInt(Sdat.Text));
     Ed:=IntToStr(DateToInt(EDat.Text));
     bsRem:=0;
     Frodm.Gardesh.Last;
     Rem:=Frodm.GardeshBaghi.Value;
     Ratio:=0;
     Case AccountType(AcCode) Of
      0:Ratio:=999999999999;
      1:Ratio:=999999999;
      2:Ratio:=999999;
      3:Ratio:=999;
      4:Ratio:=0;
     End;
     Gardesh_Sum(AcCode,Ratio,Bed,Bes,Dat,Sd,Ed,FCentN.Text,FCostN.Text);
     bsRem:=Bed-Bes;
     Frodm.Gardesh.Append;
     Frodm.GardeshDat.Value:=Dat;
     Frodm.GardeshDesc.Value:=KolName(AcCode);
     Frodm.GardeshBedeh.Value:=Bed;
     Frodm.GardeshBestan.Value:=Bes;
//     bsRem:=BBed-BBes;
//     bsRem:=bsRem+Bed-Bes;
     If bsRem > 0 Then Frodm.GardeshBedrem.Value :=bsRem;
     If bsRem < 0 Then Frodm.GardeshBesrem.Value :=Abs(bsRem);
     Frodm.GardeshDiag.Value :=bsRem;
     Rem:=Rem+bsRem;
     Frodm.GardeshBaghi.Value:=Rem;
     Frodm.GardeshNo.Value:=0;
     Frodm.Gardesh.Post;
end;

procedure TFComb.Gardesh_Tal_Arzi(AcCode: Real;Curr:String);
Var
Rem,bsRem:Currency;
Bed,Bes:Currency;
Ratio:Real;
Dat:Integer;
Sd,Ed:String;
begin
     Sd:=IntToStr(DateToInt(Sdat.Text));
     Ed:=IntToStr(DateToInt(EDat.Text));
     Frodm.Gardesh.Last;
     Rem:=Frodm.GardeshBaghi.Value;
     Ratio:=0;
     Case AccountType(AcCode) Of
      0:Ratio:=999999999999;
      1:Ratio:=999999999;
      2:Ratio:=999999;
      3:Ratio:=999;
      4:Ratio:=0;
     End;
     Gardesh_Sum_Arzi(AcCode,Ratio,Bed,Bes,Dat,Sd,Ed,FCentN.Text,FCostN.Text,Curr);
     bsRem:=Bed-Bes;
     Frodm.Gardesh.Append;
     Frodm.GardeshDat.Value:=Dat;
     Frodm.GardeshDesc.Value:=KolName(AcCode);
     Frodm.GardeshBedeh.Value:=Bed;
     Frodm.GardeshBestan.Value:=Bes;
     If bsRem > 0 Then Frodm.GardeshBedrem.Value :=bsRem;
     If bsRem < 0 Then Frodm.GardeshBesrem.Value :=Abs(bsRem);
     Frodm.GardeshDiag.Value :=bsRem;
     Rem:=Rem+bsRem;
     Frodm.GardeshBaghi.Value:=Rem;
     Frodm.GardeshNo.Value:=0;
     Frodm.Gardesh.Post;
end;

procedure TFComb.Gardesh_Taraz(AcCode: Real);
Var
Rem,bsRem:Currency;
Bed,Bes:Currency;
Ratio,Dat:Integer;
Sd,Ed:String;
begin
     Sd:=IntToStr(DateToInt(Sdat.Text));
     Ed:=IntToStr(DateToInt(EDat.Text));
     If KodFound(AcCode) Then
     Case Frodm.AcKodUseKod.Value Of
     0: If cbCurr.Text='' Then
         Gardesh_Kol(AcCode,Sd,Ed,FcentN.Text,FcostN.Text)
        Else
         Gardesh_Kol_Arzi(AcCode,Sd,Ed,FcentN.Text,FcostN.Text,cbCurr.Text);
     1: If cbCurr.Text='' Then
         Gardesh_Tal(AcCode)
        Else
         Gardesh_Tal_Arzi(AcCode,cbCurr.Text);
     End;
end;

procedure TFComb.FourCol;
Var
I:Integer;
begin
     CreatingForm(TTarazRep,'TarazRep',TarazRep);
     Set_Sys_Enviroment;
     TarazRep.QRSubDetail1.DataSet:=GQu;
     For I:=0 To TarazRep.ComponentCount-1 Do
      If (TarazRep.Components[I] Is TQRDbText) Then
      (TarazRep.Components[I] As TQRDbText).DataSet:=GQu;
     TarazRep.qrTit.Caption:=InvoLbl;
     TarazRep.qrTit.Font.Size:=12;
     TarazRep.qrTit2.Font.Size:=10;
     TarazRep.QRLabel1.Caption :=FCap.Text;
     TarazRep.qrCost.Caption:=FcostN.Text;
     TarazRep.qrCent.Caption:=FcentN.Text;
     TarazRep.Preview;//Modal;
     TarazRep.Destroy;
end;

{procedure TFComb.FourCol2;
Var
I:Integer;
begin
     CreatingForm(TTarazRep8,'TarazRep8',TarazRep8);
     Set_Sys_Enviroment;
     TarazRep8.QRSubDetail1.DataSet:=GQu;
     For I:=0 To TarazRep8.ComponentCount-1 Do
      If (TarazRep8.Components[I] Is TQRDbText) Then
      (TarazRep8.Components[I] As TQRDbText).DataSet:=GQu;
     TarazRep8.qrTit1.Caption:=Master;
     TarazRep8.qrTit2.Caption:=Comm;
     TarazRep8.qrTit1.Font.Size:=12;
     TarazRep8.qrTit2.Font.Size:=10;
     TarazRep8.SBed:=0;
     TarazRep8.SBes:=0;
     TarazRep8.BedS:=0;
     TarazRep8.BesS:=0;
     TarazRep8.BSBed:=0;
     TarazRep8.BSBes:=0;
     TarazRep8.BBedS:=0;
     TarazRep8.BBesS:=0;
     TarazRep8.QRLabel1.Caption :=FCap.Text;
     TarazRep8.qrCost.Caption:=FcostN.Text;
     TarazRep8.qrCent.Caption:=FcentN.Text;
     TarazRep8.Preview;//Modal;
     TarazRep8.Destroy;
end;  }

procedure TFComb.ThreeCol;
Var
I:Integer;
begin
     CreatingForm(TGReport,'GReport',GReport);
     GReport.qrTit.Caption:=Master;
     GReport.qrTit2.Caption:=Comm;
     GReport.qrTit.Font.Size:=12;
     GReport.qrTit2.Font.Size:=10;
     Set_Sys_Enviroment;
     GReport.QRSubDetail1.DataSet:=GQu;
     For I:=0 To GReport.ComponentCount-1 Do
      If (GReport.Components[I] Is TQRDbText) Then
      (GReport.Components[I] As TQRDbText).DataSet:=GQu;
     GReport.QRDBText5.DataField:=GQuBedrem.FieldName;
     GReport.QRDBText4.DataField:=GQuBesrem.FieldName;
     GReport.AccNam.Caption :=FCap.Text;
     GReport.qrCost.Caption:=FcostN.Text;
     GReport.qrCent.Caption:=FcentN.Text;
     GReport.Sdat.Caption:=Sdat.Text;
     GReport.Edat.Caption:=Edat.Text;
     //GReport.SBed:=0;
     //GReport.SBes:=0;
     GReport.Preview;
     Greport.Destroy;
end;

procedure TFComb.NextTab(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
       Key := #0;
       SelectNext(Sender As TWinControl,True,True);
     End;
end;

procedure TFComb.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     If Open_g(Frodm.Gardesh) Then Exit;
     Action:=caFree;
end;

procedure TFComb.FormCreate(Sender: TObject);
Var
I:Integer;
begin
     Set_Forms(Self);
     Main.glKey.GetBitmap(4,spIns.Glyph);
     Main.glKey.GetBitmap(3,spEdit.Glyph);
     Main.glKey.GetBitmap(5,spDel.Glyph);
     GQu.DatabaseName:=CurrDb;
     Fill_Comb(Frodm.CostC,'Nam',FCostN.Items);
     Fill_Comb(Frodm.Cent,'Nam',FCentN.Items);
     cbCurr.Items.Assign(CurrList);
     SDat.Text:=Beg_Date;
     EDat.Text:=End_Date;
     FCostN.Enabled:=CostList.Count > 0;
     Sp.Enabled:=FCostN.Enabled;
     FCentN.Enabled:=Frodm.Cent.RecordCount > 0;
     SpCen.Enabled:=Frodm.Cent.RecordCount > 0;
     FAcTree.SaveToFile(RDir+'\'+'AcTree.dat');
     tvAcKod.LoadFromFile(Rdir+'\'+'AcTree.dat');
{Update Image}
     tvAcKod.Images:=Main.TreeImage;
     tvAcKod.StateImages:=Main.TreeImage;
     For I:=0 To tvAcKod.Items.Count-1 Do
     Begin
      IF tvAcKod.Items[i].Count > 0 Then
       tvAcKod.Items[i].ImageIndex :=1
      Else
       tvAcKod.Items[i].ImageIndex :=2;
      tvAcKod.Items[i].StateIndex:=tvAcKod.Items[i].Level+3;
     End;
     LoadSavedReports;
end;

procedure TFComb.SDatEnter(Sender: TObject);
begin
     GetMaskText(SDat);
end;

procedure TFComb.SDatExit(Sender: TObject);
begin
     SetMaskText(SDat);
     If Not Date_Check(SDat.Text) Then SDat.SetFocus;
end;

procedure TFComb.EDatEnter(Sender: TObject);
begin
     GetMaskText(EDat);
end;

procedure TFComb.EDatExit(Sender: TObject);
begin
     SetMaskText(EDat);
     If Not Date_Check(EDat.Text) Then EDat.SetFocus;
end;

procedure TFComb.SpCenClick(Sender: TObject);
begin
     FCentN.Text:=A_Choose;
end;

procedure TFComb.SpClick(Sender: TObject);
begin
     FCostN.ItemIndex:=-1;
     FCostN.Text:=C_Choose;
end;

procedure TFComb.tvAckodDblClick(Sender: TObject);
Var
Kod:Real;
KolSt:String;
Kolkod:Integer;
Node:TTreenode;
begin
     Node:=tvAcKod.Selected;
     Kod:=AccKod(tvAcKod.Selected.Text);
     If KodList.Items.IndexOf(FloatToStr(Kod))=-1 Then
       KodList.Items.Add(FloatToStr(Kod));
end;

procedure TFComb.tvAckodKeyPress(Sender: TObject; var Key: Char);
Var
Kod:Real;
KolSt:String;
Kolkod:Integer;
Node:TTreenode;
begin
     IF Key = #13 Then
     Begin
      Key:=#0;
      Kod:=tvAcKod.Selected.AcCode;
      If KodList.Items.IndexOf(FloatToStr(Kod))=-1 Then
       KodList.Items.Add(FloatToStr(Kod));
     End;
end;

procedure TFComb.KodListClick(Sender: TObject);
begin
     KodList.Hint:=KolName(StrToFloat(KodList.Items[KodList.ItemIndex]));
end;

procedure TFComb.cDelClick(Sender: TObject);
Var
Idx:Integer;
begin
     If KodList.ItemIndex <> -1 Then
     Begin
      Idx:=KodList.ItemIndex;
      KodList.Items.Delete(KodList.ItemIndex);
      If Idx<= KodList.Items.Count-1 Then  KodList.ItemIndex:=Idx;
     End;
end;

procedure TFComb.cUpClick(Sender: TObject);
Var
Idx:Integer;
begin
     If (KodList.Items.Count = 0)or(KodList.ItemIndex=0) Then Exit;
     Idx:=KodList.ItemIndex;
     KodList.Items.Move(KodList.ItemIndex,Idx-1);
     KodList.ItemIndex:=Idx-1;
end;

procedure TFComb.cDownClick(Sender: TObject);
Var
Idx:Integer;
begin
     If (KodList.Items.Count = 0)or(KodList.ItemIndex=KodList.Items.Count-1) Then Exit;
     Idx:=KodList.ItemIndex;
     KodList.Items.Move(KodList.ItemIndex,Idx+1);
     KodList.ItemIndex:=Idx+1;
end;

procedure TFComb.BShowClick(Sender: TObject);
Var
I:Integer;
Code:Real;
begin
     Gdbg.DataSource:=Nil;
     GQu.Close;
     Create_Gardesh_Table('Gardesh'+IntToStr(CUser.Id));
     GQu.SQL.Clear;
     GQu.SQL.Add('Select * From '+Frodm.Gardesh.TableName+' order by Id');
     Open_g(Frodm.Gardesh);
     Col8:=DateToInt(Sdat.Text)>DateToInt(Beg_Date);
     Screen.Cursor:=crHourGlass;
     For I:=0 To KodList.Items.Count-1 Do
     Begin
      Code:=StrToFloat(KodList.Items[I]);
      Case rgTip.ItemIndex Of
       0:Gardesh_Taraz(Code);
       1:If cbCurr.Text='' Then
          Gardesh_Tal(Code)
         Else
          Gardesh_Tal_Arzi(Code,cbCurr.Text)
      End;
     End;
     Gdbg.DataSource:=GQuDs;
     GQu.Open;
     Close_g(Frodm.Gardesh);
     Delete_Gardesh_Table;
     Screen.Cursor:=crDefault;
end;


procedure TFComb.BPrintClick(Sender: TObject);
begin
     GQu.Filter:='Bedeh <>0 or Bestan<>0';//'Diag <>0';
     GQu.Filtered:=True;
     Case rgPrint.ItemIndex Of
     0:ThreeCol;
     1:If Col8 Then FourCol Else FourCol;
     End;
     GQu.Filtered:=False;
end;



procedure TFComb.BexitClick(Sender: TObject);
begin
     Close;
end;

procedure TFComb.spInsClick(Sender: TObject);
Var
Crep:TCombRep;
I:Integer;
RepName:String;
begin
     cbReps.ItemIndex:=-1;
     RepName:=InPutBox('Report Name','‰«„ ê“«—‘ ','');//cbReps.Text;
     If RepName = '' Then Exit;
     CRep.Name:=RepName;
     Crep.Title:=FCap.Text;
     CRep.SD:=DateToInt(SDat.Text);
     CRep.ED:=DateToInt(EDat.Text);
     CRep.Cent:=FCentN.Text;
     CRep.Projects:=FCostN.Text;
     CRep.ReportType:=rgTip.ItemIndex;
     CRep.PrintType:=rgPrint.ItemIndex;
     CRep.CodeList:=KodList.Items.CommaText;
     CRep.Curr:=cbCurr.Text;
     I:=cbReps.Items.Count+1;
     If I <256 Then  RepList[I]:=CRep;
     SaveReports;
     LoadSavedReports;
end;

procedure TFComb.cbRepsChange(Sender: TObject);
begin
     If cbReps.ItemIndex >-1 Then LoadReport(cbReps.ItemIndex);
end;

procedure TFComb.spDelClick(Sender: TObject);
begin
     RepList[cbReps.ItemIndex].Name:='Delete';
     cbReps.Items[cbReps.ItemIndex]:='Deleted';
     cbReps.Items.Clear;
     SaveReports;
     LoadSavedReports;
end;

procedure TFComb.spEditClick(Sender: TObject);
begin
     If cbReps.ItemIndex = -1 Then Exit;
     RepList[cbReps.ItemIndex].Title:=FCap.Text;
     RepList[cbReps.ItemIndex].SD:=DateToInt(SDat.Text);
     RepList[cbReps.ItemIndex].ED:=DateToInt(EDat.Text);
     RepList[cbReps.ItemIndex].Cent:=FCentN.Text;
     RepList[cbReps.ItemIndex].Projects:=FCostN.Text;
     RepList[cbReps.ItemIndex].ReportType:=rgTip.ItemIndex;
     RepList[cbReps.ItemIndex].PrintType:=rgPrint.ItemIndex;
     RepList[cbReps.ItemIndex].CodeList:=KodList.Items.CommaText;
     RepList[cbReps.ItemIndex].Curr:=cbCurr.Text;
     SaveReports;
     LoadSavedReports;
end;

end.
