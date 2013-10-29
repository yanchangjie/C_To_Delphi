(*************************************************************************
功能：无符号整数(word)移位
实现：shr,shr,and,or等位操作
edit by yanchangjie
date: 2013-10-29 10:12
**************************************************************************)
program Project28;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

procedure binary(number: word);
var
  i,bit: integer;
  k: word;
begin
  k := $8000;
  WriteLn(Format('%04x',[number]),'(16)');
  for i := 0 to 15 do
  begin
    if (k and number)<>0 then
      bit := 1
    else bit := 0;
    Write(bit);
    if (i=7) then
    begin
      Write('--');
    end;
    k := k shr 1;
  end;
  WriteLn('(2)');
end;

function moveright(number: word; n: integer): word;
var
  a,b: word;
begin
  b := (number shr n);
  a := (number shl (16-n));
  number := (a or b);
  Result := number;
end;

function moveleft(number: word; n: integer): word;
var
  a,b: word;
begin
  b := (number shl n);
  a := (number shr (16-n));
  number := (a or b);
  Result := number;
end;

var
  number: word;
  n: integer=0;
begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
    WriteLn;
    Write('Input a origenal number to move:');
    ReadLn(number);
    repeat
      Write('Input number to move([-15,-1] or [1,15]):');
      ReadLn(n);
    until (((-15<=n)and(n<=-1))or((1<=n)and(n<=15)));
    Write('The origenal number is: ',Format('%6d',[number]),'(10)',#9);
    binary(number);
    if (n>0) then
    begin
      number := moveright(number,n);
      WriteLn;
      Write('The result is: ',Format('%6d',[number]),'(10)');
      binary(number);
    end
    else begin
      n := -n;
      number := moveleft(number,n);
      WriteLn;
      Write('The result is: ',Format('%6d',[number]),'(10)');
      binary(number);
    end;
    ReadLn;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
