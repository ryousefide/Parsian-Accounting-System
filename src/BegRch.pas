unit BegRch;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, PopupListBox;

type
  TFbegRch = class(TForm)
    DGrid: TDBGrid;
    Fpayed: TEdit;
    Bnext: TButton;
    GList: TPopupListBox;
    BPrev: TButton;
    AList: TPopupListBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DGridKeyPress(Sender: TObject; var Key: Char);
    procedure BnextClick(Sender: TObject);
    procedure GListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GListKeyPress(Sender: TObject; var Key: Char);
    procedure DGridColEnter(Sender: TObject);
    procedure DGridEditButtonClick(Sender: TObject);
    procedure BPrevClick(Sender: TObject);
    procedure DGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure AListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure AListKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    St:String;
    AcKod:Real;
    Bed:Real;
    Procedure DrawList(List:TPopupListBox);
    Procedure FillGList;
  public
    { Public declarations }
    Function CheqSum:Currency;
  end;

var
  FbegRch: TFbegRch;

implementation

uses FrooshDM, ProVar, Routins, BegPch, BegAc, Converts;

{$R *.DFM}
Procedure TFbegRch.DrawList(List:TPopupListBox);
begin
{     List.Left :=List.Width+2; //  420-
     List.Top:=40+Frodm.AcBill.RecNo *20;
     If List.Top > 200 Then List.Top:=200;
     List.Top:=111;}
     List.Visible :=True;
     List.SetFocus;
end;

Procedure TFbegRch.FillGList;
Var
Width:Integer;
begin
     GList.Items.Clear;
     Width:=DGrid.Columns[3].Width;
     Fill_Comb(Frodm.banks,'Bnam',GList.Items);
     GList.Width :=Width+10;
end;

Function TFbegRch.CheqSum:Currency;
Var
BedKod:Real;
begin
     Bed:=AccKod('çﬂ œ—Ì«› ‰Ì');
     Qu.Sql.Clear;
     Qu.Sql.Add('SELECT SUM(PBILL)');
     Qu.Sql.Add('FROM RCHEQ');
     Qu.Sql.Add('Where RBNo = -1');
     Qu.Active :=True;
     If Qu.Fields[0].Value > 0 Then  Result:=Qu.Fields[0].AsCurrency Else Result:=0;
     Qu.Active :=False;
     FPayed.Text :=CurrToFar(Result);
     St:='«›  «ÕÌÂ «”‰«œ œ—Ì«› Ì «Ê· œÊ—Â';
     AutoBill(True,0,BedKod,Result,St,'-1',1,-1,0,'',0,0,0,DefaultCurr);//AcKod
end;

procedure TFbegRch.FormCreate(Sender: TObject);
begin
     Set_Forms(FbegRch);
     FillGList;
     AList.Items.Assign(AcList);
     AcKod:=AccKod('”—„«ÌÂ «Ê· œÊ—Â');
     Bed:=AccKod('çﬂ œ—Ì«› ‰Ì');
     Frodm.Rcheq.Filter:='RBNo = -1';
     Frodm.Rcheq.Filtered:=True;
     Frodm.Rcheq.Append;
end;

procedure TFbegRch.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Frodm.Rcheq.Filter:='';
     Frodm.Rcheq.Filtered:=False;
     Action:=caFree;
end;

procedure TFbegRch.DGridKeyPress(Sender: TObject; var Key: Char);
Var
Radif:Integer;
begin
     If Key = #13 Then
     Begin
      Key:=#0;
      GridMove(DGrid,Frodm.RCheq,Radif);
     End;
end;

procedure TFbegRch.BnextClick(Sender: TObject);
begin
     CreatingForm(TFbegPch,'FbegPch',FbegPch);
     Close;
end;

procedure TFbegRch.GListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key = 27 Then
     Begin
       DGrid.SetFocus;
       DGrid.SelectedField :=DGrid.Columns[3].Field;
       GList.Visible :=False;
     End;

end;

procedure TFbegRch.GListKeyPress(Sender: TObject; var Key: Char);
Var
Str:String;
begin
     If Key=#13 Then
     Begin
       Key:=#0;
       Str:=Glist.Items.Strings[Glist.ItemIndex];
       Frodm.Rcheq.Edit;
       Frodm.RcheqBank.Value :=Str;
//       DGrid.SetFocus;
       DGrid.SelectedField := DGrid.Columns[4].Field;
       GList.Visible :=False;
       AList.Visible:=True;
       Alist.SetFocus;
     End;
end;

procedure TFbegRch.DGridColEnter(Sender: TObject);
begin
     Frodm.Rcheq.Edit;
     Case DGrid.SelectedIndex Of
     3: DrawList(GList);
     2: Begin
          Frodm.RcheqRecDat.Value :=Fardate;
          Frodm.RcheqRBno.Value:=-1;
          Frodm.RcheqRecKod.Value:=False;
          Frodm.RcheqShar.Value:=False;
          Frodm.RcheqReject.Value:=False;
          Frodm.RcheqAccKod.Value:=AcKod;
          Frodm.RcheqDesc.Value:='œ—Ì«›  «Ê· œÊ—Â';
        End;
     End;
end;

procedure TFbegRch.DGridEditButtonClick(Sender: TObject);
begin
     Frodm.Rcheq.Delete;
     Frodm.Rcheq.Edit;
end;

procedure TFbegRch.BPrevClick(Sender: TObject);
begin
     CreatingForm(TFBegAc,'FBegAc',FBegAc);
end;

procedure TFbegRch.DGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case DGrid.SelectedIndex of
     2: Case Key Of
     VK_MULTIPLY :Begin
                  Frodm.Rcheq.Post;
                  Frodm.Rcheq.Edit;
                  DGrid.SelectedField.Value := DGrid.SelectedField.Value*1000;
                  End;
       VK_DIVIDE :Begin
                  Frodm.Rcheq.Post;
                  Frodm.Rcheq.Edit;
                  DGrid.SelectedField.Value := DGrid.SelectedField.Value* 100;
                  End;
               End;
     End;

end;

procedure TFbegRch.AListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key = 27 Then
     Begin
       DGrid.SetFocus;
       DGrid.SelectedField :=DGrid.Columns[4].Field;
       AList.Visible :=False;
     End;
end;

procedure TFbegRch.AListKeyPress(Sender: TObject; var Key: Char);
Var
St:String;
begin
     If Key=#13 Then
     Begin
       Key:=#0;
       St:=Alist.Items.Strings[Alist.ItemIndex];
       Frodm.Rcheq.Edit;
//       Frodm.RcheqBank.Value :=St;
       Frodm.RcheqAccKod.Value:=AccKod(St);
       DGrid.SetFocus;
       DGrid.SelectedField := DGrid.Columns[4].Field;
       AList.Visible :=False;
//       AList.Visible:=True;
     End;
end;

end.
