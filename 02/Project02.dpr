program Project02;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

const N: integer=10;

{$j+}
const
  k: longword=1;

procedure startnum(seed: word);
begin
  k:=seed;
end;

function randnum(n:Longint):Longword;
begin
  k:=((k*159+23)div n)+1;
  result := k;
end;

var
  i: word;
  m: longint=0;
begin
  try
    while (not ((m>0) and ((k>0) and (k<=4294967295)))) do
    begin
      WriteLn;
      WriteLn('Input the seed and the max random[1-4294967295]:');
      ReadLn(k,m);
      if (m<=0) then
        WriteLn('wrong seed!');
      if ((k<=0) or (k>4294967295)) then
        WriteLn('wrong max random!');
    end;
    startnum(m);
    for i := 0 to N do
    begin
      WriteLn(randnum(m));
    end;
    k:=k*10;
    WriteLn(k);
    ReadLn;
    { TODO -oUser -cConsole Main : Insert code here }
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
{$j-}
end.

