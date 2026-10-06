unit TGoods;

interface
Uses Windows,Db,DbTables,Classes,ProVar,FrooshDM,Dialogs,sysUtils;

Type
 TGood =Class
 Private
   FName:String;
   FProp1:String;
   FISBN:String;
   FUnit:String;
   FProp2:String;
   FProp3:String;
   Fkod:Integer;
   FGene:Integer;
   FPKh:Currency;
   FPFro:Currency;
   FFdp:Boolean;
   FRQuant:Real;
   FPerc:Real;
   FDataBase:String;
   Qu:TQuery;
   Procedure ClearResults;
   Procedure SetName(Value:String);
   Procedure SetCode(Value:Integer);
   Function GetDataBase:String;
   Procedure SetDataBase(Value:String);
 Public
   Constructor Create(AOwner: TComponent);
   Destructor  Destroy;override;
   Property CurrDataBase:String Read GetDataBase Write SetDataBase;
   Property Name:String Read FName Write SetName;
   Property Code:Integer Read Fkod Write SetCode;
   Property Prop1:String Read FProp1;
   Property Units:String Read FUnit;
   Property BarCode:String Read FISBN;
   Property Gene:Integer Read FGene;
   Property BuyPrice:Currency Read FPKh;
   Property SoldPrice:Currency Read FPFro;
   Property Depoted:Boolean Read FFdp;
   Property Minimum:Real Read FRQuant;
   Property Perc:Real Read FPerc;
   Property IsService:Boolean Read FFdp;
 End;
implementation

{ TGood }

procedure TGood.ClearResults;
begin
  FName:=Null;
  FProp1:=Null;
  FProp2:=Null;
  FProp3:=Null;
  FUnit:=Null;
  FKod :=Null;
  FISBN:=Null;
  FGene:=Null;
  FPkh:= Null;
  FPfro:=Null;
  FFDp:=Null;
  FPerc:=Null;
  FRQuant:=Null;

end;

constructor TGood.Create(AOwner: TComponent);
begin
  CurrDataBase:=CurrDb;
  Qu:=TQuery.Create(AOwner);
  Qu.DatabaseName:=CurrDataBase;
end;

destructor TGood.Destroy;
begin
  Qu.Destroy;
  inherited;
end;

function TGood.GetDataBase: String;
begin
  Result:=FDataBase;
end;

procedure TGood.SetCode(Value: Integer);
begin
  FKod:=Value;
  Qu.DataBaseName:=FDataBase;
  Qu.SQL.Clear;
  Qu.SQL.Add('Select * From Goods Where Kod=:k');
  Qu.Params[0].Value:=FKod;
  Qu.Open;
  FName:=Qu.Fields[1].AsString;
  FProp1:=Qu.Fields[13].AsString;
  FUnit:=Qu.Fields[2].AsString;
  Case sPerc Of
   False: FPKh:=Qu.Fields[7].AsCurrency;
   True : FPKh:=Qu.Fields[8].AsCurrency;
  End;
  FPFro:=Qu.Fields[8].AsCurrency;
  FGene:=Qu.Fields[9].AsInteger;
  FFdp:=Qu.Fields[12].AsBoolean;
  FISBN:=Qu.Fields[17].AsString;
  FProp2:=Qu.Fields[14].AsString;
  FProp3:=Qu.Fields[15].AsString;
  FRQuant:=Qu.Fields[10].AsFloat;
  //FPerc:=Qu.Fields[11].AsFloat;
  Qu.Close;
end;

procedure TGood.SetDataBase(Value: String);
begin
  FDataBase:=Value;
end;

procedure TGood.SetName(Value: String);
begin
  FName:=Value;
  Qu.DataBaseName:=FDataBase;
  Qu.SQL.Clear;
  Qu.SQL.Add('Select * From Goods Where Nam=:k');
  Qu.Params[0].Value:=FName;
  Qu.Open;
  FKod:=Qu.Fields[6].AsInteger;
  FProp1:=Qu.Fields[13].AsString;
  FUnit:=Qu.Fields[2].AsString;
  Case sPerc Of
   False: FPKh:=Qu.Fields[7].AsCurrency;
   True : FPKh:=Qu.Fields[8].AsCurrency;
  End;
  FPFro:=Qu.Fields[8].AsCurrency;
  FGene:=Qu.Fields[9].AsInteger;
  FFdp:=Qu.Fields[12].AsBoolean;
  FISBN:=Qu.Fields[17].AsString;
  FProp2:=Qu.Fields[14].AsString;
  FProp3:=Qu.Fields[15].AsString;
  FRQuant:=Qu.Fields[10].AsFloat;
  FPerc:=Qu.Fields[11].AsFloat;
  Qu.Close;
end;

end.
