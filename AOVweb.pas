var a:array[1..200,1..200]of longint;
    r:array[1..200]of longint;
    f:array[1..200]of boolean;
    i,j,k,n:longint;
begin
 readln(n);
 fillchar(r,sizeof(r),0);
 for i:=1 to n do
  begin
   for j:=1 to n do
    begin
     read(a[i,j]);
     if a[i,j]>0 then inc(r[j]);
    end;
   readln;
  end;
 for k:=1 to n do
  for i:=1 to n do
   if (r[i]=0) and not f[i] then
    begin
     for j:=1 to n do
      if a[i,j]>0 then
       dec(r[j]);
     f[i]:=true;
     write(i,' ');
     break;
    end;
end.