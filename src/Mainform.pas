unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ComCtrls, jpeg, ExtCtrls, ToolWin,Db,DbTables, Buttons, StdCtrls,Registry,
  ImgList,TINYLib_TLB, cdburner, Grids, DBGrids, WinSkinData,
  mxOutlookBarPro, Mask, DBCtrls, OleCtrls, ppBands, ppPrnabl, ppClass,
  ppCtrls, ppCache, ppParameter, ppComm, ppRelatv, ppProd, ppReport,
  ppEndUsr, WinSkinStore;

type
  TMain = class(TForm)
    MMenu: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N10: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    N23: TMenuItem;
    N28: TMenuItem;
    N30: TMenuItem;
    N35: TMenuItem;
    N37: TMenuItem;
    N38: TMenuItem;
    N40: TMenuItem;
    N42: TMenuItem;
    N43: TMenuItem;
    N44: TMenuItem;
    N45: TMenuItem;
    Help1: TMenuItem;
    N64: TMenuItem;
    SB1: TStatusBar;
    N67: TMenuItem;
    N69: TMenuItem;
    N62: TMenuItem;
    N70: TMenuItem;
    N73: TMenuItem;
    N26: TMenuItem;
    N5: TMenuItem;
    N9: TMenuItem;
    Timer2: TTimer;
    Panel1: TPanel;
    Memo1: TMemo;
    N15: TMenuItem;
    N4: TMenuItem;
    N17: TMenuItem;
    N6: TMenuItem;
    N29: TMenuItem;
    N32: TMenuItem;
    N36: TMenuItem;
    N39: TMenuItem;
    N46: TMenuItem;
    N47: TMenuItem;
    N48: TMenuItem;
    N49: TMenuItem;
    N34: TMenuItem;
    N51: TMenuItem;
    N57: TMenuItem;
    N58: TMenuItem;
    N60: TMenuItem;
    N61: TMenuItem;
    N63: TMenuItem;
    N11: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    N24: TMenuItem;
    N65: TMenuItem;
    About2: TMenuItem;
    N68: TMenuItem;
    N71: TMenuItem;
    N72: TMenuItem;
    Pop1: TPopupMenu;
    N74: TMenuItem;
    N75: TMenuItem;
    N76: TMenuItem;
    N77: TMenuItem;
    N78: TMenuItem;
    N79: TMenuItem;
    N80: TMenuItem;
    N81: TMenuItem;
    N82: TMenuItem;
    N83: TMenuItem;
    N84: TMenuItem;
    N85: TMenuItem;
    N86: TMenuItem;
    N87: TMenuItem;
    N88: TMenuItem;
    Panel2: TPanel;
    Memo2: TMemo;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    StaticText6: TStaticText;
    imgMain: TImage;
    N89: TMenuItem;
    N90: TMenuItem;
    N91: TMenuItem;
    N92: TMenuItem;
    N93: TMenuItem;
    N94: TMenuItem;
    N95: TMenuItem;
    N96: TMenuItem;
    N97: TMenuItem;
    tmBk: TTimer;
    N98: TMenuItem;
    N99: TMenuItem;
    N41: TMenuItem;
    N100: TMenuItem;
    N101: TMenuItem;
    Button1: TButton;
    N102: TMenuItem;
    N103: TMenuItem;
    N104: TMenuItem;
    N107: TMenuItem;
    N108: TMenuItem;
    N110: TMenuItem;
    N111: TMenuItem;
    N112: TMenuItem;
    N113: TMenuItem;
    N114: TMenuItem;
    N115: TMenuItem;
    N56: TMenuItem;
    N116: TMenuItem;
    N117: TMenuItem;
    N118: TMenuItem;
    N109: TMenuItem;
    N122: TMenuItem;
    N123: TMenuItem;
    N124: TMenuItem;
    N66: TMenuItem;
    N125: TMenuItem;
    glBut: TImageList;
    TB: TToolBar;
    Tb1: TToolButton;
    Tb2: TToolButton;
    Tb3: TToolButton;
    Tb4: TToolButton;
    ToolButton5: TToolButton;
    Tb5: TToolButton;
    Tb8: TToolButton;
    Tb9: TToolButton;
    Tb6: TToolButton;
    Tb11: TToolButton;
    Tb12: TToolButton;
    Tb7: TToolButton;
    ToolButton6: TToolButton;
    Tb10: TToolButton;
    Tb13: TToolButton;
    Tb14: TToolButton;
    tbCalc: TToolButton;
    glKey: TImageList;
    N22: TMenuItem;
    N33: TMenuItem;
    N106: TMenuItem;
    List: TListBox;
    nTol: TMenuItem;
    Tb15: TToolButton;
    N119: TMenuItem;
    N120: TMenuItem;
    N27: TMenuItem;
    N121: TMenuItem;
    Tb16: TToolButton;
    Tb17: TToolButton;
    N53: TMenuItem;
    Tb18: TToolButton;
    CDB: TCDBurner;
    N54: TMenuItem;
    Tb19: TToolButton;
    N126: TMenuItem;
    N52: TMenuItem;
    N50: TMenuItem;
    N127: TMenuItem;
    SkinData1: TSkinData;
    MainMenu1: TMainMenu;
    N128: TMenuItem;
    ToolButton1: TToolButton;
    N129: TMenuItem;
    TreeImage: TImageList;
    N130: TMenuItem;
    N105: TMenuItem;
    N131: TMenuItem;
    N132: TMenuItem;
    N133: TMenuItem;
    N134: TMenuItem;
    N135: TMenuItem;
    N138: TMenuItem;
    N139: TMenuItem;
    N141: TMenuItem;
    N55: TMenuItem;
    N136: TMenuItem;
    N137: TMenuItem;
    N140: TMenuItem;
    N142: TMenuItem;
    N143: TMenuItem;
    N144: TMenuItem;
    N145: TMenuItem;
    N146: TMenuItem;
    N147: TMenuItem;
    N148: TMenuItem;
    N149: TMenuItem;
    LQu: TQuery;
    Query1: TQuery;
    N16: TMenuItem;
    N150: TMenuItem;
    N151: TMenuItem;
    N152: TMenuItem;
    N153: TMenuItem;
    N154: TMenuItem;
    N155: TMenuItem;
    N156: TMenuItem;
    N157: TMenuItem;
    N158: TMenuItem;
    N159: TMenuItem;
    N160: TMenuItem;
    N161: TMenuItem;
    Tb20: TToolButton;
    N162: TMenuItem;
    N163: TMenuItem;
    N164: TMenuItem;
    N165: TMenuItem;
    N166: TMenuItem;
    N167: TMenuItem;
    N25: TMenuItem;
    N31: TMenuItem;
    N59: TMenuItem;
    N168: TMenuItem;
    N169: TMenuItem;
    N170: TMenuItem;
    N171: TMenuItem;
    N172: TMenuItem;
    N173: TMenuItem;
    N174: TMenuItem;
    N175: TMenuItem;
    N176: TMenuItem;
    N177: TMenuItem;
    N178: TMenuItem;
    N179: TMenuItem;
    N180: TMenuItem;
    N181: TMenuItem;
    N182: TMenuItem;
    N183: TMenuItem;
    N184: TMenuItem;
    N185: TMenuItem;
    N186: TMenuItem;
    N187: TMenuItem;
    N188: TMenuItem;
    N189: TMenuItem;
    N190: TMenuItem;
    N191: TMenuItem;
    N192: TMenuItem;
    N193: TMenuItem;
    N194: TMenuItem;
    N195: TMenuItem;
    N196: TMenuItem;
    N197: TMenuItem;
    N198: TMenuItem;
    N199: TMenuItem;
    N200: TMenuItem;
    N201: TMenuItem;
    N202: TMenuItem;
    N203: TMenuItem;
    ppRep: TppReport;
    ppDesign: TppDesigner;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    SkinStore: TSkinStore;
    N204: TMenuItem;
    Procedure Choose(Sender:TObject; var Continue: Boolean);
    procedure childPaint(Sender: TObject);
    procedure QBeforeOpen(DataSet: TDataSet);
    procedure N2Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N43Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure N23Click(Sender: TObject);
    procedure N30Click(Sender: TObject);
    procedure N44Click(Sender: TObject);
    procedure N37Click(Sender: TObject);
    procedure N38Click(Sender: TObject);
    procedure N45Click(Sender: TObject);
    procedure N35Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure SearchforHelpOn1Click(Sender: TObject);
    procedure N64Click(Sender: TObject);
    procedure N67Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N69Click(Sender: TObject);
    procedure N42Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure N40Click(Sender: TObject);
    procedure N62Click(Sender: TObject);
    procedure N70Click(Sender: TObject);
    procedure N73Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Panel1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure N4Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N29Click(Sender: TObject);
    procedure N32Click(Sender: TObject);
    procedure N33Click(Sender: TObject);
    procedure N46Click(Sender: TObject);
    procedure N39Click(Sender: TObject);
    procedure N47Click(Sender: TObject);
    procedure Succed;
    procedure Timer3Timer(Sender: TObject);
    procedure N48Click(Sender: TObject);
    procedure N49Click(Sender: TObject);
    procedure N34Click(Sender: TObject);
    procedure N57Click(Sender: TObject);
    procedure N61Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure N65Click(Sender: TObject);
    procedure About2Click(Sender: TObject);
    procedure N66Click(Sender: TObject);
    procedure N71Click(Sender: TObject);
    procedure N72Click(Sender: TObject);
    procedure FormDblClick(Sender: TObject);
    procedure Timer4Timer(Sender: TObject);
    procedure Panel2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure mmiTileClick(Sender: TObject);
    procedure N90Click(Sender: TObject);
    procedure N91Click(Sender: TObject);
    procedure N92Click(Sender: TObject);
    procedure N93Click(Sender: TObject);
    procedure N94Click(Sender: TObject);
    procedure N95Click(Sender: TObject);
    procedure N96Click(Sender: TObject);
    procedure N97Click(Sender: TObject);
    procedure tmBkTimer(Sender: TObject);
    procedure N98Click(Sender: TObject);
    Procedure Start(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure N41Click(Sender: TObject);
    procedure N100Click(Sender: TObject);
    procedure N101Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N103Click(Sender: TObject);
    procedure N104Click(Sender: TObject);
    procedure sp13Click(Sender: TObject);
    procedure N106Click(Sender: TObject);
    procedure N107Click(Sender: TObject);
    procedure N108Click(Sender: TObject);
    procedure N109Click(Sender: TObject);
    procedure N111Click(Sender: TObject);
    procedure N112Click(Sender: TObject);
    procedure N114Click(Sender: TObject);
    procedure N113Click(Sender: TObject);
    procedure N115Click(Sender: TObject);
    procedure N56Click(Sender: TObject);
    procedure N116Click(Sender: TObject);
    procedure N117Click(Sender: TObject);
    procedure N118Click(Sender: TObject);
    procedure N119Click(Sender: TObject);
    procedure N120Click(Sender: TObject);
    procedure N122Click(Sender: TObject);
    procedure N123Click(Sender: TObject);
    procedure Sp14Click(Sender: TObject);
    procedure N125Click(Sender: TObject);
    procedure N22Click(Sender: TObject);
    procedure tbCalcClick(Sender: TObject);
    procedure nTolClick(Sender: TObject);
    procedure N121Click(Sender: TObject);
    procedure Tb16Click(Sender: TObject);
    procedure Tb17Click(Sender: TObject);
    procedure N53Click(Sender: TObject);
    procedure N54Click(Sender: TObject);
    procedure CDBBurnDone(iResult: Integer);
    procedure Tb19Click(Sender: TObject);
    procedure N126Click(Sender: TObject);
    procedure N52Click(Sender: TObject);
    procedure N127Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure N129Click(Sender: TObject);
    procedure N130Click(Sender: TObject);
    procedure N105Click(Sender: TObject);
    procedure N132Click(Sender: TObject);
    procedure N135Click(Sender: TObject);
    procedure N133Click(Sender: TObject);
    procedure N134Click(Sender: TObject);
    procedure N141Click(Sender: TObject);
    procedure N137Click(Sender: TObject);
    procedure N140Click(Sender: TObject);
    procedure N142Click(Sender: TObject);
    procedure N144Click(Sender: TObject);
    procedure N145Click(Sender: TObject);
    procedure N146Click(Sender: TObject);
    procedure N147Click(Sender: TObject);
    procedure N148Click(Sender: TObject);
    procedure N149Click(Sender: TObject);
    procedure N152Click(Sender: TObject);
    procedure N153Click(Sender: TObject);
    procedure N154Click(Sender: TObject);
    procedure N155Click(Sender: TObject);
    procedure N156Click(Sender: TObject);
    procedure Tb20Click(Sender: TObject);
    procedure N162Click(Sender: TObject);
    procedure N27Click(Sender: TObject);
    procedure N25Click(Sender: TObject);
    procedure N169Click(Sender: TObject);
    procedure N170Click(Sender: TObject);
    procedure N171Click(Sender: TObject);
    procedure N172Click(Sender: TObject);
    procedure N173Click(Sender: TObject);
    procedure N175Click(Sender: TObject);
    procedure N183Click(Sender: TObject);
    procedure N184Click(Sender: TObject);
    procedure N185Click(Sender: TObject);
    procedure N189Click(Sender: TObject);
    procedure N190Click(Sender: TObject);
    procedure N192Click(Sender: TObject);
    procedure N193Click(Sender: TObject);
    procedure N194Click(Sender: TObject);
    procedure N196Click(Sender: TObject);
    procedure N197Click(Sender: TObject);
    procedure N198Click(Sender: TObject);
    procedure N158Click(Sender: TObject);
    procedure N159Click(Sender: TObject);
    procedure N160Click(Sender: TObject);
    procedure N161Click(Sender: TObject);
    procedure N199Click(Sender: TObject);
    procedure N200Click(Sender: TObject);
    procedure N177Click(Sender: TObject);
    procedure N58Click(Sender: TObject);
    procedure N60Click(Sender: TObject);
    procedure N178Click(Sender: TObject);
    procedure N179Click(Sender: TObject);
    procedure N186Click(Sender: TObject);
    procedure N124Click(Sender: TObject);
    procedure N203Click(Sender: TObject);
    procedure N204Click(Sender: TObject);

  private
    { Private declarations }
    upFlag:Boolean;
    imgNo:Integer;
    RunDir:String;
    FOldClientProc,
    FNewClientProc: TFarProc;
    FDrawDC: hDC;
    Min:Integer;
    Alt:Integer;
    procedure ClientWndProc(var Message: TMessage);
    procedure DrawStretched;
    procedure DrawCentered;
    procedure RegRead;
    Procedure PathFind;
    Procedure DailyBackUp(Sender:TObject);
  public
    { Public declarations }
    UMini:TTiny;
    procedure DrawTiled;
    Procedure MenuDefine;
    Procedure TbDefine;
    Procedure PopDefine;
    Function CheckLock:Boolean;
  Protected
   procedure CreateWnd; override;
  end;

var
  Main: TMain;

implementation

uses Invoice, Jari, Binvoice, Tjari, Cheq, Routins, CashBill, Enviro,
  PCheq, AcGardesh,AccList, AcountPay, AcBillList,Banks, Color,Goods,
  AcountReport, FrooshDM, Anb_moj,AnbDat,TarazReport, ProVar,
  AnbMov, KalaCardex, GoodList, Users, UserName, NewYear, About,Bill,
  FGoz,AutoMation,AccRem,PInvoice,DcheqList,GProfit,PcheqList,
  Restore, RejInvo,RejBinvo,AcTree,AccKoding, Benef, RepMaliT, Taraz,
  GoodStatue,BillFind,GGoz,GBGoz,AccMove,JariDel, Credit, CurrCardex,
  HavBill, CashMoney, CashPay,CheckData,Visit,VisitAct,BegAc,InvArsh,
  AcSearch,GSearch,DailyGoz,CustBill,ChTaraz,Arshiv,ChCor, DatedCopy,
  RInvArsh,BInvArsh,RBinvArsh,Saf,SafList,AnbP,Aghs,Accpri,GAmar,
  AghsEdit,AghsList,Accounts,Solds,Buys, Tols,Tolid,
  AccountLock,ExpDbg,FileCtrl,DatedBenef, PriceRepair,Rbld1,
  OuPrice, GFind,GChart,MArsh,Serial,ReBill,RRes,RPay,RKeler,RUKeler,
  RVosol,RRej,CarBill,Cost,Cperm, Corps, CRoutins, Tip, CTip, Crate,
  Cashier, JariEdit, AcGardeshArzi, MBill, RMArsh, PMArsh, BHArsh, NFArsh,
  RResArsh, TGoods, DConvert, Comb,Consts, Remitance, Exchange, RemArsh,
  ExArsh, Expense, ExpArsh, AcpArsh, DHav, ShList, AnbEst, Sef, 
  DHavArsh, GFormula, GFSelect, SChart, MontChart, CustChart, SGChart,
  GMontChart, BChart, RKelArsh, RVosArsh, RUKelArsh, RRejArsh, AccSet,
  DOutg, DOutArsh, DOutEst, DRes, TarazGardesh, TarazGardeshArzi, DIRej,
  DORej, HavEst, Anb_check, DepotDaily, CustEst, GoodEst, Goodbenef,
  Variance;

{$R *.DFM}
{$R Parsian.RES}
procedure TMain.CreateWnd;
begin
  inherited CreateWnd;
  // Turn the ClientWndProc method into a valid window procedure
  FNewClientProc := MakeObjectInstance(ClientWndProc);
  // Get a pointer to the original window procedure
  FOldClientProc := Pointer(GetWindowLong(ClientHandle, GWL_WNDPROC));
  // Set ClientWndProc as the new window procedure
  SetWindowLong(ClientHandle, GWL_WNDPROC, LongInt(FNewClientProc));
end;

procedure TMain.DrawCentered;
{ This procedure centers the image on the form's client area}
var
  CR: TRect;
begin
  GetWindowRect(ClientHandle, CR);
   with imgMain do
     BitBlt(FDrawDC, ((CR.Right - CR.Left) - Picture.Width) div 2,
            ((CR.Bottom - CR.Top) - Picture.Height) div 2,
            Picture.Graphic.Width, Picture.Graphic.Height,
            Picture.Bitmap.Canvas.Handle, 0, 0, SRCCOPY);
end;

procedure TMain.DrawStretched;
{ This procedure stretches the image on the form's client area}
var
  CR: TRect;
begin
  GetWindowRect(ClientHandle, CR);
  StretchBlt(FDrawDC, 0, 0, CR.Right, CR.Bottom,
             imgMain.Picture.Bitmap.Canvas.Handle, 0, 0,
             imgMain.Picture.Width, imgMain.Picture.Height, SRCCOPY);
end;

procedure TMain.DrawTiled;
{ This procedure tiles the image on the form's client area }
var
  Row, Col: Integer;
  CR, IR: TRect;
  NumRows, NumCols: Integer;
begin
  GetWindowRect(ClientHandle, CR);
  IR := imgMain.ClientRect;
  NumRows := CR.Bottom div IR.Bottom;
  NumCols := CR.Right div IR.Right;
  with imgMain do
    for Row := 0 to NumRows+1 do
      for Col := 0 to NumCols+1  do
        BitBlt(FDrawDC, Col * Picture.Width, Row * Picture.Height,
               Picture.Width, Picture.Height, Picture.Bitmap.Canvas.Handle,
               0, 0, SRCCOPY);
end;

procedure TMain.ClientWndProc(var Message: TMessage);
Label
L1;
begin
  case Message.Msg of
    // Capture the WM_ERASEBKGND messages and perform the client area drawing
    WM_ERASEBKGND:
      begin
        If Not sNYear Then Goto L1;
        CallWindowProc(FOldClientProc, ClientHandle, Message.Msg, Message.wParam,
          Message.lParam);
        FDrawDC :=  TWMEraseBkGnd(Message).DC;
        Case PTip Of
        0:DrawCentered;
        1:DrawStretched;
        2:DrawTiled;
        End;
        Message.Result := 1;
      end;
    { Capture the scrolling messages and ensure the the client area
      is redrawn by calling InvalidateRect }
    WM_VSCROLL, WM_HSCROLL:
      begin
        Message.Result := CallWindowProc(FOldClientProc, ClientHandle, Message.Msg,
          Message.wParam, Message.lParam);
        InvalidateRect(ClientHandle, nil, True);
      end;
    else
    // By Default, call the original window procedure
L1:
      Message.Result := CallWindowProc(FOldClientProc, ClientHandle, Message.Msg,
        Message.wParam, Message.lParam);
  end; { case }
end;

procedure TMain.mmiTileClick(Sender: TObject);
begin
  InvalidateRect(ClientHandle, nil, True);
end;

Procedure TMain.Choose(Sender:TObject; var Continue: Boolean);
begin
 Continue:=False;
end;

procedure TMain.childPaint(Sender: TObject);
var
x,y,w,h:Integer;
begin
     If bmpBK.Empty Then Exit;
     With bmpBK Do
     Begin
      H:=Height;
      W:=Width;
     End;
     y:=0;
     While Y < (Sender As TForm).Height Do
     Begin
      x:=0;
      While x < (Sender As TForm).Width Do
      Begin
       (Sender As TForm).Canvas.Draw(X,Y,bmpBK);
       Inc(x,w);
      End;
      Inc(y,h);
     End;
end;

procedure TMain.QBeforeOpen(DataSet: TDataSet);
begin
     If hQRef = 10 Then
     Begin
      QuickRefresh(hTable);
      hQRef:=0;
     End Else
      hQRef:=hQRef+1;
     //Randomize;
     //If Random(10)Mod 3 = 0  Then Succed;
end;

procedure TMain.RegRead;
Var
Reg:TRegistry;
KeyGood,ReRead:Boolean;
St:String;
Label
L1;
begin
     upFlag:=True;
     imgNo:=0;
L1:
     reRead:=False;
     Reg:=Tregistry.Create;
     Try
      KeyGood:=Reg.OpenKey('SoftWare\Hadieh Rayaneh\MParFro',False);
      If KeyGood Then
      Begin
       AdjT:=Reg.ReadInteger('AdjT');
       LastAccess:=Reg.ReadString('LastDate');
       LFontName:=Reg.ReadString('LFontName');
       GFontName:=Reg.ReadString('GFontName');
       FFontName:=Reg.ReadString('FFontName');
       PLFontName:=Reg.ReadString('PLFontName');
       PGFontName:=Reg.ReadString('PGFontName');
       PFFontName:=Reg.ReadString('PFFontName');
       InvoLbl:=Reg.ReadString('InvoLbl');
       BarNamLbl:=Reg.ReadString('BarNamLbl');
       LastUser:=Reg.ReadString('LastUser');
       Master:=Reg.ReadString('Master');
       Comm:=Reg.ReadString('Com');
       P_Rule:=Reg.ReadString('P_Rule');
       DefaultCurr:=Reg.ReadString('DefCurr');
       DefaultPath:=Reg.ReadString('DefaultAlias');
       DefaultDb:=Reg.ReadString('DefaultDb');
       sOptions:=Reg.ReadString('Options');
       OptDecode;
       Frate:=Reg.ReadInteger('Frate');
       RTax:=StrToFloat(Reg.ReadString('Avarez'));
       Server:=Reg.ReadString('Server');
       NetDir:=Reg.ReadString('NDir');
{       Try
        Session.NetFileDir:=NetDir;
       Except On E:EDBEngineError Do
        If E.Errors[0].ErrorCode = 11265 Then
        If MessageDlg('‘»ﬂÂ Ê’· ‰Ì” .«œ«„Â „ÌœÂÌœø',mtWarning,mbYESNO,-1)=idYes Then
        Begin
         Session.NetFileDir:='C:\';
         DefaultDb:='';
        end Else
         Halt;
       End;   }
       Session.AddPassword(Encrypt('öòìÿŸ‘€',13));
//---------------
       If Frate = 0 Then Frate:=100;
       TopMar:=Reg.ReadInteger('TM');
       ButMar:=Reg.ReadInteger('BM');
       LeftMar:=Reg.ReadInteger('LM');
       RightMar:=Reg.ReadInteger('RM');
       Plength:=Reg.ReadInteger('PL');
       PWidth:=Reg.ReadInteger('PW');
       PrnCnt:=Reg.ReadInteger('PCn');
       PcheqDay:=Reg.ReadInteger('Pdays');
       BKTime:=Reg.ReadInteger('DailyBk');
       Power:=Reg.ReadInteger('Power');
       CurrPath:=DefaultPath;
       CurrDb:=DefaultDb;
       If Power = 0 Then PowerCut :=True Else
       Begin
        Power:=0;
        Reg.WriteInteger('Power',Power);
       End;
      End Else
       ReRead:=RegKeyImport(HKEY_CURRENT_USER,'Par001.Rgs');
     Except
     On ERegistryException Do
       ReRead:=RegKeyImport(HKEY_CURRENT_USER,'Par001.Rgs');
     End;
     Try
      St:='';
//      Reg.RootKey:=HKEY_LOCAL_MACHINE;
//      Reg.OpenKey('\Software\Borland\Database Engine\',False);
//      If KeyGood Then St:=Reg.ReadString('DLLPATH');
      St:='D:\Priv';
      If Not DirectoryExists(St) Then ForceDirectories(St);
      Session.PrivateDir:=St;
     Except
      ShowMessage('«„ﬂ«‰ «— »«ÿ »«  Å«Ìê«Â œ«œÂ ‰Ì” ');
     End;
//     Reg.Free;
     If ReRead Then Goto L1;
     PathFind;
     Fstate:=True;
     Sb1.Panels[1].Text :=LastAccess;
     Sb1.Panels[2].Text:=LastUser;
     Sb1.Panels[3].Text :=P_Rule;
     Sb1.Panels[5].Text :=DefaultPath;
     Sb1.Panels[4].Text :=DefaultDb;
     DecimalSeparator:='.';
     ThousandSeparator:='/';
     CurrencyDecimals:=2;
     CurrencyString:=' ';
     Application.BiDiMode:=bdRightToLeft;
     FileSetAttr(RDir+'\ParAcc.db',faHidden or faSysFile);

end;

Procedure TMain.PathFind;
//Var
//List:TstringList;
begin
{     If (DefaultDb >'') Then
     Begin
       List:=TstringList.Create;
       Session.GetAliasParams(DefaultDb,List);
       DefaultPath:=Copy(List.Strings[0],6,255);
       CurrPath:= DefaultPath;
       List.Free;
     End;}
     If (DefaultDb >'') Then
     Begin
      DefaultPath:=GetCorPath(DefaultDb);
      CurrPath:= DefaultPath;
     End;
end;

Procedure TMain.DailyBackUp(Sender:TObject);
Var
St:String;
begin
     St:='D:\Parsian Backs\';
     If Not DirectoryExists(St) Then CreateDir(St);
     Screen.Cursor:=crSQLWait;
     St:=GetCorPath(CurrDataBase);
     Qu.SQL.Clear;
     Qu.SQL.Add('Backup DataBase '+St);
     Qu.SQL.Add('To Disk =:d');
     Qu.SQL.Add('With Format');
     Qu.Params[0].Value:='D:\Parsian Backs\'+St+IntToStr(DayOfWeek(Date))+'.bak';
     Qu.ExecSQL;
     Qu.SQL.Clear;
     Screen.Cursor:=crDefault;
end;

Procedure TMain.MenuDefine;
Var
Imax,I,Jmax,J,K,Lmax,L,M,Mmax:Integer;
Begin
       Imax:=Main.MMenu.Items.Count-2;
       K:=0;
       For I:=0 To Imax  Do
       Begin
         Main.MMenu.Items[I].Enabled :=Enabl[K];
         K:=K+1;
         Jmax:=Main.MMenu.Items[I].Count-1;
         For J:=0 to Jmax do
         Begin
           Main.MMenu.Items[I].Items[J].Enabled :=Enabl[K];
           K:=K+1;
           Lmax:=Main.MMenu.Items[i].Items[J].Count-1;
           For L:=0 To Lmax Do
           Begin
             Main.MMenu.Items[I].Items[J].Items[L].Enabled:=Enabl[K];
             K:=K+1;
             Mmax:=Main.MMenu.Items[i].Items[J].Items[L].Count-1;
             For M:=0 To Mmax Do
             Begin
               Main.MMenu.Items[I].Items[J].Items[L].Items[M].Enabled:=Enabl[K];
               K:=K+1;
             End;
           End;
         End;
       End;
       Main.Menu :=Main.MMenu;
end;

Procedure TMain.TbDefine;
begin
     Tb.Enabled :=True;
     Tb1.Enabled :=N29.Enabled;
     Tb2.Enabled :=N3.Enabled;
     Tb3.Enabled :=N2.Enabled;
     Tb4.Enabled :=N4.Enabled;
     Tb5.Enabled :=N10.Enabled;
     Tb6.Enabled :=N30.Enabled;
     Tb7.Enabled :=N23.Enabled;
     Tb8.Enabled :=N18.Enabled;
     Tb9.Enabled :=N19.Enabled;
     Tb10.Enabled :=N7.Enabled;
     Tb11.Enabled :=N96.Enabled;
     Tb12.Enabled:=N97.Enabled;
     Tb15.Enabled:=nTol.Enabled;
     Tb13.Enabled:=True;
     Tb14.Enabled:=True;
     Tb16.Enabled:=True;
     Tb17.Enabled:=True;
     Tb18.Enabled:=True;
     Tb19.Enabled:=True;
     Tb20.Enabled:=True;
     ToolButton1.Enabled:=True;
     tbCalc.Enabled:=True;
end;

Procedure TMain.PopDefine;
begin
     N76.Enabled :=N29.Enabled;
     N74.Enabled :=N3.Enabled;
     N75.Enabled :=N2.Enabled;
     N77.Enabled :=N70.Enabled;
     N78.Enabled :=N62.Enabled;
     N82.Enabled :=N10.Enabled;
     N84.Enabled :=N18.Enabled;
     N83.Enabled :=N19.Enabled;
     N87.Enabled :=N7.Enabled;
     N88.Enabled :=N11.Enabled;
     N79.Enabled :=N23.Enabled;
//     N81.Enabled :=N66.Enabled;
end;

Function TMain.CheckLock:Boolean;
Var
Str:String;
I:Integer;
Code:LongInt;
Mini2:TTiny;
begin
     Result:=False;
     Case USB OF
     False:
     Begin
{      sDraw:=ThardLock.create(Owner);
      sDraw.LockClass:=Version4_Class_A;
      sDraw.Check_System_File:=False;
      sDraw.PortNo:=1;
      Code:=0;
      Str:='ìåáÄMÜÉ´úM£Ä˝¶á';
      sDraw.Password :=cCrypt('FIvH8LP0vHhH1IfDRN0WKQ==');// Encrypt(Str,110);
      sDraw.Connected :=True;
      If sDraw.ErrorCode = ErrPortBusy Then Application.Terminate;
      Str:=sDraw.SpecialID;

      For I:=1 To Length(Str) Do Code:=Code+Ord(Str[I]);
      If (Code <> 1323)OR(Encrypt(Str,3) <> '∫°ûôùö‚∞°â°îùö')
        Then Limit_Use('No',-1,20) Else Limit_Use('No',0,0);
      If sDraw.ErrorCode = ErrNone Then Result :=True;
      Str:=sDraw.DataPartition;
      sDraw.Connected:=False;
      Dkey:=StrToIntDef(Copy(Str,1,3),0);
      Try
       FState :=Str[4]='1';
       Alt:= StrToInt(Copy(Str,5,8));
       Min:=StrToInt(Copy(Str,13,8));
      Except
       FState:=False;
      End;
      sDraw.PassWord:='';
      sDraw.Destroy; }
     End;
     True:
     Begin
      Mini2:=TTiny.Create(Owner);
      If Server <> '' Then
      Begin
       Mini2.ServerIP:=Server;
       Mini2.NetWorkINIT:=True
      End Else
       Mini2.Initialize:=True;
      Mini2.UserPassword :=Ccrypt('2muVmVrFZvFm+kO3p7IV5V/z3yif7vo5Pb11lBSBYg==');
      Mini2.ShowTinyInfo:=Not (Mini2.TinyErrCode in [1,2,3]);
      Code:=0;
      Str:=Mini2.SpecialID;
      For I:=1 To Length(Str) Do Code:=Code+Ord(Str[I]);
      If (Code <> 1323)OR(Encrypt(Str,3) <> '∫°ûôùö‚∞°â°îùö')
       Then   Limit_Use('No',-1,20) Else Limit_Use('No',0,0);//Application.Terminate; }
      Result :=Mini2.TinyErrCode=0;
      Str:=Mini2.DataPartition;
      Dkey:=StrToIntDef(Copy(Str,1,3),0);
      Try
       FState :=Str[4]='1';
       Alt:= StrToInt(Copy(Str,5,8));
       Min:=StrToInt(Copy(Str,13,8));
      Except
       FState:=False;
      End;
      Mini2.ShowTinyInfo:=False;
      Mini2.Destroy;
     End;
     End;
end;

Procedure TMain.Start(Sender: TObject);
Var
I,Code:Integer;
Str:String;
FLogo:TFileListBox;
begin
     Timer2.Enabled:=False;
     RDir:=GetCurrentDir;
     RunDir:=RDir+'\Logos\';

     RegRead;

     Session.AddPassword(Encrypt('ÕÀ∆',64));
     IF FileExists('Logo.BMP') Then  imgMain.Picture.Bitmap.LoadFromFile('Logo.BMP');
      DeleteFile('Par001.Rgs');
      RegKeyExport(HKEY_CURRENT_USER,'SoftWare\Hadieh Rayaneh\MParFro','Par001.Rgs');
     Code:=0;
     Str:='ìåáÄMÜÉ´úM£Ä˝¶á';
     Case USB Of
     False:
     Begin
{      Mini:=ThardLock.create(Application);
      Mini.LockClass:=Version4_Class_A;
      Mini.Check_System_File:=False;
      Mini.PortNo:=1;
      Mini.Password :=Encrypt(Str,110);
      Mini.Connected :=True;
      Str:=Mini.SpecialID;
      Fstate:=Encrypt(Str,3) = '∫°ûôùö‚∞°â°îùö';
      Str:=Mini.DataPartition;
      Dkey:=StrToIntDef(Copy(Str,1,3),0);
      Try
       FState :=Str[4]='1';
       Alt:= StrToInt(Copy(Str,5,8));
       Min:=StrToInt(Copy(Str,13,8));
      Except
       FState:=False;
      End;}
     End;
     True:
     Begin
      UMini:=TTiny.Create(Application);
      If Server <> '' Then
      Begin
       UMini.ServerIP:=Server;
       UMini.NetWorkINIT:=True
      End Else
       UMini.Initialize:=True;

      UMini.UserPassword :=Ccrypt('2muVmVrFZvFm+kO3p7IV5V/z3yif7vo5Pb11lBSBYg==');
      UMini.ShowTinyInfo:=Not (UMini.TinyErrCode in [1,2,3]);
      Code:=0;
      Str:=UMini.SpecialID;
      Fstate:=Encrypt(Str,3) = '∫°ûôùö‚∞°â°îùö';
      Str:=UMini.DataPartition;
      Dkey:=StrToIntDef(Copy(Str,1,3),0);
      Try
       FState :=Str[4]='1';
       Alt:= StrToInt(Copy(Str,5,8));
       Min:=StrToInt(Copy(Str,13,8));
      Except
       FState:=False;
      End;
     End;
     End;
     Caption:=Encrypt('AB78yB%È&(#8%',10);
     Application.BiDiMode:=bdRightToLeft;
     Application.Title :=CCrypt('MuC1VDLXI/FotYeM8AQ8');
     hOpenFac:=False;
     Risk:=False;
     hQRef:=0;
     bmpBK:=TBitmap.Create;
     Case USB Of
     False:begin end;
     True:
      If Main.UMini.TinyErrCode <>0 Then ShowMessageFmt(Manga,['251']);
     End;
     IF FileExists(RunDir+'Back.bmp') Then
      bmpBK.LoadFromFile(RunDir+'Back.BMP');
     bmpBK.TransparentColor:=clBtnFace;
     FFont:=SetFont(FFontName);
     GFont:=SetFont(GFontName);
     LFont:=SetFont(LFontName);
     PFFont:=SetFont(PFFontName);
     PGFont:=SetFont(PGFontName);
     PLFont:=SetFont(PLFontName);
     Kala:=TStringList.Create;
     AcList:=TStringList.Create;
     CostList:=TStringList.Create;
     CurrList:=TStringList.Create;
     TodayRates:=TStringList.Create;

     SkinData1.LoadFromCollection(SkinStore,iSKin);
     SkinData1.Active:=sSkin;
     SkinData1.Colors[csButtonFace]:=Color;

     CreatingForm(TFroDM,'FroDM',FroDM);

     uGood:=TGood.Create(Application);
     uGood.CurrDataBase:=CurrDb;
     Case USB Of
     False:
     Begin
      {Mini.Connected:=False;
      Mini.PassWord:='';}
     End;
     True:
     Begin
      UMini.ShowTinyInfo:=False;
      UMini.Initialize:=False;
     End;
     End;
//     If IsServer Then
//     Begin
      DeleteFile('Par002.Rgs');
      RegRootExport(HKEY_LOCAL_MACHINE,'\Software\Borland\Database Engine','Par002.Rgs');
//     End;
     //IF ManageEngine Then Halt; for Paradox
     bmpP1:=TBitmap.Create;
     IF FileExists(RunDir+'PLogo1.bmp') Then bmpP1.LoadFromFile(RunDir+'PLogo1.bmp');
     If Risk Then
      Try
       FRestore.Show;
      Except
       Risk:=False;
      End;
     If DirectoryExists(RunDir) Then
     Begin
      FLogo:=TFileListBox.Create(Self);
      Flogo.Parent:=Self;
      FLogo.Visible:=False;
      FLogo.Directory:=RunDir;
      FLogo.Mask:=GraphicFileMask(TGraphic);
      FLogo.ItemIndex:=0;
      List.Items.Assign(Flogo.Items);
      FLogo.Directory:=RDir;
      FLogo.Destroy;
     End;
     If Not Risk Then Timer2Timer(Sender);
end;
//End Of Privates
procedure TMain.N2Click(Sender: TObject);
begin
     If Frodm.Good.RecordCount = 0 Then
     Begin
      Beep;
      ShowMessage('ﬂ«·« »—«Ì ”Ì” „  ⁄—Ì› ‰‘œÂ «” ');
      //Exit;
     End;
     If hOpenFac Then
      ShowMessage(sFGozConfirm)
     Else
      CreatingForm(TFBvoice,'FBvoice',FBvoice);
end;

procedure TMain.N10Click(Sender: TObject);
begin
//     HardSuccess(Main.Owner);
     CreatingForm(TFJari,'FJari',FJari);
end;

procedure TMain.N43Click(Sender: TObject);
begin
     If Open_Fac Then
     Begin
       Beep;
       ShowMessage(sOpenFac);
       Exit;
     End;
     If MessageDlg(ExitConfirm,mtConfirmation,mbYesNo,0)= idYes Then
     Begin
      MakeBill('”‰œ ⁄„·Ì«  —Ê“«‰Â '+' '+IntToDate(Fardate)+' '+TimeToStr(Now));
      N90Click(Sender);
      Application.Terminate;
     End;
end;

procedure TMain.N3Click(Sender: TObject);
begin
     If hOpenFac Then
      ShowMessage(sFGozConfirm)
     Else
      CreatingForm(TFInvoice,'FInvoice',FInvoice);
end;

procedure TMain.N13Click(Sender: TObject);
begin
        CreatingForm(TCheqSerial,'CheqSerial',CheqSerial);
end;

procedure TMain.N12Click(Sender: TObject);
begin
     CreatingForm(TFTJari,'FTJari',FTJari);
end;

procedure TMain.N18Click(Sender: TObject);
begin
     CreatingForm(TFPcheq,'FPcheq',FPcheq);
end;

procedure TMain.N19Click(Sender: TObject);
begin
     CreatingForm(TFRRes,'FRRes',FRRes);
end;

procedure TMain.N105Click(Sender: TObject);
begin
     CreatingForm(TFRPay,'FRPay',FRPay);
end;

procedure TMain.N132Click(Sender: TObject);
begin
    CreatingForm(TFRKeler,'FRKeler',FRKeler);
end;

procedure TMain.N135Click(Sender: TObject);
begin
     CreatingForm(TFRUKeler,'FRUKeler',FRUKeler);
end;

procedure TMain.N133Click(Sender: TObject);
begin
     CreatingForm(TFRVosol,'FRVosol',FRVosol);
end;

procedure TMain.N134Click(Sender: TObject);
begin
     CreatingForm(TFRRej,'FRRej',FRRej);
end;

procedure TMain.N23Click(Sender: TObject);
begin
     CreatingForm(TFGardesh,'FGardesh',FGardesh);
end;

procedure TMain.N30Click(Sender: TObject);
begin
     CreatingForm(TFAccPayment,'FAccPayment',FAccPayment);
end;

procedure TMain.N44Click(Sender: TObject);
begin
     CreatingForm(TFABillList,'FABillList',FABillList);
end;

procedure TMain.N37Click(Sender: TObject);
begin
     CreatingForm(TFbank,'Fbank',Fbank);
end;

procedure TMain.N38Click(Sender: TObject);
begin
     If Not sModel Then
     Begin
       ShowMessage('”Ì” „ „œ· ﬂ«·« ›⁄«· ‰Ì” ');
       Exit;
     End;
     CreatingForm(TFColor,'FColor',FColor);
end;

procedure TMain.N45Click(Sender: TObject);
begin
     CreatingForm(TAcountRep,'AcountRep',AcountRep);
     Set_Sys_Enviroment;
     Frodm.AcKod.IndexFieldNames:='AccKod';
     AcountRep.QRLabel5.Caption:='·Ì”  Õ”«»Â«';
     AcountRep.Preview;
     AcountRep.Destroy;
end;

procedure TMain.N35Click(Sender: TObject);
begin
     CreatingForm(TFgoods,'Fgoods',Fgoods);
     Fgoods.FormStyle:=fsMDIChild;
end;

procedure TMain.N7Click(Sender: TObject);
begin
     CreatingForm(TFAnb_Moj,'FAnb_Moj',FAnb_Moj);
end;

procedure TMain.Contents1Click(Sender: TObject);
begin
        Application.HelpCommand(Help_contents,0);
end;

procedure TMain.SearchforHelpOn1Click(Sender: TObject);
begin
        Application.HelpCommand(Help_finder,0);
end;

procedure TMain.N64Click(Sender: TObject);
begin
      CreatingForm(TFAnbDat,'FAnbDat',FAnbDat);
end;

procedure TMain.N67Click(Sender: TObject);
begin
     CreatingForm(TFAnbMov,'FAnbMov',FAnbMov);
end;

procedure TMain.N8Click(Sender: TObject);
begin
     CreatingForm(TFKCardex,'FKCardex',FKCardex);
end;

procedure TMain.N69Click(Sender: TObject);
begin
      CreatingForm(TFGoodList,'FGoodList',FGoodList);
end;

procedure TMain.N42Click(Sender: TObject);
begin
     CreatingForm(TFUsers ,'FUsers ',FUsers);
end;


procedure TMain.FormDestroy(Sender: TObject);
Var
Reg:TRegistry;
begin
     Reg:=Tregistry.Create;
     Power:=1;
     LastAccess:=IntToDate(FarDate);
//     OptEncode;
     Try
      Reg.OpenKey('SoftWare\Hadieh Rayaneh\MParFro',True);
      Reg.WriteString('LastUser',CUser.Name);
      Reg.WriteInteger('AdjT',AdjT);
      Reg.WriteString('LastDate',LastAccess);
      Reg.WriteInteger('Power',Power);
    Finally
      Reg.Free;
    End;
//    If IsServer Then
//    Begin
     DeleteFile('Par001.Rgs');
     RegKeyExport(HKEY_CURRENT_USER,'SoftWare\Hadieh Rayaneh\MParFro',RDir+'\Par001.Rgs');
//    End;
end;

procedure TMain.N40Click(Sender: TObject);
begin
     CreatingForm(TFEnviro,'FEnviro',FEnviro);
end;

procedure TMain.N62Click(Sender: TObject);
begin
     If Frodm.Good.RecordCount = 0 Then
     Begin
      Beep;
      ShowMessage('ﬂ«·« »—«Ì ”Ì” „  ⁄—Ì› ‰‘œÂ «” ');
     End;
     If hOpenFac Then
      ShowMessage(sFGozConfirm)
     Else
      CreatingForm(TFRejInvo,'FRejInvo',FRejInvo);
end;

procedure TMain.N70Click(Sender: TObject);
begin
     If Frodm.Good.RecordCount = 0 Then
     Begin
      Beep;
      ShowMessage('ﬂ«·« »—«Ì ”Ì” „  ⁄—Ì› ‰‘œÂ «” ');
      //Exit;
     End;
     If hOpenFac Then
      ShowMessage(sFGozConfirm)
     Else
      CreatingForm(TFRejBvoice,'FRejBvoice',FRejBvoice);
end;

procedure TMain.N73Click(Sender: TObject);
begin
     CreatingForm(TFNewYear,'FNewYear',FNewYear);
end;

procedure TMain.Timer1Timer(Sender: TObject);
begin
{     Mini.Connected:=True;
     If Mini.ErrorCode = ErrPortBusy Then Exit Else CheckLock;}
     Sp13Click(Sender);
     IF Alt = 0 Then Exit;
     If (FarDate > Alt)or(Fardate < Min) Then
     Begin
       Main.Panel1.Align :=alClient;
       Main.Panel1.Visible := True;
     End;
end;

procedure TMain.Timer2Timer(Sender: TObject);
begin
     tmBK.Interval :=BKTime*60*1000;
     tmBk.Enabled :=sBK ;
     CreatingForm(TFUserName,'FUserName',FUserName);
     sNYear:=sOptions[7]='1';
     InvalidateRect(ClientHandle, nil, True);
     Sb1.Panels[1].Text :=IntToDate(Fardate);
     Timer2.Enabled:=True;
     Timer2.OnTimer :=Timer1Timer;
     If BkTime > 0 Then Timer2.Interval :=BKTime*60*1000 Else  Timer2.Interval :=300000;
end;

procedure TMain.Panel1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
       Memo1.Top := Y-Memo1.Height div 2 ;
       Memo1.Left :=X-Memo1.Width div 2 ;
end;

procedure TMain.N4Click(Sender: TObject);
begin
     If Open_Fac Then
     Begin
       ShowMessage(' ›«ﬂ Ê— Â«Ì »«“ —« »»‰œÌœ');
       Exit;
     End Else
      CreatingForm(TFFgoz,'FFgoz',FFgoz);
end;

procedure TMain.N17Click(Sender: TObject);
begin
     CreatingForm(TFCash,'FCash',FCash);
end;

procedure TMain.N6Click(Sender: TObject);
begin
     CreatingForm(TFAcRem,'FAcRem',FAcRem);
end;

procedure TMain.N29Click(Sender: TObject);
begin
     If hOpenFac Then
      ShowMessage(sFGozConfirm)
     Else
      CreatingForm(TFPInvoice,'FPInvoice',FPInvoice);
end;

procedure TMain.N32Click(Sender: TObject);
begin
     CreatingForm(TFRestore,'FRestore',FRestore);
end;

procedure TMain.N33Click(Sender: TObject);
begin
     CreatingForm(TFAcLock,'FAcLock',FAcLock);
end;

procedure TMain.N46Click(Sender: TObject);
begin
     CreatingForm(TFPCheqList,'FPCheqList',FPCheqList);
end;

procedure TMain.N39Click(Sender: TObject);
begin
     CreatingForm(TFDCheqList,'FDCheqList',FDCheqList);
end;

procedure TMain.Succed;
Var
Str,St:String;
UMIMe:TTiny;
begin
     Case USB Of
     False:
     Begin
{      MiMe:=ThardLock.create(Application.Owner);
      MiMe.LockClass:=Version4_Class_A;
      MiMe.Check_System_File:=False;
      MiMe.PortNo:=1;
      MiMe.Password :=Encrypt('©¢ùñcúô¡≤cπñºù',132);
      MiMe.Connected:=True;
      Str:=MiMe.DataPartition;
      St:=MiMe.SpecialID;
      MiMe.Connected:=False;
      Mime.Destroy;  }
     End;
     True:
     Begin
      UMIMe:=TTiny.Create(Owner);
      If Server <> '' Then
      Begin
       UMIMe.ServerIP:=Server;
       UMIMe.NetWorkINIT:=True
      End Else
       UMIMe.Initialize:=True;
      UMIMe.UserPassword :=Ccrypt('2muVmVrFZvFm+kO3p7IV5V/z3yif7vo5Pb11lBSBYg==');
      UMIMe.ShowTinyInfo:=Not (UMIMe.TinyErrCode in [1,2,3]);
      Str:=UMIMe.DataPartition;
      St:=UMiMe.SpecialID;
      UMIMe.ShowTinyInfo:=False;
      UMIMe.Destroy;
     End;
     End;

     Dkey:=StrToIntDef(Copy(Str,1,3),0);
     Try
      FState :=Str[4]='1';
      Fstate:=Fstate and(Encrypt(St,3) = '∫°ûôùö‚∞°â°îùö');
      Alt:= StrToInt(Copy(Str,5,8));
      Min:=StrToInt(Copy(Str,13,8));
     Except
      FState:=False;
     End;
//-----------------------------------------
     IF (Alt = 0) Then Exit;// And(Min =0)
     If (FarDate > Alt)Or(Fardate < Min)Then
     Begin
       Main.Panel1.Align :=alClient;
       Main.Panel1.Visible := True;
       Main.MMenu.Destroy;
     End;
end;

procedure TMain.Timer3Timer(Sender: TObject);
begin
     If Main.MDIChildCount > 0 Then upFlag:=False;
     If (Main.MDIChildCount = 0 ) and Not(upFlag) Then
     Begin
       QuickCloseOpen(hTable);
       upFlag:=True;
     End;
     If upFlag Then coF.Interval :=15000 Else coF.Interval :=5000;
end;

procedure TMain.N48Click(Sender: TObject);
begin
     CreatingForm(TFGProfit,'FGProfit',FGProfit);
end;

procedure TMain.N49Click(Sender: TObject);
begin
     CreatingForm(TFAcTree,'FAcTree',FAcTree);
     FAcTree.FormStyle:=fsMdiChild;
     FAcTree.Visible:=True;
end;

procedure TMain.N34Click(Sender: TObject);
begin
     CreatingForm(TFAcount,'FAcount',FAcount);
end;

procedure TMain.N57Click(Sender: TObject);
begin
     CreatingForm(TFBenef,'FBenef',FBenef);
end;

procedure TMain.N58Click(Sender: TObject);
begin
     CreatingForm(TFTGardesh,'FTGardesh',FTGardesh);
end;

procedure TMain.N61Click(Sender: TObject);
begin
     CreatingForm(TFTaraz,'FTaraz',FTaraz);
end;

procedure TMain.N66Click(Sender: TObject);
begin
     CreatingForm(TFAccPri,'FAccPri',FAccPri);
end;

procedure TMain.N162Click(Sender: TObject);
begin
     Creatingform(TFComb,'FComb',FComb);
end;

procedure TMain.N60Click(Sender: TObject);
begin
     CreatingForm(TFTGardeshArzi,'FTGardeshArzi',FTGardeshArzi);
end;

procedure TMain.N148Click(Sender: TObject);
begin
     CreatingForm(TFGardeshArzi,'FGardeshArzi',FGardeshArzi);
end;

procedure TMain.N11Click(Sender: TObject);
begin
     //CreatingForm(TFGStatue,'FGStatue',FGStatue);
     CreatingForm(TFGoodEst,'FGoodEst',FGoodEst);
end;

procedure TMain.N21Click(Sender: TObject);
begin
     CreatingForm(TFBill,'FBill',FBill);
end;

procedure TMain.N65Click(Sender: TObject);
begin
     If Frodm.Bill.State In [dsEdit,dsInsert] Then
      ShowMessage(sBillSave)
     Else
      CreatingForm(TFBFind,'FBFind',FBFind);
end;

procedure TMain.About2Click(Sender: TObject);
begin
     CreatingForm(TAboutBox,'AboutBox',AboutBox);
     AboutBox.Panel2.Visible:=False;
end;


procedure TMain.N71Click(Sender: TObject);
begin
     CreatingForm(TFGGoz,'FGGoz',FGGoz);
end;

procedure TMain.N72Click(Sender: TObject);
begin
     CreatingForm(TFGBGoz,'FGBGoz',FGBGoz);
end;

procedure TMain.FormDblClick(Sender: TObject);
begin
     Main.Menu:=Main.MainMenu1;
     Main.Menu:=Nil;
     Main.PopupMenu :=nil;
     Tb.Enabled :=False;
     Enteranced;//CreatingForm(TFUserName,'FUserName',FUserName);
end;

procedure TMain.Timer4Timer(Sender: TObject);
begin
     Panel2.Visible :=False;
     Timer4.Enabled :=False;
end;

procedure TMain.Panel2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
     Memo2.Top := Y-Memo1.Height div 2 ;
     Memo2.Left :=X-Memo1.Width div 2 ;
end;

procedure TMain.N90Click(Sender: TObject);
begin
     DailyBackUp(Sender);
{     If DataCheck.AcountingCheck and DataCheck.DepotDataCheck Then
     Begin
      FAnb_Moj.Close;
      DailyBackUp(Sender);
     End Else Begin
      Beep;
      ShowMessage('’Õ  «ÿ·«⁄«   «ÌÌœ ‰‘œ.Å‘ Ì»«‰  ÂÌÂ ‰ŒÊ«Âœ ‰‘œ');
     End; }
end;

procedure TMain.N91Click(Sender: TObject);
begin
     CreatingForm(TFAccMove,'FAccMove',FAccMove);
end;

procedure TMain.N92Click(Sender: TObject);
begin
     CreatingForm(TFJariDel,'FJariDel',FJariDel);
end;

procedure TMain.N93Click(Sender: TObject);
begin
     //CreatingForm(TFCredit,'FCredit',FCredit);
     CreatingForm(TFAccSet,'FAccSet',FAccSet);
end;

procedure TMain.N94Click(Sender: TObject);
begin
     CreatingForm(TFCurrCardex,'FCurrCardex',FCurrCardex);
end;

procedure TMain.N95Click(Sender: TObject);
begin
      CreatingForm(TFHav,'FHav',FHav);
end;

procedure TMain.N141Click(Sender: TObject);
begin
     CreatingForm(TFCar,'FCar',FCar);
end;

procedure TMain.N96Click(Sender: TObject);
begin
     CreatingForm(TFCashBill,'FCashBill',FCashBill);
end;

procedure TMain.N97Click(Sender: TObject);
begin
     CreatingForm(TFCashPay,'FCashPay',FCashPay);
end;

procedure TMain.tmBkTimer(Sender: TObject);
begin
     If DataCheck.AcountingCheck and DataCheck.DepotDataCheck Then
     Begin
      FAnb_Moj.Close;
      MakeBill('”‰œ ⁄„·Ì«  —Ê“«‰Â '+' '+IntToDate(Fardate)+' '+TimeToStr(Now));
      DailyBackUp(Sender);
     End Else  Begin
      ShowMessage('’Õ  «ÿ·«⁄«   «ÌÌœ ‰‘œ.Å‘ Ì»«‰  ÂÌÂ ‰‘œ');
      Beep;
      ShowMessage('”Ì” „  ÂÌÂ Å‘ Ì»«‰ ŒÊœﬂ«— €Ì— ›⁄«· «” ');
      tmBK.Enabled :=False;
     End;
     tmBK.Interval :=BKTime*60*1000;
     Main.SB1.Color :=clBtnFace;
end;

procedure TMain.N98Click(Sender: TObject);
begin
     IF UserCount > 1 Then
     Begin
      MessageBeep(1);
      ShowMessage('»Ì‘ «“ Ìﬂ ﬂ«—»— œ— Õ«· «” ›«œÂ «“ ‰—„ «›“«— „Ì »«‘œ'
      +#13+'«„ò«‰ »«“”«“Ì «Ì‰œò” Â« ‰„Ì »«‘œ');
      Exit;
     End;
     CreatingForm(TDataCheck,'DataCheck',DataCheck);
end;

procedure TMain.N41Click(Sender: TObject);
begin
     CreatingForm(TFVisit,'FVisit',FVisit);
end;

procedure TMain.N100Click(Sender: TObject);
begin
     CreatingForm(TFVisitAct,'FVisitAct',FVisitAct);
end;

procedure TMain.Button1Click(Sender: TObject);
Var
Db:TDataBase;
Table:TTable;
I,J,K:Integer;
St:String;
begin
      List.Items.Clear;
      St:='(';
      J:=0;
      For I:=0 To FroDM.ComponentCount-1 Do
      Begin
        If FroDM.Components[I] Is TDataBase Then
        Begin
         Db:=FroDM.Components[I] As TDataBase;
         List.Items.Add(Db.Name+'='+IntToStr(I));
        End;
        If FroDM.Components[I] Is TTable Then
        Begin
          Table:=FroDM.Components[I] As TTable;
          K:=-1;
          Repeat
           K:=K+1;
          Until (I=hTable[K]) Or (K >Length(hTable));
          If K <=Length(hTable) Then
           List.Items.Add(IntToStr(J)+'--'+Table.Name+'='+IntToStr(I)+'.........hTable='+IntToStr(K))
          Else
           List.Items.Add(IntToStr(J)+'--'+Table.Name+'='+IntToStr(I));
          J:=J+1;
          St:=St+IntToStr(I)+',';
        End;
      End;
      St:=St+')';
      List.Items.Add(St);
     
      List.Items.SaveToFile('hTable.txt');
end;

procedure TMain.N101Click(Sender: TObject);
begin
     Main.Menu:=Nil;
     If (Frodm.banks.RecordCount = 0) Then
     Begin
       CreatingForm(TFbank,'Fbank',Fbank);
       Exit;
     End;
     If (Frodm.JariNam.RecordCount = 0) Then
     Begin
       CreatingForm(TFTJari,'FTJari',FTJari);
       Exit;
     End;
     Frodm.AnbDat.Open;
     If Frodm.AnbDat.RecordCount = 0 Then
     Begin
       CreatingForm(TFAnbDat,'FAnbDat',FAnbDat);
       Exit;
     End;
     Frodm.AnbDat.Close;
     CreatingForm(TFbegAc,'FbegAc',FbegAc);
     If Frodm.Acbill.RecordCount = 0 Then
      CreatingForm(TFAcount,'FAcount',FAcount);
end;

procedure TMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caNone;
     IF Open_Fac Then
     Begin
       ShowMessage(SaveAllConfirm);
       Action:=caNone;
     End Else
     If MessageDlg(ExitConfirm,mtWarning,mbYesNo,0)= idYes Then
     Begin
      Action :=caFree;
      If CUser.Boss Then
       If MessageDlg(BackupConfirm,mtConfirmation,mbYesNo,0)=idYes Then
        DailyBackUp(Sender);
     End;
end;

procedure TMain.N103Click(Sender: TObject);
begin
     CreatingForm(TFAcSearch,'FAcSearch',FAcSearch);
     FAcSearch.FormStyle:=fsMdiChild;
     FAcSearch.Visible:=True;
end;

procedure TMain.N104Click(Sender: TObject);
begin
     CreatingForm(TFGFind,'FGFind',FGFind);
     FGFind.FormStyle:=fsMdiChild;
     FGFind.Visible:=True;
end;

procedure TMain.sp13Click(Sender: TObject);
Var
pPic:TPicture;
begin
     If List.Items.Count = 0 Then Exit;
     pPic:=TPicture.Create;
     If List.ItemIndex < List.Items.Count-1 Then
      List.ItemIndex:=List.ItemIndex+1
     Else
      List.ItemIndex:=0;
     pPic.LoadFromFile(RunDir+List.Items[List.ItemIndex] );
     imgMain.Picture.Bitmap.Assign(pPic.Graphic);
     InvalidateRect(ClientHandle, nil, True);
     pPic.Destroy;
end;

procedure TMain.Sp14Click(Sender: TObject);
Var
pPic:TPicture;
begin
     If List.Items.Count = 0 Then Exit;
     pPic:=TPicture.Create;
     If List.ItemIndex >0Then
      List.ItemIndex:=List.ItemIndex-1
     Else
      List.ItemIndex:=List.Items.Count-1;
     pPic.LoadFromFile(RunDir+List.Items[List.ItemIndex] );
     imgMain.Picture.Bitmap.Assign(pPic.Graphic);
     InvalidateRect(ClientHandle, nil, True);
     pPic.Destroy;
end;

procedure TMain.N106Click(Sender: TObject);
begin
     CreatingForm(TFDaily,'FDaily',FDaily);
end;

procedure TMain.N107Click(Sender: TObject);
begin
     CreatingForm(TFCustBill,'FCustBill',FCustBill);
end;

procedure TMain.N204Click(Sender: TObject);
begin
     CreatingForm(TFVariance,'FVariance',FVariance);
end;

procedure TMain.N108Click(Sender: TObject);
begin
     CreatingForm(TFChTaraz,'FChTaraz',FChTaraz);
end;

procedure TMain.N109Click(Sender: TObject);
begin
     CreatingForm(TFReBill,'FReBill',FReBill);
end;

procedure TMain.N111Click(Sender: TObject);
begin
     If Frodm.Bill.State In[dsEdit,dsInsert] Then
      ShowMessage(sBillSave)
     Else
      CreatingForm(TFArsh,'FArsh',FArsh);
end;

procedure TMain.N173Click(Sender: TObject);
begin
     CreatingForm(TFAcpArsh,'FAcpArsh',FAcpArsh);
end;

procedure TMain.N112Click(Sender: TObject);
begin
     If Frodm.Invo.State In [dsEdit,dsInsert] Then
      ShowMessage(sInvSave)
     Else
      CreatingForm(TFInvArsh,'FInvArsh',FInvArsh);
end;

procedure TMain.N114Click(Sender: TObject);
begin
     If Frodm.RejInvo.State In [dsEdit,dsInsert] Then
      ShowMessage(sInvSave)
     Else
      CreatingForm(TFRInvArsh,'FRInvArsh',FRInvArsh);
end;

procedure TMain.N113Click(Sender: TObject);
begin
     If Frodm.Binvo.State In [dsEdit,dsInsert] Then
      ShowMessage(sInvSave)
     Else
      CreatingForm(TFBInvArsh,'FBInvArsh',FBInvArsh);
end;

procedure TMain.N115Click(Sender: TObject);
begin
     If Frodm.RejBinvo.State In [dsEdit,dsInsert] Then
      ShowMessage(sInvSave)
     Else
      CreatingForm(TFRBinvArsh,'FRBinvArsh',FRBinvArsh);
end;

procedure TMain.N56Click(Sender: TObject);
begin
     CreatingForm(TFSaf,'FSaf',FSaf);
end;

procedure TMain.N116Click(Sender: TObject);
begin
     CreatingForm(TFSafList,'FSafList',FSafList);
end;

procedure TMain.N117Click(Sender: TObject);
begin
     CreatingForm(TFAnbP,'FAnbP',FAnbP);
end;

procedure TMain.N118Click(Sender: TObject);
begin
     CreatingForm(TFChCor,'FChCor',FChCor);
end;

procedure TMain.N119Click(Sender: TObject);
begin
     CreatingForm(TFSolds,'FSolds',FSolds);
end;

procedure TMain.N120Click(Sender: TObject);
begin
     CreatingForm(TFBuys,'FBuys',FBuys);
end;

procedure TMain.N122Click(Sender: TObject);
begin
     CreatingForm(TFCustEst,'FCustEst',FCustEst);
end;

procedure TMain.N123Click(Sender: TObject);
begin
     CreatingForm(TFGAmar,'FGAmar',FGAmar);
end;

procedure TMain.N125Click(Sender: TObject);
begin
     ppDesign.Show;
end;

procedure TMain.N22Click(Sender: TObject);
begin
     CreatingForm(TFCorp,'FCorp',FCorp);
     FCorp.lim:=2;
     FCorp.FormStyle:=fsMDIChild;
end;

procedure TMain.tbCalcClick(Sender: TObject);
begin
     WinExec(Pchar('Calc.Exe'),SW_MAXIMIZE);
end;

procedure TMain.Tb16Click(Sender: TObject);
begin
     Cascade;
end;

procedure TMain.Tb17Click(Sender: TObject);
begin
     Tile;
end;

procedure TMain.nTolClick(Sender: TObject);
Var
FTol:TFTolid;
begin
     FTol:=TFTolid.Create(Application);
     With FTol Do
     Try
      FormStyle:=fsNormal;
      BorderStyle:=bsSizeAble;
      Position:=poMainFormCenter;
      ShowModal;
     Finally
      Free;
     End;
end;

procedure TMain.N121Click(Sender: TObject);
begin
     //CreatingForm(TFTols,'FTols',FTols);
     CreatingForm(TFGoodBenef,'FGoodBenef',FGoodBenef)
end;

procedure TMain.N53Click(Sender: TObject);
begin
     //CreatingForm(TFBuyCost,'FBuyCost',FBuyCost);
end;

procedure TMain.N54Click(Sender: TObject);
begin
     CDB.RootDir:=CurrPath;
     CDB.AddFolder(CurrPath);
     CDB.StartBurn;
end;

procedure TMain.CDBBurnDone(iResult: Integer);
begin
     Screen.Cursor:=crDefault;
     Application.Terminate;
end;

procedure TMain.Tb19Click(Sender: TObject);
begin
     If MDIChildCount = 0 Then Exit;
     If Main.ActiveMDIChild.ActiveControl Is TDBGrid Then
     GridExport(ActiveMDIChild.ActiveControl as TDBGrid);
end;

procedure TMain.N126Click(Sender: TObject);
begin
     CreatingForm(TFDBenef,'FDBenef',FDBenef);
end;

procedure TMain.N52Click(Sender: TObject);
begin
     If MessageDlg('ò‰ —·  ⁄œ«œÌ „ÊÃÊœÌ Â« ’Ê—  êÌ—œø',mtInformation,mbYESNO,0)=idYes Then
      N98Click(Sender);
     CreatingForm(TFPrices,'FPrices',FPrices);
end;

procedure TMain.N127Click(Sender: TObject);
begin
     CreatingForm(TFMArsh,'FMArsh',FMArsh);
end;

procedure TMain.ToolButton1Click(Sender: TObject);
Var
I:Integer;
Form:TForm;
Bmp:TBitmap;
jpg:TJpegImage;
R,R2:TRect;
begin
     Bmp:=TBitmap.Create;
     jpg:=TJpegImage.create;
     For I:=0 To Main.MDIChildCount-1 Do
     Begin
      Form:=Main.MDIChildren[I];
      bmp.Width:=Form.Width;//Client
      bmp.Height:=Form.Height;
      //ShowMessage(IntToStr(DifW));

      R:=Rect(1+Form.Left,Form.Top+27,3+Form.Width+Form.Left,Form.Height+Form.Top+29);
      R2:=Rect(0,0,Form.Width,Form.HeighT);
      bmp.Canvas.CopyRect(R2,Main.Canvas,R);
      //bmp.SaveToFile(RDir+'\bmp\'+Form.Name+'.bmp');
      Jpg.Assign(Bmp);
      Jpg.SaveToFile(RDir+'\Jpg\'+Form.Name+'.Jpg');
     End;
     bmp.Free;
end;

procedure TMain.N129Click(Sender: TObject);
begin
     CreatingForm(TFGChart,'FGChart',FGChart);
end;

procedure TMain.N130Click(Sender: TObject);
begin
     CreatingForm(TFSerial,'FSerial',FSerial);
end;

procedure TMain.N137Click(Sender: TObject);
begin
     CreatingForm(TFCost,'FCost',FCost);
end;

procedure TMain.N140Click(Sender: TObject);
begin
     CreatingForm(TFCperm,'FCperm',FCperm);
end;

procedure TMain.N142Click(Sender: TObject);
begin
     CreatingForm(TFTip,'FTip',FTip);
end;

procedure TMain.N144Click(Sender: TObject);
begin
     CreatingForm(TFCTip,'FCTip',FCTip);
end;

procedure TMain.N145Click(Sender: TObject);
begin
     CreatingForm(TFCrate,'FCrate',FCrate);
end;

procedure TMain.N146Click(Sender: TObject);
begin
     CreatingForm(TFCashier,'FCashier',FCashier);
end;

procedure TMain.N147Click(Sender: TObject);
begin
     CreatingForm(TFJariEdit,'FJariEdit',FJariEdit);
end;

procedure TMain.N149Click(Sender: TObject);
begin
     CreatingForm(TFMakeBill,'FMakeBill',FMakeBill);
end;

procedure TMain.N152Click(Sender: TObject);
begin
     Creatingform(TFRMArsh,'FRMArsh',FRMArsh);
end;

procedure TMain.N153Click(Sender: TObject);
begin
     Creatingform(TFPMArsh,'FPMArsh',FPMArsh);
end;

procedure TMain.N154Click(Sender: TObject);
begin
     Creatingform(TFNFArsh,'FNFArsh',FNFArsh);
end;

procedure TMain.N155Click(Sender: TObject);
begin
     Creatingform(TFBHArsh,'FBHArsh',FBHArsh);
end;

procedure TMain.N156Click(Sender: TObject);
begin
     Creatingform(TFRResArsh,'FRResArsh',FRResArsh);
end;

procedure TMain.Tb20Click(Sender: TObject);
begin
     Creatingform(TFDConvert,'FDConvert',FDConvert);
end;


procedure TMain.N27Click(Sender: TObject);
begin
     CreatingForm(TFRemit,'FRemit',FRemit);
end;

procedure TMain.N25Click(Sender: TObject);
begin
     CreatingForm(TFExchange,'FExchange',FExchange);
end;

procedure TMain.N169Click(Sender: TObject);
begin
     CreatingForm(TFRemArsh,'FRemArsh',FRemArsh);
end;

procedure TMain.N170Click(Sender: TObject);
begin
     CreatingForm(TFEXArsh,'FEXArsh',FEXArsh);
end;

procedure TMain.N171Click(Sender: TObject);
begin
     CreatingForm(TFExpense,'FExpense',FExpense);
end;

procedure TMain.N172Click(Sender: TObject);
begin
     CreatingForm(TFExpArsh,'FExpArsh',FExpArsh);
end;



procedure TMain.N175Click(Sender: TObject);
begin
     CreatingForm(TFDHav,'FDHav',FDHav);
end;

procedure TMain.N47Click(Sender: TObject);
begin
      CreatingForm(TFDout,'FDout',FDout);
end;

procedure TMain.N177Click(Sender: TObject);
begin
     CreatingForm(TFDRes,'FDRes',FDRes);
end;

procedure TMain.N178Click(Sender: TObject);
begin
     Creatingform(TFDIRej,'FDIRej',FDIRej);
end;

procedure TMain.N179Click(Sender: TObject);
begin
     CreatingForm(TFDORej,'FDORej',FDORej);
end;

procedure TMain.N183Click(Sender: TObject);
begin
     CreatingForm(TFShList,'FShList',FShList);
end;

procedure TMain.N184Click(Sender: TObject);
begin
     CreatingForm(TFAnbEst,'FAnbEst',FAnbEst);
end;

procedure TMain.N185Click(Sender: TObject);
begin
     CreatingForm(TFSef,'FSef',FSef);
end;

procedure TMain.N189Click(Sender: TObject);
begin
     CreatingForm(TFDhavArsh,'FDhavArsh',FDhavArsh);
end;

procedure TMain.N199Click(Sender: TObject);
begin
     CreatingForm(TFDoutArsh,'FDoutArsh',FDoutArsh);
end;

procedure TMain.N190Click(Sender: TObject);
begin
     CreatingForm(TFGFormula,'FGFormula',FGFormula)
end;

procedure TMain.N192Click(Sender: TObject);
begin
     CreatingForm(TFSChart,'FSChart',FSChart);
end;

procedure TMain.N193Click(Sender: TObject);
begin
     CreatingForm(TFMChart,'FMChart',FMChart);
end;

procedure TMain.N194Click(Sender: TObject);
begin
     CreatingForm(TFCChart,'FCChart',FCChart);
end;

procedure TMain.N196Click(Sender: TObject);
begin
     CreatingForm(TFSGChart,'FSGChart',FSGChart);
end;

procedure TMain.N197Click(Sender: TObject);
begin
     CreatingForm(TFMGChart,'FMGChart',FMGChart);
end;

procedure TMain.N198Click(Sender: TObject);
begin
     CreatingForm(TFBChart,'FBChart',FBChart);
end;

procedure TMain.N158Click(Sender: TObject);
begin
     Creatingform(TFRkelArsh,'FRkelArsh',FRkelArsh);
end;

procedure TMain.N159Click(Sender: TObject);
begin
     Creatingform(TFRVosArsh,'FRVosArsh',FRVosArsh);
end;

procedure TMain.N160Click(Sender: TObject);
begin
     Creatingform(TFRUkelArsh,'FRUkelArsh',FRUkelArsh);
end;

procedure TMain.N161Click(Sender: TObject);
begin
     Creatingform(TFRRejArsh,'FRRejArsh',FRRejArsh);
end;

procedure TMain.N200Click(Sender: TObject);
begin
     CreatingForm(TFDOutEst,'FDOutEst',FDOutEst);
end;

procedure TMain.N186Click(Sender: TObject);
begin
     CreatingForm(TFHavEst,'FHavEst',FHavEst);
end;

procedure TMain.N124Click(Sender: TObject);
begin
     CreatingForm(TFDepotDaily,'FDepotDaily',FDepotDaily);
end;

procedure TMain.N203Click(Sender: TObject);
begin
     CreatingForm(TFAnb_Check,'FAnb_Check',FAnb_Check);
end;



end.

