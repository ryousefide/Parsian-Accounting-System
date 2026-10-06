unit Visit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Mask, StdCtrls, DBCtrls, Grids, DBGrids, ExtCtrls, ComCtrls;

type
  TFVisit = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    FNam: TDBEdit;
    Tel: TDBEdit;
    City: TDBEdit;
    Add: TDBEdit;
    Bprev: TButton;
    Bdat: TMaskEdit;
    Perc: TDBEdit;
    Bnext: TButton;
    Bnew: TButton;
    Bedit: TButton;
    Bsave: TButton;
    Bdel: TButton;
    Bexit: TButton;
    Code: TDBEdit;
    Panel2: TPanel;
    Panel3: TPanel;
    Bevel1: TBevel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    FKod1: TEdit;
    FKod2: TEdit;
    FKod3: TEdit;
    FKod31: TEdit;
    CTree: TTreeView;
    Splitter1: TSplitter;
    Panel4: TPanel;
    dbg: TDBGrid;
    dgVisit: TDBGrid;
    Splitter2: TSplitter;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure NextTab(Sender: TObject; var Key: Char);
    procedure BdatEnter(Sender: TObject);
    procedure BdatExit(Sender: TObject);
    procedure BprevClick(Sender: TObject);
    procedure BnextClick(Sender: TObject);
    procedure BnewClick(Sender: TObject);
    procedure BeditClick(Sender: TObject);
    procedure BsaveClick(Sender: TObject);
    procedure BdelClick(Sender: TObject);
    procedure BexitClick(Sender: TObject);
    procedure FNamExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dgVisitKeyPress(Sender: TObject; var Key: Char);
    procedure dgVisitKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure CTreeClick(Sender: TObject);
    procedure CTreeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CTreeDblClick(Sender: TObject);
    procedure dbgEditButtonClick(Sender: TObject);
    procedure dbgKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    FKol:SmallInt;// Integer;
    FMo:SmallInt;
    FTaf:SmallInt;
    sPath:String;

    OName,NName:String;
    PCode:Integer;
    Function NamFounded (Name:String):Boolean;
    Function InUse(Code:Integer):Boolean;
  public
    { Public declarations }
  end;

var
  FVisit: TFVisit;

implementation

uses FrooshDM, ProVar, Routins, Db, CRoutins;

{$R *.DFM}
Function TFVisit.NamFounded (Name:String):Boolean;
begin
     Result:=False;
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Nam');
     Qu.SQL.Add('From Visitors');
     Qu.SQL.Add('Where Nam ='+#39+Name+#39);
     Qu.Open;
     If Qu.RecordCount > 0 Then Result :=True;
     Qu.Close;
End;

Function TFVisit.InUse(Code:Integer):Boolean;
begin
     Result:=False;
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Visit ');
     Qu.SQL.Add('From Invoice');
     Qu.SQL.Add('Where Visit = '+IntToStr(Code));
     Qu.Open;
     If Qu.RecordCount > 0 Then Result:=True;
     Qu.Close;
end;

procedure TFVisit.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     PCode := 0;
     MakeGoodTree(CTree);
     Frodm.VAct.Open;
     Frodm.Visit.Open;
     If Frodm.Visit.RecordCount > 0 Then Code.ReadOnly:=True;
     Frodm.Visit.Last;
     PCode:=Frodm.visitCode.Value;
     BDat.Text:=IntToDate(Frodm.VisitBdat.Value);
end;

procedure TFVisit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFVisit.NextTab(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
      Key:=#0;
      SelectNext(Sender As TWinControl ,True,True);
     End;
end;

procedure TFVisit.BdatEnter(Sender: TObject);
begin
     If (Frodm.Visit.State = dsBrowse) Then BDat.ReadOnly :=True Else
     Begin
       BDat.ReadOnly :=False;
       GetMaskText(BDat);
     End;
end;

procedure TFVisit.BdatExit(Sender: TObject);
begin
     If (Frodm.Visit.State = dsBrowse) Then Exit;
     SetMaskText(BDat);
     If Not Date_Check(BDat.Text) Then BDat.SetFocus Else
         Frodm.VisitBdat.Value :=DateToInt(BDat.Text);

end;

procedure TFVisit.BprevClick(Sender: TObject);
begin
     If Frodm.Visit.State <> dsBrowse Then Check_State(Frodm.Visit,BsaveClick);
     Frodm.Visit.Prior;
     BDat.Text:=IntToDate(Frodm.VisitBdat.Value);
     Bnext.Enabled := Not Frodm.Visit.Eof;
     BPrev.Enabled := Not Frodm.Visit.Bof;

end;

procedure TFVisit.BnextClick(Sender: TObject);
begin
     If Frodm.Visit.State <> dsBrowse Then Check_State(Frodm.Visit,BsaveClick);
     Frodm.Visit.Next;
     BDat.Text:=IntToDate(Frodm.VisitBdat.Value);
     Bnext.Enabled := Not Frodm.Visit.Eof;
     BPrev.Enabled := Not Frodm.Visit.Bof;
end;

procedure TFVisit.BnewClick(Sender: TObject);
begin
     OName:='';
     Frodm.Visit.Append;
     Frodm.VisitBdat.Value:=Fardate;
     BDat.Text:=IntToDate(Frodm.VisitBdat.Value);
     Frodm.VisitCode.Value:=Pcode+1;
     FNam.SetFocus;
end;

procedure TFVisit.BeditClick(Sender: TObject);
begin
     OName:=FNam.Text;
     Frodm.Visit.Edit;
     FNam.SetFocus;
     Frodm.VActDs.AutoEdit:=True;
end;

procedure TFVisit.BsaveClick(Sender: TObject);
begin
     If Frodm.Visit.State = dsBrowse Then Exit;
     Frodm.Visit.Post;
     PCode:=PCode+1;
     Bnew.SetFocus;
     Frodm.VActDs.AutoEdit:=False;
end;

procedure TFVisit.BdelClick(Sender: TObject);
begin
     If MessageDlg('—ﬂÊ—œ Ã«—Ì Õ–› ê—œœø',mtWarning,mbYesNo,0) = mrYes Then
      If Inuse(Frodm.VisitCode.Value) Then
      Begin
        Beep;
        ShowMessage('ÊÌ“Ì Ê— ﬁ«»· Õ–› ‰„Ì »«‘œ');
      End Else
        Frodm.Visit.Delete;
end;

procedure TFVisit.BexitClick(Sender: TObject);
begin
     Check_State(Frodm.Visit,BsaveClick);
     Frodm.VAct.Close;
     Frodm.Visit.Close;
     Close;
end;

procedure TFVisit.FNamExit(Sender: TObject);
begin
     If Frodm.Visit.State = dsBrowse Then Exit;
     NName:=FNam.Text;
     If NName = OName Then Exit;
     If NamFounded(NName) Then FNam.Field.Value:=OName;
     If FNam.Text = '' Then FNam.SetFocus;
end;

procedure TFVisit.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key = VK_F3 Then BSaveClick(Sender);
     If  Shift =[ssAlt] Then
     Case Key Of
       VK_Left:BprevClick(Sender);
       VK_RIGHT:BnextClick(Sender);
     End;
end;

procedure TFVisit.dgVisitKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
       Key:=#0;
       GMove(dgVisit,Frodm.Visit);
     End;

end;

procedure TFVisit.dgVisitKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Shift = [ssCtrl] Then BPrev.SetFocus;
     If Shift = [ssCtrl]+[ssShift] Then Code.SetFocus;
end;

procedure TFVisit.FormDestroy(Sender: TObject);
begin
     BexitClick(Sender);
     QuickCloseOpen([30]);
end;

procedure TFVisit.CTreeClick(Sender: TObject);
Var
I:Integer;
Node:TTreeNode;
begin
     Node:=cTree.Selected;
     FKol:=0;FMo:=0;FTaf:=0;sPath:='';
     FKod1.Clear;FKod2.Clear;FKod3.Clear;FKod31.Clear;
     //If Node.Level <1 Then Exit;
     For I:=ctree.Selected.Level DownTo 0 Do
     Begin
      Case Node.Level Of
      3: FTaf:=Node.OverlayIndex;
      2: FMo :=Node.OverlayIndex;
      1: FKol:=Node.OverlayIndex;
      End;
      Case Node.Level Of
      3: sPath:=Node.Text;//sPath+'<--'+
      2: sPath:=sPath+'<--'+Node.Text;
      1: sPath:=sPath+'<--'+Node.Text;
      End;
      Node:=Node.Parent;
     End;
     IF FKol>0 Then FKod1.Text:=IntToStr(FKol);
     IF FMo>0 Then FKod2.Text:=IntToStr(FMo);
     IF FTaf>0 Then FKod3.Text:=IntToStr(FTaf);
     IF FTaf>0 Then FKod31.Text:=IntToStr(FTaf);
end;

procedure TFVisit.CTreeKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key Of
     VK_INSERT :;//CTreeAddItem;
     VK_LEFT,VK_RIGHT,VK_UP,VK_DOWN,VK_LBUTTON,VK_RBUTTON:
      CTreeClick(Sender);
     VK_RETURN:;
     VK_DELETE:;
     VK_ESCAPE: If Frodm.Visit.State = dsBrowse then  Close;
     End;

end;



procedure TFVisit.CTreeDblClick(Sender: TObject);
Const
ACap=' ⁄ÌÌ‰ „ﬁœ«—';
APromp='÷—Ì» „ﬁœ«— —« Ê«—œ ò‰Ìœ';
PCap=' ⁄ÌÌ‰ œ—’œ';
PPromp='œ—’œ ÅÊ—”«‰  —« Ê«—œ ò‰Ìœ';

Var
SQt:String;
begin
      If Frodm.Visit.State in[dsEdit,dsInsert] Then
      Begin
       Frodm.VAct.Append;
       Frodm.VActKol.Value:=FKol;
       Frodm.VActMo.Value:=FMo;
       Frodm.VActTaf.Value:=FTaf;
       Frodm.VActDes.Value:=Ctree.Selected.Text;
       Frodm.VActVkod.Value:=Frodm.VisitCode.Value;
       sQt:=InputBoxClear( ACap,APromp,'0',True);
       Frodm.VActQtRate.Value:= StrToFloat(sQt);
       sQt:=InputBoxClear( PCap,PPromp,'0',True);
       Frodm.VActPerc.Value:=StrToFloat(sQt);
       Frodm.VAct.Post;
      End;

end;

procedure TFVisit.dbgEditButtonClick(Sender: TObject);
begin
     If Frodm.Visit.State in [dsEdit,dsInsert] Then Frodm.VAct.Delete;
end;

procedure TFVisit.dbgKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
       Key:=#0;
       GMove(dbg,Frodm.Visit);
     End;
end;

end.
