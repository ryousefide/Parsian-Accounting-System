{ Turbo Pascal Unit:  ParFrohlp.pas                  }
{                                                 }
{ This is an interface unit containing integer    }
{ mappings of Topic IDs (names of Help            }
{ Topics) which are located in ParFrohlp.rtf     }
{                                                 }
{ This file is re-written by RoboHELP           }
{ whenever ParFrohlp.rtf is saved.   	          }
{                                                 }
{ However, the numeric values stored in           }
{ ParFrohlp.hh are the 'master values' and if you    }
{ modify the value in ParFrohlp.hh and then          }
{ save the ParFrohlp.rtf again, this file will }
{ reflect the changed values.                     }
{                                                 }

Unit ParFrohlp;
   Interface
   Const
	Welcome = 1033;
	__Pinvo = 1035;
	__Invo = 1036;
	__RejInvo = 1037;
	__Binvo = 1038;
	__RejBinvo = 1039;
	_AcPerm = 1046;
	__FGoz = 1047;
	__BJari = 1048;
	__Cash = 1049;
	__JHav = 1050;
	__Keler = 1051;
	__Pcheq = 1052;
	__DCheq = 1053;
	__FacRem = 1054;
	__AcBill = 1055;
	__Cpay = 1056;
	__Pcash = 1057;
	__BillFind = 1058;
	__AcMove = 1059;
	__Bill = 1060;
	__Hav = 1061;
	__GMove = 1062;
	__CurrCardex = 1063;
	__KCardex = 1064;
	__AnbMoj = 1065;
	__GList = 1066;
	__GStatue = 1067;
	__GGoz = 1068;
	__GbGoz = 1069;
	__GProfit = 1070;
	__acGardesh = 1071;
	__AcRem = 1072;
	__BillList = 1073;
	__AcTree = 1074;
	__AcDiag = 1075;
	__Taraz = 1076;
	__DcheqList = 1077;
	__PcheqList = 1078;
	__Restore = 1079;
	__backup = 1080;
	__NewYear = 1081;
	__DataChek = 1082;
	__Users = 1083;
	__Enviro = 1084;
	Implementation
	end.
