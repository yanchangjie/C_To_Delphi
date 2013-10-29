(**************************************************************
¹¦ÄÜ£ºnot clear
edit by yanchangjie
date: 2013-10-15 14:05
**************************************************************)
program Project06;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

function fun(k:single):single;
begin
  Result:= (k*(k*(k*(k*(k+1)+2)-2)+1)-3);
end;

var
  xmin: single=0;
  xmid: single=0;
  xmax: single=0;
  fmin: single=0;
  fmid: single=0;
  fmax: single=0;
begin
  try
    repeat
      WriteLn('Input xmin & xmax:');
      ReadLn(xmin,xmax);
      fmin:=fun(xmin);
      fmax:=fun(xmax);
    until fmin*fmax<=0;

    while (abs(fmax-fmin)>=1e-5) do
    begin
      xmid := (xmin+xmax)/2;
      fmid := fun(xmid);
      if (fmid*fmin<0) then
      begin
        xmax:=xmid;
        fmax:=fmid;
      end
      else begin
        xmin:=xmid;
        fmin:=fmid;
      end;
    end;
    WriteLn(xmid);
    WriteLn('x=',Format('%5.3f',[abs(xmid)]));
    ReadLn;
    { TODO -oUser -cConsole Main : Insert code here }
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
