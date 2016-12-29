var a,b:array[1..1000,1..1000]of longint;
    low,col,dep,cut:array[0..1000]of longint;
    n,m:longint;

procedure init;
 var i,x,y:longint;
 begin
  fillchar(a,sizeof(a),0);
  readln(n,m);
  for i:=1 to m do
   begin
    readln(x,y);
    a[x,y]:=1;
    a[y,x]:=1;
   end;
  fillchar(low,sizeof(low),0);
  fillchar(col,sizeof(col),0);
  fillchar(dep,sizeof(dep),0);
  fillchar(b,sizeof(b),0);
  fillchar(cut,sizeof(cut),0);
 end;

procedure dfs(x,f:longint);
 var i,tot:longint;
 begin
  col[x]:=1;
  dep[x]:=dep[f]+1;
  low[x]:=x;
  tot:=0;
  for i:=1 to n do
   if a[x,i]=1 then
    begin
     if (i<>f)and(col[i]=1)and(low[x]>dep[i])
      then low[x]:=dep[i];
     if col[i]=0 then
      begin
       dfs(i,x);
       inc(tot);
       if low[i]<low[x] then low[x]:=low[i];
       if ((x=1)and(tot>1))or((x<>1)and(low[i]>=dep[x]))
        then cut[x]:=1;
       if low[i]>dep[x] then b[x,i]:=1;
      end;
    end;
  col[x]:=2;
 end;

procedure outit;
 var i,j:longint;
 begin
  writeln('Cut Point:');
  for i:=1 to n do
   if cut[i]=1 then write(i,' ');
  writeln;
  writeln('Bridge:');
  for i:=1 to n do
   for j:=1 to n do
    if b[i,j]=1 then writeln('(',i,',',j,')');
 end;

begin
 init;
 dfs(1,0);
 outit;
end.
