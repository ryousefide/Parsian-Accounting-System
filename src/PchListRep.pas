unit PchListRep;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TRepPchList = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRExpr1: TQRExpr;
    ChildBand1: TQRChildBand;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    SDat: TQRLabel;
    EDat: TQRLabel;
    SummaryBand1: TQRBand;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    Sserial: TQRLabel;
    ESerial: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel16: TQRLabel;
    Acc: TQRLabel;
    Statue: TQRLabel;
    Jari: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    SPrice: TQRLabel;
    EPrice: TQRLabel;
    Dat: TQRLabel;
    QRLabel15: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel19: TQRLabel;
    Dsum: TQRLabel;
    QRLabel20: TQRLabel;
    QRDBText8: TQRDBText;
  private

  public

  end;

var
  RepPchList: TRepPchList;

implementation

uses FrooshDM, ProVar, PcheqList;

{$R *.DFM}

end.
