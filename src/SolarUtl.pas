{------------------------------------------------------------------------------}
{                                                                              }
{  SolarUtl - Solar Date Utility Functions                                     }
{  Copyright(C) 1995-2003 Kambiz R. Khojasteh, all rights reserved.            }
{                                                                              }
{  kambiz@delphiarea.com                                                       }
{  http://www.delphiarea.com                                                   }
{                                                                              }
{  This unit is provided "AS IS" without any warranty of any  kind, either     }
{  express or implied. The entire  risk as to the quality  and performance     }
{  of the functions provided in this  unit are with you. The author is NOT     }
{  liable for  any DAMAGES resulting from the use  and misuse of the unit,     }
{  especially he is NOT liable for DAMAGES that were caused BY ANY VERSION     }
{  WHICH HAS NOT BEEN PROGRAMMED BY THE AUTHOR HIMSELF.                        }
{                                                                              }
{------------------------------------------------------------------------------}

{------------------------------------------------------------------------------}
{                    F U N C T I O N    R E F E R E N C E                      }
{------------------------------------------------------------------------------}
{                                                                              }
{  TDateKind = (dkSolar, dkGregorian);                                         }
{                                                                              }
{  This data type is the type of the first parameter of those functions,       }
{  which can work on both of Solar and Gregorian dates to identify the         }
{  desire calender system.                                                     }
{                                                                              }
{------------------------------------------------------------------------------}
{                                                                              }
{  function IsLeapYear(DateKind: TDateKind; Year: Word): Boolean;              }
{                                                                              }
{  Returns true when the specified Year is a leap year (Kabiseh).              }
{                                                                              }
{  Example:                                                                    }
{                                                                              }
{     if IsLeapYear(dkSolar, 1375) then                                        }
{       ShowMessage('1375 is leap year');                                      }
{                                                                              }
{------------------------------------------------------------------------------}
{                                                                              }
{  function DaysOfMonth(DateKind: TDateKind; Year, Month: Word): Word;         }
{                                                                              }
{  Returns the number of days in the specified month. If the given date        }
{  is not valid, it returns zero.                                              }
{                                                                              }
{  Example:                                                                    }
{                                                                              }
{     if DaysOfMonth(dkSolar, 1375, 12) = 30 then                              }
{       ShowMessage('Esfand 1375 has 30 days, so it is leap year');            }
{                                                                              }
{------------------------------------------------------------------------------}
{                                                                              }
{  fnction IsDateValid(DateKind: TDateKind; Year, Month, Day: Word): Boolean;  }
{                                                                              }
{  Returns true if the specified date is a valid date.                         }
{                                                                              }
{  Example:                                                                    }
{                                                                              }
{     if IsDateValid((dkSolar, 1375, 12, 30) then                              }
{       ShowMessage('30 Esfand 1375 is valid, so it is leap year');            }
{                                                                              }
{------------------------------------------------------------------------------}
{                                                                              }
{  DaysToDate(DateKind: TDateKind; Year, Month, Day: Word): Word;              }
{                                                                              }
{  Returns the number of days since the first day of the year until the        }
{  specified date. If the given date is not valid, it returns zero.            }
{                                                                              }
{  Example:                                                                    }
{                                                                              }
{     ShowMessage(Format('1349/2/8 is the %dth day of 1349',                   }
{                        [DaysToDate(dkSolar, 1349, 2, 8)]));                  }
{                                                                              }
{------------------------------------------------------------------------------}
{                                                                              }
{  function DateOfDay(DateKind: TDateKind; Days, Year: Word;                   }
{                     var Month, Day: Word): Boolean;                          }
{                                                                              }
{                                                                              }
{  Gives the number of days since the first day of the specified year and      }
{  sets the Month and Day parameter to the proper values. If the date is a     }
{  valid date, the function returns true, otherwise false will be returned.    }
{                                                                              }
{  Example:                                                                    }
{                                                                              }
{     DateOfDay(dkSolar, 39, 1349, Month, Day);                                }
{     ShowMessage(Format('39th day of 1349 is 1349/%d/%d', [Month, Day]));     }
{                                                                              }
{------------------------------------------------------------------------------}
{                                                                              }
{  function GregorianToSolar(var Year, Month, Day: Word): Boolean;             }
{                                                                              }
{  Converts the passed components of the Gregorian date to the appropriate     }
{  Solar values. In case of any error, it returns false.                       }
{                                                                              }
{  Example:                                                                    }
{                                                                              }
{    Year := 1970;                                                             }
{    Month := 4;                                                               }
{    Day := 28;                                                                }
{    GregorianToSolar(Year, Month, Day);                                       }
{    ShowMessage(Format('1970/4/28 Gregorian = %d/%d/%d Solar',                }
{                       [Year, Month, Day]));                                  }
{                                                                              }
{------------------------------------------------------------------------------}
{                                                                              }
{  function SolarToGregorian(var Year, Month, Day: Word): Boolean;             }
{                                                                              }
{  Converts the passed components of the Solar date to the appropriate         }
{  Gregorian values. In case of any error, it returns false.                   }
{                                                                              }
{  Example:                                                                    }
{                                                                              }
{    Year := 1349;                                                             }
{    Month := 2;                                                               }
{    Day := 8;                                                                 }
{    GregorianToSolar(Year, Month, Day);                                       }
{    ShowMessage(Format('1349/2/8 Solar = %d/%d/%d Gregorian',                 }
{                       [Year, Month, Day]));                                  }
{                                                                              }
{------------------------------------------------------------------------------}
{                                                                              }
{  function SolarEncodeDate(Year, Month, Day: Word): TDateTime;                }
{                                                                              }
{  Returns a TDateTime type as Gregorian for a specified Year, Month, and      }
{  Day as Solar. If the specified solar date does not indicate a valid date,   }
{  the return value is zero.                                                   }
{                                                                              }
{  Example:                                                                    }
{                                                                              }
{    ShowMessage(DateToStr(SolarEncodeDate(1349, 2, 8)));                      }
{                                                                              }
{------------------------------------------------------------------------------}
{                                                                              }
{  procedure SolarDecodeDate(Date: TDateTime; var Year, Month, Day: Word);     }
{                                                                              }
{  Breaks the passed Date as Gregorian into the appropriate Year, Month, and   }
{  Day values as Solar.                                                        }
{                                                                              }
{  Example:                                                                    }
{                                                                              }
{    SolarDecodeDate(Date, Year, Month, Day);                                  }
{    ShowMessage(Format('Today is %d/%d/%d', [Year, Month, Day]));             }
{                                                                              }
{------------------------------------------------------------------------------}

unit SolarUtl;

interface

type
  TDateKind = (dkSolar, dkGregorian);

function IsLeapYear(DateKind: TDateKind; Year: Word): Boolean;
function DaysOfMonth(DateKind: TDateKind; Year, Month: Word): Word;
function IsDateValid(DateKind: TDateKind; Year, Month, Day: Word): Boolean;
function DaysToDate(DateKind: TDateKind; Year, Month, Day: Word): Word;
function DateOfDay(DateKind: TDateKind; Days, Year: Word; var Month, Day: Word): Boolean;

function GregorianToSolar(var Year, Month, Day: Word): Boolean;
function SolarToGregorian(var Year, Month, Day: Word): Boolean;

function SolarEncodeDate(Year, Month, Day: Word): TDateTime;
procedure SolarDecodeDate(Date: TDateTime; var Year, Month, Day: Word);

implementation

uses
  SysUtils;

const
  LeapMonth: array[TDateKind] of Byte =
    (12 {Esfand}, 2 {February});
  DaysOfMonths: array[TDateKind, 1..12] of Byte = (
    (  31,  31,  31,  31,  31,  31,  30,  30,  30,  30,  30,  29 )
    { Far, Ord, Kho, Tir, Mor, Sha, Meh, Aba, Aza, Day, Bah,^Esf },
    (  31,  28,  31,  30,  31,  30,  31,  31,  30,  31,  30,  31 )
    { Jan,^Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec });
  DaysToMonth: array[TDateKind, 1..13] of Word = (
    (   0,  31,  62,  93, 124, 155, 186, 216, 246, 276, 306, 336, 365 )
    { Far, Ord, Kho, Tir, Mor, Sha, Meh, Aba, Aza, Day, Bah,^Esf, *** },
    (   0,  31,  59,  90, 120, 151, 181, 212, 243, 273, 304, 334, 365 )
    { Jan,^Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec, *** });


function IsLeapYear(DateKind: TDateKind; Year: Word): Boolean;
begin
  if DateKind = dkSolar then
    Result := ((((LongInt(Year) + 38) * 31) mod 128) <= 30)
  else
    Result := ((Year mod 4) = 0) and (((Year mod 100) <> 0) or ((Year mod 400) = 0));
end;

function DaysOfMonth(DateKind: TDateKind; Year, Month: Word): Word;
begin
  if (Year <> 0) and (Month in [1..12]) then
  begin
    Result := DaysOfMonths[DateKind, Month];
    if (Month = LeapMonth[DateKind]) and IsLeapYear(DateKind, Year) then
      Inc(Result);
  end
  else
    Result := 0;
end;

function IsDateValid(DateKind: TDateKind; Year, Month, Day: Word): Boolean;
begin
  Result := (Year <> 0) and (Month >= 1) and (Month <= 12) and
            (Day >= 1) and (Day <= DaysOfMonth(DateKind, Year, Month));
end;

function DaysToDate(DateKind: TDateKind; Year, Month, Day: Word): Word;
begin
  if IsDateValid(DateKind, Year, Month, Day) then
  begin
    Result := DaysToMonth[DateKind, Month] + Day;
    if (Month > LeapMonth[DateKind]) and IsLeapYear(DateKind, Year) then
      Inc(Result);
  end
  else
    Result := 0;
end;

function DateOfDay(DateKind: TDateKind; Days, Year: Word; var Month, Day: Word): Boolean;
var
  LeapDay, m: Integer;
begin
  LeapDay := 0;
  Month := 0;
  Day := 0;
  for m := 2 to 13 do
  begin
    if (m > LeapMonth[DateKind]) and IsLeapYear(DateKind, Year) then
      LeapDay := 1;
    if Days <= (DaysToMonth[DateKind, m] + LeapDay) then
    begin
      Month := m - 1;
      if Month <= LeapMonth[DateKind] then LeapDay := 0;
      Day := Days - (DaysToMonth[DateKind, Month] + LeapDay);
      Break;
    end;
  end;
  Result := IsDateValid(DateKind, Year, Month, Day);
end;

function GregorianToSolar(var Year, Month, Day: Word): Boolean;
var
  LeapDay, Days: Integer;
  PrevGregorianLeap: Boolean;
begin
  if IsDateValid(dkGregorian, Year, Month, Day) then
  begin
    PrevGregorianLeap := IsLeapYear(dkGregorian, Year-1);
    Days := DaysToDate(dkGregorian, Year, Month, Day);
    Dec(Year, 622);
    if IsLeapYear(dkSolar, Year) then
      LeapDay := 1
    else
      LeapDay := 0;
    if PrevGregorianLeap and (LeapDay = 1) then
      Inc(Days, 287)
    else
      Inc(Days, 286);
    if Days > (365 + LeapDay) then
    begin
      Inc(Year);
      Dec(Days, 365 + LeapDay);
    end;
    Result := DateOfDay(dkSolar, Days, Year, Month, Day);
  end
  else
    Result := False;
end;

function SolarToGregorian(var Year, Month, Day: Word): Boolean;
var
  LeapDay, Days: Integer;
  PrevSolarLeap: Boolean;
begin
  if IsDateValid(dkSolar, Year, Month, Day) then
  begin
    PrevSolarLeap := IsLeapYear(dkSolar, Year-1);
    Days := DaysToDate(dkSolar, Year, Month, Day);
    Inc(Year, 621);
    if IsLeapYear(dkGregorian, Year) then
      LeapDay := 1
    else
      LeapDay := 0;
    if PrevSolarLeap and (LeapDay = 1) then
      Inc(Days, 80)
    else
      Inc(Days, 79);
    if Days > (365 + LeapDay) then
    begin
      Inc(Year);
      Dec(Days, 365 + LeapDay);
    end;
    Result := DateOfDay(dkGregorian, Days, Year, Month, Day);
  end
  else
    Result := False;
end;

function SolarEncodeDate(Year, Month, Day: Word): TDateTime;
begin
  if SolarToGregorian(Year, Month, Day) then
    Result := EncodeDate(Year, Month, Day)
  else
    Result := 0;
end;

procedure SolarDecodeDate(Date: TDateTime; var Year, Month, Day: Word);
begin
  DecodeDate(Date, Year, Month, Day);
  GregorianToSolar(Year, Month, Day);
end;

end.
