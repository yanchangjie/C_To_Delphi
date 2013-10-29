(***********************************************************************
功能：排列输入的各个字符串
实现：字符指针数组
tips: 1.Pointer to Pointer in delphi can be writed as p:^pointer
      2.PChar is one of string types
      3.To make p[i] in code compiled,{$POINTERMATH ON} is necessary
edit by yanchangjie
date: 2013-10-23 11:36
************************************************************************)
program Project20;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

const
  LENGTH=30;
  N = 3;

type
  PPchar=^Pchar;

{$POINTERMATH ON}
procedure sort(p: PPchar);
var
  i,j:integer;
  pstr: Pchar;
begin
  for i := 0 to (N-1) do
    for j := (i+1) to (N-1) do
    begin
      if (strcomp(p[i],p[j])>0) then
      begin
        pstr:=p[j];
        p[j]:=p[i];
        p[i]:=pstr;
      end;
    end;
end;

var
  i:integer;
  pstr: array[0..(N-1)] of Pchar;
  s: array[0..(N-1),0..(LENGTH-1)] of char;
begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
    for i := 0 to (N-1) do
    begin
      pstr[i] := @s[i];
    end;

    WriteLn('Input ',N,' strings:');
    for i := 0 to (N-1) do
    begin
      ReadLn(s[i]);
    end;
    sort(@pstr);
    WriteLn('The sorted strings are:');
    for i := 0 to (N-1) do
    begin
      WriteLn(pstr[i]);
    end;

    ReadLn;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
