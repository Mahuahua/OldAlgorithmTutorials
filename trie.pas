type rec=record
      w:boolean;
      next:array['a'..'z']of longint;
     end;
var i,j,n,now,l,m,k:longint;
    s:string;
    a:array[1..10000]of rec;
    flag:boolean;
begin
 readln(n);
 m:=1;
 a[1].w:=false;
 fillchar(a[1].next,sizeof(a[1].next),0);
 for i:=1 to n do
  begin
   readln(s);
   l:=length(s);
   now:=1;
   for j:=1 to l do
    if a[now].next[s[j]]>0 then now:=a[now].next[s[j]]
    else
     begin
      inc(m);
      a[m].w:=false;
      fillchar(a[m].next,sizeof(a[m].next),0);
      a[now].next[s[j]]:=m;
      now:=m;
     end;
   a[now].w:=true;
  end;
 readln(k);
 for i:=1 to k do
  begin
   readln(s);
   l:=length(s);
   now:=1;
   flag:=true;
   for j:=1 to l do
    if a[now].next[s[j]]>0 then now:=a[now].next[s[j]]
    else
     begin
      flag:=false;
      break;
     end;
   if a[now].w=false then flag:=false;
   if flag then writeln(' exist') else writeln(' not exist');
  end;
end.