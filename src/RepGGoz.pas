unit RepGGoz;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TGGozRep = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    Good: TQRLabel;
    ChildBand1: TQRChildBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    SummaryBand1: TQRBand;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    FKol: TQRLabel;
    FSum2: TQRLabel;
    FSum: TQRLabel;
  private

  public

  end;

var
  GGozRep: TGGozRep;

implementation

uses FrooshDM, Routins, ProVar, GGoz;

{$R *.DFM}

end.
