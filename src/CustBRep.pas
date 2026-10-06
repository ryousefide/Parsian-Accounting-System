unit CustBRep;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TFCustBRep = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    ChildBand1: TQRChildBand;
    QRChildBand1: TQRChildBand;
    qrCom: TQRLabel;
    QRLabel2: TQRLabel;
    qrNam: TQRLabel;
    QRLabel3: TQRLabel;
    qrAc: TQRLabel;
    QRLabel4: TQRLabel;
    qrRdat: TQRLabel;
    QRLabel6: TQRLabel;
    qrPice: TQRLabel;
    qrFPrice: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRMemo1: TQRMemo;
    logo: TQRImage;
    qrTit: TQRLabel;
    qrTit2: TQRLabel;
    QRLabel5: TQRLabel;
    qrFdat: TQRLabel;
    procedure QRLabel1Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  FCustBRep: TFCustBRep;

implementation

uses ProVar;

{$R *.DFM}

procedure TFCustBRep.QRLabel1Print(sender: TObject; var Value: String);
begin
     If Not bmpP1.Empty Then Logo.Picture.Bitmap:=bmpP1;
     qrMemo1.Lines.Add(Master);
     QrMemo1.Font:=PFFont;
     QrMemo1.Font.Size:=9;
     QrMemo1.Font.Style:=[fsBold];
end;

end.
