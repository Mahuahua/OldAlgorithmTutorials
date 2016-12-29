var map:array[1..1000,1..1000] of boolean;
    match:array[1..1000] of integer;
    chk:array[1..1000] of boolean;
    m,n,i,t1,t2,ans,k:integer;
function dfs(p:integer):boolean;
 var i,t:integer;
 begin
  for i:=1 to k do
   if map[p,i] and not chk[i] then
    begin
     chk[i]:=true;
     if (match[i]=0) or dfs(match[i]) then
      begin
       match[i]:=p;
       exit(true);
      end;
    end;
  exit(false);
 end;
begin
 readln(n,m);
 fillchar(map,sizeof(map),0);
 k:=0;
 for i:=1 to m do
  begin
   readln(t1,t2);
   map[t1,t2]:=true;
   if k<t2 then k:=t2;
  end;
 fillchar(match,sizeof(match),0);
 ans:=0;
 for i:=1 to n do
  begin
   fillchar(chk,sizeof(chk),0);
   if dfs(i) then inc(ans);
  end;
 writeln(ans);
end.
