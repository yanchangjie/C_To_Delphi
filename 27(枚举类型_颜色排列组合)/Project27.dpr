(**********************************************************************
功能：显示六种颜色的排列组合
实现：枚举类型
edit by yanchangjie
date: 2013-10-25 15:33
***********************************************************************)
program Project27;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

type
  Tcolours=(RED,YELLOW,BLUE,GREEN,WHITE,BLACK);

var
  i,j,k,p: Tcolours;
  n: integer=0;
  number: integer;
begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
    for i := RED to BLACK do
      for j := RED to BLACK do
      begin
        if (i<>j) then
        begin
          for k := RED to BLACK do
          begin
            if ((k<>i) and (k<>j)) then
            begin
              if ((n mod 3) = 0) then
                WriteLn;
              Inc(n);
              Write(Format('%-4d',[n]));
              for number := 1 to 3 do
              begin
                case number of
                  1: begin
                    p:=i;
                  end;
                  2: begin
                    p:=j;
                  end;
                  3: begin
                    p:=k;
                  end;
                end;

                case p of
                  RED: begin
                    Write(Format('%-7s',['red']));
                    //break;
                  end;
                  YELLOW: begin
                    Write(Format('%-7s',['yellow']));
                    //break;
                  end;
                  BLUE: begin
                    Write(Format('%-7s',['blue']));
                    //break;
                  end;
                  GREEN: begin
                    Write(Format('%-7s',['green']));
                    //break;
                  end;
                  WHITE: begin
                    Write(Format('%-7s',['white']));
                    //break;
                  end;
                  BLACK: begin
                    Write(Format('%-7s',['black']));
                    //break;
                  end;
                end;
              end;
            end;
          end;
        end;
      end;
      WriteLn;
      WriteLn('total: ',n);
      ReadLn;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
