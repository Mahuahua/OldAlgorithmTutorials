var a,b:array[0..100000]of longint;
    n,i:longint;
procedure sort(l,r:longint);
 var i,j,mid,k:longint;
 begin
  for i:=1 to n do write(a[i],' ');
  writeln(l,' ',r);
  if l>=r then exit;
  mid:=(l+r) shr 1;
  sort(l,mid);
  sort(mid+1,r);
  k:=1;
  fillchar(b,sizeof(b),0);
  i:=l;
  j:=mid+1;
  while (i<=mid)or(j<=r) do
   begin
    if (i<=mid)and(j>r) or (a[i]<=a[j]) then
     begin
      b[k]:=a[i];
      inc(i);
     end
    else
     begin
      b[k]:=a[j];
      inc(j);
     end;
    inc(k);
   end;
  for i:=1 to k-1 do
   a[l+i-1]:=b[i];
 end;
begin
 readln(n);
 for i:=1 to n do read(a[i]);
 sort(1,n);
 for i:=1 to n do write(a[i],' ');
end.
