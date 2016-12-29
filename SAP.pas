var a,c,f:array[1..100,1..100]of longint;
    n,m,delta,s,t,total,cost:longint;

procedure readin;
 var i,j,x,y,z,w:longint;
 begin
  readln(n,m);
  fillchar(a,sizeof(a),0);
  fillchar(c,sizeof(c),0);
  fillchar(f,sizeof(f),0);
  for i:=1 to m do
   begin
    readln(x,y,z,w);
    a[x,y]:=z;
    c[x,y]:=w;
   end;
  for i:=1 to n do
   for j:=1 to n do
    if (i<>j) and (c[i,j]=0) then c[i,j]:=99999999;
  readln(s,t);
 end; 

procedure SPFA;
 var q,d,p,dis:array[1..200]of longint;
     v:array[1..200]of boolean;
     head,tail,i,x:longint;
 begin
  fillchar(q,sizeof(q),0);
  fillchar(d,sizeof(d),0);
  fillchar(v,sizeof(v),false);
  fillchar(p,sizeof(p),0);
  head:=0;
  tail:=0;
  for i:=1 to n do
   if (a[s,i]>0)or(i=s)
    then dis[i]:=c[s,i]
    else dis[i]:=99999999;
  for i:=1 to n do
   if (dis[i]>0)and(dis[i]<>99999999) then
    begin
     inc(tail);
     q[tail]:=i;
     v[i]:=true;
     d[i]:=a[s,i];
     p[i]:=s;
    end;
  d[s]:=maxlongint;
  while head<>tail do
   begin
    inc(head);
    x:=q[head];
    v[x]:=false;
    for i:=1 to n do
     if (a[x,i]>0)and(dis[x]+c[x,i]<dis[i]) then
      begin
       dis[i]:=dis[x]+c[x,i];
       p[i]:=x;
       if d[x]<a[x,i] then d[i]:=d[x] else d[i]:=a[x,i];
       if v[i]=false then
        begin
         inc(tail);
         q[tail]:=i;
         v[i]:=true;
        end;
      end;
   end;
  delta:=d[t];
  if delta=0 then exit;
  x:=t;
  while p[x]>0 do
   begin
    a[p[x],x]:=a[p[x],x]-delta;
    a[x,p[x]]:=a[x,p[x]]+delta;
    f[p[x],x]:=f[p[x],x]+delta;
    f[x,p[x]]:=f[x,p[x]]-delta;
    x:=p[x];
   end;
 end;

procedure main;
 begin
  total:=0;
  cost:=0;
  while true do
   begin
    delta:=0;
    SPFA;
    if delta=0 then break;
    total:=total+delta;
   end;
  writeln(total);
  writeln(cost);
 end;

begin
 readin;
 main;
end.
