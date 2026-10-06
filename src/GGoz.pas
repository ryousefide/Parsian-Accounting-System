unit GGoz;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, ExtCtrls, Grids, DBGrids, Menus;

type
  TFGGoz = class(TForm)
    GNam: TComboBox;
    Label1: TLabel;
    Pers: TDBGrid;
    BshowOld: TButton;
    Bexit: TButton;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label2: TLabel;
    FColor: TComboBox;
    Label5: TLabel;
    FKol: TEdit;
    Bprint: TButton;
    Query1: TQuery;
    Ds: TDataSource;
    BShow: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BshowOldClick(Sender: TObject);
    procedure BexitClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PersKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BprintClick(Sender: TObject);
    procedure NextTab(Sender: TObject; var Key: Char);
    procedure GNamDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure GNamDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure GNamDropDown(Sender: TObject);
    procedure BShowClick(Sender: TObject);
    procedure GNamKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PersDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    Function Pers_Good(Qu:TQuery;Pers:String):Real;
    Procedure Pers_Good_Goz;
    Function Make_Filt:String;
    Function Filt_Sum:String;
    Procedure Sums(Qu:TQuery);
  public
    { Public declarations }
  end;

var
  FGGoz: TFGGoz;

implementation

uses FrooshDM, Routins, ProVar, RepGGoz, Converts, XPListBox, CRoutins;

{$R *.DFM}

Function TFGGoz.Make_Filt:String;
Var
St:String;
begin
     St:='';
     If GNam.Text >'' Then St:=' And C.Nam = '+#39+GNam.Text+#39;
     If FColor.Text >'' Then St:=St+' And C.Color = '+#39+FColor.Text+#39;
     Result:=St;
end;

Function TFGGoz.Filt_Sum:String;
Var
St:String;
begin
     If GNam.Text >'' Then St:='Nam = '+#39+GNam.Text+#39;
     If FColor.Text >'' Then St:=St+' and Color = '+#39+FColor.Text+#39;
     If Pos(' and',St) = 1 Then Delete(St,1,4);
     Result:=St;
end;

Function TFGGoz.Pers_Good(Qu:TQuery;Pers:String):Real;
begin
     Qu.SQL.Delete(2);
     Qu.SQL.Add('WHERE M.Nam ='+#39+Pers+#39+' And M.No=C.No '+Make_Filt);
     Qu.Active:=True;
     Result:=Qu.Fields[0].AsFloat;
     Qu.Active:=False;
end;

Procedure TFGGoz.Sums(Qu:TQuery);
begin
{     Qu.SQL.Clear;
     Qu.SQL.Add('SELECT Sum(Quant)');
     Qu.SQL.Add('FROM GGoz');
     Qu.Active:=True;
     FSum.Text :=FloatToStr(Qu.Fields[0].AsFloat);
     Qu.Active:=False;}
     Qu.SQL.Clear;
     Qu.SQL.Add('SELECT SUM(Quant)');
     Qu.SQL.Add('FROM InvoGood');
     Qu.SQL.Add('WHERE '+Filt_Sum);
     Qu.Active:=True;
     FKol.Text :=FloatToStr(Qu.Fields[0].AsFloat);
//     FSum2.Text :=FloatToStr(Qu.Fields[0].AsFloat-StrToFloat(FSum.Text));
     Qu.Active:=False;
end;

Procedure TFGGoz.Pers_Good_Goz;
Var
I:Integer;
Qt:Real;
begin
     Open_g(Frodm.GGoz);
     Qu.SQL.Clear;
     Qu.SQL.Add('SELECT Sum(C.Quant)');
     Qu.SQL.Add('FROM Invoice M,InvoGood C');
     Qu.SQL.Add('WHERE ');
     For I:=0 To AcList.Count-1 Do
     Begin
       Qt:=Pers_Good(Qu,AcList.Strings[I]);
       Frodm.GGoz.Append;
       Frodm.GGozNam.Value :=AcList.Strings[I];
       Frodm.GGozQuant.Value :=Qt;
       Frodm.GGoz.Post;
     End;
     Sums(Qu);
end;
//---------------------------------------------
procedure TFGGoz.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     GNam.Items.Assign(Kala);
     Query1.DatabaseName:=CurrDb;
     FColor.Enabled :=SModel;
     Fill_Comb(Frodm.Color,'Color',FColor.Items);
end;

procedure TFGGoz.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFGGoz.BshowOldClick(Sender: TObject);
begin
     Frodm.GGoz.Filtered:=False;
     IF (GNam.Text='') And (FColor.Text ='') Then Exit;
     Screen.Cursor:=crHourGlass;
     Pers_Good_Goz;
     Frodm.GGoz.Filter :='Quant > 0 ';
     Frodm.GGoz.Filtered:=True;
     Screen.Cursor:=crDefault;
end;

procedure TFGGoz.BexitClick(Sender: TObject);
begin
     Frodm.GGoz.Active :=False;
     Frodm.GGoz.Exclusive :=False;
     FGGoz.Close;
end;

procedure TFGGoz.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key = VK_F3 Then BshowClick(Sender);
end;

procedure TFGGoz.PersKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

     If Shift = [ssCtrl]+[ssShift] Then FColor.SetFocus;
end;

procedure TFGGoz.BprintClick(Sender: TObject);
begin
     CreatingForm(TGGozRep,'GGozRep',GGozRep);
//     Set_Sys_Enviroment;
     GGozRep.Good.Caption :=GNam.Text;
//     GGozRep.FSum.Caption :=FSum.Text;
//     GGozRep.FSum2.Caption :=FSum2.Text;
     GGozRep.FKol.Caption :=FKol.Text;
     GGozRep.Preview;
     GGozRep.Destroy;
end;

procedure TFGGoz.NextTab(Sender: TObject; var Key: Char);
begin
     If Key =#13 Then
     Begin
       Key:=#0;
       FGGoz.SelectNext(Sender As TWinControl,True,True);
     End;
end;

procedure TFGGoz.GNamDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
     Accept:=(Source Is TXPListBox) And ((Source As TXPListBox).Name = 'lbGName')
end;

procedure TFGGoz.GNamDragDrop(Sender, Source: TObject; X, Y: Integer);
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

procedure TFGGoz.GNamDropDown(Sender: TObject);
Var
Gene:Integer;
begin
     Gene:=StrToInt(GNam.Text);
     IF sGene Then
       FillGene(GNam.Items,Gene)
     Else
       GNam.Items.Assign(Kala);
end;

procedure TFGGoz.BShowClick(Sender: TObject);
begin
     IF (GNam.Text='') And (FColor.Text ='') Then Exit;
     Screen.Cursor:=crHourGlass;
     Query1.Close;
     Query1.Params[0].Value:=GNam.Text;
     Query1.Open;
     Pers.DataSource:=ds;
     Sums(Qu);
     Screen.Cursor:=crDefault;
end;

procedure TFGGoz.GNamKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetGoodCombo(Sender,Key);
end;

procedure TFGGoz.PersDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  DrawRect: TRect;
begin
    if (Column.Field.FieldName ='Ckod' ) then
    Begin
     DrawRect:=Rect;
     Pers.Canvas.FillRect(DrawRect);
     If Not Column.Field.IsNull Then
     Pers.Canvas.Textout(DrawRect.Left+4,DrawRect.Top,CentName(Column.Field.Value));
    End;
end;

end.
