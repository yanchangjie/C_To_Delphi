(******************************************************************
���ܣ��о�1-200֮�������
ʵ�֣�����ɸѡ����ɸѡ��������>��������ɸȥ
tips��delphi�е������±�ͬ c ��ͬ���Ǵ�1��ʼ��
edit by yanchangjie
date: 2013-10-16 10:05
*******************************************************************)
program Project08;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

const
  M=200;
  N=((M+1) div 2);

var
  i,j:integer;
  a: array[1..N] of integer;
begin
  a[1] := 2;
  try
    { TODO -oUser -cConsole Main : Insert code here }
    for i := 2 to N do
    begin
      a[i]:=2*i-1;
    end;

    for i := 2 to N-1 do
    begin
      if (a[i]<>0) then
        for j := (i+1) to N do
          if ((a[j] mod a[i]) = 0) then
            a[j]:=0;
    end;
    WriteLn('The primer are[2-',M,']:');
    j:=0;
    for i := 1 to N do
    begin
      if (a[i]<>0) then
      begin
        Write(a[i],' ');
        j:=j+1;
        if ((j mod 10)=0) then
          WriteLn;
      end;
    end;
    ReadLn;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
