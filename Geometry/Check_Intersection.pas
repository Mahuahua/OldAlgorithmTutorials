type point=record
      x,y:extended;
     end;
     precord=record
      p:point;
      k,num:longint;
     end;
     segment=record
      a,b:point;
     end;
var p:array[1..1000]of precord;
    s:array[1..500]of segment;
    n,i:longint;

procedure input(var a:point);
 begin
  readln(a.x,a.y);
 end;

procedure reading;
 var i:longint;
     q:point;
 begin
  readln(n);
  for i:=1 to n do
   begin
    input(s[i].a);
    input(s[i].b);
    if s[i].a.x>s[i].b.x then
     begin
      q:=s[i].a;
      s[i].a:=s[i].b;
      s[i].b:=q;
     end;
    p[i*2-1].p:=s[i].a;
    p[i*2].p:=s[i].b;
    p[i*2-1].num:=i;
    p[i*2].num:=i;
    p[i*2-1].k:=1;
    p[i*2].k:=2;
   end;
 end;

procedure sort;
 var i,j:longint;
     q:precord;
 begin
  for i:=1 to 2*n-1 do
   for j:=i+1 to 2*n do
    if p[i].p.x>p[j].p.x then
     begin
      q:=p[i];
      p[i]:=p[j];
      p[j]:=q;
     end;
 end;

function inters_y(var u:segment;k:extended):extended;
 var a,b:point;
 begin
  a:=u.a;b:=u.b;
  exit(a.y+abs(a.x-k)/abs(a.x-b.x)*(b.y-a.y));
 end;

function area(var a,b,c:point):extended;
 begin
  exit((a.x-c.x)*(b.y-c.y)-(b.x-c.x)*(a.y-c.y));
 end;

function clockw(var a,b,c:point):boolean;
 begin
  exit(area(a,b,c)>0);
 end;

function cross(var u,v:segment):boolean;
 var a,b,c,d:point;
 begin
  a:=u.a;b:=u.b;c:=v.a;d:=v.b;
  exit((clockw(a,d,c) xor clockw(b,d,c))and(clockw(c,b,a) xor clockw(d,b,a)));
 end;

procedure intersection_judge;
 var t:array[1..1000]of segment;
     i,m,j,w:longint;
     u:segment;
     inte:point;
 begin

  m:=0;
  for i:=1 to 2*n do
   begin
    u:=s[p[i].num];
    if p[i].k=1 then
     begin
      inte.x:=p[i].p.x;
      for j:=1 to m+1 do
       begin
        if j=m+1 then break;
        inte.y:=inters_y(t[j],inte.x);
        if p[i].p.y<inte.y then break;
       end;
      w:=j;
      for j:=m downto w+1 do
       t[j+1]:=t[j];
      t[w]:=u;
      inc(m);
      if ((w-1>0)and cross(t[w-1],t[w]))or((w+1<=m)and cross(t[w],t[w+1])) then
       begin
        writeln(TRUE);
        exit;
       end;
     end;
    if p[i].k=2 then
     begin
      for j:=1 to m do
       if (t[j].b.x=p[i].p.x)and(t[j].b.y=p[i].p.y) then
        break;
      w:=j;
      if (w-1>0)and(w+1<=m)and cross(t[w-1],t[w+1]) then
       begin
        writeln(TRUE);
        exit;
       end;
      for j:=w+1 to m do
       t[j-1]:=t[j];
      dec(m);
     end;
   end;
  writeln(FALSE);

 end;

begin
 reading;
 sort;
 intersection_judge;
end.
