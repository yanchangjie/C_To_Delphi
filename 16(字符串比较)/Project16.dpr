(*****************************************************************
功能：字符串比较
缺陷：delphi中字符串的表示形式与c之间的差别待明
edit by yanchangjie
date:2013-10-21 9:23
******************************************************************)
program Project16;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

const
  N=50;

var
  i,j:integer;
  k:integer=0;
  str: array[0..1,0..(N-1)] of char;
  flag: array[0..(N-1),0..4] of char;
begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
    WriteLn('Input the first string shorter than ',N,' letters:');
    ReadLn(str[0]);
    WriteLn('Inpute the second string shorter than ',N,' letters:');
    ReadLn(str[1]);
    for i := 0 to (N-1) do
      for j := 0 to 4 do
        flag[i][j]:='-';
    for i := 0 to (N-1) do begin
      if (str[0][i]='\0') then
      begin
        for j := i to High do

      end;
    end;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
