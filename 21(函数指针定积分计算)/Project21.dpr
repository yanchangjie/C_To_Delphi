(*************************************************************************
���ܣ������֡�(1+x+x*x*x)dx����
ʵ�֣�����ָ��
edit by yanchangjie
date: 2013-10-24 10:58
**************************************************************************)
program Project21;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

const
  N=10000;

type
  TFunctionParameter = function(parameter: real):real;

function fbds(x:real):real;
begin
  Result := (1.0+x+x*x*x);
end;

function jifen(a:real; b:real; fun: TFunctionParameter): real;
var
  i: integer;
  h,s: real;
begin
  h := (b-a)/N;
  s := (fun(a)+fun(b))/2.0;
  for i := 1 to N do
  begin
    s := s+fun(a+i*h);
  end;
  Result := s*h;
end;

var
  y: real;
begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
    y := jifen(0.0,2.0,fbds);
    WriteLn('����y=��(1+x+x*x*x)dx�Ķ���(x��[0,2])��:',Format('%6.2f',[y]));
    ReadLn;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
