unit GBGoz;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, ExtCtrls, Grids, DBGrids, Menus;

type
  TFGBGoz = class(TForm)
    GNam: TComboBox;
    Label1: TLabel;
    Pers: TDBGrid;
    BshowOld: TButton;
    Bexit: TButton;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label2: TLabel;
    FColor: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    FSum: TEdit;
    FSum2: TEdit;
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
    procedure GNamDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure GNamDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure GNamDropDown(Sender: TObject);
    procedure BShowClick(Sender: TObject);
    procedure GNamKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
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
  FGBGoz: TFGBGoz;

implementation

uses FrooshDM, Routins, ProVar, RepGGoz, Converts, XPListBox;

{$R *.DFM}

Function TFGBGoz.Make_Filt:String;
Var
St:String;
begin
     St:='';
     If GNam.Text >'' Then St:=St+' And C.Nam = '+#39+GNam.Text+#39;
     If FColor.Text >'' Then St:=St+' And C.Color = '+#39+FColor.Text+#39;
     Result:=St;
end;

Function TFGBGoz.Filt_Sum:String;
Var
St:String;
begin
     St:='C.No > -1';
     If GNam.Text >'' Then St:=St+' and C.Nam = '+#39+GNam.Text+#39;
     If FColor.Text >'' Then St:=St+' and C.Color = '+#39+FColor.Text+#39;
     If Pos(' and',St) = 1 Then Delete(St,1,4);
     Result:=St;
end;

Function TFGBGoz.Pers_Good(Qu:TQuery;Pers:String):Real;
begin
     Qu.SQL.Delete(2);
     Qu.SQL.Add('WHERE M.Nam ='+#39+Pers+#39+' And M.No=C.No '+Make_Filt);
     Qu.Active:=True;
     Result:=Qu.Fields[0].AsFloat;
     Qu.Active:=False;
end;

Procedure TFGBGoz.Sums(Qu:TQuery);
begin
{     Qu.SQL.Clear;
     Qu.SQL.Add('SELECT Sum(Quant)');
     Qu.SQL.Add('FROM GGoz');
     Qu.Active:=True;
     FSum.Text :=FloatToStr(Qu.Fields[0].AsFloat);
     Qu.Active:=False;}
     Qu.SQL.Clear;
     Qu.SQL.Add('SELECT SUM(Quant)');
     Qu.SQL.Add('FROM BInvoGood C');
     Qu.SQL.Add('WHERE '+Filt_Sum);
     Qu.Active:=True;
     FKol.Text :=FloatToStr(Qu.Fields[0].AsFloat);
//     FSum2.Text :=FloatToStr(Qu.Fields[0].AsFloat-StrToFloat(FSum.Text));
     Qu.Active:=False;
end;


Procedure TFGBGoz.Pers_Good_Goz;
Var
I:Integer;
Qt:Real;
begin
     Open_g(Frodm.GGoz);
     Qu.SQL.Clear;
     Qu.SQL.Add('SELECT Sum(C.Quant)');
     Qu.SQL.Add('FROM Bvoice M,BInvoGood C');
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
procedure TFGBGoz.FormCreate(Sender: TObject);
begin
     Set_Forms(FGBGoz);
     GNam.Items.Assign(Kala);
     Query1.DatabaseName:=CurrDb;
     FColor.Enabled :=SModel;
     Fill_Comb(Frodm.Color,'Color',FColor.Items);
end;

procedure TFGBGoz.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFGBGoz.BshowOldClick(Sender: TObject);
begin
     Frodm.GGoz.Filtered:=False;
     IF (GNam.Text='') And (FColor.Text ='') Then Exit;
     Screen.Cursor:=crHourGlass;
     Pers_Good_Goz;
     Frodm.GGoz.Filter :='Quant > 0 ';
     Frodm.GGoz.Filtered:=True;
     Screen.Cursor:=crDefault;
end;

procedure TFGBGoz.BexitClick(Sender: TObject);
begin
     FGBGoz.Close;
end;

procedure TFGBGoz.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key = VK_F3 Then BshowClick(Sender);
end;

procedure TFGBGoz.PersKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Shift = [ssCtrl] Then FSum.SetFocus;
     If Shift = [ssCtrl]+[ssShift] Then FColor.SetFocus;
end;

procedure TFGBGoz.BprintClick(Sender: TObject);
begin
     CreatingForm(TGGozRep,'GGozRep',GGozRep);
//     Set_Sys_Enviroment;
     GGozRep.QRLabel1.Caption :='ê“«—‘ Œ—Ìœ ﬂ«·«';
     GGozRep.Good.Caption :=GNam.Text;
     GGozRep.FSum.Caption :=FSum.Text;
     GGozRep.FSum2.Caption :=FSum2.Text;
     GGozRep.FKol.Caption :=FKol.Text;
     GGozRep.DataSet:=Query1;
     GGozRep.QRDBText1.DataSet:=Query1;
     GGozRep.QRDBText2.DataSet:=Query1;
     GGozRep.Preview;
     GGozRep.Destroy;
end;

procedure TFGBGoz.NextTab(Sender: TObject; var Key: Char);
begin
     If Key =#13 Then
     Begin
       Key:=#0;
       FGBGoz.SelectNext(Sender As TWinControl,True,True);
     End;
end;

procedure TFGBGoz.GNamDragDrop(Sender, Source: TObject; X, Y: Integer);
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

procedure TFGBGoz.GNamDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
     Accept:=(Source Is TXPListBox) And ((Source As TXPListBox).Name = 'lbGName')
end;

procedure TFGBGoz.GNamDropDown(Sender: TObject);
Var
Gene:Integer;
begin
     Gene:=StrToInt(GNam.Text);
     IF sGene Then
       FillGene(GNam.Items,Gene)
     Else
       GNam.Items.Assign(Kala);
end;

procedure TFGBGoz.BShowClick(Sender: TObject);
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

procedure TFGBGoz.GNamKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetGoodCombo(Sender,Key);
end;

end.
