unit DchListRep;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TRepDchList = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRExpr1: TQRExpr;
    ChildBand1: TQRChildBand;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    SDat: TQRLabel;
    EDat: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    SummaryBand1: TQRBand;
    QRLabel11: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    SPrice: TQRLabel;
    EPrice: TQRLabel;
    Acc: TQRLabel;
    Pacc: TQRLabel;
    Shar: TQRLabel;
    Statue: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel14: TQRLabel;
    Dat: TQRLabel;
    QRLabel17: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel19: TQRLabel;
    Dsum: TQRLabel;
    qrRadif: TQRLabel;
    QRLabel20: TQRLabel;
    procedure QRDBText1Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  RepDchList: TRepDchList;

implementation

uses FrooshDM, ProVar, DcheqList;

{$R *.DFM}

procedure TRepDchList.QRDBText1Print(sender: TObject; var Value: String);
begin
     qrRadif.Caption:=IntToStr(FDCheqList.DQu.RecNo);
end;

end.
