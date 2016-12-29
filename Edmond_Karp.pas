var a:array[1..100,1..100]of longint;
    n,m,delta,s,t,total:longint;

procedure readin;
 var i,x,y,z:longint;
 begin
  readln(n,m);
  fillchar(a,sizeof(a),0);
  for i:=1 to m do
   begin
    readln(x,y,z);
    a[x,y]:=z;
   end;
  readln(s,t);
 end; 

procedure bfs;
 var q,d,f,p:array[1..200]of longint;
     head,tail,i,x:longint;
 begin
  fillchar(q,sizeof(q),0);
  fillchar(d,sizeof(d),0);
  fillchar(f,sizeof(f),0);
  fillchar(p,sizeof(p),0);
  head:=1;
  tail:=2;
  q[1]:=s;
  d[1]:=maxlongint;
  f[s]:=1;
  p[s]:=0;
  while head<>tail do
   begin
    if q[head]=t then
     begin
      delta:=d[head];
      break;
     end;
    for i:=1 to n do
     if (a[q[head],i]>0)and(f[i]=0) then
      begin
       f[i]:=1;
       q[tail]:=i;
       if d[head]>a[q[head],i]
        then d[tail]:=a[q[head],i]
        else d[tail]:=d[head];
       inc(tail);
       p[i]:=q[head];
      end;
    inc(head);
   end;
  if delta=0 then exit;
  x:=t;
  while p[x]>0 do
   begin
    a[p[x],x]:=a[p[x],x]-delta;
    a[x,p[x]]:=a[x,p[x]]+delta;
    x:=p[x];
   end;
 end;

procedure main;
 begin
  total:=0;
  while true do
   begin
    delta:=0;
    bfs;
    if delta=0 then break;
    total:=total+delta;
   end;
  writeln(total);
 end;

begin
 readin;
 main;
end.
