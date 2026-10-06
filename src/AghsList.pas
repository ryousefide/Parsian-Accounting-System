unit AghsList;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, Mask, ExtCtrls, Db, DBTables, Buttons;

type
  TFAghsList = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Dat1: TMaskEdit;
    Dat2: TMaskEdit;
    DGrid: TDBGrid;
    Fpayed: TEdit;
    Bshow: TBitBtn;
    Bexit: TButton;
    Bprint: TButton;
    rgCheq: TRadioGroup;
    Label4: TLabel;
    Label7: TLabel;
    AcNam: TComboBox;
    Label8: TLabel;
    DQu: TQuery;
    Ds: TDataSource;
    RDat1: TMaskEdit;
    RDat2: TMaskEdit;
    DQuNo: TIntegerField;
    DQuDat: TIntegerField;
    DQuNam: TStringField;
    DQuGprice: TCurrencyField;
    DQuRNo: TIntegerField;
    DQuPayed: TBooleanField;
    DQuRDat: TIntegerField;
    Bevel3: TBevel;
    Bevel1: TBevel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BshowClick(Sender: TObject);
    procedure BexitClick(Sender: TObject);
    procedure NextTab(Sender: TObject; var Key: Char);
    procedure DGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BprintClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Dat1Enter(Sender: TObject);
    procedure Dat1Exit(Sender: TObject);
    procedure Dat2Enter(Sender: TObject);
    procedure Dat2Exit(Sender: TObject);
    procedure SPriceKeyPress(Sender: TObject; var Key: Char);
    procedure DGridKeyPress(Sender: TObject; var Key: Char);
    procedure DGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure RDat1Enter(Sender: TObject);
    procedure RDat1Exit(Sender: TObject);
    procedure RDat2Enter(Sender: TObject);
    procedure RDat2Exit(Sender: TObject);
  private
    { Private declarations }
    Filt:String;
    Function Make_Filter:String;
    Function CheqSum:Currency;
    Procedure PrintText;
  public
    { Public declarations }
  end;

var
  FAghsList: TFAghsList;

implementation

uses Routins, FrooshDM, ProVar, AghsRep;

{$R *.DFM}

Function TFAghsList.Make_Filter:String;
Var
Str:String;
I:Integer;
begin
     Str:='';
     I:=DateToInt(Dat1.Text);
     If I>0 Then Str:='Dat >= '+IntToStr(I);
     I:=DateToInt(Dat2.Text);
     If I>0 Then Str:=Str+' and Dat <= '+IntToStr(I);
     I:=DateToInt(RDat1.Text);
     If I>0 Then Str:=Str+' and RDat >= '+IntToStr(I);
     I:=DateToInt(RDat2.Text);
     If I>0 Then Str:=Str+' and RDat <= '+IntToStr(I);
//     If SPrice.Text > '' Then Str:=Str+' and GPrice >= '+CurrToStr(FarToCurr(SPrice.Text));
//     If EPrice.Text > '' Then Str:=Str+' and GPrice <= '+CurrToStr(FarToCurr(EPrice.Text));
     If AcNam.Text > ''  Then Str:=Str+' and Nam = '+#39+AcNam.Text+#39;
     Case rgCheq.ItemIndex of
     0: Str:=Str+' and Payed = True';
     1: Str:=Str+' and Payed = False';
//     2: Str:=Str+' and PAccKod > 0';
     End;
     If Pos(' and',Str) = 1 Then Delete(Str,1,4);
     Result:=Str;
end;

Function TFAghsList.CheqSum:Currency;
begin
     Qu.Sql.Clear;
     Qu.Sql.Add('SELECT SUM(GPrice)');
     Qu.Sql.Add('FROM AGHS R');
     If Filt > '' Then Qu.SQL.Add('WHERE '+Filt);
     Qu.Active :=True;
     If Qu.Fields[0].Value > 0 Then  Result:=Qu.Fields[0].Value Else Result:=0;
     Qu.Active :=False;
     FPayed.Text :=CurrToFar(Result);
end;

Procedure TFAghsList.PrintText;
begin
     qrAghsList.SDat.Caption:=Dat1.Text;
     qrAghsList.EDat.Caption:=Dat2.Text;
     qrAghsList.Psdat.Caption:=RDat1.Text;
     qrAghsList.Pedat.Caption:=RDat2.Text;
     qrAghsList.Nam.Caption:=AcNam.Text;
     qrAghsList.Statue.Caption:=rgCheq.Items.Strings[rgCheq.ItemIndex];
     qrAghsList.Dat.Caption :=IntToDate(Fardate);
     qrAghsList.Dsum.Caption:=FPayed.Text;
end;

procedure TFAghsList.FormCreate(Sender: TObject);
begin
     Set_Forms(FAghsList);
     DQu.DataBaseName:=CurrDb;
     Fill_Comb(Frodm.Aghs,'Nam',AcNam.Items);
end;

procedure TFAghsList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFAghsList.BshowClick(Sender: TObject);
begin
     DQu.Close;
     DQu.SQL.Clear;
     Filt:=Make_Filter;
     DQu.SQL.Add('SELECT * FROM Aghs R');
     If Filt > '' Then DQu.SQL.Add('WHERE '+Filt);
     DQu.SQL.Add('ORDER BY Dat ');
     Dqu.Open;
     CheqSum;
     Filt:='';
end;

procedure TFAghsList.BexitClick(Sender: TObject);
begin
     FAghsList.Close;
end;

procedure TFAghsList.NextTab(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
       Key:=#0;
       SelectNext(Sender As TWinControl,True,True);
     End;
end;

procedure TFAghsList.DGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Shift =[ssCtrl] Then Bshow.SetFocus;
     If Shift =[ssCtrl]+[ssShift] Then rgCheq.SetFocus;
end;

procedure TFAghsList.BprintClick(Sender: TObject);
begin
     CreatingForm(TqrAghsList,'qrAghsList',qrAghsList);
     Set_Sys_Enviroment;
     PrintText;
     qrAghsList.Preview;
     qrAghsList.Destroy;
end;

procedure TFAghsList.SPriceKeyPress(Sender: TObject; var Key: Char);
begin
     NextTab(Sender,Key);
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;
end;

procedure TFAghsList.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If Key = VK_F3 Then BshowClick(Sender);
end;

procedure TFAghsList.Dat1Enter(Sender: TObject);
begin
     GetMaskText(Dat1);
end;

procedure TFAghsList.Dat1Exit(Sender: TObject);
begin
     SetMaskText(Dat1);
     If(Not Date_Check(Dat1.Text))And(DateToInt(Dat1.Text)>0)Then Dat1.SetFocus;
end;

procedure TFAghsList.Dat2Enter(Sender: TObject);
begin
     GetMaskText(Dat2);
end;

procedure TFAghsList.Dat2Exit(Sender: TObject);
begin
     SetMaskText(Dat2);
     If(Not Date_Check(Dat2.Text))And(DateToInt(Dat2.Text)>0)Then Dat2.SetFocus;

end;

procedure TFAghsList.DGridKeyPress(Sender: TObject; var Key: Char);
begin
     GMove(DGrid,Frodm.Aghs);
end;

procedure TFAghsList.DGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
     If DquPayed.Value = False Then DGrid.Canvas.Font.Color := clRed;
//     If DquKeler.Value = True Then DGrid.Canvas.Font.Color := clBlue;
     DGrid.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TFAghsList.RDat1Enter(Sender: TObject);
begin
     GetMaskText(RDat1);
end;

procedure TFAghsList.RDat1Exit(Sender: TObject);
begin
     SetMaskText(RDat1);
     If(Not Date_Check(RDat1.Text))And(DateToInt(RDat1.Text)>0)Then RDat1.SetFocus;

end;

procedure TFAghsList.RDat2Enter(Sender: TObject);
begin
     GetMaskText(RDat2);
end;

procedure TFAghsList.RDat2Exit(Sender: TObject);
begin
     SetMaskText(RDat2);
     If(Not Date_Check(RDat2.Text))And(DateToInt(RDat2.Text)>0)Then RDat2.SetFocus;
end;

end.
