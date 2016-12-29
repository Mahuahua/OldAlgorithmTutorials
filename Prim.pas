var a:array[1..1000,1..1000]of longint;
    c,d,f:array[1..1000]of longint;
    min,mn,ans,i,j,n:longint;
begin
 readln(n);
 for i:=1 to n do
  begin
   for j:=1 to n do read(a[i,j]);
   readln;
  end;
 fillchar(f,sizeof(f),0);
 f[1]:=1;
 for i:=2 to n do
  begin
   d[i]:=1;
   c[i]:=a[i,1];
  end;
 ans:=0;
 for i:=2 to n do
  begin
   min:=10000000;
   for j:=1 to n do
    if (f[j]=0)and(c[j]<min)and(c[j]<>0) then
     begin
      mn:=j;
      min:=c[j];
     end;
   f[mn]:=1;
   ans:=ans+min;
   for j:=1 to n do
    if (f[j]=0)and((c[j]>a[j,mn])or(c[j]=0))and(a[j,mn]<>0) then
     begin
      c[j]:=a[j,mn];
      d[j]:=mn;
     end;
  end;
 writeln(ans);
end.

