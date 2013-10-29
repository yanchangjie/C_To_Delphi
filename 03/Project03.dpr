(**************************************
功能：各个进制整数之间的转换
实现方式：先从源进制数转化为10进制数，再从10进制数转化为目标进制
局限：只能实现低于10进制的各个进制之间的转换，16进制转换无法实现
edit by yanchangjie
date: 2013-10-15  9:38
***************************************)
program Project03;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

var
  a,b,k: integer;
  xa,xb,x1,x2: longint;
begin
  a := 0;
  b := 8;
  k := 1;
  xa:= 0;
  xb:= 0;
  x1:= 0;
  x2:= 0;
  try
    WriteLn;
    WriteLn('Input the number and weight a->b:');
    ReadLn(xa,a,b);
    x1 := xa;
    while not(x1=0) do
    begin
      x2 := x2 + (x1 mod 10)*k;
      x1 := x1 div 10;
      k  := k*a;
    end;
    k := 1;
    x1 := x2;
    while not(x1=0) do
    begin
      xb := xb + (x1 mod b)*k;
      x1 := x1 div b;
      k  := k*10;
    end;
    WriteLn;
    WriteLn(xa,'(',a,')=',x2,'(',10,')=',xb,'(',b,')');
    ReadLn;
    { TODO -oUser -cConsole Main : Insert code here }
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
