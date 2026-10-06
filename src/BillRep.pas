unit BillRep;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TRepBill = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    ChildBand1: TQRChildBand;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRSubDetail1: TQRSubDetail;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    SummaryBand1: TQRBand;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    ChildBand2: TQRChildBand;
    QRLabel17: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel18: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText2: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel2: TQRLabel;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRLabel11: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRLabel24: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel12: TQRLabel;
    QRDBText10: TQRDBText;
    procedure QRLabel3Print(sender: TObject; var Value: String);
    procedure QRDBText9Print(sender: TObject; var Value: String);
    procedure QRDBText1Print(sender: TObject; var Value: String);
    procedure QuickRepEndPage(Sender: TCustomQuickRep);
  private

  public

  end;

var
  RepBill: TRepBill;

implementation

uses FrooshDM, Routins, ProVar;

{$R *.DFM}

procedure TRepBill.QRLabel3Print(sender: TObject; var Value: String);
begin
     QRDBText2.Font.Style:=[fsBold,fsItalic];
end;

procedure TRepBill.QRDBText9Print(sender: TObject; var Value: String);
begin
     IF Frodm.AcbillBes.Value = 0 Then
      QrDbtext2.Caption:=BillString(Frodm.AcbillAckod.AsFloat)
     Else
      QrDbtext2.Caption:='             '+BillString(Frodm.AcbillAckod.AsFloat);
end;

procedure TRepBill.QRDBText1Print(sender: TObject; var Value: String);
begin
     qrshape5.Size.Height:=Qrsubdetail1.Size.Height+2*Qrsubdetail1.Expanded;
     qrshape6.Size.Height:=Qrsubdetail1.Size.Height+2*Qrsubdetail1.Expanded;
     qrshape7.Size.Height:=Qrsubdetail1.Size.Height+2*Qrsubdetail1.Expanded;
     qrshape8.Size.Height:=Qrsubdetail1.Size.Height+2*Qrsubdetail1.Expanded;
     qrshape16.Size.Height:=Qrsubdetail1.Size.Height+2*Qrsubdetail1.Expanded;
     qrshape15.Size.Height:=Qrsubdetail1.Size.Height+2*Qrsubdetail1.Expanded;
end;

procedure TRepBill.QuickRepEndPage(Sender: TCustomQuickRep);
begin
     QrPrinter.Canvas.MoveTo(QrPrinter.XPos(Page.LeftMargin+QrSubDetail1.Size.Width),
     QrPrinter.Canvas.PenPos.Y);
     QrPrinter.Canvas.Pen.Width:=1;
     QrPrinter.Canvas.LineTo(QrPrinter.XPos(Page.LeftMargin),QrPrinter.Canvas.PenPos.Y);
end;

end.
