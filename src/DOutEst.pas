unit DOutEst;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Grids, DBGrids, StdCtrls, Mask, ExtCtrls, Buttons;

type
  TFDOutEst = class(TForm)
    dbg: TDBGrid;
    EsQu: TQuery;
    EsDs: TDataSource;
    EsQuKod: TIntegerField;
    EsQuNam: TStringField;
    EsQucolor: TStringField;
    EsQuAnbnam: TStringField;
    EsQuNo: TIntegerField;
    EsQuHQuant: TFloatField;
    EsQuDQuant: TFloatField;
    EsQuREMAIN: TFloatField;
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    SDat: TMaskEdit;
    EDat: TMaskEdit;
    Label4: TLabel;
    GNam: TComboBox;
    Label5: TLabel;
    FColor: TComboBox;
    Label1: TLabel;
    FAnb: TComboBox;
    spCalc: TSpeedButton;
    spPrint: TSpeedButton;
    rgMoj: TRadioGroup;

    Procedure NextTab(Sender:TObject;Var Key :Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure SDatEnter(Sender: TObject);
    procedure SDatExit(Sender: TObject);
    procedure EDatEnter(Sender: TObject);
    procedure EDatExit(Sender: TObject);
    procedure GNamKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure spCalcClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    Function Make_Filt_String :String;
  public
    { Public declarations }
  end;

var
  FDOutEst: TFDOutEst;

implementation

uses ProVar, Routins, FrooshDM, CRoutins, MainForm;

{$R *.DFM}

{ TFDOutEst }

Function TFDOutEst.Make_Filt_String :String;
Var
Str,FStr:String;
I:Integer;
begin
     Str:='';
     If GNam.Text <> '' Then Str:='Kod= '+IntToStr(GoodKod(GNam.Text));
     If FColor.Text <> '' Then Str:=Str+' and color = '+#39+FColor.Text+#39;
     If FAnb.Text <> '' Then Str:=Str+' and Anbnam ='+#39+FAnb.Text+#39;
     Case rgMoj.ItemIndex Of
      0: Str:=Str+' and Remain > 0 ';
      1: Str:=Str+' and Remain < 0 ';
      2: Str:=Str+' and Remain = 0 ';
     End;

     If Pos(' and',Str) = 1 Then Delete(Str,1,4);
     Result:=Str;
end;

procedure TFDOutEst.NextTab(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  Begin
   Key:=#0;
   SelectNext(Sender As TWinControl,True,True);
  End;
end;

procedure TFDOutEst.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFDOutEst.FormCreate(Sender: TObject);
begin
     Set_Forms(Self);
     Gnam.Items.Assign(Kala);
     FColor.Enabled :=SModel;
     Fill_Comb(Frodm.AnbDat,'Nam',FAnb.Items);
     Fill_Comb(Frodm.Color,'Color',FColor.Items);
     Main.glKey.GetBitmap(8,spCalc.Glyph);
     Main.glKey.GetBitmap(2,spPrint.Glyph);
end;

procedure TFDOutEst.SDatEnter(Sender: TObject);
begin
     GetMaskText(SDat);
end;

procedure TFDOutEst.SDatExit(Sender: TObject);
begin
     SetMaskText(SDat);
     If (Not Date_Check(SDat.Text))and(DateToInt(SDat.Text)>0) Then SDat.SetFocus;
end;

procedure TFDOutEst.EDatEnter(Sender: TObject);
begin
     GetMaskText(EDat);
end;

procedure TFDOutEst.EDatExit(Sender: TObject);
begin
     SetMaskText(EDat);
     If (Not Date_Check(EDat.Text))and(DateToInt(EDat.Text)>0) Then EDat.SetFocus;
end;

procedure TFDOutEst.GNamKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetGoodCombo(Sender,Key);
end;

procedure TFDOutEst.spCalcClick(Sender: TObject);
Var
Flt:String;
Dat1,Dat2:Integer;
begin
     Flt:=Make_Filt_String;
     Dat1:=DatetoInt(SDat.Text);
     Dat2:=DatetoInt(EDat.Text);
     If Dat2 = 0 Then Dat2:=999999999;
     EsQu.Close;
     ESQu.Params[0].Value:=Dat1;
     EsQu.Params[1].Value:=Dat2;
     ESQu.Filter:=Flt;
     ESQu.Filtered:=True;
     ESQu.Open;
end;

procedure TFDOutEst.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Case Key of
     VK_F3 :spCalcClick(Sender);
     VK_ESCAPE:Close;
     End;
end;

procedure TFDOutEst.dbgDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
     If EsQuREMAIN.Value < 0 Then
     Begin
      dbg.Canvas.Font.Color:=clRed;
      dbg.Canvas.Font.Style:=[fsBold];
     End;
     If EsQuREMAIN.Value > 0 Then
     Begin
      dbg.Canvas.Font.Color:=clBlue;
      dbg.Canvas.Font.Style:=[fsBold];
     End;
     dbg.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

end.
