unit SafList;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, Buttons, Grids, DBGrids, Mask, ExtCtrls;

type
  TFSafList = class(TForm)
    Bevel2: TBevel;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Dat1: TMaskEdit;
    Dat2: TMaskEdit;
    DGrid: TDBGrid;
    Fpayed: TEdit;
    Bshow: TBitBtn;
    Bexit: TButton;
    Bprint: TButton;
    SPrice: TEdit;
    EPrice: TEdit;
    FNam: TComboBox;
    DQu: TQuery;
    Ds: TDataSource;
    Label4: TLabel;
    FStatue: TComboBox;
    DQuBno: TStringField;
    DQuDat: TIntegerField;
    DQuNam: TStringField;
    DQuAdd: TStringField;
    DQuPbill: TCurrencyField;
    DQuStatue: TStringField;
    DQuFNo: TIntegerField;
    DQuSprice: TCurrencyField;
    DQuQt: TSmallintField;
    DQuPprice: TCurrencyField;
    DQuDaf: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure NextTab(Sender: TObject; var Key: Char);
    procedure Dat1Enter(Sender: TObject);
    procedure Dat1Exit(Sender: TObject);
    procedure Dat2Enter(Sender: TObject);
    procedure Dat2Exit(Sender: TObject);
    procedure SPriceExit(Sender: TObject);
    procedure SPriceKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SPriceKeyPress(Sender: TObject; var Key: Char);
    procedure EPriceExit(Sender: TObject);
    procedure EPriceKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BshowClick(Sender: TObject);
    procedure DGridKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BexitClick(Sender: TObject);
  private
    { Private declarations }
    Filt:String;
    Function Make_Filter:String;
  public
    { Public declarations }
  end;

var
  FSafList: TFSafList;

implementation

uses FrooshDM, Routins, ProVar;

{$R *.DFM}
Function TFSafList.Make_Filter:String;
Var
Str:String;
I:Integer;
begin
     Str:='';
     I:=DateToInt(Dat1.Text);
     If I>0 Then Str:='Dat >= '+IntToStr(I);
     I:=DateToInt(Dat2.Text);
     If I>0 Then Str:=Str+' and Dat <= '+IntToStr(I);
     If SPrice.Text > '' Then Str:=Str+' and PBill >= '+CurrToStr(FarToCurr(SPrice.Text));
     If EPrice.Text > '' Then Str:=Str+' and PBill <= '+CurrToStr(FarToCurr(EPrice.Text));
     If FNam.Text > ''  Then Str:=Str+' and Nam = '+#39+FNam.Text+#39;
     If FStatue.ItemIndex > -1  Then Str:=Str+' and Statue = '+#39+FStatue.Text+#39;
     If Pos(' and',Str) = 1 Then Delete(Str,1,4);
     Result:=Str;
end;

procedure TFSafList.NextTab(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
       Key :=#0;
       SelectNext(Sender As TWinControl,True,True);
     End;
end;

procedure TFSafList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFSafList.FormCreate(Sender: TObject);
begin
     Set_Forms(FSafList);
     DQu.DataBaseName:=CurrDb;
     FNam.Items.Assign(AcList);
end;

procedure TFSafList.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     IF Key = VK_F3 Then BshowClick(Sender);
end;

procedure TFSafList.Dat1Enter(Sender: TObject);
begin
     GetMaskText(Dat1);
end;

procedure TFSafList.Dat1Exit(Sender: TObject);
begin
     SetMaskText(Dat1);
     If(Not Date_Check(Dat1.Text))And(DateToInt(Dat1.Text)>0)Then Dat1.SetFocus;
end;

procedure TFSafList.Dat2Enter(Sender: TObject);
begin
     GetMaskText(Dat2);
end;

procedure TFSafList.Dat2Exit(Sender: TObject);
begin
     SetMaskText(Dat2);
     If(Not Date_Check(Dat2.Text))And(DateToInt(Dat2.Text)>0)Then Dat2.SetFocus;
end;

procedure TFSafList.SPriceExit(Sender: TObject);
begin
     SPrice.Text:=StrToFCurr(SPrice.Text);
end;

procedure TFSafList.SPriceKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     SPrice.Text :=KeyMult2(Key,SPrice.Text);
end;

procedure TFSafList.SPriceKeyPress(Sender: TObject; var Key: Char);
begin
     NextTab(Sender,Key);
     If Not (Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,
        #9,#27,#83,#46]) Then Key:=#0;
end;

procedure TFSafList.EPriceExit(Sender: TObject);
begin
     EPrice.Text:=StrToFCurr(EPrice.Text);
end;

procedure TFSafList.EPriceKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     EPrice.Text :=KeyMult2(Key,EPrice.Text);
end;

procedure TFSafList.BshowClick(Sender: TObject);
begin
     DQu.Close;
     DQu.SQL.Clear;
     Filt:=Make_Filter;
     DQu.SQL.Add('SELECT * FROM Rsaf R');
     If Filt > '' Then DQu.SQL.Add('WHERE '+Filt);
     DQu.SQL.Add('ORDER BY Dat ');
     Dqu.Open;
     Filt:='';
end;

procedure TFSafList.DGridKeyPress(Sender: TObject; var Key: Char);
begin
     GMove(DGrid,Frodm.Rsaf);
end;

procedure TFSafList.BexitClick(Sender: TObject);
begin
     FSafList.Close;
end;

end.
