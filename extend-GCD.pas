var a,b,x,y:longint;
function gcd(a,b:longint):longint;
 var p,n,m:longint;
 begin
  if b=0 then
   begin
    x:=1;
    y:=0;
    exit(a);
   end
  else
   begin
    p:=gcd(b,a mod b);
    n:=x;
    m:=y;
    x:=m;
    y:=n-a div b*m;
    exit(p);
   end;
 end;
begin
 readln(a,b);
 writeln(gcd(a,b),'=',x,'a+',y,'b');
end.
