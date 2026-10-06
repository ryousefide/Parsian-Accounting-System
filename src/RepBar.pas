unit RepBar;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TBarRep = class(TQuickRep)
    TitleBand1: TQRBand;
    qrTit: TQRLabel;
    QRLabel5: TQRLabel;
    qrFdat: TQRLabel;
    QRLabel3: TQRLabel;
    ChildBand1: TQRChildBand;
    SummaryBand1: TQRBand;
    QRLabel2: TQRLabel;
    qrNam: TQRLabel;
    QRLabel1: TQRLabel;
    qrCount: TQRLabel;
    QRLabel4: TQRLabel;
    qrShar: TQRLabel;
    QRLabel7: TQRLabel;
    qrAdd: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    ChildBand2: TQRChildBand;
    qrAd: TQRLabel;
  private

  public

  end;

var
  BarRep: TBarRep;

implementation

{$R *.DFM}

end.
