(************************************************************************
���ܣ�����3�ĳ����У�����ʾ�¶���
ʵ�֣�forѭ��
tips��whileѭ���е�iֵ���µ�λ��Ҫ׼ȷ
edit by yanchangjie
date: 2013-10-16 10:54
*************************************************************************)
program Project09;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

const
  N=17;                       //������
  M=3;                        //����ѭ����

var
  i,j:integer;
  k:integer=0;
  a: array[1..N] of integer;
begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
    WriteLn('The original orders are :');
    for i := 1 to N do             //λ�ų�ʼ��
    begin
      a[i]:=i;
      Write(a[i],' ');
    end;
    WriteLn;
    i:=1;
    while (k<M*N) do               //ѭ��ʵ�ֳ���
    begin
      if (a[i mod N]<>-1) then
      begin
        k:=k+1;
        if ((k mod 3)=0) then
        begin
          a[i mod N]:= -1;
          WriteLn;
          Write((i mod N),' is out!');
          if (k<>N*3) then
            Write('The new order is:')
          else Write('The game is over!');

          for j := 1 to N do
          begin
            if (a[j]<>-1) then
              Write(a[j],' ');
          end;
        end;
      end;
      i:=i+1;                        //ע��i����λ�ã���c�е�forѭ��ת��������
    end;
    ReadLn;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
