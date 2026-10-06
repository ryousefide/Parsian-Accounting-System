unit RepFacSum;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls,Dialogs;

type
  TSumFacRep = class(TQuickRep)
    ChildBand1: TQRChildBand;
    QRShape1: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRShape2: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRSubDetail1: TQRSubDetail;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRShape9: TQRShape;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    SummaryBand1: TQRBand;
    QRBand1: TQRBand;
    QRLabel13: TQRLabel;
    QRExpr1: TQRExpr;
    qrTit: TQRLabel;
    logo: TQRImage;
    qrTit2: TQRLabel;
    ChildBand2: TQRChildBand;
    QRLabel1: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    SDat: TQRLabel;
    EDat: TQRLabel;
    QRLabel12: TQRLabel;
    Cust: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel16: TQRLabel;
    SNo: TQRLabel;
    ENo: TQRLabel;
    QRLabel17: TQRLabel;
    Qsum: TQRLabel;
    QRLabel18: TQRLabel;
    qrRas: TQRLabel;
    procedure QuickRepEndPage(Sender: TCustomQuickRep);
  private

  public

  end;

var
  SumFacRep: TSumFacRep;

implementation

uses FacSum;

{$R *.DFM}

procedure TSumFacRep.QuickRepEndPage(Sender: TCustomQuickRep);
begin
     QrPrinter.Canvas.MoveTo(QrPrinter.XPos(Page.LeftMargin+QrSubDetail1.Size.Width),
     QrPrinter.Canvas.PenPos.Y);
     QrPrinter.Canvas.Pen.Width:=1;
     QrPrinter.Canvas.LineTo(QrPrinter.XPos(Page.LeftMargin),QrPrinter.Canvas.PenPos.Y);
end;

end.
