(*****************************************************************************
功能：打乱纸牌
实现：字符串数组存储数据，randomize,random实现随机打乱牌序
bug：10用0代替
edit by yanchangjie
data: 2013-10-18 14:07
******************************************************************************)
program Project15;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

var
  i,j:integer;
  ch1,ch2: char;
  s: array[0..103] of char;
  a: array[0..255] of char;
  b: array[0..12] of char=('A','K','Q','J','0','9','8','7','6','5','4','3','2');
begin
  a:='hdsc';
  try
    { TODO -oUser -cConsole Main : Insert code here }
    for i := 0 to 3 do
      for j := 0 to 12 do
      begin
        s[2*j+26*i]:=a[i];
        s[2*j+26*i+1]:=b[j];
      end;
    randomize();
    for i := 0 to 51 do
    begin
      j:=random(52-i);
      ch1:=s[2*j];
      s[2*j]:=s[102-2*i];
      s[102-2*i]:=ch1;

      ch2:=s[2*j+1];
      s[2*j+1]:=s[103-2*i];
      s[103-2*i]:=ch2;
    end;
    WriteLn;
    WriteLn;
    i:=0;
    while (i<104) do
    begin
      if ((i mod 13)=0) then
        WriteLn;
      Write('  ',s[i],s[i+1]);
      i:=i+2;
    end;
    ReadLn;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
