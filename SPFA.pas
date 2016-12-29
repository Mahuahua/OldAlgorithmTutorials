var a:array[1..1000,1..1000]of longint;
    n,i,j,h,t,r,x:longint;
    v:array[1..1000]of boolean;
    q,dis:array[1..1000]of longint;
begin
 readln(n);
 for i:=1 to n do
  begin
   for j:=1 to n do
    begin
     read(a[i,j]);
     if (i<>j)and(a[i,j]=0) then a[i,j]:=99999999;
    end;
   readln;
  end;
 readln(r);
 fillchar(q,sizeof(q),0);
 fillchar(v,sizeof(v),false);
 h:=0;
 for i:=1 to n do dis[i]:=a[r,i];
 t:=0;
 for i:=1 to n do
  if (a[r,i]>0)and(a[r,i]<>99999999) then
   begin
    inc(t);
    q[t]:=i;
    v[i]:=true;
   end;
 while h<>t do
  begin
   h:=(h mod n)+1;
   x:=q[h];
   v[x]:=false;
   for i:=1 to n do
    if dis[x]+a[x,i]<dis[i] then
     begin
      dis[i]:=dis[x]+a[x,i];
      if v[i]=false then
       begin
        t:=(t mod n)+1;
        q[t]:=i;
        v[i]:=true;
       end;
     end;
  end;
 for i:=1 to n do write(dis[i],' ');
end.