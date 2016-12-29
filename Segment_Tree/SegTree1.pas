type stn=record
      b,e:longint;
      s:longint;
     end;
var a:array[1..200000]of stn;
    key:array[1..100000]of longint;
    k,n,i,x,y,m:longint;
procedure makeup(k,x,y:longint);
 var mid:longint;
 begin
  a[k].b:=x;
  a[k].e:=y;
  if x=y then
   begin
    a[k].s:=key[x];
    exit;
   end;
  mid:=(x+y) shr 1;
  makeup(k*2,x,mid);
  makeup(k*2+1,mid+1,y);
  a[k].s:=a[k*2].s+a[k*2+1].s;
 end;
procedure add(k,x,y:longint);
 var mid:longint;
 begin
  if (a[k].b=x)and(a[k].e=x) then
   begin
    a[k].s:=a[k].s+y;
    exit;
   end;
  mid:=(a[k].b+a[k].e) shr 1;
  if x<=mid then add(k*2,x,y) else add(k*2+1,x,y);
  a[k].s:=a[k].s+y;
 end;
function pri(k,x,y:longint):longint;
 var mid:longint;
 begin
  if (a[k].b=x)and(a[k].e=y) then exit(a[k].s);
  mid:=(a[k].b+a[k].e) shr 1;
  if y<=mid then exit(pri(k*2,x,y));
  if x>=mid+1 then exit(pri(k*2+1,x,y));
  exit(pri(k*2,x,mid)+pri(k*2+1,mid+1,y));
 end;
begin
 readln(n);
 for i:=1 to n do read(key[i]);
 makeup(1,1,n);
 readln(m);
 for i:=1 to m do
  begin
   readln(k,x,y);
   if k=0 then add(1,x,y);
   if k=1 then writeln(pri(1,x,y));
  end;
end.