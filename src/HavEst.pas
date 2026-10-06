unit HavEst;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons;

type
  TFHavEst = class(TForm)
    EsQu: TQuery;
    Ds: TDataSource;
    dbg: TDBGrid;
    Splitter1: TSplitter;
    EsQuNo: TIntegerField;
    EsQuDat: TIntegerField;
    EsQuNam: TStringField;
    EsQuPkol: TCurrencyField;
    EsQuPdis: TCurrencyField;
    EsQuPnet: TCurrencyField;
    EsQuBkod: TBooleanField;
    EsQuBno: TIntegerField;
    EsQuCost: TStringField;
    EsQuCkod: TIntegerField;
    EsQuRefno: TIntegerField;
    EsQuDes: TStringField;
    HGQu: TQuery;
    HGDs: TDataSource;
    HGQuRadif: TIntegerField;
    HGQuKod: TIntegerField;
    HGQuNam: TStringField;
    HGQuColor: TStringField;
    HGQuAnbnam: TStringField;
    HGQuAnbkod: TIntegerField;
    HGQuQuant: TFloatField;
    HGQuUnit: TStringField;
    HGQuReject: TFloatField;
    Panel1: TPanel;
    Panel2: TPanel;
    Goods: TDBGrid;
    Label1: TLabel;
    Splitter2: TSplitter;
    Gdbg: TDBGrid;
    GQu: TQuery;
    GQuDs: TDataSource;
    GQuDat: TIntegerField;
    GQuNam: TStringField;
    GQuCkod: TIntegerField;
    GQuNam_1: TStringField;
    GQuQuant: TFloatField;
    GQuUnit: TStringField;
    GQuReject: TFloatField;
    GQuKod: TIntegerField;
    GQuNo: TIntegerField;
    Label3: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    FAccNam: TComboBox;
    FCostN: TComboBox;
    FCentN: TComboBox;
    spCalc: TSpeedButton;
    Label2: TLabel;
    Procedure NextTab(Sender:TObject;Var Key :Char);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GoodsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure EsQuAfterScroll(DataSet: TDataSet);
    procedure HGQuAfterOpen(DataSet: TDataSet);
    procedure GdbgDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure spCalcClick(Sender: TObject);
  private
    { Private declarations }
    Function Make_Filter:String;
  public
    { Public declarations }
  end;

var
  FHavEst: TFHavEst;

implementation

uses Routins, ProVar, FrooshDM, CRoutins, MainForm;

{$R *.DFM}

{ TFHavEst }

Function TFHavEst.Make_Filter:String;
Var
Str:String;
I:Integer;
begin
     Str:='';
     If FAccNam.Text > ''  Then Str:=Str+' and Nam = '+chr(39)+FAccNam.Text+chr(39);
     If FCostN.Text > ''  Then Str:=Str+' and Cost = '+chr(39)+FCostN.Text+chr(39);
     If FCentN.Text >'' Then Str:=Str+' and CKod = '+IntToStr(CentKod(FCentN.Text));
     If Pos(' and',Str) = 1 Then Delete(Str,1,4);
     Result:=Str;
end;


procedure TFHavEst.NextTab(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  Begin
   Key:=#0;
   SelectNext(Sender As TWinControl,True,True);
  End;
end;

procedure TFHavEst.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree
end;

procedure TFHavEst.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     Main.glKey.GetBitmap(8,spCalc.Glyph);
     Label1.Alignment:=taCenter;
     EsQu.DatabaseName:=CurrDb;
     HGQu.DatabaseName:=CurrDb;
     GQu.DatabaseName:=CurrDb;
     EsQu.Open;
     Fill_Comb(Frodm.Invo,'Nam',FAccNam.Items);
     FCostN.Items.Assign(CostList);
     Fill_Comb(Frodm.Cent,CUser.CentField,FCentN.Items);
end;


procedure TFHavEst.dbgDrawColumnCell(Sender: TObject;
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

procedure TFHavEst.GoodsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
     If HgQuReject.Value < HgQuQuant.Value Then
      Goods.Canvas.Font.Color:=clBlue;
     If HgQuReject.Value > HgQuQuant.Value Then
      Goods.Canvas.Brush.Color:=clRED;
     If  HgQuReject.Value = 0 Then Goods.Canvas.Font.Color:=clRed;
     Goods.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TFHavEst.EsQuAfterScroll(DataSet: TDataSet);
begin
     HGQu.Close;
     HGQu.Params[0].Value:=EsQuNo.Value;
     HgQu.open;
end;

procedure TFHavEst.HGQuAfterOpen(DataSet: TDataSet);
begin
     GQu.Close;
     GQu.Params[0].Value:=HGQuKod.Value;
     GQu.open;
end;

procedure TFHavEst.GdbgDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
Var
DrawRect:TRect;
begin
     If GQuReject.Value < GQuQuant.Value Then  Gdbg.Canvas.Font.Color:=clBlue;
     If GQuReject.Value > GQuQuant.Value Then  Gdbg.Canvas.Brush.Color:=clRED;
     If GQuReject.Value = 0 Then Gdbg.Canvas.Font.Color:=clRed;
     Gdbg.DefaultDrawColumnCell(Rect,DataCol,Column,State);
     if (Column.Field.FieldName ='Ckod' ) then
     Begin
      DrawRect:=Rect;
      gdbg.Canvas.FillRect(DrawRect);
      If Not Column.Field.IsNull Then
      gdbg.Canvas.Textout(DrawRect.Left+4,DrawRect.Top,CentName(Column.Field.Value));
     End;
end;

procedure TFHavEst.spCalcClick(Sender: TObject);
Var
Flt:String;
begin
     EsQu.Filter:='';
     EsQu.Filtered:=False;
     Flt:=Make_Filter;
     If Flt > '' Then
     Begin
      EsQu.Filter:=Flt;
      EsQu.Filtered:=True;
     End;
end;

end.
