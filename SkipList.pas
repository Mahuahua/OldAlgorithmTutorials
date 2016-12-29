type poi=^node;
     node=record
      key,hig:longint;
      nxt,blw:poi;
     end;
var hed,upd,tai:array[1..50]of poi;
    n,m,h:longint;

procedure init(h:longint);
 begin
  new(hed[h]);
  new(tai[h]);
  hed[h]^.nxt:=tai[h];
  hed[h]^.key:=-999999999;
  hed[h]^.hig:=0;
  if h>1
   then hed[h]^.blw:=hed[h-1]
   else hed[h]^.blw:=nil;
  tai[h]^.key:=999999999;
  tai[h]^.hig:=h;
  if h>1
   then tai[h]^.blw:=tai[h-1]
   else tai[h]^.blw:=nil;
 end;

function search(x:longint):boolean;
 var p:poi;
     i:longint;
     an:boolean;
 begin
  p:=hed[h];
  an:=false;
  for i:=h downto 1 do
   begin
    while p^.nxt^.key<x do p:=p^.nxt;
    if p^.nxt^.key=x then an:=true;
    upd[i]:=p;
    if i>1 then p:=p^.blw;
   end;
  exit(an);
 end;

procedure insert(x:longint);
 var p,tmp:poi;
     r:extended;
     l:longint;
     eis:boolean;
 begin
  eis:=search(x);
  if eis then exit;
  l:=0;
  randomize;
  tmp:=nil;
  repeat
   inc(l);
   if l>h then
    begin
     inc(h);
     init(h);
     upd[h]:=hed[h];
    end;
   new(p);
   p^.key:=x;
   p^.hig:=l;
   p^.nxt:=upd[l]^.nxt;
   upd[l]^.nxt:=p;
   p^.blw:=tmp;
   tmp:=p;
   r:=random;
  until r>0.4;
 end;

procedure delete(x:longint);
 var p:poi;
     i:longint;
     esi:boolean;
 begin
  esi:=search(x);
  if not esi then exit;
  for i:=h downto 1 do
   begin
    p:=upd[i]^.nxt;
    upd[i]^.nxt:=p^.nxt;
    dispose(p);
    if hed[i]^.nxt=tai[i] then
     begin
      dispose(hed[i]);
      dispose(tai[i]);
      dec(h);
     end;
   end;
 end;

procedure main;
 var i,x:longint;
     ch,space:char;
 begin
  readln(n);
  for i:=1 to n do
   begin
    read(x);
    insert(x);
   end;   
  readln(m);
  for i:=1 to m do
   begin
    readln(ch,space,x);
    case ch of
     'F':writeln(search(x));
     'I':insert(x);
     'D':delete(x);
    end;
   end;
 end;

begin
 init(1);
 main;
end.
