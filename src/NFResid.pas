unit NFResid;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TqrNFResid = class(TQuickRep)
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
    QRDBText7: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText8: TQRDBText;
    qrDCurr: TQRLabel;
    procedure qrTitlePrint(sender: TObject; var Value: String);
    procedure QuickRepAfterPrint(Sender: TObject);
  private

  public

  end;

var
  qrNFResid: TqrNFResid;

implementation

uses FrooshDM, ProVar;

{$R *.DFM}

procedure TqrNFResid.qrTitlePrint(sender: TObject; var Value: String);
begin
     qrTit.Caption:=InvoLbl;
     
end;

procedure TqrNFResid.QuickRepAfterPrint(Sender: TObject);
begin
     Frodm.NFish.Edit;
     Frodm.NFishInv.Value:=Frodm.NFishInv.Value+1;
     Frodm.NFish.Post;

end;

end.
