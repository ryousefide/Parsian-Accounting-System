unit CurrCardexRep;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TRepCurrCardex = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    SummaryBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    ColumnHeaderBand1: TQRBand;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel9: TQRLabel;
    Kala: TQRLabel;
    color: TQRLabel;
    Anb: TQRLabel;
    SummaryBand2: TQRBand;
    QRLabel10: TQRLabel;
    Ndat: TQRLabel;
    ColumnHeaderBand2: TQRBand;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRDBText9: TQRDBText;
  private

  public

  end;

var
  RepCurrCardex: TRepCurrCardex;

implementation

uses FrooshDM, Routins;

{$R *.DFM}

end.
