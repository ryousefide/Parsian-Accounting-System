unit UInvoiceCalculator;

interface

uses
  DB, SysUtils, Forms;

type
  { TInvoiceCalculator: A clean class to handle invoice math independently of the UI }
  TInvoiceCalculator = class
  private
    FDataSet: TDataSet;
    FIsMultiCurrency: Boolean;
    FCalculateDiscount: Boolean;
  public
    constructor Create(ADataSet: TDataSet; AIsMultiCurrency, ACalculateDiscount: Boolean);
    
    // Using 'out' parameters to return multiple calculated values cleanly
    procedure Calculate(out TotalAmount, NetAmount, DiscountAmount: Currency);
  end;

implementation

{ TInvoiceCalculator }

constructor TInvoiceCalculator.Create(ADataSet: TDataSet; AIsMultiCurrency, ACalculateDiscount: Boolean);
begin
  FDataSet := ADataSet;
  FIsMultiCurrency := AIsMultiCurrency;
  FCalculateDiscount := ACalculateDiscount;
end;

procedure TInvoiceCalculator.Calculate(out TotalAmount, NetAmount, DiscountAmount: Currency);
var
  Sum, NSum: Currency;
  Qty, BuyFee, ItemTotal, Rate: Double;
begin
  Sum := 0;
  NSum := 0;
  DiscountAmount := 0;

  if (FDataSet = nil) or (FDataSet.State = dsBrowse) then Exit;

  // Save current position
  FDataSet.DisableControls;
  try
    FDataSet.First;
    while not FDataSet.Eof do
    begin
      Qty := FDataSet.FieldByName('Quant').AsFloat;
      BuyFee := FDataSet.FieldByName('Bfee').AsFloat;
      ItemTotal := FDataSet.FieldByName('PTotal').AsFloat;

      // The core difference handled cleanly with a simple condition
      if FIsMultiCurrency then
        Rate := FDataSet.FieldByName('Anbkod').AsFloat // Used as currency rate here
      else
        Rate := 1.0;

      Sum := Sum + (BuyFee * Qty * Rate);
      NSum := NSum + (ItemTotal * Rate);

      FDataSet.Next;
    end;
  finally
    FDataSet.EnableControls; // Restores UI smoothly
  end;

  TotalAmount := Sum;
  NetAmount := NSum;
  
  if FCalculateDiscount then
    DiscountAmount := Sum - NSum;
end;

end.