unit RepAnbP;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls,Dialogs;

type
  TAnbPRep = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    qrDat: TQRLabel;
    QRLabel3: TQRLabel;
    QRExpr1: TQRExpr;
    ChildBand1: TQRChildBand;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    qrTit: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    SummaryBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel8: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    procedure QRDBText1Print(sender: TObject; var Value: String);
    procedure QuickRepEndPage(Sender: TCustomQuickRep);
  private

  public

  end;

var
  AnbPRep: TAnbPRep;

implementation

uses FrooshDM, ProVar, AnbP;

{$R *.DFM}

procedure TAnbPRep.QRDBText1Print(sender: TObject; var Value: String);
begin
     QrDbText1.Font:=FFont;
     QrDbText6.Font:=FFont;
     IF (Frodm.CardexAnb.IsNull and Frodm.CardexFee.IsNull) Then
     Begin
       QrDbText1.Font.Style:=[fsBold];
       QrDbText6.Font.Style:=[fsBold];
     End;
end;

procedure TAnbPRep.QuickRepEndPage(Sender: TCustomQuickRep);
begin
     QrPrinter.Canvas.MoveTo(QrPrinter.XPos(Page.LeftMargin+QrSubDetail1.Size.Width)
     ,QrPrinter.Canvas.PenPos.Y);
     QrPrinter.Canvas.Pen.Width:=1;
//     QrPrinter.Canvas.TextOut(QrPrinter.Canvas.PenPos.X,QrPrinter.Canvas.PenPos.Y,'Test');
     QrPrinter.Canvas.LineTo(QrPrinter.XPos(Page.LeftMargin),QrPrinter.Canvas.PenPos.Y);
end;

end.
