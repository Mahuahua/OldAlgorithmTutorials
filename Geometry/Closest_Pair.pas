type point=record
      x,y:extended;
     end;
var p,ope:array[1..100000]of point;
    n,i:longint;

procedure input(var a:point);
 begin
  readln(a.x,a.y);
 end;

procedure reading;
 begin
  readln(n);
  for i:=1 to n do
   input(p[i]);
 end;

procedure sort(l,r:longint);
 var i,j:longint;
     y:point;
     x:extended;
 begin
  i:=l;
  j:=r;
  x:=p[(l+r) shr 1].x;
  repeat
   while p[i].x<x do inc(i);
   while x<p[j].x do dec(j);
   if i<=j then
    begin
     y:=p[i];
     p[i]:=p[j];
     p[j]:=y;
     inc(i);
     dec(j);
    end;
  until i>j;
  if i<r then sort(i,r);
  if l<j then sort(l,j);
 end;

function distance(a,b:point):extended;
 begin
  exit(sqrt(sqr(a.x-b.x)+sqr(a.y-b.y)));
 end;

function min(x,y:extended):extended;
 begin
  if x<y then exit(x) else exit(y);
 end;

function closest(l,r:longint):extended;
 var ans:extended;
     i,j,mid,m:longint;
 begin

  if r-l+1=2 then
   exit(distance(p[l],p[r]));
  if r-l+1=3 then
   exit(min( min(distance(p[l],p[l+1]),distance(p[l+1],p[r])) , distance(p[l],p[r]) ));

  mid:=(l+r) shr 1;
  ans:=min(closest(l,mid),closest(mid+1,r));

  m:=0;
  for i:=l to r do
   if abs(p[i].x-p[mid].x)<=ans then
    begin
     inc(m);
     ope[m]:=p[i];
    end;
  for i:=1 to m-1 do
   for j:=i+1 to m do
    if (ope[i].y-ope[j].y)<=ans then
     ans:=min(ans,distance(ope[i],ope[j]));

  exit(ans);
 end;

begin
 reading;
 sort(1,n);
 writeln(closest(1,n));
end.