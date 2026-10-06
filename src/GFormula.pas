unit GFormula;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, ExtCtrls, Grids, DBGrids, Menus, PopupListBox,
  Buttons;

type
  TFGFormula = class(TForm)
    GNam: TComboBox;
    Label1: TLabel;
    Bexit: TButton;
    GList: TPopupListBox;
    Sp1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Goods: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BexitClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure NextTab(Sender: TObject; var Key: Char);
    procedure GNamDropDown(Sender: TObject);
    procedure GNamKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure GListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GListKeyPress(Sender: TObject; var Key: Char);
    procedure Sp1Click(Sender: TObject);
    procedure GoodsColEnter(Sender: TObject);
    procedure GoodsColExit(Sender: TObject);
    procedure GoodsEditButtonClick(Sender: TObject);
    procedure GoodsKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    MKod:Integer;
    Procedure DrawList(List:TPopupListBox;Index:Integer);
    Function Make_Filt:String;
    Function Filt_Sum:String;
  public
    { Public declarations }
  end;

var
  FGFormula: TFGFormula;

implementation

uses FrooshDM, Routins, ProVar, Converts, XPListBox, CRoutins, MainForm;

{$R *.DFM}

Function TFGFormula.Make_Filt:String;
Var
St:String;
begin
     St:='';
     If GNam.Text >'' Then St:=' And C.Nam = '+#39+GNam.Text+#39;
     Result:=St;
end;

Function TFGFormula.Filt_Sum:String;
Var
St:String;
begin
     If GNam.Text >'' Then St:='Nam = '+#39+GNam.Text+#39;
     If Pos(' and',St) = 1 Then Delete(St,1,4);
     Result:=St;
end;

procedure TFGFormula.DrawList(List: TPopupListBox; Index: Integer);
begin
     List.Visible :=True;
     List.SetFocus;
     Bexit.Cancel :=False;
     If List.Items.Count>0 Then List.ItemIndex :=0;
end;

//---------------------------------------------
procedure TFGFormula.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     Main.glKey.GetBitmap(9,sp1.Glyph);
     Frodm.GForm.Active :=True;
     GNam.Items.Assign(Kala);
end;

procedure TFGFormula.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
     Frodm.GForm.Filter:='';
end;

procedure TFGFormula.BexitClick(Sender: TObject);
begin
     Frodm.GForm.Active :=False;
     Frodm.GForm.Filter:='';
     Close;
end;

procedure TFGFormula.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key = VK_F3 Then Sp1Click(Sender);
end;

procedure TFGFormula.NextTab(Sender: TObject; var Key: Char);
begin
     If Key =#13 Then
     Begin
      Key:=#0;
      SelectNext(Sender As TWinControl,True,True);
     End;
end;

procedure TFGFormula.GNamDropDown(Sender: TObject);
Var
Gene:Integer;
begin
     Gene:=StrToInt(GNam.Text);
     IF sGene Then
      FillGene(GNam.Items,Gene)
     Else
      GNam.Items.Assign(Kala);
end;

procedure TFGFormula.GNamKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetGoodCombo(Sender,Key);
end;

procedure TFGFormula.FormActivate(Sender: TObject);
begin
     GList.Items.Assign(Kala);
end;

procedure TFGFormula.GListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If (Key = 27) Then
     Begin
       Goods.SetFocus;
       Goods.SelectedField :=Goods.Columns[0].Field;
       GList.Visible :=False;
       Bexit.Cancel :=True;
     End;
end;

procedure TFGFormula.GListKeyPress(Sender: TObject; var Key: Char);
begin
     If Key =#13 Then
     Begin
       Frodm.GForm.Edit;
       Frodm.GFormMkod.Value:=Mkod;
       Frodm.GFormNam.Value:=GList.Items.Strings[GList.ItemIndex];
       Frodm.GFormKod.Value :=GoodKod(Frodm.GFormNam.Value);
       Frodm.GForm.Post;
       Goods.SetFocus;
       Goods.SelectedField :=Frodm.GFormQuant;
       GList.Visible :=False;
       Bexit.Cancel:=True;
     End;
end;

procedure TFGFormula.Sp1Click(Sender: TObject);
begin
     MKod:=GoodKod(GNam.Text);
     Frodm.GForm.Filter:='Mkod='+IntToStr(MKod);
     Frodm.GForm.Filtered:=True;
     Goods.DataSource:=Frodm.GFormDs;
end;

procedure TFGFormula.GoodsColEnter(Sender: TObject);
begin
     If Goods.DataSource = nil Then Exit Else Frodm.GForm.Edit;
     Case Goods.SelectedField.Index Of
     1: begin Frodm.GFormMkod.Value:=Mkod; Frodm.GForm.Post; end;
     2: If (Frodm.GFormKod.Value = 0 ) Then
       Case sGene Of
        False:
         DrawList(GList,1);
        True:
         Begin
          GList.Items.Assign(Kala);
          DrawList(GList,1);
         End;
       End;
     End;
end;


procedure TFGFormula.GoodsColExit(Sender: TObject);
begin
     If Goods.DataSource = nil Then Exit Else Frodm.GForm.Edit;
     Case Goods.SelectedField.Index Of
     1: If Goods.SelectedField.Value > -1 Then
        case sGene Of
          False:Begin
             If Frodm.GFormNam.IsNull Then
              Frodm.GFormNam.Value :=GoodNam(Goods.SelectedField.Value)
             Else
              GList.Items.Assign(Kala);
             DrawList(GList,2);
             GList.ItemIndex:=GList.Items.IndexOf(Frodm.GFormNam.Value);
             If GList.ItemIndex =-1 Then GList.ItemIndex:=0;
            End;
          True:Begin
             If Frodm.GFormNam.IsNull Then
              FillGene(GList.Items,Goods.SelectedField.Value)
             Else
              GList.Items.Assign(Kala);
             DrawList(GList,2);
             GList.ItemIndex:=GList.Items.IndexOf(Frodm.GFormNam.Value);
             If GList.ItemIndex =-1 Then GList.ItemIndex:=0;
            End;
        End;
     End;
end;

procedure TFGFormula.GoodsEditButtonClick(Sender: TObject);
begin
     If MessageDlg(DelConfirm,mtInformation,mbYESNO,-1) = mrYes Then
     Begin
      Frodm.GForm.Delete;
      Frodm.GForm.Edit;
     End;
end;

procedure TFGFormula.GoodsKeyPress(Sender: TObject; var Key: Char);
Var
Radif:Integer;
begin
     If Key = #13 Then
     Begin
       Key:=#0;
       GridMove(Goods,Frodm.GForm,Radif);
     End;
     If Not(Frodm.GForm.State = dsBrowse) Then Frodm.GForm.Edit;
end;

end.
