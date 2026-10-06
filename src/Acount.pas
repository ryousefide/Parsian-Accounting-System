{ Turbo Pascal Unit:  Acount.pas                  }
{                                                 }
{ This is an interface unit containing integer    }
{ mappings of Topic IDs (names of Help            }
{ Topics) which are located in Acount.rtf     }
{                                                 }
{ This file is re-written by RoboHELP           }
{ whenever Acount.rtf is saved.   	          }
{                                                 }
{ However, the numeric values stored in           }
{ Acount.hh are the 'master values' and if you    }
{ modify the value in Acount.hh and then          }
{ save the Acount.rtf again, this file will }
{ reflect the changed values.                     }
{                                                 }

Unit Acount;
   Interface
   Const
	_Defines = 501;
	_AcList1 = 502;
	_Good = 503;
	_Color = 510;
	__AnbDat = 504;
	__Banks = 511;
	__Jari = 512;
	__Cheq = 513;
	__AccKoding = 514;
	Implementation
	end.
