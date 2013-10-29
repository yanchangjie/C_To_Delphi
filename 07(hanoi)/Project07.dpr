(***************************************************************
���ܣ���ŵ��
ʵ�ַ�ʽ���ݹ�
ע��ϸ�ڣ�Դ���š�Ŀ�����š��м����ŵ�λ�ã���ʵ���е�������ҲҪע��
edit by yanchangjie
date: 2013-10-16 9:23
****************************************************************)
program Project07;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

function toupper(var Ch:char):char;
begin
  case Ch of
    'a'..'z':
      Ch := Char(Word(Ch) xor $0020);
  end;
  Result := Ch;
end;

procedure move(n:integer;a,b:char);
begin
  WriteLn('Disc',(n+1),' move from ',a,' to ',b);
end;

//nΪ�ƶ���������aΪԴ���ţ�bΪĿ�����ţ�cΪ�м�����
procedure hanoi(n:integer;a,b,c:char);
begin
  if n>0 then
  begin
    hanoi(n-1,a,c,b);
    move(n-1,a,b);
    hanoi(n-1,c,b,a);
  end;
end;

var
  n:integer;
  ch:char='Y';
begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
    WriteLn('Now let us play the game of hanoitower');
    while (ch='Y') do
    begin
      WriteLn('Input the number of disc[2-15]:');
      ReadLn(n);
      WriteLn('The orders of moving ',n,' discs from A to B are:');
      hanoi(n,'A','B','C');
      WriteLn('Continue(Y/N):');
      ReadLn(ch);
      ch:=toupper(ch);
    end;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
