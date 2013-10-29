(*********************************************************************
功能：正弦函数曲线
实现：sin(extended)
tips: 实现real->integer可以使用Trunc(real) or round(raal)
edit by yanchangjie
date: 2013-10-15 11:39
*********************************************************************)
program Project05;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

const
  PI=3.1415927;
  H=25;
  N=2*PI/H;
  Blank=' ';
  Dot='.';

var
  a,i,j:integer;
begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
    for i := 0 to H do
    begin
      a := Round(30*sin(i*N));
      for j := 0 to (a+39) do
      begin
        if j=40 then
          Write('|')
        else Write(Blank);
      end;
      Write(Dot);
      if a<0 then
      begin
        for j := (a+41) to 39 do
          Write(Blank);
        Write('|');
      end;
      WriteLn;
    end;
    ReadLn;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
