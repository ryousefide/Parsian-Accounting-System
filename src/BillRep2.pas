unit BillRep2;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables;

type
  TRepBill2 = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    ChildBand1: TQRChildBand;
    QRLabel7: TQRLabel;
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
    QRShape8: TQRShape;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    SummaryBand1: TQRBand;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    ChildBand2: TQRChildBand;
    QRLabel18: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel2: TQRLabel;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape15: TQRShape;
    QRLabel24: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel12: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel11: TQRLabel;
    QRShape13: TQRShape;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    TAc: TTable;
    TAcRadif: TIntegerField;
    TAcKol: TIntegerField;
    TAcAcKod: TFloatField;
    TAcCKod: TIntegerField;
    TAcCName: TStringField;
    TAcCost: TStringField;
    TAcAcName: TStringField;
    TAcDes: TStringField;
    TAcPrice: TCurrencyField;
    TAcBed: TCurrencyField;
    TAcBes: TCurrencyField;
    TAcBKod: TIntegerField;
    TAcNo: TIntegerField;
    TAcMo: TIntegerField;
    QRLabel13: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRShape14: TQRShape;
    QRShape16: TQRShape;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRExpr1: TQRExpr;
    TAcTaf: TIntegerField;
    TAcJos: TIntegerField;
    QRShape17: TQRShape;
    QRShape7: TQRShape;
    ChildBand3: TQRChildBand;
    QRLabel17: TQRLabel;
    QRDBText11: TQRDBText;
    procedure QRDBText1Print(sender: TObject; var Value: String);
    procedure QuickRepEndPage(Sender: TCustomQuickRep);
    procedure QRDBText16Print(sender: TObject; var Value: String);
    procedure QRDBText3Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  RepBill2: TRepBill2;

implementation

uses FrooshDM, Routins, ProVar;

{$R *.DFM}

procedure TRepBill2.QRDBText1Print(sender: TObject; var Value: String);
begin
     qrshape5.Size.Height:=Qrsubdetail1.Size.Height+Qrsubdetail1.Expanded;
     qrshape6.Size.Height:=Qrsubdetail1.Size.Height+Qrsubdetail1.Expanded;
     qrshape7.Size.Height:=Qrsubdetail1.Size.Height+Qrsubdetail1.Expanded;
     qrshape8.Size.Height:=Qrsubdetail1.Size.Height+Qrsubdetail1.Expanded;
     qrshape13.Size.Height:=Qrsubdetail1.Size.Height+Qrsubdetail1.Expanded;
     qrshape17.Size.Height:=Qrsubdetail1.Size.Height+Qrsubdetail1.Expanded;
     qrshape15.Size.Height:=Qrsubdetail1.Size.Height+Qrsubdetail1.Expanded;
end;

procedure TRepBill2.QuickRepEndPage(Sender: TCustomQuickRep);
begin
     QrPrinter.Canvas.MoveTo(QrPrinter.XPos(Page.LeftMargin+QrSubDetail1.Size.Width),
     QrPrinter.Canvas.PenPos.Y);
     QrPrinter.Canvas.Pen.Width:=1;
     QrPrinter.Canvas.LineTo(QrPrinter.XPos(Page.LeftMargin),QrPrinter.Canvas.PenPos.Y);
end;

procedure TRepBill2.QRDBText16Print(sender: TObject; var Value: String);
begin
     QRDBText13.Enabled:=TACPrice.IsNull Or (TACCkod.AsInteger =-1);
     QRDBText13.Font.Style:=[fsBold,fsUnderline,fsItalic];
     QRDBText13.Font.Size:=QRDBText13.Font.Size+1;
     QRDBText9.Enabled:=TACPrice.IsNull;
     QRExpr1.Enabled:=Not TACPrice.IsNull;
end;

procedure TRepBill2.QRDBText3Print(sender: TObject; var Value: String);
begin
     QRDBText13.Font.Style:=[fsBold];
     QRDBText13.Font.Size:=QRDBText13.Font.Size-1;
     QRDBText1.Font.Size:=QRDBText13.Font.Size-3;
     QRDBText15.Font.Size:=QRDBText13.Font.Size-5;
     QRDBText1.Font.Style:=[];
     QRDBText9.Enabled:=False;
     QRExpr1.Enabled:=True;
end;

end.
