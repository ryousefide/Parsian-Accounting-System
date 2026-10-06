object FroDM: TFroDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 463
  Top = 21
  Height = 812
  Width = 868
  object Invo: TTable
    BeforeEdit = InvoBeforeEdit
    AfterPost = InvoAfterPost
    BeforeDelete = InvoBeforeDelete
    OnPostError = Far_PostErr
    AutoRefresh = True
    DatabaseName = 'ParFro'
    SessionName = 'Default'
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'No'
        DataType = ftInteger
      end
      item
        Name = 'Tel'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Dat'
        DataType = ftInteger
      end
      item
        Name = 'Adr'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'Nam'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Pkol'
        DataType = ftCurrency
      end
      item
        Name = 'Pdis'
        DataType = ftCurrency
      end
      item
        Name = 'Pnet'
        DataType = ftCurrency
      end
      item
        Name = 'Ppay'
        DataType = ftCurrency
      end
      item
        Name = 'Prem'
        DataType = ftCurrency
      end
      item
        Name = 'Pcheq'
        DataType = ftCurrency
      end
      item
        Name = 'Bkod'
        Attributes = [faRequired]
        DataType = ftBoolean
      end
      item
        Name = 'LPerm'
        Attributes = [faRequired]
        DataType = ftBoolean
      end
      item
        Name = 'Eco'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Visit'
        DataType = ftInteger
      end
      item
        Name = 'Bno'
        DataType = ftInteger
      end
      item
        Name = 'Prule'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Cost'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Ckod'
        DataType = ftInteger
      end
      item
        Name = 'RefNo'
        DataType = ftInteger
      end
      item
        Name = 'Ptax'
        DataType = ftCurrency
      end>
    StoreDefs = True
    TableName = 'dbo.Invoice'
    Left = 78
    Top = 56
    object InvoId: TAutoIncField
      FieldName = 'Id'
      Visible = False
    end
    object InvoNo: TIntegerField
      FieldName = 'No'
    end
    object InvoTel: TStringField
      DisplayWidth = 20
      FieldName = 'Tel'
    end
    object InvoDat: TIntegerField
      Alignment = taLeftJustify
      DisplayWidth = 10
      FieldName = 'Dat'
      DisplayFormat = '####/##/##'
      EditFormat = '####/##/##'
    end
    object InvoAdd: TStringField
      Alignment = taRightJustify
      DisplayWidth = 200
      FieldName = 'Adr'
      Size = 200
    end
    object InvoNam: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Œ—Ìœ«—'
      DisplayWidth = 24
      FieldName = 'Nam'
      Required = True
      Size = 45
    end
    object InvoPkol: TCurrencyField
      Alignment = taLeftJustify
      DisplayWidth = 10
      FieldName = 'Pkol'
    end
    object InvoPdis: TCurrencyField
      Alignment = taLeftJustify
      DisplayWidth = 10
      FieldName = 'Pdis'
    end
    object InvoPnet: TCurrencyField
      Alignment = taLeftJustify
      DisplayWidth = 10
      FieldName = 'Pnet'
    end
    object InvoPpay: TCurrencyField
      Alignment = taLeftJustify
      DisplayWidth = 10
      FieldName = 'Ppay'
    end
    object InvoPrem: TCurrencyField
      Alignment = taLeftJustify
      DisplayWidth = 10
      FieldName = 'Prem'
    end
    object InvoPcheq: TCurrencyField
      Alignment = taLeftJustify
      DisplayWidth = 10
      FieldName = 'Pcheq'
    end
    object InvoBkod: TBooleanField
      DisplayWidth = 5
      FieldName = 'Bkod'
    end
    object InvoPerm: TBooleanField
      DefaultExpression = #39'False'#39
      DisplayWidth = 5
      FieldName = 'LPerm'
    end
    object InvoEco: TStringField
      DisplayWidth = 20
      FieldName = 'Eco'
    end
    object InvoVisit: TIntegerField
      DisplayWidth = 10
      FieldName = 'Visit'
    end
    object InvoBno: TIntegerField
      FieldName = 'Bno'
    end
    object InvoPRule: TStringField
      FieldName = 'PRule'
      Size = 30
    end
    object InvoCost: TStringField
      FieldName = 'Cost'
      Size = 45
    end
    object InvoCkod: TIntegerField
      FieldName = 'Ckod'
    end
    object InvoRefNo: TIntegerField
      FieldName = 'RefNo'
    end
    object InvoPtax: TCurrencyField
      FieldName = 'Ptax'
    end
  end
  object InvoGood: TTable
    BeforePost = InvoGoodBeforePost
    OnPostError = Far_PostErr
    AutoRefresh = True
    DatabaseName = 'ParFro'
    SessionName = 'Default'
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'Radif'
        DataType = ftInteger
      end
      item
        Name = 'Kod'
        DataType = ftInteger
      end
      item
        Name = 'Nam'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Color'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'AnbNam'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'AnbKod'
        DataType = ftFloat
      end
      item
        Name = 'Quant'
        DataType = ftFloat
      end
      item
        Name = 'Unit'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Pfee'
        DataType = ftCurrency
      end
      item
        Name = 'Perc'
        DataType = ftFloat
      end
      item
        Name = 'Ptotal'
        DataType = ftCurrency
      end
      item
        Name = 'Delikod'
        DataType = ftBoolean
      end
      item
        Name = 'Reject'
        DataType = ftFloat
      end
      item
        Name = 'No'
        DataType = ftInteger
      end
      item
        Name = 'Dat'
        DataType = ftInteger
      end
      item
        Name = 'Serial'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Garan'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Prop'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'OPfee'
        DataType = ftCurrency
      end
      item
        Name = 'OPSum'
        DataType = ftCurrency
      end
      item
        Name = 'Qout'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'PK_Invogood'
        Fields = 'Id'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = '_WA_Sys_No_1B0907CE'
        Fields = 'No'
      end
      item
        Name = '_WA_Sys_Radif_1B0907CE'
        Fields = 'Radif'
      end
      item
        Name = '_WA_Sys_Kod_1B0907CE'
        Fields = 'Kod'
      end
      item
        Name = '_WA_Sys_Nam_1B0907CE'
        Fields = 'Nam'
      end
      item
        Name = '_WA_Sys_Color_1B0907CE'
        Fields = 'Color'
      end
      item
        Name = '_WA_Sys_AnbNam_1B0907CE'
        Fields = 'AnbNam'
      end
      item
        Name = '_WA_Sys_AnbKod_1B0907CE'
        Fields = 'AnbKod'
      end
      item
        Name = '_WA_Sys_Quant_1B0907CE'
        Fields = 'Quant'
      end
      item
        Name = '_WA_Sys_Unit_1B0907CE'
        Fields = 'Unit'
      end
      item
        Name = '_WA_Sys_Pfee_1B0907CE'
        Fields = 'Pfee'
      end
      item
        Name = '_WA_Sys_Perc_1B0907CE'
        Fields = 'Perc'
      end
      item
        Name = '_WA_Sys_Ptotal_1B0907CE'
        Fields = 'Ptotal'
      end
      item
        Name = '_WA_Sys_Delikod_1B0907CE'
        Fields = 'Delikod'
      end
      item
        Name = '_WA_Sys_Reject_1B0907CE'
        Fields = 'Reject'
      end
      item
        Name = '_WA_Sys_Dat_1B0907CE'
        Fields = 'Dat'
      end
      item
        Name = '_WA_Sys_Serial_1B0907CE'
        Fields = 'Serial'
      end
      item
        Name = '_WA_Sys_Garan_1B0907CE'
        Fields = 'Garan'
      end
      item
        Name = '_WA_Sys_Prop_1B0907CE'
        Fields = 'Prop'
      end
      item
        Name = '_WA_Sys_OPfee_1B0907CE'
        Fields = 'OPfee'
      end
      item
        Name = '_WA_Sys_OPSum_1B0907CE'
        Fields = 'OPSum'
      end>
    StoreDefs = True
    TableName = 'dbo.Invogood'
    Left = 134
    Top = 56
    object InvoGoodId: TAutoIncField
      FieldName = 'Id'
      ReadOnly = True
      Visible = False
    end
    object InvoGoodRadif: TIntegerField
      FieldName = 'Radif'
    end
    object InvoGoodKod: TIntegerField
      FieldName = 'Kod'
    end
    object InvoGoodNam: TStringField
      FieldName = 'Nam'
      Size = 100
    end
    object InvoGoodColor: TStringField
      FieldName = 'Color'
      Size = 45
    end
    object InvoGoodAnbNam: TStringField
      FieldName = 'AnbNam'
      Size = 45
    end
    object InvoGoodAnbKod: TFloatField
      DefaultExpression = #39'0'#39
      FieldName = 'AnbKod'
    end
    object InvoGoodQuant: TFloatField
      FieldName = 'Quant'
    end
    object InvoGoodUnit: TStringField
      FieldKind = fkLookup
      FieldName = 'Unit'
      LookupDataSet = Good
      LookupKeyFields = 'Kod'
      LookupResultField = 'Unit'
      KeyFields = 'Kod'
      Lookup = True
    end
    object InvoGoodPfee: TCurrencyField
      Alignment = taLeftJustify
      FieldName = 'Pfee'
    end
    object InvoGoodPerc: TFloatField
      DefaultExpression = #39'0'#39
      FieldName = 'Perc'
      DisplayFormat = '#.##%'
    end
    object InvoGoodPtotal: TCurrencyField
      Alignment = taLeftJustify
      DisplayLabel = 'Ã„⁄ ò·'
      FieldName = 'Ptotal'
    end
    object InvoGoodDelikod: TBooleanField
      DefaultExpression = 'False'
      FieldName = 'Delikod'
    end
    object InvoGoodReject: TFloatField
      DisplayLabel = '„⁄«œ· —Ì«·Ì'
      FieldName = 'Reject'
    end
    object InvoGoodNo: TIntegerField
      FieldName = 'No'
    end
    object InvoGoodDat: TIntegerField
      FieldName = 'Dat'
    end
    object InvoGoodSerial: TStringField
      FieldName = 'Serial'
    end
    object InvoGoodGaran: TStringField
      DisplayLabel = '‰Ê⁄ «—“'
      DisplayWidth = 25
      FieldName = 'Garan'
      Size = 45
    end
    object InvoGoodProp: TStringField
      DisplayLabel = ' Ê÷ÌÕ« '
      DisplayWidth = 40
      FieldName = 'Prop'
      Size = 200
    end
    object InvoGoodOPfee: TCurrencyField
      FieldName = 'OPfee'
    end
    object InvoGoodOPSum: TCurrencyField
      FieldName = 'OPSum'
    end
    object InvoGoodQout: TFloatField
      DefaultExpression = '0'
      FieldName = 'Qout'
    end
  end
  object InvoDs: TDataSource
    AutoEdit = False
    DataSet = Invo
    Left = 104
    Top = 459
  end
  object InvoGoodDs: TDataSource
    AutoEdit = False
    DataSet = InvoGood
    Left = 223
    Top = 459
  end
  object Good: TTable
    Tag = -1
    OnPostError = Far_PostErr
    AutoRefresh = True
    DatabaseName = 'ParFro'
    SessionName = 'Default'
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'Nam'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Unit'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Kol'
        DataType = ftSmallint
      end
      item
        Name = 'Mo'
        DataType = ftSmallint
      end
      item
        Name = 'Taf'
        DataType = ftSmallint
      end
      item
        Name = 'Kod'
        DataType = ftInteger
      end
      item
        Name = 'Pkh'
        DataType = ftCurrency
      end
      item
        Name = 'Pfro'
        DataType = ftCurrency
      end
      item
        Name = 'Gene'
        DataType = ftInteger
      end
      item
        Name = 'Rquant'
        DataType = ftFloat
      end
      item
        Name = 'Bquant'
        DataType = ftFloat
      end
      item
        Name = 'Fdp'
        Attributes = [faRequired]
        DataType = ftBoolean
      end
      item
        Name = 'Prop1'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Prop2'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Prop3'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Prop4'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'ISBN'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Prule'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Flock'
        DataType = ftBoolean
      end>
    IndexDefs = <
      item
        Name = 'PK_Goods'
        Fields = 'Id'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'Goods0'
        Fields = 'Nam'
        Options = [ixUnique]
      end
      item
        Name = '_WA_Sys_Flock_1BFD2C07'
        Fields = 'Flock'
      end
      item
        Name = '_WA_Sys_Fdp_1BFD2C07'
        Fields = 'Fdp'
      end
      item
        Name = '_WA_Sys_Kod_1BFD2C07'
        Fields = 'Kod'
      end
      item
        Name = '_WA_Sys_Kol_1BFD2C07'
        Fields = 'Kol'
      end
      item
        Name = '_WA_Sys_Gene_1BFD2C07'
        Fields = 'Gene'
      end
      item
        Name = '_WA_Sys_Unit_1BFD2C07'
        Fields = 'Unit'
      end
      item
        Name = '_WA_Sys_Mo_1BFD2C07'
        Fields = 'Mo'
      end
      item
        Name = '_WA_Sys_Taf_1BFD2C07'
        Fields = 'Taf'
      end
      item
        Name = '_WA_Sys_Pkh_1BFD2C07'
        Fields = 'Pkh'
      end
      item
        Name = '_WA_Sys_Pfro_1BFD2C07'
        Fields = 'Pfro'
      end
      item
        Name = '_WA_Sys_Rquant_1BFD2C07'
        Fields = 'Rquant'
      end
      item
        Name = '_WA_Sys_Bquant_1BFD2C07'
        Fields = 'Bquant'
      end
      item
        Name = '_WA_Sys_Prop1_1BFD2C07'
        Fields = 'Prop1'
      end
      item
        Name = '_WA_Sys_Prop2_1BFD2C07'
        Fields = 'Prop2'
      end
      item
        Name = '_WA_Sys_Prop3_1BFD2C07'
        Fields = 'Prop3'
      end
      item
        Name = '_WA_Sys_Prop4_1BFD2C07'
        Fields = 'Prop4'
      end
      item
        Name = '_WA_Sys_ISBN_1BFD2C07'
        Fields = 'ISBN'
      end
      item
        Name = '_WA_Sys_Prule_1BFD2C07'
        Fields = 'Prule'
      end>
    IndexFieldNames = 'Id'
    StoreDefs = True
    TableName = 'dbo.Goods'
    Left = 272
    Top = 8
    object GoodId: TAutoIncField
      FieldName = 'Id'
      Visible = False
    end
    object GoodNam: TStringField
      FieldName = 'Nam'
      Size = 100
    end
    object GoodUnit: TStringField
      FieldName = 'Unit'
    end
    object GoodKol: TSmallintField
      FieldName = 'Kol'
    end
    object GoodMo: TSmallintField
      FieldName = 'Mo'
    end
    object GoodTaf: TSmallintField
      FieldName = 'Taf'
    end
    object GoodKod: TIntegerField
      FieldName = 'Kod'
    end
    object GoodPkh: TCurrencyField
      Alignment = taLeftJustify
      FieldName = 'Pkh'
    end
    object GoodPfro: TCurrencyField
      Alignment = taLeftJustify
      FieldName = 'Pfro'
    end
    object GoodGene: TIntegerField
      Alignment = taCenter
      FieldName = 'Gene'
    end
    object GoodRquant: TFloatField
      FieldName = 'Rquant'
    end
    object GoodBquant: TFloatField
      FieldName = 'Bquant'
    end
    object GoodFdp: TBooleanField
      FieldName = 'Fdp'
    end
    object GoodProp1: TStringField
      FieldName = 'Prop1'
      Size = 100
    end
    object GoodProp2: TStringField
      FieldName = 'Prop2'
      Size = 100
    end
    object GoodProp3: TStringField
      FieldName = 'Prop3'
      Size = 100
    end
    object GoodProp4: TStringField
      FieldName = 'Prop4'
      Size = 100
    end
    object GoodISBN: TStringField
      FieldName = 'ISBN'
      Size = 50
    end
    object GoodPrule: TStringField
      FieldName = 'Prule'
      Size = 10
    end
    object GoodFlock: TBooleanField
      DefaultExpression = 'False'
      FieldName = 'Flock'
    end
  end
  object banks: TTable
    OnPostError = Far_PostErr
    AutoRefresh = True
    DatabaseName = 'ParFro'
    SessionName = 'Default'
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'Bnam'
        Attributes = [faRequired]
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Bkod'
        DataType = ftString
        Size = 20
      end>
    StoreDefs = True
    TableName = 'dbo.Banks'
    Left = 190
    Top = 56
    object banksId: TAutoIncField
      FieldName = 'Id'
      Visible = False
    end
    object banksBnam: TStringField
      Alignment = taRightJustify
      FieldName = 'Bnam'
      Size = 45
    end
    object banksBkod: TStringField
      Alignment = taCenter
      FieldName = 'Bkod'
    end
  end
  object BankDs: TDataSource
    AutoEdit = False
    DataSet = banks
    Left = 282
    Top = 459
  end
  object Binvo: TTable
    BeforeEdit = BinvoBeforeEdit
    AfterPost = BinvoAfterPost
    BeforeDelete = BinvoBeforeDelete
    OnPostError = Far_PostErr
    AutoRefresh = True
    DatabaseName = 'ParFro'
    SessionName = 'Default'
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'No'
        DataType = ftInteger
      end
      item
        Name = 'Nam'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Tel'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Dat'
        DataType = ftInteger
      end
      item
        Name = 'Pkol'
        DataType = ftCurrency
      end
      item
        Name = 'Pdis'
        DataType = ftCurrency
      end
      item
        Name = 'Pnet'
        DataType = ftCurrency
      end
      item
        Name = 'LPerm'
        Attributes = [faRequired]
        DataType = ftBoolean
      end
      item
        Name = 'Eco'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Visit'
        DataType = ftInteger
      end
      item
        Name = 'Bno'
        DataType = ftInteger
      end
      item
        Name = 'Prule'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Ppay'
        DataType = ftCurrency
      end
      item
        Name = 'Prem'
        DataType = ftCurrency
      end
      item
        Name = 'Plc'
        DataType = ftCurrency
      end
      item
        Name = 'PGom'
        DataType = ftCurrency
      end
      item
        Name = 'Ptar'
        DataType = ftCurrency
      end
      item
        Name = 'Pdemo'
        DataType = ftCurrency
      end
      item
        Name = 'Pcar'
        DataType = ftCurrency
      end
      item
        Name = 'Poth'
        DataType = ftCurrency
      end
      item
        Name = 'Pcost'
        DataType = ftCurrency
      end
      item
        Name = 'Cost'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Ckod'
        DataType = ftInteger
      end
      item
        Name = 'Refno'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'PK_Bvoice'
        Fields = 'Id'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'dbo.Bvoice'
    Left = 130
    Top = 154
    object BinvoId: TAutoIncField
      FieldName = 'Id'
      Visible = False
    end
    object BinvoNo: TIntegerField
      Alignment = taCenter
      FieldName = 'No'
    end
    object BinvoNam: TStringField
      Alignment = taRightJustify
      FieldName = 'Nam'
      Required = True
      Size = 45
    end
    object BinvoTel: TStringField
      FieldName = 'Tel'
    end
    object BinvoDat: TIntegerField
      ConstraintErrorMessage = 'fkjldkjfldgjldfgjldfjglkfjg'
      FieldName = 'Dat'
      DisplayFormat = '####/##/##'
      EditFormat = '####/##/##'
    end
    object BinvoPkol: TCurrencyField
      Alignment = taLeftJustify
      FieldName = 'Pkol'
    end
    object BinvoPdis: TCurrencyField
      Alignment = taLeftJustify
      FieldName = 'Pdis'
    end
    object BinvoPnet: TCurrencyField
      Alignment = taLeftJustify
      FieldName = 'Pnet'
    end
    object BinvoPerm: TBooleanField
      DefaultExpression = #39'False'#39
      FieldName = 'LPerm'
    end
    object BinvoEco: TStringField
      FieldName = 'Eco'
    end
    object BinvoVisit: TIntegerField
      FieldName = 'Visit'
    end
    object BinvoBno: TIntegerField
      FieldName = 'Bno'
    end
    object BinvoPrule: TStringField
      FieldName = 'Prule'
      Size = 30
    end
    object BinvoPpay: TCurrencyField
      FieldName = 'Ppay'
    end
    object BinvoPrem: TCurrencyField
      FieldName = 'Prem'
    end
    object BinvoPlc: TCurrencyField
      FieldName = 'Plc'
    end
    object BinvoPGom: TCurrencyField
      FieldName = 'PGom'
    end
    object BinvoPtar: TCurrencyField
      FieldName = 'Ptar'
    end
    object BinvoPdemo: TCurrencyField
      FieldName = 'Pdemo'
    end
    object BinvoPCar: TCurrencyField
      FieldName = 'PCar'
    end
    object BinvoPOth: TCurrencyField
      FieldName = 'POth'
    end
    object BinvoPcost: TCurrencyField
      FieldName = 'Pcost'
    end
    object BinvoCost: TStringField
      FieldName = 'Cost'
      Size = 45
    end
    object BinvoCkod: TIntegerField
      FieldName = 'Ckod'
    end
    object BinvoRefNo: TIntegerField
      FieldName = 'RefNo'
    end
  end
  object BinvoDs: TDataSource
    AutoEdit = False
    DataSet = Binvo
    Left = 103
    Top = 411
  end
  object BinvoGood: TTable
    BeforePost = BeforPosting
    OnPostError = Far_PostErr
    AutoRefresh = True
    DatabaseName = 'ParFro'
    SessionName = 'Default'
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'Radif'
        DataType = ftInteger
      end
      item
        Name = 'Kod'
        DataType = ftInteger
      end
      item
        Name = 'Nam'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Color'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Anbnam'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Anbkod'
        DataType = ftFloat
      end
      item
        Name = 'Quant'
        DataType = ftFloat
      end
      item
        Name = 'Unit'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Bfee'
        DataType = ftCurrency
      end
      item
        Name = 'Perc'
        DataType = ftFloat
      end
      item
        Name = 'Ptotal'
        DataType = ftCurrency
      end
      item
        Name = 'No'
        DataType = ftInteger
      end
      item
        Name = 'Bkod'
        Attributes = [faRequired]
        DataType = ftBoolean
      end
      item
        Name = 'Reject'
        DataType = ftFloat
      end
      item
        Name = 'Dat'
        DataType = ftInteger
      end
      item
        Name = 'Pay'
        DataType = ftCurrency
      end
      item
        Name = 'Pfee'
        DataType = ftCurrency
      end
      item
        Name = 'Serial'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Garan'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Prop'
        DataType = ftString
        Size = 200
      end>
    IndexDefs = <
      item
        Name = 'PK_BinvoGood'
        Fields = 'Id'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = '_WA_Sys_Radif_108B795B'
        Fields = 'Radif'
      end
      item
        Name = '_WA_Sys_No_108B795B'
        Fields = 'No'
      end
      item
        Name = '_WA_Sys_Prop_108B795B'
        Fields = 'Prop'
      end
      item
        Name = '_WA_Sys_Garan_108B795B'
        Fields = 'Garan'
      end
      item
        Name = '_WA_Sys_Serial_108B795B'
        Fields = 'Serial'
      end
      item
        Name = '_WA_Sys_Pfee_108B795B'
        Fields = 'Pfee'
      end
      item
        Name = '_WA_Sys_Pay_108B795B'
        Fields = 'Pay'
      end
      item
        Name = '_WA_Sys_Dat_108B795B'
        Fields = 'Dat'
      end
      item
        Name = '_WA_Sys_Reject_108B795B'
        Fields = 'Reject'
      end
      item
        Name = '_WA_Sys_Bkod_108B795B'
        Fields = 'Bkod'
      end
      item
        Name = '_WA_Sys_Ptotal_108B795B'
        Fields = 'Ptotal'
      end
      item
        Name = '_WA_Sys_Perc_108B795B'
        Fields = 'Perc'
      end
      item
        Name = '_WA_Sys_Bfee_108B795B'
        Fields = 'Bfee'
      end
      item
        Name = '_WA_Sys_Unit_108B795B'
        Fields = 'Unit'
      end
      item
        Name = '_WA_Sys_Quant_108B795B'
        Fields = 'Quant'
      end
      item
        Name = '_WA_Sys_Anbkod_108B795B'
        Fields = 'Anbkod'
      end
      item
        Name = '_WA_Sys_Anbnam_108B795B'
        Fields = 'Anbnam'
      end
      item
        Name = '_WA_Sys_Color_108B795B'
        Fields = 'Color'
      end
      item
        Name = '_WA_Sys_Nam_108B795B'
        Fields = 'Nam'
      end
      item
        Name = '_WA_Sys_Kod_108B795B'
        Fields = 'Kod'
      end>
    StoreDefs = True
    TableName = 'dbo.BinvoGood'
    Left = 102
    Top = 107
    object BinvoGoodId: TAutoIncField
      FieldName = 'Id'
      ReadOnly = True
      Visible = False
    end
    object BinvoGoodRadif: TIntegerField
      FieldName = 'Radif'
    end
    object BinvoGoodKod: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'Kod'
    end
    object BinvoGoodNam: TStringField
      FieldName = 'Nam'
      Size = 100
    end
    object BinvoGoodColor: TStringField
      FieldName = 'Color'
    end
    object BinvoGoodAnbNam: TStringField
      FieldName = 'AnbNam'
      Size = 45
    end
    object BinvoGoodAnbkod: TFloatField
      FieldName = 'Anbkod'
    end
    object BinvoGoodQuant: TFloatField
      Alignment = taLeftJustify
      FieldName = 'Quant'
    end
    object BinvoGoodUnit: TStringField
      FieldKind = fkLookup
      FieldName = 'Unit'
      LookupDataSet = Good
      LookupKeyFields = 'Kod'
      LookupResultField = 'Unit'
      KeyFields = 'Kod'
      Lookup = True
    end
    object BinvoGoodBfee: TCurrencyField
      FieldName = 'Bfee'
    end
    object BinvoGoodPerc: TFloatField
      DefaultExpression = #39'0'#39
      FieldName = 'Perc'
      DisplayFormat = '#.##%'
    end
    object BinvoGoodPtotal: TCurrencyField
      Alignment = taLeftJustify
      FieldName = 'Ptotal'
    end
    object BinvoGoodNo: TIntegerField
      FieldName = 'No'
    end
    object BinvoGoodBkod: TBooleanField
      DefaultExpression = 'False'
      FieldName = 'Bkod'
    end
    object BinvoGoodReject: TFloatField
      FieldName = 'Reject'
    end
    object BinvoGoodDat: TIntegerField
      FieldName = 'Dat'
    end
    object BinvoGoodPay: TCurrencyField
      FieldName = 'Pay'
    end
    object BinvoGoodPfee: TCurrencyField
      Alignment = taLeftJustify
      FieldName = 'Pfee'
    end
    object BinvoGoodSerial: TStringField
      FieldName = 'Serial'
    end
    object BinvoGoodGaran: TStringField
      FieldName = 'Garan'
      Size = 45
    end
    object BinvoGoodProp: TStringField
      FieldName = 'Prop'
      Size = 200
    end
  end
  object BinvoGoodDs: TDataSource
    AutoEdit = False
    DataSet = BinvoGood
    Left = 282
    Top = 411
  end
  object Acbill: TTable
    OnPostError = Far_PostErr
    AutoRefresh = True
    DatabaseName = 'ParFro'
    SessionName = 'Default'
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'No'
        DataType = ftInteger
      end
      item
        Name = 'Dat'
        DataType = ftInteger
      end
      item
        Name = 'Bed'
        DataType = ftCurrency
      end
      item
        Name = 'Bes'
        DataType = ftCurrency
      end
      item
        Name = 'Ackod'
        DataType = ftFloat
      end
      item
        Name = 'Accnam'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Des'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'Radif'
        DataType = ftInteger
      end
      item
        Name = 'Facno'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Btip'
        DataType = ftInteger
      end
      item
        Name = 'Cost'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Ckod'
        DataType = ftInteger
      end
      item
        Name = 'Tip'
        DataType = ftSmallint
      end
      item
        Name = 'Cbed'
        DataType = ftCurrency
      end
      item
        Name = 'Cbes'
        DataType = ftCurrency
      end
      item
        Name = 'Rate'
        DataType = ftFloat
      end
      item
        Name = 'Ctip'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Dchek'
        DataType = ftBoolean
      end>
    IndexDefs = <
      item
        Name = 'PK_AcountBill'
        Fields = 'Id'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'IX_AcountBill'
        Fields = 'No'
      end
      item
        Name = '_WA_Sys_Dat_78B3EFCA'
        Fields = 'Dat'
      end
      item
        Name = '_WA_Sys_Bed_78B3EFCA'
        Fields = 'Bed'
      end
      item
        Name = '_WA_Sys_Bes_78B3EFCA'
        Fields = 'Bes'
      end
      item
        Name = '_WA_Sys_Ackod_78B3EFCA'
        Fields = 'Ackod'
      end
      item
        Name = '_WA_Sys_Accnam_78B3EFCA'
        Fields = 'Accnam'
      end
      item
        Name = '_WA_Sys_Des_78B3EFCA'
        Fields = 'Des'
      end
      item
        Name = '_WA_Sys_Radif_78B3EFCA'
        Fields = 'Radif'
      end
      item
        Name = '_WA_Sys_Facno_78B3EFCA'
        Fields = 'Facno'
      end
      item
        Name = '_WA_Sys_Btip_78B3EFCA'
        Fields = 'Btip'
      end
      item
        Name = '_WA_Sys_Cost_78B3EFCA'
        Fields = 'Cost'
      end
      item
        Name = '_WA_Sys_Ckod_78B3EFCA'
        Fields = 'Ckod'
      end
      item
        Name = '_WA_Sys_Tip_78B3EFCA'
        Fields = 'Tip'
      end
      item
        Name = '_WA_Sys_Cbed_78B3EFCA'
        Fields = 'Cbed'
      end
      item
        Name = '_WA_Sys_Cbes_78B3EFCA'
        Fields = 'Cbes'
      end
      item
        Name = '_WA_Sys_Rate_78B3EFCA'
        Fields = 'Rate'
      end
      item
        Name = '_WA_Sys_Ctip_78B3EFCA'
        Fields = 'Ctip'
      end
      item
        Name = '_WA_Sys_Dchek_78B3EFCA'
        Fields = 'Dchek'
      end>
    IndexFieldNames = 'Id'
    MasterSource = BillDs
    StoreDefs = True
    TableName = 'dbo.AcountBill'
    Left = 130
    Top = 107
    object AcbillId: TIntegerField
      DisplayWidth = 10
      FieldName = 'Id'
    end
    object AcbillNo: TIntegerField
      DisplayWidth = 10
      FieldName = 'No'
    end
    object AcbillDat: TIntegerField
      DisplayWidth = 10
      FieldName = 'Dat'
      DisplayFormat = '####/##/##'
      EditFormat = '####/##/##'
    end
    object AcbillBed: TCurrencyField
      DisplayWidth = 20
      FieldName = 'Bed'
    end
    object AcbillBes: TCurrencyField
      DisplayWidth = 10
      FieldName = 'Bes'
    end
    object AcbillAckod: TFloatField
      DisplayWidth = 29
      FieldName = 'Ackod'
    end
    object AcbillAccnam: TStringField
      DisplayWidth = 24
      FieldName = 'Accnam'
      Size = 45
    end
    object AcbillDesc: TStringField
      DisplayWidth = 140
      FieldName = 'Des'
      Size = 200
    end
    object AcbillRadif: TIntegerField
      DisplayWidth = 10
      FieldName = 'Radif'
    end
    object AcbillFacno: TStringField
      DisplayWidth = 30
      FieldName = 'Facno'
      Size = 30
    end
    object AcbillBtip: TIntegerField
      DisplayWidth = 10
      FieldName = 'Btip'
    end
    object AcbillCost: TStringField
      DisplayWidth = 45
      FieldName = 'Cost'
      Size = 45
    end
    object AcbillCkod: TIntegerField
      DisplayWidth = 10
      FieldName = 'Ckod'
    end
    object AcbillTip: TSmallintField
      DisplayWidth = 10
      FieldName = 'Tip'
    end
    object AcbillCbed: TCurrencyField
      DisplayWidth = 10
      FieldName = 'Cbed'
    end
    object AcbillCbes: TCurrencyField
      DisplayWidth = 10
      FieldName = 'Cbes'
    end
    object AcbillRate: TFloatField
      DisplayLabel = '—Ì '
      DisplayWidth = 10
      FieldName = 'Rate'
    end
    object AcbillCtip: TStringField
      DisplayWidth = 15
      FieldName = 'Ctip'
      Size = 15
    end
    object AcbillDchek: TBooleanField
      DefaultExpression = 'false'
      DisplayLabel = '„€«Ì— '
      FieldName = 'Dchek'
      Visible = False
    end
  end
  object AcBillDs: TDataSource
    AutoEdit = False
    DataSet = Acbill
    Left = 45
    Top = 365
  end
  object Pcheq: TTable
    BeforeEdit = PcheqBeforeEdit
    AfterPost = PcheqAfterPost
    BeforeDelete = PcheqBeforeDelete
    OnPostError = Far_PostErr
    AutoRefresh = True
    DatabaseName = 'ParFro'
    SessionName = 'Default'
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'Bno'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Bdat'
        DataType = ftInteger
      end
      item
        Name = 'Paydat'
        DataType = ftInteger
      end
      item
        Name = 'Bank'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Bkod'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Jari'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Pbill'
        DataType = ftCurrency
      end
      item
        Name = 'Paykod'
        Attributes = [faRequired]
        DataType = ftBoolean
      end
      item
        Name = 'Des'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'Acckod'
        DataType = ftFloat
      end
      item
        Name = 'Acnam'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Pkod'
        DataType = ftFloat
      end
      item
        Name = 'PBNo'
        DataType = ftInteger
      end
      item
        Name = 'PaNo'
        DataType = ftInteger
      end
      item
        Name = 'No'
        DataType = ftInteger
      end
      item
        Name = 'Cost'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Ckod'
        DataType = ftInteger
      end
      item
        Name = 'Ctip'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Cprice'
        DataType = ftCurrency
      end
      item
        Name = 'Rate'
        DataType = ftCurrency
      end>
    IndexDefs = <
      item
        Name = 'PK_Pcheq'
        Fields = 'Id'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = '_WA_Sys_Bno_22AA2996'
        Fields = 'Bno'
      end
      item
        Name = '_WA_Sys_Bdat_22AA2996'
        Fields = 'Bdat'
      end
      item
        Name = '_WA_Sys_Paydat_22AA2996'
        Fields = 'Paydat'
      end
      item
        Name = '_WA_Sys_Bank_22AA2996'
        Fields = 'Bank'
      end
      item
        Name = '_WA_Sys_Bkod_22AA2996'
        Fields = 'Bkod'
      end
      item
        Name = '_WA_Sys_Jari_22AA2996'
        Fields = 'Jari'
      end
      item
        Name = '_WA_Sys_Pbill_22AA2996'
        Fields = 'Pbill'
      end
      item
        Name = '_WA_Sys_Paykod_22AA2996'
        Fields = 'Paykod'
      end
      item
        Name = '_WA_Sys_Des_22AA2996'
        Fields = 'Des'
      end
      item
        Name = '_WA_Sys_Acckod_22AA2996'
        Fields = 'Acckod'
      end
      item
        Name = '_WA_Sys_Acnam_22AA2996'
        Fields = 'Acnam'
      end
      item
        Name = '_WA_Sys_Pkod_22AA2996'
        Fields = 'Pkod'
      end
      item
        Name = '_WA_Sys_PBNo_22AA2996'
        Fields = 'PBNo'
      end
      item
        Name = '_WA_Sys_PaNo_22AA2996'
        Fields = 'PaNo'
      end
      item
        Name = '_WA_Sys_No_22AA2996'
        Fields = 'No'
      end
      item
        Name = '_WA_Sys_Cost_22AA2996'
        Fields = 'Cost'
      end
      item
        Name = '_WA_Sys_Ckod_22AA2996'
        Fields = 'Ckod'
      end
      item
        Name = '_WA_Sys_Ctip_22AA2996'
        Fields = 'Ctip'
      end
      item
        Name = '_WA_Sys_Cprice_22AA2996'
        Fields = 'Cprice'
      end
      item
        Name = '_WA_Sys_Rate_22AA2996'
        Fields = 'Rate'
      end>
    IndexFieldNames = 'Id'
    StoreDefs = True
    TableName = 'dbo.Pcheq'
    Left = 162
    Top = 56
    object PcheqId: TIntegerField
      FieldName = 'Id'
      Visible = False
    end
    object PcheqBno: TStringField
      FieldName = 'Bno'
      Required = True
    end
    object PcheqBdat: TIntegerField
      Alignment = taCenter
      FieldName = 'Bdat'
      DisplayFormat = '####/##/##'
      EditFormat = '####/##/##'
    end
    object PcheqPaydat: TIntegerField
      FieldName = 'Paydat'
      DisplayFormat = '####/##/##'
      EditFormat = '####/##/##'
    end
    object PcheqBank: TStringField
      FieldName = 'Bank'
      Size = 45
    end
    object PcheqBkod: TStringField
      FieldName = 'Bkod'
    end
    object PcheqJari: TStringField
      FieldName = 'Jari'
    end
    object PcheqPbill: TCurrencyField
      Alignment = taLeftJustify
      FieldName = 'Pbill'
    end
    object PcheqPaykod: TBooleanField
      FieldName = 'Paykod'
    end
    object PcheqDesc: TStringField
      Alignment = taRightJustify
      FieldName = 'Des'
      Size = 200
    end
    object PcheqAcckod: TFloatField
      FieldName = 'Acckod'
    end
    object PcheqAcnam: TStringField
      FieldName = 'Acnam'
      Size = 45
    end
    object PcheqPkod: TFloatField
      FieldName = 'Pkod'
    end
    object PcheqPBNo: TIntegerField
      FieldName = 'PBNo'
    end
    object PcheqPaNo: TIntegerField
      FieldName = 'PaNo'
    end
    object PcheqNo: TIntegerField
      FieldName = 'No'
    end
    object PcheqCost: TStringField
      FieldName = 'Cost'
      Size = 45
    end
    object PcheqCkod: TIntegerField
      FieldName = 'Ckod'
    end
    object PcheqCtip: TStringField
      FieldName = 'Ctip'
      Size = 15
    end
    object PcheqCprice: TCurrencyField
      FieldName = 'Cprice'
    end
    object PcheqRate: TCurrencyField
      FieldName = 'Rate'
    end
  end
  object PcheqDs: TDataSource
    DataSet = Pcheq
    Left = 134
    Top = 365
  end
  object Rcheq: TTable
    BeforeEdit = RcheqBeforeEdit
    AfterPost = RcheqAfterPost
    BeforeDelete = RcheqBeforeDelete
    OnPostError = Far_PostErr
    AutoRefresh = True
    DatabaseName = 'ParFro'
    SessionName = 'Default'
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'Bno'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Bdat'
        DataType = ftInteger
      end
      item
        Name = 'RecDat'
        DataType = ftInteger
      end
      item
        Name = 'Bank'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Bkod'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Pbill'
        DataType = ftCurrency
      end
      item
        Name = 'No'
        DataType = ftInteger
      end
      item
        Name = 'Des'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'Dpay'
        DataType = ftString
        Size = 65
      end
      item
        Name = 'Reckod'
        Attributes = [faRequired]
        DataType = ftBoolean
      end
      item
        Name = 'Acckod'
        DataType = ftFloat
      end
      item
        Name = 'Acnam'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Pacckod'
        DataType = ftFloat
      end
      item
        Name = 'Pacnam'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Keler'
        Attributes = [faRequired]
        DataType = ftBoolean
      end
      item
        Name = 'Jari'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Reject'
        Attributes = [faRequired]
        DataType = ftBoolean
      end
      item
        Name = 'Shar'
        Attributes = [faRequired]
        DataType = ftBoolean
      end
      item
        Name = 'RBno'
        DataType = ftInteger
      end
      item
        Name = 'PBno'
        DataType = ftInteger
      end
      item
        Name = 'Pdat'
        DataType = ftInteger
      end
      item
        Name = 'VBNo'
        DataType = ftInteger
      end
      item
        Name = 'Cost'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Ckod'
        DataType = ftInteger
      end
      item
        Name = 'PCost'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'PCkod'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = '_WA_Sys_Bank_2F69CA40'
        Fields = 'Bank'
      end
      item
        Name = '_WA_Sys_No_2F69CA40'
        Fields = 'No'
      end
      item
        Name = '_WA_Sys_Bno_2F69CA40'
        Fields = 'Bno'
      end
      item
        Name = '_WA_Sys_Bdat_2F69CA40'
        Fields = 'Bdat'
      end
      item
        Name = '_WA_Sys_RecDat_2F69CA40'
        Fields = 'RecDat'
      end
      item
        Name = '_WA_Sys_Bkod_2F69CA40'
        Fields = 'Bkod'
      end
      item
        Name = '_WA_Sys_Pbill_2F69CA40'
        Fields = 'Pbill'
      end
      item
        Name = '_WA_Sys_Des_2F69CA40'
        Fields = 'Des'
      end
      item
        Name = '_WA_Sys_Dpay_2F69CA40'
        Fields = 'Dpay'
      end
      item
        Name = '_WA_Sys_Reckod_2F69CA40'
        Fields = 'Reckod'
      end
      item
        Name = '_WA_Sys_Acckod_2F69CA40'
        Fields = 'Acckod'
      end
      item
        Name = '_WA_Sys_Acnam_2F69CA40'
        Fields = 'Acnam'
      end
      item
        Name = '_WA_Sys_Pacckod_2F69CA40'
        Fields = 'Pacckod'
      end
      item
        Name = '_WA_Sys_Pacnam_2F69CA40'
        Fields = 'Pacnam'
      end
      item
        Name = '_WA_Sys_Keler_2F69CA40'
        Fields = 'Keler'
      end
      item
        Name = '_WA_Sys_Jari_2F69CA40'
        Fields = 'Jari'
      end
      item
        Name = '_WA_Sys_Reject_2F69CA40'
        Fields = 'Reject'
      end
      item
        Name = '_WA_Sys_Shar_2F69CA40'
        Fields = 'Shar'
      end
      item
        Name = '_WA_Sys_RBno_2F69CA40'
        Fields = 'RBno'
      end
      item
        Name = '_WA_Sys_PBno_2F69CA40'
        Fields = 'PBno'
      end
      item
        Name = '_WA_Sys_Pdat_2F69CA40'
        Fields = 'Pdat'
      end
      item
        Name = '_WA_Sys_VBNo_2F69CA40'
        Fields = 'VBNo'
      end
      item
        Name = '_WA_Sys_Cost_2F69CA40'
        Fields = 'Cost'
      end
      item
        Name = '_WA_Sys_Ckod_2F69CA40'
        Fields = 'Ckod'
      end
      item
        Name = '_WA_Sys_PCost_2F69CA40'
        Fields = 'PCost'
      end
      item
        Name = '_WA_Sys_PCkod_2F69CA40'
        Fields = 'PCkod'
      end
      item
        Name = 'PK_Rcheq'
        Fields = 'Id'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'dbo.Rcheq'
    UpdateMode = upWhereKeyOnly
    Left = 246
    Top = 56
    object RcheqId: TAutoIncField
      AutoGenerateValue = arAutoInc
      FieldName = 'Id'
      ReadOnly = True
    end
    object RcheqBno: TStringField
      FieldName = 'Bno'
    end
    object RcheqBdat: TIntegerField
      FieldName = 'Bdat'
      DisplayFormat = '####/##/##'
      EditFormat = '####/##/##'
    end
    object RcheqRecDat: TIntegerField
      FieldName = 'RecDat'
      DisplayFormat = '####/##/##'
      EditFormat = '####/##/##'
    end
    object RcheqBank: TStringField
      FieldName = 'Bank'
      Size = 45
    end
    object RcheqBkod: TStringField
      FieldName = 'Bkod'
    end
    object RcheqPbill: TCurrencyField
      FieldName = 'Pbill'
    end
    object RcheqNo: TIntegerField
      FieldName = 'No'
    end
    object RcheqDesc: TStringField
      FieldName = 'Des'
      Size = 200
    end
    object RcheqDpay: TStringField
      FieldName = 'Dpay'
      Size = 65
    end
    object RcheqReckod: TBooleanField
      FieldName = 'Reckod'
      Required = True
    end
    object RcheqAcckod: TFloatField
      FieldName = 'Acckod'
    end
    object RcheqAcnam: TStringField
      FieldName = 'Acnam'
      Size = 45
    end
    object RcheqPacckod: TFloatField
      FieldName = 'Pacckod'
    end
    object RcheqPacnam: TStringField
      FieldName = 'Pacnam'
      Size = 45
    end
    object RcheqKeler: TBooleanField
      FieldName = 'Keler'
      Required = True
    end
    object RcheqJari: TStringField
      FieldName = 'Jari'
    end
    object RcheqReject: TBooleanField
      FieldName = 'Reject'
      Required = True
    end
    object RcheqShar: TBooleanField
      FieldName = 'Shar'
      Required = True
    end
    object RcheqRBno: TIntegerField
      FieldName = 'RBno'
    end
    object RcheqPBno: TIntegerField
      FieldName = 'PBno'
    end
    object RcheqPdat: TIntegerField
      FieldName = 'Pdat'
    end
    object RcheqVBNo: TIntegerField
      FieldName = 'VBNo'
    end
    object RcheqCost: TStringField
      FieldName = 'Cost'
      Size = 45
    end
    object RcheqCkod: TIntegerField
      FieldName = 'Ckod'
    end
    object RcheqPCost: TStringField
      FieldName = 'PCost'
      Size = 45
    end
    object RcheqPCkod: TIntegerField
      FieldName = 'PCkod'
    end
  end
  object RcheqDs: TDataSource
    AutoEdit = False
    DataSet = Rcheq
    Left = 192
    Top = 411
  end
  object Jari: TTable
    Tag = 2
    OnPostError = Far_PostErr
    AutoRefresh = True
    DatabaseName = 'ParFro'
    SessionName = 'Default'
    FieldDefs = <
      item
        Name = 'Idd'
        DataType = ftAutoInc
      end
      item
        Name = 'Id'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'Dat'
        DataType = ftInteger
      end
      item
        Name = 'Serial'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Bestan'
        DataType = ftCurrency
      end
      item
        Name = 'Bedeh'
        DataType = ftCurrency
      end
      item
        Name = 'Rema'
        DataType = ftCurrency
      end
      item
        Name = 'Des'
        DataType = ftString
        Size = 140
      end>
    IndexDefs = <
      item
        Name = 'PK_Jari'
        Fields = 'Idd'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = '_WA_Sys_Dat_1B0907CE'
        Fields = 'Dat'
      end
      item
        Name = '_WA_Sys_Bedeh_1B0907CE'
        Fields = 'Bedeh'
      end>
    IndexFieldNames = 'Dat;Bedeh'
    StoreDefs = True
    TableName = 'dbo.Jari'
    Left = 218
    Top = 56
    object JariIdd: TAutoIncField
      FieldName = 'Idd'
      Visible = False
    end
    object JariId: TIntegerField
      Alignment = taCenter
      DisplayWidth = 12
      FieldName = 'Id'
    end
    object JariDat: TIntegerField
      Alignment = taLeftJustify
      DisplayWidth = 12
      FieldName = 'Dat'
      DisplayFormat = '####/##/##'
      EditFormat = '####/##/##'
    end
    object JariSerial: TStringField
      Alignment = taRightJustify
      DisplayWidth = 14
      FieldName = 'Serial'
    end
    object JariBestan: TCurrencyField
      Alignment = taLeftJustify
      DisplayWidth = 29
      FieldName = 'Bestan'
    end
    object JariBedeh: TCurrencyField
      Alignment = taLeftJustify
      DisplayWidth = 29
      FieldName = 'Bedeh'
    end
    object JariRema: TCurrencyField
      Alignment = taLeftJustify
      DisplayWidth = 39
      FieldName = 'Rema'
    end
    object JariDesc: TStringField
      DisplayWidth = 168
      FieldName = 'Des'
      Size = 140
    end
  end
  object JariDS: TDataSource
    AutoEdit = False
    DataSet = Jari
    Left = 76
    Top = 509
  end
  object JariNam: TTable
    OnPostError = Far_PostErr
    AutoRefresh = True
    DatabaseName = 'ParFro'
    SessionName = 'Default'
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'Nam'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Bnam'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Bkod'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DJari'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'AccKod'
        DataType = ftFloat
      end
      item
        Name = 'CheqKod'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'PK_JariN'
        Fields = 'Id'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'JariN0'
        Fields = 'Nam'
        Options = [ixUnique]
      end>
    IndexFieldNames = 'Nam'
    StoreDefs = True
    TableName = 'dbo.JariN'
    Left = 46
    Top = 107
    object JariNamId: TAutoIncField
      FieldName = 'Id'
      Visible = False
    end
    object JariNamNam: TStringField
      Alignment = taRightJustify
      FieldName = 'Nam'
      Size = 45
    end
    object JariNamBnam: TStringField
      Alignment = taRightJustify
      FieldName = 'Bnam'
      Size = 45
    end
    object JariNamBkod: TStringField
      Alignment = taRightJustify
      FieldName = 'Bkod'
    end
    object JariNamDJari: TStringField
      Alignment = taRightJustify
      FieldName = 'DJari'
      Size = 45
    end
    object JariNamAccKod: TFloatField
      FieldName = 'AccKod'
    end
    object JariNamCheqKod: TFloatField
      FieldName = 'CheqKod'
    end
  end
  object JariNamDs: TDataSource
    AutoEdit = False
    DataSet = JariNam
    Left = 251
    Top = 411
  end
  object GoodDs: TDataSource
    AutoEdit = False
    DataSet = Good
    Left = 163
    Top = 459
  end
  object GCardex: TTable
    OnPostError = Far_PostErr
    AutoRefresh = True
    DatabaseName = 'ParFro'
    SessionName = 'Default'
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'Dat'
        DataType = ftInteger
      end
      item
        Name = 'Kod'
        DataType = ftInteger
      end
      item
        Name = 'Nam'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Color'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Quant'
        DataType = ftFloat
      end
      item
        Name = 'IOkod'
        DataType = ftSmallint
      end
      item
        Name = 'AnbNam'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'AnbKod'
        DataType = ftInteger
      end
      item
        Name = 'FacNo'
        DataType = ftInteger
      end
      item
        Name = 'FacNam'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Des'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Fee'
        DataType = ftCurrency
      end
      item
        Name = 'Perc'
        DataType = ftFloat
      end>
    StoreDefs = True
    TableName = 'dbo.GCardex'
    Left = 132
    Top = 8
    object GCardexId: TAutoIncField
      FieldName = 'Id'
      Visible = False
    end
    object GCardexDat: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'Dat'
      DisplayFormat = '####/##/##'
      EditFormat = '####/##/##'
    end
    object GCardexKod: TIntegerField
      FieldName = 'Kod'
    end
    object GCardexNam: TStringField
      DisplayWidth = 22
      FieldName = 'Nam'
      Size = 100
    end
    object GCardexColor: TStringField
      Alignment = taRightJustify
      DisplayWidth = 19
      FieldName = 'Color'
      Size = 45
    end
    object GCardexQuant: TFloatField
      DisplayWidth = 6
      FieldName = 'Quant'
      Required = True
    end
    object GCardexIOkod: TSmallintField
      DisplayWidth = 9
      FieldName = 'IOkod'
    end
    object GCardexAnbNam: TStringField
      FieldName = 'AnbNam'
      Size = 45
    end
    object GCardexAnbKod: TIntegerField
      FieldName = 'AnbKod'
    end
    object GCardexFacNo: TIntegerField
      DisplayWidth = 10
      FieldName = 'FacNo'
      Required = True
    end
    object GCardexFacNam: TStringField
      FieldName = 'FacNam'
      Size = 45
    end
    object GCardexDes: TStringField
      FieldName = 'Des'
    end
    object GCardexFee: TCurrencyField
      FieldName = 'Fee'
    end
    object GCardexPerc: TFloatField
      FieldName = 'Perc'
    end
  end
  object GCardexDs: TDataSource
    AutoEdit = False
    DataSet = GCardex
    Left = 74
    Top = 365
  end
  object AnbDat: TTable
    OnPostError = Far_PostErr
    AutoRefresh = True
    DatabaseName = 'ParFro'
    SessionName = 'Default'
    FieldDefs = <
      item
        Name = 'Kod'
        DataType = ftAutoInc
      end
      item
        Name = 'Nam'
        Attributes = [faRequired]
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Adr'
        DataType = ftString
        Size = 145
      end
      item
        Name = 'Admin'
        DataType = ftString
        Size = 45
      end>
    StoreDefs = True
    TableName = 'dbo.AnbDat'
    Left = 188
    Top = 8
    object AnbDatNam: TStringField
      Alignment = taRightJustify
      FieldName = 'Nam'
      Required = True
      Size = 45
    end
    object AnbDatKod: TAutoIncField
      FieldName = 'Kod'
      ReadOnly = True
    end
    object AnbDatAdd: TStringField
      Alignment = taRightJustify
      FieldName = 'Adr'
      Size = 145
    end
    object AnbDatAdmin: TStringField
      Alignment = taRightJustify
      FieldName = 'Admin'
      Size = 45
    end
  end
  object AnbDatDs: TDataSource
    AutoEdit = False
    DataSet = AnbDat
    Left = 193
    Top = 459
  end
  object Cardex: TTable
    OnPostError = Far_PostErr
    AutoRefresh = True
    DatabaseName = 'ParFro'
    SessionName = 'Default'
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'Dat'
        DataType = ftInteger
      end
      item
        Name = 'Nam'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Color'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Anb'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Anbkod'
        DataType = ftInteger
      end
      item
        Name = 'IIn'
        DataType = ftFloat
      end
      item
        Name = 'Out'
        DataType = ftFloat
      end
      item
        Name = 'Rem'
        DataType = ftFloat
      end
      item
        Name = 'No'
        DataType = ftInteger
      end
      item
        Name = 'Des'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Facnam'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Fee'
        DataType = ftCurrency
      end
      item
        Name = 'Perc'
        DataType = ftFloat
      end
      item
        Name = 'Prem'
        DataType = ftCurrency
      end
      item
        Name = 'Diag'
        DataType = ftFloat
      end
      item
        Name = 'Pdiag'
        DataType = ftCurrency
      end>
    IndexDefs = <
      item
        Name = 'PK_Cardex'
        Fields = 'Id'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = '_WA_Sys_Dat_03317E3D'
        Fields = 'Dat'
      end
      item
        Name = '_WA_Sys_Nam_03317E3D'
        Fields = 'Nam'
      end
      item
        Name = '_WA_Sys_Color_03317E3D'
        Fields = 'Color'
      end
      item
        Name = '_WA_Sys_Anb_03317E3D'
        Fields = 'Anb'
      end
      item
        Name = '_WA_Sys_Anbkod_03317E3D'
        Fields = 'Anbkod'
      end
      item
        Name = '_WA_Sys_IIn_03317E3D'
        Fields = 'IIn'
      end
      item
        Name = '_WA_Sys_Out_03317E3D'
        Fields = 'Out'
      end
      item
        Name = '_WA_Sys_Rem_03317E3D'
        Fields = 'Rem'
      end
      item
        Name = '_WA_Sys_No_03317E3D'
        Fields = 'No'
      end
      item
        Name = '_WA_Sys_Des_03317E3D'
        Fields = 'Des'
      end
      item
        Name = '_WA_Sys_Facnam_03317E3D'
        Fields = 'Facnam'
      end
      item
        Name = '_WA_Sys_Fee_03317E3D'
        Fields = 'Fee'
      end
      item
        Name = '_WA_Sys_Perc_03317E3D'
        Fields = 'Perc'
      end
      item
        Name = '_WA_Sys_Prem_03317E3D'
        Fields = 'Prem'
      end
      item
        Name = '_WA_Sys_Diag_03317E3D'
        Fields = 'Diag'
      end
      item
        Name = '_WA_Sys_Pdiag_03317E3D'
        Fields = 'Pdiag'
      end>
    StoreDefs = True
    TableName = 'dbo.Cardex'
    Left = 216
    Top = 8
    object CardexId: TAutoIncField
      FieldName = 'Id'
      ReadOnly = True
      Visible = False
    end
    object CardexDat: TIntegerField
      FieldName = 'Dat'
      DisplayFormat = '####/##/##'
      EditFormat = '####/##/##'
    end
    object CardexNam: TStringField
      Alignment = taRightJustify
      FieldName = 'Nam'
      Size = 100
    end
    object CardexColor: TStringField
      Alignment = taRightJustify
      FieldName = 'Color'
      Size = 45
    end
    object CardexAnb: TStringField
      FieldName = 'Anb'
      Size = 45
    end
    object CardexAnbKod: TIntegerField
      FieldName = 'AnbKod'
    end
    object CardexIn: TFloatField
      Alignment = taCenter
      FieldName = 'IIn'
    end
    object CardexOut: TFloatField
      Alignment = taCenter
      FieldName = 'Out'
    end
    object CardexRem: TFloatField
      Alignment = taCenter
      FieldName = 'Rem'
    end
    object CardexNo: TIntegerField
      FieldName = 'No'
    end
    object CardexDes: TStringField
      FieldName = 'Des'
    end
    object CardexFacNam: TStringField
      Alignment = taRightJustify
      FieldName = 'FacNam'
      Size = 45
    end
    object CardexFee: TCurrencyField
      FieldName = 'Fee'
    end
    object CardexPerc: TFloatField
      FieldName = 'Perc'
    end
    object CardexPrem: TCurrencyField
      FieldName = 'Prem'
    end
    object CardexDiag: TFloatField
      FieldName = 'Diag'
    end
    object CardexPdiag: TCurrencyField
      FieldName = 'Pdiag'
    end
  end
  object CardexDs: TDataSource
    AutoEdit = False
    DataSet = Cardex
    Left = 223
    Top = 365
  end
  object Gardesh: TTable
    OnPostError = Far_PostErr
    AutoRefresh = True
    DatabaseName = 'ParFro'
    SessionName = 'Default'
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'Dat'
        DataType = ftInteger
      end
      item
        Name = 'Bedeh'
        DataType = ftCurrency
      end
      item
        Name = 'Bestan'
        DataType = ftCurrency
      end
      item
        Name = 'BedRem'
        DataType = ftCurrency
      end
      item
        Name = 'BesRem'
        DataType = ftCurrency
      end
      item
        Name = 'Baghi'
        DataType = ftCurrency
      end
      item
        Name = 'Des'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'No'
        DataType = ftInteger
      end
      item
        Name = 'Diag'
        DataType = ftCurrency
      end
      item
        Name = 'Ctip'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Bid'
        DataType = ftInteger
      end
      item
        Name = 'Dchek'
        DataType = ftBoolean
      end>
    IndexDefs = <
      item
        Name = 'PK_GarDesh'
        Fields = 'Id'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = '_WA_Sys_Dat_173876EA'
        Fields = 'Dat'
      end
      item
        Name = '_WA_Sys_Bedeh_173876EA'
        Fields = 'Bedeh'
      end
      item
        Name = '_WA_Sys_Bestan_173876EA'
        Fields = 'Bestan'
      end
      item
        Name = '_WA_Sys_BedRem_173876EA'
        Fields = 'BedRem'
      end
      item
        Name = '_WA_Sys_BesRem_173876EA'
        Fields = 'BesRem'
      end
      item
        Name = '_WA_Sys_Baghi_173876EA'
        Fields = 'Baghi'
      end
      item
        Name = '_WA_Sys_Des_173876EA'
        Fields = 'Des'
      end
      item
        Name = '_WA_Sys_No_173876EA'
        Fields = 'No'
      end
      item
        Name = '_WA_Sys_Diag_173876EA'
        Fields = 'Diag'
      end
      item
        Name = '_WA_Sys_Ctip_173876EA'
        Fields = 'Ctip'
      end>
    StoreDefs = True
    TableName = 'dbo.GarDesh'
    UpdateMode = upWhereKeyOnly
    Left = 160
    Top = 8
    object GardeshId: TAutoIncField
      FieldName = 'Id'
    end
    object GardeshNo: TIntegerField
      FieldName = 'No'
    end
    object GardeshDat: TIntegerField
      FieldName = 'Dat'
      DisplayFormat = '####/##/##'
      EditFormat = '####/##/##'
    end
    object GardeshDesc: TStringField
      FieldName = 'Des'
      Size = 200
    end
    object GardeshBedeh: TCurrencyField
      FieldName = 'Bedeh'
    end
    object GardeshBestan: TCurrencyField
      FieldName = 'Bestan'
    end
    object GardeshBaghi: TCurrencyField
      FieldName = 'Baghi'
    end
    object GardeshBedRem: TCurrencyField
      FieldName = 'BedRem'
    end
    object GardeshBesRem: TCurrencyField
      FieldName = 'BesRem'
    end
    object GardeshDiag: TCurrencyField
      FieldName = 'Diag'
    end
    object GardeshCtip: TStringField
      FieldName = 'Ctip'
      Size = 40
    end
    object GardeshBid: TIntegerField
      FieldName = 'Bid'
    end
    object GardeshDchek: TBooleanField
      DefaultExpression = 'False'
      FieldName = 'Dchek'
    end
  end
  object GardeshDs: TDataSource
    AutoEdit = False
    DataSet = Gardesh
    Left = 252
    Top = 365
  end
  object Db1: TDatabase
    DatabaseName = 'ParFro'
    DriverName = 'MSSQL'
    LoginPrompt = False
    Params.Strings = (
      'NET PROTOCOL=TNS'
      'OPEN MODE=READ/WRITE'
      'SCHEMA CACHE SIZE=8'
      'LANGDRIVER='
      'SQLQRYMODE='
      'SQLPASSTHRU MODE=SHARED AUTOCOMMIT'
      'SCHEMA CACHE TIME=-1'
      'MAX ROWS=-1'
      'BATCH COUNT=200'
      'ENABLE SCHEMA CACHE=FALSE'
      'SCHEMA CACHE DIR='
      'ENABLE BCD=FALSE'
      'ENABLE INTEGERS=FALSE'
      'LIST SYNONYMS=NONE'
      'ROWSET SIZE=20'
      'BLOBS TO CACHE=64'
      'BLOB SIZE=32'
      'OBJECT MODE=TRUE'
      'DATABASE NAME=Hadieh96'
      'SERVER NAME=Parsian'
      'USER NAME=sa'
      'PASSWORD=')
    SessionName = 'Default'
    Left = 28
    Top = 284
  end
  object Mali: TTable
    OnPostError = Far_PostErr
    AutoRefresh = True
    DatabaseName = 'ParFro'
    SessionName = 'Default'
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'BDes'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'Bed'
        DataType = ftCurrency
      end
      item
        Name = 'SDes'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'Bes'
        DataType = ftCurrency
      end>
    StoreDefs = True
    TableName = 'dbo.Mali'
    Left = 158
    Top = 154
    object MaliId: TAutoIncField
      FieldName = 'Id'
      Visible = False
    end
    object MaliBDes: TStringField
      FieldName = 'BDes'
      Size = 150
    end
    object MaliBed: TCurrencyField
      FieldName = 'Bed'
    end
    object MaliSDes: TStringField
      FieldName = 'SDes'
      Size = 150
    end
    object MaliBes: TCurrencyField
      FieldName = 'Bes'
    end
  end
  object Users: TTable
    OnPostError = Far_PostErr
    AutoRefresh = True
    DatabaseName = 'ParFro'
    FieldDefs = <
      item
        Name = 'Id'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'UserN'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Password'
        DataType = ftString
        Size = 16
      end
      item
        Name = 'Master'
        Attributes = [faRequired]
        DataType = ftBoolean
      end
      item
        Name = 'Mali'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Lang'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'Centfilt'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'Cashfilt'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'Idd'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'PK_Users'
        Fields = 'Id'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = '_WA_Sys_UserN_47DBAE45'
        Fields = 'UserN'
      end
      item
        Name = '_WA_Sys_Mali_47DBAE45'
        Fields = 'Mali'
      end
      item
        Name = '_WA_Sys_Master_47DBAE45'
        Fields = 'Master'
      end
      item
        Name = '_WA_Sys_Password_47DBAE45'
        Fields = 'Password'
      end>
    StoreDefs = True
    TableName = 'dbo.Users'
    Left = 270
    Top = 107
  end
  object MaliDs: TDataSource
    AutoEdit = False
    DataSet = Mali
    Left = 45
    Top = 411
  end
  object AcBList: TTable
    OnPostError = Far_PostErr
    AutoRefresh = True
    DatabaseName = 'ParFro'
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'No'
        DataType = ftInteger
      end
      item
        Name = 'Dat'
        DataType = ftInteger
      end
      item
        Name = 'Bedeh'
        DataType = ftCurrency
      end
      item
        Name = 'Bestan'
        DataType = ftCurrency
      end
      item
        Name = 'Ackod'
        DataType = ftFloat
      end
      item
        Name = 'Acgir'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Des'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'Accnam'
        DataType = ftString
        Size = 45
      end>
    IndexDefs = <
      item
        Name = 'PK_AcBillList'
        Fields = 'Id'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'dbo.AcBillList'
    Left = 18
    Top = 107
    object AcBListId: TAutoIncField
      FieldName = 'Id'
      ReadOnly = True
      Visible = False
    end
    object AcBListNo: TIntegerField
      FieldName = 'No'
    end
    object AcBListDat: TIntegerField
      FieldName = 'Dat'
      DisplayFormat = '####/##/##'
      EditFormat = '####/##/##'
    end
    object AcBListAckod: TFloatField
      FieldName = 'Ackod'
    end
    object AcBListAccnam: TStringField
      FieldName = 'Accnam'
      Size = 45
    end
    object AcBListBedeh: TCurrencyField
      FieldName = 'Bedeh'
    end
    object AcBListBestan: TCurrencyField
      FieldName = 'Bestan'
    end
    object AcBListDesc: TStringField
      FieldName = 'Des'
      Size = 200
    end
  end
  object AcBListDs: TDataSource
    AutoEdit = False
    DataSet = AcBList
    Left = 74
    Top = 411
  end
  object PInvo: TTable
    OnPostError = Far_PostErr
    AutoRefresh = True
    DatabaseName = 'ParFro'
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'No'
        DataType = ftInteger
      end
      item
        Name = 'Tel'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Dat'
        DataType = ftInteger
      end
      item
        Name = 'Adr'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'Nam'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Pkol'
        DataType = ftCurrency
      end
      item
        Name = 'Pdis'
        DataType = ftCurrency
      end
      item
        Name = 'Pnet'
        DataType = ftCurrency
      end
      item
        Name = 'Ppay'
        DataType = ftCurrency
      end
      item
        Name = 'Prem'
        DataType = ftCurrency
      end
      item
        Name = 'Pcheq'
        DataType = ftCurrency
      end
      item
        Name = 'Bkod'
        Attributes = [faRequired]
        DataType = ftBoolean
      end
      item
        Name = 'DeliKod'
        Attributes = [faRequired]
        DataType = ftBoolean
      end
      item
        Name = 'LPerm'
        Attributes = [faRequired]
        DataType = ftBoolean
      end
      item
        Name = 'Eco'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Visit'
        DataType = ftInteger
      end
      item
        Name = 'Cost'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Ckod'
        DataType = ftInteger
      end>
    StoreDefs = True
    TableName = 'dbo.PInvoice'
    Left = 274
    Top = 56
    object PInvoId: TAutoIncField
      FieldName = 'Id'
      Visible = False
    end
    object PInvoNo: TIntegerField
      FieldName = 'No'
    end
    object PInvoTel: TStringField
      FieldName = 'Tel'
    end
    object PInvoDat: TIntegerField
      FieldName = 'Dat'
      DisplayFormat = '####/##/##'
      EditFormat = '####/##/##'
    end
    object PInvoAdd: TStringField
      Alignment = taRightJustify
      FieldName = 'Adr'
      Size = 200
    end
    object PInvoNam: TStringField
      Alignment = taRightJustify
      FieldName = 'Nam'
      Required = True
      Size = 45
    end
    object PInvoPkol: TCurrencyField
      Alignment = taLeftJustify
      FieldName = 'Pkol'
    end
    object PInvoPdis: TCurrencyField
      Alignment = taLeftJustify
      FieldName = 'Pdis'
    end
    object PInvoPnet: TCurrencyField
      Alignment = taLeftJustify
      FieldName = 'Pnet'
    end
    object PInvoPpay: TCurrencyField
      Alignment = taLeftJustify
      FieldName = 'Ppay'
    end
    object PInvoPrem: TCurrencyField
      Alignment = taLeftJustify
      FieldName = 'Prem'
    end
    object PInvoPcheq: TCurrencyField
      Alignment = taLeftJustify
      FieldName = 'Pcheq'
    end
    object PInvoBkod: TBooleanField
      FieldName = 'Bkod'
    end
    object PInvoDeliKod: TBooleanField
      FieldName = 'DeliKod'
    end
    object PInvoPerm: TBooleanField
      FieldName = 'LPerm'
    end
    object PInvoEco: TStringField
      FieldName = 'Eco'
    end
    object PInvoVisit: TIntegerField
      FieldName = 'Visit'
    end
    object PInvoCost: TStringField
      FieldName = 'Cost'
      Size = 45
    end
    object PInvoCkod: TIntegerField
      FieldName = 'Ckod'
    end
  end
  object PInvoDs: TDataSource
    AutoEdit = False
    DataSet = PInvo
    Left = 133
    Top = 411
  end
  object PInvoGood: TTable
    BeforePost = BeforPosting
    OnPostError = Far_PostErr
    AutoRefresh = True
    DatabaseName = 'ParFro'
    SessionName = 'Default'
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'Radif'
        DataType = ftInteger
      end
      item
        Name = 'Kod'
        DataType = ftInteger
      end
      item
        Name = 'Nam'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Color'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Quant'
        DataType = ftFloat
      end
      item
        Name = 'Unit'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'AnbNam'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'AnbKod'
        DataType = ftInteger
      end
      item
        Name = 'Pfee'
        DataType = ftCurrency
      end
      item
        Name = 'Perc'
        DataType = ftFloat
      end
      item
        Name = 'Ptotal'
        DataType = ftCurrency
      end
      item
        Name = 'Delikod'
        Attributes = [faRequired]
        DataType = ftBoolean
      end
      item
        Name = 'Reject'
        DataType = ftFloat
      end
      item
        Name = 'No'
        DataType = ftInteger
      end
      item
        Name = 'Dat'
        DataType = ftInteger
      end
      item
        Name = 'Serial'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Garan'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Prop'
        DataType = ftString
        Size = 200
      end>
    StoreDefs = True
    TableName = 'dbo.PInvogood'
    Left = 244
    Top = 8
    object PInvoGoodId: TAutoIncField
      FieldName = 'Id'
      ReadOnly = True
      Visible = False
    end
    object PInvoGoodRadif: TIntegerField
      FieldName = 'Radif'
    end
    object PInvoGoodKod: TIntegerField
      FieldName = 'Kod'
    end
    object PInvoGoodNam: TStringField
      FieldName = 'Nam'
      Size = 100
    end
    object PInvoGoodColor: TStringField
      FieldName = 'Color'
      Size = 45
    end
    object PInvoGoodAnbNam: TStringField
      FieldName = 'AnbNam'
      Size = 45
    end
    object PInvoGoodAnbKod: TIntegerField
      DefaultExpression = #39'0'#39
      FieldName = 'AnbKod'
    end
    object PInvoGoodQuant: TFloatField
      FieldName = 'Quant'
    end
    object PInvoGoodUnit: TStringField
      FieldKind = fkLookup
      FieldName = 'Unit'
      LookupDataSet = Good
      LookupKeyFields = 'Kod'
      LookupResultField = 'Unit'
      KeyFields = 'Kod'
      Lookup = True
    end
    object PInvoGoodPfee: TCurrencyField
      FieldName = 'Pfee'
    end
    object PInvoGoodPerc: TFloatField
      DefaultExpression = #39'0'#39
      FieldName = 'Perc'
      DisplayFormat = '#.##%'
    end
    object PInvoGoodPtotal: TCurrencyField
      FieldName = 'Ptotal'
    end
    object PInvoGoodDelikod: TBooleanField
      DefaultExpression = 'False'
      FieldName = 'Delikod'
    end
    object PInvoGoodReject: TFloatField
      FieldName = 'Reject'
    end
    object PInvoGoodNo: TIntegerField
      FieldName = 'No'
    end
    object PInvoGoodDat: TIntegerField
      FieldName = 'Dat'
    end
    object PInvoGoodSerial: TStringField
      FieldName = 'Serial'
    end
    object PInvoGoodGaran: TStringField
      FieldName = 'Garan'
      Size = 45
    end
    object PInvoGoodProp: TStringField
      FieldName = 'Prop'
      Size = 200
    end
  end
  object PInvoGoodDs: TDataSource
    AutoEdit = False
    DataSet = PInvoGood
    Left = 15
    Top = 459
  end
  object UsersDs: TDataSource
    AutoEdit = False
    DataSet = Users
    Left = 282
    Top = 365
  end
  object RejInvo: TTable
    OnPostError = Far_PostErr
    AutoRefresh = True
    DatabaseName = 'ParFro'
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'No'
        DataType = ftInteger
      end
      item
        Name = 'Tel'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Dat'
        DataType = ftInteger
      end
      item
        Name = 'Adr'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'Nam'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Pkol'
        DataType = ftCurrency
      end
      item
        Name = 'Pdis'
        DataType = ftCurrency
      end
      item
        Name = 'Pnet'
        DataType = ftCurrency
      end
      item
        Name = 'FacNo'
        DataType = ftInteger
      end
      item
        Name = 'LPerm'
        Attributes = [faRequired]
        DataType = ftBoolean
      end
      item
        Name = 'Eco'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Visit'
        DataType = ftInteger
      end
      item
        Name = 'Bno'
        DataType = ftInteger
      end
      item
        Name = 'Cost'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Ckod'
        DataType = ftInteger
      end
      item
        Name = 'RefNo'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'PK_RejInvo'
        Fields = 'Id'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'IX_RejInvo'
        Fields = 'No'
      end>
    StoreDefs = True
    TableName = 'dbo.RejInvo'
    Left = 186
    Top = 154
    object RejInvoId: TAutoIncField
      FieldName = 'Id'
      Visible = False
    end
    object RejInvoNo: TIntegerField
      FieldName = 'No'
      Required = True
    end
    object RejInvoTel: TStringField
      FieldName = 'Tel'
    end
    object RejInvoDat: TIntegerField
      FieldName = 'Dat'
      DisplayFormat = '####/##/##'
      EditFormat = '####/##/##'
    end
    object RejInvoAdd: TStringField
      Alignment = taRightJustify
      FieldName = 'Adr'
      Size = 200
    end
    object RejInvoNam: TStringField
      Alignment = taRightJustify
      FieldName = 'Nam'
      Required = True
      Size = 45
    end
    object RejInvoPkol: TCurrencyField
      Alignment = taLeftJustify
      FieldName = 'Pkol'
    end
    object RejInvoPdis: TCurrencyField
      Alignment = taLeftJustify
      FieldName = 'Pdis'
    end
    object RejInvoPnet: TCurrencyField
      Alignment = taLeftJustify
      FieldName = 'Pnet'
    end
    object RejInvoFacNo: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'FacNo'
    end
    object RejInvoPerm: TBooleanField
      FieldName = 'LPerm'
    end
    object RejInvoEco: TStringField
      FieldName = 'Eco'
    end
    object RejInvoVisit: TIntegerField
      FieldName = 'Visit'
    end
    object RejInvoBno: TIntegerField
      FieldName = 'Bno'
    end
    object RejInvoCost: TStringField
      FieldName = 'Cost'
      Size = 45
    end
    object RejInvoCkod: TIntegerField
      FieldName = 'Ckod'
    end
    object RejInvoRefNo: TIntegerField
      FieldName = 'RefNo'
    end
  end
  object RejInvoDs: TDataSource
    AutoEdit = False
    DataSet = RejInvo
    Left = 162
    Top = 411
  end
  object RejInvoGood: TTable
    BeforePost = BeforPosting
    OnPostError = Far_PostErr
    AutoRefresh = True
    DatabaseName = 'ParFro'
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'Radif'
        DataType = ftInteger
      end
      item
        Name = 'Kod'
        DataType = ftInteger
      end
      item
        Name = 'Nam'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Color'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'AnbNam'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'AnbKod'
        DataType = ftInteger
      end
      item
        Name = 'Quant'
        DataType = ftFloat
      end
      item
        Name = 'Unit'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Pfee'
        DataType = ftCurrency
      end
      item
        Name = 'Perc'
        DataType = ftFloat
      end
      item
        Name = 'Ptotal'
        DataType = ftCurrency
      end
      item
        Name = 'Delikod'
        DataType = ftBoolean
      end
      item
        Name = 'Reject'
        DataType = ftFloat
      end
      item
        Name = 'No'
        DataType = ftInteger
      end
      item
        Name = 'Dat'
        DataType = ftInteger
      end
      item
        Name = 'Inv'
        DataType = ftInteger
      end
      item
        Name = 'Serial'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Garan'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Prop'
        DataType = ftString
        Size = 200
      end>
    IndexDefs = <
      item
        Name = 'PK_RejInvogood'
        Fields = 'Id'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = '_WA_Sys_Radif_4D5F7D71'
        Fields = 'Radif'
      end
      item
        Name = '_WA_Sys_No_4D5F7D71'
        Fields = 'No'
      end
      item
        Name = '_WA_Sys_Prop_4D5F7D71'
        Fields = 'Prop'
      end
      item
        Name = '_WA_Sys_Garan_4D5F7D71'
        Fields = 'Garan'
      end
      item
        Name = '_WA_Sys_Serial_4D5F7D71'
        Fields = 'Serial'
      end
      item
        Name = '_WA_Sys_Inv_4D5F7D71'
        Fields = 'Inv'
      end
      item
        Name = '_WA_Sys_Dat_4D5F7D71'
        Fields = 'Dat'
      end
      item
        Name = '_WA_Sys_Reject_4D5F7D71'
        Fields = 'Reject'
      end
      item
        Name = '_WA_Sys_Delikod_4D5F7D71'
        Fields = 'Delikod'
      end
      item
        Name = '_WA_Sys_Ptotal_4D5F7D71'
        Fields = 'Ptotal'
      end
      item
        Name = '_WA_Sys_Perc_4D5F7D71'
        Fields = 'Perc'
      end
      item
        Name = '_WA_Sys_Pfee_4D5F7D71'
        Fields = 'Pfee'
      end
      item
        Name = '_WA_Sys_Unit_4D5F7D71'
        Fields = 'Unit'
      end
      item
        Name = '_WA_Sys_Quant_4D5F7D71'
        Fields = 'Quant'
      end
      item
        Name = '_WA_Sys_AnbKod_4D5F7D71'
        Fields = 'AnbKod'
      end
      item
        Name = '_WA_Sys_AnbNam_4D5F7D71'
        Fields = 'AnbNam'
      end
      item
        Name = '_WA_Sys_Color_4D5F7D71'
        Fields = 'Color'
      end
      item
        Name = '_WA_Sys_Nam_4D5F7D71'
        Fields = 'Nam'
      end
      item
        Name = '_WA_Sys_Kod_4D5F7D71'
        Fields = 'Kod'
      end
      item
        Name = 'IX_RejInvogood'
        Fields = 'No'
      end>
    StoreDefs = True
    TableName = 'dbo.RejInvogood'
    Left = 102
    Top = 154
    object RejInvoGoodId: TAutoIncField
      FieldName = 'Id'
      ReadOnly = True
      Visible = False
    end
    object RejInvoGoodRadif: TIntegerField
      FieldName = 'Radif'
    end
    object RejInvoGoodKod: TIntegerField
      FieldName = 'Kod'
    end
    object RejInvoGoodNam: TStringField
      FieldName = 'Nam'
      Size = 100
    end
    object RejInvoGoodColor: TStringField
      FieldName = 'Color'
      Size = 45
    end
    object RejInvoGoodAnbNam: TStringField
      FieldName = 'AnbNam'
      Size = 45
    end
    object RejInvoGoodAnbKod: TIntegerField
      DefaultExpression = #39'0'#39
      FieldName = 'AnbKod'
    end
    object RejInvoGoodQuant: TFloatField
      FieldName = 'Quant'
    end
    object RejInvoGoodUnit: TStringField
      FieldKind = fkLookup
      FieldName = 'Unit'
      LookupDataSet = Good
      LookupKeyFields = 'Kod'
      LookupResultField = 'Unit'
      KeyFields = 'Kod'
      Lookup = True
    end
    object RejInvoGoodPfee: TCurrencyField
      FieldName = 'Pfee'
    end
    object RejInvoGoodPerc: TFloatField
      DefaultExpression = #39'0'#39
      FieldName = 'Perc'
      DisplayFormat = '#.##%'
    end
    object RejInvoGoodPtotal: TCurrencyField
      FieldName = 'Ptotal'
    end
    object RejInvoGoodDelikod: TBooleanField
      DefaultExpression = 'False'
      FieldName = 'Delikod'
    end
    object RejInvoGoodReject: TFloatField
      FieldName = 'Reject'
      currency = True
    end
    object RejInvoGoodNo: TIntegerField
      FieldName = 'No'
    end
    object RejInvoGoodDat: TIntegerField
      FieldName = 'Dat'
    end
    object RejInvoGoodInv: TIntegerField
      FieldName = 'Inv'
    end
    object RejInvoGoodSerial: TStringField
      FieldName = 'Serial'
    end
    object RejInvoGoodGaran: TStringField
      FieldName = 'Garan'
      Size = 45
    end
    object RejInvoGoodProp: TStringField
      FieldName = 'Prop'
      Size = 200
    end
  end
  object RejInvoGoodDs: TDataSource
    AutoEdit = False
    DataSet = RejInvoGood
    Left = 134
    Top = 459
  end
  object RejBinvo: TTable
    OnPostError = Far_PostErr
    AutoRefresh = True
    DatabaseName = 'ParFro'
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'No'
        DataType = ftInteger
      end
      item
        Name = 'Nam'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Tel'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Dat'
        DataType = ftInteger
      end
      item
        Name = 'Pkol'
        DataType = ftCurrency
      end
      item
        Name = 'Pdis'
        DataType = ftCurrency
      end
      item
        Name = 'Pnet'
        DataType = ftCurrency
      end
      item
        Name = 'FacNo'
        DataType = ftInteger
      end
      item
        Name = 'LPerm'
        Attributes = [faRequired]
        DataType = ftBoolean
      end
      item
        Name = 'Eco'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Visit'
        DataType = ftInteger
      end
      item
        Name = 'Bno'
        DataType = ftInteger
      end
      item
        Name = 'Cost'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Ckod'
        DataType = ftInteger
      end
      item
        Name = 'RefNo'
        DataType = ftInteger
      end>
    StoreDefs = True
    TableName = 'dbo.RejBvoice'
    Left = 20
    Top = 8
    object RejBinvoId: TAutoIncField
      FieldName = 'Id'
      Visible = False
    end
    object RejBinvoNo: TIntegerField
      FieldName = 'No'
      Required = True
    end
    object RejBinvoNam: TStringField
      Alignment = taRightJustify
      FieldName = 'Nam'
      Required = True
      Size = 45
    end
    object RejBinvoTel: TStringField
      FieldName = 'Tel'
    end
    object RejBinvoDat: TIntegerField
      FieldName = 'Dat'
      DisplayFormat = '####/##/##'
      EditFormat = '0000/00/00'
    end
    object RejBinvoPkol: TCurrencyField
      Alignment = taLeftJustify
      FieldName = 'Pkol'
    end
    object RejBinvoPdis: TCurrencyField
      Alignment = taLeftJustify
      FieldName = 'Pdis'
    end
    object RejBinvoPnet: TCurrencyField
      Alignment = taLeftJustify
      FieldName = 'Pnet'
    end
    object RejBinvoFacNo: TIntegerField
      FieldName = 'FacNo'
    end
    object RejBinvoPerm: TBooleanField
      FieldName = 'LPerm'
    end
    object RejBinvoEco: TStringField
      FieldName = 'Eco'
    end
    object RejBinvoVisit: TIntegerField
      FieldName = 'Visit'
    end
    object RejBinvoBno: TIntegerField
      FieldName = 'Bno'
    end
    object RejBinvoCost: TStringField
      FieldName = 'Cost'
      Size = 45
    end
    object RejBinvoCkod: TIntegerField
      FieldName = 'Ckod'
    end
    object RejBinvoRefNo: TIntegerField
      FieldName = 'RefNo'
    end
  end
  object RejBInvoDs: TDataSource
    AutoEdit = False
    DataSet = RejBinvo
    Left = 135
    Top = 509
  end
  object RejBinvoGood: TTable
    BeforePost = BeforPosting
    OnPostError = Far_PostErr
    AutoRefresh = True
    DatabaseName = 'ParFro'
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'Radif'
        DataType = ftInteger
      end
      item
        Name = 'Kod'
        DataType = ftInteger
      end
      item
        Name = 'Nam'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Color'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'AnbNam'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'AnbKod'
        DataType = ftInteger
      end
      item
        Name = 'Quant'
        DataType = ftFloat
      end
      item
        Name = 'Unit'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Pfee'
        DataType = ftCurrency
      end
      item
        Name = 'Perc'
        DataType = ftFloat
      end
      item
        Name = 'Ptotal'
        DataType = ftCurrency
      end
      item
        Name = 'No'
        DataType = ftInteger
      end
      item
        Name = 'Bkod'
        DataType = ftBoolean
      end
      item
        Name = 'Reject'
        DataType = ftFloat
      end
      item
        Name = 'Dat'
        DataType = ftInteger
      end
      item
        Name = 'Serial'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Garan'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Prop'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'OPfee'
        DataType = ftCurrency
      end
      item
        Name = 'OPSum'
        DataType = ftCurrency
      end>
    StoreDefs = True
    TableName = 'dbo.RejBinvogood'
    Left = 76
    Top = 8
    object RejBinvoGoodId: TAutoIncField
      FieldName = 'Id'
      ReadOnly = True
      Visible = False
    end
    object RejBinvoGoodRadif: TIntegerField
      FieldName = 'Radif'
    end
    object RejBinvoGoodKod: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'Kod'
    end
    object RejBinvoGoodNam: TStringField
      FieldName = 'Nam'
      Size = 100
    end
    object RejBinvoGoodColor: TStringField
      FieldName = 'Color'
      Size = 45
    end
    object RejBinvoGoodAnbNam: TStringField
      FieldName = 'AnbNam'
      Size = 45
    end
    object RejBinvoGoodAnbKod: TIntegerField
      DefaultExpression = #39'0'#39
      FieldName = 'AnbKod'
    end
    object RejBinvoGoodQuant: TFloatField
      FieldName = 'Quant'
    end
    object RejBinvoGoodUnit: TStringField
      FieldKind = fkLookup
      FieldName = 'Unit'
      LookupDataSet = Good
      LookupKeyFields = 'Kod'
      LookupResultField = 'Unit'
      KeyFields = 'Kod'
      Lookup = True
    end
    object RejBinvoGoodPfee: TCurrencyField
      FieldName = 'Pfee'
    end
    object RejBinvoGoodPerc: TFloatField
      DefaultExpression = #39'0'#39
      FieldName = 'Perc'
      DisplayFormat = '#.##%'
    end
    object RejBinvoGoodPtotal: TCurrencyField
      FieldName = 'Ptotal'
    end
    object RejBinvoGoodNo: TIntegerField
      FieldName = 'No'
    end
    object RejBinvoGoodBkod: TBooleanField
      DefaultExpression = 'False'
      FieldName = 'Bkod'
    end
    object RejBinvoGoodReject: TFloatField
      FieldName = 'Reject'
      currency = True
    end
    object RejBinvoGoodDat: TIntegerField
      FieldName = 'Dat'
    end
    object RejBinvoGoodSerial: TStringField
      FieldName = 'Serial'
    end
    object RejBinvoGoodGaran: TStringField
      FieldName = 'Garan'
      Size = 45
    end
    object RejBinvoGoodProp: TStringField
      FieldName = 'Prop'
      Size = 200
    end
    object RejBinvoGoodOPfee: TCurrencyField
      FieldName = 'OPfee'
    end
    object RejBinvoGoodOPsum: TCurrencyField
      FieldName = 'OPsum'
    end
  end
  object RejBinvoGoodDs: TDataSource
    AutoEdit = False
    DataSet = RejBinvoGood
    Left = 195
    Top = 509
  end
  object Bill: TTable
    OnPostError = Far_PostErr
    AutoRefresh = True
    DatabaseName = 'ParFro'
    SessionName = 'Default'
    FieldDefs = <
      item
        Name = 'id'
        DataType = ftAutoInc
      end
      item
        Name = 'No'
        DataType = ftInteger
      end
      item
        Name = 'Dat'
        DataType = ftInteger
      end
      item
        Name = 'Bedsum'
        DataType = ftCurrency
      end
      item
        Name = 'Bessum'
        DataType = ftCurrency
      end
      item
        Name = 'Des'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'LPerm'
        Attributes = [faRequired]
        DataType = ftBoolean
      end
      item
        Name = 'Atf'
        DataType = ftInteger
      end
      item
        Name = 'Tip'
        DataType = ftSmallint
      end>
    IndexDefs = <
      item
        Name = 'PK_Bill'
        Fields = 'id'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'IX_Bill'
        Fields = 'No'
        Options = [ixUnique]
      end
      item
        Name = '_WA_Sys_Dat_7E6CC920'
        Fields = 'Dat'
      end
      item
        Name = '_WA_Sys_Bedsum_7E6CC920'
        Fields = 'Bedsum'
      end
      item
        Name = '_WA_Sys_Bessum_7E6CC920'
        Fields = 'Bessum'
      end
      item
        Name = '_WA_Sys_Des_7E6CC920'
        Fields = 'Des'
      end
      item
        Name = '_WA_Sys_LPerm_7E6CC920'
        Fields = 'LPerm'
      end
      item
        Name = '_WA_Sys_Atf_7E6CC920'
        Fields = 'Atf'
      end
      item
        Name = '_WA_Sys_Tip_7E6CC920'
        Fields = 'Tip'
      end>
    IndexFieldNames = 'No'
    StoreDefs = True
    TableName = 'dbo.Bill'
    Left = 22
    Top = 56
    object Billid: TAutoIncField
      FieldName = 'id'
      Visible = False
    end
    object BillNo: TIntegerField
      DisplayLabel = '⁄ÿ›'
      FieldName = 'No'
    end
    object BillDat: TIntegerField
      DisplayLabel = ' «—ÌŒ'
      FieldName = 'Dat'
      DisplayFormat = '####/##/##'
      EditFormat = '####/##/##'
    end
    object BillBedSum: TCurrencyField
      Alignment = taLeftJustify
      DisplayLabel = 'Ã„⁄ »œÂò«—'
      FieldName = 'BedSum'
    end
    object BillBesSum: TCurrencyField
      Alignment = taLeftJustify
      DisplayLabel = 'Ã„⁄ »” «‰ò«—'
      FieldName = 'BesSum'
    end
    object BillDesc: TStringField
      Alignment = taRightJustify
      DisplayLabel = '‘—Õ'
      FieldName = 'Des'
      Size = 200
    end
    object BillPerm: TBooleanField
      FieldName = 'LPerm'
    end
    object BillAtf: TIntegerField
      DisplayLabel = '‘„«—Â'
      FieldName = 'Atf'
    end
    object BillTip: TSmallintField
      FieldName = 'Tip'
    end
  end
  object BillDs: TDataSource
    AutoEdit = False
    DataSet = Bill
    Left = 104
    Top = 365
  end
  object AutoBill: TTable
    OnPostError = Far_PostErr
    AutoRefresh = True
    DatabaseName = 'ParFro'
    SessionName = 'Default'
    FieldDefs = <
      item
        Name = 'Var'
        Attributes = [faRequired]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Caption'
        Attributes = [faRequired]
        DataType = ftString
        Size = 45
      end
      item
        Name = 'BesKod'
        DataType = ftFloat
      end
      item
        Name = 'BehKod'
        DataType = ftFloat
      end
      item
        Name = 'Stat'
        Attributes = [faRequired]
        DataType = ftBoolean
      end>
    IndexDefs = <
      item
        Name = 'PK_Autobill'
        Fields = 'Var'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'Autobill0'
        Fields = 'Var'
        Options = [ixUnique]
      end
      item
        Name = '_WA_Sys_Caption_7B905C75'
        Fields = 'Caption'
      end
      item
        Name = '_WA_Sys_BesKod_7B905C75'
        Fields = 'BesKod'
      end
      item
        Name = '_WA_Sys_BehKod_7B905C75'
        Fields = 'BehKod'
      end
      item
        Name = '_WA_Sys_Stat_7B905C75'
        Fields = 'Stat'
      end>
    IndexFieldNames = 'Var'
    StoreDefs = True
    TableName = 'dbo.Autobill'
    Left = 104
    Top = 8
    object AutoBillVar: TStringField
      FieldName = 'Var'
      Size = 10
    end
    object AutoBillCaption: TStringField
      FieldName = 'Caption'
      Size = 45
    end
    object AutoBillBesKod: TFloatField
      FieldName = 'BesKod'
    end
    object AutoBillBehKod: TFloatField
      FieldName = 'BehKod'
    end
    object AutoBillStat: TBooleanField
      FieldName = 'Stat'
    end
  end
  object AutoBillDs: TDataSource
    AutoEdit = False
    DataSet = AutoBill
    Left = 165
    Top = 509
  end
  object AcKod: TTable
    Tag = -1
    OnPostError = Far_PostErr
    AutoRefresh = True
    DatabaseName = 'ParFro'
    SessionName = 'Default'
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'Nam'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Acckod'
        DataType = ftFloat
      end
      item
        Name = 'Kkol'
        DataType = ftInteger
      end
      item
        Name = 'Kmo'
        DataType = ftInteger
      end
      item
        Name = 'Kgro'
        DataType = ftInteger
      end
      item
        Name = 'Ktaf'
        DataType = ftInteger
      end
      item
        Name = 'Kdas'
        DataType = ftInteger
      end
      item
        Name = 'Usekod'
        DataType = ftSmallint
      end
      item
        Name = 'LPerm'
        Attributes = [faRequired]
        DataType = ftBoolean
      end
      item
        Name = 'Mah'
        DataType = ftInteger
      end
      item
        Name = 'Tel'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Adr'
        DataType = ftString
        Size = 140
      end
      item
        Name = 'Pcred'
        DataType = ftCurrency
      end
      item
        Name = 'Ename'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Kgp'
        DataType = ftInteger
      end
      item
        Name = 'State'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'City'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Regon'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Barzi'
        DataType = ftBoolean
      end>
    IndexDefs = <
      item
        Name = 'PK_AccountKod'
        Fields = 'Id'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'AccountKod0'
        Fields = 'Nam'
      end
      item
        Name = 'AcKoIxAccKod'
        Fields = 'Acckod'
        Options = [ixUnique]
      end
      item
        Name = '_WA_Sys_Usekod_76CBA758'
        Fields = 'Usekod'
      end
      item
        Name = '_WA_Sys_Kdas_76CBA758'
        Fields = 'Kdas'
      end
      item
        Name = '_WA_Sys_Kgro_76CBA758'
        Fields = 'Kgro'
      end
      item
        Name = '_WA_Sys_Kkol_76CBA758'
        Fields = 'Kkol'
      end
      item
        Name = '_WA_Sys_Kmo_76CBA758'
        Fields = 'Kmo'
      end
      item
        Name = '_WA_Sys_Ktaf_76CBA758'
        Fields = 'Ktaf'
      end
      item
        Name = '_WA_Sys_LPerm_76CBA758'
        Fields = 'LPerm'
      end
      item
        Name = '_WA_Sys_Mah_76CBA758'
        Fields = 'Mah'
      end
      item
        Name = '_WA_Sys_Tel_76CBA758'
        Fields = 'Tel'
      end
      item
        Name = '_WA_Sys_Adr_76CBA758'
        Fields = 'Adr'
      end
      item
        Name = '_WA_Sys_Pcred_76CBA758'
        Fields = 'Pcred'
      end
      item
        Name = '_WA_Sys_Ename_76CBA758'
        Fields = 'Ename'
      end
      item
        Name = '_WA_Sys_Kgp_76CBA758'
        Fields = 'Kgp'
      end
      item
        Name = '_WA_Sys_State_76CBA758'
        Fields = 'State'
      end
      item
        Name = '_WA_Sys_City_76CBA758'
        Fields = 'City'
      end
      item
        Name = '_WA_Sys_Regon_76CBA758'
        Fields = 'Regon'
      end
      item
        Name = '_WA_Sys_Barzi_76CBA758'
        Fields = 'Barzi'
      end>
    IndexFieldNames = 'Acckod'
    StoreDefs = True
    TableName = 'dbo.AccountKod'
    Left = 48
    Top = 8
    object AcKodId: TAutoIncField
      FieldName = 'Id'
      Visible = False
    end
    object AcKodNam: TStringField
      DisplayWidth = 45
      FieldName = 'Nam'
      Required = True
      Size = 45
    end
    object AcKodAcckod: TFloatField
      DisplayWidth = 27
      FieldName = 'Acckod'
    end
    object AcKodKkol: TIntegerField
      FieldName = 'Kkol'
      Visible = False
    end
    object AcKodKmo: TIntegerField
      FieldName = 'Kmo'
      Visible = False
    end
    object AcKodKgro: TIntegerField
      FieldName = 'Kgro'
      Visible = False
    end
    object AcKodKtaf: TIntegerField
      FieldName = 'Ktaf'
      Visible = False
    end
    object AcKodKdas: TIntegerField
      FieldName = 'Kdas'
      Visible = False
    end
    object AcKodUseKod: TSmallintField
      FieldName = 'UseKod'
      Visible = False
    end
    object AcKodPerm: TBooleanField
      FieldName = 'LPerm'
      Visible = False
    end
    object AcKodMah: TIntegerField
      FieldName = 'Mah'
      Visible = False
    end
    object AcKodTel: TStringField
      DisplayWidth = 20
      FieldName = 'Tel'
    end
    object AcKodAdd: TStringField
      Alignment = taRightJustify
      DisplayWidth = 140
      FieldName = 'Adr'
      Size = 140
    end
    object AcKodPcred: TCurrencyField
      Alignment = taLeftJustify
      DefaultExpression = #39'0'#39
      DisplayWidth = 10
      FieldName = 'Pcred'
    end
    object AcKodEname: TStringField
      FieldName = 'Ename'
      Size = 45
    end
    object AcKodKgp: TSmallintField
      FieldName = 'Kgp'
      Visible = False
    end
    object AcKodState: TStringField
      DisplayWidth = 45
      FieldName = 'State'
      Size = 45
    end
    object AcKodCity: TStringField
      DisplayWidth = 45
      FieldName = 'City'
      Size = 45
    end
    object AcKodRegon: TStringField
      DisplayWidth = 20
      FieldName = 'Regon'
    end
    object AcKodBarzi: TBooleanField
      FieldName = 'Barzi'
    end
  end
  object Depot: TTable
    OnPostError = Far_PostErr
    AutoRefresh = True
    DatabaseName = 'ParFro'
    SessionName = 'Default'
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'Kod'
        DataType = ftInteger
      end
      item
        Name = 'Gene'
        DataType = ftInteger
      end
      item
        Name = 'Nam'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Color'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Anbnam'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Anbkod'
        DataType = ftFloat
      end
      item
        Name = 'Quant'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'PK_Depot'
        Fields = 'Id'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'DepotIxFind'
        Fields = 'Kod;Color;Anbnam;Anbkod'
      end>
    StoreDefs = True
    TableName = 'dbo.Depot'
    Left = 158
    Top = 107
    object DepotId: TAutoIncField
      FieldName = 'Id'
      ReadOnly = True
      Visible = False
    end
    object DepotKod: TIntegerField
      DisplayLabel = 'òœ ò«·«'
      FieldName = 'Kod'
    end
    object DepotGene: TIntegerField
      DisplayLabel = 'òœ ⁄„Ê„Ì'
      FieldName = 'Gene'
    end
    object DepotNam: TStringField
      DisplayLabel = '‘—Õ ò«·«'
      FieldName = 'Nam'
      Size = 100
    end
    object DepotColor: TStringField
      DisplayLabel = '„œ·'
      FieldName = 'Color'
    end
    object DepotAnbNam: TStringField
      DisplayLabel = '‰«„ «‰»«—'
      FieldName = 'AnbNam'
      Size = 45
    end
    object DepotAnbkod: TFloatField
      DisplayLabel = 'Œ—ÊÃ ‰‘œÂ'
      FieldName = 'Anbkod'
    end
    object DepotQuant: TFloatField
      DisplayLabel = '„ﬁœ«—'
      FieldName = 'Quant'
    end
  end
  object DepotDs: TDataSource
    AutoEdit = False
    DataSet = Depot
    Left = 221
    Top = 411
  end
  object AcKodDs: TDataSource
    AutoEdit = False
    DataSet = AcKod
    Left = 15
    Top = 411
  end
  object Color: TTable
    OnPostError = Far_PostErr
    AutoRefresh = True
    DatabaseName = 'ParFro'
    SessionName = 'Default'
    FieldDefs = <
      item
        Name = 'Color'
        Attributes = [faRequired]
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Id'
        DataType = ftAutoInc
      end>
    StoreDefs = True
    TableName = 'dbo.Colors'
    Left = 74
    Top = 154
    object ColorColor: TStringField
      FieldName = 'Color'
      Size = 45
    end
    object ColorId: TAutoIncField
      FieldName = 'Id'
      ReadOnly = True
    end
  end
  object ColorDs: TDataSource
    AutoEdit = False
    DataSet = Color
    Left = 15
    Top = 365
  end
  object GGoz: TTable
    OnPostError = Far_PostErr
    AutoRefresh = True
    DatabaseName = 'ParFro'
    SessionName = 'Default'
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'Dat'
        DataType = ftInteger
      end
      item
        Name = 'Nam'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Good'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Quant'
        DataType = ftFloat
      end
      item
        Name = 'Fee'
        DataType = ftCurrency
      end
      item
        Name = 'Total'
        DataType = ftCurrency
      end>
    StoreDefs = True
    TableName = 'dbo.GGoz'
    Left = 46
    Top = 154
    object GGozId: TAutoIncField
      FieldName = 'Id'
      Visible = False
    end
    object GGozDat: TIntegerField
      FieldName = 'Dat'
    end
    object GGozNam: TStringField
      FieldName = 'Nam'
      Size = 100
    end
    object GGozGood: TStringField
      FieldName = 'Good'
      Size = 100
    end
    object GGozQuant: TFloatField
      FieldName = 'Quant'
    end
    object GGozFee: TCurrencyField
      FieldName = 'Fee'
    end
    object GGozTotal: TCurrencyField
      FieldName = 'Total'
    end
  end
  object GGozDs: TDataSource
    AutoEdit = False
    DataSet = GGoz
    Left = 106
    Top = 509
  end
  object Visit: TTable
    AfterOpen = VisitAfterScroll
    AfterPost = VisitAfterScroll
    AfterScroll = VisitAfterScroll
    OnPostError = Far_PostErr
    AutoRefresh = True
    DatabaseName = 'ParFro'
    SessionName = 'Default'
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'Code'
        DataType = ftInteger
      end
      item
        Name = 'Nam'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Tel'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'City'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Adr'
        DataType = ftString
        Size = 145
      end
      item
        Name = 'Bdat'
        DataType = ftInteger
      end
      item
        Name = 'Perc'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'VisitIndex1'
        Fields = 'Code'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'dbo.Visitors'
    Left = 74
    Top = 107
    object VisitId: TAutoIncField
      FieldName = 'Id'
      Visible = False
    end
    object VisitCode: TIntegerField
      FieldName = 'Code'
    end
    object VisitNam: TStringField
      Alignment = taRightJustify
      FieldName = 'Nam'
      Size = 45
    end
    object VisitTel: TStringField
      FieldName = 'Tel'
      Size = 25
    end
    object VisitCity: TStringField
      Alignment = taRightJustify
      FieldName = 'City'
      Size = 45
    end
    object VisitAdd: TStringField
      Alignment = taRightJustify
      FieldName = 'Adr'
      Size = 145
    end
    object VisitBdat: TIntegerField
      FieldName = 'Bdat'
      DisplayFormat = '0000/00/00'
      EditFormat = '0000/00/00'
    end
    object VisitPerc: TFloatField
      FieldName = 'Perc'
    end
  end
  object VisitDs: TDataSource
    AutoEdit = False
    DataSet = Visit
    Left = 193
    Top = 365
  end
  object Rsaf: TTable
    AutoRefresh = True
    DatabaseName = 'ParFro'
    SessionName = 'Default'
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'Bno'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Dat'
        DataType = ftInteger
      end
      item
        Name = 'Nam'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Adr'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Pbill'
        DataType = ftCurrency
      end
      item
        Name = 'Statue'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'FNo'
        DataType = ftInteger
      end
      item
        Name = 'Sprice'
        DataType = ftCurrency
      end
      item
        Name = 'Qt'
        DataType = ftSmallint
      end
      item
        Name = 'Pprice'
        DataType = ftCurrency
      end
      item
        Name = 'Daf'
        DataType = ftInteger
      end>
    StoreDefs = True
    TableName = 'dbo.RSaf'
    Left = 18
    Top = 154
    object RsafId: TAutoIncField
      FieldName = 'Id'
      Visible = False
    end
    object RsafBno: TStringField
      Alignment = taRightJustify
      FieldName = 'Bno'
    end
    object RsafDat: TIntegerField
      FieldName = 'Dat'
      DisplayFormat = '####/##/##'
      EditFormat = '####/##/##'
    end
    object RsafNam: TStringField
      Alignment = taRightJustify
      FieldName = 'Nam'
      Size = 45
    end
    object RsafAdd: TStringField
      Alignment = taRightJustify
      FieldName = 'Adr'
      Size = 100
    end
    object RsafPbill: TCurrencyField
      Alignment = taLeftJustify
      FieldName = 'Pbill'
    end
    object RsafStatue: TStringField
      FieldName = 'Statue'
    end
    object RsafFNo: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'FNo'
    end
    object RsafSprice: TCurrencyField
      Alignment = taLeftJustify
      FieldName = 'Sprice'
    end
    object RsafQt: TSmallintField
      Alignment = taCenter
      FieldName = 'Qt'
    end
    object RsafPprice: TCurrencyField
      Alignment = taLeftJustify
      FieldName = 'Pprice'
    end
    object RsafDaf: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'Daf'
    end
  end
  object RsafDs: TDataSource
    AutoEdit = False
    DataSet = Rsaf
    Left = 45
    Top = 459
  end
  object RMon: TTable
    BeforeEdit = RMonBeforeEdit
    BeforePost = RMonBeforePost
    AfterPost = RMonAfterPost
    BeforeDelete = RMonBeforeDelete
    AutoRefresh = True
    DatabaseName = 'ParFro'
    SessionName = 'Default'
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'No'
        DataType = ftInteger
      end
      item
        Name = 'Dat'
        DataType = ftInteger
      end
      item
        Name = 'Price'
        DataType = ftCurrency
      end
      item
        Name = 'Accnam'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Des'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'BnO'
        DataType = ftInteger
      end
      item
        Name = 'Inv'
        DataType = ftInteger
      end
      item
        Name = 'Cost'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Ckod'
        DataType = ftInteger
      end
      item
        Name = 'Ctip'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Cprice'
        DataType = ftCurrency
      end
      item
        Name = 'Rate'
        DataType = ftCurrency
      end
      item
        Name = 'Cakod'
        DataType = ftFloat
      end
      item
        Name = 'Cwage'
        DataType = ftCurrency
      end
      item
        Name = 'Lperm'
        Attributes = [faRequired]
        DataType = ftBoolean
      end>
    StoreDefs = True
    TableName = 'dbo.RMon'
    Left = 186
    Top = 107
    object RMonId: TAutoIncField
      FieldName = 'Id'
      Visible = False
    end
    object RMonNo: TIntegerField
      DisplayWidth = 10
      FieldName = 'No'
      Required = True
    end
    object RMonDat: TIntegerField
      DisplayWidth = 10
      FieldName = 'Dat'
      Required = True
      DisplayFormat = '####/##/##'
      EditFormat = '####/##/##'
    end
    object RMonPrice: TCurrencyField
      DisplayWidth = 10
      FieldName = 'Price'
      Required = True
    end
    object RMonAccNam: TStringField
      DisplayWidth = 18
      FieldName = 'AccNam'
      Size = 45
    end
    object RMonDes: TStringField
      Alignment = taRightJustify
      DisplayWidth = 26
      FieldName = 'Des'
      Size = 200
    end
    object RMonBnO: TIntegerField
      DisplayWidth = 10
      FieldName = 'BnO'
    end
    object RMonInv: TIntegerField
      DisplayWidth = 10
      FieldName = 'Inv'
    end
    object RMonCost: TStringField
      DisplayWidth = 14
      FieldName = 'Cost'
      Size = 45
    end
    object RMonCkod: TIntegerField
      DisplayWidth = 10
      FieldName = 'Ckod'
    end
    object RMonCtip: TStringField
      DisplayWidth = 15
      FieldName = 'Ctip'
      Size = 15
    end
    object RMonCPrice: TCurrencyField
      DisplayWidth = 10
      FieldName = 'CPrice'
    end
    object RMonRate: TCurrencyField
      DisplayWidth = 10
      FieldName = 'Rate'
    end
    object RMonCakod: TFloatField
      DisplayWidth = 10
      FieldName = 'Cakod'
      Required = True
    end
    object RMonCwage: TCurrencyField
      DisplayWidth = 10
      FieldName = 'Cwage'
    end
    object RMonLperm: TBooleanField
      FieldName = 'Lperm'
    end
  end
  object RMonDs: TDataSource
    AutoEdit = False
    DataSet = RMon
    Left = 16
    Top = 509
  end
  object PMon: TTable
    BeforeEdit = PMonBeforeEdit
    AfterPost = PMonAfterPost
    BeforeDelete = PMonBeforeDelete
    AutoRefresh = True
    DatabaseName = 'ParFro'
    SessionName = 'Default'
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'No'
        DataType = ftInteger
      end
      item
        Name = 'Dat'
        DataType = ftInteger
      end
      item
        Name = 'Price'
        DataType = ftCurrency
      end
      item
        Name = 'Accnam'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Des'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'Bno'
        DataType = ftInteger
      end
      item
        Name = 'Inv'
        DataType = ftInteger
      end
      item
        Name = 'Cost'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Ckod'
        DataType = ftInteger
      end
      item
        Name = 'Ctip'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Cprice'
        DataType = ftCurrency
      end
      item
        Name = 'Rate'
        DataType = ftCurrency
      end
      item
        Name = 'Cakod'
        DataType = ftFloat
      end
      item
        Name = 'Cwage'
        DataType = ftCurrency
      end
      item
        Name = 'Lperm'
        Attributes = [faRequired]
        DataType = ftBoolean
      end>
    StoreDefs = True
    TableName = 'dbo.PMon'
    Left = 214
    Top = 107
    object PMonId: TAutoIncField
      FieldName = 'Id'
      Visible = False
    end
    object PMonNo: TIntegerField
      FieldName = 'No'
      Required = True
    end
    object PMonDat: TIntegerField
      FieldName = 'Dat'
      Required = True
      DisplayFormat = '####/##/##'
      EditFormat = '####/##/##'
    end
    object PMonPrice: TCurrencyField
      FieldName = 'Price'
      Required = True
    end
    object PMonAccNam: TStringField
      FieldName = 'AccNam'
      Size = 45
    end
    object PMonDes: TStringField
      Alignment = taRightJustify
      FieldName = 'Des'
      Size = 200
    end
    object PMonBno: TIntegerField
      FieldName = 'Bno'
    end
    object PMonInv: TIntegerField
      FieldName = 'Inv'
    end
    object PMonCost: TStringField
      FieldName = 'Cost'
      Size = 45
    end
    object PMonCkod: TIntegerField
      FieldName = 'Ckod'
    end
    object PMonCtip: TStringField
      FieldName = 'Ctip'
      Size = 15
    end
    object PMonCprice: TCurrencyField
      FieldName = 'Cprice'
    end
    object PMonRate: TCurrencyField
      FieldName = 'Rate'
    end
    object PMonCakod: TFloatField
      FieldName = 'Cakod'
      Required = True
    end
    object PMonCwage: TCurrencyField
      FieldName = 'Cwage'
    end
    object PMonLperm: TBooleanField
      FieldName = 'Lperm'
    end
  end
  object PmonDs: TDataSource
    AutoEdit = False
    DataSet = PMon
    Left = 74
    Top = 459
  end
  object NFish: TTable
    BeforeEdit = NFishBeforeEdit
    AfterPost = NFishAfterPost
    BeforeDelete = NFishBeforeDelete
    AutoRefresh = True
    DatabaseName = 'ParFro'
    SessionName = 'Default'
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'No'
        DataType = ftInteger
      end
      item
        Name = 'Dat'
        DataType = ftInteger
      end
      item
        Name = 'Price'
        DataType = ftCurrency
      end
      item
        Name = 'Jari'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Des'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'Accnam'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Bno'
        DataType = ftInteger
      end
      item
        Name = 'Inv'
        DataType = ftInteger
      end
      item
        Name = 'Cost'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Ckod'
        DataType = ftInteger
      end
      item
        Name = 'Ctip'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Cprice'
        DataType = ftCurrency
      end
      item
        Name = 'Rate'
        DataType = ftCurrency
      end
      item
        Name = 'Cwage'
        DataType = ftCurrency
      end
      item
        Name = 'Lperm'
        Attributes = [faRequired]
        DataType = ftBoolean
      end>
    StoreDefs = True
    TableName = 'dbo.NFish'
    Left = 50
    Top = 56
    object NFishId: TAutoIncField
      FieldName = 'Id'
      Visible = False
    end
    object NFishNo: TIntegerField
      FieldName = 'No'
    end
    object NFishDat: TIntegerField
      FieldName = 'Dat'
      DisplayFormat = '####/##/##'
      EditFormat = '####/##/##'
    end
    object NFishPrice: TCurrencyField
      FieldName = 'Price'
    end
    object NFishJari: TStringField
      FieldName = 'Jari'
    end
    object NFishDes: TStringField
      Alignment = taRightJustify
      FieldName = 'Des'
      Size = 200
    end
    object NFishAccNam: TStringField
      FieldName = 'AccNam'
      Size = 45
    end
    object NFishBno: TIntegerField
      FieldName = 'Bno'
    end
    object NFishInv: TIntegerField
      FieldName = 'Inv'
    end
    object NFishCost: TStringField
      FieldName = 'Cost'
      Size = 45
    end
    object NFishCkod: TIntegerField
      FieldName = 'Ckod'
    end
    object NFishCtip: TStringField
      FieldName = 'Ctip'
      Size = 15
    end
    object NFishCprice: TCurrencyField
      FieldName = 'Cprice'
    end
    object NFishRate: TCurrencyField
      FieldName = 'Rate'
    end
    object NFishCwage: TCurrencyField
      FieldName = 'Cwage'
    end
    object NFishLperm: TBooleanField
      FieldName = 'Lperm'
    end
  end
  object NFishDs: TDataSource
    AutoEdit = False
    DataSet = NFish
    Left = 46
    Top = 509
  end
  object BHav: TTable
    BeforeEdit = BHavBeforeEdit
    AfterPost = BHavAfterPost
    BeforeDelete = BHavBeforeDelete
    AutoRefresh = True
    DatabaseName = 'ParFro'
    SessionName = 'Default'
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'No'
        DataType = ftInteger
      end
      item
        Name = 'Dat'
        DataType = ftInteger
      end
      item
        Name = 'Price'
        DataType = ftCurrency
      end
      item
        Name = 'Jari'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Des'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'Facno'
        DataType = ftInteger
      end
      item
        Name = 'Accnam'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Bno'
        DataType = ftInteger
      end
      item
        Name = 'Inv'
        DataType = ftInteger
      end
      item
        Name = 'Cost'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Ckod'
        DataType = ftInteger
      end
      item
        Name = 'Ctip'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Cprice'
        DataType = ftCurrency
      end
      item
        Name = 'Rate'
        DataType = ftCurrency
      end
      item
        Name = 'Cwage'
        DataType = ftCurrency
      end
      item
        Name = 'Lperm'
        Attributes = [faRequired]
        DataType = ftBoolean
      end>
    IndexDefs = <
      item
        Name = 'PK_BHav'
        Fields = 'Id'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = '_WA_Sys_No_0EA330E9'
        Fields = 'No'
      end
      item
        Name = '_WA_Sys_Cwage_0EA330E9'
        Fields = 'Cwage'
      end
      item
        Name = '_WA_Sys_Rate_0EA330E9'
        Fields = 'Rate'
      end
      item
        Name = '_WA_Sys_Cprice_0EA330E9'
        Fields = 'Cprice'
      end
      item
        Name = '_WA_Sys_Ctip_0EA330E9'
        Fields = 'Ctip'
      end
      item
        Name = '_WA_Sys_Ckod_0EA330E9'
        Fields = 'Ckod'
      end
      item
        Name = '_WA_Sys_Cost_0EA330E9'
        Fields = 'Cost'
      end
      item
        Name = '_WA_Sys_Inv_0EA330E9'
        Fields = 'Inv'
      end
      item
        Name = '_WA_Sys_Bno_0EA330E9'
        Fields = 'Bno'
      end
      item
        Name = '_WA_Sys_Accnam_0EA330E9'
        Fields = 'Accnam'
      end
      item
        Name = '_WA_Sys_Facno_0EA330E9'
        Fields = 'Facno'
      end
      item
        Name = '_WA_Sys_Des_0EA330E9'
        Fields = 'Des'
      end
      item
        Name = '_WA_Sys_Jari_0EA330E9'
        Fields = 'Jari'
      end
      item
        Name = '_WA_Sys_Price_0EA330E9'
        Fields = 'Price'
      end
      item
        Name = '_WA_Sys_Dat_0EA330E9'
        Fields = 'Dat'
      end>
    StoreDefs = True
    TableName = 'dbo.BHav'
    Left = 242
    Top = 107
    object BHavId: TAutoIncField
      FieldName = 'Id'
      Visible = False
    end
    object BHavNo: TIntegerField
      FieldName = 'No'
    end
    object BHavDat: TIntegerField
      FieldName = 'Dat'
      DisplayFormat = '####/##/##'
    end
    object BHavPrice: TCurrencyField
      FieldName = 'Price'
    end
    object BHavJari: TStringField
      FieldName = 'Jari'
    end
    object BHavDes: TStringField
      Alignment = taRightJustify
      FieldName = 'Des'
      Size = 200
    end
    object BHavFacno: TIntegerField
      FieldName = 'Facno'
    end
    object BHavAccNam: TStringField
      FieldName = 'AccNam'
      Size = 45
    end
    object BHavBNo: TIntegerField
      FieldName = 'BNo'
    end
    object BHavInv: TIntegerField
      FieldName = 'Inv'
    end
    object BHavCost: TStringField
      FieldName = 'Cost'
      Size = 45
    end
    object BHavCkod: TIntegerField
      FieldName = 'Ckod'
    end
    object BHavCtip: TStringField
      FieldName = 'Ctip'
      Size = 15
    end
    object BHavCprice: TCurrencyField
      FieldName = 'Cprice'
    end
    object BHavRate: TCurrencyField
      FieldName = 'Rate'
    end
    object BHavCwage: TCurrencyField
      FieldName = 'Cwage'
    end
    object BHavLPerm: TBooleanField
      FieldName = 'LPerm'
    end
  end
  object BHavDs: TDataSource
    AutoEdit = False
    DataSet = BHav
    Left = 252
    Top = 459
  end
  object Aghs: TTable
    AutoRefresh = True
    DatabaseName = 'ParFro'
    SessionName = 'Default'
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'No'
        DataType = ftInteger
      end
      item
        Name = 'Dat'
        DataType = ftInteger
      end
      item
        Name = 'Nam'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Gprice'
        DataType = ftCurrency
      end
      item
        Name = 'RNo'
        DataType = ftInteger
      end
      item
        Name = 'Payed'
        Attributes = [faRequired]
        DataType = ftBoolean
      end
      item
        Name = 'RDat'
        DataType = ftInteger
      end>
    StoreDefs = True
    TableName = 'dbo.Aghs'
    Left = 106
    Top = 56
    object AghsId: TAutoIncField
      FieldName = 'Id'
      Visible = False
    end
    object AghsNo: TAutoIncField
      FieldName = 'No'
      ReadOnly = True
    end
    object AghsDat: TIntegerField
      FieldName = 'Dat'
      DisplayFormat = '####/##/##'
    end
    object AghsNam: TStringField
      FieldName = 'Nam'
      Size = 45
    end
    object AghsGprice: TCurrencyField
      FieldName = 'Gprice'
    end
    object AghsRNo: TIntegerField
      FieldName = 'RNo'
    end
    object AghsPayed: TBooleanField
      FieldName = 'Payed'
    end
    object AghsRDat: TIntegerField
      FieldName = 'RDat'
      DisplayFormat = '####/##/##'
    end
  end
  object AghsDs: TDataSource
    AutoEdit = False
    DataSet = Aghs
    Left = 163
    Top = 365
  end
  object Tol: TTable
    AutoRefresh = True
    DatabaseName = 'ParFro'
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'No'
        DataType = ftInteger
      end
      item
        Name = 'Dat'
        DataType = ftInteger
      end
      item
        Name = 'Eco'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Inp'
        DataType = ftCurrency
      end
      item
        Name = 'Outp'
        DataType = ftCurrency
      end
      item
        Name = 'Des'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'LPerm'
        Attributes = [faRequired]
        DataType = ftBoolean
      end>
    StoreDefs = True
    TableName = 'dbo.Tolids'
    Left = 214
    Top = 154
    object TolId: TAutoIncField
      FieldName = 'Id'
      Visible = False
    end
    object TolNo: TIntegerField
      FieldName = 'No'
    end
    object TolDat: TIntegerField
      FieldName = 'Dat'
      DisplayFormat = '####/##/##'
    end
    object TolEco: TStringField
      FieldName = 'Eco'
    end
    object TolInp: TCurrencyField
      FieldName = 'Inp'
    end
    object TolOutp: TCurrencyField
      FieldName = 'Outp'
    end
    object TolDes: TStringField
      FieldName = 'Des'
      Size = 200
    end
    object TolPerm: TBooleanField
      FieldName = 'LPerm'
    end
  end
  object TolDs: TDataSource
    AutoEdit = False
    DataSet = Tol
    Left = 224
    Top = 509
  end
  object GCH: TTable
    AutoRefresh = True
    DatabaseName = 'ParFro'
    SessionName = 'Default'
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'Des'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Kol'
        DataType = ftSmallint
      end
      item
        Name = 'Mo'
        DataType = ftSmallint
      end
      item
        Name = 'Taf'
        DataType = ftSmallint
      end>
    StoreDefs = True
    TableName = 'dbo.GChart'
    Left = 242
    Top = 154
    object GCHId: TAutoIncField
      FieldName = 'Id'
      Visible = False
    end
    object GCHDes: TStringField
      FieldName = 'Des'
      Size = 45
    end
    object GCHKol: TSmallintField
      FieldName = 'Kol'
    end
    object GCHMo: TSmallintField
      FieldName = 'Mo'
    end
    object GCHTaf: TSmallintField
      FieldName = 'Taf'
    end
  end
  object GCHDs: TDataSource
    AutoEdit = False
    DataSet = GCH
    Left = 252
    Top = 509
  end
  object RRes: TTable
    AfterOpen = RResAfterEdit
    BeforeEdit = RResBeforeEdit
    AfterEdit = RResAfterEdit
    AfterPost = RResAfterPost
    BeforeDelete = RResBeforeDelete
    AfterScroll = RResAfterEdit
    AutoRefresh = True
    DatabaseName = 'ParFro'
    SessionName = 'Default'
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'No'
        DataType = ftInteger
      end
      item
        Name = 'Dat'
        DataType = ftInteger
      end
      item
        Name = 'Acckod'
        DataType = ftFloat
      end
      item
        Name = 'Acnam'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Psum'
        DataType = ftCurrency
      end
      item
        Name = 'Des'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'LPerm'
        Attributes = [faRequired]
        DataType = ftBoolean
      end
      item
        Name = 'Billed'
        Attributes = [faRequired]
        DataType = ftBoolean
      end
      item
        Name = 'Bno'
        DataType = ftInteger
      end
      item
        Name = 'Inv'
        DataType = ftInteger
      end
      item
        Name = 'Cost'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Ckod'
        DataType = ftInteger
      end
      item
        Name = 'Ctip'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Cprice'
        DataType = ftCurrency
      end
      item
        Name = 'Rate'
        DataType = ftCurrency
      end
      item
        Name = 'Cwage'
        DataType = ftCurrency
      end>
    StoreDefs = True
    TableName = 'dbo.RRes'
    Left = 335
    Top = 405
    object RResId: TAutoIncField
      FieldName = 'Id'
      Visible = False
    end
    object RResNo: TIntegerField
      DisplayLabel = '‘„«—Â'
      FieldName = 'No'
    end
    object RResDat: TIntegerField
      DisplayLabel = ' «—ÌŒ'
      FieldName = 'Dat'
      DisplayFormat = '####/##/##'
    end
    object RResAcckod: TFloatField
      FieldName = 'Acckod'
    end
    object RResAcnam: TStringField
      FieldName = 'Acnam'
      Size = 45
    end
    object RResPsum: TCurrencyField
      DisplayLabel = 'Ã„⁄'
      FieldName = 'Psum'
    end
    object RResDes: TStringField
      Alignment = taRightJustify
      DisplayLabel = '‘—Õ'
      FieldName = 'Des'
      Size = 200
    end
    object RResPerm: TBooleanField
      FieldName = 'LPerm'
    end
    object RResBilled: TBooleanField
      DisplayLabel = '’œÊ— ”‰œ'
      FieldName = 'Billed'
    end
    object RResBno: TIntegerField
      FieldName = 'Bno'
    end
    object RResInv: TIntegerField
      FieldName = 'Inv'
    end
    object RResCost: TStringField
      FieldName = 'Cost'
      Size = 45
    end
    object RResCkod: TIntegerField
      FieldName = 'Ckod'
    end
    object RResCtip: TStringField
      FieldName = 'Ctip'
      Size = 12
    end
    object RResCprice: TCurrencyField
      FieldName = 'Cprice'
    end
    object RResRate: TCurrencyField
      FieldName = 'Rate'
    end
    object RResCwage: TCurrencyField
      FieldName = 'Cwage'
    end
  end
  object RResDs: TDataSource
    AutoEdit = False
    DataSet = RRes
    Left = 335
    Top = 448
  end
  object RPay: TTable
    AfterOpen = RPayAfterEdit
    BeforeEdit = RPayBeforeEdit
    AfterEdit = RPayAfterEdit
    AfterPost = RPayAfterPost
    BeforeDelete = RPayBeforeDelete
    AfterScroll = RPayAfterEdit
    AutoRefresh = True
    DatabaseName = 'ParFro'
    SessionName = 'Default'
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'No'
        DataType = ftInteger
      end
      item
        Name = 'Dat'
        DataType = ftInteger
      end
      item
        Name = 'Acckod'
        DataType = ftFloat
      end
      item
        Name = 'Acnam'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Psum'
        DataType = ftCurrency
      end
      item
        Name = 'Des'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'LPerm'
        Attributes = [faRequired]
        DataType = ftBoolean
      end
      item
        Name = 'Billed'
        Attributes = [faRequired]
        DataType = ftBoolean
      end
      item
        Name = 'Bno'
        DataType = ftInteger
      end
      item
        Name = 'Cost'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Ckod'
        DataType = ftInteger
      end>
    StoreDefs = True
    TableName = 'dbo.RPay'
    Left = 363
    Top = 405
    object RPayId: TAutoIncField
      FieldName = 'Id'
      Visible = False
    end
    object RPayNo: TIntegerField
      FieldName = 'No'
    end
    object RPayDat: TIntegerField
      FieldName = 'Dat'
      DisplayFormat = '####/##/##'
    end
    object RPayAcckod: TFloatField
      FieldName = 'Acckod'
    end
    object RPayAcnam: TStringField
      FieldName = 'Acnam'
      Size = 45
    end
    object RPayPsum: TCurrencyField
      FieldName = 'Psum'
    end
    object RPayDes: TStringField
      Alignment = taRightJustify
      FieldName = 'Des'
      Size = 200
    end
    object RPayPerm: TBooleanField
      FieldName = 'LPerm'
    end
    object RPayBilled: TBooleanField
      FieldName = 'Billed'
    end
    object RPayBno: TIntegerField
      FieldName = 'Bno'
    end
    object RPayCost: TStringField
      FieldName = 'Cost'
      Size = 45
    end
    object RPayCkod: TIntegerField
      FieldName = 'Ckod'
    end
  end
  object RPayDs: TDataSource
    AutoEdit = False
    DataSet = RPay
    Left = 363
    Top = 448
  end
  object RPI: TTable
    AutoRefresh = True
    DatabaseName = 'ParFro'
    SessionName = 'Default'
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'Radif'
        DataType = ftInteger
      end
      item
        Name = 'Bdat'
        DataType = ftInteger
      end
      item
        Name = 'Bno'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Bank'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Pbill'
        DataType = ftCurrency
      end
      item
        Name = 'No'
        DataType = ftInteger
      end>
    StoreDefs = True
    TableName = 'dbo.Rpayi'
    Left = 364
    Top = 495
    object RPIId: TAutoIncField
      FieldName = 'Id'
      Visible = False
    end
    object RPIRadif: TIntegerField
      DisplayLabel = '—œÌ›'
      FieldName = 'Radif'
    end
    object RPIBdat: TIntegerField
      DisplayLabel = '”——”Ìœ'
      FieldName = 'Bdat'
      DisplayFormat = '####/##/##'
    end
    object RPIBno: TStringField
      DisplayLabel = '”—Ì«·'
      FieldName = 'Bno'
    end
    object RPIBank: TStringField
      DisplayLabel = '»«‰ò'
      FieldName = 'Bank'
      Size = 45
    end
    object RPIPbill: TCurrencyField
      DisplayLabel = '„»·€'
      FieldName = 'Pbill'
    end
    object RPINo: TIntegerField
      DisplayLabel = '‘„«—Â'
      FieldName = 'No'
    end
  end
  object RPIDs: TDataSource
    AutoEdit = False
    DataSet = RPI
    Left = 366
    Top = 541
  end
  object Rrej: TTable
    AfterOpen = RrejAfterEdit
    AfterEdit = RrejAfterEdit
    AfterScroll = RrejAfterEdit
    AutoRefresh = True
    DatabaseName = 'ParFro'
    SessionName = 'Default'
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'No'
        DataType = ftInteger
      end
      item
        Name = 'Dat'
        DataType = ftInteger
      end
      item
        Name = 'AccKod'
        DataType = ftFloat
      end
      item
        Name = 'Acnam'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Psum'
        DataType = ftCurrency
      end
      item
        Name = 'Des'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'LPerm'
        Attributes = [faRequired]
        DataType = ftBoolean
      end
      item
        Name = 'Billed'
        Attributes = [faRequired]
        DataType = ftBoolean
      end
      item
        Name = 'Bno'
        DataType = ftInteger
      end
      item
        Name = 'Cost'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Ckod'
        DataType = ftInteger
      end>
    StoreDefs = True
    TableName = 'dbo.RRej'
    Left = 391
    Top = 405
    object RrejId: TAutoIncField
      FieldName = 'Id'
      Visible = False
    end
    object RrejNo: TIntegerField
      FieldName = 'No'
    end
    object RrejDat: TIntegerField
      FieldName = 'Dat'
      DisplayFormat = '####/##/##'
    end
    object RrejAccKod: TFloatField
      FieldName = 'AccKod'
    end
    object RrejAcnam: TStringField
      FieldName = 'Acnam'
      Size = 45
    end
    object RrejPsum: TCurrencyField
      FieldName = 'Psum'
    end
    object RrejDes: TStringField
      Alignment = taRightJustify
      FieldName = 'Des'
      Size = 200
    end
    object RrejPerm: TBooleanField
      FieldName = 'LPerm'
    end
    object RrejBilled: TBooleanField
      FieldName = 'Billed'
    end
    object RrejBno: TIntegerField
      FieldName = 'Bno'
    end
    object RrejCost: TStringField
      FieldName = 'Cost'
      Size = 45
    end
    object RrejCkod: TIntegerField
      FieldName = 'Ckod'
    end
  end
  object RrejDs: TDataSource
    AutoEdit = False
    DataSet = Rrej
    Left = 391
    Top = 448
  end
  object RRI: TTable
    AutoRefresh = True
    DatabaseName = 'ParFro'
    SessionName = 'Default'
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'Radif'
        DataType = ftInteger
      end
      item
        Name = 'Bdat'
        DataType = ftInteger
      end
      item
        Name = 'Bno'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Bank'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Pbill'
        DataType = ftCurrency
      end
      item
        Name = 'Ackod'
        DataType = ftFloat
      end
      item
        Name = 'No'
        DataType = ftInteger
      end>
    StoreDefs = True
    TableName = 'dbo.Rreji'
    Left = 392
    Top = 495
    object RRIId: TAutoIncField
      FieldName = 'Id'
      Visible = False
    end
    object RRIRadif: TIntegerField
      DisplayLabel = '—œÌ›'
      FieldName = 'Radif'
    end
    object RRIBdat: TIntegerField
      DisplayLabel = '”——”Ìœ'
      FieldName = 'Bdat'
      DisplayFormat = '####/##/##'
    end
    object RRIBno: TStringField
      DisplayLabel = '”—Ì«·'
      FieldName = 'Bno'
    end
    object RRIBank: TStringField
      DisplayLabel = '»«‰ò'
      FieldName = 'Bank'
      Size = 45
    end
    object RRIPbill: TCurrencyField
      DisplayLabel = '„»·€'
      FieldName = 'Pbill'
    end
    object RRIAckod: TFloatField
      FieldName = 'Ackod'
    end
    object RRINo: TIntegerField
      DisplayLabel = '‘„«—Â'
      FieldName = 'No'
    end
  end
  object RRIDs: TDataSource
    AutoEdit = False
    DataSet = RRI
    Left = 394
    Top = 541
  end
  object Rvos: TTable
    AfterOpen = RvosAfterEdit
    AfterEdit = RvosAfterEdit
    AfterScroll = RvosAfterEdit
    AutoRefresh = True
    DatabaseName = 'ParFro'
    SessionName = 'Default'
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'No'
        DataType = ftInteger
      end
      item
        Name = 'Dat'
        DataType = ftInteger
      end
      item
        Name = 'AccKod'
        DataType = ftFloat
      end
      item
        Name = 'Acnam'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Psum'
        DataType = ftCurrency
      end
      item
        Name = 'Des'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'LPerm'
        Attributes = [faRequired]
        DataType = ftBoolean
      end
      item
        Name = 'Billed'
        Attributes = [faRequired]
        DataType = ftBoolean
      end
      item
        Name = 'Bno'
        DataType = ftInteger
      end
      item
        Name = 'Cost'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Ckod'
        DataType = ftInteger
      end>
    StoreDefs = True
    TableName = 'dbo.Rvos'
    Left = 419
    Top = 405
    object RvosId: TAutoIncField
      FieldName = 'Id'
      Visible = False
    end
    object RvosNo: TIntegerField
      FieldName = 'No'
    end
    object RvosDat: TIntegerField
      FieldName = 'Dat'
      DisplayFormat = '####/##/##'
    end
    object RvosAccKod: TFloatField
      FieldName = 'AccKod'
    end
    object RvosAcnam: TStringField
      FieldName = 'Acnam'
      Size = 45
    end
    object RvosPsum: TCurrencyField
      FieldName = 'Psum'
    end
    object RvosDes: TStringField
      Alignment = taRightJustify
      FieldName = 'Des'
      Size = 200
    end
    object RvosPerm: TBooleanField
      FieldName = 'LPerm'
    end
    object RvosBilled: TBooleanField
      FieldName = 'Billed'
    end
    object RvosBno: TIntegerField
      FieldName = 'Bno'
    end
    object RvosCost: TStringField
      FieldName = 'Cost'
      Size = 45
    end
    object RvosCkod: TIntegerField
      FieldName = 'Ckod'
    end
  end
  object RvosDs: TDataSource
    AutoEdit = False
    DataSet = Rvos
    Left = 419
    Top = 448
  end
  object RVI: TTable
    AutoRefresh = True
    DatabaseName = 'ParFro'
    SessionName = 'Default'
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'Radif'
        DataType = ftInteger
      end
      item
        Name = 'Bdat'
        DataType = ftInteger
      end
      item
        Name = 'Bno'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Bank'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Pbill'
        DataType = ftCurrency
      end
      item
        Name = 'No'
        DataType = ftInteger
      end>
    StoreDefs = True
    TableName = 'dbo.Rvosi'
    Left = 420
    Top = 495
    object RVIId: TAutoIncField
      FieldName = 'Id'
      Visible = False
    end
    object RVIRadif: TIntegerField
      DisplayLabel = '—œÌ›'
      FieldName = 'Radif'
    end
    object RVIBdat: TIntegerField
      DisplayLabel = '”——”Ìœ'
      FieldName = 'Bdat'
      DisplayFormat = '####/##/##'
    end
    object RVIBno: TStringField
      DisplayLabel = '”—Ì«·'
      FieldName = 'Bno'
    end
    object RVIBank: TStringField
      DisplayLabel = '»«‰ò'
      FieldName = 'Bank'
      Size = 45
    end
    object RVIPbill: TCurrencyField
      DisplayLabel = '„»·€'
      FieldName = 'Pbill'
    end
    object RVINo: TIntegerField
      DisplayLabel = '‘„«—Â'
      FieldName = 'No'
    end
  end
  object RVIDs: TDataSource
    AutoEdit = False
    DataSet = RVI
    Left = 422
    Top = 541
  end
  object Rkel: TTable
    AfterOpen = RkelAfterEdit
    AfterEdit = RkelAfterEdit
    AfterScroll = RkelAfterEdit
    AutoRefresh = True
    DatabaseName = 'ParFro'
    SessionName = 'Default'
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'No'
        DataType = ftInteger
      end
      item
        Name = 'Dat'
        DataType = ftInteger
      end
      item
        Name = 'AccKod'
        DataType = ftFloat
      end
      item
        Name = 'Acnam'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Psum'
        DataType = ftCurrency
      end
      item
        Name = 'Des'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'LPerm'
        Attributes = [faRequired]
        DataType = ftBoolean
      end
      item
        Name = 'Billed'
        Attributes = [faRequired]
        DataType = ftBoolean
      end
      item
        Name = 'Bno'
        DataType = ftInteger
      end
      item
        Name = 'Cost'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Ckod'
        DataType = ftInteger
      end>
    StoreDefs = True
    TableName = 'dbo.RKel'
    Left = 447
    Top = 405
    object RkelId: TAutoIncField
      FieldName = 'Id'
      Visible = False
    end
    object RkelNo: TIntegerField
      FieldName = 'No'
    end
    object RkelDat: TIntegerField
      FieldName = 'Dat'
      DisplayFormat = '####/##/##'
    end
    object RkelAccKod: TFloatField
      FieldName = 'AccKod'
    end
    object RkelAcnam: TStringField
      FieldName = 'Acnam'
      Size = 45
    end
    object RkelPsum: TCurrencyField
      FieldName = 'Psum'
    end
    object RkelDes: TStringField
      Alignment = taRightJustify
      FieldName = 'Des'
      Size = 200
    end
    object RkelPerm: TBooleanField
      FieldName = 'LPerm'
    end
    object RkelBilled: TBooleanField
      FieldName = 'Billed'
    end
    object RkelBno: TIntegerField
      FieldName = 'Bno'
    end
    object RkelCost: TStringField
      FieldName = 'Cost'
      Size = 45
    end
    object RkelCkod: TIntegerField
      FieldName = 'Ckod'
    end
  end
  object RkelDs: TDataSource
    AutoEdit = False
    DataSet = Rkel
    Left = 447
    Top = 448
  end
  object RKI: TTable
    AutoRefresh = True
    DatabaseName = 'ParFro'
    SessionName = 'Default'
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'Radif'
        DataType = ftInteger
      end
      item
        Name = 'Bdat'
        DataType = ftInteger
      end
      item
        Name = 'Bno'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Bank'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Pbill'
        DataType = ftCurrency
      end
      item
        Name = 'No'
        DataType = ftInteger
      end
      item
        Name = 'Reject'
        Attributes = [faRequired]
        DataType = ftBoolean
      end
      item
        Name = 'Jari'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <
      item
        Name = 'PK_Rkeli'
        Fields = 'Id'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = '_WA_Sys_Radif_31EC6D26'
        Fields = 'Radif'
      end
      item
        Name = '_WA_Sys_Bdat_31EC6D26'
        Fields = 'Bdat'
      end
      item
        Name = '_WA_Sys_Bno_31EC6D26'
        Fields = 'Bno'
      end
      item
        Name = '_WA_Sys_Bank_31EC6D26'
        Fields = 'Bank'
      end
      item
        Name = '_WA_Sys_Pbill_31EC6D26'
        Fields = 'Pbill'
      end
      item
        Name = '_WA_Sys_No_31EC6D26'
        Fields = 'No'
      end
      item
        Name = '_WA_Sys_Reject_31EC6D26'
        Fields = 'Reject'
      end
      item
        Name = '_WA_Sys_Jari_31EC6D26'
        Fields = 'Jari'
      end>
    StoreDefs = True
    TableName = 'dbo.Rkeli'
    Left = 448
    Top = 495
    object RKIId: TAutoIncField
      FieldName = 'Id'
      Visible = False
    end
    object RKIRadif: TIntegerField
      DisplayLabel = '—œÌ›'
      FieldName = 'Radif'
    end
    object RKIBdat: TIntegerField
      DisplayLabel = '”——”Ìœ'
      FieldName = 'Bdat'
      DisplayFormat = '####/##/##'
    end
    object RKIBno: TStringField
      DisplayLabel = '”—Ì«·'
      FieldName = 'Bno'
    end
    object RKIBank: TStringField
      DisplayLabel = '»«‰ò'
      FieldName = 'Bank'
      Size = 45
    end
    object RKIPbill: TCurrencyField
      DisplayLabel = '„»·€'
      FieldName = 'Pbill'
    end
    object RKINo: TIntegerField
      DisplayLabel = '‘„«—Â'
      FieldName = 'No'
      Visible = False
    end
    object RKIReject: TBooleanField
      DisplayLabel = '»—ê‘ Ì'
      FieldName = 'Reject'
      Visible = False
    end
    object RKIJari: TStringField
      FieldName = 'Jari'
      Visible = False
    end
  end
  object RKIDs: TDataSource
    AutoEdit = False
    DataSet = RKI
    Left = 450
    Top = 541
  end
  object Rukel: TTable
    AfterOpen = RukelAfterEdit
    AfterEdit = RukelAfterEdit
    AfterScroll = RukelAfterEdit
    AutoRefresh = True
    DatabaseName = 'ParFro'
    SessionName = 'Default'
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'No'
        DataType = ftInteger
      end
      item
        Name = 'Dat'
        DataType = ftInteger
      end
      item
        Name = 'AccKod'
        DataType = ftFloat
      end
      item
        Name = 'Acnam'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Psum'
        DataType = ftCurrency
      end
      item
        Name = 'Des'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'LPerm'
        Attributes = [faRequired]
        DataType = ftBoolean
      end
      item
        Name = 'Billed'
        Attributes = [faRequired]
        DataType = ftBoolean
      end
      item
        Name = 'Bno'
        DataType = ftInteger
      end
      item
        Name = 'Cost'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Ckod'
        DataType = ftInteger
      end>
    StoreDefs = True
    TableName = 'dbo.RUKel'
    Left = 475
    Top = 405
    object RukelId: TAutoIncField
      FieldName = 'Id'
      Visible = False
    end
    object RukelNo: TIntegerField
      FieldName = 'No'
    end
    object RukelDat: TIntegerField
      FieldName = 'Dat'
      DisplayFormat = '####/##/##'
    end
    object RukelAccKod: TFloatField
      FieldName = 'AccKod'
    end
    object RukelAcnam: TStringField
      FieldName = 'Acnam'
      Size = 45
    end
    object RukelPsum: TCurrencyField
      FieldName = 'Psum'
    end
    object RukelDes: TStringField
      Alignment = taRightJustify
      FieldName = 'Des'
      Size = 200
    end
    object RukelPerm: TBooleanField
      FieldName = 'LPerm'
    end
    object RukelBilled: TBooleanField
      FieldName = 'Billed'
    end
    object RukelBno: TIntegerField
      FieldName = 'Bno'
    end
    object RukelCost: TStringField
      FieldName = 'Cost'
      Size = 45
    end
    object RukelCkod: TIntegerField
      FieldName = 'Ckod'
    end
  end
  object RukelDs: TDataSource
    AutoEdit = False
    DataSet = Rukel
    Left = 475
    Top = 448
  end
  object RUKI: TTable
    AutoRefresh = True
    DatabaseName = 'ParFro'
    SessionName = 'Default'
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'Radif'
        DataType = ftInteger
      end
      item
        Name = 'Bdat'
        DataType = ftInteger
      end
      item
        Name = 'Bno'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Bank'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Pbill'
        DataType = ftCurrency
      end
      item
        Name = 'No'
        DataType = ftInteger
      end
      item
        Name = 'Reject'
        Attributes = [faRequired]
        DataType = ftBoolean
      end>
    StoreDefs = True
    TableName = 'dbo.RUkeli'
    Left = 476
    Top = 495
    object RUKIId: TAutoIncField
      FieldName = 'Id'
      Visible = False
    end
    object RUKIRadif: TIntegerField
      DisplayLabel = '—œÌ›'
      FieldName = 'Radif'
    end
    object RUKIBdat: TIntegerField
      DisplayLabel = '”——”Ìœ'
      FieldName = 'Bdat'
      DisplayFormat = '####/##/##'
    end
    object RUKIBno: TStringField
      DisplayLabel = '”—Ì«·'
      FieldName = 'Bno'
    end
    object RUKIBank: TStringField
      DisplayLabel = '»«‰ò'
      FieldName = 'Bank'
      Size = 45
    end
    object RUKIPbill: TCurrencyField
      DisplayLabel = '„»·€'
      FieldName = 'Pbill'
    end
    object RUKINo: TIntegerField
      DisplayLabel = '‘„«—Â'
      FieldName = 'No'
    end
    object RUKIReject: TBooleanField
      DisplayLabel = '»—ê‘ Ì'
      FieldName = 'Reject'
      Visible = False
    end
  end
  object RUKIDs: TDataSource
    AutoEdit = False
    DataSet = RUKI
    Left = 478
    Top = 541
  end
  object NCar: TTable
    AutoRefresh = True
    DatabaseName = 'ParFro'
    SessionName = 'Default'
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'No'
        DataType = ftInteger
      end
      item
        Name = 'Dat'
        DataType = ftInteger
      end
      item
        Name = 'Price'
        DataType = ftCurrency
      end
      item
        Name = 'Jari'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Des'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'Bno'
        DataType = ftInteger
      end
      item
        Name = 'Cost'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Ckod'
        DataType = ftInteger
      end
      item
        Name = 'Ctip'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Cprice'
        DataType = ftCurrency
      end
      item
        Name = 'Rate'
        DataType = ftCurrency
      end>
    StoreDefs = True
    TableName = 'dbo.NCar'
    Left = 503
    Top = 405
    object NCarId: TAutoIncField
      FieldName = 'Id'
    end
    object NCarNo: TIntegerField
      FieldName = 'No'
    end
    object NCarDat: TIntegerField
      FieldName = 'Dat'
    end
    object NCarPrice: TCurrencyField
      FieldName = 'Price'
    end
    object NCarJari: TStringField
      FieldName = 'Jari'
    end
    object NCarDes: TStringField
      Alignment = taRightJustify
      FieldName = 'Des'
      Size = 200
    end
    object NCarBno: TIntegerField
      FieldName = 'Bno'
    end
    object NCarCost: TStringField
      FieldName = 'Cost'
      Size = 45
    end
    object NCarCkod: TIntegerField
      FieldName = 'Ckod'
    end
    object NCarCtip: TStringField
      FieldName = 'Ctip'
      Size = 15
    end
    object NCarCprice: TCurrencyField
      FieldName = 'Cprice'
    end
    object NCarRate: TCurrencyField
      FieldName = 'Rate'
    end
  end
  object NCarDs: TDataSource
    AutoEdit = False
    DataSet = NCar
    Left = 503
    Top = 448
  end
  object Move: TTable
    AutoRefresh = True
    DatabaseName = 'ParFro'
    SessionName = 'Default'
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'No'
        DataType = ftInteger
      end
      item
        Name = 'Dat'
        DataType = ftInteger
      end
      item
        Name = 'Des'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'Pnet'
        DataType = ftCurrency
      end
      item
        Name = 'Bno'
        DataType = ftInteger
      end
      item
        Name = 'LPerm'
        Attributes = [faRequired]
        DataType = ftBoolean
      end>
    StoreDefs = True
    TableName = 'dbo.Move'
    Left = 270
    Top = 154
    object MoveId: TAutoIncField
      FieldName = 'Id'
      Visible = False
    end
    object MoveNo: TIntegerField
      FieldName = 'No'
    end
    object MoveDat: TIntegerField
      FieldName = 'Dat'
      DisplayFormat = '####/##/##'
    end
    object MoveDes: TStringField
      Alignment = taRightJustify
      FieldName = 'Des'
      Size = 200
    end
    object MovePnet: TCurrencyField
      FieldName = 'Pnet'
    end
    object MoveBno: TIntegerField
      FieldName = 'Bno'
    end
    object MovePerm: TBooleanField
      FieldName = 'LPerm'
    end
  end
  object MoveDs: TDataSource
    AutoEdit = False
    DataSet = Move
    Left = 282
    Top = 509
  end
  object MVG: TTable
    AutoRefresh = True
    DatabaseName = 'ParFro'
    SessionName = 'Default'
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'Radif'
        DataType = ftInteger
      end
      item
        Name = 'Kod'
        DataType = ftInteger
      end
      item
        Name = 'Nam'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Color'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'OAnbNam'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'OAnbKod'
        DataType = ftInteger
      end
      item
        Name = 'Quant'
        DataType = ftFloat
      end
      item
        Name = 'IAnbNam'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'IAnbKod'
        DataType = ftInteger
      end
      item
        Name = 'Unit'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Pfee'
        DataType = ftCurrency
      end
      item
        Name = 'Ptotal'
        DataType = ftCurrency
      end
      item
        Name = 'No'
        DataType = ftInteger
      end
      item
        Name = 'Dat'
        DataType = ftInteger
      end
      item
        Name = 'Bkod'
        Attributes = [faRequired]
        DataType = ftBoolean
      end
      item
        Name = 'Prop'
        DataType = ftString
        Size = 50
      end>
    StoreDefs = True
    TableName = 'dbo.MoveGood'
    Left = 19
    Top = 198
    object MVGId: TAutoIncField
      FieldName = 'Id'
      ReadOnly = True
      Visible = False
    end
    object MVGRadif: TIntegerField
      DisplayLabel = '—œÌ›'
      FieldName = 'Radif'
    end
    object MVGKod: TIntegerField
      DisplayLabel = 'òœ ò«·«'
      FieldName = 'Kod'
    end
    object MVGNam: TStringField
      DisplayLabel = '‘—Õ ò«·«'
      DisplayWidth = 30
      FieldName = 'Nam'
      Size = 100
    end
    object MVGColor: TStringField
      DisplayLabel = '„œ·'
      DisplayWidth = 25
      FieldName = 'Color'
      Size = 45
    end
    object MVGOAnbNam: TStringField
      DisplayLabel = '«“ «‰»«—'
      DisplayWidth = 25
      FieldName = 'OAnbNam'
      Size = 45
    end
    object MVGOAnbKod: TIntegerField
      DisplayLabel = '«“ ﬁ›”Â'
      FieldName = 'OAnbKod'
    end
    object MVGIAnbNam: TStringField
      DisplayLabel = '»Â «‰»«—'
      DisplayWidth = 25
      FieldName = 'IAnbNam'
      Size = 45
    end
    object MVGIAnbKod: TIntegerField
      DisplayLabel = '»Â ﬁ›”Â'
      FieldName = 'IAnbKod'
    end
    object MVGQuant: TFloatField
      DisplayLabel = '„ﬁœ«—'
      FieldName = 'Quant'
    end
    object MVGUnit: TStringField
      DisplayLabel = 'Ê«Õœ'
      FieldKind = fkLookup
      FieldName = 'Unit'
      LookupDataSet = Good
      LookupKeyFields = 'Kod'
      LookupResultField = 'Unit'
      KeyFields = 'Kod'
      Lookup = True
    end
    object MVGPfee: TCurrencyField
      DisplayLabel = '›Ì'
      FieldName = 'Pfee'
    end
    object MVGPtotal: TCurrencyField
      DisplayLabel = 'Ã„⁄'
      FieldName = 'Ptotal'
    end
    object MVGNo: TIntegerField
      DisplayLabel = '‘„«—Â'
      FieldName = 'No'
      Visible = False
    end
    object MVGDat: TIntegerField
      DisplayLabel = ' «—ÌŒ'
      FieldName = 'Dat'
      Visible = False
      DisplayFormat = '####/##/##'
    end
    object MVGBkod: TBooleanField
      FieldName = 'Bkod'
    end
    object MVGProp: TStringField
      FieldName = 'Prop'
      Visible = False
      Size = 50
    end
  end
  object MVGDs: TDataSource
    AutoEdit = False
    DataSet = MVG
    Left = 14
    Top = 555
  end
  object Costc: TTable
    AutoRefresh = True
    DatabaseName = 'ParFro'
    SessionName = 'Default'
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'Nam'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Kod'
        DataType = ftInteger
      end
      item
        Name = 'Des'
        DataType = ftString
        Size = 200
      end>
    IndexDefs = <
      item
        Name = 'CostcIndex1'
        Fields = 'Nam'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'dbo.Costc'
    Left = 384
    Top = 8
    object CostcId: TAutoIncField
      FieldName = 'Id'
      Visible = False
    end
    object CostcNam: TStringField
      FieldName = 'Nam'
      Size = 45
    end
    object CostcKod: TAutoIncField
      FieldName = 'Kod'
      ReadOnly = True
    end
    object CostcDesc: TStringField
      FieldName = 'Des'
      Size = 200
    end
  end
  object CostcDs: TDataSource
    AutoEdit = False
    DataSet = Costc
    Left = 386
    Top = 53
  end
  object Cperm: TTable
    Tag = 1
    AutoRefresh = True
    DatabaseName = 'ParFro'
    SessionName = 'Default'
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'Radif'
        DataType = ftInteger
      end
      item
        Name = 'Ckod'
        DataType = ftInteger
      end
      item
        Name = 'Ackod'
        DataType = ftFloat
      end
      item
        Name = 'Acnam'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Grop'
        DataType = ftString
        Size = 244
      end>
    IndexDefs = <
      item
        Name = 'CpermIndex1'
        Fields = 'Id'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'IxCKod'
        Fields = 'Ckod'
        Options = [ixCaseInsensitive]
      end>
    StoreDefs = True
    TableName = 'dbo.CPerm'
    Left = 356
    Top = 8
    object CpermId: TAutoIncField
      FieldName = 'Id'
      ReadOnly = True
      Visible = False
    end
    object CpermRadif: TIntegerField
      FieldName = 'Radif'
    end
    object CpermCkod: TIntegerField
      FieldName = 'Ckod'
    end
    object CpermAckod: TFloatField
      FieldName = 'Ackod'
    end
    object CpermAcnam: TStringField
      FieldName = 'Acnam'
      Size = 45
    end
    object CpermGrop: TStringField
      FieldName = 'Grop'
      Size = 50
    end
  end
  object CpermDs: TDataSource
    Tag = 1
    AutoEdit = False
    DataSet = Cperm
    Left = 358
    Top = 53
  end
  object Cent: TTable
    AutoRefresh = True
    DatabaseName = 'ParFro'
    SessionName = 'Default'
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'Kod'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'Radif'
        DataType = ftInteger
      end
      item
        Name = 'Nam'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Ename'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Grop'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Tel'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Adr'
        DataType = ftString
        Size = 140
      end
      item
        Name = 'Pcred'
        DataType = ftCurrency
      end
      item
        Name = 'Tcred'
        DataType = ftInteger
      end
      item
        Name = 'State'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'City'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Regon'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Shmark'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <
      item
        Name = 'PK_Cent'
        Fields = 'Id'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'Cent0'
        Fields = 'Kod'
        Options = [ixUnique]
      end
      item
        Name = '_WA_Sys_Nam_0519C6AF'
        Fields = 'Nam'
      end
      item
        Name = '_WA_Sys_Grop_0519C6AF'
        Fields = 'Grop'
      end
      item
        Name = '_WA_Sys_State_0519C6AF'
        Fields = 'State'
      end
      item
        Name = '_WA_Sys_City_0519C6AF'
        Fields = 'City'
      end
      item
        Name = '_WA_Sys_Regon_0519C6AF'
        Fields = 'Regon'
      end
      item
        Name = '_WA_Sys_Radif_0519C6AF'
        Fields = 'Radif'
      end
      item
        Name = '_WA_Sys_Ename_0519C6AF'
        Fields = 'Ename'
      end
      item
        Name = '_WA_Sys_Tel_0519C6AF'
        Fields = 'Tel'
      end
      item
        Name = '_WA_Sys_Adr_0519C6AF'
        Fields = 'Adr'
      end
      item
        Name = '_WA_Sys_Pcred_0519C6AF'
        Fields = 'Pcred'
      end
      item
        Name = '_WA_Sys_Tcred_0519C6AF'
        Fields = 'Tcred'
      end
      item
        Name = '_WA_Sys_Shmark_0519C6AF'
        Fields = 'Shmark'
      end>
    StoreDefs = True
    TableName = 'dbo.Cent'
    Left = 328
    Top = 8
    object CentId: TAutoIncField
      FieldName = 'Id'
      Visible = False
    end
    object CentKod: TIntegerField
      FieldName = 'Kod'
    end
    object CentRadif: TIntegerField
      FieldName = 'Radif'
    end
    object CentNam: TStringField
      Alignment = taRightJustify
      FieldName = 'Nam'
      Size = 45
    end
    object CentEName: TStringField
      FieldName = 'EName'
      Size = 45
    end
    object CentGrop: TStringField
      Alignment = taRightJustify
      FieldName = 'Grop'
      Size = 45
    end
    object CentTel: TStringField
      FieldName = 'Tel'
    end
    object CentAdr: TStringField
      FieldName = 'Adr'
      Size = 140
    end
    object CentPcred: TCurrencyField
      FieldName = 'Pcred'
    end
    object CentTCred: TIntegerField
      FieldName = 'TCred'
    end
    object CentState: TStringField
      FieldName = 'State'
      Size = 45
    end
    object CentCity: TStringField
      FieldName = 'City'
      Size = 45
    end
    object CentRegon: TStringField
      FieldName = 'Regon'
    end
    object CentShMark: TStringField
      FieldName = 'ShMark'
    end
  end
  object CentDs: TDataSource
    AutoEdit = False
    DataSet = Cent
    Left = 330
    Top = 53
  end
  object Btip: TTable
    AutoRefresh = True
    DatabaseName = 'ParFro'
    SessionName = 'Default'
    FieldDefs = <
      item
        Name = 'Id'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'Des'
        DataType = ftString
        Size = 45
      end>
    StoreDefs = True
    TableName = 'dbo.BTip'
    Left = 412
    Top = 8
    object BtipId: TSmallintField
      FieldName = 'Id'
      Visible = False
    end
    object BtipDes: TStringField
      FieldName = 'Des'
      Size = 45
    end
  end
  object BtipDs: TDataSource
    AutoEdit = False
    DataSet = Btip
    Left = 414
    Top = 53
  end
  object Hav: TTable
    AutoRefresh = True
    DatabaseName = 'ParFro'
    SessionName = 'Default'
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'No'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'Dat'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'Nam'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Pkol'
        DataType = ftCurrency
      end
      item
        Name = 'Pdis'
        DataType = ftCurrency
      end
      item
        Name = 'Pnet'
        DataType = ftCurrency
      end
      item
        Name = 'Bkod'
        Attributes = [faRequired]
        DataType = ftBoolean
      end
      item
        Name = 'Bno'
        DataType = ftInteger
      end
      item
        Name = 'Cost'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Ckod'
        DataType = ftInteger
      end
      item
        Name = 'Refno'
        DataType = ftInteger
      end
      item
        Name = 'Des'
        DataType = ftString
        Size = 200
      end>
    IndexDefs = <
      item
        Name = 'PK_DHav'
        Fields = 'Id'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'dbo.DHav'
    Left = 328
    Top = 108
    object HavId: TAutoIncField
      FieldName = 'Id'
      Visible = False
    end
    object HavNo: TIntegerField
      DisplayLabel = '‘„«—Â'
      FieldName = 'No'
    end
    object HavDat: TIntegerField
      DisplayLabel = ' «—ÌŒ'
      FieldName = 'Dat'
      DisplayFormat = '####/##/##'
    end
    object HavNam: TStringField
      Alignment = taRightJustify
      DisplayLabel = '‰«„ Õ”«»'
      FieldName = 'Nam'
      Size = 45
    end
    object HavPkol: TCurrencyField
      FieldName = 'Pkol'
    end
    object HavPdis: TCurrencyField
      FieldName = 'Pdis'
    end
    object HavPnet: TCurrencyField
      FieldName = 'Pnet'
    end
    object HavBkod: TBooleanField
      FieldName = 'Bkod'
    end
    object HavBno: TIntegerField
      FieldName = 'Bno'
    end
    object HavCost: TStringField
      FieldName = 'Cost'
      Size = 45
    end
    object HavCkod: TIntegerField
      FieldName = 'Ckod'
    end
    object HavRefNo: TIntegerField
      FieldName = 'RefNo'
    end
    object HavDes: TStringField
      Alignment = taRightJustify
      FieldName = 'Des'
      Size = 200
    end
  end
  object Res: TTable
    AutoRefresh = True
    DatabaseName = 'ParFro'
    SessionName = 'Default'
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'No'
        DataType = ftInteger
      end
      item
        Name = 'Dat'
        DataType = ftInteger
      end
      item
        Name = 'Nam'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Pkol'
        DataType = ftCurrency
      end
      item
        Name = 'Pdis'
        DataType = ftCurrency
      end
      item
        Name = 'Pnet'
        DataType = ftCurrency
      end
      item
        Name = 'Bkod'
        Attributes = [faRequired]
        DataType = ftBoolean
      end
      item
        Name = 'Bno'
        DataType = ftInteger
      end
      item
        Name = 'Cost'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Ckod'
        DataType = ftInteger
      end
      item
        Name = 'Refno'
        DataType = ftInteger
      end
      item
        Name = 'Des'
        DataType = ftString
        Size = 200
      end>
    StoreDefs = True
    TableName = 'dbo.DRes'
    Left = 356
    Top = 108
    object ResId: TAutoIncField
      FieldName = 'Id'
      Visible = False
    end
    object ResNo: TIntegerField
      FieldName = 'No'
    end
    object ResDat: TIntegerField
      FieldName = 'Dat'
    end
    object ResNam: TStringField
      FieldName = 'Nam'
      Size = 45
    end
    object ResPkol: TCurrencyField
      FieldName = 'Pkol'
    end
    object ResPdis: TCurrencyField
      FieldName = 'Pdis'
    end
    object ResPnet: TCurrencyField
      FieldName = 'Pnet'
    end
    object ResBkod: TBooleanField
      FieldName = 'Bkod'
    end
    object ResBno: TIntegerField
      FieldName = 'Bno'
    end
    object ResCost: TStringField
      FieldName = 'Cost'
      Size = 45
    end
    object ResCkod: TIntegerField
      FieldName = 'Ckod'
    end
    object ResRefNo: TIntegerField
      FieldName = 'RefNo'
    end
    object ResDes: TStringField
      FieldName = 'Des'
      Size = 200
    end
  end
  object IRej: TTable
    AutoRefresh = True
    DatabaseName = 'ParFro'
    SessionName = 'Default'
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'No'
        DataType = ftInteger
      end
      item
        Name = 'Dat'
        DataType = ftInteger
      end
      item
        Name = 'Nam'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Pkol'
        DataType = ftCurrency
      end
      item
        Name = 'Pdis'
        DataType = ftCurrency
      end
      item
        Name = 'Pnet'
        DataType = ftCurrency
      end
      item
        Name = 'Bkod'
        Attributes = [faRequired]
        DataType = ftBoolean
      end
      item
        Name = 'Bno'
        DataType = ftInteger
      end
      item
        Name = 'Cost'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Ckod'
        DataType = ftInteger
      end
      item
        Name = 'Refno'
        DataType = ftInteger
      end
      item
        Name = 'Des'
        DataType = ftString
        Size = 200
      end>
    StoreDefs = True
    TableName = 'dbo.DiRej'
    Left = 385
    Top = 108
    object IRejId: TAutoIncField
      FieldName = 'Id'
      Visible = False
    end
    object IRejNo: TIntegerField
      FieldName = 'No'
    end
    object IRejDat: TIntegerField
      FieldName = 'Dat'
    end
    object IRejNam: TStringField
      FieldName = 'Nam'
      Size = 45
    end
    object IRejPkol: TCurrencyField
      FieldName = 'Pkol'
    end
    object IRejPdis: TCurrencyField
      FieldName = 'Pdis'
    end
    object IRejPnet: TCurrencyField
      FieldName = 'Pnet'
    end
    object IRejBkod: TBooleanField
      FieldName = 'Bkod'
    end
    object IRejBno: TIntegerField
      FieldName = 'Bno'
    end
    object IRejCost: TStringField
      FieldName = 'Cost'
      Size = 45
    end
    object IRejCkod: TIntegerField
      FieldName = 'Ckod'
    end
    object IRejRefNo: TIntegerField
      FieldName = 'RefNo'
    end
    object IRejDes: TStringField
      FieldName = 'Des'
      Size = 200
    end
  end
  object ORej: TTable
    AutoRefresh = True
    DatabaseName = 'ParFro'
    SessionName = 'Default'
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'No'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'Dat'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'Nam'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Pkol'
        DataType = ftCurrency
      end
      item
        Name = 'Pdis'
        DataType = ftCurrency
      end
      item
        Name = 'Pnet'
        DataType = ftCurrency
      end
      item
        Name = 'Bkod'
        Attributes = [faRequired]
        DataType = ftBoolean
      end
      item
        Name = 'Bno'
        DataType = ftInteger
      end
      item
        Name = 'Cost'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Ckod'
        DataType = ftInteger
      end
      item
        Name = 'Refno'
        DataType = ftInteger
      end
      item
        Name = 'Des'
        DataType = ftString
        Size = 200
      end>
    StoreDefs = True
    TableName = 'dbo.DoRej'
    Left = 413
    Top = 108
    object ORejId: TAutoIncField
      FieldName = 'Id'
      Visible = False
    end
    object ORejNo: TIntegerField
      FieldName = 'No'
    end
    object ORejDat: TIntegerField
      FieldName = 'Dat'
    end
    object ORejNam: TStringField
      FieldName = 'Nam'
      Size = 45
    end
    object ORejPkol: TCurrencyField
      FieldName = 'Pkol'
    end
    object ORejPdis: TCurrencyField
      FieldName = 'Pdis'
    end
    object ORejPnet: TCurrencyField
      FieldName = 'Pnet'
    end
    object ORejBkod: TBooleanField
      FieldName = 'Bkod'
    end
    object ORejBno: TIntegerField
      FieldName = 'Bno'
    end
    object ORejCost: TStringField
      FieldName = 'Cost'
      Size = 45
    end
    object ORejCkod: TIntegerField
      FieldName = 'Ckod'
    end
    object ORejRefNo: TIntegerField
      FieldName = 'RefNo'
    end
    object ORejDes: TStringField
      FieldName = 'Des'
      Size = 200
    end
  end
  object HavG: TTable
    BeforePost = HavGBeforePost
    AutoRefresh = True
    DatabaseName = 'ParFro'
    SessionName = 'Default'
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'Radif'
        DataType = ftInteger
      end
      item
        Name = 'Kod'
        DataType = ftInteger
      end
      item
        Name = 'Nam'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Color'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Anbnam'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Anbkod'
        DataType = ftInteger
      end
      item
        Name = 'Quant'
        DataType = ftFloat
      end
      item
        Name = 'Unit'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Pfee'
        DataType = ftCurrency
      end
      item
        Name = 'Ptotal'
        DataType = ftCurrency
      end
      item
        Name = 'Delikod'
        Attributes = [faRequired]
        DataType = ftBoolean
      end
      item
        Name = 'Reject'
        DataType = ftFloat
      end
      item
        Name = 'No'
        DataType = ftInteger
      end
      item
        Name = 'Dat'
        DataType = ftInteger
      end
      item
        Name = 'Serial'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <
      item
        Name = 'PK_DHavG'
        Fields = 'Id'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = '_WA_Sys_No_0DAF0CB0'
        Fields = 'No'
      end
      item
        Name = '_WA_Sys_Radif_0DAF0CB0'
        Fields = 'Radif'
      end
      item
        Name = '_WA_Sys_Kod_0DAF0CB0'
        Fields = 'Kod'
      end
      item
        Name = '_WA_Sys_Nam_0DAF0CB0'
        Fields = 'Nam'
      end
      item
        Name = '_WA_Sys_Color_0DAF0CB0'
        Fields = 'Color'
      end
      item
        Name = '_WA_Sys_Anbnam_0DAF0CB0'
        Fields = 'Anbnam'
      end
      item
        Name = '_WA_Sys_Anbkod_0DAF0CB0'
        Fields = 'Anbkod'
      end
      item
        Name = '_WA_Sys_Quant_0DAF0CB0'
        Fields = 'Quant'
      end
      item
        Name = '_WA_Sys_Unit_0DAF0CB0'
        Fields = 'Unit'
      end
      item
        Name = '_WA_Sys_Pfee_0DAF0CB0'
        Fields = 'Pfee'
      end
      item
        Name = '_WA_Sys_Ptotal_0DAF0CB0'
        Fields = 'Ptotal'
      end
      item
        Name = '_WA_Sys_Delikod_0DAF0CB0'
        Fields = 'Delikod'
      end
      item
        Name = '_WA_Sys_Reject_0DAF0CB0'
        Fields = 'Reject'
      end
      item
        Name = '_WA_Sys_Dat_0DAF0CB0'
        Fields = 'Dat'
      end
      item
        Name = '_WA_Sys_Serial_0DAF0CB0'
        Fields = 'Serial'
      end>
    StoreDefs = True
    TableName = 'dbo.DHavG'
    Left = 328
    Top = 157
    object HavGId: TAutoIncField
      FieldName = 'Id'
      ReadOnly = True
      Visible = False
    end
    object HavGRadif: TIntegerField
      DisplayLabel = '—œÌ›'
      FieldName = 'Radif'
    end
    object HavGKod: TIntegerField
      DisplayLabel = 'òœ ò«·«'
      FieldName = 'Kod'
    end
    object HavGNam: TStringField
      DisplayLabel = '‘—Õ ò«·«'
      FieldName = 'Nam'
      Size = 100
    end
    object HavGColor: TStringField
      DisplayLabel = '„œ·'
      FieldName = 'Color'
      Size = 45
    end
    object HavGAnbNam: TStringField
      DisplayLabel = '‰«„ «‰»«—'
      FieldName = 'AnbNam'
      Size = 45
    end
    object HavGAnbKod: TIntegerField
      DisplayLabel = '›«ò Ê—'
      FieldName = 'AnbKod'
    end
    object HavGQuant: TFloatField
      FieldName = 'Quant'
    end
    object HavGUnit: TStringField
      DisplayLabel = 'Ê«Õœ'
      FieldKind = fkLookup
      FieldName = 'Unit'
      LookupDataSet = Good
      LookupKeyFields = 'Kod'
      LookupResultField = 'Unit'
      KeyFields = 'Kod'
      Lookup = True
    end
    object HavGPfee: TCurrencyField
      FieldName = 'Pfee'
    end
    object HavGPtotal: TCurrencyField
      FieldName = 'Ptotal'
    end
    object HavGDelikod: TBooleanField
      FieldName = 'Delikod'
    end
    object HavGReject: TFloatField
      DefaultExpression = '0'
      FieldName = 'Reject'
    end
    object HavGNo: TIntegerField
      FieldName = 'No'
    end
    object HavGDat: TIntegerField
      FieldName = 'Dat'
    end
    object HavGSerial: TStringField
      FieldName = 'Serial'
    end
  end
  object ResG: TTable
    BeforePost = IRejGBeforePost
    AutoRefresh = True
    DatabaseName = 'ParFro'
    SessionName = 'Default'
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'Radif'
        DataType = ftInteger
      end
      item
        Name = 'Kod'
        DataType = ftInteger
      end
      item
        Name = 'Nam'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Color'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Anbnam'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Anbkod'
        DataType = ftInteger
      end
      item
        Name = 'Quant'
        DataType = ftFloat
      end
      item
        Name = 'Unit'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Pfee'
        DataType = ftCurrency
      end
      item
        Name = 'Ptotal'
        DataType = ftCurrency
      end
      item
        Name = 'Delikod'
        Attributes = [faRequired]
        DataType = ftBoolean
      end
      item
        Name = 'Reject'
        DataType = ftFloat
      end
      item
        Name = 'No'
        DataType = ftInteger
      end
      item
        Name = 'Dat'
        DataType = ftInteger
      end
      item
        Name = 'Serial'
        DataType = ftString
        Size = 20
      end>
    StoreDefs = True
    TableName = 'dbo.DResG'
    Left = 356
    Top = 157
    object ResGId: TAutoIncField
      FieldName = 'Id'
      ReadOnly = True
      Visible = False
    end
    object ResGRadif: TIntegerField
      FieldName = 'Radif'
    end
    object ResGKod: TIntegerField
      FieldName = 'Kod'
    end
    object ResGNam: TStringField
      FieldName = 'Nam'
      Size = 100
    end
    object ResGColor: TStringField
      FieldName = 'Color'
      Size = 45
    end
    object ResGAnbNam: TStringField
      FieldName = 'AnbNam'
      Size = 45
    end
    object ResGAnbKod: TIntegerField
      FieldName = 'AnbKod'
    end
    object ResGQuant: TFloatField
      FieldName = 'Quant'
    end
    object ResGUnit: TStringField
      FieldKind = fkLookup
      FieldName = 'Unit'
      LookupDataSet = Good
      LookupKeyFields = 'Kod'
      LookupResultField = 'Unit'
      KeyFields = 'Kod'
      Lookup = True
    end
    object ResGPfee: TCurrencyField
      FieldName = 'Pfee'
    end
    object ResGPtotal: TCurrencyField
      FieldName = 'Ptotal'
    end
    object ResGDelikod: TBooleanField
      FieldName = 'Delikod'
    end
    object ResGReject: TFloatField
      FieldName = 'Reject'
    end
    object ResGNo: TIntegerField
      FieldName = 'No'
    end
    object ResGDat: TIntegerField
      FieldName = 'Dat'
    end
    object ResGSerial: TStringField
      FieldName = 'Serial'
    end
  end
  object IRejG: TTable
    BeforePost = IRejGBeforePost
    AutoRefresh = True
    DatabaseName = 'ParFro'
    SessionName = 'Default'
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'Radif'
        DataType = ftInteger
      end
      item
        Name = 'Kod'
        DataType = ftInteger
      end
      item
        Name = 'Nam'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Color'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Anbnam'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Anbkod'
        DataType = ftInteger
      end
      item
        Name = 'Quant'
        DataType = ftFloat
      end
      item
        Name = 'Unit'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Pfee'
        DataType = ftCurrency
      end
      item
        Name = 'Ptotal'
        DataType = ftCurrency
      end
      item
        Name = 'Delikod'
        Attributes = [faRequired]
        DataType = ftBoolean
      end
      item
        Name = 'Reject'
        DataType = ftFloat
      end
      item
        Name = 'No'
        DataType = ftInteger
      end
      item
        Name = 'Dat'
        DataType = ftInteger
      end
      item
        Name = 'Serial'
        DataType = ftString
        Size = 20
      end>
    StoreDefs = True
    TableName = 'dbo.DiRejG'
    Left = 384
    Top = 157
    object IRejGId: TAutoIncField
      FieldName = 'Id'
      ReadOnly = True
      Visible = False
    end
    object IRejGRadif: TIntegerField
      FieldName = 'Radif'
    end
    object IRejGKod: TIntegerField
      FieldName = 'Kod'
    end
    object IRejGNam: TStringField
      FieldName = 'Nam'
      Size = 100
    end
    object IRejGColor: TStringField
      FieldName = 'Color'
      Size = 45
    end
    object IRejGAnbNam: TStringField
      FieldName = 'AnbNam'
      Size = 45
    end
    object IRejGAnbKod: TIntegerField
      FieldName = 'AnbKod'
    end
    object IRejGQuant: TFloatField
      FieldName = 'Quant'
    end
    object IRejGUnit: TStringField
      FieldKind = fkLookup
      FieldName = 'Unit'
      LookupDataSet = Good
      LookupKeyFields = 'Kod'
      LookupResultField = 'Unit'
      KeyFields = 'Kod'
      Lookup = True
    end
    object IRejGPfee: TCurrencyField
      FieldName = 'Pfee'
    end
    object IRejGPtotal: TCurrencyField
      FieldName = 'Ptotal'
    end
    object IRejGDelikod: TBooleanField
      FieldName = 'Delikod'
    end
    object IRejGReject: TFloatField
      FieldName = 'Reject'
    end
    object IRejGNo: TIntegerField
      FieldName = 'No'
    end
    object IRejGDat: TIntegerField
      FieldName = 'Dat'
    end
    object IRejGSerial: TStringField
      FieldName = 'Serial'
    end
  end
  object ORejG: TTable
    BeforePost = IRejGBeforePost
    AutoRefresh = True
    DatabaseName = 'ParFro'
    SessionName = 'Default'
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'Radif'
        DataType = ftInteger
      end
      item
        Name = 'Kod'
        DataType = ftInteger
      end
      item
        Name = 'Nam'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Color'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Anbnam'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Anbkod'
        DataType = ftInteger
      end
      item
        Name = 'Quant'
        DataType = ftFloat
      end
      item
        Name = 'Unit'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Pfee'
        DataType = ftCurrency
      end
      item
        Name = 'Ptotal'
        DataType = ftCurrency
      end
      item
        Name = 'Delikod'
        Attributes = [faRequired]
        DataType = ftBoolean
      end
      item
        Name = 'Reject'
        DataType = ftFloat
      end
      item
        Name = 'No'
        DataType = ftInteger
      end
      item
        Name = 'Dat'
        DataType = ftInteger
      end
      item
        Name = 'Serial'
        DataType = ftString
        Size = 20
      end>
    StoreDefs = True
    TableName = 'dbo.DoRejG'
    Left = 412
    Top = 157
    object ORejGId: TAutoIncField
      FieldName = 'Id'
      ReadOnly = True
      Visible = False
    end
    object ORejGRadif: TIntegerField
      FieldName = 'Radif'
    end
    object ORejGKod: TIntegerField
      FieldName = 'Kod'
    end
    object ORejGNam: TStringField
      FieldName = 'Nam'
      Size = 100
    end
    object ORejGColor: TStringField
      FieldName = 'Color'
      Size = 45
    end
    object ORejGAnbNam: TStringField
      FieldName = 'AnbNam'
      Size = 45
    end
    object ORejGAnbKod: TIntegerField
      FieldName = 'AnbKod'
    end
    object ORejGQuant: TFloatField
      FieldName = 'Quant'
    end
    object ORejGUnit: TStringField
      FieldKind = fkLookup
      FieldName = 'Unit'
      LookupDataSet = Good
      LookupKeyFields = 'Kod'
      LookupResultField = 'Unit'
      KeyFields = 'Kod'
      Lookup = True
    end
    object ORejGPfee: TCurrencyField
      FieldName = 'Pfee'
    end
    object ORejGPtotal: TCurrencyField
      FieldName = 'Ptotal'
    end
    object ORejGDelikod: TBooleanField
      FieldName = 'Delikod'
    end
    object ORejGReject: TFloatField
      FieldName = 'Reject'
    end
    object ORejGNo: TIntegerField
      FieldName = 'No'
    end
    object ORejGDat: TIntegerField
      FieldName = 'Dat'
    end
    object ORejGSerial: TStringField
      FieldName = 'Serial'
    end
  end
  object HavDs: TDataSource
    AutoEdit = False
    DataSet = Hav
    Left = 328
    Top = 217
  end
  object ResDs: TDataSource
    AutoEdit = False
    DataSet = Res
    Left = 356
    Top = 217
  end
  object IRejDs: TDataSource
    DataSet = IRej
    Left = 384
    Top = 217
  end
  object ORejDs: TDataSource
    AutoEdit = False
    DataSet = ORej
    Left = 412
    Top = 217
  end
  object HavGDs: TDataSource
    DataSet = HavG
    Left = 326
    Top = 266
  end
  object ResGDs: TDataSource
    AutoEdit = False
    DataSet = ResG
    Left = 354
    Top = 266
  end
  object IRejGDs: TDataSource
    DataSet = IRejG
    Left = 382
    Top = 266
  end
  object ORejGDs: TDataSource
    AutoEdit = False
    DataSet = ORejG
    Left = 410
    Top = 266
  end
  object FTip: TTable
    AutoRefresh = True
    DatabaseName = 'ParFro'
    SessionName = 'Default'
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'Des'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Beskod'
        DataType = ftFloat
      end
      item
        Name = 'Bedkod'
        DataType = ftFloat
      end>
    StoreDefs = True
    TableName = 'dbo.FTip'
    Left = 47
    Top = 198
    object FTipId: TAutoIncField
      FieldName = 'Id'
      ReadOnly = True
      Visible = False
    end
    object FTipDes: TStringField
      Alignment = taRightJustify
      FieldName = 'Des'
      Size = 45
    end
    object FTipBeskod: TFloatField
      FieldName = 'Beskod'
    end
    object FTipBedkod: TFloatField
      FieldName = 'Bedkod'
    end
  end
  object FTipDs: TDataSource
    AutoEdit = False
    DataSet = FTip
    Left = 48
    Top = 557
  end
  object Ctip: TTable
    AutoRefresh = True
    DatabaseName = 'ParFro'
    SessionName = 'Default'
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'Name'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Sign'
        DataType = ftString
        Size = 5
      end>
    StoreDefs = True
    TableName = 'dbo.CTip'
    Left = 76
    Top = 198
    object CtipId: TAutoIncField
      FieldName = 'Id'
      ReadOnly = True
      Visible = False
    end
    object CtipName: TStringField
      Alignment = taRightJustify
      FieldName = 'Name'
      Size = 15
    end
    object CtipSign: TStringField
      Alignment = taRightJustify
      FieldName = 'Sign'
      Size = 5
    end
  end
  object CtipDs: TDataSource
    AutoEdit = False
    DataSet = Ctip
    Left = 80
    Top = 557
  end
  object Crate: TTable
    AutoRefresh = True
    DatabaseName = 'ParFro'
    SessionName = 'Default'
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'Cname'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Fee'
        DataType = ftCurrency
      end
      item
        Name = 'Dat'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'PK_CRate'
        Fields = 'Id'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = '_WA_Sys_Cname_1920BF5C'
        Fields = 'Cname'
      end
      item
        Name = '_WA_Sys_Dat_1920BF5C'
        Fields = 'Dat'
      end
      item
        Name = '_WA_Sys_Fee_1920BF5C'
        Fields = 'Fee'
      end>
    StoreDefs = True
    TableName = 'dbo.CRate'
    Left = 104
    Top = 198
    object CrateId: TAutoIncField
      FieldName = 'Id'
      ReadOnly = True
      Visible = False
    end
    object CrateCName: TStringField
      FieldName = 'CName'
      Size = 15
    end
    object CrateFee: TCurrencyField
      FieldName = 'Fee'
    end
    object CrateDat: TIntegerField
      FieldName = 'Dat'
      DisplayFormat = '####/##/##'
    end
  end
  object CrateDs: TDataSource
    AutoEdit = False
    DataSet = Crate
    Left = 108
    Top = 557
  end
  object Acpay: TTable
    BeforeEdit = AcpayBeforeEdit
    AfterPost = AcpayAfterPost
    BeforeDelete = AcpayBeforeDelete
    AutoRefresh = True
    DatabaseName = 'ParFro'
    SessionName = 'Default'
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'No'
        DataType = ftInteger
      end
      item
        Name = 'Dat'
        DataType = ftInteger
      end
      item
        Name = 'Price'
        DataType = ftCurrency
      end
      item
        Name = 'Bednam'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Besnam'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Des'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'Bno'
        DataType = ftInteger
      end
      item
        Name = 'Inv'
        DataType = ftInteger
      end
      item
        Name = 'Cost'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Ckod'
        DataType = ftInteger
      end
      item
        Name = 'Ctip'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Cprice'
        DataType = ftCurrency
      end
      item
        Name = 'Rate'
        DataType = ftCurrency
      end
      item
        Name = 'Cwage'
        DataType = ftCurrency
      end
      item
        Name = 'Lperm'
        Attributes = [faRequired]
        DataType = ftBoolean
      end
      item
        Name = 'Ckod2'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'PK_AccountPay'
        Fields = 'Id'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'dbo.AccountPay'
    Left = 132
    Top = 198
    object AcpayId: TAutoIncField
      FieldName = 'Id'
      Visible = False
    end
    object AcpayNo: TIntegerField
      FieldName = 'No'
    end
    object AcpayDat: TIntegerField
      FieldName = 'Dat'
    end
    object AcpayPrice: TCurrencyField
      FieldName = 'Price'
    end
    object AcpayBednam: TStringField
      FieldName = 'Bednam'
      Size = 45
    end
    object AcpayBesnam: TStringField
      FieldName = 'Besnam'
      Size = 45
    end
    object AcpayDes: TStringField
      Alignment = taRightJustify
      FieldName = 'Des'
      Size = 200
    end
    object AcpayBnO: TIntegerField
      FieldName = 'BnO'
    end
    object AcpayInv: TIntegerField
      FieldName = 'Inv'
    end
    object AcpayCost: TStringField
      FieldName = 'Cost'
      Size = 45
    end
    object AcpayCkod: TIntegerField
      FieldName = 'Ckod'
    end
    object AcpayCtip: TStringField
      FieldName = 'Ctip'
      Size = 15
    end
    object AcpayCprice: TCurrencyField
      FieldName = 'Cprice'
    end
    object AcpayRate: TCurrencyField
      FieldName = 'Rate'
    end
    object AcpayCwage: TCurrencyField
      FieldName = 'Cwage'
    end
    object AcpayLperm: TBooleanField
      FieldName = 'Lperm'
    end
    object AcpayCkod2: TIntegerField
      FieldName = 'Ckod2'
    end
  end
  object AcpayDs: TDataSource
    AutoEdit = False
    DataSet = Acpay
    Left = 136
    Top = 557
  end
  object Cashier: TTable
    AutoRefresh = True
    DatabaseName = 'ParFro'
    SessionName = 'Default'
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'Name'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Owner'
        Attributes = [faRequired]
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Ctip'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Ackod'
        DataType = ftFloat
      end>
    StoreDefs = True
    TableName = 'dbo.Cashiers'
    Left = 161
    Top = 198
    object CashierId: TAutoIncField
      FieldName = 'Id'
      ReadOnly = True
      Visible = False
    end
    object CashierName: TStringField
      Alignment = taRightJustify
      FieldName = 'Name'
      Size = 45
    end
    object CashierOwner: TStringField
      Alignment = taRightJustify
      FieldName = 'Owner'
      Size = 45
    end
    object CashierCtip: TStringField
      FieldName = 'Ctip'
    end
    object CashierAckod: TFloatField
      FieldName = 'Ackod'
    end
  end
  object CashierDS: TDataSource
    AutoEdit = False
    DataSet = Cashier
    Left = 164
    Top = 557
  end
  object UAC: TTable
    DatabaseName = 'ParFro'
    SessionName = 'Default'
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'Userid'
        DataType = ftInteger
      end
      item
        Name = 'Usern'
        Attributes = [faRequired]
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Acname'
        Attributes = [faRequired]
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Acckod'
        Attributes = [faRequired]
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'PK_UAccounts'
        Fields = 'Id'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'dbo.UserAc'
    Left = 190
    Top = 198
    object UACId: TAutoIncField
      DisplayWidth = 4
      FieldName = 'Id'
      Visible = False
    end
    object UACUserid: TIntegerField
      FieldName = 'Userid'
      Visible = False
    end
    object UACUsern: TStringField
      FieldName = 'Usern'
      Required = True
      Visible = False
      Size = 50
    end
    object UACAcname: TStringField
      DisplayLabel = '‰«„ Õ”«»'
      DisplayWidth = 26
      FieldName = 'Acname'
      Required = True
      Size = 50
    end
    object UACAcckod: TFloatField
      DisplayLabel = 'òœÕ”«»'
      DisplayWidth = 23
      FieldName = 'Acckod'
      Required = True
    end
  end
  object UACDs: TDataSource
    AutoEdit = False
    DataSet = UAC
    Left = 202
    Top = 557
  end
  object RM: TTable
    AfterOpen = RMAfterEdit
    BeforeEdit = RMBeforeEdit
    AfterEdit = RMAfterEdit
    AfterPost = RMAfterPost
    BeforeDelete = RMBeforeDelete
    AfterScroll = RMAfterEdit
    AutoRefresh = True
    DatabaseName = 'ParFro'
    SessionName = 'Default'
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'No'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'Dat'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'Acnam'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Acckod'
        DataType = ftFloat
      end
      item
        Name = 'Des'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'Bno'
        DataType = ftInteger
      end
      item
        Name = 'lperm'
        Attributes = [faRequired]
        DataType = ftBoolean
      end
      item
        Name = 'Psum'
        DataType = ftCurrency
      end>
    StoreDefs = True
    TableName = 'dbo.Remit'
    Left = 218
    Top = 197
    object RMId: TAutoIncField
      FieldName = 'Id'
      Visible = False
    end
    object RMNo: TIntegerField
      FieldName = 'No'
      Required = True
    end
    object RMDat: TIntegerField
      FieldName = 'Dat'
      Required = True
      DisplayFormat = '####/##/##'
    end
    object RMAcnam: TStringField
      FieldName = 'Acnam'
      Size = 50
    end
    object RMAcckod: TFloatField
      FieldName = 'Acckod'
    end
    object RMDes: TStringField
      Alignment = taRightJustify
      FieldName = 'Des'
      Size = 200
    end
    object RMBno: TIntegerField
      FieldName = 'Bno'
    end
    object RMlperm: TBooleanField
      FieldName = 'lperm'
    end
    object RMPsum: TCurrencyField
      FieldName = 'Psum'
    end
  end
  object RMDs: TDataSource
    AutoEdit = False
    DataSet = RM
    Left = 230
    Top = 557
  end
  object RMOut: TTable
    BeforePost = RMOutBeforePost
    AutoRefresh = True
    DatabaseName = 'ParFro'
    SessionName = 'Default'
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'ItNo'
        DataType = ftInteger
      end
      item
        Name = 'Acnam'
        Attributes = [faRequired]
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Acckod'
        DataType = ftFloat
      end
      item
        Name = 'Ckod'
        DataType = ftInteger
      end
      item
        Name = 'Amount'
        DataType = ftCurrency
      end
      item
        Name = 'Ctip'
        DataType = ftSmallint
      end
      item
        Name = 'Rate'
        DataType = ftCurrency
      end
      item
        Name = 'Price'
        DataType = ftCurrency
      end
      item
        Name = 'Cwage'
        DataType = ftCurrency
      end
      item
        Name = 'Remfee'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Code'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'Person'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Tel'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'Bank'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'AccountDes'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Des'
        DataType = ftString
        Size = 130
      end
      item
        Name = 'Dat'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'No'
        Attributes = [faRequired]
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'PK_RemmitOut'
        Fields = 'Id'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'dbo.RemitOut'
    Left = 246
    Top = 197
    object RMOutId: TAutoIncField
      FieldName = 'Id'
      Visible = False
    end
    object RMOutItNo: TIntegerField
      FieldName = 'ItNo'
    end
    object RMOutAcnam: TStringField
      FieldName = 'Acnam'
      Size = 50
    end
    object RMOutAcckod: TFloatField
      FieldName = 'Acckod'
    end
    object RMOutCkod: TIntegerField
      FieldName = 'Ckod'
    end
    object RMOutAmount: TCurrencyField
      FieldName = 'Amount'
    end
    object RMOutCtip: TSmallintField
      FieldName = 'Ctip'
    end
    object RMOutRate: TCurrencyField
      FieldName = 'Rate'
    end
    object RMOutPrice: TCurrencyField
      FieldName = 'Price'
    end
    object RMOutCwage: TCurrencyField
      FieldName = 'Cwage'
    end
    object RMOutRemfee: TStringField
      FieldName = 'Remfee'
      Size = 30
    end
    object RMOutCode: TStringField
      FieldName = 'Code'
      Size = 35
    end
    object RMOutPerson: TStringField
      FieldName = 'Person'
      Size = 45
    end
    object RMOutTel: TStringField
      FieldName = 'Tel'
      Size = 25
    end
    object RMOutBank: TStringField
      FieldName = 'Bank'
      Size = 45
    end
    object RMOutAccountDes: TStringField
      FieldName = 'AccountDes'
      Size = 50
    end
    object RMOutDes: TStringField
      FieldName = 'Des'
      Size = 200
    end
    object RMOutDat: TIntegerField
      FieldName = 'Dat'
    end
    object RMOutNo: TIntegerField
      FieldName = 'No'
      Required = True
    end
  end
  object RMOutDs: TDataSource
    AutoEdit = False
    DataSet = RMOut
    Left = 258
    Top = 557
  end
  object RMin: TTable
    AutoRefresh = True
    DatabaseName = 'ParFro'
    SessionName = 'Default'
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'ItNo'
        DataType = ftInteger
      end
      item
        Name = 'Acnam'
        Attributes = [faRequired]
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Acckod'
        DataType = ftFloat
      end
      item
        Name = 'Ckod'
        DataType = ftInteger
      end
      item
        Name = 'Amount'
        DataType = ftCurrency
      end
      item
        Name = 'Ctip'
        DataType = ftSmallint
      end
      item
        Name = 'Rate'
        DataType = ftCurrency
      end
      item
        Name = 'Price'
        DataType = ftCurrency
      end
      item
        Name = 'Cwage'
        DataType = ftCurrency
      end
      item
        Name = 'Remfee'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Code'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'Person'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Tel'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'Bank'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'AccountDes'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Des'
        DataType = ftString
        Size = 130
      end
      item
        Name = 'Dat'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'No'
        Attributes = [faRequired]
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'PK_Rmitin'
        Fields = 'Id'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'dbo.Remitin'
    Left = 274
    Top = 197
    object RMinId: TAutoIncField
      FieldName = 'Id'
      Visible = False
    end
    object RMinItNo: TIntegerField
      FieldName = 'ItNo'
    end
    object RMinAcnam: TStringField
      FieldName = 'Acnam'
      Size = 50
    end
    object RMinAcckod: TFloatField
      FieldName = 'Acckod'
    end
    object RMinCkod: TIntegerField
      FieldName = 'Ckod'
    end
    object RMinAmount: TCurrencyField
      FieldName = 'Amount'
    end
    object RMinCtip: TSmallintField
      FieldName = 'Ctip'
    end
    object RMinRate: TCurrencyField
      FieldName = 'Rate'
    end
    object RMinPrice: TCurrencyField
      FieldName = 'Price'
    end
    object RMinCwage: TCurrencyField
      FieldName = 'Cwage'
    end
    object RMinRemfee: TStringField
      FieldName = 'Remfee'
      Size = 30
    end
    object RMinCode: TStringField
      FieldName = 'Code'
      Size = 35
    end
    object RMinPerson: TStringField
      FieldName = 'Person'
      Size = 45
    end
    object RMinTel: TStringField
      FieldName = 'Tel'
      Size = 25
    end
    object RMinBank: TStringField
      FieldName = 'Bank'
      Size = 45
    end
    object RMinAccountDes: TStringField
      FieldName = 'AccountDes'
      Size = 50
    end
    object RMinDes: TStringField
      FieldName = 'Des'
      Size = 200
    end
    object RMinDat: TIntegerField
      FieldName = 'Dat'
    end
    object RMinNo: TIntegerField
      FieldName = 'No'
      Required = True
    end
  end
  object RMinDs: TDataSource
    AutoEdit = False
    DataSet = RMin
    Left = 286
    Top = 553
  end
  object Exch: TTable
    DatabaseName = 'ParFro'
    SessionName = 'Default'
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'No'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'Dat'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'Acnam'
        Attributes = [faRequired]
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Acckod'
        DataType = ftFloat
      end
      item
        Name = 'Ckod'
        DataType = ftInteger
      end
      item
        Name = 'Amount'
        Attributes = [faRequired]
        DataType = ftCurrency
      end
      item
        Name = 'Ctip'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Rate'
        DataType = ftCurrency
      end
      item
        Name = 'IAmount'
        Attributes = [faRequired]
        DataType = ftCurrency
      end
      item
        Name = 'ICtip'
        Attributes = [faRequired]
        DataType = ftString
        Size = 15
      end
      item
        Name = 'ExchAc'
        DataType = ftFloat
      end
      item
        Name = 'Bno'
        DataType = ftInteger
      end
      item
        Name = 'Des'
        DataType = ftString
        Size = 200
      end>
    IndexDefs = <
      item
        Name = 'PK_Cexchange'
        Fields = 'Id'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'dbo.Cexchange'
    Left = 56
    Top = 284
    object ExchId: TAutoIncField
      FieldName = 'Id'
      Visible = False
    end
    object ExchNo: TIntegerField
      FieldName = 'No'
      Required = True
    end
    object ExchDat: TIntegerField
      FieldName = 'Dat'
      Required = True
      DisplayFormat = '####/##/##'
    end
    object ExchAcnam: TStringField
      FieldName = 'Acnam'
      Required = True
      Size = 50
    end
    object ExchAcckod: TFloatField
      FieldName = 'Acckod'
    end
    object ExchCkod: TIntegerField
      FieldName = 'Ckod'
    end
    object ExchAmount: TCurrencyField
      FieldName = 'Amount'
      Required = True
    end
    object ExchCtip: TStringField
      FieldName = 'Ctip'
      Size = 15
    end
    object ExchRate: TCurrencyField
      FieldName = 'Rate'
    end
    object ExchIAmount: TCurrencyField
      FieldName = 'IAmount'
      Required = True
    end
    object ExchICtip: TStringField
      FieldName = 'ICtip'
      Required = True
      Size = 15
    end
    object ExchExchAc: TFloatField
      FieldName = 'ExchAc'
    end
    object ExchBno: TIntegerField
      FieldName = 'Bno'
    end
    object ExchDes: TStringField
      Alignment = taRightJustify
      FieldName = 'Des'
      Size = 200
    end
  end
  object ExchDs: TDataSource
    AutoEdit = False
    DataSet = Exch
    Left = 14
    Top = 582
  end
  object Exp: TTable
    AfterOpen = ExpAfterEdit
    BeforeEdit = ExpBeforeEdit
    AfterEdit = ExpAfterEdit
    AfterPost = ExpAfterPost
    BeforeDelete = ExpBeforeDelete
    AfterScroll = ExpAfterEdit
    AutoRefresh = True
    DatabaseName = 'ParFro'
    SessionName = 'Default'
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'No'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'Dat'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'Accnam'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Acckod'
        Attributes = [faRequired]
        DataType = ftFloat
      end
      item
        Name = 'Cost'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Ckod'
        DataType = ftInteger
      end
      item
        Name = 'Psum'
        DataType = ftCurrency
      end
      item
        Name = 'Des'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'Bno'
        DataType = ftInteger
      end
      item
        Name = 'Lperm'
        Attributes = [faRequired]
        DataType = ftBoolean
      end>
    IndexDefs = <
      item
        Name = 'PK_Expen'
        Fields = 'Id'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'dbo.Expen'
    Left = 466
    Top = 10
    object ExpId: TAutoIncField
      FieldName = 'Id'
      Visible = False
    end
    object ExpNo: TIntegerField
      FieldName = 'No'
      Required = True
    end
    object ExpDat: TIntegerField
      FieldName = 'Dat'
      Required = True
      DisplayFormat = '####/##/##'
    end
    object ExpAccnam: TStringField
      FieldName = 'Accnam'
      Size = 50
    end
    object ExpAcckod: TFloatField
      FieldName = 'Acckod'
    end
    object ExpCost: TStringField
      FieldName = 'Cost'
      Size = 50
    end
    object ExpCkod: TIntegerField
      FieldName = 'Ckod'
    end
    object ExpPsum: TCurrencyField
      FieldName = 'Psum'
    end
    object ExpDes: TStringField
      Alignment = taRightJustify
      FieldName = 'Des'
      Size = 200
    end
    object ExpBno: TIntegerField
      FieldName = 'Bno'
    end
    object ExpLperm: TBooleanField
      FieldName = 'Lperm'
      Required = True
    end
  end
  object ExpDs: TDataSource
    AutoEdit = False
    DataSet = Exp
    Left = 466
    Top = 56
  end
  object ExpD: TTable
    AutoRefresh = True
    DatabaseName = 'ParFro'
    SessionName = 'Default'
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'ItNo'
        DataType = ftInteger
      end
      item
        Name = 'Acnam'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Acckod'
        DataType = ftFloat
      end
      item
        Name = 'Ckod'
        DataType = ftInteger
      end
      item
        Name = 'Amount'
        DataType = ftCurrency
      end
      item
        Name = 'Ctip'
        DataType = ftSmallint
      end
      item
        Name = 'Rate'
        DataType = ftCurrency
      end
      item
        Name = 'Price'
        DataType = ftCurrency
      end
      item
        Name = 'Des'
        DataType = ftString
        Size = 160
      end
      item
        Name = 'Dat'
        DataType = ftInteger
      end
      item
        Name = 'No'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'PK_ExpenD'
        Fields = 'Id'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'dbo.ExpenD'
    Left = 494
    Top = 10
    object ExpDId: TAutoIncField
      FieldName = 'Id'
      Visible = False
    end
    object ExpDItNo: TIntegerField
      FieldName = 'ItNo'
    end
    object ExpDAcnam: TStringField
      FieldName = 'Acnam'
      Size = 50
    end
    object ExpDAcckod: TFloatField
      FieldName = 'Acckod'
    end
    object ExpDCkod: TIntegerField
      FieldName = 'Ckod'
    end
    object ExpDAmount: TCurrencyField
      FieldName = 'Amount'
    end
    object ExpDCtip: TSmallintField
      FieldName = 'Ctip'
    end
    object ExpDRate: TCurrencyField
      FieldName = 'Rate'
    end
    object ExpDPrice: TCurrencyField
      FieldName = 'Price'
    end
    object ExpDDes: TStringField
      FieldName = 'Des'
      Size = 160
    end
    object ExpDDat: TIntegerField
      FieldName = 'Dat'
    end
    object ExpDNo: TIntegerField
      FieldName = 'No'
    end
  end
  object ExpDds: TDataSource
    AutoEdit = False
    DataSet = ExpD
    Left = 494
    Top = 56
  end
  object UAct: TTable
    DatabaseName = 'ParFro'
    SessionName = 'Default'
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'Uname'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Dat'
        DataType = ftDateTime
      end
      item
        Name = 'Doc'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Ddat'
        DataType = ftInteger
      end
      item
        Name = 'Dno'
        DataType = ftInteger
      end
      item
        Name = 'Dvalue'
        DataType = ftFloat
      end
      item
        Name = 'Act'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Htime'
        DataType = ftDateTime
      end
      item
        Name = 'FDat'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'PK_UserAct'
        Fields = 'Id'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'dbo.UserAct'
    Left = 198
    Top = 269
    object UActId: TAutoIncField
      DisplayWidth = 12
      FieldName = 'Id'
      Visible = False
    end
    object UActUname: TStringField
      DisplayWidth = 54
      FieldName = 'Uname'
      Size = 45
    end
    object UActDat: TDateTimeField
      DisplayWidth = 21
      FieldName = 'Dat'
    end
    object UActDoc: TStringField
      DisplayWidth = 32
      FieldName = 'Doc'
      Size = 50
    end
    object UActDdat: TIntegerField
      DisplayWidth = 14
      FieldName = 'Ddat'
      DisplayFormat = '####/##/##'
    end
    object UActDno: TIntegerField
      DisplayWidth = 12
      FieldName = 'Dno'
    end
    object UActDvalue: TFloatField
      DisplayWidth = 12
      FieldName = 'Dvalue'
    end
    object UActAct: TStringField
      DisplayWidth = 60
      FieldName = 'Act'
      Size = 50
    end
    object UActHtime: TDateTimeField
      DisplayWidth = 22
      FieldName = 'Htime'
    end
    object UActFDat: TIntegerField
      DisplayWidth = 12
      FieldName = 'FDat'
      DisplayFormat = '####/##/##'
    end
  end
  object UActDs: TDataSource
    AutoEdit = False
    DataSet = UAct
    Left = 200
    Top = 315
  end
  object BillD: TTable
    AutoRefresh = True
    DatabaseName = 'ParFro'
    SessionName = 'Default'
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'No'
        DataType = ftInteger
      end
      item
        Name = 'Dat'
        DataType = ftInteger
      end
      item
        Name = 'Bedsum'
        DataType = ftCurrency
      end
      item
        Name = 'Bessum'
        DataType = ftCurrency
      end
      item
        Name = 'Des'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'Lperm'
        Attributes = [faRequired]
        DataType = ftBoolean
      end
      item
        Name = 'Atf'
        DataType = ftInteger
      end
      item
        Name = 'Tip'
        DataType = ftSmallint
      end>
    IndexDefs = <
      item
        Name = 'PK_BillD'
        Fields = 'Id'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'IX_BillD'
        Fields = 'Dat'
      end>
    IndexFieldNames = 'Dat'
    StoreDefs = True
    TableName = 'dbo.BillD'
    Left = 84
    Top = 284
    object BillDId: TAutoIncField
      FieldName = 'Id'
      Visible = False
    end
    object BillDNo: TIntegerField
      FieldName = 'No'
    end
    object BillDDat: TIntegerField
      FieldName = 'Dat'
    end
    object BillDBedsum: TCurrencyField
      FieldName = 'Bedsum'
    end
    object BillDBesSum: TCurrencyField
      FieldName = 'BesSum'
    end
    object BillDDes: TStringField
      FieldName = 'Des'
      Size = 200
    end
    object BillDLperm: TBooleanField
      FieldName = 'Lperm'
    end
    object BillDAtf: TIntegerField
      FieldName = 'Atf'
    end
    object BillDTip: TSmallintField
      FieldName = 'Tip'
    end
  end
  object BillDds: TDataSource
    AutoEdit = False
    DataSet = BillD
    Left = 42
    Top = 582
  end
  object GForm: TTable
    AutoRefresh = True
    DatabaseName = 'ParFro'
    SessionName = 'Default'
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'Kod'
        DataType = ftInteger
      end
      item
        Name = 'Nam'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Quant'
        DataType = ftFloat
      end
      item
        Name = 'Mkod'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'PK_Gform'
        Fields = 'Id'
        Options = [ixPrimary, ixUnique]
      end>
    IndexFieldNames = 'Id'
    StoreDefs = True
    TableName = 'dbo.Gform'
    Left = 112
    Top = 284
    object GFormId: TAutoIncField
      FieldName = 'Id'
    end
    object GFormKod: TIntegerField
      DisplayLabel = 'òœ ò«·«'
      FieldName = 'Kod'
    end
    object GFormNam: TStringField
      DisplayLabel = '‘—Õ ò«·«'
      FieldName = 'Nam'
      Size = 100
    end
    object GFormQuant: TFloatField
      DisplayLabel = ' ⁄œ«œ'
      FieldName = 'Quant'
    end
    object GFormMkod: TIntegerField
      DisplayLabel = 'òœ „«œ—'
      FieldName = 'Mkod'
    end
  end
  object GFormDs: TDataSource
    AutoEdit = False
    DataSet = GForm
    Left = 72
    Top = 582
  end
  object DOutG: TTable
    AutoRefresh = True
    DatabaseName = 'ParFro'
    SessionName = 'Default'
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'Radif'
        DataType = ftInteger
      end
      item
        Name = 'Kod'
        DataType = ftInteger
      end
      item
        Name = 'Nam'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Color'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Anbnam'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Anbkod'
        DataType = ftInteger
      end
      item
        Name = 'Quant'
        DataType = ftFloat
      end
      item
        Name = 'Unit'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Pfee'
        DataType = ftCurrency
      end
      item
        Name = 'Ptotal'
        DataType = ftCurrency
      end
      item
        Name = 'Delikod'
        Attributes = [faRequired]
        DataType = ftBoolean
      end
      item
        Name = 'Reject'
        DataType = ftFloat
      end
      item
        Name = 'No'
        DataType = ftInteger
      end
      item
        Name = 'Dat'
        DataType = ftInteger
      end
      item
        Name = 'Serial'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <
      item
        Name = 'PK_DOutG'
        Fields = 'Id'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'dbo.DOutG'
    Left = 506
    Top = 180
    object DOutGId: TAutoIncField
      FieldName = 'Id'
      Visible = False
    end
    object DOutGRadif: TIntegerField
      FieldName = 'Radif'
    end
    object DOutGKod: TIntegerField
      FieldName = 'Kod'
    end
    object DOutGNam: TStringField
      FieldName = 'Nam'
      Size = 100
    end
    object DOutGColor: TStringField
      FieldName = 'Color'
      Size = 45
    end
    object DOutGAnbnam: TStringField
      FieldName = 'Anbnam'
      Size = 45
    end
    object DOutGAnbkod: TIntegerField
      FieldName = 'Anbkod'
    end
    object DOutGQuant: TFloatField
      FieldName = 'Quant'
    end
    object DOutGUnit: TStringField
      FieldKind = fkLookup
      FieldName = 'Unit'
      LookupDataSet = Good
      LookupKeyFields = 'Kod'
      LookupResultField = 'Unit'
      KeyFields = 'Kod'
      Lookup = True
    end
    object DOutGPfee: TCurrencyField
      FieldName = 'Pfee'
    end
    object DOutGPtotal: TCurrencyField
      FieldName = 'Ptotal'
    end
    object DOutGDelikod: TBooleanField
      FieldName = 'Delikod'
      Required = True
    end
    object DOutGReject: TFloatField
      DefaultExpression = '0'
      FieldName = 'Reject'
    end
    object DOutGNo: TIntegerField
      FieldName = 'No'
    end
    object DOutGDat: TIntegerField
      FieldName = 'Dat'
    end
    object DOutGSerial: TStringField
      FieldName = 'Serial'
    end
  end
  object DOutGDs: TDataSource
    AutoEdit = False
    DataSet = DOutG
    Left = 508
    Top = 231
  end
  object Dout: TTable
    DatabaseName = 'ParFro'
    SessionName = 'Default'
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'No'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'Dat'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'Nam'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Pkol'
        DataType = ftCurrency
      end
      item
        Name = 'Pdis'
        DataType = ftCurrency
      end
      item
        Name = 'Pnet'
        DataType = ftCurrency
      end
      item
        Name = 'Bkod'
        Attributes = [faRequired]
        DataType = ftBoolean
      end
      item
        Name = 'Bno'
        DataType = ftInteger
      end
      item
        Name = 'Cost'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Ckod'
        DataType = ftInteger
      end
      item
        Name = 'Refno'
        DataType = ftInteger
      end
      item
        Name = 'Des'
        DataType = ftString
        Size = 200
      end>
    IndexDefs = <
      item
        Name = 'PK_DOut'
        Fields = 'Id'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'dbo.DOut'
    Left = 470
    Top = 180
    object DoutId: TAutoIncField
      FieldName = 'Id'
      Visible = False
    end
    object DoutNo: TIntegerField
      FieldName = 'No'
      Required = True
    end
    object DoutDat: TIntegerField
      FieldName = 'Dat'
      Required = True
    end
    object DoutNam: TStringField
      FieldName = 'Nam'
      Size = 45
    end
    object DoutPkol: TCurrencyField
      FieldName = 'Pkol'
    end
    object DoutPdis: TCurrencyField
      FieldName = 'Pdis'
    end
    object DoutPnet: TCurrencyField
      FieldName = 'Pnet'
    end
    object DoutBkod: TBooleanField
      FieldName = 'Bkod'
      Required = True
    end
    object DoutBno: TIntegerField
      FieldName = 'Bno'
    end
    object DoutCost: TStringField
      FieldName = 'Cost'
      Size = 45
    end
    object DoutCkod: TIntegerField
      FieldName = 'Ckod'
    end
    object DoutRefno: TIntegerField
      FieldName = 'Refno'
    end
    object DoutDes: TStringField
      FieldName = 'Des'
      Size = 200
    end
  end
  object DoutDs: TDataSource
    AutoEdit = False
    DataSet = Dout
    Left = 470
    Top = 232
  end
  object ppHav: TppBDEPipeline
    DataSource = HavDs
    AutoCreateFields = False
    UserName = 'Hav'
    Left = 350
    Top = 339
    object ppHavppField1: TppField
      Alignment = taRightJustify
      FieldAlias = '‘„«—Â ÕÊ«·Â'
      FieldName = 'No'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 0
    end
    object ppHavppField2: TppField
      Alignment = taRightJustify
      FieldAlias = ' «—ÌŒ'
      FieldName = 'Dat'
      FieldLength = 0
      DataType = dtInteger
      DisplayFormat = '####/##/##'
      DisplayWidth = 10
      Position = 1
    end
    object ppHavppField3: TppField
      FieldAlias = '‰«„ Õ”«»'
      FieldName = 'Nam'
      FieldLength = 45
      DisplayWidth = 45
      Position = 2
    end
    object ppHavppField4: TppField
      FieldAlias = 'Pkol'
      FieldName = 'Pkol'
      FieldLength = 0
      DataType = dtCurrency
      DisplayWidth = 10
      Position = 3
    end
    object ppHavppField5: TppField
      FieldAlias = 'Pdis'
      FieldName = 'Pdis'
      FieldLength = 0
      DataType = dtCurrency
      DisplayWidth = 10
      Position = 4
    end
    object ppHavppField6: TppField
      FieldAlias = 'Pnet'
      FieldName = 'Pnet'
      FieldLength = 0
      DataType = dtCurrency
      DisplayWidth = 10
      Position = 5
    end
    object ppHavppField7: TppField
      FieldAlias = 'Bkod'
      FieldName = 'Bkod'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 6
    end
    object ppHavppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'Bno'
      FieldName = 'Bno'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 7
    end
    object ppHavppField9: TppField
      FieldAlias = '‰«„ Å—ÊéÂ'
      FieldName = 'Cost'
      FieldLength = 45
      DisplayWidth = 45
      Position = 8
    end
    object ppHavppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'òœ „—ò“'
      FieldName = 'Ckod'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 9
    end
    object ppHavppField11: TppField
      Alignment = taRightJustify
      FieldAlias = '‘„«—Â ›«ò Ê—'
      FieldName = 'RefNo'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 10
    end
    object ppHavppField12: TppField
      FieldAlias = '‘—Õ ÕÊ«·Â'
      FieldName = 'Des'
      FieldLength = 200
      DisplayWidth = 200
      Position = 11
    end
  end
  object ppHavg: TppBDEPipeline
    DataSource = HavGDs
    AutoCreateFields = False
    UserName = 'Havg'
    Left = 378
    Top = 338
    object ppHavgppField2: TppField
      FieldAlias = '—œÌ›'
      FieldName = 'Radif'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppHavgppField3: TppField
      FieldAlias = 'òœ ò«·«'
      FieldName = 'Kod'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppHavgppField4: TppField
      FieldAlias = '‘—Õ ò«·«'
      FieldName = 'Nam'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppHavgppField5: TppField
      FieldAlias = '„œ· '
      FieldName = 'Color'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppHavgppField6: TppField
      FieldAlias = '‰«„ «‰»«—'
      FieldName = 'AnbNam'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppHavgppField7: TppField
      FieldAlias = 'AnbKod'
      FieldName = 'AnbKod'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppHavgppField8: TppField
      FieldAlias = '„ﬁœ«—'
      FieldName = 'Quant'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppHavgppField9: TppField
      FieldAlias = 'Ê«Õœ'
      FieldName = 'Unit'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppHavgppField13: TppField
      FieldAlias = 'Œ—ÊÃÌ'
      FieldName = 'Reject'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppHavgppField14: TppField
      FieldAlias = 'No'
      FieldName = 'No'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppHavgppField15: TppField
      FieldAlias = 'Dat'
      FieldName = 'Dat'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppHavgppField16: TppField
      FieldAlias = 'Serial'
      FieldName = 'Serial'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppHavgppMasterFieldLink1: TppMasterFieldLink
      MasterFieldName = 'No'
      DetailFieldName = 'No'
      DetailSortOrder = soAscending
    end
  end
  object ppInvo: TppBDEPipeline
    DataSource = InvoDs
    AutoCreateFields = False
    UserName = 'Invoice'
    Left = 424
    Top = 338
    object ppInvoppField1: TppField
      Alignment = taRightJustify
      FieldAlias = '‘„«—Â ›«ò Ê— '
      FieldName = 'No'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 0
      Position = 0
    end
    object ppInvoppField2: TppField
      FieldAlias = ' ·›‰'
      FieldName = 'Tel'
      FieldLength = 20
      DisplayWidth = 20
      Position = 1
    end
    object ppInvoppField3: TppField
      Alignment = taRightJustify
      FieldAlias = ' «—ÌŒ'
      FieldName = 'Dat'
      FieldLength = 0
      DataType = dtInteger
      DisplayFormat = '####/##/##'
      DisplayWidth = 10
      Position = 2
    end
    object ppInvoppField4: TppField
      FieldAlias = '¬œ—”'
      FieldName = 'Adr'
      FieldLength = 200
      DisplayWidth = 200
      Position = 3
    end
    object ppInvoppField5: TppField
      FieldAlias = '‰«„ Õ”«»'
      FieldName = 'Nam'
      FieldLength = 45
      DisplayWidth = 24
      Position = 4
    end
    object ppInvoppField6: TppField
      FieldAlias = 'Ã„⁄ ò· ›«ò Ê—'
      FieldName = 'Pkol'
      FieldLength = 0
      DataType = dtCurrency
      DisplayWidth = 10
      Position = 5
    end
    object ppInvoppField7: TppField
      FieldAlias = ' Œ›Ì›'
      FieldName = 'Pdis'
      FieldLength = 0
      DataType = dtCurrency
      DisplayWidth = 10
      Position = 6
    end
    object ppInvoppField8: TppField
      FieldAlias = 'Œ«·’'
      FieldName = 'Pnet'
      FieldLength = 0
      DataType = dtCurrency
      DisplayWidth = 10
      Position = 7
    end
    object ppInvoppField9: TppField
      FieldAlias = '‰—Œ «—“'
      FieldName = 'Ppay'
      FieldLength = 0
      DataType = dtCurrency
      DisplayWidth = 10
      Position = 8
    end
    object ppInvoppField10: TppField
      FieldAlias = '„⁄«œ· —Ì«·Ì'
      FieldName = 'Prem'
      FieldLength = 0
      DataType = dtCurrency
      DisplayWidth = 10
      Position = 9
    end
    object ppInvoppField14: TppField
      FieldAlias = '‰Ê⁄ «—“'
      FieldName = 'Eco'
      FieldLength = 20
      DisplayWidth = 20
      Position = 10
    end
    object ppInvoppField15: TppField
      Alignment = taRightJustify
      FieldAlias = '‰«„ ÊÌ“Ì Ê—'
      FieldName = 'Visit'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 11
    end
    object ppInvoppField17: TppField
      FieldAlias = '‰Ê⁄ „⁄«„·Â'
      FieldName = 'PRule'
      FieldLength = 30
      DisplayWidth = 30
      Position = 12
    end
    object ppInvoppField18: TppField
      FieldAlias = '‰«„ Å—ÊéÂ'
      FieldName = 'Cost'
      FieldLength = 45
      DisplayWidth = 45
      Position = 13
    end
    object ppInvoppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'òœ „—ò“'
      FieldName = 'Ckod'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 14
    end
    object ppInvoppField20: TppField
      Alignment = taRightJustify
      FieldAlias = '‘„«—Â —›—«‰”'
      FieldName = 'RefNo'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 15
    end
    object ppInvoppField21: TppField
      FieldAlias = '⁄Ê«—÷'
      FieldName = 'Ptax'
      FieldLength = 0
      DataType = dtCurrency
      DisplayWidth = 10
      Position = 16
    end
  end
  object ppInvoGood: TppBDEPipeline
    DataSource = InvoGoodDs
    AutoCreateFields = False
    UserName = 'InvoiceGoods'
    Left = 456
    Top = 340
    object ppBDEPipeline1ppField2: TppField
      Alignment = taRightJustify
      FieldAlias = '—œÌ›'
      FieldName = 'Radif'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 0
    end
    object ppBDEPipeline1ppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'òœò«·«'
      FieldName = 'Kod'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 1
    end
    object ppBDEPipeline1ppField4: TppField
      FieldAlias = '‘—Õ ò«·«'
      FieldName = 'Nam'
      FieldLength = 100
      DisplayWidth = 100
      Position = 2
    end
    object ppBDEPipeline1ppField5: TppField
      FieldAlias = '„œ· ò«·«'
      FieldName = 'Color'
      FieldLength = 45
      DisplayWidth = 45
      Position = 3
    end
    object ppBDEPipeline1ppField6: TppField
      FieldAlias = '‰«„ «‰»«—'
      FieldName = 'AnbNam'
      FieldLength = 45
      DisplayWidth = 45
      Position = 4
    end
    object ppBDEPipeline1ppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'òœ «‰»«—'
      FieldName = 'AnbKod'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppBDEPipeline1ppField8: TppField
      Alignment = taRightJustify
      FieldAlias = '„ﬁœ«—'
      FieldName = 'Quant'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppBDEPipeline1ppField9: TppField
      FieldAlias = 'Ê«Õœ'
      FieldName = 'Unit'
      FieldLength = 20
      DisplayWidth = 20
      Position = 7
    end
    object ppBDEPipeline1ppField10: TppField
      FieldAlias = 'ﬁÌ„ '
      FieldName = 'Pfee'
      FieldLength = 0
      DataType = dtCurrency
      DisplayWidth = 10
      Position = 8
    end
    object ppBDEPipeline1ppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'œ—’œ  Œ›Ì›'
      FieldName = 'Perc'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object ppBDEPipeline1ppField12: TppField
      FieldAlias = 'Ã„⁄ ò·'
      FieldName = 'Ptotal'
      FieldLength = 0
      DataType = dtCurrency
      DisplayWidth = 10
      Position = 10
    end
    object ppBDEPipeline1ppField15: TppField
      Alignment = taRightJustify
      FieldAlias = '‘„«—Â ›«ò Ê—'
      FieldName = 'No'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 11
    end
    object ppBDEPipeline1ppField16: TppField
      Alignment = taRightJustify
      FieldAlias = ' «—ÌŒ ›«ò Ê—'
      FieldName = 'Dat'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 12
    end
    object ppBDEPipeline1ppField17: TppField
      FieldAlias = ' Ê÷ÌÕ Ìò'
      FieldName = 'Serial'
      FieldLength = 20
      DisplayWidth = 20
      Position = 13
    end
    object ppBDEPipeline1ppField18: TppField
      FieldAlias = 'ê«—«‰ Ì'
      FieldName = 'Garan'
      FieldLength = 45
      DisplayWidth = 45
      Position = 14
    end
    object ppBDEPipeline1ppField19: TppField
      FieldAlias = '„‘Œ’«  ò«·«'
      FieldName = 'Prop'
      FieldLength = 200
      DisplayWidth = 200
      Position = 15
    end
  end
  object VAct: TTable
    AutoRefresh = True
    DatabaseName = 'ParFro'
    SessionName = 'Default'
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'Des'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'QtRate'
        DataType = ftCurrency
      end
      item
        Name = 'Perc'
        DataType = ftFloat
      end
      item
        Name = 'Kol'
        DataType = ftSmallint
      end
      item
        Name = 'Mo'
        DataType = ftSmallint
      end
      item
        Name = 'Taf'
        DataType = ftSmallint
      end
      item
        Name = 'Vkod'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'PK_VAct'
        Fields = 'Id'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'dbo.VAct'
    Left = 250
    Top = 268
    object VActId: TAutoIncField
      DisplayWidth = 6
      FieldName = 'Id'
      Visible = False
    end
    object VActDes: TStringField
      DisplayLabel = '‘—Õ'
      DisplayWidth = 35
      FieldName = 'Des'
      Size = 50
    end
    object VActQtRate: TCurrencyField
      DisplayLabel = '÷—Ì» „ﬁœ«—'
      DisplayWidth = 16
      FieldName = 'QtRate'
    end
    object VActPerc: TFloatField
      DisplayLabel = 'œ—’œ '
      DisplayWidth = 14
      FieldName = 'Perc'
    end
    object VActKol: TSmallintField
      FieldName = 'Kol'
      Visible = False
    end
    object VActMo: TSmallintField
      FieldName = 'Mo'
      Visible = False
    end
    object VActTaf: TSmallintField
      FieldName = 'Taf'
      Visible = False
    end
    object VActVkod: TIntegerField
      FieldName = 'Vkod'
      Visible = False
    end
  end
  object VActDs: TDataSource
    AutoEdit = False
    DataSet = VAct
    Left = 250
    Top = 312
  end
end
