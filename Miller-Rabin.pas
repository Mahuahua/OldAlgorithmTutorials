var n,d,r:longint;
function pow(a,d,n:longint):longint;
 var p,q,w:qword;
 begin
  p:=1;
  q:=a;
  w:=d;
  while w>0 do
   begin
    if q=1 then exit(p);
    if w mod 2=1 then p:=p*q mod n;
    w:=w div 2;
    q:=q*q mod n;
   end;
  exit(p);
 end;
function isp(a,n:longint):boolean;
 var m,i:longint;
 begin
  m:=pow(a,d,n);
  if (m=1)or(m=n-1) then exit(true)
  else
   begin
    for i:=1 to r do
     begin
      m:=(m*m) mod n;
      if m=n-1 then exit(true);
     end;
   end;
  exit(false);
 end;
begin
 readln(n);
 d:=n-1;
 r:=0;
 while d mod 2=0 do
  begin
   inc(r);
   d:=d div 2;
  end;
 if (n=2)or(n=7)or(n=61) then writeln(TRUE)
  else writeln(isp(2,n) and isp(7,n) and isp(61,n));
end.


