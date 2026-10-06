unit RepGoods;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TGoodRep = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    SummaryBand1: TQRBand;
    ChildBand1: TQRChildBand;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRShape1: TQRShape;
    QRLabel2: TQRLabel;
    QRExpr1: TQRExpr;
    procedure QuickRepEndPage(Sender: TCustomQuickRep);
  private

  public

  end;

var
  GoodRep: TGoodRep;

implementation

uses FrooshDM;

{$R *.DFM}

procedure TGoodRep.QuickRepEndPage(Sender: TCustomQuickRep);
begin
     QrPrinter.Canvas.MoveTo(QrPrinter.XPos(Page.LeftMargin+QrSubDetail1.Size.Width),
     QrPrinter.Canvas.PenPos.Y);
     QrPrinter.Canvas.Pen.Width:=1;
     //QrPrinter.Canvas.TextOut(QrPrinter.Canvas.PenPos.X,QrPrinter.Canvas.PenPos.Y,'Test');
     QrPrinter.Canvas.LineTo(QrPrinter.XPos(Page.LeftMargin),QrPrinter.Canvas.PenPos.Y);
end;

end.
