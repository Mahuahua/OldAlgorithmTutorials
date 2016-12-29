type point=record
      x,y:extended;
     end;
     segment=record
      a,b:point;
     end;

var u,v:segment;

procedure input(var a:point);
 begin
  readln(a.x,a.y);
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

function inters_x(var u,v:segment):extended;
 var a,b,c,d:point;
 begin
  a:=u.a;b:=u.b;c:=v.a;d:=v.b;
  exit((area(d,b,a)*c.x-area(c,b,a)*d.x)/(area(d,b,a)-area(c,b,a)));
 end;

function inters_y(var u,v:segment):extended;
 var a,b,c,d:point;
 begin
  a:=u.a;b:=u.b;c:=v.a;d:=v.b;
  exit((area(d,b,a)*c.y-area(c,b,a)*d.y)/(area(d,b,a)-area(c,b,a)));
 end;

begin
 input(u.a);
 input(u.b);
 input(v.a);
 input(v.b);
 if cross(u,v) then writeln(inters_x(u,v),' ',inters_y(u,v));
end.
