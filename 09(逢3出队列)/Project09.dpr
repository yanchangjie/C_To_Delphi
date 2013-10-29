(************************************************************************
功能：数到3的出队列，并显示新队列
实现：for循环
tips：while循环中的i值更新的位置要准确
edit by yanchangjie
date: 2013-10-16 10:54
*************************************************************************)
program Project09;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

const
  N=17;                       //总人数
  M=3;                        //出局循环数

var
  i,j:integer;
  k:integer=0;
  a: array[1..N] of integer;
begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
    WriteLn('The original orders are :');
    for i := 1 to N do             //位号初始化
    begin
      a[i]:=i;
      Write(a[i],' ');
    end;
    WriteLn;
    i:=1;
    while (k<M*N) do               //循环实现出局
    begin
      if (a[i mod N]<>-1) then
      begin
        k:=k+1;
        if ((k mod 3)=0) then
        begin
          a[i mod N]:= -1;
          WriteLn;
          Write((i mod N),' is out!');
          if (k<>N*3) then
            Write('The new order is:')
          else Write('The game is over!');

          for j := 1 to N do
          begin
            if (a[j]<>-1) then
              Write(a[j],' ');
          end;
        end;
      end;
      i:=i+1;                        //注意i更新位置（由c中的for循环转换而来）
    end;
    ReadLn;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
