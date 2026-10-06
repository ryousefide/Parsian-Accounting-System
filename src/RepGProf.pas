unit RepGProf;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables;

type
  TGPRep = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    ChildBand1: TQRChildBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QrDat: TQRLabel;
    QRLabel8: TQRLabel;
    QRExpr1: TQRExpr;
    QRSubDetail1: TQRSubDetail;
    Query1: TQuery;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    SummaryBand1: TQRBand;
    L3: TQRShape;
    L2: TQRShape;
    L1: TQRShape;
    L4: TQRShape;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel9: TQRLabel;
    qrRule: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRLabel10: TQRLabel;
    QRDBText10: TQRDBText;
    L9: TQRShape;
    procedure QuickRepEndPage(Sender: TCustomQuickRep);
    procedure QRDBText6Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  GPRep: TGPRep;

implementation

uses DatedBenef;

{$R *.DFM}

procedure TGPRep.QuickRepEndPage(Sender: TCustomQuickRep);
begin
     QrPrinter.Canvas.MoveTo(QrPrinter.XPos(Page.LeftMargin+QrSubDetail1.Size.Width),
     QrPrinter.Canvas.PenPos.Y);
     QrPrinter.Canvas.Pen.Width:=1;
     QrPrinter.Canvas.LineTo(QrPrinter.XPos(Page.LeftMargin),QrPrinter.Canvas.PenPos.Y);
end;

procedure TGPRep.QRDBText6Print(sender: TObject; var Value: String);
Var
Hei:Extended;
begin
     Hei:=Qrsubdetail1.Size.Height+Qrsubdetail1.Expanded;
     L1.Size.Height:=Hei;
     L2.Size.Height:=Hei;
     L3.Size.Height:=Hei;
     L4.Size.Height:=Hei;
     L9.Enabled:=FDBenef.GQuNam.Value = 'ÌãÚ ˜á';
     L9.Width:=Qrsubdetail1.Width-1;
     L9.Left:=0;
end;

end.
