program ParFro;



uses
  Forms,
  Windows,
  Registry,
  Dialogs,
  SysUtils,
  DbTables,
  AccRem in 'Source\AccRem.pas' {FAcRem},
  AcBillList in 'Source\AcBillList.pas' {FABillList},
  AcBillRep in 'Source\AcBillRep.pas' {AbillRep: TQuickRep},
  AccKoding in 'Source\AccKoding.pas' {FAccKoding},
  AccList in 'Source\AccList.pas' {FAccList},
  Passing in 'Source\Passing.pas' {FPassing},
  AnbGRep in 'Source\AnbGRep.pas' {FAnbGRep: TQuickRep},
  AcountReport in 'Source\AcountReport.pas' {AcountRep: TQuickRep},
  Anb_moj in 'Source\Anb_moj.pas' {FAnb_Moj},
  AnbDat in 'Source\AnbDat.pas' {FAnbDat},
  TarazGardeshArzi in 'Source V5\TarazGardeshArzi.pas' {FTGardeshArzi},
  CarBill in 'Source\CarBill.pas' {FCar},
  AnbRep in 'Source\AnbRep.pas' {AnbGardeshRep: TQuickRep},
  AutoMation in 'Source\AutoMation.pas' {FAutoAcc},
  Banks in 'Source\Banks.pas' {Fbank},
  CurCardexRep in 'Source\CurCardexRep.pas' {RepCurrCardex: TQuickRep},
  DchListRep in 'Source\DchListRep.pas' {RepDchList: TQuickRep},
  Color in 'Source\Color.pas' {FColor},
  DcheqList in 'Source\DcheqList.pas' {FDCheqList},
  Cheq in 'Source\Cheq.pas' {CheqSerial},
  RejFacRep in 'Source\RejFacRep.pas' {RepBuyRej: TQuickRep},
  ReBill in 'Source\ReBill.pas' {FReBill},
  GardeshRep in 'Source\GardeshRep.pas' {GReport: TQuickRep},
  Enviro in 'Source\Enviro.pas' {FEnviro},
  GoodsEdit in 'Source\GoodsEdit.pas' {FgoodsEdit},
  Jari in 'Source\Jari.pas' {FJari},
  JariPrint in 'Source\JariPrint.pas' {FJaPrint},
  CurrCardex in 'Source\CurrCardex.pas' {FCurrCardex},
  GoodList in 'Source\GoodList.pas' {FGoodList},
  PCheq in 'Source\PCheq.pas' {FPcheq},
  PcheqList in 'Source\PcheqList.pas' {FPCheqList},
  PchListRep in 'Source\PchListRep.pas' {RepPchList: TQuickRep},
  PInvoice in 'Source\PInvoice.pas' {FPInvoice},
  ProVar in 'Source\ProVar.pas',
  NewYear in 'Source\NewYear.pas' {FNewYear},
  TarazReport in 'Source\TarazReport.pas' {TarazRep: TQuickRep},
  RepGoods in 'Source\RepGoods.pas' {GoodRep: TQuickRep},
  RepJari in 'Source\RepJari.pas' {JariRep: TQuickRep},
  Restore in 'Source\Restore.pas' {FRestore},
  Taraz in 'Source\Taraz.pas' {FTaraz},
  Tjari in 'Source\Tjari.pas' {FTjari},
  UserName in 'Source\UserName.pas' {FUserName},
  Users in 'Source\Users.pas' {FUsers},
  GProfit in 'Source\GProfit.pas' {FGProfit},
  AcTree in 'Source\AcTree.pas' {FAcTree},
  DiagMo in 'Source\DiagMo.pas' {FDiagMo},
  GoodStatue in 'Source\GoodStatue.pas' {FGStatue},
  Bill in 'Source\Bill.pas' {FBill},
  BillRep2 in 'Source V5\BillRep2.pas' {RepBill2: TQuickRep},
  BillFind in 'Source\BillFind.pas' {FBFind},
  GBGoz in 'Source\GBGoz.pas' {FGBGoz},
  GFormula in 'Source V5\GFormula.pas' {FGFormula},
  RepGGoz in 'Source\RepGGoz.pas' {GGozRep: TQuickRep},
  RepMaliT in 'Source\RepMaliT.pas' {MTarazRep: TQuickRep},
  FacSum in 'Source\FacSum.pas' {FFucSum},
  RepFacSum in 'Source\RepFacSum.pas' {SumFacRep: TQuickRep},
  AccMove in 'Source\AccMove.pas' {FAccMove},
  JariDel in 'Source\JariDel.pas' {FJariDel},
  Credit in 'Source\Credit.pas' {FCredit},
  KalaCardex in 'Source\KalaCardex.pas' {FKCardex},
  CashBill in 'Source\CashBill.pas' {FCash},
  CashPay in 'Source\CashPay.pas' {FCashPay},
  AcountPay in 'Source\AcountPay.pas' {FAccPayment},
  Acount in 'Source\Acount.pas',
  RMResid in 'Source\RMResid.pas' {qrRMResid: TQuickRep},
  Diag in 'Source\Diag.pas' {FDiag},
  GCDiag in 'Source\GCDiag.pas' {FGCDiag},
  GDiag in 'Source\GDiag.pas' {FGDiag},
  Visit in 'Source\Visit.pas' {FVisit},
  VisitAct in 'Source\VisitAct.pas' {FVisitAct},
  BegAc in 'Source\BegAc.pas' {FbegAc},
  BegPch in 'Source\BegPch.pas' {FbegPch},
  BegRch in 'Source\BegRch.pas' {FbegRch},
  FrooshDM in 'Source\FrooshDM.pas' {FroDM: TDataModule},
  Routins in 'Source\Routins.pas',
  CentSearch in 'Source V5\CentSearch.pas' {FCentSearch},
  GFind in 'Source\GFind.pas' {FGFind},
  DailyGoz in 'Source\DailyGoz.pas' {FDaily},
  CustBill in 'Source\CustBill.pas' {FCustBill},
  CustBRep in 'Source\CustBRep.pas' {FCustBRep: TQuickRep},
  ChTaraz in 'Source\ChTaraz.pas' {FChTaraz},
  ArshivD in 'Source V5\ArshivD.pas' {FArshD},
  MArsh in 'Source\MArsh.pas' {FMArsh},
  RInvArsh in 'Source\RInvArsh.pas' {FRInvArsh},
  BInvArsh in 'Source\BInvArsh.pas' {FBInvArsh},
  RBinvArsh in 'Source\RBinvArsh.pas' {FRBinvArsh},
  Converts in 'Source\Converts.pas',
  Saf in 'Source\Saf.pas' {FSaf},
  SafList in 'Source\SafList.pas' {FSafList},
  AnbP in 'Source\AnbP.pas' {FAnbP},
  RepAnbP in 'Source\RepAnbP.pas' {AnbPRep: TQuickRep},
  Binvoice in 'Source\Binvoice.pas' {FBvoice},
  RejInvo in 'Source\RejInvo.pas' {FRejInvo},
  RepResid in 'Source\RepResid.pas' {qrResid: TQuickRep},
  ChCor in 'Source\ChCor.pas' {FChCor},
  DatedCopy in 'Source\DatedCopy.pas' {MonCopy},
  Aghs in 'Source\Aghs.pas' {FAghs},
  AghsEdit in 'Source\AghsEdit.pas' {FAgsEdit},
  AghsList in 'Source\AghsList.pas' {FAghsList},
  AghsRep in 'Source\AghsRep.pas' {qrAghsList: TQuickRep},
  GAmar in 'Source\GAmar.pas' {FGAmar},
  RPayRep in 'Source\RPayRep.pas' {QrRPay: TQuickRep},
  RepBar in 'Source\RepBar.pas' {BarRep: TQuickRep},
  RepGAnal in 'Source\RepGAnal.pas' {GAnalRep: TQuickRep},
  Accpri in 'Source\Accpri.pas' {FAccPri},
  Car_Repair in 'Source\Car_Repair.pas' {FCarRepair},
  Accounts in 'Source\Accounts.pas' {FAcount},
  CGoodRep in 'Source\CGoodRep.pas' {RepCGood: TQuickRep},
  MakeDb in 'Source\MakeDb.pas' {FNewDb},
  AccountLock in 'Source\AccountLock.pas' {FAcLock},
  Tolid in 'Source\Tolid.pas' {FTolid},
  Benef in 'Source\Benef.pas' {FBenef},
  Solds in 'Source\Solds.pas' {FSolds},
  RepTols in 'Source\RepTols.pas' {TolsRep: TQuickRep},
  RepSolds in 'Source\RepSolds.pas' {SoldsRep: TQuickRep},
  Buys in 'Source\Buys.pas' {FBuys},
  RepBuys in 'Source\RepBuys.pas' {BuysRep: TQuickRep},
  MainForm in 'Source\Mainform.pas' {Main},
  CheckData in 'Source\CheckData.pas' {DataCheck},
  About in 'Source\About.pas' {AboutBox},
  ExpDbg in 'Source\ExpDbg.pas',
  DatedBenef in 'Source\DatedBenef.pas' {FDBenef},
  RepGProf in 'Source\RepGProf.pas' {GPRep: TQuickRep},
  PriceRepair in 'Source\PriceRepair.pas' {FPrices},
  SolarUtl in 'Source\SolarUtl.pas',
  Rbld1 in 'Source\Repair\Rbld1.pas',
  Goods in 'Source\Goods.pas' {Fgoods},
  OuPrice in 'Source\OuPrice.pas' {FOutPrices},
  GSearch in 'Source\GSearch.pas' {FGSearch},
  GChart in 'Source\GChart.pas' {FGChart},
  Serial in 'Source\Serial.pas' {FSerial},
  FGoz in 'Source\FGoz.pas' {FFgoz},
  DIRej in 'Source V5\DIRej.pas' {FDIRej},
  FactorRep2 in 'Source V5\FactorRep2.pas' {FacQr2: TQuickRep},
  RUKeler in 'Source\RUKeler.pas' {FRUKeler},
  RcheqRep in 'Source\RcheqRep.pas' {QrRcheq: TQuickRep},
  RPay in 'Source\RPay.pas' {FRPay},
  RVosol in 'Source\RVosol.pas' {FRVosol},
  RRej in 'Source\RRej.pas' {FRRej},
  RKeler in 'Source\RKeler.pas' {FRKeler},
  HavBill in 'Source\HavBill.pas' {FHav},
  RejBinvo in 'Source\RejBinvo.pas' {FRejBvoice},
  AnbMov in 'Source\AnbMov.pas' {FAnbMov},
  DOutArsh in 'Source V5\DOutArsh.pas' {FDoutArsh},
  Expense in 'Source V5\Expense.pas' {FExpense},
  CRoutins in 'Source V5\CRoutins.pas',
  AForm in 'Source V5\AForm.pas' {FAForm},
  Cost in 'Source V5\Cost.pas' {FCost},
  Cperm in 'Source V5\Cperm.pas' {FCperm},
  RepCosts in 'Source V5\RepCosts.pas' {CostRep: TQuickRep},
  CentEdit in 'Source V5\CentEdit.pas' {FCentEdit},
  CentRep in 'Source V5\CentRep.pas' {RepCent: TQuickRep},
  Corps in 'Source\Corps.pas' {FCorp},
  BillRep in 'Source\BillRep.pas' {RepBill: TQuickRep},
  CTip in 'Source V5\CTip.pas' {FCTip},
  Tip in 'Source V5\Tip.pas' {FTip},
  Crate in 'Source V5\Crate.pas' {FCrate},
  AcSearch in 'Source\AcSearch.pas' {FAcSearch},
  Exchange in 'Source V5\Exchange.pas' {FExchange},
  Cashier in 'Source V5\Cashier.pas' {FCashier},
  JariEdit in 'Source V5\JariEdit.pas' {FJariEdit},
  TarazGardesh in 'Source\TarazGardesh.pas' {FTGardesh},
  MBill in 'Source V5\MBill.pas' {FMakeBill},
  Cent in 'Source V5\Cent.pas' {FCent},
  RResArsh in 'Source\RResArsh.pas' {FRResArsh},
  PMArsh in 'Source\PMArsh.pas' {FPMArsh},
  BHArsh in 'Source\BHArsh.pas' {FBHArsh},
  NFArsh in 'Source\NFArsh.pas' {FNFArsh},
  AcpArsh in 'Source\AcpArsh.pas' {FAcpArsh},
  TGoods in 'Source V5\TGoods.pas',
  FactorRep in 'Source\FactorRep.pas' {FacQr: TQuickRep},
  DConvert in 'Source V5\DConvert.pas' {FDConvert},
  Comb in 'Source V5\Comb.pas' {FComb},
  RRes in 'Source\RRes.pas' {FRRes},
  CashMoney in 'Source\CashMoney.pas' {FCashBill},
  ExpArsh in 'Source V5\ExpArsh.pas' {FExpArsh},
  ExArsh in 'Source V5\ExArsh.pas' {FEXArsh},
  LinkCent in 'Source V5\LinkCent.pas' {FLinkCent},
  Remitance in 'Source V5\Remitance.pas' {FRemit},
  RemArsh in 'Source V5\RemArsh.pas' {FRemArsh},
  RMArsh in 'Source\RMArsh.pas' {FRMArsh},
  Invoice in 'Source\Invoice.pas' {FInvoice},
  ShList in 'Source\Sef Source\ShList.pas' {FShList},
  AnbEst in 'Source\Sef Source\AnbEst.pas' {FAnbEst},
  Sef in 'Source\Sef Source\Sef.pas' {FSef},
  InvArsh in 'Source\InvArsh.pas' {FInvArsh},
  UserLog in 'Source\UserLog.pas' {FUserLog},
  PMResid in 'Source\PMResid.pas' {qrPMResid: TQuickRep},
  NFResid in 'Source\NFResid.pas' {qrNFResid: TQuickRep},
  BHResid in 'Source\BHResid.pas' {qrBHResid: TQuickRep},
  APResid in 'Source\APResid.pas' {qrAPResid: TQuickRep},
  Arshiv in 'Source\Arshiv.pas' {FArsh},
  GGoz in 'Source\GGoz.pas' {FGGoz},
  PSearch in 'Source\PSearch.pas' {FPSearch},
  GFSelect in 'Source V5\GFSelect.pas' {FGFSelect},
  SChart in 'Source\Charts\SChart.pas' {FSChart},
  BChart in 'Source\Charts\BChart.pas' {FBChart},
  CustChart in 'Source\Charts\CustChart.pas' {FCChart},
  GMontChart in 'Source\Charts\GMontChart.pas' {FMGChart},
  MontChart in 'Source\Charts\MontChart.pas' {FMChart},
  SGChart in 'Source\Charts\SGChart.pas' {FSGChart},
  RRejArsh in 'Source\RRejArsh.pas' {FRRejArsh},
  RUKelArsh in 'Source\RUKelArsh.pas' {FRUkelArsh},
  RVosArsh in 'Source\RVosArsh.pas' {FRVosArsh},
  RKelArsh in 'Source\RKelArsh.pas' {FRkelArsh},
  AccSet in 'Source\AccSet.pas' {FAccSet},
  DOutg in 'Source V5\DOutg.pas' {FDout},
  DORej in 'Source V5\DORej.pas' {FDORej},
  DHavArsh in 'Source V5\DHavArsh.pas' {FDHavArsh},
  DOutEst in 'Source V5\DOutEst.pas' {FDOutEst},
  Tols in 'Source\Tols.pas' {FTols},
  Variance in 'Source\Variance.pas' {FVariance},
  AcGardeshArzi in 'Source V5\AcGardeshArzi.pas' {FGardeshArzi},
  DRes in 'Source V5\DRes.pas' {FDRes},
  DHav in 'Source V5\DHav.pas' {FDHav},
  HavEst in 'Source V5\HavEst.pas' {FHavEst},
  Anb_check in 'Source\Anb_check.pas' {FAnb_Check},
  DepotDaily in 'Source V5\DepotDaily.pas' {FDepotDaily},
  Goodbenef in 'Source V5\Goodbenef.pas' {FGoodBenef},
  GoodEst in 'Source V5\GoodEst.pas' {FGoodEst},
  CustEst in 'Source V5\CustEst.pas' {FCustEst},
  AcGardesh in 'Source\AcGardesh.pas' {FGardesh};

{$R *.RES}
Var
hMutex :Thandle;
Reg:TRegistry;
AbBox:TAboutBox;
begin
  //FileSetAttr(Application.ExeName,faReadOnly);
//---------------------------------
  Reg:=TRegistry.Create;
  Reg.RootKey:=HKEY_LOCAL_MACHINE;
  If Not Reg.OpenKey(Encrypt('£¨êôãàûçö£Ωêçìûëõ£ªûãûùûåöﬂ∫ëòñëö',0),False)Then
  Begin
   RegKeyImport(HKEY_LOCAL_MACHINE,'Par002.Rgs');
   Reg.OpenKey('\Software\Borland\Database Engine',False);
   Reg.WriteString('DLLPATH',GetCurrentDir+'\Common Files');
   Reg.Free;
  End;
//---------------------------------

  hMutex:=CreateMutex(nil,False,'melorin');
  IF WaitForSingleObject(hMutex,0) <> Wait_TimeOut Then
  Begin
   Application.Initialize;
   Application.BiDiKeyboard:='00000429';
   Application.Title := '»«“—ê«‰Ì „·Ê—Ì‰';
   Application.HelpFile := '';
   AbBox:=TAboutBox.Create(Application);
   With AbBox Do
   Begin
    FormStyle:=fsStayOnTop;
    Visible:=False;
    Panel2.Visible:=True;
    OnCreate:=FormCreate;
   End;
   AbBox.show;
   AbBox.Refresh;
   AbBox.Update;
   Sleep(500);
   If Passage Then
   Begin
    //AbBox.Repaint;
    AbBox.Panel2.Visible:=True;
    AbBox.show;
    //AbBox.Update;
    Session.AddPassword(Encrypt('ÕÀ∆',64));
    Application.CreateForm(TMain, Main);
  Hmu:=CreateMutex(nil,False,PChar(Encrypt('4.>-;S. S4,-<)S<3:',130)));
    If GetLastError() = ERROR_ALREADY_EXISTS Then  Main.Start(Application);
    CloseHandle(Hmu);

    FState:=True;
    AbBox.Hide;
    AbBox.Free;
    Main.Visible:=True;
    Application.Run;
   End;
  End;
end.
