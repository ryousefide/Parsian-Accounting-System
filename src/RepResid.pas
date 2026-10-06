unit RepResid;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TqrResid = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    TitleBand1: TQRBand;
    PageFooterBand1: TQRBand;
    qrTitle: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    qrNo: TQRLabel;
    qrDat: TQRLabel;
    qrPrice: TQRLabel;
    qrBes: TQRLabel;
    qrBed: TQRLabel;
    qrDesc: TQRLabel;
  private

  public

  end;

var
  qrResid: TqrResid;

implementation

{$R *.DFM}

end.
