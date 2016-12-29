type node=record
      key,f,lc,rc:longint;
     end;

var a:array[1..100000]of node;
    n,m,t,root:longint;

function search(x,k:longint):longint;
 begin
  if k=0 then exit(0);
  if a[k].key=x then exit(k);
  if a[k].key>x
   then exit(search(x,a[k].lc))
   else exit(search(x,a[k].rc));
 end;

procedure le_rot(var k:longint);
 var y:longint;
 begin
  y:=a[k].rc;
  a[k].rc:=a[y].lc;
  if a[y].lc>0 then a[a[y].lc].f:=k;
  a[y].f:=a[k].f;
  if a[k].f=0
   then root:=y
   else if k=a[a[k].f].lc
    then y:=a[a[k].f].lc
    else y:=a[a[k].f].rc;
  k:=a[y].lc;
  a[k].f:=y;
 end;

procedure ri_rot(var k:longint);
 var y:longint;
 begin
  y:=a[k].lc;
  a[k].lc:=a[y].rc;
  if a[y].rc>0 then a[a[y].rc].f:=k;
  a[y].f:=a[k].f;
  if a[k].f=0
   then root:=y
   else if k=a[a[k].f].lc
    then y:=a[a[k].f].lc
    else y:=a[a[k].f].rc;
  k:=a[y].rc;
  a[k].f:=y;
 end;

procedure splay(k:longint);
 begin
  while a[k].f<>0 do
   begin
    if a[a[k].f].lc=k
     then ri_rot(a[k].f)
     else le_rot(a[k].f);
   end;
 end;

procedure insert(x,k:longint);
 begin
  if a[k].key=x then exit;
  if a[k].key>x then
   begin
    if a[k].lc=0 then
     begin
      inc(t);
      a[t].key:=x;
      a[t].f:=k;
      a[k].lc:=t;
      splay(t);
     end
    else insert(x,a[k].lc);
   end
  else
   begin
    if a[k].rc=0 then
     begin
      inc(t);
      a[t].key:=x;
      a[t].f:=k;
      a[k].rc:=t;
      splay(t);
     end
    else insert(x,a[k].rc);
   end;
 end;

procedure delete(k:longint);
 begin
  while (a[k].lc>0)or(a[k].rc>0) do
   begin
    if a[k].lc=0 then
     begin 
      le_rot(k);
      continue;
     end;
   if a[k].rc=0 then
    begin
     ri_rot(k);
     continue;
    end;
   end;
  if a[a[k].f].lc=k
   then a[a[k].f].lc:=0
   else a[a[k].f].rc:=0;
  splay(a[k].f);
 end;

procedure init;
 var i,x:longint;
 begin
  readln(n);
  fillchar(a,sizeof(a),0);
  root:=1;
  t:=1;
  read(x);
  a[1].key:=x;
  for i:=2 to n do
   begin
    read(x);
    insert(x,root);
   end;
  readln;
 end;

procedure main;
 var i,p,q:longint;
     ch,space:char;
 begin
  readln(m);
  for i:=1 to m do
   begin
    read(ch);
    read(space);
    readln(p);
    case ch of
     'I':insert(p,root);
     'S':begin
          q:=search(p,root);
          if q=0 then writeln('NO') else writeln('YES');
         end;
     'D':begin
          q:=search(p,root);
          delete(q);
         end; 
    end;
   end;
 end;

begin
 init;
 main;
end.
