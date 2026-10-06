unit AghsRep;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TqrAghsList = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRExpr1: TQRExpr;
    SDat: TQRLabel;
    EDat: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    Nam: TQRLabel;
    Statue: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel14: TQRLabel;
    Dat: TQRLabel;
    Psdat: TQRLabel;
    Pedat: TQRLabel;
    ChildBand1: TQRChildBand;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel8: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText5: TQRDBText;
    SummaryBand1: TQRBand;
    QRLabel19: TQRLabel;
    Dsum: TQRLabel;
  private

  public

  end;

var
  qrAghsList: TqrAghsList;

implementation

uses ProVar, Routins, FrooshDM, AghsList;

{$R *.DFM}

end.
