unit APResid;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TqrAPResid = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    TitleBand1: TQRBand;
    PageFooterBand1: TQRBand;
    qrTitle: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel9: TQRLabel;
    qrDesc: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    qrTit: TQRLabel;
    ChildBand1: TQRChildBand;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    qrCent: TQRLabel;
    QRSysData1: TQRSysData;
    qrTit2: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText9: TQRDBText;
    qrDCurr: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel17: TQRLabel;
    qrCent2: TQRLabel;
    procedure qrTitlePrint(sender: TObject; var Value: String);
    procedure QuickRepAfterPrint(Sender: TObject);
  private

  public

  end;

var
  qrAPResid: TqrAPResid;

implementation

uses FrooshDM, ProVar;

{$R *.DFM}

procedure TqrAPResid.qrTitlePrint(sender: TObject; var Value: String);
begin
     qrTit.Caption:=InvoLbl;
     QrTit2.Caption:=BarNamLbl;
     
end;

procedure TqrAPResid.QuickRepAfterPrint(Sender: TObject);
begin
     Frodm.RMon.Edit;
     Frodm.RMonInv.Value:=Frodm.RMonInv.Value+1;
     Frodm.RMon.Post;
end;

end.
