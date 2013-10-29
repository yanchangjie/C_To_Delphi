program Project01;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

procedure print();
begin
  WriteLn;
  writeln('This is an example.');
  WriteLn(' You are welcome!!')
end;

var
  flag: integer=1;
  ch: char;
begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
    while(flag=1) do
    begin
      WriteLn('Input F or f to start the program print,');
      WriteLn('other to exit:');
      ReadLn(ch);

      if ((ch='F') or (ch='f')) then
      begin
        print();
      end
      else
        flag:=0;
    end;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

end.
