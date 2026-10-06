unit Cost;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Db, Grids, DBGrids;

type
  TFCost = class(TForm)
    FNam: TEdit;
    Label1: TLabel;
    FDesc: TEdit;
    Label2: TLabel;
    Bprev: TButton;
    Bnext: TButton;
    Bprint: TButton;
    Bsave: TButton;
    Bdel: TButton;
    Bexit: TButton;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Dbg: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure NextTab(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FNamExit(Sender: TObject);
    procedure BprevClick(Sender: TObject);
    procedure BnextClick(Sender: TObject);
    procedure BsaveClick(Sender: TObject);
    procedure BdelClick(Sender: TObject);
    procedure BexitClick(Sender: TObject);
    procedure BprintClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    Procedure FieldShow;
    Function CostExist(Cost:String):Boolean;
  public
    { Public declarations }
  end;

var
  FCost: TFCost;

implementation

uses Routins, ProVar, FrooshDM, RepCosts;

{$R *.DFM}
Procedure TFCost.FieldShow;
begin
     FNam.Text:=Frodm.CostcNam.Value;
     FDesc.Text:=Frodm.CostcDesc.Value;
end;

Function TFCost.CostExist(Cost:String):Boolean;
begin
     Result:=False;
{     Frodm.Bitem.Filter :='Cost = '+#39+Cost+#39;
     Frodm.Bitem.Filtered:=True;
     If Frodm.Bitem.RecordCount > 0 Then Result :=True;
     Frodm.Bitem.Filtered:=False;}
     Qu.SQL.Clear;
     Qu.SQL.Add('Select Cost From AcountBill Where Cost=:c ' );
     Qu.Params[0].Value:=Cost;
     Qu.Open;
     Result:= Qu.RecordCount>0;
     Qu.Close;
end;

procedure TFCost.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     Frodm.Costc.Open;
     Frodm.Costc.Last;
     FieldShow;
end;

procedure TFCost.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Fill_Comb(Frodm.Costc,'Nam',CostList);
     Frodm.Costc.Close;
     Action:=caFree;
end;

procedure TFCost.NextTab(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
       Key:=#0;
       FCost.SelectNext(Sender As TWinControl,True,True);
     End;
end;

procedure TFCost.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key = VK_F3 Then BsaveClick(Sender);
     If Shift = [ssAlt] Then
     Case Key Of
      VK_RIGHT :BnextClick(Sender);
      VK_LEFT  :BprevClick(Sender);
     End;

end;

procedure TFCost.FNamExit(Sender: TObject);
begin
     Frodm.Costc.IndexFieldNames:='Nam';
     If Frodm.Costc.FindKey([FNam.Text]) Then
        FDesc.Text:=Frodm.CostcDesc.Value Else
     Begin
       Bsave.Enabled:=True;
       FDesc.Text:='';
       Frodm.Costc.Append;
     End;
end;

procedure TFCost.BprevClick(Sender: TObject);
begin
     Frodm.Costc.Prior;
     FieldShow;
     Bprev.Enabled :=Not(Frodm.Costc.Bof);
     Bnext.Enabled :=Not(Frodm.Costc.Eof);
end;

procedure TFCost.BnextClick(Sender: TObject);
begin
     Frodm.Costc.Next;
     FieldShow;
     Bprev.Enabled :=Not(Frodm.Costc.Bof);
     Bnext.Enabled :=Not(Frodm.Costc.Eof);
end;

procedure TFCost.BsaveClick(Sender: TObject);
begin
     If Frodm.Costc.State = dsBrowse Then Exit;
     Frodm.CostcNam.Value:=FNam.Text;
     Frodm.CostcDesc.Value:=FDesc.Text;
     Frodm.Costc.Post;
     Bsave.Enabled:=False;
end;

procedure TFCost.BdelClick(Sender: TObject);
begin
     If MessageDlg(' Å—ÊéÂ Ã«—Ì Õ–› ê—œœø',mtWarning,mbYesNo,0) = mrYes Then
     Begin
     //   Check For Data If Exist in BItem File,It Can not Delete
       If CostExist(FNam.Text) Then
       Begin
         Beep;
         ShowMessage(' Å—ÊéÂ ”«»ﬁÂ œ«—œ');
         Exit;
       End;
       Frodm.CostC.Delete;
       FieldShow;
     End;
end;

procedure TFCost.BexitClick(Sender: TObject);
begin
     FCost.Close;
end;

procedure TFCost.BprintClick(Sender: TObject);
begin
     CreatingForm(TCostRep,'CostRep',CostRep);
     Set_Sys_Enviroment;
     CostRep.Preview;//Modal;
     CostRep.Destroy;
end;

procedure TFCost.FormDestroy(Sender: TObject);
begin
     QuickCloseOpen([3]);
     DeleteFile(RDir+'\B1.Cln');
     DeleteFile(RDir+'\B2.Cln');
     DeleteFile(RDir+'\B3.Cln');

end;

end.
