unit PMResid;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TqrPMResid = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    TitleBand1: TQRBand;
    PageFooterBand1: TQRBand;
    qrTitle: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    qrDesc: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    qrTit: TQRLabel;
    ChildBand1: TQRChildBand;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    qrCent: TQRLabel;
    QRLabel14: TQRLabel;
    qrCashier: TQRLabel;
    QRSysData1: TQRSysData;
    qrTit2: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel15: TQRLabel;
    procedure qrTitlePrint(sender: TObject; var Value: String);
    procedure QuickRepAfterPrint(Sender: TObject);
  private

  public

  end;

var
  qrPMResid: TqrPMResid;

implementation

uses FrooshDM, ProVar;

{$R *.DFM}

procedure TqrPMResid.qrTitlePrint(sender: TObject; var Value: String);
begin
     qrTit.Caption:=InvoLbl;
     QrTit2.Caption:=BarNamLbl;
     
end;

procedure TqrPMResid.QuickRepAfterPrint(Sender: TObject);
begin
     Frodm.PMon.Edit;
     Frodm.PMonInv.Value:=Frodm.PMonInv.Value+1;
     Frodm.PMon.Post;
end;

end.
