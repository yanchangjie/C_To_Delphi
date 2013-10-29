(**************************************************************
功能：字符串转数值
实现：atoi()函数按位逐个转换
tips: 字符数组、字符串、字符指针Pchar之间的转换
edit by yanchangjie
date:2013-10-21 10：28
***************************************************************)
program Project17;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

function atoi(p: Pchar):integer;
var
  k,number:integer;
begin
  number:=0;
  WriteLn('p:',p);
  while ((p^<>'0')and(p^>='0')and(p^<='9')) do
  begin
    k:=Ord(p^)-48;
    p:=p+1;
    number:=10*number+k;
  end;

  Result:=number;
end;

var
  s: array[0..9] of char;
  number,c: integer;
begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
    WriteLn('Input a digit string:');
    ReadLn(s);
    number:=atoi(@s);
    WriteLn(number);
    ReadLn;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
