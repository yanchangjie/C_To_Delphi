(***************************************************************************
功能：魔方阵阶数
缺点：变量定义、代码逻辑等有待改进
tips：奇数阵，部分偶数没有对应魔方阵
edit by yanchangjie
date: 2013-10-17 14:42
****************************************************************************)
program Project13;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

const
  N=5;

var
  i,j,k: integer;
  a: array[1..N,1..N] of integer;
begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
    for i := 1 to N do
      for j := 1 to N do
        a[i][j] := 0;
    j:=(N+1) div 2;
    a[1][j]:=1;

    for k := 2 to N*N do
      begin
        i:=i-1;
        j:=j+1;
        if (i<1) then
          i:=N;
        if (j>N) then
          j:=1;
        if a[i][j]=0 then
          a[i][j]:=k
        else begin
          i:=((i+1) mod N)+1;
          j:=((j-2+N) mod N)+1;
          a[i][j]:=k;
        end;
      end;

    WriteLn;
    for i := 1 to N do
      begin
        Write(#9);
        for j := 1 to N do
          Write(Format('%4d',[a[i][j]]));
        WriteLn;
      end;
    ReadLn;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
