unit RepCosts;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TCostRep = class(TQuickRep)
    TitleBand1: TQRBand;
    QRLabel1: TQRLabel;
    ChildBand1: TQRChildBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRBand1: TQRBand;
  private

  public

  end;

var
  CostRep: TCostRep;

implementation

uses Routins, FrooshDM, ProVar;

{$R *.DFM}

end.
