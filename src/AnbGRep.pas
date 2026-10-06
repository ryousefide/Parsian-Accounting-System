unit AnbGRep;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables;

type
  TFAnbGRep = class(TQuickRep)
    TitleBand1: TQRBand;
    QRSubDetail1: TQRSubDetail;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    DQu: TQuery;
    QRLabel4: TQRLabel;
    Ndat: TQRLabel;
    QRLabel3: TQRLabel;
    ChildBand1: TQRChildBand;
    QRLabel2: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel1: TQRLabel;
    QRExpr1: TQRExpr;
    qrTit: TQRLabel;
  private

  public

  end;

var
  FAnbGRep: TFAnbGRep;

implementation

uses FrooshDM, ProVar;

{$R *.DFM}

end.
