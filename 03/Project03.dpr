(**************************************
���ܣ�������������֮���ת��
ʵ�ַ�ʽ���ȴ�Դ������ת��Ϊ10���������ٴ�10������ת��ΪĿ�����
���ޣ�ֻ��ʵ�ֵ���10���Ƶĸ�������֮���ת����16����ת���޷�ʵ��
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
