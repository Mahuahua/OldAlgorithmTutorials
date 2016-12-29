type word=record
      num:longint;
      incl:array['a'..'z']of boolean;
     end;
var s:string;
    n,i,m:longint;
    a:array[1..100]of word;
    u,v:word;
    flag:array['a'..'z']of longint;
    code:array['a'..'z']of string;
    le:char;
procedure swap(var x,y:word);
 var p:word;
 begin
  p:=x;
  x:=y;
  y:=p;
 end;
procedure up(k:longint);
 begin
  while (k<>1)and(a[k div 2].num>a[k].num) do
   begin
    swap(a[k div 2],a[k]);
    k:=k div 2;
   end;
 end;
procedure down(k:longint);
 var mn:longint;
 begin
  while true do
   begin
    if (a[k*2].num=0)and(a[k*2+1].num=0) then exit;
    if (a[k*2+1].num<>0)and(a[k*2].num>a[k*2+1].num) then mn:=k*2+1 else mn:=k*2;
    if a[k].num<=a[mn].num then exit
     else
      begin
       swap(a[mn],a[k]);
       k:=mn;
      end;
   end;
 end;
begin
 readln(s);
 n:=length(s);
 m:=0;
 for i:=1 to n do
  begin
   if flag[s[i]]=0 then
    begin
     inc(m);
     a[m].incl[s[i]]:=true;
     flag[s[i]]:=m;
    end;
   inc(a[flag[s[i]]].num);
  end;
 for i:=1 to m do up(i);
 for i:=m downto 2 do
  begin
   u:=a[1];
   a[1]:=a[i];
   a[i].num:=0;
   down(1);
   v:=a[1];
   a[1].num:=u.num+v.num;
   for le:='a' to 'z' do
    begin
     a[1].incl[le]:=u.incl[le] or v.incl[le];
     if u.incl[le] then code[le]:='0'+code[le];
     if v.incl[le] then code[le]:='1'+code[le];
    end;
   down(1);
  end;
 for le:='a' to 'z' do
  if code[le]<>'' then
   writeln(le,' ',code[le]);
end.