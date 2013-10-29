(************************************************************************
功能：统计有不及格科目的人的成绩
实现：指针取值
tips：delphi中有无数组指针？
edit by yanchangjie
date:2013-10-22 11:37
**************************************************************************)
program Project19;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

const
  N=2;                  //科数
  M=3;                  //人数

procedure search(P:PInteger);
var
  i,j,flag:integer;
  tmp_p:PInteger;
begin
  for i := 0 to (M-1) do
  begin
    flag:=0;
    for j := 0 to (N-1) do
    begin
      tmp_p:=P;
      Inc(Integer(tmp_p),(i*(M-1)+j)*sizeof(integer));
      if (tmp_p)^<60 then
        flag:=1;
    end;
    if (flag=1) then
    begin
      WriteLn;
      Write('NO.',(i+1),' is flunked,score are:');
      for j := 0 to (N-1) do
      begin
        tmp_p:=P;
        Inc(Integer(tmp_p),(i*(M-1)+j)*sizeof(integer));
        Write(Format('%5.1d',[(tmp_p)^]));
      end;
    end;
  end;
end;

var
  i,j: integer;
  score: array[0..(M-1),0..(N-1)] of integer;
begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
    for i := 0 to (M-1) do
    begin
      WriteLn('Input ',N,' scores of NO.',(i+1));
      for j := 0 to (N-1) do
        Read(score[i][j]);
    end;
    search(@score);
    ReadLn;
    ReadLn;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
