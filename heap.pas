var a:array[1..300000]of longint;
    i,j,n,x:longint;
procedure swap(var x,y:longint);
 var p:longint;
 begin
  p:=x;
  x:=y;
  y:=p;
 end;
procedure up(k:longint);
 begin
  while (k<>1)and(a[k div 2]<a[k]) do
   begin
    swap(a[k div 2],a[k]);
    k:=k div 2;
   end;
 end;
procedure down(k:longint);
 var mn:longint;
 begin
  while true do
   begin
    if (a[k*2]=0)and(a[k*2+1]=0) then exit;
    if (a[k*2+1]<>0)and(a[k*2]<a[k*2+1]) then mn:=k*2+1 else mn:=k*2;
    if a[k]>=a[mn] then exit
     else
      begin
       swap(a[mn],a[k]);
       k:=mn;
      end;
   end;
 end;
begin
 readln(n);
 for i:=1 to n do
  begin
   read(a[i]);
   up(i);
  end;
 for i:=1 to n do
  begin
   write(a[1],' ');
   swap(a[1],a[n-i+1]);
   a[n-i+1]:=0;
   down(1);
  end;
end.
