unit RepGAnal;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables;

type
  TGAnalRep = class(TQuickRep)
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
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    SummaryBand1: TQRBand;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel9: TQRLabel;
    qrRule: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel11: TQRLabel;
    QRShape8: TQRShape;
    QRLabel10: TQRLabel;
    QRShape5: TQRShape;
    QRLabel12: TQRLabel;
    QRShape6: TQRShape;
    QRDBText7: TQRDBText;
    QRShape7: TQRShape;
    QRLabel13: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    L4: TQRShape;
    L2: TQRShape;
    L1: TQRShape;
    L8: TQRShape;
    L3: TQRShape;
    L7: TQRShape;
    L5: TQRShape;
    L6: TQRShape;
    L9: TQRShape;
    QRDBText10: TQRDBText;
    L10: TQRShape;
    QRShape9: TQRShape;
    QRLabel14: TQRLabel;
    procedure QuickRepEndPage(Sender: TCustomQuickRep);
    procedure QRDBText6Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  GAnalRep: TGAnalRep;

implementation

uses GProfit;

{$R *.DFM}

procedure TGAnalRep.QuickRepEndPage(Sender: TCustomQuickRep);
begin
     QrPrinter.Canvas.MoveTo(QrPrinter.XPos(Page.LeftMargin+QrSubDetail1.Size.Width),
     QrPrinter.Canvas.PenPos.Y);
     QrPrinter.Canvas.Pen.Width:=1;
     QrPrinter.Canvas.LineTo(QrPrinter.XPos(Page.LeftMargin),QrPrinter.Canvas.PenPos.Y);
end;

procedure TGAnalRep.QRDBText6Print(sender: TObject; var Value: String);
Var
Hei:Extended;
begin
     Hei:=Qrsubdetail1.Size.Height+Qrsubdetail1.Expanded;
     L1.Size.Height:=Hei;
     L2.Size.Height:=Hei;
     L3.Size.Height:=Hei;
     L4.Size.Height:=Hei;
     L5.Size.Height:=Hei;
     L6.Size.Height:=Hei;
     L7.Size.Height:=Hei;
     L8.Size.Height:=Hei;
     L10.Size.Height:=Hei;
     L9.Enabled:=FGProfit.GQuNam.Value = 'ÌãÚ ˜á';
     L9.Width:=Qrsubdetail1.Width;
     L9.Left:=0;
end;

end.
