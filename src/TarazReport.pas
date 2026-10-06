unit TarazReport;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables;

type
  TTarazRep = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRBand2: TQRBand;
    QRDBText4: TQRDBText;
    QRLabel2: TQRLabel;
    ChildBand1: TQRChildBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRLabel8: TQRLabel;
    BedSum: TQRLabel;
    BesSum: TQRLabel;
    SbedRem: TQRLabel;
    SbesRem: TQRLabel;
    logo: TQRImage;
    qrTit: TQRLabel;
    qrTit2: TQRLabel;
    QRLabel9: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel18: TQRLabel;
    qrCost: TQRLabel;
    QRLabel19: TQRLabel;
    qrCent: TQRLabel;
    QRImage1: TQRImage;
    procedure QRLabel1Print(sender: TObject; var Value: String);
    procedure QuickRepEndPage(Sender: TCustomQuickRep);
    procedure QRLabel8Print(sender: TObject; var Value: String);
    procedure QRLabel9Print(sender: TObject; var Value: String);
  private

  public
    Cap:String;

  end;

var
  TarazRep: TTarazRep;

implementation

uses FrooshDM, ProVar, Taraz, Routins, CRoutins,Dialogs;

{$R *.DFM}

procedure TTarazRep.QRLabel1Print(sender: TObject; var Value: String);
begin
//     If Not bmpP1.Empty Then Logo.Picture.Bitmap:=bmpP1;
     qrTit.Caption:=InvoLbl;
     QrTit2.Caption:=BarNamLbl;
end;

procedure TTarazRep.QuickRepEndPage(Sender: TCustomQuickRep);
begin
     QrPrinter.Canvas.MoveTo(QrPrinter.XPos(Page.LeftMargin+QrSubDetail1.Size.Width),
     QrPrinter.Canvas.PenPos.Y);
     QrPrinter.Canvas.Pen.Width:=1;
     QrPrinter.Canvas.LineTo(QrPrinter.XPos(Page.LeftMargin),QrPrinter.Canvas.PenPos.Y);
end;

procedure TTarazRep.QRLabel8Print(sender: TObject; var Value: String);
begin
     Qu.SQL.Clear;
     Qu.SQL.Add('SELECT SUM(Bedeh),SUM(Bestan),SUM(BedRem),SUM(BesRem)');
     Qu.Sql.Add('FROM '+Frodm.GarDesh.TableName);
     ShowMessage(QU.SQL.Text);
     Qu.Active :=True;
     TarazRep.BedSum.Caption :=CurrToFar_Arzi(Qu.Fields[0].AsCurrency,Cap);
     TarazRep.BesSum.Caption :=CurrToFar_Arzi(Qu.Fields[1].AsCurrency,Cap);
     TarazRep.SbedRem.Caption :=CurrToFar_Arzi(Qu.Fields[2].AsCurrency,Cap);
     TarazRep.SBesRem.Caption :=CurrToFar_Arzi(Qu.Fields[3].AsCurrency,Cap);
     Qu.Active:=False;
end;

procedure TTarazRep.QRLabel9Print(sender: TObject; var Value: String);
begin
     QrLabel4.Caption:='ÈÏå˜ÇÑ'+'('+Cap+')';
     QrLabel3.Caption:='ÈÓÊÇä˜ÇÑ'+'('+Cap+')';
     QrLabel6.Caption:='ãÇäÏå ÈÏå˜ÇÑ'+'('+Cap+')';
     QrLabel7.Caption:='ãÇäÏå ÈÓÊÇä˜ÇÑ'+'('+Cap+')';
end;
{
If Qu.Fields[0].Value > 0 Then
If Qu.Fields[1].Value > 0 Then
If Qu.Fields[2].Value > 0 Then
If Qu.Fields[3].Value > 0 Then
}
end.
