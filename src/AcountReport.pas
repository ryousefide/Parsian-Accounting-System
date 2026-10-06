unit AcountReport;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TAcountRep = class(TQuickRep)
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    QRShape2: TQRShape;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    ChildBand1: TQRChildBand;
    QRLabel2: TQRLabel;
    QRLabel1: TQRLabel;
    QRShape1: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    qrAcName: TQRLabel;
    SummaryBand1: TQRBand;
  private

  public

  end;

var
  AcountRep: TAcountRep;

implementation

uses FrooshDM, Converts;

{$R *.DFM}

end.
