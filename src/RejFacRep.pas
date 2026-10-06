unit RejFacRep;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables;

type
  TRepBuyRej = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRBand2: TQRChildBand;
    QRLabel9: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel19: TQRLabel;
    QRDBText18: TQRDBText;
    QRLabel22: TQRLabel;
    QRChildBand2: TQRChildBand;
    QRLabel28: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRSubDetail3: TQRSubDetail;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape34: TQRShape;
    QRLabel18: TQRLabel;
    QRExpr1: TQRExpr;
    QRDBText21: TQRDBText;
    ChildBand1: TQRChildBand;
    qrCom: TQRLabel;
    qrTit: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel7: TQRLabel;
    QRDBText5: TQRDBText;
    ChildBand2: TQRChildBand;
    QRLabel20: TQRLabel;
    qrlRem: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel11: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRDBText6: TQRDBText;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    PgFooter: TQRBand;
    QRLabel10: TQRLabel;
    qrFRem: TQRLabel;
    qrQSums: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRLabel8: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel12: TQRLabel;
    QRExpr2: TQRExpr;
    QRMemo1: TQRMemo;
    GFB: TQRBand;
    qrPSum: TQRLabel;
    GFs1: TQRShape;
    GFs2: TQRShape;
    GFs5: TQRShape;
    GFs3: TQRShape;
    GFs4: TQRShape;
    logo: TQRImage;
    QRShape5: TQRShape;
    QRLabel2: TQRLabel;
    procedure QRLabel1Print(sender: TObject; var Value: String);
    procedure GFBBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public

  end;

var
  RepBuyRej: TRepBuyRej;

implementation

uses FrooshDM, Invoice, ProVar;

{$R *.DFM}

procedure TRepBuyRej.QRLabel1Print(sender: TObject; var Value: String);
begin
     QrLabel1.Font.Size:=PLFont.Size+5;
     QrQSums.Font:=PFFont;
     QrFRem.Font:=PFFont;
     If Not bmpP1.Empty Then Logo.Picture.Bitmap:=bmpP1;
end;

procedure TRepBuyRej.GFBBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
     Gfs1.Size.Height:=GFB.Size.Height;
     Gfs2.Size.Height:=GFB.Size.Height;
     Gfs3.Size.Height:=GFB.Size.Height;
     Gfs4.Size.Height:=GFB.Size.Height;
     Gfs5.Size.Height:=GFB.Size.Height;
end;

end.
