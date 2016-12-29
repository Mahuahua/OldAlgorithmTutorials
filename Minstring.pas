var t:ansistring;
function s(a:ansistring):ansistring;
 var i,j,l,k:longint;
 begin
  s:=a;
  l:=length(s);
  s:=s+s;
  i:=1;
  j:=2;
  k:=0;
  while (i<=l)and(j<=l)and(k<l) do
   begin
    k:=0;
    while (k<l)and(s[i+k]=s[j+k]) do inc(k);
    if s[i+k]>s[j+k] then
     begin
      if i+k+1<j then i:=j-1 else inc(i,k+1);
     end;
    if s[i+k]<s[j+k] then
     begin
      if j+k+1<i then j:=i-1 else inc(j,k+1);
     end;
    if i=j then inc(j);
   end;
  if i>j then i:=j;
  s:=copy(s,i,l);
 end;
begin
 readln(t);
 writeln(s(t));
end.