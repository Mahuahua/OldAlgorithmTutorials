var t,sa,rank,y,v,height:array[1..100001]of longint;
    f:array[1..100000,0..23]of longint;
    two:array[0..18]of longint;
    d:array[0..1000]of longint;
    n,m,h,que:longint;

function log2(s:longint):longint;
 begin
  exit(trunc(ln(s)/ln(2)));
 end;

function min(x,y:longint):longint;
 begin
  if x<y then exit(x) else exit(y);
 end;

procedure init;
 var i:longint;
     ch:char;
 begin
  readln(n);
  m:=0;
  for i:=1 to n do
   begin
    read(ch);
    t[i]:=ord(ch)-ord('a')+1;
    rank[i]:=t[i];
    if t[i]>m then m:=t[i];
   end;
  inc(n);
  t[n]:=0;
 end;

procedure makeup;
 var i,j,p:longint;
 begin
  fillchar(d,sizeof(d),0);
  p:=0;
  for i:=1 to n do
   begin
    if d[rank[i]]=0 then inc(p); 
    inc(d[rank[i]]);
   end;
  for i:=1 to m do d[i]:=d[i]+d[i-1];
  for i:=n downto 1 do
   begin
    sa[d[t[i]]]:=i;
    dec(d[t[i]]);
   end;
  j:=1;
  while p<n do
   begin
    p:=0;
    for i:=n-j+1 to n do
     begin
      inc(p);
      y[p]:=i;
     end;
    for i:=1 to n do
     if sa[i]>j then
      begin
       inc(p);
       y[p]:=sa[i]-j;
      end;
    for i:=1 to n do v[i]:=rank[y[i]];
    fillchar(d,sizeof(d),0);
    for i:=1 to n do inc(d[v[i]]);
    for i:=1 to m do d[i]:=d[i]+d[i-1];
    for i:=n downto 1 do
     begin
      sa[d[v[i]]]:=y[i];
      dec(d[v[i]]);
     end;
    for i:=0 to n do y[i]:=rank[i];
    p:=1;
    rank[sa[1]]:=1;
    for i:=2 to n do
     if (y[sa[i]]=y[sa[i-1]]) and (y[sa[i]+j]=y[sa[i-1]+j])
      then rank[sa[i]]:=p
      else
       begin
        inc(p);
        rank[sa[i]]:=p;
       end;
    m:=p;
    j:=j*2;
   end;
  dec(n);
  for i:=1 to n do
   begin
    sa[i]:=sa[i+1];
    dec(rank[i]);
   end;
 end;

procedure get_height;
 var i,j,k:longint;
 begin
  k:=0;
  for i:=1 to n do
   begin
    if rank[i]=1 then
     begin
      height[i]:=0;
      continue;
    end;
    if k>0 then dec(k);;
    j:=sa[rank[i]-1];
    while t[i+k]=t[j+k] do inc(k);
    height[rank[i]]:=k;
   end;
 end;

procedure init_RMQ;
 var i,j:longint;
 begin
  h:=log2(n);
  two[0]:=1;
  for i:=1 to h do two[i]:=two[i-1]*2;
  for i:=1 to n do f[i,0]:=height[i];
  for j:=1 to h do
   for i:=1 to n do
    if i+two[j]-1<=n then
     f[i,j]:=min(f[i,j-1],f[i+two[j-1],j-1]);
 end;

procedure main;
 var i,p,q,k,tmp:longint;
 begin
  {for i:=1 to n do write(sa[i],' ');
  writeln;
  for i:=1 to n do write(rank[i],' ');
  writeln;
  for i:=1 to n do write(height[i],' ');}
  readln(que);
  for i:=1 to que do
   begin
    readln(p,q);
    p:=rank[p];
    q:=rank[q];
    if p>q then
     begin
      tmp:=p;
      p:=q;
      q:=tmp;
     end;
    inc(p);
    if p=q then writeln(height[p])
     else
      begin
       k:=log2(q-p+1);
       writeln(min(f[p,k],f[q-two[k]+1,k]));
      end;
   end;
 end;

begin
 init;
 makeup;
 get_height;
 init_RMQ;
 main;
end.
