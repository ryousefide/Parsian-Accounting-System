unit Diag;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TeEngine, Series, ExtCtrls, TeeProcs, Chart, DBChart, TeeFunci, StdCtrls,
  Menus,Printers;

type
  TFDiag = class(TForm)
    Dch1: TDBChart;
    TeeFunction1: THighTeeFunction;
    Bprint: TButton;
    PopupMenu1: TPopupMenu;
    N801: TMenuItem;
    N1001: TMenuItem;
    N1201: TMenuItem;
    N1401: TMenuItem;
    Bevel1: TBevel;
    Bexit: TButton;
    Panel1: TPanel;
    sc3D: TScrollBar;
    cb3D: TCheckBox;
    scZoom: TScrollBar;
    scEle: TScrollBar;
    scRotation: TScrollBar;
    cbOrtog: TCheckBox;
    scVOf: TScrollBar;
    scHof: TScrollBar;
    Series1: TBarSeries;
    procedure BprintClick(Sender: TObject);
    procedure N1001Click(Sender: TObject);
    procedure N801Click(Sender: TObject);
    procedure N1201Click(Sender: TObject);
    procedure Dch1DblClick(Sender: TObject);
    procedure N1401Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BexitClick(Sender: TObject);
    procedure cb3DClick(Sender: TObject);
    procedure sc3DChange(Sender: TObject);
    procedure scZoomChange(Sender: TObject);
    procedure scEleChange(Sender: TObject);
    procedure scRotationChange(Sender: TObject);
    procedure cbOrtogClick(Sender: TObject);
    procedure scVOfChange(Sender: TObject);
    procedure scHofChange(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDiag: TFDiag;

implementation

uses FrooshDM, ProVar, Routins;

{$R *.DFM}
Var
I:Integer;

procedure TFDiag.BprintClick(Sender: TObject);
Var
R:TRect;
P:Tprinter;
begin
     P:=TPrinter.Create;
     R.Right :=P.PageWidth-50;
     R.Left :=LeftMar*5;
     R.Top :=P.PageHeight Div 6;
     R.Bottom :=P.PageHeight-P.PageHeight Div 6;
     Dch1.PrintRect(R);
end;

procedure TFDiag.N1001Click(Sender: TObject);
begin
     Dch1.ZoomPercent(125);
end;

procedure TFDiag.N801Click(Sender: TObject);
begin
     Dch1.ZoomPercent(110);
end;

procedure TFDiag.N1201Click(Sender: TObject);
begin
     Dch1.ZoomPercent(75);
end;

procedure TFDiag.Dch1DblClick(Sender: TObject);
begin
     I:=I+1;
     If I > 3 Then I:=0;
     If I = 0 Then Dch1.SeriesList.Series[0].Marks.Visible:=False Else
                   Dch1.SeriesList.Series[0].Marks.Visible:=True;
     Case I Of
     1: Dch1.SeriesList.Series[0].Marks.Style:=smsValue;
     2: Dch1.SeriesList.Series[0].Marks.Style:=smsLabel;
     3: Dch1.SeriesList.Series[0].Marks.Style:=smsLabelValue;
     End;
end;

procedure TFDiag.N1401Click(Sender: TObject);
begin
     Dch1.ZoomPercent(90);
end;

procedure TFDiag.FormCreate(Sender: TObject);
begin
     Set_Forms(FDiag);
     I:=0;

end;

procedure TFDiag.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action :=caFree;
end;

procedure TFDiag.BexitClick(Sender: TObject);
begin
     FDiag.Close;
end;

procedure TFDiag.cb3DClick(Sender: TObject);
begin
     Dch1.View3D :=cb3D.Checked;
end;

procedure TFDiag.sc3DChange(Sender: TObject);
begin
     dch1.Chart3DPercent :=sc3D.Position;
end;

procedure TFDiag.scZoomChange(Sender: TObject);
begin
     Dch1.View3DOptions.Zoom :=scZoom.Position;
end;

procedure TFDiag.scEleChange(Sender: TObject);
begin
     Dch1.View3DOptions.Elevation :=scEle.Position;
end;

procedure TFDiag.scRotationChange(Sender: TObject);
begin
     Dch1.View3DOptions.Rotation :=scRotation.Position;
end;

procedure TFDiag.cbOrtogClick(Sender: TObject);
begin
     Dch1.View3DOptions.Orthogonal :=cbOrtog.Checked;
end;

procedure TFDiag.scVOfChange(Sender: TObject);
begin
     Dch1.View3DOptions.VertOffset :=scVof.Position;
end;

procedure TFDiag.scHofChange(Sender: TObject);
begin
     Dch1.View3DOptions.HorizOffset :=scHof.Position;
end;

procedure TFDiag.FormResize(Sender: TObject);
begin
     Dch1.Width:=ClientWidth;
     Dch1.Height:=ClientHeight-Panel1.Height;
     Bexit.Top:=ClientHeight-BExit.Height;
     BPrint.Top:=ClientHeight-BPrint.Height;
     Panel1.Top:=ClientHeight-Panel1.Height;
end;

end.
