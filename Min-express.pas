var l,i,j,k:longint;
    s1,s2:string;
begin
 readln(s1);
 readln(s2);
 l:=length(s1);
 s1:=s1+s1;
 s2:=s2+s2;
 i:=1;
 j:=1;
 while (i<=l)and(j<=l) do
  begin
   k:=0;
   while (s1[i+k]=s2[j+k])and(k<l) do inc(k);
   if k=l then
    begin
     writeln('YES');
     exit;
    end;
   if s1[i+k]>s2[j+k] then i:=i+k+1 else j:=j+k+1;
  end;
 writeln('NO');
end.