(*************************************************
���ܣ������֣�100���ڣ���Ϸ
ʵ�֣���randomize��random()���������
��ע������System.SysUtils�е�uppercase()����д�˴�д�ַ�ת������toupper()
ȱ�ݣ����潻����������
edit by yanchangjie
date: 2013-10-15 10:25
*************************************************)
program Project04;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

function toupper(var Ch:char):char;
begin
  case Ch of
    'a'..'z':
      Ch := Char(Word(Ch) xor $0020);
  end;
  Result := Ch;
end;

var
  count,number,guess: integer;
  yes: char='Y';
begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
    WriteLn;
    WriteLn('Now let us play the game.');
    WriteLn('Guess the number:');
    while toupper(yes)='Y' do
    begin
      count := 0;
      randomize;
      number := random(100)+1;
      repeat
        repeat
          WriteLn('Input an integer number(1-100):');
          ReadLn(guess);
          WriteLn;
        until ((guess>=1)and(guess<=100));
        if guess<number then
          WriteLn('Your answer is LOW, try again.');
        if guess>number then
          WriteLn('Your answer is HIGH, try again.');
        count := count+1;
        if count=15 then
        begin
          WriteLn('This is the ',count,' times!Think it hard next!');
          exit;
        end;
      until guess=number;

      if count<=7 then
      begin
        WriteLn('You have got it in ',count,' times.');
        WriteLn('Congratulations!');
      end
      else begin
        WriteLn('You have got it in ',count,' times.');
        WriteLn('I bet you can do it better.');
      end;
      WriteLn('Next?(Y/N):');
      ReadLn(yes);
    end;
    ReadLn;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
