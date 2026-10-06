unit FrooshDM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ppDB, ppComm, ppRelatv, ppDBPipe, ppDBBDE;

type
  TFroDM = class(TDataModule)
    Invo: TTable;
    InvoGood: TTable;
    InvoDs: TDataSource;
    InvoGoodDs: TDataSource;
    InvoNam: TStringField;
    InvoTel: TStringField;
    InvoAdd: TStringField;
    InvoPkol: TCurrencyField;
    InvoPdis: TCurrencyField;
    InvoPnet: TCurrencyField;
    InvoPpay: TCurrencyField;
    InvoPrem: TCurrencyField;
    Good: TTable;
    banks: TTable;
    banksBkod: TStringField;
    banksBnam: TStringField;
    BankDs: TDataSource;
    Binvo: TTable;
    BinvoDs: TDataSource;
    BinvoGood: TTable;
    BinvoGoodDs: TDataSource;
    BinvoNam: TStringField;
    BinvoTel: TStringField;
    BinvoNo: TIntegerField;
    BinvoPkol: TCurrencyField;
    BinvoPdis: TCurrencyField;
    BinvoPnet: TCurrencyField;
    Acbill: TTable;
    AcBillDs: TDataSource;
    Pcheq: TTable;
    PcheqDs: TDataSource;
    Rcheq: TTable;
    RcheqDs: TDataSource;
    Jari: TTable;
    JariId: TIntegerField;
    JariSerial: TStringField;
    JariDesc: TStringField;
    JariDS: TDataSource;
    InvoPcheq: TCurrencyField;
    JariNam: TTable;
    JariNamDs: TDataSource;
    GoodDs: TDataSource;
    GCardex: TTable;
    GCardexNam: TStringField;
    GCardexColor: TStringField;
    GCardexDs: TDataSource;
    JariNamNam: TStringField;
    JariNamBnam: TStringField;
    JariNamDJari: TStringField;
    AnbDat: TTable;
    AnbDatNam: TStringField;
    AnbDatAdd: TStringField;
    AnbDatAdmin: TStringField;
    AnbDatDs: TDataSource;
    GCardexQuant: TFloatField;
    GCardexIOkod: TSmallintField;
    GCardexFacNo: TIntegerField;
    Cardex: TTable;
    CardexDs: TDataSource;
    CardexId: TAutoIncField;
    CardexNam: TStringField;
    CardexColor: TStringField;
    CardexIn: TFloatField;
    CardexOut: TFloatField;
    CardexRem: TFloatField;
    CardexNo: TIntegerField;
    Gardesh: TTable;
    GardeshBedeh: TCurrencyField;
    GardeshBestan: TCurrencyField;
    GardeshBaghi: TCurrencyField;
    GardeshDesc: TStringField;
    GardeshDs: TDataSource;
    InvoBkod: TBooleanField;
    BinvoDat: TIntegerField;
    CardexDat: TIntegerField;
    GardeshDat: TIntegerField;
    GCardexDat: TIntegerField;
    InvoDat: TIntegerField;
    JariDat: TIntegerField;
    JariBestan: TCurrencyField;
    JariBedeh: TCurrencyField;
    JariRema: TCurrencyField;
    Db1: TDatabase;
    Mali: TTable;
    Users: TTable;
    JariNamBkod: TStringField;
    MaliDs: TDataSource;
    GoodNam: TStringField;
    GoodUnit: TStringField;
    GoodKol: TSmallintField;
    GoodMo: TSmallintField;
    GoodTaf: TSmallintField;
    GoodKod: TIntegerField;
    GoodPkh: TCurrencyField;
    GoodPfro: TCurrencyField;
    GoodGene: TIntegerField;
    GoodRquant: TFloatField;
    GoodBquant: TFloatField;
    BinvoGoodId: TAutoIncField;
    BinvoGoodRadif: TIntegerField;
    BinvoGoodKod: TIntegerField;
    BinvoGoodNam: TStringField;
    BinvoGoodColor: TStringField;
    BinvoGoodQuant: TFloatField;
    BinvoGoodUnit: TStringField;
    BinvoGoodAnbNam: TStringField;
    BinvoGoodPfee: TCurrencyField;
    BinvoGoodPtotal: TCurrencyField;
    BinvoGoodNo: TIntegerField;
    BinvoGoodBkod: TBooleanField;
    BinvoGoodReject: TFloatField;
    BinvoGoodDat: TIntegerField;
    InvoGoodRadif: TIntegerField;
    InvoGoodKod: TIntegerField;
    InvoGoodNam: TStringField;
    InvoGoodColor: TStringField;
    InvoGoodQuant: TFloatField;
    InvoGoodUnit: TStringField;
    InvoGoodAnbNam: TStringField;
    InvoGoodAnbKod: TFloatField;
    InvoGoodPfee: TCurrencyField;
    InvoGoodPtotal: TCurrencyField;
    InvoGoodDelikod: TBooleanField;
    InvoGoodReject: TFloatField;
    InvoGoodNo: TIntegerField;
    InvoGoodDat: TIntegerField;
    InvoGoodId: TAutoIncField;
    CardexAnb: TStringField;
    CardexAnbKod: TIntegerField;
    GCardexKod: TIntegerField;
    GCardexAnbKod: TIntegerField;
    AnbDatKod: TAutoIncField;
    AcBList: TTable;
    AcBListDs: TDataSource;
    GardeshBedRem: TCurrencyField;
    GardeshBesRem: TCurrencyField;
    PInvo: TTable;
    PInvoDs: TDataSource;
    PInvoGood: TTable;
    PInvoGoodDs: TDataSource;
    PInvoGoodId: TAutoIncField;
    PInvoGoodRadif: TIntegerField;
    PInvoGoodKod: TIntegerField;
    PInvoGoodNam: TStringField;
    PInvoGoodColor: TStringField;
    PInvoGoodQuant: TFloatField;
    PInvoGoodAnbNam: TStringField;
    PInvoGoodAnbKod: TIntegerField;
    PInvoGoodPfee: TCurrencyField;
    PInvoGoodPtotal: TCurrencyField;
    PInvoGoodDelikod: TBooleanField;
    PInvoGoodReject: TFloatField;
    PInvoGoodNo: TIntegerField;
    PInvoGoodDat: TIntegerField;
    PInvoNo: TIntegerField;
    PInvoTel: TStringField;
    PInvoDat: TIntegerField;
    PInvoAdd: TStringField;
    PInvoNam: TStringField;
    PInvoPkol: TCurrencyField;
    PInvoPdis: TCurrencyField;
    PInvoPnet: TCurrencyField;
    PInvoPpay: TCurrencyField;
    PInvoPrem: TCurrencyField;
    PInvoPcheq: TCurrencyField;
    PInvoBkod: TBooleanField;
    PInvoDeliKod: TBooleanField;
    UsersDs: TDataSource;
    RejInvo: TTable;
    RejInvoDs: TDataSource;
    RejInvoGood: TTable;
    RejInvoGoodId: TAutoIncField;
    RejInvoGoodRadif: TIntegerField;
    RejInvoGoodKod: TIntegerField;
    RejInvoGoodNam: TStringField;
    RejInvoGoodColor: TStringField;
    RejInvoGoodQuant: TFloatField;
    RejInvoGoodUnit: TStringField;
    RejInvoGoodAnbNam: TStringField;
    RejInvoGoodAnbKod: TIntegerField;
    RejInvoGoodPfee: TCurrencyField;
    RejInvoGoodPtotal: TCurrencyField;
    RejInvoGoodDelikod: TBooleanField;
    RejInvoGoodReject: TFloatField;
    RejInvoGoodNo: TIntegerField;
    RejInvoGoodDat: TIntegerField;
    RejInvoGoodDs: TDataSource;
    RejInvoNo: TIntegerField;
    RejInvoTel: TStringField;
    RejInvoDat: TIntegerField;
    RejInvoAdd: TStringField;
    RejInvoNam: TStringField;
    RejInvoPkol: TCurrencyField;
    RejInvoPdis: TCurrencyField;
    RejInvoPnet: TCurrencyField;
    RejInvoFacNo: TIntegerField;
    RejBinvo: TTable;
    RejBinvoNo: TIntegerField;
    RejBinvoNam: TStringField;
    RejBinvoTel: TStringField;
    RejBinvoDat: TIntegerField;
    RejBinvoPkol: TCurrencyField;
    RejBinvoPdis: TCurrencyField;
    RejBinvoPnet: TCurrencyField;
    RejBinvoFacNo: TIntegerField;
    RejBInvoDs: TDataSource;
    RejBinvoGood: TTable;
    RejBinvoGoodId: TAutoIncField;
    RejBinvoGoodRadif: TIntegerField;
    RejBinvoGoodKod: TIntegerField;
    RejBinvoGoodNam: TStringField;
    RejBinvoGoodColor: TStringField;
    RejBinvoGoodQuant: TFloatField;
    RejBinvoGoodUnit: TStringField;
    RejBinvoGoodAnbNam: TStringField;
    RejBinvoGoodAnbKod: TIntegerField;
    RejBinvoGoodPfee: TCurrencyField;
    RejBinvoGoodPtotal: TCurrencyField;
    RejBinvoGoodNo: TIntegerField;
    RejBinvoGoodBkod: TBooleanField;
    RejBinvoGoodReject: TFloatField;
    RejBinvoGoodDat: TIntegerField;
    RejBinvoGoodDs: TDataSource;
    PInvoGoodUnit: TStringField;
    GardeshNo: TIntegerField;
    GardeshDiag: TCurrencyField;
    MaliBDes: TStringField;
    MaliBed: TCurrencyField;
    MaliSDes: TStringField;
    MaliBes: TCurrencyField;
    BinvoPerm: TBooleanField;
    InvoPerm: TBooleanField;
    RejBinvoPerm: TBooleanField;
    RejInvoPerm: TBooleanField;
    AcbillId: TIntegerField;
    AcbillNo: TIntegerField;
    AcbillDat: TIntegerField;
    AcbillBed: TCurrencyField;
    AcbillBes: TCurrencyField;
    AcbillAccnam: TStringField;
    AcbillDesc: TStringField;
    Bill: TTable;
    BillNo: TIntegerField;
    BillDat: TIntegerField;
    BillBedSum: TCurrencyField;
    BillBesSum: TCurrencyField;
    BillDesc: TStringField;
    BillDs: TDataSource;
    AutoBill: TTable;
    AutoBillDs: TDataSource;
    AcKod: TTable;
    Depot: TTable;
    DepotKod: TIntegerField;
    DepotNam: TStringField;
    DepotColor: TStringField;
    DepotAnbNam: TStringField;
    DepotQuant: TFloatField;
    DepotDs: TDataSource;
    AcKodDs: TDataSource;
    Color: TTable;
    ColorDs: TDataSource;
    ColorColor: TStringField;
    ColorId: TAutoIncField;
    AcBListNo: TIntegerField;
    AcBListDat: TIntegerField;
    AcBListBedeh: TCurrencyField;
    AcBListBestan: TCurrencyField;
    AcBListDesc: TStringField;
    AcBListAccnam: TStringField;
    AcbillRadif: TIntegerField;
    AcbillAckod: TFloatField;
    AcBListAckod: TFloatField;
    JariNamAccKod: TFloatField;
    JariNamCheqKod: TFloatField;
    PcheqBdat: TIntegerField;
    PcheqPaydat: TIntegerField;
    PcheqBank: TStringField;
    PcheqBkod: TStringField;
    PcheqJari: TStringField;
    PcheqPbill: TCurrencyField;
    PcheqPaykod: TBooleanField;
    PcheqDesc: TStringField;
    PcheqPkod: TFloatField;
    AutoBillVar: TStringField;
    AutoBillCaption: TStringField;
    AutoBillBesKod: TFloatField;
    AutoBillBehKod: TFloatField;
    AutoBillStat: TBooleanField;
    AcKodNam: TStringField;
    AcKodAcckod: TFloatField;
    AcKodKkol: TIntegerField;
    AcKodKmo: TIntegerField;
    AcKodKgro: TIntegerField;
    AcKodKtaf: TIntegerField;
    AcKodKdas: TIntegerField;
    AcKodUseKod: TSmallintField;
    AcKodPerm: TBooleanField;
    AcKodMah: TIntegerField;
    GGoz: TTable;
    GGozDs: TDataSource;
    GGozDat: TIntegerField;
    GGozNam: TStringField;
    GGozGood: TStringField;
    GGozQuant: TFloatField;
    GGozFee: TCurrencyField;
    GGozTotal: TCurrencyField;
    InvoGoodPerc: TFloatField;
    PInvoGoodPerc: TFloatField;
    RejInvoGoodPerc: TFloatField;
    AcBListId: TAutoIncField;
    CardexFacNam: TStringField;
    GCardexFacNam: TStringField;
    PInvoPerm: TBooleanField;
    GCardexDes: TStringField;
    CardexDes: TStringField;
    AcKodTel: TStringField;
    AcKodAdd: TStringField;
    AcKodPcred: TCurrencyField;
    DepotGene: TIntegerField;
    BillPerm: TBooleanField;
    DepotId: TAutoIncField;
    GoodFdp: TBooleanField;
    CardexFee: TCurrencyField;
    CardexPrem: TCurrencyField;
    GCardexFee: TCurrencyField;
    BinvoEco: TStringField;
    InvoEco: TStringField;
    PInvoEco: TStringField;
    RejBinvoEco: TStringField;
    RejInvoEco: TStringField;
    CardexDiag: TFloatField;
    CardexPdiag: TCurrencyField;
    Visit: TTable;
    VisitDs: TDataSource;
    VisitCode: TIntegerField;
    VisitNam: TStringField;
    VisitTel: TStringField;
    VisitCity: TStringField;
    VisitAdd: TStringField;
    VisitBdat: TIntegerField;
    VisitPerc: TFloatField;
    InvoVisit: TIntegerField;
    RejInvoVisit: TIntegerField;
    PInvoVisit: TIntegerField;
    BinvoVisit: TIntegerField;
    RejBinvoVisit: TIntegerField;
    BinvoGoodPerc: TFloatField;
    RejBinvoGoodPerc: TFloatField;
    GCardexPerc: TFloatField;
    CardexPerc: TFloatField;
    GoodISBN: TStringField;
    Rsaf: TTable;
    RsafDs: TDataSource;
    RsafBno: TStringField;
    RsafDat: TIntegerField;
    RsafNam: TStringField;
    RsafAdd: TStringField;
    RsafPbill: TCurrencyField;
    RsafStatue: TStringField;
    RsafFNo: TIntegerField;
    RsafSprice: TCurrencyField;
    RsafQt: TSmallintField;
    RsafPprice: TCurrencyField;
    RsafDaf: TIntegerField;
    AcbillFacno: TStringField;
    AcbillBtip: TIntegerField;
    BinvoBno: TIntegerField;
    InvoBno: TIntegerField;
    RejInvoBno: TIntegerField;
    RejBinvoBno: TIntegerField;
    RMon: TTable;
    RMonDs: TDataSource;
    RMonNo: TIntegerField;
    RMonDat: TIntegerField;
    RMonPrice: TCurrencyField;
    RMonAccNam: TStringField;
    RMonDes: TStringField;
    RMonBnO: TIntegerField;
    PMon: TTable;
    PmonDs: TDataSource;
    PMonNo: TIntegerField;
    PMonDat: TIntegerField;
    PMonPrice: TCurrencyField;
    PMonAccNam: TStringField;
    PMonDes: TStringField;
    PMonBno: TIntegerField;
    PcheqPBNo: TIntegerField;
    NFish: TTable;
    NFishDs: TDataSource;
    NFishNo: TIntegerField;
    NFishDat: TIntegerField;
    NFishPrice: TCurrencyField;
    NFishJari: TStringField;
    NFishDes: TStringField;
    NFishAccNam: TStringField;
    NFishBno: TIntegerField;
    BHav: TTable;
    BHavDs: TDataSource;
    BHavNo: TIntegerField;
    BHavDat: TIntegerField;
    BHavPrice: TCurrencyField;
    BHavJari: TStringField;
    BHavDes: TStringField;
    BHavFacno: TIntegerField;
    BHavAccNam: TStringField;
    BHavBNo: TIntegerField;
    PcheqPaNo: TIntegerField;
    InvoNo: TIntegerField;
    Aghs: TTable;
    AghsDs: TDataSource;
    AghsNo: TAutoIncField;
    AghsDat: TIntegerField;
    AghsNam: TStringField;
    AghsGprice: TCurrencyField;
    AghsRNo: TIntegerField;
    AghsPayed: TBooleanField;
    AghsRDat: TIntegerField;
    GCardexAnbNam: TStringField;
    BinvoGoodBfee: TCurrencyField;
    BinvoGoodPay: TCurrencyField;
    BinvoPrule: TStringField;
    BinvoPpay: TCurrencyField;
    BinvoPrem: TCurrencyField;
    BinvoPlc: TCurrencyField;
    BinvoPGom: TCurrencyField;
    BinvoPtar: TCurrencyField;
    BinvoPdemo: TCurrencyField;
    BinvoPCar: TCurrencyField;
    BinvoPOth: TCurrencyField;
    BinvoPcost: TCurrencyField;
    InvoPRule: TStringField;
    PMonInv: TIntegerField;
    RMonInv: TIntegerField;
    NFishInv: TIntegerField;
    BHavInv: TIntegerField;
    Tol: TTable;
    TolDs: TDataSource;
    TolNo: TIntegerField;
    TolDat: TIntegerField;
    TolEco: TStringField;
    TolInp: TCurrencyField;
    TolOutp: TCurrencyField;
    TolDes: TStringField;
    TolPerm: TBooleanField;
    AcKodKgp: TSmallintField;
    AcKodState: TStringField;
    AcKodCity: TStringField;
    AcKodRegon: TStringField;
    RejInvoGoodInv: TIntegerField;
    GoodProp1: TStringField;
    GoodProp2: TStringField;
    GoodProp3: TStringField;
    GoodProp4: TStringField;
    BinvoGoodSerial: TStringField;
    BinvoGoodGaran: TStringField;
    InvoGoodSerial: TStringField;
    InvoGoodGaran: TStringField;
    PInvoGoodSerial: TStringField;
    PInvoGoodGaran: TStringField;
    RejBinvoGoodSerial: TStringField;
    RejBinvoGoodGaran: TStringField;
    RejInvoGoodSerial: TStringField;
    RejInvoGoodGaran: TStringField;
    GCH: TTable;
    GCHDs: TDataSource;
    GCHDes: TStringField;
    GCHKol: TSmallintField;
    GCHMo: TSmallintField;
    GCHTaf: TSmallintField;
    BinvoGoodProp: TStringField;
    InvoGoodProp: TStringField;
    PInvoGoodProp: TStringField;
    RejBinvoGoodProp: TStringField;
    RejInvoGoodProp: TStringField;
    BillAtf: TIntegerField;
    RRes: TTable;
    RResNo: TIntegerField;
    RResDat: TIntegerField;
    RResPsum: TCurrencyField;
    RResDes: TStringField;
    RResPerm: TBooleanField;
    RResBilled: TBooleanField;
    RResDs: TDataSource;
    RResBno: TIntegerField;
    RPay: TTable;
    RPayDs: TDataSource;
    RPayNo: TIntegerField;
    RPayDat: TIntegerField;
    RPayPsum: TCurrencyField;
    RPayDes: TStringField;
    RPayPerm: TBooleanField;
    RPayBilled: TBooleanField;
    RPayBno: TIntegerField;
    RPI: TTable;
    RPIDs: TDataSource;
    RPIRadif: TIntegerField;
    RPIBno: TStringField;
    RPIBank: TStringField;
    RPIPbill: TCurrencyField;
    RPINo: TIntegerField;
    RPIBdat: TIntegerField;
    Rrej: TTable;
    RrejDs: TDataSource;
    RrejNo: TIntegerField;
    RrejDat: TIntegerField;
    RrejAccKod: TFloatField;
    RrejAcnam: TStringField;
    RrejPsum: TCurrencyField;
    RrejDes: TStringField;
    RrejPerm: TBooleanField;
    RrejBilled: TBooleanField;
    RrejBno: TIntegerField;
    RRI: TTable;
    RRIDs: TDataSource;
    RRIRadif: TIntegerField;
    RRIBdat: TIntegerField;
    RRIBno: TStringField;
    RRIBank: TStringField;
    RRIPbill: TCurrencyField;
    RRINo: TIntegerField;
    Rvos: TTable;
    RvosDs: TDataSource;
    RvosNo: TIntegerField;
    RvosDat: TIntegerField;
    RvosAccKod: TFloatField;
    RvosAcnam: TStringField;
    RvosPsum: TCurrencyField;
    RvosDes: TStringField;
    RvosPerm: TBooleanField;
    RvosBilled: TBooleanField;
    RvosBno: TIntegerField;
    RVI: TTable;
    RVIDs: TDataSource;
    RVIRadif: TIntegerField;
    RVIBdat: TIntegerField;
    RVIBno: TStringField;
    RVIBank: TStringField;
    RVIPbill: TCurrencyField;
    RVINo: TIntegerField;
    Rkel: TTable;
    RkelDs: TDataSource;
    RkelNo: TIntegerField;
    RkelDat: TIntegerField;
    RkelAccKod: TFloatField;
    RkelAcnam: TStringField;
    RkelPsum: TCurrencyField;
    RkelDes: TStringField;
    RkelPerm: TBooleanField;
    RkelBilled: TBooleanField;
    RkelBno: TIntegerField;
    RKI: TTable;
    RKIDs: TDataSource;
    RKIRadif: TIntegerField;
    RKIBdat: TIntegerField;
    RKIBno: TStringField;
    RKIBank: TStringField;
    RKIPbill: TCurrencyField;
    RKINo: TIntegerField;
    RKIReject: TBooleanField;
    Rukel: TTable;
    RukelDs: TDataSource;
    RukelNo: TIntegerField;
    RukelDat: TIntegerField;
    RukelAccKod: TFloatField;
    RukelAcnam: TStringField;
    RukelPsum: TCurrencyField;
    RukelDes: TStringField;
    RukelPerm: TBooleanField;
    RukelBilled: TBooleanField;
    RukelBno: TIntegerField;
    RUKI: TTable;
    RUKIDs: TDataSource;
    RUKIRadif: TIntegerField;
    RUKIBdat: TIntegerField;
    RUKIBno: TStringField;
    RUKIBank: TStringField;
    RUKIPbill: TCurrencyField;
    RUKINo: TIntegerField;
    RUKIReject: TBooleanField;
    RRIAckod: TFloatField;
    NCar: TTable;
    NCarDs: TDataSource;
    NCarNo: TIntegerField;
    NCarDat: TIntegerField;
    NCarPrice: TCurrencyField;
    NCarJari: TStringField;
    NCarDes: TStringField;
    NCarBno: TIntegerField;
    Move: TTable;
    MoveDs: TDataSource;
    MoveNo: TIntegerField;
    MoveDat: TIntegerField;
    MoveDes: TStringField;
    MovePnet: TCurrencyField;
    MoveBno: TIntegerField;
    MVG: TTable;
    MVGDs: TDataSource;
    MVGId: TAutoIncField;
    MVGRadif: TIntegerField;
    MVGKod: TIntegerField;
    MVGNam: TStringField;
    MVGColor: TStringField;
    MVGOAnbNam: TStringField;
    MVGOAnbKod: TIntegerField;
    MVGIAnbNam: TStringField;
    MVGIAnbKod: TIntegerField;
    MVGQuant: TFloatField;
    MVGUnit: TStringField;
    MVGPfee: TCurrencyField;
    MVGPtotal: TCurrencyField;
    MVGNo: TIntegerField;
    MVGDat: TIntegerField;
    MovePerm: TBooleanField;
    MVGBkod: TBooleanField;
    GoodPrule: TStringField;
    MVGProp: TStringField;
    RResInv: TIntegerField;
    PcheqNo: TIntegerField;
    Costc: TTable;
    CostcNam: TStringField;
    CostcKod: TAutoIncField;
    CostcDesc: TStringField;
    CostcDs: TDataSource;
    Cperm: TTable;
    CpermId: TAutoIncField;
    CpermRadif: TIntegerField;
    CpermCkod: TIntegerField;
    CpermAckod: TFloatField;
    CpermAcnam: TStringField;
    CpermDs: TDataSource;
    Cent: TTable;
    CentKod: TIntegerField;
    CentRadif: TIntegerField;
    CentNam: TStringField;
    CentGrop: TStringField;
    CentDs: TDataSource;
    AcbillCost: TStringField;
    AcbillCkod: TIntegerField;
    BHavCost: TStringField;
    BHavCkod: TIntegerField;
    BinvoCkod: TIntegerField;
    InvoCkod: TIntegerField;
    NCarCost: TStringField;
    NCarCkod: TIntegerField;
    NFishCost: TStringField;
    NFishCkod: TIntegerField;
    PcheqCkod: TIntegerField;
    PcheqCost: TStringField;
    PInvoCkod: TIntegerField;
    PMonCost: TStringField;
    PMonCkod: TIntegerField;
    RejBinvoCkod: TIntegerField;
    RejInvoCkod: TIntegerField;
    RkelCost: TStringField;
    RkelCkod: TIntegerField;
    RMonCost: TStringField;
    RMonCkod: TIntegerField;
    RPayCkod: TIntegerField;
    RPayCost: TStringField;
    RrejCost: TStringField;
    RrejCkod: TIntegerField;
    RResCkod: TIntegerField;
    RResCost: TStringField;
    RukelCost: TStringField;
    RukelCkod: TIntegerField;
    RvosCost: TStringField;
    RvosCkod: TIntegerField;
    BinvoCost: TStringField;
    InvoCost: TStringField;
    PcheqAcckod: TFloatField;
    PcheqAcnam: TStringField;
    PInvoCost: TStringField;
    RejBinvoCost: TStringField;
    RejInvoCost: TStringField;
    RPayAcckod: TFloatField;
    RPayAcnam: TStringField;
    RResAcckod: TFloatField;
    RResAcnam: TStringField;
    CentTel: TStringField;
    CentAdr: TStringField;
    CentPcred: TCurrencyField;
    CentTCred: TIntegerField;
    CentState: TStringField;
    CentCity: TStringField;
    CentRegon: TStringField;
    InvoGoodOPfee: TCurrencyField;
    InvoGoodOPSum: TCurrencyField;
    InvoRefNo: TIntegerField;
    RejBinvoGoodOPfee: TCurrencyField;
    RejBinvoGoodOPsum: TCurrencyField;
    RejBinvoRefNo: TIntegerField;
    RejInvoRefNo: TIntegerField;
    BinvoRefNo: TIntegerField;
    BillTip: TSmallintField;
    AcbillTip: TSmallintField;
    Btip: TTable;
    BtipDs: TDataSource;
    BtipId: TSmallintField;
    BtipDes: TStringField;
    Hav: TTable;
    Res: TTable;
    IRej: TTable;
    ORej: TTable;
    HavG: TTable;
    ResG: TTable;
    IRejG: TTable;
    ORejG: TTable;
    HavDs: TDataSource;
    ResDs: TDataSource;
    IRejDs: TDataSource;
    ORejDs: TDataSource;
    HavGDs: TDataSource;
    ResGDs: TDataSource;
    IRejGDs: TDataSource;
    ORejGDs: TDataSource;
    HavNo: TIntegerField;
    HavDat: TIntegerField;
    HavNam: TStringField;
    HavPkol: TCurrencyField;
    HavPdis: TCurrencyField;
    HavPnet: TCurrencyField;
    HavBkod: TBooleanField;
    HavBno: TIntegerField;
    HavCost: TStringField;
    HavCkod: TIntegerField;
    HavRefNo: TIntegerField;
    HavGId: TAutoIncField;
    HavGRadif: TIntegerField;
    HavGKod: TIntegerField;
    HavGNam: TStringField;
    HavGColor: TStringField;
    HavGAnbNam: TStringField;
    HavGAnbKod: TIntegerField;
    HavGQuant: TFloatField;
    HavGUnit: TStringField;
    HavGPfee: TCurrencyField;
    HavGPtotal: TCurrencyField;
    HavGDelikod: TBooleanField;
    HavGReject: TFloatField;
    HavGNo: TIntegerField;
    HavGDat: TIntegerField;
    HavGSerial: TStringField;
    IRejNo: TIntegerField;
    IRejDat: TIntegerField;
    IRejNam: TStringField;
    IRejPkol: TCurrencyField;
    IRejPdis: TCurrencyField;
    IRejPnet: TCurrencyField;
    IRejBkod: TBooleanField;
    IRejBno: TIntegerField;
    IRejCost: TStringField;
    IRejCkod: TIntegerField;
    IRejRefNo: TIntegerField;
    IRejGId: TAutoIncField;
    IRejGRadif: TIntegerField;
    IRejGKod: TIntegerField;
    IRejGNam: TStringField;
    IRejGColor: TStringField;
    IRejGAnbNam: TStringField;
    IRejGAnbKod: TIntegerField;
    IRejGQuant: TFloatField;
    IRejGUnit: TStringField;
    IRejGPfee: TCurrencyField;
    IRejGPtotal: TCurrencyField;
    IRejGDelikod: TBooleanField;
    IRejGReject: TFloatField;
    IRejGNo: TIntegerField;
    IRejGDat: TIntegerField;
    IRejGSerial: TStringField;
    ORejNo: TIntegerField;
    ORejDat: TIntegerField;
    ORejNam: TStringField;
    ORejPkol: TCurrencyField;
    ORejPdis: TCurrencyField;
    ORejPnet: TCurrencyField;
    ORejBkod: TBooleanField;
    ORejBno: TIntegerField;
    ORejCost: TStringField;
    ORejCkod: TIntegerField;
    ORejRefNo: TIntegerField;
    ORejGId: TAutoIncField;
    ORejGRadif: TIntegerField;
    ORejGKod: TIntegerField;
    ORejGNam: TStringField;
    ORejGColor: TStringField;
    ORejGAnbNam: TStringField;
    ORejGAnbKod: TIntegerField;
    ORejGQuant: TFloatField;
    ORejGUnit: TStringField;
    ORejGPfee: TCurrencyField;
    ORejGPtotal: TCurrencyField;
    ORejGDelikod: TBooleanField;
    ORejGReject: TFloatField;
    ORejGNo: TIntegerField;
    ORejGDat: TIntegerField;
    ORejGSerial: TStringField;
    ResNo: TIntegerField;
    ResDat: TIntegerField;
    ResNam: TStringField;
    ResPkol: TCurrencyField;
    ResPdis: TCurrencyField;
    ResPnet: TCurrencyField;
    ResBkod: TBooleanField;
    ResBno: TIntegerField;
    ResCost: TStringField;
    ResCkod: TIntegerField;
    ResRefNo: TIntegerField;
    ResGId: TAutoIncField;
    ResGRadif: TIntegerField;
    ResGKod: TIntegerField;
    ResGNam: TStringField;
    ResGColor: TStringField;
    ResGAnbNam: TStringField;
    ResGAnbKod: TIntegerField;
    ResGQuant: TFloatField;
    ResGUnit: TStringField;
    ResGPfee: TCurrencyField;
    ResGPtotal: TCurrencyField;
    ResGDelikod: TBooleanField;
    ResGReject: TFloatField;
    ResGNo: TIntegerField;
    ResGDat: TIntegerField;
    ResGSerial: TStringField;
    FTip: TTable;
    FTipId: TAutoIncField;
    FTipDes: TStringField;
    FTipDs: TDataSource;
    Ctip: TTable;
    CtipDs: TDataSource;
    CtipId: TAutoIncField;
    CtipName: TStringField;
    Crate: TTable;
    CrateDs: TDataSource;
    CrateId: TAutoIncField;
    CrateCName: TStringField;
    CrateFee: TCurrencyField;
    CrateDat: TIntegerField;
    AcbillCbed: TCurrencyField;
    AcbillCbes: TCurrencyField;
    AcbillRate: TFloatField;
    AcbillCtip: TStringField;
    BHavCtip: TStringField;
    NCarCtip: TStringField;
    NFishCtip: TStringField;
    PMonCtip: TStringField;
    RMonCtip: TStringField;
    CtipSign: TStringField;
    RMonCPrice: TCurrencyField;
    RMonRate: TCurrencyField;
    BHavCprice: TCurrencyField;
    BHavRate: TCurrencyField;
    NCarCprice: TCurrencyField;
    NCarRate: TCurrencyField;
    NFishCprice: TCurrencyField;
    NFishRate: TCurrencyField;
    PMonCprice: TCurrencyField;
    PMonRate: TCurrencyField;
    Acpay: TTable;
    AcpayDs: TDataSource;
    AcpayNo: TIntegerField;
    AcpayDat: TIntegerField;
    AcpayPrice: TCurrencyField;
    AcpayBednam: TStringField;
    AcpayBesnam: TStringField;
    AcpayDes: TStringField;
    AcpayBnO: TIntegerField;
    AcpayInv: TIntegerField;
    AcpayCost: TStringField;
    AcpayCkod: TIntegerField;
    AcpayCtip: TStringField;
    AcpayCprice: TCurrencyField;
    AcpayRate: TCurrencyField;
    Cashier: TTable;
    CashierDS: TDataSource;
    CashierId: TAutoIncField;
    CashierName: TStringField;
    CashierOwner: TStringField;
    CashierCtip: TStringField;
    CashierAckod: TFloatField;
    RMonCakod: TFloatField;
    PMonCakod: TFloatField;
    PcheqCtip: TStringField;
    PcheqCprice: TCurrencyField;
    PcheqRate: TCurrencyField;
    CentEName: TStringField;
    CentShMark: TStringField;
    RResCtip: TStringField;
    RResCprice: TCurrencyField;
    RResRate: TCurrencyField;
    BHavCwage: TCurrencyField;
    NFishCwage: TCurrencyField;
    PMonCwage: TCurrencyField;
    RMonCwage: TCurrencyField;
    AcpayCwage: TCurrencyField;
    RResCwage: TCurrencyField;
    PcheqId: TIntegerField;
    UAC: TTable;
    UACDs: TDataSource;
    UACId: TAutoIncField;
    UACUserid: TIntegerField;
    UACUsern: TStringField;
    UACAcname: TStringField;
    UACAcckod: TFloatField;
    AcKodEname: TStringField;
    RM: TTable;
    RMDs: TDataSource;
    RMOut: TTable;
    RMOutDs: TDataSource;
    RMin: TTable;
    RMinDs: TDataSource;
    RMId: TAutoIncField;
    RMNo: TIntegerField;
    RMDat: TIntegerField;
    RMAcnam: TStringField;
    RMAcckod: TFloatField;
    RMDes: TStringField;
    RMBno: TIntegerField;
    RMlperm: TBooleanField;
    RMOutId: TAutoIncField;
    RMOutItNo: TIntegerField;
    RMOutAcnam: TStringField;
    RMOutAcckod: TFloatField;
    RMOutCkod: TIntegerField;
    RMOutAmount: TCurrencyField;
    RMOutRate: TCurrencyField;
    RMOutPrice: TCurrencyField;
    RMOutCwage: TCurrencyField;
    RMOutRemfee: TStringField;
    RMOutCode: TStringField;
    RMOutPerson: TStringField;
    RMOutTel: TStringField;
    RMOutBank: TStringField;
    RMOutAccountDes: TStringField;
    RMOutDes: TStringField;
    RMinId: TAutoIncField;
    RMinItNo: TIntegerField;
    RMinAcnam: TStringField;
    RMinAcckod: TFloatField;
    RMinCkod: TIntegerField;
    RMinAmount: TCurrencyField;
    RMinRate: TCurrencyField;
    RMinPrice: TCurrencyField;
    RMinCwage: TCurrencyField;
    RMinRemfee: TStringField;
    RMinCode: TStringField;
    RMinPerson: TStringField;
    RMinTel: TStringField;
    RMinBank: TStringField;
    RMinAccountDes: TStringField;
    RMinDes: TStringField;
    RMPsum: TCurrencyField;
    RMOutDat: TIntegerField;
    RMOutNo: TIntegerField;
    RMinDat: TIntegerField;
    RMinNo: TIntegerField;
    RMinCtip: TSmallintField;
    RMOutCtip: TSmallintField;
    Exch: TTable;
    ExchDs: TDataSource;
    ExchId: TAutoIncField;
    ExchNo: TIntegerField;
    ExchDat: TIntegerField;
    ExchAcnam: TStringField;
    ExchAcckod: TFloatField;
    ExchCkod: TIntegerField;
    ExchAmount: TCurrencyField;
    ExchCtip: TStringField;
    ExchRate: TCurrencyField;
    ExchIAmount: TCurrencyField;
    ExchICtip: TStringField;
    ExchExchAc: TFloatField;
    ExchBno: TIntegerField;
    ExchDes: TStringField;
    CpermGrop: TStringField;
    Exp: TTable;
    ExpDs: TDataSource;
    ExpD: TTable;
    ExpDds: TDataSource;
    ExpId: TAutoIncField;
    ExpNo: TIntegerField;
    ExpDat: TIntegerField;
    ExpAccnam: TStringField;
    ExpAcckod: TFloatField;
    ExpCost: TStringField;
    ExpCkod: TIntegerField;
    ExpPsum: TCurrencyField;
    ExpDes: TStringField;
    ExpBno: TIntegerField;
    ExpDId: TAutoIncField;
    ExpDItNo: TIntegerField;
    ExpDAcnam: TStringField;
    ExpDAcckod: TFloatField;
    ExpDCkod: TIntegerField;
    ExpDAmount: TCurrencyField;
    ExpDCtip: TSmallintField;
    ExpDRate: TCurrencyField;
    ExpDPrice: TCurrencyField;
    ExpDDes: TStringField;
    ExpDDat: TIntegerField;
    ExpDNo: TIntegerField;
    ExpLperm: TBooleanField;
    PcheqBno: TStringField;
    BHavLPerm: TBooleanField;
    AcpayLperm: TBooleanField;
    NFishLperm: TBooleanField;
    RMonLperm: TBooleanField;
    PMonLperm: TBooleanField;
    BinvoGoodAnbkod: TFloatField;
    InvoGoodQout: TFloatField;
    HavDes: TStringField;
    IRejDes: TStringField;
    ORejDes: TStringField;
    ResDes: TStringField;
    GardeshCtip: TStringField;
    InvoPtax: TCurrencyField;
    UAct: TTable;
    UActId: TAutoIncField;
    UActUname: TStringField;
    UActDat: TDateTimeField;
    UActDoc: TStringField;
    UActDdat: TIntegerField;
    UActDno: TIntegerField;
    UActDvalue: TFloatField;
    UActAct: TStringField;
    UActHtime: TDateTimeField;
    UActFDat: TIntegerField;
    UActDs: TDataSource;
    AcpayCkod2: TIntegerField;
    BillD: TTable;
    BillDds: TDataSource;
    BillDId: TAutoIncField;
    BillDNo: TIntegerField;
    BillDDat: TIntegerField;
    BillDBedsum: TCurrencyField;
    BillDBesSum: TCurrencyField;
    BillDDes: TStringField;
    BillDLperm: TBooleanField;
    BillDAtf: TIntegerField;
    BillDTip: TSmallintField;
    GForm: TTable;
    GFormDs: TDataSource;
    GFormId: TAutoIncField;
    GFormKod: TIntegerField;
    GFormNam: TStringField;
    GFormQuant: TFloatField;
    GFormMkod: TIntegerField;
    FTipBeskod: TFloatField;
    FTipBedkod: TFloatField;
    GoodFlock: TBooleanField;
    AcKodBarzi: TBooleanField;
    DOutG: TTable;
    DOutGDs: TDataSource;
    DOutGId: TAutoIncField;
    DOutGRadif: TIntegerField;
    DOutGKod: TIntegerField;
    DOutGNam: TStringField;
    DOutGColor: TStringField;
    DOutGAnbnam: TStringField;
    DOutGAnbkod: TIntegerField;
    DOutGQuant: TFloatField;
    DOutGUnit: TStringField;
    DOutGPfee: TCurrencyField;
    DOutGPtotal: TCurrencyField;
    DOutGDelikod: TBooleanField;
    DOutGReject: TFloatField;
    DOutGNo: TIntegerField;
    DOutGDat: TIntegerField;
    DOutGSerial: TStringField;
    Dout: TTable;
    DoutDs: TDataSource;
    DoutId: TAutoIncField;
    DoutNo: TIntegerField;
    DoutDat: TIntegerField;
    DoutNam: TStringField;
    DoutPkol: TCurrencyField;
    DoutPdis: TCurrencyField;
    DoutPnet: TCurrencyField;
    DoutBkod: TBooleanField;
    DoutBno: TIntegerField;
    DoutCost: TStringField;
    DoutCkod: TIntegerField;
    DoutRefno: TIntegerField;
    DoutDes: TStringField;
    DepotAnbkod: TFloatField;
    ppHav: TppBDEPipeline;
    ppHavg: TppBDEPipeline;
    ppHavgppMasterFieldLink1: TppMasterFieldLink;
    ppInvo: TppBDEPipeline;
    ppInvoGood: TppBDEPipeline;
    VAct: TTable;
    VActDs: TDataSource;
    VActId: TAutoIncField;
    VActDes: TStringField;
    VActQtRate: TCurrencyField;
    VActPerc: TFloatField;
    VActKol: TSmallintField;
    VActMo: TSmallintField;
    VActTaf: TSmallintField;
    VActVkod: TIntegerField;
    AcbillDchek: TBooleanField;
    GardeshId: TAutoIncField;
    GardeshBid: TIntegerField;
    GardeshDchek: TBooleanField;
    AcKodId: TAutoIncField;
    AcpayId: TAutoIncField;
    AghsId: TAutoIncField;
    banksId: TAutoIncField;
    BHavId: TAutoIncField;
    Billid: TAutoIncField;
    BinvoId: TAutoIncField;
    CentId: TAutoIncField;
    CostcId: TAutoIncField;
    HavId: TAutoIncField;
    IRejId: TAutoIncField;
    ORejId: TAutoIncField;
    ResId: TAutoIncField;
    GCardexId: TAutoIncField;
    GCHId: TAutoIncField;
    GGozId: TAutoIncField;
    GoodId: TAutoIncField;
    InvoId: TAutoIncField;
    JariIdd: TAutoIncField;
    JariNamId: TAutoIncField;
    MaliId: TAutoIncField;
    MoveId: TAutoIncField;
    NCarId: TAutoIncField;
    NFishId: TAutoIncField;
    PInvoId: TAutoIncField;
    PMonId: TAutoIncField;
    RejBinvoId: TAutoIncField;
    RejInvoId: TAutoIncField;
    RkelId: TAutoIncField;
    RKIId: TAutoIncField;
    RKIJari: TStringField;
    RMonId: TAutoIncField;
    RPayId: TAutoIncField;
    RPIId: TAutoIncField;
    RrejId: TAutoIncField;
    RRIId: TAutoIncField;
    RResId: TAutoIncField;
    RsafId: TAutoIncField;
    RukelId: TAutoIncField;
    RUKIId: TAutoIncField;
    RvosId: TAutoIncField;
    RVIId: TAutoIncField;
    TolId: TAutoIncField;
    VisitId: TAutoIncField;
    RcheqId: TAutoIncField;
    RcheqBno: TStringField;
    RcheqBdat: TIntegerField;
    RcheqRecDat: TIntegerField;
    RcheqBank: TStringField;
    RcheqBkod: TStringField;
    RcheqPbill: TCurrencyField;
    RcheqNo: TIntegerField;
    RcheqDesc: TStringField;
    RcheqDpay: TStringField;
    RcheqReckod: TBooleanField;
    RcheqAcckod: TFloatField;
    RcheqAcnam: TStringField;
    RcheqPacckod: TFloatField;
    RcheqPacnam: TStringField;
    RcheqKeler: TBooleanField;
    RcheqJari: TStringField;
    RcheqReject: TBooleanField;
    RcheqShar: TBooleanField;
    RcheqRBno: TIntegerField;
    RcheqPBno: TIntegerField;
    RcheqPdat: TIntegerField;
    RcheqVBNo: TIntegerField;
    RcheqCost: TStringField;
    RcheqCkod: TIntegerField;
    RcheqPCost: TStringField;
    RcheqPCkod: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
    Procedure Far_PostErr(DataSet:TDataSet;E:EDataBaseError;
      Var Action:TDataAction);
    Procedure BeforPosting(DataSet:TDataSet);
    procedure BinvoGoodBeforePost(DataSet: TDataSet);
    procedure RResAfterEdit(DataSet: TDataSet);
    procedure RkelAfterEdit(DataSet: TDataSet);
    procedure RPayAfterEdit(DataSet: TDataSet);
    procedure RrejAfterEdit(DataSet: TDataSet);
    procedure RvosAfterEdit(DataSet: TDataSet);
    procedure RukelAfterEdit(DataSet: TDataSet);
    procedure CentAfterEdit(DataSet: TDataSet);
    procedure RMonBeforePost(DataSet: TDataSet);
    procedure RMOutBeforePost(DataSet: TDataSet);
    procedure RMAfterEdit(DataSet: TDataSet);
    procedure AcbillBeforePost(DataSet: TDataSet);
    procedure ExpAfterEdit(DataSet: TDataSet);
    procedure HavGBeforePost(DataSet: TDataSet);
    procedure InvoGoodBeforePost(DataSet: TDataSet);

    procedure InvoBeforeEdit(DataSet: TDataSet);
    procedure InvoAfterPost(DataSet: TDataSet);
    procedure InvoBeforeDelete(DataSet: TDataSet);
    procedure RMonBeforeEdit(DataSet: TDataSet);
    procedure RMonAfterPost(DataSet: TDataSet);
    procedure RMonBeforeDelete(DataSet: TDataSet);
    procedure PMonBeforeEdit(DataSet: TDataSet);
    procedure PMonAfterPost(DataSet: TDataSet);
    procedure PMonBeforeDelete(DataSet: TDataSet);
    procedure NFishBeforeEdit(DataSet: TDataSet);
    procedure NFishAfterPost(DataSet: TDataSet);
    procedure NFishBeforeDelete(DataSet: TDataSet);
    procedure BHavBeforeEdit(DataSet: TDataSet);
    procedure BHavAfterPost(DataSet: TDataSet);
    procedure BHavBeforeDelete(DataSet: TDataSet);
    procedure RResBeforeEdit(DataSet: TDataSet);
    procedure RResAfterPost(DataSet: TDataSet);
    procedure RResBeforeDelete(DataSet: TDataSet);
    procedure AcpayBeforeEdit(DataSet: TDataSet);
    procedure AcpayAfterPost(DataSet: TDataSet);
    procedure AcpayBeforeDelete(DataSet: TDataSet);
    procedure BinvoBeforeEdit(DataSet: TDataSet);
    procedure BinvoAfterPost(DataSet: TDataSet);
    procedure BinvoBeforeDelete(DataSet: TDataSet);
    procedure ExpBeforeEdit(DataSet: TDataSet);
    procedure ExpAfterPost(DataSet: TDataSet);
    procedure ExpBeforeDelete(DataSet: TDataSet);
    procedure PcheqBeforeEdit(DataSet: TDataSet);
    procedure PcheqAfterPost(DataSet: TDataSet);
    procedure PcheqBeforeDelete(DataSet: TDataSet);
    procedure RcheqBeforeEdit(DataSet: TDataSet);
    procedure RcheqAfterPost(DataSet: TDataSet);
    procedure RcheqBeforeDelete(DataSet: TDataSet);
    procedure RMBeforeEdit(DataSet: TDataSet);
    procedure RMAfterPost(DataSet: TDataSet);
    procedure RMBeforeDelete(DataSet: TDataSet);
    procedure RPayBeforeEdit(DataSet: TDataSet);
    procedure RPayAfterPost(DataSet: TDataSet);
    procedure RPayBeforeDelete(DataSet: TDataSet);
    procedure IRejGBeforePost(DataSet: TDataSet);
    procedure VisitAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
    Procedure MakeLog(No,Dat:Integer;Value:Currency;Doc,Act:String);
  public
    { Public declarations }
  end;

var
  FroDM: TFroDM;

implementation

uses Routins, ProVar, MainForm, CRoutins;

{$R *.DFM}

Procedure TFroDM.MakeLog(No,Dat:Integer;Value:Currency;Doc,Act:String);
begin
     Frodm.UAct.Append;
     Frodm.UActUname.Value:=CUser.Name;
     Frodm.UActDat.Value:=Date;;
     Frodm.UActDoc.Value:=Doc;
     Frodm.UActDdat.Value:=Dat;
     Frodm.UActDno.Value:=No;
     Frodm.UActDvalue.Value:=Value;
     Frodm.UActAct.Value:=Act;
     Frodm.UActHtime.AsDateTime:=Time;
     Frodm.UActFDat.Value:=Fardate;
     Frodm.UAct.Post;
end;

Procedure TFroDM.Far_PostErr(DataSet:TDataSet;E:EDataBaseError;
      Var Action:TDataAction);
var
  I:Integer;
  iDBIError: Integer;
  intField:TIntegerField;
begin
     For I:=0 To DataSet.FieldCount -1 Do
     If DataSet.Fields[I] is TIntegerField Then
     Begin
       IntField:=DataSet.Fields[I] as TIntegerField;
       IF Not IntFieldCheck(IntField) Then
       Begin
         ShowMessage('ÏÇÏå ÎÇÑÌ ÇÒ ÍÏ ãÌÇÒ');
         DataSet.Cancel;
       End;
     End;
     If (E is EDBEngineError) then
     begin
     iDBIError := (E as EDBEngineError).Errors[0].Errorcode;
     case iDBIError of
     eRequiredFieldMissing:
     begin
       MessageDlg('ÏÇÏå åÇ ßÇãá äíÓÊäÏ'+DataSet.Name, mtInformation, [mbOK], 0);
       Beep;
       DataSet.Cancel;
     end;
     eKeyViol:
     begin
       Beep;
       MessageDlg('ÏÇÏå ÊßÑÇÑí æÇÑÏ ÔÏå ÇÓÊ.ÇØáÇÚÇÊ ËÈÊ äÔÏ'+DataSet.Name,
                  mtInformation,[mbOK], 0);
       DataSet.Cancel;
     end;
     eDetailsExist:
        //The primary key is OrderNo
     begin
       Beep;
       MessageDlg('ÞÇÈá ÍÐÝ äíÓÊ.ÒíÑãÌãæÚå ÏÇÑÏ'+DataSet.Name, mtInformation, [mbOK], 0);
       DataSet.Cancel;
     end;
     9731:
     Begin
       Beep;
       MessageDlg('ÏÇÏå ÎÇÑÌ ÇÒ ÍÏ ãÌÇÒ'+DataSet.Name,mtInformation,[mbOk],0);
       DataSet.Cancel;
     End;
     Else
       ShowMessage(IntToStr(iDBIError));
    end;
    end;
end;

Procedure TFroDM.BeforPosting(DataSet:TDataSet);
begin
     With DataSet Do
     Begin
      Fields[11].AsCurrency:=(1-Fields[10].AsFloat/100)*Fields[9].AsCurrency*
      Fields[7].AsFloat;
      If Fields[5].IsNull Then Fields[5].Value:=AnbNam('');
     End;
end;

procedure TFroDM.DataModuleCreate(Sender: TObject);
begin
//     Main.Button1Click(Sender);
{     If Main.UMini.TinyErrCode in [1,2,3] Then Session.RemoveAllPasswords;
     Session.OnPassword:=Main.Choose;
     Case USB OF
     False:begin end;
      //Session.AddPassword(Encrypt(Copy(Main.Mini.DataPartition,23,15),13));
     True:
      Session.AddPassword(Copy(Main.UMini.DataPartition,23,15));
     End;}

     DefaultsCheck;
     IF (Fill_Corps.Count = 0) Then Exit;
     If (DefaultDb = '')Or(GetCorPath(DefaultDb)='') Then SetDefaultDb;
     If DefaultDb >'' Then
      Setup_DataBase(DefaultDb)
     Else
      Setup_DataBase('ParFro');
     If CurrDb ='' Then CurrDb:='ParFro';
end;


procedure TFroDM.BinvoGoodBeforePost(DataSet: TDataSet);
begin
     With DataSet Do
     Begin
      Fields[11].AsCurrency:=(1-Fields[10].AsFloat/100)*Fields[9].AsCurrency*
      Fields[7].AsFloat;
      If Fields[5].IsNull Then Fields[5].Value:=AnbNam('');
     End;
end;

procedure TFroDM.RResAfterEdit(DataSet: TDataSet);
begin
     With DataSet Do
     If Not Fields[1].IsNull Then
      FroDM.Rcheq.Filter:='No='+Fields[1].AsString
     Else
      FroDM.Rcheq.Filter:='';
end;

procedure TFroDM.RkelAfterEdit(DataSet: TDataSet);
begin
     With DataSet Do
     If Not Fields[1].IsNull Then
      FroDM.RKI.Filter:='No='+Fields[1].AsString
     Else
      FroDM.RKI.Filter:='';
end;

procedure TFroDM.RPayAfterEdit(DataSet: TDataSet);
begin
     With DataSet Do
     If Not Fields[1].IsNull Then
      FroDM.RPI.Filter:='No='+Fields[1].AsString
     Else
      FroDM.RPI.Filter:='';
end;

procedure TFroDM.RrejAfterEdit(DataSet: TDataSet);
begin
     With DataSet Do
     If Not Fields[1].IsNull Then
      FroDM.RRI.Filter:='No='+Fields[1].AsString
     Else
      FroDM.RRI.Filter:='';
end;

procedure TFroDM.RvosAfterEdit(DataSet: TDataSet);
begin
     With DataSet Do
     If Not Fields[1].IsNull Then
      FroDM.RVI.Filter:='No='+Fields[1].AsString
     Else
      FroDM.RVI.Filter:='';
end;

procedure TFroDM.RukelAfterEdit(DataSet: TDataSet);
begin
     With DataSet Do
     If Not Fields[1].IsNull Then
      FroDM.RUKI.Filter:='No='+Fields[1].AsString
     Else
      FroDM.RUKI.Filter:='';
end;

procedure TFroDM.CentAfterEdit(DataSet: TDataSet);
begin
     With DataSet Do
     If Not Fields[0].IsNull Then
      FroDM.CPerm.Filter:='Ckod='+Fields[0].AsString
     Else
      FroDM.CPerm.Filter:='';

end;

procedure TFroDM.RMonBeforePost(DataSet: TDataSet);
begin

end;
{


NET PROTOCOL=TNS
OPEN MODE=READ/WRITE
SCHEMA CACHE SIZE=8
LANGDRIVER=
SQLQRYMODE=
SQLPASSTHRU MODE=SHARED AUTOCOMMIT
SCHEMA CACHE TIME=-1
MAX ROWS=-1
BATCH COUNT=200
ENABLE SCHEMA CACHE=FALSE
SCHEMA CACHE DIR=
ENABLE BCD=FALSE
ENABLE INTEGERS=FALSE
LIST SYNONYMS=NONE
ROWSET SIZE=20
BLOBS TO CACHE=64
BLOB SIZE=32
OBJECT MODE=TRUE
DATABASE NAME=Parsian
SERVER NAME=compaq
USER NAME=sa
PASSWORD=}
procedure TFroDM.RMOutBeforePost(DataSet: TDataSet);
begin
     With DataSet Do
     Begin
      Fields[8].AsCurrency:=Fields[5].AsCurrency* Fields[7].AsCurrency;
     End;
end;

procedure TFroDM.RMAfterEdit(DataSet: TDataSet);
begin
     With DataSet Do
     If Not Fields[1].IsNull Then
     Begin
      FroDM.RMOut.Filter:='No='+Fields[1].AsString;
      FroDM.RMin.Filter:='No='+Fields[1].AsString
     End Else Begin
      FroDM.RMOut.Filter:='';
      FroDM.RMin.Filter:='';
     end;
end;

procedure TFroDM.AcbillBeforePost(DataSet: TDataSet);
Var
fRate:Currency;
begin
     With DataSet Do
     Begin
      fRate:=GetRateAtDate(Fields[17].AsString,Fields[2].AsInteger);
      If (Fields[14].Value >0)and(Fields[3].IsNull ) Then
       Fields[3].Value:=Fields[14].Value * fRate;
      If (Fields[15].Value >0)and(Fields[4].IsNull) Then
       Fields[4].Value:=Fields[15].Value * fRate;
     End;
end;

procedure TFroDM.ExpAfterEdit(DataSet: TDataSet);
begin
     With DataSet Do
     If Not Fields[1].IsNull Then
      FroDM.ExpD.Filter:='No='+Fields[1].AsString
     Else
      FroDM.ExpD.Filter:='';
end;

procedure TFroDM.HavGBeforePost(DataSet: TDataSet);
begin
     With DataSet Do
      If Fields[5].IsNull Then Fields[5].Value:=AnbNam('');
end;

procedure TFroDM.InvoGoodBeforePost(DataSet: TDataSet);
begin
     With DataSet Do
     Begin
      Fields[11].AsCurrency:=(1-Fields[10].AsFloat/100)*Fields[9].AsCurrency*
      Fields[7].AsFloat;
      If Fields[5].IsNull Then Fields[5].Value:=AnbNam('');
      If Fields[17].IsNull Then Fields[17].Value:=Frodm.InvoEco.Value;
      If Fields[6].AsFloat=0 Then Fields[6].Value:=Frodm.InvoPpay.Value;
      //If Fields[7].AsFloat < Fields[21].AsFloat Then  Fields[7].AsFloat := Fields[21].AsFloat;
     End;
end;

(**********************************************************)
procedure TFroDM.InvoBeforeEdit(DataSet: TDataSet);
begin
     MakeLog(Frodm.InvoNo.Value,Frodm.InvoDat.Value,Frodm.InvoPnet.Value,'ÝÇ˜ÊæÑ ÝÑæÔ',
     'æíÑÇíÔ');
end;

procedure TFroDM.InvoAfterPost(DataSet: TDataSet);
begin
     MakeLog(Frodm.InvoNo.Value,Frodm.InvoDat.Value,Frodm.InvoPnet.Value,'ÝÇ˜ÊæÑ ÝÑæÔ',
     'ËÈÊ');
end;

procedure TFroDM.InvoBeforeDelete(DataSet: TDataSet);
begin
     MakeLog(Frodm.InvoNo.Value,Frodm.InvoDat.Value,Frodm.InvoPnet.Value,'ÝÇ˜ÊæÑ ÝÑæÔ',
     'ÍÐÝ');
end;

procedure TFroDM.RMonBeforeEdit(DataSet: TDataSet);
begin
     MakeLog(Frodm.RMonNo.Value,Frodm.RMonDat.Value,Frodm.RMonPrice.Value,'ÞÈÖ ÏÑíÇÝÊ',
     'æíÑÇíÔ');
end;

procedure TFroDM.RMonAfterPost(DataSet: TDataSet);
begin
     MakeLog(Frodm.RMonNo.Value,Frodm.RMonDat.Value,Frodm.RMonPrice.Value,'ÞÈÖ ÏÑíÇÝÊ',
     'ËÈÊ');
end;

procedure TFroDM.RMonBeforeDelete(DataSet: TDataSet);
begin
     MakeLog(Frodm.RMonNo.Value,Frodm.RMonDat.Value,Frodm.RMonPrice.Value,
     'ÞÈÖ ÏÑíÇÝÊ','ÍÐÝ');
end;

procedure TFroDM.PMonBeforeEdit(DataSet: TDataSet);
begin
     MakeLog(Frodm.PMonNo.Value,Frodm.PMonDat.Value,Frodm.PMonPrice.Value,'ÞÈÖ ÑÏÇÎÊ',
     'æíÑÇíÔ');
end;

procedure TFroDM.PMonAfterPost(DataSet: TDataSet);
begin
     MakeLog(Frodm.PMonNo.Value,Frodm.PMonDat.Value,Frodm.PMonPrice.Value,'ÞÈÖ ÑÏÇÎÊ',
     'ËÈÊ');
end;

procedure TFroDM.PMonBeforeDelete(DataSet: TDataSet);
begin
     MakeLog(Frodm.PMonNo.Value,Frodm.PMonDat.Value,Frodm.PMonPrice.Value,'ÞÈÖ ÑÏÇÎÊ',
     'ÍÐÝ');
end;

procedure TFroDM.NFishBeforeEdit(DataSet: TDataSet);
begin
     MakeLog(Frodm.NFishNo.Value,Frodm.NFishDat.Value,Frodm.NFishPrice.Value,'æÇÑíÒ ÈÇä˜í',
     'æíÑÇíÔ');
end;

procedure TFroDM.NFishAfterPost(DataSet: TDataSet);
begin
     MakeLog(Frodm.NFishNo.Value,Frodm.NFishDat.Value,Frodm.NFishPrice.Value,'æÇÑíÒ ÈÇä˜í',
     'ËÈÊ');
end;

procedure TFroDM.NFishBeforeDelete(DataSet: TDataSet);
begin
     MakeLog(Frodm.NFishNo.Value,Frodm.NFishDat.Value,Frodm.NFishPrice.Value,'æÇÑíÒ ÈÇä˜í',
     'ÍÐÝ');
end;

procedure TFroDM.BHavBeforeEdit(DataSet: TDataSet);
begin
     MakeLog(Frodm.BHavNo.Value,Frodm.BHavDat.Value,Frodm.BHavPrice.Value,'ÈÑÏÇÔÊ ÈÇä˜í',
     'æíÑÇíÔ');
end;

procedure TFroDM.BHavAfterPost(DataSet: TDataSet);
begin
     MakeLog(Frodm.BHavNo.Value,Frodm.BHavDat.Value,Frodm.BHavPrice.Value,'ÈÑÏÇÔÊ ÈÇä˜í',
     'ËÈÊ');
end;

procedure TFroDM.BHavBeforeDelete(DataSet: TDataSet);
begin
     MakeLog(Frodm.BHavNo.Value,Frodm.BHavDat.Value,Frodm.BHavPrice.Value,'ÈÑÏÇÔÊ ÈÇä˜í',
     'ÍÐÝ');
end;

procedure TFroDM.RResBeforeEdit(DataSet: TDataSet);
begin
     MakeLog(Frodm.RResNo.Value,Frodm.RResDat.Value,Frodm.RResPsum.Value,' ÑÓíÏ ÏÑíÇÝÊ ˜',
     'æíÑÇíÔ');
end;

procedure TFroDM.RResAfterPost(DataSet: TDataSet);
begin
     MakeLog(Frodm.RResNo.Value,Frodm.RResDat.Value,Frodm.RResPsum.Value,' ÑÓíÏ ÏÑíÇÝÊ ˜',
     'ËÈÊ');

end;

procedure TFroDM.RResBeforeDelete(DataSet: TDataSet);
begin
     MakeLog(Frodm.RResNo.Value,Frodm.RResDat.Value,Frodm.RResPsum.Value,' ÑÓíÏ ÏÑíÇÝÊ ˜',
     'ÍÐÝ');
end;

procedure TFroDM.AcpayBeforeEdit(DataSet: TDataSet);
begin
     Makelog(Frodm.AcpayNo.Value,Frodm.AcpayDat.Value,Frodm.AcpayPrice.Value,'ËÈÊ ÑæÒäÇãå',
     'æíÑÇíÔ');
end;

procedure TFroDM.AcpayAfterPost(DataSet: TDataSet);
begin
     Makelog(Frodm.AcpayNo.Value,Frodm.AcpayDat.Value,Frodm.AcpayPrice.Value,'ËÈÊ ÑæÒäÇãå',
     'ËÈÊ');
end;

procedure TFroDM.AcpayBeforeDelete(DataSet: TDataSet);
begin
     Makelog(Frodm.AcpayNo.Value,Frodm.AcpayDat.Value,Frodm.AcpayPrice.Value,'ËÈÊ ÑæÒäÇãå',
     'ÍÐÝ');
end;

procedure TFroDM.BinvoBeforeEdit(DataSet: TDataSet);
begin
     Makelog(Frodm.BinvoNo.Value,Frodm.BinvoDat.Value,Frodm.BinvoPnet.Value,'ÝÇ˜ÊæÑ ÎÑíÏ',
     'æíÑÇíÔ');
end;

procedure TFroDM.BinvoAfterPost(DataSet: TDataSet);
begin
     Makelog(Frodm.BinvoNo.Value,Frodm.BinvoDat.Value,Frodm.BinvoPnet.Value,'ÝÇ˜ÊæÑ ÎÑíÏ',
     'ËÈÊ');

end;

procedure TFroDM.BinvoBeforeDelete(DataSet: TDataSet);
begin
     Makelog(Frodm.BinvoNo.Value,Frodm.BinvoDat.Value,Frodm.BinvoPnet.Value,'ÝÇ˜ÊæÑ ÎÑíÏ',
     'ÍÐÝ');
end;

procedure TFroDM.ExpBeforeEdit(DataSet: TDataSet);
begin
     Makelog(Frodm.ExpNo.Value,Frodm.ExpDat.Value,Frodm.ExpPsum.Value,'ÕæÑÊ åÒíäå ',
     'æíÑÇíÔ');
end;

procedure TFroDM.ExpAfterPost(DataSet: TDataSet);
begin
     Makelog(Frodm.ExpNo.Value,Frodm.ExpDat.Value,Frodm.ExpPsum.Value,'ÕæÑÊ åÒíäå ',
     'ËÈÊ');
end;

procedure TFroDM.ExpBeforeDelete(DataSet: TDataSet);
begin
     Makelog(Frodm.ExpNo.Value,Frodm.ExpDat.Value,Frodm.ExpPsum.Value,'ÕæÑÊ åÒíäå ',
     'ÍÐÝ');
end;

procedure TFroDM.PcheqBeforeEdit(DataSet: TDataSet);
begin
     If Not Frodm.PcheqBno.IsNull Then
     Makelog(Frodm.PcheqBno.AsInteger,Frodm.PcheqBDat.Value,Frodm.PcheqPbill.Value,'ÕÏæÑ ˜',
     'æíÑÇíÔ');
end;

procedure TFroDM.PcheqAfterPost(DataSet: TDataSet);
begin
     If Not Frodm.PcheqBno.IsNull Then
     Makelog(Frodm.PcheqBno.AsInteger,Frodm.PcheqBDat.Value,Frodm.PcheqPbill.Value,'ÕÏæÑ ˜',
     'ËÈÊ');
end;

procedure TFroDM.PcheqBeforeDelete(DataSet: TDataSet);
begin
     If Not Frodm.PcheqBno.IsNull Then
     Makelog(Frodm.PcheqBno.AsInteger,Frodm.PcheqBDat.Value,Frodm.PcheqPbill.Value,'ÕÏæÑ ˜',
     'ÍÐÝ');
end;

procedure TFroDM.RcheqBeforeEdit(DataSet: TDataSet);
begin
     If Not Frodm.RcheqBno.IsNull Then
      Makelog(Frodm.RcheqBno.AsInteger,Frodm.RcheqBDat.Value,Frodm.RcheqPbill.Value,'ÏÑíÇÝÊ ˜',
      'æíÑÇíÔ');
end;

procedure TFroDM.RcheqAfterPost(DataSet: TDataSet);
begin
     If Not Frodm.RcheqBno.IsNull Then
      Makelog(Frodm.RcheqBno.AsInteger,Frodm.RcheqBDat.Value,Frodm.RcheqPbill.Value,'ÏÑíÇÝÊ ˜',
      'ËÈÊ');
end;

procedure TFroDM.RcheqBeforeDelete(DataSet: TDataSet);
begin
     If Not Frodm.RcheqBno.IsNull Then
      Makelog(Frodm.RcheqBno.AsInteger,Frodm.RcheqBDat.Value,Frodm.RcheqPbill.Value,'ÏÑíÇÝÊ ˜',
      'ÍÐÝ');
end;

procedure TFroDM.RMBeforeEdit(DataSet: TDataSet);
begin
     Makelog(Frodm.RMNo.AsInteger,Frodm.RMDat.Value,Frodm.RMPsum.Value,'ÑãíÊÇäÓ',
     'æíÑÇíÔ');
end;

procedure TFroDM.RMAfterPost(DataSet: TDataSet);
begin
     Makelog(Frodm.RMNo.AsInteger,Frodm.RMDat.Value,Frodm.RMPsum.Value,'ÑãíÊÇäÓ',
     'ËÈÊ');
end;

procedure TFroDM.RMBeforeDelete(DataSet: TDataSet);
begin
     Makelog(Frodm.RMNo.AsInteger,Frodm.RMDat.Value,Frodm.RMPsum.Value,'ÑãíÊÇäÓ',
     'ÍÐÝ');
end;

procedure TFroDM.RPayBeforeEdit(DataSet: TDataSet);
begin
     Makelog(Frodm.RPayNo.AsInteger,Frodm.RPayDat.Value,Frodm.RPayPsum.Value,'ÎÑÌ ˜',
     'æíÑÇíÔ');
end;

procedure TFroDM.RPayAfterPost(DataSet: TDataSet);
begin
     Makelog(Frodm.RPayNo.AsInteger,Frodm.RPayDat.Value,Frodm.RPayPsum.Value,'ÎÑÌ ˜',
     'ËÈÊ');
end;

procedure TFroDM.RPayBeforeDelete(DataSet: TDataSet);
begin
     Makelog(Frodm.RPayNo.AsInteger,Frodm.RPayDat.Value,Frodm.RPayPsum.Value,'ÎÑÌ ˜',
     'ÍÐÝ');
end;

procedure TFroDM.IRejGBeforePost(DataSet: TDataSet);
begin
     With DataSet Do
     Begin
      If Fields[5].IsNull Then Fields[5].Value:=AnbNam('');
      Fields[10].Value:=Fields[7].Value*Fields[9].Value;
     End;
end;

procedure TFroDM.VisitAfterScroll(DataSet: TDataSet);
begin
     Frodm.VAct.Filter:='Vkod='+Frodm.VisitCode.AsString;
     Frodm.VAct.Filtered:=True;
end;

end.
