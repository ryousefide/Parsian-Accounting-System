unit RepTols;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TTolsRep = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel13: TQRLabel;
    QRExpr1: TQRExpr;
    qrTit: TQRLabel;
    logo: TQRImage;
    qrTit2: TQRLabel;
    ChildBand2: TQRChildBand;
    QRLabel1: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    SDat: TQRLabel;
    EDat: TQRLabel;
    QRLabel12: TQRLabel;
    Cust: TQRLabel;
    ChildBand1: TQRChildBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRShape2: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape9: TQRShape;
    QRShape12: TQRShape;
    QRLabel11: TQRLabel;
    QRShape3: TQRShape;
    QRSubDetail1: TQRSubDetail;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText8: TQRDBText;
    qrRadif: TQRLabel;
    L7: TQRShape;
    L5: TQRShape;
    L4: TQRShape;
    L2: TQRShape;
    L3: TQRShape;
    L8: TQRShape;
    L1: TQRShape;
    procedure QRDBText9Print(sender: TObject; var Value: String);
    procedure qrRadifPrint(sender: TObject; var Value: String);
    procedure QuickRepEndPage(Sender: TCustomQuickRep);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public
   I:Integer;

  end;

var
  TolsRep: TTolsRep;

implementation

uses ProVar, Routins, Tols;

{$R *.DFM}

procedure TTolsRep.QRDBText9Print(sender: TObject; var Value: String);
begin
     I:=I+1;
     qrRadif.Caption:=IntToStr(I);
end;

procedure TTolsRep.qrRadifPrint(sender: TObject; var Value: String);
Var
Hei:Extended;
begin
     Hei:=Qrsubdetail1.Size.Height+Qrsubdetail1.Expanded;
     L1.Size.Height:=Hei;
     L2.Size.Height:=Hei;
     L3.Size.Height:=Hei;
     L4.Size.Height:=Hei;
     L5.Size.Height:=Hei;
     L7.Size.Height:=Hei;
     L8.Size.Height:=Hei;
end;

procedure TTolsRep.QuickRepEndPage(Sender: TCustomQuickRep);
begin
     QrPrinter.Canvas.MoveTo(QrPrinter.XPos(Page.LeftMargin+QrSubDetail1.Size.Width),
     QrPrinter.Canvas.PenPos.Y);
     QrPrinter.Canvas.Pen.Width:=1;
     QrPrinter.Canvas.LineTo(QrPrinter.XPos(Page.LeftMargin),QrPrinter.Canvas.PenPos.Y);
end;

procedure TTolsRep.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
     I:=0;
end;

end.
