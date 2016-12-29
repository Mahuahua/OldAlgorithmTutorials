var ask,a:array[1..1000,0..1000]of longint;
    fa,f,flag:array[1..1000]of longint;
    n,i,j,m,x,y,root:longint;
function father(x:longint):longint;
 var ans:longint;
 begin
  if fa[x]=x then ans:=x else ans:=father(fa[x]);
  fa[x]:=ans;
  exit(ans);
 end;
procedure tarjan(x:longint);
 var i:longint;
 begin
  fa[x]:=x;
  for i:=1 to a[x,0] do
   if flag[a[x,i]]=0 then
    begin
     tarjan(a[x,i]);
     fa[a[x,i]]:=x;
    end;
  flag[x]:=1;
  for i:=1 to n do
   if ask[x,i]=1 then
    if flag[i]=1 then
     begin
      writeln(x,' ',i,' :',father(i));
      ask[x,i]:=0;
      ask[i,x]:=0;
     end;
 end;
begin
 readln(n);
 for i:=1 to n do
  begin
   read(a[i,0]);
   for j:=1 to a[i,0] do
    begin
     read(a[i,j]);
     f[a[i,j]]:=i;
    end;
   readln;
  end;
 readln(m);
 for i:=1 to m do
  begin
   readln(x,y);
   ask[x,y]:=1;
   ask[y,x]:=1;
  end;
 for i:=1 to n do
  if f[i]=0 then root:=i;
 tarjan(root);
end.