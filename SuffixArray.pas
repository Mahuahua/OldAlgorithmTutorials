var t,sa,rank,y,v:array[1..100001]of longint;
    d:array[0..1000]of longint;
    n,m:longint;

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

procedure outit;
 var i:longint;
 begin
  for i:=1 to n do write(sa[i],' ');
  writeln;
  for i:=1 to n do write(rank[i],' ');
 end;

begin
 init;
 makeup;
 outit;
end.
