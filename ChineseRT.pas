var a1,b1,x,y,n,i,sum,k,ans:longint;
    a,m,r,b:array[1..100]of longint;
function gcd(a1,b1:longint):longint;
 var p,n1,m1:longint;
 begin
  if b1=0 then
   begin
    x:=1;
    y:=0;
    exit(a1);
   end
  else
   begin
    p:=gcd(b1,a1 mod b1);
    n1:=x;
    m1:=y;
    x:=m1;
    y:=n1-a1 div b1*m1;
    exit(p);
   end;
 end;
begin
 readln(n);
 sum:=1;
 for i:=1 to n do
  begin
   read(m[i]);
   sum:=sum*m[i];
  end;
 readln;
 for i:=1 to n do read(a[i]);
 for i:=1 to n do
  begin
   r[i]:=sum div m[i];
   k:=gcd(r[i],m[i]);
   b[i]:=x*r[i];
  end;
 ans:=0;
 for i:=1 to n do
  ans:=ans+a[i]*b[i];
 writeln(ans);
end.
