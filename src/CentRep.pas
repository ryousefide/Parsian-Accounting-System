unit CentRep;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TRepCent = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    L4: TQRShape;
    QRDBText2: TQRDBText;
    QRBand3: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    L3: TQRShape;
    L1: TQRShape;
    L2: TQRShape;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    procedure QRDBText5Print(sender: TObject; var Value: String);
    procedure QuickRepEndPage(Sender: TCustomQuickRep);
  private

  public

  end;

var
  RepCent: TRepCent;

implementation

uses FrooshDM, Routins;

{$R *.DFM}

procedure TRepCent.QRDBText5Print(sender: TObject; var Value: String);
begin
     L1.Size.Height:=QrBand2.Size.Height+QrBand2.Expanded;// 3;
     L2.Size.Height:=QrBand2.Size.Height+QrBand2.Expanded;// 3;
     L3.Size.Height:=QrBand2.Size.Height+QrBand2.Expanded;// 3;
     L4.Size.Height:=QrBand2.Size.Height+QrBand2.Expanded;// 3;
end;

procedure TRepCent.QuickRepEndPage(Sender: TCustomQuickRep);
begin
     QrPrinter.Canvas.MoveTo(QrPrinter.XPos(Page.LeftMargin+QrBand2.Size.Width)
     ,QrPrinter.Canvas.PenPos.Y);
     QrPrinter.Canvas.Pen.Width:=1;
     QrPrinter.Canvas.LineTo(QrPrinter.XPos(Page.LeftMargin),QrPrinter.Canvas.PenPos.Y);
end;

end.
