unit ProVar;
interface
Uses Graphics, Classes, DbTables,ExtCtrls;

Type TQDbParam =record
 Ident:String;
 Server:String;
 DbName:String;
 User:String;
 PassWord:String;
end;

Type TFTipCode = record
 Beskod:Real;
 Behkod:Real;
end;

Type TUsers =record
 Id:Integer;
 Name:String;
 Boss:Boolean;
 Master:Boolean;
 Local:Boolean;
 AcList:TStringList;
 ArziAcList:TStringList;
 Ac_Count:Integer;
 CurrList:TstringList;
 CurrField:String;
 CentField:String;
 CashierField:String;
 AcField:String;
 Lang:String;
 CentFilter:String;
 CashFilter:String;
 AcFilter:String;
end;

type
  TColumnWidthHelper = record
    Index : integer;
    MaxWidth : integer;
  end;

Const
dpIn = 1;
dpOut= -1;

hTable:Array[0..82] of Integer = (0,23,48,69,74,101,124,145,168,197,207,217,
                                  233,239,258,274,280,282,292,313,335,354,376,
                                  394,417,428,435,456,467,471,480,490,504,522,
                                  540,558,577,587,597,604,623,637,646,660,670,
                                  684,693,707,718,732,742,756,765,784,790,798,
                                  814,818,832,846,860,874,891,908,925,950,956,
                                  961,967,986,993,1000,1011,1032,1053,1069,1082,
                                  1096,1108,1119,1126,1144,1221);
mTable:Array[0..10] of Integer = (48,124,207,417,428,435,456,480,798,956,1096);


{                                  0,22,47,67,71,97,120,141,164,192,201,210,
                                  225,231,250,266,271,273,283,303,325,343,
                                  365,382,405,415,422,442,453,457,465,474,
                                  487,504,521,538,556,565,574,580,598,611,
                                  619,632,641,654,662,675,684,697,706,719,
                                  727,746,751,759,774,778,791,804,817,830,
                                  847,864,881,906,912,917,923,941,948,955,
                                  966,987,1008,1024,1037,1051,1063,1074,
                                  1081,1099,1176);
mTable:Array[0..10] of Integer = (47,120,201,405,415,422,442,465,759,912,1051);}



ACond='UseKod = 1 and Not KDas = 1 and (AccKod Between 4000000000 and 5000000000) '+
      'Or (AccKod Between 6000000000 and 7000000000) Or (AccKod >9000000000) ';
BCond='UseKod = 1 and (AccKod Between 4000000000 and 5000000000) '+
      'Or (AccKod Between 6000000000 and 7000000000) Or (AccKod >10000000000) ';
CCond=' UseKod = 1 and Not KDas = 1';

VarRef: Array [0..21,0..1] of String=(
('CARMOZ','À»  ﬂ«—„“œÂ«Ì »«‰ﬂÌ'),
('CASH','›Ì‘ ‰ﬁœÌ Ê«—Ì“ »Â Õ”«» Ã«—Ì'),
('CF','œ—Ì«›  ‰ﬁœÌ ›«ﬂ Ê— ›—Ê‘'),
('CF2','œ—Ì«›  ”‰œÌ ›«ﬂ Ê— ›—Ê‘'),
('CHREJECT','»—ê‘  çﬂ'),
('DCH','œ—Ì«›  çﬂ «‘Œ«’'),
('DF',' Œ›Ì› ›«ﬂ Ê— ›—Ê‘'),
('GF','›—Ê‘ ﬂ«·«'),
('JK','Ã„⁄ ﬂ· ›«ﬂ Ê— ›—Ê‘'),
('JPASS','Å«” çﬂ «“ Ã«—Ì Â«'),
('KDF',' Œ›Ì› Œ—Ìœ'),
('KELER','«”‰«œœ—Ã—Ì«‰ Ê’Ê·-ﬂ·—'),
('KJK','Ã„⁄ ﬂ· ›«ﬂ Ê— Œ—Ìœ'),
('KNF','Œ«·’ Œ—Ìœ'),
('NF','Œ«·’ ›«ﬂ Ê— ›—Ê‘'),
('PCH','’œÊ— çﬂ'),
('RF','„’—› ò«·«'),
('RGF','„—ÃÊ⁄Ì ﬂ«·«Ì ›—ÊŒ Â ‘œÂ'),
('RJK','Ã„⁄ ﬂ· „—ÃÊ⁄Ì ›—Ê‘'),
('RKJK','Ã„⁄ „—ÃÊ⁄Ì Œ—Ìœ'),
('VCD','Ê’Ê· çﬂ œ—Ì«› Ì'),
('VCD_REJECT','«—”«· çﬂ »—ê‘ Ì »Â ﬂ·—'));

Var
//---------------Program Enviroment Var ----------------
Dkey,FRate:Integer;
RTax:Real;
FState,Boss,PowerCut,Risk,LCK,USB:Boolean;
TopMar,ButMar:Integer;
LeftMar,RightMar:Integer;
PLength,PWidth:Integer;
BkTime,Power:Integer;
HQRef:Integer;
PrnCnt:Integer;
RDir:String;
AdjT,PTip:Integer;
LFont,FFont,GFont:TFont;
PLFont,PFFont,PGFont:TFont;
coF,Timer4:TTimer;
LFontName:String;
GFontName:String;
FFontName:String;
PLFontName:String;
PGFontName:String;
PFFontName:String;
InvoLbl:String;
BarNamLbl:String;
LastUser:String;
CUser:TUsers;
Master:String;
Comm:String;
LastAccess:String;
DefaultPath:String;
DefaultDb:String;
CurrPath:String;
CurrDb:String;
CurrDataBase:String;
P_Rule:String;
NetDir:String;
Server:String;
StDate,EnDate:String[10];
DefaultCurr:String;
Benefit:Currency;
Sarmayeh:Currency;
AcRadif:Integer;
bmpP1,bmpBK:TBitMap;
hOpenFac:Boolean;
GWidth:Integer;
FtipCode:TFTipCode;
//-------------Filling List Variable-----
Enabl:Array[0..254] Of Boolean;
AcList:TStringList;
Kala:TStringList;
CostList:TStringList;
CurrList:TStringList;
TodayRates:TStringList;
Qu:TQuery;
QDb:TQDbParam;
FindCode:Real;
//--------------SetUp Parametr----------
sAKod,sPerc,sGene:Boolean;
sRem,sFrem,sDcheq,sPcheq:Boolean;
sModel,sNYear,sBk:Boolean;
sABill,sBill,sFac:Boolean;
sNet,sPerm,sRej,sDp:Boolean;
sBTip,sCent,sSkin:Boolean;
sOptions:String[22];
PcheqDay,iSkin:Integer;
iBillTip:Integer;
Initiiates:String;
Hmu:LongWord;

//---- Default Accounting Kod
Def_BesKod,Def_BedKod:Real;
Def_Keler,Def_Vosol,Def_Reject:Real;
Def_Cheq,Def_Reject_Bes:Real;
Def_Exh:Real;
Def_Car_Bed,Def_Car_Bes:Real;
//---Messages Variabls
Manga:String;
DelConfirm:String;
SaveConfirm:String;
ExitConfirm:String;
BackupConfirm:String;
sOpenFac:String;
sFGozConfirm:String;
sInvSave:String;
sBillSave:String;
SaveAllConfirm:String;
sDr:String;
sCr:String;
sDouble:String;
Const
sLocked='”‰œ Ì« „” ‰œ „—»ÊÿÂ ﬁ›· «”  '+chr(13)+'«„ò«‰ ÊÌ—«Ì‘ ‰„Ì »«‘œ';

implementation

begin

end.
