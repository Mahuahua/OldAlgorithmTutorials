var a,f,g:array[1..50,1..50]of longint;
    h,e,q:array[1..50]of longint;
    flag:array[1..50]of boolean;
    n,s,t,head,tail:longint;

procedure readin;
 var i,j:longint;
 begin
  readln(n);
  for i:=1 to n do
   begin
    for j:=1 to n do read(a[i,j]);
    readln;
   end;
 end;

function min(x,y:longint):longint;
 begin
  if x<y then exit(x) else exit(y);
 end;

procedure init;
 var i,j:longint;
 begin
  fillchar(h,sizeof(h),0);
  fillchar(e,sizeof(e),0);
  fillchar(f,sizeof(f),0);
  fillchar(q,sizeof(q),0);
  fillchar(flag,sizeof(flag),false);
  h[s]:=n;
  head:=1;
  tail:=0;
  for i:=1 to n do
   if a[s,i]>0 then
    begin
     f[s,i]:=a[s,i];
     f[i,s]:=-a[s,i];
     e[i]:=a[s,i];
     tail:=tail mod n+1;
     q[tail]:=i;
     flag[i]:=true;
    end;
 end;

procedure get_g;
 var i,j:longint;
 begin
  for i:=1 to n do
   for j:=1 to n do
    g[i,j]:=a[i,j]-f[i,j];
 end;

function can_push(u:longint):longint;
 var i:longint;
 begin
  if (e[u]=0)or(u=s)or(u=t) then exit(-1);
  for i:=1 to n do
   if (g[u,i]>0)and(h[u]=h[i]+1) then
    exit(i);
  exit(0);
 end;

procedure push(u,v:longint);
 var d:longint;
 begin
  d:=min(e[u],g[u,v]);
  f[u,v]:=f[u,v]+d;
  f[v,u]:=-f[u,v];
  g[u,v]:=a[u,v]-f[u,v];
  g[v,u]:=a[v,u]-f[v,u];
  e[u]:=e[u]-d;
  e[v]:=e[v]+d;
 end;

procedure lift(u:longint);
 var i,mi:longint;
 begin
  mi:=maxlongint;
  for i:=1 to n do
   if g[u,i]>0 then
    mi:=min(mi,h[i]);
  h[u]:=mi+1;
 end;

procedure flow;
 var i,k,ans:longint;
 begin
  init;
  get_g;
  while head<>tail mod n+1 do
   begin
    repeat
     k:=can_push(q[head]);
     if k=-1 then
      begin
       flag[q[head]]:=false;
       q[head]:=0;
       head:=head mod n+1;
       break;
      end;
     if k=0 then lift(q[head]);
     if k>0 then
      begin
       push(q[head],k);
       if (flag[k]=false)and(e[k]>0)and(k<>t) then
        begin
         flag[k]:=true;
         tail:=tail mod n+1;
         q[tail]:=k;
        end;
       break;
      end;
    until false;
   end;
 end;

procedure outit;
 var i,ans:longint;
 begin
  ans:=0;
  for i:=1 to n do
   ans:=ans+f[i,t];
  writeln(ans);
 end;

begin
 readin;
 s:=1;
 t:=n;
 flow;
 outit;
end.
