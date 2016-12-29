var a,b:string;
    i,j,n,m:integer;
    p:array[1..200]of integer;
begin
 readln(a);
 n:=length(a);
 readln(b);
 m:=length(b);
 j:=0;
 p[1]:=0;
 for i:=2 to m do
  begin
   while (j>0) and (b[j+1]<>b[i]) do j:=p[j];
   if b[j+1]=b[i] then inc(j);
   p[i]:=j;
  end;
 j:=0;
 for i:=1 to n do
  begin
   while (j>0) and (b[j+1]<>a[i]) do j:=p[j];
   if b[j+1]=a[i] then inc(j);
   if j=m then
    begin
     writeln(i-m+1);
     j:=p[j];
    end;
  end;
end.
