(************************************************************************
功能：链表增、删、显示
实现：单向链表
tips：单向链表中，要实现删除某个节点需要设置两个节点指针变量
edit by yanchangjie
date: 2013-10-25 10:40
*************************************************************************)
program Project24;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

var
  n: integer=0;
type student=record
  number: longint;
  name: array[0..19] of char;
  next: ^student;
end;
Pstudent=^student;

function add(head: Pstudent):Pstudent;
var
  numstr: array[0..19] of char;
  p: Pstudent;
  p1,p2: Pstudent;
begin
  p1:=head;p2:=head;
  New(p);
  WriteLn('Input the new record','''','s number:');
  ReadLn(numstr);
  p.number := strtoint(numstr);
  writeLn('Input the new record','''','s name:');
  ReadLn(p.name);

  if (p.number>0) then
  begin
    if (head=nil) then
    begin
      head := p;
      p.next := nil;
      Inc(n);
    end
    else begin
      while ((p.number > p1.number) and (p1.next <> nil)) do
      begin
        p2 := p1;
        p1 := Pstudent(p1.next);
      end;

      if (p.number < p1.number) then
      begin
        if (head=p1) then
        begin
          head := p;
          Pstudent(p.next) := p1;
          Inc(n);
        end
        else begin
          Pstudent(p2.next) := p;
          Pstudent(p.next) := p1;
          Inc(n);
        end;
      end
      else if (p.number = p1.number) then
      begin
        strcopy(p1.name,p.name);
      end
      else if (p1.next = nil) then
      begin
        Pstudent(p1.next) := p;
        Pstudent(p.next) := nil;
        Inc(n);
      end;

    end;
  end
  else begin
    WriteLn('Input wrong number!(should > 0)');
  end;
  Result := head;
end;

procedure list(head: Pstudent);
var
  p: Pstudent;
  i: integer;
begin
  p := head;
  i := 1;
  if (head <> nil) then
  begin
    WriteLn('Now ',n,' records are:');
    WriteLn;
    WriteLn('record',#9,' number ',#9,' name ');
    repeat
      Write(Format('%6d',[i]),#9,Format('%-16d',[p.number]));
      Inc(i);
      WriteLn(#9,p.name);
      p := Pstudent(p.next);
    until (p=nil);
  end
  else
    WriteLn('It is empty!');
    WriteLn;
end;

Function delete(head: Pstudent): Pstudent;
var
  p1,p2: Pstudent;
  k: longint;
  numstr: array[0..19] of char;
begin
  WriteLn('Input the number that you want to delete:');
  ReadLn(numstr);
  k := strtoint(numstr);
  if (head = nil) then
  begin
    WriteLn('this is an empty list!');
  end
  else if (head.number = k) then
  begin
    p1 := head;
    head := Pstudent(head.next);
    Dispose(head);
    Dec(n);
  end
  else
  begin
    p1 := head;
    while ((p1.number <> k) and (p1.next <> nil)) do
    begin
      p2 := p1;
      p1 := Pstudent(p1.next);
    end;
    if (p1.number = k) then
    begin
      p2.next := p1.next;
      Dispose(p1);
      Dec(n);
    end
    else
      WriteLn(' The record is not in this list.');
  end;
  Result := head;
end;

procedure toupper(var ch: char);
begin
  case ch of
    'a'..'z':
      ch := Char(Word(ch) xor $0020);
  end;
end;
var
  head: Pstudent;
  ch: char;
  flag: integer=1;
begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
    if (n=0) then
    begin
      head := nil;
    end;
    while (flag=1) do
    begin
      WriteLn('Input "N" or "n" to input new record,"L" or "l" to lsit all record,');
      WriteLn('"D" or "d" to delete a record,other to exit:');
      ReadLn(ch);
      toupper(ch);

      if (ch='N') then
      begin
        head := add(head);
      end
      else if (ch='L') then
      begin
        list(head);
      end
      else if (ch='D') then
      begin
        head := delete(head);
      end
      else
        flag := 0;
    end;
    ReadLn;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
