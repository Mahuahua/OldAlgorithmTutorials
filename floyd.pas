var a:array[1..100,1..100]of longint;
    i,j,k,n:longint;
begin
 readln(n);
 for i:=1 to n do
  begin
   for j:=1 to n do
    begin
     read(a[i,j]);
     if (i<>j)and(a[i,j]=0) then a[i,j]:=999999999;
    end;
   readln;
  end;
 for k:=1 to n do
  for i:=1 to n do
   for j:=1 to n do
    if (i<>j)and(j<>k)and(i<>k) then
     if a[i,j]>a[i,k]+a[k,j] then
      a[i,j]:=a[i,k]+a[k,j];
 for i:=1 to n do
  begin
   for j:=1 to n do write(a[i,j],' ');
   writeln;
  end;
end.
