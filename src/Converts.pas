unit Converts;

interface

Uses Windows,Sysutils;

function StrToInt(const S: string): Integer;
function StrToInt64(const S: string): Int64;
function StrToFloat(const S: string): Extended;
function StrToCurr(const S: string): Currency;

implementation

function StrToInt(const S: string): Integer;
var
  E: Integer;
begin
  Val(S, Result, E);
  If E <> 0 Then Result:=0;
end;

function StrToInt64(const S: string): Int64;
var
  E: Integer;
begin
  Val(S, Result, E);
  If E <> 0 Then Result:=0;
end;

function StrToFloat(const S: string): Extended;
begin
  if not TextToFloat(PChar(S), Result, fvExtended) then Result:=0;
end;

function StrToCurr(const S: string): Currency;
begin
  if not TextToFloat(PChar(S), Result, fvCurrency) then Result:=0;
end;

end.
