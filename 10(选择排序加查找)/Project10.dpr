(*************************************************************************
功能：整数数组排序
实现：selectsort()中外部循环实现选择排序，内部循环得到最小数
缺点：交互不够，部分提示有歧义
tips：delphi中数组的下标由初始化时指定，未指定则默认从0开始
edit by yanchangjie
date: 2013-10-16 11:58
**************************************************************************)
program Project10;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

procedure selectsort(a: array of integer; n: integer);
var
  i,j,k,num:integer;
begin
  for i := 0 to n-2 do
    begin
      k:=i;
      for j := i+1 to n-1 do
        begin
          if a[j]<a[k] then
            k:=j;
        end;
      if k<>i then
      begin
        num:=a[k];
        a[k]:=a[i];
        a[i]:=num;
      end;
    end;

    WriteLn;
    WriteLn('The sorted numbers are:');
    for i := 0 to n-1 do
      Write(a[i],' ');
end;

procedure halfind(a: array of integer; n: integer);
var
  i,k:integer;
  find:integer;
  first:integer;
  last:integer;
  half:integer;
begin
  find:=0;                    //找到标志
  first:=0;                   //范围起点
  last:=n-1;                  //范围终点
  WriteLn;                    //查找点
  WriteLn('Input the number to look for:');
  ReadLn(k);
  repeat
    half := (first+last) div 2;
    if k=a[half] then
    begin
      Write('Find ',k,',it is a[',half,'].');
      find:=1;
    end
    else if (k>a[half]) then
         first:= half+1
    else last := half-1;
  until ((first>last)or(find=1));

  if (find=0) then
  begin
    WriteLn;
    WriteLn(k,' not been found!');
  end;
end;

var
  i,n:integer;
  a: array[1..100] of integer;
begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
    WriteLn;
    WriteLn('Input the total number[1-100]:');
    ReadLn(n);
    WriteLn('Input ',n,' numbers');
    for i := 1 to n do
      Read(a[i]);

    WriteLn;
    WriteLn('The original orders are:');
    for i := 1 to n do
      Write(a[i],' ');
    selectsort(a,n);
    halfind(a,n);

    ReadLn;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
