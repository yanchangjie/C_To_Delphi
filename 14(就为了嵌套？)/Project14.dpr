(***********************************************************************
功能：不明（为了熟悉嵌套？）
edit by yanchangjie
date: 2013-10-18 10:42
************************************************************************)
program Project14;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

var
  i,j,k,m,p:integer;
  xwei: array[1..5] of char;
  side: array[1..10] of char;
  ch: array[1..10] of char=('B','A','C','E','A','B','D','C','E','D');
begin
  xwei[1]:='A';
  try
    { TODO -oUser -cConsole Main : Insert code here }
    for i := 2 to 5 do begin
      xwei[i] := 'B';
      for j := 2 to 5 do begin
        if (j<>i) then begin
          xwei[j] := 'C';
          for k := 2 to 5 do begin
            if ((k<>j) and (k<>i)) then begin
              xwei[k] := 'D';
              xwei[5] := 'E';

              for p := 1 to 5 do begin
                side[2*p-1] := xwei[(p mod 5)+1];
                side[2*p] := xwei[((p+3) mod 5)+1];
              end;
              m:=0;
              p:=1;
              while (p<=10) do begin
                if ((side[p]=ch[p]) or (side[p+1]=ch[p+1])) then
                  m:=m+1;
                p:=p+2;
              end;
              if (m=5) then begin
                WriteLn('The order is:');
                for p := 1 to 5 do
                  Write(Format('%2d',[p]),xwei[p]);
                WriteLn;
              end;
            end;
          end;
        end;
      end;
    end;
    ReadLn;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
