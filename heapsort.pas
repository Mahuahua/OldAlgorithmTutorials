var a:array[1..100000]of longint;
    i,n,nn:longint;
procedure heap(s,n:longint);
 var min,mn,tmp:longint;
 begin
  mn:=1;
  while mn<>maxlongint do
   begin
    min:=a[s];
    mn:=maxlongint;
    if s*2<=n then
     if a[s*2]<min then
      begin
       min:=a[s*2];
       mn:=s*2;
      end;
    if s*2+1<=n then
     if a[s*2+1]<min then
      begin
       min:=a[s*2+1];
       mn:=s*2+1;
      end;
    if mn<>maxlongint then
     begin
      tmp:=a[s];
      a[s]:=a[mn];
      a[mn]:=tmp;
      s:=mn;
     end;
   end;
 end;
begin
 readln(n);
 nn:=n;
 for i:=1 to n do read(a[i]);
 for i:=n div 2 downto 1 do heap(i,n);
 for i:=n downto 1 do
  begin
   write(a[1],' ');
   a[1]:=a[i];
   dec(n);
   if i>1 then heap(1,n);
  end;
end.
