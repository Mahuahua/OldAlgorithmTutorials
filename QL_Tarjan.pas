var a,kl:array[1..1000,1..1000]of longint;
    d,f,low,stack:array[1..1000]of longint;
    i,j,n,time,h:longint;

procedure dfs(x:longint);
 var i:longint;
 begin
  inc(time);
  d[x]:=time;
  inc(h);
  stack[h]:=x;
  for i:=1 to n do
   if a[x,i]>0 then
    begin
     if d[i]=0 then
      begin
       kl[x,i]:=1;
       dfs(i);
      end;
     if (d[i]>0)and(f[i]=0) then kl[x,i]:=2;
     if f[i]>0 then
      begin
       if d[x]>d[i] then kl[x,i]:=3 else kl[x,i]:=4;
      end;
    end;
  inc(time);
  f[x]:=time;
  for i:=1 to n do
   if a[x,i]>0 then
    if (f[low[i]]=0)and(d[low[i]]<d[low[x]])and(d[low[i]]>0) then
     low[x]:=low[i];
  if low[x]=x then
   begin
    while stack[h]<>x do
     begin
      write(stack[h],' ');
      dec(h);
     end;
    writeln(stack[h]);
    dec(h);
   end;
 end;

begin

 readln(n);
 for i:=1 to n do
  begin
   for j:=1 to n do read(a[i,j]);
   readln;
  end;

 fillchar(d,sizeof(d),0);
 fillchar(d,sizeof(d),0);
 for i:=1 to n do low[i]:=i;
 time:=0;
 fillchar(stack,sizeof(stack),0);
 h:=0;
 for i:=1 to n do
  if d[i]=0 then dfs(i);

end.
