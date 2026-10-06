unit CGoodRep;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TRepCGood = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    SummaryBand2: TQRBand;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    qrTit: TQRLabel;
    logo: TQRImage;
    qrTit2: TQRLabel;
    ChildBand1: TQRChildBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    Kala: TQRLabel;
    color: TQRLabel;
    Anb: TQRLabel;
    QRLabel10: TQRLabel;
    Ndat: TQRLabel;
    ChildBand2: TQRChildBand;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel24: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRShape9: TQRShape;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    qrRadif: TQRLabel;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape10: TQRShape;
    procedure QRLabel1Print(sender: TObject; var Value: String);
    procedure qrRadifPrint(sender: TObject; var Value: String);
    procedure QuickRepEndPage(Sender: TCustomQuickRep);
  private

  public

  end;

var
  RepCGood: TRepCGood;

implementation

uses FrooshDM, Routins, ProVar;

{$R *.DFM}

procedure TRepCGood.QRLabel1Print(sender: TObject; var Value: String);
begin
//     If Not bmpP1.Empty Then Logo.Picture.Bitmap:=bmpP1;
     qrTit.Caption:=InvoLbl;
     QrTit2.Caption:=BarNamLbl;
end;

procedure TRepCGood.qrRadifPrint(sender: TObject; var Value: String);
begin
     qrRadif.Caption:=IntToStr(QrSubDetail1.DataSet.RecNo);
     qrshape5.Size.Height:=Qrsubdetail1.Size.Height+Qrsubdetail1.Expanded;
     qrshape6.Size.Height:=Qrsubdetail1.Size.Height+Qrsubdetail1.Expanded;
     qrshape7.Size.Height:=Qrsubdetail1.Size.Height+Qrsubdetail1.Expanded;
     qrshape8.Size.Height:=Qrsubdetail1.Size.Height+Qrsubdetail1.Expanded;
     qrshape10.Size.Height:=Qrsubdetail1.Size.Height+Qrsubdetail1.Expanded;
end;

procedure TRepCGood.QuickRepEndPage(Sender: TCustomQuickRep);
begin
     QrPrinter.Canvas.MoveTo(QrPrinter.XPos(Page.LeftMargin+QrSubDetail1.Size.Width),
     QrPrinter.Canvas.PenPos.Y);
     QrPrinter.Canvas.Pen.Width:=1;
     QrPrinter.Canvas.LineTo(QrPrinter.XPos(Page.LeftMargin),QrPrinter.Canvas.PenPos.Y);
end;

end.
