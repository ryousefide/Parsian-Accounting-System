unit DepotDaily;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, Buttons, Db, DBTables, Grids, DBGrids,
  CheckLst, XPCheckListBox;

type
  TFDepotDaily = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Dat1: TMaskEdit;
    Dat2: TMaskEdit;
    RadioGroup1: TRadioGroup;
    Label3: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    FAccNam: TComboBox;
    FCostN: TComboBox;
    FCentN: TComboBox;
    spCalc: TSpeedButton;
    dbg: TDBGrid;
    DS: TDataSource;
    HQu: TQuery;
    HQuKod: TIntegerField;
    HQuNam: TStringField;
    HQuAnbnam: TStringField;
    HQuQuant: TFloatField;
    HQuUnit: TStringField;
    HQuNo: TIntegerField;
    HQuDat: TIntegerField;
    HQuCost: TStringField;
    HQuAcNam: TStringField;
    HQuCkod: TIntegerField;
    xpcFields: TXPCheckListBox;
    Splitter1: TSplitter;
    Procedure NextTab(Sender:TObject;Var Key :Char);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Dat1Enter(Sender: TObject);
    procedure Dat1Exit(Sender: TObject);
    procedure Dat2Enter(Sender: TObject);
    procedure Dat2Exit(Sender: TObject);
    procedure dbgDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure xpcFieldsClick(Sender: TObject);
    procedure spCalcClick(Sender: TObject);

  private
    { Private declarations }
    Function Make_Filter:String;
  public
    { Public declarations }
  end;

var
  FDepotDaily: TFDepotDaily;

implementation

uses ProVar, Routins, CRoutins, FrooshDM, MainForm;

{$R *.DFM}

{ TFDepOut }
function TFDepotDaily.Make_Filter: String;
Var
Str:String;
I:Integer;
begin
     Str:='';
     I:=DateToInt(Dat1.Text);
     If I>0 Then Str:='I.Dat >= '+IntToStr(I);
     I:=DateToInt(Dat2.Text);
     If I>0 Then Str:=Str+' and I.Dat <= '+IntToStr(I);
     If FAccNam.Text > ''  Then Str:=Str+' and I.Nam = '+chr(39)+FAccNam.Text+chr(39);
     If FCostN.Text > ''  Then Str:=Str+' and I.Cost = '+chr(39)+FCostN.Text+chr(39);
     If FCentN.Text >'' Then Str:=Str+' and I.CKod = '+IntToStr(CentKod(FCentN.Text));
     If Pos(' and',Str) = 1 Then Delete(Str,1,4);
     Result:=Str;
end;

procedure TFDepotDaily.NextTab(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
     Begin
       Key:=#0;
       SelectNext(Sender As TWinControl,True,True);
     End;
end;

procedure TFDepotDaily.FormCreate(Sender: TObject);
Var
I:Integer;
begin
     Set_Forms(Self);
     Main.glKey.GetBitmap(8,spCalc.Glyph);
     Fill_Comb(Frodm.Invo,'Nam',FAccNam.Items);
     FCostN.Items.Assign(CostList);
     Fill_Comb(Frodm.Cent,CUser.CentField,FCentN.Items);
     HQu.DatabaseName:=CurrDb;
     xpcFields.Items.Clear;
     For I:=0 To HQu.Fields.Count-1 Do
     Begin
      xpcFields.Items.Add(HQu.Fields[I].DisplayName);
      xpcFields.Checked[I]:=True;
     End;
end;

procedure TFDepotDaily.FormClose(Sender: TObject;var Action: TCloseAction);
begin
     Action:=caFree
end;

procedure TFDepotDaily.Dat1Enter(Sender: TObject);
begin
     GetMaskText(Dat1);
end;

procedure TFDepotDaily.Dat1Exit(Sender: TObject);
begin
     SetMaskText(Dat1);
     If(Not Date_Check(Dat1.Text))And(DateToInt(Dat1.Text)>0)Then Dat1.SetFocus;
end;

procedure TFDepotDaily.Dat2Enter(Sender: TObject);
begin
     GetMaskText(Dat2);
end;

procedure TFDepotDaily.Dat2Exit(Sender: TObject);
begin
     SetMaskText(Dat2);
     If(Not Date_Check(Dat2.Text))And(DateToInt(Dat2.Text)>0)Then Dat2.SetFocus;
end;

procedure TFDepotDaily.dbgDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
Var
DrawRect: TRect;
begin
    if (Column.Field.FieldName ='Ckod' ) then
    Begin
     DrawRect:=Rect;
     dbg.Canvas.FillRect(DrawRect);
     If Not Column.Field.IsNull Then
     dbg.Canvas.Textout(DrawRect.Left+4,DrawRect.Top,CentName(Column.Field.Value));
    End;
end;

procedure TFDepotDaily.xpcFieldsClick(Sender: TObject);
Var
I:Integer;
begin
     HQu.Fields[xpcFields.ItemIndex].Visible:=xpcFields.Checked[xpcFields.ItemIndex];
end;


procedure TFDepotDaily.spCalcClick(Sender: TObject);
Var
Flt:String;
begin
     HQu.Close;
     Flt:=Make_Filter;
     If Flt > '' Then
      HQu.SQL.Strings[2]:='Where (I.No = G.No) and '+Flt
     Else
      HQu.SQL.Strings[2]:='Where (I.No = G.No)  ';
     HQu.Open;

end;


end.
