(************************************************************************
���ܣ������ַ����д�д��Сд���ո��Ԫ�صĸ���
ʵ�֣��ַ����飬�ַ�ָ��
tips: delphi��������ַ����鶨���ַ�����������Ƿ����#0��null�����жϽ�β
edit by yanchangjie
date: 2013-10-21
*************************************************************************)
program Project18;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

const
  N=50;

var
  up: integer=0;
  low: integer=0;
  digit: integer=0;
  space: integer=0;
  other: integer=0;
  p: Pchar;
  s: array[0..(N-1)] of char;
begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
    WriteLn('the string: ');
    ReadLn(s);
    p:=@s;
    WriteLn(Integer(p^),' ',Integer((p+2)^));
    while (p^<>#0) do
    begin
      if ((p^>='A') and (p^<='Z')) then
        up:=up+1
      else if ((p^>='a') and (p^<='z')) then
        low:=low+1
      else if (p^=' ') then
        space:=space+1
      else if ((p^>='0') and (p^<='9')) then
        Inc(digit)
      else other:=other+1;
      Inc(p);
    end;
    WriteLn('up letters:',up,' low letters:',low,' space letters:',space,' other letter:',other);
    ReadLn;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
