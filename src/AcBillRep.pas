unit AcBillRep;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TAbillRep = class(TQuickRep)
    TitleBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRD1: TQRDBText;
    QRD2: TQRDBText;
    QRD3: TQRDBText;
    QRD6: TQRDBText;
    SummaryBand1: TQRBand;
    QRD4: TQRDBText;
    QRD5: TQRDBText;
    QRDBText1: TQRDBText;
    QRExpr2: TQRExpr;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    Dat: TQRLabel;
    Sdat: TQRLabel;
    Send: TQRLabel;
    QRLabel9: TQRLabel;
    ChildBand1: TQRChildBand;
    QRL2: TQRLabel;
    QRL1: TQRLabel;
    QRL3: TQRLabel;
    QRL6: TQRLabel;
    QRL4: TQRLabel;
    QRL5: TQRLabel;
    QRLabel12: TQRLabel;
  private

  public

  end;

var
  AbillRep: TAbillRep;

implementation

uses FrooshDM;

{$R *.DFM}

end.
