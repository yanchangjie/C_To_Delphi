(***************************************************************************
功能：学生信息录入及显示
实现：record
tips: uppercase();
edit by yanchangjie
date: 2013-10-24 14:04
****************************************************************************)
program Project22;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

type
  Tstudinfo=record
    name: array[0..9] of char;
    number: longint;
    sex: char;
    score: real;
  end;
  PTstudinfo=^Tstudinfo;

const
  N=50;

var
  m: integer=0;
  student: array[0..(N-1)] of Tstudinfo;

procedure new();
var
  numstr: array[0..9] of char;
begin
  WriteLn('Input all data(name,number,sex(m/f),score)of student[',m+1,']:');
  ReadLn(student[m].name);
  WriteLn('number:');
  ReadLn(numstr);
  student[m].number := strtoint(numstr);
  ReadLn(student[m].sex);
  ReadLn(numstr);
  student[m].score := strtofloat(numstr);
  Inc(m);
end;

procedure listone(k:integer; s: PTstudinfo);
begin
  WriteLn(Format('%6d',[k]),'  ',Format('%-12s',[s.name]),'  ',Format('%-8d',[s.number]),'  ',s.sex,'  ',Format('%6.2f',[s.score]));
end;

procedure list();
var
  i: integer;
begin
  if (m<1) then
  begin
    WriteLn('There is not a student!');
  end
  else begin
    WriteLn('record ',#9,' name ',#9#9,' number ',#9,' sex ',#9,' score ');
    for i := 0 to (m-1) do
    begin
      listone((i+1),@student[i]);
    end;
  end;
end;

procedure toupper(var ch: char);
begin
  case ch of
    'a'..'z':
      ch := Char(Word(ch) xor $0020);
  end;
end;

var
  ch: char;
  flag: integer=1;
begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
    while (flag=1) do
    begin
      WriteLn('Input "N" or "n" to input new record,"L" or "l" to list all record:');
      ReadLn(ch);
      toupper(ch);

      if (ch='N') then
        new()
      else if (ch='L') then
        list()
      else
        flag:=0;
    end;
    ReadLn;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
