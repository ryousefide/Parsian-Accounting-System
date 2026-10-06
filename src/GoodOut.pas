unit GoodOut;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, CheckLst, ExtCtrls;

type
  TFGOut = class(TForm)
    Label1: TLabel;
    FNo: TEdit;
    clbGood: TCheckListBox;
    Label2: TLabel;
    lbModel: TListBox;
    Label3: TLabel;
    lbAnb: TListBox;
    Label4: TLabel;
    lbAKod: TListBox;
    Label5: TLabel;
    lbQ: TListBox;
    Label6: TLabel;
    lbU: TListBox;
    Label7: TLabel;
    lbRem: TListBox;
    Label8: TLabel;
    Label9: TLabel;
    FNam: TEdit;
    Label10: TLabel;
    lbDat: TLabel;
    Bevel1: TBevel;
    BDeliv: TButton;
    Bexit: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FNoExit(Sender: TObject);
    procedure clbGoodClick(Sender: TObject);
    procedure lbQDblClick(Sender: TObject);
    procedure BDelivClick(Sender: TObject);
    procedure BexitClick(Sender: TObject);
    procedure NextTab(Sender: TObject; var Key: Char);
    procedure clbGoodKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    No:Integer;
    GKod:Integer;
    Good:String;
    Color:String;
    AnbNam:String;
    AnbKod:Integer;
    Quant:Real;
    Fee:Currency;
    Perc:Real;
    Procedure Fill_List(No:Integer);
    Procedure Read_Data(ListIndex:Integer);
    Procedure GCardex(Nam,Color,Anb_Nam:String;Kod,Anb_Kod:Integer;Qt:Real;InKod,
                      FacNo:Integer;Desc,FacNam:String;Price:Currency;Perc:Real);
    Procedure Depot;
    Procedure InvO_UpDate(listIndex:Integer;Qt:Real);
  public
    { Public declarations }
  end;

var
  FGOut: TFGOut;

implementation

uses FrooshDM, Routins, ProVar;

{$R *.DFM}
Procedure TFGOut.Fill_List(No:Integer);
Var
I:Integer;
begin
     FNam.Text:='';
     lbDat.Caption:='';
     clbGood.Items.Clear;
     lbModel.Items.Clear;
     lbAnb.Items.Clear;
     lbAKod.Items.Clear;
     lbQ.Items.Clear;
     lbU.Items.Clear;
     lbRem.Items.Clear;
     If Not Frodm.Invo.FindKey([No]) Then Exit;
     FNam.Text:=Frodm.InvoNam.Value;
     lbDat.Caption:=IntToDate(Frodm.InvoDat.Value);
     Frodm.InvoGood.First;
     For I:= 1 To Frodm.InvoGood.RecordCount Do
     Begin
       clbGood.Items.Add(Frodm.InvoGoodNam.Value);
       lbModel.Items.Add(Frodm.InvoGoodColor.Value);
       lbAnb.Items.Add(Frodm.InvoGoodAnbNam.Value);
       lbAKod.Items.Add(IntToStr(Frodm.InvoGoodAnbKod.Value));
       lbQ.Items.Add(FloatToStr(Frodm.InvoGoodQuant.Value-Frodm.InvoGoodReJect.Value));
       lbU.Items.Add(Frodm.InvoGoodUnit.Value);
       lbRem.Items.Add(FloatToStr(DepotRem(Frodm.InvoGoodKod.Value,Frodm.InvoGoodAnbKod.Value,
         Frodm.InvoGoodColor.Value,Frodm.InvoGoodAnbNam.Value)));
       Frodm.InvoGood.Next;
     End;
end;

Procedure TFGOut.Read_Data(ListIndex:Integer);
begin
     Good:=clbGood.Items.Strings[ListIndex];
     GKod:=GoodKod(Good);
     Color:=lbModel.Items.Strings[ListIndex];
     AnbNam:=lbAnb.Items.Strings[ListIndex];
     AnbKod:=StrToInt(lbAKod.Items.Strings[ListIndex]);
     Quant:=StrToFloat(lbQ.Items.Strings[ListIndex]);
     Frodm.InvoGood.First;
     Frodm.InvoGood.MoveBy(ListIndex);
     Fee:=Frodm.InvoGoodPfee.Value;
     Perc:=Frodm.InvoGoodPerc.Value;
end;

Procedure TFGOut.GCardex(Nam,Color,Anb_Nam:String;Kod,Anb_Kod:Integer;Qt:Real;InKod,
FacNo:Integer;Desc,FacNam:String;Price:Currency;Perc:Real);
begin
     Frodm.GCardex.Append;
     Frodm.GCardex.FieldByName('Nam').AsString:=Nam;
     Frodm.GCardex.FieldByName('Kod').AsInteger:=Kod;
     Frodm.GCardex.FieldByName('Color').AsString:=Color;
     Frodm.GCardex.FieldByName('Anb').AsString:=Anb_Nam;
     Frodm.GCardex.FieldByName('AnbKod').AsInteger :=Anb_Kod;
     Frodm.GCardex.FieldByName('Quant').AsFloat:=Qt;
     Frodm.GCardex.FieldByName('IOkod').AsInteger:=InKod;
     Frodm.GCardex.FieldByName('FacNo').AsInteger:=FacNo;
     Frodm.GCardex.FieldByName('Des').AsString:=Desc;
     Frodm.GCardex.FieldByName('FacNam').AsString:=FacNam;
     Frodm.GCardex.FieldByName('Dat').AsInteger:=Fardate;
     Frodm.GCardex.FieldByName('Fee').AsCurrency:=Price;
     Frodm.GCardex.FieldByName('Perc').AsFloat:=Perc;
     Frodm.GCardex.Post;
end;

Procedure TFGOut.InvO_UpDate(listIndex:Integer;Qt:Real);
begin
     Frodm.InvoGood.First;
     Frodm.InvoGood.MoveBy(ListIndex);
     Frodm.InvoGood.Edit;
     Frodm.InvoGoodReJect.Value:=Frodm.InvoGoodReJect.Value+Qt;
     Frodm.InvoGood.Post;
end;

Procedure TFGOut.Depot;
Var
I:Integer;
begin
     For I:=0 To clbGood.Items.Count-1 Do
     Begin
       If clbGood.Checked[I] Then
       Begin
         Read_Data(I);
         IF (DepotCheck(GKod,AnbKod,Color,AnbNam,Quant))And (Quant > 0) Then
         Begin
           DepotChange(GKod,AnbKod,Color,AnbNam,Quant,dpOut);
           GCardex(Good,Color,AnbNam,GKod,AnbKod,Quant,dpOut,No,'›«ﬂ Ê— ›—Ê‘',FNam.Text,Fee,Perc);
           Invo_Update(I,Quant);
         End Else
           clbGood.Checked[I]:=False;
       End;
     End;
     QuickCloseOpen([0,16,87,112,151,320,350]);
     Frodm.Invo.FindKey([No]);
     Fill_List(No);
end;
//End Of Private
procedure TFGOut.NextTab(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
       Key:=#0;
       FGOut.SelectNext(Sender As TWinControl,True,True);
     End;
end;

procedure TFGOut.FormCreate(Sender: TObject);
begin
     Set_Forms(FGOut);
     FGOut.Left:=0;
end;

procedure TFGOut.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFGOut.FNoExit(Sender: TObject);
begin
     IF FNo.Text = '' Then Exit;
     No:=StrToInt(FNo.Text);
     Fill_List(No);
//     clbGood.ItemIndex:=0;

end;

procedure TFGOut.clbGoodClick(Sender: TObject);
begin
     lbModel.ItemIndex:=clbGood.ItemIndex;
     lbAnb.ItemIndex:=clbGood.ItemIndex;
     lbAKod.ItemIndex:=clbGood.ItemIndex;
     lbQ.ItemIndex:=clbGood.ItemIndex;
     lbU.ItemIndex:=clbGood.ItemIndex;
     lbRem.ItemIndex:=clbGood.ItemIndex;
end;

procedure TFGOut.clbGoodKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key = 13 Then lbQDblClick(Sender);
end;

procedure TFGOut.lbQDblClick(Sender: TObject);
Var
SQu:String;
Max:Real;
begin
     Max:=StrToFloat(lbQ.Items.Strings[clbGood.ItemIndex]);
     SQu:=InputBox(' ›ÌÌ— „ﬁœ«—  ÕÊÌ·Ì','„ﬁœ«— ÃœÌœ',lbQ.Items.Strings[lbQ.ItemIndex]);
     If StrToFloat(SQu) < Max Then lbQ.Items.Strings[lbQ.ItemIndex]:=SQu;
end;

procedure TFGOut.BDelivClick(Sender: TObject);
begin
     Depot;
end;

procedure TFGOut.BexitClick(Sender: TObject);
begin
     FGOut.Close;
end;

end.


