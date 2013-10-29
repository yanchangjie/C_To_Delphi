(**************************************************************************
功能：绘制杨辉三角形
实现：for
tips:注意每行的缩进值以及显示数据的格式化
edit by yanchangjie
date: 2013-10-17 10:38
***************************************************************************)
program Project12;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

const
  N=15;

var
  i,j,m: integer;
  a: array[1..N,1..N] of integer;
begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
    repeat
      WriteLn;
      WriteLn('Input n[1-12]:');
      ReadLn(m);
    until ((m>=1) and (m<=12));
    for i := 1 to (m+1) do
      begin
        a[i][1] := 1;
        a[i][i] := 1;
      end;
    for i := 3 to (m+1) do
      for j := 2 to (i-1) do
        a[i][j] := a[i-1][j-1] + a[i-1][j];
    WriteLn;
    for i := 1 to (m+1) do
      begin
        for j := 1 to ((76-6*i) div 2)+1 do
          Write(' ');                             //确定每行的缩进
        for j := 1 to i do
          Write(Format('%6d',[a[i][j]]));
        WriteLn;
      end;
    WriteLn;
    ReadLn;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
