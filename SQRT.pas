var s,t:string;
    a:array[1..100]of integer;
    i,n,c:integer;
    ss,sy,an:qword;
    ans:string;
begin
 readln(s);
 n:=length(s) div 2;
 if length(s) mod 2=1 then inc(n);
 for i:=n downto 1 do
  begin
   val(copy(s,length(s)-1,2),a[i],c);
   delete(s,length(s)-1,2);
  end;
 ss:=trunc(sqrt(a[1]));
 an:=ss;
 str(an,ans);
 sy:=(a[1]-ss*ss)*100+a[2];
 for i:=2 to n do
  begin
   ss:=0;
   while (20*an+ss)*ss<=sy do inc(ss);
   dec(ss);
   sy:=(sy-(20*an+ss)*ss)*100+a[i+1];
   str(ss,t);
   ans:=ans+t;
   val(ans,an,c);
  end;
 writeln(ans);
end.