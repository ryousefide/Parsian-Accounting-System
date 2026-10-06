unit RepAcDiag;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, TeeProcs, TeEngine, Chart,
  DBChart, QrTee, Series;

type
  TAcDiagRep = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    chYear: TQRChart;
    QRDBChart2: TQRDBChart;
    BarSeries1: TBarSeries;
  private

  public

  end;

var
  AcDiagRep: TAcDiagRep;

implementation

uses FrooshDM;

{$R *.DFM}

end.
