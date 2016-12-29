type stn=record
      b,e:longint;
      m:longint;
     end;
var a:array[1..200000]of stn;
    key:array[1..100000]of longint;
    n,i,m,k,x,y:longint;
function min(x,y:longint):longint;
 begin
  if x<y then exit(x) else exit(y);
 end;
procedure makeup(k,x,y:longint);
 var mid:longint;
 begin
  a[k].b:=x;
  a[k].e:=y;
  if x=y then
   begin
    a[k].m:=key[x];
    exit;
   end;
  mid:=(x+y) shr 1;
  makeup(k*2,x,mid);
  makeup(k*2+1,mid+1,y);
  a[k].m:=min(a[k*2].m,a[k*2+1].m);
 end;
function mun(k,x,y:longint):longint;
 var mid:longint;
 begin
  if (a[k].b=x)and(a[k].e=y) then exit(a[k].m);
  mid:=(a[k].b+a[k].e) shr 1;
  if y<=mid then exit(mun(k*2,x,y));
  if x>=mid+1 then exit(mun(k*2+1,x,y));
  exit(min(mun(k*2,x,mid),mun(k*2+1,mid+1,y)));
 end;
function mof(k,x,y:longint):longint;
 var mid:longint;
 begin
  if (a[k].b=x)and(a[k].e=x) then
   begin
    a[k].m:=min(a[k].
begin
 readln(n);
 for i:=1 to n do read(key[i]);
 makeup(1,1,n);
 readln(m);
 for i:=1 to n do
  begin
   readln(k,x,y);
   if k=0 then writeln(mun(1,x,y));
   if k=1 then mof(1,x,y);
  end;
end.