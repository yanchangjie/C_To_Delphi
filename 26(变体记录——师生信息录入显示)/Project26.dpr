(**************************************************************************
功能：师生信息录入及显示
实现：记录及变体记录
edit by yanchangjie
date: 2013-10-25 14:25
***************************************************************************)
program Project26;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

const
  N=2;
  M=20;

type
  info = record
    name: array [0..(M-1)] of char;
    age: integer;
    sex: char;
    job: char;
    case integer of
      1: (claxx:integer);
      2: (office: array[0..(M-1)] of char)
  end;

var
  infos: array[0..(N-1)] of info;
  i: integer;
begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
    for i := 0 to (N-1) do
    begin
      Write('Input name:');
      ReadLn(infos[i].name);
      Write('Input age:');
      ReadLn(infos[i].age);
      Write('Input sex(m/f):');
      ReadLn(infos[i].sex);
      Write('Input job(s/t):');
      ReadLn(infos[i].job);
      if (infos[i].job = 's') then
      begin
        Write('Input class:');
        ReadLn(infos[i].claxx);
      end
      else if (infos[i].job = 't') then
      begin
        Write('Input office:');
        ReadLn(infos[i].office);
      end
      else begin
        WriteLn('Input wrong job,return!');
        //Dec(i);
      end;
      WriteLn;
    end;

    WriteLn('name ',#9,' age ',#9,' sex ',#9,' job ',#9,' depart ');
    for i := 0 to (N-1) do
    begin
      if (infos[i].job = 's') then
        WriteLn(Format('%-15s',[infos[i].name]),Format('%-3d',[infos[i].age]),#9,infos[i].sex,#9,infos[i].job,#9,infos[i].claxx)
      else
        WriteLn(Format('%-15s',[infos[i].name]),Format('%-3d',[infos[i].age]),#9,infos[i].sex,#9,infos[i].job,#9,infos[i].office);
    end;

    ReadLn;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
