type stn=record
      b,e:longint;
      ad:longint;
     end;
var a:array[1..200000]of stn;
    key:array[1..100000]of longint;
    k,n,i,x,y,z,m:longint;
procedure makeup(k,x,y:longint);
 var mid:longint;
 begin
  a[k].b:=x;
  a[k].e:=y;
  if x=y then exit;
  mid:=(x+y) shr 1;
  makeup(k*2,x,mid);
  makeup(k*2+1,mid+1,y);
 end;
procedure add(k,x,y,z:longint);
 var mid:longint;
 begin
  if (a[k].b=x)and(a[k].e=y) then
   begin
    a[k].ad:=a[k].ad+z;
    exit;
   end;
  mid:=(a[k].b+a[k].e) shr 1;
  if y<=mid then
   begin
    add(k*2,x,y,z);
    exit;
   end;
  if x>=mid+1 then
   begin
    add(k*2+1,x,y,z);
    exit;
   end;
  add(k*2,x,mid,z);
  add(k*2+1,mid+1,y,z);
 end;
function que(k,x:longint):longint;
 var mid:longint;
 begin
  if (a[k].b=x)and(a[k].e=x) then exit(a[k].ad);
  mid:=(a[k].b+a[k].e) shr 1;
  if x<=mid then exit(a[k].ad+que(k*2,x));
  if x>=mid+1 then exit(a[k].ad+que(k*2+1,x));
 end;
begin
 readln(n);
 for i:=1 to n do read(key[i]);
 makeup(1,1,n);
 readln(m);
 for i:=1 to m do
  begin
   read(k);
   if k=0 then
    begin
     readln(x,y,z);
     add(1,x,y,z);
    end;
   if k=1 then
    begin
     readln(x);
     writeln(que(1,x)+key[x]);
    end;
  end;
end.7