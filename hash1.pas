var a:array[0..124567]of longint;
    b:array[0..124567]of longint;
    n,x,y,i,j,k,m,u:longint;
begin
 readln(n);
 fillchar(a,sizeof(a),0);
 m:=124567;
 for i:=1 to n do
  begin
   readln(x,y);
   k:=x mod m;
   while a[k]<>0 do k:=(k+1) mod m;
   a[k]:=y;
   b[k]:=x;
  end;
 readln(u);
 for i:=1 to u do
  begin
   readln(x);
   k:=x mod m;
   while (b[k]<>x)and(a[k]<>0) do k:=(k+1) mod m;
   writeln(a[k]);
  end;
end.