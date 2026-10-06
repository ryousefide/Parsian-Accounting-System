unit GardeshRep;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables;

type
  TGReport = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    ChildBand1: TQRChildBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRSubDetail1: TQRSubDetail;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRBand3: TQRBand;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRLabel2: TQRLabel;
    AccNam: TQRLabel;
    QRLabel8: TQRLabel;
    QRExpr1: TQRExpr;
    QRDBText1: TQRDBText;
    QRShape5: TQRShape;
    QRLabel9: TQRLabel;
    QRShape6: TQRShape;
    qrTash: TQRLabel;
    QRLabel10: TQRLabel;
    qrTash2: TQRLabel;
    qrTit: TQRLabel;
    logo: TQRImage;
    qrTit2: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    SDat: TQRLabel;
    EDat: TQRLabel;
    QRImage1: TQRImage;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRLabel13: TQRLabel;
    QRShape9: TQRShape;
    QRLabel14: TQRLabel;
    QRShape10: TQRShape;
    QRDBText7: TQRDBText;
    qrRadif: TQRLabel;
    ChildBand2: TQRChildBand;
    PageFooterBand1: TQRBand;
    QRLabel15: TQRLabel;
    QRExpr2: TQRExpr;
    qRem2: TQRLabel;
    qBes2: TQRLabel;
    qBed2: TQRLabel;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRLabel16: TQRLabel;
    qRem: TQRLabel;
    qBes: TQRLabel;
    qBed: TQRLabel;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRLabel17: TQRLabel;
    qrem1: TQRLabel;
    qbes1: TQRLabel;
    qBed1: TQRLabel;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRLabel18: TQRLabel;
    qrCost: TQRLabel;
    QRLabel19: TQRLabel;
    qrCent: TQRLabel;
    procedure QRDBText2Print(sender: TObject; var Value: String);
    procedure QRDBText1Print(sender: TObject; var Value: String);
    procedure QRLabel1Print(sender: TObject; var Value: String);
    procedure QRDBText6Print(sender: TObject; var Value: String);
    procedure QRLabel16Print(sender: TObject; var Value: String);
    procedure QRLabel15Print(sender: TObject; var Value: String);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QuickRepEndPage(Sender: TCustomQuickRep);
  private

  public
    SBed,SBes:Currency;
    Cap:String;
  end;

var
  GReport: TGReport;

implementation

uses FrooshDM, ProVar,Dialogs, Routins, CRoutins;

{$R *.DFM}

procedure TGReport.QRDBText2Print(sender: TObject; var Value: String);
begin
     If QrSubDetail1.DataSet.FieldByName('Baghi').AsCurrency >= 0 Then
      qrTash.Caption:=sDr
     Else
      qrTash.Caption:=sCr;
     qrRadif.Caption:=IntToStr(QrSubDetail1.DataSet.RecNo);
     qrshape21.Size.Height:=Qrsubdetail1.Size.Height+Qrsubdetail1.Expanded;
     qrshape20.Size.Height:=Qrsubdetail1.Size.Height+Qrsubdetail1.Expanded;
     qrshape19.Size.Height:=Qrsubdetail1.Size.Height+Qrsubdetail1.Expanded;
     qrshape18.Size.Height:=Qrsubdetail1.Size.Height+Qrsubdetail1.Expanded;
     qrshape6.Size.Height:=Qrsubdetail1.Size.Height+Qrsubdetail1.Expanded;
     qrshape7.Size.Height:=Qrsubdetail1.Size.Height+Qrsubdetail1.Expanded;
     qrshape10.Size.Height:=Qrsubdetail1.Size.Height+Qrsubdetail1.Expanded;
end;


procedure TGReport.QRDBText1Print(sender: TObject; var Value: String);
begin
     If QrSubDetail1.DataSet.FieldByName('Baghi').AsCurrency >= 0 Then
      qrTash2.Caption:=sDr
     Else
      qrTash2.Caption:=sCr;
end;

procedure TGReport.QRLabel1Print(sender: TObject; var Value: String);
begin
//     If Not bmpP1.Empty Then Logo.Picture.Bitmap:=bmpP1;
     qrTit.Caption:=InvoLbl;
     QrTit2.Caption:=BarNamLbl;
     QrLabel6.Caption:='';
     QrLabel5.Caption:='';
     If CUser.Lang = 'EN' Then
     Begin
      QrLabel6.Caption:=LoadStr(QrLabel6.HelpContext)+'('+Cap+')';
      QrLabel5.Caption:=LoadStr(QrLabel5.HelpContext)+'('+Cap+')';
     End Else Begin
      QrLabel6.Caption:=QrLabel6.Caption+'('+Cap+')';
      QrLabel5.Caption:=QrLabel5.Caption+'('+Cap+')';
     End;
end;

procedure TGReport.QRDBText6Print(sender: TObject; var Value: String);
begin
     SBed:=SBed+QRDBText4.DataSet.FieldByName('Bedeh').AsCurrency;
     SBes:=SBes+QRDBText4.DataSet.FieldByName('Bestan').AsCurrency;
end;

procedure TGReport.QRLabel16Print(sender: TObject; var Value: String);
begin
     qBed.Caption:=CurrToFar_Arzi(SBed,Cap);
     qBes.Caption:=CurrToFar_Arzi(SBes,Cap);
     qRem.Caption:=CurrToFar_Arzi(SBed-SBes,Cap);
     qBed1.Caption:=CurrToFar_Arzi(SBed,Cap);
     qBes1.Caption:=CurrToFar_Arzi(SBes,Cap);
     qRem1.Caption:=CurrToFar_Arzi(SBed-SBes,Cap);
end;

procedure TGReport.QRLabel15Print(sender: TObject; var Value: String);
begin
     qBed2.Caption:=CurrToFar_Arzi(SBed,Cap);
     qBes2.Caption:=CurrToFar_Arzi(SBes,Cap);
     qRem2.Caption:=CurrToFar_Arzi(SBed-SBes,Cap);
end;

procedure TGReport.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
     sBed:=0;Sbes:=0;
end;

procedure TGReport.QuickRepEndPage(Sender: TCustomQuickRep);
begin
     QrPrinter.Canvas.MoveTo(QrPrinter.XPos(Page.LeftMargin+QrSubDetail1.Size.Width),
     QrPrinter.Canvas.PenPos.Y);
     QrPrinter.Canvas.Pen.Width:=1;
     QrPrinter.Canvas.LineTo(QrPrinter.XPos(Page.LeftMargin),QrPrinter.Canvas.PenPos.Y);
end;

end.
