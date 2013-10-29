(***********************************************************************
���ܣ���¼��ʾ������ͬkey��Ԫ�ظ���
ʵ�֣�������
ȱ�ݣ�new��û���ͷ�
tips: record��next�����Ͷ������һ����⣨difference between delphi and c��
edit by yanchangjie
date: 2013-10-25 9:02
************************************************************************)
program Project23;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

type number=record
  key: longint;
  count: integer;
  next: ^number;
end;
  Pnumber=^number;

const
  LENTH=sizeof(number);

function add(k: longint; head: Pnumber): Pnumber;
var
  flag: integer;
  p: Pnumber;
begin
  flag := 1;
  p := head;
  while ((p <> nil) and (flag=1)) do
  begin
    if (p.key=k) then
      flag := 0
    else
      p := Pnumber(p.next);
  end;

  if (flag=0) then
    Inc(p.count)
  else begin
    p := head;
    New(head);
    head.key := k;
    head.count := 1;
    Pnumber(head.next) := p;
  end;
  Result := head;
end;

procedure list(p: Pnumber);
begin
  WriteLn(' The result are:');
  while (p<>nil) do
  begin
    WriteLn(Format('%16d',[p.key]),' ',Format('%6d',[p.count]));
    p:=Pnumber(p.next);
  end;
end;

var
  head: Pnumber=nil;
  k: longint;
begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
    WriteLn('Input natural numbers,-1 to end:');
    ReadLn(k);
    while (k>=0) do
    begin
      head := add(k,head);
      ReadLn(k);
    end;
    list(head);
    ReadLn;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
