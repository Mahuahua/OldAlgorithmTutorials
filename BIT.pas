var c:array[1..100000]of longint;
    i,n,k,a,m,w,s,t:longint;
    ch:char;
function lowbit(x:longint):longint;
 begin
  exit(x and (x xor (x-1)));
 end;
procedure add(w,a:longint);
 var k,j:longint;
 begin
  j:=w;
  repeat
   inc(c[j],a);
   j:=j+lowbit(j);
  until j>n;
 end;
function sum(x:longint):longint;
 var ss,j:longint;
 begin
  ss:=0;
  j:=x;
  while j>0 do
   begin
    ss:=ss+c[j];
    j:=j-lowbit(j);
   end;
  exit(ss);
 end;
begin
 readln(n);
 fillchar(c,sizeof(c),0);
 for i:=1 to n do
  begin
   read(a);
   add(i,a);
  end;
 readln(m);
 for i:=1 to m do
  begin
   read(ch);
   if ch='A' then
    begin
     readln(w,a);
     add(w,a);
    end;
   if ch='I' then
    begin
     readln(s,t);
     writeln(sum(t)-sum(s-1));
    end;
  end;
end.
