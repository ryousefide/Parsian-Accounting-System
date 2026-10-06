unit RepJari;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TJariRep = class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    SummaryBand1: TQRBand;
    QRLabel1: TQRLabel;
    ChildBand1: TQRChildBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    Sdat: TQRLabel;
    Edat: TQRLabel;
    Jari: TQRLabel;
    Bank: TQRLabel;
    Nam: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRExpr2: TQRExpr;
    QRLabel7: TQRLabel;
    procedure QuickRepEndPage(Sender: TCustomQuickRep);
  private

  public

  end;

var
  JariRep: TJariRep;

implementation

uses FrooshDM, Routins, ProVar;

{$R *.DFM}

procedure TJariRep.QuickRepEndPage(Sender: TCustomQuickRep);
begin
     QrPrinter.Canvas.MoveTo(QrPrinter.XPos(JariRep.Page.LeftMargin+DetailBand1.Size.Width)
     ,QrPrinter.Canvas.PenPos.Y);
     QrPrinter.Canvas.Pen.Width:=2;
     QrPrinter.Canvas.LineTo(QrPrinter.XPos(JariRep.Page.LeftMargin),QrPrinter.Canvas.PenPos.Y);
end;

end.
