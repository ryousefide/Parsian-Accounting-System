unit FactorRep;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables;

type
  TFacQr = class(TQuickRep)
    QRBand1: TQRBand;
    QRBand2: TQRChildBand;
    QRLabel9: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel19: TQRLabel;
    QRLabel22: TQRLabel;
    QRDBText21: TQRDBText;
    QRChildBand2: TQRChildBand;
    QRLabel28: TQRLabel;
    QRLabel30: TQRLabel;
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
    GFB: TQRBand;
    QRShape9: TQRShape;
    QRShape34: TQRShape;
    QRLabel18: TQRLabel;
    qrTit: TQRLabel;
    qrPSum: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    ChildBand3: TQRBand;
    QRLabel6: TQRLabel;
    qrQsum: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRShape2: TQRShape;
    GFs1: TQRShape;
    GFs2: TQRShape;
    GFs5: TQRShape;
    GFs3: TQRShape;
    GFs4: TQRShape;
    QRShape8: TQRShape;
    QRShape10: TQRShape;
    QRLabel3: TQRLabel;
    QRExpr2: TQRExpr;
    PageFooterBand1: TQRChildBand;
    qrCom: TQRLabel;
    ChildBand1: TQRChildBand;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QrAdd: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRShape1: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText7: TQRDBText;
    QRShape5: TQRShape;
    qrPay: TQRLabel;
    QRLabel23: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRLabel5: TQRLabel;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    qrTit2: TQRLabel;
    QRImage3: TQRImage;
    QRImage4: TQRImage;
    logo: TQRImage;
    QRDBText6: TQRDBText;
    QRLabel14: TQRLabel;
    QRShape13: TQRShape;
    QRShape17: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRDBText8: TQRDBText;
    Gfs6: TQRShape;
    QRDBText9: TQRDBText;
    qrFRem: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel24: TQRLabel;
    qrlRem: TQRLabel;
    QRLabel25: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRShape11: TQRShape;
    QRLabel1: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel8: TQRLabel;
    procedure QRLabel1Print(sender: TObject; var Value: String);
    procedure GFBBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText3Print(sender: TObject; var Value: String);
    procedure QRDBText4Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  FacQr: TFacQr;

implementation

uses FrooshDM, Invoice, ProVar,Dialogs;

{$R *.DFM}

procedure TFacQr.QRLabel1Print(sender: TObject; var Value: String);
begin
     QrQSum.Font:=PFFont;
     QrFRem.Font:=PFFont;
     If Not bmpP1.Empty Then Logo.Picture.Bitmap:=bmpP1;
     QrTit2.Caption:=BarNamLbl;
     qrAdd.Caption:=Master;
end;

procedure TFacQr.GFBBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Var
I:Integer;
begin
//     I:=StrToInt(FloatToStr(Int(FacQr.CurrentY/FacQr.QRPrinter.YFactor+ButMar*FacQr.QRPrinter.YFactor)));
//    GFB.Height:=FacQr.Height-I-childband3.Height-childband1.Height-PageFooterBand1.Height;
//     GFB.Enabled:=False;
     Gfs1.Size.Height:=GFB.Size.Height;//+5;
     Gfs2.Size.Height:=GFB.Size.Height;//+5;
     Gfs3.Size.Height:=GFB.Size.Height;//+5;
     Gfs4.Size.Height:=GFB.Size.Height;//+5;
     Gfs5.Size.Height:=GFB.Size.Height;//+5;
     Gfs6.Size.Height:=GFB.Size.Height;//+5;
end;

procedure TFacQr.QRDBText3Print(sender: TObject; var Value: String);
begin
     qrPay.Caption:=CurrToStr(Frodm.InvoPpay.Value);
end;

procedure TFacQr.QRDBText4Print(sender: TObject; var Value: String);
begin
     qrshape2.Size.Height:=Qrsubdetail3.Size.Height+Qrsubdetail3.Expanded;
     qrshape17.Size.Height:=Qrsubdetail3.Size.Height+Qrsubdetail3.Expanded;
     qrshape18.Size.Height:=Qrsubdetail3.Size.Height+Qrsubdetail3.Expanded;
     qrshape19.Size.Height:=Qrsubdetail3.Size.Height+Qrsubdetail3.Expanded;
     qrshape21.Size.Height:=Qrsubdetail3.Size.Height+Qrsubdetail3.Expanded;
     qrshape34.Size.Height:=Qrsubdetail3.Size.Height+Qrsubdetail3.Expanded;
     GFB.Size.Height:=GFB.Size.Height-Qrsubdetail3.Expanded;
//     QRImage1.Top:=Qrsubdetail3.Top;
//     QRImage1.Left:=Qrsubdetail3.Left-QRImage1.Width;
end;

end.
