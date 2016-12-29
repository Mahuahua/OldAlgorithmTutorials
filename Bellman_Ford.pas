var a:array[1..1000,1..1000]of longint;
    n,i,j,r,k:longint;
    dis:array[1..1000]of longint;
begin
 readln(n);
 for i:=1 to n do
  begin
   for j:=1 to n do
    begin
     read(a[i,j]);
     if (i<>j)and(a[i,j]=0) then a[i,j]:=99999999;
    end;
   readln;
  end;
 readln(r);
 for i:=1 to n do dis[i]:=a[r,i];
 for k:=1 to n-1 do
  for i:=1 to n do
   for j:=1 to n do
    if a[i,j]=1 then
     if dis[i]+a[i,j]<dis[j] then
      dis[j]:=dis[i]+a[i,j];
 for i:=1 to n do
  for j:=1 to n do
   if dis[i]+a[i,j]<dis[j] then
    begin
     writeln('FALSE');
     exit;
    end;
 for i:=1 to n do write(dis[i],' ');
end.