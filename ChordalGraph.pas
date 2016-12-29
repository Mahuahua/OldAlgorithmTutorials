var a:array[1..1000,1..1000]of longint;
    v:array[1..1000]of boolean;
    sa,sc:array[1..1000]of longint;
    n,m:longint;

procedure readin;
 var i,x,y:longint;
 begin
  readln(n,m);
  if (n=0)and(m=0) then halt;
  fillchar(a,sizeof(a),0);
  for i:=1 to m do
   begin
    readln(x,y);
    a[x,y]:=1;
    a[y,x]:=1;
   end;
 end;

procedure select;
 var max,mn,i,j,num,q:longint;
 begin
  fillchar(v,sizeof(v),false);
  sa[n]:=1;
  v[1]:=true;
  for num:=n-1 downto 1 do
   begin
    max:=0;
    mn:=0;
    for i:=1 to n do
     begin
      if v[i] then continue;
      q:=0;
      for j:=n downto num+1 do
       if a[i,sa[j]]=1 then inc(q);
      if q>max then
       begin
        max:=q;
        mn:=i;
       end;
     end;
    sa[num]:=mn;
    v[mn]:=true;
   end;
 end;

function check:boolean;
 var num,k,i:longint;
 begin
  for num:=1 to n do
   begin
    k:=0;
    for i:=num+1 to n do
     if a[sa[num],sa[i]]=1 then
      begin
       inc(k);
       sc[k]:=sa[i];
      end;
    if k<=1 then continue;
    for i:=2 to k do
     if a[sc[1],sc[i]]=0 then exit(false);
   end;
  exit(true);
 end;

begin
 while true do
  begin
   readin;
   select;
   if check
    then writeln('Perfect')
    else writeln('Imperfect');
   writeln;
  end;
end.
