unit RepMaliT;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TMTarazRep = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    TitleBand1: TQRBand;
    SummaryBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    SDat: TQRLabel;
    EDat: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRDBText1: TQRDBText;
    QRShape1: TQRShape;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    SBesRem: TQRLabel;
    SBedRem: TQRLabel;
    procedure QRDBText4Print(sender: TObject; var Value: String);
    procedure QRDBText3Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  MTarazRep: TMTarazRep;

implementation

uses FrooshDM, ProVar, Routins;

{$R *.DFM}

procedure TMTarazRep.QRDBText4Print(sender: TObject; var Value: String);
begin
     IF Frodm.MaliBed.Value = 0 Then
      QRDBText1.Font.Style:=[fsBold,fsItalic]
     Else
      QRDBText1.Font.Style:=[];
end;

procedure TMTarazRep.QRDBText3Print(sender: TObject; var Value: String);
begin
     IF Frodm.MaliBes.Value = 0 Then
      QRDBText2.Font.Style:=[fsBold,fsItalic]
     Else
      QRDBText2.Font.Style:=[];
end;

end.
