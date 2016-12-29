var a:array[1..1000,1..1000]of longint;
    b,flag:array[1..1000]of longint;
    n,i,j,m,k:longint;

procedure dfs(x:longint);
 var j:longint;
 begin
  flag[x]:=1;
  for j:=1 to n do
   if (flag[j]=0)and(a[x,j]>0) then dfs(j);
  inc(m);
  b[m]:=x;
 end;

procedure fill(x,k:longint);
 var j:longint;
 begin
  flag[x]:=k;
  for j:=n downto 1 do
   if (flag[b[j]]=0)and(a[b[j],x]>0) then fill(b[j],k);
 end;

begin

 readln(n);
 for i:=1 to n do
  begin
   for j:=1 to n do read(a[i,j]);
   readln;
  end;
 m:=0;
 fillchar(flag,sizeof(flag),0);
 for i:=1 to n do
  if flag[i]=0 then dfs(i);

 fillchar(flag,sizeof(flag),0);
 k:=0;
 for i:=n downto 1 do
  if flag[b[i]]=0 then
   begin
    inc(k);
    fill(b[i],k);
   end;

 for i:=1 to k do
  begin
   for j:=1 to n do
    if flag[j]=i then write(j,' ');
   writeln;
  end;

end.
