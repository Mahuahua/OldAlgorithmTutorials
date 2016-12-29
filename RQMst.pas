var f:array[1..100000,0..23]of longint;
    d:array[0..18]of longint;
    a:array[1..100000]of longint;
    i,j,k,n,h,m,x,y:longint;
function log2(s:longint):longint;
 begin
  exit(trunc(ln(s)/ln(2)));
 end;
function max(x,y:longint):longint;
 begin
  if x>y then exit(x) else exit(y);
 end;
begin
 readln(n);
 for i:=1 to n do
  read(a[i]);
 h:=log2(n);
 d[0]:=1;
 for i:=1 to h do d[i]:=d[i-1]*2;
 for i:=1 to n do
  f[i,0]:=a[i];
 for j:=1 to h do
  for i:=1 to n do
   if i+d[j]-1<=n then
    f[i,j]:=max(f[i,j-1],f[i+d[j-1],j-1]);
 readln(m);
 for i:=1 to m do
  begin
   readln(x,y);
   if x=y then writeln(a[x])
    else
     begin
      k:=log2(y-x+1);
      writeln(max(f[x,k],f[y-d[k]+1,k]));
     end;
  end;
end.