var a:array[1..500,1..500]of longint;
    f:array[1..500]of boolean;
    t:array[0..500]of longint;
    i,j,k,n,m,p,max,x:longint;
begin
 readln(m,n);
 for i:=1 to m do
  begin
   t[0]:=0;
   while not eoln do
    begin
     read(x);
     inc(t[0]);
     t[t[0]]:=x;
    end;
   for j:=1 to t[0]-1 do
    for k:=j+1 to t[0] do
     a[t[j],t[k]]:=1;
   readln;
  end;
 fillchar(f,sizeof(f),false);
 f[1]:=true;
 for i:=2 to n do
  begin
   max:=maxlongint;
   for j:=1 to n do
    if not f[j] and (a[1,j]>0) then
     if a[1,j]<max then
      begin
       max:=a[1,j];
       p:=j;
      end;
   f[p]:=true;
   for j:=1 to n do
    if (a[1,p]>0)and(a[p,j]>0) then
     if (a[1,j]>a[1,p]+a[p,j]) or (a[1,j]=0) then
      a[1,j]:=a[1,p]+a[p,j];
  end;
 if a[1,n]=0 then writeln('NO') else writeln(a[1,n]-1);
end.
