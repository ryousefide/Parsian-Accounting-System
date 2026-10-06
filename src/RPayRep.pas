unit RPayRep;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
   TQrRPay = class(TQuickRep)
    TitleBand1: TQRBand;
    qrTit: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel3: TQRLabel;
    PageFooterBand1: TQRBand;
    ChildBand2: TQRChildBand;
    QRLabel12: TQRLabel;
    QrArt: TQRSubDetail;
    QRBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    qrFarsi: TQRLabel;
    QRLabel8: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    qrFarsi2: TQRLabel;
    QRShape1: TQRShape;
    qrCnt: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRDBText6: TQRDBText;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    qrHLine: TQRShape;
    procedure QRDBText9Print(sender: TObject; var Value: String);
    procedure QRLabel17Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  QrRPay: TQrRPay;

implementation

uses FrooshDM, Routins;

{$R *.DFM}

procedure TQrRPay.QRDBText9Print(sender: TObject; var Value: String);
begin
     qrFarsi.Caption:=FarsiPrice(QrDbText9.DataSet.FieldValues['PSum']);
end;

procedure TQrRPay.QRLabel17Print(sender: TObject; var Value: String);
begin
     qrFarsi2.Caption:=FarsiPrice(QrDbText9.DataSet.FieldValues['PSum']);
     qrCnt.Caption:=IntToStr(qrArt.DataSet.RecordCount);
end;

end.
