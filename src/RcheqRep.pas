unit RcheqRep;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
   TQrRcheq = class(TQuickRep)
    TitleBand1: TQRBand;
    qrTit: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel3: TQRLabel;
    PageFooterBand1: TQRBand;
    ChildBand2: TQRChildBand;
    qrArt: TQRSubDetail;
    QRBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
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
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel9: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel8: TQRLabel;
    qrFarsi: TQRLabel;
    QRShape1: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel19: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel18: TQRLabel;
    qrFarsi2: TQRLabel;
    qrCnt: TQRLabel;
    QRLabel20: TQRLabel;
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
    qrRadif: TQRLabel;
    QRSysData2: TQRSysData;
    procedure QRDBText5Print(sender: TObject; var Value: String);
    procedure QRDBText9Print(sender: TObject; var Value: String);
    procedure QRLabel18Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  QrRcheq: TQrRcheq;

implementation

uses FrooshDM, Routins;

{$R *.DFM}

procedure TQrRcheq.QRDBText5Print(sender: TObject; var Value: String);
begin
     qrRadif.Caption:=IntToStr(FroDM.Rcheq.RecNo);
end;

procedure TQrRcheq.QRDBText9Print(sender: TObject; var Value: String);
begin
     qrFarsi.Caption:=FarsiPrice(QrDbText9.DataSet.FieldValues['PSum']);
end;

procedure TQrRcheq.QRLabel18Print(sender: TObject; var Value: String);
begin
     qrFarsi2.Caption:=FarsiPrice(QrDbText9.DataSet.FieldValues['PSum']);
     qrCnt.Caption:=IntToStr(qrArt.DataSet.RecordCount);
end;

end.
